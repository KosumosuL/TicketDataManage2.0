package forAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import forDao.*;
import forUtility.tools;

@WebServlet(name = "resetPwd")
public class resetPwd extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String id_num = request.getParameter("id_num");
        String pwd = request.getParameter("pwd");
        String identity = request.getParameter("identity");
        HttpSession session=request.getSession();
        tools t = new tools();

        // 1. valid id_num
        if(!t.valid_id_num(id_num)){
            session.setAttribute("alert","id_num_invalid");
            String script = "<script>location.href='../forget.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }
        // 2. valid pwd
        if(!t.valid_pwd(pwd)){
            session.setAttribute("alert","pwd_invalid");
            String script = "<script>location.href='../forget.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }

        if(identity.equals("admin")) {
            AdminDao adm = new AdminDao();
            if(adm.findAdmin(id)) {
                if(adm.checkId_num(id, id_num)){
                    if(adm.modifyAdminPwd(id, pwd)){
                        session.setAttribute("alert","success");
                        String script = "<script>location.href='../forget.jsp'</script>";
                        response.getWriter().println(script);
                    }
                    else{
                        session.setAttribute("alert","failure");
                        String script = "<script>location.href='../forget.jsp'</script>";
                        response.getWriter().println(script);
                    }
                }
                else{
                    session.setAttribute("alert","id_id_num");
                    String script = "<script>location.href='../forget.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                session.setAttribute("alert","notexist");
                String script = "<script>location.href='../forget.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else{
            UserDao user = new UserDao();
            if(user.findUser(id)) {
                if(user.checkId_num(id, id_num)){
                    if(user.modifyUserPwd(id, pwd)){
                        session.setAttribute("alert","success");
                        String script = "<script>location.href='../forget.jsp'</script>";
                        response.getWriter().println(script);
                    }
                    else{
                        session.setAttribute("alert","failure");
                        String script = "<script>location.href='../forget.jsp'</script>";
                        response.getWriter().println(script);
                    }
                }
                else{
                    session.setAttribute("alert","id_id_num");
                    String script = "<script>location.href='../forget.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                session.setAttribute("alert","notexist");
                String script = "<script>location.href='../forget.jsp'</script>";
                response.getWriter().println(script);
            }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
