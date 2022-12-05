<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-25
  Time: 오후 4:35
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
    <style>
        .carousel-item{
            text-align: center;
            display: inline-block;
        }
    </style>
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
<%@ include file="dbconn.jsp"%>
<%--캐러셀  carousel--%>
<div class="container mt-3 p-4">
    <div id="carouselExampleControls" class="carousel slide mt-3" data-bs-ride="carousel">
    <div class="carousel-inner ">
        <div class="carousel-item active">
            <img src="image/aaa.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="image/b.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="image/c.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
    </div>
</div>


<div class="container mt-4 p-4">
    <div class="row">
        <div class="col-sm">
            <br>
            <p class="fs-3">Remodeling top5</p>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <%
                    request.setCharacterEncoding("UTF-8");
                    Statement pstmt = null;
                    ResultSet rs = null;
                    try {
                        String sql = "SELECT * from board where boardNum = 1 ORDER BY hit_cnt DESC LIMIT 0,5  ";
                        pstmt = conn.createStatement();
                        rs = pstmt.executeQuery(sql);

                        while (rs.next()) {
                            int idx1 = rs.getInt("idx");
                            String title1= rs.getString("title");
                            int hitCnt1 = rs.getInt("hit_cnt");
                %>
                <tr>
                    <td><%=idx1%></td>
                    <td><a class="text-decoration-none" href="boardDetail.jsp?idx=<%=idx1%>"> <%=title1%></a></td>
                    <td><%=hitCnt1%></td>
                </tr>
                <%
                        }
                    }catch (SQLException e){
                        e.getMessage();
                    }
                %>
                </tbody>
            </table>

<%--            인테리어--%>
            <br>
            <p class="fs-3">Interior top5</p>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <%

                    try {
                        String sql2 = "SELECT * from board where boardNum = 2 ORDER BY hit_cnt DESC LIMIT 0,5  ";
                        pstmt= conn.createStatement();
                        rs = pstmt.executeQuery(sql2);

                        while (rs.next()) {
                            int idx2 = rs.getInt("idx");
                            String title2= rs.getString("title");
                            int hitCnt2 = rs.getInt("hit_cnt");
                %>
                <tr>
                    <td><%=idx2%></td>
                    <td><a class="text-decoration-none" href="boardDetail.jsp?idx=<%=idx2%>"> <%=title2%></a></td>
                    <td><%=hitCnt2%></td>
                </tr>
                <%
                        }
                    }catch (SQLException e){
                        e.getMessage();
                    }
                %>
                </tbody>
            </table>

<%--            가구/소품--%>
            <br>
            <p class="fs-3">furniture/object top5</p>
            <br>
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>조회수</th>
                </tr>
                </thead>
                <tbody>
                <%

                    try {
                        String sql = "SELECT * from board where boardNum = 3 ORDER BY hit_cnt DESC LIMIT 0,5  ";
                        pstmt= conn.createStatement();
                        rs = pstmt.executeQuery(sql);

                        while (rs.next()) {
                            int idx3 = rs.getInt("idx");
                            String title3= rs.getString("title");
                            int hitCnt3 = rs.getInt("hit_cnt");
                %>
                <tr>
                    <td><%=idx3%></td>
                    <td><a class="text-decoration-none" href="boardDetail.jsp?idx=<%=idx3%>"> <%=title3%></a></td>
                    <td><%=hitCnt3%></td>
                </tr>
                <%
                        }
                    }catch (SQLException e){
                        e.getMessage();
                    }
                %>
                </tbody>
            </table>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>

</html>
