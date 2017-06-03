<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员管理</title>

<script type="text/javascript" src="/TTMSv_1.0/js/employee.js"></script>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div id="search" class="contanierHead">
				<input type="text" class="input" style="height:35px" placeholder="请输入人员姓名" /> 
				<button class="btn btn-info">查询</button>
			</div>
			<div class="contanierHead" id="add">
				<button type="button" class="btn btn-info" data-toggle="modal"
					data-target="#addEmployee">添加人员</button>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>人员编号</th>
						<th>人员姓名</th>
						<th>电话号码</th>
						<th>家庭住址</th>
						<th>邮箱</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>110</td>
						<td>李四</td>
						<td>22222</td>
						<td>莲湖路22号</td>
						<td>222@21cn.com</td>
						<td><a href="#"> <img src="/TTMS_v1.0/img/modify.png"
								data-toggle="modal" data-target="#modifyEmployee" />
						</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"><img src="/TTMS_v1.0/img/delete.png"  onclick="deleteInformation()" /></a>
					</tr>
				</tbody>
			</table>
		</div>
		<form action="${pageContext.request.contextPath}/employee/insert.do" method="post" id="addEmployeeForm">
			<div class="modal fade" id="addEmployee" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">添加人员</h4>
						</div>
						<div class="modal-body" align="center">
							<div class="addInput">
								<span>人员名称:</span> <input type="text" class="input"
									onblur="checkEmpName()" id="emp_name" placeholder="请输入人员姓名">
							</div>
							<div class="addInput">
								<span>电话号码:</span> <input type="text" class="input"
									onblur="checkEmpTelNum()" onfocus="checkEmpNameOnFocus()"
									id="emp_tel_num" placeholder="请输入电话号码">
							</div>
							<div class="addInput">
								<span>家庭住址:</span> <input type="text" class="input"
									id="emp_addr" onblur="checkEmpAddr()"
									onfocus="checkEmpTelNumOnFocus()" placeholder="请输入家庭住址">
							</div>
							<div class="addInput">
								<span>邮箱:</span> <input type="text" class="input" id="emp_email"
									onblur="checkEmpEmail()" onfocus="checkEmpAddrOnfocus()"
									placeholder="请输入邮箱">
							</div>
						</div>
						<div class="modal-footer">
							<div align="center">
								<button class="btn btn-danger" onclick="checkAll()">确定</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<form action="#" method="post">
			<div class="modal fade" id="modifyEmployee" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">修改人员信息</h4>
						</div>
						<div class="modal-body" align="center">
							<div class="addInput">
								<span>人员编号</span> <input type="text" class="input" value="110"
									readonly="readonly">
							</div>
							<div class="addInput">
								<span>人员名称</span> <input type="text" class="input" name="name"
									value="李四">
							</div>
							<div class="addInput">
								<span>电话号码:</span> <input type="text" class="input"
									value="22222">
							</div>
							<div class="addInput">
								<span>家庭住址:</span> <input type="text" class="input"
									value="莲湖路22号">
							</div>
							<div class="addInput">
								<span>邮箱:</span> <input type="text" class="input"
									value="222@21cn.com">
							</div>
						</div>
						<div class="modal-footer">
							<div align="center">
								<button type="submit" class="btn btn-danger">确定</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>