<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>TicketDataManager</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <link href="static.bootstrap/css/cover.css" rel="stylesheet">
    <style type="text/css">
        body{
            background: url(bkimg/simple-codelines.svg) no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<div class="site-wrapper">
    <div class="site-wrapper-inner">
        <div class="cover-container">
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
                                <a class="navbar-brand" href="#">工作票数据管理系统</a>
                            </div>
                            <div id="navbar" class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li><a href="index.jsp">总览</a></li>
                                    <li><a href="login.jsp">登录</a></li>
                                    <li><a href="register.jsp">注册</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                                        <ul class="dropdown-menu">
                                            <li class="dropdown-header">用户</li>
                                            <li><a href=".adminManage">总览</a></li>
                                            <li><a href="forget.jsp">修改密码</a></li>
                                            <li role="separator" class="divider"></li>
                                            <li class="dropdown-header">工作票</li>
                                            <li><a href=".userManage">总览</a></li>
                                            <li><a href=".filterSearch">查询</a></li>
                                            <li><a href=".filterStatis">统计分析</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="active"><a href="#">致谢</a></li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
            <div class="inner cover">
                <h1 class="cover-heading">Ticket Data Manager</h1>
                <p class="lead">Courtesy to <a href="https://github.com/twbs/bootstrap">Bootstrap</a> and <a href="https://github.com/apache/incubator-echarts">ECharts</a><br>Supervised by Professor Xu Jian(dolphin.xu@njust.edu.cn)</p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Achieved by Zhang Zhengxi and Zhao Liang of Team 2-6</p>
                </div>
            </div>

        </div>

    </div>

</div>
<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>