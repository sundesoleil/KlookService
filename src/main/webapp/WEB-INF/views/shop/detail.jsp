<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>클룩 KLOOK - 쉽고 빠른 전국 액티비티 예약</title>
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous"></script>
	<script src="/resources/js/detail.js"></script>
	<link rel="icon" href="/resources/images/favicon.png" />
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.structure.min.css" integrity="sha512-oM24YOsgj1yCDHwW895ZtK7zoDQgscnwkCLXcPUNsTRwoW1T1nDIuwkZq/O6oLYjpuz4DfEDr02Pguu68r4/3w==" crossorigin="anonymous" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.theme.min.css" integrity="sha512-9h7XRlUeUwcHUf9bNiWSTO9ovOWFELxTlViP801e5BbwNJ5ir9ua6L20tEroWZdm+HFBAWBLx2qH4l4QHHlRyg==" crossorigin="anonymous" />
	<link rel="stylesheet" href="/resources/css/detail.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
</head>
<body>
	<%@include file="/WEB-INF/views/includes/header.jsp" %>
	<div class="main">
	
		<section class="prod_detail_area">
			<div class="prod_img_box">
				<img src="/images/${product.kpi_uri }" />
			</div>
			<div class="prod_detail_content">
				<span id="kb_member_seq" data-value="${memberInfo.seq }"></span>
				<span id="kb_seq" data-value="${product.kp_seq }"></span>
				<p class="prod_category">
					${product.city_name } > ${product.main_cate_name } > ${product.sub_cate_name }
				</p>
				<p class="prod_name">
				${product.kp_name }
				<c:if test="${review.rate != null }">
					<i class="fas fa-star"></i>
					<span> ${review.rate }</span>
				</c:if> 
				<c:if test="${review.rate == null }">
					<span> 아직 평점이 없습니다 <i class="fas fa-sad-tear"></i></span>
				</c:if>
				</p>
					<p class="prod_description">${product.kp_description }</p>
				<p class="prod_notice">
					<i class="fas fa-volume-up"></i> 모바일 또는 출력된 클룩 바우처로만 이용이 가능합니다. 입장 전 바우처를 미리 준비해 주세요.</p>
				<div class="prod_rule">
					<span><i class="fas fa-comment-dollar"></i> 조건부 취소/바우처 교환 전 무료 취소 가능</span>
					<span><i class="far fa-calendar-alt"></i> 날짜 지정 티켓</span>
					<span><i class="fas fa-print"></i> 모바일 또는 출력된 바우처</span>
					<span><i class="fas fa-ticket-alt"></i> 실물 티켓 교환 필수</span>
				</div>
				<div class="price">
					<p id="price_title">날짜 및 매수 선택</p>
					<p id="booking_title">예약을 원하시는 날짜를 선택하세요</p>
					<input type="text" id="datePicker" autocomplete="off" placeholder="이용 가능 날짜 확인하기"/>
				<div class="price_calc">
					<c:if test="${product.kp_discount == 1 }">
						<p>회원할인가</p>
						<p>
							<span id="finalPrice" data-value="${product.finalPriceInt }">${product.finalPrice}</span><span>원</span>
							<span>${product.kp_discount_rate}%</span>
						</p>
						<p id="originPrice">${product.originPrice }원 <i class="far fa-question-circle"></i></p>
					</c:if>
					<c:if test="${product.kp_discount == 0 }">
						<p>
							<span id="finalPrice" data-value="${product.finalPriceInt }">${product.finalPrice}</span><span>원</span>
						</p>
					</c:if>
				</div>
				
				<div class="point_calc">
				<c:if test="${product.kp_point_rate != null }">
					<div class="point">
						<span>첫 구매 ${product.kp_point_rate }%</span>
						<span>1매당 <b id="point" data-value="${product.pointInt }">${product.point}</b>원 적립</span>
					</div>
				</c:if>
				<c:if test="${product.kp_point_rate == null }">
					<div class="point">
						<span>첫 구매 ${product.kp_point_rate }%</span>
						<span>1매당 <b id="point" data-value="${product.pointInt }">${product.point}</b>원 적립</span>
					</div>
				</c:if>
				</div>
		
				<div class="detail_info last">
					<div class="row">
						<div>인원</div>
						<div>
							<button id="decrease">
								<i class="fas fa-minus"></i>
							</button>
							<span class="total">
								1
							</span>
							<button id="increase">
								<i class="fas fa-plus"></i>
							</button>
						</div>
					</div>
				</div>
				
					<div class="final_price_area">
						<div class="final_price">
							<span>총 상품 금액:</span>
							<span>9999</span>
							<span>원</span>
						</div>	
						<div class="final_point">
							<span>적립</span>
							<span>구매 시 <b>0</b>원 적립</span>
						</div>	
					</div>
					<c:if test="${memberInfo != null || member_id != null}">
					<div class="button_area">
						<button id="add_cart">장바구니 담기</button>
						<button id="direct_booking" onclick="location.href='/shop/settlement'">바로 결제하기</button>
					</div>
					</c:if>
					<c:if test="${memberInfo == null && member_id == null}">
						<div style="text-align:right; color:darkgray; margin-top:10px;">장바구니 기능과 예약 기능은 로그인 후 이용하실 수 있습니다.</div>
					</c:if>
				</div>
				<div class="review_area">
				<c:if test="${memberInfo != null || member_id != null}">
				<div class="comment_input" data-user-seq="${memberInfo.seq }">
					<span><i class="fas fa-check"></i> 후기작성</span><br><br>
					<label>제목</label><br><input id="comment_title" placeholder="20자 이내로 입력해주세요" />
					<br><label>내용</label><br><textarea id="comment_content"  placeholder="500자 이내로 입력해주세요" ></textarea>
					<p class="rate">평점</p>
						<select id="rating">
							<option value="5">★★★★★</option>
							<option value="4">★★★★☆</option>
							<option value="3">★★★☆☆</option>
							<option value="2">★★☆☆☆</option>
							<option value="1">★☆☆☆☆</option>
						</select>
					<button id="comment_input_btn">등록</button>
				</div>
				</c:if>
				<c:if test="${memberInfo == null && member_id == null}} ">
					<div class="comment_input">
						<span><i class="fas fa-check"></i> 후기작성</span><br><br>
						<textarea id="comment_content" disabled placeholder="로그인 후에 작성하실 수 있습니다"></textarea>
						<!-- <button id="comment_input_btn" disabled>등록</button> -->
					</div>
				</c:if>
				<c:if test="${review.rate != null }">
					<div class="review_title"><i class="fas fa-check"></i> 최신후기</div>
					<div class="review_list">
						<c:forEach items="${reviewList }" var="review">	
						<div class="review_item">
							<div class="review_user">
								<img id="user_icon" src="/resources/images/user.png" />
									<p>${review.member_name }</p>
							</div>	
							<div class="review_content">
								<c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.kr_rate }">
										<i class="fas fa-star" id="rating"></i>
								</c:forEach> 
									<span id="kr_title">${review.kr_title}</span>
									<p id="kr_content">${review.kr_content }</p>
									<div><fmt:formatDate value="${review.kr_reg_date }" pattern="yyyy년 MM월 dd일" /></div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button id="all_review">
						<i class="fas fa-angle-right"></i> 모든 리뷰 확인하기
					</button>
					<div class="all_review_list">
							<c:forEach items="${allReviewList }" var="review">
							<div class="review_item">
								<div class="review_user">
									<img id="user_icon" src="/resources/images/user.png" />
									<p>${review.member_name }</p>
								</div>	
								<div class="review_content">
									<c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ review.kr_rate }">
											<i class="fas fa-star" id="rating"></i>
									</c:forEach> 
										<span id="kr_title">${review.kr_title}</span>
										<p id="kr_content">${review.kr_content }</p>
										<div><fmt:formatDate value="${review.kr_reg_date }" pattern="yyyy년 MM월 dd일" /></div>
									</div>
								</div>
							</c:forEach>
					</div>
					<button id="all_review_hide" style="display:none;">
						<i class="fas fa-angle-right"></i> 리뷰 목록 접기
					</button>
				</c:if>
				</div>
		</section>
	</div>
	<%@include file="/WEB-INF/views/includes/footer.jsp" %>
</body>
</html>