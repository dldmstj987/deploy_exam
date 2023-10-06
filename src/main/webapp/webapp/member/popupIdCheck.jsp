<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");
  String id = request.getParameter("id");
%>
<%@ include file="../inc/dbconn.jsp"%>
<%
  PreparedStatement preparedStatement = null;
  ResultSet resultSet = null;
  String sql = "SELECT * FROM member WHERE memberId=?";
  preparedStatement = connection.prepareStatement(sql);
  preparedStatement.setString(1, id);
  resultSet = preparedStatement.executeQuery();
  if(resultSet.next()){
    out.print("동일한 아이디가 있습니다.");
  } else{
    out.print("동일한 아이디가 없습니다.");
  }
%>
</body>
</html>
