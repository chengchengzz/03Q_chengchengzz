<?php
    //使用DB类的对象来访问数据库
    //先加载类文件
    //include_once 'DB.class.php';
    //如果想使用其他类，又需要加载（所以使用魔术函数__autoload来实现类的自动加载）
    //显示的写出魔术函数__autoload
    //参数：需要加载的类的名字
    function __autoload($a){
        //将对应的类文件加载进来
        if(is_file("$a.class.php")){
            include_once "$a.class.php";
        }
    }
    //实例化
    $db = new DB(array('dbname' => 'mydatabase'));
