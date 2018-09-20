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
    <script type="text/javascript">
        function showalert(alertInfo){
            var clear = false;
            if(alertInfo==null){
                alertInfo = '<%=session.getAttribute("alert")%>';
                clear = true;
            }
            if(alertInfo!='null'){
                var url = "alert.jsp?alert=" + alertInfo;
                var name = "警告";
                var iWidth = 400;
                var iHeight = 180;
                var iTop = (window.screen.height-30-iHeight)/2;
                var iLeft = (window.screen.width-10-iWidth)/2;
                window.open(url,name,'height='+iHeight+',innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',directories=no,scrollbars=no,titlebar=no,toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
                if(clear){
                    <%session.removeAttribute("alert");%>
                }
            }
        }
    </script>
</head>
<body onload="showalert(null)">
<div class="site-wrapper">

    <div class="site-wrapper-inner">

        <div class="cover-container">

            <div class="masthead clearfix">
                <div class="inner">
                    <h3 class="masthead-brand">TDM</h3>
                    <nav>
                        <ul class="nav masthead-nav">
                            <li class="active"><a href="">Home</a></li>
                            <li><a href="acknowledge.jsp">Acknowledge</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <div class="inner cover">
                <h1 class="cover-heading">Ticket Data Manager</h1>
                <p class="lead">Allow efficient management of your tickets, featured with statistical analysis and user management.</p>
                <p class="lead">
                    <a href="login.jsp" class="btn btn-lg btn-default">Sign in</a>
                    <a href="register.jsp" class="btn btn-lg btn-default">Sign up</a>
                </p>
            </div>

            <div class="mastfoot">
                <div class="inner">
                    <p>Achieved by Team 2-6</p>
                </div>
            </div>

        </div>

    </div>

</div>
<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
