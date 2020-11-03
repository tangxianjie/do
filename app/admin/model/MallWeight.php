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

class MallWeight extends TimeModel
{


    public function member()
    {
        return $this->belongsTo('app\admin\model\SystemAdmin', 'member_id', 'id');
    }

}