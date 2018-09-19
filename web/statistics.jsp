<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="2-6">
    <link rel="icon" href="icon/ticket.ico">
    <title>统计分析</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <style type="text/css">
        body{
            background-image: url(bkimg/13.jpg);
            background-size: cover;
        }
    </style>
</head>

<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">工作票数据管理系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">总览</a></li>
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                        <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">用户</li>
                                <li><a href="userManage.jsp">查看</a></li>
                                <li><a href="forget.jsp">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">工作票</li>
                                <li><a href="ticketManage.jsp">查看</a></li>
                                <li class="active"><a href="#">统计分析</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>
<br>
<br>

<div class="container">

    <form class="form-data" action="forTest.testchart" method="post" style="text-align: center;" name="data">
        <h2 class="form-signin-heading">统计分析</h2>
        <br>
        <br>
        <table style="font-size:18px;" align="center">
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;"><i class="glyphicon glyphicon-user"></i></span>
                        <select class="selectpicker form-control" onchange="attr.value=this.value" aria-describedby="basic-addon1" style="width: 250px;" name="attr_hidden">
                            <option value="" selected>请选择工作票属性(字段)</option>
                            <option value="ticketnumber">ID</option>
                            <option value="ipccustomer">用户全称</option>
                            <option value="customercode">用户代码</option>
                            <option value="cause">原因</option>
                            <option value="summary">问题描述</option>
                            <option value="componenttype">组件类型</option>
                            <option value="ostype">OS类型</option>
                            <option value="identifier">标识符</option>
                            <option value="ticketstatus">状态</option>
                            <option value="lastoccurrence">闭合时间</option>
                            <option value="node">节点ID</option>
                            <option value="resolution">解决方案</option>
                            <option value="servername">服务器名称</option>
                            <option value="alertgroup">告警组</option>
                            <option value="component">组件</option>
                            <option value="firstoccurrence">产生时间</option>
                            <option value="severity">问题严重程度</option>
                        </select>
                        <input type="hidden" name="attr">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="row">&nbsp</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="row">&nbsp</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;"><i class="glyphicon glyphicon-lock"></i></span>
                        <select class="selectpicker form-control" onchange="chart.value=this.value" aria-describedby="basic-addon1" style="width: 250px;" name="chart_hidden">
                            <option value="" selected>请选择工作票属性(字段)</option>
                            <%--<option value="line">折线图</option>--%>
                            <option value="bar">柱状图</option>
                            <option value="pie">饼图</option>
                        </select>
                        <input type="hidden" name="chart">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="row">&nbsp</div>
                </td>
            </tr>
            <tr>
                <td>
                    <script language="javascript">
                        function st_check(){
                            data.attr.value = data.attr_hidden.value;
                            data.chart.value = data.chart_hidden.value;
                            if(data.attr.value=="" || data.chart.value=="") {
                                alert("信息填写不完整，请重新输入!");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btn-data" onclick="return st_check();">绘制图表</button>
                </td>
            </tr>
        </table>
    </form>

</div> <!-- /container -->

<!-- Bootstrap core JavaScript
================================================== -->
<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
