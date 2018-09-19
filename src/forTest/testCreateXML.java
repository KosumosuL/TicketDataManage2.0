package forTest;


import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class testCreateXML{
    public void testCreateXML() {
        //创建一个xml文档
        Document doc = DocumentHelper.createDocument();
        //向xml文件中添加注释
//        doc.addComment("这里是注释");
        //创建一个名为event的节点，因为是第一个创建，所以是根节点,再通过doc创建一个则会报错。
        Element event = doc.addElement("event");
        Element ipccustomer = event.addElement("IPCCUSTOMER");ipccustomer.setText("test");
        Element customercode = event.addElement("CUSTOMERCODE");customercode.setText("test");
        Element cause = event.addElement("CAUSE");cause.setText("test");
        Element summary = event.addElement("SUMMARY");summary.setText("test");
        Element componenttype = event.addElement("COMPONENTTYPE");componenttype.setText("test");
        Element ostype = event.addElement("OSTYPE");ostype.setText("test");
        Element identifier = event.addElement("IDENTIFIER");identifier.setText("test");
        Element ticketstatus = event.addElement("TICKETSTATUS");ticketstatus.setText("test");
        Element lastoccurrence = event.addElement("LASTOCCURRENCE");lastoccurrence.setText("test");
        Element node = event.addElement("NODE");node.setText("test");
        Element resolution = event.addElement("RESOLUTION");resolution.setText("test");
        Element servername = event.addElement("SERVERNAME");servername.setText("test");
        Element alertgroup = event.addElement("ALERTGROUP");alertgroup.setText("test");
        Element component = event.addElement("COMPONENT");component.setText("test");
        Element ticketnumber = event.addElement("TICKETNUMBER");ticketnumber.setText("test");
        Element firstoccurrence = event.addElement("FIRSTOCCURRENCE");firstoccurrence.setText("test");
        Element severity = event.addElement("SEVERITY");severity.setText("test");

        //用于格式化xml内容和设置头部标签
        OutputFormat format = OutputFormat.createPrettyPrint();
        //设置xml文档的编码为utf-8
        format.setEncoding("utf-8");
        Writer out;
        try {
            //创建一个输出流对象
            out = new FileWriter("D://new.xml");
            //创建一个dom4j创建xml的对象
            XMLWriter writer = new XMLWriter(out, format);
            //调用write方法将doc文档写到指定路径
            writer.write(doc);
            writer.close();
            System.out.print("生成XML文件成功");
        } catch (IOException e) {
            System.out.print("生成XML文件失败");
            e.printStackTrace();
        }
    }

    public static void main(String[] args){
        testCreateXML xml = new testCreateXML();
        xml.testCreateXML();
    }
}