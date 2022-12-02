<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오후 1:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  <link href="style.css" rel="stylesheet" type="text/css">
  <script>
    $(document).ready(function () {
      $('#btn-done').on('click', function () {
        const frm = $('#frm');
        if ($('#id').val() == "") {
          alert("아이디를 입력하세요");
        } else if ($('#pw').val() == "") {
          alert("비밀번호를 입력하세요");
        } else if ($('#name').val() == "") {
          alert("이름을 입력하세요");
        } else if ($('#email').val() == "") {
          alert("이메일을 입력하세요");
        } else {
          frm.submit();
        }
      });
    });

    window.addEventListener('DOMContentLoaded', function () {
      const btnUpdate = document.querySelector('#btn-done');
      const frm = document.querySelector('#frm');

      btnUpdate.addEventListener('click', function () {
        frm.action = "join_update_process.jsp";
        frm.submit()
      });
    });
  </script>
</head>
<%
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  String userIdCheck = (String)session.getAttribute("userId");
  String userId="";
  String userPw = "";
  String userName = "";
  String userEmail ="";
%>
<%
  try {
    String sql = "SELECT userId, userPw, userName, userEmail from user where userId=? ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, userIdCheck);
    rs = pstmt.executeQuery();

    while (rs.next()) {
      userId = rs.getString("userId");
      userPw = rs.getString("userPw");
      userName = rs.getString("userName");
      userEmail = rs.getString("userEmail");
    }
  }
  catch (SQLException e){
    out.println(e.getMessage());
  }
  finally {
    if(conn!=null){conn.close();}
    if(pstmt!=null){pstmt.close();}
    if(rs!=null){rs.close();}
  }
%>
<body>
<%@ include file="header_login.jsp"%>
<form action= "#" method="post" id="frm">
  <div class="join-page ">
    <div class="form">
      <p class="fs-3 fw-bolder ">개인정보 수정</p>
      <form class="register-form">
        <div class="p-2">
        <p class="text-start fs-6">Id</p>
        <input type="text" placeholder="id" id="id" name="id" value="<%=userId%>" readonly/>
          <p class="text-start fs-6">Password</p>
        <input type="password" placeholder="password" id="pw" name="pw" value="<%=userPw%>"/>
          <p class="text-start fs-6">Password-check</p>
        <input type="text" placeholder="password_check" id="pw_check" name="pw_check" value="<%=userPw%>"/>
          <p class="text-start fs-6">Name</p>
        <input type="text" placeholder="Name" id="name" name="name" value="<%=userName%>"/>
          <p class="text-start fs-6">Email</p>
        <input type="text" placeholder="email address" id="email" name="email" value="<%=userEmail%>"/>
        <button id="btn-done" name="btn-done" type="button" >save</button>
        </div>
      </form>
    </div>
  </div>
</form>
</body>
</html>
