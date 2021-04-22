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
	<link rel="stylesheet" href="/resources/css/settlement.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
</head>

<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>	
	<div class="main">
		<div class="settlement_area">
		<div class="booking_info">
			<h1>예약정보</h1>
			<p id="name">예약자 이름</p>
			<input type="text" />
			<p id="date">예약 날짜</p>
			<input type="text" id="datePicker" />
			<p id="product">예약 상품$</p>
			<input type="text" />

		</div>
		<div class="settlement_info">
			<h1>결제정보</h1>
			<div class="notice"><i class="fas fa-lock"></i> 모든 신용카드 정보는 암호화되어 보호되며 안전하게 처리됩니다.</div>
			<div class="card_info">
				<p id="card_number">카드번호</p>
				<input type="text" />
				<p id="exp_date">유효기간</p>
				<div class="validity">
					<input type="text" placeholder="MM" />
					<input type="text" placeholder="YYYY" />
					<input type="text" placeholder="CVV" />
				</div>
				<input id="card_save" type="checkbox" /><span>카드 세부정보 저장</span>
			</div>
		</div>
		<div class="final">
			<p class="finalPrice">총 금액 <span><i class="fas fa-won-sign"></i></span></p>
			<p><a id="payment" href="/shop/bookinglist">바로 결제</a></p>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>