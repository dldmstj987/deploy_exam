<%@page import="com.dto.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("carts");

	String[] checkedId = request.getParameterValues("checkedId");
	if(checkedId != null){
		for(String s : checkedId){
			for(int i = 0; i < carts.size(); i++){
				Cart cart = carts.get(i);
				if(cart.getProductId().equals(s)){
					carts.remove(cart);
					break;
				}
			}
		}
	}
response.sendRedirect("cart.jsp");
%>

<script>
	//개별 삭제
	const btnRemoveSelected = document.querySelector(".btn-removeById");
	btnRemoveById.foreach(button =>{
		button.addEvenListener('click', function(e) {
			frmCart.productId.value = e.target.role;
			frmCart.action = '../order/processRemoveCartById.jsp';
			frmCart.submit();
		}
	});
</script>
</body>
</html>