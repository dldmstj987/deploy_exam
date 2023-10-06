<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@ include file="../inc/dbconn.jsp"%>
<%
    request.setCharacterEncoding("UTF-8");

    String memberId = request.getParameter("memberId");
    String passwd = request.getParameter("passwd");

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;


    String sql = "SELECT * FROM member WHERE memberId=? and passwd=? ";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, memberId);
    preparedStatement.setString(2, passwd);
    resultSet = preparedStatement.executeQuery();

    if(resultSet.next()) {
        String memberName = resultSet.getString("memberName");
        session.setAttribute("sessionMemberId", memberId);
        session.setAttribute("sessionMemberName", memberName);
        response.sendRedirect("resultMember.jsp?msg=2");

        sql = "UPDATE cart SET memberId = ? WHERE orderId=? ";
        //1. 로그인사에 비회원 상태에서 장바구니에 담은 상품정보의 아이디정보 업데이트
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, memberId);
        preparedStatement.setString(2, orderId);
        preparedStatement.executeUpdate();

        //2. 회원 아이디는 같고 주문번호는 다른 장바구니 데이터에 현재 주문 번호로 업데이트
        sql = "UPDATE  cart SET orderId = ? WHERE memberId = ? AND  orderId !=? ";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, orderId);
        preparedStatement.setString(2, memberId);
        preparedStatement.setString(3, orderId);
        preparedStatement.executeUpdate();


    }
    else{
        response.encodeRedirectURL("loginMember.jsp?error=1");
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

%>
</body>
</html>
