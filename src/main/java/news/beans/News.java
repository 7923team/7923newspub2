package news.beans;

public class News implements java.io.Serializable{
    private Integer id;
    private String title;
    private String content;
    private String author;
    private String pubtime;
    private String keyword;
    private String note;
    private Integer newstype;
    private Integer acnumber;
    private String nt;

    //无参构造方法
    public News(){ 
    }

    //有参构造方法
    public News(String title,String content,String author
                ,String pubtime,String keyword,String note){
        this.title = title;
        this.content = content;
        this.author = author;
        this.pubtime = pubtime;
        this.keyword = keyword;
        this.note = note;
    }

    // 置取方法
    public Integer getId(){
        return this.id;
    }
    public void setId(Integer id){
        this.id = id;
    }
    public String getTitle(){
        return this.title;
    }
    public void setTitle(String title){
        this.title = title;
    }
    public String getContent(){
        return this.content;
    }
    public void setContent(String content){
        this.content = content;
    }
    public String getAuthor(){
        return this.author;
    }
    public void setAuthor(String author){
        this.author = author;
    }
    public String getPubtime(){
        return this.pubtime;
    }
    public void setPubtime(String pubtime){
        this.pubtime = pubtime;
    }
    public String getKeyword(){
        return this.keyword;
    }
    public void setKeyword(String keyword){
        this.keyword = keyword;
    }
    public String getNote(){
        return this.note;
    }
    public void setNote(String note){
        this.note = note;
    }
    public Integer getNewstype(){
        return this.newstype;
    }
    public void setNewstype(Integer newstype){
        this.newstype = newstype;
    }
    public Integer getAcnumber(){
        return this.acnumber;
    }
    public void setAcnumber(Integer acnumber){
        this.acnumber = acnumber;
    }

    public String getNt() {
        return nt;
    }
    public void setNt(String nt) {
        this.nt = nt;
    }
}
