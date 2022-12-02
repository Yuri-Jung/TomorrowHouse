<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-29
  Time: 오후 6:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="dbconn.jsp"%>
<%@ page import="java.sql.*" %>

<%
    request.setCharacterEncoding("utf-8");
    int idx = Integer.parseInt(request.getParameter("idx"));

    PreparedStatement pstmt = null;
    String sql = "UPDATE board SET deleted_yn = 'Y' " ;
    sql += "WHERE idx = ? " ;

    try {
        conn = DriverManager.getConnection(url,user,passwd);
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        pstmt.executeUpdate();
    }
    catch (SQLException e){
        out.println(e.getMessage());
    }
    finally {
        if(conn != null){conn.close();}
        if(pstmt != null){pstmt.close();}
    }
    out.println("<script>alert('글이 삭제되었습니다'); history.go(-2);</script>");


%>

