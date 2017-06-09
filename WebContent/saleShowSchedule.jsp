<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/TTMS_v1.0/css/play.css">
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript" src="/TTMS_v1.0/js/saleShowSchedule.js"></script>
</head>
<body>
<jsp:include page="saleHeader.jsp"></jsp:include>
	<div class="contanier">
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
				<tbody id="showSchedule">
							
				</tbody>
				</table>
				</div>
	</div>
</body>
</html>