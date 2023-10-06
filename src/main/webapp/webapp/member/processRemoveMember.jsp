<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/dbconn.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

  String sessionMemberId = (String) session.getAttribute("sessionMemberId");
  PreparedStatement preparedStatement = null;
  String sql = "DELETE FROM member WHERE memberId = ?";
  preparedStatement = connection.prepareStatement(sql);
  preparedStatement.setString(1, sessionMemberId);
  preparedStatement.executeUpdate();

  session.invalidate();

  response.sendRedirect("resultMember.jsp");
%>
</body>
</html>
