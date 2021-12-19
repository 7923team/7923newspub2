<%@page language="java" contentType="text/html;charset=UTF-8"%>
<!-- 1.导入 JDBC API -->
<%@page language="java" import="java.sql.*"%>
<html>
    <head>
        <link rel="icon" href="image/icon.svg">
        <title>新闻发布系统</title>
    </head>
    <body>
        <h3>所有用户</h3>
        <table border="1">
            <tr>
                <th>序号</th>
                <th>用户名</th>
                <th>密码</th>
            </tr>
            <%
                Connection conn = null;
                ResultSet rs = null;
                Statement stmt = null;

                String sDBDriver = "com.mysql.jdbc.Driver";
                String sConnStr = "jdbc:mysql://localhost:3306/newsdb2?characterEncoding=UTF-8";
                String username = "root";
                String password = "sblive15s0323";

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
                    //String sql = "SELECT * FROM user";
                    //rs = stmt.executeQuery(sql);

                    //用PreparedStatement对象
                    String sql = "SELECT * FROM user";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();


                    //6.处理结果
                    if(rs != null){
                        int count = 0;
                        while(rs.next()){
                            count++;
                            String uname = rs.getString("username");
                            String pwd = rs.getString("password");
            %>
                            <tr>
                                <td><%=count%></td>
                                <td><%=uname%></td>
                                <td><%=pwd%></td>
                            </tr>
            <%
                        }
                    }
                }catch(SQLException el){
                    out.println(el);
                }finally{
                    //7.关闭连接
                    conn.close();
                }
            %>
        </table>
    </body>
</html>