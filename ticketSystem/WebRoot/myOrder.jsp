<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div ng-controller="myOrderController">
<div class="table-responsive">
	<table class="table table-bordered table-striped table-hover">
		<thead class="thead-text-center">
			<tr>
				<th>序号</th>
				<th>订单号</th>
				<th>航班号</th>
				<th>飞机机型</th>
				<th>
					<p>城市区间</p>
					<p>(出发城市--到达城市)</p>
				</th>
				<th>
					<p>时间区间</p>
					<p>(出发时间--到达时间)</p>
				</th>
				<th>出发日期</th>
				<th>仓位</th>
				<th>票价</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="o in myOrders">
				<td>{{$index+1}}</td>
				<td>{{o.orderNo}}</td>
				<td>{{o.flightNo}}</td>
				<td>{{o.model}}</td>
				<td>{{o.leaveCity}}-{{o.arrivalCity}}</td>
				<td>{{o.leaveTime}}--{{o.arrivalTime}}</td>
				<td>{{o.departureDate}}</td>
				<td>{{o.spaceType}}</td>
				<td>￥{{o.price}}</td>
				<td><button class="btn btn-default" ng-click="doRefund(o.orderNo)">退票</button></td>
			</tr>

		</tbody>
	</table>
</div>
</div>