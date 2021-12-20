<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="logo">
	<div id="logo_main"><h1><span>7923新闻</span> v20</h1></div>
	<span id="myspan" style="color: white; float: right; margin-right: 18px; ">时间内容</span>
	<script type="text/javascript">
		showTime();
	</script>
</div>
<div id="menu">
	<div id="user">
		<c:choose>
			<c:when test="${empty sessionScope.username}">
				<a href="userLogin.jsp">用户登录</a>
			</c:when>
			<c:otherwise>
				当前用户：<c:out value="${sessionScope.username}"></c:out>
				|<a href="doLogout.jsp">退出登录</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	<div id="menu_list">
		<ul>
			<c:if test="${!empty sessionScope.username}">
				<c:choose>
					<c:when test="${sessionScope.username=='admin'}">
						<li><a href="manageNews.jsp">新闻管理</a></li> |
						<li><a href="comment?action=manage">评论管理</a></li> |
						<li><a href="manageUser.jsp">用户管理</a></li> |
					</c:when>
					<c:otherwise>
						<li><a href="comment?action=usermanage&username=${sessionScope.username}">评论管理</a></li> |
						<li><a href="modiUser.jsp">用户管理</a></li> |
					</c:otherwise>
				</c:choose>
			</c:if>
						<li><a href="ciYunServlet">新闻词云</a></li> |
						<li><a href="index.jsp">首 页</a></li>
		</ul>
	</div>
</div>
