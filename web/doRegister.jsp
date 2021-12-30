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
				<div class="inputform">
					<div class="top-bar">
						<h1>操作提示</h1>
					</div><br>

                    <jsp:useBean id="userDao" class="news.beans.UserDAO" scope="page"/>
                    <jsp:useBean id="user" class="news.beans.User" scope="page"/>

                    <%
                        request.setCharacterEncoding("UTF-8");
                    %>
                    <jsp:setProperty name="user" property="*"/>
                    <div class="do_tip">
						<%
							if(user.getUsername()==null || user.getUsername()==""){
								out.println("<span>非法操作！用户名不能为空！</span>请重新注册。");
								out.println("<a href='userRegister.jsp'>返回注册页</a>");
							}else if (user.getPassword()==null || user.getPassword()==""){
								out.println("<span>非法操作！密码不能为空！</span>请重新注册。");
								out.println("<a href='userRegister.jsp'>返回注册页</a>");
							}else {
								if(userDao.addUser(user)){
									out.println("用户注册成功，请登录使用。");
									out.println("<a href='userLogin.jsp'>登录</a>");
								}else{
									out.println("用户注册失败，请联系管理员！");
									out.println("<a href='index.jsp'>返回首页</a>");
								}
							}

						%>
					</div>
                    
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
    </html>