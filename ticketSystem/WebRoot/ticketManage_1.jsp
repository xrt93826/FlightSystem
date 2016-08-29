<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div ng-controller="ticketController_1">

<!-- 添加票摸态框  -->
<div class="modal fade" id="addTicketModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="text-center">{{no}}次航班</h3>
			</div>
			<form role="form" class="form-horizontal" id="addform">
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">日期：</label>
						<div class="col-sm-5">
							<div class="input-group date form_date" data-date=""
								data-date-format="dd MM yyyy" data-link-field=""
								data-link-format="yyyy-mm-dd">
								<input class="form-control" type="text" value="" readonly ng-model="newTicket.departureDate">
								<span class="input-group-addon"><span
									class="glyphicon glyphicon-remove"></span></span> <span
									class="input-group-addon"><span
									class="glyphicon glyphicon-calendar"></span></span>
							</div>
							<input type="hidden" id="" value="" />
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">连续：</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="" name=""
								placeholder="" ng-model="newTicket.duration">
						</div>
						<span class="control-span">天</span>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-4 control-label">票数：</label>
						<div class="col-sm-5">
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">经济舱：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="票数" ng-model="newTicket.economyNo">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">头等舱：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="票数" ng-model="newTicket.firstNo">
								</div>
							</div>
						</div>
					</div>
					<div class="alert fade" id="addAlert"></div>
				</div>
				<div class="modal-footer highlight">
					<button type="button" class="btn btn-primary" ng-click="addTicket()">添加</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
</div>

<!-- 查询、添加、提交  -->
<div class="row">
	<form class="form-inline" role="form">
		<div class="inline-left">
			<a href="javascript:;" ng-click="goBack()"><span class="glyphicon glyphicon-circle-arrow-left"></span>
			<h4 class="inline">{{no}}次航班</h4></a>
		</div>
		<div class="inline-right">
			<div class="form-group form-inline">
				<label for="">日期：</label>
				<div class="input-group date form_date" data-date=""
					data-date-format="dd MM yyyy" data-link-field=""
					data-link-format="yyyy-mm-dd">
					<input class="form-control" type="text" value="" readonly ng-model="dateTime"> <span
						class="input-group-addon"><span
						class="glyphicon glyphicon-remove"></span></span> <span
						class="input-group-addon"><span
						class="glyphicon glyphicon-calendar"></span></span>
				</div>
				<input type="hidden" id="" value="" />
			</div>
			<button class="btn btn-default" ng-click="getTickets()">查询</button>
			<button class="btn btn-danger" type="button" data-toggle="modal"
				data-target="#addTicketModal">添加</button>
			<button class="btn btn-success">一键提交</button>
		</div>
	</form>
</div>

<!-- 票信息表格  -->
<div class="table-responsive">
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th></th>
				<th>序号</th>
				<th>日期</th>
				<th>票数</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<tr ng-repeat="t in tickets">
				<td ng-switch="t.flag">
					<div ng-switch-when="0">
						<a href="javascript:;" ng-click="showModifyModal(t.id)">修改</a>
					<a href="javascript:;" ng-click="deleteTicket(t.id)">删除</a>
					</div>
					<div ng-switch-when="1"></div>
				</td>
				<td>{{$index+1}}</td>
				<td>{{t.departureDate}}</td>
				<td>经济舱：{{t.economyNo}} 头等舱：{{t.firstNo}}</td>
				<td ng-switch="t.flag">
					<div ng-switch-when="0">
						<a href="javascript:;" ng-click="updateTicketFlag(t.id)">提交</a>
					</div>
					<div ng-switch-when="1"></div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<!-- 修改票 摸态框 -->
<div class="modal fade" id="modifyTicketModal" tabindex="-1">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h3 class="text-center">{{no}}次航班</h3>
			</div>
			<form role="form" class="form-horizontal">
				<div class="modal-body">
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">ID：</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" readonly ng-model="preTicket.id">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-sm-4 control-label">日期：</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="" name=""
								placeholder="" readonly ng-model="preTicket.departureDate">
						</div>
					</div>

					<div class="form-group">
						<label for="" class="col-sm-4 control-label">票数：</label>
						<div class="col-sm-5">
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">经济舱：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="票数" ng-model="preTicket.economyNo">
								</div>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-5 control-label">头等舱：</label>
								<div class="col-sm-7">
									<input type="text" class="form-control" id="" name=""
										placeholder="票数" ng-model="preTicket.firstNo">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer highlight">
					<button type="button" class="btn btn-primary" ng-click="modifyTickets()">修改</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</form>
		</div>
	</div>
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