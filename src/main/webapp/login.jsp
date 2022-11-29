<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-26
  Time: 오전 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<%@include file="header.jsp"%>
<form action= "login_process.jsp" method="post">
<div class="login-page mt-5 p-5">
    <div class="form mt-5 p-5">
        <p class="fs-3 fw-bolder ">Login</p>
        <form class="login-form">
            <input type="text" placeholder="id" id="id" name="id" />
            <input type="password" id="pw" name="pw" placeholder="password" />
            <button type="submit">login</button>
            <p class="message" >Not registered? <a href="join.jsp">Create an account</a></p>
        </form>
    </div>
</div>
</form>
</body>

</html>
