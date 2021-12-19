package news.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import news.beans.Comment;
import news.beans.CommentDAO;
import news.beans.News;
import news.beans.NewsDAO;

public class CommentServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		request.setCharacterEncoding("UTF-8");
		ArrayList<Comment> commentList = new ArrayList<Comment>();
		CommentDAO commentDAO = new CommentDAO();
		ArrayList<Comment> newComment = new ArrayList<Comment>();
		newComment = commentDAO.getTop5();
		request.setAttribute("newComment", newComment);

		String func = request.getParameter("action");
		if(func==null){
			func="";
		}

		/**
		 * 查看评论
		 */
		if (func.equals("disp")){
			NewsDAO newsDAO = new NewsDAO();

			String newsid = request.getParameter("newsid");
			commentList = commentDAO.getByNewsID(Integer.parseInt(newsid));
			
			request.setAttribute("commentList", commentList);
			
			News news = newsDAO.getByID(newsid);
			request.setAttribute("news", news);
			request.getRequestDispatcher("listComment.jsp").forward(request, response);
		}

		/**
		 * 发表评论
		 */
		else if (func.equals("add")){
			Comment comm = new Comment();
			String newsid = request.getParameter("newsid");
			String comment = request.getParameter("comment");
			String commentauthor = request.getParameter("commentauthor");
			comm.setComment(comment);
			comm.setCommentauthor(commentauthor);
			comm.setNewsid(Integer.parseInt(newsid));
			
			if (commentDAO.insert(comm))request.
				getRequestDispatcher("comment?action=disp&newsid="+newsid).forward(request, response);
			else{
				response.getWriter().print("评论失败，请联系管理员！<a href='index.jsp'>返回首页</a>");
			}
		}
		
		/**
		 * 删除评论
		 */
		else if (func.equals("del")){
			String id = request.getParameter("id");
			String username = request.getParameter("username");
			if (commentDAO.deleteById(id)){
				if ("admin".equals(username)){	     	
					request.getRequestDispatcher("comment?action=manage").forward(request, response);
				}else{
					request.getRequestDispatcher("comment?action=usermanage&username="+username).
						forward(request, response);
				}
			}else{
				response.getWriter().print("评论删除失败，请联系管理员！<a href='index.jsp'>返回首页</a>");
			}
		}
		
		/**
		 * 管理员评论管理
		 */
		else if (func.equals("manage")){
			commentList = commentDAO.getAll();
			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("manageComment.jsp").forward(request, response);
		}
		
		/**
		 * 用户评论管理
		 */
		else if (func.equals("usermanage")){
			String username = request.getParameter("username");
			commentList = commentDAO.getByUsername(username);
				// System.out.println(commentList);
			request.setAttribute("commentList", commentList);
			request.getRequestDispatcher("manageComment.jsp").forward(request, response);
		}
		
		/**
		 * 返回首页
		 */
		else{
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	public void doPost(HttpServletRequest request,HttpServletResponse response) throws 
		ServletException, IOException{
		doGet(request, response);
	}
}
