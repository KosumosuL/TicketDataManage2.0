<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>注册</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <link href="toastr/toastr.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="toastr/toastr.min.js"></script>
    <style type="text/css">
        body{
            background-image: url(bkimg/10.jpg);
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
            var clear_id = false;
            if(alertInfo==null){
                alertInfo = '<%=session.getAttribute("alert")%>';
                clear = true;
            }
            if(alertInfo!='null'){
                if(alertInfo=="name_invalid"){ toastr.error("用户名无效，请重新填写！");}
                else if(alertInfo=="pwd_invalid"){ toastr.error("密码无效，请重新填写！");}
                else if(alertInfo=="id_num_invalid"){ toastr.error("身份证号和出生地、出生日期不匹配，请重新填写！");}
                else if(alertInfo=="tel_invalid"){ toastr.error("手机号码无效，请重新填写！");}
                else if(alertInfo=="success"){
                    toastr.success("注册成功！您的ID为：" + '<%=session.getAttribute("success_id")%>', {"timeOut":"50000"});
                    clear_id = true;
                }
                else { toastr.error('注册失败！');}
                if(clear){ <%session.removeAttribute("alert");%>}
                if(clear_id){ <%session.removeAttribute("success_id");%>}
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
                        <li class="active"><a href="">注册</a></li>
                        <li class="dropdown">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理<span class="caret"></span></a>
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

    <form class="form-register" action=".sign_up" method="post" style="text-align: center;" name="register">
        <h2 class="form-signin-heading">注册</h2>
        <br>

        <table style="font-size:18px;" align="center">
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;">用户名</span>
                        <input type="text" class="form-control" name="name" placeholder="7位汉字或14位数字,字母和下划线内" style="width: 250px;">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">密码</span>
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
                    <div class="row">&nbsp</div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;">出生地</span>
                        <select class="selectpicker form-control" name="baddr_hidden" style="width: 250px;">
                            <option value="" selected>请选择</option>
                            <option value="12">天津</option>
                            <option value="13">河北</option>
                            <option value="14">山西</option>
                            <option value="15">内蒙古</option>
                            <option value="21">辽宁</option>
                            <option value="22">吉林</option>
                            <option value="23">黑龙江</option>
                            <option value="31">上海</option>
                            <option value="32">江苏</option>
                            <option value="33">浙江</option>
                            <option value="34">安徽</option>
                            <option value="35">福建</option>
                            <option value="36">江西</option>
                            <option value="37">山东</option>
                            <option value="41">河南</option>
                            <option value="42">湖北</option>
                            <option value="43">湖南</option>
                            <option value="44">广东</option>
                            <option value="45">广西</option>
                            <option value="46">海南</option>
                            <option value="50">重庆</option>
                            <option value="51">四川</option>
                            <option value="52">贵州</option>
                            <option value="53">云南</option>
                            <option value="54">西藏</option>
                            <option value="61">陕西</option>
                            <option value="62">甘肃</option>
                            <option value="63">青海</option>
                            <option value="64">宁夏</option>
                            <option value="65">新疆</option>
                            <option value="71">台湾</option>
                            <option value="81">香港</option>
                            <option value="82">澳门</option>
                            <option value="91">国外</option>
                        </select>
                        <input type="hidden" name="baddr">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">出生日期</span>
                        <input type="date" class="form-control" name="bdate_hidden" style="width: 250px;">
                        <input type="hidden" name="bdate">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">手机号码</span>
                        <input type="text" class="form-control" name="tel" placeholder="8-16位数字" style="width: 250px;">
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
                            register.baddr.value = register.baddr_hidden.value;
                            register.bdate.value = register.bdate_hidden.value;
                            if(register.name.value=="" || register.pwd.value=="" || register.baddr.value=="" || register.bdate.value=="" || register.id_num.value=="" || register.tel.value=="") {
                                toastr.warning('信息填写不完整，请重新输入!');
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btn-register" onclick="return check();">注册</button>
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
