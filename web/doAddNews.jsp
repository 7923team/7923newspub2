<%@include file="checkvalid.jsp"%>
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
		<script src="js/fun.js" type="text/javascript" charset="utf-8"></script>
	</head>
	<body>
		<jsp:include page="common/top.jsp" />
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp" />
			</div>
			<div id="main" style="text-align: center;">
			<!-- main begin -->
				<div class="top-bar">
                    <h1 style="color: red; margin: 21.44px auto; text-align: center;">操作提示</h1>
                </div>
                <br>
                <%
                    request.setCharacterEncoding("UTF-8");
                %>
                <jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
                <jsp:useBean id="news" class="news.beans.News" scope="page"/>
                <jsp:setProperty name="news" property="*"/>
                <div class="do_tip">
					<%
						if(news.getTitle()==null || news.getTitle()=="" || news.getContent()==null || news.getContent()==""){
							out.println("<span>新闻发布失败！新闻标题或新闻内容不能为空！</span>");
							out.println("<br><br>请单击并重新发布：<a href='addNews.jsp'>新闻发布页</a>");
						}else {
							if(newsDAO.insert(news)){
								out.println("新闻发布成功，单击返回<a href='manageNews.jsp'>新闻管理页面</a>");
							}else{
								out.println("新闻发布失败，请联系管理员！");
							}
						}
					%>
				</div>
            <!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="../common/bottom.txt"%>
	</body>
</html>
