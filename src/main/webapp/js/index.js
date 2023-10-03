$(document).ready(function() {
	$.ajax({
		url: "/bestPlayGame.game",
		dataType: "json"
	}).done(function(resp) {
		for(let i=0; i<resp.length; i++){
			let top = $("<div>").attr("class", "row g-0 pb180");

			let left = $("<div>").attr("class", "d-none col-sm-6 d-md-block");
			let borderAni = $("<div>").attr("class", "borderAni");
			let gameImg = $("<img>").attr("class", "gameImg").attr("src", resp[i].gImageURL);
				
			let right = $("<div>").attr("class", "d-none col-sm-6 d-md-block");
			let gameDesc = $("<div>").attr("class", "colorWhite fw500 fs15 d-flex align-items-center justify-content-center text-center h80 gameDesc");
			gameDesc.html(resp[i].gName+" ("+resp[i].gDeveloper+" 제작)<br><br>"+resp[i].gameDesc);
			let moveBtnCover = $("<div>").attr("class", "d-flex align-items-center justify-content-center h20");
			let moveBtn = $("<button>").html("PLAY GAME").attr("class", "gameBtns moveBestGame fontEnglish bColorPink colorWhite fw900");
			
			left.append(borderAni.append(gameImg).append($("<span>")).append($("<span>")).append($("<span>")).append($("<span>")));
			right.append(gameDesc).append(moveBtnCover.append(moveBtn).append($("<input>").attr("type","hidden").val(resp[i].gName)));
			
			if(i==0){
				top.append(left).append(right);
			} else if(i==1){
				top.append(right).append(left);
			}

			let miniTop = $("<div>").attr("class","col-12 d-md-none d-flex align-items-center justify-content-center");
			let borderAniMini = $("<div>").attr("class","borderAni");
			let gameImgMini = $("<img>").attr("src", resp[i].gImageURL);
			miniTop.append(borderAniMini.append(gameImgMini).append($("<span>")).append($("<span>")).append($("<span>")).append($("<span>")));
			
			let miniBottom = $("<div>").attr("class","col-12 d-md-none");
			let gameDescMini = $("<div>").attr("class","colorWhite fw500 fs3 d-flex align-items-center justify-content-center text-center h80 plr50 mb20");
			gameDescMini.html(resp[i].gName+" ("+resp[i].gDeveloper+" 제작)<br><br>"+resp[i].gameDesc);
			let moveBtnCoverMini = $("<div>").attr("class","d-flex align-items-center justify-content-center h20");
			let moveBtnMini=  $("<button>").html("PLAY GAME").attr("class", "gameBtnsmini moveBestGame fontEnglish bColorPink colorWhite fw900");
			
			miniBottom.append(gameDescMini).append(moveBtnCoverMini.append(moveBtnMini).append($("<input>").attr("type","hidden").val(resp[i].gName)));
			top.append(miniTop).append(miniBottom);
			$("#bestGamesList").append(top);
		}
		
	});
	
	$.ajax({
		url: "/bestBookmarkGame.game",
		dataType: "json"
	}).done(function(resp) {
		let bestBookmark = $("#bestBookmarkList");
		for(let i=resp.length-1; i>=0; i--){
			if(i==resp.length-1 || resp[i].gName != resp[i+1].gName){
				let obj = $("<div>").attr("class","col-12 col-md-4 mb80");
		
				let innerObj = $("<div>").attr("class","row g-0 mlr20");
				let title = $("<div>").attr("class","col-12 colorWhite fw900 fs30px mb20").html(resp[i].gName);
				
				let imgCover = $("<div>").attr("class","col-12 colorWhite mb20");
				let img = $("<img>").attr("src", resp[i].gImageURL).attr("class","bookmarkImg");
				imgCover.append(img);
				
				let sexRatios = $("<div>").attr("class","row g-0 d-flex sexRatios");
				let womenRatioCover = $("<div>").attr("class","col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderRight1");
				let womenRatio = $("<i>").attr("class","fa-solid fa-venus fa-xl").css("color","#ffffff");
				let menRatioCover = $("<div>").attr("class","col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderLeft1");
				let menRatio = $("<i>").attr("class","fa-solid fa-mars fa-xl").css("color","#ffffff").after("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%");
				if(resp[i].gender =="W"){
					womenRatioCover.append(womenRatio);
					womenRatioCover.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+(resp[i].genderRatio*100)+"%");
					
					if(i-1>=0 && resp[i].gName == resp[i-1].gName){
						menRatioCover.append(menRatio);
						menRatioCover.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+(resp[i-1].genderRatio*100)+"%");
					}
					else{
						menRatioCover.append(menRatio);
						menRatioCover.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0%");
					}
				}else if(resp[i].gender =="M"){
					womenRatioCover.append(womenRatio);
					womenRatioCover.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0%");
					menRatioCover.append(menRatio);
					menRatioCover.append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+(resp[i].genderRatio*100)+"%");
				}
				sexRatios.append(womenRatioCover).append(menRatioCover);

				let btnCover = $("<div>").attr("class","col-12 d-none d-md-block mb50");
				let btn = $("<button>").attr("class","fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtns moveBestBookmarkGame").html("PLAY GAME");
				btnCover.append(btn).append($("<input>").attr("type","hidden").val(resp[i].gName));
				let btnCoverMini = $("<div>").attr("class","col-12 d-md-none mb50");
				let btnMini = $("<button>").attr("class","fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtnsmini moveBestBookmarkGame").html("PLAY GAME");
				btnCoverMini.append(btnMini).append($("<input>").attr("type","hidden").val(resp[i].gName));
				
				innerObj.append(title).append(imgCover).append(sexRatios).append(btnCover).append(btnCoverMini);
				obj.append(innerObj);
				bestBookmark.after(obj);
			}
		
		}
	});
	
	
	$(document).on("click",".moveBestGame", function(){
		let gName = $(this).next().val();
		location.href = "/moveToGamePage.game?game="+gName;
	});
	
	$(document).on("click",".moveBestBookmarkGame", function(){
		let gName = $(this).next().val();
		location.href = "/moveToGamePage.game?game="+gName;
	});
	
	$(".moveToGameBtn").on("click", function() {
		location.href = "/game/GamePage_Main.jsp";
	});

	$(".moveToAwardsBtn").on("click", function() {
		location.href = "/moveToAwards.board";
	});
});
