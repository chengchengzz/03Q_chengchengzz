<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:72:"D:\phpStudy\WWW\2018.10.18\public/../app/admin\view\myinfo\repasswd.html";i:1508120513;}*/ ?>

<form name="dataForm" class="form-horizontal top15" action="<?php echo url('myinfo/repasswd'); ?>">
	<div class="form-group">
		<label class="col-sm-3 control-label"><span class="must-red">*</span> 原密码</label>
		<div class="col-sm-8">
			<input type="text" name="oldpasswd" class="form-control width300">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label"><span class="must-red">*</span> 新密码</label>
		<div class="col-sm-8">
			<input type="text" name="newpasswd" class="form-control width300">
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-3 control-label"><span class="must-red">*</span> 确认密码</label>
		<div class="col-sm-8">
			<input type="text" name="renewpasswd" class="form-control width300">
		</div>
	</div>
	<div class="form-group" style="margin-top: 30px; text-align: center;">
		<a class="btn btn-primary btn-save">保 存</a>
		<a class="btn btn-default left10 btn-psbackup">返 回</a>
	</div>
</form>
