<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dto.Product" %>
<%@ page import="com.dao.ProductRepository" %>
<%@ page import="java.sql.*" %>
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
	<div class="row">
		<div class="col-md-6">
		<img src="/upload/<%=resultSet.getString("fileName")%>"style="width:100%">
			<h3><%=resultSet.getString("productName")%></h3>
			<h3><%=resultSet.getString("description")%></h3>
			<p><strong>상품코드</strong> : <span class="badge badge-danger">
				<%=resultSet.getString("productId")%>
			</span></p>
			<p><strong>제조사</strong> : <%=resultSet.getString("manufacturer")%>>
			<p><strong>분류</strong> : <%=resultSet.getString("category")%>>
			<p><strong>재고 수</strong> : <%=resultSet.getString("unitsInStock")%>>
			<h3><%=resultSet.getString("unitPrice")%>원</h3>
			
			<form name="frmAddCart" action="../order/processAddCart.jsp" method="post">
				<input type="hidden" name="productId" value="<%=resultSet.getString("productId")%>">
			</form>
			<p>
				<a href="#" class="btn btn-info"> 장바구니 담기 >> </a>
				<a href="../order/cart.jsp" class="btn btn-info"> 장바구니 목록 >> </a>
				<a href="../product/Products.jsp" class="btn btn-secondary"> 상품목록>></a> 	</p>
			</div>
		</div>
		<hr>
	</div>
<%
	}
%>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const btnCart = document.querySelector(".btn-info");
			const frmAddCart = document.querySelector('form[name=frmAddCart]');
			
			btnCart.addEventListener('click', function() {
				frmAddCart.submit();
			});
		});		
	</script>
	<script type="text/javascript">
	function addToCart(){
		if(confirm('해당상품을 장바구니에 추가하시겠습니까?')){
			
		}
	}
	</script>
</body>
</html>