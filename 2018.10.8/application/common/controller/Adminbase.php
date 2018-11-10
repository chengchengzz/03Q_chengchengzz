<?php
	/**
	 * Created by PhpStorm.
	 * User: admin
	 * Date: 2018/10/17
	 * Time: 10:24
	 */
	namespace app\common\controller;
	use app\common\controller\Base;
	use think\Request;
	
	//admin选择器
class AdminBase extends Base{
	//初始化方法
	public function _initialize(){
		
		parent::_initialize();
		$auth=new \tink\Auth();
		$request = Request::instance();
		$m=$request->module();
		$c=$request->controller();
		$a=$request->action();
		$rule_name=$m.'/'.$c.'/'.$a;
		$request=$auth->check($rule_name,session('user')['id']);
		if(!$result){
			$this->error('你没有权限访问');
		}
	}
}