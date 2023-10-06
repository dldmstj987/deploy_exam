<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/dbconn.jsp"%>
<html>

<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%
    String sessionMemberId = (String) session.getAttribute("sessionMemberId");

    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    String sql = "SELECT * FROM member WHERE memberId = ?";
    preparedStatement = connection.prepareStatement(sql);
    preparedStatement.setString(1, sessionMemberId);
    resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        String passwd = resultSet.getString("passwd");
        String memberName = resultSet.getString("memberName");
        String gender = resultSet.getString("gender");
        String birthday = resultSet.getString("birthday");
        String[] birthdayArr = birthday.split("-");
        String birthyy = birthdayArr[0];
        String birthmm = birthdayArr[1];
        String birthdd = birthdayArr[2];
        String email = resultSet.getString("email");
        String[] emailArr = email.split("@");
        String phone = resultSet.getString("phone");
        String zipCode = resultSet.getString("zipCode");
        String address01 = resultSet.getString("address01");
        String address02 = resultSet.getString("address02");

%>



<form name="frmMember" method="post" action="processModifyMember.jsp">
    <div class="form-group row">
        <lable class="col-sm-2">아이디</lable>
        <div class="col-sm-10">
            <%=sessionMemberId%>
        </div>
    </div>

    <div class="form-group row">
        <lable class="col-sm-2">비밀번호</lable>
        <div class="col-sm-10">
            <input type="password" name="passwd" value="<%=passwd%>">
        </div>
    </div>
    <div class="form-group row">
        <lable class="col-sm-2">비밀번호 확인</lable>
        <div class="col-sm-10">
            <input type="password" name="passwdRe" value="<%=passwd%>">
        </div>
    </div>
    <div class="form-group row">
        <lable class="col-sm-2">생일</lable>
        <div class="col-sm-4">
            <input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6" value="<%=birthyy%>">
            <select name="birthmm">
                <option value="">월</option>
                <%
                    for (int i = 1; i <= 12; i++) {
                        String month = String.format("%02d", i); //숫자를 두자리를 문자열로 변환
                        out.print("<option value=\"" + month + "\"");

                        if (birthmm.equals(month)) {
                            out.print(" selected");
                        }
                        out.print(">" + i + "</option>");
                    }
                %>
            </select>
            <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4" value="<%=birthdd%>">
        </div>
    </div>
<div class="form-group row">
    <div class="col-sm-10">
        <input type="submit" class="btn btn-primary" value="수정">
        <a href="processRemoveMember.jsp" class="btn btn-primary">회원탈퇴</a>
    </div>
</div>
    <%
        }
    %>
</form>
</body>
</html>
