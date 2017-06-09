<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演出计划管理</title>
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			  async: false
			  });
		$.post("/TTMS_v1.0/schedule/enter.do",{},function(data){

			var date = new Date();
			var today1 = date.toLocaleDateString();
			today1 = today1.replace(/\//g, "-");
			var arr1 = parseInt(today1.split("-")[1]);
			var arr = parseInt(today1.split("-")[2]);
			var today = "";
			var tomorrow="";
			var theDayAfterTomorrow = "";
			var tomorrow1  = arr+1;
			var theDayAfterTomorrow1 = tomorrow1+1;

			if(arr1 < 10){
				if(arr < 10){
					today = today1.split("-")[0]+"-0"+today1.split("-")[1]+"-0"+today1.split("-")[2];
					console.log(today);
				}
				if(tomorrow1 < 10){
				    tomorrow = today1.split("-")[0]+"-0"+today1.split("-")[1]+"-0"+tomorrow1;
				}
				else{
					 tomorrow = today1.split("-")[0]+"-0"+today1.split("-")[1]+"-"+tomorrow1;
				}
				if(theDayAfterTomorrow1 < 10){
				    theDayAfterTomorrow = today1.split("-")[0]+"-0"+today1.split("-")[1]+"-0"+theDayAfterTomorrow1;
				}
				else{
				    theDayAfterTomorrow = today1.split("-")[0]+"-0"+today1.split("-")[1]+"-"+theDayAfterTomorrow1;
				}
			}
			else if(arr < 10){
				today = today1.split("-")[0]+"-"+today1.split("-")[1]+"-0"+today1.split("-")[2];
			}
			else if(tomorrow1 < 10){
				 tomorrow = today1.split("-")[0]+"-"+today1.split("-")[1]+"-0"+tomorrow1;
			}
			else if(tomorrow1 >= 10){
				 tomorrow = today1.split("-")[0]+"-"+today1.split("-")[1]+"-"+tomorrow1;
			}
			else if(theDayAfterTomorrow1 < 10){
			    theDayAfterTomorrow = today1.split("-")[0]+"-"+today1.split("-")[1]+"-0"+theDayAfterTomorrow1;
			}	
			else if(theDayAfterTomorrow1 >= 10){
			    theDayAfterTomorrow = today1.split("-")[0]+"-"+today1.split("-")[1]+"-"+theDayAfterTomorrow1;
			}
			
			var str = "";
			$.each(data,function(index,val){
				var s = "<tr><td>"+val.sched_id+"</td>"+
				"<td>"+val.play.play_name+"</td>"+
				"<td>"+val.studio.studio_name+"</td>"+
				"<td>"+val.sched_time+"</td>"+
				"<td>"+val.sched_date+"</td>"+
				"<td>"+val.sched_ticket_price+"</td>"+
				"<td><a href='#'> <img src='/TTMS_v1.0/img/modify.png' data-toggle='modal' data-target='#modifyPerformancePlan' sched_id='"+val.sched_id+"' class='modify' /></a>"+
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				"<a href='/TTMS_v1.0/schedule/delete.do?sched_id="+val.sched_id+"'><img id='allScheduleDelete' src='/TTMS_v1.0/img/delete.png' class='delete'/></a></td></tr>";
				str+=s;
			})
			$("#allScheduleTableBody").html(str);
			
			var strToday = "";
			var strTomorrow = "";
			var strTheDayAfterTomorrow = "";
			$.each(data,function(index,val){
				var x = "<tr><td>"+val.sched_id+"</td>"+
				"<td>"+val.play.play_name+"</td>"+
				"<td>"+val.studio.studio_name+"</td>"+
				"<td>"+val.sched_time+"</td>"+
				"<td>"+val.sched_date+"</td>"+
				"<td>"+val.sched_ticket_price+"</td>"+
				"<td><a href='#'> <img src='/TTMS_v1.0/img/modify.png' data-toggle='modal' data-target='#modifyPerformancePlan' sched_id='"+val.sched_id+"' class='modify' /></a>"+
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
				"<a href='/TTMS_v1.0/schedule/delete.do?sched_id="+val.sched_id+"'><img id='allScheduleDelete' src='/TTMS_v1.0/img/delete.png' class='delete'/></a></td></tr>";
				if(val.sched_time === today){
					strToday+=x;
				}
				if(val.sched_time === tomorrow){
					strTomorrow+=x;
				}
				if(val.sched_time === theDayAfterTomorrow){
					strTheDayAfterTomorrow+=x;
				}
			})
			$("#todayTableBody").html(strToday);
			$("#tomorrowTableBody").html(strTomorrow);
			$("#theDayAfterTomorrowTableBody").html(strTheDayAfterTomorrow);
			
		})
		$.post("/TTMS_v1.0/schedule/plname.do",{},function(data){
			var playStr = "";
			$.each(data,function(index,val){
				playStr+="<option value='"+val.play_id+"'>"+val.play_name+"</option>";
			})
			$("#pName").html(playStr);
			$("#playName").html(playStr);
		})
		$.post("/TTMS_v1.0/schedule/stuname.do",{},function(data){
			var studioStr = "";
			$.each(data,function(index,val){
				studioStr+="<option value='"+val.studio_id+"'>"+val.studio_name+"</option>";
			})
			$("#sName").html(studioStr);
			$("#studioName").html(studioStr);
		})
		
		$(".delete").click(function() {
			var ifSubmit = confirm("确定删除？");
			if (ifSubmit) {
				return ifSubmit;
			} else {
				return false;
			}
		})
		
		$(".modify").click(function () {
			var sched_id = $(this).attr("sched_id");
			$.post("/TTMS_v1.0/schedule/find.do",{"sched_id":sched_id},function(data){
				var data = data[0];
				$("#scheduleId").val(sched_id);
				$("#playName").val(data.play.play_id);
				$("#studioName").val(data.studio.studio_id);
				$("#scheduleTime").val(data.sched_time);
				$("#scheduleDate").val(data.sched_date);
				$("#schedulePrice").val(data.sched_ticket_price);
			})
		})
		
		$("#modifyPlanButton").click(function(){
			var scheduleId = $("#scheduleId").val();
			var playName = $("#playName").find("option:selected").text();
			var playId = $("#playName").find("option:selected").val();
			var studioId = $("#studioName").find("option:selected").val();
			var studioName = $("#studioName").find("option:selected").text();
			var scheduleTime = $("#scheduleTime").val();
			var scheduleDate = $("#scheduleDate").val();
			var schedulePrice = $("#schedulePrice").val();
			$.post("/TTMS_v1.0/schedule/update.do",{"sched_id":scheduleId,"play.play_id":playId,"play.play_name":playName,"studio.studio_id":studioId,
				"studio.studio_name":studioName,"sched_time":scheduleTime,"sched_date":scheduleDate,"sched_ticket_price":schedulePrice},function(data){
					if(data==1)
					{
						location.reload();
					}
					else{
						alert("修改失败");
					}
				})	
		})
		
		$("#insert").click(function(){
			var pName = $("#pName").find("option:selected").text();
			var pId = $("#pName").find("option:selected").val();
			var sId = $("#sName").find("option:selected").val();
			var sName = $("#sName").find("option:selected").text();
			var time = $("#time").val();
			var date = $("#date").val();
			var price = $("#price").val();
			$.post("/TTMS_v1.0/schedule/insert.do",{"play.play_id":pId,"studio.studio_id":sId,"sched_time":time,
				"sched_date":date,"sched_ticket_price":price},function(data){
					if(data==1)
					{
						location.reload();
					}
					else{
						alert("添加");
					}
				
			})
		
		})
	})
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div id="information">
			<ul id="myTab" class="nav nav-tabs" style="font-size: 20px">
			<li class="active"><a href="#allSchedule" data-toggle="tab">所有</a></li>
				<li><a href="#today" data-toggle="tab">今天</a></li>
				<li><a href="#tomorrow" data-toggle="tab">明天</a></li>
				<li><a href="#theDayAfterTomorrow" data-toggle="tab">后天</a></li>
				<li><div style="margin-left: 400px">
						<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#addPerformancePlan">添加演出计划</button>
					</div></li>
			</ul>
			<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="allSchedule">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>放映时间</th>
									<th>销售价格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="allScheduleTableBody">
							
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="today">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>放映时间</th>
									<th>销售价格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="todayTableBody">
							
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="tomorrow">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>放映时间</th>
									<th>销售价格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="tomorrowTableBody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="theDayAfterTomorrow">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>放映时间</th>
									<th>销售价格</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="theDayAfterTomorrowTableBody">
								
							</tbody>
						</table>
					</div>
				</div>
				</div>
			</div>
		</div>

		<div class="modal fade" id="modifyPerformancePlan" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="myModalLabel">修改演出计划</h4>
					</div>
					
						<div class="modal-body col-lg-12" align="center">
						
							<input type="hidden" name="sched_id" id="scheduleId" >
							<span>剧目名称:</span>
							<input type="hidden" name="play.play_id" id="pMId" >
							<select name="play.play_name" id="playName" >
							<option></option>
							</select>
							<br /> <br /> <br /> <span>所在演出厅:</span>
							<input type="hidden" name="studio.studio_id" id="sMId" >
							 <select name="studio.studio_name"
								id="studioName">
								<option></option>
							</select> <br /> <br /> <br /> <span>放映日期:</span> <input type="date" name="sched_time"
								class="input" id="scheduleTime" value=""> <br /> <br />
							<br /> <span>时间:</span><input type="text" class="input"
								id="scheduleDate" value="" name="sched_date"/> <br /> <br /> <br />
								<span>票价:</span><input type="text" class="input"
								id="schedulePrice" value="" name="sched_ticket_price"/> <br /> <br /> <br />
						</div>
						<div class="modal-footer">
							<div align="center">
							<button type="button" class="btn btn-danger" id="modifyPlanButton">提交</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="addPerformancePlan" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">添加演出计划</h4>
					</div>
					<div class="modal-body" align="center">
						<div class="addInput">
							<span>剧目名称:</span>
							<select id="pName">
								<option></option>
							</select>
						</div>
						<div class="addInput">
							<span>所在演出厅:</span>
							<select id="sName">
								<option></option>
							</select>
						</div>
						<div class="addInput">
							<span>放映日期:</span><input type="date" class="input"
								placeholder="请选择放映日期" id="time">
						</div>
						<div class="addInput">
							<span>时间:</span><input type="text" class="input" id="date"
								placeholder="请输入时间" >
						</div>
						<div class="addInput">
							<span>票价:</span><input type="text" class="input" id="price"
								placeholder="请输入票价" >
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
								<button type="button" class="btn btn-danger"
								id="insert">提交</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>