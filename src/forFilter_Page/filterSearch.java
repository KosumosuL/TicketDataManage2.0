package forFilter_Page;

import forDao.UserDao;
import forXml.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "filterSearch")
public class filterSearch extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        // filter
        HttpSession session = req.getSession();
        System.out.println(session.getAttribute("_userid_"));
        if (session.getAttribute("_userid_") == null) {
            resp.sendRedirect("filter.jsp");
            return;
        }
        // access
        String id = String.valueOf(session.getAttribute("_userid_"));
        UserDao user = new UserDao();
        User u = user.getUserbyid(id);
        if (!u.isSear()) {
            session.setAttribute("alert","noaccess");
            String script = "<script>location.href='../.userManage'</script>";
            resp.getWriter().println(script);
            return;
        }

        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }
}
