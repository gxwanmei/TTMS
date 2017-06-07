<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧目管理</title>
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#get").click(function() {
			//$.post("/TTMS_v1.0/schedule/update.do",{"sched_id":"3","studio.studio_id":"2",
				//"play.play_id":"1","sched_time":"2017.8.8","sched_ticket_price":"30.0"},function(data){
					//alert(data);
			//})
			$.post("/TTMS_v1.0/schedule/date.do",{"sched_time":"2017.8.8"},function(data){
					alert(data);
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
									<th>开始时间</th>
									<th>结束时间</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studios}" var="st" varStatus="id">
									
								
								
								</c:forEach>
								<!--  <tr>
									<td>1号</td>
									<td>小时代</td>
									<td>王波厅</td>
									<td>2016.9.20</td>
									<td>9:00</td>
									<td>11:00</td>
									<td><a href="#"> <img src="/TTMS_v1.0/img/modify.png"
											data-toggle="modal" data-target="#modifyPerformancePlan" />
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img
											src="/TTMS_v1.0/img/delete.png" onclick="deleteInformation()" /> </a></td>
								</tr>
								-->
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
											src="/TTMS_v1.0/img/delete.png" onclick="deleteInformation()" /> </a></td>
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
						<span>剧目名称:</span><input type="text" class="input"
							placeholder="请输入剧目名称"> <br /> <br /> <br /> <span>所在演出厅:</span><select>
							<option>王波厅</option>
						</select> <br /> <br /> <br /> <span>放映日期:</span><input type="date"
							class="input" placeholder="请选择放映日期"> <br /> <br /> <br />
						<span>开始时间:</span><input type="text" class="input"
							placeholder="请输入开始时间"> <br /> <br /> <br /> <span>结束时间:</span><input
							type="text" class="input" placeholder="请输入结束时间"> <br />
						<br /> <br />
					</div>
					<div class="modal-footer">
						<div align="center">
							<a href="performancePlan.jsp">
								<button type="button" class="btn btn-danger">提交</button>
							</a>
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
							<span>剧目名称:</span><input type="text" class="input" id="name"
								placeholder="请输入剧目名称" onblur="checkName()">
						</div>
						<div class="addInput">
							<span>所在演出厅:</span><select>
								<option>演出厅</option>
							</select>
						</div>
						<div class="addInput">
							<span>放映日期:</span><input type="date" class="input"
								placeholder="请选择放映日期">
						</div>
						<div class="addInput">
							<span>开始时间:</span><input type="text" class="input" id="startTime"
								placeholder="请输入开始时间" onblur="checkStartTime()">
						</div>
						<div class="addInput">
							<span>结束时间:</span><input type="text" class="input" id="endTime"
								placeholder="请输入结束时间" onblur="checkEndTime()">
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<a href="performancePlan.jsp">
								<button type="button" class="btn btn-danger"
									onclick="checkAll()">提交</button>
							</a>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>