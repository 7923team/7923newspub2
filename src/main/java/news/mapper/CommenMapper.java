package news.mapper;

import news.beans.Comment;

import java.util.ArrayList;

public interface CommenMapper {
//    根据newsid去查询评论
    ArrayList<Comment> getByNewsID(int newsid);
//    插入新闻信息
    boolean insert(Comment comment);
//    根据id删除评论
    boolean deleteById(String id);
//    查询最新的五条评论
    ArrayList<Comment> getTop5();
//    根据用户名查找评论信息
    ArrayList<Comment> getByUsername(String username);
//    查询所有评论
    ArrayList<Comment> getAll();
}
