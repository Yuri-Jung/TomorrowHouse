<%@ page import="dto.CommentDto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-11-28
  Time: 오후 8:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#btn-back').on('click', function () {
                history.back();
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#btn-delete').on('click', function () {
                if(!userId_check.equals(userId)){
                    prompt("본인 글만 삭제할 수 있습니다.")
                    history.back();
                }
            });
        });
    </script>
    <script>
        function btn_click(){
            alert('로그인을 하셔야 이용하실 수 있습니다');
            location.href='login.jsp';
        }

        function btn_like(){
            alert('로그인을 하셔야 이용하실 수 있습니다');
            location.href='login.jsp';
        }



    </script>

<style>
    #tblAddCommnet, #tblListComment { width: 700px; margin: 15px auto; }

    #tblAddComment { margin-top: 30px; }
    #tblAddComment td:nth-child(1) { width: 600px; }
    #tblAddComment td:nth-child(2) { width: 100px; }

    #tblListComment td:nth-child(1) { width: 600px; }
    #tblListComment td:nth-child(2) { width: 100px; }

    #tblListComment td {
        position: relative;
        left: 0;
        top: 0;
    }

    #tblListComment td span {
        position: absolute;
        right: 10px;
        bottom: 5px;
        color: #AAA;
        font-size: 11px;
    }

</style>
</head>
<body>
<%
    String userId_check = null;
    if(session.getAttribute("userId")	!= null){
        userId_check = (String)session.getAttribute("userId");%>
<%@include file="header_login.jsp"%>
<%}else{%>
<%@include file="header.jsp"%>
<% }%>

<%--    메인 데이터 가져오기--%>
<%

    request.setCharacterEncoding("UTF-8");
    int idx = Integer.parseInt(request.getParameter("idx"));
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String title = "";
    String contents = "";
    String userId = "";
    int hitCnt = 0;
    int likeCnt = 0;
    String createDt = "";
    String updateDt = "";



//    String query = "UPDATE "

try {
//    조회수 올리기
    String query = "UPDATE board SET hit_cnt = hit_cnt+1 where idx = ? ";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, idx);
    pstmt.executeUpdate();


    try {
//        상세정보 가져오기
        String sql = "SELECT idx, title, contents, userId, create_dt, hit_cnt,update_dt, like_cnt from board where deleted_yn='N' and idx=? ";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            idx = rs.getInt("idx");
            title = rs.getString("title");
            contents = rs.getString("contents");
            userId = rs.getString("userId");
            createDt = rs.getString("create_dt");
            updateDt = rs.getString("update_dt");
            hitCnt = rs.getInt("hit_cnt");
            likeCnt = rs.getInt("like_cnt");
        }
    }
    catch (SQLException e){
        out.println(e.getMessage());
    }
}
    catch (SQLException e){
        out.println(e.getMessage());
    }
    finally {

    }
%>
<%--    리뷰데이터 가져오기--%>
<%
    request.setCharacterEncoding("UTF-8");
    int boardIdx = Integer.parseInt(request.getParameter("idx"));
    PreparedStatement pstmt2 = null;
    int idx2 = 0;
    ResultSet rs2 = null;
    String commentDate = "";
    String commentContents = "";
    String userId2 = "";

    try {
        String sql2 = "SELECT idx, userId, boardIdx, commentContents, commentDate, deleted_yn from comment ";
        sql2 += " where deleted_yn='N' and boardIdx= ? ";
        pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setInt(1, boardIdx);
        rs2 = pstmt2.executeQuery();
        if(rs2.next()) {
            idx2=(rs2.getInt("idx"));
            userId2=(rs2.getString("userId"));
            commentContents=(rs2.getString("commentContents"));
            commentDate=(rs2.getString("commentDate"));
        }
    }
    catch (SQLException e){
        out.println(e.getMessage());
    }
    finally {
        if (rs != null) {rs.close();}
        if (conn != null) {conn.close();}
        if (pstmt != null) {pstmt.close();}
        if (rs2 != null) {rs2.close();}
        if (conn != null) {conn.close();}
        if (pstmt2 != null) {pstmt2.close();}
    }
%>

<main class="container mt-5">
    <form action="#" method="post" name="frm2" id="frm2">
    <div class="row">
        <div class="col-sm">

            <div class="row my-3">
                <div class="col-sm">
                    <label for="titleT" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="titleT" name="titleT" value="<%=title%>">
                </div>
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <label for="user-id" class="form-label">아이디:</label>
                    <input type="text" class="form-control" id="user-id" name="userId" value="<%=userId%>" readonly>
                </div>
                <div class="col-sm">
                    <label for="hit-cnt" class="form-label">조회수:</label>
                    <input type="text" class="form-control" id="hit-cnt" name="hitCtn" value="<%=hitCnt%>" readonly>
                </div>
                <div class="col-sm">
                    <label for="like-cnt" class="form-label">좋아요 수:</label>
                    <input type="text" class="form-control" id="like-cnt" name="likeCnt" value="<%=likeCnt%>" readonly>
                </div>
                <div class="col-sm">
                    <label for="create-dt" class="form-label">등록일</label>
                    <input type="text" class="form-control text-end" id="create-dt" name="createDt" value="<%=createDt%>" readonly>
                </div>
                <div class="col-sm">
                    <label for="update-dt" class="form-label">수정일</label>
                    <input type="text" class="form-control text-end" id="update-dt" name="updateDt" value="<%=updateDt%>" readonly>
                </div>
            </div>
            <div class="col-sm">
                <label for="contents2" class="form-label">내용</label>
                <input type="text" class="form-control" id="contents2" name="contents2" value="<%=contents%>"
                        style="height: 500px" rows="10" cols="50">
            </div>

            <div class="row my-3">
                <div class="col-sm">
                    <button type="button" class="btn btn-secondary" id="btn-back">뒤로가기</button>
                </div>
                <div class="col-sm d-flex justify-content-end">

<%--                    <button class="btn btn-danger me-2" type="submit" id="btn-like">좋아요</button>--%>
                                    <%--본인 글에만 좋아요, 삭제버튼이 나오게--%>
                <div class="col-sm">
                            <%

                                if(session.getAttribute("userId")!=null && session.getAttribute("userId").equals(userId)) {%>
                                <a href="boardUpdate.jsp?idx=<%=idx%>" class="btn btn-warning me-2" id="btn-update">수정하기</a>
                                <a href="boardDelete.jsp?idx=<%=idx%>" class="btn btn-warning me-2" id="btn-delete" type="button">삭제하기</a>
                </div>
                        <%}else{%>
<%--    <a href="boardUpdate.jsp?idx=<%=idx%>" class="btn btn-warning me-2" id="btn-update">로그인하고</a>--%>
<%--    <a href="boardDelete.jsp?idx=<%=idx%>" class="btn btn-warning me-2" id="btn-delete" type="button">로그인하고</a>--%>
                        <%}%>
    </form>
    <%
        if(session.getAttribute("userId") != null){%>
    <a href="like.jsp?boardIdx=<%=idx%>" class="btn btn-danger me-2" type="submit" id="btn-like">좋아요</a>
                </div>
                <%}else{%>
                <button class="btn btn-danger me-2" type="submit" id="btn-like" onclick="btn_like()" >좋아요</button>
                <% }%>
                </div>
        </div>
        </div>
        </div>

        <div>
<%--            enctype="multipart/form-data"--%>
            <form method="post" action="commentWrite.jsp" id="frm" name="frm">
<%--                action="commentWrite.jsp?boardIdx=<%=idx%>"--%>
            <table id="commentList" class="table table-bordered">
                <thead>
                    <tr>
                        <td>글번호</td>
                        <td>작성자</td>
                        <td>내용</td>
                        <td>날짜</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="10%"><%=idx2%></td>
                        <td width="15%"><%=userId2%></td>
                        <td width="60%"> <%=commentContents%></td>
                        <td width="30%"><%=commentDate%></td>

                        <%
                            if(session.getAttribute("userId")!=null &&userId_check.equals(userId2)) {%>
                            <td width="30%"><a href="commentDelete.jsp?boardIdx=<%=idx2%>" class="btn btn-primary">삭제</a></td>
                        <%}%>
                    </tr>
                </tbody>
            </table>
                <table id="tblAddComment" class="table table-bordered">
                    <tr>
                <div class="d-flex justify-content-end">
<%--                    로그인 되어있는 사람만 댓글 작성할 수 있게--%>
                    <td>
                        <textarea class="form-control" id="commentContents2" name="commentContents2" placeholder="내용을 입력하세요"></textarea>
                        <label for="commentContents2" class="form-label">Contents...</label>
                    </td>
<%--    required placeholder="댓글을 작성하세요. "--%>
                    <%
                    if(userId_check	!= null){%>
                    <td><input type="button" name="btn-comment" id="btn-comment" class="btn-primary" value="댓글 작성" id="btn-comment" name="btn-comment"></td>
                </div>
                <%}else{%>
<%--                        <td><input type="button" class="btn-primary pull" value="댓글 작성" onclick="btn_click();"></td>--%>
                <% }%>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
<script>
    window.addEventListener('DOMContentLoaded', function () {
        const frm = document.querySelector('#frm');
        const frm2 = document.querySelector('#frm2');
        const btnCommentWrite = document.querySelector('#btn-comment');
        const btnUpdate = document.querySelector("#btn-update");
        const btnLike = document.querySelector("#btn-like");

        btnCommentWrite.addEventListener('click', function () {
            // alert("댓글작성버튼이 클릭되었습니다")
            <%--frm.action="commentWrite.jsp?boardIdx=<%=idx%>&commentContents2=<%=commentContents2%>";--%>
            frm.action="commentWrite.jsp?boardIdx=<%=idx%>&commentContents2=" + $("#commentContents2").val();
            frm.submit();
        });
        btnUpdate.addEventListener('click', function () {
            frm.action="boardUpdate.jsp?boardIdx=<%=idx%>&titleT=" + $("#titleT").val();
            frm.submit();
        });

    //     btnLike.addEventListener('click', function () {
    //
    //     })
    });
</script>
</body>
</html>
