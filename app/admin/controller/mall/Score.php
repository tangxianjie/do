<?php


namespace app\admin\controller\mall;


use app\admin\model\MallCate;
use app\admin\model\MallCateScore;
use app\admin\model\SystemAdmin;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="积分管理")
 */
class Score extends AdminController
{

    use Curd;

    /**
     * 允许修改的字段
     * @var array
     */
    protected $allowModifyFields = [
        'score',
        'consume',
        'remark',
    ];

    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MallCateScore();
    }


    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            $where = [];
            if(!empty($this->member_id)){
                $where[] = ['id','=',$this->member_id];
            }
            $where[] = ['auth_ids','like','%7%'];
            $list1 = (new SystemAdmin())
                ->where($where)
                ->field('id,username')
                ->page(1, 10000)
                ->select();

            $list2 = config('cate');
            $list = [];
            foreach ($list1 as $k => $v){
                foreach ($list2 as $k1 => $v1){
                    $list[$k1.'00'.$k]['id'] = $k1.'00'.$k;
                    $list[$k1.'00'.$k]['member_id'] = $v['id'];
                    $list[$k1.'00'.$k]['cate_id'] = $k1;

                    $MallCateScore = $this->model->where( $list[$k1.'00'.$k])->find();
                    if(empty($MallCateScore)){
                        $MallCateScore =  $this->model->create($list[$k1.'00'.$k]);
                    }
                    $list[$k1.'00'.$k] = array_merge($MallCateScore->toArray(),$list[$k1.'00'.$k]);
                    $list[$k1.'00'.$k]['username'] = $v['username'];
                    $list[$k1.'00'.$k]['title'] = $v1;
                }
            }

            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => count($list),
                'data'  => $list,
            ];
            return json($data);
        }
        return $this->fetch();
    }

    /**
     * @NodeAnotation(title="属性修改")
     */
    public function modify()
    {
        $post = $this->request->post();
        $rule = [
            'id|ID'    => 'require',
            'field|字段' => 'require',
            'value|值'  => 'require',
        ];
        $this->validate($post, $rule);
        $row = $this->model->find($post['id']);
        if (!$row) {
            $this->error('数据不存在');
        }
        if (!in_array($post['field'], $this->allowModifyFields)) {
            $this->error('该字段不允许修改：' . $post['field']);
        }
        try {
            $row->save([
                $post['field'] => $post['value'],
            ]);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('保存成功');
    }


}