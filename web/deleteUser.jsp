<%--@include file="checkvalid.jsp"--%>
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
				<!-- 1.导入JDBC API -->
				<%@page language="java" import="java.sql.*"%>
                
				<!-- main begin -->
				<div class="inputform">
					<div class="top-bar">
						<h1>操作提示</h1>
					</div><br>
					<%
						Connection conn = null;
						Statement stmt = null;

						String sDBDriver = "com.mysql.jdbc.Driver";
						String sConnStr = "jdbc:mysql://localhost:3306/newsdb2?characterEncoding=UTF-8";
						String username = "root";
						String password = "sblive15s0323";
						String id = null;

						id = request.getParameter("id");

						//2.装载驱动程序
						try{
							Class.forName(sDBDriver);
						}
						catch(ClassNotFoundException ex){
							System.err.println(ex.getMessage());
						}

						try{
							//3.建立数据库连接
							conn = DriverManager.getConnection(sConnStr,username,password);

							/*
								//4.创建Statement对象
								stmt = conn.createStatement();

								//5.执行SQL语句
								String sql = "DELETE FROM user WHERE id="+id;
								int result = stmt.executeUpdate(sql);
							*/

							String sql = "DELETE FROM user WHERE id=?";
							PreparedStatement ps = conn.prepareStatement(sql);
							ps.setString(1,id);
							int result = ps.executeUpdate();

							//6.处理结果
							if(result == 1){
								response.sendRedirect("manageUser.jsp");
							}else{
								out.println("删除用户***失败***，请联系管理员！");
							}
							out.println("单击<a href='index.jsp'>回到首页</a>");
						}catch(SQLException el){
							out.println(el);
						}finally{
							//7.关闭连接
							conn.close();
						}
					%>
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
</html>