<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-04
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");

    int idx = Integer.parseInt(request.getParameter("idx"));
    String title2 = request.getParameter("titleT");
    String contents2 = request.getParameter("contents2");



    String query = "UPDATE board SET title = ?, contents=?,update_dt= NOW() ";
    query += "WHERE idx = ? " ;
    PreparedStatement pstmt = null;

    try {

        pstmt = conn.prepareStatement(query);
        pstmt.setString(1, title2);
        pstmt.setString(2, contents2);
        pstmt.setInt(3, idx);
        pstmt.executeUpdate();
    }
    catch (SQLException e) {
        out.print(e.getMessage());
    }
    finally {
        if(pstmt != null) {pstmt.close();}
        if(conn != null) {conn.close();}
    }
    out.println("<script>alert('글이 수정되었습니다'); history.go(-2);</script>");
%>
