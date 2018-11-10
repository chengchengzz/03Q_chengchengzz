<?php
	namespace app\index\controller;
	
	use app\model\User;
	
	use think\Db;
	use think\Request;
	use think\View;
	use think\Controller;
	use think\paginate;
	
	//渲染页面
	class Goods extends Controller{
		public function goods(){
			$view = new View();
			return $this->fetch("goods");
		}
		public function add(){
		$data = input();
		$file=request()->file('goods_img');
		$path = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
		if($path){
			$data['goods_img']=$path->getsaveName();
		  }
		  $res = Db::table('goods')->insert($data);
		if($res){
			$this->success('添加成功','list');
		}else{
			$this->success('添加失败','goods');
		  }
		}
		//展示页面
		public function list(){
			$data = db::table('goods')->paginate(3);
			$page = $data->render();
			$this->assign('data',$data);
			$this->assign('page',$page);
			if(request()->isAjax()){
			return $this->fetch('ajax');
			}
			return $this->fetch();
		}
		//删除数据
		public function delete(){
			$request = Request::instance();
			$id = $request->get('id');
			$res = Db::table("goods")->where('id='.$id)->delete();
			if($res){
				$this->success('删除成功','list');
			}else{
				$this->error('删除失败','list');
			}
		}
		//修改数据
		public function update(){
			$request = Request::instance();
			$id = $request->get('id');
			$upl = Db::table("goods")->where('id='.$id)->find();
			return view('update',['upl'=>$upl]);
		}
		public function update_do(){
			$id = $_POST['id'];
			$request = Request::instance();
			$data = $request->post();
			$upl = Db::table('goods')->where('id='.$id)->update ($data);
			if($upl){
				$this->success('修改成功','list');
			}else{
				$this->error('修改失败','update');
			}
		}
	}