package forTest;

import java.util.*;
import forXml.User;
import java.text.SimpleDateFormat;
import forXml.Ticket;

public class testPage{
    private static final int COUNTS = 660;
    private void cal(User u){
        Random rand = new Random();
        int tmp = (int)(rand.nextInt(2));
        if(tmp == 1)
            u.setView(true);
        else
            u.setView(false);
        tmp = (int)(rand.nextInt(2));
        if(tmp == 1)
            u.setSear(true);
        else
            u.setSear(false);
        tmp = (int)(rand.nextInt(2));
        if(tmp == 1)
            u.setTadd(true);
        else
            u.setTadd(false);
        tmp = (int)(rand.nextInt(2));
        if(tmp == 1)
            u.setStatis(true);
        else
            u.setStatis(false);
        tmp = (int)(rand.nextInt(2));
        if(tmp == 1)
            u.setInut(true);
        else
            u.setInut(false);
    }
    private String pic(){
        Random rand = new Random();
        String ret = "";
        List<String> list = new ArrayList<String>();
        list.add("天津");
        list.add("河北");
        list.add("山西");
        list.add("内蒙古");
        list.add("辽宁");
        list.add("吉林");
        list.add("黑龙江");
        list.add("上海");
        list.add("江苏");
        list.add("浙江");
        list.add("安徽");
        list.add("福建");
        list.add("江西");
        list.add("山东");
        list.add("河南");
        list.add("湖北");
        list.add("湖南");
        list.add("广东");
        list.add("广西");
        list.add("海南");
        list.add("重庆");
        list.add("四川");
        list.add("贵州");
        list.add("云南");
        list.add("西藏");
        list.add("陕西");
        list.add("甘肃");
        list.add("青海");
        list.add("宁夏");
        list.add("新疆");
        list.add("台湾");
        list.add("香港");
        list.add("澳门");
        list.add("国外");
        int tmp = (int)(rand.nextInt(34));
        ret = list.get(tmp);
        return ret;
    }
    public List<User> listAllUsers(){
        List<User> testUsers = new ArrayList<>();
        for(int i = 0; i < COUNTS; ++i){
            User usr = new User();
            usr.setId(String.valueOf(i + 1));
            usr.setName("用户" + i + 1);
            usr.setPwd("12345" + i);
            usr.setBaddr(pic());
            Date d = new Date(i + 1);
            String bdate = String.valueOf(d);
            usr.setBdate(bdate);
            usr.setId_num("12345" + i);
            usr.setTel("12345" + i);
            cal(usr);
            testUsers.add(usr);
        }
        return testUsers;
    }
    public List<Ticket> listAllTickets(){
        List<Ticket> tickets = new ArrayList<>();
        for(int i = 0; i < COUNTS; ++i){
            Ticket tic = new Ticket();
            tic.setTicketnumber("ticketnumber" + i);
            tic.setIpccustomer("ipccustomer" + i);
            tic.setCustomercode("customercode" + i);
            tic.setCause("cause" + i);
            tic.setSummary("summary" + i);
            tic.setComponenttype("componenttype" + i);
            tic.setOstype("ostype" + i);
            tic.setIdentifier("identifier" + i);
            tic.setTicketstatus("ticketstatus" + i);
            tic.setLastoccurrence("lastoccurrence" + i);
            tic.setNode("node" + i);
            tic.setResolution("resolution" + i);
            tic.setServername("servername" + i);
            tic.setAlertgroup("alertgroup" + i);
            tic.setComponent("component" + i);
            tic.setFirstoccurrence("firstoccurrence" + i);
            tic.setSeverity("severity" + i);
            tickets.add(tic);
        }
        return tickets;
    }
}
