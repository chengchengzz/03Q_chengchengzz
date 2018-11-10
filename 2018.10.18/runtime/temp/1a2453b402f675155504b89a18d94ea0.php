<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\rbac\add.html";i:1508120513;s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\common\base.html";i:1508120513;}*/ ?>
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
		<li><a href="<?php echo url('rbac/index'); ?>" class="index-url">角色列表</a></li>
		<li class="active"><a href="<?php echo url('rbac/add'); ?>">新增角色</a></li>
	</ul>
	
	<form name="dataForm" class="form-horizontal top15" action="<?php echo url('rbac/addsave'); ?>">
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 角色名称</label>
			<div class="col-sm-8">
				<input type="text" name="name" class="form-control width300">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">备注</label>
			<div class="col-sm-8">
				<textarea name="remark" class="form-control width300" style="height: 55px; resize: none;"></textarea>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 状态</label>
			<div class="col-sm-8">
				<label class="radio-inline">
					<input type="radio" name="status" value="0" checked> 禁用
				</label>
				<label class="radio-inline">
					<input type="radio" name="status" value="1"> 启用
				</label>
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<div class="col-sm-offset-3 col-sm-8">
				<a class="btn btn-primary btn-save">保 存</a>
				<a class="btn btn-default left20 btn-cancel">返 回</a>
			</div>
		</div>
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

</body>
</html>