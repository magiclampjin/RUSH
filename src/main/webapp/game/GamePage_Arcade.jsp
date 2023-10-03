<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/common/style.jsp"%>


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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js"
	integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/css/game/game.css" />

<c:choose>
	<c:when test="${game eq 'Flappy Bird' }">
		<!-- Flappy Bird js 파일 -->
		<script src="game/js/flappy_bird_scene.js" type="text/javascript"></script>
	</c:when>
	<c:when test="${game eq 'Doodle Jump' }">
		<!-- Doodle Jump css 및 js 파일 -->
		<script src="/game/doodle/js/StartScene.js"></script>
		<script src="/game/doodle/js/SettingScene.js"></script>
		<script src="/game/doodle/js/GameScene.js"></script>
		<script src="/game/doodle/js/GameOver.js"></script>
		<script src="/game/doodle/js/gameRecord.js"></script>
		<link rel="stylesheet" href="game/doodle/css/doodle.css">
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
	min-width: 579px;
	max-width: 1030px;
	width: 100%;
	height: 579px;
	background-color: white;
	margin: auto;
}

#container {
	margin: auto;
	width: 288px;
	height: 512px;
}

a {
	text-decoration: none;
}

.gameContainer {
	max-width: 1300px;
	margin: auto;
}
.mb50{
	margin-bottom : 50px!important;
}

.rankCon {
	max-width: 1030px;
	width: 100%;
}

.devTable th, td {
	border: 1px solid white;
	vertical-align: middle;
	padding: 3px;
}

.devTable th {
	width: 20%;
}

.devTable td {
	width: 80%;
}

.devTable {
	border: 1px solid white;
	width: 100%;
}

.btn-check-input:checked ~.btn.btn-outline-light::before {
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
	opacity: 70%;
}

.btn.active {
	background-color: #f393ff;
	border-color: #F9F9F9;
}

.recordPost {
	position: relative;
}

.h80 {
	height: 80px;
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

.pl20 {
	padding-left: 20px;
}

#btnradio1:checked+.btn {
	color: white;
	background-color: #5D6CE1;
}

#btnradio2:checked+.btn {
	color: white;
	background-color: #F393FF;
}

.doodleKeyImg {
	display: flex;
	align-items: center;
}

.doodleKeyImg>img {
	width: 300px;
}

.mt30 {
	margin-top: 30px;
}

@media ( max-width : 786px) {
	.doodleKeyImg {
		flex-direction: column;
		align-items: start;
	}
	.doodleKeyImg>p {
		margin-top: 10px;
		width: 300px;
		text-align: center;
	}
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
				console.log("active");
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
			console.log(record);
			console.log(record[0]["nickName"]);
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
				divInfoRight.addClass("col-9 text-white align-self-center");
								
				let divColScore = $("<div>");
				divColScore.addClass("col-2 text-white fontEnglish fw500 fs-4 align-self-center pl20");
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
			<%@ include file="/common/header.jsp"%>
		</div>

		<div class="container-fluid g-0 bColorBlack">
			<div class="gameContainer">
				<div class="row g-0">
					<div class="col-2 d-flex justify-content-center">
						<div class="row g-0">
							<div class="col-12 mt-5">
								<div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn btn-dark bColorBlack" id="new">
										<span class="fontKorean text-white">최신게임</span>
									</button>
									<button type="button" class="btn btn-dark bColorBlack" id="rhy">
										<span class="fontKorean text-white">리듬게임</span>
									</button>
									<button type="button" class="btn btn-dark bColorBlack" id="arc">
										<span class="fontKorean text-white">아케이드게임</span>
									</button>
									<button type="button" class="btn btn-dark bColorBlack" id="puz">
										<span class="fontKorean text-white">퍼즐게임</span>
									</button>
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

						<c:choose>
							<c:when test="${game == 'Flappy Bird'}">
								<div class="row g-0">
									<div class="col-10">
										<p class="gameName fs-2 mt-0 text-white fontKorean">${game}</p>
									</div>
									<div
										class="col-2 d-flex justify-content-center align-content-bottom">
										<div>
											<button type="button" class="btn btn-outline-light"
												id="favorite">
												<i class="fa-regular fa-star colorWhite"></i> 즐겨찾기
											</button>
											<!-- <button type="button" class="btn btn-outline-light active" style="display:none" id="delfavorite">
										<i class="fa-regular fa-star colorWhite"></i>
										즐겨찾기
									</button> -->
										</div>
									</div>
									<hr class="colorPink border-3 opacity-100">
								</div>
								<div class="row g-0">
									<div id="container" class="col-12 mb50">
										<script>
									        let option = {
									            type:Phaser.AUTO,
									            parent:"container",
									            width:"100%",
									            height:"100%",
									            physics:{
									                default:"arcade",
									                arcade:{
									                    gravity:{
									                        y:300
									                    },
									                    debug:false
									                }
									            },
									            scene:{
									                preload: preload,
									                create: create,
									                update: update
									            }
									        };
									
									        let game = new Phaser.Game(option);
									    </script>
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
											<div id="rankCon"></div>
										</div>
									</div>
									<div class="col-12" id="info">
										<div class="row g-0 w100p">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">게임 설명</p>
												<hr class="colorBlue border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">파이프 사이를 무사히 통과해야 하는 짹짹이의 모험</p>
											</div>
										</div>
										<div class="row g-0 w100p mt150">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">조작 방법</p>
												<hr class="colorGreen border-3 opacity-75">
											</div>
											<div class="col-12">
												<image src="/game/assets/upkey.png" style="width:5%"></image>
												<image src="/game/assets/mouse.png" style="width:5%"></image>
												<p class="text-white fontKorean">위쪽 화살표 키보드 또는 마우스 좌클릭으로 점프</p>
											</div>
										</div>
							</c:when>
							<c:when test="${game == 'Doodle Jump'}">
								<div class="row g-0">
									<div class="col-10">
										<p class="gameName fs-2 mt-0 text-white fontKorean">${game}</p>
									</div>
									<div
										class="col-2 d-flex justify-content-center align-content-bottom">
										<div>
											<button type="button" class="btn btn-outline-light"
												id="favorite">
												<i class="fa-regular fa-star colorWhite"></i> 즐겨찾기
											</button>
											<!-- <button type="button" class="btn btn-outline-light active" style="display:none" id="delfavorite">
										<i class="fa-regular fa-star colorWhite"></i>
										즐겨찾기
									</button> -->
										</div>
									</div>
									<hr class="colorPink border-3 opacity-100">
								</div>
								<div class="row g-0">
									<div id="container" class="col-12 mb50"
										style="width: 360px; height: 650px;">
										<input type="hidden" id="soundSetting" value="false">
										<input type="hidden" id="score" value="0"> <input
											type="hidden" id="gameOver" value="false">
										<script>
										let option = {
									            type: Phaser.AUTO,
									            parent: "container",
									            width: "100%",
									            height: "100%",
									            physics: {
									                default: "arcade",
									                arcade: {
									                    gravity: { y: 0 },
									                    debug: false
									                }
									            },
									            scene: [StartScene, SettingScene, GameScene, GameOver],
									            fps: {
									                target: 60, // 원하는 FPS 설정 (기본값은 60)
									                forceSetTimeOut: true // 브라우저 지원이 안 되는 경우에 setTimeout 사용
									            }
									        };

									        let game = new Phaser.Game(option);
									        if ($("#gameOver").val()=="true") {
									        	console.log("게임 기록 저장")
									    		$.ajax({
									    			url: "/setGameRecord.game",
									    			data: {
									    				game: 'Doodle Jump',
									    				score: $("#score").val()
									    			},
									    			dataType: "json",
									    			type: "post"
									    		})

									    	}
									    </script>
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
											<div id="rankCon"></div>
										</div>
									</div>
									<div class="col-12" id="info">
										<div class="row g-0 w100p">
											<div class="col-12">
												<p class="text-white fontKorean fs-2">게임 설명</p>
												<hr class="colorBlue border-3 opacity-75">
											</div>
											<div class="col-12">
												<p class="text-white fontKorean">
													Doodle Jump는 한 플랫폼에서 다음 플랫폼으로 점프하는 모험 게임입니다.<br>Doodle이
													바닥으로 낙하하지 않고 높이 올라갈 수 있도록 제어해주세요.<br>이 게임에는 정해진 끝이
													없습니다. Doodle이 최대한 높이 날아오를 수 있도록 모험을 떠나보세요!
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
													<div class="doodleKeyImg">
														<img src="/game/doodle/imgs/DoodleJumpKey1.png">
														<p class="text-white">&nbsp;&nbsp;&nbsp;&nbsp;or&nbsp;&nbsp;&nbsp;&nbsp;</p>
														<img src="/game/doodle/imgs/DoodleJumpKey2.png">
													</div>

													<div class="text-white fontKorean mt30">
														키보드에 있는 좌우 방향키 또는 A, D키를 이용하여 Doodle을 좌우로 움직일 수 있습니다.<br>Doodle의
														방향을 한번 전환하면 계속해서 같은 방향으로 점프하니 주의하세요.

													</div>
												</div>
												</p>

											</div>
										</div>
							</c:when>
							<c:otherwise>
								<div class="row g-0">
									<div class="col-10">
										<p class="gameName fs-2 mt-0 text-white fontKorean">${game}</p>
									</div>
									<div
										class="col-2 d-flex justify-content-center align-content-bottom">
										<div>
											<button type="button" class="btn btn-outline-light"
												id="favorite">
												<i class="fa-regular fa-star colorWhite"></i> 즐겨찾기
											</button>
											<!-- <button type="button" class="btn btn-outline-light active" style="display:none" id="delfavorite">
										<i class="fa-regular fa-star colorWhite"></i>
										즐겨찾기
									</button> -->
										</div>
									</div>
									<hr class="colorPink border-3 opacity-100">
								</div>
								<div class="row g-0">
									<div class="col-12 game mb50">play ground</div>
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
											<div id="rankCon"></div>
										</div>
									</div>
									<div class="col-12" id="info">
										<div class="row g-0 w100p">
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
							</c:otherwise>
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

	</div>
	<div class="container-fluid g-0">
		<div class="footer bColorBlack">
			<%@include file="/common/footer.jsp"%>
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
        	$.ajax({
    			url:"/getRecord.game",
    			data:{
    				gameName:"${game}"
    			},
    			type : "post"
    		}).done(function(res){
    			let record = JSON.parse(res);
    			console.log(record);
    			console.log(record[0]["nickName"]);
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
    				divInfoRight.addClass("col-9 text-white align-self-center");
    								
    				let divColScore = $("<div>");
    				divColScore.addClass("col-2 text-white fontEnglish fw500 fs-4 align-self-center pl20");
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
        		console.log("로그인했음.");
        		if($(this).hasClass("active") == true){
            		console.log("존재");
            		$.ajax({
              	      url:"/deletefavorite.game",
              	      data:{
              	        mID:"${loginID}",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨. */
              	        gameName:'${game}'
              	      },
              	      type:"post"
              	    }).done(function (res){
              	      console.log(res);
              	      location.reload();
              	      $(".fa-star").addClass("colorWhite");
              	    });
            	}else{
            		console.log("x");
            		$.ajax({
              	      url:"/favorite.game",
              	      data:{
              	        mID:"${loginID}",   /* 추후 이거 아이디 어디서 끌어오는지 확인하고 수정해야됨.*/ 
              	        gameName:'${game}'
              	      },
              	      type:"post"
              	    }).done(function (res){
              	      console.log(res);
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
                console.log(res);
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
