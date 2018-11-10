<?php 
namespace app\index\controller;

use think\Controller;
use think\Db;
use think\View;
use think\Session;
use think\cache\driver\Redis;

class Goods extends Controller{

    public function goods(){

      $view = new View();
      
      return $this->fetch('goods');
    }
    //商品展示
    public function show(){
      $res = db('goods')->select();
      $this->assign('data',$res);
      return $this->fetch();
    } 
    //商品添加
   public function add(){
      if(request()->isGet()){
        return $this->fetch();
      }else{
           //获取表单提交的数据
        $data = request()->post();   
        $data['addtime'] = time();  
      //图片上传
      $file = request()->file('img');
      $path = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
      if($path){
          $data['img'] = $path->getsaveName();
      }
      $res = db('goods')->insert($data);
      if($res){
        $this->success('添加成功','show');
      }else{
        $this->error('添加失败','add');
        }
      }
    }
    //注册
    public function register(){
      //判断是否是get提交方式
      if(request()->isGet()){
        return $this->fetch();
      }else{
        session_start();
        //进行注册
        $data = request()->post();
        $res = db('login')->insert($data);
        if($res){
          $this->success('注册成功','login');
        }else{
          $this->success('注册失败','register');
        }
      }
    }
     public function login(){
      //判断是否是get提交方式  
      if (request()->isGet()){
          //输出登录页面
        return $this->fetch();        
      }else{
        session_start();
        //判断登录用户信息
        $data = request()->post();
        $res = db('login')->where('name',$data['name'])->find();
        if ($data['name'] == $res['name'] || $data['name'] == $res['email'] || $data['name'] == $res['tel']){
          if ($data['pwd'] == $res['pwd']){
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
       //退出
    public function login_out(){
      //重新给session赋值
      session('id',0);
      $id =session('id',0);
      if($id == 0){
        $this->redirect('show');
      }
    }
    //加入购物车
    public function cart(){
      $id = session('id');
      //判断是否登录
      if($id == 0){
        $this->error('请先登录','login');
      }else{
        //获取商品的信息
        $goods_id = isset($_GET['id'])?$_GET['id']:'';
        $goods_data = db('goods')->where('goods_id',$goods_id)->find(); 
        //商品库存减一
        $goods_sku = $goods_data['goods_sku']-1;
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
    //购物车列表
    public function cartshow(){
      $res = db('goods_cart')->select();
      $this->assign('cart_data',$res);
      return $this->fetch();
    }
    //购买车商品数量加减
    public function count_add(){
        $cart_count = isset($_POST['count'])?$_POST['count']:'';
        $goods_id = isset($_POST['goods_id'])?$_POST['goods_id']:'';
        $cart_money = isset($_POST['money'])?$_POST['money']:'';
        //判断商品库存
        $goods_data = db('goods')->where('goods_id',$goods_id)->find();
        if($cart_count>$goods_data['goods_sku']){
          return 2;
        }else{
          //小于商品库存进行添加数量
      $res = db('goods_cart')->where('goods_id',$goods_id)->update(['cart_count'=>$cart_count,'cart_money'=>$cart_money]);
        if($res){
          return $this->redirect('cartshow');
          }
        }
    }
    //购物车删除
    public function cart_del(){
     //获取要删除的id
     $cart_id = isset($_GET['id'])?$_GET['id']:'';
     $res = db('goods_cart')->delete($cart_id);
     if($res){
       $this->redirect('cartshow');
       }
    }
    //清空购物车
    public function empty_cart(){
      $res = Db::execute("delete from goods_cart");
      if($res){
        $this->redirect('cartshow');
       }
    }
    //加入订单
    public function order(){
        $data = $_GET;
        $goods_id = $data['goods_id'];
        $cart_id = $data['id'];
        $num = $data['sku'];
        $cart_id = db('goods_cart')->where('goods_id',$data['goods_id'])->find();
        $res = Db::execute("select * from goods_cart where cart_id");
        $res = db('goods_cart')->select();
        $this->assign('data',$res);
        return $this->fetch();
        //订单库存加一
        $sku = $data['sku']+1;
        if($sku == 0){
          $sku = 1;
        }
    }
}
















