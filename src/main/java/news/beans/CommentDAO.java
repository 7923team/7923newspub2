package news.beans;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import news.mapper.CommenMapper;
import news.mapper.W_statMapper;
import news.util.DateTimeUtil;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CommentDAO {
    public ArrayList<Comment> getByNewsID(int newsid){

        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            ArrayList<Comment> commentList = commenMapper.getByNewsID(newsid);

            session.commit();
            session.close();
            return commentList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean insert(Comment comment){
        boolean result = false;


        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            result  = commenMapper.insert(comment);

            session.commit();
            session.close();
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteById(String id) {
		boolean result = false;
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            result  = commenMapper.deleteById(id);

            session.commit();
            session.close();
            return result;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
	}

	public ArrayList<Comment> getTop5() {

		ArrayList<Comment> commentList = new ArrayList<Comment>();

         try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            commentList  = commenMapper.getTop5();

            session.commit();
            session.close();
            return commentList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
	}


	/* 用户评论管理，根据用户名查询出该用户的所有评论 */
	public ArrayList<Comment> getByUsername(String username) {

		ArrayList<Comment> commentList = new ArrayList<Comment>();

		try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            commentList  = commenMapper.getByUsername(username);

            session.commit();
            session.close();
            return commentList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
	}
	
	/* 管理员评论管理，查询出所有评论 */
	public ArrayList<Comment> getAll() {

		ArrayList<Comment> commentList = new ArrayList<Comment>();

        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            CommenMapper commenMapper = session.getMapper(CommenMapper.class);
            commentList  = commenMapper.getAll();

            session.commit();
            session.close();
            return commentList;
        } catch (IOException e) {
            e.printStackTrace();
        }
		return null;
	}
}
