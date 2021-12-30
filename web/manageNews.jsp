<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="news.beans.News"%>
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
				<jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
                    <%
                        ArrayList<News>newsList = newsDAO.getAllNews();
                            request.setAttribute("newsList",newsList);
                            //将查询到的newsList放到request请求域中
                    %>
                    <div class="news_list">
                        <div class="top-bar">
                            <h1>新闻管理</h1>
                            <span style="float: right; margin-right: 40px; background-color: gainsboro;">
                                <a href="addNews.jsp" style="text-decoration: none;">发布新闻</a>
                            </span>
                        </div>
                        <div class="table">
                            <table class="listing" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th class="first" width="40">序号</th>
                                    <th>新闻标题</th>
                                    <th>发布时间</th>
                                    <th>修改</th>
                                    <th>删除</th>
                                </tr>
                                
                                <!-- 对newsList进行循环处理 -->
                                <c:forEach var="news" items="${newsList}" varStatus="status">
                                    <tr>
                                        <td>${status.count}</td>
                                        <td class="title">
                                            <a href="dispNews.jsp?id=${news.id}">
                                                ${news.title}
                                            </a>
                                        </td>
                                        <td class="ntime">${news.pubtime}</td>
                                        <td>
                                            <a href="modiNews.jsp?id=${news.id}">
                                                <img src="image/edit-icon.svg" width="16" height="16" alt="修改"/>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="javascript:if(confirm('确认删除此新闻？删除后将无法恢复')) location.href='deleteNews.jsp?id=${news.id}'">
                                                <img src="image/hr.svg" width="16" height="16" alt="删除"/>
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