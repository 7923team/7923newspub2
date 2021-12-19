<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="news.beans.News"%>
<%@page import="news.beans.NewsDAO"%>
<%@page import="news.beans.Comment"%>
<%@page import="news.beans.CommentDAO"%>
<%@page import="java.util.ArrayList"%>

<%-- 
  * 页面左侧栏“站内检索”模块，
  * 可根据新闻关键字实现对新闻的检索
--%>
<div class="sidesec">
	<div class="sidesec_bt">
		<a href="#"><span>站内检索</span></a>
	</div>
	<hr>
	<div class="sideform">
		<form action="news" method="get" id="formQ" accept-charset="UTF-8">
			<div id="leftdiv">
				<input type="hidden" value="query" name="action" />
				<input type="text" name="keyword" id="q" value="请输入关键字" onfocus="clearinput(this)"
					onblur="setinput(this)" />
			</div>
			<div id="rightdiv">
				<input type="button" value="搜索" id="submitBtn" name="submitBtn" onclick="formQ.submit()">
			</div>
		</form>
	</div>
</div>


<%-- 
  * 页面左侧栏“热点新闻”模块
  * 1、将点击量最高的五条新闻查出并放入request作用域中
  * 2、利用循环将查出的五条新闻从request作用域中取出，并将这五条新闻的标题显示在左侧栏的“热点新闻”模块
--%>
<%
	NewsDAO newsDAO = new NewsDAO();
	ArrayList<News> topNews = new ArrayList<News>();
	topNews = newsDAO.getTopNews5();
	request.setAttribute("topNews", topNews);
%>
<div class="sidesec">
	<div class="sidesec_bt">
		<a href="#"><span>热点新闻</span></a>
	</div>
	<hr>
	<div class="sidesec_list">
		<c:if test="${requestScope.topNews==null}">
			<p style="margin:77px auto; text-align: center; color: grey;">暂无内容</p>
		</c:if>
		<c:if test="${requestScope.topNews!=null}">
			<ul>
				<c:forEach items="${requestScope.topNews}" var="news">
					<li>
						.<a href="dispNews.jsp?id=${news.id}">
							${news.title}
						</a>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>


<%-- 
  * 页面左侧栏“最新评论”模块
  * 1、将最新的五条评论信息查出并放入request作用域中
  * 2、利用循环将查出的五条评论从request作用域中取出，并将这五条评论的内容显示在左侧栏的“最新评论”模块
--%>
<%
	CommentDAO commentDAO = new CommentDAO();
	ArrayList<Comment> newComment = new ArrayList<Comment>();
	newComment = commentDAO.getTop5();
	request.setAttribute("newComment", newComment);
%>
<div class="sidesec">
	<div class="sidesec_bt">
		<a href="#"><span>最新评论</span></a>
	</div>
	<hr>
	<div class="sidesec_list">
		<c:if test="${requestScope.newComment==null}">
			<p style="margin:77px auto; text-align: center; color: grey;">暂无内容</p>
		</c:if>
		<c:if test="${requestScope.newComment!=null}">
			<ul>
				<c:forEach items="${requestScope.newComment}" var="comment">
					<li>
						.<a href="dispNews.jsp?id=${comment.newsid}">
							${comment.comment}
						</a>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
</div>
