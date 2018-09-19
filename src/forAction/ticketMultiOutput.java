package forAction;

import forDao.UserDao;
import forXml.Ticket;
import forXml.User;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;

@WebServlet(name = "ticketMultiOutput")
public class ticketMultiOutput extends HttpServlet {

    // 上传文件存储目录
    private static final String DOWNLOAD_DIRECTORY = "xmlload";

    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void service(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");       // note！！
        request.setCharacterEncoding("utf-8");    //note!!

        // access
        HttpSession session=request.getSession();
        String id = String.valueOf(session.getAttribute("_userid_"));
        UserDao user = new UserDao();
        User u = user.getUserbyid(id);
        if (!u.isInut()) {
            String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
            response.getWriter().println(script);
            return;
        }

        try{
            List<Ticket> ticl = ( List<Ticket> )session.getAttribute("tickets");

            //创建一个xml文档
            Document doc = DocumentHelper.createDocument();
            //向xml文件中添加注释
            //        doc.addComment("这里是注释");
            //创建一个名为event的节点，因为是第一个创建，所以是根节点,再通过doc创建一个则会报错。
            Element event = doc.addElement("event");
            for(int i=0;i<ticl.size();i++) {
                Ticket tmp = ticl.get(i);

                Element ipccustomer = event.addElement("IPCCUSTOMER");
                ipccustomer.setText(tmp.getIpccustomer());
                Element customercode = event.addElement("CUSTOMERCODE");
                customercode.setText(tmp.getCustomercode());
                Element cause = event.addElement("CAUSE");
                cause.setText(tmp.getCause());
                Element summary = event.addElement("SUMMARY");
                summary.setText(tmp.getSummary());
                Element componenttype = event.addElement("COMPONENTTYPE");
                componenttype.setText(tmp.getComponenttype());
                Element ostype = event.addElement("OSTYPE");
                ostype.setText(tmp.getOstype());
                Element identifier = event.addElement("IDENTIFIER");
                identifier.setText(tmp.getIdentifier());
                Element ticketstatus = event.addElement("TICKETSTATUS");
                ticketstatus.setText(tmp.getTicketstatus());
                Element lastoccurrence = event.addElement("LASTOCCURRENCE");
                lastoccurrence.setText(tmp.getLastoccurrence());
                Element node = event.addElement("NODE");
                node.setText(tmp.getNode());
                Element resolution = event.addElement("RESOLUTION");
                resolution.setText(tmp.getResolution());
                Element servername = event.addElement("SERVERNAME");
                servername.setText(tmp.getServername());
                Element alertgroup = event.addElement("ALERTGROUP");
                alertgroup.setText(tmp.getAlertgroup());
                Element component = event.addElement("COMPONENT");
                component.setText(tmp.getComponent());
                Element ticketnumber = event.addElement("TICKETNUMBER");
                ticketnumber.setText(tmp.getTicketnumber());
                Element firstoccurrence = event.addElement("FIRSTOCCURRENCE");
                firstoccurrence.setText(tmp.getFirstoccurrence());
                Element severity = event.addElement("SEVERITY");
                severity.setText(tmp.getSeverity());
            }

            String fileName = "tickets.xml";
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
            String fileDownloadName = bath + DOWNLOAD_DIRECTORY + File.separator + fileName; // 下载的文件的物理路径＋文件名
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
                }
                if (outp != null) {
                    outp.close();
                }
            }


        }catch (Exception e){
            String script = "<script>alert('导出工作票失败');location.href='../.userManage'</script>";
            response.getWriter().println(script);
        }


    }
}
