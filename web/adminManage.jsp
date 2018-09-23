<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="icon" href="icon/favicon.ico">
    <meta charset="utf-8">
    <link rel="stylesheet" href="static.bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="static.bootstrap/css/dashboard.css" >
    <link href="toastr/toastr.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="toastr/toastr.min.js"></script>
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
                if(alertInfo=="login_success"){ toastr.success("登录成功！");}
                else if(alertInfo=="name_invalid"){ toastr.error("用户名无效，请重新填写！");}
                else if(alertInfo=="pwd_invalid"){ toastr.error("密码无效，请重新填写！");}
                else if(alertInfo=="id_num_invalid"){ toastr.error("身份证号和出生地、出生日期不匹配，请重新填写！");}
                else if(alertInfo=="tel_invalid"){ toastr.error("手机号码无效，请重新填写！");}
                else if(alertInfo=="success_add"){
                    toastr.success("新增用户成功！新增用户的ID为：" + '<%=session.getAttribute("success_id")%>', {"timeOut":"50000"});
                    clear_id = true;
                }
                else if(alertInfo=="success"){ toastr.success("操作成功！");}
                else { toastr.error('操作失败！');}
                if(clear){ <%session.removeAttribute("alert");%>}
                if(clear_id){ <%session.removeAttribute("success_id");%>}
            }
        }
    </script>
</head>
<body onload="showalert(null)">
<c:set var="usersPerPage" value="${sessionScope.usersPerPage}"/>
<c:set var="name_display" value="${sessionScope.name_display}"/>
<c:set var="pwd_display" value="${sessionScope.pwd_display}"/>
<c:set var="baddr_display" value="${sessionScope.baddr_display}"/>
<c:set var="bdate_display" value="${sessionScope.bdate_display}"/>
<c:set var="id_num_display" value="${sessionScope.id_num_display}"/>
<c:set var="tel_display" value="${sessionScope.tel_display}"/>
<c:set var="authority_display" value="${sessionScope.authority_display}"/>
<c:set var="_adminid_" value="${sessionScope._adminid_}"/>
<c:set var="_adminname_" value="${sessionScope._adminname_}"/>
<c:set var="totalUsers" value="${requestScope.totalUsers}"/>
<c:set var="totalPages" value="${requestScope.totalPages}"/>
<c:set var="page" value="${requestScope.page}"/>
<c:set var="currentPageUsers" value="${requestScope.currentPageUsers}"/>
<c:set var="sort_attr" value="${sessionScope.sort_attr}"/>
<c:set var="sort_type" value="${sessionScope.sort_type}"/>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">用户管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a onclick="javascript:history.back(-1);">返回</a></li>
                <li><a href="logout.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a>总览<span class="sr-only">(current)</span></a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a>个人信息</a></li>
                <li>
                    <a style="display: table-cell;width: 150px;">您的ID：</a>
                    <a style="display: table-cell;width: 150px;">${_adminid_}</a>
                </li>
                <li>
                    <a style="display: table-cell;width: 150px;">您的用户名：</a>
                    <a style="display: table-cell;width: 150px;">${_adminname_}</a>
                </li>
                <li>
                    <a href="personal.jsp">查看详情</a>
                </li>
            </ul>
            <form name="formDisplay" action="/.adminManage" method="post">
                <input type="hidden" name="sort_attr">
                <input type="hidden" name="sort_type">
                <ul class="nav nav-sidebar">
                    <li><a>用户字段</a></li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="id_display" name="id_display" checked disabled>ID</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="name_display" name="name_display" ${name_display==true?"checked":""}>用户名</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="pwd_display" name="pwd_display" ${pwd_display==true?"checked":""}>密码</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="baddr_display" name="baddr_display" ${baddr_display==true?"checked":""}>出生地</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="bdate_display" name="bdate_display" ${bdate_display==true?"checked":""}>出生日期</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="id_num_display" name="id_num_display" ${id_num_display==true?"checked":""}>身份证号</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="tel_display" name="tel_display" ${tel_display==true?"checked":""}>手机号码</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="authority_display" name="authority_display" ${authority_display==true?"checked":""}>权限</a>
                    </li>
                    <li>
                        <a>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">排序字段</span>
                                <select class="selectpicker form-control" name="sort_attr_hidden">
                                    <option value="id" ${sort_attr=="id"?'selected':''}>ID</option>
                                    <option value="name" ${sort_attr=="name"?'selected':''}>用户名</option>
                                    <%--<option value="password" ${sort_attr=="password"?'selected':''}>密码</option>--%>
                                    <option value="baddr" ${sort_attr=="baddr"?'selected':''}>出生地</option>
                                    <option value="bdate" ${sort_attr=="bdate"?'selected':''}>出生日期</option>
                                    <option value="id_num" ${sort_attr=="id_num"?'selected':''}>身份证号</option>
                                    <option value="tel" ${sort_attr=="tel"?'selected':''}>手机号码</option>
                                </select>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">排序方式</span>
                                <select class="selectpicker form-control" name="sort_type_hidden">
                                    <option value="ascend" ${sort_type=="ascend"?'selected':''}>升序</option>
                                    <option value="descend" ${sort_type=="descend"?'selected':''}>降序</option>
                                </select>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a>
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">每页显示</span>
                                <input type="text" class="form-control" value="${usersPerPage}" name="usersPerPage">
                            </div>
                        </a>
                    </li>
                    <li>
                        <script language="javascript">
                            function isNumber(obj){
                                var reg = /^[0-9]+$/;
                                return reg.test(obj);
                            }
                            function displayCheck () {
                                if(!isNumber(formDisplay.usersPerPage.value) || formDisplay.usersPerPage.value < 1) {
                                    toastr.warning("每页显示的用户数必须为正整数");
                                    return false;
                                }
                                formDisplay.sort_attr.value = formDisplay.sort_attr_hidden.value;
                                formDisplay.sort_type.value = formDisplay.sort_type_hidden.value;
                                return true;
                            }
                        </script>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="submit" name="display" value="应用" onclick="return displayCheck();" class="btn btn-sm btn-info"></a>
                    </li>
                </ul>
            </form>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h4 class="page-header">
                用户总数:${totalUsers}
                每页用户数:${usersPerPage}
                总页数:${totalPages}
                当前页:${page}
                <form name="userAdd" action="forAction/.servletadminManage" method="post" style="display: inline;">
                    <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#user_add">新增用户</button>
                    <div class="modal fade" id="user_add" tabindex="-1" role="dialog" aria-labelledby="user_add_label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button data-dismiss="modal" class="close" type="button">
                                        <span aria-hidden="true">×</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title" id="user_add_label">新增用户</h4>
                                </div>
                                <div class="modal-body" align="center">
                                    <table style="font-size:18px">
                                        <tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 85px;text-align: center;">用户名</span>
                                                    <input type="text" class="form-control" name="name_add" placeholder="7位汉字或14位数字,字母和下划线内" style="width: 250px;">
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
                                                    <input type="password" class="form-control" name="pwd_add" placeholder="长度8-16,数字和字母" style="width: 250px;">
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
                                                    <select class="selectpicker form-control" name="baddr_add_hidden" style="width: 250px;">
                                                        <option value="" selected>请选择</option>
                                                        <option value="12">天津</option>
                                                        <option value="13">河北</option>
                                                        <option value="14">山西</option>
                                                        <option value="15"}>内蒙古</option>
                                                        <option value="21">辽宁</option>
                                                        <option value="22">吉林</option>
                                                        <option value="23"}>黑龙江</option>
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
                                                    <input type="hidden" name="baddr_add">
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
                                                    <input type="date" class="form-control" name="bdate_add_hidden" style="width: 250px;">
                                                    <input type="hidden" name="bdate_add">
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
                                                    <input type="text" class="form-control" name="id_num_add" placeholder="15或18位有效身份证号" style="width: 250px;">
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
                                                    <input type="text" class="form-control" name="tel_add" placeholder="8-16位数字" style="width: 250px;">
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
                                                <h4><span class="label label-primary">权限</span></h4>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 15px">
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="0" name="view_add">修改、删除</label>
                                                </div>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="1" name="sear_add">查询</label>
                                                </div>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="2" name="tadd_add">新增</label>
                                                </div>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="3" name="statis_add">统计分析</label>
                                                </div>
                                                <div class="checkbox">
                                                    <label><input type="checkbox" value="4" name="inut_add">导入导出</label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <script language="javascript">
                                        function userCheck_add(){
                                            userAdd.baddr_add.value = userAdd.baddr_add_hidden.value;
                                            userAdd.bdate_add.value = userAdd.bdate_add_hidden.value;
                                            if(userAdd.name_add.value=="" || userAdd.pwd_add.value=="" || userAdd.baddr_add.value=="" || userAdd.bdate_add.value=="" || userAdd.id_num_add.value=="" || userAdd.tel_add.value=="") {
                                                toastr.warning("信息填写不完整");
                                                return false;
                                            }
                                            return true;
                                        }
                                    </script>
                                    <input type="submit" name="add" value="新增" onclick="return userCheck_add();" class="btn btn-success">
                                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                    </div>
                </form>
            </h4>
            <form name="userMod" class="form-group" action="forAction/.servletadminManage" method="post">
                <input type="hidden" name="_id_" value="">
                <table class="table table-hover table-responsive table-striped table-bordered">
                    <thead>
                    <tr>
                        <td>ID</td>
                        <c:if test="${name_display == true}"><td>用户名</td></c:if>
                        <c:if test="${pwd_display == true}"><td>密码</td></c:if>
                        <c:if test="${baddr_display == true}"><td>出生地</td></c:if>
                        <c:if test="${bdate_display == true}"><td>出生日期</td></c:if>
                        <c:if test="${id_num_display == true}"><td>身份证号</td></c:if>
                        <c:if test="${tel_display == true}"><td>手机号码</td></c:if>
                        <c:if test="${authority_display == true}"><td>权限</td></c:if>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${currentPageUsers}">
                        <tr>
                            <td>${user.id}</td>
                            <c:if test="${name_display == true}"><td>${user.name}</td></c:if>
                            <c:if test="${pwd_display == true}"><td>${user.pwd}</td></c:if>
                            <c:if test="${baddr_display == true}"><td>${user.baddr}</td></c:if>
                            <c:if test="${bdate_display == true}"><td>${user.bdate}</td></c:if>
                            <c:if test="${id_num_display == true}"><td>${user.id_num}</td></c:if>
                            <c:if test="${tel_display == true}"><td>${user.tel}</td></c:if>
                            <c:if test="${authority_display == true}">
                                <td>
                                    <p>
                                        <c:if test="${user.view == true}"><span class="label label-primary">修改、删除</span></c:if>
                                        <c:if test="${user.sear == true}"><span class="label label-success">查询</span></c:if>
                                        <c:if test="${user.tadd == true}"><span class="label label-info">新增</span></c:if>
                                        <c:if test="${user.statis == true}"><span class="label label-warning">统计分析</span></c:if>
                                        <c:if test="${user.inut == true}"><span class="label label-danger">导入导出</span></c:if>
                                    </p>
                                </td>
                            </c:if>
                            <td>
                                <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#user_${user.id}">查看</button>
                                <div class="modal fade" id="user_${user.id}" tabindex="-1" role="dialog" aria-labelledby="user_${user.id}_label" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button data-dismiss="modal" class="close" type="button">
                                                    <span aria-hidden="true">×</span>
                                                    <span class="sr-only">Close</span>
                                                </button>
                                                <h4 class="modal-title" id="user_${user.id}_label">用户信息</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <table style="font-size:18px">
                                                    <tr>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 85px;text-align: center;">ID</span>
                                                                <input type="text" class="form-control" name="id_${user.id}" value="${user.id}" style="width: 250px;" readonly>
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
                                                                <input type="text" class="form-control" name="name_${user.id}" value="${user.name}" style="width: 250px;">
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
                                                                <input type="text" class="form-control" name="pwd_${user.id}" value="${user.pwd}" style="width: 250px;">
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
                                                                <select class="selectpicker form-control" style="width: 250px;" name="baddr_${user.id}_hidden">
                                                                    <option value="12" ${user.baddr=="天津"?'selected':''}>天津</option>
                                                                    <option value="13" ${user.baddr=="河北"?'selected':''}>河北</option>
                                                                    <option value="14" ${user.baddr=="山西"?'selected':''}>山西</option>
                                                                    <option value="15" ${user.baddr=="内蒙古"?'selected':''}>内蒙古</option>
                                                                    <option value="21" ${user.baddr=="辽宁"?'selected':''}>辽宁</option>
                                                                    <option value="22" ${user.baddr=="吉林"?'selected':''}>吉林</option>
                                                                    <option value="23" ${user.baddr=="黑龙江"?'selected':''}>黑龙江</option>
                                                                    <option value="31" ${user.baddr=="上海"?'selected':''}>上海</option>
                                                                    <option value="32" ${user.baddr=="江苏"?'selected':''}>江苏</option>
                                                                    <option value="33" ${user.baddr=="浙江"?'selected':''}>浙江</option>
                                                                    <option value="34" ${user.baddr=="安徽"?'selected':''}>安徽</option>
                                                                    <option value="35" ${user.baddr=="福建"?'selected':''}>福建</option>
                                                                    <option value="36" ${user.baddr=="江西"?'selected':''}>江西</option>
                                                                    <option value="37" ${user.baddr=="山东"?'selected':''}>山东</option>
                                                                    <option value="41" ${user.baddr=="河南"?'selected':''}>河南</option>
                                                                    <option value="42" ${user.baddr=="湖北"?'selected':''}>湖北</option>
                                                                    <option value="43" ${user.baddr=="湖南"?'selected':''}>湖南</option>
                                                                    <option value="44" ${user.baddr=="广东"?'selected':''}>广东</option>
                                                                    <option value="45" ${user.baddr=="广西"?'selected':''}>广西</option>
                                                                    <option value="46" ${user.baddr=="海南"?'selected':''}>海南</option>
                                                                    <option value="50" ${user.baddr=="重庆"?'selected':''}>重庆</option>
                                                                    <option value="51" ${user.baddr=="四川"?'selected':''}>四川</option>
                                                                    <option value="52" ${user.baddr=="贵州"?'selected':''}>贵州</option>
                                                                    <option value="53" ${user.baddr=="云南"?'selected':''}>云南</option>
                                                                    <option value="54" ${user.baddr=="西藏"?'selected':''}>西藏</option>
                                                                    <option value="61" ${user.baddr=="陕西"?'selected':''}>陕西</option>
                                                                    <option value="62" ${user.baddr=="甘肃"?'selected':''}>甘肃</option>
                                                                    <option value="63" ${user.baddr=="青海"?'selected':''}>青海</option>
                                                                    <option value="64" ${user.baddr=="宁夏"?'selected':''}>宁夏</option>
                                                                    <option value="65" ${user.baddr=="新疆"?'selected':''}>新疆</option>
                                                                    <option value="71" ${user.baddr=="台湾"?'selected':''}>台湾</option>
                                                                    <option value="81" ${user.baddr=="香港"?'selected':''}>香港</option>
                                                                    <option value="82" ${user.baddr=="澳门"?'selected':''}>澳门</option>
                                                                    <option value="91" ${user.baddr=="国外"?'selected':''}>国外</option>
                                                                </select>
                                                                <input type="hidden" name="baddr_${user.id}" value="${user.baddr}">
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
                                                                <fmt:parseDate value="${user.bdate}" pattern="yyyy-MM-dd" var="bdate_parsed"/>
                                                                <fmt:formatDate value="${bdate_parsed}" pattern="yyyy-MM-dd" var="bdate_format"/>
                                                                <span class="input-group-addon" style="width: 85px;text-align: center;">出生日期</span>
                                                                <input type="date" class="form-control" name="bdate_${user.id}_hidden" value="${bdate_format}" style="width: 250px;">
                                                                <input type="hidden" name="bdate_${user.id}" value="${bdate_format}">
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
                                                                <input type="text" class="form-control" name="id_num_${user.id}" value="${user.id_num}" style="width: 250px;">
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
                                                                <input type="text" class="form-control" name="tel_${user.id}" value="${user.tel}" style="width: 250px;">
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
                                                            <h4><span class="label label-primary">权限</span></h4>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="font-size: 15px">
                                                            <div class="checkbox">
                                                                <label><input type="checkbox" value="0" name="view_${user.id}" ${user.view==true?"checked":""}>修改、删除</label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label><input type="checkbox" value="1" name="sear_${user.id}" ${user.sear==true?"checked":""}>查询</label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label><input type="checkbox" value="2" name="tadd_${user.id}" ${user.tadd==true?"checked":""}>新增</label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label><input type="checkbox" value="3" name="statis_${user.id}" ${user.statis==true?"checked":""}>统计分析</label>
                                                            </div>
                                                            <div class="checkbox">
                                                                <label><input type="checkbox" value="4" name="inut_${user.id}" ${user.inut==true?"checked":""}>导入导出</label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <script language="javascript">
                                                    function userCheck_${user.id}(){
                                                        userMod.baddr_${user.id}.value = userMod.baddr_${user.id}_hidden.value;
                                                        userMod.bdate_${user.id}.value = userMod.bdate_${user.id}_hidden.value;
                                                        if(userMod.name_${user.id}.value=="" || userMod.bdate_${user.id}.value=="" || userMod.id_num_${user.id}.value=="" || userMod.tel_${user.id}.value=="") {
                                                            toastr.warning("信息填写不完整");
                                                            return false;
                                                        }
                                                        setId_${user.id}();
                                                        return true;
                                                    }
                                                    function setId_${user.id}() {
                                                        userMod._id_.value = userMod.id_${user.id}.value;
                                                    }
                                                </script>
                                                <input type="submit" name="modify_${user.id}" value="修改" onclick="return userCheck_${user.id}();" class="btn btn-success">
                                                <input type="submit" name="delete_${user.id}" value="删除" onclick="setId_${user.id}();" class="btn btn-danger">
                                                <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                                            </div>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
            <div class="text-right">
                <nav>
                    <ul class="pagination">
                        <li class="${page==1?"disabled":""}"><a href="<c:url value="/.adminManage?page=1"/>">首页</a></li>
                        <li class="${page==1?"disabled":""}"><a href="<c:url value="/.adminManage?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>
                        <c:forEach begin="${page-3<1?1:page-3}" end="${page+3>totalPages?totalPages:page+3}" varStatus="loop">
                            <c:set var="active" value="${loop.index==page?'active':''}"/>
                            <li class="${active}"><a href="<c:url value="/.adminManage?page=${loop.index}"/>">${loop.index}</a></li>
                        </c:forEach>
                        <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.adminManage?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a></li>
                        <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.adminManage?page=${totalPages}"/>">尾页</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.js"></script>
</body>
</html>