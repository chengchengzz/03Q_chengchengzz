<?php
  class Controller{
   public $cName;
   public $aName;
   public function __construct($cName,$aName){
   	  $this->cName = $cName;
   	  $this->aName = $aName;
   }
   //赋值
   public function assign($key,$value){
      $this->_config[$key]=$value;
   }
   //渲染模版
   public function display($filename){
   	print_r ($this->_config);
   	exit;
   	extract($this->_config);
   	 $filename = APP_PATH."Application/Views/{$this->cName}/{$filename}";
   	 require $filePath;
   }
}