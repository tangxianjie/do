<?php


namespace app\admin\controller\mall;


use app\admin\model\MallCate;
use app\admin\model\SystemAdmin;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="体重管理")
 */
class Weight extends AdminController
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
        'remark',
        'score',
    ];



    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MallCate();

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



}