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
	<script src="/resources/js/booking.js"></script>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/booking.css" />
</head>

<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>	
	<div class="wrap">
	<div class="member_contents">
			<div class="contents_header">
				<div>번호</div>
				<div>예약날짜</div>
				<div>결제일</div>
				<div>예약상품명</div>
			</div>
			<div class="member_list">
				<c:forEach items="${bookingList }" var="booking">
				<div class="member_item">
					<div class="member_seq">${booking.ks_seq }</div>
					<div><fmt:formatDate value="${booking.ks_booking_date }" pattern="yyyy-MM-dd HH:mm" /></div>
					<div><fmt:formatDate value="${booking.ks_pay_date }" pattern="yyyy-MM-dd HH:mm" /></div>
					<div>${booking.product_name }</div>
					<a href="#" class="delete" data-seq="${booking.ks_seq}"><i class="fas fa-trash"></i></a>
				</div>
				</c:forEach>
			</div>
		</div>
		</div>
<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>