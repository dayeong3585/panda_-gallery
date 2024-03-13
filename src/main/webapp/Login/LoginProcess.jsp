<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오전 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.bitc.project_kdy.database.MemberDao" %>
<%@ page import="com.bitc.project_kdy.database.MemberDto" %>
<%@ page import="com.bitc.project_kdy.utils.JSFunction" %>

<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    MemberDao dao = new MemberDao(application);
    dao.dbOpen();

    boolean isMember = dao.isMember(id, pwd);

    if (isMember) {
        MemberDto member = dao.selectMember(id);
        dao.dbClose();

        session.setAttribute("userId", member.getId());
        session.setMaxInactiveInterval(60 * 5);

        response.sendRedirect("/board/list.do");
    }
    else {
        JSFunction.alertBack("ID나 비밀번호가 틀렸습니다.", out);
    }


%>