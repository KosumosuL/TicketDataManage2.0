package forFilter_Page;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import java.util.Map;
import java.util.HashMap;
import forDao.AdminDao;
import forDao.UserDao;
import forTest.testPage;
import forXml.*;

@WebServlet(name = "pageUser", urlPatterns = "/pageUser")
public class pageUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        // filter
        HttpSession session=req.getSession();
        if(session.getAttribute("_userid_") == null){
            resp.sendRedirect("filter.jsp");
            return;
        }

        List<Ticket> tickets;
        UserDao user = new UserDao();

        // page
        // for searching
        if(req.getParameter("search")!=null){

            // access
            String id = String.valueOf(session.getAttribute("_userid_"));
            User u = user.getUserbyid(id);
            if (!u.isSear()) {
                String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
                resp.getWriter().println(script);
                return;
            }
            Map<String, String> params = new HashMap<String, String>();
            if(!req.getParameter("ticketnumber_search").equals(""))  params.put("ticketnumber", req.getParameter("ticketnumber_search"));
            if(!req.getParameter("ipccustomer_search").equals(""))  params.put("ipccustomer", req.getParameter("ipccustomer_search"));
            if(!req.getParameter("customercode_search").equals(""))  params.put("customercode", req.getParameter("customercode_search"));
            if(!req.getParameter("cause_search").equals(""))  params.put("cause", req.getParameter("cause_search"));
            if(!req.getParameter("summary_search").equals(""))  params.put("summary", req.getParameter("summary_search"));
            if(!req.getParameter("componenttype_search").equals(""))  params.put("componenttype", req.getParameter("componenttype_search"));
            if(!req.getParameter("ostype_search").equals(""))  params.put("ostype", req.getParameter("ostype_search"));
            if(!req.getParameter("identifier_search").equals(""))  params.put("identifier", req.getParameter("identifier_search"));
            if(!req.getParameter("ticketstatus_search").equals(""))  params.put("ticketstatus", req.getParameter("ticketstatus_search"));
            if(!req.getParameter("lastoccurrence_search").equals(""))  params.put("lastoccurrence", req.getParameter("lastoccurrence_search"));
            if(!req.getParameter("node_search").equals(""))  params.put("node", req.getParameter("node_search"));
            if(!req.getParameter("resolution_search").equals(""))  params.put("resolution", req.getParameter("resolution_search"));
            if(!req.getParameter("servername_search").equals(""))  params.put("servername", req.getParameter("servername_search"));
            if(!req.getParameter("alertgroup_search").equals(""))  params.put("alertgroup", req.getParameter("alertgroup_search"));
            if(!req.getParameter("component_search").equals(""))  params.put("component", req.getParameter("component_search"));
            if(!req.getParameter("firstoccurrence_search").equals(""))  params.put("firstoccurrence", req.getParameter("firstoccurrence_search"));
            if(!req.getParameter("severity_search").equals(""))  params.put("severity", req.getParameter("severity_search"));

            for(String key:params.keySet()){
                System.out.println(key+"   "+params.get(key));
            }
            tickets = user.searchTicket(params);
            System.out.println(tickets.size());
            String p = req.getParameter("page");
            int page;
            try {
                page = Integer.valueOf(p);
            } catch (NumberFormatException e) {
                page = 1;
            }
            int totalTickets = tickets.size();
            int ticketsPerPage = 20;
            int totalPages = totalTickets % ticketsPerPage == 0 ? totalTickets / ticketsPerPage : totalTickets / ticketsPerPage + 1;
            int beginIndex = (page - 1) * ticketsPerPage;
            int endIndex = beginIndex + ticketsPerPage;
            if (endIndex > totalTickets)
                endIndex = totalTickets;
            req.setAttribute("totalTickets", totalTickets);
            req.setAttribute("ticketsPerPage", ticketsPerPage);
            req.setAttribute("totalPages", totalPages);
            req.setAttribute("beginIndex", beginIndex);
            req.setAttribute("endIndex", endIndex);
            req.setAttribute("page", page);
            req.setAttribute("tickets", tickets);
            // for multi-output
            session.setAttribute("tickets",tickets);
            req.getRequestDispatcher("userManage.jsp").forward(req, resp);
            return;
        }

        tickets = user.getallTicket();
        String p = req.getParameter("page");
        int page;
        try {
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
        }
        int totalTickets = tickets.size();
        int ticketsPerPage = 20;
        int totalPages = totalTickets % ticketsPerPage == 0 ? totalTickets / ticketsPerPage : totalTickets / ticketsPerPage + 1;
        int beginIndex = (page - 1) * ticketsPerPage;
        int endIndex = beginIndex + ticketsPerPage;
        if (endIndex > totalTickets)
            endIndex = totalTickets;
        req.setAttribute("totalTickets", totalTickets);
        req.setAttribute("ticketsPerPage", ticketsPerPage);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("beginIndex", beginIndex);
        req.setAttribute("endIndex", endIndex);
        req.setAttribute("page", page);
        req.setAttribute("tickets", tickets);
        // for multi-output
        session.setAttribute("tickets",tickets);
        req.getRequestDispatcher("userManage.jsp").forward(req, resp);
    }
}
