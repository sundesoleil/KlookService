/*city.js */
$(function(){
	$(".recommend_list").slick({
		slidesToShow:4,
		slidesToScroll:4,
		swipe:false,
		focusOnSelect:false,
		infinite:false
	});
	let randomNumber = Math.floor(Math.random() * 8) + 1;
	$('.img_box').addClass('bg0' + randomNumber);
})
