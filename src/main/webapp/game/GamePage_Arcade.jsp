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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/phaser/3.60.0/phaser.min.js"
	integrity="sha512-YQL0GVx/Too3vZjBl9plePRIYsRnd1s8N6QOvXPdZ+JMH2mtRTLQXGUDGjNW6zr1HUgcOIury67IvWe91oeEwQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/css/game/game.css" />
<script src="game/js/flappy_bird_scene.js" type="text/javascript"></script>
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
	margin-top: 150px;
}

a {
	text-decoration: none;
}

.gameContainer {
	max-width: 1300px;
	margin: auto;
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
    opacity:70%;
}
.btn.active{
	background-color: #f393ff;
	border-color: #F9F9F9;
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
			console.log(isFavorite);
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
				divColInfo.addClass("col-7");
				
				let divRowInfo = $("<div>");
				divRowInfo.addClass("row g-0");
				let divInfoLeft = $("<div>");
				divInfoLeft.addClass("col-3");
				let divInfoRight = $("<div>");
				divInfoRight.addClass("col-9 text-white align-self-center");
				let divUserImage = $("<div>");
				divUserImage.css({
					width : "80px",
					height : "80px",
					backgroundColor : "white",
					borderRadius : "50%"
				});
				
				
				divInfoLeft.append(divUserImage);
				divInfoRight.append(record[i]["nickName"]);
				divInfoRight.append(" Lv : "+record[i]["level"]);
				divRowInfo.append(divInfoLeft);
				divRowInfo.append(divInfoRight);
				divColInfo.append(divRowInfo);
				
				let divColScore = $("<div>");
				divColScore.addClass("col-4 text-white fontEnglish fw500 fs-4 align-self-center");
				divColScore.append(record[i]["score"]);
				
				divRow.append(divColRank);
				divRow.append(divColInfo);
				divRow.append(divColScore);
				
				
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
										<li><a class="dropdown-item fontEnglish"
											href="http://localhost/game/GamePage_Main.jsp">Main</a></li>
										<li><a class="dropdown-item fontEnglish"
											href="http://localhost/game/GamePage_BestGame.jsp">BestGame</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish"
									href="http://localhost/board/awards.jsp"> AWARDS </a></li>
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
										<li><a class="dropdown-item"
											href="http://localhost/board/awards.jsp">명예의 전당</a></li>
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
											data-bs-toggle="dropdown" aria-expanded="false"> MYPAGE </a>
											<ul class="dropdown-menu p-0"
												aria-labelledby="navbarDropdownMenuLink">
												<li><a class="dropdown-item fontEnglish" href="#">MyPage</a></li>
												<li><a class="dropdown-item fontEnglish"
													href="http://localhost/logout.member">Log Out</a></li>
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
									<hr class="border border-primary border-3 opacity-75">
								</div>
								<div class="row g-0">
									<div id="container" class="col-12">
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
								<div class="row g-0 mt49">
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
    				divColInfo.addClass("col-7");
    				
    				let divRowInfo = $("<div>");
    				divRowInfo.addClass("row g-0");
    				let divInfoLeft = $("<div>");
    				divInfoLeft.addClass("col-3");
    				let divInfoRight = $("<div>");
    				divInfoRight.addClass("col-9 text-white align-self-center");
    				let divUserImage = $("<div>");
    				divUserImage.css({
    					width : "80px",
    					height : "80px",
    					backgroundColor : "white",
    					borderRadius : "50%"
    				});
    				
    				
    				divInfoLeft.append(divUserImage);
    				divInfoRight.append(record[i]["nickName"]);
    				divInfoRight.append(" Lv : "+record[i]["level"]);
    				divRowInfo.append(divInfoLeft);
    				divRowInfo.append(divInfoRight);
    				divColInfo.append(divRowInfo);
    				
    				let divColScore = $("<div>");
    				divColScore.addClass("col-4 text-white fontEnglish fw500 fs-4 align-self-center");
    				divColScore.append(record[i]["score"]);
    				
    				divRow.append(divColRank);
    				divRow.append(divColInfo);
    				divRow.append(divColScore);
    				
    				
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
    	
    </script>
</body>
</html>
