<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	session.setAttribute("orderId", request.getParameter("orderId"));
	session.setAttribute("orderName", request.getParameter("orderName"));
	session.setAttribute("tel", request.getParameter("tel"));
	session.setAttribute("zipCode", request.getParameter("zipCode"));
	session.setAttribute("address01", request.getParameter("address01"));
	session.setAttribute("address01", request.getParameter("address02"));
	
	response.sendRedirect("orderConfire.jsp");
	
%>


</body>
</html>