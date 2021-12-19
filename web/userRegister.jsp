<%@page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtnl1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="icon" href="image/icon.svg">
		<title>新闻发布系统 V2.0</title>
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/userRegister.css" />
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/register.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<jsp:include page="common/top.jsp" />
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp" />
			</div>
			<div id="main">
			<!-- main begin -->
				<div class="top-bar">
					<h1>用户注册</h1>
				</div>
				<div class="inputform">
					<br>
					<!-- <form action="userVeriRegister.jsp" method="post" accept-charset="UTF-8"> -->
					<form action="checkUserRegisterServlet" method="post" accept-charset="UTF-8">
						<table>
							<tr>
								<td>用户名：</td>
								<td><input type="text" name="username" id="username" class="register_input" onchange="sendRequest();"/></td>
								<span id="count" style="color:#ff0000;"></span>
							</tr>
							<tr>
								<td>密&nbsp;&nbsp;&nbsp;码：</td>
								<td><input type="password" name="password" id="password" class="register_input"/></td>
							</tr>
							<tr>
								<td>性&nbsp;&nbsp;&nbsp;别：</td>
								<td>男<input type="radio" name="gender" value="male" />&nbsp;&nbsp;&nbsp;&nbsp;
									女<input type="radio" name="gender" value="female" /></td>
							</tr>
							<tr>
								<td>个人简介：</td>
								<td><textarea name="resume" rows="5" cols="30" style="resize: none;"></textarea></td>
							</tr>
						</table><br>
						<input type="submit" value="提交" id="form_btn" /><br><br>
					</form>
				</div>
				<div id="tologin">已有账号？<a href="userLogin.jsp">登录</a></div>
			<!-- main end -->
			</div>
			<script>
				var massage = "${massage}";
				if((massage!="")&&(massage!=null)){
					alert(massage);
				}
			</script>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>
