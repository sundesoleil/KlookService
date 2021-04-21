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
		<h1>예약정보입력</h1>
		<div class="booking_info">
			
		</div>
		<h1>결제진행</h1>
		<div class="settlement_info">
			
		</div>
		<div class="final">
			<p class="finalPrice">총 금액 <span>${settlement.amount }</span></p>
			<p><a href="#">결제하기</a></p>
		</div>
</div>
</div>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>