package forFilter_Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

import forDao.AdminDao;
import forDao.UserDao;
import forTest.testPage;
import forXml.*;

@WebServlet(name = "pageAdmin", urlPatterns = "/pageAdmin")
public class pageAdmin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        // filter
        HttpSession session=req.getSession();
        System.out.println(session.getAttribute("_adminid_"));
        if(session.getAttribute("_adminid_") == null){
            resp.sendRedirect("filter.jsp");
            return;
        }

        // page
        AdminDao adm = new AdminDao();
        List<User> userl = adm.getallUser();
        System.out.println(userl.size());
        String p = req.getParameter("page");
        int page;
        try {
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }

        int totalUsers = userl.size();
        int usersPerPage = 20;
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (page - 1) * usersPerPage;
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers)
            endIndex = totalUsers;
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("usersPerPage", usersPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("users", userl);
        req.getRequestDispatcher("adminManage.jsp").forward(req, resp);

    }
}
