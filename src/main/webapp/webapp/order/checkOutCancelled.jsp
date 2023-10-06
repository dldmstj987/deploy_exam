<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<div class="jumbotron">
	<div class="container">
   		<h1 class="alert alert-danger">주문이 취소.</h1>
   	</div>
</div>
<div class="container">
	<h2 class="alert alert-danger">주문이 취소되었습니다..</h2>
</div>
<div class="container">
	<p><a href="../product/Products.jsp" class="btn btn-secondary">상품목록 >></a></p>
</div>
<%
session.removeAttribute("orderId");
session.removeAttribute("orderName");
session.removeAttribute("tel");
session.removeAttribute("zipCode");
session.removeAttribute("address01");
session.removeAttribute("address02");
%>
</body>
</html>