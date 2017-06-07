<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>剧目管理</title>

<link rel="stylesheet" href="../css/play.css">

<script type="text/javascript" src="../js/play.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="contanier">
		<div>
			<div id="search" class="contanierHead" style="margin-left: 80px">
				<input type="text" class="input" style="height: 35px"
					placeholder="请输入剧目名称" />
				<button class="btn b	tn-info">查询</button>
			</div>
			<div class="contanierHead" id="add">
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#addPlay">添加剧目</button>
			</div>
		</div>
		<div id="myTabContent" class="tab-content col-lg-12">
			<div class="tab-pane fade in active" id="show">
				<div class="show">
					<img src="../img/1.jpg" class="picture" data-toggle="modal"
						data-target="modifyPlay" />
					<div class="informationShow" onclick="showPlayInformation()">
						<p>首映:2016-09-02</p>
						<p>类型:动作,冒险,科幻</p>
						<p>地区:美国</p>
						<p>时长:122分钟</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="#" method="post">
		<div class="modal fade" id="modifyPlay" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">修改剧目</h4>
					</div>
					<div class="modal-body col-lg-12">
						<div class="col-lg-7">
							<div class="addInput">
								<span>剧目类型:</span> <select>
									<option>爱情片</option>
									<option>恐怖片</option>
								</select>
							</div>
							<div class="addInput">
								<span>剧目名称:</span> <input type="text" class="input" value="名称">
							</div>
							<div class="addInput">
								<span>基本信息:</span> <input type="text" value="请输入基本信息">
							</div>
							<div class="addInput">
								<span>剧目时长:</span> <input type="text" value="请输入剧目时长">
							</div>
							<div class="addInput">
								<span>剧目票价:</span> <input type="text" value="请输入剧目票价">
							</div>
							<div class="addInput">
								<span>剧目状态:</span> <select>
									<option>已上映</option>
									<option>未上映</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4">
							<img src="../img/init.jpg" data-toggle="modal"
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
	<form action="#" method="post">
		<div class="modal fade" id="addPlay" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header" align="center">
						<h4 class="modal-title" id="modalLabel">添加剧目</h4>
					</div>
					<div class="modal-body col-lg-12">
						<div class="col-lg-7">
							<div class="addInput">
								<span>剧目类型:</span> <select>
									<option>爱情片</option>
									<option>恐怖片</option>
								</select>
							</div>
							<div class="addInput">
								<span>剧目名称:</span> <input type="text" class="input" placeholder="名称">
							</div>
							<div class="addInput">
								<span>基本信息:</span> <input type="text" placeholder="请输入基本信息">
							</div>
							<div class="addInput">
								<span>剧目时长:</span> <input type="text" placeholder="请输入剧目时长">
							</div>
							<div class="addInput">
								<span>剧目票价:</span> <input type="text" placeholder="请输入剧目票价">
							</div>
							<div class="addInput">
								<span>剧目状态:</span> <select>
									<option>已上映</option>
									<option>未上映</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4">
							<img src="../img/init.jpg" data-toggle="modal"
								style="width: 155px; height: 200px;" data-target="#playImage" />
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
	<div class="modal fade" id="playImage" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" align="center">
					<h4 class="modal-title" id="headModalLabel">上传剧目图片</h4>
				</div>
				<form action="#" method="post" enctype="multipart/form-data">
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
</body>
</html>