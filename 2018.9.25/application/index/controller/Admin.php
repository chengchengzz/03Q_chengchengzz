<?php
	/**
	 * Created by PhpStorm.
	 * User: admin
	 * Date: 2018/10/26
	 * Time: 8:50
	 */
namespace app\index\controller;

use think\Db;
use think\Controller;
use think\View;
use think\Request;

class Admin extends Controller{
	public function admin(){
		//渲染admin注册页面页面
		$view = new View();
		return  $this->fetch();
	}
	//把数据添加的数据库里
	public function add(){
		$data = input ();
		//memcache_add_server ();
		//$day=$data['login_num']+1;
		$res = Db::table('admin')->insert($data);
		if($res){
			$this->success('注册成功','login');
		}else{
			$this->error('注册失败');
		}
	}
	//渲染login页面
	public function login(){
		$view = new View();
		return $this->fetch('login');
	}
	public function add_do(){
		if(request()->isGet()){
			return $this->fetch();
		}else{
			session_start();
			$data = input();
			$res = Db::table('admin')->where('username',$data['username'])->find();
			if($data['username'] == $res['username'] || $data['username'] == $res['email'] || $data['username'] == $res['tel']){
				if($data['password'] == $res['password']){
					session('id',$res['id']);
					$this->success('登录成功','goods');
				}else{
					$this->error('密码错误','login');
				}
			}else{
				$this->error('用户名错误','login');
			}
		}
	}
	//渲染页面
	public function goods(){
		$view = new View();
		return $this->fetch('goods');
	}
	public function goods_do(){
	$data = input ();
	$res = Db::table('goods')->insert($data);
	if($res){
		$this->success('添加成功','show');
	  }else{
		$this->error('添加失败');
	  }
	}
	//列表展示页面
	public function show(){
	$res = Db::table('goods')->select();
	$this->assign('data',$res);
	return $this->fetch();
	}
	//添加积分
	public function sign_do(){
		$uid = $_GET[ 'id' ];
		$data = DB ::table ('integra') -> where ('id', $uid) -> find ();
		$usernum = $data[ 'usernum' ];
		$day = $data[ 'login_num' ] + 1;
		switch ($day) {
			case ($day <= 5):
				$data[ 'usernum' ] += 3;
				$data[ 'login_num' ] += 1;
				if ($day == 5) {
					$data[ 'usernum' ] += 15;
				}
				break;
			case ($day<= 30):
				$data[ 'usernum' ] += 5;
				$data[ 'login_num' ] += 1;
				if ($day == 10) {
					$data[ 'usernum' ] += 20;
				}
				if ($day == 20) {
					$data[ 'usernum' ] += 50;
				}
				if ($day == 30) {
					$data[ 'usernum' ] += 100;
				}
				break;
			case ($day > 30):
				$data[ 'usernum' ] += 10;
				$data[ 'login_num' ] += 1;
				$num = ($data[ 'login_num' ] - 30) / 15;
				if (is_int ($num)) {
					$data[ 'usernum' ] += 20;
				}
				break;
			default:
				$data[ 'login_num' ] = 0;
				break;
		}
	  }
	public function sign(){
		session_start();
		$uid=isset($_SESSION['id'])?$_SESSION['id']:"";
		if ($uid=="") {
			$this->error('请先登录');
		}
		$this->assign('uid',$uid);
		return $this->fetch();
	  }
	  public function login_do(){
		$data = input ();
		var_dump ($data);
	  }
	}
