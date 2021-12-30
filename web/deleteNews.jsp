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
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
	</head>

	<body>
		<jsp:include page="common/top.jsp" />
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp" />
			</div>
			<div id="main">
				<%@ page import="news.beans.NewsDAO" %>

				<!-- main begin -->
				<div class="inputform">
					<div class="top-bar">
						<h1>操作提示</h1>
					</div><br>
					<%
						String id = request.getParameter("id");
						NewsDAO newsDAO = new NewsDAO();
						boolean bl = newsDAO.deleteNews(id);
						if(bl){
							response.sendRedirect("manageNews.jsp");
						}else{
							out.println("删除新闻失败，请联系管理员！");
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