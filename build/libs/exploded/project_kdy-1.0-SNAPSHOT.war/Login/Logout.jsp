<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.project_kdy.utils.JSFunction" %>

<%
  session.removeAttribute("userId");
  session.removeAttribute("userName");

  session.invalidate(); // 전체 삭제

  JSFunction.alertLocation("로그아웃 되었습니다.", "/board/list.do", out);
//  response.sendRedirect("../List.jsp");
%>