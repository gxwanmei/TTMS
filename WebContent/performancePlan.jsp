<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧目管理</title>
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajaxSetup({
			  async: false
			  });
		$.post("/TTMS_v1.0/schedule/gdate.do",{},function(data){
			alert(data);
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
	<button id="get">get</button>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div id="information">
			<ul id="myTab" class="nav nav-tabs" style="font-size: 20px">
				<li class="active"><a href="#today" data-toggle="tab">今天</a></li>
				<li><a href="#tomorrow" data-toggle="tab">明天</a></li>
				<li><a href="#one" data-toggle="tab">2017.6.01</a></li>
				<li><a href="#two" data-toggle="tab">2017.6.02</a></li>
				<li><a href="#three" data-toggle="tab">2017.6.03</a></li>
				<li><div style="margin-left: 400px">
						<button type="button" class="btn btn-info" data-toggle="modal"
							data-target="#addPerformancePlan">添加演出计划</button>
					</div></li>
			</ul>
			<div id="today" class="tab-content">
				<div class="tab-pane fade in active" id="today">
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
							<tbody>
								<c:forEach items="${scheds}" var="sc" varStatus="id">
									<tr>
										<td>${id.index+1}</td>
										<td>${sc.play.play_name}</td>
										<td>${sc.studio.studio_name}</td>
										<td>${sc.sched_time}</td>
										<td>${sc.sched_date}</td>
										<td>${sc.sched_ticket_price}</td>
										<td><img src="/TTMS_v1.0/img/modify.png"
												data-toggle="modal" data-target="#modifyPerformancePlan" sched_id=${sc.sched_id} class="modify"/>
										 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="/TTMS_v1.0/schedule/delete.do?sched_id=${sc.sched_id}"
											class="delete"><img src="/TTMS_v1.0/img/delete.png"
												onclick="deleteInformation()" /> </a></td>
									</tr>
								</c:forEach>
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
									<th>开始时间</th>
									<th>结束时间</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1号</td>
									<td>小时代</td>
									<td>王波厅</td>
									<td>2016.9.20</td>
									<td>9:00</td>
									<td>11:00</td>
									<td><a href="#"> <img src="/TTMS_v1.0/img/modify.png"
											data-toggle="modal" data-target="#modifyPerformancePlan" />
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img
											src="/TTMS_v1.0/img/delete.png" onclick="deleteInformation()" />
									</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="one">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1号</td>
									<td>小时代</td>
									<td>王波厅</td>
									<td>2016.9.20</td>
									<td>9:00</td>
									<td>11:00</td>
									<td><a href="#"> <img src="../img/modify.png"
											data-toggle="modal" data-target="#modifyPerformancePlan" />
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img
											src="../img/delete.png" onclick="deleteInformation()" /> </a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="two">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1号</td>
									<td>小时代</td>
									<td>王波厅</td>
									<td>2016.9.20</td>
									<td>9:00</td>
									<td>11:00</td>
									<td><a href="#"> <img src="../img/modify.png"
											data-toggle="modal" data-target="#modifyPerformancePlan" />
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img
											src="../img/delete.png" onclick="deleteInformation()" /> </a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="tab-pane fade" id="three">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>演出计划编号</th>
									<th>剧目名称</th>
									<th>所在演出厅</th>
									<th>放映日期</th>
									<th>开始时间</th>
									<th>结束时间</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1号</td>
									<td>小时代</td>
									<td>王波厅</td>
									<td>2016.9.20</td>
									<td>9:00</td>
									<td>11:00</td>
									<td><a href="#"> <img src="../img/modify.png"
											data-toggle="modal" data-target="#modifyPerformancePlan" />
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img
											src="../img/delete.png" onclick="deleteInformation()" /> </a></td>
								</tr>
							</tbody>
						</table>
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
								placeholder="请输入时间" onblur="checkStartTime()">
						</div>
						<div class="addInput">
							<span>票价:</span><input type="text" class="input" id="price"
								placeholder="请输入票价" onblur="checkEndTime()">
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