<%@ page language="java" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>新闻发布系统V2</title>
		<style>
			td {
				border: 1px solid gray;
				text-align: left;
				padding: 2px 10px;
			}

			table {
				border-collapse: collapse;
				margin:0 auto;
			}

			body {
				text-align: center;
			}

			a {
				text-decoration: none
			}
		</style>
	</head>
	<body>
		<h3>
			新闻列表
		</h3>
		<c:if test="${pageCount>0}">
			共有${pageCount}页，这是第${pageNo}页。
  			<c:if test="${pageNo>1}">
				<a href="news?pageNo=1">第一页</a>
				<a href="news?pageNo=${pageNo-1}">上一页</a>
			</c:if>
			<c:if test="${pageNo!=pageCount}">
				<a href="news?pageNo=${pageNo+1}">下一页</a>
				<a href="news?pageNo=${pageCount}">最后一页</a>
			</c:if>
			<table>
				<c:forEach items="${requestScope.newsList}" var="news">
					<tr>
						<td>[${news.nt}]</td>
						<td>${news.title}</td>
						<td>${news.pubtime}</td>
					</tr>
				</c:forEach>
			</table>
			<br/>
		</c:if>
		<c:if test="${pageCount==0}">
			<p>
				目前没有新闻
			</p>
		</c:if>
	</body>
</html>
