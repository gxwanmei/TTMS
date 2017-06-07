<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="/TTMS_v1.0/css/bootstrap.min.css">
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script
	src="/TTMS_v1.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/TTMS_v1.0/css/header.css">
<link rel="stylesheet" href="/TTMS_v1.0/css/common.css">
<title></title>
</head>
<body>
	<div id="head">
		<div id="logo" class="head">
			<img src="/TTMS_v1.0/img/logo.jpg" />
		</div>
		<div id="headName" class="head">
			<h1>影院管理系統</h1>
		</div>
		<div id="nav" class="head">
			
			<a href="${pageContext.request.contextPath}/studio/enter.do" class="navHead">演出厅管理</a>
			<a href="${pageContext.request.contextPath}/schedule/enter.do" class="navHead">演出计划管理</a>
			<div class="navHead">剧目管理</div>
			<div class="navHead">演出计划管理</div>
			<div class="navHead">人员管理</div>
		</div>
		
		<div id="user" class="head">
			<div id="headPortrait" class="headUser">
				<c:choose>
					<c:when test="${u_photoUp == NULL}">
						<img src="/TTMS_v1.0/${u_photo}" data-toggle="modal" data-target="#headModal" />
					</c:when>
					<c:otherwise>
						<img src="${u_photoUp}" data-toggle="modal" data-target="#headModal" />
					</c:otherwise>
				</c:choose>
			</div>
			<div class="headUser">
				
				<h5>${name}</h5>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<div class="headUser">
				<a href="${pageContext.request.contextPath}/user/logout.do">退出</a>
			</div>
		</div>
	</div>
	<div class="modal fade" id="headModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h4 class="modal-title" id="headModalLabel">上传头像</h4>
				</div>
				<form action="${pageContext.request.contextPath}/user/upload.do" method="post" enctype="multipart/form-data">
					<div class="modal-body" align="center">
						<input type="hidden" name="id" value="${userid}">
						<input type="file" name="file">
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="submit" class="btn btn-danger"
								value="提交">
							
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>