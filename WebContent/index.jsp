<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/TTMS_v1.0/css/bootstrap.min.css">
	<script src="/TTMS_v1.0/js/jquery.min.js"></script>
	<script src="/TTMS_v1.0/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/TTMS_v1.0/js/jssor.slider-21.1.5.min.js"></script>
	<script type="text/javascript" src="/TTMS_v1.0/js/index.js"></script>
	<link rel="stylesheet" href="/TTMS_v1.0/css/index.css">
<script type="text/javascript">
	$(function(){
		$.ajaxSetup({
			  async: false
			  });
		$("#myform").submit(function() {
			
			var flag=false;
	
			$.post("user/login.do",{username:$("#name").val(),password:$("#pwd").val()},function(data){
				if(data==="0")
				{
					alert("登陆失败,账号密码错误");
				}
				if(data==="1")
				{
					flag=true;
					
				}
			})
			
			return flag;
		})
	})
</script>
<title>剧院管理系统</title>
</head>
<body style="padding: 0px; margin: 0px; font-family: Arial, sans-serif">
	<div id="header" class="col-lg-12">
		<img class="img-circle col-lg-offset-1" src="/TTMS_v1.0/img/logo.jpg" id="logo" />
		<span style="font-size: 20px">剧院管理系统</span>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"
					data-toggle="modal" data-target="#myModal">登录</span> </a></li>
			<div class="modal fade" id="myModal" aria-labelledby="myModalLabel"
				aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" align="center">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">影院系统登陆</h4>
						</div>
						<form action="user/enter.do" method="post" id="myform">
							<div class="modal-body col-lg-12" align="center">
								<span>账号:</span>
								<input type="text" name="username" class="input" 
								placeholder="请输入账号" id="name">
								 <br /> <br /> <br />
								<span>密码:</span>
								<input type="password" name="password"
									class="input" id="pwd"  placeholder="请输密码">
							</div>
							<div class="modal-footer">
								<div align="center">
									<input type="submit" class="btn btn-danger btn-block"
										id="signIn" value="登录" > <br />
									<button type="button" class="btn btn-default btn-block"
										data-dismiss="modal">取消</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</ul>
	</div>
	<div id="jssor_1"
		style="position: relative; margin: 0 auto; top: 50px; left: 0px; width: 800px; height: 456px; overflow: hidden; visibility: hidden; background-color: #24262e;">
		<div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
			<div
				style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
			<div
				style="position: absolute; display: block; background: url('/TTMS_v1.0/img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
		</div>
		<div data-u="slides"
			style="cursor: default; position: relative; top: 0px; left: 0px; width: 800px; height: 356px; overflow: hidden;">
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/01.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/01.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/02.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/02.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/03.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/03.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/04.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/04.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/05.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/05.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/06.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/06.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/07.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/07.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/08.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/08.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/09.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/09.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/10.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/10.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/11.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/11.jpg" />
			</div>
			<div data-p="144.50" style="display: none;">
				<img data-u="image" src="/TTMS_v1.0/img/12.jpg" /> <img data-u="thumb"
					src="/TTMS_v1.0/img/12.jpg" />
			</div>
			<a data-u="any"
				href="http://www.jssor.com/demos/image-gallery.slider"
				style="display: none">Image Gallery</a>

		</div>
		<div data-u="thumbnavigator" class="jssort01"
			style="position: absolute; left: 0px; bottom: 0px; width: 800px; height: 100px;"
			data-autocenter="1">
			<div data-u="slides" style="cursor: default;">
				<div data-u="prototype" class="p">
					<div class="w">
						<div data-u="thumbnailtemplate" class="t"></div>
					</div>
					<div class="c"></div>
				</div>
			</div>
		</div>
		<span data-u="arrowleft" class="jssora05l"
			style="top: 158px; left: 8px; width: 40px; height: 40px;"></span> <span
			data-u="arrowright" class="jssora05r"
			style="top: 158px; right: 8px; width: 40px; height: 40px;"></span>
	</div>
	<script>
    jssor_1_slider_init();
</script>
	<div id="information" class="col-sm-offset-3">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#show" data-toggle="tab"> 最新上映 </a>
			</li>
			<li><a href="#introduce" data-toggle="tab">网站简介</a></li>
			<li><a href="#contact" data-toggle="tab">联系我们</a></li>

		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="show">
				<div class="show">
					<img src="/TTMS_v1.0/img/1.jpg" class="picture">
					<div class="informationShow">
						<p>首映:2016-09-02</p>
						<p>类型:动作,冒险,科幻</p>
						<p>地区:美国</p>
						<p>时长:122分钟</p>
						<p>导演:林诣彬</p>
						<p>主演:克里斯·派恩，扎克瑞·昆图，卡尔·厄本，佐伊·索尔达娜</p>
					</div>
				</div>
				<div class="show">
					<img src="/TTMS_v1.0/img/2.jpg" class="picture">
					<div class="informationShow">
						<p>首映:2016-09-07</p>
						<p>类型:动画,冒险,喜剧</p>
						<p>地区:美国</p>
						<p>时长:95分钟</p>
						<p>导演:麦克·特米尔,盖伦 T·楚</p>
						<p>主演:西蒙·佩吉，沈腾，婕西，马丽，杰西·泰勒·弗格森</p>
					</div>
				</div>
				<div class="show">
					<img src="/TTMS_v1.0/img/3.jpg" class="picture">
					<div class="informationShow">
						<p>首映:2016-09-08</p>
						<p>类型:剧情,爱情</p>
						<p>地区:中国大陆</p>
						<p>时长:91分钟</p>
						<p>导演:马伟豪,刘海</p>
						<p>主演:赵丽颖，乔任梁，吴映洁，班嘉佳，范逸臣，冯铭潮</p>
					</div>
				</div>
			</div>
			<div class="tab-pane fade" id="introduce">
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;影院售票系统是西安邮电大学软件1401班自己撰写
					的系统，该系统是软件1401班的第一门户网站，是软件工程1401班成立最早、影响力最强、访问
					量最大的网站，该网站成立于2016年，是西安邮电大学首批获得网络新闻登载权的商业网站，2016 年被授予校级青年文明号称号。</p>
			</div>
			<div class="tab-pane fade" id="contact">
				<p>地址：西安市长安区西安邮电大学软件1401班</p>
				<p>电话：15809244435</p>
				<p>邮箱：1724617718@qq.com</p>
			</div>
		</div>
	</div>
</body>
</html>