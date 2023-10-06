<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String encoding = "UTF-8";
	request.setCharacterEncoding("UTF-8");
	
	String orderId = (String) session.getAttribute("orderId"); 
%>
<%
session.removeAttribute("carts");

session.removeAttribute("orderId");
session.removeAttribute("orderName");
session.removeAttribute("tel");
session.removeAttribute("zipCode");
session.removeAttribute("address01");
session.removeAttribute("address02");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>주문완료</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<div class="jumbotron">
	<div class="container">
   		<h1 class="alert alert-danger">주문이 완료.</h1>
   	</div>
</div>
<div class="container">
	<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
	
	<p>주문번호 : <%=orderId%></p>
</div>
<div class="container">
	<p><a href="../product/Products.jsp" class="btn btn-secondary">상품목록 >></a></p>
</div>

</body>
</html>