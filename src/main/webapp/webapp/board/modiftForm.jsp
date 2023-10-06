<%@ page import="com.mvc.model.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  BoardDTO board = (BoardDTO) request.getAttribute("board");
  String sessionMemberId = (String) session.getAttribute("sessionMemberId");
  if(sessionMemberId == null){
    response.sendRedirect("../member/loginMember.jsp");
  } else if (!sessionMemberId.equals(board.getMemberId())) {
      response.sendRedirect("/");
  }
%>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
  <meta charset="utf-8">
  <title>Board</title>
</head>
<body>
<jsp:include page="/inc/menu.jsp" />
<div class="jumbotron">
  <div class="container">
    <h1 class="display-3">게시판</h1>
  </div>
</div>
</body>
</html>
