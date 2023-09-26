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
				if(i<3){
					divColRank.addClass("col-2 colorPink fw900 fontEnglish fs-3 d-flex justify-content-center align-self-center")
					divColRank.append(i+1);
				}else{
					divColRank.addClass("col-2 text-white fw900 fontEnglish fs-3 d-flex justify-content-center align-self-center")
					divColRank.append(i+1);
				}			
				
				
				let divColInfo = $("<div>");
				divColInfo.addClass("col-8 col-md-5 d-flex text-white align-self-center");
				
				let divRowInfo = $("<div>");
				divRowInfo.addClass("row");
				
				let divInfoLeft = $("<div>");
				divInfoLeft.addClass("col-7 align-self-center");
				
				let imgDiv = $("<img>");
				imgDiv.attr("src",data[i]["gImageURL"]);
				imgDiv.addClass("gamePic");
				
				let divInfoRight = $("<div>");
				divInfoRight.addClass("col-5 align-self-center");
				
				let divGameName = $("<p>");
				divGameName.addClass("text-white fontEnglish");
				divGameName.append(data[i]["gName"]);
				
				let divDevName = $("<p>");
				divDevName.addClass("text-white fontEnglish");
				divDevName.append(data[i]["gDeveloper"]);
				
				let divPlayInfo =  $("<div>");
				divPlayInfo.addClass("col-12 d-md-none d-xs-flex text-white fontEnglish fw500");
				divPlayInfo.append("W 50% M 50%");
				
				divInfoLeft.append(imgDiv);
				divInfoRight.append(divGameName);
				divInfoRight.append(divDevName);
				divInfoRight.append(divPlayInfo);
				
				
				divColInfo.append(divInfoLeft);
				divColInfo.append(divInfoRight);
				
				let divColPlayInfo = $("<div>");
				divColPlayInfo.addClass("col-3 d-none d-md-flex");
				
				let letter1 = $("<span>");
				letter1.addClass("text-white fontEnglish fs-3 fw900 align-self-center");
				letter1.html("W &nbsp;");
				let letter2 = $("<span>");
				letter2.addClass("text-white fontEnglish fs-5 fw500 align-self-center");
				letter2.html("50%&nbsp;&nbsp;");
				let letter3 = $("<span>");
				letter3.addClass("text-white fontEnglish fs-3 fw900 align-self-center");
				letter3.html("M &nbsp;");
				let letter4 = $("<span>");
				letter4.addClass("text-white fontEnglish fs-5 fw500 align-self-center");
				letter4.html("50% ");
				divColPlayInfo.append(letter1);
				divColPlayInfo.append(letter2);
				divColPlayInfo.append(letter3);
				divColPlayInfo.append(letter4);
				
				let divColBtn = $("<div>");
				divColBtn.addClass("col-2 align-self-center d-flex justify-content-center");
				divColBtn.html("<a href='/moveToGamePage.game?game="+data[i]["gName"]+"'><button type='button' class='btn btn-success fontEnglish fw900'>PLAY GAME</button></a>");
				
				divRow.append(divColRank);
				divRow.append(divColInfo);
				divRow.append(divColPlayInfo);
				divRow.append(divColBtn);
				
				$(".bestCon").append(divRow);
			}
		});
	}
</script>
	<div class="header bColorBlack">
			<div class="header_guide">
				<a href="/index.jsp">
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
										<li><a class="dropdown-item fontEnglish" href="http://localhost/game/GamePage_Main.jsp">Main</a></li>
										<li><a class="dropdown-item fontEnglish" href="http://localhost/game/GamePage_BestGame.jsp">BestGame</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="http://localhost/board/awards.jsp"> AWARDS </a>
									</li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish"
									href="/listing.board?cpage=1" id="navbarDropdownMenuLink"
									role="button" data-bs-toggle="dropdown" aria-expanded="false">
										BOARD </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item"
											href="/listing.board?cpage=1">자유게시판</a></li>
										<li><a class="dropdown-item fontEnglish"
											href="/listing.qna?cpage=1">Q&A</a></li>
										<li><a class="dropdown-item" href="http://localhost/board/awards.jsp">명예의 전당</a></li>
									</ul></li>
								<c:choose>
									<c:when test="${loginID == null }">
										<li class="nav-item dropdown col-3 text-end p8"><a
											class="text-white fontEnglish"
											href="http://localhost/member/login.jsp"> LOGIN </a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item dropdown col-3 text-end"><a
											class="nav-link text-white fontEnglish"
											href="http://localhost/member/login.jsp"
											id="navbarDropdownMenuLink" role="button"
											data-bs-toggle="dropdown" aria-expanded="false"> MYPAGE
										</a>
											<ul class="dropdown-menu p-0"
												aria-labelledby="navbarDropdownMenuLink">
												<li><a class="dropdown-item fontEnglish" href="#">MyPage</a></li>
												<li><a class="dropdown-item fontEnglish" href="http://localhost/logout.member">Log Out</a></li>
											</ul></li>
									</c:otherwise>
								</c:choose>



								<script type="text/javascript">
									console.log("${loginID }")
								</script>
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
					<div class="col-2">
						<p class="text-white fontKorean d-flex justify-content-center">순위</p>
					</div>
					<div class="col-8 col-md-5">
						<p class="text-white fontKorean">게임 정보</p>
					</div>
					<div class="col-3 d-none d-md-flex">
						<p class="text-white fontKorean">플레이 정보</p>
					</div>
					<div class="col-2">
						<p class="text-white fontKorean">게임 바로가기</p>
					</div>
					<hr class="colorWhite">
				</div>
				<!-- <div class="row d-flex justify-content-center align-items-center">
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
				</div> -->
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