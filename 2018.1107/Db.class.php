<?php 
header("content-type:text/html;charset=utf-8");
class Db{
	//添加数据
	  public function adds($table,$data){
	  	 $title = $data = ['title'];
	  	 $fenlei = $data = ['fenlei'];
	  	 $content = $data = ['content'];
	  	 $dsn = "myslq:host=127.0.0.1;dbname=2018.11.5";
	  	 $db = new PDO($dsn,"root","root");
	  	 $res=$db->exec("insert into $table (title,fenlei,content) values ('$title','$fenlei','$content')");
	  	 return $res;
	  }
	  //展示页面
	  public function show($table){
	  	$dsn = "mysql:host=127.0.0.1;dbname=2018.11.5";
	  	$db = new \PDO($dsn,'root','root');
	  	$res = $db->query("select * from $table");
	  	$data  = $res->fetchAll(PDO::FETCH_ASSOC);
	  	return $data;
	  }
	  //删除数据
	  public function del($table,$id){
         $dsn = "mysql:host=127.0.0.1;dbname=2018.11.5";
         $db = new PDO($dsn,"root","root");
         $res = $db->exec("delete from $table where id='$id'");
         return $res;
	  }
	  public function finds($table,$id){
	  	$dsn = "mysql:host=127.0.0.1;dbname=2018.11.5";
	  	$db = new PDO($dsn,'root','root');
	  	$res = $db->query("select * from $table where id='$id'");
	  	return $data;
	  }
	  public function update($table,$data,$id){
		$dsn="mysql:host=127.0.0.1;dbname=text";
		$db=new PDO($dsn,'root','root');
		$name=$data['name'];
		$fen=$data['fen'];
		$commit=$data['commit'];
		$res=$db->exec("updata $table set name='$name'&&fen='$fen'&&commit='$commit'  where id='$id'");
		return $res;
	}
}




