<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022-12-01
  Time: 오전 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.net.*"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
<%
    //파일 기본경로
    String defaultPath = request.getSession().getServletContext().getRealPath("/");
    //파일 기본경로, 상세경로
    String filePath = defaultPath + "ckEimg" + File.separator;
%>



<%--<a href="login.jsp" class="btn btn-primary">글쓰기</a>--%>
<%--out.println("<script>alert('로그인 후 이용해주세요'); location.href='login.jsp';</script>");--%>

<html>
<head>
    <title>test</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/ckeditor/ckeditor.js"></script>
    <script>
        $(document).ready(function () {
            $('#btn-save').on('click', function () {
                const frm = $('#frm');
                //간단하게 신원확인할 수 있다. 아이디 비밀번호 확인.

                if ($('#title').val() == "") {
                    alert("제목을 입력하세요");
                }
                else if($('#contents').val() == ""){
                    alert("내용을 입력하세요");
                }
                else {
                    $('#frm').submit();
                }
        });
        $('#btn-back').on('click', function () {
            history.back();
        });
        });

    </script>
    <script>
        window.onload = function(){
            ck = CKEDITOR.replace("editor");
        };
    </script>
    <script>
        window.addEventListener('DOMContentLoaded', function () {
            const btnBack = document.querySelector('#btn-back');
            btnBack.addEventListener('click', function () {
                history.back();
            });
        });
    </script>
    <script>



        CKEDITOR.replace( 'contents', {

            filebrowserUploadUrl: '${pageContext.request.contextPath}/file/ckeditorImageUpload.do'

        });
    </script>


    <script>
        var ckeditor_config = {
            resize_enabled: false, // 에디터 리사이즈 여부
            autoUpdateElement: true, // 자동 textarea 업데이트 여부 (안됨)
            enterMode: CKEDITOR.ENTER_BR, // 에디터 엔터를 <br> 태그를 사용함.
            shiftEnterMode: CKEDITOR.ENTER_P, // 에디터 시프트 + 엔터를 <p> 태그를 사용함
            toolbarCanCollapse: true, // 에디터 툴바 숨기기 기능 여부
            extraPlugins: "tableresize", // 에디터의 플러그인을 추가할 경우 이름 입력 ( 테이블 리사이즈 플러그인을 내려 받아야함.)
            removePlugins: "elementspath" // 에디터의 플러그인을 사용하지 않을 경우 이름 입력 ( 에디터 하단 상태바에 태그를 표시하는 플러그인)

            // 에디터 툴바를
        }
        var editor = [ ];

        // id 엘리먼트를 입력할 때 중복되는 id 명이 없어야 한다.

        CKEDITOR.replace( "content" , ckeditor_config ).on('key', function () {
          // 에디터에 값이 입력될때마다 textarea 에 업데이트한다. 하지 않을 경우 textarea 의 value 값을 알 수 없다.
          this.updateElement();
        });

        editor[1] = CKEDITOR.replace( "content" , ckeditor_config );

        // submit 이나 ajax 전송할때 같이 입력해준다.
        editor[1].updateElement();

    </script>
<%--    <script type="text/javascript">--%>
<%--        CKEDITOR.replace('t_content'--%>
<%--            , {filebrowserUploadUrl:'imageUpload.do'--%>
<%--                , height: 800, width: 1000--%>
<%--            });--%>
<%--    </script>--%>
    <script>

        CKEDITOR.replace( 'content', {

            filebrowserImageUploadUrl: '../uploadIMG.jsp'

        });

    </script>

</head>

<body>
<%@include file="header_login.jsp"%>


<header class="container mt-3">
    <div class="p-5 mb-4 bg-white rounded-3">
        <div class="container-fluid py-4">
            <h1 class="text-start fst-italic">writing</h1>
        </div>
    </div>
</header>
<form action= "boardWrite_process.jsp" method="post" id="frm">
<main class="container">
<%--    <form action="boardWrite_process.jsp" method="post" enctype="multipart/form-data">--%>

    <div class="content" style="width: 100%">

        <div class="row justify-content-md-center">
            <div class="col-sm-9">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <label class="input-group-text" >제목</label>
                    </div>
                    <input type="text" class="form-control" id="title" name="title">
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group"id="sel2" name="sel">
                    <select class="form-control" id="sel" name="sel">
                        <option value="" selected >선택하세요 &#9660;</option>
                        <option value="리모델링">리모델링</option>
                        <option value="인테리어">인테리어</option>
                        <option value="소품/가구">소품/가구</option>
                    </select>
                </div>
            </div>
        </div>
        <br>

        <div class="row justify-content-md-center">
            <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">
                    <textarea class="form-control" id="p_content" name="contents"></textarea>

                    <script type="text/javascript">
                        CKEDITOR.replace('p_content'
                            , {filebrowserUploadUrl:'imageUpload.do'
                                , height: 500, width: 3000
                            });
                    </script>
                </div>
            </div>
        </div>
        <div class="row justify-content-md-center">
            <div class="input-group mb-3">
                <div class="mb-3">
                    <label for="formFile" class="form-label" id="imgFile" onabort="imgFile" multiple></label>
                    <input class="form-control" type="file" id="formFile">
                </div>
            </div>
<br><br><br>
        <div class="row justify-content-md-center">
<%--            <button type="submit" class="btn btn-outline-secondary" name="btn-save" id="btn-save"--%>
<%--                    style="width: 60%; font-weight: bold">--%>
<%--                등   록--%>
<%--            </button>--%>
            <button type="button" class="btn btn-outline-secondary" name="btn-save" id="btn-save"
                    style="width: 60%; font-weight: bold">등록</button>
            <button type="button" class="btn btn-outline-secondary mt-3" id="btn-back" name="btn-back" style="width: 60%; font-weight: bold">
                돌아가기 </button>
        </div>
    </div>
    </div>
</main>
</form>
<%@ include file="footer.jsp"%>

</body>
</html>