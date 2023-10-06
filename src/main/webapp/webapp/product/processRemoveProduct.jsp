<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../inc/dbconn.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String productId = request.getParameter("productId");

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String sql = "select * from product where productId = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, productId);
    resultSet = preparedStatement.executeQuery();

    if(resultSet.next()){
        sql = "delete from product where productId = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, productId);
        preparedStatement.executeUpdate();
    }
    else{
        out.print("일치하는 상품이 없습니다.");
    }
    if(resultSet != null){
        resultSet.close();
    }

    if(preparedStatement != null){
        preparedStatement.close();
    }

    if(connection != null){
        connection.close();
    }

    response.sendRedirect("editProduct.jsp");
%>
</body>
</html>
