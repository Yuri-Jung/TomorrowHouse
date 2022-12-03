<%--<%@ page import="dao.BoardDao" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page import="dto.BoardDto" %>--%>
<%--<%@ page import="dao.SearchDao" %>--%>
<%--<%@ page import="java.io.PrintWriter" %>&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: admin--%>
<%--  Date: 2022-12-03--%>
<%--  Time: 오전 10:31--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Title</title>--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">--%>
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<% // 로그인이 되어있지 않은 사람들만 로그인 회원가입 보이게--%>
<%--    String userId_check = null;--%>
<%--    if(session.getAttribute("userId")	!= null){--%>
<%--        userId_check = (String)session.getAttribute("userId");%>--%>
<%--<%@include file="header_login.jsp"%>--%>
<%--<%}else{%>--%>
<%--<%@include file="header.jsp"%>--%>
<%--<% }%>--%>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <table class="table table-hover" style="text-align: center">--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>글번호</th>--%>
<%--                <th>제목</th>--%>
<%--                <th>글쓴이</th>--%>
<%--                <th>날짜</th>--%>
<%--                <th>조회수</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <%--%>
<%--                SearchDao dao = new SearchDao();--%>
<%--//                String searchField, String searchText--%>
<%--                ArrayList<BoardDto> list = dao.getSearch(request.getParameter("searchField"),--%>
<%--                        request.getParameter("searchText"));--%>
<%--                if(list.size() == 0){--%>
<%--                    PrintWriter script = response.getWriter();--%>
<%--                    script.println("<script>");--%>
<%--                    script.println("alert('검색결과가 없습니다')");--%>
<%--                    script.println("history.back()");--%>
<%--                    script.println("</script>");--%>
<%--                }--%>
<%--                for (int i = 0; i < list.size(); i++){--%>
<%--            %>--%>
<%--            <tr>--%>
<%--                <td><%=list.get(i).getIdx()%></td>--%>
<%--                <td><%=list.get(i).getTitle()%></td>--%>
<%--                <td><%=list.get(i).getUserId()%></td>--%>
<%--                <td><%=list.get(i).getCreateDt()%></td>--%>
<%--                <td><%=list.get(i).getHitCnt()%></td>--%>
<%--            </tr>--%>
<%--            <%}%>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>

<%--</html>--%>
