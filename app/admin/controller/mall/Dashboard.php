<?php


namespace app\admin\controller\mall;


use app\admin\model\SystemQuick;
use app\admin\traits\Curd;
use app\common\controller\AdminController;
use EasyAdmin\annotation\ControllerAnnotation;
use EasyAdmin\annotation\NodeAnotation;
use think\App;
use think\facade\Db;

/**
 * Class Admin
 * @package app\admin\controller\system
 * @ControllerAnnotation(title="仪表盘")
 */
class Dashboard extends AdminController
{

    use Curd;

    /**
     * 是否关联查询
     * @var bool
     */
    protected $relationSearch = true;



    public function __construct(App $app)
    {
        parent::__construct($app);

    }

    /**
     * @NodeAnotation(title="列表")
     */
    public function index()
    {

        //一段日期内的销售情况 曲线数据
        $start_date = input('get.start_date',date("Y-m-d",strtotime("-30 day")));
        $end_date = input('get.end_date',date("Y-m-d"));
        $days_sale = $this->get_days_sale($start_date, $end_date);
        $this->assign('days_sale',$days_sale);
        $this->assign('start_date',$start_date);
        $this->assign('end_date',$end_date);
        $this->assign('days_sale_json',   json_encode($days_sale));


        $start_date = input('get.start_date',date("Y-m-d",strtotime("-30 day")));
        $end_date = input('get.end_date',date("Y-m-d"));
        $days_sale1 = $this->get_days_sale1($start_date, $end_date);
        $this->assign('days_sale',$days_sale1);
        $this->assign('start_date',$start_date);
        $this->assign('end_date',$end_date);
        $this->assign('days_sale_json1',   json_encode($days_sale1));

        $quicks = SystemQuick::field('id,title,icon,href')
            ->where(['status' => 1])
            ->order('sort', 'desc')
            ->limit(8)
            ->select();
        $this->assign('quicks', $quicks);
        return $this->fetch();
    }


    /**
     * 一段日期内的销售情况  曲线数据
     */
    private function get_days_sale($start_date,$end_date)
    {
        $days = sp_date_list($start_date, $end_date);

        //构造数组
        $dates = array();
        foreach($days as $val) {
            $dates[$val] = array(
                'sub_total_price' =>0,
                'sub_number'=>0,
                'date'=> date('m-d',strtotime($val))
            );
        }

        $where = "1";
        if( !empty($start_date) && !empty($end_date) ) {
            $start_date = strtotime($start_date);
            $end_date = strtotime($end_date . "23:59:59");
            $where .= " and ( create_time >= {$start_date} and create_time < {$end_date} )";
        }


        if(!empty($this->member_id)){
            $where .= " and member_id = {$this->member_id}";
        }

        $sql = "select sum(score) as sub_total_price, count(id) as sub_number, FROM_UNIXTIME(create_time, '%Y-%m-%d' ) as `date` from ea_mall_log where {$where} GROUP BY date";
        $result = Db::query($sql);


        foreach( $result as $val ) {
            $dates[$val['date']] = $val;
            $dates[$val['date']]['date'] = date('m-d',strtotime($val['date']));
        }


        $ret = array();
        foreach( $dates as $val ) {
            $ret['price_str'][] = $val['sub_total_price'];
            $ret['number_str'][] = $val['sub_number'];
            $ret['date_str'][] = $val['date'];
        }


        $max_price = max($ret['price_str']); //最大价格
        $max_number = max($ret['number_str']); //最大单数

        $ret['price_str'] = json_encode($ret['price_str']);
        $ret['number_str'] = json_encode($ret['number_str']);
        $ret['max_price'] = $max_price;
        $ret['max_number'] = $max_number;
        $ret['date_str'] = json_encode($ret['date_str']);

        return $ret;
    }

    private function get_days_sale1($start_date,$end_date)
    {
        $days = sp_date_list($start_date, $end_date);

        //构造数组
        $dates = array();
        foreach($days as $val) {
            $dates[$val] = array(
                'sub_total_price' =>0,
                'sub_number'=>0,
                'date'=> date('m-d',strtotime($val))
            );
        }

        $where = "1";
        if( !empty($start_date) && !empty($end_date) ) {
            $start_date = strtotime($start_date);
            $end_date = strtotime($end_date . "23:59:59");
            $where .= " and ( create_time >= {$start_date} and create_time < {$end_date} )";
        }
        if(!empty($this->member_id)){
            $where .= " and member_id = {$this->member_id}";
        }

        $sql = "select sum(score) as sub_total_price, count(id) as sub_number, FROM_UNIXTIME(create_time, '%Y-%m-%d' ) as `date` from ea_mall_weight where {$where} GROUP BY id";
        $result = Db::query($sql);


        foreach( $result as $val ) {
            $dates[$val['date']] = $val;
            $dates[$val['date']]['date'] = date('m-d',strtotime($val['date']));
        }


        $ret = array();
        foreach( $dates as $val ) {
            $ret['price_str'][] = $val['sub_total_price'];
            $ret['number_str'][] = $val['sub_number'];
            $ret['date_str'][] = $val['date'];
        }


        $max_price = max($ret['price_str']); //最大价格
        $max_number = max($ret['number_str']); //最大单数

        $ret['price_str'] = json_encode($ret['price_str']);
        $ret['number_str'] = json_encode($ret['number_str']);
        $ret['max_price'] = $max_price;
        $ret['max_number'] = $max_number;
        $ret['date_str'] = json_encode($ret['date_str']);

        return $ret;
    }



}