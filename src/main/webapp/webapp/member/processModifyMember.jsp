<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    String sessionMemberId = (String) session.getAttribute("sessionMemberId");
    String passwd = request.getParameter("passwd");
    String memberName = request.getParameter("memberName");
    String gender = request.getParameter("gender");
    String birthday = request.getParameter("birthyy") + "-" + request.getParameter("birthmm") + "-" + request.getParameter("birthddd");
    String email = request.getParameter("mail1") + "@" + request.getParameter("mail2");
    String phone = request.getParameter("phone");
    String zipCode = request.getParameter("zipCode");
    String address01 = request.getParameter("address01");
    String address02 = request.getParameter("address02");

    //데이터 베이스 처리부분
    PreparedStatement preparedStatement = null;

    String sql = "UPDATE * SET passwd = ?, memberName = ?, gender = ?, birthday = ?, email = ?, " +
            "phone = ?, zipCode = ?, address01 = ?, address02 = ? WHERE memberId = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, passwd);
    preparedStatement.setString(2, memberName);
    preparedStatement.setString(3, gender);
    preparedStatement.setString(4, birthday);
    preparedStatement.setString(5, email);
    preparedStatement.setString(6, phone);
    preparedStatement.setString(7, zipCode);
    preparedStatement.setString(8, address01);
    preparedStatement.setString(9, address02);
    preparedStatement.setString(10, sessionMemberId);
    if(preparedStatement.executeUpdate() == 1) { //update가 성공적으로 수행
        response.sendRedirect("resultMember.jsp?msg=0");
    }
    else{
        response.sendRedirect("modifyMember.jsp?msg=1");
    }
%>
</body>
</html>
