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
        *{
            box-sizing: border-box;
        }
        .test{
            background-color: white;
            width: 300px;
            height: 200px;
            border-radius : 3%;
        }
		.gameContainer {
			max-width: 1300px;
			margin: auto;
		}
        a{
			text-decoration: none;
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
/* <div class="col-xs-12 col-lg-6 col-xl-4"> */
	window.onload = function(){
		let isNew = "${category}";
		if(isNew != "New"){
			$.ajax({
				url:"/getCategoryGame.game",
	    	      data:{
	        	        category:"${category}"
	        	      },
	        	      type:"post"
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
					
					$("#showGames").append(divCol);
				}
			});	
		}else{
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
					
					$("#showGames").append(divCol);				
				}
			});
		}
		
		let category = '${category}';
		if(category == 'New'){
			$("#new").addClass("active");
		}else if(category == 'Rhythm'){
			$("#rhy").addClass("active");
		}else if(category == 'Arcade'){
			$("#arc").addClass("active");
		}else if(category == 'Puzzle'){
			$("#puz").addClass("active");
		}
	};
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
								</script>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
		
    <div class="container-fluid bColorBlack g-0">
        <div class="gameContainer">
            <div class="row g-0 mr45">
                <div class="col-2 d-flex justify-content-center">
                    <div class="row g-0">
                        <div class="col-12 mt-5">
                            <div class="btn-group-vertical" role="group"
									aria-label="Vertical button group">
									<button type="button" class="btn btn-dark bColorBlack" id="new"><span class="fontKorean text-white">최신게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="rhy"><span class="fontKorean text-white">리듬게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="arc"><span class="fontKorean text-white">아케이드게임</span></button>
									<button type="button" class="btn btn-dark bColorBlack" id="puz"><span class="fontKorean text-white">퍼즐게임</span></button>
							</div>
                        </div>
                    </div>
                </div>
                <div class="col-10">
                    <div class="row g-0 mt-4 mb-5 mxConWidth" id="showGames">
                        <p class="categories fs-2 text-white">
                        	<c:choose>
								<c:when test="${category == 'Rhythm' }">리듬 게임</c:when>
								<c:when test="${category == 'Arcade' }">아케이드 게임</c:when>
								<c:when test="${category == 'Puzzle' }">퍼즐 게임</c:when>
							</c:choose>
                        </p>
    
                        
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
		$("#new").on("click", function() {
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