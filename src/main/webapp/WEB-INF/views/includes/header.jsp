<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/header.css" />
	<script src="/resources/js/header.js"></script>
</head>
<body>
	<header>
		<nav id="gnb">
			<div class="gnb_top">
				<div class="user_menu">
					<c:if test="${memberInfo == null}">
						<a href="/member/join">회원가입</a>
						<span>|</span>
						<a href="/member/login">로그인</a>
					</c:if>
					<c:if test="${memberInfo != null}">
						<a href="/shop/cart?member_seq=${memberInfo.seq }"><i class="fas fa-shopping-cart"></i> 장바구니</a>
						<span>|</span>
						<a href="/member/user/orderlist" id="user_name">${memberInfo.name } 님</a>
						<img src="/resources/images/DM_20210324195650_049.PNG" />
						<span>|</span>
						<a href="/member/logout" id="logout_btn">로그아웃</a>
						<span>|</span>
					</c:if>
				
					
				</div>
				<c:if test="${memberInfo != null }">
					<div class="user_popup">
						<div class="user_popup_content">
							<a href="/member/user/orderlist">예약내역</a><br>
							<a href="/member/user/delivery">계정설정</a><br>
							<a href="/member/logout">로그아웃</a>
						</div>
					</div>
				</c:if>
			</div>
			<div class="logo_area">
				<a href="/" id="logo">
					<img src="/resources/images/logo.JPEG" />
				</a>		
			</div>
				<div class="menu_area_wrap">
					<ul class="main_menu">
						<li>
		 					<a href="#">
								<!-- <img src="/resources/images/DM_20210324195650_051.PNG" /> -->
								<span>전체 카테고리</span>
							</a>
						</li>
						<li>
							<a href="/shop/products">티켓/입장권</a>
						</li>
						<li>
							<a href="/shop/products">투어</a>
						</li>
						<li>
							<a href="/shop/products">아웃도어/스포츠</a>
						</li>
						<li>
							<a href="/shop/products">스파/테라피</a>
						</li>
						<li>
							<a href="/shop/products">체험</a>
						</li>
						<li>
							<a href="/shop/products">엔터테인먼트</a>
						</li>
					</ul>
					
			
				</div>
				<div class="categories">
					<div class="categories_wrap">
						<c:forEach items="${categoryList }" var="category">
							<a href="/shop/products?category=${category.seq }" id="category${category.seq }" class="category">${category.name }</a>
						</c:forEach>
					</div>
				</div>
		</nav>
	</header>
</body>
</html>