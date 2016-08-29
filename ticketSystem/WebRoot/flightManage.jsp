<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div ng-controller="flightController">
<form class="form-inline" role="form">
	<p class="form-control-static">查询条件：</p>
	<div class="form-group">
		<label for="">出发城市：</label> <input type="text" class="form-control"
			id="" name="" placeholder="出发城市" ng-model="srchFlight.leaveCity">
	</div>
	<div class="form-group">
		<label for="">到达城市：</label> <input type="text" class="form-control"
			id="" name="" placeholder="到达城市" ng-model="srchFlight.arrivalCity">
	</div>
	<div class="form-group">
		<label for="">航班编号：</label> <input type="text" class="form-control"
			id="" name="" placeholder="航班号" ng-model="srchFlight.no">
	</div>
	<div class="form-group">
		<label for="">航空公司：</label> <input type="text" class="form-control"
			id="" name="" placeholder="航空公司" ng-model="srchFlight.company">
	</div>
	<div class="form-group">
		<label for="">出发时间：</label>
		<div class="input-group date form_time col-md-6" data-date=""
			data-date-format="hh:ii" data-link-field="" data-link-format="hh:ii">
			<input class="form-control" type="text" value="" readonly ng-model="srchFlight.leaveTime"> <span
				class="input-group-addon"><span
				class="glyphicon glyphicon-time"></span></span>
		</div>
		<input type="hidden" id="" value="" />
	</div>
	<div class="form-group">
		<label for="">到达时间：</label>
		<div class="input-group date form_time col-md-6" data-date=""
			data-date-format="hh:ii" data-link-field="" data-link-format="hh:ii">
			<input class="form-control" type="text" value="" readonly ng-model="srchFlight.arrivalTime"> <span
				class="input-group-addon"><span
				class="glyphicon glyphicon-time"></span></span>
		</div>
		<input type="hidden" id="" value="" />
	</div>
	<button class="btn btn-default" ng-click="searchFlight()">查询</button>
</form>

<div>
	<button class="btn btn-default" data-toggle="modal"
		data-target="#addFlightModal">添加航班</button>
</div>
<!--添加航班摸态框 -->
<div class="modal fade" id="addFlightModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="text-center">航班添加</h3>
			</div>
			<form role="form" class="form-horizontal" id="addform">
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航班号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.no">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航空公司</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.company">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航空机型</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.model">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">总座位数</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.totleSeats">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">出发城市</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.leaveCity">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">到达城市</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newFlight.arrivalCity">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">价格</label>
						<div class="col-sm-5">
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">经济舱：￥</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="00.00" ng-model="newFlight.economyPrice">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">头等舱：￥</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="00.00" ng-model="newFlight.firstPrice">
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">出发时间</label>
						<div class="input-group date form_time col-sm-4" data-date=""
							data-date-format="hh:ii" data-link-field=""
							data-link-format="hh:ii">
							<input class="form-control" type="text" value="" readonly ng-model="newFlight.leaveTime">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span></span>
						</div>
						<input type="hidden" id="" value="" />
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">到达时间</label>
						<div class="input-group date form_time col-sm-4" data-date=""
							data-date-format="hh:ii" data-link-field=""
							data-link-format="hh:ii">
							<input class="form-control" type="text" value="" readonly ng-model="newFlight.arrivalTime">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span></span>
						</div>
						<input type="hidden" id="" value="" />
					</div>
					<div class="alert fade" id="addAlert"></div>
				</div>
				<div class="modal-footer highlight">
					<button type="button" class="btn btn-primary" ng-click="addFlight()">添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!--修改航班摸态框 -->
<div class="modal fade" id="modifyFlightModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="text-center">航班修改</h3>
			</div>
			<form role="form" class="form-horizontal">
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航班号</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.no">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航空公司</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.company">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">航空机型</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.model">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">总座位数</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.totleSeats">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">出发城市</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.leaveCity">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">到达城市</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="preFlight.arrivalCity">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">价格</label>
						<div class="col-sm-5">
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">经济舱：￥</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="00.00" ng-model="preFlight.economyPrice">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">头等舱：￥</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="00.00" ng-model="preFlight.firstPrice">
								</div>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">出发时间</label>
						<div class="input-group date form_time col-sm-4" data-date=""
							data-date-format="hh:ii" data-link-field=""
							data-link-format="hh:ii">
							<input class="form-control" type="text" ng-model="preFlight.leaveTime" readonly>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span></span>
						</div>
						<input type="hidden" id="" value="" />
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">到达时间</label>
						<div class="input-group date form_time col-sm-4" data-date=""
							data-date-format="hh:ii" data-link-field=""
							data-link-format="hh:ii">
							<input class="form-control" type="text" ng-model="preFlight.arrivalTime" readonly>
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-time"></span></span>
						</div>
						<input type="hidden" id="" value="" />
					</div>
				</div>
				<div class="modal-footer highlight">
					<button type="button" class="btn btn-primary" ng-click="modifyFlight()">修改</button>
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
				<th>ID</th>
				<th>航班号</th>
				<th>航班机型</th>
				<th>总座位数</th>
				<th>出发城市</th>
				<th>到达城市</th>
				<th>时间区间</th>
				<th>航空公司</th>
				<th>价格</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="f in flights">
				<td>{{$index+1}}</td>
				<td>{{f.no}}</td>
				<td>{{f.model}}</td>
				<td>{{f.totleSeats}}</td>
				<td>{{f.leaveCity}}</td>
				<td>{{f.arrivalCity}}</td>
				<td>{{f.leaveTime}}-{{f.arrivalTime}}</td>
				<td>{{f.company}}</td>
				<td>经济舱：￥{{f.economyPrice}}<br /> 头等舱：￥{{f.firstPrice}}
				</td>
				<td>
				<a href="javascript:;" ng-click="showModifyModal(f.no)">修改</a>
				<br />
				 <a href="javascript:;" ng-click="deleteFlight(f.id)">删除</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="text-center">
	<ul class="pagination" id="paginator"></ul>
</div>
</div>
<script type="text/javascript">
$('.form_time').datetimepicker({
	language:  'zh-CN',
	weekStart: 1,
	autoclose: 1,
	startView: 1,
	minView: 0,
	maxView: 1,
	forceParse: 0,
	startDate: "1980-00-00 00:00",
	endDate: "1980-00-00 23:59",
});
$('.table-condensed').find("th[class='switch']").css("visibility", "hidden");
</script>
