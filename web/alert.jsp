<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="2-6">
    <link rel="icon" href="icon/ticket.ico">
    <title>警告</title>
    <link rel="stylesheet" href="static.bootstrap/css/bootstrap.css" />
    <script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="static.bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="bs-docs-section" style="text-align: center">
    <h2 class="page-header">警告</h2>
    <p class="lead"><%=request.getParameter("alert")%></p>
    <p><a class="btn btn btn-primary" onclick="window.close();" role="button">确认</a></p>
</div>
</body>
</html>
