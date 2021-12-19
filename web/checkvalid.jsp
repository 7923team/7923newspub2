<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
    String username=(String)session.getAttribute("username");
    if(username==null){
        Cookie[] cookies = request.getCookies();
        String autologin = null;
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
                if("autologin".equals(cookies[i].getName())){
                    autologin = cookies[i].getValue();
                    break;
                }
            }
        }
        if(autologin == null){
            response.sendRedirect("userLogin.jsp");
        }
    }
%>
