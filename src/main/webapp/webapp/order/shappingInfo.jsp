<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>



<jsp:include page="../inc/menu.jsp" />
	
<div class="jumbotron">
	<div class="container">
   		<h1 class="dispaly-3">배송정보</h1>
   	</div>
</div>

<div class="container">
	<form action="./processShippingInfo.jsp" method="post">
	<input type="hidden" name="orderId" value="<%=request.getParameter("orderId")%>"> 
	<div class="form-group row">
		<lable class="col-sm-2">주문자 이름</lable>
		<div class="col-sm-3">
		<input type="text" name="orderName" class="form-control">
		</div>
	</div>


	<div class="form-group row">
		<lable class="col-sm-2"> 연락처 </lable>
			<input type="text" name="tel" class="form-control">
	</div>	
	
	<div class="from-group row">
		<lable class="col-sm-2"> 우편번호</lable>
		<div class="col-sm-3">
			<input type="text" name="zipCode" class="form-control">
			<span class="btn btn-secondary btn-zipCode">우편번호 검색</span>
		</div>
	</div>
	
	<div class="form-group row">
		<lable class="col-sm-2">주소1 </lable>
		<div class="col-sm-6">
			<input type="text" name="address01" class="form-control">
		</div>
	</div>

	
	<div class="form-group row">
		<lable class="col-sm-2">주소2 </lable>
		<div class="col-sm-6">
			<input type="text" name="address02" class="form-control">
		</div>
	</div>

<div class="form-group row">
		<lable class="col-sm-10">
		<div class="col-sm-10">
		<a href="./cart.jsp" class="btn btn-secondary" role="button">이전</a>
		<input type="submit" class="btn btn-primary" value="등록">
		</div>		
	</div> 
</form>
</div>
<script>
function execDaumPostcode() {
    /* 상황에 맞춰서 변경해야 하는 부분 */
    const zipCode = document.getElementById('zipCode');
    const address01 = document.getElementById('address01');
    const address02 = document.getElementById('address02');

    /* 수정없이 사용 하는 부분 */
    new daum.Postcode({
        oncomplete: function(data) {
	//우편번호와 주소정보를 해당 필드에 넣는다.
	document.querySelector('input[name=zipCode]').value = data.zonecode; //5자리 새우편 사용
	document.querySelector('input[name=address01]').value = fullAddr;

	//커서를 상세주소 필드로 이동한다.
	document.querySelector('input[name=address02]').focus();
		}
	}).open();
}
	document.addEventListener('DOMContentLoaded', function(){
	const btnZipCode = document.querySelector('.btn-zipCode');
	btnZipCode.addEventListener('click', exeDaumPostcode);
});
</script>
</body>

<%@ include file ="../inc/footer.jsp" %>
</html>