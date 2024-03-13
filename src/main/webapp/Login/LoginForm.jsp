<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-07
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

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

    <style>
        body{
            background-image: url("../image/bg10.jpg");
            background: no-repeat;
            background-size: contain;
        }
    </style>
    <script></script>

</head>
<body>
<%@ include file="../layout/Menu.jsp"%>

<%@ include file="../layout/Header.jsp"%>

<c:import url="../layout/Header_2.jsp"></c:import>

<main class="container mt-5" id="login_bg">
    <section>
        <div class="row">
            <div class="col-sm-4 mx-auto">
                <form action="LoginProcess.jsp" method="post">
                    <div class="my-3 form-floating">
                        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요.">
                        <label for="id">아이디를 입력하세요</label>
                    </div>
                    <div class="my-3 form-floating">
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요.">
                        <label for="pwd">비밀번호를 입력하세요</label>
                    </div>
                    <div class="my-3 d-grid">
                        <button type="submit" class="btn btn-primary">로그인</button>
                    </div>
                    <div class="my-3 d-flex justify-content-end">
                        <a href="./MemberJoin.jsp" class="btn btn-link text-info">회원 가입</a>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>
<%@ include file="../layout/Footer.jsp"%>
</body>
</html>
