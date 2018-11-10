<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:71:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\rbac\authorize.html";i:1508120513;s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\common\base.html";i:1508120513;}*/ ?>
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
		<li><a href="<?php echo url('rbac/add'); ?>">新增角色</a></li>
		<li class="active"><a>权限设置</a></li>
	</ul>
	
	<form name="dataForm" class="form-horizontal top15" action="<?php echo url('rbac/authorizesave'); ?>">
		<input type="hidden" name="id" value="<?php echo $role_id; ?>">
		<table class="table table-bordered">
			<?php echo $rbacmenu; ?>
		</table>
		<div class="form-group" style="margin-top: 30px; text-align: center;">
			<a class="btn btn-danger btn-checkall">全选</a>
			<a class="btn btn-warning left20 btn-checknot">反选</a>
			<a class="btn btn-primary left20 btn-save">保 存</a>
			<a class="btn btn-default left20 btn-cancel">返 回</a>
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

<script>
$(function() {
	// 顶级菜单 全选 / 全不选
	$('body').on('click', '.rbac-top', function(){
		var val = $(this).val();
		var pid = $(this).attr('data-pid');
		var status = $(this).prop('checked');
		if(status){
			$('input.rbac-top-' + pid).prop('checked', true);
		}else{
			$('input.rbac-top-' + pid).prop('checked', false);
		}
	});
	
	// 一级菜单 全选 / 全不选
	$('body').on('click', '.rolecheck', function(){
		var val = $(this).val();
		var myid = $(this).attr('data-myid');
		var status = $(this).prop('checked');
		if(status){
			$('input.firtop-' + myid).prop('checked', true);
		}else{
			$('input.firtop-' + myid).prop('checked', false);
		}
	});
	
	// 权限的总体 全选
	$('body').on('click', 'a.btn-checkall', function(){
		$('input.rolecheck').prop('checked', true);
	});
	
	// 权限的总体 反选
	$('body').on('click', 'a.btn-checknot', function(){
		$('input.rolecheck').prop('checked', false);
	});
});
</script>

</body>
</html>