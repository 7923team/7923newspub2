package news.beans;
import news.mapper.UserMapper;
import news.mapper.W_statMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
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
//        ArrayList<User> user = new ArrayList<User>();
              User user = new User(uName,up);

        boolean result = false;
//        Connection conn = null;
//        ResultSet rs = null;
//
//        PreparedStatement ps = null;  //PreparedStatement对象法，实现登录用户查询
//        boolean result;
        try{
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            if (userMapper.finduser(user) != null){
//            conn = DBGet.getConnection();
//            String sql = "select * from user where username=? and password=?";
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, uName);
//            ps.setString(2, up);
//            rs = ps.executeQuery();
//            if(rs != null && rs.next()){
                result = true;
            }
        }catch(IOException e){
         e.printStackTrace();
//        }finally{
//            DBGet.closeConnection(conn);
        }
        return result;
    }



    /**
     * 新用户注册
     * @param user
     * @return
     */
    public boolean addUser(User user) {
        boolean result = false;
//        User user1 = new User(user);
//        int n = 0;
//        Connection conn = null;
//
//        PreparedStatement ps = null;  //PreparedStatement对象法，实现注册用户
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            if (userMapper.addUser(user) >= 1) {
                result = true;
            }
            session.commit();
            session.close();
//            conn = DBGet.getConnection();
//            String sql = "INSERT INTO user VALUES(null,?,?,?,?)";
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, user.getUsername());
//            ps.setString(2, user.getPassword());
//            ps.setString(3, user.getGender());
//            ps.setString(4, user.getResume());
//            n = ps.executeUpdate();
        } catch (IOException e) {
            e.printStackTrace();
//        } finally {
//            DBGet.closeConnection(conn);
//        }
        }
        return result;
    }


    /**
     * 检查用户名是否已经存在（点击“注册提交”用）
     */
    public boolean checkUser(String username) {
        boolean result = false;
//        Connection conn = null;
//        ResultSet rs = null;
//        Statement stmt = null;
        User user = new User(username);
        try{
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            if (userMapper.findusername(user) != null){
//            conn = DBGet.getConnection();
//            stmt = conn.createStatement();
//            String sql = "select * from user where username = '"+username+"'";
//            rs = stmt.executeQuery(sql);
//            while(rs.next()){
//                result = true;
                result = true;
            }
        }catch(IOException e){
        e.printStackTrace();
    }
//        }finally{
//            DBGet.closeConnection(conn);
//        }
        return result;
    }


    /**
     * 查询所有用户的用户名
     * @return
     */
    public ArrayList<User>getAllUser(){
//        User user = null;
        ArrayList<User> userList = new ArrayList<User>();
//
//        Connection conn = null;
//        ResultSet rs = null;
//        Statement stmt = null;
        try{
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            UserMapper userMapper = session.getMapper(UserMapper.class);
            userList = userMapper.userlist();

//            conn = DBGet.getConnection();
//            stmt = conn.createStatement();
//            String sql = "select * from user";
//            rs = stmt.executeQuery(sql);
//            while(rs.next()){
//                user = new User();
//                user.setId(rs.getInt("id"));
//                user.setUsername(rs.getString("username"));
//                if (user.getUsername().equals("admin")){
//                    continue;
//                }
//                userList.add(user);

        }catch(IOException e) {
            e.printStackTrace();
        }
//        }finally{
//            DBGet.closeConnection(conn);
//        }
        return userList;
    }

}