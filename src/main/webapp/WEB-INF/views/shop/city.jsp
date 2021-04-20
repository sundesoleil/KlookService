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
	<script src="/resources/assets/slick/slick.min.js"></script>
	<script src="/resources/js/city.js"></script>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/assets/slick/slick.css" />
	<link rel="stylesheet" href="/resources/assets/slick/slick-theme.css" />
	<link rel="stylesheet" href="/resources/css/city.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="main">
		<section class="img_area">
			<div class="img_box">
				<c:forEach items="${city}" var="city">
					<span>${city.kc_name }</span>
				</c:forEach>
			</div>
		</section>
		
		<section class="prod_list_area">
			<c:forEach items="${city}" var="city">
				<h1>${city.kc_name }의 인기 액티비티 <i class="fas fa-chevron-right"></i></h1>
				<p class="prod_sub_title">클룩에서 ${city.kc_name }의 인기 상품을 만나보세요!</p>
			</c:forEach>	
			<div class="prod_list_wrap recommend_list">
			<c:forEach items="${cityProdList }" var="product">
				<div class="prod_item ">
					<div class="prod_item_img" 
					style="background-image:url('/images/${product.kpi_uri }')"
					onclick="location.href='/shop/detail?prod_seq=${product.kp_seq}'"
					></div>
					<div class="prod_item_text">	
						<p class="prod_item_title">${product.kp_name }</p>
						<p class="prod_item_price">
							<c:if test="${product.kp_discount == 1 }">
								<span class="prod_discount">${product.kp_discount_rate}%</span>
								<span class="prod_final_price">
									  <fmt:formatNumber type="number" maxFractionDigits="0" value="${product.kp_price - product.kp_price * product.kp_discount_rate / 100}" />원
								</span>
							</c:if>
							<c:if test="${product.kp_discount == 0 }">
								<span class="prod_final_price">${product.kp_price}원</span>
							</c:if>
							<c:if test="${product.kp_rate != null }">
								<i class="fas fa-star"> ${product.kp_rate }</i>
							</c:if>
						</p>
						<c:if test="${product.kp_discount == 1 }">
							<p class="prod_origin_price">${product.kp_price}원</p>
						</c:if>
					</div>
				</div>
				
			</c:forEach>
			</div>
		</section>
		
	</div>
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>