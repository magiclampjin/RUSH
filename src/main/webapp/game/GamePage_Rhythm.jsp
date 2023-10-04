<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH // ${game}</title>
<%@ include file="/common/style.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/game/game.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="/css/game/game.css"/>
<script src="//cdn.jsdelivr.net/npm/phaser@3.60.0/dist/phaser.js"></script>
<script src="/game/js/rhythm.js?ver=2"></script>
<script src="/game/js/Rhythm_Main_Scene.js?ver=1"></script>
<script src="/game/js/GameoverScene.js?ver=2"></script>
<style>
* {
	box-sizing: border-box;
}

.test {
	background-color: white;
	width: 300px;
	height: 200px;
}
.mt50{
	margin-top : 50px!important;
}
#game {
	min-width : 579px;
	max-width: 1030px;
	width: 750px;
	height: 750px;
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
.border .border-primary{
	color : #F393FF;
	background-color : #F393FF;
}

.recordPost {
	position: relative;
}
.h80{
	height : 80px;
}

.recordPost:before {
  content: "";
  position: absolute;
  top: 15px;
  width: 5px;
  height: 50px;
  background: #ccf423;
}
.line {
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
.mb50{
	margin-bottom : 50px;
}
.pd20{
	padding-left : 20px!important;
	padding-right : 20px!important;
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
				//divRow.append(divColScore);
				
				
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
	}
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
							<div class="col-12 mb50">
								<div id="game">
									
								</div>
								<script>
							        let option = {
							            type:Phaser.AUTO,
							            parent : "game",
							            width : "100%",
							            height : "100%",
							            physics : {
							                default : "arcade",
							                arcade : {
							                    gravity : {y:0},
							                    debug : false
							                }
							            },
							            scene:[Rhythm_Main_Scene,rhythm,GameoverScene]
							        };
							        let game = new Phaser.Game(option);
							    </script>								
							</div>
						</div>
						<div class="row g-0 mt49">
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
						<div class="row g-0 mt49">
							<div class="col-12" id="rank">
								<div class="rankCon">
								<div class="line col"></div>
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
								<div class="line col"></div>
									<div id="rankCon">
									</div>
								</div>
							</div>
							<div class="col-12 pd20" id="info">
								<div class="row g-0 w100p mt50">
									<div class="col-12">
										<p class="text-white fontKorean fs-2">게임 설명</p>
										<hr class="colorBlue border-3 opacity-75">
									</div>
									<div class="col-12">
										<p class="text-white fontKorean">
											리듬에 맞춰 내려오는 노트를 제거하는 게임입니다.
										</p>
									</div>				
								</div>
								<div class="row g-0 w100p mt150">
									<div class="col-12">
										<p class="text-white fontKorean fs-2">조작 방법</p>
										<hr class="colorGreen border-3 opacity-75">
									</div>
									<div class="col-12">
										<img src="/game/img/key.png" />
										
										<p class="text-white fontKorean">
											키보드의 A S K L 키를 사용합니다.
										</p>
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

		</div>
		<div class="container-fluid g-0">
			<%@include file="/common/footer.jsp"%> 
		<script>
		$("#rank").css("display","flex");
		$("#rank").css("justify-content","center");
		$("#info").css("display","none");
        $(".btn").on("click",function(){
            // $(".categories").text();
        });
        
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
    				//divRow.append(divColScore);
    				
    				
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
              	        mID:"${loginID}",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨. */
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
              	        mID:"${loginID}",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨.*/ 
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
    	
    	function setRecord(userScore){
    		$.ajax({
                url:"/setGameRecord.game",
                data:{
                  game:'${game}',
                  score : userScore
                },
                type:"post"
              }).done(function (res){
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
    				//divRow.append(divColScore);
    				
    				
    				$("#rankCon").append(divRow);
    			}
              });
    	}
    </script>
</body>
</html>
