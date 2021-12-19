package news.beans;

import java.util.ArrayList;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsDAO {
    /* 查询所有新闻 */
    public ArrayList<News>getAllNews(){
        News news = null;
        ArrayList<News>newsList = new ArrayList<News>();

        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from news order by id desc";  //为了使主页新闻列表倒序排列，显示最新新闻
            rs = stmt.executeQuery(sql);

            while(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setAuthor(rs.getString("author"));
                news.setPubtime(rs.getString("pubtime"));
                news.setKeyword(rs.getString("keyword"));
                news.setAcnumber(rs.getInt("acnumber"));
                newsList.add(news);
            }
        }catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return newsList;
    }

    /* 插入一条新闻 */
    public boolean insert(News news){
        boolean result = false;
        int n = 0;
        news.setPubtime(getNowStr());
        Connection conn = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "insert into news (title,content,author,pubtime,keyword,newstype)"
                    +"values ('" +news.getTitle()
                    +"','" + news.getContent()
                    +"','" + news.getAuthor()
                    +"','" + news.getPubtime()
                    +"','" + news.getKeyword()
                    +"'," + news.getNewstype()
                    +")";
            n = stmt.executeUpdate(sql);
        }catch(SQLException el){
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        if (n > 0){
            result = true;
        }
        return result;
    }

    /* 以yyyy-MM-dd HH:mm:SS格式返回当前时间字符串 */
    static public String getNowStr(){
        String resultStr = null;
        String pattern = "yyyy-MM-dd HH:mm:ss";
            Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try{
            resultStr = sdf.format(date);
        }catch(Exception e){
            e.printStackTrace();
        }
        return resultStr;
    }

    /* 根据ID查询指定新闻 */
    public News getByID(String id){
        News news = null;
        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try {
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select * from news where id =" + id;
            rs = stmt.executeQuery(sql);
            if(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setAuthor(rs.getString("author"));
                news.setPubtime(rs.getString("pubtime"));
                news.setKeyword(rs.getString("keyword"));
                news.setAcnumber(rs.getInt("acnumber"));
                news.setNewstype(rs.getInt("newstype"));
            }
        } catch (SQLException el) {
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return news;
    }

    /* 根据ID更新新闻点击量 */
    public void increaseAc(String id){
        PreparedStatement ps = null;
        Connection conn = null;
        try {
            conn = DBGet.getConnection();
            String sql = "update news set acnumber=acnumber+1 where id = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException el) {
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
    }

    /* 根据ID对应的关键字，获取与当前新闻的相关新闻 */
    public ArrayList<News> getRelate(String id){
		ArrayList<News>newsList = new ArrayList<News>();
		News news = getByID(id);
		String nid;

		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from news where keyword='" +news.getKeyword()+ "'";
            rs = stmt.executeQuery(sql);		
            
            while(rs.next()){
                int n = rs.getInt("id");
                nid = new Integer(n).toString();
                if (!nid.equals(id)){
                    news= new News();
                    news.setId(rs.getInt("id"));
                    news.setTitle(rs.getString("title"));
                    news.setContent(rs.getString("content"));
                    news.setAuthor(rs.getString("author"));
                    news.setPubtime(rs.getString("pubtime"));
                    news.setKeyword(rs.getString("keyword"));
                    news.setAcnumber(rs.getInt("acnumber"));
                    
                    newsList.add(news);
                }
            }
		}catch(SQLException e1) {
            System.out.println(e1+"dao");
        }finally {
	       DBGet.closeConnection(conn);
	    }
        return newsList;
	}

    /* 修改新闻，更新数据表中的一条记录 */
    public boolean modify(News news){
        boolean result = false;
        int n = 0;
        Connection conn = null;
        Statement stmt = null;
        String sql = null;

        try {
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            sql = "update news set title='"+news.getTitle()
                +"',content='"+news.getContent()
                +"',author='"+news.getAuthor()
                +"',pubtime='"+news.getPubtime()
                +"',keyword='"+news.getKeyword()
                +"',acnumber='"+news.getAcnumber()
                +"',newstype="+news.getNewstype()
                +" where id="+news.getId();
            n = stmt.executeUpdate(sql);
        } catch (SQLException el) {
            System.out.println(el + "dao:" + sql);
        }finally{
            DBGet.closeConnection(conn);
        }
        if (n > 0){
            result = true;
        }
        return result;
    }

    /* 站内检索，通过关键字查询相关新闻 */
    public ArrayList<News>getByKeyword(String keyword){
        News news = null;
        ArrayList<News>newsList = new ArrayList<News>();

        Connection conn = null;
        ResultSet rs = null;
        Statement stmt = null;
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql = "select news.* , newstype.newstype as nt from news "
                +"left join newstype on news.newstype=newstype.id "
                +"where keyword ='"+keyword+"'";
            rs = stmt.executeQuery(sql);
                System.out.println(sql);  //控制台输出sql测试
            while(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setAuthor(rs.getString("author"));
                news.setPubtime(rs.getString("pubtime"));
                news.setKeyword(rs.getString("keyword"));
                news.setNt(rs.getString("nt"));
                newsList.add(news);
            }
        }catch(SQLException el){
            System.out.println(el + "dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        return newsList;
    }

    /**
     * 查询前5条热点新闻（点击量最高）
     * @return
     */
    public ArrayList<News> getTopNews5() {
		News news = null;
		ArrayList<News> newsList = new ArrayList<News>();
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from news order by acnumber desc limit 5";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                news = new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setAuthor(rs.getString("author"));
                news.setPubtime(rs.getString("pubtime"));
                news.setKeyword(rs.getString("keyword"));
                news.setAcnumber(rs.getInt("acnumber"));
                newsList.add(news);
		    }
		}catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
	       DBGet.closeConnection(conn);
	    }
		return newsList;
	}


    /*
	 *查询新闻条数
	 */
	public int getNewsCount(){
		int recordCount = 0;
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select count(*) from news";
            rs = stmt.executeQuery(sql);
            rs.next();
            recordCount=rs.getInt(1);
		}catch(SQLException el) {
            System.out.println(el+"dao");
        }finally {
            DBGet.closeConnection(conn);
        }
		return recordCount;
	}


	/*
     *根据起始和条数查询新闻
     */
	public ArrayList<News> getNewsByST(int start,int count){
		News news = null;
		ArrayList<News> newsList = new ArrayList<News>();
		
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;

		try{
            conn = DBGet.getConnection();
            String sql=	"select news.* , newstype.newstype as nt from news "
                +" left join newstype on news.newstype=newstype.id "
                +" order by news.id limit ?,?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1,start);
            ps.setInt(2,count);
            rs = ps.executeQuery();	
            
            while(rs.next()){
                news= new News();
                news.setId(rs.getInt("id"));
                news.setTitle(rs.getString("title"));
                news.setContent(rs.getString("content"));
                news.setAuthor(rs.getString("author"));
                news.setPubtime(rs.getString("pubtime"));
                news.setKeyword(rs.getString("keyword"));
                news.setNewstype(rs.getInt("newstype"));
                news.setNt(rs.getString("nt"));
                news.setAcnumber(rs.getInt("acnumber"));
                
                newsList.add(news);
            }
		}catch(SQLException el) {
            System.out.println(el+"dao");
        }finally {
            DBGet.closeConnection(conn);
        }
		return newsList;
	}
}
