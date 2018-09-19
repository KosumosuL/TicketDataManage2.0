package forDao;

import forXml.*;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
public class UserDao {

    private SessionFactory sf;
    private Session s;

    public void openSession() {
        sf = new Configuration().configure().buildSessionFactory();
        s = sf.openSession();
        s.beginTransaction();
    }

    public void closeSession(boolean modify) {
        if(modify==true) s.getTransaction().commit();
        else s.getTransaction().rollback();
        s.close();
        sf.close();
    }

    // 对user操作
    // 包括 查询id，登录（后端操作）,修改密码（重置密码）
    // 修改密码

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

    public boolean checkUser(String id, String pwd) {
        openSession();

        boolean flag=false;
        User p =(User) s.get(User.class, id);
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
        User p =(User) s.get(User.class, id);
        if(p!=null)	{
            if(p.getId_num().equals(id_num)) {
                flag=true;
            }
        }

        closeSession(false);
        return flag;
    }

    public User getUserbyid(String _id) {
        openSession();

        Query query=s.createQuery("from User where id=:id").setParameter("id", _id);
        List<User> list=query.list();
        closeSession(false);

        return list.get(0);
    }

//    public String[] getUser(String id){
//        openSession();
//
//        String[] res = new String[12];
//        User p =(User) s.get(User.class, id);
//        res[0] = p.getId();
//        res[1] = p.getPwd();
//        res[2] = p.getName();
//        res[3] = p.getBaddr();
//        res[4] = p.getBdate();
//        res[5] = p.getId_num();
//        res[6] = p.getTel();
//        res[7] = String.valueOf(p.isView());
//        res[8] = String.valueOf(p.isSear());
//        res[9] = String.valueOf(p.isTadd());
//        res[10] = String.valueOf(p.isStatis());
//        res[11] = String.valueOf(p.isInut());
//
//        closeSession(false);
//        return res;
//    }

    public void printUser(String id){
        openSession();

        User p =(User) s.get(User.class, id);
        System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel()+"\naccess:"+String.valueOf(p.isView())+String.valueOf(p.isSear())+String.valueOf(p.isTadd())+String.valueOf(p.isStatis())+String.valueOf(p.isInut()));

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
    // 在checkidnum之后调用
    public boolean modifyUserPwd(String id, String _new) {
        openSession();

        boolean flag=false;
        User p=(User) s.get(User.class, id);
        if(p!=null) {
            p.setPwd(_new);
            flag = true;
        }

        closeSession(flag);
        return flag;
    }

    // 对ticket操作
    //包括 增，删，查询，展示
    public boolean addTicket(String ticketnumber, String ipccustomer, String customercode, String cause, String summary, String componenttype, String ostype, String identifier, String ticketstatus, String lastoccurrence, String node, String resolution, String servername, String alertgroup, String component, String firstoccurrence, String severity){
        openSession();

        boolean flag=false;
        Ticket p=(Ticket) s.get(Ticket.class, ticketnumber);
        if(p==null) {
            p=new Ticket();
            p.setAlertgroup(alertgroup);
            p.setCause(cause);
            p.setComponent(component);
            p.setComponenttype(componenttype);
            p.setCustomercode(customercode);
            p.setFirstoccurrence(firstoccurrence);
            p.setIdentifier(identifier);
            p.setIpccustomer(ipccustomer);
            p.setLastoccurrence(lastoccurrence);
            p.setNode(node);
            p.setOstype(ostype);
            p.setResolution(resolution);
            p.setServername(servername);
            p.setSeverity(severity);
            p.setSummary(summary);
            p.setTicketnumber(ticketnumber);
            p.setTicketstatus(ticketstatus);
            s.save(p);
            flag=true;
        }

        closeSession(flag);
        return flag;
    }

    public boolean deleteTicket(String ticketnumber){
        openSession();

        boolean flag=false;
        Ticket p =(Ticket) s.get(Ticket.class, ticketnumber);
        if(p!=null)	{
            s.delete(p);
            flag=true;
        }

        closeSession(flag);
        return flag;
    }

    public boolean findTicket(String ticketnumber) {
        openSession();

        boolean flag=false;
        Ticket p=(Ticket) s.get(Ticket.class, ticketnumber);
        if(p!=null) {
            flag=true;
        }

        closeSession(false);
        return flag;
    }

//    public String[] getTicket(String ticketnumber){
//        openSession();
//
//        String[] res = new String[12];
//        User p =(User) s.get(User.class, ticketnumber);
//        res[0] = p.getId();
//        res[1] = p.getPwd();
//        res[2] = p.getName();
//        res[3] = p.getBaddr();
//        res[4] = p.getBdate();
//        res[5] = p.getId_num();
//        res[6] = p.getTel();
//        res[7] = String.valueOf(p.isView());
//        res[8] = String.valueOf(p.isSear());
//        res[9] = String.valueOf(p.isTadd());
//        res[10] = String.valueOf(p.isStatis());
//        res[11] = String.valueOf(p.isInout());
//
//        closeSession(false);
//        return res;
//    }
//
//    public void printTicket(String id){
//        openSession();
//
//        User p =(User) s.get(User.class, id);
//        System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel()+"\naccess:"+String.valueOf(p.isView())+String.valueOf(p.isSear())+String.valueOf(p.isTadd())+String.valueOf(p.isStatis())+String.valueOf(p.isInout()));
//
//        closeSession(false);
//    }

    // show all users
    public List<Ticket> getallTicket() {
        openSession();

        Query query=s.createQuery("from Ticket");
        List<Ticket> list=query.list();
        closeSession(false);

        return list;
    }

    // show all users by id
    // indeed depulicate
    public List<Ticket> getTicketbyid(String _ticketnumber) {
        openSession();

        Query query=s.createQuery("from Ticket where ticketnumber=:ticketnumber").setParameter("ticketnumber", _ticketnumber);
        List<Ticket> list=query.list();
        closeSession(false);

        return list;
    }

    // show all users by ipccustomer
    public List<Ticket> getTicketbyipccustomer(String _ipccustomer) {
        openSession();

        Query query=s.createQuery("from Ticket where ipccustomer=:ipccustomer").setParameter("ipccustomer", _ipccustomer);
        List<Ticket> list=query.list();
        closeSession(false);

        return list;
    }

//    public void printallTicket() {
//        openSession();
//
//        Query query=s.createQuery("from Ticket");
//        List<User> list=query.list();
//
//        for(int i=0; i<list.size(); i++) {
//            User p=list.get(i);
//            System.out.println("id:"+p.getId()+"\npwd:"+p.getPwd()+"\nname:"+p.getName()+"\nbaddr"+p.getBaddr()+"\nbdate"+p.getBdate()+"\nid_num"+p.getId_num()+"\ntel"+p.getTel()+"\naccess:"+String.valueOf(p.isView())+String.valueOf(p.isSear())+String.valueOf(p.isTadd())+String.valueOf(p.isStatis())+String.valueOf(p.isInout()));
//        }
//
//        closeSession(false);
//    }


    // for searching
    public List<Ticket> searchTicket(Map<String, String> params) {
        openSession();

        String str = "from Ticket where";
        for(String key : params.keySet()){
            str += " " + key + "=:" + key + " and";
        }
        str = str.substring(0, str.length()-4);
        Query query=s.createQuery(str);
        for(String key : params.keySet()){
            query.setParameter(key, params.get(key));
        }

        List<Ticket> list=query.list();
        closeSession(false);

        return list;
    }

    // for statistic
    public Map<String, Integer> countTicket(String param){
        openSession();

        String str = "select " + param + " from Ticket";
        System.out.println(str);
        Query query=s.createQuery(str);
        List<String> list=query.list();
        System.out.println(list.size());
        Map<String, Integer> ans = new HashMap<String, Integer>();
        for(int i=0;i<list.size();i++){
            int cnt = ans.containsKey(list.get(i)) ? ans.get(list.get(i)) : 1;
            ans.put(list.get(i), cnt + 1);
        }
        closeSession(false);

        return ans;
    }
}
