<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오전 9:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <title>header</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-sm bg-white navbar-white p-3">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold fs-4" href="boardMain.jsp" >내일의 집</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-between" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link fw-bolder text-primary" href="boardMain.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder" href="remodelingList.jsp">리모델링</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder" href="interiorList.jsp">인테리어</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder" href="furnitureList.jsp">소품/가구</a>
        </li>
      </ul>
      <ul class="navbar-nav">

<%--        <li class="nav-item fw-bolder me-3">--%>
<%--          <a class="nav-link" href="boardMyPage.jsp">MyPage</a>--%>
<%--        </li>--%>
        <li class="nav-item dropdown fw-bolder me-3">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            MyPage
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="boardMyPage.jsp">작성한 글</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="join_update.jsp">회원정보 수정</a></li>
          </ul>
        </li>
        <li class="nav-item fw-bolder me-3">
          <a class="nav-link" href="logout_process.jsp">Logout</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>
