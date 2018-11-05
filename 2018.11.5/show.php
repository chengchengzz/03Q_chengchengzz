<?php
function __autoload($class){
	require "{$class}.php";
}
$thiss=new curd();
$data=$thiss->show("title");
?>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
	      content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
</head>
<body>
<center>
	<table border="1">
		<tr>
			<td>id</td>
			<td>标题</td>
			<td>分类</td>
			<td>简介</td>
			<td>操作</td>
		</tr>
		<?php  foreach ($data as $key=>$v) { ?>
		<tr>
			<td><?php echo $v['id'] ?></td>
			<td><?php echo $v['title'] ?></td>
			<td><?php echo $v['fenlei'] ?></td>
			<td><?php echo $v['content'] ?></td>
		</tr>
		<?php  }?>
	</table>
</center>
</body>
</html>