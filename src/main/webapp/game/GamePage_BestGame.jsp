<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
a{
	text-decoration: none;
}

.game {
	min-width : 579px;
	max-width: 1030px;
	width: 100%;
	height: 579px;
	background-color: white;
	margin: auto;
}

.gameContainer { 
	max-width: 1300px;
	margin: auto;
}
.gamePic{
	max-width: 200px;
	max-height: 150px;
	width: 100%;
	height: 100%;
	background-color: white;
}
</style>
</head>
<body>
<script>
	window.onload = function(){
		$.ajax({
			url:"/getBestGame.game",
		}).done(function(res){
			let data = JSON.parse(res);
			console.log(data);
			console.log(data.length);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0 p-2");
				
				let divColRank = $("<div>");
				divColRank.addClass("col-1 text-white")
				divColRank.append(i+1);
				
				let divColInfo = $("<div>");
				divColInfo.addClass("col-8 col-md-5 d-flex");
				divColInfo.append(data[i]);
				
				let divColPlayInfo = $("<div>");
				divColPlayInfo.addClass("col-3 d-none d-md-flex align-item-center");
				divColPlayInfo.append("W 50% M 50%");
				
				let divColBtn = $("<div>");
				divColBtn.addClass("col-3");
				divColBtn.html("<button type='button' class='btn btn-success fontEnglish fw900'>PLAY GAME</button>");
				
				divRow.append(divColRank);
				divRow.append(divColInfo);
				divRow.append(divColPlayInfo);
				divRow.append(divColBtn);
				
				$(".bestCon").append(divRow);
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
			<div class="gameContainer p-4">
				<div class="row">
					<div class="col-12">
						<p class="text-white fontKorean fs-2">베스트 게임</p>
					</div>
				</div>
				<div class="row mt40">
					<hr class="colorWhite">
					<div class="col-1">
						<p class="text-white fontKorean">순위</p>
					</div>
					<div class="col-8 col-md-5">
						<p class="text-white fontKorean">게임 정보</p>
					</div>
					<div class="col-3 d-none d-md-flex">
						<p class="text-white fontKorean">플레이 정보</p>
					</div>
					<div class="col-3">
						<p class="text-white fontKorean">게임 바로가기</p>
					</div>
					<hr class="colorWhite">
				</div>
				<div class="row d-flex justify-content-center align-items-center">
					<div class="col-1">
						<p class="colorPink fontEnligh fs-2">1</p>
					</div>
					<div class="col-8 col-md-5 d-flex">
						<div class="row">
							<div class="col-7">
								<div class="gamePic"></div>
							</div>
							<div class="col-5 d-flex align-items-center">
								<div class="row">
									<div class="col-12">
										<p class="text-white">게임 이름</p>
									</div>
									<div class="col-12">
										<p class="text-white">만든사람 이름</p>
									</div>
									<div class="col-12 d-flex d-md-none">
										<p class="text-white">플레이 정보</p>
									</div>
								</div>
								
								
							</div>
						</div>
					</div>
					<div class="col-3 d-none d-md-flex align-item-center">
						<span class="text-white fontEnglish fs-3 fw900">W</span> &nbsp;&nbsp;
						<span class="text-white fontEnglish fs-5">50% </span> &nbsp;&nbsp;
						<span class="text-white fontEnglish fs-3 fw900">M </span> &nbsp;&nbsp;
						<span class="text-white fontEnglish fs-5">50% </span>
					</div>
					<div class="col-3">
						<button type="button" class="btn btn-success fontEnglish fw900">PLAY GAME</button>
					</div>
				</div>
				<div class="bestCon">
					
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
        $(".btn").on("click",function(){
            // $(".categories").text();
            console.log("");
        });
    </script>
</body>
</html>