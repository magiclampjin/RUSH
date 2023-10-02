$(document).ready(function() {	
	let userID = $("#userID").val();
		console.log($("#userID").val());
		console.log(userID == undefined);
		console.log(typeof userID === "undefined");
		console.log(userID =="");
	if (userID == undefined || typeof userID === "undefined" || userID =="") {
		console.log("로그인 안됨.");
		console.log($("#userID").val());
		console.log(userID == undefined);
		console.log(typeof userID === "undefined");
		console.log(userID =="");
		let goLogin = confirm("로그인 시 이용할 수 있는 컨텐츠입니다.\n로그인 하시겠습니까?")
		if (goLogin) {
			$(this).attr("href", "/member/login.jsp");
			location.href = "/member/login.jsp";
		} else {
			location.href = "/index.jsp";
		}
	}
})