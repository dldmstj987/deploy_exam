<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String sessionMemberId = (String) session.getAttribute("sessionMemberId");
%>
	<nav class="navbar navbar-expand  navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="../welcome/welcome.jsp">Home</a>
			</div>
			<div>
				<ul class="navbar-nav mr-auto">
					<c:choose>
						<c:when test="${empty sessionMemberId}">
							<li class="nav-item"><a class="nav-link" href="../member/loginMember.jsp">로그인</a></li>
							<li class="nav-item"><a class="nav-link" href="../member/AddMember.jsp">회원가입</a></li>
						</c:when>
					<c:otherwise>
						<li style="padding-top: 7px; color: white">[<%=session.getAttribute("sessionMemberName")%>님]</li>
						<li class="nav-item"><a class="nav-link" href="../member/processLogoutMember.jsp">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="../member/modifyMember.jsp">회원수정</a></li>
					</c:otherwise>
					</c:choose>

					<li class="nav-item"><a class="nav-link" href="../product/Products.jsp">상품목록</a></li>
					<li class="nav-item"><a class="nav-link" href="../product/addProduct.jsp">상품등록</a></li>
					<li class="nav-item"><a class="nav-link" href="../product/editProduct.jsp">상품편집</a></li>
					<li class="nav-item"><a class="nav-link" href="../order/cart.jsp">장바구니</a></li>
					<li class="nav-item"><a class="nav-link" href="../boardController/boardList.do">게시판</a></li>
				</ul>
			</div>
		</div>
	</nav>
