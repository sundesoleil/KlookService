<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 서브 카테고리 별 상품 출력 -->
	<h1>서브 카테고리 목록</h1>
	<c:forEach items="${subList }" var="product">
		${product.kp_name }
		<div class="prod_img_box">
				<img src="/images/${product.kpi_uri }" />
		</div>
	</c:forEach>
</body>
</html>