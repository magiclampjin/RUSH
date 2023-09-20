<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="/css/game/game.css"/>
<style>
* {
	box-sizing: border-box;
}

.test {
	background-color: white;
	width: 300px;
	height: 200px;
}

.game {
	min-width : 579px;
	max-width: 1030px;
	width: 100%;
	height: 579px;
	background-color: white;
	margin: auto;
}
a{
	text-decoration: none;
}

.gameContainer { 
	max-width: 1300px;
	margin: auto;
}
.rankCon{
	max-width : 1030px;
	width : 100%;
}
.rankCon{
	max-width : 1030px;
	width : 100%;
}
.devTable th,td{
	border : 1px solid white;
	vertical-align : middle;
	padding : 3px;
}
.devTable th{
	width : 20%;
}
.devTable td{
	width : 80%;
}
.devTable{
	border : 1px solid white;
	width : 100%;
}
.btn-check-input:checked~.btn.btn-outline-light::before{
	background-color: #ccf423;
}
.bColorBlue {
  background-color: #5d6ce1;
}

</style>
</head>
<body>
<script>
	window.onload = function(){
		$.ajax({
			url:"/checkFavorite.game",
			data:{
				game:"${game}",
				mID : "rubiver"
			},
			type : "post"
		}).done(function(res){
			let isFavorite = res;
			console.log(isFavorite);
			if(isFavorite == 1){
				$("#favorite").css("display","none");
				$("#delfavorite").css("display","block");
				console.log("active");
			}
		});
	}
</script>
	<div class="container-fluid g-0">
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
		<div class="container-fluid g-0 bColorBlack">
			<div class="gameContainer">
				<div class="row g-0">
					<div class="col-2 d-flex justify-content-center">
						<div class="row g-0">
							<div class="col-12 mt-5">
								<div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn btn-dark bColorBlack"><span class="fontKorean text-white">최신게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack active"><span class="fontKorean text-white">리듬게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack"><span class="fontKorean text-white">아케이드게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack"><span class="fontKorean text-white">퍼즐게임</span></button>
									<!-- js로 넘어가기 -->
								</div>
							</div>
						</div>
					</div>
					<div class="col-10 pr45">
						<div class="row g-0">
							<div class="col-12">
								<p class="gameCategory fs-5 mb-0 text-white fontKorean">
								<c:choose>
									<c:when test="${category == 'Rhythm' }">리듬 게임</c:when>
									<c:when test="${category == 'Arcade' }">아케이드 게임</c:when>
									<c:when test="${category == 'Puzzle' }">퍼즐 게임</c:when>
								</c:choose>
								
								</p>
							</div>
						</div>
						<div class="row g-0">
							<div class="col-10">
								<p class="gameName fs-2 mt-0 text-white fontKorean">${game}</p>
							</div>
							<div
								class="col-2 d-flex justify-content-center align-content-bottom">
								<div>
									<button type="button" class="btn btn-outline-light" id="favorite">
										<i class="fa-regular fa-star colorWhite"></i>
										즐겨찾기
									</button>
									<button type="button" class="btn btn-outline-light active" style="display:none" id="delfavorite">
										<i class="fa-regular fa-star colorWhite"></i>
										즐겨찾기
									</button>
								</div>
							</div>
							<hr class="border border-primary border-3 opacity-75">
						</div>
						<div class="row g-0">
							<div class="col-12 game">play ground</div>
						</div>
						<div class="row g-0">
							<div class="col-12 d-flex justify-content-center mt150">
								<div class="btn-group w100p mxWidth1030" role="group"
									aria-label="Basic radio toggle button group">
									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio1" autocomplete="off" checked> <label
										class="btn btn-outline-light" for="btnradio1">게임 순위</label>

									<input type="radio" class="btn-check" name="btnradio"
										id="btnradio2" autocomplete="off"> <label
										class="btn btn-outline-light" for="btnradio2">게임 정보</label>
								</div>
							</div>
							
							<!-- jstl 버튼 checked 확인해서 순위나 조작방법으로 바꿔야됨. -->
						</div>
						<div class="row g-0 mt150">
							<div class="col-12" id="rank">
								<div class="rankCon">
								<hr class="colorWhite">
									<div class="row g-0 p-2">
										<div class="col-1">
										<span class="text-white fontKorean">순위</span>
										</div>
										<div class="col-7">
											<span class="text-white fontKorean">플레이어 정보</span>
										</div>
										<div class="col-4">
											<span class="text-white fontKorean">점수</span>
										</div>
									</div>
									<hr class="colorWhite">
									<div class="row">
									<!-- 요기서 데이터 추ㄹ력 -->
									</div>
								</div>
							</div>
							<div class="col-12" id="info">
								<div class="row g-0 w100p mt150">
									<div class="col-12">
										<p class="text-white fontKorean fs-2">게임 설명</p>
										<hr class="colorBlue border-3 opacity-75">
									</div>
									<div class="col-12">
										<p class="text-white fontKorean">게임 설명을 적어주세요</p>
									</div>				
								</div>
								<div class="row g-0 w100p mt150">
									<div class="col-12">
										<p class="text-white fontKorean fs-2">조작 방법</p>
										<hr class="colorGreen border-3 opacity-75">
									</div>
									<div class="col-12">
										<p class="text-white fontKorean">게임 설명을 적어주세요</p>
									</div>				
								</div>
								<div class="row g-0 w100p mt150">
									<div class="col-12">
										<p class="text-white fontKorean fs-2">제작자 정보</p>
										<hr class="colorPink border-3 opacity-75">
									</div>
									<div class="col-12">
										<table class="devTable">
											<tr>
												<th class="text-white fontKorean fw900">제작자</th>
												<td class="text-white fontKorean">제작자이름</td>
											</tr>
											<tr>
												<th class="text-white fontKorean fw900">제작자 소속</th>
												<td class="text-white fontKorean">공주대학교 SKY팀</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>

		</div>
		<div class="container-fluid g-0">
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
		<script>
		$("#rank").css("display","flex");
		$("#rank").css("justify-content","center");
		$("#info").css("display","none");
        $(".btn").on("click",function(){
            // $(".categories").text();
            console.log("");
        });
        
        $("#btnradio1").on("click",function(){
        	$("#rank").css("display","flex");
        	$("#rank").css("justify-content","center");
        	$("#info").css("display","none");
        });
        
        $("#btnradio2").on("click",function(){
        	$("#info").css("display","block");
        	$("#rank").css("display","none");
        });
        $("#favorite").on("click",function(){
        	$.ajax({
        	      url:"/favorite.game",
        	      data:{
        	        mID:"rubiver",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨. */
        	        gameName:'${game}'
        	      },
        	      type:"post"
        	    }).done(function (res){
        	      console.log(res);
        	    });
        });
        $("#favorite").on("click",function(){
        	$.ajax({
        	      url:"/deletefavorite.game",
        	      data:{
        	        mID:"rubiver",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨. */
        	        gameName:'${game}'
        	      },
        	      type:"post"
        	    }).done(function (res){
        	      console.log(res);
        	    });
        });
    </script>
</body>
</html>