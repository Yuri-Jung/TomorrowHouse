<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    String userIdCheck = (String)session.getAttribute("userId");
    String userPw = request.getParameter("pw");
    String userName = request.getParameter("name");
    String userEmail = request.getParameter("email");

    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        String query = "UPDATE user SET userPw = ?, userName=?,userEmail= ? ";
        query += "WHERE userId = ? " ;
        conn = DriverManager.getConnection(url, user, passwd);
        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userPw);
        pstmt.setString(2, userName);
        pstmt.setString(3, userEmail);
        pstmt.setString(4, userIdCheck);
        pstmt.executeUpdate();
        out.println("테스트 중입니다");
    }
    catch (SQLException e) {
        out.print(e.getMessage());
    }
    finally {
        if(pstmt != null) {pstmt.close();}
        if(conn != null) {conn.close();}
    }
    out.println("<script>alert('개인정보가 수정되었습니다');history.go(-2);</script>");
//    response.sendRedirect("boardList.jsp");
%>
