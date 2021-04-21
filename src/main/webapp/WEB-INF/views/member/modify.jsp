<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must_revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
 %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/modify.css">
	<link rel="icon" href="/resources/images/favicon.png" />
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/modify.js"></script>
	<script>
		let seq = "${memberInfo.seq}";
		<c:if test="${memberInfo == null}">
			location.href="/";
		</c:if>
	</script>

		

</head>
<body>
<%@include file = "/WEB-INF/views/includes/header.jsp" %>
	<div class="join_form" id="join_form1"> 
		<h1>회원 정보 수정</h1>
		<div class="input_cell">
			<p>이름</p>
			<input type="text" id="member_name" value="${memberInfo.name }">
		</div>
		<div class="input_cell">
			<p>이메일</p>
			<input type="text" id="user_email" value="${memberInfo.email }">
		</div>
		
		<div class="input_cell">
			<p>휴대폰</p>
			<input type="text" id="user_phone" value="${memberInfo.phone }">
		</div>
		<div class="input_cell">
			<p>이전 비밀번호</p>
			<input type="password" id="prev_pwd" >
		</div>	
		<div class="input_cell">
			<p>새 비밀번호</p>
			<input type="password" id="user_pwd" >
		</div>	
		<div class="input_cell">
			<p>새 비밀번호 확인</p>
			<input type="password" id="user_pwd_confirm">
		</div>
		<button id="join_btn">회원정보수정</button>
	</div>
	
<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>