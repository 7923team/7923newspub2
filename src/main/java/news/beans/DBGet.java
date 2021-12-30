package news.beans;
import java.sql.*;
public class DBGet{
    static String sDBDriver = "com.mysql.jdbc.Driver";
    static String sConnStr = "jdbc:mysql://localhost:3306/newsdb?characterEncoding=UTF-8";
    static String username = "root";
    static String password = "mysql";

    // 返回Connection对象
    public static Connection getConnection(){
        Connection conn = null;
        try{
            Class.forName(sDBDriver);
            conn = DriverManager.getConnection(sConnStr,username,password);
        }catch(ClassNotFoundException ex){
            System.out.println(ex.getMessage());
        }catch(SQLException ex){
            System.out.println(ex.getMessage() + "dbget");
        }
        return conn;
    }

    //关闭Connection对象
    public static void closeConnection(Connection conn){
        try{
            if(conn != null){
                conn.close();
            }
        }catch(SQLException ex){
            System.out.println(ex.getMessage());
        }
    }
}