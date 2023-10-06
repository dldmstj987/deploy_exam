<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection connection = null;

    try{
        String url = "jdbc:mariadb://localhost:3306/student";
        String user = "root";
        String password = "1234";

        //JDBC 로딩
        Class.forName("org.mariadb.jdbc.Driver");

        connection = DriverManager.getConnection(url, user, password);
    } catch(SQLException e){
        out.println("데이터베이스 연결이 실패했습니다.<br>");
       out.println("SQLException : " + e.getMessage());
    }
%>
<%
    //주문번호 관련 처리
    String orderId = (String) session.getAttribute("orderId");
    if(orderId == null){
        //세션 ID 가져오기
        String sessionId = session.getId();

        //현재 날짜와 시간 가져오기
        java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
        String currentDateTime = simpleDateFormat.format(new java.util.Date());

       orderId = currentDateTime + "-" + sessionId;
       session.setAttribute("orderId", orderId);

    }
%>
</body>
</html>