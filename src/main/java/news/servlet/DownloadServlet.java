package news.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import com.oreilly.servlet.ServletUtils;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadServlet extends HttpServlet {

public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response); 
	}
//@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			String filePath=this.getServletContext().getRealPath("")+"\\upload";
			//String filePath = "D:/";   
	        String fileName = request.getParameter("filename");  
	        String isofilename = new String(fileName.getBytes("gb2312"),  
	                "ISO8859-1");  
	        response.setContentType("application/octet-stream");  
	        response.setHeader("Content-Disposition", "attachment; filename="  
	                + isofilename);
	        ServletOutputStream out = null;
	        try {
	            out = response.getOutputStream();
	            ServletUtils.returnFile(filePath + "\\" + fileName, out);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            if (null != out) {
	                out.close();
	            }
	        }
	    }  	  
}
