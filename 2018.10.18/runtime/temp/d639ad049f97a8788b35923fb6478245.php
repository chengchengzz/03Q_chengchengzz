<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:70:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\publics\login.html";i:1539832459;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title>登陆</title>
	<style>
		body {
			background: url(/static/admin/images/loginbg_06.jpg) no-repeat center center fixed;
			-webkit-background-size: cover;
			-moz-background-size: cover;
			-o-background-size: cover;
			background-size: cover;
		}
		.container { margin-top: 150px; width: 400px; }
		.title-font { text-align: center; font-size: 24px; color: #FFF; }
		.form-font { text-align: center; }
		.input-groups { width: 300px; margin: 0px auto; }
		input.form-control { font-size: 19px; }
		img.verify-img {
			width: 300px;
			height: 50px;
			cursor: pointer;
			border: 1px solid #CCC;
			border-radius: 4px;
		}
		.panel {
			background: #FAFAFA;
			background: rgba(255,255,255,0.5);
			border: 1px solid #DDD;
		}
		.panel .panel-body { padding: 20px; }
	</style>
	
</head>
<body>
<div class="container">
	<div class="panel panel-default">
		<div class="panel-body">
			<form class="form-horizontal form-font" name="loginForm" action="<?php echo url('publics/dologin'); ?>">
				<div class="form-group">
					<div class="title-font">后 台 管 理 中 心</div>
				</div>
				<div class="form-group">
					<div class="input-group input-groups">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-user"></i>
						</span>
						<input type="text" class="form-control" name="username" autofocus="autofocus" placeholder="用户名" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-groups">
						<span class="input-group-addon">
							<i class="glyphicon glyphicon-lock"></i>
						</span>
						<input type="password" class="form-control" name="password" placeholder="密码" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group input-groups">
						<img id="logverify" class="verify-img" src="<?php echo url('publics/verify'); ?>" data-src="<?php echo url('publics/verify', 'time=rantime'); ?>" />
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control input-groups" name="verify" placeholder="验证码" />
				</div>
				<div class="form-group" style="margin-bottom: 0px;">
					<a class="btn btn-primary btn-dologin" style="width: 300px;">登 陆</a>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="/static/js/jquery.min.js"></script>
<script src="/static/js/layer/layer.js"></script>
<script src="/static/admin/js/login.js"></script>
</body>
</html>