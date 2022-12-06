<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오전 10:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>내일의집</title>
    <link rel="shortcut icon" href="fabicon/home.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<%@ include file="header_login.jsp"%>
<%@ include file="dbconn.jsp"%>
<header class="container mt-3">
    <div class="p-5 mb-4 bg-white rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-start fst-italic">MyPage</h1>
        </div>
    </div>

    <main class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>글번호</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>등록날짜</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        String userIdCheck = (String)session.getAttribute("userId");
                    %>
                    <%
                        try{
                            conn = DriverManager.getConnection(url,user,passwd);
                            String sql = "SELECT idx, title, userId, create_dt, hit_cnt, boardNum from board where deleted_yn= 'N' AND userId=? ORDER BY create_dt desc" ;
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, userIdCheck);
                            rs = pstmt.executeQuery();

                            while(rs.next()){
                                int idx = rs.getInt("idx");
                                String title = rs.getString("title");
                                String userId = rs.getString("userId");
                                String createDt = rs.getString("create_dt");
                                int hitCnt = rs.getInt("hit_cnt");
                    %>
                    <tr>
                        <td><%=idx%></td>
                        <td><a class="text-decoration-none" href="boardDetail.jsp?idx=<%=idx%>"> <%=title%></a></td>
                        <td><%=userId%></td>
                        <td><%=createDt%></td>
                        <td><%=hitCnt%></td>
                    </tr>
                    <%
                            }
                        }
                        catch (SQLException e) {
                            out.print("SQLException :" +e.getMessage());
                        }
                        finally {
                            if (rs != null) {rs.close();}
                            if (conn != null) {conn.close();}
                            if (pstmt != null) {pstmt.close();}
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp"%>
</header>
</body>
</html>
