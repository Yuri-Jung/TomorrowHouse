<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-26
  Time: 오전 1:19
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
<form action= "join_process.jsp" method="post">
<div class="join-page mt-5 p-5">
    <div class="form mt-5 p-5">
        <p class="fs-3 fw-bolder ">Sign Up</p>
        <form class="register-form">
            <input type="text" placeholder="id" id="id" name="id"/>
            <input type="password" placeholder="password" id="pw" name="pw"/>
            <input type="text" placeholder="Name" id="name" name="name"/>
            <input type="text" placeholder="email address" id="email" name="email"/>
            <button id="btn-done" type="submit" >create</button>
            <p class="message">Already registered? <a href="login.jsp">Login</a></p>
        </form>
    </div>
</div>
</form>
</body>

</html>