<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ include file="/common/style.jsp" %>

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
				
				$.ajax({
					url:"/getGenders.game",
					data:{
						game:data[i]["gName"]
					},
					type : "post"
				}).done(function(res){
					let gender = JSON.parse(res);
					let divPlayInfo =  $("<div>");
					divPlayInfo.addClass("col-12 d-md-none d-xs-flex text-white fontEnglish fw500");
					divPlayInfo.append("W "+gender[1]+"% M "+gender[0]+"%");
					
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
					letter2.html(gender[1]+"%&nbsp;&nbsp;");
					let letter3 = $("<span>");
					letter3.addClass("text-white fontEnglish fs-3 fw900 align-self-center");
					letter3.html("M &nbsp;");
					let letter4 = $("<span>");
					letter4.addClass("text-white fontEnglish fs-5 fw500 align-self-center");
					letter4.html(gender[0]+"% ");
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
				});
				
				$(".bestCon").append(divRow);
			}
		});
	}
</script>
	<div class="header bColorBlack">
			<%@ include file="/common/header.jsp" %>
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
		<%@include file="/common/footer.jsp"%>
		</div>
</body>
</html>
