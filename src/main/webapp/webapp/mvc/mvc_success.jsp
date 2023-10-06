<%@ page import="com.login.LoginBean" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>MVC</title>
</head>
<body>
<p>로그인 성공했습니다.</p>
<p>
  <%
    LoginBean bean = (LoginBean) request.getAttribute("bean");
    out.print("아이디 : " + bean.getId());
  %>
</p>
</body>
</html>
