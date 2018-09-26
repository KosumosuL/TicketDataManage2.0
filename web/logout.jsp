<%@ page language="java" import="java.util.*, java.text.*"
         contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%
    String path = request.getContextPath();
    session.removeAttribute("_adminid_");
    session.removeAttribute("name_display");
    session.removeAttribute("pwd_display");
    session.removeAttribute("baddr_display");
    session.removeAttribute("bdate_display");
    session.removeAttribute("id_num_display");
    session.removeAttribute("tel_display");
    session.removeAttribute("authority_display");
    session.removeAttribute("usersPerPage");

    session.removeAttribute("_userid_");
    session.removeAttribute("ipccustomer_display");
    session.removeAttribute("customercode_display");
    session.removeAttribute("cause_display");
    session.removeAttribute("summary_display");
    session.removeAttribute("componenttype_display");
    session.removeAttribute("ostype_display");
    session.removeAttribute("identifier_display");
    session.removeAttribute("ticketstatus_display");
    session.removeAttribute("lastoccurrence_display");
    session.removeAttribute("node_display");
    session.removeAttribute("resolution_display");
    session.removeAttribute("servername_display");
    session.removeAttribute("alertgroup_display");
    session.removeAttribute("component_display");
    session.removeAttribute("firstoccurrence_display");
    session.removeAttribute("severity_display");
    session.removeAttribute("ticketsPerPage");

    session.removeAttribute("sort_attr");
    session.removeAttribute("sort_type");

    String script = "<script>location.href='"+path+"/index.jsp'</script>";
    response.setContentType("text/html;charset=utf-8");
    response.getWriter().println(script);
%>