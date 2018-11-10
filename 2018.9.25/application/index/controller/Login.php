<?php
namespace app\index\controller;

use Phinx\Db\Table;
use think\Controller;
use think\Db;
use think\View;
use think\Request;


class Login extends Controller{

   public function login(){
       $view = new View();
       return $this->fetch('login');
   }
   public function add_do(){
       $data = input();
       if(request()->isGet()){
           return $this->fetch();
       }else{
           session_start();
           //var_dump($data);
           $res = Db::table('user')->insert($data);
           if($res){
               $this->success('注册成功','regiest');
           }else{
               $this->success('注册失败','login');
           }
       }
   }
   //渲染页面
   public function regiest(){
       $view = new View();
       return $this->fetch();
   }
   public function add(){
       if(request()->isGet()){
           return $this->fetch();
       }else{
           session_start();
           $data = input();
           $res = Db::table('user')->where('username',$data['username'])->find();
           if($data['username'] == $res['username'] || $data['username'] == $res['email'] || $data['username'] == $res['tel']){
               if($data['password'] == $res['password']){
                   session('id',$res['id']);
                   $this->success('登录成功','goods');
               }else{
                   $this->error('密码错误','regiest');
               }
           }else{
               $this->error('用户名错误','regiest');
           }
       }
   }
   //渲染页面
   public function goods(){
       $view = new View();
       return $this->fetch('goods');
   }
   //添加数据
   public function goods_do(){
       $data = input();
       $file = request()->file('goods_img');
       $path = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
       if($path){
           $data['goods_img'] = $path->getsaveName();
       }
       $res = Db::table('goods')->insert($data);
       if($res){
           $this->success('添加成功','show');
       }else{
           $this->success('添加失败','goods');
       }
   }
   //展示页面
   public function show(){
       $res = Db::table('goods')->select();
       $this->assign('data',$res);
       return $this->fetch();
   }
    public function cart(){
        $id = session('id');
        //判断是否登录
        if($id == 0){
            $this->error('请先登录','login');
        }else{
            //获取商品的信息
            $goods_id = isset($_GET['id'])?$_GET['id']:'';
            $goods_data = db('goods')->where('id',$goods_id)->find();
            //var_dump($goods_data);die;
            //商品库存减一
            $goods_number = $goods_data['goods_number']-1;
            if($goods_sku == 0){
                $goods_sku = 1;
            }
            $g_res = db('goods')->where('goods_id',$goods_id)->update(['goods_sku'=>$goods_sku]);
            //重新赋值
            $cart_data['goods_id'] = $goods_id;
            $cart_data['u_id'] = $id;
            $cart_data['goods_name'] = $goods_data['goods_name'];
            $cart_data['goods_content'] = $goods_data['goods_content'];
            $cart_data['goods_sprice'] = $goods_data['goods_sprice'];
            $cart_data['img'] = $goods_data['img'];
            //查询购物车表中的是否存在这条数据
            $cart_res = db('goods_cart')->where('goods_id',$goods_id)->find();
            //判断数据是否相等
            if($cart_data['goods_id'] == $cart_res['goods_id'] && $cart_data['goods_name'] == $cart_res['goods_name'] && $cart_data['goods_content'] == $cart_res['goods_content']){
                //如果数据相等购买数量加一
                $cart_count = $cart_res['cart_count']+1;
                $res = db('goods_cart')->where('cart_id',$cart_res['cart_id'])->update(['cart_count'=>$cart_count]);
                if($res){
                    $this->redirect('cartshow');
                }
            }else{
                //不相等
                $cart_data['cart_count'] = 1;
                $res = db('goods_cart')->insert($cart_data);
                if($res){
                    $this->redirect('cartshow');
                }
            }
        }
    }
}