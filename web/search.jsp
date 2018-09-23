<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <link rel="icon" href="icon/favicon.ico">
    <title>工作票查询</title>
    <link href="static.bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="static.bootstrap/css/signin.css" rel="stylesheet">
    <link href="static.bootstrap/css/carousel.css" rel="stylesheet">
    <link href="toastr/toastr.min.css" rel="stylesheet">
    <script src="jquery/jquery-3.3.1.min.js"></script>
    <script src="toastr/toastr.min.js"></script>
    <style type="text/css">
        body{
            background-image: url(bkimg/13.jpg);
            background-size: cover;
        }
    </style>
    <script type="text/javascript">
        var row = 1;
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
                if(alertInfo=="noaccess"){ toastr.warning("没有权限！");}
                else if(alertInfo=="isdupl"){ toastr.warning("条目重复");}
                else { toastr.error('操作失败！');}
                if(clear){ <%session.removeAttribute("alert");%>}
            }
        }
    </script>
</head>
<body onload="showalert(null)">
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
                <li><a href="../.userManage">返回</a></li>
                <li><a href="logout.jsp">退出</a></li>
            </ul>
        </div>
    </div>
</nav>
<br>
<br>

<div class="container">

    <form class="form-data" action="/.userManage" method="post" style="text-align: center;" name="data">
        <h2 class="form-signin-heading">查询</h2>
        <br>
        <br>
        <table style="font-size:18px;" align="center" id="table">
            <input type="hidden" name="row">
            <script type="text/javascript">
                function addTableRow() {
                    if(row == 5){
                        toastr.warning("最多只能有五个条件");
                        return;
                    }
                    row += 1;
                    var tr="<tr><td><input type=\"checkbox\" name=\"check" + row.toString() + "\" checked style=\"display: none\"/>" +
                        "<select class=\"selectpicker\" name=\"relation_" + row.toString() +
                        "_hidden\" style=\"font-size: 10px;\"><option value=\"and\" selected>并且</option><option value=\"or\">或者</option></select><input type=\"hidden\" name=\"relation_" + row.toString() +
                        "\"></td>" +
                        "<td><div class=\"input-group\"><span class=\"input-group-addon\"><select class=\"selectpicker\" name=\"attr_" + row.toString() +
                        "_hidden\" style=\"width: 120px;\"><option value=\"whatever\" selected>请选择字段</option><option value=\"ticketnumber\">ID</option><option value=\"ipccustomer\">用户全称</option><option value=\"customercode\">用户代码</option><option value=\"cause\">原因</option><option value=\"summary\">问题描述</option><option value=\"componenttype\">组件类型</option><option value=\"ostype\">OS类型</option><option value=\"identifier\">标识符</option><option value=\"ticketstatus\">状态</option><option value=\"lastoccurrence\">闭合时间</option><option value=\"node\">节点ID</option><option value=\"resolution\">解决方案</option><option value=\"servername\">服务器名称</option><option value=\"alertgroup\">告警组</option><option value=\"component\">组件</option><option value=\"firstoccurrence\">产生时间</option><option value=\"severity\">问题严重程度</option></select><input type=\"hidden\" name=\"attr_" + row.toString() +
                        "\"></span><input type=\"text\" class=\"form-control\" placeholder=\"45个字符以内\" name=\"search_" + row.toString() +
                        "\" style=\"width: 500px;\"></div></td>" +
                        "</tr><tr><td>" + "<input type=\"checkbox\" name=\"check" + row.toString() + "\" checked style=\"display: none\"/></td><td><div class=\"row\">&nbsp</div></td></tr>" +
                        "<tr><td>" + "<input type=\"checkbox\" name=\"check" + row.toString() + "\" checked style=\"display: none\"/></td><td><div class=\"row\">&nbsp</div></td></tr>";
                    $("#table").append(tr);
                }
                function delTableRow(){
                    if(row > 1){
                        var checked = document.getElementsByName('check'+row.toString());
                        var len = checked.length;
                        for(var i=len-1;i>=0;i--){
                            if(checked[i].checked==true){
                                document.getElementById('table').deleteRow(checked[i].parentNode.parentNode.rowIndex);
                            }
                        }
                        row -= 1;
                    }
                }
            </script>
            <tr>
                <td style="text-align: center;">
                    <button type="button" class="btn btn-xs btn-success" onclick="addTableRow();">+</button>
                    <button type="button" class="btn btn-xs btn-danger" onclick="delTableRow();">-</button>
                </td>
                <td>
                    <div class="input-group">
                        <span class="input-group-addon">
                        <select class="selectpicker" name="attr_1_hidden" style="width: 120px;">
                            <option value="whatever" selected>请选择字段</option>
                            <option value="ticketnumber">ID</option>
                            <option value="ipccustomer">用户全称</option>
                            <option value="customercode">用户代码</option>
                            <option value="cause">原因</option>
                            <option value="summary">问题描述</option>
                            <option value="componenttype">组件类型</option>
                            <option value="ostype">OS类型</option>
                            <option value="identifier">标识符</option>
                            <option value="ticketstatus">状态</option>
                            <option value="lastoccurrence">闭合时间</option>
                            <option value="node">节点ID</option>
                            <option value="resolution">解决方案</option>
                            <option value="servername">服务器名称</option>
                            <option value="alertgroup">告警组</option>
                            <option value="component">组件</option>
                            <option value="firstoccurrence">产生时间</option>
                            <option value="severity">问题严重程度</option>
                        </select>
                        <input type="hidden" name="attr_1">
                        </span>
                        <input type="text" class="form-control" placeholder="300个字符以内" name="search_1" style="width: 500px;">
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
        </table>
        <div class="container" align="center" style="width: 370px;">
            <div class="input-group">
                <span class="input-group-addon" style="width: 85px;text-align: center;">每页显示</span>
                <input type="text" class="form-control" value="10" name="ticketsPerPage" style="width: 250px;">
            </div>
            <br>
            <br>
            <script language="javascript">
                function isNumber(obj){
                    var reg = /^[0-9]+$/;
                    return reg.test(obj);
                }
                function check(){
                    if(!isNumber(data.ticketsPerPage.value) || data.ticketsPerPage.value < 1) {
                        toastr.warning("每页显示的工作票数必须为正整数");
                        return false;
                    }
                    data.row.value = row;
                    data.attr_1.value = data.attr_1_hidden.value;

                    if(data.attr_1.value=="whatever"){
                        toastr.warning("请选择字段");
                        return false;
                    }
                    if(row >= 2){
                        data.attr_2.value = data.attr_2_hidden.value;
                        data.relation_2.value = data.relation_2_hidden.value;
                        if(data.attr_2.value == "whatever"){
                            toastr.warning("请选择字段");
                            return false;
                        }
                    }
                    if(row >= 3){
                        data.attr_3.value = data.attr_3_hidden.value;
                        data.relation_3.value = data.relation_3_hidden.value;
                        if(data.attr_3.value == "whatever"){
                            toastr.warning("请选择字段");
                            return false;
                        }
                    }
                    if(row >= 4){
                        data.attr_4.value = data.attr_4_hidden.value;
                        data.relation_4.value = data.relation_4_hidden.value;
                        if(data.attr_4.value == "whatever"){
                            toastr.warning("请选择字段");
                            return false;
                        }
                    }
                    if(row >= 5){
                        data.attr_5.value = data.attr_5_hidden.value;
                        data.relation_5.value = data.relation_5_hidden.value;
                        if(data.attr_5.value == "whatever"){
                            toastr.warning("请选择字段");
                            return false;
                        }
                    }
                    return true;
                }
            </script>
            <button class="btn btn-lg btn-primary btn-block" type="submit" name="complex_search" value="complex_search" onclick="return check();">查询</button>
        </div>
    </form>
</div>

<script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="static.bootstrap/js/bootstrap.min.js"></script>
</body>
</html>