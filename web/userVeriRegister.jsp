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
		<link rel="stylesheet" type="text/css" href="css/userVeriRegister.css" />
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
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
					<h1>注册确认</h1>
				</div>
				<div class="inputform" >
					<%
						request.setCharacterEncoding("UTF-8");
						String uName = request.getParameter("username");
						String uPwd = request.getParameter("password");
						String uGender = request.getParameter("gender");
						String uResume = request.getParameter("resume");
					%>
					<table cellspacing="0" cellpadding="6">
						<tr>
							<td>用户名：</td><td><%=uName%></td>
						</tr>
						<tr>
							<td>密&nbsp;&nbsp;码：</td><td><%=uPwd%></td>
						</tr>
						<tr>
							<td>性&nbsp;&nbsp;别：</td><td><%=uGender%></td>
						</tr>
						<tr>
							<td>个人简介：</td><td><%=uResume%></td>
						</tr>
					</table>
	
					<form action="doRegister.jsp" method="poet" accept-charset="UTF-8">
						<div style="display: none">
							用户名：<input type="text" name="username" value="<%=uName%>"><br>
							密&nbsp;&nbsp;码：
							<input type="text" name="password" value="<%=uPwd%>"><br>
							性&nbsp;&nbsp;别：
							<input type="text" name="gender" value="<%=uGender%>"><br>
							个人简介<br>
							<textarea name="resume" cols="20" rows="6"><%=uResume%></textarea>
							<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<input class="btn" type="submit" value="注册" id="form_btn">
						<!-- <a href="javacript:history.back(-1)">返回</a><br> -->
						<a href="userRegister.jsp">返回</a><br>
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
