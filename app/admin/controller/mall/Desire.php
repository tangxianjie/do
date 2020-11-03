<?php


namespace app\admin\controller\mall;


use app\admin\model\MallAbc;
use app\admin\model\MallCate;
use app\admin\model\MallDaily;
use app\admin\model\MallDesire;
use app\admin\model\MallLog;
use app\admin\model\SystemAdmin;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="欲望清单管理")
 */
class Desire extends AdminController
{

    use Curd;
    /**
     * 是否关联查询
     * @var bool
     */
    protected $relationSearch = true;

    /**
     * 允许修改的字段
     * @var array
     */
    protected $allowModifyFields = [
        'status',
        'sort',
        'remark',
        'score',
    ];



    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MallDesire();
        $this->assign('member',(new SystemAdmin())->getMemberList($this->member_id));
    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {
        if ($this->request->isAjax()) {
            if (input('selectFields')) {
                return $this->selectList();
            }
            list($page, $limit, $where) = $this->buildTableParames();
            if(!empty($this->member_id)){
                $where[] = ['member.id','=',$this->member_id];
            }
            $count = $this->model
                ->withJoin('member','LEFT')
                ->where($where)
                ->count();
            $list = $this->model
                ->withJoin('member','LEFT')
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select();

            $data = [
                'code'  => 0,
                'msg'   => '',
                'count' => $count,
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

        if($post['field'] == 'status' && $row->status == 0){
            $this->error('已完成不允许修改');
        }

        try {

            if($post['field'] == 'status' && $post['value'] == 0 && $row->score > 0){

                $data['remark'] = '愿望清单';
                $data['score'] = -$row->score;
                $data['desire_id'] = $row->id;
                $data['member_id'] = $row->member_id;
                (new MallLog())->create($data);
                (new SystemAdmin())->where(['id'=>$row->member_id])->dec('score', $row->score)->update();
            }

            $row->save([
                $post['field'] => $post['value'],
            ]);
        } catch (\Exception $e) {
            $this->error($e->getMessage());
        }
        $this->success('保存成功');
    }

}