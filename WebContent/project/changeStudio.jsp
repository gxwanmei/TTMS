<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="http://static.runoob.com/assets/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://static.runoob.com/assets/jquery/2.0.3/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid" id="navbar">
        <div class="navbar-header col-lg-3">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
			<a class="navbar-brand" href="#">
                <span><img class="img-circle" src="./img/logo.jpg" id="logo"/>剧院管理系统</span>
            </a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav col-lg-offset-9">
                <li><a href="<%=request.getContextPath() %>/homePage.jsp"><span class="glyphicon change">首页</span> </a></li>
                <li><a href="<%=request.getContextPath() %>/project/studio.jsp"><span class="glyphicon change">演出厅管理</span> </a></li>
                <li><a href="<%=request.getContextPath() %>/project/play.jsp"><span class="glyphicon change">剧目管理</span> </a></li>
                <li class="active"><a href="#"><span class="glyphicon change">人员管理</span> </a></li>
                <li><a href="<%=request.getContextPath() %>/project/performancePlan.jsp"><span class="glyphicon change">演出计划管理</span> </a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><img alt="请上传头像" src="<%=request.getContextPath() %>/${user.filepath}" data-toggle="modal" data-target="#headModal" style="width: 50px;border-radius:50%"/>
               </li>
               <li><a href=""><span class="glyphicon glyphicon-user">姓名</span>
                <li><a href="<%=request.getContextPath() %>/baseServlet?oprate=quit"><span class="glyphicon glyphicon-off">退出</span> </a></li>
            </ul>
            <div class="modal fade" id="headModal" tabindex="-1" aria-labelledby="headModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="headModalLabel">
                            上传头像
                        </h4>
                    </div>
                	<form action="#" method="post" enctype="multipart/form-data">
                    <div class="modal-body col-lg-12" align="center">
                   		选择头像<input type="file" name="file" class="input" >

                    </div>
                    <div class="modal-footer">
                        <div align="center">
                            <a href="#">
                                <input type="submit" class="btn btn-danger" value="提交"  onclick="return isPic()">
                            </a>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消
                            </button>
                        </div>
                    </div>
                   </form>
                </div>
            </div>
          </div>
        </div>
    </div>
</nav>
<div class="modal-content">
         <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="modalLabel">
                         	修改演出厅
                        </h4>
         </div>
<form action="#" method="post">
                    <div class="modal-body col-lg-12" align="center">
                    	<span>演出厅名字:</span><input type="text" name="name" class="input"  value="#" >
                    	<br/>
                        <br/>
                        <br/>
                        <span>语言:</span><select name="language">
                            <option  value="Chinese">Chinese</option>
                            <option  value="English">English</option>
                            <option  value="Japanese">Japanese</option>
                        </select>
                        <br/>
                        <br/>
                        <br/>
                        <span>规模:</span><select name="size">
                            <option value="big">big</option>
                            <option value="small">small</option>

                        </select>
                        <br/>
                        <br/>
                        <br/>
                         </div>
                    <div class="modal-footer">
                        <div align="center">
                                <input type="submit" class="btn btn-danger" value="提交">
         
                                <a href="<%=request.getContextPath() %>/project/studio.jsp"><button type="button" class="btn btn-default">取消</button></a>
      
                        </div>
                    </div>
</form>                    
</div>

</body>
</html>