<%@ page language="java"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="http://static.runoob.com/assets/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://static.runoob.com/assets/jquery/2.0.3/jquery.min.js"></script>
    <script src="http://static.runoob.com/assets/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/homePage.css">
    <script src="../js/emplyee.js"></script>
    <script type="text/javascript">
	function isPic()
	{
    	var pic=myform.play_image.value;
    	var ext=pic.substring(pic.lastIndexOf(".")+1);
   	 //可以再添加允许类型
    	if(ext.toLowerCase()=="jpg" || ext.toLowerCase()=="png" || ext.toLowerCase()=="gif")
        	return true;
   	 else
    	{
    		alert("只能上传jpg、png、gif图像!");
        	return false;
    	}
	}
</script>
    <title>剧院管理系统主页</title>
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
                <span><img class="img-circle " src="../img/logo.jpg" id="logo"/>剧院管理系统</span>
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
	<div class="search" >
			<form class="form-inline" action="<%=request.getContextPath() %>/baseServlet?oprate=find" method="post">
				<!-- <input type="hidden" name="method" value="search"/> -->
				<input type="text" class="form-control" name="emp_name"/>
				<input type="submit" class="btn btn-primary" value="查   询" />&nbsp;&nbsp;
			</form>
	</div>
    <div class="table-responsive">
        <table class="table table-bordered" style="margin: 150px 30px">
            <thead>
            <tr>
                <th>人员编号</th>
                <th>账号</th>
                <th>姓名</th>
                <th>家庭地址</th>
                <th>电话</th>
                <th>邮箱</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            	<tr>
            		<td>id</td>
					<td>no</td>
					<td>name</td>
					<td>num</td>
					<td>addr</td>
					<td>email</td>
					<td>
               		<a href="#"
                         class="glyphicon glyphicon-pencil" >
                    </a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a class="glyphicon glyphicon-trash" href="#"></a>

               		</td>
           		</tr>
            </tbody>
        </table>
        <div class="text-center">
			<nav>
			  <ul class="pagination">
			    <li><a href="#">首页</a></li>
			    <li><a href="#">上一页</a></li>
			    <li><a href="#">下一页</a></li>
			    <li><a href="#">末页</a></li>
			  </ul>
			</nav>
		</div>
        <div align="center">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">添加人员</button>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="modalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="modalLabel">
                            添加人员
                        </h4>
                    </div>
                    <form action="<%=request.getContextPath() %>/baseServlet?oprate=add" method="post">
                    <div class="modal-body col-lg-12" align="center">
                       <!--  <span>姓名:</span><input type="text" class="input" id="emp_name" placeholder="请输入姓名" onblur="checkEmpName()"> -->
                       	<span>账号:</span><input type="text" name="emp_no" class="input" id="emp_count" placeholder="请输入账号">
                       	<br/>
                        <br/>
                        <br/>
                        <span>姓名:</span><input type="text" name="name" class="input" id="emp_name" placeholder="请输入姓名">
                     <!--    <span>性别:</span><select>
                            <option value="man">男</option>
                            <option value="feman">女</option>
                        </select> -->
                        <br/>
                        <br/>
                        <br/>
                        <span>家庭住址:</span><input type="text" name="address" class="input" id="emp_addr" placeholder="请输入家庭住址" >
                        <br/>
                        <br/>
                        <br/>
                        <span>电话:</span><input type="text" name="tel" class="input" id="emp_tel_num" placeholder="请输入电话" >
                        <br/>
                        <br/>
                        <br/>
                        <span>邮箱:</span><input type="text" name="email" class="input" id="emp_email" placeholder="请输入邮箱" >
                        <br/>
                        <br/>
                        <br/>
                    </div>
                    <div class="modal-footer">
                        <div align="center">
                            <a href="employee.html">
                                <input type="submit" class="btn btn-danger" value="提交">
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
</body>
</html>