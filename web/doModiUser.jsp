<%--@include file="checkvalid.jsp"--%>
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
                <%request.setCharacterEncoding("UTF-8");%>
                <jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"/>
                <jsp:useBean id="user" class="news.beans.User" scope="page"/>
                <jsp:setProperty name="user" property="*"/>
                <%
                    boolean bl = userDAO.modiUser(user);
                %>
                <div class="inputform">
					<div class="top-bar">
						<h1>操作提示</h1>
					</div><br>
                    <%
                        if(bl){
                            out.println("用户修改成功，请继续使用。");
                        }else{
                            out.println("用户修改失败，请联系管理员！");
                        }
                        out.println("单击<a href='index.jsp'>回到首页</a>");
                    %>
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
    </html>