<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"><meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../inc/menu.jsp" />
<body>
<div class="jumbotron">
	<div class="container">
   		<h1 class="display-3">상품수정</h1>
   	</div>
</div>
<%@ include file = "../inc/dbconn.jsp"%>
<%
	String productId = request.getParameter("productId");

	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	
	String sql = "select * from product where productId = ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, productId);
	resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){
%>
<div class="container">
	<form name="fromProduct" action="./processModifyProducts.jsp" method="post" enctype="multipart/form-data">
	<div class="from-group row">
		<lable class="col-sm-2">상품코드</lable>
		<div class="col-sm-3">
		<input type="text" name="productName" class="form-control" value="<%=resultSet.getString("productId")%>" readonly>
		</div>
	</div>


	<div class="from-group row">
		<lable class="col-sm-2">상품명</lable>
		<div class="col-sm-3">
		<input type="text" name="productId" class="form-control" value="<%=resultSet.getString("productName")%>">
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
		<input type="text" name="manufacturer" class="form-control" value="<%=resultSet.getString("manufacturer")%>">
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
				<input type="submit" name="btn btn-primary" value="수정">
			</div>
		</div>
	</form>
</div>
<%
	}
%>
</body>
</html>