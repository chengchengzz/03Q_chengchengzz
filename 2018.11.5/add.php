<?php
function __autoload($class){
	require "{$class}.php";
}
	$thiss= new curd();
	$data=$_POST;
	$res=$thiss->adds("title",$data);
	echo $res;

