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

<c:choose>
	<c:when test="${game eq 'Kordle' }">
		<!-- 한글 자모 분리 및 조합 & kordle js 파일 -->
		<script src="https://unpkg.com/hangul-js" type="text/javascript"></script>
		<script src="/game/js/kordleGame.js"></script>
	</c:when>
	<c:when test="${game eq 'Candy Crush' }">
		<!-- Candy Crush css 및 js 파일 -->
		<link rel="stylesheet" href="/game/css/candy.css">
		<script src="/game/js/candy.js"></script>
	</c:when>
</c:choose>

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
.btn-dark {
    background-color: #131217;
    border-color: #F9F9F9;
}

.btn-dark:hover {
    background-color: #f393ff;
    border-color: #F9F9F9;
    opacity:70%;
}
.btn.active{
	background-color: #f393ff;
	border-color: #F9F9F9;
}

#gameContainer {
    margin: auto;
    width: 500px;
}

.containerInputs {
    width: 600px;
    margin: 50px auto;
}

#gameBoard {
    margin-top: 10px;
    position:relative;
    margin:auto;
}

.cell {
    height: 78px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    background-color: lightblue;
    border: 3px solid white;
    color: white;
    font-size: xx-large;
    font-weight: bold;
}

#inputBoard {
    margin-top: 20px;
    /* border:1px solid black; */
    justify-content: center;
}


.inputLine {
    display: flex;
    align-items: center;
    justify-content: center;
}

.line1 .input {
    width: 8.5%;
    height: 70px;
    border: 0px;
    background-color: lightgray;
    font-size: large;
    font-weight: bold;
    margin: 0px 3px 10px 3px;
}

.line2 .input {
    width: 8.5%;
    height: 70px;
    border: 0px;
    background-color: lightgray;
    font-size: large;
    font-weight: bold;
    margin: 0px 3px 10px 3px;
}

.line3 .input {
    width: 8.5%;
    height: 70px;
    border: 0px;
    background-color: lightgray;
    font-size: large;
    font-weight: bold;
    margin: 0px 3px 10px 3px;
}

.line3 .btns {
    width: 14%;
}

.input:hover {
    background-color: rgba(211, 211, 211, 0.473);
}

.covers {
	background-color:#00000099;
	position:absolute;
	z-index:1;
	width:100%;
	height:100%;
	border-radius:10px;
	color:white;
	display:flex;
	align-items:center;
	justify-content:center;
	font-size:xx-large;
	font-weight:bold;
	text-align:center;
}
     
#endCover{
	display:none;
}

.gameStartBnts{
	padding:13px 25px;
	background-color: #00000000;
	color: lightblue;
	border:3px solid white;
	
	border-radius:15px;
}

.gameStartBnts:hover{
	background-color: lightblue;
	color:white;
	border:3px solid lightblue;
	transition-duration: 1s;
}

.fw900 {
	font-weight: 900;
}

.ft30{
	font-size:35pt;
}
.recordPost {
	position: relative;
}

.recordPost:before {
  content: "";
  position: absolute;
  top: 15px;
  width: 5px;
  height: 50px;
  background: #ccf423;
}
.lineinfo {
    border: 1px solid #FFFFFF;
    width: 100%;
    margin: auto;
    margin-top: 20px;
    margin-bottom: 20px;
}
.pl20{
	padding-left : 20px;
}
#btnradio1:checked+.btn{
	color : white;
	background-color : #5D6CE1;
}
#btnradio2:checked+.btn{
	color : white;
	background-color : #F393FF;
}
.h80{
	height : 80px;
}

.mb30{
	margin-bottom: 30px !important;
}

.kordleDescImg{
	width:500px !important;
}
.mb50{
	margin-bottom : 50px!important;
}

</style>
</head>
<body>
<script>
	$(document).ready(function() {
		$.ajax({
			url:"/checkFavorite.game",
			data:{
				game:"${game}",
				mID : "${loginID}"
			},
			type : "post"
		}).done(function(res){
			let isFavorite = res;
			if(isFavorite == 1){
				$("#favorite").addClass("active");
				$(".fa-star").removeClass("colorWhite");
			}else{
				
			}
		});
		$.ajax({
			url:"/getRecord.game",
			data:{
				gameName:"${game}"
			},
			type : "post"
		}).done(function(res){
			let record = JSON.parse(res);
			$("#rankCon").text("");
			for(let i=0; i<record.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0 p-2");
				let divColRank = $("<div>");
				if(i<3){
    				divColRank.addClass("col-1 colorPink fw900 fontEnglish fs-3 align-self-center");
    				divColRank.append(i+1);
				}else{
    				divColRank.addClass("col-1 text-white fw900 fontEnglish fs-3 align-self-center");
    				divColRank.append(i+1);	
				}

								
				let divColInfo = $("<div>");
				divColInfo.addClass("col-11");
				
				let divRowInfo = $("<div>");
				divRowInfo.addClass("row g-0 p-1 recordPost h80");
				if(i%2==0){
					divRowInfo.addClass("bcolorDarkgray30");
					divRowInfo.css({
						borderRadius : "10px"
					});	
				}
				
				let divInfoLeft = $("<div>");
				divInfoLeft.addClass("col-1 align-self-center");
				let divInfoRight = $("<div>");
				divInfoRight.addClass("col-8 text-white align-self-center");
								
				let divColScore = $("<div>");
				divColScore.addClass("col-3 text-white fontEnglish fw500 fs-4 align-self-center pl20");
				divColScore.append(record[i]["score"]+" 점");
				
				
				
				divInfoRight.append(record[i]["nickName"]);
				divInfoRight.append(" Lv : "+record[i]["level"]);
				divRowInfo.append(divInfoLeft);
				divRowInfo.append(divInfoRight);
				divRowInfo.append(divColScore);
				divColInfo.append(divRowInfo);
				
				
				
				divRow.append(divColRank);
				divRow.append(divColInfo);		
				$("#rankCon").append(divRow);
			}
		});
		let category = '${category}';
		if(category == 'new'){
			$("#new").addClass("active");
		}else if(category == 'Rhythm'){
			$("#rhy").addClass("active");
		}else if(category == 'Arcade'){
			$("#arc").addClass("active");
		}else if(category == 'Puzzle'){
			$("#puz").addClass("active");
		}
	});
</script>
	<div class="container-fluid g-0">
		<div class="header bColorBlack">
			<%@ include file="/common/header.jsp" %>
		</div>
		
		<div class="container-fluid g-0 bColorBlack">
			<div class="gameContainer">
				<div class="row g-0">
					<div class="col-2 d-flex justify-content-center">
						<div class="row g-0">
							<div class="col-12 mt-5">
								<div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn btn-dark bColorBlack" id="new"><span class="fontKorean text-white">최신게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="rhy"><span class="fontKorean text-white">리듬게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="arc"><span class="fontKorean text-white">아케이드게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="puz"><span class="fontKorean text-white">퍼즐게임</span></button>
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
								</div>
							</div>
							<hr class="colorPink border-3 opacity-100">
						</div>
						<div class="row g-0">
							<div class="col-12 game mb50">
							<c:choose>
								<c:when test="${game eq 'Kordle'}">
									<div id="gameContainer"></div>
								</c:when>
								<c:when test="${game eq 'Candy Crush'}">
									<div id="scoreBox">
										<h2 class="fontKorean">점수 : <span id="score">0</h2>
										<h4 class="fontKorean">
											제한 시간 <span id="time">30</span>
										</h4>
									</div>
									<div id="container">
										<div id="overlay">
											<div class="button_container">
												<button class="btnCandy" id="btnStart">
													<span>시작하기</span>
												</button>
												<button class="btnCandy" id="btnRestart">
													<span>다시하기</span>
												</button>
												<h3>
													<span class="md-fontEnglish" id="timeover">Time Over</span>
												</h3>
											</div>
										</div>
										<div id="boardCandy"></div>
									</div>
								</c:when>
							</c:choose>
							</div>
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
							
						</div>
						<div class="row g-0 mt49">
							<div class="col-12" id="rank">
								<div class="rankCon">
								<div class="lineinfo col"></div>
									<div class="row g-0 p-2">
										<div class="col-1">
										<span class="text-white fontKorean">순위</span>
										</div>
										<div class="col-9">
											<span class="text-white fontKorean">유저 정보</span>
										</div>
										<div class="col-2">
											<span class="text-white fontKorean">점수</span>
										</div>
									</div>
								<div class="lineinfo col"></div>
									<div id="rankCon">
									</div>
								</div>
							</div>
							
							
							<c:choose>
								<c:when test="${game eq 'Kordle' }">
									<!--  kordle 게임 설명 -->
									<div class="col-12" id="info">
										<div class="row g-0 w100p">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">게임 설명</p>
												<hr class="colorBlue border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">여섯 개의 자음 모음으로 분리된 단어를 맞춰보세요.<br>실제로 존재하는 단어만 입력할 수 있습니다.<br>기회는 6번이며, 실제 키보드 자판 또는 게임 화면 속 키보드 자판을 이용해 입력이 가능합니다.</p>
											</div>				
										</div>
										<div class="row g-0 w100p mt150">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">조작 방법</p>
												<hr class="colorGreen border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">
													<div class="mb30">
														<img src="/img/kordlekeyboard.png" class="kordleDescImg">
														<div class="text-white fontKorean">키보드를 이용해 단어를 입력할 수 있습니다. 쌍자음 또는 이중모음은 단모음 또는 단자음으로 변환해 입력해주세요.<br>오입력 시 backspace 키를 입력해 지울 수 있으며, Enter 키 입력 시 입력이 완료됩니다.</div>
													</div>
													<div class="mb30">
														<img src="/img/kordlekeyboard2.png" class="kordleDescImg">
														<div class="text-white fontKorean">게임 화면 내 키보드를 눌러 단어를 입력할 수 있습니다. 쌍자음 또는 이중모음은 단모음 또는 단자음으로 변환해 입력해주세요.<br>오입력 시 지우기 버튼을 눌러 지울 수 있으며, 확인 버튼을 클릭하면 입력이 완료됩니다.</div>
													</div>
													<div class="mb30">
														<img src="/img/kordleExp.PNG" class="kordleDescImg">
														<div class="text-white fontKorean">Enter 키 혹은 확인 버튼을 눌러 단어 입력 시, 화면에 결과가 표시됩니다.<br>존재하지 않는 자모는 회색, 존재하지만 자리가 틀린 자모는 주황색, 자리까지 맞춘 단어는 초록색으로 표시됩니다.</div>			
													</div>
												</p>
											</div>				
										</div>
									</div>
								</c:when>
								<c:when test="${game eq 'Candy Crush' }">
									<!-- Candy Crush 게임 설명 -->
									<div class="col-12" id="info">
										<div class="row g-0 w100p">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">게임 설명</p>
												<hr class="colorBlue border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">
													30초라는 제한 시간 내에 가장 많은 캔디를 크러쉬 해주세요
												</p>
											</div>				
										</div>
										<div class="row g-0 w100p mt150">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">조작 방법</p>
												<hr class="colorGreen border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">
													<div class="mb30">
														<img src="/game/images/Candy1.png">
														<span class="text-white fontKorean">가로, 세로로 3개 이상 같은 캔디를 맞춰주세요.</span>
													</div>
													<div class="mb30">
														<img src="/game/images/Candy2.png">
														<span class="text-white fontKorean">캔디가 터질 때마다 30점씩 획득할 수 있습니다.</span>
													</div>
												</p>
											</div>				
										</div>
									</div>
								</c:when>
							</c:choose>
							
							
							
							<div class="row g-0 w100p mt150">
								<div class="col-12">
									<p class="text-white fontKorean fs-2">제작자 정보</p>
									<hr class="colorPink border-3 opacity-75">
								</div>
								<div class="col-12">
									<table class="devTable">
										<tr>
											<th class="text-white fontKorean fw900">제작자</th>
											<td class="text-white fontKorean">${dev}</td>
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
		<div class="container-fluid g-0">
			<div class="footer bColorBlack">
		<%@include file="/common/footer.jsp"%>
		</div>
		<script>
		$("#rank").css("display","flex");
		$("#rank").css("justify-content","center");
		$("#info").css("display","none");
        
        $("#btnradio1").on("click",function(){
        	$("#rank").css("display","flex");
        	$("#rank").css("justify-content","center");
        	$("#info").css("display","none");
        	$.ajax({
    			url:"/getRecord.game",
    			data:{
    				gameName:"${game}"
    			},
    			type : "post"
    		}).done(function(res){
    			let record = JSON.parse(res);
    			$("#rankCon").text("");
    			for(let i=0; i<record.length; i++){
    				let divRow = $("<div>");
    				divRow.addClass("row g-0 p-2");
    				let divColRank = $("<div>");
    				if(i<3){
        				divColRank.addClass("col-1 colorPink fw900 fontEnglish fs-3 align-self-center");
        				divColRank.append(i+1);
    				}else{
        				divColRank.addClass("col-1 text-white fw900 fontEnglish fs-3 align-self-center");
        				divColRank.append(i+1);	
    				}

    								
    				let divColInfo = $("<div>");
    				divColInfo.addClass("col-11");
    				
    				let divRowInfo = $("<div>");
    				divRowInfo.addClass("row g-0 p-1 recordPost h80");
    				if(i%2==0){
    					divRowInfo.addClass("bcolorDarkgray30");
    					divRowInfo.css({
    						borderRadius : "10px"
    					});	
    				}
    				
    				let divInfoLeft = $("<div>");
    				divInfoLeft.addClass("col-1 align-self-center");
    				let divInfoRight = $("<div>");
    				divInfoRight.addClass("col-8 text-white align-self-center");
    								
    				let divColScore = $("<div>");
    				divColScore.addClass("col-3 text-white fontEnglish fw500 fs-4 align-self-center pl20");
    				divColScore.append(record[i]["score"]+" 점");
    				
    				
    				
    				divInfoRight.append(record[i]["nickName"]);
    				divInfoRight.append(" Lv : "+record[i]["level"]);
    				divRowInfo.append(divInfoLeft);
    				divRowInfo.append(divInfoRight);
    				divRowInfo.append(divColScore);
    				divColInfo.append(divRowInfo);
    				
    				
    				
    				divRow.append(divColRank);
    				divRow.append(divColInfo);
    				
    				$("#rankCon").append(divRow);
    			}
    		});
        });
        
        $("#btnradio2").on("click",function(){
        	$("#info").css("display","block");
        	$("#rank").css("display","none");
        });
        
        $("#favorite").on("click",function(){
        	let id = '${loginID}';
        	if(id != ""){
        		if($(this).hasClass("active") == true){
            		$.ajax({
              	      url:"/deletefavorite.game",
              	      data:{
              	        mID:"${loginID}",
              	        gameName:'${game}'
              	      },
              	      type:"post"
              	    }).done(function (res){
              	      location.reload();
              	      $(".fa-star").addClass("colorWhite");
              	    });
            	}else{
            		$.ajax({
              	      url:"/favorite.game",
              	      data:{
              	        mID:"${loginID}",
              	        gameName:'${game}'
              	      },
              	      type:"post"
              	    }).done(function (res){
              	      location.reload();
              	    });
            	}
        	}else{
        		alert("로그인을 해야합니다.");
        	}
        	
        });
        $("#favorite").hover(function(){
        	if(!$(this).hasClass("active")){
        		$(".fa-star").removeClass("colorWhite");	
        	}
        }, function() {
        	if(!$(this).hasClass("active")){
        		$(".fa-star").addClass("colorWhite");	
        	}
        });
        $("#new").on("click",function(){
        	location.href = "/game/GamePage_Main.jsp";
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
    	
    </script>
</body>
</html>
