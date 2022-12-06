<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.swing.plaf.nimbus.State" %>
<%@ page import="dto.BoardDto" %>
<%@ page import="java.util.Vector" %>
<%--<jsp:useBean id="bMgr" class="common.BoardMgr"></jsp:useBean>--%>
<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%--<%--%>
<%--    int totalRecord = 0; //전체 레코드 수--%>
<%--    int numPerPage = 0; //페이지 당 레코드 수--%>
<%--    int pagePerBlock = 15; //블럭 당 레코드 수--%>

<%--    int totalPage = 0; // 전체 페이지 수--%>
<%--    int totalBlock = 0; // 전체 블럭 수--%>

<%--    int nowPage = 1; // 현재 페이지--%>
<%--    int nowBlock = 1; // 현재 블럭--%>

<%--    int start = 0; //board 테이블의 select 시작번호--%>
<%--    int end = 10; // 시작 번호로 부터 가져올 select 개수--%>

<%--    int listSize = 10;--%>
<%--    String keyWord = "", keyField = "";--%>
<%--    Vector<BoardDto> vlist = null;--%>
<%--    if(request.getParameter("keyWord")!=null) {--%>
<%--        keyWord = request.getParameter("keyWord");--%>
<%--        keyField = request.getParameter("keyField");--%>
<%--    }--%>
<%--    if (request.getParameter("reload")!= null){--%>
<%--        if(request.getParameter("reload").equals("true")){--%>
<%--            keyWord = "";--%>
<%--            keyField = "";--%>
<%--        }--%>
<%--    }--%>

<%--    if(request.getParameter("nowPage")!=null){--%>
<%--        nowPage = Integer.parseInt(request.getMethod("nowPage"));--%>

<%--    }--%>
<%--    start = (nowPage * numPerPage) - numPerPage;--%>
<%--    end = numPerPage;--%>

<%--    totalRecord = bMgr.getTotalCount(keyField,keyWord);--%>
<%--    totalPage = (int)Math.ceil((double) totalRecord / numPerPage); //전체페이지 수--%>
<%--    nowBlock = (int) Math.ceil((double) nowPage/pagePerBlock); //현재 블록 계산--%>
<%--    totalBlock = (int) Math.ceil((double) totalPage/pagePerBlock); //전체 블록계산--%>
<%--%>--%>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
    <title>내일의집</title>
    <link rel="shortcut icon" href="fabicon/home.png" type="image/x-icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function btn_click(){
            alert('로그인을 하셔야 이용하실 수 있습니다');
            location.href='login.jsp';
        }
    </script>

</head>
<body>
<% //로그인 여부에 따라 헤더 다르게 출력
    String userId_check = null;
    if(session.getAttribute("userId")	!= null){
        userId_check = (String)session.getAttribute("userId");%>
<%@include file="header_login.jsp"%>
<%}else{%>
<%@include file="header.jsp"%>
<% }%>
<%@ include file="dbconn.jsp"%>
<header class="container mt-3">
    <div class="p-5 mb-4 bg-white rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-start fst-italic">리모델링 페이지</h1>
        </div>
    </div>
    <%
        Statement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT idx, title, userId, create_dt, hit_cnt, boardNum from board where deleted_yn= 'N' AND boardNum='1' ORDER BY create_dt desc" ;
    %>
    <main class="container mt-5">
        <div class="row">
            <div class="col-sm">
                <table class="table table-hover">
                    <thead>
<%--                    <%--%>
<%--                        for(int i = 0; i<numPerPage; i++){--%>
<%--                            if(i==listSize) break;--%>

<%--                            BoardDto dto = vlist.get(i);--%>
<%--                            int idx = dto.getIdx();--%>
<%--                            String title = dto.getTitle();--%>
<%--                            String userId = dto.getUserId();--%>
<%--                            String createDt = dto.getCreateDt();--%>
<%--                            int hitCnt = dto.getHitCnt();--%>
<%--                        }--%>
<%--                    %>--%>
<%--                    <%=totalRecord-((nowPage-1) * numPerPage) - i%>--%>
<%--                    <tr>--%>
<%--                        <th>글번호</th>--%>
<%--                        <th>제목</th>--%>
<%--                        <th>글쓴이</th>--%>
<%--                        <th>등록날짜</th>--%>
<%--                        <th>조회수</th>--%>
<%--                    </tr>--%>

<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <%--%>
<%--                        if(depth>0){--%>
<%--                            for(int j=0; j<depth; j++){--%>
<%--                                out.println("&nbsp;&nbsp;");--%>
<%--                            }--%>
<%--                        }--%>
<%--                    %>--%>
<%--                    <a href="javascript:read(''<%=idx%>)"--%>
                    <%
                        try{
                            conn = DriverManager.getConnection(url,user,passwd);
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            while(rs.next()){
                                int idx = rs.getInt("idx");
                                String title = rs.getString("title");
                                String userId = rs.getString("userId");
                                String createDt = rs.getString("create_dt");
                                int hitCnt = rs.getInt("hit_cnt");
                    %>
                    <tr>
                        <td><%=idx%></td>
                        <td><a class="text-decoration-none" href="boardDetail.jsp?idx=<%=idx%>"> <%=title%></a></td>
                        <td><%=userId%></td>
                        <td><%=createDt%></td>
                        <td><%=hitCnt%></td>
                    </tr>
                    <%
                            }
                        }
                        catch (SQLException e) {
                            out.print("SQLException :" +e.getMessage());
                        }
                        finally {
                            if (rs != null) {rs.close();}
                            if (conn != null) {conn.close();}
                            if (stmt != null) {stmt.close();}
                        }
                    %>
                    </tbody>
                </table>
                <% // 로그인이 되어있지 않은 사람들만 로그인 회원가입 보이게
                    userId_check = null;
                    if(session.getAttribute("userId")	!= null){%>
                <div class="d-flex justify-content-end">
                        <a href="boardWrite2.jsp" class="btn btn-primary">글쓰기</a>
                </div>
                <%}else{%>
                <div class="d-flex justify-content-end">
                    <a href="login.jsp" class="btn btn-primary" id="btn-write" onclick="btn_click();">글쓰기</a>
                </div>
                <% }%>

<%--                <div class="d-flex justify-content-end">--%>
<%--                    <a href="boardWrite2.jsp" class="btn btn-primary">글쓰기</a>--%>
<%--                </div>--%>

            </div>
        </div>
<%--        페이징 및 블럭 처리--%>
    </main>
    <%@ include file="footer.jsp"%>
</header>
</body>
</html>
