<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ include file = "../inc/dbconn.jsp"%>

<%
	request.setCharacterEncoding("UTF-8");


	String memberId = request.getParameter("memberId");
	String passwd = request.getParameter("passwd");
	String memberName = request.getParameter("memberName");
	String gender = request.getParameter("gender");
	String birthday = request.getParameter("birthyy") + "-" + request.getParameter("birthmm") + "-" + request.getParameter("birthdd");
	String email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
	String phone = request.getParameter("phone");
	String zipCode = request.getParameter("zipCode");
	String address01 = request.getParameter("address01");
	String address02 = request.getParameter("address02");

	PreparedStatement preparedStatement = null;


	String sql = "INSERT INTO member (memberId, passwd, memberName, gender, birthday, " +
		"email, phone, zipCode, address01, address02, " +
		"addDate)" +
			"values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1, memberId);
	preparedStatement.setString(2, passwd);
	preparedStatement.setString(3, memberName);
	preparedStatement.setString(4, gender);
	preparedStatement.setString(5, birthday);
	preparedStatement.setString(6, email);
	preparedStatement.setString(7, phone);
	preparedStatement.setString(8, zipCode);
	preparedStatement.setString(9, address01);
	preparedStatement.setString(10, address02);

	if(preparedStatement.executeUpdate() == 1){
	response.sendRedirect("resultMember.jsp?msg=1");
	}
	else{
		response.sendRedirect("AddMember.jsp?msg=1");
	}
	
%>
</body>
</html>