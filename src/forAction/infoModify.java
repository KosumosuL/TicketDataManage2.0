package forAction;

import forDao.AdminDao;
import forDao.UserDao;
import forUtility.tools;
import forXml.Admin;
import forXml.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "infoModify")
public class infoModify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session=request.getSession();
        if(session.getAttribute("_adminid_")!=null){
            String id = String.valueOf(session.getAttribute("_adminid_"));
            String pwd = String.valueOf(session.getAttribute("_adminpwd_"));

            AdminDao adm = new AdminDao();
            tools t = new tools();
            String name = request.getParameter("name");
            String baddr = request.getParameter("baddr");
            baddr = t.getBaddr(baddr);
            if(baddr.equals(""))  baddr = request.getParameter("baddr");
            System.out.println(baddr);
            String bdate = request.getParameter("bdate");
            bdate = t.getBdate(bdate);
            System.out.println(bdate);
            String id_num = request.getParameter("id_num");
            String tel = request.getParameter("tel");

            // 1. valid name
            if(!t.valid_name(name)){
                session.setAttribute("alert","name_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }
            // 2. valid id_num
            if(!t.valid_id_num(baddr, bdate, id_num)){
                session.setAttribute("alert","id_num_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }
            // 3. valid tel
            if(!t.valid_tel(tel)){
                session.setAttribute("alert","tel_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }

            if(adm.deleteAdmin(id) && adm.addAdmin(id,pwd,name,baddr,bdate,id_num,tel)){
                session.setAttribute("alert","success");
                Admin a = adm.getadminbyid(id);
                session.setAttribute("_adminid_", id);
                session.setAttribute("_adminname_", a.getName());
                session.setAttribute("_adminpwd_", a.getPwd());
                session.setAttribute("_adminbaddr_", a.getBaddr());
                session.setAttribute("_adminbdate_", a.getBdate());
                session.setAttribute("_adminid_num_", a.getId_num());
                session.setAttribute("_admintel_", a.getTel());
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
            }
            else{
                session.setAttribute("alert","failure");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else{
            String id = String.valueOf(session.getAttribute("_userid_"));
            String pwd = String.valueOf(session.getAttribute("_userpwd_"));
            boolean view = request.getParameter("view") != null;
            boolean sear = request.getParameter("sear") != null;
            boolean tadd = request.getParameter("tadd") != null;
            boolean statis = request.getParameter("statis") != null;
            boolean inut = request.getParameter("inut") != null;

            UserDao user = new UserDao();
            AdminDao adm = new AdminDao();
            tools t = new tools();
            String name = request.getParameter("name");
            String baddr = request.getParameter("baddr");
            baddr = t.getBaddr(baddr);
            if(baddr.equals(""))  baddr = request.getParameter("baddr");
            System.out.println(baddr);
            String bdate = request.getParameter("bdate");
            bdate = t.getBdate(bdate);
            System.out.println(bdate);
            String id_num = request.getParameter("id_num");
            String tel = request.getParameter("tel");

            // 1. valid name
            if(!t.valid_name(name)){
                session.setAttribute("alert","name_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }
            // 2. valid id_num
            if(!t.valid_id_num(baddr, bdate, id_num)){
                session.setAttribute("alert","id_num_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }
            // 3. valid tel
            if(!t.valid_tel(tel)){
                session.setAttribute("alert","tel_invalid");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
                return ;
            }

            if(adm.deleteUser(id) && adm.addUser(id,pwd,name,baddr,bdate,id_num,tel,view,sear,tadd,statis,inut)){
                session.setAttribute("alert","success");
                User u = user.getUserbyid(id);
                session.setAttribute("_userid_", id);
                session.setAttribute("_username_", u.getName());
                session.setAttribute("_userpwd_",u.getPwd());
                session.setAttribute("_userbaddr_", u.getBaddr());
                session.setAttribute("_userbdate_", u.getBdate());
                session.setAttribute("_userid_num_", u.getId_num());
                session.setAttribute("_usertel_", u.getTel());
                session.setAttribute("_userview_", u.isView());
                session.setAttribute("_usersear_ ", u.isSear());
                session.setAttribute("_usertadd_ ", u.isTadd());
                session.setAttribute("_userstatis_", u.isStatis());
                session.setAttribute("_userinut_", u.isInut());
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
            }
            else{
                session.setAttribute("alert","failure");
                String script = "<script>location.href='../personal.jsp'</script>";
                response.getWriter().println(script);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
