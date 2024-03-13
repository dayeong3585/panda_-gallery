<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style></style>
    <script></script>

</head>
<body>
<nav class="navbar navbar-expand-sm bg-white navbar-dark fixed-top">
    <div class="container-fluid">
        <a href="/board/list.do"><img src="../image/Logo.jpg" width="70" height="70" alt="로고"></a>
        <div class="ms-auto">
            <%
                if (session.getAttribute("userId") == null) {
                    out.print("<a href='../Login/MemberJoin.jsp' class='btn btn-outline-primary mx-3'>회원가입</a>");
                    out.print("<a href='../Login/LoginForm.jsp' class='btn btn-outline-success'>로그인</a>");
                }
                else {
            %>
            <span class="navbar-text me-3 text-black"><%=session.getAttribute("userId")%>님 반갑습니다.</span>
            <a href="../Login/Logout.jsp" class="btn btn-outline-secondary">로그아웃</a>
            <%
                }
            %>
        </div>
    </div>
</nav>
</body>
</html>
