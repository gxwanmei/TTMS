<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧目管理</title>

<link rel="stylesheet" href="/TTMS_v1.0/css/play.css">
<script type="text/javascript" src="http://localhost:8080/TTMS_v1.0/jquery/jquery-1.9.1.js"></script>
<script>
$(function(){
	var url = window.location.href;
	var arr = url.split("?")[1].split("=");
	var play_id = arr[1];	
	$("#play_picture").change(function(){
		var playImagePath = $("#play_picture").val();
		$("#playImage").attr('src',playImagePath); 
	})
})

</script>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
	<div id="myTabContent" class="tab-content col-lg-12">
	<div class='col-lg-4 col-xs-offset-1'>
			<a href='#'><img src='/TTMS_v1.0/${play.play_image}' style='width: 155px; height: 200px;'/></a>
			</div>
			<div id='addInputDiv' class='col-lg-5'>
			<div class="addInput">
								<input type="text" name="play_id" style="display:none" value="${play.play_id}">
								<span>剧目类型:</span> 
								<input type="text" class="input" id="play_type" value="${playtype}">
							</div>
							<div class="addInput">
								<span>剧目名称:</span> <input type="text" class="input" id="play_name" value="${play.play_name}">
							</div>
							<div class="addInput">
								<span>基本信息:</span> <input type="text" id="play_introduce" value="${play.play_introduce}">
							</div>
							<div class="addInput">
								<span>剧目时长:</span> <input type="text" id="play_length" value="${play.play_length}">
							</div>
							<div class="addInput">
								<span>剧目票价:</span> <input type="text" id="play_ticket_price" value="${play.play_ticket_price}">
							</div>
							<div class="addInput">
								<span>剧目状态:</span> <input type="text" id="play_introduce" value="${playstatus}">
							</div>
							<button class="btn btn-info" data-toggle="modal" data-target="#modifyPlay" id="modifyPlayButton">修改剧目</button>
				</div>
		</div>
	</div>
	<form action="../play/uploadUpdate.do" method="post" enctype="multipart/form-data">
		<div class="modal fade" id="modifyPlay" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">修改剧目</h4>
					</div>
					<div class="modal-body col-lg-12">
						<div class="col-lg-7">
							<div class="addInput">
								<input type="text" name="play_id"  style="display:none" value="${play.play_id}">
								<span>剧目类型:</span> <select name="play_type">
									<option value="1">爱情片</option>
									<option value="2">恐怖片</option>
									<option value="3">动漫剧</option>
									<option value="4">生活剧</option>
									<option value="5">古装剧</option>
									<option value="6">战争片</option>
									<option value="7">科幻片</option>
								</select>
							</div>
							<div class="addInput">
								<span>剧目名称:</span> <input type="text" class="input" name="play_name" value="${play.play_name}">
							</div>
							<div class="addInput">
								<span>基本信息:</span> <input type="text" name="play_introduce" value="${play.play_introduce}">
							</div>
							<div class="addInput">
								<span>剧目时长:</span> <input type="text" name="play_length" value="${play.play_length}">
							</div>
							<div class="addInput">
								<span>剧目票价:</span> <input type="text" name="play_ticket_price" value="${play.play_ticket_price}">
							</div>
							<div class="addInput">
								<span>剧目状态:</span> <select name="play_status" value="${play.play_status}">
									<option value="0">已上映</option>
									<option value="1">未上映</option>
								</select>
								<input type="file" name="file" id="play_picture">
							</div>
						</div>
						<div class="col-lg-4">
							<img src="../img/init.jpg" data-toggle="modal" id="playImage"
								style="width: 155px; height: 200px;" data-target="#playImage"/>
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<button class="btn btn-danger">确定</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>