<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:65:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\menu\add.html";i:1508120513;s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\common\base.html";i:1508120513;}*/ ?>
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
		<li><a href="<?php echo url('menu/index'); ?>" class="index-url">菜单列表</a></li>
		<li class="active"><a href="<?php echo url('menu/add'); ?>">新增菜单</a></li>
	</ul>
	
	<form name="dataForm" class="form-horizontal top15" action="<?php echo url('menu/addsave'); ?>">
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 上级菜单</label>
			<div class="col-sm-8">
				<select name="pid" class="form-control width400">
					<option value="0">作为顶级菜单</option>
					<?php if(is_array($menulists) || $menulists instanceof \think\Collection || $menulists instanceof \think\Paginator): $i = 0; $__LIST__ = $menulists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vomenu): $mod = ($i % 2 );++$i;?>
						<option value="<?php echo $vomenu['id']; ?>"><?php echo get_tree_icons($vomenu['path']); ?><?php echo $vomenu['name']; ?></option>
					<?php endforeach; endif; else: echo "" ;endif; ?>
				</select>
				<span class="help-block">
					菜单层级不能超过 5 级
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 菜单名称</label>
			<div class="col-sm-8">
				<input type="text" name="name" class="form-control width400">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 模块名称</label>
			<div class="col-sm-8">
				<input type="text" name="module" class="form-control width400">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 控制器名称</label>
			<div class="col-sm-8">
				<input type="text" name="control" class="form-control width400">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 方法名称</label>
			<div class="col-sm-8">
				<input type="text" name="actions" class="form-control width400">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">顶级菜单图标</label>
			<div class="col-sm-8">
				<input type="text" name="icon" class="form-control width400">
				<span class="help-block">
					示例：<i class="fa fa-apple"></i> class="fa fa-apple" 只取 fa-apple 
					<a href="http://www.fontawesome.com.cn/faicons" target="_blank">图标网址</a>
				</span>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label"><span class="must-red">*</span> 状态</label>
			<div class="col-sm-8">
				<label class="radio-inline">
					<input type="radio" name="status" value="0" checked> 隐藏
				</label>
				<label class="radio-inline">
					<input type="radio" name="status" value="1"> 显示
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