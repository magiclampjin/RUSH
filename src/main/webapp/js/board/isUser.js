$(document).ready(function() {
	let userID = $("#userID").val();
	$(".post .title a, #writeBtnLink").on("click", function() {
		if (userID == undefined || typeof userID === "undefined" || userID =="") {
			let goLogin = confirm("로그인 시 이용할 수 있는 컨텐츠입니다.\n로그인 하시겠습니까?")
			if (goLogin) {
				$(this).attr("href", "/member/login.jsp");
			} else {
				return false;
			}
		}
	})
})