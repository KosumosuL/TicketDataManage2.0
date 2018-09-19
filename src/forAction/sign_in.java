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

@WebServlet(name = "sign_in")
public class sign_in extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        String identity = request.getParameter("identity");

        if(identity .equals("admin")) {
            AdminDao adm = new AdminDao();
            if(adm.findAdmin(id)) {
                if(adm.checkAdmin(id, pwd)){
                    HttpSession session=request.getSession();
                    session.setAttribute("_adminid_", id);
                    //session.setAttribute("identity", "admin");
                    String script = "<script>alert('登录成功');location.href='../.adminManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('用户名或密码错误，请重新登陆');location.href='../login.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                String script = "<script>alert('用户不存在，请重新登陆');location.href='../login.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else {
            UserDao user = new UserDao();
            if(user.findUser(id)) {
                if(user.checkUser(id, pwd)){
                    HttpSession session=request.getSession();
                    session.setAttribute("_userid_", id);
                    //session.setAttribute("identity", "admin");
                    String script = "<script>alert('登录成功');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('用户名或密码错误，请重新登陆');location.href='../login.jsp'</script>";
                    response.getWriter().println(script);
                }
            }
            else{
                String script = "<script>alert('用户不存在，请重新登陆');location.href='../login.jsp'</script>";
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
