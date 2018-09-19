package forAction;


import java.io.IOException;
import java.util.List;
import forUtility.tools;
import forDao.*;
import forXml.*;

public class adminManage extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    // 添加账号时在此函数自动调用生成id函数，存入数据库成功后显示
    protected void doAdd(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String add = request.getParameter("add");
        if(add != null){
            tools t = new tools();
            AdminDao adm = new AdminDao();
            String id = t.get_Id();
            String pwd = request.getParameter("pwd_add");
            String name = request.getParameter("name_add");
            String baddr = request.getParameter("baddr_add");
            baddr = t.getBaddr(baddr);
            System.out.println(baddr);
            String bdate = request.getParameter("bdate_add");
            String id_num = request.getParameter("id_num_add");
            String tel = request.getParameter("tel_add");
            boolean view = request.getParameter("view_add") != null;
            boolean sear = request.getParameter("sear_add") != null;
            boolean tadd = request.getParameter("tadd_add") != null;
            boolean statis = request.getParameter("statis_add") != null;
            boolean inut = request.getParameter("inut_add") != null;

            System.out.println(id_num);
            // 1. valid pwd
            if(!t.valid_pwd(pwd)){
                String script = "<script>alert('密码不合法，请重新填写');location.href='../.adminManage'</script>";
                response.getWriter().println(script);
            }
            // 2. valid name
            if(!t.valid_name(name)){
                String script = "<script>alert('名称不合法，请重新填写');location.href='../.adminManage'</script>";
                response.getWriter().println(script);
            }
            // 3. valid id_num
//            if(!t.valid_id_num(baddr, bdate, id_num)){
//                String script = "<script>alert('身份证号不合法，请重新填写');location.href='../.adminManage'</script>";
//                response.getWriter().println(script);
//            }
            // 4. valid tel
            if(!t.valid_tel(tel)){
                String script = "<script>alert('号码不合法，请重新填写');location.href='../.adminManage'</script>";
                response.getWriter().println(script);
            }

            if(adm.addUser(id,pwd,name,baddr,bdate,id_num,tel,view,sear,tadd,statis,inut)){
                String script = "<script>alert('添加用户帐号成功,用户ID为：" + id + "');location.href='../.adminManage'</script>";
                response.getWriter().println(script);
            }
            else{
                String script = "<script>alert('添加帐号失败');location.href='../.adminManage'</script>";
                response.getWriter().println(script);
            }
        }
    }

    // 根据查看的弹出窗口的id label确定删除对象
    protected void dodelete(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        AdminDao adm = new AdminDao();
        List<User> userl = adm.getallUser();

        for(int i=0;i<userl.size();i++){
            User tmp = userl.get(i);
            String str = "delete_" + tmp.getId();
            System.out.println(str);
            if(request.getParameter(str) != null){
                if(adm.deleteUser(tmp.getId())){
                    String script = "<script>alert('删除帐号成功');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('删除帐号失败');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
            }
        }
    }

    // 修改本质为先删除再增加
    protected void doModify(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        AdminDao adm = new AdminDao();
        List<User> userl = adm.getallUser();

        for(int i=0;i<userl.size();i++){
            User tmp = userl.get(i);
            String str = "modify_" + tmp.getId();
            if(request.getParameter(str) != null){
                System.out.println("sdfsdf");
                tools t = new tools();
                String pwd = request.getParameter("pwd_" + tmp.getId()); //不修改
                String name = request.getParameter("name_" + tmp.getId());
                String baddr = request.getParameter("baddr_" + tmp.getId());
                baddr = t.getBaddr(baddr);
                if(baddr.equals("cannot"))  baddr = request.getParameter("baddr_" + tmp.getId());
                System.out.println(baddr);
                String bdate = request.getParameter("bdate_" + tmp.getId());
                String id_num = request.getParameter("id_num_" + tmp.getId());
                String tel = request.getParameter("tel_" + tmp.getId());
                boolean view = request.getParameter("view_" + tmp.getId()) != null;
                boolean sear = request.getParameter("sear_" + tmp.getId()) != null;
                boolean tadd = request.getParameter("tadd_" + tmp.getId()) != null;
                boolean statis = request.getParameter("statis_" + tmp.getId()) != null;
                boolean inut = request.getParameter("inut_" + tmp.getId()) != null;

                // 1. valid pwd    no need
//                if(!t.valid_pwd(pwd)){
//                    String script = "<script>alert('密码不合法，请重新填写');location.href='../mainAdmin.jsp'</script>";
//                    response.getWriter().println(script);
//                }
                // 2. valid name
                if(!t.valid_name(name)){
                    String script = "<script>alert('名称不合法，请重新填写');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
                // 3. valid id_num
//                if(!t.valid_id_num(baddr, bdate, id_num)){
//                    String script = "<script>alert('身份证号不合法，请重新填写');location.href='../.adminManage'</script>";
//                    response.getWriter().println(script);
//                }
                // 4. valid tel
                if(!t.valid_tel(tel)){
                    String script = "<script>alert('号码不合法，请重新填写');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }

                if(adm.deleteUser(tmp.getId()) && adm.addUser(tmp.getId(),pwd,name,baddr,bdate,id_num,tel,view,sear,tadd,statis,inut)){
                    String script = "<script>alert('修改帐号成功');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('修改帐号失败');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
            }
        }
    }


    protected void service(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");

        System.out.println("1221");
        doAdd(request, response);
        dodelete(request, response);
        doModify(request, response);
        String script = "<script>alert('(￣(工)￣)');location.href='../.adminManage'</script>";
        response.getWriter().println(script);
    }

}
