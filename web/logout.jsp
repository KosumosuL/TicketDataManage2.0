<%@ page language="java" import="java.util.*, java.text.*"
         contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>

<%
    String path = request.getContextPath();
    session.removeAttribute("_adminid_");
    session.removeAttribute("_userid_");
    String script = "<script>location.href='"+path+"/index.jsp'</script>";
    response.setContentType("text/html;charset=utf-8");
    response.getWriter().println(script);
%>