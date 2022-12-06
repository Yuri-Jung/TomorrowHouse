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
    <title>내일의집</title>
    <link rel="shortcut icon" href="fabicon/home.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="style.css" rel="stylesheet" type="text/css">

    <script>
        $(document).ready(function () {
            $('#btn-save').on('click', function () {
                const frm = $('#frm');
                //간단하게 신원확인할 수 있다. 아이디 비밀번호 확인.

                if ($('#id').val() == "") {
                    alert("아이디를 입력하세요");
                }
                else if($('#pw').val() == ""){
                    alert("비밀번호를 입력하세요");
                }
                else {
                        frm.submit();
                }
            });
            $('#btn-back').on('click', function () {
                history.back();
            });
        });

    </script>
</head>
<body>
<% // 로그인이 되어있지 않은 사람들만 로그인 회원가입 보이게
    String userId = null;
    if(session.getAttribute("userId")	!= null){
        userId = (String)session.getAttribute("userId");%>
<%@include file="header_login.jsp"%>
<%}else{%>
<%@include file="header.jsp"%>
<% }%>
<form action= "login_process.jsp" method="post" id="frm" name="frm">
<div class="login-page mt-5 p-5">
    <div class="form mt-5 p-5">
        <p class="fs-3 fw-bolder ">Login</p>
        <form class="login-form" >
            <input type="text" placeholder="id" id="id" name="id" />
            <input type="password" id="pw" name="pw" placeholder="password" />
            <button type="button" id="btn-save" name="btn-save">login</button>
            <p class="message" >Not registered? <a href="join.jsp">Create an account</a></p>
        </form>
    </div>
</div>
</form>
</body>

</html>
