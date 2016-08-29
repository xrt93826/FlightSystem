<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div ng-controller="ticketController">
<form class="form-inline" role="form">
	<p class="form-control-static">查询条件：</p>
	<div class="form-group form-inline">
		<label for="">航班号：</label> <input type="text" class="form-control"
			id="" name="" placeholder="航班号" ng-model="srchNo">
	</div>
	<button class="btn btn-default" ng-click="searchFlight()">查询</button>
</form>

<div class="table-responsive">
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>编号</th>
				<th>航班号</th>
				<th>出发城市</th>
				<th>到达城市</th>
				<th>时间区间</th>
				<th>航空公司</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="f in flights">
				<td>{{$index+1}}</td>
				<td>{{f.no}}</td>
				<td>{{f.leaveCity}}</td>
				<td>{{f.arrivalCity}}</td>
				<td>{{f.leaveTime}}-{{f.arrivalTime}}</td>
				<td>{{f.company}}</td>
				<td><a href="#/ticketManage_1/{{f.no}}">机票管理</a></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="text-center">
	<ul class="pagination" id="paginator"></ul>
</div>
</div>