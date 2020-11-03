<?php


namespace app\admin\controller\mall;


use app\admin\model\MallAbc;
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
 * @ControllerAnnotation(title="积分流水管理")
 */
class Log extends AdminController
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
        'continuous',
    ];



    public function __construct(App $app)
    {
        parent::__construct($app);
        $this->model = new MallLog();
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
                ->withJoin(['member','daily','desire','score1','cate','abc'],'LEFT')
                ->where($where)
                ->count();
            $list = $this->model
                ->withJoin(['member','daily','desire','score1','cate','abc'],'LEFT')
                ->where($where)
                ->page($page, $limit)
                ->order($this->sort)
                ->select()->each(function ($item, $key) {

                    $item['title'] = '';
                   if(!empty($item['daily']['title']))  $item['title'] = $item['daily']['title'];
                    if(!empty($item['desire']['title']))  $item['title'] = $item['desire']['title'];
                    if(!empty($item['score1']['title']))  $item['title'] = $item['score1']['title'];

                    if(!empty($item['cate']['title']))  $item['title'] = $item['cate']['title'];
                    if(!empty($item['abc']['title']))  $item['title'] = $item['abc']['title'];
                });

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