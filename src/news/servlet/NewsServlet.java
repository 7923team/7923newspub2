package news.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import news.beans.News;
import news.beans.NewsDAO;
import news.beans.NewsPageBean;

public class NewsServlet extends HttpServlet { //继承HttpServlet类
    // 重写HttpServlet的doGet()方法，实现自己想要的功能
    public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException {
        ArrayList<News> newsList = new ArrayList<News>();
        NewsDAO newsDAO = new NewsDAO();
        ArrayList<News> topNews =new ArrayList<News>();
        topNews = newsDAO.getTopNews5();
        request.setAttribute("topNews", topNews);

        NewsPageBean npb = new NewsPageBean();
        
        /**
         * 得到前面name="action"输入域的value值，并赋值给下面的func，从这里知道是哪个请求：
         * 1、若得到的值为“query”，则按照关键字查询
         * 2、若得到的值为null，则将func值由null置为""，此时将查询所有新闻
         */
        String func = request.getParameter("action");
        if(func==null){
            func="";
        }

        /**
         * 按关键字查询
         */
        if(func.equals("query")){
            String keyword = request.getParameter("keyword");
            // keyword = new String(keyword.getBytes("iso-8859-1"),"UTF-8");  //用了之后反而会乱码
                // System.out.println(keyword);  //输出keyword的值到控制台

            newsList = newsDAO.getByKeyword(keyword);  //将搜索结果放到请求作用域
            request.setAttribute("newsList", newsList);
            request.getRequestDispatcher("listNews.jsp").forward(request, response); //重定向到listNews.jsp显示新闻界面
        }

        /**
         * 所有新闻
         */
        else{
            newsList = newsDAO.getAllNews();
            /* 新闻分页控制 */
            int pageNo = 1;
            int pageSize = 10;  ///////////每页显示的记录数
            String strPageNo = request.getParameter("pageNo");
            if(strPageNo != null){
                pageNo = Integer.parseInt(strPageNo);
            }
            try{
                newsList = npb.getNewsByPage(pageNo, pageSize);
                // 将当前页数据存入request作用域
                request.setAttribute("newsList",newsList);
                Integer pageCount = new Integer(npb.getPageCount(pageSize));
                // 将总页数存入request作用域
                request.setAttribute("pageCount",pageCount);
                // 将当前页页号存入request作用域
                request.setAttribute("pageNo",pageNo);
                request.getRequestDispatcher("listNews.jsp").forward(request, response);
                // request.getRequestDispatcher("allNews.jsp").forward(request,response);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    // 重写HttpServlet的doPost()方法
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        // 调用doGet()方法
        doGet(request, response);
    }
}
