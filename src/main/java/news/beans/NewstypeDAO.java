package news.beans;

import news.mapper.CommenMapper;
import news.mapper.NewstypeMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.util.ArrayList;
// import java.util.List;
import java.sql.*;

public class NewstypeDAO {
    public ArrayList<Newstype> getAllNewstype(){

        ArrayList<Newstype> newstypesList = new ArrayList<Newstype>();
        try {
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsReader("mybatis-conf.xml"));
            SqlSession session = sqlSessionFactory.openSession();
            NewstypeMapper newstypeMapper = session.getMapper(NewstypeMapper.class);
            newstypesList  = newstypeMapper.getAllNewstype();

            session.commit();
            session.close();
            return newstypesList;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
