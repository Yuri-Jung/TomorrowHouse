<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%
 if(session.getAttribute("userId")==null){
     out.println("<a href='login.jsp'>로그인</a>");
 }
 else{
     String userId = (String) session.getAttribute("userId");
     out.println(userId + "님 반갑습니다<br>");
     out.println("<a href = 'logout_process.jsp'>로그아웃</a>");
 }
%>

</body>
</html>