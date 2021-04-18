<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/cart.js"></script>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/cart.css" />
</head>

<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>	
	<div class="main">
	
		<div class="cart_area">
		<c:if test="${cart.prod_name != null }">
		<h1>장바구니</h1>
		<div class="check_all">
			<input type="checkbox" />
			<span>전체 선택</span>
			<span><button data-value="${memberInfo.seq}" class="delete_all_btn">전체 삭제</button></span>
		</div>
		
		
			<c:forEach items="${cartList }" var="cart">
			<div class="cart_prod">
			<div class="cart_item">
				<input type="checkbox" />
				<span>${cart.prod_name }</span>
				<span><fmt:formatDate value="${cart.kb_booking_date }" pattern="yyyy-MM-dd" /></span>
				<span>${cart.kb_count }매</span>
				<span>${cart.kb_price }원</span>
	 			<span><button  data-value="${cart.kb_seq }" class="delete_btn">삭제</button></span> 
			</div>
			</div>
			</c:forEach>
	

		</c:if>
			</div>
		<c:if test="${cart.prod_name == null }">
			<div class="no_cart_msg">
			<img src="/resources/images/cart.png" />
			<p>장바구니가 비어 있어요.</p>
			</div>
		</c:if>
	</div>
	
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>