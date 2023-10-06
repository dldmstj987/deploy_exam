<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Page Error</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<div class="jumbotron">
	<div class="container">
   		<h1 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h1>
   	</div>
</div>
<div class="container">
	<p><%=request.getRequestURL()%></p>
	<p><a href="../product/Products.jsp" class="btn btn-secondary">상품목록</a></p>
</div>
</body>
</html>