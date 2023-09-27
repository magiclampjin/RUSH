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
    
<%@ include file="/common/style.jsp" %> 
</head>
<body>
	<div class="container-fluid p-0">
    <%@ include file="/common/header.jsp" %>

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

       <%@include file="/common/footer.jsp"%>
   </div>
</body>
</html>