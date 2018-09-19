package forAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

        tools t = new tools();
        // 1. valid id_num
//        if(!t.valid_id_num(id_num)){
//            String script = "<script>alert('身份证号不合法，请重新填写');location.href='../forget.jsp'</script>";
//            response.getWriter().println(script);
//        }
        // 2. valid pwd
        if(!t.valid_pwd(pwd)){
            String script = "<script>alert('密码不合法，请重新填写');location.href='../forget.jsp'</script>";
            response.getWriter().println(script);
        }

        if(identity.equals("admin")) {
            AdminDao adm = new AdminDao();
            if(adm.findAdmin(id)) {
                if(adm.checkId_num(id, id_num)){
                    adm.modifyAdminPwd(id, pwd);
                    String script = "<script>alert('修改成功，请重新登录');location.href='../index.jsp'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('id号和身份证号不匹配，请重新填写');location.href='../forget.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                String script = "<script>alert('用户不存在，请重新填写');location.href='../forget.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else{
            UserDao user = new UserDao();
            if(user.findUser(id)) {
                if(user.checkId_num(id, id_num)){
                    user.modifyUserPwd(id, pwd);
                    String script = "<script>alert('修改成功，请重新登录');location.href='../index.jsp'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('id号和身份证号不匹配，请重新填写');location.href='../forget.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                String script = "<script>alert('用户不存在，请重新填写');location.href='../forget.jsp'</script>";
                response.getWriter().println(script);
            }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
        out.println("  <BODY>");
        out.print("    This is ");
        out.print(this.getClass());
        out.println(", using the GET method");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
}
