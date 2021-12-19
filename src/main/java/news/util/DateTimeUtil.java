package news.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	
	static public String getNowStr(){
		String resultStr = getDateStr(new Date(),"yyyy-MM-dd HH:mm:ss");
		return resultStr;
	}
	
	static public String getDateStr(Date date,String pattern){
		String dateStr=null;
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        try{
			dateStr = sdf.format(date);
		}catch (Exception e){e.printStackTrace();}
		
		return dateStr;
	}
}
