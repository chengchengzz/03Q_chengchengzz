<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:66:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\slide\add.html";i:1508120513;s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\common\base.html";i:1508120513;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/static/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/static/admin/css/style.css?time=<?php echo $systime; ?>">
	
	
	<title><?php echo $nowmenuname; ?></title>
	
	<script>
		var root_url = "<?php echo url('index/index'); ?>";
	</script>
</head>
<body>
<div class="container-fluid topnav">
	<a href="<?php echo url('index/index'); ?>" class="brand pull-left">
		<img src="/static/admin/images/logo.png">
	</a>
	<ul class="topmenu pull-left">
		<li><a class="btn btn-info btn-launch" title="伸缩导航"><i class="fa fa-bars"></i></a></li><li><a class="btn btn-warning btn-recache" data-url="<?php echo url('setting/recache'); ?>" title="刷新缓存"><i class="fa fa-trash"></i></a></li>
		<li><a class="btn btn-success" title="网站首页"><i class="fa fa-home"></i></a></li>
	</ul>
	<ul class="userinfo pull-right">
		<li>
			<a>
				<i class="fa fa-calendar"></i> <span id="calendar"><?php echo date("Y 年 m 月 d 日", $systime); ?></span>
			</a>
		</li>
		<li><a><i class="fa fa-user"></i> <?php echo $username; ?></a></li>
		<li class="truebtn">
			<a class="truebtn btn-repasswd" data-url="<?php echo url('myinfo/repasswd'); ?>" data-title="修改密码" data-width="600" data-height="280">
				<i class="fa fa-key"></i> 修改密码
			</a>
		</li>
		<li class="truebtn">
			<a class="truebtn btn-logout" data-url="<?php echo url('publics/logout'); ?>">
				<i class="fa fa-sign-out"></i> 注销
			</a>
		</li>
	</ul>
</div>

<div class="container-fluid main">
	<div id="sidebar" class="sidebar">
		<?php echo $sidebar; ?>
	</div>
	<div class="mainbox">
		<div class="maintop">
			<div class="nowseat">
				<span>当前位置：</span>
				<span>
					<?php if($nowmenuname == 'index'){ ?>
						后台首页
					<?php }else{ ?>
						<?php echo (isset($nowmenuname) && ($nowmenuname !== '')?$nowmenuname:"后台首页"); } ?>
				</span>
			</div>
			<div class="btninfo">
				<a class="btn btn-success btn-refresh"><i class="fa fa-refresh"></i> 刷 新</a>
			</div>
		</div>
		<div class="maincont">
			
	<ul class="nav nav-tabs">
		<li><a href="<?php echo url('slide/index'); ?>" class="index-url">幻灯片列表</a></li>
		<li class="active"><a href="<?php echo url('slide/add'); ?>">新增幻灯片</a></li>
	</ul>
	
	<form name="dataForm" enctype="multipart/form-data" class="form-horizontal top15" action="<?php echo url('slide/addsave'); ?>">
		<table class="table table-bordered must-middle">
			<tr>
				<th width="10%"><span class="must-red">*</span> 标题</th>
				<td width="45%">
					<input type="text" name="title" class="form-control" maxlength="50">
				</td>
				<th width="10%" rowspan="3">图片</th>
				<td width="35%" rowspan="3" style="text-align: center;">
					<img src="/static/admin/images/default.png" style="width: 120px; height: 75px;">
					<span class="help-block" style="color: #999;">图片请在编辑中上传</span>
				</td>
			</tr>
			<tr>
				<th><span class="must-red">*</span> 所属分类</th>
				<td>
					<?php echo $categorylists; ?>
				</td>
			</tr>
			<tr>
				<th>URL</th>
				<td>
					<input type="text" name="url" class="form-control" maxlength="100">
				</td>
			</tr>
			<tr>
				<td colspan="4" style="text-align: center;">
					<a class="btn btn-primary btn-save">保 存</a>
					<a class="btn btn-default btn-cancel left10">返 回</a>
				</td>
			</tr>
		</table>
	</form>

		</div>
	</div>
</div>

<div id="pop_html" style="display: none;"></div>

<script src="/static/js/jquery.min.js"></script>
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<script src="/static/admin/js/jquery.cookie.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script src="/static/js/laydate/laydate.js"></script>
<script src="/static/admin/js/common.js?time=<?php echo $systime; ?>"></script>

<script>
$(function() {
	
});
</script>

</body>
</html>