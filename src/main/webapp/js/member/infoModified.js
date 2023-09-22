$(document).ready(function() {
	$("#updateBtn").on("click", function() {
		if ($(this).val() === "수정하기") {
			let updateBox = $(".updateBox");
			updateBox.css("height", "360px").css("display", "flex");
			updateBox.children(".infoBox").css("display", "none");

			updateBox.siblings(".memberBasicTitle").html("회원 정보 수정");

			let pwCheckBox = $("<div>").attr("class", "pwCheckBox")
			let titleDiv = $("<div>").attr("class", "pwCheckTitle").html("비밀 번호를 입력해주세요");
			let pwDiv = $("<div>").attr("method", "post").css("display", "flex").css("flex-direction", "column");
			let explainDiv = $("<div>").attr("class", "colorDarkgray").html("회원 정보를 변경하려면 비밀번호를 인증하셔야합니다.")
			let pwInput = $("<input>").attr("type", "password").attr("id", "userPW");
			let submitBtn = $("<input>").attr("type", "button").attr("class", "bColorBlue colorWhite").attr("id", "pwCheckBtn").attr("value", "비밀번호 확인");

			pwDiv.append(explainDiv).append(pwInput).append(submitBtn);
			pwCheckBox.append(titleDiv).append(pwDiv)
			updateBox.append(pwCheckBox)



			$("#pwCheckBtn").on("click", function() {
				$.ajax({
					url: "/pwCheck.member",
					data: {
						userPW: $("#userPW").val(),
						userID: $("#userID").val()
					},
					type: "post"
				}).done(function(resp) {
					if (resp == "true") {
						updateBox.css("display", "block").css("height", "100%");
						updateBox.children(".pwCheckBox").css("display", "none");
						updateBox.children(".infoBox").css("display", "flex");

						// 비밀번호 변경을 위한 div 추가
						updateBox.children(".infoBox:nth-child(2)").children(".infoCagetory").html("새 비밀번호");
						updateBox.children(".infoBox:nth-child(2)").children(".infocon").html("");

						let infoBox = $("<div>").attr("class", "infoBox");
						let infoCategory = $("<div>").attr("class", "infoCagetory").html("비밀번호 확인");
						let infocon = $("<div>").attr("class", "infocon");
						infoBox.append(infoCategory).append(infocon);
						updateBox.children(".infoBox:nth-child(2)").after(infoBox);


						// 정보 수정 취소 버튼 추가 및 수정 완료로 버튼 변경
						let cancleLink = $("<a>").attr("href", "http://localhost/load.member");
						let cancleBtn = $("<input>").attr("type", "button").attr("class", "myPagebtn bColorBlue colorWhite");
						cancleBtn.attr("value", "수정취소").css("margin-right", "20px").attr("id", "cancleBtn");
						$("#updateBtn").val("수정완료");
						$("#updateBtn").before(cancleLink.append(cancleBtn));

						// 수정가능한 div로 속성 변경
						updateBox.find(".infoBox:not(:first-child)").find(".infocon").attr("contenteditable", "true");
						// div에 아이디 붙여주기
						updateBox.find(".infoBox:nth-child(2)").find(".infocon").attr("id", "newPw");
						updateBox.find(".infoBox:nth-child(3)").find(".infocon").attr("id", "newPwCheck");
						updateBox.find(".infoBox:nth-child(4)").find(".infocon").attr("id", "newNick");
						updateBox.find(".infoBox:nth-child(5)").find(".infocon").attr("id", "newPhone");
						updateBox.find(".infoBox:nth-child(6)").find(".infocon").attr("id", "newEmail");

						// 아이디는 수정 못함 문구  출력
						let idPhrase = $("<div>").css("color", "red").css("font-size", "13px").attr("class","phrase").html("아이디는 변경할 수 없습니다.")
						updateBox.children(".infoBox:first-child").append(idPhrase);

						// 비밀번호 문구 출력
						let pwPhrase = $("<div>").css("color", "red").css("font-size", "13px").attr("id","pwPhrase").attr("class","phrase");
						updateBox.children(".infoBox:nth-child(2)").append(pwPhrase);

						let regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/; // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
						$("#newPw").on("keyup", function() {
							let resultPw = regexPw.test($("#newPw").val());
							if (!resultPw) {
								$("#newPw").css("border", "1px solid red");
								$("#pwPhrase").html("비밀번호 형식이 맞지 않습니다.<br>(영어 대문자, 소문자, 숫자, 특수문자 포함한 8자 이상)");
							} else {
								$("#newPw").css("border", "1px solid forestgreen");
								$("#checkPw").html("");
							}
						})

					} else {
						alert("비밀번호가 일치하지 않습니다.")
						$("#userPW").val("");
						$("#userPW").focus();
					}
				})
			});
		} else {
			alert("TEST")
		}
	});
});