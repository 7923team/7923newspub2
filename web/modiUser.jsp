<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8" %>
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
		<link rel="stylesheet" type="text/css" href="css/modiUser.css" />
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		<jsp:include page="common/top.jsp" />
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp" />
			</div>
			<div id="main">
				<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"/>
				<%@ page import="news.beans.User" %>
				<%@ page import="news.beans.UserDAO" %>
				<!-- main begin -->
				<%
					int id = 0;
					String uname=null,upwd=null,gender=null,resume=null;
					uname = (String)session.getAttribute("username");
					User user = userDAO.getUserByName(uname);

					if(user!=null){
						id = user.getId();
						upwd = user.getPassword();
						gender = user.getGender();
						resume = user.getResume();
					}
				%>
				<div class="top-bar">
					<h1>用户管理</h1>
				</div><br>
				<div class="inputform">
					<fieldset>
						<legend>修改用户信息</legend>
						<form action="doModiUser.jsp" method="post" accept-charset="UTF-8">
							<input type="hidden" name="id" value="<%=id%>">
							用户名：<input type="text" name="username" value="<%=uname%>" class="modi_input"><br>
							密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" value="<%=upwd%>" class="modi_input"><br>
							性&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%if("male".equals(gender)){%>
								男<input type="radio" value="male" name="gender" checked/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								女<input type="radio" value="female" name="gender" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<%}else{%>
								男<input type="radio" value="male" name="gender" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								女<input type="radio" value="female" name="gender" checked/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<%}%>
							个人简介<textarea name="resume" id="textarea"><%=resume%></textarea><br>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>
							<input type="submit" value="修改" id="form_btn"><br>
						</form>
					</fieldset>
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
	</html>