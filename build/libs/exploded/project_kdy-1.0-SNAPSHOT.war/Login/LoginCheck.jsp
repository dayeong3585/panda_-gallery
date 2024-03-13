<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.project_kdy.utils.JSFunction" %>
<%
    if (session.getAttribute("userId") == null) {
        JSFunction.alertLocation("로그인 후 이용해 주세요.", "./login/LoginForm.jsp", out);
    }
%>