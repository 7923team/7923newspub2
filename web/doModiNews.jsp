<%@include file="checkvalid.jsp"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="news.beans.News"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="newsDAO" class="news.beans.NewsDAO" scope="page"/>
<jsp:useBean id="news" class="news.beans.News" scope="page"/>
<jsp:setProperty name="news" property="*"/>
<%
    boolean success = newsDAO.modify(news);
    request.setAttribute("success",success);
%>
<c:choose>
    <c:when test="${success}">
        <div style="text-align: center; margin-top: 15%;">
            新闻修改成功，单击返回 <a href="manageNews.jsp">新闻管理页面</a>
        </div>
    </c:when>
    <c:otherwise>
        <div>
            <span style="color: red;">新闻修改失败，请联系管理员！</span><br><br>
            单击返回<a href="manageNews.jsp">新闻管理页面</a>
        </div>
    </c:otherwise>
</c:choose>