<?php
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\View;
use phpmailer\phpmailer;
use think\Request;

class Login extends Controller{

    public function login(){
        $view = new View();
        return $this->fetch('Login');
    }
    //添加数据
    public function add(){
        //进行验证
        if(request()->isPost()){
            $data = input();
            //正则验证用户名
            if(preg_match('/^[a-zA-Z][a-zA-Z0-9]{3,15}$/',$data['username'])){
                //正则验证邮箱
                if(preg_match('^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*\.[a-zA-Z0-9]{2,6}$^',$data['email'])){
                    //正则验证密码
                    if(preg_match('/^[a-zA-Z0-9]{4,10}$/',$data['password'])){
                    	//$data['password'] = md5('password');
                        $res = Db::table('user')->insert($data);
                        if($res){
                            $this->success('注册成功','sign');
                        }else{
                            $this->success('注册失败','login');
                        }
                    }
                }
            }
        }
        return $this->fetch('sign');
    }
    //渲染页面
    public function sign(){
        $view = new View();
        return $this->fetch('sign');
    }
    //登录页面添加数据
    public function add_do(){
        if(request()->isGet()){
            return $this->fetch();
        }else{
            session_start();
            $data = input();
            $res = Db::table('user')->where('username',$data['username'])->where('password',$data['password'])->find();
            if($data['username'] == $res['username'] || $data['username'] == $res['email'] || $data['username'] == $res['tel']){
              if($data['password'] == $res['password']){
                  session('user_id',$res['user_id']);
                  $this->success('登录成功','index');
              }else{
                  $this->error('密码错误','sign');
              }
            }else{
                $this->error('用户密码错误','sign');
            }
        }
    }
	//渲染页面
	public function index(){
    	$view = new View();
    	return $this->fetch('index');
	}
	//渲染页面
	public function shoppingmall(){
    	$view = new View();
    	return $this->fetch('shoppingmall');
	}
	//渲染商品添加页面
	public function cartch(){
    	$view = new View();
    	return $this->fetch('cartch');
	}
	//添加商品数据
	public function good(){
    	$data = input();
    	//文件上传
		$file = request()->file('goods_img');
		$path = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		if($path){
			$data['goods_img'] = $path->getsaveName();
		}
		$res = db('goods')->insert($data);
    	if($res){
    		$this->success('添加成功','goods');
		}else{
    		$this->success('添加失败','cartch');
		}
	}
	//商品展示
	public function goods(){
		$res = db('goods')->select();
		$this->assign('data',$res);
		return $this->fetch();
	}
	//商品删除
	public function del(){
    	$Request = Request::instance();
    	$goods_id =$Request->get('goods_id');
		$res = Db::table('goods')->where('goods_id',$goods_id)->delete();
		if($res){
			$this->success('删除成功','goods');
		}else{
			$this->success('删除失败','goods');
		}
	}
	//验证邮箱
	public function email(){
    	//收件人的邮箱
		$toemail = '2609120588@qq.com';
		//收件人的名称
		$name = '程旭东';
		$subject = 'QQ邮箱发送测试';
		$code = mt_rand(10000,99999);
		session ('code',$code);
		$content = '你的验证码为'.$code;
		dump(send_mail($toemail,$name,$subject,$content));
		
	}
}







