<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
  session.invalidate();
  out.println("<script>alert('로그아웃되었습니다'); location.href='login.jsp';</script>");
%>
<script type="text/javascript">
  location.href='<%= request.getContextPath()%>/boardMain.jsp';
</script>