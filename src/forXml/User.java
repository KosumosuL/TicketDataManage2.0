package forXml;

public class User {
    String id;          // generated in random
    String pwd;         //
    String name;        //允许重复
    String baddr;
    String bdate;       //yyyy-mm-dd
    String id_num;      //for valid
    String tel;
    // access;
    boolean view;   //修改删除
    boolean sear;   //查询
    boolean tadd;   //新增
    boolean statis; //统计分析
    boolean inut;  //导入导出

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

    public boolean isView() {
        return view;
    }
    public boolean isSear() {
        return sear;
    }
    public boolean isTadd() {
        return tadd;
    }
    public boolean isStatis() {
        return statis;
    }
    public boolean isInut() {
        return inut;
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

    public void setView(boolean view) {
        this.view = view;
    }
    public void setSear(boolean sear) {
        this.sear = sear;
    }
    public void setTadd(boolean tadd) {
        this.tadd = tadd;
    }
    public void setStatis(boolean statis) {
        this.statis = statis;
    }
    public void setInut(boolean inut) {
        this.inut = inut;
    }

}
