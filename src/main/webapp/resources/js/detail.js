/*detail.js */
$(function(){
	
	$.datepicker.setDefaults({
        dateFormat: 'yy년 mm월 dd일',
        prevText: '이전 달',
        nextText: '다음 달',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });

	$("#datePicker").datepicker();


	
	let finalPrice = $("#finalPrice").attr("data-value");
	let finalPoint = $("#point").attr("data-value");
	
	$(".final_price span:nth-child(2)").html(numberWithCommas(finalPrice));
	$(".final_point b").html(numberWithCommas(finalPoint));
	
	let totalCount = 0;
	
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
		
	})
})

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

