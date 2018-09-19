<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户管理</title>
    <link rel="stylesheet" href="static.bootstrap/css/bootstrap.css" />
    <script src="static.bootstrap/js/jquery-3.3.1.min.js"></script>
    <script src="static.bootstrap/js/bootstrap.js"></script>
</head>
<body>

<div class="container">
    <c:set var="totalUsers" value="${requestScope.totalUsers}"/>
    <c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
    <c:set var="totalPages" value="${requestScope.totalPages}"/>
    <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
    <c:set var="endIndex" value="${requestScope.endIndex}"/>
    <c:set var="page" value="${requestScope.page}"/>
    <c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
    <p>用户总数:${totalUsers}</p>
    <p>每页用户数:${usersPerPage}</p>
    <p>总页数:${totalPages}</p>
    <p>当前页:${page}</p>

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
                                        <input type="text" class="form-control" name="name_add" aria-describedby="basic-addon1" placeholder="7位汉字或14位数字,字母和下划线内" style="width: 250px;">
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
                                        <input type="text" class="form-control" name="pwd_add" aria-describedby="basic-addon1" placeholder="长度8-16,数字和字母,至少2位数字" style="width: 250px;">
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
                                        <select class="selectpicker form-control" onchange="baddr_add.value=this.value" aria-describedby="basic-addon1" style="width: 250px;">
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
                                        <input type="date" class="form-control" onchange="bdate_add.value=this.value" aria-describedby="basic-addon1" style="width: 250px;">
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
                                        <input type="text" class="form-control" name="id_num_add" aria-describedby="basic-addon1" placeholder="15或18位有效身份证号" style="width: 250px;">
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
                                        <input type="text" class="form-control" name="tel_add" aria-describedby="basic-addon1" placeholder="8-16位数字" style="width: 250px;">
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
                                        <label><input type="checkbox" value="0" name="view_add">查看、修改、删除</label>
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
                                if(userAdd.name_add.value=="" || userAdd.pwd_add.value=="" || userAdd.baddr_add.value=="" || userAdd.bdate_add.value=="" || userAdd.id_num_add.value=="" || userAdd.tel_add.value=="") {
                                    alert("信息填写不完整，请重新输入!");
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
    <!-- 个人信息查看和修改待做 -->
    <%--<button type="button" class="btn btn-sm btn-info">个人信息</button>--%>
    <!-- 返回上一页 -->
    <button type="button" class="btn btn-sm btn-primary" onclick="javascript:history.back(-1);">返回</button>
    <!-- 退出待做 -->
    <a href="logout.jsp"><button type="button" class="btn btn-sm btn-default">退出</button></a>

    <form name="userMod" class="form-group" action="forAction/.servletadminManage" method="post">
        <table class="table table-hover table-responsive table-striped table-bordered">
            <thead>
            <tr>
                <td>账号</td>
                <td>用户名</td>
                <td>出生地</td>
                <td>出生日期</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${currentPageUsers}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.baddr}</td>
                    <td>${user.bdate}</td>
                    <td><button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#user_${user.id}">查看</button>
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
                                                        <span class="input-group-addon" style="width: 85px;text-align: center;">账号</span>
                                                        <input type="text" class="form-control" name="id_${user.id}" aria-describedby="basic-addon1" value="${user.id}" style="width: 250px;" readonly >
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
                                                        <input type="text" class="form-control" name="name_${user.id}" aria-describedby="basic-addon1" value="${user.name}" style="width: 250px;">
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
                                                        <input type="text" class="form-control" name="pwd_${user.id}" aria-describedby="basic-addon1" value="${user.pwd}" style="width: 250px;" readonly >
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
                                                        <select class="selectpicker form-control" onchange="baddr_${user.id}.value=this.value" aria-describedby="basic-addon1" style="width: 250px;">
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
                                                            <span class="input-group-addon" style="width: 85px;text-align: center;">出生日期</span>
                                                            <input type="date" class="form-control" onchange="bdate_${user.id}.value=this.value;" value="<fmt:formatDate value="${bdate_parsed}" pattern="yyyy-MM-dd"/>" aria-describedby="basic-addon1" style="width: 250px;">
                                                            <input type="hidden" name="bdate_${user.id}" value="${user.bdate}">
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
                                                        <input type="text" class="form-control" name="id_num_${user.id}" aria-describedby="basic-addon1" value="${user.id_num}" style="width: 250px;">
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
                                                        <input type="text" class="form-control" name="tel_${user.id}" aria-describedby="basic-addon1" value="${user.tel}" style="width: 250px;">
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
                                                        <label><input type="checkbox" value="0" name="view_${user.id}" ${user.view==true?"checked":""}>查看、修改、删除</label>
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
                                                if(userMod.name_${user.id}.value=="" || userMod.bdate_${user.id}.value=="" || userMod.id_num_${user.id}.value=="" || userMod.tel_${user.id}.value=="") {
                                                    alert("信息填写不完整，请重新输入!");
                                                    return false;
                                                }
                                                return true;
                                            }
                                        </script>
                                        <input type="submit" name="modify_${user.id}" value="修改" onclick="return userCheck_${user.id}();" class="btn btn-success">
                                        <input type="submit" name="delete_${user.id}" value="删除" class="btn btn-danger">
                                        <a href="forget.jsp"><button type="button" class="btn btn-warning">修改密码</button></a>
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
                <li class="${page==1?"disabled":""}"><a href="<c:url value="/.adminManage?page=1"/>">首页</a></li>
                <li class="${page==1?"disabled":""}"><a href="<c:url value="/.adminManage?page=${page-1>1?page-1:1}"/>">&laquo;</a></li>
                <c:forEach begin="${page-3<1?1:page-3}" end="${page+3>totalPages?totalPages:page+3}" varStatus="loop">
                    <c:set var="active" value="${loop.index==page?'active':''}"/>
                    <li class="${active}"><a
                            href="<c:url value="/.adminManage?page=${loop.index}"/>">${loop.index}</a>
                    </li>
                </c:forEach>
                <li class="${page==totalPages?"disabled":""}">
                    <a href="<c:url value="/.adminManage?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                </li>
                <li class="${page==totalPages?"disabled":""}"><a href="<c:url value="/.adminManage?page=${totalPages}"/>">尾页</a></li>
            </ul>
        </nav>
    </div>

</div>
</body>
</html>