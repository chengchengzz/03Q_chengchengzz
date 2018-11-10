<?php
class Fastphp{
	public function __construct($arr){
		
	}
    public function run(){
     //自动调用
	spl_autoload_register(array($this,"loadClass"));
    $arrController = $this->route();
    $realController = $strController = ucfirst($arrController['c']);
    $strController = $strController . "Controller";
    $strActionName = $arrController['a'];
    $obj = new $strController($realController,$strActionName);
    $obj->$strActionName();
	}
	public function route(){
		$url = $_SERVER['REQUEST_URI'];
		$url = trim($url,"/");
		$arrInfo = explode("?",$url);
		$handleStr = $arrInfo[1];
		$arrHandle = explode("&",$handleStr);
		$arr = array();
		$arrController = array();
		foreach ($arrHandle as $key => $value) {
			$tmp = explode("=",$value);
			$arr[$tmp[0]=$tmp[1]];
		}
		$arrController['c']=$arr['c'];
		$arrController['a']=$arr['a'];

		return $arrController;
	}
	//自动加载机制
	public function loadClass($class){
			require APP_PATH."fastphp/{$class}.php";
			$freamework = APP_PATH."fastphp/{$class}.php";
			$Controller_path = APP_PATH."Application/Controller/{$class}.php";
			if(file_exists($freamework)){
                require $freamework;
			}
			if(file_exists($Controller_path)){
				require $Controller_path;
			}
		}
	}