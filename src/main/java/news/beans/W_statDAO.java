package news.beans;

import news.mapper.W_statMapper;
import news.beans.W_stat;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class W_statDAO {
    /**
     * 查询所有高频词
     * @return
     */
    public ArrayList<W_stat> getAllWord(){
        ArrayList<W_stat> wStatsList = new ArrayList<W_stat>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            W_statMapper w_statMapper = session.getMapper(W_statMapper.class);
            wStatsList = w_statMapper.wstatlist();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return wStatsList;
//        Connection conn = null;
//        ResultSet rs = null;
//        Statement stmt = null;
//        try{
//            conn = DBGet.getConnection();
//            stmt = conn.createStatement();
//            String sql = "select * from w_stat";
//            rs = stmt.executeQuery(sql);
//            while(rs.next()){
//                wStat = new W_stat();
//                wStat.setId(rs.getInt("id"));
//                wStat.setName(rs.getString("name"));
//                wStat.setNum(rs.getString("num"));
//                wStatsList.add(wStat);
//            }
//        }catch(SQLException el){
//            System.out.println(el+"dao");
//        }finally{
//            DBGet.closeConnection(conn);
//        }
    }
}
