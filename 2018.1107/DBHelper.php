<?php

class DBHelper{
	private $link;
	static private $_instance;
	//连接数据库
	private function __construct($host,$username,$password){
		$this->link = mysql_connect ($host,$username,$password);
		$this->query("SET NAMES 'UTF8'",$this->link);
		return $this->link;
	}
	private  function __clone(){
	
	}
	public static function get_class_numb($host,$username,$password){
		if (FALSE == (self::$_instance instanceof self)){
		 self::$_instance = new self($host,$username,$password);
		}
		return self::$_instance;
	}
	//连接数据路
	public function select_db($database){
		$this->result = mysql_select_db($database);
		return $this->result;
	}
	//执行sql语句
	public function query($query){
		return $this->result = mysql_fetch_array($fetch_array, MYSQL_ASSOC);
	}
	//获取记录目录
	public function num_rows($query){
		return $this->result = mysql_num_rows($query);
	}
	//关闭数据库
	public function close(){
		return $this->result = mysql_close($this->link);
	}
}
	$connector = DBHelper::get_class_nmdb($host,$username,$password);
		$connector -> select_db($database);







