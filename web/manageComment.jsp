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
				<!-- main begin -->
                <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
				<div class="news_list">
					<div class="top-bar">
						<h1>评论管理</h1>
                        <div class="breadcrumbs"></div>
					</div><br>

					<table class="listing" cellpadding="0" cellspacing="0">
                        <tbody>

							<!-- 当前用户的评论内容为空 -->
							<c:if test="${requestScope.commentList=='[]'}">
								<div style="margin: 0px auto; text-align: center; padding-top: 80px;">
									<img src="image/noData.png" alt="暂无数据" style="width: 8%;">
								</div>
								<p style="margin:20px auto; text-align: center; color: #808080;">暂无相关数据，快去进行评论吧！</p>
							</c:if>

							<!-- 当前用户的评论不为空 -->
                            <c:if test="${requestScope.commentList!='[]'}">
								<c:forEach items="${requestScope.commentList}" var="comt">
									<tr>
										<td>
											to:<a href="dispNews.jsp?id=${comt.newsid}">${comt.newsid}</a>
										</td>
										<td style="text-align: left;">${comt.comment}</td>
										<td>[by:${comt.commentauthor}]</td>
										<td>in:${comt.commenttime}</td>
										<td with="50">
											<a href="comment?action=del&username=${sessionScope.username}&id=${comt.id}" 
												onclick="return confirm('确定删除吗？')">
												<img src="image/hr.svg" width="16" height="16" alt="删除">
											</a>
										</td>
									</tr>
								</c:forEach>
							</c:if>

                        </tbody>
                    </table>
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
</html>