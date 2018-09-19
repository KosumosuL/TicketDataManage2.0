package forUtility;

import java.util.*;
import java.util.regex.Pattern;
import forDao.AdminDao;

public class tools {
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
    final static int[] PARITYBIT = {'1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'};
    final static int[] POWER_LIST = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2};

    //身份证号校验：先保证全为15或18位数字，再具体校验
    public boolean valid_id_num(String baddr, String bdate, String id_num ){
        return true;
//        String reg = "[0-9]";
//        if(!Pattern.matches(reg, id_num))   return false;
//        if(id_num == null || (id_num.length() != 15 && id_num.length() != 18))  return false;
//        final char[] cs = id_num.toUpperCase().toCharArray();
//        // （1）校验位数
//        int power = 0;
//        for (int i = 0; i < cs.length; i++) {
//            if (i == cs.length - 1 && cs[i] == 'X') break;
//            if (cs[i] < '0' || cs[i] > '9') return false;
//            if (i < cs.length - 1) power += (cs[i] - '0') * POWER_LIST[i];
//        }
//        // （2）校验区位码
//        if(addrmap.get(Integer.valueOf(id_num.substring(0, 2))) != baddr)   return false;
//
//        String[] subbdate = bdate.split("-");
//        // （3）校验年份
//        String year = id_num.length() == 15 ? "19" + id_num.substring(6, 8) : id_num.substring(6, 10);
//        if (year != subbdate[0]) return false;
//        // （4）校验月份
//        String month = id_num.length() == 15 ? id_num.substring(8, 10) : id_num.substring(10, 12);
//        if (month != subbdate[1]) return false;
//        // （5）校验天数
//        String day = id_num.length() == 15 ? id_num.substring(10, 12) : id_num.substring(12, 14);
//        if (day != subbdate[2]) return false;
//
//        // （7）校验“校验码”
//        if (id_num.length() == 15)
//            return true;
//        return cs[cs.length - 1] == PARITYBIT[power % 11];
    }

    public boolean valid_id_num(String id_num){
        String reg = "[0-9]";
        if(!Pattern.matches(reg, id_num))   return false;
        if(id_num.length() != 15 && id_num.length() != 18)  return false;
        return true;
    }

    //name校验：最长不得超过7个汉字，或14个字节(数字，字母和下划线)
    public boolean valid_name(String name){
        String reg = "^[\\u4e00-\\u9fa5]{1,7}$|^[\\dA-Za-z_]{1,14}$";
        if(Pattern.matches(reg, name))  return true;
        return false;
    }

    //pwd校验：只能包含数字和字母，长度在8-16之间，至少包含2数字
    public boolean valid_pwd(String pwd){
        String reg1 = "[a-zA-Z0-9]{8,16}";  //只能包含数字和字母，长度在8-16之间
        String reg2 = ".*\\d.*\\d.*";       //至少包含2数字
        if(Pattern.matches(reg1, pwd) && Pattern.matches(reg2, pwd)) return true;
        return false;
    }

    //tel校验：只能包含数字，长度在8-16之间
    public boolean valid_tel(String tel){
        String reg = "[0-9]{8,16}";
        if(Pattern.matches(reg, tel))   return true;
        return false;
    }

    public String get_Id(){
        //在此判断或在获取处判断id重复
        AdminDao adm = new AdminDao();
        int _id = (int)(Math.random()*90000 + 10000);
        String id = String.valueOf(_id);
        while(adm.findAdmin(id) || adm.findUser(id)){
            _id = (int)(Math.random()*90000 + 10000);
            id = String.valueOf(_id);
        }
        return id;
    }

    public String getNum(int length){
        String val = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            val += String.valueOf(random.nextInt(10));
        }
        return val;
    }

    public String getCharAndNumr(int length) {
        String val = "";
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            // 输出字母还是数字
            String charOrNum = random.nextInt(2) % 2 == 0 ? "char" : "num";
            // 字符串
            if ("char".equalsIgnoreCase(charOrNum)) {
                // 取得大写字母还是小写字母
                int choice = random.nextInt(2) % 2 == 0 ? 65 : 97;
                val += (char) (choice + random.nextInt(26));
            } else if ("num".equalsIgnoreCase(charOrNum)) { // 数字
                val += String.valueOf(random.nextInt(10));
            }
        }
        return val;
    }

    public int getlen(){
        Random random = new Random();
        return (int)random.nextInt(20);
    }

    public boolean getBool(){
        Random random = new Random();
        return random.nextBoolean();
    }

    public String getDate(){
        Random rndYear=new Random();
        int year=rndYear.nextInt(18)+2000;  //生成[1970,2017]的整数；年
        Random rndMonth=new Random();
        int month=rndMonth.nextInt(12)+1;   //生成[1,12]的整数；月
        Random rndDay=new Random();
        int Day=rndDay.nextInt(27)+1;       //生成[1,30)的整数；日

        return year+"-"+month+"-"+Day;
    }

    public String getBaddr(String idx){
        String reg = "[0-9]";
        if(!Pattern.matches(reg, idx))   return "cannot";
        int id = Integer.parseInt(idx);
        if(!addrmap.containsKey(id))    return "cannot";

        return addrmap.get(id);
    }
}
