package forDao;

import forXml.*;

import java.util.*;

import org.hibernate.Criteria;
import org.hibernate.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;

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

    // for searching
//    public List<Ticket> searchTicket(Map<String, String> params) {
//        openSession();
//
//        String str = "from Ticket where";
//        for(String key : params.keySet()){
//            str += " " + key + "=:" + key + " and";
//        }
//        str = str.substring(0, str.length()-4);
//        Query query=s.createQuery(str);
//        for(String key : params.keySet()){
//            query.setParameter(key, params.get(key));
//        }
//
//        List<Ticket> list=query.list();
//        closeSession(false);
//
//        return list;
//    }

    public List<Ticket> searchTicket(Map<String, String> params) {
        openSession();

        Criteria cr = s.createCriteria(Ticket.class);
        cr.add(Restrictions.allEq(params));
        List<Ticket> result = cr.list();

        closeSession(false);

        return result;
    }

    public List<Ticket> complex_searchTicket(Map<String, String> params, List<String> relat) {
        openSession();

        Criteria cr = s.createCriteria(Ticket.class);

        List<SimpleExpression> se = new ArrayList<>();
        for(String key : params.keySet()){
            SimpleExpression tmp = Restrictions.eq(key, params.get(key));
            se.add(tmp);
        }

        if(relat.size()==0){
            cr.add(se.get(0));
        }
        else{
            LogicalExpression le;
            le = relat.get(0).equals("and") ? Restrictions.and(se.get(0), se.get(1)) : Restrictions.or(se.get(0), se.get(1));
            for (int i = 1; i < relat.size(); i++) {
                le = relat.get(i).equals("and") ? Restrictions.and(le, se.get(i + 1)) : Restrictions.or(le, se.get(i + 1));
            }
            cr.add(le);
        }
        List<Ticket> result = cr.list();
        closeSession(false);

        return result;
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
