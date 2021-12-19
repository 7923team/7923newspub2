package news.beans;

import java.util.ArrayList;
// import java.util.List;
import java.sql.*;

public class NewstypeDAO {
    public ArrayList<Newstype>getAllNewstype(){
        Newstype newstype = null;
        ArrayList<Newstype>newstypesList = new ArrayList<Newstype>();
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from newstype";
            rs = stmt.executeQuery(sql);

            while(rs.next()){
                newstype = new Newstype();
                newstype.setId(rs.getInt("id"));
                newstype.setNewstype(rs.getString("newstype"));
                newstypesList.add(newstype);
            }
        }catch(SQLException el){
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return newstypesList;
    }
}
