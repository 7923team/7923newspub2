<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@page import="java.util.ArrayList"%>
<%@page import="news.beans.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"/>
				<%
					ArrayList<User>userList = userDAO.getAllUser();
						request.setAttribute("userList",userList);
						//将查询到的userList放到request请求域中
				%>
				<div class="news_list">
					<div class="top-bar">
						<h1>用户管理</h1>
					</div><br>
					<div class="table">
						<table class="listing" cellpadding="0" cellspacing="0">
							<tr>
								<th class="first" with="40">序号</th>
								<th>用户名</th>
								<th>删除</th>
							</tr>
							<!-- 对newsList进行循环处理 -->
							<c:forEach var="user" items="${userList}" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td class="title">${user.username}</td>
									<td>
										<a href="deleteUser.jsp?id=${user.id}" onclick="return confirm('确定删除吗？')">
											<img src="image/hr.svg" width="16" height="16" alt="删除">
										</a>
									</td>
								</tr>
							</c:forEach>
						</table>
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