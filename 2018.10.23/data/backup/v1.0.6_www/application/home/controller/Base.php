<?php
/**
 * 易优CMS
 * ============================================================================
 * 版权所有 2016-2028 海南赞赞网络科技有限公司，并保留所有权利。
 * 网站地址: http://www.eyoucms.com
 * ----------------------------------------------------------------------------
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 * Author: 小虎哥 <1105415366@qq.com>
 * Date: 2018-4-3
 */

namespace app\home\controller;
use think\Controller;
use app\common\controller\Common;
use think\Db;
use think\Request;

class Base extends Common {

    /*
     * 初始化操作
     */
    public function _initialize() {
        parent::_initialize();

        // 设置URL模式
        set_home_url_mode();
    }
}