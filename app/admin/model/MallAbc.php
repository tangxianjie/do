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

class MallAbc extends TimeModel
{


    public function member()
    {
        return $this->belongsTo('app\admin\model\SystemAdmin', 'member_id', 'id');
    }

    public function getAbcList()
    {
        $list  = $this
            ->where(['status'=>1])
            ->column('id,title,dec','id');
        $list[0] = [
            'id'    => 0,
            'title' => '选择',
            'dec' => 0,
        ];

        return $list;
    }

}