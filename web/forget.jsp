<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>修改密码</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <link href="toastr/toastr.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="toastr/toastr.min.js"></script>
    <style type="text/css">
        body{
            background-image: url(bkimg/11.jpg);
            background-size: cover;
        }
    </style>
    <script type="text/javascript">
        toastr.options = {
            "closeButton": true,                            //是否显示关闭按钮
            "debug": false,                                 //是否使用debug模式
            "positionClass": "toast-center-center",     //弹出窗的位置
            "showDuration": "300",                          //显示的动画时间
            "hideDuration": "1000",                         //消失的动画时间
            "timeOut": "5000",                              //展现时间
            "extendedTimeOut": "1000",                      //加长展示时间
            "showEasing": "swing",                          //显示时的动画缓冲方式
            "hideEasing": "linear",                         //消失时的动画缓冲方式
            "showMethod": "fadeIn",                         //显示时的动画方式
            "hideMethod": "fadeOut"                          //消失时的动画方式
        };
        function showalert(alertInfo){
            var clear = false;
            if(alertInfo==null){
                alertInfo = '<%=session.getAttribute("alert")%>';
                clear = true;
            }
            if(alertInfo!='null'){
                if(alertInfo=="pwd_invalid"){ toastr.error("密码无效，请重新填写！");}
                else if(alertInfo=="id_num_invalid"){ toastr.error("身份证号无效，请重新填写！");}
                else if(alertInfo=="tel_invalid"){ toastr.error("手机号码无效，请重新填写！");}
                else if(alertInfo=="id_id_num"){ toastr.error('账号和身份证号不匹配！');}
                else if(alertInfo=="notexist"){ toastr.error('账号不存在！');}
                else if(alertInfo=="success"){ toastr.success('操作成功！');}
                else { toastr.error('操作失败！');}
                if(clear){ <%session.removeAttribute("alert");%>}
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
                        <li><a href="login.jsp">登录</a></li>
                        <li><a href="register.jsp">注册</a></li>
                        <li class="dropdown active">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li class="dropdown-header">用户</li>
                                <li><a href=".adminManage">总览</a></li>
                                <li class="active"><a href="">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li class="dropdown-header">工作票</li>
                                <li><a href=".userManage">总览</a></li>
                                <li><a href=".filterSearch">查询</a></li>
                                <li><a href=".filterStatis">统计分析</a></li>
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

<div class="container" style="text-align: center;">

    <form class="form-forget" action=".resetPwd" method="post" style="text-align: center;" name="forget">
        <h2 class="form-signin-heading">修改密码</h2>
        <br>

        <table style="font-size:18px;" align="center">
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;">ID</span>
                        <input type="text" class="form-control" name="id" style="width: 250px;">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">身份证号</span>
                        <input type="text" class="form-control" name="id_num" placeholder="15或18位有效身份证号" style="width: 250px;">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">新密码</span>
                        <input type="password" class="form-control" name="pwd" placeholder="8-16位数字和字母" style="width: 250px;">
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
                    <script language="javascript">
                        function check(){
                            if(forget.id.value=="" || forget.pwd.value=="" || forget.id_num.value=="") {
                                toastr.warning("信息填写不完整");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btn-forget" onclick="return check();">修改密码</button>
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
