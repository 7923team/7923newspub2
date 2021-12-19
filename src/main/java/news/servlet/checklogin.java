package news.servlet;

import java.io.IOException;
// import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import news.beans.UserDAO;

public class checklogin extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response );
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		String uName = request.getParameter("username");
		String pwd = request.getParameter("password");
		String yzm = request.getParameter("yzm");
		String info="";
		HttpSession session = request.getSession();
		String sessionyzm = (String)session.getAttribute("rand");

		if(!sessionyzm.equalsIgnoreCase(yzm)){
			info = "验证码错误，请重新输入";
			request.setAttribute("info",info);
			RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
			rd.forward(request,response);
		}
		
		else if(userDAO.queryByNamePwd(uName,pwd)){
			session.setAttribute("username",uName);
			response.sendRedirect("index.jsp");   //使用JSP的内置对象转向到index.jsp
		}
		// else{
		// 	response.sendRedirect("userLogin.jsp");
		// }
		else{
			info = "用户名或者密码不正确";
			request.setAttribute("info",info);
			RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
			rd.forward(request,response);
		}

	}
}
