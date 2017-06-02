<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://static.runoob.com/assets/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://static.runoob.com/assets/jquery/2.0.3/jquery.min.js"></script>
<script
	src="http://static.runoob.com/assets/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/homePage.css">
<link rel="stylesheet" href="../css/seat.css">
<script src="../js/seat.js"></script>
<title>剧院管理系统主页</title>
</head>
<body>
	<nav class="navbar navbar-default" role="navigation">
	<div class="container-fluid" id="navbar">
		<div class="navbar-header col-lg-3">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-collapse">
				<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> <span><img
					class="img-circle " src="../img/logo.jpg" id="logo" />剧院管理系统</span>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-collapse">
			<ul class="nav navbar-nav col-lg-offset-9">
				<li class="active"><a
					href="<%=request.getContextPath() %>/project/studio.html"><span
						class="glyphicon change">演出厅管理</span> </a></li>
				<li><a href="<%=request.getContextPath() %>/project/play.html"><span
						class="glyphicon change">剧目管理</span> </a></li>
				<li><a
					href="<%=request.getContextPath() %>/Manager/employee.jsp"><span
						class="glyphicon change">人员管理</span> </a></li>
				<li><a
					href="<%=request.getContextPath() %>/project/performancePlan.jsp"><span
						class="glyphicon change">演出计划管理</span> </a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><img alt="请上传头像" src="#" data-toggle="modal"
					data-target="#headModal" style="width: 50px; border-radius: 50%" />
				</li>
				<li><a href="#"><span class="glyphicon glyphicon-user">姓名</span>
				</a></li>
				<li><a
					href="<%=request.getContextPath() %>/baseServlet?oprate=quit"><span
						class="glyphicon glyphicon-off">退出</span> </a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="modal fade" id="headModal" tabindex="-1"
		aria-labelledby="headModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="headModalLabel">上传头像</h4>
				</div>
				<form action="#" method="post" enctype="multipart/form-data">
					<div class="modal-body col-lg-12" align="center">
						选择头像<input type="file" name="file" class="input">

					</div>
					<div class="modal-footer">
						<div align="center">
							<a href="#"> <input type="submit" class="btn btn-danger"
								value="提交" onclick="return isPic()">
							</a>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="col-lg-12">
		<div id="tital">
			<button>银幕</button>
		</div>
		<div
			class="col-lg-offset-10 col-md-offset-10 col-sm-offset-10 col-xs-offset-10">
			<img src='../img/seat1.jpg'><span>可选座位</span>
			&nbsp;&nbsp;&nbsp;&nbsp; <img src='../img/seat2.jpg'><span>不可选座位</span>
		</div>
		<div class="seat" align="center">
			<table>
			</table>
		</div>
		<!--     <div class="seat" align="center">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div>
    <div class="seat" align="center">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div>
    <div class="seat" align="center">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat2.jpg' onClick="src='../img/seat1.jpg',seat1()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div>
    <div class="seat" align="center">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div>
    <div class="seat" align="center">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat2.jpg' onClick="src='../img/seat1.jpg',seat1()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div>
    <div class="seat" align="center">
        <img src='../img/seat2.jpg' onClick="src='../img/seat1.jpg',seat1()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
        <img src='../img/seat1.jpg' onClick="src='../img/seat2.jpg',seat()">
    </div> -->
	</div>
</body>
</html>