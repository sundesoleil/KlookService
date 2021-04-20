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
	
	$("#select_all").change(function(){
		if($("#select_all").prop("checked")){
			$(".select_checked").prop("checked", true);
			var sum = 0;
				$(".cart_item").find("input[type='checkbox']:checked").each(function(){
				sum += Number($(this).attr("data-value"));
				$(".finalPrice span").html(numberWithCommas(sum)+"원");
		
			});
		}
		else{
			$(".select_checked").prop("checked", false);
			$(".finalPrice span").html("0원");
		}
	})
	  	
		$(".select_checked").change(function(){
			if($(".select_checked").is(":checked")){
				var sum = 0;
				$(".cart_item").find("input[type='checkbox']:checked").each(function(){
				sum += Number($(this).attr("data-value"));
				$(".finalPrice span").html(numberWithCommas(sum)+"원");
			})
		}else{
			$(".finalPrice span").html("0원");
		}
	})
		
	
	function numberWithCommas(x){
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
})
