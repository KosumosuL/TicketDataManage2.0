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
        String identity = request.getParameter("identity");
        String pwd = request.getParameter("pwd");
        String name = request.getParameter("name");
        String baddr = request.getParameter("baddr");
        System.out.println(baddr);
        baddr = t.getBaddr(baddr);
        System.out.println(baddr);
        String bdate = request.getParameter("bdate");
        bdate = t.getBdate(bdate);
        System.out.println(bdate);
        String id_num = request.getParameter("id_num");
        System.out.println(id_num);
        String tel = request.getParameter("tel");
        HttpSession session=request.getSession();

        // 1. valid name
        if(!t.valid_name(name)){
            session.setAttribute("alert","name_invalid");
            String script = "<script>location.href='../register.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }
        // 2. valid pwd
        if(!t.valid_pwd(pwd)){
            session.setAttribute("alert","pwd_invalid");
            String script = "<script>location.href='../register.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }
        // 3. valid id_num
        if(!t.valid_id_num(baddr, bdate, id_num)){
            session.setAttribute("alert","id_num_invalid");
            String script = "<script>location.href='../register.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }
        // 4. valid tel
        if(!t.valid_tel(tel)){
            session.setAttribute("alert","tel_invalid");
            String script = "<script>location.href='../register.jsp'</script>";
            response.getWriter().println(script);
            return ;
        }

        if(identity .equals("admin")) {
            AdminDao adm = new AdminDao();
            if(adm.addAdmin(id,pwd,name,baddr,bdate,id_num,tel)){
                session.setAttribute("alert","success");
                session.setAttribute("success_id",id);
                String script = "<script>location.href='../register.jsp'</script>";
                response.getWriter().println(script);
            }
            else{
                session.setAttribute("alert","failure");
                String script = "<script>location.href='../register.jsp'</script>";
                response.getWriter().println(script);
            }
        }
        else{
            AdminDao adm = new AdminDao();
            if(adm.addUser(id,pwd,name,baddr,bdate,id_num,tel,false,false,false,false,false)){
                session.setAttribute("alert","success");
                session.setAttribute("success_id",id);
                String script = "<script>location.href='../register.jsp'</script>";
                response.getWriter().println(script);
            }
            else{
                session.setAttribute("alert","failure");
                String script = "<script>location.href='../register.jsp'</script>";
                response.getWriter().println(script);
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
