<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="LoginServlet.do">
  <p>아이디: <input type="text" name="id"></p>
  <p>비밀번호: <input type="password" name="passwd"></p>
  <p><input type="submit" value="전송"></p>
</form>
</body>
</html>
