$(function(){
	$(".delete").click(function(){
		if(confirm("선택하신 예약을 취소하시겠습니까?") == false) return;
		let seq = $(this).attr("data-seq");
	
		$.ajax({
		url:"/shop/settlement/" + seq,
		type:"delete",
		success:function(data){ 
			alert(data.message);
			location.reload();
		} 
	})
})
})