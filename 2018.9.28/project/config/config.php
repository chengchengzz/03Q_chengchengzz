<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/9/28
 * Time: 11:16
 */
// 数据库配置
$config['db']['host'] = '127.0.0.1';
$config['db']['username'] = 'root';
$config['db']['password'] = 'root';
$config['db']['dbname'] = 'project';

// 默认控制器和操作名
$config['defaultController'] = 'Item';
$config['defaultAction'] = 'index';
$config['defaultAction'] = 'goods';
return $config;