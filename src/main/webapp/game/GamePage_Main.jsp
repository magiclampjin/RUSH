<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> RUSH </title>
<%@ include file="/common/style.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/game/game.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/game/game.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
* {
	box-sizing: border-box;
}

a{
	text-decoration: none;
}

div {
	border: 0px solid black;
}

.container {
	border: 1px solid black;
	position: relative;
}

.test {
	background-color: white;
	max-width: 300px;
	max-height: 200px;
	width : 100%;
	height : 100%;
	border-radius : 3%;
	margin-bottom: 10px;
}

.gameContainer {
	max-width: 1300px;
	margin: auto;
}

</style>
</head>
<body>
<script>
	window.onload = function(){
		$.ajax({
			url:"/getGameList.game",
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divCol = $("<div>");
				divCol.addClass("col-xs-12 col-md-6 col-xl-4");
				
				let divAnker = $("<a>");
				divAnker.attr("href","/moveToGamePage.game?game="+data[i]["gName"]);
				
				let divImage = $("<img>");
				divImage.addClass("test");
				divImage.attr("src",data[i]["gImageURL"]);
				divAnker.append(divImage);
				
				let divName = $("<p>");
				divName.addClass("text-white");
				divName.append(data[i]["gName"]);
				
				divCol.append(divAnker);
				divCol.append(divName);
				
				$("#newGames").append(divCol);				
			}
		});
		$.ajax({
			url:"/getGameList.game",
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divCol = $("<div>");
				divCol.addClass("col-xs-12 col-md-6 col-xl-4");
				
				let divAnker = $("<a>");
				divAnker.attr("href","/moveToGamePage.game?game="+data[i]["gName"]);
				
				let divImage = $("<img>");
				divImage.addClass("test");
				divImage.attr("src",data[i]["gImageURL"]);
				divAnker.append(divImage);
				
				let divName = $("<p>");
				divName.addClass("text-white");
				divName.append(data[i]["gName"]);
				
				divCol.append(divAnker);
				divCol.append(divName);
				
				if(data[i]["gCategory"] == 'Rhythm'){
					$("#rhythmGames").append(divCol);
				}
				if(data[i]["gCategory"] == 'Arcade'){
					$("#arcadeGames").append(divCol);
				}
				if(data[i]["gCategory"] == 'Puzzle'){
					$("#puzzleGames").append(divCol);
				}
			}
		});
	};
</script>
	<div class="container-fluid p-0 g-0">
		<div class="header bColorBlack">
			<%@ include file="/common/header.jsp" %>
		</div>

		<div class="container-fluid bColorBlack">
			<div class="gameContainer">
				<div class="row g-0">
					<div class="col-2 d-flex justify-content-center">
						<div class="row g-0">
							<div class="col-12 mt-5">
								<div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn btn-dark bColorBlack active" id="new"><span class="fontKorean text-white">최신게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="rhy"><span class="fontKorean text-white">리듬게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="arc"><span class="fontKorean text-white">아케이드게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="puz"><span class="fontKorean text-white">퍼즐게임</span></button>
								</div>
							</div>
						</div>
					</div>
					<div class="col-10">
						<div class="row g-0 mt-4 p-1" id="newGames">
							<p class="fs-2 text-white fontKorean">최신게임</p>
							
							
						</div>
						<div class="row mb-5">
							<div class="col-12 d-flex justify-content-center m-">
								<button type="button" class="btn btn-primary1" id="newGamesMore">
									<span class="fontKorean">더보기</span>
								</button>
							</div>
						</div>

						<div class="row g-0 mb-5" id="rhythmGames">
							<p class="fs-2 text-white fontKorean">리듬게임</p>
							
						</div>
						<div class="row mb-5">
							<div class="col-12 d-flex justify-content-center m-">
								<button type="button" class="btn btn-primary2" id="rhythmGamesMore">
									<span class="fontKorean">더보기</span>
								</button>
							</div>
						</div>

						<div class="row g-0 mb-5" id="arcadeGames">
							<p class="fs-2 text-white fontKorean">아케이드 게임</p>
							
						</div>
						<div class="row mb-5">
							<div class="col-12 d-flex justify-content-center m-">
								<button type="button" class="btn btn-primary3" id="arcadeGamesMore">
									<span class="fontKorean">더보기</span>
								</button>
							</div>
						</div>

						<div class="row g-0 mb-5" id="puzzleGames">
							<p class="fs-2 text-white fontKorean">퍼즐게임</p>
							
						</div>
						<div class="row mb-5">
							<div class="col-12 d-flex justify-content-center m-">
								<button type="button" class="btn btn-primary1" id="puzzleGamesMore">
									<span class="fontKorean">더보기</span>
								</button>
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
			<%@include file="/common/footer.jsp"%>
		</div>
	</div>
	<script>
	
	$("#new").on("click",function(){
		let category = $("#new").children("span").text();
	});
	$("#rhy").on("click",function(){
		location.href = "/moveToCategory.game?category=Rhythm";
	});
	$("#puz").on("click",function(){
		location.href = "/moveToCategory.game?category=Puzzle";
	});
	$("#arc").on("click",function(){
		location.href = "/moveToCategory.game?category=Arcade";
	});
	
	$("#newGamesMore").on("click",function(){
		location.href = "/moveToCategory.game?category=New";
	});
	$("#rhythmGamesMore").on("click",function(){
		location.href = "/moveToCategory.game?category=Rhythm";
	});
	$("#puzzleGamesMore").on("click",function(){
		location.href = "/moveToCategory.game?category=Puzzle";
	});
	$("#arcadeGamesMore").on("click",function(){
		location.href = "/moveToCategory.game?category=Arcade";
	});
	
	</script>
</body>
</html>
