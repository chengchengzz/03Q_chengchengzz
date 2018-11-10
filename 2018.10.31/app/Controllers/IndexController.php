<?php
	/**
	 * Created by PhpStorm.
	 * User: admin
	 * Date: 2018/10/31
	 * Time: 14:54
	 */
	class IndexController extends Controller{
		public function aa(){
			$arr = array("aaaaa","dddddd");
			$this->assign("info","$arr");
			$this->assign("name","chengcheng");
			$filename="index.php";
			$this->display($filename);
		}
	}