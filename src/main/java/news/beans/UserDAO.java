package news.beans;
import java.sql.*;
import java.util.ArrayList;

public class UserDAO{

    /**
     * 查询登录用户
     * @param uName
     * @param up
     * @return
     */
    public boolean queryByNamePwd(String uName, String up){
        boolean result = false;
        Connection conn = null;
        ResultSet rs = null;

        PreparedStatement ps = null;  //PreparedStatement对象法，实现登录用户查询
        try{
            conn = DBGet.getConnection();
            String sql = "select * from user where username=? and password=?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, uName);
            ps.setString(2, up);
            rs = ps.executeQuery();
            if(rs != null && rs.next()){
                result = true;
            }
        }catch(SQLException el){
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return result;
    }


    /**
     * 新用户注册
     * @param user
     * @return
     */
    public boolean addUser(User user){
        boolean result = false;
        int n = 0;
        Connection conn = null;

        PreparedStatement ps = null;  //PreparedStatement对象法，实现注册用户
        try {
            conn = DBGet.getConnection();
            String sql = "INSERT INTO user VALUES(null,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getGender());
            ps.setString(4, user.getResume());
            n = ps.executeUpdate();
        } catch (SQLException el) {
            System.out.println(el + "dao");
        } finally {
            DBGet.closeConnection(conn);
        }
        if(n > 0) {
            result = true;
        }
        return result;
    }


    /**
     * 检查用户名是否已经存在（点击“注册提交”用）
     */
    public boolean checkUser(String username) {
        boolean result = false;
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from user where username = '"+username+"'";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                result = true;
            }
        }catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return result;
    }


    /**
     * 查询所有用户的用户名
     * @return
     */
    public ArrayList<User>getAllUser(){
        User user = null;
        ArrayList<User> userList = new ArrayList<User>();
        
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from user";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                if (user.getUsername().equals("admin")){
                    continue;
                }
                userList.add(user);
            }
        }catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return userList;
    }

}