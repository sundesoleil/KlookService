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

