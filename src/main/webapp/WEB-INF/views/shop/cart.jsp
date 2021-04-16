<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<c:forEach items="${cartList }" var="cart">
	<div class="city_item">
		<div onclick="location.href='/shop/cart?city_seq=${cart.kb_count}">
		<p>${cart.kb_booking_date }</p>
		</div>
	</div>
	</c:forEach>
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>