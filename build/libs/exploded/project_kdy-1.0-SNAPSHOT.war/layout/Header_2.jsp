<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-20
  Time: 오후 2:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>
</head>

<%
    String fileName = request.getRequestURI();
    fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
    switch (fileName) {
        case "List.jsp":
            pageContext.setAttribute("pageName", "목록");
            break;

        case "Write.jsp":
            pageContext.setAttribute("pageName", "글 쓰기");
            break;

        case "View.jsp":
            pageContext.setAttribute("pageName", "상세");
            break;

        case "Edit.jsp":
            pageContext.setAttribute("pageName", "수정");
            break;

        case "LoginForm.jsp":
            pageContext.setAttribute("pageName", "로그인");
            break;

        case "MemberJoin.jsp":
            pageContext.setAttribute("pageName", "회원가입");
            break;

    }
%>


<div class="container-fluid bg-black bg-opacity-25 p-3">
    <h3 class="text-center m-1">${pageName} 페이지</h3>
</div>

