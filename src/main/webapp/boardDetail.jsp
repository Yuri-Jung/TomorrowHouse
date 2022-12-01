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
<script type="text/javascript">

    $(function(){

        var able = $('#userId').val();		//	로그인된 유저의 'id'값

        var id = $('#id').val();			//	게시글의 'id'값

        if(able==id){

            $("#submit").removeAttr("disabled");		//	버튼을 활성화 시킨다.

            $('#delBtn').click(function(){

                var pw = $('#password').val();		//	게시글의 'passwowrd'값

                var idx = $('#idx').val();			//	게시글의 'idx'값

                alert(pw);

                var ck = prompt("본인 비밀번호를 입력해 주세요");		// prompt를 여러번 이용하기 위해 변수에 넣어준다

                if(ck == null){

                    alert('취소되었습니다.');

                }else if(ck == ""){

                    alert('아무것도 입력되지 않았습니다.');

                }else {

                    if(ck == pw){

                        alert("삭제되었습니다.")

                        viewForm.action="delete";		//	조건을 만족하면 폼안의 값들을 컨트롤러의 '/delete'로 넘겨줄 경로

                        viewForm.submit();				//	넘겨주는 명령

                    }else{

                        alert("비밀번호가 틀립니다.")

                    }

                }

            });

        }else{

            $("#delBtn").attr("disabled", "disabled");	//	버튼 비활성화

        }

    });
</script>
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
<c:if test="${sessionScope.loginId == null || sessionScope.loginId eq 'guest'}">
<%--    <img src="/resources/img/좋아요전.png" id="likeimg" width="60px" height="60px"--%>
<%--         class="rounded-circle mt-2">--%>
    ${b.like_count} <br><br>
    추천 기능은 <a href="/member/login" type="button" id="newLogin"
              class="btn btn-outline-success">로그인</a> 후 사용 가능합니다.
</c:if>
<c:if test="${sessionScope.loginId != null}">
    <div>
        <input type="hidden" id="like_check" value="${like.like_check}">
        <img class="rounded-circle likeimg" id="likeimg" src="/resources/img/좋아요전.png"
             width="60px" height="60px"> ${b.like_count}
    </div>
</c:if>
</body>
<%@include file="header.jsp"%>
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
    <div class="row">
        <div class="col-sm">
            <div class="row my-3">
                <div class="col-sm">
                    <label for="title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="title" name="title" value="<%=title%>">
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
                <label for="contents" class="form-label">내용</label>
                <input type="text" class="form-control" id="contents" name="contents" value="<%=contents%>"
                        style="height: 500px" rows="10" cols="50">
            </div>
            <div class="row my-3">
                <div class="col-sm">
                    <button type="button" class="btn btn-secondary" id="btn-back">뒤로가기</button>
                </div>
                <div class="col-sm d-flex justify-content-end">
                    <button class="btn btn-danger me-2" type="submit" id="btn-like">좋아요</button>
                    <a href="boardUpdate.jsp?idx=<%=idx%>" class="btn btn-warning me-2">수정하기</a>
                    <a href="boardDelete.jsp?idx=<%=idx%>" class="btn btn-warning me-2">삭제하기</a>
                </div>
            </div>
        </div>
        <div>
            <form method="post" enctype="multipart/form-data" action="commentWrite.jsp?boardIdx=<%=idx%>" >
            <table id="commentList" class="table table-bordered">
                <thead>
                    <tr>
                        <td>글번호</td>
                        <td>작성자</td>
                        <td>내용</td>
                        <td>날짜</td>
                    </tr>
                </thead>
<%--                <c:if test="${ clist.size() == 0 }">--%>
<%--                    <tr>--%>
<%--                        <td colspan="2">댓글이 없습니다.</td>--%>
<%--                    </tr>--%>
<%--                </c:if>--%>

                <tbody>
                    <tr>
                        <td width="10%"><%=idx2%></td>
                        <td width="15%"><%=userId2%></td>
                        <td width="60%"> <%=commentContents%></td>
                        <td width="30%"><%=commentDate%></td>
                        <td width="30%"><a href="commentDelete.jsp?boardIdx=<%=idx2%>" class="btn btn-primary">삭제</a></td>
                    </tr>
                </tbody>
            </table>

                <table id="tblAddComment" class="table table-bordered">
                    <tr>
                        <td><input type="textarea" name="commentContents" id="commentContents" class="form-control" required placeholder="댓글을 작성하세요. "/></td>
<%--                        <td ><input type="submit" class="btn btn-primary"> <a href="commentWrite.jsp?boardIdx=<%=idx%>" >등록하기/></a></td>--%>
                        <td><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
                    </tr>
                </table>
<%--                <input type="hidden" name="pseq" value="<%=idx2%>"/>--%>
            </form>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
</body>
</html>
