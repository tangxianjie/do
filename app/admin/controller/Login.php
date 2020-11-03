<?php

// +----------------------------------------------------------------------
// | EasyAdmin
// +----------------------------------------------------------------------
// | PHP交流群: 763822524
// +----------------------------------------------------------------------
// | 开源协议  https://mit-license.org 
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zhongshaofa/EasyAdmin
// +----------------------------------------------------------------------

namespace app\admin\controller;


use app\admin\model\MallAbc;
use app\admin\model\MallCate;
use app\admin\model\MallCateScore;
use app\admin\model\MallLog;
use app\admin\model\MallWeight;
use app\admin\model\SystemAdmin;
use app\common\controller\AdminController;
use think\captcha\facade\Captcha;
use think\facade\Env;

/**
 * Class Login
 * @package app\admin\controller
 */
class Login extends AdminController
{

    /**
     * 初始化方法
     */
    public function initialize()
    {
        parent::initialize();
        $action = $this->request->action();
        if (!empty(session('admin')) && !in_array($action, ['out'])) {
            $adminModuleName = config('app.admin_alias_name');
            $this->success('已登录，无需再次登录', [], __url("@{$adminModuleName}"));
        }
    }

    /**
     * 用户登录
     * @return string
     * @throws \Exception
     */
    public function index()
    {
        $captcha = Env::get('easyadmin.captcha', 1);
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $rule = [
                'username|用户名'      => 'require',
                'password|密码'       => 'require',
                'keep_login|是否保持登录' => 'require',
            ];
            $captcha == 1 && $rule['captcha|验证码'] = 'require|captcha';
            $this->validate($post, $rule);
            $admin = SystemAdmin::where(['username' => $post['username']])->find();
            if (empty($admin)) {
                $this->error('用户不存在');
            }
            if (password($post['password']) != $admin->password) {
                $this->error('密码输入有误');
            }
            if ($admin->status == 0) {
                $this->error('账号已被禁用');
            }
            $admin->login_num += 1;
            $admin->save();
            $admin = $admin->toArray();
            unset($admin['password']);
            $admin['expire_time'] = $post['keep_login'] == 1 ? true : time() + 7200;
            session('admin', $admin);
            $this->success('登录成功');
        }
        $this->assign('captcha', $captcha);
        return $this->fetch();
    }

    /**
     * 用户退出
     * @return mixed
     */
    public function out()
    {
        session('admin', null);
        $this->success('退出登录成功');
    }

    /**
     * 验证码
     * @return \think\Response
     */
    public function captcha()
    {
        return Captcha::create();
    }


    public function auto()
    {

        $Abc = new MallAbc();
        $MallAbc =  $Abc->where(['status'=>1])->column('id,score,continuous,member_id','id');


        $Log =  new MallLog();
        $where1[] = ['mall_log.create_time', '>=', strtotime(date("Y-m-d",strtotime("-1 day")).' 00:00:00')];
        $where1[] = ['mall_log.create_time', '<=', strtotime(date("Y-m-d",strtotime("-1 day")).' 23:59:59')];
        $MallLog =  $Log->where($where1)
            ->withJoin(['member','daily'],'LEFT')
            ->select()->toArray();



        //坚持住原则奖励积分
        $abc = [];
        foreach ($MallLog as $k => $v){
            if($v['daily_id'] >= 0 && $v['daily']['abc_id'] > 0){
                $abc[$k]['abc_id'] = $v['daily']['abc_id'];
                $abc[$k]['member_id'] = $v['member_id'];
            }
        }

        $data = [];

        $SystemAdmin = new SystemAdmin();
        foreach ($MallAbc as $k =>$v){
            foreach ($abc as $k1 =>$v1){
                if($v['id'] == $v1['abc_id']  &&  $v['member_id'] == $v1['member_id']){
                    $MallAbc[$k]['continuous'] = 0;
                }else{
                    $MallAbc[$k]['continuous'] = $MallAbc[$k]['continuous']+1;

                    $data['MallAbc'.$k]['remark'] = '原则奖励';
                    $data['MallAbc'.$k]['score'] = $v['score'];
                    $data['MallAbc'.$k]['abc_id'] = $v['id'];
                    $data['MallAbc'.$k]['member_id'] = $v['member_id'];

                    if($Log->where($data['MallAbc'.$k])->where([['create_time','>=', strtotime(date('Y-m-d'.' 00:00:00'))]])->find()){
                        unset($data['MallAbc'.$k]);
                    }else{
                        $SystemAdmin->where(['id'=>$v1['member_id']])->inc('score', $v['score'])->update();
                        $data['MallAbc'.$k]['create_time'] = time();
                    }
                }

            }
        }
        $Abc->saveAll($MallAbc);

        //积分等级消耗积分
        $member = $SystemAdmin->where([['auth_ids','like','%7%']])
            ->where('status', 1)
            ->column('id,score,score_id', 'id');

        $MallCateScore = (new  MallCateScore())->column('member_id,consume,id','id');
        foreach ($member as $k =>$v){
            if($v['score_id'] > 0){
                foreach ($MallCateScore as $k1 =>$v1){
                    if($v['id'] == $v1['id']  &&  $v['member_id'] == $v1['member_id']){


                        $data['member'.$k]['remark'] = '等级消耗';
                        $data['member'.$k]['score'] = -$v1['consume'];
                        $data['member'.$k]['score_id'] = $v1['id'];
                        $data['member'.$k]['member_id'] = $v['id'];

                        if($Log->where($data['member'.$k])->where([['create_time','>=', strtotime(date('Y-m-d'.' 00:00:00'))]])->find()){
                            unset($data['member'.$k]);
                        }else{
                            $SystemAdmin->where(['id'=>$v['id']])->dec('score', $v1['consume'])->update();
                            $data['member'.$k]['create_time'] = time();
                        }
                    }
                }
            }
        }

        //项目过期

        $MallCate =  ( new MallCate())->where(['status'=>1])->column('id,member_id,dec,end_time,title','id');
        foreach ($MallCate as $k =>$v){
            $end_time = strtotime($v['end_time'].' 23:59：59');
            if($end_time < time()){
                $data['MallCate'.$k]['remark'] = '项目过期';
                $data['MallCate'.$k]['score'] = -$v['dec'];
                $data['MallCate'.$k]['cate_id'] = $v['id'];
                $data['MallCate'.$k]['member_id'] = $v['member_id'];
                if($Log->where($data['MallCate'.$k])->where([['create_time','>=', strtotime(date('Y-m-d'.' 00:00:00'))]])->find()){
                    unset($data['MallCate'.$k]);
                }else{
                    $SystemAdmin->where(['id'=>$v['member_id']])->dec('score', $v['dec'])->update();
                    $data['MallCate'.$k]['create_time'] = time();
                }

            }
        }

        $Log->insertAll($data);

        return '成功';
    }

}
