<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="news.beans.News"%>
<%-- 引入外部标记库 --%>
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
		<link rel="stylesheet" type="text/css" href="css/dispNews.css" />
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
                String id = request.getParameter("id");
                newsDAO.increaseAc(id);
                News news = newsDAO.getByID(id);
            %>
			<div class="news_disp">
                <h2><%=news.getTitle()%></h2>
                <div class="news_time">
                    <span class="left-t"><%=news.getPubtime()%></span>
                    <span class="right-t">(点击：<%=news.getAcnumber()%>)
                        <img src="image/1.svg">
                        <a href="comment?action=disp&newsid=<%=news.getId()%>">查看评论</a>
                    </span>
                    <div class="clear"></div>
                </div>
                <!-- 正文 start -->
                <div class="left_zw" style="position: relative;">
                    <%=news.getContent()%>
                </div>
                <!-- 相关新闻 -->
				<div class="div624 border-top-darshd">
					<h4 class="padding-left20" style="margin-top: 0px; color: rgb(30, 80, 162);">
						<img src="image/titlebg2.svg" />&nbsp;&nbsp;相关新闻：
					</h4>
					<ul class="padding-left20" style="margin-top: -20px;">
						<%
							request.setAttribute("relateNews",newsDAO.getRelate(id));
						%>
						<c:forEach items="${requestScope.relateNews}" var="rnews">
							<li>.<a href="dispNews.jsp?id=${rnews.id}">${rnews.title}</a></li>
						</c:forEach>
					</ul>
				</div>
                <!-- 相关新闻结束 -->
            </div>
            <!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="../common/bottom.txt"%>
	</body>
</html>
