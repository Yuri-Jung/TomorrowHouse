<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오전 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>게시판 글쓰기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    window.addEventListener('DOMContentLoaded', function () {
      const btnBack = document.querySelector('#btn-back');
      btnBack.addEventListener('click', function () {
        history.back();
      });
    });
  </script>
<%--  <script>--%>
<%--    $('#btn-save').on('click', function () {--%>
<%--      let datas = {id: $('#id').val(), pw: $('#pw').val()};--%>
<%--      $.ajax({--%>
<%--        url: "pwCheck.jsp",--%>
<%--        type: "post",--%>
<%--        data: datas,--%>
<%--        success: function (data) {--%>
<%--          data = JSON.parse(data);--%>
<%--          if (data.result == "success") {--%>
<%--            const frm = $('#frm');--%>
<%--            frm.submit();--%>
<%--          }--%>
<%--          else {--%>
<%--            alert("아이디와 비밀번호가 틀렸습니다");--%>
<%--          }--%>
<%--        },--%>
<%--        error: function () {--%>
<%--          alert("통신오류");--%>
<%--        }--%>
<%--      });--%>
<%--    });--%>

</head>
<body>
<%@include file="header_login.jsp"%>
<header class="container mt-3">
  <div class="p-5 mb-4 bg-white rounded-3">
    <div class="container-fluid py-4">
      <h1 class="text-start fst-italic">writing</h1>
    </div>
  </div>
</header>
<main class="container mt-1 mb-5 pb-5">
  <div class="row">
    <form action= "boardWrite_process.jsp" method="post" id="frm" class="border rounded-3 p-4">
      <div class="col-sm">
        <select class="form-control me-3" id="sel" name="sel">
          <option value="" selected >선택하세요 &#9660;</option>
          <option value="인테리어" >인테리어</option>
          <option value="리모델링">리모델링</option>
          <option value="소품/가구">소품/가구</option>
        </select>
      </div>

      <div class="form-floating my-4">
        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
        <label for="title" class="form-label">Title</label>
      </div>
      <div class="form-floating my-4">
        <input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
        <label for="id" class="form-label">id</label>
      </div>
      <div class="form-floating my-4">
        <input type="text" class="form-control" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
        <label for="pw" class="form-label">password</label>
      </div>
      <div class="form-floating my-4" >
        <textarea type="form-control" class="form-control" rows="10" cols="50"
                  style="height: 500px" id="contents" name="contents" placeholder="내용"></textarea>
        <label for="contents" class="form-label">contents</label>
      </div>
      <div class="mb-3">
        <label for="formFile" class="form-label" id="imgFile" onabort="imgFile" multiple></label>
        <input class="form-control" type="file" id="formFile">
      </div>

      <div class="d-flex mt-4">
        <button class="btn btn-secondary" type="button" id="btn-back">돌아가기</button>
        <button class="btn btn-primary ms-3" type="submit" id="btn-save">저장</button>
      </div>
    </form>
  </div>
</main>

<%@include file="footer.jsp"%>
</body>

</html>
