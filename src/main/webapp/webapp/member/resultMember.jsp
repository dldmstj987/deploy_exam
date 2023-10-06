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
<%@ include file="../inc/menu.jsp" %>
<div class="container">
    <h1 class="display">회원정보</h1>
</div>
<div class="container">
    <div class="row">
        <h2 class="alert alert-danger">
            <%
                String msg = request.getParameter("msg");


                if(msg != null) {
                    if (msg.equals("0"))
                        out.println("회원정보가 수정되었습니다.");
                    else if (msg.equals("1"))
                        out.println("회원가입을 축하드립니다.");
                    else if (msg.equals("2")) {
                       out.println(session.getAttribute("sessionMemberName")+ "님 환영합니다.");
                    }
                } else{
                        out.println("회원정보가 삭제되었습니다.");
                }

            %>
        </h2>
    </div>
</div>
</body>
</html>