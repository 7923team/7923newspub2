package news.beans;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import news.util.DateTimeUtil;

public class CommentDAO {
    public ArrayList<Comment> getByNewsID(int newsid){
        Comment comment = null;
        ArrayList<Comment>commentList = new ArrayList<Comment>();
        
        Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from comment where newsid=" +newsid+ " order by commenttime desc";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                    comment = new Comment();
                    comment.setId(rs.getInt("id"));
                    comment.setComment(rs.getString("comment"));
                    comment.setCommentauthor(rs.getString("commentauthor"));
                    comment.setCommenttime(rs.getString("commenttime"));
                    comment.setNewsid(rs.getInt("newsid"));
                    commentList.add(comment);
            }
		}catch(SQLException e1) {
            System.out.println(e1+"dao");
        }finally {
	       DBGet.closeConnection(conn);
	    }
        return commentList;
    }

    public boolean insert(Comment comment){
        boolean result = false;
        int n = 0;
        Connection conn = null;
        Statement stmt = null;
        comment.setCommenttime(DateTimeUtil.getNowStr());
        try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="insert into comment (comment,commentauthor,commenttime,newsid)"
                +"values ('"+comment.getComment()+"','"
                +comment.getCommentauthor()+"','"
                +comment.getCommenttime()+"','"+comment.getNewsid()+"')";
            System.out.println(sql);//test
            n = stmt.executeUpdate(sql);
        }catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
            DBGet.closeConnection(conn);
        }
        if(n>0){
            result = true;
        }
        return result;
    }

    public boolean deleteById(String id) {
		boolean result = false;
		int n=0;
		Connection conn = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="delete from comment where id="+id;
            System.out.println(sql);//test
            n = stmt.executeUpdate(sql);	
		}catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
	       DBGet.closeConnection(conn);
	    }
		if(n>0){
            result = true;
        }
        return result;
	}

	public ArrayList<Comment> getTop5() {
		Comment comment = null;
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;

		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from comment order by commenttime desc limit 5";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                comment= new Comment();
                comment.setId((rs.getInt("id")));
                comment.setComment(rs.getString("comment"));
                comment.setCommentauthor(rs.getString("commentauthor"));
                comment.setCommenttime(rs.getString("commenttime"));
                comment.setNewsid(rs.getInt("newsid"));
                commentList.add(comment);
		    }
		}catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
	       DBGet.closeConnection(conn);
	    }
		return commentList;
	}


	/* 用户评论管理，根据用户名查询出该用户的所有评论 */
	public ArrayList<Comment> getByUsername(String username) {
		Comment comment=null;
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from comment where commentauthor='"+username+"' order by commenttime desc";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                comment= new Comment();
                comment.setId((rs.getInt("id")));
                comment.setComment(rs.getString("comment"));
                comment.setCommentauthor(rs.getString("commentauthor"));
                comment.setCommenttime(rs.getString("commenttime"));
                comment.setNewsid(rs.getInt("newsid"));
                commentList.add(comment);
            }
		}catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
	       DBGet.closeConnection(conn);
	    }
		return commentList;
	}
	
	/* 管理员评论管理，查询出所有评论 */
	public ArrayList<Comment> getAll() {
		Comment comment=null;
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt =null;
		try{
            conn = DBGet.getConnection();
            stmt = conn.createStatement();
            String sql="select * from comment order by commenttime desc";
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                comment= new Comment();
                comment.setId((rs.getInt("id")));
                comment.setComment(rs.getString("comment"));
                comment.setCommentauthor(rs.getString("commentauthor"));
                comment.setCommenttime(rs.getString("commenttime"));
                comment.setNewsid(rs.getInt("newsid"));
                commentList.add(comment);
            }
		}catch(SQLException el){
            System.out.println(el+"dao");
        }finally{
	       DBGet.closeConnection(conn);
	    }
		return commentList;
	}
}
