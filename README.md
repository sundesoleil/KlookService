# Klook Service
전국 액티비티 예약 서비스
* 참고 사이트 : <http://www.klook.com/>

# 개발환경
Java, Spring Boot, MySQL, mybatis, Ajax, jquery

# 구현 기능
* 로그인 / 회원가입
* 회원 정보 수정
* 도시이름으로 검색하기 
* 장바구니
* 상품예약
* 후기작성 및 별점 매기기

# 시연 화면
1. 메인화면

![localhost_8092_](https://user-images.githubusercontent.com/72296755/116491974-18f35500-a8d6-11eb-8103-d97f8f7610a3.png)


2. 회원가입/로그인/회원정보수정

<img src="https://user-images.githubusercontent.com/72296755/116492454-44c30a80-a8d7-11eb-9c5a-bb76eaad8e0a.png" width="30%"> <img src="https://user-images.githubusercontent.com/72296755/116492503-5f957f00-a8d7-11eb-852f-9c47ef186cf9.png" width="30%"> <img src="https://user-images.githubusercontent.com/72296755/116493861-90c37e80-a8da-11eb-928b-0869b52066ae.png" width="30%">


3. 카테고리별 상품 목록

![localhost_8092_shop_maincategory_seq=1](https://user-images.githubusercontent.com/72296755/116492886-61ac0d80-a8d8-11eb-99df-effe6b0b2272.png)

-> 세부 카테고리 목록 표시 및 해당 카테고리 상품 표시

4. 상품 상세 페이지

![localhost_8092_shop_detail_prod_seq=1 (2)](https://user-images.githubusercontent.com/72296755/116493126-fe6eab00-a8d8-11eb-8d75-8765a4ccc7b3.png)

-> 로그인을 하지 않았을 경우, 장바구니/ 예약 / 리뷰 작성 불가능
-> 상품명 옆 별점은 회원들의 별점을 평균 낸 수치를 표시

5. 장바구니

![image](https://user-images.githubusercontent.com/72296755/116493329-74731200-a8d9-11eb-8280-8c21b15a4d74.png)
-> 오늘 날짜 이전 선택 불가능

![image](https://user-images.githubusercontent.com/72296755/116493370-8d7bc300-a8d9-11eb-8029-aca1fcd7e37a.png)
-> 선택한 매수에 따라 상품 금액 변동

![localhost_8092_shop_cart_member_seq=4 (1)](https://user-images.githubusercontent.com/72296755/116493571-fb27ef00-a8d9-11eb-894f-d4253c6aff2c.png)
-> 장바구니에 담긴 상품이 없을 경우

![localhost_8092_shop_cart_member_seq=4](https://user-images.githubusercontent.com/72296755/116493477-cf0c6e00-a8d9-11eb-999d-f207df05c42a.png)
-> 장바구니에 담긴 상품 목록 표시

6. 예약

![image](https://user-images.githubusercontent.com/72296755/116493677-2dd1e780-a8da-11eb-8a65-08ae496d384b.png)
-> 예약자 이름, 예약 상품, 예약 날짜, 금액 정보 넘긴 후 카드 정보 받기(아직 결제 시스템은 구현하지 않은 상태)

