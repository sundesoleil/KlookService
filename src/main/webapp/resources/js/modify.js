$(function(){
	$("#join_btn").click(function(){
/*		if($("#user_name").val() == ''){
			alert("이름을 입력하세요");
			return;
		}
		if($("#user_email").val() == ''){
			alert("이메일을 입력하세요");
			return;
		}*/
		if($("#prev_pwd").val().length > 0){
			if($("#user_pwd").val() != $("#user_pwd_confirm").val()){
				alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}
		}
		
		// 데이터 전송
		let data = {
			"km_seq":seq,
			"km_name":$("#member_name").val(),
			"km_email":$("#user_email").val(),
			"km_phone":$("#user_phone").val(),
			"km_pwd":$("#prev_pwd").val(),
			"confirm_pwd":$("#user_pwd").val()
		}
		$.ajax({
			url:"/api/modify",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(data){
				alert(data.message);
				location.href="/";
			},
			error:function(){
				alert("에러");
			}
		})

	})
})