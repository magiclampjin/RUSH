$(document).ready(function(){
	let userID = $("#userID").val();
	if(userID==undefined){
		console.log("사용자 없음")
		$(".post .title a, #writeBtnLink").on("click",function(){
			let goLogin =confirm("로그인 시 이용할 수 있는 컨텐츠입니다.\n로그인 하시겠습니까?")
			if(goLogin){
				$(this).attr("href","http://localhost/member/login.jsp")
			}else{
				return false;
			}
		})
	}
})