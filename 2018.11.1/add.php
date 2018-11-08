
<?php
  include 'DB.class.php';
  $db=new DB('127.0.0.1','root','root','day3');
  $arr=$_POST;
  $res=$db->add('out',$arr);
  if($res){
    echo "<script>alert('添加成功');location.href='list.php'</script>";
  }else{
    echo "<script>alert('添加失败');location.href='form.php'</script>";
  }
