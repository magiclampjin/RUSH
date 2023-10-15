$(document).ready(function() {
	$("#updateBtn").on("click", function() {
		if ($(this).val() === "개인정보 수정하기") {
			pwCheckBoxUi()


			$("#pwCheckBtn").on("click", function() {
				pwCheck_infoUpdate()
			});

			$(document).on("keyup", function(e) {
				if (e.keyCode == 13) {
					pwCheck_infoUpdate()
				}
			})
		} else if ($(this).val() === "수정완료") {
			if ($("#newNick").html() == "") {
				$("#newNick").css("backgroundColor", "pink").css("border", "1px solid red");
				$("#phraseDiv").html("")
			}
			if ($("#newPhone").html() == "") {
				$("#newPhone").css("backgroundColor", "pink").css("border", "1px solid red");
				$("#phraseDiv").html("")
			}
			if ($("#newEmail").html() == "") {
				$("#newEmail").css("backgroundColor", "pink").css("border", "1px solid red");
				$("#phraseDiv").html("")
			}



			if ($("#newNick").html() != "" && $("#newPhone").html() != "" && $("#newEmail").html() != "") {
				if ($("#phraseDiv").html() == "" || $("#phraseDiv").html() === "사용 가능한 닉네임입니다.") {
					$("#userNick").val($("#newNick").html())
					$("#userPhone").val($("#newPhone").html())
					$("#userEmail").val($("#newEmail").html())

					$.ajax({
						url: "/update.member",
						data: {
							userID: $("#userID").val(),
							newNick: $("#userNick").val(),
							newPhone: $("#userPhone").val(),
							newEmail: $("#userEmail").val()
						},
						type: "post"
					}).done(function(resp) {
						if (resp == "true") {
							alert("개인정보 수정이 완료되었습니다.")
							$(location).attr("href", "/load.member");
						} else {
							alert("개인정보 수정에 실패 하였습니다.")
						}
					})
				}
			}
		}
	});

	$("#pwUpdateBtn").on("click", function() {
		if ($(this).val() === "비밀번호 수정하기") {
			pwUpdateBoxUi();
			$("#userPW").on("keyup", function() {
				pwCheck();

			})
			let regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$/; // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
			let resultPw;
			$("#newPw").on("keyup", function() {
				resultPw = regexPw.test($(this).val());
				if (!resultPw) {
					$("#newPw").css("border", "1px solid red");
					$("#phraseDiv").html("비밀번호 형식이 맞지 않습니다.<br>(영어 대문자, 소문자, 숫자, 특수문자 포함한 8자 이상)");
					$("#phraseDiv").css({
						"color": "red"
					});
				} else {
					$(this).css("border", "1px solid forestgreen");
					$("#phraseDiv").html("");
				}
				if ($("#newPw").val() != $("#newPwCheck").val()) {
					$("#newPwCheck").css("border", "1px solid red");
				}
			})
			$("#newPwCheck").on("input", function() {
				if ($("#newPw").val() != $(this).val()) {
					$(this).css("border", "1px solid red");
					$("#phraseDiv").html("비밀번호가 일치하지 않습니다.");
					$("#phraseDiv").css({
						"color": "red"
					});
				} else {
					$(this).css("border", "1px solid forestgreen");
					$("#phraseDiv").html("");
				}

			})
			$("#pwUpdateSubmit").on("click", function() {
				if ($("#pwMatch").html() != "비밀번호가 일치합니다.") {
					$("#userPW").css("border", "1px solid red")
				} else {
					$("#userPW").css("border", "1px solid black")
				}

				if ($("#newPw").val() == "" || !resultPw) {
					alert("비밀번호 형식이 올바르지 않습니다.")
					$("#newPw").css("border", "1px solid red")
					$("#phraseDiv").html("비밀번호 형식이 맞지 않습니다.<br>(영어 대문자, 소문자, 숫자, 특수문자 포함한 8자 이상)");
					$("#phraseDiv").css({
						"color": "red"
					});
				}
				if ($("#newPwCheck").val() == "" || $("#phraseDiv").html() === "비밀번호가 일치하지 않습니다.") {
					$("#newPwCheck").css("border", "1px solid red")
				}
				if (resultPw && $("#newPw").val() == $("#newPwCheck").val()) {
					$.ajax({
						url: "/pwUpdate.member",
						data: {
							newPW: $("#newPw").val(),
							userID: $("#userID").val()
						},
						type: "post"
					}).done(function(resp) {
						if (resp == "true") {
							alert("비밀번호 수정이 완료되었습니다.")
							$(location).attr("href", "/load.member");
						} else {
							alert("비밀번호 수정에 실패 하였습니다.")
						}
					})
				}
			})
		}
	})

	function pwUpdateBoxUi() {
		let updateBox = $(".updateBox");
		updateBox.css("height", "100%").css("display", "flex").css("padding", "50px");
		updateBox.children(".infoBox").css("display", "none");

		updateBox.siblings(".memberBasicTitle").html("비밀번호 수정");

		let pwCheckBox = $("<div>").attr("class", "pwCheckBox")
		let titleDiv = $("<div>").attr("class", "pwCheckTitle").html("비밀 번호를 입력해주세요");
		let pwDiv = $("<div>").attr("method", "post").css("display", "flex").css("flex-direction", "column");
		let explainDiv = $("<div>").attr("class", "colorDarkgray").css("margin-bottom", "5px").html("회원 정보를 변경하려면 비밀번호를 인증하셔야합니다.")
		let pwInput = $("<input>").attr("type", "password").attr("id", "userPW");
		let cancleLink = $("<a>").attr("href", "/load.member");
		let cancleBtn = $("<input>").attr("type", "button").attr("class", "myPagebtn bColorBlue colorWhite");
		cancleBtn.attr("value", "수정취소").css("margin-top", "20px").css("width", "100%").attr("id", "cancleBtn");
		let submitBtn = $("<input>").attr("type", "button").attr("class", "myPagebtn bColorBlue colorWhite").attr("id", "pwUpdateSubmit").attr("value", "비밀번호 변경");
		let matchDiv = $("<div>").attr("class", "phrase").attr("id", "pwMatch").css("margin-bottom", "10px").css("height", "20px");

		pwDiv.append(explainDiv).append(pwInput).append(matchDiv)

		explainDiv = $("<div>").attr("class", "colorDarkgray").css("margin-bottom", "5px").html("새로운 비밀번호")
		pwInput = $("<input>").attr("type", "password").attr("id", "newPw");
		pwDiv.append(explainDiv).append(pwInput)

		explainDiv = $("<div>").attr("class", "colorDarkgray").css("margin-bottom", "5px").html("새로운 비밀번호 확인")
		pwInput = $("<input>").attr("type", "password").attr("id", "newPwCheck");
		pwDiv.append(explainDiv).append(pwInput)

		let phrase = $("<div>").attr("class", "phrase").attr("id", "phraseDiv").css("margin-bottom", "10px").css("height", "35px");
		pwDiv.append(phrase);

		pwDiv.append(submitBtn).append(cancleLink.append(cancleBtn));
		pwCheckBox.append(titleDiv).append(pwDiv)
		updateBox.append(pwCheckBox)
	}

	function pwCheckBoxUi() {
		let updateBox = $(".updateBox");
		updateBox.css("height", "100%").css("display", "flex").css("padding", "50px");
		updateBox.children(".infoBox").css("display", "none");

		updateBox.siblings(".memberBasicTitle").html("기본 회원정보 수정");

		let pwCheckBox = $("<div>").attr("class", "pwCheckBox")
		let titleDiv = $("<div>").attr("class", "pwCheckTitle").html("비밀 번호를 입력해주세요");
		let pwDiv = $("<div>").attr("method", "post").css("display", "flex").css("flex-direction", "column");
		let explainDiv = $("<div>").attr("class", "colorDarkgray").css("margin-bottom", "5px").html("회원 정보를 변경하려면 비밀번호를 인증하셔야합니다.")
		let pwInput = $("<input>").attr("type", "password").attr("id", "userPW");

		let cancleLink = $("<a>").attr("href", "/load.member");
		let cancleBtn = $("<input>").attr("type", "button").attr("class", "myPagebtn bColorBlue colorWhite");
		cancleBtn.attr("value", "수정취소").css("margin-top", "20px").css("width", "100%").attr("id", "cancleBtn");
		let submitBtn = $("<input>").attr("type", "button").attr("class", "bColorBlue colorWhite").attr("id", "pwCheckBtn").attr("value", "비밀번호 확인");


		pwDiv.append(explainDiv).append(pwInput).append(submitBtn).append(cancleLink.append(cancleBtn))
		pwCheckBox.append(titleDiv).append(pwDiv)
		updateBox.append(pwCheckBox)
	}

	function pwCheck() {
		$.ajax({
			url: "/pwCheck.member",
			data: {
				userPW: $("#userPW").val(),
				userID: $("#userID").val()
			},
			type: "post"
		}).done(function(resp) {
			if (resp == "true") {
				$("#pwMatch").html("비밀번호가 일치합니다.")
				$("#pwMatch").css("color", "forestgreen")
			} else {
				$("#pwMatch").html("비밀번호가 일치하지 않습니다.")
				$("#pwMatch").css("color", "red")
			}
		})
	}

	function pwCheck_infoUpdate() {
		$.ajax({
			url: "/pwCheck.member",
			data: {
				userPW: $("#userPW").val(),
				userID: $("#userID").val()
			},
			type: "post"
		}).done(function(resp) {
			if (resp == "true") {
				addInfoUpdateUI();

				$("#newNick").on("keyup", function() {
					$("#newNick").css("backgroundColor", "white");
					$.ajax({
						url: "/nicknameCheck.member",
						data: {
							nickname: $(this).html(),
							userID: $("#userID").val()
						}
					}).done(function(resp) {
						if ($("#newNick").html() == "") {
							$("#phraseDiv").html("닉네임을 입력해주세요");
							$("#phraseDiv").css({
								"color": "red"
							});
							$("#newNick").css("border", "1px solid red");
						} else {
							if (resp == "used") {
								$("#phraseDiv").html("이미 사용 중인 닉네임입니다.");
								$("#newNick").css("border", "1px solid red");
							} else if (resp == "usable") {
								$("#phraseDiv").html("사용 가능한 닉네임입니다.");
								$("#phraseDiv").css({
									"color": "forestgreen"
								});
								$("#newNick").css("border", "1px solid forestgreen");
							} else if (resp == "myNick") {
								// 원래 사용하던 닉네임일 때
								$("#phraseDiv").html("");
								$("#newNick").css("border", "1px soild black");
							}
						}

					});
				})

				let regexContact = /^01\d(-?\d{4}){2}$/;
				$("#newPhone").on("keyup", function() {
					$("#newPhone").css("backgroundColor", "white");
					if ($("#newPhone").html() == "") {
						$("#phraseDiv").html("전화번호를 입력해주세요");
						$("#phraseDiv").css({
							"color": "red"
						});
						$("#newPhone").css("border", "1px solid red")
					} else {
						let resultContact = regexContact.test($(this).html());
						if (!resultContact) {
							$("#newPhone").css("border", "1px solid red")
							$("#phraseDiv").html("전화번호 형식이 맞지 않습니다.");
							$("#phraseDiv").css({
								"color": "red"
							});
						} else {
							$("#newPhone").css("border", "1px solid forestgreen")
							$("#phraseDiv").html("");
						}
					}



				});

				let regexEmail = /^(.+?)@(.+?)com$/;
				$("#newEmail").on("keyup", function() {
					$("#newEmail").css("backgroundColor", "white");
					if ($("#newEmail").html() == "") {
						$("#phraseDiv").html("이메일을 입력해주세요");
						$("#phraseDiv").css({
							"color": "red"
						});
						$("#newEmail").css("border", "1px solid red")
					} else {
						let resultEmail = regexEmail.test($(this).html());
						if (!resultEmail) {
							$("#newEmail").css("border", "1px solid red")
							$("#phraseDiv").html("이메일 형식이 맞지 않습니다.");
							$("#phraseDiv").css({
								"color": "red"
							});
						} else {
							$("#newEmail").css("border", "1px solid forestgreen")
							$("#phraseDiv").html("");
						}
					}

				});
			} else {
				alert("비밀번호가 일치하지 않습니다.")
				$("#userPW").val("");
				$("#userPW").focus();
			}
		})
	}

	function addInfoUpdateUI() {
		$(document).off("keyup");
		let updateBox = $(".updateBox");
		updateBox.css("display", "block").css("height", "100%").css("padding", "0px");
		updateBox.children(".pwCheckBox").css("display", "none");
		updateBox.children(".infoBox").css("display", "flex");

		updateBox.children(".infoBox:nth-child(3)").remove();

		// 정보 수정 취소 버튼 추가 및 수정 완료로 버튼 변경
		let cancleLink = $("<a>").attr("href", "/load.member");
		let cancleBtn = $("<input>").attr("type", "button").attr("class", "myPagebtn bColorBlue colorWhite");
		cancleBtn.attr("value", "수정취소").css("margin-right", "20px").attr("id", "cancleBtn");
		$("#updateBtn").val("수정완료");
		$("#updateBtn").before(cancleLink.append(cancleBtn));
		let phrase = $("<div>").attr("class", "phrase").attr("id", "phraseDiv");
		$(".modifiedBox>div").before(phrase);
		$(".modifiedBox").css("justify-content", "space-between");

		// 비밀번호 변경하기 버튼 제거
		$("#pwUpdateBtn").css("display", "none")

		// 수정가능한 div로 속성 변경
		updateBox.find(".infoBox:not(:first-child):not(:nth-child(2))").find(".infocon").attr("contenteditable", "true");
		// div에 아이디 붙여주기
		updateBox.find(".infoBox:nth-child(3)").find(".infocon").attr("id", "newNick");
		updateBox.find(".infoBox:nth-child(4)").find(".infocon").attr("id", "newPhone");
		updateBox.find(".infoBox:nth-child(5)").find(".infocon").attr("id", "newEmail");
		$(".updateBox>.infoBox:not(:first-child):not(:nth-child(2))>.infocon").css("border", "1px solid").css("border-radius", "5px")


		// 아이디는 수정 못함 문구  출력
		let idPhrase = $("<div>").attr("class", "phrase").css("padding-left", "10px").html("아이디는 변경할 수 없습니다.")
		updateBox.children(".infoBox:first-child").append(idPhrase);

		// 이름 수정 못함 문구  출력
		let namePhrase = $("<div>").attr("class", "phrase").css("padding-left", "10px").html("이름은 변경할 수 없습니다.")
		updateBox.children(".infoBox:nth-child(2)").append(namePhrase);
	}
});
