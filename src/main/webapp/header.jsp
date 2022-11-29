<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

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
        <li class="nav-item">
          <a class="nav-link fw-bolder me-3" href="login.jsp">Login</a>
        </li>
        <li class="nav-item fw-bolder me-3">
          <a class="nav-link" href="join.jsp">Sign Up</a>
        </li>
        <li class="nav-item fw-bolder me-3">
          <a class="nav-link" href="#">MyPage</a>
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
