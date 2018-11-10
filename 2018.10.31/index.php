<?php
//入口文件mvc
 define ('APP_PATH',__DIR__.'/');
 //开启调试模式
 define ('APP_DEBUG',true);
 //配置文件链接数据库的配置
 require'./config/config.php';
 //加载框架入口文件
 require'./fastphp/fastphp.php';
 //启动框架
 $fastobj = new Fastphp($arr);
 $fastobj->run();
 $obj = new Controller();
 $obj->go();
// $a=10;
// $b=$a;
// $a=100;
// echo $b;
// function aa(&$a){
// 	//GLOBAL $a;
// 	$a=100;
// }
// aa($a);
// echo $a;
// $b=100;
// function a(&$b){
// 	GLOBAL $b;
// 	$b=20;
// }

// $b=30;

// $aa=10;

// a($aa);
// echo $aa;
// echo $b;
//$a=40;
//$b=90;
//function test(&$b){
//	global $b;
//	global $a;
//	$a=91;
//	$b=$a;
//	$a=&$b;
//}
//$a=&$b=&$c;
// test($a);
// echo $a;
// echo $b;