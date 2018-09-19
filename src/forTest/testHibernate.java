package forTest;

import java.lang.reflect.Array;
import java.util.*;

import forDao.*;
import forXml.Ticket;
import forXml.User;
import forUtility.tools;

public class testHibernate {

    final static Map<Integer, String> addrmap = new HashMap<Integer, String>();
    static {
        addrmap.put(11, "北京");
        addrmap.put(12, "天津");
        addrmap.put(13, "河北");
        addrmap.put(14, "山西");
        addrmap.put(15, "内蒙古");
        addrmap.put(21, "辽宁");
        addrmap.put(22, "吉林");
        addrmap.put(23, "黑龙江");
        addrmap.put(31, "上海");
        addrmap.put(32, "江苏");
        addrmap.put(33, "浙江");
        addrmap.put(34, "安徽");
        addrmap.put(35, "福建");
        addrmap.put(36, "江西");
        addrmap.put(37, "山东");
        addrmap.put(41, "河南");
        addrmap.put(42, "湖北");
        addrmap.put(43, "湖南");
        addrmap.put(44, "广东");
        addrmap.put(45, "广西");
        addrmap.put(46, "海南");
        addrmap.put(50, "重庆");
        addrmap.put(51, "四川");
        addrmap.put(52, "贵州");
        addrmap.put(53, "云南");
        addrmap.put(54, "西藏");
        addrmap.put(61, "陕西");
        addrmap.put(62, "甘肃");
        addrmap.put(63, "青海");
        addrmap.put(64, "宁夏");
        addrmap.put(65, "新疆");
        addrmap.put(71, "台湾");
        addrmap.put(81, "香港");
        addrmap.put(82, "澳门");
        addrmap.put(91, "国外");
    }

    final static List<String> ipccustomerl = Arrays.asList("American Express","ZTO Express","STO Express","SF Express","Yunda Express","Tiantian Express","YTO Express");
    final static List<String> customercodel = Arrays.asList("amx","dssd","cds","dfe","dfsda","lu","xi","dfe","qwq2","0kfd","bai","sid","dod","pop","cic");
    final static List<String> causel = Arrays.asList("DUPLICATE","BROKEN","NEW","CHANGE","SENESCENCE","CORROSION","UNBELIEVED","BORRING");
    final static List<String> componenttypel = Arrays.asList("Application","Concrete","Forfun","Industry","Agriculture","Business","Planting","Service");
    final static List<String> ostypel = Arrays.asList("WIN2K8","WIN2K9","WIN1K8","WIN3K7","WIN2K5","WIN2K3","WIN2K1","WIN2K0","WIN2K88");
    final static List<String> ticketstatusl = Arrays.asList("CLOSED","OPENED","BROKEN","LOSS","UNKNOWN");
    static void testAdmin() {
        AdminDao dao=new AdminDao();

        System.out.println(dao.findAdmin("10000"));
        dao.printAdmin("10000");
        dao.addAdmin("12025","12sfdjlks","dsfsdsf","新疆","1596-12-15","6515616265164654654","151651665");
        dao.printAdmin("12025");
        return ;
    }

    static void generate_admin(){
        tools t = new tools();
        String id = t.get_Id();
        System.out.println(id);

        String pwd = t.getCharAndNumr(t.getlen());
        while(!t.valid_pwd(pwd)){
            pwd = t.getCharAndNumr(t.getlen());
        }
        System.out.println(pwd);

        String name = t.getCharAndNumr(t.getlen());
        while(!t.valid_pwd(name)){
            name = t.getCharAndNumr(t.getlen());
        }
        System.out.println(name);

        int idx=Integer.parseInt(t.getNum(2));
        while(!addrmap.containsKey(idx)){
            idx=Integer.parseInt(t.getNum(2));
        }
        String baddr = addrmap.get(idx);
        System.out.println(baddr);

        String bdate = t.getDate();
        System.out.println(bdate);

        String id_num=String.valueOf(idx);
        String[] subbdate = bdate.split("-");
        id_num=id_num+t.getNum(4)+subbdate[0]+subbdate[1]+subbdate[2]+t.getNum(4);
        System.out.println(id_num);

        String tel="1"+t.getNum(10);
        System.out.println(tel);

        AdminDao adm = new AdminDao();
        adm.addAdmin(id,pwd,name,baddr,bdate,id_num,tel);
    }

    static void generate_user(){
        tools t = new tools();
        String id = t.get_Id();
        System.out.println(id);

        String pwd = t.getCharAndNumr(t.getlen());
        while(!t.valid_pwd(pwd)){
            pwd = t.getCharAndNumr(t.getlen());
        }
        System.out.println(pwd);

        String name = t.getCharAndNumr(t.getlen());
        while(!t.valid_pwd(name)){
            name = t.getCharAndNumr(t.getlen());
        }
        System.out.println(name);

        int idx=Integer.parseInt(t.getNum(2));
        while(!addrmap.containsKey(idx)){
            idx=Integer.parseInt(t.getNum(2));
        }
        String baddr = addrmap.get(idx);
        System.out.println(baddr);

        String bdate = t.getDate();
        System.out.println(bdate);

        String id_num=String.valueOf(idx);
        String[] subbdate = bdate.split("-");
        id_num=id_num+t.getNum(4)+subbdate[0]+subbdate[1]+subbdate[2]+t.getNum(4);
        System.out.println(id_num);

        String tel="1"+t.getNum(10);
        System.out.println(tel);

        AdminDao adm = new AdminDao();
        adm.addUser(id,pwd,name,baddr,bdate,id_num,tel,t.getBool(),t.getBool(),t.getBool(),t.getBool(),t.getBool());
    }

    static void generate_ticket(){
        tools t = new tools();
        Random r = new Random();
        String ticketnumber = t.getNum(8);
        String ipccustomer = ipccustomerl.get(r.nextInt(ipccustomerl.size()));
        String customercode = customercodel.get(r.nextInt(customercodel.size()));
        String cause = causel.get(r.nextInt(causel.size()));
        String summary = t.getCharAndNumr(100);
        String componenttype = componenttypel.get(r.nextInt(componenttypel.size()));
        String ostype = ostypel.get(r.nextInt(ostypel.size()));
        String identifier = t.getCharAndNumr(50);
        String ticketstatus = ticketstatusl.get(r.nextInt(ticketstatusl.size()));
        String lastoccurrence = t.getNum(13);
        String node = t.getCharAndNumr(10);
        String resolution = t.getCharAndNumr(50);
        String servername = t.getCharAndNumr(15);
        String alertgroup = t.getCharAndNumr(9);
        String component = componenttypel.get(r.nextInt(componenttypel.size()));
        String firstoccurrence = t.getNum(13);
        String severity = t.getNum(1);

        UserDao user = new UserDao();
        user.addTicket(ticketnumber,ipccustomer,customercode,cause,summary,componenttype,ostype,identifier,ticketstatus,lastoccurrence,node,resolution,servername,alertgroup,component,firstoccurrence,severity);

    }

    static public void main(String args[]) {
        //testAdmin();
        for(int i=0;i<49;i++){
            //generate_admin();
            //generate_user();
            generate_ticket();
        }

//        UserDao user = new UserDao();
//        Map<String, Integer> res = new HashMap<String, Integer>();
//        res = user.countTicket("severity");
//        for(String key:res.keySet()){
//            System.out.println(key + "   " + res.get(key));
//        }
        // test search
//        Map<String, String> ans = new HashMap<String, String>();
//        ans.put("severity","9");
//        List<Ticket> tickets = user.searchTicket(ans);
//        System.out.println(tickets.size());


//        AdminDao adm = new AdminDao();
//        System.out.println(adm.findAdmin("10000"));
    }
}