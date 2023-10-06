<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.dto.Product" %>
<jsp:useBean id="productDAO" class="com.dao.ProductRepository" scope="session" />
<%@ include file = "../inc/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<div class="jumbotron">
	<div class="container">
   		<h1 class="dispaly-3">상품목록</h1>
   	</div>
</div>

<div class="container">
	<form name="fromProduct" action="./processAddProduct.jsp" method="post" enctype="multipart/form-data">
	<div class="from-group row">
		<lable class="col-sm-2">상품명</lable>
		<div class="col-sm-3">
		<input type="text" name="productName" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">상품아이디</lable>
		<div class="col-sm-3">
		<input type="text" name="productId" class="form-control">
		</div>
	</div>
	
	
	<div class="from-group row">
		<lable class="col-sm-2">가격</lable>
		<div class="col-sm-3">
		<input type="text" name="unitPrice" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">상품설명</lable>
		<div class="col-sm-3">
		<input type="text" name="description" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">제조사</lable>
		<div class="col-sm-3">
		<input type="text" name="manufacturer" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">분류</lable>
		<div class="col-sm-3">
		<input type="text" name="category" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">재고 수</lable>
		<div class="col-sm-3">
		<input type="text" name="unitsInStock" class="form-control">
		</div>
	</div>
	
	<div class="from-group row">
		<lable class="col-sm-2">이미지</lable>
		<div class="col-sm-3">
		<input type="file" name="fileName" class="form-control">
		</div>
	</div>
	
	
	<div class="from-group row">
		<lable class="col-sm-2">상태</lable>
		<div class="col-sm-3">
		<input type="radio" name="condition" value="New">신규제품
		<input type="radio" name="condition" value="Old">중고제품
		<input type="radio" name="condition" value="Refurbished">재생제품
		</div>
	</div>
	
		<div class="from-group row">
			<div class="col-sm-10">
				<input type="submit" name="btn btn-primary" value="등록">
			</div>
		</div>
	</form>
</div>
<jsp:include page="../inc/footer.jsp" />
</head>

</body>
</html>