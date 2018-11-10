<?php
namespace app\index\controller;
use app\common\controller\Homebase;
use think\Request;
use think\Db;
use think\Controller;
use think\View;
use think\Request\id;

class  Logn extends Controller{
	
   public function Logn(){
   	$view = new View();
   	return $this->fetch('logn');
   }
   //添加用户数据
   public function add(){
   	if(Request::instance()->isPost()){
   		$map=input('post.');
   		//md5加密
   		//$map['password']=md5($map['password']);
   		//数据库字段
		$data=Db::name('user')->where($map)->find();
		//进行判断用户名或密码是否正确
		if(empty($data)){
			$this->error('账号或密码错误');
		}else{
			$data=[
				'id'=>$data['id'],
			'username'=>$data['username'],
			'password'=>$data['password'],
			];
			session('user',$data);
			$this->success('登录成功,前台管理后台','insert');
		}
	 }else{
   		return $this->fetch();
	 }
   }
   //渲染页面
   public function insert(){
   	$view = new View();
   	return $this->fetch('insert');
   }
   public function add_do(){
    $data = input('post.');
	$file = request()->file('smallimg');
	$path = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
	if($path){
	$data['smallimg'] = $path->getsaveName();
	}
   $result=Db::name('good')->insert($data);
   if($result){
   	  $this->success('添加成功','design');
     }else{
   	$this->success('添加失败');
       }
   }
//   //渲染页面
	public function design(){
		$res = db('good')->select();
		$this->assign('data',$res);
		return $this->fetch();
	}
	public function system(){
		$view = new View();
		return $this->fetch('system');
	}
	//添加数据
	public function list(){
       $data = input('post.');
       unset($data['id']);
       $result = Db::name('auth')->insert($data);
       if($result){
           $this->success('添加成功','username');
       }else{
           $this->error('添加失败');
       }
    }
    //展示页面
    public function username(){
        $res = db('auth')->select();
        $this->assign('data',$res);
        return $this->fetch('username');
    }
}