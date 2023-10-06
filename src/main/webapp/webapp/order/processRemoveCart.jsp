<%@page import="com.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.Product"%>
<%@page import="com.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>해당상품 삭제</title>
</head>
<body>
<%
String productId = request.getParameter("productId");
if(productId == null || productId.trim().equals("")){
	//null이 반환하거나 빈 문자열이 들어온 경우
	response.sendRedirect("../product/Products.jsp");
	return;
}

//유효한 productId인지 확인
ProductRepository productRepository = ProductRepository.getInstance();
Product product = productRepository.getProductById(productId);
if(product == null){
	response.sendRedirect("../exception/exceptionNoProduct.jsp");
}

//장바구니에 피라미터로 전달된 productId와 동일한 데이터가 있는 경우에는
//장바구니에 추가하지 말고 갯수만 변경하도록 수정
ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");
for(int i = 0; i < carts.size(); i++){
	Cart cart = carts.get(i);
	if(cart.getProductId().equals(productId)){
		carts.remove(cart);
		break;
	}
}

response.sendRedirect("cart.jsp");

%>

<script type="text/javascript">
//선택삭제
const btnRemoveSelected = document.querySelector(".btn-selected");
const frmCart = document.querySelector('form[name=frmCart]');
btnRemoveSelectrd.addEventListener('click', function(){
	if(confirm('정말 삭제하시겠습니까?')){
		frmCart.action = '../order/processRemoveCartById.jsp';
		frmCart.submit();
	}
});
</script>


</body>
</html>