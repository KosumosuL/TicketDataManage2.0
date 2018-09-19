<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="2-6">
    <link rel="icon" href="icon/ticket.ico">
    <title>饼图</title>
    <script src="ECharts/echarts.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 100%;height:100%"></div>
<c:set var="obj" value="${requestScope.obj}"/>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    var data = genData();

    option = {
        title : {
            text: '${obj.attr}',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            type: 'scroll',
            orient: 'vertical',
            right: 10,
            top: 20,
            bottom: 20,
            data: data.legendData
        },
        series : [
            {
                name: '${obj.attr}',
                type: 'pie',
                radius : '55%',
                center: ['40%', '50%'],
                data: data.seriesData,
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };

    function genData() {
        var header = ${obj.header};
        var data = ${obj.data};
        var legendData = [];
        var seriesData = [];
        for (var i = 0; i < header.length; i++) {
            var name = header.slice(i, i + 1).toString();
            var value = data.slice(i, i + 1);
            legendData.push(name);
            seriesData.push({
                name: name,
                value: value
            });
        }
        return {
            legendData: legendData,
            seriesData: seriesData
        };
    }

    myChart.setOption(option);
</script>
</body>
</html>
