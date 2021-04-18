$(function(){
	$(".delete_btn").click(function(){
	
	if(confirm("선택하신 액티비티를 삭제하시겠습니까?") == false) return;
	let seq = $(this).attr("data-value");
	
	$.ajax({
		url:"/shop/cart/" + seq,
		type:"delete",
		success:function(data){ 
			alert(data.message);
			location.reload();
		} 
	})
	})
	$(".delete_all_btn").click(function(){
		if(confirm("전부 삭제하시겠습니까?") == false) return;
		let seq = $(this).attr("data-value");

		$.ajax({
			url:"/shop/all_cart/" + seq,
			type:"delete",
			success:function(data){ 
				alert(data.message);
				location.reload();
			} 
		})
	})
})