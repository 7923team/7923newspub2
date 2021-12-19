package news.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.beans.UserDAO;

public class checkUserRegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request,response );
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        UserDAO userDAO = new UserDAO();

        String username = request.getParameter("username");
        String massage = null;

        if(userDAO.checkUser(username)){
            massage = "该用户已存在，无法注册！";
			request.setAttribute("massage",massage);
			RequestDispatcher rd = request.getRequestDispatcher("userRegister.jsp");
			rd.forward(request,response);
        }
        else{
            RequestDispatcher rd = request.getRequestDispatcher("userVeriRegister.jsp");
			rd.forward(request,response);
        }
    }
}
