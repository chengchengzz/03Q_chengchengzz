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

namespace think\template\taglib\eyou;


/**
 * 网站应用插件标签
 */
class TagWeapp extends Base
{
    public $weappidArr = array();
    
    //初始化
    protected function _initialize()
    {
        parent::_initialize();
        $this->weappidArr = array();
    }

    /**
     * 页面上展示网站应用插件
     * @author wengxianhu by 2018-4-20
     */
    public function getWeapp($type = 'default')
    {
        $parseStr = '';

        return $parseStr;
    }
}