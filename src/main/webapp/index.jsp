<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH</title>


<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/index.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

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

.w700 {
	width: 700px;
}

.w1300 {
	max-width: 1300px;
}

.body_guide {
	max-width: 1300px;
	width: 100%;
	height: 100%;
	margin: auto;
}

.mt200 {
	margin-top: 200px;
}

.mt100 {
	margin-top: 100px;
}

.mb200 {
	margin-bottom: 200px;
}

.mb100 {
	margin-bottom: 100px;
}

.mb80 {
	margin-bottom: 80px;
}

.mb50 {
	margin-bottom: 50px;
}

.mb30 {
	margin-bottom: 30px;
}

.mb20 {
	margin-bottom: 20px;
}

.mb10 {
	margin-bottom: 10px;
}

.mlr20 {
	margin: 0px 20px;
}

.ml15 {
	margin-left: 15px;
}

.pl70 {
	padding-left: 70px;
}

.pr70 {
	padding-right: 70px;
}

.plr50 {
	padding: 0px 50px;
}

.w49 {
	width: 49%;
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
										<li><a class="dropdown-item" href="/board/boardlist.jsp?menu=free">자유게시판</a></li>
										<li><a class="dropdown-item fontEnglish" href="/board/boardlist.jsp?menu=qna">Q&A</a></li>
										<li><a class="dropdown-item" href="#">명예의 전당</a></li>
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

		<div class="body bColorBlack">
			<div class="body_guide">
				<div class="row g-0 title d-none d-md-block mb200">
					<div class="col-12 text-center fontEnglish fw900 fsmdvw">
						<span class="colorBlue">RADIANT</span> <span class="colorPink">UTOPIA</span>
						<br> <span class="colorWhite">SPARKLING</span> <span
							class="colorGreen">HAVEN</span>
					</div>
					<div class="col-12 btns">
						<button
							class="md-titleBtns fontEnglish bColorGreen colorBlack fw900">PLAY
							GAME</button>
						<button
							class="md-titleBtns fontEnglish bColorBlue colorWhite fw900">AWARDS</button>
					</div>
				</div>

				<div class="row g-0 title d-md-none mb100">
					<div class="col-12 text-center md-fontEnglish fw900 fsvw">
						<span class="colorBlue">RADIANT</span> <br> <span
							class="colorPink">UTOPIA</span> <br> <span
							class="colorWhite">SPARKLING</span> <br> <span
							class="colorGreen">HAVEN</span>
					</div>
					<div
						class="col-12 btns d-flex align-items-center justify-content-center">
						<button class="titleBtns fontEnglish bColorGreen colorBlack fw900">PLAY
							GAME</button>
						<button class="titleBtns fontEnglish bColorBlue colorWhite fw900">AWARDS</button>
					</div>
				</div>

				<div class="row g-0 bestGame">
					<div class="col-12 ptb50 fontEnglish colorWhite fw900 fs50">Best
						Play Game</div>

					<div class="row g-0 pb180">
						<div class="d-none col-sm-6 d-md-block">
							<img class="gameImg" src="/img/img.jpg">
						</div>
						<div class="d-none col-sm-6 d-md-block">
							<div
								class="colorWhite fw500 fs30 d-flex align-items-center justify-content-center text-center h80">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button class="gameBtns fontEnglish bColorPink colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>

						<div
							class="col-12 d-md-none d-flex align-items-center justify-content-center">
							<img class="gameImgmini" src="/img/img.jpg">
						</div>
						<div class="col-12 d-md-none">
							<div
								class="colorWhite fw500 fs3 d-flex align-items-center justify-content-center text-center h80 plr50 mb20">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button
									class="gameBtnsmini fontEnglish bColorPink colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>
					</div>

					<div class="row g-0">

						<div class="d-none col-sm-6 d-md-block">
							<div
								class="colorWhite fw500 fs30 d-flex align-items-center justify-content-center text-center h80">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button class="gameBtns fontEnglish bColorBlue colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>
						<div class="d-none col-sm-6 d-md-block">
							<img class="gameImg" src="/img/img.jpg">
						</div>

						<div
							class="col-12 d-md-none d-flex align-items-center justify-content-center">
							<img class="gameImgmini" src="/img/img.jpg">
						</div>
						<div class="col-12 d-md-none">
							<div
								class="colorWhite fw500 fs3 d-flex align-items-center justify-content-center text-center h80 plr50 mb20">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button
									class="gameBtnsmini fontEnglish bColorBlue colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>
					</div>

				</div>

				<div class="class row g-0 bestBookmark mt100">
					<div class="col-12 ptb50 fontEnglish colorWhite fw900 fs50">Best
						Bookmarks</div>
					<div class="col-12 col-md-4 mb80">
						<div class="row g-0 mlr20">
							<div class="col-12 d-none d-md-block colorWhite fw900 mb20">게임1</div>
							<div class="col-12 d-md-none colorWhite fw900 mb20">게임1</div>
							<div class="col-12 colorWhite mb20">
								<img class="bookmarkImg" src="/img/img.jpg">
							</div>
							<div class="row g-0 d-flex sexRatios">
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderRight1">
									<i class="fa-solid fa-venus fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderLeft1">
									<i class="fa-solid fa-mars fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
							</div>
							<div class="col-12 d-none d-md-block mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtns">PLAY
									GAME</button>
							</div>
							<div class="col-12 d-md-none mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtnsmini">PLAY
									GAME</button>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4 mb80">
						<div class="row g-0 mlr20">
							<div class="col-12 colorWhite fw900 mb20">게임2</div>
							<div class="col-12 colorWhite mb20">
								<img class="bookmarkImg" src="/img/img.jpg">
							</div>
							<div class="row g-0 d-flex sexRatios">
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderRight1">
									<i class="fa-solid fa-venus fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderLeft1">
									<i class="fa-solid fa-mars fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
							</div>
							<div class="col-12 d-none d-md-block mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtns">PLAY
									GAME</button>
							</div>
							<div class="col-12 d-md-none mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtnsmini">PLAY
									GAME</button>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4 mb80">
						<div class="row g-0 mlr20">
							<div class="col-12 colorWhite fw900 mb20">게임3</div>
							<div class="col-12 colorWhite mb20">
								<img class="bookmarkImg" src="/img/img.jpg">
							</div>
							<div class="row g-0 d-flex sexRatios">
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderRight1">
									<i class="fa-solid fa-venus fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
								<div
									class="col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderLeft1">
									<i class="fa-solid fa-mars fa-xl" style="color: #ffffff;"></i></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%
								</div>
							</div>
							<div class="col-12 d-none d-md-block mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtns">PLAY
									GAME</button>
							</div>
							<div class="col-12 d-md-none mb50">
								<button
									class="fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtnsmini">PLAY
									GAME</button>
							</div>
						</div>
					</div>
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