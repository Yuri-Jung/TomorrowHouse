<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
  <title>header</title>
  <meta charset="UTF-8">
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
          <a class="nav-link fw-bolder text-primary fs-6" href="boardMain.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder fs-6" href="remodelingList.jsp">리모델링</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder fs-6" href="interiorList.jsp">인테리어</a>
        </li>
        <li class="nav-item">
          <a class="nav-link fw-bolder fs-6" href="furnitureList.jsp">소품/가구</a>
        </li>
      </ul>

      <ul class="navbar-nav">
<%--        검색창--%>
        <div class="container mt-4 me-3">
          <div class="row">
            <form method="post" name="search" action="search.jsp">
              <table class="pull-right">
                <tr>
                  <td><select class="form-control" name="searchField" id="searchField">
                    <option value="0">선택</option>
                    <option value="title">제목</option>
                    <option value="userId">작성자</option>
                    <option value="contents">내용</option>
                  </select></td>
                  <td><input type="text" class="form-control"
                              placeholder="검색어 입력" name="searchText" id="searchText" maxlength="100"></td>
                  <td><button type="submit" class="btn btn-info text-white">검색</button></td>
                </tr>
              </table>
            </form>
          </div>
        </div>
        <li class="nav-item">
          <a class="nav-link fw-bolder fs-5 me-3 mt-3" href="login.jsp">Login</a>
        </li>
        <li class="nav-item fw-bolder fs-5 mt-3 me-3">
          <a class="nav-link" href="join.jsp">join</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</body>
</html>
