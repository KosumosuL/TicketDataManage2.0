package forAction;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import forDao.*;
import forXml.*;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.XMLWriter;
import java.io.FileWriter;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;

@WebServlet(name = "ticketInput")
public class ticketInput extends HttpServlet {
    // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "xmlload";

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
        UserDao user = new UserDao();
        HttpSession session=request.getSession();
        String id = String.valueOf(session.getAttribute("_userid_"));
        User u = user.getUserbyid(id);
        if(!u.isInut()){
            String script = "<script>alert('没有权限');location.href='../.userManage'</script>";
            response.getWriter().println(script);
            return;
        }

        boolean success_upload = false;
        String inputpath = new String();
        // 配置上传参数
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // 设置临时存储目录
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 设置最大文件上传值
        upload.setFileSizeMax(MAX_FILE_SIZE);
        // 设置最大请求值 (包含文件和表单数据)
        upload.setSizeMax(MAX_REQUEST_SIZE);
        // 中文处理
        upload.setHeaderEncoding("UTF-8");
        // 构造临时路径来存储上传的文件
        // 这个路径相对当前应用的目录
        String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
        System.out.println(uploadPath);
        // 如果目录不存在则创建
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        try {
        // 解析请求的内容提取文件数据
        @SuppressWarnings("unchecked")
        List<FileItem> formItems = upload.parseRequest(request);
        if (formItems != null && formItems.size() > 0) {
            // 迭代表单数据
            for (FileItem item : formItems) {
                // 处理不在表单中的字段
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadPath + File.separator + fileName;
                    File storeFile = new File(filePath);
                    // 在控制台输出文件的上传路径
                    inputpath = filePath;
                    System.out.println(filePath);
                    // 保存文件到硬盘
                    item.write(storeFile);
                    success_upload = true;
                }
            }
        }
        } catch (Exception ex) {
            String script = "<script>alert('导入工作票失败');location.href='../.userManage'</script>";
            response.getWriter().println(script);
        }


        File file = new File(inputpath);
        if(file.exists()){
            try{
                SAXReader reader = new SAXReader();
                Document doc = reader.read(file);
                Element root = doc.getRootElement();

                // for testing
//                String ticketnumber = root.elementText("TICKETNUMBER");
//                System.out.println(ticketnumber);

                String ticketnumber = root.elementText("TICKETNUMBER");
                String ipccustomer = root.elementText("IPCCUSTOMER");
                String customercode = root.elementText("CUSTOMERCODE");
                String cause = root.elementText("CAUSE");
                String summary = root.elementText("SUMMARY");
                String componenttype = root.elementText("COMPONENTTYPE");
                String ostype = root.elementText("OSTYPE");
                String identifier = root.elementText("IDENTIFIER");
                String ticketstatus = root.elementText("TICKETSTATUS");
                String lastoccurrence = root.elementText("LASTOCCURRENCE");
                String node = root.elementText("NODE");
                String resolution = root.elementText("RESOLUTION");
                String servername = root.elementText("SERVERNAME");
                String alertgroup = root.elementText("ALERTGROUP");
                String component = root.elementText("COMPONENT");
                String firstoccurrence = root.elementText("FIRSTOCCURRENCE");
                String severity = root.elementText("SEVERITY");
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
                if(user.addTicket(ticketnumber, ipccustomer, customercode, cause, summary, componenttype, ostype,  identifier, ticketstatus, lastoccurrence, node, resolution, servername, alertgroup, component, firstoccurrence, severity)){
                    String script = "<script>alert('导入工作票成功,工作票id为：" + ticketnumber + "');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
                else{
                    String script = "<script>alert('导入工作票失败');location.href='../.userManage'</script>";
                    response.getWriter().println(script);
                }
            }catch (Exception e){
                String script = "<script>alert('导入工作票失败');location.href='../.userManage'</script>";
                response.getWriter().println(script);
                System.out.println(e.getMessage());
            }
        }

    }
}
