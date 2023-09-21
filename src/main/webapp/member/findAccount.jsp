<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID & PW</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/member/findAccount.css" rel="stylesheet">
<script type="text/javascript" src="/js/member/findAccount.js"></script>

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
    
    .container {
        width: 100%;
    }
    
    a {
        text-decoration: none;
    }
    
    .dropdown-menu[data-bs-popper] {
        right: 0;
        left: auto;
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
            <div id="box" class="container-fluid">
                <div id="findIdBox">
                    <div class="titleBox row g-0 mt-10">
                        <div class="title col-12">아이디 찾기</div>
                        <hr class="row">
                        <div class="subtitle col-12">아이디가 생각나지 않으세요?</div>
                        <div class="subtitle2 col-12 colorDarkgray">회원가입시 등록한 이름과 이메일을 입력해주세요.</div>
                    </div>
                    <div class="inputBox row g-0 mt-5">
                        <div class="inputTitle col-2">이름</div>
                        <input type="text" id="nameForId" class="input col-9">
                    </div>
                    <div class="inputBox row g-0 mt-3">
                        <div class="inputTitle col-2">이메일</div>
                        <input type="text" id="emailForId" class="input col-9">
                    </div>
                    <div class="row">
                        <div class="col-5"></div>
                        <button id="findId" class="col-2 findBtn bColorBlue colorWhite mt-3">찾기</button>
                        <div class="col-5"></div>
                    </div>
                </div>
                <div id="findPwBox">
                    <div class="titleBox row g-0 mt-5">
                        <div class="title col-12">비밀번호 찾기</div>
                        <hr class="row">
                        <div class="subtitle col-12">비밀번호가 생각나지 않으세요?</div>
                        <div class="subtitle2 col-12 colorDarkgray">회원가입시 등록한 아이디, 이름, 이메일을 입력해주세요.</div>
                    </div>
                    <form action="/updatePw.member" onsubmit="return checkRegex();" method="post">
	                    <div class="inputBox row g-0 mt-5">
	                        <div class="inputTitle col-2">아이디</div>
	                        <input type="text" id="idForPw" name="id" class="input col-9">
	                    </div>
	                    <div class="inputBox row g-0 mt-3">
	                        <div class="inputTitle col-2">이름</div>
	                        <input type="text" id="nameForPw" name="name" class="input col-9">
	                    </div>
	                    <div class="inputBox row g-0 mt-3">
	                        <div class="inputTitle col-2">이메일</div>
	                        <input type="text" id="emailForPw" name="email" class="input col-9">
	                    </div>
	                    <div class="row g-0">
	                        <div class="col-5"></div>
	                        <button type="button" id="findPw" class="col-2 findBtn bColorBlue colorWhite mt-3">찾기</button>
	                        <div class="col-5"></div>
	                    </div>
	                    <div id="pwBox" class="row g-0 mt-5 mb-5">
	                    	<div class="inputBox row g-0">
		                        <div class="inputTitle col-2">새 비밀번호</div>
		                        <input type="password" id="newPw" name="pw" class="input col-9">
		                    </div>
	           	            <div id="checkPw"></div>
		                    <div class="row g-0">
		                        <div class="col-5"></div>
		                        <button id="updatePw" class="col-2 findBtn bColorBlue colorWhite mt-3">변경하기</button>
		                        <div class="col-5"></div>
		                    </div>
		                    <script type="text/javascript" src="/js/member/findAccount.js"></script> 
	                    </div>
                    </form>
                </div>
            </div>
       </div>


       <a href="#">
           <div class="upArrow bColorPink colorWhite">
               <i class="fa-solid fa-arrow-up-long"></i>
           </div>
       </a>

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
</html>