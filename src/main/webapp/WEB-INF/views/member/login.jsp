<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/login.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
	<link rel="icon" href="/resources/images/favicon.png" />
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/login.js"></script>
	<script>
		<c:if test="${memberInfo != null || member_id != null}">
			location.href="/";
		</c:if>
	</script>
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="login_area">
		<h1>로그인</h1>
		<input type="text" id="user_email" placeholder="이메일을 입력해주세요"/>
		<input type="password" id="user_pwd" placeholder="비밀번호를 입력해주세요"/>
		<div class="options_area">
			<input type="checkbox" id="secure_login" />
			<label for="secure_login" id="secure_icon">
				<i class="fas fa-check"></i>
			</label>
			<label for="secure_login" id="secure_text">보안접속</label>
		</div>
		<button id="login">로그인</button>
		<a href="/member/join" id="join">회원가입</a>
		<a id="kakao_login" href="https://kauth.kakao.com/oauth/authorize?client_id=29d07e300a76fdf0fad3ec1691cd41cc&redirect_uri=http://localhost:8092/kakao/callback&response_type=code">
			<i class="fas fa-comment-dots"></i> 카카오로 로그인하기
		</a>
	</div>
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>