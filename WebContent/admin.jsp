<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <% String path=request.getContextPath();
   String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影院经理</title>
<link rel="stylesheet" href="/TTMS_v1.0/css/admin.css">
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript" src="/TTMS_v1.0/js/admin.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div class="contanierHead" id="add">
				<button type="button" class="btn btn-info" data-toggle="modal"  data-target="#addAdmin">添加人员</button>
			</div>
		</div>
		<div id="myTabContent" class="tab-content col-lg-12">
			<div class="tab-pane fade in active" id="show">
				
			</div>
		</div>
	</div>
	<form action="/TTMS_v1.0/admin/insertUser.do" method="post">
	<div class="modal fade" id="addAdmin" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h4 class="modal-title" id="headModalLabel">添加人员</h4>
				</div>
				<form action="../play/upload.do" method="post" enctype="multipart/form-data">
					<div class="modal-body" align="center">
						<div class="addInput">
								<span>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</span> <input type="text" class="input" name="username" placeholder="账号">
							</div>
							<div class="addInput">
								<span>初始密码:</span> <input type="text" name="password" placeholder="请输入初始密码">
							</div>
							<div class="addInput">
								<span>管理权限:</span> <input type="text" name="type" placeholder="请输入管理权限">
								
							</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<a href="#"> <input type="submit" class="btn btn-danger"
								value="提交">
							</a>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	</form>
</body>
</html>