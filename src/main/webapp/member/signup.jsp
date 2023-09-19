<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link href="/css/main.css" rel="stylesheet">
    
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />

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

     #container {
         width: 522px;
         margin: auto;
     }

     #title {
     	margin-top: 50px;
         font-size: 55px;
         text-align: center;
     }

     #account, #info, #agreement {
         margin-top: 50px;
     }

     .subTitle {
         margin-bottom: 10px;
         font-size: 20px;
         font-weight: 300;
     }

     .box {
         display: flex;
         border: 1px solid;
         border-radius: 10px;
         height: 40px;
         margin-bottom: 10px;
     }

     .agreeBox {
         border: 1px solid;
         border-radius: 10px;
         width: 100%;
         height: 200px;
         margin-bottom: 10px;
         outline: none;
     }

     .birth {
         display: flex;
     }

     .birthBox {
         width: 48%;
         display: flex;
         border: 1px solid;
         border-radius: 10px;
         height: 40px;
         margin-bottom: 10px;
     }

     #hyphen {
         min-width: 4%;
         margin-top: 7px;
         text-align: center;
     }

     #sex::placeholder {
         padding: 0 10px;
     }

     .icon {
         display: flex;
         align-items: center;
         font-size: 20px;
         margin-left: 10px;
         margin-right: 10px;
     }

     .input {
         width: 100%;
         border: none;
         border-radius: 10px;
         outline: none;
     }

     .check {
         display: flex;
     }

     #checkbox {
         width: 20px;
         height: 20px;
         margin-right: 10px;
     }

     #agreeText {
         font-size: 15px;
     }

     #signup {
         border: none;
         border-radius: 10px;
         width: 100%;
         height: 40px;
         margin-top: 40px;
         margin-bottom: 50px;
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

    <div id="container">
        <div id="signupBox">
            <div id="title" class="fontEnglish">
                Create Your Account
            </div>
            <form action="/insert.member" onsubmit="return checkNull()" method="post">
	            <div id="account">
	                <p class="subTitle fontEnglish">Account</p>
	                <div class="box" id="idDiv">
	                    <i class="fa-solid fa-user icon"></i>
	                    <input type="text" id="id" name="id" class="input fontEnglish" placeholder="ID">
	                </div>
	                <div class="box" id="pwDiv">
	                    <i class="fa-solid fa-lock icon"></i>
	                    <input type="password" id="pw" name="pw" class="input fontEnglish" placeholder="Password">
	                </div>
	                <div class="box" id="pw2Div">
	                    <i class="fa-solid fa-check icon"></i>
	                    <input type="password" id="pw2" class="input fontEnglish" placeholder="Confirm Password">
	                </div>
	                <div class="box" id="nicknameDiv">
	                    <i class="fa-solid fa-paperclip icon"></i>
	                    <input type="text" id="nickname" name="nickname" class="input fontEnglish" placeholder="Nickname" maxlength="10">
	                </div>
	                <div id="checkAccount"></div>
	            </div>
	
	            <div id="info">
	                <p class="subTitle fontEnglish">Info</p>
	                <div class="box" id="nameDiv">
	                    <i class="fa-solid fa-user icon"></i>
	                    <input type="text" id="name" name="name" class="input fontEnglish" placeholder="Name">
	                </div>
	                <div class="box" id="birthDiv">
                        <i class="fa-solid fa-address-card icon"></i>
                        <input type="text" id="birth" name="birth" class="input fontEnglish" placeholder="생년월일 + 뒷자리 1자" maxlength="7">
	                </div>
	                <div>
	                <div class="box" id="contactDiv">
	                    <i class="fa-solid fa-phone icon"></i>
	                    <input type="text" id="contact" name="contact" class="input fontEnglish" placeholder="Contact">
	                </div>
	                </div>
	                <div class="box" id="emailDiv">
	                    <i class="fa-solid fa-envelope icon"></i>
	                    <input type="text" id="email" name="email" class="input fontEnglish" placeholder="Email">
	                </div>
	                <div id="checkInfo"></div>
	            </div>
	
	            <div id="agreement">
	                <p class="subTitle fontEnglish">Personal Information Agreement</p>
	                <textarea class="agreeBox" readonly></textarea>
	                <div class="check">
	                    <input type="checkbox" id="checkbox" name="agree">
	                    <p id="agreeText">개인정보 수집 및 활용에 동의합니다.</p>
	                </div>
	            </div>
	
	            <button id="signup" class="fontEnglish colorWhite bColorBlue">Signup</button>
	        </div>
        </form>
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
</body>

<script>
	let flag = false; // 조건 확인

	// 아이디
	let regexId = /^[\w]{8,14}$/; // 8~14자로 구성, 알파벳 대소문자, 숫자, _로만 구성
	$("#id").on("keyup", function(){
		let resultId = regexId.test($("#id").val());
        if (!resultId) {
            $("#idDiv").css("border", "1px solid red");
            $("#checkAccount").html("아이디 형식이 맞지 않습니다. (영어 대소문자, 숫자, _로 구성된 8~14자)");
            $("#checkAccount").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
            flag = false;
        } else {
        	$("#idDiv").css("border", "1px solid forestgreen");
        	$("#checkAccount").html("");
        	flag = true;
        	
        	$.ajax({
        		url:"/idCheck.member",
        		data: {
        			id : $("#id").val()
        		}
        	}).done(function(resp){      			
      			if(resp == "used") {
      				$("#checkAccount").html("이미 사용 중인 아이디입니다.");
      	            $("#checkAccount").css({
      	            	"color" : "red",
      	            	"font-size" : "13px"
      	            });
      	          $("#idDiv").css("border", "1px solid red");
      	          flag = false;
      			} else if(resp == "usable"){
      				$("#checkAccount").html("사용 가능한 아이디입니다.");
      				$("#checkAccount").css({
      	            	"color" : "forestgreen",
      	            	"font-size" : "13px"
      	            });
      				$("#idDiv").css("border", "1px solid forestgreen");
      				flag = true;
      			}
        	});
        }
	});

	// 비밀번호
	let regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,}$/; // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
	$("#pw").on("keyup", function(){
		let resultPw = regexPw.test($("#pw").val());
	    if (!resultPw) {
	        $("#pwDiv").css("border", "1px solid red");
	        $("#checkAccount").html("비밀번호 형식이 맞지 않습니다. (영어 대문자, 소문자, 숫자, 특수문자 포함한 8자 이상)");
	        $("#checkAccount").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
	        flag = false;
	    } else {
	    	$("#pwDiv").css("border", "1px solid forestgreen");
	    	$("#checkAccount").html("");
	    	flag = true;
	    }
	});
	
	
	// 비밀번호 재입력
	$("#pw2").on("keyup", function(){
		if($("#pw").val() != $("#pw2").val()) {
			$("#pw2Div").css("border", "1px solid red");
			$("#checkAccount").html("비밀번호가 일치하지 않습니다.");
			$("#checkAccount").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
			flag = false;
		} else {
			$("#pw2Div").css("border", "1px solid forestgreen");
			$("#checkAccount").html("");
			flag = true;
		}
	});
	
	// 닉네임
	$("#nickname").on("keyup", function(){
		$.ajax({
    		url:"/nicknameCheck.member",
    		data: {
    			nickname : $("#nickname").val()
    		}
    	}).done(function(resp){      			
  			if(resp == "used") {
  				$("#checkAccount").html("이미 사용 중인 닉네임입니다.");
  	            $("#checkAccount").css({
  	            	"color" : "red",
  	            	"font-size" : "13px"
  	            });
  	            $("#nicknameDiv").css("border", "1px solid red");
  	            flag = false;
  			} else if(resp == "usable"){
  				$("#checkAccount").html("사용 가능한 닉네임입니다.");
  				$("#checkAccount").css({
  	            	"color" : "forestgreen",
  	            	"font-size" : "13px"
  	            });
  				$("#nicknameDiv").css("border", "1px solid forestgreen");
  				flag = true;
  			}
    	});
	});
	
	// 이름
    let regexName = /^[가-힣]{2,5}$/; // 한글 2~5자로 구성
    $("#name").on("keyup", function(){
    	let resultName = regexName.test($("#name").val());
    	if(!resultName) {
    		$("#nameDiv").css("border", "1px solid red");
	        $("#checkInfo").html("이름 형식이 맞지 않습니다. (한글 2~5자)");
	        $("#checkInfo").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
	        flag = false;
    	} else {
    		$("#nameDiv").css("border", "1px solid forestgreen");
	    	$("#checkInfo").html("");
	    	flag = true;
    	}
    });
    
    // 생년월일
    let regexBirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1])[1-4])/;
    $("#birth").on("keyup", function(){
    	let resultBirth = regexBirth.test($("#birth").val());
    	if(!resultBirth) {
    		$("#birthDiv").css("border", "1px solid red");
	        $("#checkInfo").html("주민등록번호 형식이 맞지 않습니다.");
	        $("#checkInfo").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
	        flag = false;
    	} else {
    		$("#birthDiv").css("border", "1px solid forestgreen");
	    	$("#checkInfo").html("");
	    	flag = true;
    	}
    });
    
    //전화번호 
    let regexContact = /^01\d(-?\d{4}){2}$/;
	$("#contact").on("keyup", function(){
		let resultContact = regexContact.test($("#contact").val());
		if(!resultContact) {
			$("#contactDiv").css("border", "1px solid red");
	        $("#checkInfo").html("전화번호 형식이 맞지 않습니다.");
	        $("#checkInfo").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
	        flag = false;
		} else {
			$("#contactDiv").css("border", "1px solid forestgreen");
	    	$("#checkInfo").html("");
	    	flag = true;
		}
	});
	
	// 이메일
    let regexEmail = /^(.+?)@(.+?)com$/;
	$("#email").on("keyup", function(){
		let resultEmail = regexEmail.test($("#email").val());
		if(!resultEmail) {
			$("#emailDiv").css("border", "1px solid red");
	        $("#checkInfo").html("이메일 형식이 맞지 않습니다.");
	        $("#checkInfo").css({
            	"color" : "red",
            	"font-size" : "13px"
            });
	        flag = false;
		} else {
			$("#emailDiv").css("border", "1px solid forestgreen");
	    	$("#checkInfo").html("");
	    	flag = true;
		}
	});
	
	// null값 체크
	function checkNull() {
		if($("#id").val() == "") {
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if($("#pw").val() == "" || $("#pw2").val() == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		if($("#nickname").val() == "") {
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		if($("#name").val() == "") {
			alert("이름을 입력하세요.");
			return false;
		}
		
		if($("#birth").val() == "" || $("#sex").val() == "") {
			alert("주민등록번호를 입력하세요.");
			return false;
		}
		
		if($("#contact").val() == "") {
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		if($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			return false;
		}
		
		if($("#checkbox").is(":checked") == true) {
			$("#checkbox").val("true");
		} else {
			$("#checkbox").val("false");
		}
		
		return flag;
	}

</script>
</html>