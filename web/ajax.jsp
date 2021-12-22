<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="news.beans.User"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="userDAO" class="news.beans.UserDAO" scope="page"/>

<%
	ArrayList<User>userList = userDAO.getAllUser();
	boolean bl = false;
	
    //设置输出信息的格式及字符集
    response.setContentType("text/xml; charset=UTF-8");
    response.setHeader("Cache-Control","no-cache");
	String name=request.getParameter("XM");

	for(User user:userList){
		if(name.equals(user.getUsername()) || name.equals("admin")){
			bl = true;
		}
	}

	if((name=="") || (name==null)){
		out.println("请输入用户名");
	}
	else{
		if(bl){
			out.println("该用户名已存在，请更换！");
		}else{
			out.println("用户名不存在，可以使用");
		}
	}
%>