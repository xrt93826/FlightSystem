<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div ng-controller="registerController">
<form role="form" class="form-horizontal">
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">用户登录名</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="" placeholder="用户登录名" ng-model="user.loginName">
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">用户密码</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="" placeholder="用户密码" ng-model="user.password">
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">重复密码</label>
		<div class="col-sm-3">
			<input type="password" class="form-control" id="" placeholder="重复密码">
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">用户姓名</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="" placeholder="用户姓名" ng-model="user.userName">
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">性别</label>
		<div class="col-sm-3">
			<input type="radio" class="radio-inline" id="" name="gender" ng-model="user.sex" value="0">男
			<input type="radio" class="radio-inline" id="" name="gender" ng-model="user.sex" value="1">女
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">身份证号</label>
		<div class="col-sm-3">
			<input type="text" class="form-control" id="" placeholder="身份证号" ng-model="user.userICard">
		</div>
	</div>
	<div class="form-group">
		<label for="" class="col-sm-5 control-label">邮箱</label>
		<div class="col-sm-3">
			<input type="email" class="form-control" id="" placeholder="邮箱" ng-model="user.mail">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-5 col-sm-3">
			<button type="button" class="btn btn-default" ng-click="doRegister()">注册</button>
			<button type="reset" class="btn btn-default">重置</button>
		</div>
	</div>
</form>
</div>