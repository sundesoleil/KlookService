$(function(){
	
	$("#direct_booking").click(function(){
		let data = {
			"ks_amount": finalPrice * totalCount,
			"ks_booking_date": $("#datePicker").val(),
			"ks_member_seq":$("#kb_member_seq").attr("data-value"),
			"ks_prod_seq": $("#kb_seq").attr("data-value")
			}
		console.log(data);

		$.ajax({
			url:"/shop/settlement?member_seq="+$("#kb_member_seq").attr("data-value"),
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				alert(result.message);
				location.href="/shop/settlement?member_seq="+$("#kb_member_seq").attr("data-value");
			},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		})
	})
	
})