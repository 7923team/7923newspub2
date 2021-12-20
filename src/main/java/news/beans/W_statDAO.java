package news.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class W_statDAO {
    /**
     * 查询所有高频词
     * @return
     */
    public ArrayList<W_stat> getAllWord(){
        W_stat wStat = null;
        ArrayList<W_stat> wStatsList = new ArrayList<W_stat>();

        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from w_stat";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                wStat = new W_stat();
                wStat.setId(rs.getInt("id"));
                wStat.setName(rs.getString("name"));
                wStat.setNum(rs.getString("num"));
                wStatsList.add(wStat);
            }
        }catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return wStatsList;
    }

}
