<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <% String path=request.getContextPath();
   String basepath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧目管理</title>
<link rel="stylesheet" href="/TTMS_v1.0/css/play.css">
<script src="/TTMS_v1.0/js/jquery.min.js"></script>
<script type="text/javascript" src="/TTMS_v1.0/js/play.js"></script>
</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div id="search" class="contanierHead" style="margin-left: 80px">
				<input type="text" class="input" style="height: 35px" id="searchAll"
					placeholder="请输入剧目名称" />
				<button class="btn btn-info" onclick="getDataByName()">查询</button>
			</div>
			<div class="contanierHead" id="add">
				<button type="button" class="btn btn-info" data-toggle="modal"  data-target="#addPlay">添加剧目</button>
			</div>
		</div>
		<div id="myTabContent" class="tab-content col-lg-12">
			<div class="tab-pane fade in active" id="show">
				
			</div>
		</div>
	</div>
	
	<form action="/TTMS_v1.0/play/upload.do" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="addPlay" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">添加剧目</h4>
					</div>
					<div class="modal-body col-lg-12">
						<div class="col-lg-7">
							<div class="addInput">
								<span>剧目类型:</span> <select name="play_type">
									<option value="1">爱情片</option>
									<option value="2">恐怖片</option>
								</select>
							</div>
							<div class="addInput">
								<span>剧目名称:</span> <input type="text" class="input" name="play_name" placeholder="名称">
							</div>
							<div class="addInput">
								<span>基本信息:</span> <input type="text" name="play_introduce" placeholder="请输入基本信息">
							</div>
							<div class="addInput">
								<span>剧目时长:</span> <input type="text" name="play_length" placeholder="请输入剧目时长">
							</div>
							<div class="addInput">
								<span>剧目票价:</span> <input type="text" name="play_ticket_price" placeholder="请输入剧目票价">
							</div>
							<div class="addInput">
								<span>剧目状态:</span> <select name="play_status">
									<option value="1">已上映</option>
									<option value="0">未上映</option>
								</select>
							</div>
							<input type="file" width="140px" name="file" accept="image/*" onchange="changImg(event)">
						</div>
						<div class="col-lg-4">
							<img src="/TTMS_v1.0/img/init.jpg" data-toggle="modal"  id="myImg"
								style="width: 155px; height: 200px;" />
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="submit" class="btn btn-danger"
								value="提交">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="modal fade" id="playImage" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h4 class="modal-title" id="headModalLabel">上传剧目图片</h4>
				</div>
				<form action="../play/upload.do" method="post" enctype="multipart/form-data">
					<div class="modal-body" align="center">
						<input type="file" name="file">
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
<%-- <div id="details">asd:${plays}</div>
<%=basepath%>
style="display:none"--%>
<%-- 图片:<img src="<%=basepath%>upload/test.jpg"> --%>
</body>
</html>