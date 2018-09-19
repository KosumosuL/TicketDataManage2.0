package forXml;

import java.util.*;

public class Chart {
    private List<String> header;
    private List<Integer> data;
    private String attr;
    private String chart;

    public void setChart(String chart) {
        this.chart = chart;
    }

    public String getChart() {
        return chart;
    }

    public void setAttr(String attr) {
        this.attr = attr;
    }

    public String getAttr() {
        return attr;
    }

    public void setHeader(List<String> header) {
        this.header = new ArrayList<>();
        header.forEach(str->this.header.add("\"" + str + "\""));
    }

    public List<String> getHeader() {
        return header;
    }

    public void setData(List<Integer> data) {
        this.data = data;
    }

    public List<Integer> getData() {
        return data;
    }
}
