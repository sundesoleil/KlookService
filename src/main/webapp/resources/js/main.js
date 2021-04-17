$(function(){
	$(".recommend_list").slick({
		slidesToShow:4,
		slidesToScroll:4,
		swipe:false,
		focusOnSelect:false,
		infinite:false
	});
	
	let current = 0; // 현재 보고 있는 배너의 번호
	let animate = false;
	
	$("#next").click(function(){
		if(animate) return;
		animate = true;

		$(".ad_item").eq(current).stop().animate({left:"-100%"}, 1000);
		current++;
		if(current >= $(".ad_item").length) current = 0;
		$(".ad_item").eq(current).css("left", "100%").stop().animate({left:"0%"}, 1000, function(){
			// 애니메이션 끝나고 재실행
			animate = false;
		});
	});
	
		$("#prev").click(function(){
		if(animate) return;
		animate = true;
		$(".ad_item").eq(current).stop().animate({left:"100%"}, 1000);
		current--;
		if(current < 0) current = $(".ad_item").length - 1;
		$(".ad_item").eq(current).css("left", "-100%").stop().animate({left:"0%"}, 1000, function(){
			// 애니메이션 끝나고 재실행
			animate = false;
		});
	});
	
	setInterval(function(){
		$("#next").trigger("click");
	}, 5000)
	

	$("#search_input").keydown(function(e){
		if(e.keyCode == 13){
			$("#search_input").trigger("click");
			if($("#search_input").val() === '서울'){location.href = "/shop/city?seq=2"}
			if($("#search_input").val() === '제주'){location.href = "/shop/city?seq=3"}
			if($("#search_input").val() === '부산'){location.href = "/shop/city?seq=4"}
			if($("#search_input").val() === '경주'){location.href = "/shop/city?seq=5"}
			if($("#search_input").val() === '강원'){location.href = "/shop/city?seq=6"}
			if($("#search_input").val() === '전주'){location.href = "/shop/city?seq=7"}
			if($("#search_input").val() === '대구'){location.href = "/shop/city?seq=8"}
			if($("#search_input").val() === '울릉'){location.href = "/shop/city?seq=8"}
			}
	
		})

})