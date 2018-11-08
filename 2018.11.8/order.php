<?php
	/**
	 * Created by PhpStorm.
	 * User: admin
	 * Date: 2018/11/7
	 * Time: 18:37
	 */
	session_start();
	$arr = isset($_SESSION['info']) ? $_SESSION['info'] : array();
	if(empty($arr)){
		echo "登录失败";
	}else{
		var_dump ($arr);
	}