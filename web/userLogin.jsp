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
		<link rel="stylesheet" type="text/css" href="css/userLogin.css" />
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
		<script src="https://ssl.captcha.qq.com/TCaptcha.js"></script>
		<script>
			var captcha;

			window.onload = ()=>{
				captcha = new TencentCaptcha('2050218025', (res)=>{
					if(res.ret === 0 && res.ticket) {
						document.formlogin.submit();
					}
				});
			}

			function login()
			{
				var username = document.getElementById("username").value;
				var password = document.getElementById("password").value;
				if (username.length == 0) {
					alert("请输入用户名！")
					return false;
				}
				if (password.length == 0) {
					alert("请输入密码！");
					return false;
				}
				captcha.show();
			}
		</script>

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
					<h1>用户登录</h1>
				</div>
				<div class="inputform">
					<br><br>
<%--					<form action="checklogin" method="post" onsubmit="return checkform()" name="formlogin" accept-charset="UTF-8">--%>
					<form action="doLogin.jsp" method="post" name="formlogin" accept-charset="UTF-8">
						用户名：<input type="text" name="username" id="username" value="${param.username}"/><br>
						<br>
						密 &nbsp;&nbsp;码：<input type="password" name="password" id="password" value="${param.password }"/><br>
<%--						<div style="margin-top: 16px; height: 36px;">--%>
<%--							验证码：<input type="text"  name="yzm" style="width: 92px; height: 24px;"/>--%>
<%--							<span>--%>
<%--								<img border="1" src="image" style="width: 62px;" />--%>
<%--								<input type="submit" value="换一张" onclick="formlogin.action='refresh'" >--%>
<%--							</span>--%>
<%--						</div>--%>
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%--						<input type="submit" value="登录" id="login_btn"/>&nbsp;--%>
						<input type="button" value="登录" onclick="login()" id="login_btn">
						<a href="userRegister.jsp">用户注册</a>
						<br>
						<div id="info" style="color: #ff0000; margin-top: 15px;">${info}</div>
					</form>
				</div>
			<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>