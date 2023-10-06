<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ include file = "../inc/dbconn.jsp"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<%-- 신규 상품 등록 처리 페이지 --%>
</head>
<body>
<%@ page import="com.dao.ProductRepository" %>
<%@ page import="com.dto.Product"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>

<%
	request.setCharacterEncoding("UTF-8");



	int maxSize = 5 * 1024 * 1024; //업로드 최대 크기 5MB
	String folder = "/Users/ieunseo/Desktop/dev/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/webapps/upload";
	String encType = "UTF-8";




	MultipartRequest multipartRequest = new MultipartRequest(request, folder, maxSize, encType, new DefaultFileRenamePolicy());
	String productId = multipartRequest.getParameter("productId");
	String productName = multipartRequest.getParameter("productName");
	String unitPrice = multipartRequest.getParameter("unitPrice");
	String description = multipartRequest.getParameter("description");
	String manufacturer = multipartRequest.getParameter("manufacturer");
	String category = multipartRequest.getParameter("category");
	String unitsInStock= multipartRequest.getParameter("unitsInStock");
	String condition= multipartRequest.getParameter("condition");
	String filename = multipartRequest.getFilesystemName("fileName");

	//문자열을 숫자 자료형으로 변경
	Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
	Long stock = unitsInStock.isEmpty() ? 0L : Long.parseLong(unitsInStock);

	PreparedStatement preparedStatement = null;



	String sql = "insert into product values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, productId);
	preparedStatement.setString(2, productName);
	preparedStatement.setInt(3, price);
	preparedStatement.setString(4, description);
	preparedStatement.setString(5, manufacturer);
	preparedStatement.setString(6, category);
	preparedStatement.setLong(7, stock);
	preparedStatement.setString(8, condition);
	preparedStatement.setString(9, filename);
	preparedStatement.executeUpdate();


	if(preparedStatement != null){
		preparedStatement.close();
	}

	if (connection != null){
		connection.close();
	}

	response.sendRedirect("Products.jsp");
%>


</body>
</html>