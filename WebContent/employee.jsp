<%@page import="java.io.Writer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.ttms.model.Employee" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员管理</title>
<script type="text/javascript" src="../jquery/jquery-1.9.1.js"></script>
<script type="text/javascript" src="../js/employee.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div id="search" class="contanierHead">

				<form  action="/TTMS_v1.0/employee/query.do?currentPage=1" method="post">			
					<label>用户编号：</label>
					<input type="text"  name="emp_no" value="${emp_no}"/>			
					<input type="submit"  value="查   询" />&nbsp;&nbsp;
				</form>
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
						<th>序号</th>
						<th>人员编号</th>
						<th>人员姓名</th>
						<th>电话号码</th>
						<th>家庭住址</th>
						<th>邮箱</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
						<c:forEach items="${employees}" var="emp" varStatus="status">
							<tr>
								<td>${(currentPage-1)*5+status.index + 1}</td>
								<td id="trChange" style="display:none">${emp.emp_id}</td>
								<td>${emp.emp_no}</td>
								<td>${emp.emp_name}</td>
								<td>${emp.emp_tel_num}</td>
								<td>${emp.emp_addr}</td>
								<td>${emp.emp_email}</td>
									<td><a href="#" > <img class="modify" src="../img/modify.png"
								data-toggle="modal" data-target="#modifyEmployee"
								onclick="modifyEmployee('${emp.emp_id}','${emp.emp_no}','${emp.emp_name}','${emp.emp_tel_num}','${emp.emp_addr}','${emp.emp_email}')"/>
								</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" onclick="deleteInformation('${currentPage}','${emp.emp_no}')"><img
								src="../img/delete.png" /></a>
							</tr>
						</c:forEach>
				<!-- ../employee/delete.do?currentPage=${currentPage}&emp_no=${emp.emp_no} -->
				</tbody>
			</table>
		</div>
		<form action="../employee/insert.do" method="post" id="addEmployeeForm">
			<div class="modal fade" id="addEmployee" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">添加人员</h4>
						</div>
						<div class="modal-body" align="center">
							<div class="addInput">
								<span>人员编号:</span> <input type="text" class="input"
									onblur="checkEmpName()" id="emp_no" name="emp_no" placeholder="请输入人员编号">
							</div>
							<div class="addInput">
								<span>人员名称:</span> <input type="text" class="input"
									onblur="checkEmpName()" id="emp_name" name="emp_name" placeholder="请输入人员姓名">
							</div>
							<div class="addInput">
								<span>电话号码:</span> <input type="text" class="input"
									onblur="checkEmpTelNum()" onfocus="checkEmpNameOnFocus()"
									id="emp_tel_num" name="emp_tel_num" placeholder="请输入电话号码">
							</div>
							<div class="addInput">
								<span>家庭住址:</span> <input type="text" class="input"
									id="emp_addr" name="emp_addr" onblur="checkEmpAddr()"
									onfocus="checkEmpTelNumOnFocus()" placeholder="请输入家庭住址">
							</div>
							<div class="addInput">
								<span>邮箱:</span> <input type="text" class="input" id="emp_email"
									name="emp_email"	onblur="checkEmpEmail()" onfocus="checkEmpAddrOnfocus()"
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
		<form action="../employee/update.do" method="post">
			<div class="modal fade" id="modifyEmployee" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">修改人员信息</h4>
						</div>
						<div class="modal-body" id="modifyEmployeeModal" align="center">
						</div>
				   </div>
			   </div>
			   </div>
		</form>
		<div>
									<a href="../employee/query.do?currentPage=1&emp_no=${emp_no}">首页</a> &nbsp;
									<a href="../employee/query.do?currentPage=${beforePage}&emp_no=${emp_no}">上一页</a>&nbsp;
									<a href="../employee/query.do?currentPage=${nextPage}&emp_no=${emp_no}">下一页</a>&nbsp;
									<a href="../employee/query.do?currentPage=${allCountPage}&emp_no=${emp_no}">尾页</a>&nbsp;&nbsp;&nbsp;
									编号:${emp_no}&nbsp;
									当前是:${currentPage}页&nbsp;
									总页数：${allCountPage}&nbsp;
									上一页:${beforePage}&nbsp;
									下一页：${nextPage}&nbsp;
	 </div>
	</div>
</body>
</html>