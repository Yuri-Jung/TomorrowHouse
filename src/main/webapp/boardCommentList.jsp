<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ include file="dbconn.jsp" %>
<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-30
  Time: 오전 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
    int boardIdx = Integer.parseInt(request.getParameter("idx"));
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String userId = "";
    int idx = 0;
    String commentContents = "";
    String commentDate = "";


    String sql = "SELECT idx, userId, boardIdx, commentContents, commentDate, deleted_yn from comment where deleted_yn='N' and idx=? " ;
    try{
//        stmt = conn.createStatement();
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardIdx);
        rs = pstmt.executeQuery();

        if(rs.next()){
            idx = rs.getInt("idx");
            commentContents = rs.getString("commentContents");
            commentDate = rs.getString("commentDate");
            userId = rs.getString("userId");
            boardIdx = rs.getInt("boardIdx");
        }
    }
    catch (SQLException e){
        out.println(e.getMessage());
    }
    finally {
        if (rs != null) {rs.close();}
        if (conn != null) {conn.close();}
        if (pstmt != null) {pstmt.close();}
    }
    response.sendRedirect("boardDetail.jsp");
%>
