<%--
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

<%--    <script>--%>
<%--        $(document).click(function (){--%>
<%--            $('#btn-comment').on('click', function () {--%>

<%--            });--%>
<%--        });--%>
<%--    </script>--%>

</head>
<body>
<%@include file="header.jsp"%>
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

    String sql = "SELECT idx, title, contents, userId, create_dt, hit_cnt,update_dt, like_cnt from board where deleted_yn='N' and idx=? " ;
    try{
//        stmt = conn.createStatement();
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, idx);
        rs = pstmt.executeQuery();

        if(rs.next()){
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
    finally {
        if (rs != null) {rs.close();}
        if (conn != null) {conn.close();}
        if (pstmt != null) {pstmt.close();}
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
                    <a href="boardUpdate.jsp?idx=<%=idx%>" class="btn btn-warning me-2">수정하기</a>
                    <a href="boardDelete.jsp?idx=<%=idx%>" class="btn btn-warning me-2">삭제하기</a>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="form-group">
                <form method="post" encType = "multipart/form-data" action="boardComment.jsp">
                    <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                        <tr>
                            <td style="border-bottom:none;" valign="middle"><br><br></td>
                            <td><input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText"></td>
                            <td><br><br><td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</main>
<%@include file="footer.jsp"%>
</body>

</html>
