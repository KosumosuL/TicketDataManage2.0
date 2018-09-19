<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>没有权限</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container" style="text-align: center;">
        <img src="bkimg/12.png" width="1000" height="676">
        <p>对不起，您没有权限访问该页面！</p>
        <p><a class="btn btn-lg btn-success" href="index.jsp" role="button">回到首页</a></p>
        <%--等待美工--%>
        <p>请先登录或者注册</p>
        <p>
            <a class="btn btn-lg btn-info" href="login.jsp" role="button">登录</a>
            <a class="btn btn-lg btn-info" href="register.jsp" role="button">注册</a>
        </p>
    </div>

<!-- Bootstrap core JavaScript
================================================== -->
<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
