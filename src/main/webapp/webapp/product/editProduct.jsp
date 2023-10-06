<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file = "../inc/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<title>상품 목록</title>
</head>
<body>
<jsp:include page="../inc/menu.jsp" />
<div class="jumbotron">
	<div class="container">
   		<h1 class="display-3">상품편집</h1>
   	</div>
</div>

<div class="container">
	<div class="row" align="center">
	
		<%
			PreparedStatement preparedStatement = null;
			ResultSet resultSet = null;
			String sql = "select * from product";
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
		%>
		<div class="col-md-4">
		<img src="/upload/<%=resultSet.getString("fileName")%>" style="width:100%">
			<h3><%=resultSet.getString("productName")%></h3>
			<h3><%=resultSet.getString("description")%></h3>
			<h3><%=resultSet.getString("unitPrice")%>원</h3>
			<p><a href="./modifyProducts.jsp?productId=<%=resultSet.getString("productId")%>" class="btn btn-secondary" role="button">
			수정 >> </a>
			<a href="#" class="btn btn-danger btn-remove" role="button" id="<%=resultSet.getString("productId")%>">
			삭제>> </a>
			</p>

			<%
				}
			%>

			<script>

				document.addEventListener('DOMContentLoaded', function (){
					const btns = document.querySelectorAll('.btn-remove');
					btns.forEach(btn => {
						btn.addEventListener('click', function (e){
							if(confirm('해당 상품을 삭제 하시겠습니까?')){
								const productId = e.target.id;
								//console.log(productId);
								location.href = './processRemoveProduct.jsp?productId=' + productId;
							}
						});
					});
				});
			</script>
		</div>
	</div>
</div>
</body>
</html>