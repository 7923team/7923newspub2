package news.beans;
public class Newstype implements java.io.Serializable {
    private Integer id;
    private String newstype;

    public Newstype(){
    }
    public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id = id;
    }

    public String getNewstype(){
        return this.newstype;
    }

    public void setNewstype(String newstype){
        this.newstype = newstype;
    }
}