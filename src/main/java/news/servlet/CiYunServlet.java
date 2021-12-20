package news.servlet;

import news.beans.W_stat;
import news.beans.W_statDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class CiYunServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<W_stat> wStatsList = new ArrayList<W_stat>();
        W_statDAO wStatDAO = new W_statDAO();
        wStatsList = wStatDAO.getAllWord();

        req.setAttribute("wStatsList",wStatsList);
        req.getRequestDispatcher("ciyun.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
