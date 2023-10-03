$(document).ready(function() {	
	let userID = $("#userID").val();
	if (userID == undefined || typeof userID === "undefined" || userID =="") {
		let goLogin = confirm("로그인 시 이용할 수 있는 컨텐츠입니다.\n로그인 하시겠습니까?")
		if (goLogin) {
			$(this).attr("href", "/member/login.jsp");
			location.href = "/member/login.jsp";
		} else {
			location.href = "/index.jsp";
		}
	}
})