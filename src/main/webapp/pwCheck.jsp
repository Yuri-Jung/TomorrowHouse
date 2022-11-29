<%--
  Created by IntelliJ IDEA.
  User: 정유리
  Date: 2022-11-27
  Time: 오전 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson" %>

<%@ include file="dbconn.jsp"%>

<%
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  int count=0;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
//idx에 pwd 넣었을 때 동일하면 1이 뜨고 아니면 0이 뜬다.
  String query = "SELECT count(pwd) as cnt FROM user WHERE userId = ? AND userPw = ? " ; //동시에 만족하는 건 하나만 있을 것.
  try {
    conn = DriverManager.getConnection(url, id, pw);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, id);
    pstmt.setString(2, pw);
    rs = pstmt.executeQuery();
    if (rs.next()){
      count = rs.getInt("cnt");
    }
  }
  catch (SQLException e ){
    out.print(e.getMessage());
  }
  finally {
    if (conn != null) {conn.close();}
    if (rs != null) {rs.close();}
    if (pstmt != null) {pstmt.close();}
  }
  Map<String, String> map = new HashMap<>();
  Gson gson = new Gson();
  if (count == 1){
    map.put("result", "success");
    map.put("value", "1");
  }
  else {
    map.put("result", "error");
    map.put("value", "0");
  }
  out.print(gson.toJson(map));
%>

</body>

</html>
