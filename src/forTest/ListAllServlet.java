package forTest;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import forDao.AdminDao;
import forDao.UserDao;
import forTest.testPage;
import forXml.*;

@WebServlet(name = "ListAllServlet", urlPatterns = "/ListAllServlet")
public class ListAllServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");    //note!!

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
        req.getRequestDispatcher("userManage.jsp").forward(req, resp);
//
//        List<Ticket> tickets;
//        UserDao user = new UserDao();
//        tickets = user.getallTicket();
//        String p = req.getParameter("page");
//        int page;
//        try {
//            page = Integer.valueOf(p);
//        } catch (NumberFormatException e) {
//            page = 1;
//        }
//        int totalTickets = tickets.size();
//        int ticketsPerPage = 20;
//        int totalPages = totalTickets % ticketsPerPage == 0 ? totalTickets / ticketsPerPage : totalTickets / ticketsPerPage + 1;
//        int beginIndex = (page - 1) * ticketsPerPage;
//        int endIndex = beginIndex + ticketsPerPage;
//        if (endIndex > totalTickets)
//            endIndex = totalTickets;
//        req.setAttribute("totalTickets", totalTickets);
//        req.setAttribute("ticketsPerPage", ticketsPerPage);
//        req.setAttribute("totalPages", totalPages);
//        req.setAttribute("beginIndex", beginIndex);
//        req.setAttribute("endIndex", endIndex);
//        req.setAttribute("page", page);
//        req.setAttribute("tickets", tickets);
//        req.getRequestDispatcher("ticketManage.jsp").forward(req, resp);
    }
}