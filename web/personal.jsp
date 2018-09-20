<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>个人信息</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <link href="toastr/toastr.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="toastr/toastr.min.js"></script>
    <style type="text/css">
        body{
            background-image: url(bkimg/14.jpg);
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
                if(alertInfo=="name_invalid"){ toastr.error("用户名无效，请重新填写！");}
                else if(alertInfo=="id_num_invalid"){ toastr.error("身份证号无效，请重新填写！");}
                else if(alertInfo=="tel_invalid"){ toastr.error("手机号码无效，请重新填写！");}
                else if(alertInfo=="success"){ toastr.success('操作成功！');}
                else { toastr.error('操作失败！');}
                if(clear){ <%session.removeAttribute("alert");%>}
            }
        }
    </script>
</head>
<body onload="showalert(null)">
<c:set var="userid" value="${sessionScope._userid_}"/>
<c:set var="adminid" value="${sessionScope._adminid_}"/>
<c:if test="${userid!=null}">
    <c:set var="name" value="${sessionScope._username_}"/>
    <c:set var="pwd" value="${sessionScope._userpwd_}"/>
    <c:set var="baddr" value="${sessionScope._userbaddr_}"/>
    <c:set var="bdate" value="${sessionScope._userbdate_}"/>
    <c:set var="id_num" value="${sessionScope._userid_num_}"/>
    <c:set var="tel" value="${sessionScope._usertel_}"/>
    <c:set var="view" value="${sessionScope._userview_}"/>
    <c:set var="sear" value="${sessionScope._usersear_}"/>
    <c:set var="tadd" value="${sessionScope._usertadd_}"/>
    <c:set var="statis" value="${sessionScope._userstatis_}"/>
    <c:set var="inut" value="${sessionScope._userinut_}"/>
    <c:set var="previous" value="../.userManage"/>
</c:if>
<c:if test="${adminid!=null}">
    <c:set var="name" value="${sessionScope._adminname_}"/>
    <c:set var="pwd" value="${sessionScope._adminpwd_}"/>
    <c:set var="baddr" value="${sessionScope._adminbaddr_}"/>
    <c:set var="bdate" value="${sessionScope._adminbdate_}"/>
    <c:set var="id_num" value="${sessionScope._adminid_num_}"/>
    <c:set var="tel" value="${sessionScope._admintel_}"/>
    <c:set var="previous" value="../.adminManage"/>
</c:if>
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
                    <a class="navbar-brand" href="">工作票数据管理系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${previous}">返回</a></li>
                        <li><a href="logout.jsp">退出</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<br>
<br>

<div class="container" style="text-align: center;">

    <form class="form-personal" action=".infoModify" method="post" style="text-align: center;" name="personal">
        <h2 class="form-signin-heading">个人信息</h2>
        <a href="forget.jsp">修改密码</a>
        <br>
        <br>
        <table style="font-size:18px;" align="center">
            <tr>
                <td>
                    您的身份：
                    <div class="radio" style="display: inline;">
                        <label>
                            <input type="radio" value="admin" name="identity" ${adminid!=null?"checked":""} disabled> 管理员
                        </label>
                        <label>
                            <input type="radio" value="user" name="identity" ${userid!=null?"checked":""} disabled> 用户
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
                    <div class="input-group">
                        <span class="input-group-addon" style="width: 85px;text-align: center;">ID</span>
                        <input type="text" class="form-control" name="id" value="${adminid!=null?adminid:userid}" disabled style="width: 250px;">
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
                        <span class="input-group-addon" style="width: 85px;text-align: center;">用户名</span>
                        <input type="text" class="form-control" name="name" value="${name}" placeholder="7位汉字或14位数字,字母和下划线内" style="width: 250px;">
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
                        <input type="password" class="form-control" name="pwd" value="${pwd}" style="width: 250px;" disabled>
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
                        <select class="selectpicker form-control" style="width: 250px;" name="baddr_hidden">
                            <option value="12" ${baddr=="天津"?"selected":""}>天津</option>
                            <option value="13" ${baddr=="河北"?"selected":""}>河北</option>
                            <option value="14" ${baddr=="山西"?"selected":""}>山西</option>
                            <option value="15" ${baddr=="内蒙古"?"selected":""}>内蒙古</option>
                            <option value="21" ${baddr=="辽宁"?"selected":""}>辽宁</option>
                            <option value="22" ${baddr=="吉林"?"selected":""}>吉林</option>
                            <option value="23" ${baddr=="黑龙江"?"selected":""}>黑龙江</option>
                            <option value="31" ${baddr=="上海"?"selected":""}>上海</option>
                            <option value="32" ${baddr=="江苏"?"selected":""}>江苏</option>
                            <option value="33" ${baddr=="浙江"?"selected":""}>浙江</option>
                            <option value="34" ${baddr=="安徽"?"selected":""}>安徽</option>
                            <option value="35" ${baddr=="福建"?"selected":""}>福建</option>
                            <option value="36" ${baddr=="江西"?"selected":""}>江西</option>
                            <option value="37" ${baddr=="山东"?"selected":""}>山东</option>
                            <option value="41" ${baddr=="河南"?"selected":""}>河南</option>
                            <option value="42" ${baddr=="湖北"?"selected":""}>湖北</option>
                            <option value="43" ${baddr=="湖南"?"selected":""}>湖南</option>
                            <option value="44" ${baddr=="广东"?"selected":""}>广东</option>
                            <option value="45" ${baddr=="广西"?"selected":""}>广西</option>
                            <option value="46" ${baddr=="海南"?"selected":""}>海南</option>
                            <option value="50" ${baddr=="重庆"?"selected":""}>重庆</option>
                            <option value="51" ${baddr=="四川"?"selected":""}>四川</option>
                            <option value="52" ${baddr=="贵州"?"selected":""}>贵州</option>
                            <option value="53" ${baddr=="云南"?"selected":""}>云南</option>
                            <option value="54" ${baddr=="西藏"?"selected":""}>西藏</option>
                            <option value="61" ${baddr=="陕西"?"selected":""}>陕西</option>
                            <option value="62" ${baddr=="甘肃"?"selected":""}>甘肃</option>
                            <option value="63" ${baddr=="青海"?"selected":""}>青海</option>
                            <option value="64" ${baddr=="宁夏"?"selected":""}>宁夏</option>
                            <option value="65" ${baddr=="新疆"?"selected":""}>新疆</option>
                            <option value="71" ${baddr=="台湾"?"selected":""}>台湾</option>
                            <option value="81" ${baddr=="香港"?"selected":""}>香港</option>
                            <option value="82" ${baddr=="澳门"?"selected":""}>澳门</option>
                            <option value="91" ${baddr=="国外"?"selected":""}>国外</option>
                        </select>
                        <input type="hidden" name="baddr" value="${baddr}">
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
                        <fmt:parseDate value="${bdate}" pattern="yyyy-MM-dd" var="bdate_parsed"/>
                        <fmt:formatDate value="${bdate_parsed}" pattern="yyyy-MM-dd" var="bdate_format"/>
                        <span class="input-group-addon" style="width: 85px;text-align: center;">出生日期</span>
                        <input type="date" class="form-control" name="bdate_hidden" value="${bdate_format}" style="width: 250px;">
                        <input type="hidden" name="bdate" value="${bdate_format}">
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
                        <input type="text" class="form-control" name="id_num" value="${id_num}" placeholder="15或18位有效身份证号" style="width: 250px;">
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
                        <input type="text" class="form-control" name="tel" value="${tel}" placeholder="8-16位数字" style="width: 250px;">
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="row">&nbsp</div>
                </td>
            </tr>
            <c:if test="${userid!=null}">
                <tr>
                    <td>
                        <div class="row">&nbsp</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4><span class="label label-primary">权限</span></h4>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 15px">
                        <div class="checkbox">
                            <label><input type="checkbox" value="0" name="view" ${view==true?"checked":""} disabled>修改、删除</label>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="1" name="sear" ${sear==true?"checked":""} disabled>查询</label>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="2" name="tadd" ${tadd==true?"checked":""} disabled>新增</label>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="3" name="statis" ${statis==true?"checked":""} disabled>统计分析</label>
                        </div>
                        <div class="checkbox">
                            <label><input type="checkbox" value="4" name="inut" ${inut==true?"checked":""} disabled>导入导出</label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="row">&nbsp</div>
                    </td>
                </tr>
            </c:if>
            <tr>
                <td>
                    <script language="javascript">
                        personal.baddr.value = personal.baddr_hidden.value;
                        personal.bdate.value = personal.bdate_hidden.value;
                        function check(){
                            if(personal.name.value=="" || personal.bdate.value=="" || personal.id_num.value=="" || personal.tel.value=="") {
                                toast.warning("信息填写不完整");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <button class="btn btn-lg btn-primary btn-block" type="submit" name="btn-personal" onclick="return check();">修改</button>
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
