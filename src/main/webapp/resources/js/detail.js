/*detail.js */
$(function(){
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
