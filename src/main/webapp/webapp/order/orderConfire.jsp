<%@page import="com.dao.ProductRepository"%>
<%@page import="com.dto.Product"%>
<%@page import="com.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.net.URLDecoder" %>  
<%
    request.setCharacterEncoding("UTF-8");
	String orderId = (String) session.getAttribute("orderId");
	String orderName = (String) session.getAttribute("orderName");
	String tel = (String) session.getAttribute("tel");
	String zipCode = (String) session.getAttribute("zipCode");
	String address01 = (String) session.getAttribute("address01");
	String address02 = (String) session.getAttribute("address02");
%>

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
   		<h1 class="dispaly-3">주문정보</h1>
   	</div>
</div>

<div class="container col-8 alert alert-info">
	<div class="text-center">
		<h1>영수증</h1>
</div>
<div class="row justify-content-between">
	<div class="col-4" align="left">
		<strong>배송주소</strong> <br>
		성명 : <%=orderName%><br>
		연락처 : <%=tel %><br>
		우편번호 : <%=zipCode %><br>
		주소 : <%=address01 %><br>
		<%=address02%>
	</div>
</div>
</div>
<div style="padding-top: 50px;">
<table class="table table-hover">
		<tr>
			<td>상품</td>
			<td>가격</td>
			<td>수량</td>
			<td>소계</td>
		</tr>
<%
int sum = 0;
ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
if(carts == null){
	carts = new ArrayList<Cart>();
}
for(Cart cart : carts){
	Product product = ProductRepository.getInstance().getProductById(cart.getProductId());
	int total = product.getUnitPrice() * cart.getCartCnt();
	sum = sum + total;
%>
<tr>
	<td class="text-center"><em><%=product.getProductName()%></em></td>
	<td class="text-center"><em><%=product.getUnitPrice()%></em>원</td>
	<td class="text-center"><em><%=cart.getCartCnt()%></em></td>
	<td class="text-center"><em><%=total%></em>원</td>
</tr>
<%
	}
%>
<tr>
	<td></td>
	<td></td>
	<td class="text-right"> <strong>총액:</strong></td>
	<td class="text-center text-danger"> <strong><%=sum%></strong></td>
</tr>
</table>

<a href="./shippinInfo.jsp" class="btn btn-secondary" role="button">이전</a>
<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문완료</a>
<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
</div>
<%@ include file ="../inc/footer.jsp" %>
</body>
</html>