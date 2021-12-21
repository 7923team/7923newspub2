package news.beans;

import news.mapper.NewsMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.util.ArrayList;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NewsDAO{

    /* 1、查询所有新闻 */
    public ArrayList<News>getAllNews(){
        ArrayList<News> newsList = new ArrayList<News>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsList = newsMapper.getAllNews();
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsList;
    }


    /* 2、插入一条新闻 */
    public boolean insert(News news){
        boolean result = false;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            news.setPubtime(getNowStr());
            result = newsMapper.insert(news);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }


    /* 3、根据ID查询指定新闻 */
    public News getByID(String id){
        News news = null;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            news = newsMapper.getByID(id);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return news;
    }


    /* 4、根据ID更新新闻点击量 */
    public void increaseAc(String id){
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsMapper.increaseAc(id);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    /* 5、根据ID对应的关键字，获取与当前新闻的相关新闻 */
    public ArrayList<News> getRelate(String id){
		ArrayList<News> newsList = new ArrayList<News>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsList = newsMapper.getRelate(id);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsList;
	}


    /* 6、修改新闻，更新数据表中的一条记录 */
    public boolean modify(News news){
        boolean result = false;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            result = newsMapper.modify(news);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }


    /* 7、站内检索，通过关键字查询相关新闻 */
    public ArrayList<News> getByKeyword(String keyword){
        ArrayList<News> newsList = new ArrayList<News>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsList = newsMapper.getByKeyword(keyword);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newsList;
    }

    /* 8、查询前5条热点新闻（点击量最高）*/
    public ArrayList<News> getTopNews5() {
		ArrayList<News> newsList = new ArrayList<News>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsList = newsMapper.getTopNews5();
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return newsList;
	}


    /* 9、查询新闻条数 */
	public int getNewsCount(){
		int recordCount = 0;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            recordCount = newsMapper.getNewsCount();
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return recordCount;
	}


	/* 10、根据起始和条数查询新闻 */
	public ArrayList<News> getNewsByST(int start,int count){
		ArrayList<News> newsList = new ArrayList<News>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            newsList = newsMapper.getNewsByST(start, count);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
		return newsList;
	}


    /* 11、根据新闻ID删除一条新闻 */
    public boolean deleteNews(String id){
        boolean bl = false;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession sqlSession = sqlSessionFactory.openSession();
            NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
            bl = newsMapper.deleteNews(id);
            sqlSession.commit();
            sqlSession.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bl;
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
}
