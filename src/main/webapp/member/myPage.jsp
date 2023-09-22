<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH-마이페이지</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/member/myPage.css">
<link rel="stylesheet" href="/css/board/boardList.css">
<script type="text/javascript" src="/js/member/infoModified.js"></script>

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

.num, .writer, .date, .file {
	width: 15%;
}

.title {
	width: 40%;
}

.mainTitle {
	padding-left: 5px;
}
.tabBox{border:1px solid black; border-radius:5px;}
ul.tabs{
  margin: 0px;
  padding: 0px;
  list-style: none; border-bottom:1px solid black;
  display:flex;
}
ul.tabs li{
  background: none;
  color: #222;
  display: inline-block;
  padding: 10px 0px;
  cursor: pointer;
  width:25%;
  text-align:center;
}

ul.tabs li.current{
  background: #ededed;
  background-color: #131217;
  color:#ffffff;
}

.tab-content{
  display: none;
  padding: 15px;
  height: 600px;
  margin:0px;
}

.tab-content.current{
  display: inherit;
  
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
						<div class="collapse navbar-collapse w-100 g-0 m-0"
							id="navbarNavDropdown">
							<ul class="navbar-nav row g-0 w-100">
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> GAME </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> AWARDS </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> BOARD </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> LOGIN </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>

		<div class="myPage">
			<div class="nickNameBox bColorBlack">
				<div class="nicknameInfo">
					<div class="nickname colorWhite">${user.nickName } 님</div>
					<div class="levelBox">
						<div class="level colorWhite fontEnglish">Lv. ${user.level }</div>
						<div class="singDay colorDarkgray">가입일: ${user.stringFormat }</div>
					</div>
				</div>
			</div>
			<div class="myPage_guide">
				<div class="memberInfo">
					<div class="memberBasicTitle">기본 회원정보</div>
					<div class="memberInfoBox updateBox">
						<div class="infoBox">
							<!-- div였다가 수정하기 버튼 누르면 input 나오게 -->
							<div class="infoCagetory">아이디</div>
							<div class="infocon">${user.id }</div>
							<input type="hidden">
						</div>
						<div class="infoBox">
							<div class="infoCagetory">비밀번호</div>
							<div class="infocon"><i class="fa-solid fa-lock"></i>&nbsp;비밀번호</div>
							<input type="hidden">
						</div>
						<div class="infoBox">
							<div class="infoCagetory">닉네임</div>
							<div class="infocon">${user.nickName }</div>
							<input type="hidden">
						</div>
						<div class="infoBox">
							<div class="infoCagetory">휴대전화</div>
							<div class="infocon">${user.phone }</div>
							<input type="hidden">
						</div>
						<div class="infoBox">
							<div class="infoCagetory">이메일</div>
							<div class="infocon">${user.email }</div>
							<input type="hidden">
						</div>
						<div class="infoBox modifiedBox">
							<input class="updateBtn bColorBlue colorWhite" id="updateBtn"
								type="button" value="수정하기">
						</div>
					</div>
				</div>
				<div class="memberInfo">
					<div class="memberBasicTitle">추가 회원정보</div>
					<div class="memberInfoBox">
						<div class="infoBox">
							<div class="infoCagetory">생년월일</div>
							<div class="infocon">${user.formedBirth }</div>
						</div>
						<div class="infoBox">
							<div class="infoCagetory">성별</div>
							<div class="infocon">${user.gender }</div>
						</div>
					</div>
				</div>

				<div class="memberInfo">
					<div class="tabBox">
						<!-- 탭박스 -->
						<ul class="tabs">
						    <li class="tab-link current" id="myWrite" data-tab="tab-1">내가 쓴 글</li>
						    <li class="tab-link" data-tab="tab-2">북마크</li>
						    <li class="tab-link" data-tab="tab-3">즐겨찾기</li>
						    <li class="tab-link" data-tab="tab-4">게임기록</li>
						</ul>
						
					    <div id="tab-1" class="tab-content current">
					    	<div class="boardHeader">
	                            <div class="num">번호</div>
								<div class="title">제목</div>
								<div class="writer">작성자</div>
								<div class="date">작성일</div>
								<div class="view">조회</div>
								<div class="recommend">추천</div>
								<div class="file">파일</div>
	                        </div>
					    	<div class="post">
								<div class="num fontEnglish">번호</div>
								<div class="title">
									<a href="/load.board?cpage=${cpage }&seq=${post.seq }&category=${category }">
										<div class="mainTitle">제목</div>
									</a>
								<div class="replyCnt colorPink fontEnglish">댓글수</div>
								</div>
								<div class="writer">닉네임</div>
								<div class="date">작성일</div>
								<div class="view fontEnglish">조회수</div>
								<div class="recommend fontEnglish">추천수</div>
								<c:if test="${post.fCount!=0 }">
									<div class="file">
										<i class="fa-solid fa-paperclip"></i>
									</div>
								</c:if>
					    	</div>
					    </div>
					    <div id="tab-2" class="tab-content">tab content2</div>
					    <div id="tab-3" class="tab-content">tab content3</div>
					    <div id="tab-4" class="tab-content">tab content4</div>
					</div>
				</div>

				<div class="memberInfo">
					<div class="deletBtnBox">
						<span>탈퇴를 원하시면 탈퇴버튼을 눌러주세요.</span> <input type="button"
							class="deleteBtn bColorWhite colorDarkgray" value="회원탈퇴">
					</div>
				</div>
			</div>
		</div>

		<script>
		$(document).ready(function(){
			  
		  $('ul.tabs li').click(function(){
		    var tab_id = $(this).attr('data-tab');

		    $('ul.tabs li').removeClass('current');
		    $('.tab-content').removeClass('current');

		    $(this).addClass('current');
		    $("#"+tab_id).addClass('current');
		  })

		})
		
		$("#myWrite").on("click",function(){
			$.ajax({
				url:"/myWriteList.board",
				dataType:"json"
			}).done(function(resp){
				console.log(resp);
			});
		});
			
		</script>




		<a href="#">
			<div class="upArrow bColorPink colorWhite">
				<i class="fa-solid fa-arrow-up-long"></i>
			</div>
		</a>

		<div class="footer bColorBlack">
			<div class="footer_guide">
				<div class="footer_logo fontLogo colorWhite">RUSH</div>
				<div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL
					RIGHT RESERVED</div>
				<div class="footer_contents">
					<div class="about conDiv fontEnglish">
						<div class="footer_title fontEnglish colorWhite">ABOUT US</div>
						<div class="footer_con ">
							<div class="con colorWhite">팀명 :</div>
							<div class="encon colorWhite">SKY</div>
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