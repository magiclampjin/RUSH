$(document).ready(function(){
	$("#updateBtn").on("click", function(){
		let updateBox = $(".updateBox");
		updateBox.css("height", "360px").css("display","flex");
		updateBox.children(".infoBox").css("display","none");
		
		updateBox.siblings(".memberBasicTitle").html("회원 정보 수정");
		
		let pwCheckBox = $("<div>").attr("class", "pwCheckBox")
		let titleDiv = $("<div>").attr("class","pwCheckTitle").html("비밀 번호를 입력해주세요");
		let pwDiv = $("<div>");
		let pwCheckForm = $("<form>").attr("method","post").css("display", "flex").css("flex-direction","column");
		let explainDiv = $("<div>").attr("class", "colorDarkgray").html("회원 정보를 변경하려면 비밀번호를 인증하셔야합니다.")
		let pwInput =$("<input>").attr("type","password");
		let submitBtn = $("<input>").attr("type","submit");
		
		pwCheckForm.append(explainDiv).append(pwInput).append(submitBtn);
		pwDiv.append(pwCheckForm)
		pwCheckBox.append(titleDiv).append(pwDiv)
		updateBox.append(pwCheckBox)
	})
});