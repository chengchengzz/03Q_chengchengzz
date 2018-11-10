<?php 
header('content-type:text/html;charset=utf-8');
class curd{
	public function adds($table,$data){
		$title=$data['title'];
		$fenlei=$data['fenlei'];
		$content=$data['content'];
		$dsn="mysql:host=127.0.0.1;dbname=2018.11.5";
		$db=new PDO($dsn,'root','root');
	$res=$db->exec("insert into $table(title,fenlei,content) values('$title','$fenlei','$content')");
		if ($res) {
			return "<script>alert('添加成功');location.href='show.html'</script>";
		}else{
			return "<script>alert('添加失败');location.href='index.html'</script>";
		}
	}
	public function show($table){
		$dsn="mysql:host=127.0.0.1;dbname=2018.11.5";
		$db=new PDO($dsn,'root','root');
		$res=$db->query("select * from $table");
		$data=$res->fetchAll(PDO::FETCH_ASSOC);
		return $data;

	}
		public function content($id,$table){
		   header("content-type:text/html;charset=utf8");
			$dsn="mysql:host=127.0.0.1;dbname=2018.11.5";
			$db=new PDO($dsn,'root','root');
			$res=$db->query("select * from $table where(id='$id')");
			$data=$res->fetchAll();
			$content=$data['content']-1;
			$ser=$db->exec("update $table set content='$content' where(id='$id')");
			if ($ser){
			return "<script>alert('添加成功');location.href='show.php'</script>";
		    }else{
			return "<script>alert('添加失败');location.href='show.php'</script>";
		}

	}
	public function del($table,$id){
		$dsn="mysql:host=127.0.0.1;dbname=2018.11.5";
		$db=new PDO($dsn,'root','root');
		$data=$db->exec("delete form $table where(id='$id')");
		if ($data) {
			return  "删除成功";
		}else{
			return "删除失败";
		}
	}
	public function update($table,$id){
		$dsn="mysql:host=127.0.0.1;dbname=2018.11.5";
		$db=new PDO($dsn,'root','root');
		$data=$db->exec("update form $table where(id='$id')");
		if ($data) {
			return "<script>alert('添加成功');location.href='show.php'</script>";
		}else{
			return "<script>alert('添加失败');location.href='show.php'</script>";
		}
	}
}


