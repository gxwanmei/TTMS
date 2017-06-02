<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>演出厅管理</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>演出厅编号</th>
						<th>演出厅名称</th>
						<th>语言</th>
						<th>大小</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>id</td>
						<td>name</td>
						<td>Language</td>
						<td>size</td>
						<td><a href="#" class="glyphicon glyphicon-pencil"
							data-toggle="modal" data-target="#modifyStudio"></a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#"
							class="glyphicon glyphicon-trash"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div align="center">
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#addStudio">添加演出厅</button>
		</div>
		<form action="#" method="post">
			<div class="modal fade" id="addStudio" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">添加演出厅</h4>
						</div>
						<div class="modal-body" align="center" id="addStudio">
							<div class="addInput">
								<span>演出厅id:</span><input type="text" class="input" name="id"
									id="id" placeholder="请输入演出厅id">
							</div>
							<div class="addInput">
								<span>演出厅名称:</span><input type="text" class="input" name="name"
									id="name" placeholder="请输入演出名称">
							</div>
							<div class="addInput">
								<span>语言:</span><select name="language">
									<option value="Chinese">Chinese</option>
									<option value="English">English</option>
									<option value="Japanese">Japanese</option>
								</select>
							</div>
							<div class="addInput">
								<span>大小:</span> <select name="size">
									<option value="big">big</option>
									<option value="small">small</option>
								</select>
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
		<div class="modal fade" id="modifyStudio" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">修改演出厅</h4>
					</div>
					<form action="#" method="post">
						<div class="modal-body" align="center">
							<div class="addInput">
								<span>演出厅名字:</span> <input type="text" name="name" class="input"
									value="">
							</div>
							<div class="addInput">
								<span>语言:</span> <select name="language">
									<option value="Chinese">Chinese</option>
									<option value="English">English</option>
									<option value="Japanese">Japanese</option>
								</select>
							</div>
							<div class="addInput">
								<span>规模:</span> <select name="size">
									<option value="big">big</option>
									<option value="small">small</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<div align="center">
								<input type="submit" class="btn btn-danger" value="提交">
								<a href="#"><button type="button" class="btn btn-default">取消</button></a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>