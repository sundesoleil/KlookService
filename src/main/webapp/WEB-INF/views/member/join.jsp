<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/join.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
	<link rel="icon" href="/resources/images/favicon.png" />
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="/resources/js/join.js"></script>
	<script>
		<c:if test="${memberInfo != null || member_id != null}">
			location.href="/";
		</c:if>
	</script>
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="join_form_wrap">
		<div class="form_header">
			<h1>회원가입</h1>
			<p><span class="necessary">*</span><span>필수입력사항</span></p>
		</div>
		<table>
			<tbody>
				<tr>
					<td>이메일<span class="necessary">*</span></td>
					<td><input type="text" id="user_email" placeholder="이메일을 입력해주세요"/></td>
					<td><button id="email_dup_check">중복확인</button>
				</tr>
				<tr>
					<td>비밀번호<span class="necessary">*</span></td>
					<td><input type="password" id="user_pwd" placeholder="비밀번호를 입력해주세요"/></td>
				</tr>
				<tr>
					<td>비밀번호 확인<span class="necessary">*</span></td>
					<td><input type="password" id="user_pwd_confirm" placeholder="비밀번호를 한 번 더 입력해주세요"/></td>
				</tr>
				<tr>
					<td>이름<span class="necessary">*</span></td>
					<td><input type="text" id="user_name" placeholder="이름을 입력해주세요"/></td>
				</tr>
				<tr>
					<td>휴대폰번호<span class="necessary">*</span></td>
					<td><input type="text" id="user_phone" placeholder="휴대폰 번호를 입력해주세요"/></td>
				</tr>
			</tbody>
		</table>
		<div class="agree_area">
			<div class="agree_content">
				<input type="checkbox" id="agree_all" />
				<span>아래 약관에 모두 동의합니다.</span>
			</div>
			<div class="agree_content">
				<input type="checkbox" id="agree_terms" />
				<span>이용약관(필수)</span>
			</div>
			<div class="agree_content">
				<input type="checkbox" id="agree_info_save"/>
				<span>개인정보의 수집 및 이용(필수)</span>
			</div>
		</div>	
		<div class="btn_area">
			<button id="join_btn">가입하기</button>
		</div>
	</div>
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>