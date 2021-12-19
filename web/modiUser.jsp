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
		<link rel="stylesheet" type="text/css" href="css/modiUser.css" />
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
				<%
					Connection conn = null;
					ResultSet rs = null;
					Statement stmt = null;
					String sql = null;

					String sDBDriver = "com.mysql.jdbc.Driver";
					String sConnStr = "jdbc:mysql://localhost:3306/newsdb?characterEncoding=UTF-8";
					String username = "root";
					String password = "mysql";

					int id=0;
					String uname=null,upwd=null,gender=null,resume=null;
					uname = (String)session.getAttribute("username");

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

						//4.创建Statement对象
						//stmt = conn.createStatement();

						//5.执行SQL语句
						//String sql = "SELECT * FROM user WHERE username='"+uname+"'";
						//rs = stmt.executeQuery(sql);

						//用PreparedStatement对象
						sql = "SELECT * FROM user WHERE username=?";
						PreparedStatement ps = conn.prepareStatement(sql);
						ps.setString(1,uname);
						rs = ps.executeQuery();
					

						//6.处理结果
						if(rs!=null && rs.next()){
							id=rs.getInt(1);
							upwd = rs.getString("password");
							gender = rs.getString("gender");
							resume = rs.getString("resume");
						}
					}catch(SQLException el){
						out.println(el);
					}finally{
						//7.关闭连接
						conn.close();
					}
				%>
				<div class="top-bar">
					<h1>用户管理</h1>
				</div><br>
				<div class="inputform">
					<fieldset>
						<legend>修改用户信息</legend>
						<form action="doModiUser.jsp" method="post" accept-charset="UTF-8">
							<input type="hidden" name="id" value="<%=id%>">
							用户名：<input type="text" name="username" value="<%=uname%>" class="modi_input"><br>
							密&nbsp;&nbsp;&nbsp;码：<input type="password" name="password" value="<%=upwd%>" class="modi_input"><br>
							性&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%if("male".equals(gender)){%>
								男<input type="radio" value="male" name="gender" checked/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								女<input type="radio" value="female" name="gender" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<%}else{%>
								男<input type="radio" value="male" name="gender" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								女<input type="radio" value="female" name="gender" checked/>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
							<%}%>
							个人简介<textarea name="resume" id="textarea"><%=resume%></textarea><br>
							&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<br>
							<input type="submit" value="修改" id="form_btn"><br>
						</form>
					</fieldset>
				</div>
				<!-- main end -->
			</div>
		</div>
		<div class="blank20"></div>
		<div class="blank10"></div>
		<%@include file="common/bottom.txt" %>
	</body>
	</html>