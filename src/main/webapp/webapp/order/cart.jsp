<%@page import="com.dto.Product"%>
<%@page import="com.dao.ProductRepository"%>
<%@page import="com.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<title>Cart</title>
</head>
<body>
<form>
<jsp:include page="../inc/menu.jsp" />

<div class="jumbotron">
	<div class="container">
   		<h1 class="display-3">장바구니</h1>
   	</div>
</div>

<div class="container">
	<div class="row">
	<table width="100%">
		<tr>
			<td align="left">
				<a href="./processDelCart.jsp" class="btn btn-danger">비우기</a>
				<a href="#" class="btn btn-danger btn-selected">선택 삭제</a>
				<a href="shappingInfo.jsp" class="btn btn-sucess">주문</a>
			</td>
		</tr>
	</table>
	</div>
	<div style="padding-top: 50px;">
	<table class="table table-hover">
		<tr>
			<td>상품</td>
			<td>가격</td>
			<td>수량</td>
			<td>소계</td>
			<td>비고</td>
		</tr>
		<%@ include file = "../inc/dbconn.jsp"%>
<%

	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	int sum = 0;

	String sql = "SELECT  * FROM  cart C INNER JOIN product P on C.productId = P.productId WHERE (orderId=?)";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, orderId);
	resultSet = preparedStatement.executeQuery();
	while (resultSet.next()) {
		Integer price = resultSet.getInt("unitPrice") * resultSet.getInt("cnt");
		sum += price;

//		ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
//		if (carts == null) {
//			carts = new ArrayList<Cart>();
//			session.setAttribute("carts", carts);
//		}
//
//
//		ProductRepository productRepository = ProductRepository.getInstance();
//		for (Cart cart : carts) {
//			Product product = productRepository.getProductById(cart.getProductId());
//			price = product.getUnitPrice() * cart.getCartCnt();
//			sum += price;
//		}


%>

<tr>
	<td><input type= "checkbox" name="checkedId" value="<%=resultSet.getString("num")%>"></td>
	<td><img src="/upload/<%=resultSet.getString("fileName")%>"style="width:100px;"></td>
	<td><a href="../product/product.jsp?productId=<%=resultSet.getString("productId")%>">
		<%=resultSet.getString("productName")%></a></td>
	<td><%=resultSet.getString("unitPrice")%></td>
	<td><input type="text" name="cnt"<%=resultSet.getString("productId")%>" value="<%=resultSet.getInt("cnt")%>"
		<a href="#" class="btn-plus" role="<%=resultSet.getString("productId")%>" about="plus">+</a>
		<a href="#" class="btn-minus" role="<%=resultSet.getString("productId")%>" about="plus">-</a></td>
	<td><%=price%></td>
	<td><a href="#" role="<%=resultSet.getString("productId")%>" class="badge badge-danger btn-removeById">삭제</a></td>
</tr>
		<%
			}
		%>

<tr>
	<tb colspan="7">합계 : <%=sum%>원</tb>
</tr>
</table>

<a href="../product/Products.jsp" class="btn btn-secondary">쇼핑 계속하기</a>
	</div>
</div>
	<script>
		document.addEventListener('DOMContentLoaded', function(){
			const btnRemoveAll = document.querySelector(".btn-removeAll");
				btnRemoveAll.addEventListener('click', function(){
					if(confirm('정말 삭제하시겠습니까> ')){
						location.href = './processRemoveCart.jsp';
					}
				});
		});
			
	</script>
<%@ include file ="../inc/footer.jsp" %>
</form>
</body>
</html>