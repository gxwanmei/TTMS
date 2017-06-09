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
<script type="text/javascript">
	$(function(){
		$("#userName").click(function(){
			var userName = $(this).text();
			$("#getUserName").html(userName);
			
		});
		$("#modifyUserPasswordButton").click(function(){
			var getUserPasswordAgain = $("#getUserPasswordAgain").val();
			var getUserPassword = $("#getUserPassword").val();
			var userName = document.getElementById('getUserName').innerText;
			if(getUserPasswordAgain === getUserPassword){
				
				url="/TTMS_v1.0/user/updatePassword.do";
				args={"username":userName,"password":getUserPassword};
				$.post(url,args,function(data){
					/* alert(data); */
				});
				alert("修改密码成功！");
			}
			else{
				alert("两次密码输入不一致");
			}
		})
	})
</script>

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
			<a href="${pageContext.request.contextPath}/performancePlan.jsp" class="navHead">演出计划管理</a>
			<a href="${pageContext.request.contextPath}/play.jsp" class="navHead">剧目管理</a>
			<a href="${pageContext.request.contextPath}/employee/query.do" class="navHead">人员管理</a>
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
				<a href="#" data-toggle="modal" data-target="#modifyPassword" id="userName">${name}</a>
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
	<div class="modal fade" id="modifyPassword" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h4 class="modal-title" id="headModalLabel">修改密码</h4>
				</div>
				<form action="#" method="post">
					<div class="modal-body" align="center">
					<div>
						<span>用户名：</span><input type="text" name="text" class="input" value="${name}" id="getUserName"/>
					</div>
					<br/>
					<div>
					<span>新密码：</span><input type="password" name="password" class="input" id="getUserPassword" placeholder="请输入密码">
					</div>
					<br/>
					<div>
						<span>再次输入：</span><input type="password" name="password" class="input" id="getUserPasswordAgain" placeholder="请再次输入密码">
					</div>	
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="submit" class="btn btn-danger"
							 id="modifyUserPasswordButton" value="提交">
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