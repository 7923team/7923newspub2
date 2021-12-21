package news.beans;

public class User implements java.io.Serializable{
    // 定义私有属性
    private Integer id;
    private String username;
    private String password;
    private String gender;
    private String resume;

    // 无参构造方法
    public User(){
    }

    // 有参构造方法
    public User(String username ,String password ,String gender ,String resume){
        this.username = username;
        this.password = password;
        this.gender = gender;
        this.resume = resume;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username) {
        this.username = username;
    }

    // 各属性的置取方法
    public Integer getId(){
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername(){
        return this.username;
    }

    public void setUsername(String username){
        this.username = username;
    }

    public String getPassword(){
        return this.password;
    }

    public void setPassword(String password){
        this.password = password;
    }

    public String getGender(){
        return this.gender;
    }

    public void setGender(String gender){
        this.gender = gender;
    }

    public String getResume(){
        return this.resume;
    }

    public void setResume(String resume){
        this.resume = resume;
    }
}