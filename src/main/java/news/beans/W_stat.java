package news.beans;

public class W_stat {
    private int id;
    private String name;
    private String num;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "W_stat{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", num='" + num + '\'' +
                '}';
    }

    public W_stat() {
    }

    public W_stat(String name, String num) {
        this.name = name;
        this.num = num;
    }

    public W_stat(int id, String name, String num) {
        this.id = id;
        this.name = name;
        this.num = num;
    }
}
