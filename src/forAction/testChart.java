package forAction;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;
import forXml.Chart;
import forDao.UserDao;
import forXml.Ticket;

@WebServlet(name = "testChart", urlPatterns = "/testChart")
public class testChart extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");

        HttpSession session=req.getSession();
        if(session.getAttribute("_userid_") == null){
            resp.sendRedirect("filter.jsp");
            return;
        }
        String attr = req.getParameter("attr");
        String chart = req.getParameter("chart");

        List<Ticket> tickl = (List<Ticket>)session.getAttribute("tickets");
        List<String> list = new ArrayList<>();
        for(int i=0;i<tickl.size();i++){
            Ticket tmp = tickl.get(i);
            switch (attr){
                case "ticketnumber":list.add(tmp.getTicketnumber());break;
                case "ipccustomer":list.add(tmp.getIpccustomer());break;
                case "customercode":list.add(tmp.getCustomercode());break;
                case "cause":list.add(tmp.getCause());break;
                case "summary":list.add(tmp.getSummary());break;
                case "componenttype":list.add(tmp.getComponenttype());break;
                case "ostype":list.add(tmp.getOstype());break;
                case "identifier":list.add(tmp.getIdentifier());break;
                case "ticketstatus":list.add(tmp.getTicketstatus());break;
                case "lastoccurrence":list.add(tmp.getLastoccurrence());break;
                case "node":list.add(tmp.getNode());break;
                case "resolution":list.add(tmp.getResolution());break;
                case "servername":list.add(tmp.getSeverity());break;
                case "alertgroup":list.add(tmp.getAlertgroup());break;
                case "component":list.add(tmp.getComponent());break;
                case "firstoccurrence":list.add(tmp.getFirstoccurrence());break;
                case "severity":list.add(tmp.getSeverity());break;
            }
        }
        System.out.println(list.size());
        Map<String, Integer> mp = new HashMap<String, Integer>();
        for(int i=0;i<list.size();i++){
            int cnt = mp.containsKey(list.get(i)) ? mp.get(list.get(i)) : 0;
            mp.put(list.get(i), cnt + 1);
        }

        for(String key:mp.keySet()){
            System.out.println(key + " " + mp.get(key));
        }
//        UserDao usr = new UserDao();
//        Map mp = usr.countTicket(attr);
        List<String> header = new ArrayList<String>(mp.keySet());
        List<Integer> data = new ArrayList<Integer>(mp.values());
        Chart obj = new Chart();
        obj.setHeader(header);
        obj.setData(data);
        obj.setAttr(attr);
        obj.setChart(chart);
        req.setAttribute("obj", obj);
        if(chart.equals("bar")){
            req.getRequestDispatcher("bar.jsp").forward(req, resp);
        }
        else if(chart.equals("pie")){
            req.getRequestDispatcher("pie.jsp").forward(req, resp);
        }
    }
}