<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-02
  Time: 오후 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="dbconn.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int idx = Integer.parseInt(request.getParameter("idx"));

    int likeCnt = 0;
    try{
        String query = "UPDATE board SET like_cnt = like_cnt+1 where idx = ?" ;
        pstmt = conn.prepareStatement(query);
        pstmt.setInt(1,idx);
        pstmt.executeUpdate();
    }
    catch (SQLException e) {
        e.getMessage();
    }
    finally {
        if(conn !=null){conn.close();}
        if(pstmt !=null){pstmt.close();}
    }

%>
