<?php
	/**
	 * Created by PhpStorm.
	 * User: admin
	 * Date: 2018/11/7
	 * Time: 18:35
	 */
	print_r ($_POST);
	$username = $_POST['username'];
	$password = $_POST['password'];
	$uid = 1100;
	session_start ();
	
	$arr = array(
		"uid" =>$uid,
		"username" =>$username,
		
	);
	$_COOKIE['uid']=$uid;
	$_COOKIE['username']=$username;
	echo "登录成功{$username}";
	?>
  <a href="order.php">提交</a>
