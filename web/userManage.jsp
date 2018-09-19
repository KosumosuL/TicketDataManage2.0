<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工作票管理</title>
    <link rel="stylesheet" href="static.bootstrap/css/bootstrap.css" />
    <script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="static.bootstrap/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
    <c:set var="totalTickets" value="${requestScope.totalTickets}"/>
    <c:set var="ticketsPerPage" value="${requestScope.ticketsPerPage}"/>
    <c:set var="totalPages" value="${requestScope.totalPages}"/>
    <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
    <c:set var="endIndex" value="${requestScope.endIndex}"/>
    <c:set var="page" value="${requestScope.page}"/>
    <c:set var="currentPageTickets" value="${requestScope.tickets.subList(beginIndex,endIndex)}"/>
    <p>工作票总数:${totalTickets}</p>
    <p>每页工作票数:${ticketsPerPage}</p>
    <p>总页数:${totalPages}</p>
    <p>当前页:${page}</p>
    <p>
    <form name="ticketAdd" action="forAction/.servletuserManage" method="post" style="display: inline;">
        <button type="button" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#ticket_add">新增</button>
        <div class="modal fade" id="ticket_add" tabindex="-1" role="dialog" aria-labelledby="ticket_add_label" aria-hidden="true">
            <div class="modal-dialog">
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
                                        <input type="text" class="form-control" name="ticketnumber_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                        <input type="text" class="form-control" name="ipccustomer_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <input type="text" class="form-control" name="customercode_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                        <input type="text" class="form-control" name="cause_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                    <input type="text" class="form-control" name="summary_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                    <input type="text" class="form-control" name="componenttype_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                    <input type="text" class="form-control" name="ostype_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                    <input type="text" class="form-control" name="identifier_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                    <input type="text" class="form-control" name="ticketstatus_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                    <input type="text" class="form-control" name="lastoccurrence_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                    <input type="text" class="form-control" name="node_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                    <input type="text" class="form-control" name="resolution_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                    <input type="text" class="form-control" name="servername_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                    <input type="text" class="form-control" name="alertgroup_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                    <input type="text" class="form-control" name="component_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                    <input type="text" class="form-control" name="firstoccurrence_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                    <input type="text" class="form-control" name="severity_add" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
                                </div>
                            </td>
                        </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <script language="javascript">
                            function ticketCheck_add(){
                                if(ticketAdd.ipccustomer_add.value=="" || ticketAdd.customercode_add.value=="" || ticketAdd.cause_add.value=="" || ticketAdd.summary_add.value=="" || ticketAdd.componenttype_add.value=="" || ticketAdd.ostype_add.value=="" || ticketAdd.identifier_add.value=="" || ticketAdd.ticketstatus_add.value=="" || ticketAdd.lastoccurrence_add.value=="" || ticketAdd.node_add.value=="" || ticketAdd.resolution_add.value=="" || ticketAdd.servername_add.value=="" || ticketAdd.alertgroup_add.value=="" || ticketAdd.component_add.value=="" || ticketAdd.firstoccurrence_add.value=="" || ticketAdd.severity_add.value=="") {
                                    alert("信息填写不完整，请重新输入!");
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
    <!-- 导入 -->
    <form name="ticketInput" action="forAction/.servletticketInput" method="post" enctype="multipart/form-data" style="display: inline;">
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
                        <input type="file" name="f" id="f" accept="text/xml" />
                        <input type="submit" name="input" value="导入" class="btn btn-success">
                        <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <a href=".servletticketMultiOutput"><button type="button" class="btn btn-sm btn-warning">导出</button></a>
    <!-- 个人信息查看和修改待做 -->
    <%--搜索--%>
    <form name="ticketSearch" action="/.userManage" method="post" style="display: inline;">
        <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#ticket_search">查询</button>
        <div class="modal fade" id="ticket_search" tabindex="-1" role="dialog" aria-labelledby="ticket_search_label" aria-hidden="true">
            <div class="modal-dialog">
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
                                        <input type="text" class="form-control" name="ticketnumber_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                        <input type="text" class="form-control" name="ipccustomer_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <input type="text" class="form-control" name="customercode_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                                        <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                        <input type="text" class="form-control" name="cause_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                    <input type="text" class="form-control" name="summary_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                    <input type="text" class="form-control" name="componenttype_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                    <input type="text" class="form-control" name="ostype_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                    <input type="text" class="form-control" name="identifier_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                    <input type="text" class="form-control" name="ticketstatus_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                    <input type="text" class="form-control" name="lastoccurrence_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                    <input type="text" class="form-control" name="node_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                    <input type="text" class="form-control" name="resolution_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                    <input type="text" class="form-control" name="servername_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                    <input type="text" class="form-control" name="alertgroup_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                    <input type="text" class="form-control" name="component_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                    <input type="text" class="form-control" name="firstoccurrence_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
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
                            </tr><tr>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                    <input type="text" class="form-control" name="severity_search" aria-describedby="basic-addon1" placeholder="300个字符以内" style="width: 250px;">
                                </div>
                            </td>
                        </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <script language="javascript">
                            function ticketCheck_search(){
                                if(ticketSearch.ipccustomer_search.value=="" && ticketSearch.customercode_search.value=="" && ticketSearch.cause_search.value=="" && ticketSearch.summary_search.value=="" && ticketSearch.componenttype_search.value=="" && ticketSearch.ostype_search.value=="" && ticketSearch.identifier_search.value=="" && ticketSearch.ticketstatus_search.value=="" && ticketSearch.lastoccurrence_search.value=="" && ticketSearch.node_search.value=="" && ticketSearch.resolution_search.value=="" && ticketSearch.servername_search.value=="" && ticketSearch.alertgroup_search.value=="" && ticketSearch.component_search.value=="" && ticketSearch.firstoccurrence_search.value=="" && ticketSearch.severity_search.value=="") {
                                    alert("请至少输入一个查询条件");
                                    return false;
                                }
                                return true;
                            }
                        </script>
                        <input type="submit" name="search" value="查询" onclick="return ticketCheck_search();" class="btn btn-success">
                        <button type="button" data-dismiss="modal" class="btn btn-default">关闭</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </form>
    <%--统计分析--%>
    <a href=".filterStatis"><button type="button" class="btn btn-sm btn-success">统计</button></a>
    <!-- 返回上一页 -->
    <button type="button" class="btn btn-sm btn-primary" onclick="javascript:history.back(-1);">返回</button>
    <!-- 退出 -->
    <a href="logout.jsp"><button type="button" class="btn btn-sm btn-default">退出</button></a>


    <form name="ticketMod" class="form-group" action="forAction/.servletuserManage" method="post">
        <table class="table table-hover table-responsive table-striped table-bordered">
            <thead>
            <tr>
                <td>ID</td>
                <td>原因</td>
                <td>用户代码</td>
                <td>问题严重程度</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="ticket" items="${currentPageTickets}">
                <tr>
                    <td>${ticket.ticketnumber}</td>
                    <td>${ticket.cause}</td>
                    <td>${ticket.customercode}</td>
                    <td>${ticket.severity}</td>
                    <td>${ticket.ticketstatus}</td>
                    <td><button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#ticket_${ticket.ticketnumber}">查看</button>
                        <div class="modal fade" id="ticket_${ticket.ticketnumber}" tabindex="-1" role="dialog" aria-labelledby="ticket_${ticket.ticketnumber}_label" aria-hidden="true">
                            <div class="modal-dialog">
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
                                                        <input type="text" class="form-control" name="ticketnumber_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.ticketnumber}" style="width: 250px;">
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
                                                        <span class="input-group-addon" style="width: 110px;text-align: center;">用户全称</span>
                                                        <input type="text" class="form-control" name="ipccustomer_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.ipccustomer}" style="width: 250px;">
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
                                                        <input type="text" class="form-control" name="customercode_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.customercode}" style="width: 250px;">
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
                                                        <span class="input-group-addon" style="width: 110px;text-align: center;">原因</span>
                                                        <input type="text" class="form-control" name="cause_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.cause}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题描述</span>
                                                    <input type="text" class="form-control" name="summary_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.summary}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件类型</span>
                                                    <input type="text" class="form-control" name="componenttype_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.componenttype}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">OS类型</span>
                                                    <input type="text" class="form-control" name="ostype_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.ostype}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">标识符</span>
                                                    <input type="text" class="form-control" name="identifier_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.identifier}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">状态</span>
                                                    <input type="text" class="form-control" name="ticketstatus_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.ticketstatus}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">闭合时间</span>
                                                    <input type="text" class="form-control" name="lastoccurrence_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.lastoccurrence}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">节点ID</span>
                                                    <input type="text" class="form-control" name="node_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.node}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">解决方案</span>
                                                    <input type="text" class="form-control" name="resolution_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.resolution}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">服务器名称</span>
                                                    <input type="text" class="form-control" name="servername_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.servername}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">告警组</span>
                                                    <input type="text" class="form-control" name="alertgroup_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.alertgroup}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">组件</span>
                                                    <input type="text" class="form-control" name="component_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.component}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">产生时间</span>
                                                    <input type="text" class="form-control" name="firstoccurrence_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.firstoccurrence}" style="width: 250px;">
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
                                            </tr><tr>
                                            <td>
                                                <div class="input-group">
                                                    <span class="input-group-addon" style="width: 110px;text-align: center;">问题严重程度</span>
                                                    <input type="text" class="form-control" name="severity_${ticket.ticketnumber}" aria-describedby="basic-addon1" value="${ticket.severity}" style="width: 250px;">
                                                </div>
                                            </td>
                                        </tr>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <script language="javascript">
                                            function ticketCheck_${ticket.ticketnumber}(){
                                                if(ticketMod.ipccustomer_${ticket.ticketnumber}.value=="" || ticketMod.customercode_${ticket.ticketnumber}.value=="" || ticketMod.cause_${ticket.ticketnumber}.value=="" || ticketMod.summary_${ticket.ticketnumber}.value=="" || ticketMod.componenttype_${ticket.ticketnumber}.value=="" || ticketMod.ostype_${ticket.ticketnumber}.value=="" || ticketMod.identifier_${ticket.ticketnumber}.value=="" || ticketMod.ticketstatus_${ticket.ticketnumber}.value=="" || ticketMod.lastoccurrence_${ticket.ticketnumber}.value=="" || ticketMod.node_${ticket.ticketnumber}.value=="" || ticketMod.resolution_${ticket.ticketnumber}.value=="" || ticketMod.servername_${ticket.ticketnumber}.value=="" || ticketMod.alertgroup_${ticket.ticketnumber}.value=="" || ticketMod.component_${ticket.ticketnumber}.value=="" || ticketMod.firstoccurrence_${ticket.ticketnumber}.value=="" || ticketMod.severity_${ticket.ticketnumber}.value=="") {
                                                    alert("信息填写不完整，请重新输入!");
                                                    return false;
                                                }
                                                return true;
                                            }
                                        </script>
                                        <input type="submit" name="modify_${ticket.ticketnumber}" value="修改" onclick="return ticketCheck_${ticket.ticketnumber}();" class="btn btn-success">
                                        <input type="submit" name="delete_${ticket.ticketnumber}" value="删除" class="btn btn-danger">
                                        <input type="submit" name="output_${ticket.ticketnumber}" value="导出" class="btn btn-danger">
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
    <hr>

    <div class="text-center">
        <nav>
            <ul class="pagination">
                <li class="${page==1?"disabled":""}"><a href="<c:url value="/.userManage?page=1"/>">首页</a></li>
                <li class="${page==1?"disabled":""}"><a href="<c:url value="/.userManage?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>
                <c:forEach begin="${page-3<1?1:page-3}" end="${page+3>totalPages?totalPages:page+3}" varStatus="loop">
                    <c:set var="active" value="${loop.index==page?'active':''}"/>
                    <li class="${active}"><a
                            href="<c:url value="/.userManage?page=${loop.index}"/>">${loop.index}</a>
                    </li>
                </c:forEach>
                <li class="${page==totalPages?"disabled":""}">
                    <a href="<c:url value="/.userManage?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                </li>
                <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.userManage?page=${totalPages}"/>">尾页</a></li>
            </ul>
        </nav>
    </div>

</div>
</body>
</html>