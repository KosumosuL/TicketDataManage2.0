package forXml;

public class Admin {
    String id;          // generated in random
    String pwd;         //
    String name;        //允许重复
    String baddr;
    String bdate;       //yyyy-mm-dd
    String id_num;      //for valid
    String tel;

    public String getId() {
        return id;
    }
    public String getPwd() {
        return pwd;
    }
    public String getName() {
        return name;
    }
    public String getBaddr() {
        return baddr;
    }
    public String getBdate() {
        return bdate;
    }
    public String getId_num() {
        return id_num;
    }
    public String getTel() {
        return tel;
    }


    public void setId(String id) {
        this.id = id;
    }
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setBaddr(String baddr) {
        this.baddr = baddr;
    }
    public void setBdate(String bdate) {
        this.bdate = bdate;
    }
    public void setId_num(String id_num) {
        this.id_num = id_num;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
}