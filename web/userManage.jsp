<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作票管理</title>
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
                else if(alertInfo=="noaccess"){ toastr.warning("没有权限！");}
                else if(alertInfo=="success_add"){
                    toastr.success("新增工作票成功！新增工作票的ID为：" + '<%=session.getAttribute("success_id")%>', {"timeOut":"50000"});
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
<%--<c:set var="alert" value="${sessionScope.alert}"/>--%>
<%--<c:if test="${alert!=null}">--%>
    <%--<%request.getSession().removeAttribute("alert");%>--%>
<%--</c:if>--%>
<c:set var="ticketsPerPage" value="${sessionScope.ticketsPerPage}"/>
<c:set var="ipccustomer_display" value="${sessionScope.ipccustomer_display}"/>
<c:set var="customercode_display" value="${sessionScope.customercode_display}"/>
<c:set var="cause_display" value="${sessionScope.cause_display}"/>
<c:set var="summary_display" value="${sessionScope.summary_display}"/>
<c:set var="componenttype_display" value="${sessionScope.componenttype_display}"/>
<c:set var="ostype_display" value="${sessionScope.ostype_display}"/>
<c:set var="identifier_display" value="${sessionScope.identifier_display}"/>
<c:set var="ticketstatus_display" value="${sessionScope.ticketstatus_display}"/>
<c:set var="lastoccurrence_display" value="${sessionScope.lastoccurrence_display}"/>
<c:set var="node_display" value="${sessionScope.node_display}"/>
<c:set var="resolution_display" value="${sessionScope.resolution_display}"/>
<c:set var="servername_display" value="${sessionScope.servername_display}"/>
<c:set var="alertgroup_display" value="${sessionScope.alertgroup_display}"/>
<c:set var="component_display" value="${sessionScope.component_display}"/>
<c:set var="firstoccurrence_display" value="${sessionScope.firstoccurrence_display}"/>
<c:set var="severity_display" value="${sessionScope.severity_display}"/>
<c:set var="_userid_" value="${sessionScope._userid_}"/>
<c:set var="_username_" value="${sessionScope._username_}"/>
<c:set var="_userview_" value="${sessionScope._userview_}"/>
<c:set var="_usersear_" value="${sessionScope._usersear_}"/>
<c:set var="_usertadd_" value="${sessionScope._usertadd_}"/>
<c:set var="_userstatis_" value="${sessionScope._userstatis_}"/>
<c:set var="_userinut_" value="${sessionScope._userinut_}"/>
<c:set var="totalTickets" value="${requestScope.totalTickets}"/>
<c:set var="totalPages" value="${requestScope.totalPages}"/>
<c:set var="page" value="${requestScope.page}"/>
<c:set var="currentPageTickets" value="${requestScope.currentPageTickets}"/>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">工作票数据管理系统</a>
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
                <li><a href="search.jsp">查询</a></li>
                <li><a href=".filterStatis">统计</a></li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a>个人信息</a></li>
                <li>
                    <a style="display: table-cell;width: 150px;">您的ID：</a>
                    <a style="display: table-cell;width: 150px;">${_userid_}</a>
                </li>
                <li>
                    <a style="display: table-cell;width: 150px;">您的用户名：</a>
                    <a style="display: table-cell;width: 150px;">${_username_}</a>
                </li>
                <li><a>您的权限：</a></li>
                <li>
                    <a><input type="checkbox" ${_userview_==true?"checked":""} disabled>修改、删除</a>
                </li>
                <li>
                    <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" ${_usersear_==true?"checked":""} disabled>查询</a>
                    <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" ${_usertadd_==true?"checked":""} disabled>新增</a>
                </li>
                <li>
                    <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" ${_userstatis_==true?"checked":""} disabled>统计分析</a>
                    <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" ${_userinut_==true?"checked":""} disabled>导入导出</a>
                </li>
                <li>
                    <a href="personal.jsp">查看详情</a>
                </li>
            </ul>
            <form name="formDisplay" action="/.userManage" method="post">
                <ul class="nav nav-sidebar">
                    <li><a>工作票字段</a></li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="ticketnumber_display" name="ticketnumber_display" checked disabled>ID</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="ipccustomer_display" name="ipccustomer_display" ${ipccustomer_display==true?"checked":""}>用户全称</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="customercode_display" name="customercode_display" ${customercode_display==true?"checked":""}>用户代码</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="cause_display" name="cause_display" ${cause_display==true?"checked":""}>原因</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="summary_display" name="summary_display" ${summary_display==true?"checked":""}>问题描述</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="componenttype_display" name="componenttype_display" ${componenttype_display==true?"checked":""}>组件类型</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="ostype_display" name="ostype_display" ${ostype_display==true?"checked":""}>OS类型</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="identifier_display" name="identifier_display" ${identifier_display==true?"checked":""}>标识符</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="ticketstatus_display" name="ticketstatus_display" ${ticketstatus_display==true?"checked":""}>状态</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="lastoccurrence_display" name="lastoccurrence_display" ${lastoccurrence_display==true?"checked":""}>闭合时间</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="node_display" name="node_display" ${node_display==true?"checked":""}>节点ID</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="resolution_display" name="resolution_display" ${resolution_display==true?"checked":""}>解决方案</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="servername_display" name="servername_display" ${servername_display==true?"checked":""}>服务器全称</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="alertgroup_display" name="alertgroup_display" ${alertgroup_display==true?"checked":""}>告警组</a>
                    </li>
                    <li>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="component_display" name="component_display" ${component_display==true?"checked":""}>组件</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;"><input type="checkbox" value="firstoccurrence_display" name="firstoccurrence_display" ${firstoccurrence_display==true?"checked":""}>产生时间</a>
                    </li>
                    <li>
                        <a style="width: 150px;display: table-cell;vertical-align: middle;"><input type="checkbox" value="severity_display" name="severity_display" ${severity_display==true?"checked":""}>问题严重程度</a>
                        <a style="display: table-cell;width: 150px;vertical-align: middle;">
                            <div class="input-group input-group-sm">
                                <span class="input-group-addon">每页显示</span>
                                <input type="text" class="form-control" value="${ticketsPerPage}" name="ticketsPerPage">
                            </div>
                        </a>
                    </li>
                    <script language="javascript">
                        function isNumber(obj){
                            var reg = /^[0-9]+$/;
                            return reg.test(obj);
                        }
                        function displayCheck () {
                            if(!isNumber(formDisplay.ticketsPerPage.value) || formDisplay.ticketsPerPage.value < 1) {
                                toastr.warning("每页显示的工作票数必须为正整数");
                                return false;
                            }
                            return true;
                        }
                    </script>
                    <%--display区分是否改变页面显示参数--%>
                    <li><a><input type="submit" name="display" value="应用" onclick="return displayCheck();" class="btn btn-sm btn-info"></a></li>
                </ul>
            </form>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h4 class="page-header">
                工作票总数:${totalTickets}
                每页工作票数:${ticketsPerPage}
                总页数:${totalPages}
                当前页:${page}
                <form name="ticketAdd" action="forAction/.servletuserManage" method="post" style="display: inline;">
                    <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#ticket_add">新增</button>
                    <div class="modal fade" id="ticket_add" tabindex="-1" role="dialog" aria-labelledby="ticket_add_label" aria-hidden="true">
                        <div class="modal-dialog" style="width: 1000px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button data-dismiss="modal" class="close" type="button">
                                        <span aria-hidden="true">×</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title" id="ticket_add_label">新增工作票</h4>
                                </div>
                                <div class="modal-body" align="center">
                                    <table style="font-size:18px">
                                        <tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">ID</span>
                                                    <input type="text" class="form-control" name="ticketnumber_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                                    <input type="text" class="form-control" name="ipccustomer_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">用户代码</span>
                                                    <input type="text" class="form-control" name="customercode_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                                    <input type="text" class="form-control" name="cause_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                                    <input type="text" class="form-control" name="summary_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                                    <input type="text" class="form-control" name="componenttype_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                                    <input type="text" class="form-control" name="ostype_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                                    <input type="text" class="form-control" name="identifier_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                                    <input type="text" class="form-control" name="ticketstatus_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                                    <input type="text" class="form-control" name="lastoccurrence_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                                    <input type="text" class="form-control" name="node_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                                    <input type="text" class="form-control" name="resolution_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                                    <input type="text" class="form-control" name="servername_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                                    <input type="text" class="form-control" name="alertgroup_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                                    <input type="text" class="form-control" name="component_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                                    <input type="text" class="form-control" name="firstoccurrence_add" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                                    <input type="text" class="form-control" name="severity_add" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <script language="javascript">
                                        function ticketCheck_add(){
                                            if(ticketAdd.ipccustomer_add.value=="" || ticketAdd.customercode_add.value=="" || ticketAdd.cause_add.value=="" || ticketAdd.summary_add.value=="" || ticketAdd.componenttype_add.value=="" || ticketAdd.ostype_add.value=="" || ticketAdd.identifier_add.value=="" || ticketAdd.ticketstatus_add.value=="" || ticketAdd.lastoccurrence_add.value=="" || ticketAdd.node_add.value=="" || ticketAdd.resolution_add.value=="" || ticketAdd.servername_add.value=="" || ticketAdd.alertgroup_add.value=="" || ticketAdd.component_add.value=="" || ticketAdd.firstoccurrence_add.value=="" || ticketAdd.severity_add.value=="") {
                                                toastr.warning("信息填写不完整");
                                                return false;
                                            }
                                            return true;
                                        }
                                    </script>
                                    <input type="submit" name="add" value="新增" onclick="return ticketCheck_add();" class="btn btn-success">
                                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                </form>
                <form name="ticketSearch" action="/.userManage" method="post" style="display: inline;">
                    <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#ticket_search">查询</button>
                    <div class="modal fade" id="ticket_search" tabindex="-1" role="dialog" aria-labelledby="ticket_search_label" aria-hidden="true">
                        <div class="modal-dialog" style="width: 1000px;">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button data-dismiss="modal" class="close" type="button">
                                        <span aria-hidden="true">×</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title" id="ticket_search_label">查询工作票</h4>
                                </div>
                                <div class="modal-body" align="center">
                                    <table style="font-size:18px">
                                        <tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">ID</span>
                                                    <input type="text" class="form-control" name="ticketnumber_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                                    <input type="text" class="form-control" name="ipccustomer_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">用户代码</span>
                                                    <input type="text" class="form-control" name="customercode_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                                    <input type="text" class="form-control" name="cause_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                                    <input type="text" class="form-control" name="summary_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                                    <input type="text" class="form-control" name="componenttype_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                                    <input type="text" class="form-control" name="ostype_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                                    <input type="text" class="form-control" name="identifier_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                                    <input type="text" class="form-control" name="ticketstatus_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                                    <input type="text" class="form-control" name="lastoccurrence_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                                    <input type="text" class="form-control" name="node_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                                    <input type="text" class="form-control" name="resolution_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                                    <input type="text" class="form-control" name="servername_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                                    <input type="text" class="form-control" name="alertgroup_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                                    <input type="text" class="form-control" name="component_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                                    <input type="text" class="form-control" name="firstoccurrence_search" placeholder="300个字符以内" style="width: 250px;">
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
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                                    <input type="text" class="form-control" name="severity_search" placeholder="300个字符以内" style="width: 250px;">
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="modal-footer">
                                    <script language="javascript">
                                        function ticketCheck_search(){
                                            if(ticketSearch.ipccustomer_search.value=="" && ticketSearch.customercode_search.value=="" && ticketSearch.cause_search.value=="" && ticketSearch.summary_search.value=="" && ticketSearch.componenttype_search.value=="" && ticketSearch.ostype_search.value=="" && ticketSearch.identifier_search.value=="" && ticketSearch.ticketstatus_search.value=="" && ticketSearch.lastoccurrence_search.value=="" && ticketSearch.node_search.value=="" && ticketSearch.resolution_search.value=="" && ticketSearch.servername_search.value=="" && ticketSearch.alertgroup_search.value=="" && ticketSearch.component_search.value=="" && ticketSearch.firstoccurrence_search.value=="" && ticketSearch.severity_search.value=="") {
                                                toast.warning("请至少输入一个查询条件");
                                                return false;
                                            }
                                            return true;
                                        }
                                    </script>
                                    <input type="submit" name="easy_search" value="查询" onclick="return ticketCheck_search();" class="btn btn-success">
                                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                                </div>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                    </div>
                </form>
                <form name="ticketInput" action="" method="post" enctype="multipart/form-data" style="display: inline;">
                    <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#ticketInput">导入</button>
                    <div class="modal fade" id="ticketInput" tabindex="-1" role="dialog" aria-labelledby="ticketInput_label" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button data-dismiss="modal" class="close" type="button">
                                        <span aria-hidden="true">×</span>
                                        <span class="sr-only">Close</span>
                                    </button>
                                    <h4 class="modal-title" id="ticketInput_label">导入工作票</h4>
                                </div>
                                <div class="modal-footer">
                                    <input type="file" name="f" id="f" accept="text/xml"/>
                                    <input type="submit" name="input" value="导入" class="btn btn-success">
                                    <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <a href=".servletticketMultiOutput"><button type="button" class="btn btn-sm btn-info">导出</button></a>
            </h4>
            <form name="ticketMod" class="form-group" action="forAction/.servletuserManage" method="post">
                <%--_ticketnumber_隐藏输入值，直接传递ticketnumber--%>
                <input type="hidden" name="_ticketnumber_" value="">
                <table class="table table-hover table-responsive table-striped table-bordered">
                    <thead>
                    <tr>
                        <td>ID</td>
                        <c:if test="${ipccustomer_display == true}"><td>用户全称</td></c:if>
                        <c:if test="${customercode_display == true}"><td>用户代码</td></c:if>
                        <c:if test="${cause_display == true}"><td>原因</td></c:if>
                        <c:if test="${summary_display == true}"><td>问题描述</td></c:if>
                        <c:if test="${componenttype_display == true}"><td>组件类型</td></c:if>
                        <c:if test="${ostype_display == true}"><td>OS类型</td></c:if>
                        <c:if test="${identifier_display == true}"><td>标识符</td></c:if>
                        <c:if test="${ticketstatus_display == true}"><td>状态</td></c:if>
                        <c:if test="${lastoccurrence_display == true}"><td>闭合时间</td></c:if>
                        <c:if test="${node_display == true}"><td>节点ID</td></c:if>
                        <c:if test="${resolution_display == true}"><td>解决方案</td></c:if>
                        <c:if test="${servername_display == true}"><td>服务器全称</td></c:if>
                        <c:if test="${alertgroup_display == true}"><td>告警组</td></c:if>
                        <c:if test="${component_display == true}"><td>组件</td></c:if>
                        <c:if test="${firstoccurrence_display == true}"><td>产生时间</td></c:if>
                        <c:if test="${severity_display == true}"><td>问题严重程度</td></c:if>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ticket" items="${currentPageTickets}">
                        <tr>
                            <td>${ticket.ticketnumber}</td>
                            <c:if test="${ipccustomer_display == true}"><td>${ticket.ipccustomer}</td></c:if>
                            <c:if test="${customercode_display == true}"><td>${ticket.customercode}</td></c:if>
                            <c:if test="${cause_display == true}"><td>${ticket.cause}</td></c:if>
                            <c:if test="${summary_display == true}"><td>${ticket.summary}</td></c:if>
                            <c:if test="${componenttype_display == true}"><td>${ticket.componenttype}</td></c:if>
                            <c:if test="${ostype_display == true}"><td>${ticket.ostype}</td></c:if>
                            <c:if test="${identifier_display == true}"><td>${ticket.identifier}</td></c:if>
                            <c:if test="${ticketstatus_display == true}"><td>${ticket.ticketstatus}</td></c:if>
                            <c:if test="${lastoccurrence_display == true}"><td>${ticket.lastoccurrence}</td></c:if>
                            <c:if test="${node_display == true}"><td>${ticket.node}</td></c:if>
                            <c:if test="${resolution_display == true}"><td>${ticket.resolution}</td></c:if>
                            <c:if test="${servername_display == true}"><td>${ticket.servername}</td></c:if>
                            <c:if test="${alertgroup_display == true}"><td>${ticket.alertgroup}</td></c:if>
                            <c:if test="${component_display == true}"><td>${ticket.component}</td></c:if>
                            <c:if test="${firstoccurrence_display == true}"><td>${ticket.firstoccurrence}</td></c:if>
                            <c:if test="${severity_display == true}"><td>${ticket.severity}</td></c:if>
                            <td>
                                <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#ticket_${ticket.ticketnumber}">查看</button>
                                <div class="modal fade" id="ticket_${ticket.ticketnumber}" tabindex="-1" role="dialog" aria-labelledby="ticket_${ticket.ticketnumber}_label" aria-hidden="true">
                                    <div class="modal-dialog" style="width: 1000px;">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button data-dismiss="modal" class="close" type="button">
                                                    <span aria-hidden="true">×</span>
                                                    <span class="sr-only">Close</span>
                                                </button>
                                                <h4 class="modal-title" id="ticket_${ticket.ticketnumber}_label">工作票信息</h4>
                                            </div>
                                            <div class="modal-body" align="center">
                                                <table style="font-size:18px">
                                                    <tr>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">ID</span>
                                                                <input type="text" class="form-control" name="ticketnumber_${ticket.ticketnumber}" value="${ticket.ticketnumber}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                                                <input type="text" class="form-control" name="ipccustomer_${ticket.ticketnumber}" value="${ticket.ipccustomer}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">用户代码</span>
                                                                <input type="text" class="form-control" name="customercode_${ticket.ticketnumber}" value="${ticket.customercode}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                                                <input type="text" class="form-control" name="cause_${ticket.ticketnumber}" value="${ticket.cause}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                                                <input type="text" class="form-control" name="summary_${ticket.ticketnumber}" value="${ticket.summary}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                                                <input type="text" class="form-control" name="componenttype_${ticket.ticketnumber}" value="${ticket.componenttype}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                                                <input type="text" class="form-control" name="ostype_${ticket.ticketnumber}" value="${ticket.ostype}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                                                <input type="text" class="form-control" name="identifier_${ticket.ticketnumber}" value="${ticket.identifier}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                                                <input type="text" class="form-control" name="ticketstatus_${ticket.ticketnumber}" value="${ticket.ticketstatus}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                                                <input type="text" class="form-control" name="lastoccurrence_${ticket.ticketnumber}" value="${ticket.lastoccurrence}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                                                <input type="text" class="form-control" name="node_${ticket.ticketnumber}" value="${ticket.node}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                                                <input type="text" class="form-control" name="resolution_${ticket.ticketnumber}" value="${ticket.resolution}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                                                <input type="text" class="form-control" name="servername_${ticket.ticketnumber}" value="${ticket.servername}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                                                <input type="text" class="form-control" name="alertgroup_${ticket.ticketnumber}" value="${ticket.alertgroup}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                                                <input type="text" class="form-control" name="component_${ticket.ticketnumber}" value="${ticket.component}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="input-group">
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                                                <input type="text" class="form-control" name="firstoccurrence_${ticket.ticketnumber}" value="${ticket.firstoccurrence}" style="width: 250px;">
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
                                                                <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                                                <input type="text" class="form-control" name="severity_${ticket.ticketnumber}" value="${ticket.severity}" style="width: 250px;">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <div class="modal-footer">
                                                <script language="javascript">
                                                    function ticketCheck_${ticket.ticketnumber}(){
                                                        if(ticketMod.ipccustomer_${ticket.ticketnumber}.value=="" || ticketMod.customercode_${ticket.ticketnumber}.value=="" || ticketMod.cause_${ticket.ticketnumber}.value=="" || ticketMod.summary_${ticket.ticketnumber}.value=="" || ticketMod.componenttype_${ticket.ticketnumber}.value=="" || ticketMod.ostype_${ticket.ticketnumber}.value=="" || ticketMod.identifier_${ticket.ticketnumber}.value=="" || ticketMod.ticketstatus_${ticket.ticketnumber}.value=="" || ticketMod.lastoccurrence_${ticket.ticketnumber}.value=="" || ticketMod.node_${ticket.ticketnumber}.value=="" || ticketMod.resolution_${ticket.ticketnumber}.value=="" || ticketMod.servername_${ticket.ticketnumber}.value=="" || ticketMod.alertgroup_${ticket.ticketnumber}.value=="" || ticketMod.component_${ticket.ticketnumber}.value=="" || ticketMod.firstoccurrence_${ticket.ticketnumber}.value=="" || ticketMod.severity_${ticket.ticketnumber}.value=="") {
                                                            toastr.warning("信息填写不完整");
                                                            return false;
                                                        }
                                                        setTicketnumber_${ticket.ticketnumber}();
                                                        return true;
                                                    }
                                                    function setTicketnumber_${ticket.ticketnumber}() {
                                                        ticketMod._ticketnumber_.value = ticketMod.ticketnumber_${ticket.ticketnumber}.value;
                                                    }
                                                </script>
                                                <input type="submit" name="modify_${ticket.ticketnumber}" value="修改" onclick="return ticketCheck_${ticket.ticketnumber}();" class="btn btn-success">
                                                <input type="submit" name="delete_${ticket.ticketnumber}" value="删除" onclick="setTicketnumber_${ticket.ticketnumber}();" class="btn btn-danger">
                                                <input type="submit" name="output_${ticket.ticketnumber}" value="导出" onclick="setTicketnumber_${ticket.ticketnumber}();" class="btn btn-info">
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
                        <li class="${page==1?"disabled":""}"><a href="<c:url value="/.userManage?page=1"/>">首页</a></li>
                        <li class="${page==1?"disabled":""}"><a href="<c:url value="/.userManage?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>
                        <c:forEach begin="${page-3<1?1:page-3}" end="${page+3>totalPages?totalPages:page+3}" varStatus="loop">
                            <c:set var="active" value="${loop.index==page?'active':''}"/>
                            <li class="${active}"><a href="<c:url value="/.userManage?page=${loop.index}"/>">${loop.index}</a></li>
                        </c:forEach>
                        <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.userManage?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a></li>
                        <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.userManage?page=${totalPages}"/>">尾页</a></li>
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