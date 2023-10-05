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
	
<%@ include file="/common/style.jsp" %> 

<style>
     p {
         margin-bottom: 0 !important;
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
         resize: none;
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
    <%@ include file="/common/header.jsp" %>

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
	                <textarea class="agreeBox" readonly>개인정보보호법에 따라 러쉬에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.&#10;&#10;1. 수집하는 개인정보&#10;이용자는 회원가입을 하지 않아도 게임 이용 등 러쉬 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 게임 이용, 게시판 글 작성 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 러쉬는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.&#10;회원가입 시점에 러쉬가 이용자로부터 수집하는 개인정보는 아래와 같습니다.&#10;- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호, 본인확인 이메일주소를 수집합니다.&#10;서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록이 생성되어 수집될 수 있습니다. &#10;구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.&#10;이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.&#10;&#10;2. 수집한 개인정보의 이용&#10;러쉬 및 러쉬 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.&#10;- 회원 가입 의사의 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.&#10;- 법령 및 러쉬 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.&#10;- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.&#10;&#10;3. 개인정보의 보관기간&#10;회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.&#10;단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.&#10;참고로 러쉬는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.&#10;&#10;4. 개인정보 수집 및 이용 동의를 거부할 권리&#10;이용자는 개인정보의 수집 및 이용 동의를 거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실 경우, 회원가입이 어려울 수 있습니다.</textarea>
	                <div class="check">
	                    <input type="checkbox" id="checkbox" name="agree">
	                    <p id="agreeText">개인정보 수집 및 활용에 동의합니다.</p>
	                </div>
	            </div>
	
	            <button id="signup" class="fontEnglish colorWhite bColorBlue">Signup</button>
	        </div>
        </form>
    </div>
    
    <%@include file="/common/footer.jsp"%>
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
	let regexPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[`~!@#$%^&*()-_=+])[A-Za-z\d`~!@#$%^&*()-_=+]{8,}$/; // 알파벳 대소문자, 숫자, 특수문자를 한 글자 이상 포함
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
		
		$.ajax({
	           type:"post",
	           url:"/isBlack.member",
	           data: {
	              contact: $("#contact").val(),
	              email: $("#email").val()
	           },
	        }).done(function(pw){
	           if(pw==1){
	        	   $("#checkInfo").html("블랙리스트에 등록된 사용자입니다.");
		   	        $("#checkInfo").css({
		               	"color" : "red",
		               	"font-size" : "13px"
		               });
		   	     	$("#contactDiv").css("border", "1px solid red");
		   	        flag = false;
	           }
	       });
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
		
		$.ajax({
	           type:"post",
	           url:"/isBlack.member",
	           data: {
	              contact: $("#contact").val(),
	              email: $("#email").val()
	           },
	        }).done(function(pw){
	           if(pw==1){
	        	   $("#checkInfo").html("블랙리스트에 등록된 사용자입니다.");
		   	        $("#checkInfo").css({
		               	"color" : "red",
		               	"font-size" : "13px"
		               });
		   	     	$("#emailDiv").css("border", "1px solid red");
		   	        flag = false;
	           }
	       });
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