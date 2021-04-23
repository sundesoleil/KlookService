/*detail.js */
$(function(){
	
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년',
		minDate:0
    });

	$("#datePicker").datepicker();
	

	let finalPrice = $("#finalPrice").attr("data-value");
	let finalPoint = $("#point").attr("data-value");
	
	$(".final_price span:nth-child(2)").html(numberWithCommas(finalPrice));
	$(".final_point b").html(numberWithCommas(finalPoint));
	
	let totalCount = 1;
	
	$("#decrease").click(function(){
		totalCount--;
		if(totalCount < 1) totalCount = 1;
		$(".total").html(totalCount);
		$(".final_price span:nth-child(2)").html(numberWithCommas(totalCount*finalPrice));
		$(".final_point b").html(numberWithCommas(totalCount*finalPoint));
	})
	$("#increase").click(function(){
		totalCount++;
		if(totalCount >= 100) totalCount = 100;
		$(".total").html(totalCount);
		$(".final_price span:nth-child(2)").html(numberWithCommas(totalCount*finalPrice));
		$(".final_point b").html(numberWithCommas(totalCount*finalPoint));
	});
	
		$("#comment_input_btn").click(function(){
		if($("#comment_content").val() == ""){
			alert("댓글 내용을 입력하세요");
			return;
		}
		
		// 서버로 전송
		let data = {
		  "kr_title":$("#comment_title").val(),
		  "kr_content":$("#comment_content").val(),
		  "kr_rate":$("#rating option:selected").val(),
		  "kr_member_seq":$(".comment_input").attr("data-user-seq"),
		  "kr_prod_seq":$("#kb_seq").attr("data-value")
		}
		console.log(JSON.stringify(data));
		
		$.ajax({
			url:"/api/insert_review",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(data){
				alert("댓글이 등록되었습니다");
				location.reload(); // 댓글 등록시 새로 고침
				$("#comment_content").val(""); 
				$("#comment_title").val("");
			},
			error:function(data){
				alert("댓글등록에 실패하였습니다");
			}
		})
	})
	

	$("#add_cart").click(function(){
		
		let data = {
		"kb_count": totalCount,
		"kb_booking_date": $("#datePicker").val(),
		"kb_price": finalPrice * totalCount,
		"kb_member_seq":$("#kb_member_seq").attr("data-value"),
		"kb_prod_seq":$("#kb_seq").attr("data-value")
		}
		

		$.ajax({
			url:"/shop/cart?member_seq="+$("#kb_member_seq").attr("data-value"),
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				alert(result.message);
				location.href="/shop/cart?member_seq="+$("#kb_member_seq").attr("data-value");
			},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		})
	});
	
	$("#direct_booking").click(function(){


	let data = {	
		"ks_booking_date": $("#datePicker").val(),
		"ks_amount": finalPrice * totalCount,
		"ks_member_seq":$("#kb_member_seq").attr("data-value"),
		"ks_prod_seq":$("#kb_seq").attr("data-value")
		}

		$.ajax({
			url:"/shop/settlement?member_seq=" +  $("#kb_member_seq").attr("data-value") + "&prod_seq=" + $("#kb_seq").attr("data-value"),
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				alert(result.message);
				location.href = "/shop/settlement?member_seq=" +  $("#kb_member_seq").attr("data-value") + "&prod_seq=" + $("#kb_seq").attr("data-value");
			},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		})

	})
})

function newFunction() {
    return "totalCount";
}

function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
$(function (){
 	$("#all_review").click(function(){ 
		$(".review_list").hide();
		$("#all_review").hide();
		$("#all_review_hide").show();
		$(".all_review_list").show();
	})
	$("#all_review_hide").click(function(){
		$(".review_list").show();
		$("#all_review").show();
		$("#all_review_hide").hide();
		$(".all_review_list").hide();
	})
});

