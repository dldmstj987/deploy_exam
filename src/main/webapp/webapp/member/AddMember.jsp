<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="MemberRepository" class="com.dao.MemberRepository" scope="session" />
<%@ include file = "../inc/dbconn.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="frmMember" action="processAddMember.jsp" method="post">

	<div class="form-group  row">
		<label class="col-sm-2">성별</label>
		<div class="col-sm-10">
			<input name="gender" type="radio" value="남"> 남
			<input name="gender" type="radio" value="여"> 여
		</div>
	</div>

	<div class="form-group row">
		<label class="col-sm-2">생일</label>
		<div class="col-sm-4  ">
			<input type="text" name="birthyy" maxlength="4" placeholder="년(4자)" size="6">
			<select name="birthmm">
				<option value="">월</option>
				<option value="01">1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select> <input type="text" name="birthdd" maxlength="2" placeholder="일" size="4">
		</div>
	</div>

	<div class="form-group  row ">
		<label class="col-sm-2">이메일</label>
		<div class="col-sm-10">
			<input type="text" name="mail1" maxlength="50">@
			<select name="mail2">
				<option>naver.com</option>
				<option>daum.net</option>
				<option>gmail.com</option>
				<option>nate.com</option>
			</select>
		</div>
			
			<div class="form-group  row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-10">
					<input type="text" name="memberName">
				</div>
			</div>

				<div class="form-group row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-10">
						<input type="text" name="memberId">
						<span class="memberIdCheck"></span>
						<br><input type="button" name="btnIsDuplication" value="팝업 아이디 중복확인">
						<br><input type="button" name="btnIsDuplication2nd" value="ajax 아아디 중복 확인">
					</div>
				</div>


		<div class="form-group  row">
			<p>비밀번호: <input type="text" name="passwd" />
			<p>휴대폰: <select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="019">019</option>
			</select> -
			<input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3"> </p>
		</div>

		<div class="form-group  row">
			<label class="col-sm-2">우편번호</label>
				<div class="col-sm-10">
						<input type="text" name="zipCode">
				</div>
		</div>

		<div class="form-group  row">
			<label class="col-sm-2">주소1</label>
			<div class="col-sm-10">
				<input type="text" name="address01">
			</div>
		</div>

		<div class="form-group  row">
			<label class="col-sm-2">주소2</label>
				<div class="col-sm-10">
					<input type="text" name="address02"> </p>
				</div>
		</div>
	</div>
	<p> <input type="submit" value="가입하기"></p>
</form>

<script>
	document.addEventListener("DOMContentLoaded", function (){
		const frmMember = document.frmMember; //폼을 들고옴

		const btnIsDuplication = document.querySelector('input[name=btnIsDuplication]');
		btnIsDuplication.addEventListener('click', function (){
			const memberId = frmMember.memberId.value;
			if(memberId == ""){
				alert('아이디를 입력해주세요');
				frmMember.memberId.focus();
				return;
			}
			window.open('popupIdCheck.jsp?id=' + memberId, 'idCheck', 'width = 500, height = 500, top = 100, left = 200, location = no');
		});
	})
</script>
</body>
</html>
