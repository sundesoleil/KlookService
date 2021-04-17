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
	<!-- 메인 카테고리별 상품 출력 -->
	<h1>메인카테고리 목록</h1>
	<c:forEach items="${subCateList }" var="category">
		<div onclick="location.href='/shop/subcategory?category=${category.seq }'">
			${category.sub_cate_name }
		</div>
	</c:forEach> 
	<c:forEach items="${mainList }" var="product">
	${product.sub_cate_name }
		${product.kp_name }
		${product.kp_price }
		<div class="prod_img_box">
				<img src="/images/${product.kpi_uri }" />
			</div>

	</c:forEach>
</body>
</html>