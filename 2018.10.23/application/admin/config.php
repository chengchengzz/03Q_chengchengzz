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

$admin_config = array(

    //分页配置
    'paginate'      => array(
        'list_rows' => 15,
    ),

    // 默认错误跳转对应的模板文件
    'dispatch_error_tmpl' => 'public:dispatch_jump',
    // 默认成功跳转对应的模板文件
    'dispatch_success_tmpl' => 'public:dispatch_jump',

    // +----------------------------------------------------------------------
    // | 异常及错误设置
    // +----------------------------------------------------------------------

    // 异常页面的模板文件 
    //'exception_tmpl'         => ROOT_PATH.'public/static/errpage/404.html',
    // errorpage 错误页面
    //'error_tmpl'         => ROOT_PATH.'public/static/errpage/404.html',

    /**假设这个访问地址是 www.xxxxx.dev/home/goods/goodsInfo/id/1.html 
     *就保存名字为 home_goods_goodsinfo_1.html     
     *配置成这样, 指定 模块 控制器 方法名 参数名
     */
    'HTML_CACHE_ARR'=> array(),
    
    // 控制器与操作名之间的连接符
    'POWER_OPERATOR' => '@',

    // 数据管理
    'DATA_BACKUP_PATH' => '/data/sqldata', //数据库备份根路径
    'DATA_BACKUP_PART_SIZE' => 52428800, //数据库备份卷大小 50M
    'DATA_BACKUP_COMPRESS' => 0, //数据库备份文件是否启用压缩
    'DATA_BACKUP_COMPRESS_LEVEL' => 9, //数据库备份文件压缩级别

    // 过滤不需要登录的控制器
    'filter_login_controller' => array(
        'Ueditor', // 编辑器上传
        'Uploadify', // 图片上传
    ),

    // 过滤不需要登录的操作
    'filter_login_action' => array(
        'login',
        'logout',
        'vertify',
    ),

    // 无需验证权限的控制器
    'uneed_check_controller' => array(
        'Base', // 基类
        'Index', // 后台首页
        'Ajax', // 所有ajax操作
        'Ueditor', // 编辑器上传
        'Uploadify', // 图片上传
    ),

    // 无需验证权限的操作
    'uneed_check_action' => array(
        'Admin@login',
        'Admin@logout',
        'Admin@vertify',
    ),
);

$html_config = include_once 'html.php';
return array_merge($admin_config, $html_config);
?>