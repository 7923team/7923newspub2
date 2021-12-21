package news.mapper;

import news.beans.News;

import java.util.ArrayList;

public interface NewsMapper {
    //1、查询所有新闻
    ArrayList<News> getAllNews();

    //2、插入一条新闻
    boolean insert(News news);

    //3、根据ID查询指定新闻
    News getByID(String id);

    //4、根据ID更新新闻点击量
    void increaseAc(String id);

    //5、根据ID对应的关键字，获取与当前新闻的相关新闻
    ArrayList<News> getRelate(String id);

    //6、修改新闻，更新数据表中的一条记录
    boolean modify(News news);

    //7、站内检索，通过关键字查询相关新闻
    public ArrayList<News>getByKeyword(String keyword);

    //8、查询前5条热点新闻（点击量最高）
    ArrayList<News> getTopNews5();

    //9、查询新闻条数
    int getNewsCount();

    //10、根据起始和条数查询新闻
    ArrayList<News> getNewsByST(int start, int count);

    //11、根据新闻ID删除一条新闻
    boolean deleteNews(String id);
}
