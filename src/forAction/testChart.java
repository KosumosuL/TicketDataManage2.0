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
        UserDao usr = new UserDao();
        Map mp = usr.countTicket(attr);
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