<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%
	response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
 %> --%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/assets/slick/slick.min.js"></script>
	<script src="/resources/js/main.js"></script>
	
	<link rel="icon" href="/resources/images/favicon.png" />
	
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/assets/slick/slick.css" />
	<link rel="stylesheet" href="/resources/assets/slick/slick-theme.css" />
	<link rel="stylesheet" href="/resources/css/main.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
	
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="main">
		<section class="main_banner_area">
			<div class="main_banner_wrap">
				<div class="banner_item">
					<a href="#">
						<img src="/resources/images/5.jpg" />
					</a>
					<span>YOURS TO EXPLORE</span>
					<p>더 넓은 세상을 경험하고, 잊지 못할 순간을 예약하세요</p>
					
				</div>	
			</div>
			<div class="search_area">
				<input type="text" id="search_input" />
				<button id="search_btn">
					<img src="/resources/images/DM_20210324195650_057.PNG" />
				</button>
			</div>
		</section>
		
		<section class="ad_banner_area">
			<div class="ad_banner_wrap">
				<div class="ad_item">
					<a href="#">
						<img src="/resources/images/1.jpg" />
					</a>
				</div>
				<div class="ad_item">
					<a href="#">
						<img src="/resources/images/2.jpg" />
					</a>
				</div>
				<div class="ad_item">
					<a href="#">
						<img src="/resources/images/3.jpg" />
					</a>
				</div>
				<div class="ad_item">
					<a href="#">
						<img src="/resources/images/4.jpg" />
					</a>
				</div>
			</div>
			<div class="banner_btn_area">
				<button id="prev">
					<img src="/resources/images/DM_20210324195651_072.PNG" />
				</button>
				<button id="next">
					<img src="/resources/images/DM_20210324195651_073.PNG" />
				</button>
			</div>
		</section> 
		
		<section class="item_list_area">
			<h1>인기 여행지 <i class="fas fa-chevron-right"></i></h1>
			<p class="prod_sub_title">원하는 여행지를 선택하세요!</p>
			<div class="item_list_wrap recommend_list">
				<c:forEach items="${cityList }" var="city">
				<div class="city_item" onclick="location.href='/shop/list?city_seq=${city.kc_seq}'">
					<div>
					<p>${city.kc_name }</p>
					</div>
				</div>
				</c:forEach>
			</div>
		</section>
		
		<section class="item_list_area">
			<h1>인기 액티비티 <i class="fas fa-chevron-right"></i></h1>
			<p class="prod_sub_title">전국 최저가 보장! 클룩에서 만나 보세요</p>
			<div class="item_list_wrap recommend_list">
				<c:forEach items="${productList }" var="product">
				<div class="prod_item">
					<div class="prod_item_img" 
					style="background-image:url('/images/${product.kpi_uri }')"
					onclick="location.href='/shop/detail?prod_seq=${product.kp_seq}'"
					></div>
					<div class="prod_item_text">	
						<p class="prod_item_title">[${product.city_name}]${product.kp_name }</p>
						<p class="prod_item_price">
							<c:if test="${product.kp_discount == 1 }">
								<span class="prod_discount">${product.kp_discount_rate}%</span>
								<span class="prod_final_price">
									${product.discounted }원
								</span>
							</c:if>
							<c:if test="${product.kp_discount == 0 }">
								<span class="prod_final_price">${product.originPrice}원</span>
							</c:if>
							<c:if test="${product.kp_rate != null }">
								<i class="fas fa-star"> ${product.kp_rate }</i>
							</c:if>
						</p>
						<c:if test="${product.kp_discount == 1 }">
							<p class="prod_origin_price">${product.originPrice}원</p>
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