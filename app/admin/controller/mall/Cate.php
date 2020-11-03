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
 * @ControllerAnnotation(title="项目管理")
 */
class Cate extends AdminController
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
        'dec',
        'left',
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