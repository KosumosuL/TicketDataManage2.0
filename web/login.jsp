<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>登录</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <style type="text/css">
        body{
            background-image: url(bkimg/9.jpg);
            background-size: cover;
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
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">工作票数据管理系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="index.jsp">总览</a></li>
                        <li class="active"><a href="">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                        <li class="dropdown">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">用户</li>
                                <li><a href=".adminManage">总览</a></li>
                                <li><a href="forget.jsp">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">工作票</li>
                                <li><a href=".userManage">总览</a></li>
                                <li><a href="search.jsp">查询</a></li>
                            </ul>
                        </li>
                        <%--<li><a href="personal.jsp">个人信息</a></li>--%>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="acknowledge.jsp">致谢</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<br>
<br>

<div class="container">

    <form class="form-login" action=".sign_in" method="post" style="text-align: center;" name="signin">
        <h2 class="form-signin-heading">请登录</h2>
        <a href="forget.jsp">忘记密码?</a>
        <br>
        <br>
        <table style="font-size:18px;" align="center">
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;"><i class="glyphicon glyphicon-user"></i></span>
                        <input type="text" class="form-control" name="id" placeholder="ID" style="width: 250px;">
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
                        <input type="password" class="form-control" name="pwd" placeholder="密码" style="width: 250px;">
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
                    <div class="radio">
                        <label>
                            <input type="radio" value="admin" name="identity" checked> 管理员
                        </label>
                        <label>
                            <input type="radio" value="user" name="identity"> 用户
                        </label>
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
                        function check(){
                            if(signin.id.value=="" || signin.pwd.value=="") {
                                showalert("信息填写不完整，请重新输入!");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btn-signin" onclick="return check();">登录</button>
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
