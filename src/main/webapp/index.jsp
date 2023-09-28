<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>RUSH</title>

<%@ include file="/common/style.jsp" %>
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
.p8 {
	padding: 8px !important;
}

.w700 {
	width: 700p !important;
}

.w1300 {
	max-width: 1300px !important;
}

.body_guide {
	max-width: 1300px;
	width: 100%;
	height: 100%;
	margin: auto;
}

.mt200 {
	margin-top: 200px !important;
}

.mt100 {
	margin-top: 100px !important;
}

.mb200 {
	margin-bottom: 200px !important;
}

.mb100 {
	margin-bottom: 100px !important;
}

.mb80 {
	margin-bottom: 80px !important;
}

.mb50 {
	margin-bottom: 50px !important;
}

.mb30 {
	margin-bottom: 30px !important;
}

.mb20 {
	margin-bottom: 20px !important;
}

.mb10 {
	margin-bottom: 10px !important;
}

.mlr20 {
	margin: 0px 20px !important;
}

.ml15 {
	margin-left: 15px !important;
}

.pl70 {
	padding-left: 70px !important;
}

.pr70 {
	padding-right: 70px !important;
}

.plr50 {
	padding: 0px 50px !important;
}

.w49 {
	width: 49% !important;
}

.gameDesc {
	padding: 0px 50px  !important;
}
</style>
</head>


<body>
	<div class="container-fluid p-0">
		<%@ include file="/common/header.jsp" %>

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
							<div class="borderAni">
								<img class="gameImg" src="/img/img.jpg"> <span></span> <span></span>
								<span></span> <span></span>
							</div>
						</div>
						<div class="d-none col-sm-6 d-md-block">
							<div
								class="colorWhite fw500 fs15 d-flex align-items-center justify-content-center text-center h80 gameDesc">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button class="gameBtns fontEnglish bColorPink colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>

						<div
							class="col-12 d-md-none d-flex align-items-center justify-content-center">
							<div class="borderAni">
								<img class="gameImgmini" src="/img/img.jpg"> <span></span>
								<span></span> <span></span> <span></span>
							</div>
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
								class="colorWhite fw500 fs15 d-flex align-items-center justify-content-center text-center h80 gameDesc">
								여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에
								생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구</div>
							<div class="d-flex align-items-center justify-content-center h20">
								<button class="gameBtns fontEnglish bColorBlue colorWhite fw900">PLAY
									GAME</button>
							</div>
						</div>
						<div class="d-none col-sm-6 d-md-block">
							<div class="borderAni">
								<img class="gameImg" src="/img/img.jpg"> <span></span> <span></span>
								<span></span> <span></span>
							</div>
						</div>

						<div
							class="col-12 d-md-none d-flex align-items-center justify-content-center">
							<div class="borderAni">
								<img class="gameImgmini" src="/img/img.jpg"> <span></span>
								<span></span> <span></span> <span></span>
							</div>
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
							<div class="col-12 colorWhite fw900 fs30px mb20">게임1</div>
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
							<div class="col-12 colorWhite fw900 fs30px mb20">게임2</div>
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
							<div class="col-12 colorWhite fw900 fs30px mb20">게임3</div>
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
		<%@include file="/common/footer.jsp"%>
	</div>
</body>
</html>