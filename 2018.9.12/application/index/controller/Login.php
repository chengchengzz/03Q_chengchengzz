<?php 
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\View;
use think\Session;
use think\Regist;
class Login extends Controller{
       public function regist(){
        $view = new View();
        return $this->fetch();
     }
	//渲染页面
	// public function login(){
	// 	$view = new View();
	// 	return $this->fetch('login');
 //     }
     //添加数据
     // public function add(){
     //    if(request()->isGET()){
     // 	return $this->fetch();
     // }else{
     // 	session_start();
     // 	//进行注册
     // 	$data = request()->post();
     // 	$res = db('login')->insert($data);
     // 	if($res){
     //        $this->success('注册成功','orders');
     // 	  }else{
     // 	  	$this->success('注册失败','login');
     // 	   }
     //    }

     // }
     // public function orders(){
     // 	$view = new View();
     // 	 return $this->fetch('orders');
     // }
   
  }








?>