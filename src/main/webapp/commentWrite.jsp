<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %><%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: admin--%>
<%--  Date: 2022-11-30--%>
<%--  Time: 오후 4:26--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    int boardIdx = Integer.parseInt(request.getParameter("boardIdx"));
    String userId = (String)session.getAttribute("userId");
    String commentContents = request.getParameter("commentContents2");

    PreparedStatement pstmt = null;

    try{

    String sql = "INSERT INTO comment (boardIdx,userId,commentContents,commentDate) VALUES(?,?,?,now()) " ;
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1,boardIdx);
    pstmt.setString(2,userId);
    pstmt.setString(3,commentContents);
    pstmt.executeUpdate();
  }
  catch (SQLException e){
    out.println("SQLException e :" + e.getMessage());
  }
  finally {
    if(pstmt != null){pstmt.close();}
    if(conn != null){conn.close();}
  }
  out.println("<script>alert('댓글이 등록되었습니다');history.go(-1)</script>");

%>

