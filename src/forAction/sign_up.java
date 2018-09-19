package forAction;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import forUtility.tools;
import forDao.AdminDao;

@WebServlet(name = "sign_up")
public class sign_up extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");

        tools t = new tools();
        String id = t.get_Id();
        String pwd = request.getParameter("pwd");
        String name = request.getParameter("name");
        String baddr = request.getParameter("baddr");
        String bdate = request.getParameter("bdate");
        String id_num = request.getParameter("id_num");
        String tel = request.getParameter("tel");

        // 1. valid pwd
        if(!t.valid_pwd(pwd)){
            String script = "<script>alert('密码不合法，请重新填写');location.href='../sign_up.jsp'</script>";
            response.getWriter().println(script);
        }
        // 2. valid name
        if(!t.valid_name(name)){
            String script = "<script>alert('名称不合法，请重新填写');location.href='../sign_up.jsp'</script>";
            response.getWriter().println(script);
        }
//        // 3. valid id_num
//        if(!t.valid_id_num(baddr, bdate, id_num)){
//            String script = "<script>alert('身份证号不合法，请重新填写');location.href='../sign_up.jsp'</script>";
//            response.getWriter().println(script);
//        }
        // 4. valid tel
        if(!t.valid_tel(tel)){
            String script = "<script>alert('号码不合法，请重新填写');location.href='../sign_up.jsp'</script>";
            response.getWriter().println(script);
        }

//        HttpSession session=request.getSession();
//        session.setAttribute("pwd", pwd);
//        session.setAttribute("name", name);
//        session.setAttribute("baddr", baddr);
//        session.setAttribute("bdate", bdate);
//        session.setAttribute("id_num", id_num);
//        session.setAttribute("tel", tel);
        AdminDao adm = new AdminDao();
        if(adm.addAdmin(id,pwd,name,baddr,bdate,id_num,tel)){
            String script = "<script>alert('注册成功,ID为" + id + "');location.href='../index.jsp'</script>";
            response.getWriter().println(script);
        }
        else{
            String script = "<script>alert('注册失败');location.href='../register.jsp'</script>";
            response.getWriter().println(script);
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
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
