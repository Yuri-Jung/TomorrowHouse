<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오후 12:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>

<%
    request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("id");
    String pw = request.getParameter("pw");
    String userName = request.getParameter("name");
    String email = request.getParameter("email");
    PreparedStatement pstmt = null;
    try{
        String sql = "INSERT INTO user(userId, userPw, userName, userEmail) VALUES(?,?,?,?) " ;
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,userId);
        pstmt.setString(2,pw);
        pstmt.setString(3,userName);
        pstmt.setString(4,email);
        pstmt.executeUpdate();
        }
    catch (SQLException e){
        out.println("SQLException e :" + e.getMessage());
    }
    finally {
        if(pstmt != null){pstmt.close();}
        if(conn != null){conn.close();}
    }
    out.println("<script>alert('회원가입이 완료되었습니다 환영합니다'); location.href='login.jsp';</script>");
//    response.sendRedirect("boardMain.jsp");
%>