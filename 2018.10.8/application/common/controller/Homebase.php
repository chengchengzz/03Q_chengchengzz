<?php
namespace app\common\controller;

use app\common\controller\Base;
use function GuzzleHttp\Psr7\parse_header;

//home积累控制器
class Homebase extends Base{
	
	//初始化方法
	public function _iniitalize(){
		parent::_initialize();
	}
}