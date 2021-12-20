<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtnl1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%--<%--%>
<%--	Process process = Runtime.getRuntime().exec("python python/demo4.py");--%>
<%
	Process proc = Runtime.getRuntime().exec("cmd /c python "+"D:/IdeaProjects/7923newspub2/web/python/"+"demo4.py");    //filepath是test.py的地址。可以取相对地址，以项目所在地址为根目录
	proc.waitFor();
%>
	<%--Process process = Runtime.getRuntime().exec("cmd.exe /k start python \"G:\\Java Idea Projects\\7923newsPub2\\web\\python\\python\\demo4.py\"");--%>
<%--	Process process = Runtime.getRuntime().exec("cmd.exe");--%>
<%--%>--%>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="image/icon.svg">
		<title>新闻发布系统 V20</title>
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<script src="js/fun.js" type="text/javascript" charset="UTF-8"></script>
	</head>

	<body>
		<jsp:include page="common/top.jsp" />
		<div id="content">
			<div id="sidebar">
				<jsp:include page="common/left.jsp" />
			</div>
			<div id="main">
			<!-- main begin -->
				<div id="news_list">
					<h1>新闻列表</h1>
					<script type="text/javascript">
						showTime();
					</script>
					<ul id="news_ul">
						<c:forEach items="${requestScope.newsList}" var="news">
							<a href="dispNews.jsp?id=${news.id} ">
								<li>
									<div class="dd_lm">[${news.nt}]</div>
									<div class="dd_bt">
											${news.title}
									</div>
									<div class="dd_time">${news.pubtime}</div>
								</li>
							</a>
						</c:forEach>
						<hr style="margin: 0; padding: 0; height: 0px; border-top: 1px gray dotted; border-bottom: none;">
					</ul>
				</div>
				<c:if test="${pageCount>0}">
					<br/>
					<div id="page_Number">
						共有${pageCount}页，这是第${pageNo}页。
						<c:if test="${pageNo>1}">
							<a href="news?pageNo=1">第一页</a>&nbsp;&nbsp;
							<a href="news?pageNo=${pageNo-1}">上一页</a>&nbsp;&nbsp;
						</c:if>
						<c:if test="${pageNo!=pageCount}">
							<a href="news?pageNo=${pageNo+1}">下一页</a>&nbsp;&nbsp;
							<a href="news?pageNo=${pageCount}">最后一页</a>
						</c:if>
					</div>
				</c:if>

				<c:if test="${pageCount==0}">
					<p id="no_news">
						目前没有新闻
					</p>
				</c:if>
				
			<!-- main end -->
			</div>
			<script type="text/javascript">
				showTime();
			</script>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt"%>
	</body>

</html>
