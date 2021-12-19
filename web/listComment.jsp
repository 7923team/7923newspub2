<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtnl1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="icon" href="image/icon.svg">
		<title>新闻发布系统 V2.0</title>
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/listComment.css" />
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
				<div class="main_top">
					<h2><a href="dispNews.jsp?id=${requestScope.news.id}">
							${requestScope.news.title}
						</a>
					</h2>
					<span class="jjs">
						网友评论仅供网友表达个人看法，并不表明本网站同意其观点或证实其描述
					</span>
					<div class="blank8"></div>

					<div class="fbpl">
						<span class="fd"><img src="image/zt2.png" ></span>
						<span class="fd" style="padding: 3px 0px 0px 8px;">发表评论</span>
						<span class="fdr" style="padding-right: 12px;">
							<input type="button" id="btnSubmitBottom" onclick="form_pl.submit()" value="发表评论"/>
						</span><br><br>

						<form id="form_pl" action="comment" method="post">
							<input type="hidden" name="action" value="add">
							<input type="hidden" name="newsid" value="${requestScope.news.id}">
							<input type="hidden" name="commentauthor" value="${sessionScope.username}">
							<textarea name="comment" id="commentMessage" name="message"></textarea>
						</form>
					</div>
				</div>
				
				<div class="yc"></div>

				<div class="mian">
					<span id="mian_span">原创评论</span>
					<div class="blank9"></div>
					<c:forEach items="${requestScope.commentList}" var="comment">
						<div class="nr">
							<img class="fd" src="image/an16.png" style="width: 15px;">
							<span class="fd">评论人：[${comment.commentauthor}]</span>
							&nbsp;&nbsp;${comment.commenttime}&nbsp;&nbsp;
							<div class="blank0"></div>
							<!-- sub comment start -->
							<div style="line-height: 22px; text-indent: 24px;
									overflow: hidden; font-size: 14px;
									word-break: break-all; word-wrap: break-word;"
									class="comment_p">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								${comment.comment}
							</div>
							<!-- sub comment end -->
							<div class="blank8"></div>
						</div>
					</c:forEach>
				</div>
			<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
</html>