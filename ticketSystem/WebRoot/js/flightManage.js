$(function(){
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

});