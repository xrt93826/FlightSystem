<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div ng-controller="orderController">
<form class="form-inline" role="form">
	<p class="form-control-static">航班查询：</p>
	<div class="form-group">
		<label for="">出发城市：</label> <input type="text" class="form-control"
			id="" name="" placeholder="出发城市" ng-model="srchFlight.leaveCity">
	</div>
	<div class="form-group">
		<label for="">到达城市：</label> <input type="text" class="form-control"
			id="" name="" placeholder="到达城市" ng-model="srchFlight.arrivalCity">
	</div>
	<div class="form-group">
		<label for="">出发日期：</label>

		<div class="input-group date form_date" data-date=""
			data-date-format="dd MM yyyy" data-link-field=""
			data-link-format="yyyy-mm-dd">
			<input class="form-control" type="text" value="" readonly ng-model="srchFlight.depatureDate"> <span
				class="input-group-addon"><span
				class="glyphicon glyphicon-remove"></span></span> <span
				class="input-group-addon"><span
				class="glyphicon glyphicon-calendar"></span></span>
		</div>
		<input type="hidden" id="" value="" />

	</div>
	<button class="btn btn-primary" ng-click="getFlights()">查询</button>
</form>

<div class="modal fade" id="orderConfirmModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="text-center">预订确认</h3>
			</div>
			<form role="form" class="form-horizontal">
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航班号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="orderInfo.no" readonly>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">乘机人姓名</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" value="熊睿滔" readonly ng-model="orderInfo.passengerName">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">乘机人身份证号码</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" value="320113199308261630" readonly ng-model="orderInfo.iCard">
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-4 control-label">城市区间</label>
						<div class="col-sm-6 form-inline">
							<div class="form-group">
								<div class="col-sm-12">
									<input type="text" class="form-control" size="8" id="" name=""
										placeholder="" ng-model="orderInfo.leaveCity" readonly>- <input type="text"
										class="form-control" size="8" id="" name="" placeholder="" ng-model="orderInfo.arrivalCity" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-4 control-label">时间区间</label>
						<div class="col-sm-6 form-inline">
							<div class="form-group">
								<div class="col-sm-12">
									<input type="text" class="form-control" size="8" id="" name=""
										placeholder="" ng-model="orderInfo.leaveTime" readonly>- <input type="text"
										class="form-control" size="8" id="" name="" placeholder="" ng-model="orderInfo.arrivalTime" readonly>
								</div>
							</div>
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-4 control-label">价格</label>
						<div class="col-sm-5">
							<div class="form-group">
								<label class="col-sm-2 control-label">￥</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="" name=""
										placeholder="" ng-model="orderInfo.price" readonly>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer highlight">
					<button type="button" class="btn btn-primary" ng-click="doOrder()">确认</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="table-responsive">
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>序号</th>
				<th>航班号</th>
				<th>所属航班公司</th>
				<th>飞机机型</th>
				<th>出发城市</th>
				<th>到达城市</th>
				<th>出发时间</th>
				<th>到达时间</th>
				<th>票价</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="f in flights">
				<td>{{$index+1}}</td>
				<td>{{f.no}}</td>
				<td>{{f.company}}</td>
				<td>{{f.model}}</td>
				<td>{{f.leaveCity}}</td>
				<td>{{f.arrivalCity}}</td>
				<td>{{f.leaveTime}}</td>
				<td>{{f.arrivalTime}}</td>
				<td>经济舱：￥{{f.economyPrice}}<br /> 头等舱：￥{{f.firstPrice}}
				</td>
				<td><button class="btn btn-default" ng-click="orderConfirm(f.id,0)">预订</button>
					<br />
					<button class="btn btn-default" ng-click="orderConfirm(f.id,1)">预订</button></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="text-center">
	<ul class="pagination" id="paginator"></ul>
</div>
</div>

<script type="text/javascript">
	$('.form_date').datetimepicker({
            format: "yyyy-mm-dd",
            language : 'zh-CN',
            weekStart : 1,
            todayBtn : true,
            autoclose : 1,
            startView: 3,
            minView : 2,
    });
</script>