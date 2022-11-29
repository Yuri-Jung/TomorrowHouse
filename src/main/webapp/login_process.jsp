<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오후 12:34
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=utf-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@include file="dbconn.jsp"%>
<%
  request.setCharacterEncoding("utf-8");
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try{
    String sql = "SELECT userId, userPw, userName FROM user where userId = ? " ;
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, id);

    rs = pstmt.executeQuery();

    if (rs.next()) {
      if(pw.equals(rs.getString("userPw"))){
        session.setAttribute("name", rs.getString("userName"));
        out.println("<script>alert('환영합니다'); location.href='boardMain.jsp';</script>");
      }
    }
    else {
      out.println("<script>alert('일치하는 데이터가 없습니다'); location.href='login.jsp';</script>");
    }
  }
  catch (SQLException e){
    out.println("SQLException e : " + e.getMessage());
  }
  finally {
    if(conn != null){conn.close();}
    if(pstmt != null){pstmt.close();}
    if(rs != null){rs.close();}
  }
%>