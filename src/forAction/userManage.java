package forAction;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

import forDao.*;
import forXml.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet(name = "userManage")
public class userManage extends HttpServlet {

    // 上传文件存储目录
    private static final String DOWNLOAD_DIRECTORY = "xmlload";

    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
    }

    // 添加账号时在此函数自动调用生成id函数，存入数据库成功后显示
    protected void doAdd(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String add = request.getParameter("add");

        if(add != null){
            UserDao user = new UserDao();

            // access
            HttpSession session=request.getSession();
            String id = String.valueOf(session.getAttribute("_userid_"));
            User u = user.getUserbyid(id);
            if(!u.isTadd()){
                String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
                response.getWriter().println(script);
                return;
            }

            System.out.println(request.getParameter("ticketnumber_add"));
            String ticketnumber = request.getParameter("ticketnumber_add");
            String ipccustomer = request.getParameter("ipccustomer_add");
            String customercode = request.getParameter("customercode_add");
            String cause = request.getParameter("cause_add");
            String summary = request.getParameter("summary_add");
            String componenttype = request.getParameter("componenttype_add");
            String ostype = request.getParameter("ostype_add");
            String identifier = request.getParameter("identifier_add");
            String ticketstatus = request.getParameter("ticketstatus_add");
            String lastoccurrence = request.getParameter("lastoccurrence_add");
            String node = request.getParameter("node_add");
            String resolution = request.getParameter("resolution_add");
            String servername = request.getParameter("servername_add");
            String alertgroup = request.getParameter("alertgroup_add");
            String component = request.getParameter("component_add");
            String firstoccurrence = request.getParameter("firstoccurrence_add");
            String severity = request.getParameter("severity_add");

            if(user.addTicket(ticketnumber, ipccustomer, customercode, cause, summary, componenttype, ostype,  identifier, ticketstatus, lastoccurrence, node, resolution, servername, alertgroup, component, firstoccurrence, severity)){
                String script = "<script>alert('新增工作票成功,工作票号为：" + ticketnumber + "');location.href='../.userManage'</script>";
                response.getWriter().println(script);
            }
            else{
                String script = "<script>alert('新增工作票失败');location.href='../.userManage'</script>";
                response.getWriter().println(script);
            }
        }
    }

    // 根据查看的弹出窗口的id label确定删除对象
    protected void dodelete(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        UserDao user = new UserDao();
        List<Ticket> ticl = user.getallTicket();

        for(int i=0;i<ticl.size();i++){
            Ticket tmp = ticl.get(i);
            String str = "delete_" + tmp.getTicketnumber();
            System.out.println(str);
            if(request.getParameter(str) != null){

                // access
                HttpSession session=request.getSession();
                String id = String.valueOf(session.getAttribute("_userid_"));
                User u = user.getUserbyid(id);
                if(!u.isView()){
                    String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                    return;
                }

                if(user.deleteTicket(tmp.getTicketnumber())){
                    String script = "<script>alert('删除工作票成功');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('删除工作票失败');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
            }
        }
    }

    // 修改本质为先删除再增加
    protected void doModify(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        UserDao user = new UserDao();
        List<Ticket> ticl = user.getallTicket();

        for(int i=0;i<ticl.size();i++){
            Ticket tmp = ticl.get(i);
            String str = "modify_" + tmp.getTicketnumber();
            if(request.getParameter(str) != null){

                // access
                HttpSession session=request.getSession();
                String id = String.valueOf(session.getAttribute("_userid_"));
                User u = user.getUserbyid(id);
                if(!u.isView()){
                    String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                    return;
                }

                String ticketnumber = request.getParameter("ticketnumber_" + tmp.getTicketnumber());
                String ipccustomer = request.getParameter("ipccustomer_" + tmp.getTicketnumber());
                String customercode = request.getParameter("customercode_" + tmp.getTicketnumber());
                String cause = request.getParameter("cause_" + tmp.getTicketnumber());
                String summary = request.getParameter("summary_" + tmp.getTicketnumber());
                String componenttype = request.getParameter("componenttype_" + tmp.getTicketnumber());
                String ostype = request.getParameter("ostype_" + tmp.getTicketnumber());
                String identifier = request.getParameter("identifier_" + tmp.getTicketnumber());
                String ticketstatus = request.getParameter("ticketstatus_" + tmp.getTicketnumber());
                String lastoccurrence = request.getParameter("lastoccurrence_" + tmp.getTicketnumber());
                String node = request.getParameter("node_" + tmp.getTicketnumber());
                String resolution = request.getParameter("resolution_" + tmp.getTicketnumber());
                String servername = request.getParameter("servername_" + tmp.getTicketnumber());
                String alertgroup = request.getParameter("alertgroup_" + tmp.getTicketnumber());
                String component = request.getParameter("component_" + tmp.getTicketnumber());
                String firstoccurrence = request.getParameter("firstoccurrence_" + tmp.getTicketnumber());
                String severity = request.getParameter("severity_" + tmp.getTicketnumber());
                System.out.println(ticketnumber);
                System.out.println(ipccustomer);
                System.out.println(customercode);
                System.out.println(cause);
                System.out.println(summary);
                System.out.println(componenttype);
                System.out.println(ostype);
                System.out.println(identifier);
                System.out.println(ticketstatus);
                System.out.println(lastoccurrence);
                System.out.println(node);
                System.out.println(resolution);
                System.out.println(servername);
                System.out.println(alertgroup);
                System.out.println(component);
                System.out.println(firstoccurrence);
                System.out.println(severity);
                System.out.println(str);
                if(user.deleteTicket(tmp.getTicketnumber()) && user.addTicket(ticketnumber, ipccustomer, customercode, cause, summary, componenttype, ostype,  identifier, ticketstatus, lastoccurrence, node, resolution, servername, alertgroup, component, firstoccurrence, severity)){
                    String script = "<script>alert('修改工作票成功');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('修改工作票失败');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
            }
        }
    }

    // 单工作票导出
    protected void doOutput(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        request.setCharacterEncoding("utf-8");    //note!!

        UserDao user = new UserDao();
        List<Ticket> ticl = user.getallTicket();

        for(int i=0;i<ticl.size();i++) {
            Ticket tmp = ticl.get(i);
            String str = "output_" + tmp.getTicketnumber();
            if (request.getParameter(str) != null) {

                // access
                HttpSession session=request.getSession();
                String id = String.valueOf(session.getAttribute("_userid_"));
                User u = user.getUserbyid(id);
                if(!u.isInut()){
                    String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                    return;
                }

                //创建一个xml文档
                Document doc = DocumentHelper.createDocument();
                //向xml文件中添加注释
                //        doc.addComment("这里是注释");
                //创建一个名为event的节点，因为是第一个创建，所以是根节点,再通过doc创建一个则会报错。
                Element event = doc.addElement("event");
                Element ipccustomer = event.addElement("IPCCUSTOMER");ipccustomer.setText(tmp.getIpccustomer());
                Element customercode = event.addElement("CUSTOMERCODE");customercode.setText(tmp.getCustomercode());
                Element cause = event.addElement("CAUSE");cause.setText(tmp.getCause());
                Element summary = event.addElement("SUMMARY");summary.setText(tmp.getSummary());
                Element componenttype = event.addElement("COMPONENTTYPE");componenttype.setText(tmp.getComponenttype());
                Element ostype = event.addElement("OSTYPE");ostype.setText(tmp.getOstype());
                Element identifier = event.addElement("IDENTIFIER");identifier.setText(tmp.getIdentifier());
                Element ticketstatus = event.addElement("TICKETSTATUS");ticketstatus.setText(tmp.getTicketstatus());
                Element lastoccurrence = event.addElement("LASTOCCURRENCE");lastoccurrence.setText(tmp.getLastoccurrence());
                Element node = event.addElement("NODE");node.setText(tmp.getNode());
                Element resolution = event.addElement("RESOLUTION");resolution.setText(tmp.getResolution());
                Element servername = event.addElement("SERVERNAME");servername.setText(tmp.getServername());
                Element alertgroup = event.addElement("ALERTGROUP");alertgroup.setText(tmp.getAlertgroup());
                Element component = event.addElement("COMPONENT");component.setText(tmp.getComponent());
                Element ticketnumber = event.addElement("TICKETNUMBER");ticketnumber.setText(tmp.getTicketnumber());
                Element firstoccurrence = event.addElement("FIRSTOCCURRENCE");firstoccurrence.setText(tmp.getFirstoccurrence());;
                Element severity = event.addElement("SEVERITY");severity.setText(tmp.getSeverity());

                String fileName = "ticket_" + tmp.getTicketnumber() + ".xml";
                String downloadPath = getServletContext().getRealPath("/") + File.separator + DOWNLOAD_DIRECTORY + File.separator + fileName;
                System.out.println(downloadPath);
                //用于格式化xml内容和设置头部标签
                OutputFormat format = OutputFormat.createPrettyPrint();
                //设置xml文档的编码为utf-8
                format.setEncoding("utf-8");
                Writer out;
                try {
                    //创建一个输出流对象
                    out = new FileWriter(downloadPath);
                    //创建一个dom4j创建xml的对象
                    XMLWriter writer = new XMLWriter(out, format);
                    //调用write方法将doc文档写到指定路径
                    writer.write(doc);
                    writer.close();
                    System.out.print("success");
                } catch (IOException e) {
                    System.out.print("failure");
                    e.printStackTrace();
                }

                //关于文件下载时采用文件流输出的方式处理：
                String bath = request.getSession().getServletContext().getRealPath("");
                System.out.println(bath);
                response.setContentType("application/x-download");
                String fileDownloadName = bath + DOWNLOAD_DIRECTORY +  File.separator + fileName; // 下载的文件的物理路径＋文件名
                String fileDisplayName = fileName; // 给用户提供的下载文件名
                fileDisplayName = URLEncoder.encode(fileDisplayName, "UTF-8");
                response.addHeader("Content-Disposition", "attachment;filename=" + fileDisplayName);
                OutputStream outp = null;
                FileInputStream in = null;
                try {
                    outp = response.getOutputStream();
                    in = new FileInputStream(fileDownloadName);
                    byte[] b = new byte[1024];
                    int k = 0;
                    while ((k = in.read(b)) > 0) {
                        outp.write(b, 0, k);
                    }
                    outp.flush();

                } catch (Exception e) {
                    System.out.println("failure");
                    e.printStackTrace();
                } finally {
                    if (in != null) {
                        in.close();
                        in = null;
                    }
                    if (outp != null) {
                        outp.close();
                        outp = null;
//                        out.clear();
//                        out = pageContext.pushBody();
                    }
                }
            }
        }
    }

    protected void service(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");       // note！！

        System.out.println("15651");
        doAdd(request, response);
        dodelete(request, response);
        doModify(request, response);
        doOutput(request, response);

        String script = "<script>alert('(￣(工)￣)');location.href='../.userManage'</script>";
        response.getWriter().println(script);
    }
}
