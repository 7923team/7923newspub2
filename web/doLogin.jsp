<%@page language="java" contentType="text/html;charset=UTF-8"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"/>
<%
	String uName = request.getParameter("username");
	String pwd = request.getParameter("password");
	out.print(uName);
	if(userDAO.queryByNamePwd(uName,pwd)){
		session.setAttribute("username",uName);
		response.sendRedirect("index.jsp");   //使用JSP的内置对象转向到index.jsp
	}
	else{
		response.sendRedirect("userLogin.jsp");
	}
%>


