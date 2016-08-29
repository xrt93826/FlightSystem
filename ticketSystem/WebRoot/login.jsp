<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div ng-controller="loginController">
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
		<div class="col-sm-offset-5 col-sm-3">
			<button type="button" class="btn btn-default" ng-click="doLogin()">登录</button>
			<button type="reset" class="btn btn-default">重置</button>
		</div>
	</div>
</form>
</div>