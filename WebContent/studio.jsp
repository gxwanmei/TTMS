<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript">
	$(function () {
		$(".delete").click(function () {
			var ifSubmit = confirm("确定删除？");
			if(ifSubmit){
				return ifSubmit;
			}
			else{
			return false;
			}
		})
		$("#query").click(function() {
			var a= $("#query_name").val();
			location.href("/TTMS_v1.0/studio/enter.do?studio_name="+a)
		})
		$(".modify").click(function(){
			var id = $(this).attr("studioId");
			$.post("/TTMS_v1.0/studio/get.do",{"studio_id":id},function(data){
				
				var str = "<div class='modal-body' align='center'><div class='addInput'>" +
				"<span>演出厅名字:</span> <input type='text' name='studio_name' class='input'value='"+data.studio_name+"'></div>" +
				"<div class='addInput'><span>语言:</span> <select name='studio_language'>" +
				"<option>Chinese</option>" +
				"<option>English</option>" +
				"<option>Japanese</option></select></div>" +
				"<div class='addInput'><span>规模:</span> " +
				"<select name='studio_size'>" +
				"<option>default</option>" +
				"<option>big</option>" +
				"<option>small</option></select>"+
				"<div class='addInput'><span>类型:</span> " +
				"<select name='studio_type'>" +
				"<option>3D</option>" +
				"<option>3DMAX</option>" +
				"<option>2DMAX</option>" +
				"<option>2D</option></select>"+
				"<input name='studio_id' style='display:none' value='"+data.studio_id+"'/>"+
				"</div></div>"+
				"<div class='modal-footer'>" +
				"<div align='center'>" +
				"<input type='submit' class='btn btn-danger' value='提交'>" +
				"<a href='#'>" +
				"<button type='button' class='btn btn-default'  data-dismiss='modal'>取消</button>" +
				"</a></div></div>";
				
				$("#modifyStudioForm").html(str);
			})
		})
	})
</script>
<title>演出厅管理</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div id="search" class="contanierHead">
				<input type="text" class="input"  placeholder="请输入演出厅名称" id="query_name" /> <input
					type="button"  value="查询" class="input" id="query"/>
			</div>
			<div class="contanierHead" id="add">
				<button type="button" class="btn btn-info" data-toggle="modal"
					data-target="#addStudio">添加演出厅</button>
			</div>
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>演出厅编号</th>
						<th>演出厅名称</th>
						<th>语言</th>
						<th>大小</th>
						<th>类型</th>
						<th>操作</th>
					</tr>
				</thead>
					<c:forEach items="${studios}" var="st" varStatus="id">
						<tr>
							
							<td>${id.index+1} </td>
							<td>${st.studio_name} </td>
							<td>${st.studio_language} </td>
							<td>${st.studio_size} </td>
							<td>${st.studio_type} </td>
							<td> <img src="/TTMS_v1.0/img/modify.png" studioId="${st.studio_id}"
								data-toggle="modal" data-target="#modifyStudio" class="modify"/>
								 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="/TTMS_v1.0/studio/delete.do?studio_id=${st.studio_id}"><img
								src="/TTMS_v1.0/img/delete.png" class="delete"/></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="/TTMS_v1.0/seat.jsp?studio_id=${st.studio_id}&studio_size=${st.studio_size}"><button class="btn btn-danger" style="height: 30px">座位管理</button></a></td>
						</tr>
		
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form action="/TTMS_v1.0/studio/insert.do" method="post">
			<div class="modal fade" id="addStudio" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<h4 class="modal-title" id="modalLabel">添加演出厅</h4>
						</div>
						<div class="modal-body" align="center" id="addStudio">
							<div class="addInput">
								<span>演出厅名称:</span><input type="text" class="input" name="studio_name"
									id="name" placeholder="请输入演出名称">
							</div>
							<div class="addInput">
								<span>语言:</span><select name="studio_language">
									<option value="Chinese">Chinese</option>
									<option value="English">English</option>
									<option value="Japanese">Japanese</option>
								</select>
							</div>
							<div class="addInput">
								<span>类型:</span><select name="studio_type">
									<option>2D</option>
									<option>3D</option>
									<option>4D</option>
								</select>
							</div>
							<div class="addInput">
								<span>大小:</span> <select name="studio_size">
									<option value="default">default</option>
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
					<form action="/TTMS_v1.0/studio/update.do" method="post" id="modifyStudioForm">
						
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>