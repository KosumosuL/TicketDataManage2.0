package forDao;

import forXml.Admin;
import forXml.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class AdminDao  {
    private SessionFactory sf;
    private Session s;

    public void openSession() {
        try{
            sf = new Configuration().configure().buildSessionFactory();
            s = sf.openSession();
            s.beginTransaction();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
        }
    }

    public void closeSession(boolean modify) {
        if(modify==true) s.getTransaction().commit();
        else s.getTransaction().rollback();
        s.close();
        sf.close();
    }

    // 对admin操作
    //包括 注册，查询id，登录（后端操作）
    // 查询信息，修改密码（前端操作）,修改密码（重置密码）
    // register a admin
    // 打开sign_up_success.jsp后调用此函数进行数据库操作
    public boolean addAdmin(String id, String pwd, String name, String baddr, String bdate, String id_num, String tel){
        openSession();

        boolean flag=false;
        Admin p=(Admin) s.get(Admin.class, id);
        if(p==null) {
            p=new Admin();
            p.setId(id);
            p.setPwd(pwd);
            p.setName(name);
            p.setBaddr(baddr);
            p.setBdate(bdate);
            p.setId_num(id_num);
            p.setTel(tel);
            s.save(p);
            flag=true;
        }

        closeSession(flag);
        return flag;
    }

    public boolean findAdmin(String id) {
        openSession();

        boolean flag=false;
        Admin p=(Admin) s.get(Admin.class, id);
        if(p!=null) {
            flag=true;
        }

        closeSession(false);
        return flag;
    }

    public boolean checkAdmin(String id, String pwd) {
        openSession();

        boolean flag=false;
        Admin p =(Admin) s.get(Admin.class, id);
        if(p!=null)	{
            if(p.getPwd().equals(pwd)) {
                flag=true;
            }
        }

        closeSession(false);
        return flag;
    }

    public boolean checkId_num(String id, String id_num){
        openSession();

        boolean flag=false;
        Admin p =(Admin) s.get(Admin.class, id);
        if(p!=null)	{
            if(p.getId_num().equals(id_num)) {
                flag=true;
            }
        }

        closeSession(false);
        return flag;
    }

    public String[] getAdmin(String id){
        openSession();

        String[] res = new String[8];
        Admin p =(Admin) s.get(Admin.class, id);
        res[0] = p.getId();
        res[1] = p.getPwd();
        res[2] = p.getName();
        res[3] = p.getBaddr();
        res[4] = p.getBdate();
        res[5] = p.getId_num();
        res[6] = p.getTel();

        closeSession(false);
        return res;
    }

    public void printAdmin(String id){
        openSession();

        Admin p =(Admin) s.get(Admin.class, id);
        System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel());

        closeSession(false);
    }

    public boolean modifyAdminPwd(String id, String _old, String _new) {
        openSession();

        boolean flag=false;
        Admin p=(Admin) s.get(Admin.class, id);
        if(p!=null) {
            if(p.getPwd().equals(_old)) {
                p.setPwd(_new);
                flag = true;
            }
        }

        closeSession(flag);
        return flag;
    }

    // 在checkidnum之后调用
    public boolean modifyAdminPwd(String id, String _new) {
        openSession();

        boolean flag=false;
        Admin p=(Admin) s.get(Admin.class, id);
        if(p!=null) {
            p.setPwd(_new);
            flag = true;
        }

        closeSession(flag);
        return flag;
    }

    // 对user操作
    //包括 增，删，查询，展示
    public boolean addUser(String id, String pwd, String name, String baddr, String bdate, String id_num, String tel, boolean view, boolean sear, boolean tadd, boolean statis, boolean inut){
        openSession();

        boolean flag=false;
        User p=(User) s.get(User.class, id);
        if(p==null) {
            p=new User();
            p.setId(id);
            p.setPwd(pwd);
            p.setName(name);
            p.setBaddr(baddr);
            p.setBdate(bdate);
            p.setId_num(id_num);
            p.setTel(tel);
            p.setView(view);
            p.setSear(sear);
            p.setTadd(tadd);
            p.setStatis(statis);
            p.setInut(inut);
            s.save(p);
            flag=true;
        }

        closeSession(flag);
        return flag;
    }

    public boolean deleteUser(String id){
        openSession();

        boolean flag=false;
        User p =(User) s.get(User.class, id);
        if(p!=null)	{
            s.delete(p);
            flag=true;
        }

        closeSession(flag);
        return flag;
    }

    public boolean findUser(String id) {
        openSession();

        boolean flag=false;
        User p=(User) s.get(User.class, id);
        if(p!=null) {
            flag=true;
        }

        closeSession(false);
        return flag;
    }

    public String[] getUser(String id){
        openSession();

        String[] res = new String[12];
        User p =(User) s.get(User.class, id);
        res[0] = p.getId();
        res[1] = p.getPwd();
        res[2] = p.getName();
        res[3] = p.getBaddr();
        res[4] = p.getBdate();
        res[5] = p.getId_num();
        res[6] = p.getTel();
        res[7] = String.valueOf(p.isView());
        res[8] = String.valueOf(p.isSear());
        res[9] = String.valueOf(p.isTadd());
        res[10] = String.valueOf(p.isStatis());
        res[11] = String.valueOf(p.isInut());

        closeSession(false);
        return res;
    }

    public void printUser(String id){
        openSession();

        User p =(User) s.get(User.class, id);
        System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel()+"\naccess:"+String.valueOf(p.isView())+String.valueOf(p.isSear())+String.valueOf(p.isTadd())+String.valueOf(p.isStatis())+String.valueOf(p.isInut()));

        closeSession(false);
    }

    // show all users
    public List<User> getallUser() {
        openSession();

        Query query=s.createQuery("from User");
        List<User> list=query.list();
        closeSession(false);

        return list;
    }

    // show all users by id
    // indeed depulicate
    public List<User> getUserbyid(String _id) {
        openSession();

        Query query=s.createQuery("from User where id=:id").setParameter("id", _id);
        List<User> list=query.list();
        closeSession(false);

        return list;
    }

    // show all users by name
    public List<User> getUserbyname(String _name) {
        openSession();

        Query query=s.createQuery("from User where name=:name").setParameter("name", _name);
        List<User> list=query.list();
        closeSession(false);

        return list;
    }

    public void printallUser() {
        openSession();

        Query query=s.createQuery("from User");
        List<User> list=query.list();

        for(int i=0; i<list.size(); i++) {
            User p=list.get(i);
            System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel()+"\naccess:"+String.valueOf(p.isView())+String.valueOf(p.isSear())+String.valueOf(p.isTadd())+String.valueOf(p.isStatis())+String.valueOf(p.isInut()));
        }

        closeSession(false);
    }

    public boolean modifyUserPwd(String id, String _old, String _new) {
        openSession();

        boolean flag=false;
        User p=(User) s.get(User.class, id);
        if(p!=null) {
            if(p.getPwd().equals(_old)) {
                p.setPwd(_new);
                flag = true;
            }
        }

        closeSession(flag);
        return flag;
    }

    // 后期可分解为 增加 减少 清除 权限
//    public boolean modifyAccess(String id, int access) {
//        openSession();
//
//        boolean flag=false;
//        User p=(User) s.get(User.class, id);
//        if(p!=null) {
//            p.setAccess(access);
//            flag = true;
//        }
//
//        closeSession(flag);
//        return flag;
//    }

}
