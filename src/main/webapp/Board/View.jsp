<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-14
  Time: 오후 2:59
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style></style>
    <script>
        $(document).ready(function () {
            $("#btn-list").on("click",function () {
                location.href = "/board/list.do";
            });

            // 삭제 버튼과 수정 버튼은 클릭 시 비밀번호를 확인하는 페이지로 이동
            $("#btn-delete").on("click",function () {
                location.href = "/board/delete.do?idx=${param.idx}&id=${board.id}";
            });

            $("#btn-update").on("click",function () {
                location.href = "/board/edit.do?mode=update&idx=${param.idx}&id=${board.id}";
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
                <div class="row mt-3">
                    <div class="col-sm">
                        <div class="input-group">
                            <span class= "input-group-text caption-1">제목</span>
                            <input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm">
                        <div class="input-group">
                            <span class= "input-group-text caption-1">작성자</span>
                            <input type="text" class="form-control" id="name" name="name" value="${board.id}" readonly>
                        </div>
                    </div>
                    <div class="col-sm">
                        <div class="input-group">
                            <span class= "input-group-text caption-1">등록일</span>
                            <input type="text" class="form-control" id="postdate" name="postdate" value="${board.postdate}" readonly>
                        </div>

                    </div>
                    <div class="col-sm">
                        <div class="input-group">
                            <span class= "input-group-text caption-1">조회수</span>
                            <input type="text" class="form-control" id="visitcount" name="visitcount" value="${board.visitcount}" readonly>
                        </div>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-sm">
                        <div class="input-group">
                            <span class= "input-group-text caption-1">내용</span>
                            <textarea class="form-control" id="content" name="content" readonly>${board.content}</textarea>
                        </div>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm">
                        <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
                    </div>
                    <div class="col-sm d-flex justify-content-end">
                        <button type="button" class="btn btn-danger me-2" id="btn-delete">삭제</button>
                        <button type="button" class="btn btn-warning" id="btn-update">수정</button>
                    </div>
                </div>
            </div>
            <div class="mt-3">

            </div>
        </div>
    </section>

</main>

<%@ include file="../layout/Footer.jsp"%>

</body>
</html>
