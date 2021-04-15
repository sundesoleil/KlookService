/*join.js */
$(function(){
	let email_check = false;
	
	$("#email_dup_check").click(function(){
		$.ajax({
			url:"/member/email_check?email="+$("#user_email").val(),
			type:"get",
			success:function(result){
				if(result.status == "OK"){
					email_check = true;
				}
				alert(result.message);
			}
		});
	});
	$("#user_email").change(function(){
		email_check = false;
	});
	
	$("#join_btn").click(function(){
		
		let email = $("#user_email").val();
		if(!pattern_email.test(email)){
			alert("올바른 이메일 형식을 입력해주세요.");
			return;
		}
	
		if(email.length == 0){
			alert("이메일을 입력하세요.");
			return;
		}
		if(!email_check){
			alert("이메일 중복확인을 해주세요.");
			return;
		}
		
		let pwd = $("#user_pwd").val();
		
		if(pwd.length == 0){
			alert("비밀번호를 입력하세요.");
			return;
		}else if(pwd != $("#user_pwd_confirm").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			return;
		}
		
		let name = $("#user_name").val();
		
		if(name.length == 0){
			alert("이름을 입력하세요.");
			return;
		}
		if(pattern_spc.test(name)){
			alert("이름에 특수문자를 사용할 수 없습니다.");
			return;
		}
		if(pattern_blank.test(name)){
			alert("이름에 공백문자를 사용할 수 없습니다.");
			return;
		}
		
		let data = {
		  "km_email":$("#user_email").val(),
		  "km_pwd":$("#user_pwd").val(),
		  "km_name":$("#user_name").val(),
		  "km_phone":$("#user_phone").val(),
		  "km_terms_agree":$("#agree_terms").prop("checked")?1:0,
		  "km_info_agree":$("#agree_info_save").prop("checked")?1:0
		}
		
		console.log(JSON.stringify(data));
		$.ajax({
			url:"/member/join",
			type:"post",
			contentType:"application/json",
			data:JSON.stringify(data),
			success:function(result){
				alert(result.message);
				location.href="/";
			},
			error:function(e){
				alert("에러");
				console.log(e);
			}
		})
		
	})
		$("#agree_all").change(function(){
			if($("#agree_all").prop("checked")){
				$("#agree_terms").prop("checked", true);
				$("#agree_info_save").prop("checked", true);
			}
			else{
				$("#agree_terms").prop("checked", false);
				$("#agree_info_save").prop("checked", false);
			}
	})
	
})
// final
// const 상수 : 한 번 값이 지정되면 다음부터 바꿀 수 없다.
const pattern_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
const pattern_spc = /[!@#$%^&*()_+|<>?:{}]/;
const pattern_blank = /[\s]/g;
const pattern_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
const pattern_number = /[0-9]/;

function inputValidation(text){
	return !pattern_kor.test(text) && !pattern_spc.test(text) && !pattern_blank.test(text);
}
