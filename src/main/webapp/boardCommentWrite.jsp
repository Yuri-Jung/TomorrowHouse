<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-30
  Time: 오전 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Enumeration" %>

<%
    request.setCharacterEncoding("utf-8");
    String sel = request.getParameter("sel");
    String userId = request.getParameter("id");
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    PreparedStatement pstmt = null;
    try{

        String sql = "INSERT INTO comment (boardNum,title,userId,contents,create_dt) VALUES(?,?,?,?,now()) " ;
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1,selected);
        pstmt.setString(2,title);
        pstmt.setString(3,userId);
        pstmt.setString(4,contents);

        pstmt.executeUpdate();
    }
    catch (SQLException e){
        out.println("SQLException e :" + e.getMessage());
    }
    finally {
        if(pstmt != null){pstmt.close();}
        if(conn != null){conn.close();}
    }
    out.println("<script>alert('글이 등록되었습니다');history.go(-2)</script>");

%>
