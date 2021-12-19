package news.beans;

import java.util.ArrayList;

/**
 * 实现分页功能的业务Bean
 */
public class NewsPageBean {
	public int getPageCount(int pageSize) {
		NewsDAO newsDAO = new NewsDAO();
		int recordCount=0,t1=0,t2=0;
		recordCount=newsDAO.getNewsCount();
		t1 = recordCount%pageSize;
		t2 = recordCount/pageSize;
		return t1==0?t2:t2+1;
	}
	
	public ArrayList<News> getNewsByPage(int pageNo,int pageSize) {
		NewsDAO newsDAO = new NewsDAO();
		ArrayList<News> newsList = new ArrayList<News>();
		int startRecno = (pageNo-1)*pageSize;
		newsList = newsDAO.getNewsByST(startRecno, pageSize);
		return newsList;
	}
}
