<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-14
  Time: 오후 2:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%String userId = (String)session.getAttribute("userId");%>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style></style>
    <script>
        $(document).ready(function () {
            $("#btn-cancle").on("click", function () {
                history.back();
            });

        });
    </script>

</head>
<body>
<c:import url="../layout/Menu.jsp"></c:import>
<c:import url="../layout/Header.jsp"></c:import>
<c:import url="../layout/Header_2.jsp"></c:import>

<main class="container mt-5">
    <section>
        <div class="row">
            <div class="col-sm">
                <form action="/board/write.do" method="post">
                    <input type="hidden" name="id" value="<%=userId%>">
                    <div class="row mt-3">
                        <div class="col-sm">
                            <div class="form-floating">
                                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요.">
                                <label for="title">제목을 입력하세요.</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm">
                            <div class="form-floating">
                                <textarea class="form-control" id="content" name="content" rows="5" placeholder="내용을 입력하세요." style="height: 200px"></textarea>
                                <label for="content">내용을 입력하세요.</label>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-sm d-flex justify-content-end">
                            <button type="reset" class="btn btn-secondary me-2" id="btn-cancle">취소</button>
                            <button type="submit" class="btn btn-success">등록</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</main>

<%@ include file="../layout/Footer.jsp"%>

</body>
</html>
