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

$module_name = request()->module();

return array(
    'template' => array(
        // 模板路径
        'view_path' => './application/'.$module_name.'/template/',
        // 模板后缀
        'view_suffix' => 'htm',
    ),
    'view_replace_str' => array(
        '__PUBLIC__' => '/public',
        '__ROOT__' => '',
        '__STATIC__' => '/public/static',
        '__SKIN__' => '/public/static/'.$module_name,
    ),
);
?>