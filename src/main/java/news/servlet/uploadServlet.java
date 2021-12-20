package news.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import com.oreilly.servlet.MultipartRequest; 
import com.oreilly.servlet.multipart.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class uploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response );
	}
//@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestip=request.getRemoteAddr();
		String saveDirectory=this.getServletContext().getRealPath("")+"\\upload";
		File savedir=new File(saveDirectory);
		if(!savedir.exists()){savedir.mkdirs();}//上传目录不存在则新建目录
		int maxPostSize= 1024 * 1024;//上传文件大小限制为10M
		FileRenamePolicy policy=(FileRenamePolicy)new DefaultFileRenamePolicy();
		MultipartRequest multi;
		multi=new MultipartRequest(request,saveDirectory,maxPostSize,"utf-8",policy);
		Enumeration files=multi.getFileNames();
		String name= (String) files.nextElement();
		File f=multi.getFile(name);
		if(f!=null){
			String fileName=f.getName();
		    File sServerFile=new File(saveDirectory+"\\"+requestip+"-"+fileName);
		    if(sServerFile.exists()){//将先前上传文件删除，才能成功重命名
		    	sServerFile.delete();
		    }
		    f.renameTo(sServerFile);//文件重命名
		    String message="文件上传成功，文件名为："+requestip+"-"+fileName;
		    request.setAttribute("message",message);
		  	}
		request.getRequestDispatcher("/upload.jsp").forward(request, response);
	}
}
