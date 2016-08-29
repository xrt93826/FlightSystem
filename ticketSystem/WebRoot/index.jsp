<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
	<meta charset="UTF-8">	
	<meta name="viewport" content="width=device-width">
	<title>Document</title>
	<script type="text/javascript" src="jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap-paginator.min.js"></script>
	<script type="text/javascript" src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
	<script type="text/javascript" src="angular/angular.min.js"></script>
	<script type="text/javascript" src="angular/angular-route.min.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/ng.js"></script>
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
	<link type="text/css" href="bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link type="text/css" href="css/ticketSystem.css" rel="stylesheet">
	<base href="index.jsp">
</head>
<body>
	<header>
		<h1>飞机票分销系统</h1>
	</header>
	<div class="navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#collapse-menu">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="collapse-menu" role="navigation">
				<ul class="nav navbar-nav" id="navbar">
					<li><a href="#/index">首页</a></li>
					<li><a href="#/flightManage">航班管理</a></li>
					<li><a href="#/ticketManage">票数管理</a></li>
					<li><a href="#/order">机票预订</a></li>
					<li><a href="#/myOrder">我的订单</a></li>
					<li><a href="#/memberManage">我的信息</a></li>
				</ul>
				<p class="navbar-text navbar-right" ng-switch="$root.user.status">
					<span ng-switch-when="0">
						<a href="#/login" class="navbar-link">登录</a>
						<a href="#/register" class="navbar-link">注册</a>
					</span>
					<span ng-switch-when="1">
						<span>欢迎{{$root.user.loginName}}</span>
						<a href="javascript:;" class="navbar-link" ng-click="$root.exit()">安全退出</a>
					</span>
				</p>
			</div>
		</div>
	</div>
	<div class="container" ng-view>
		
	</div>
</body>
</html>