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

namespace app\admin\model;

use app\common\constants\MenuConstant;
use app\common\model\TimeModel;

class MallLog extends TimeModel
{
    public function daily()
    {
        return $this->belongsTo('app\admin\model\MallDaily', 'daily_id', 'id');
    }

    public function member()
    {
        return $this->belongsTo('app\admin\model\SystemAdmin', 'member_id', 'id');
    }

    public function desire()
    {
        return $this->belongsTo('app\admin\model\MallDesire', 'desire_id', 'id');
    }

    public function cate()
    {
        return $this->belongsTo('app\admin\model\MallCate', 'cate_id', 'id');
    }

    public function score1()
    {
        return $this->belongsTo('app\admin\model\MallCateScore', 'score_id', 'id');
    }
    public function abc()
    {
        return $this->belongsTo('app\admin\model\MallAbc', 'abc_id', 'id');
    }

}