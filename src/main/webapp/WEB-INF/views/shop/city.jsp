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
	<!-- 도시별 상품 출력 -->
	<!-- 도시별로 분류한 productmapper 작성 필요 -->
	<c:forEach items="${cityProdList }" var="product">
		${product.kp_name }
	</c:forEach>
</body>
</html>