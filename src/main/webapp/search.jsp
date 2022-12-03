<%@ page import="dao.BoardDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.BoardDto" %>
<%@ page import="dao.SearchDao" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-03
  Time: 오전 10:31
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
</head>
<body>
<% // 로그인이 되어있지 않은 사람들만 로그인 회원가입 보이게
    String userId_check = null;
    if(session.getAttribute("userId")	!= null){
        userId_check = (String)session.getAttribute("userId");%>
<%@include file="header_login.jsp"%>
<%}else{%>
<%@include file="header.jsp"%>
<% }%>

<div class="container mt-5 p-5">
    <div class="row">
        <table class="table table-hover" style="text-align: center">
            <thead>
            <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
            </thead>
            <tbody>
        <%
            request.setCharacterEncoding("UTF-8");
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            String searchText = request.getParameter("searchText");
            String searchField = request.getParameter("searchField");
            String sql = "SELECT * FROM board where " + searchField.trim();
            try {
                if (searchText != null && !searchText.equals("")) {
                    sql += " LIKE '%" + searchText.trim() + "%' ";
                }
            }
            catch (Exception e){
                e.printStackTrace();
            }
        %>
        <%
            try{
                conn = DriverManager.getConnection(url,user,passwd);

                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while(rs.next()) {
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
            catch (Exception e){
                e.printStackTrace();
    }
            finally {
                if(conn!= null){conn.close();}
                if(pstmt!= null){pstmt.close();}
                if(rs!= null){rs.close();}
    }

%>
            </tbody>
        </table>
    </div>
</div>
<%@ include file="footer.jsp"%>
</body>

</html>
