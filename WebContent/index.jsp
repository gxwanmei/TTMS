<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#get").click(function() {
			$.post("user/get.do",{name:"zhang"},function(data){
				alert(123);
				alert(data);
			})
		})
	})
</script>
</head>
<body>
	<form action="user/check.do" method="post">
	<table>
	<tr><td>学生姓名</td><td><input type="text" name="name"></td></tr>
	<tr><td>密码</td><td><input type="password" name="pwd"></td></tr>
	<tr><td colspan="2"><input type="submit" value="登录"></td></tr>
	</table>
</form>
<button id="get">get User</button>
<div  id="info"> 
</div>
</body>
</html>