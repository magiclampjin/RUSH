<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/main.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script src="https://cdn.jsdelivr.net/npm/js-cookie@3.0.5/dist/js.cookie.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	* {
		box-sizing: border-box;
		margin: 0px;
		padding: 0px;
		text-decoration: none;
		list-style: none;
	}
	
	p {
		margin-bottom: 0;
	}
	
	a {
		text-decoration: none;
	}
	
	.container {
		width: 100%;
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
	
	#title {
		font-size: 70px;
	}
	
	#subTitle {
		font-size: 30px;
	}
	
	.idBox {
		margin-top: 60px;
	}
	
	.pwBox {
		margin-top: 30px;
	}
	
	#id, #pw {
		font-weight: 300;
		font-size: 30px;
		margin-bottom: 10px;
	}
	
	#inputId, #inputPw {
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
	}
	
	#login {
		font-weight: 300;
		border: none;
		border-radius: 10px;
		width: 100%;
		height: 60px;
		margin-top: 50px;
		font-size: 30px;
	}
	
	.signupBox {
		display: flex;
		margin-top: 40px;
		justify-content: center;
		align-items: center;
	}
	
	#signupText {
		font-size: 20px;
		margin-right: 5px;
	}
	
	#signup {
		font-size: 20px;
		text-decoration-line: none;
	}
	
</style>
</head>

<body>


	
	
	<div class="container-fluid p-0">
        <div class="header bColorBlack">
            <div class="header_guide">
                <a href="#">
                    <div class="logo fontLogo colorWhite">RUSH</div>
                </a>
                <nav class="navbar navbar-expand navbar-light colorWhite">
                    <div class="container-fluid p-0">
                        <div class="collapse navbar-collapse w-100 g-0 m-0" id="navbarNavDropdown">
                            <ul class="navbar-nav row g-0 w-100">
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        GAME
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        AWARDS
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        BOARD
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        LOGIN
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

	<div id="container g-0" class="container">
		<div class="row g-0">
			<div class="loginImage col-6 d-none d-xl-block g-0">
			</div>
		
			<div class="loginBox col-6">
				<div class="loginTitle">
					<div>
						<p id="title" class="fontEnglish">welcome back</p>
						<p id="subTitle" class="fontEnglish colorDarkgray">Please enter your details.</p>
					</div>

	                  <div class="idBox">
	                     <p id="id" class="fontEnglish">ID</p>
	                     <input type="text" id="inputId" class="fontEnglish" name="id" placeholder="Enter your ID">
	                  </div>
	                  <div class="pwBox">
	                     <p id="pw" class="fontEnglish">Password</p>
	                     <input type="password" id="inputPw" class="fontEnglish" name="pw" placeholder="********">
	                  </div>
	                  <div class="rem_fg">
	                     <div class="rememberId">
	                        <input type="checkbox" id="remID">
	                        <p class="fontEnglish">Remember me</p>
	                     </div>
	                     <a href="#" id="find" class="fontEnglish colorBlue">Forgot ID or Password?</a>
	                  </div>
	                  <button id="login" class="fontEnglish colorWhite bColorBlue">Login</button>

					<div class="signupBox">
						<p id="signupText" class="fontEnglish">Don't have an account?</p>
						<a href="/member/signup.jsp" id="signup" class="fontEnglish colorBlue">Signup</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="footer bColorBlack">
            <div class="footer_guide">
                <div class="footer_logo fontLogo colorWhite">RUSH</div>
                <div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL RIGHT RESERVED</div>
                <div class="footer_contents">
                    <div class="about conDiv fontEnglish">
                        <div class="footer_title fontEnglish colorWhite">ABOUT US</div>
                        <div class="footer_con ">
                            <div class="con colorWhite">팀명 :
                            </div>
                            <div class="encon colorWhite"> SKY</div>
                        </div>
                    </div>
                    <div class="office conDiv fontEnglish">
                        <div class="footer_title fontEnglish colorWhite">OFFICE</div>
                        <div class="footer_con">
                            <div class="con colorWhite">충청남도 천안시 서북구 천안대로 1223-24</div>
                        </div>
                    </div>
                    <div class="contact conDiv fontEnglish">
                        <div class="footer_title fontEnglish colorWhite">CONTACT US</div>
                        <div class="footer_con fontEnglish">
                            <div class="con fontEnglish colorWhite">a@naver.com</div>
                            <div class="con fontEnglish colorWhite">01012345678</div>
                        </div>
                    </div>
                    <div class="provision conDiv fontEnglish">
                        <div class="footer_title fontEnglish colorWhite">PROVISION</div>
                        <div class="footer_con">
                            <div class="con colorWhite">개인정보 처리방침</div>
                            <div class="con colorWhite">서비스 이용약관</div>
                        </div>
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
 	let userID = Cookies.get("remid");
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
	}); 
	
	// 아이디 & 비밀번호 찾기
	$("#find").on("click", function() {
		location.href = "/find.jsp"
	});
	
	// 회원가입
	$("#signup").on("click", function() {
		location.href = "/signup.jsp";
	});
	
	// 아이디 & 비밀번호 null값 확인
	
	$("#login").on("click", function(){
		if($("#inputId").val() == "") {
			alert("아이디를 입력하세요.");
			$("#inputId").focus();
			return false;
		}
		
		if($("#inputPw").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#inputPw").focus();
			return false;
		}
		
        let mId = $("#inputId").val();
        let mPw = $("#inputPw").val();
        
        $.ajax({
           type:"post",
           url:"/login.member",
           data: {
              id: mId,
              pw: mPw
           },
        }).done(function(login){
           if(login =="failed"){
              alert("아이디 또는 비밀번호가 틀렸습니다.");
           }
           else{
              location.href="/index.jsp";
           }
       });
	});
	
	
	</script>
</body>
</html>