<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오전 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.DriverManager" %>
<%
  Connection conn = null;
  String url = "jdbc:mysql://localhost:3306/jsp";
  String user = "root";
  String passwd = "1234";
  Class.forName("com.mysql.cj.jdbc.Driver");
  conn = DriverManager.getConnection(url,user,passwd);
%>
