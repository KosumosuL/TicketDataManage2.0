package forAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import forDao.*;
import forXml.Admin;
import forXml.User;

@WebServlet(name = "sign_in")
public class sign_in extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String identity = request.getParameter("identity");
        HttpSession session=request.getSession();

        if(identity .equals("admin")) {
            AdminDao adm = new AdminDao();
            if(adm.findAdmin(id)) {
                if(adm.checkAdmin(id, pwd)){
                    Admin a = adm.getadminbyid(id);
                    session.setAttribute("_adminid_", id);
                    session.setAttribute("_adminname_", a.getName());
                    session.setAttribute("_adminpwd_", a.getPwd());
                    session.setAttribute("_adminbaddr_", a.getBaddr());
                    session.setAttribute("_adminbdate_", a.getBdate());
                    session.setAttribute("_adminid_num_", a.getId_num());
                    session.setAttribute("_admintel_", a.getTel());

                    session.setAttribute("alert","login_success");
                    String script = "<script>location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    session.setAttribute("alert","login_wrong");
                    String script = "<script>location.href='../login.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                session.setAttribute("alert","login_notexist");
                String script = "<script>location.href='../login.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else {
            UserDao user = new UserDao();
            if(user.findUser(id)) {
                if(user.checkUser(id, pwd)){
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

                    session.setAttribute("alert","login_success");
                    String script = "<script>location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    session.setAttribute("alert","login_wrong");
                    String script = "<script>location.href='../login_u.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                session.setAttribute("alert","login_notexist");
                String script = "<script>location.href='../login_u.jsp'</script>";
                response.getWriter().println(script);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
