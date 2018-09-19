package forUtility;


import org.dom4j.*;
import org.dom4j.io.*;

import java.io.*;
import java.util.*;

public class createXML {

    //无参数构造方法
    public createXML() {}
    //产生一个XML文档并存盘
    public Document create(String filename){
        //使用DocumentHelper类创建一个文档实例
        Document document=DocumentHelper.createDocument();

        //创建根元素
        Element rootElement=document.addElement("linkmans");

        //为根元素创建第一个子元素
        Element firstElement=rootElement.addElement("linkman");
        Element element1=firstElement.addElement("name");
        element1.setText("张三");
        Element element2=firstElement.addElement("id");
        element2.setText("001");
        Element element3=firstElement.addElement("company");
        element3.setText("A公司");
        Element element4=firstElement.addElement("email");
        element4.setText("zhang@aaa.com");
        Element element5=firstElement.addElement("tel");
        element5.setText("(020)12345678");
        Element element6=firstElement.addElement("address");
        element6.setText("广东省广州市");

        //为根元素创建第二个子元素
        Element secondElement=rootElement.addElement("linkman");
        Element elementa=secondElement.addElement("name");
        elementa.setText("李四");
        Element elementb=secondElement.addElement("id");
        elementb.setText("002");
        Element elementc=secondElement.addElement("company");
        elementc.setText("B公司");
        Element elementd=secondElement.addElement("email");
        elementd.setText("li@bbb.com");
        Element elemente=secondElement.addElement("tel");
        elemente.setText("(010)12345678");
        Element elementf=secondElement.addElement("address");
        elementf.setText("北京市");

        //将创建的XML文档存盘
        try{
            XMLWriter output = null;
            //创建一个格式化对象
            OutputFormat format = OutputFormat.createPrettyPrint();
            //使用TAB缩进
            format.setIndent("\t");
            //创建一个XMLWriter对象
            output = new XMLWriter(new FileOutputStream(new File(filename)),format);
            //将XML文档输出
            output.write(document);
            output.close();
        }catch(IOException e){
            System.out.println(e.getMessage());
        }

        //返回XML文档对象
        return document;
    }

    //将文本串转换成XML文档并存盘
    public Document create(String filename,String text) throws Exception{
        //使用DocumentHelper类将文本串转换为XML文档
        Document document=DocumentHelper.parseText(text);

        //将创建的XML文档存盘
        try{
            XMLWriter output = null;
            //创建一个格式化对象
            OutputFormat format = OutputFormat.createPrettyPrint();
            //使用TAB缩进
            format.setIndent("\t");
            //创建一个XMLWriter对象
            output = new XMLWriter(new FileOutputStream(new File(filename)),format);
            //将XML文档输出
            output.write(document);
            output.close();
        }
        catch(IOException e){
            System.out.println(e.getMessage());
        }

        //返回XML文档对象
        return document;
    }
    //在指定的文件中，将指定Xpath下的指定元素的文本值进行替换
    public Document update(String filename,String xpath,String element,String srcText,String tagText) throws Exception{
//读取指定的XML文件，返回内存XML文档对象
        SAXReader reader = new SAXReader();
        Document doc = reader.read(new File(filename));

        //将指定的Xpath的元素文本值进行替换
        List list = doc.selectNodes(xpath);
        Iterator it = list.iterator();
        while (it.hasNext()){
            Element el =(Element)it.next();
            Iterator it1=el.elementIterator(element);
            while (it1.hasNext()){
                Element titleElement=(Element)it1.next();
                if(titleElement.getText().equals(srcText))  titleElement.setText(tagText);
            }
        }
        //将创建的XML文档存盘
        try{
            XMLWriter output = null;
            //创建一个格式化对象
            OutputFormat format = OutputFormat.createPrettyPrint();
            //使用TAB缩进
            format.setIndent("\t");
            //创建一个XMLWriter对象
            output = new XMLWriter(new FileOutputStream(new File(filename)),format);
            //将XML文档输出
            output.write(doc);
            output.close();
        }
        catch(IOException e){
            System.out.println(e.getMessage());
        }

        //返回XML文档对象
        return doc;
    }
    public static void main(String[] args){
        createXML cx=new createXML();
        cx.create("aa.xml");
    }
}
