<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<style>
	@import url('https://fonts.googleapis.com/css2?family=Bebas+Neue&family=IBM+Plex+Sans+KR&family=Jost:wght@300;400&display=swap');
	
	

	* {
		box-sizing: border-box;
		margin: 0;
	}
	
	p {
		margin-bottom: 0;
	}
	
	.container {
		width: 100%;
		margin-top: 30px;
	}

	#container {
		display: flex;
		min-width: 786px;
	}
	
	.loginBox {
		width: 500px;
		margin: auto;
		margin-top: 100px;
	}
	
	.loginTitle {
		font-family: 'Jost', sans-serif;
	}
	
	#title {
		font-size: 70px;
	}
	
	#subTitle {
		font-size: 30px;
		color: #616161;
	}
	
	.idBox {
		margin-top: 60px;
	}
	
	.pwBox {
		margin-top: 30px;
	}
	
	#id, #pw {
		font-family: 'Jost', sans-serif;
		font-weight: 300;
		font-size: 30px;
		margin-bottom: 10px;
	}
	
	#inputId, #inputPw {
		font-family: 'Jost', sans-serif;
		font-weight: 300;
		font-size: 20px;
		border: 1px solid;
		border-radius: 10px;
		width: 100%;
		height: 60px;
	}
	
	#inputId::placeholder, #inputPw::placeholder {
		font-size: 20px;
		padding: 0 10px;
	}
	
	.rem_fg {
		display:flex;
		justify-content: space-between;
		align-items: center;
		margin-top: 30px;
	}
	
	.rememberId {
		display: flex;
	}
	
	#remID {
		zoom: 1.5;
		margin-right: 10px;
	}
	
	#find {
		text-decoration-line: none;
		color: #5D6CE1;
	}
	
	#login {
		font-family: 'Jost', sans-serif;
		font-weight: 300;
		border: none;
		border-radius: 10px;
		width: 100%;
		height: 60px;
		margin-top: 50px;
		font-size: 30px;
		color: #FFF;
		background-color: #5D6CE1;
	}
	
	.signupBox {
		display: flex;
		margin-top: 40px;
		justify-content: center;
		align-items: center;
	}
	
	#signupText {
		font-family: 'Jost', sans-serif;
		font-size: 20px;
		margin-right: 5px;
	}
	
	#signup {
		font-family: 'Jost', sans-serif;
		font-size: 20px;
		text-decoration-line: none;
		color: #5D6CE1;
	}
	
</style>
</head>

<body>
	<div id="container g-0" class="container">
		<div class="row g-0">
			<div class="loginImage col-6 d-none d-xl-block g-0">
				<!-- <img id="image" class="img-fluid" src="/assets/bg_img2.jpg"> -->
			</div>
		
			<div class="loginBox col-6">
				<div class="loginTitle">
					<div>
						<p id="title">welcome back</p>
						<p id="subTitle">Please enter your details.</p>
					</div>
					<div class="idBox">
						<p id="id">ID</p>
						<input type="text" id="inputId" name="id" placeholder="Enter your ID">
					</div>
					<div class="pwBox">
						<p id="pw">Password</p>
						<input type="password" id="inputPw" name="pw" placeholder="********">
					</div>
					<div class="rem_fg">
						<div class="rememberId">
							<input type="checkbox" id="remID">
							<p>Remember me</p>
						</div>
						<a href="#" id="find">Forgot ID or Password?</a>
					</div>
					<button id="login">Login</button>
					<div class="signupBox">
						<p id="signupText">Don't have an account?</p>
						<a href="#" id="signup">Signup</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	// 사진 랜덤
	let images = ["/assets/bg_img1.jpg", "/assets/bg_img2.jpg", "/assets/bg_img3.jpg", "/assets/bg_img4.jpg"];
	let image = images[Math.floor(Math.random() * images.length)];
	let finalImage = $("<img>");
	finalImage.attr("src", image);
	finalImage.addClass("img-fluid"); 
	$(".loginImage").append(finalImage);
	
	// 아이디 기억하기
/* 	let userID = Cookies.get("remid");
	if(userID) {
		$("#inputId").val(userID);
		$("#remID").prop("checked", true);
	}
	
	$("#remID").change(function(){
		if($("#remID").is(":checked")) {
			let id = $("#inputId").val();
			Cookies.set("remid", id, {expires:7});
		} else {
			Cookies.remove("remid");
		}
	}); */
	
	// 아이디 & 비밀번호 찾기
	$("#find").on("click", function() {
		location.href = "/find.jsp"
	});
	
	// 회원가입
	$("#signup").on("click", function() {
		location.href = "/signup.jsp";
	});
	
	
	</script>
</body>
</html>