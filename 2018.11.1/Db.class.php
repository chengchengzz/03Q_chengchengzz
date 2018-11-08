<?php
	
	header('content-type:text/html;charset=utf-8');
	class Db{
	function __construct(){
		mysql_connect('127.0.0.1','root','root');
		mysql_select_db('day3');
	}
	function add($setout,$tination,$ticket){
		$sql = "insert into out (null,'$setout','$tination','$ticket')";
		$res = mysql_query($sql);
		return $res;
	}
	function del($id){
		$sql = "delete from out where id='$id'";
		$res = mysql_query($sql);
		return $res;
	}
	function select(){
		$sql = "select * from out";
		$res=mysql_query($sql);
		$list = array();
		while($arr=mysql_fetch_array($res))
		{
			$list[]= $arr;
		}
		return $list;
     }
     function update($id,$zhi){
     	$sql = "update out set bei = '$zhi' where id= '$id'";
     	$res = mysql_query($sql);
     	return $res;
     }
 } 



