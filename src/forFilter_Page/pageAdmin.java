package forFilter_Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

//import forDao.AdminDao;
//import forDao.UserDao;
import forDao.AdminDao;
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
        if(session.getAttribute("_adminid_") == null){
            resp.sendRedirect("filter.jsp");
            return;
        }


        List<User> users;
        boolean isPage = true, isusersPerPage = true;
        int page, usersPerPage;
        String p = req.getParameter("page");
        try {
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
            isPage = false;
        }
//        如果url变量中有page，则必为翻页
        if(isPage){
            users = (List<User>)session.getAttribute("users");
            usersPerPage = (int)session.getAttribute("usersPerPage");
        }
        else{
//            如果url变量中有usersPerPage，则必为调整显示
            String tpp = req.getParameter("usersPerPage");
            try {
                usersPerPage = Integer.valueOf(tpp);
            } catch (NumberFormatException e) {
                usersPerPage = 10;
                isusersPerPage = false;
            }
            if(isusersPerPage){
                users = (List<User>)session.getAttribute("users");
                boolean name_display = req.getParameter("name_display") != null;
                boolean pwd_display = req.getParameter("pwd_display") != null;
                boolean baddr_display = req.getParameter("baddr_display") != null;
                boolean bdate_display = req.getParameter("bdate_display") != null;
                boolean id_num_display = req.getParameter("id_num_display") != null;
                boolean tel_display = req.getParameter("tel_display") != null;
                boolean authority_display = req.getParameter("authority_display") != null;
                session.setAttribute("name_display", name_display);
                session.setAttribute("pwd_display", pwd_display);
                session.setAttribute("baddr_display", baddr_display);
                session.setAttribute("bdate_display", bdate_display);
                session.setAttribute("id_num_display", id_num_display);
                session.setAttribute("tel_display", tel_display);
                session.setAttribute("authority_display", authority_display);
                session.setAttribute("usersPerPage", usersPerPage);
            }
            else{
//                若没有url变量，则必为初始化或者其他servlet跳转
                AdminDao adm = new AdminDao();
                users = adm.getallUser();
                session.setAttribute("users", users);
                try {
//                    若session中有usersPerPage，则为其他servlet跳转
                    usersPerPage = (int)session.getAttribute("usersPerPage");
                } catch (Exception e) {
//                    若session中没有usersPerPage，则为初始化
                    usersPerPage = 10;
//                    default setting
                    session.setAttribute("name_display", true);
                    session.setAttribute("baddr_display", true);
                    session.setAttribute("bdate_display", true);
                    session.setAttribute("authority_display", true);
                    session.setAttribute("usersPerPage", usersPerPage);
                }
            }
        }
        int totalUsers = users.size();
        int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;
        int beginIndex = (page - 1) * usersPerPage;
        int endIndex = beginIndex + usersPerPage;
        if (endIndex > totalUsers) { endIndex = totalUsers; }
        List<User> currentPageUsers = users.subList(beginIndex,endIndex);
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("page", page);
        req.setAttribute("currentPageUsers", currentPageUsers);
        req.getRequestDispatcher("adminManage.jsp").forward(req, resp);
    }
}
