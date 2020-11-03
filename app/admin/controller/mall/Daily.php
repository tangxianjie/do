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

namespace app\admin\controller\mall;

use app\admin\model\MallAbc;
use app\admin\model\MallCate;
use app\admin\model\MallDaily;
use app\admin\model\MallLog;
use app\admin\model\SystemAdmin;
use app\common\constants\MenuConstant;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use app\common\controller\AdminController;
use think\App;

/**
 * Class Menu
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="日常管理",auth=true)
 */
class Daily extends AdminController
{

    use \app\admin\traits\Curd;

    /**
     * 是否关联查询
     * @var bool
     */
    protected $relationSearch = true;

    protected $sort = [
        'sort' => 'desc',
        'create_time'=>'desc',
        'id'   => 'asc',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MallDaily();
        $this->assign('member',(new SystemAdmin())->getMemberList($this->member_id));
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {

        if ($this->request->isAjax()) {

            //项目分类
            $cateList = (new MallCate())->getCateList();

            //原则分类
            $abcList = (new MallAbc())->getAbcList();

            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            if(!empty($this->member_id)){
                $where[] = ['member.id','=',$this->member_id];
            }

            $day =  input('day');
            if(empty($day)){
                $create_time = $this->model->order(['id'=>'desc'])->max('create_time');
                $excludeFields['day'] = date('Y-m-d',$create_time);
            }

            $username =  input('username');
            if(!empty($username)){
                $where[] = ['member.username', 'LIKE', '%'.$username.'%'];
            }

            $where[] = ['mall_daily.create_time', '>=', strtotime($day.' 00:00:00')];
            $where[] = ['mall_daily.create_time', '<=', strtotime($day.' 23:59:59')];

            $count = $this->model
                ->withJoin('member','LEFT')
                ->where($where)->count();
            $list = $this->model
                ->withJoin('member','LEFT')
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select()->each(function ($item, $key) use($cateList,$abcList) {
                    if(!empty($item['cate_id'])){
                        $item['cate_title'] = $cateList[$item['cate_id']]['title'];
                    }
                    if(!empty($item['abc_id'])){
                        $item['abc_title'] = $abcList[$item['abc_id']]['title'];
                    }

                    if($item['status'] == 1){
                        $item['LAY_CHECKED'] = true;
                    }
                });

            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
                'data'  => $list,
            ];
            return json($data);
        }

        $member = (new SystemAdmin())->getMemberList($this->member_id);
        foreach ($member as $k =>$v){
            $id =  $this->model->where(['pid'=>'99999999','title'=>date('Y-m-d'),'member_id'=>$k])->value('id');
            if(empty($id)) $this->model->create(['pid'=>'99999999','title'=>date('Y-m-d'),'member_id'=>$k]);
        }

        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="添加")
     */
    public function add($id = null)
    {
        $homeId = $this->model
            ->where([
                'pid' => MenuConstant::HOME_PID,
            ])
            ->value('id');
        if ($id == $homeId) {
            $this->error('日期不能添加子项目');
        }
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级项目'   => 'require',
                'title|项目名称' => 'require',
            ];
            $this->validate($post, $rule);
            if($post['abc_id'] > 0) $post['cate_id'] = 0;
            try {
                $save = $this->model->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }

        $pidMenuList = $this->model->getPidMenuList(date('Y-m-d'));
        $this->assign('id', $id);
        $this->assign('pidMenuList', $pidMenuList);

        //项目分类
        $cateList = (new MallCate())->getCateList();
        $this->assign('cateList', $cateList);

        //原则分类
        $abcList = (new MallAbc())->getAbcList();
        $this->assign('abcList', $abcList);

        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="编辑")
     */
    public function edit($id)
    {
        $row = $this->model->find($id);
        empty($row) && $this->error('数据不存在');
        if ($this->request->isAjax()) {
            $post = $this->request->post();
            $rule = [
                'pid|上级项目'   => 'require',
                'title|项目名称' => 'require',
            ];
            $this->validate($post, $rule);
            if($post['abc_id'] > 0) $post['cate_id'] = 0;

            if($row->pid ==  MenuConstant::HOME_PID){
                $post['pid'] = MenuConstant::HOME_PID;
            }

            try {
                $save = $row->where(['id'=>$id])->save($post);
            } catch (\Exception $e) {
                $this->error('保存失败');
            }
            if ($save) {
                
                $this->success('保存成功');
            } else {
                $this->error('保存失败');
            }
        }
        $pidMenuList = $this->model->getPidMenuList($row['create_time']);
        $this->assign([
            'id'          => $id,
            'pidMenuList' => $pidMenuList,
            'row'         => $row,
        ]);

        //项目分类
        $cateList = (new MallCate())->getCateList();
        $this->assign('cateList', $cateList);

        //原则分类
        $abcList = (new MallAbc())->getAbcList();
        $this->assign('abcList', $abcList);

        return $this->fetch();
    }


    /**
     * @NodeAnotation(title="完成项目")
     */
    public function done($id)
    {
        $row = $this->model->whereIn('mall_daily.id', $id)->withJoin(['cate','abc','member'],'LEFT')->select();
        $row->isEmpty() && $this->error('数据不存在');
        $row = $row->toArray();
        try {
            $save =$this->model->whereIn('id', $id)->update(['status'=>1]);

            foreach ($row as $k =>$v){
                if($v['status'] == 0  && !empty($v['score']) ){

                    if($v['abc_id'] > 0){
                        $data['remark'] = $v['abc']['title'];
                    }

                    if($v['cate_id'] > 0){
                        $data['remark'] = $v['cate']['title'];
                        (new MallCate())->where(['id'=>$v['cate']['id']])->save([
                            'left'=>$v['cate']['left'] - $v['score'],
                        ]);
                    }

                    $data['score'] = $v['score'];
                    $data['member_id'] = $v['member_id'];
                    $data['score_id'] = $v['id'];
                    (new MallLog())->create($data);

                    (new SystemAdmin())->where(['id'=>$v['member_id']])->save([
                        'score'=>$v['member']['score'] + $v['score']
                    ]);
                }
            }


        } catch (\Exception $e) {
            halt($e->getMessage());
            $this->error('操作失败');
        }
        $save ? $this->success('恭喜！恭喜！') : $this->error('操作失败');
    }

}