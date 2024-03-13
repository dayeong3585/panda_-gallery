<%--
  Created by IntelliJ IDEA.
  User: pc
  Date: 2023-11-14
  Time: 오후 2:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
            crossorigin="anonymous"></script>

    <style>
        #bg {
            background-image: url("../image/bg11.jpg");
            background-size: contain;
            margin-top: 200px; /* Adjusted margin-top */
        }

        #boardText {
            font-size: 50px;
            margin-top: -150px; /* Adjusted negative margin-top to move the text up */
            text-align: center;
        }
    </style>
</head>

<header class="py-5 bg-image-full" id="bg">
    <div id="boardText">
        <a href="/board/list.do" class="text-decoration-none text-black">판다 갤러리</a>
    </div>
</header>