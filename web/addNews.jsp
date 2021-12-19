<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="news.beans.Newstype"%>
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
		<link rel="stylesheet" type="text/css" href="css/addNews.css" />
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
				<jsp:useBean id="newstypeDAO" class="news.beans.NewstypeDAO" scope="page"/>
				<%
					ArrayList<Newstype>newstypeList = newstypeDAO.getAllNewstype();
				%>
				<div class="top-bar">
					<h1>新闻发布</h1>
				</div>
				<div class="inputform">
					<form action="doAddNews.jsp" method="post" accept-charset="UTF-8">
						<input type="hidden" name="author" value="<%=session.getAttribute("username")%>"/>
							<br>标题：<input type="text" name="title" id="title"/><br><br>
						类别：
						<select name="newstype">
							<%
								for(Newstype newstype : newstypeList){
							%>
									<option value="<%=newstype.getId()%>">
										<%=newstype.getNewstype()%>
									</option>
							<%  }  %>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						关键字：<input type="text" name="keyword" id="keword"/><br><br>
						内容：<textarea name="content" id="content_area"></textarea>
							<br><br>
						<input type="submit" value="发布" id="form_btn">
					</form>
				</div>
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt"%>
	</body>
</html>
