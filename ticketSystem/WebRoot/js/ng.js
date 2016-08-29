/**
 * 
 */
var app = angular.module('myApp', ['ngRoute']);

app.run(['$rootScope', function($rootScope){
	$rootScope.user=new Object();
	$rootScope.user.status=0;
	$rootScope.user.loginName="";
	$rootScope.exit=function(){
		$rootScope.user.status=0;
		$rootScope.user.loginName="";
	}
}]);

//配置路由
app.config(['$routeProvider',
  function(rp) {
    rp.when('/flightManage',{templateUrl:'flightManage.jsp',controller:function(){
        $("#navbar").find("a").eq(1).parent().addClass("active").siblings().removeClass("active");
    }})
    	  .when('/index',{template:'<h1>首页</h1>',controller:function(){
      		$("#navbar").find("a").eq(0).parent().addClass("active").siblings().removeClass("active");
    	    }})
      .when('/ticketManage',{templateUrl:'ticketManage.jsp',controller:function(){
  		$("#navbar").find("a").eq(2).parent().addClass("active").siblings().removeClass("active");
      }})
      .when('/ticketManage_1/:no',{templateUrl:'ticketManage_1.jsp',controller:['$scope','$routeParams',function($scope,$params){
  		$("#navbar").find("a").eq(2).parent().addClass("active").siblings().removeClass("active");
  		$scope.no=$params.no;
      }]})
      .when('/myOrder',{templateUrl:'myOrder.jsp',controller:function(){
  		$("#navbar").find("a").eq(4).parent().addClass("active").siblings().removeClass("active");
      }})
      .when('/order',{templateUrl:'order.jsp',controller:function(){
  		$("#navbar").find("a").eq(3).parent().addClass("active").siblings().removeClass("active");
      }})
      .when('/memberManage',{templateUrl:'memberManage.jsp',controller:function(){
  		$("#navbar").find("a").eq(5).parent().addClass("active").siblings().removeClass("active");
      }})
      .when('/register',{templateUrl:'register.jsp'})
      .when('/login',{templateUrl:'login.jsp'})
      .otherwise({template:"<h1>首页</h1>",controller:function(){
  		$("#navbar").find("a").eq(0).parent().addClass("active").siblings().removeClass("active");
      }});    
}]);


//航班管理页面控制器
app.controller("flightController", ['$scope','$http','$httpParamSerializer',function($scope,$http,$hps) {
	
	//查询
	$scope.searchFlight=function(){
		if($scope.pno==null){
			$scope.pno=1;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/getFlightsByFuzzy",$hps($scope.srchFlight)+"&pageNo="+$scope.pno,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.flights=resp.data.results;
			//分页器配置
			if(resp.data.pageCount == 0){
				resp.data.pageCount=1;
			}
			var options = {
					bootstrapMajorVersion:3,
					currentPage: resp.data.pageNo-1,
					totalPages:resp.data.pageCount,
					onPageClicked: function(e,originalEvent,type,page){
						$scope.pno=page;
						$scope.searchFlight();
		            }
			}
			$("#paginator").bootstrapPaginator(options);
		});
	}
	
	//初始页面
	$scope.searchFlight();
	
	//添加
	$scope.addFlight=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/add",$hps($scope.newFlight),{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			//$scope.flights.push($scope.newFlight);
			$("#addform")[0].reset();
			$("#addAlert").addClass("in").addClass("alert-success").append($("<h2>添加成功</h2>"));
			setTimeout(function() {
				$("#addAlert").empty().removeClass("in").removeClass("alert-success");
			}, 2000);
			$scope.searchFlight();
		}, function(reason) {
			$("#addAlert").addClass("in").addClass("alert-warning").append($("<h2>添加失败</h2>"));
			setTimeout(function() {
				$("#addAlert").empty().removeClass("in").removeClass("alert-warning");
			}, 2000);
		});
	}
	
	//弹出修改摸态框
	$scope.showModifyModal=function(no){
		
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/getFlightDetail","no="+no,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.preFlight=resp.data.data;
			$("#modifyFlightModal").modal("show");
		});
	}
	
	//修改
	$scope.modifyFlight=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/modify",$hps($scope.preFlight),{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$("#modifyFlightModal").modal("hide");
			for(var i in $scope.flights){
				if($scope.flights[i].id == $scope.preFlight.id){
					$scope.flights[i]=$scope.preFlight;
				}
			}
			
		});
	}
	
	//删除
	$scope.deleteFlight=function(id){
		if(!confirm("确认删除吗？")){
			return;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/delete","id="+id,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success != true){
				alert("删除失败");
			}else{
				var arr = [];
				for(var i in $scope.flights){
					if($scope.flights[i].id != id){
						arr.push($scope.flights[i]);
					}
				}
				$scope.flights = arr;
				alert(resp.data.msg);
			}
		});
	}
}]);

//票数管理控制器
app.controller("ticketController", ['$scope','$http',function($scope,$http) {
	//查询
	$scope.searchFlight=function(){
		if($scope.pno==null){
			$scope.pno=1;
		}
		if($scope.srchNo==null){
			$scope.srchNo="";
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/flight/getFlightsByFuzzy","no="+$scope.srchNo+"&pageNo="+$scope.pno,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.flights=resp.data.results;
			//分页器配置
			if(resp.data.pageCount == 0){
				resp.data.pageCount=1;
			}
			var options = {
					bootstrapMajorVersion:3,
					currentPage: resp.data.pageNo-1,
					totalPages:resp.data.pageCount,
					onPageClicked: function(e,originalEvent,type,page){
						$scope.pno=page;
						$scope.searchFlight();
		            }
			}
			$("#paginator").bootstrapPaginator(options);
		});
	}
	
	//初始页面
	$scope.searchFlight();
	
}]);

//票数管理控制器_1
app.controller("ticketController_1", ['$scope','$http','$httpParamSerializer',function($scope,$http,$hps) {
	$scope.goBack=function(){
		window.history.back();
	}
	
	//获取所有票
	$scope.getTickets=function(dateTime){
		if($scope.pno==null){
			$scope.pno=1;
		}
		if($scope.dateTime==null){
			$scope.dateTime="";
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/getTicketByFlightId","no="+$scope.no+"&dateTime="+$scope.dateTime+"&pageNo="+$scope.pno,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.tickets=resp.data.results;
			
			//分页器配置
			if(resp.data.pageCount == 0){
				resp.data.pageCount=1;
			}
			var options = {
					bootstrapMajorVersion:3,
					currentPage: resp.data.pageNo-1,
					totalPages:resp.data.pageCount,
					onPageClicked: function(e,originalEvent,type,page){
						$scope.pno=page;
						$scope.getTickets();
		            }
			}
			$("#paginator").bootstrapPaginator(options);
		});
	}
	
	$scope.getTickets();
	
	//弹出修改摸态框
	$scope.showModifyModal=function(id){
		
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/getTicketDetail","id="+id,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.preTicket=resp.data.data;
			$("#modifyTicketModal").modal("show");
		});
	}
	
	//修改票
	$scope.modifyTickets=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/modifyTicket",$hps($scope.preTicket),{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$("#modifyTicketModal").modal("hide");
			for(var i in $scope.tickets){
				if($scope.tickets[i].id == $scope.preTicket.id){
					$scope.tickets[i].economyNo=$scope.preTicket.economyNo;
					$scope.tickets[i].firstNo=$scope.preTicket.firstNo;
				}
			}
			
		});
	}
	
	//添加票
	$scope.addTicket=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/add",$hps($scope.newTicket)+"&no="+$scope.no,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$("#addform")[0].reset();
			$("#addAlert").addClass("in").addClass("alert-success").append($("<h2>添加成功</h2>"));
			setTimeout(function() {
				$("#addAlert").empty().removeClass("in").removeClass("alert-success");
			}, 2000);
			$scope.getTickets();
		}, function(reason) {
			$("#addAlert").addClass("in").addClass("alert-warning").append($("<h2>添加失败</h2>"));
			setTimeout(function() {
				$("#addAlert").empty().removeClass("in").removeClass("alert-warning");
			}, 2000);
		});
	}
	
	//删除
	$scope.deleteTicket=function(id){
		if(!confirm("确认删除吗？")){
			return;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/delete","id="+id,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success != true){
				alert("删除失败");
			}else{
				var arr = [];
				for(var i in $scope.tickets){
					if($scope.tickets[i].id != id){
						arr.push($scope.tickets[i]);
					}
				}
				$scope.tickets = arr;
				alert(resp.data.msg);
			}
		});
	}
	
	//提交
	$scope.updateTicketFlag=function(id){
		if(!confirm("确认提交吗？")){
			return;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/ticket/updateFlag","id="+id,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success != true){
				alert("提交失败");
			}else{
				for(var i in $scope.tickets){
					if($scope.tickets[i].id == id){
						$scope.tickets[i].flag=1;
					}
				}
				alert(resp.data.msg);
			}
		});
	}
	
	//一键提交
	
}]);

//机票预订控制器
app.controller("orderController", ['$scope','$http','$httpParamSerializer',function($scope,$http,$hps) {
	//获取所有票务信息
	$scope.getFlights=function(){
		if($scope.pno==null){
			$scope.pno=1;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/order/getFlightsByConditions",$hps($scope.srchFlight)+"&pageNo="+$scope.pno,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			$scope.flights=resp.data.results;
			//分页器配置
			if(resp.data.pageCount == 0){
				resp.data.pageCount=1;
			}
			var options = {
					bootstrapMajorVersion:3,
					currentPage: resp.data.pageNo-1,
					totalPages:resp.data.pageCount,
					onPageClicked: function(e,originalEvent,type,page){
						$scope.pno=page;
						$scope.getFlights();
		            }
			}
			$("#paginator").bootstrapPaginator(options);
		});
	}
	$scope.getFlights();
	$scope.orderInfo=new Object();
	//预订确认
	$scope.orderConfirm=function(id,type){
		$scope.orderInfo.passengerName="熊睿滔";
		$scope.orderInfo.iCard="320113199308261630";
		for(var i = 0;i<$scope.flights.length;i++){
			if($scope.flights[i].id==id){
				$scope.orderInfo.no=$scope.flights[i].no;
				$scope.orderInfo.leaveCity=$scope.flights[i].leaveCity;
				$scope.orderInfo.arrivalCity=$scope.flights[i].arrivalCity;
				$scope.orderInfo.leaveTime=$scope.flights[i].leaveTime;
				$scope.orderInfo.arrivalTime=$scope.flights[i].arrivalTime;
				if(type==0){
					$scope.orderInfo.price=$scope.flights[i].economyPrice;
					$scope.orderInfo.type=0;
				}else{
					$scope.orderInfo.price=$scope.flights[i].firstPrice;
					$scope.orderInfo.type=1;
				}
			}
		}
		$("#orderConfirmModal").modal("show");
	}
	//生成订单
	$scope.doOrder=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/order/order",
				"filghtNum="+$scope.orderInfo.no+"&type="+$scope.orderInfo.type+"&passengerName="+$scope.orderInfo.passengerName+"&iCard="+$scope.orderInfo.iCard,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success==true){
				$("#orderConfirmModal").modal("hide");
				alert(resp.data.msg);
			}else{
				$("#orderConfirmModal").modal("hide");
				alert("预订失败");
			}
		});
	}
	
}]);

//我的订单控制器
app.controller("myOrderController", ['$scope','$http',function($scope,$http) {
	//获取所有订单
	$scope.getMyOrders=function(){
		$http.post("http://192.168.21.8:8080/ticketSystem/order/getOrderByICard","iCard=320113199308261630",{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			var arr=[];
			for(var i=0;i<resp.data.data.length;i++){
				if(resp.data.data[i].status==1){
					arr.push(resp.data.data[i]);
				}
			}
			$scope.myOrders=arr;
		});
	}
	
	$scope.getMyOrders();
	
	$scope.doRefund=function(no){
		if(!confirm("确认退票吗？")){
			return;
		}
		$http.post("http://192.168.21.8:8080/ticketSystem/order/returnTicket","no="+no,{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			console.log(resp.data);
			if(resp.data.success != true){
				alert("退票失败");
			}else{
				var arr = [];
				for(var i in $scope.myOrders){
					if($scope.myOrders[i].orderNo != no){
						arr.push($scope.myOrders[i]);
					}
				}
				$scope.myOrders = arr;
				alert(resp.data.msg);
			}
		});
	}
}]);

//注册控制器
app.controller("registerController", ['$scope','$http','$httpParamSerializer',function($scope,$http,$hps) {
	
	$scope.doRegister=function(){	
		$http.post("http://192.168.21.8:8080/ticketSystem/user/register",$hps($scope.user),{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success == true){
				alert(resp.data.msg);
			}
			
			
		});
	}
	
}]);

//登录控制器
app.controller("loginController", ['$rootScope','$scope','$http','$httpParamSerializer',function($rootScope,$scope,$http,$hps) {
	
	$scope.doLogin=function(){	
		$http.post("http://192.168.21.8:8080/ticketSystem/user/login",$hps($scope.user),{
			headers:{"Content-type":"application/x-www-form-urlencoded"}
		}).then(function(resp) {
			if(resp.data.success == true){
				alert(resp.data.msg);
				$rootScope.user.loginName=$scope.user.loginName;
				$rootScope.user.status=1;
				window.location="index.jsp#/index";
			}
			
			
		});
	}
	
}]);