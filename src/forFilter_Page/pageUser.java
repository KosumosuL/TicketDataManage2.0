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
//import forDao.AdminDao;
//import forDao.UserDao;
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
        boolean isPage = true, isticketsPerPage = true;
        int page, ticketsPerPage;
        String p = req.getParameter("page");
        try {
            page = Integer.valueOf(p);
        } catch (NumberFormatException e) {
            page = 1;
            isPage = false;
        }
//        如果url变量中有page，则必为翻页
        if(isPage){
            tickets = (List<Ticket>)session.getAttribute("tickets");
            ticketsPerPage = (int)session.getAttribute("ticketsPerPage");
        }
        else{
//        如果url变量中有ticketsPerPage，则必为调整显示
            String tpp = req.getParameter("ticketsPerPage");
            try {
                ticketsPerPage = Integer.valueOf(tpp);
            } catch (NumberFormatException e) {
                ticketsPerPage = 10;
                isticketsPerPage = false;
            }
            if(isticketsPerPage){
                tickets = (List<Ticket>)session.getAttribute("tickets");
                boolean ticketnumber_display = req.getParameter("ticketnumber_display") != null;
                boolean ipccustomer_display = req.getParameter("ipccustomer_display") != null;
                boolean customercode_display = req.getParameter("customercode_display") != null;
                boolean cause_display = req.getParameter("cause_display") != null;
                boolean summary_display = req.getParameter("summary_display") != null;
                boolean componenttype_display = req.getParameter("componenttype_display") != null;
                boolean ostype_display = req.getParameter("ostype_display") != null;
                boolean identifier_display = req.getParameter("identifier_display") != null;
                boolean ticketstatus_display = req.getParameter("ticketstatus_display") != null;
                boolean lastoccurrence_display = req.getParameter("lastoccurrence_display") != null;
                boolean node_display = req.getParameter("node_display") != null;
                boolean resolution_display = req.getParameter("resolution_display") != null;
                boolean servername_display = req.getParameter("servername_display") != null;
                boolean alertgroup_display = req.getParameter("alertgroup_display") != null;
                boolean component_display = req.getParameter("component_display") != null;
                boolean firstoccurrence_display = req.getParameter("firstoccurrence_display") != null;
                boolean severity_display = req.getParameter("severity_display") != null;
                session.setAttribute("ipccustomer_display", ipccustomer_display);
                session.setAttribute("customercode_display", customercode_display);
                session.setAttribute("cause_display", cause_display);
                session.setAttribute("summary_display", summary_display);
                session.setAttribute("componenttype_display", componenttype_display);
                session.setAttribute("ostype_display", ostype_display);
                session.setAttribute("identifier_display", identifier_display);
                session.setAttribute("ticketstatus_display", ticketstatus_display);
                session.setAttribute("lastoccurrence_display", lastoccurrence_display);
                session.setAttribute("node_display", node_display);
                session.setAttribute("resolution_display", resolution_display);
                session.setAttribute("servername_display", servername_display);
                session.setAttribute("alertgroup_display", alertgroup_display);
                session.setAttribute("component_display", component_display);
                session.setAttribute("firstoccurrence_display", firstoccurrence_display);
                session.setAttribute("severity_display", severity_display);
                session.setAttribute("ticketsPerPage", ticketsPerPage);
            }
            else{
//                若没有url变量，则必为初始化或者其他servlet跳转
//                1. 简单搜索：修改tickets
                if(req.getParameter("easy_search")!=null){
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
                }
//                2. 高级搜索
                else if(req.getParameter("complex_search")!=null){
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

                    int row;
                    String r = req.getParameter("row");
                    try {
                        row = Integer.valueOf(r);
                    } catch (NumberFormatException e) {
                        row = 1;
                    }
                    Map<String, String> params = new HashMap<String, String>();
                    List<String> relat = new ArrayList<>();
                    String attr_1 = req.getParameter("attr_1");
                    String search_1 = req.getParameter("search_1");
                    params.put(attr_1, search_1);
                    for(int i=2;i<=row;i++){
                        String relation = req.getParameter("relation_" + String.valueOf(i));
                        relat.add(relation);
                        String attr = req.getParameter("attr_" + String.valueOf(i));
                        String search = req.getParameter("search_" + String.valueOf(i));
                        params.put(attr, search);
                    }

                    for(String key:params.keySet()){
                        System.out.println(key+"   "+params.get(key));
                    }
                    for(String key:relat){
                        System.out.println(key);
                    }

                    tickets = user.complex_searchTicket(params, relat);
                }
//                3. 一般情况
                else {
                    /*  test
                    testPage pg = new testPage();
                    tickets = pg.listAllTickets();*/
                    UserDao user = new UserDao();
                    tickets = user.getallTicket();
                }

                session.setAttribute("tickets", tickets);
                try {
//                    若session中有ticketsPerPage，则为其他servlet跳转
                    ticketsPerPage = (int)session.getAttribute("ticketsPerPage");
                } catch (Exception e) {
//                    若session中没有ticketsPerPage，则为初始化
                    ticketsPerPage = 10;
                /*  test
                session.setAttribute("_userid_", "007");
                session.setAttribute("_username_", "James Bond");
                session.setAttribute("_userpwd_", "007");
                session.setAttribute("_userbaddr_", "国外");
                session.setAttribute("_userbdate_", "1962-10-5");
                session.setAttribute("_userid_num_", "007");
                session.setAttribute("_usertel_", "007");
                session.setAttribute("_userview_", true);
                session.setAttribute("_usersear_", true);
                session.setAttribute("_usertadd_", true);
                session.setAttribute("_userstatis_", true);
                session.setAttribute("_userinut_", true);*/
//                    default setting
                    session.setAttribute("cause_display", true);
                    session.setAttribute("customercode_display", true);
                    session.setAttribute("severity_display", true);
                    session.setAttribute("ticketstatus_display", true);
                    session.setAttribute("ticketsPerPage", ticketsPerPage);
                }
            }
        }
        int totalTickets = tickets.size();
        int totalPages = totalTickets % ticketsPerPage == 0 ? totalTickets / ticketsPerPage : totalTickets / ticketsPerPage + 1;
        int beginIndex = (page - 1) * ticketsPerPage;
        int endIndex = beginIndex + ticketsPerPage;
        if (endIndex > totalTickets) { endIndex = totalTickets; }
        List<Ticket> currentPageTickets = tickets.subList(beginIndex,endIndex);
        req.setAttribute("totalTickets", totalTickets);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("page", page);
        req.setAttribute("currentPageTickets", currentPageTickets);
        req.getRequestDispatcher("userManage.jsp").forward(req, resp);
    }
}
