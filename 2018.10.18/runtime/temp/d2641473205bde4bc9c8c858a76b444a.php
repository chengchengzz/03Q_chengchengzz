<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\users\index.html";i:1508120513;s:68:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\common\base.html";i:1508120513;}*/ ?>
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
		<li class="active"><a href="<?php echo url('users/index'); ?>" class="index-url">用户列表</a></li>
		<li><a href="<?php echo url('users/add'); ?>">新增用户</a></li>
	</ul>
	
	<table class="table table-bordered table-hover top10">
		<tr class="table-header">
			<th>ID</th>
			<th>用户名(昵称)</th>
			<th>所属角色</th>
			<th>最后登陆 IP</th>
			<th>最后登陆时间</th>
			<th>登陆次数</th>
			<th style="text-align: center;">状态</th>
			<th style="text-align: center;">操作</th>
		</tr>
		<?php if(is_array($userslists) || $userslists instanceof \think\Collection || $userslists instanceof \think\Paginator): $i = 0; $__LIST__ = $userslists;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vousers): $mod = ($i % 2 );++$i;?>
			<tr>
				<td><?php echo $vousers['id']; ?></td>
				<td>
					<?php echo $vousers['name']; if($vousers['nickname']){ ?>( <?php echo $vousers['nickname']; ?> )<?php } ?>
				</td>
				<td <?php if($vousers['rolename'] == '未分配'): ?>style="color: #FF6600;"<?php endif; ?> >
					<?php echo $vousers['rolename']; ?>
				</td>
				<td><?php echo long2ip($vousers['login_ip']); ?></td>
				<td><?php echo $vousers['time_login']; ?></td>
				<td><?php echo $vousers['login_count']; ?></td>
				<td style="text-align: center;">
					<?php if($vousers['status'] == '1'): ?>
						<a class="btn btn-success btn-xs">启用</a>
					<?php else: ?>
						<a class="btn btn-default btn-xs">禁用</a>
					<?php endif; ?>
				</td>
				<td style="text-align: center;">
					<?php if($vousers['id'] == '1'): ?>
						<a class="btn btn-default btn-xs">编辑</a>
						<a class="btn btn-default btn-xs left10">删除</a>
					<?php else: ?>
						<a href="<?php echo url('users/edit', array('id' => $vousers['id'])); ?>" class="btn btn-warning btn-xs">编辑</a>
						<a class="btn btn-danger btn-xs left10">删除</a>
					<?php endif; ?>
				</td>
			</tr>
		<?php endforeach; endif; else: echo "" ;endif; ?>
		<tr class="table-header">
			<th>ID</th>
			<th>用户名(昵称)</th>
			<th>所属角色</th>
			<th>最后登陆 IP</th>
			<th>最后登陆时间</th>
			<th>登陆次数</th>
			<th style="text-align: center;">状态</th>
			<th style="text-align: center;">操作</th>
		</tr>
	</table>

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