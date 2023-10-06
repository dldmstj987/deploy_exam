<%@page import="com.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.Product"%>
<%@page import="com.dao.ProductRepository"%>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../inc/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<%
	String productId = request.getParameter("productId");
	if(productId == null || productId.trim().equals("")){
		//null이 반환하거나 빈 문자열이 들어온 경우
		response.sendRedirect("../product/Products.jsp");
		return;
	}

	ProductRepository productRepository = ProductRepository.getInstance();
	Product product = productRepository.getProductById(productId);
	if(product == null){
		response.sendRedirect("../exception/exceptionNoProduct.jsp");
	}

	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;


	//동일한 주문번호에 같은 상품번호가 있으면 업데이트
	String sql = "SELECT * FROM cart WHERE (orderId=?) AND (productId=?)";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, orderId);
	preparedStatement.setString(2, productId);
	resultSet = preparedStatement.executeQuery();
	if(resultSet.next()){ //동일한 상품이 있는 경우 갯수 업데이트
		sql = "UPDATE cart SET cnt = cnt + 1 WHERE num=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, resultSet.getInt("num"));
		preparedStatement.executeUpdate();
	}
	else {
		//회원번호 관련 처리
		String memberId = (String) session.getAttribute("sessionMemberId");
		memberId = (memberId == null) ? "Guest" : memberId;

		int cnt = 1;

		sql = "INSERT INTO cart (orderId, memberId, productId, cnt, addDate)" +
				"VALUES (?, ?, ?, ?,  now())";



	}
	//상품 상세 페이지로 이동
	  response.sendRedirect("../product/product.jsp?productId=" + productId);
%>

</body>
</html>