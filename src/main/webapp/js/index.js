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
			gameDesc.html("여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에 생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구");
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
			gameDescMini.html("여기에 게임 설명 넣으면 됩니다 이 게임 재밌고 흥미롭고 안 하면 아쉽고 등등... 하면 아쉬워서 잠자기 전에 생각난다 어쩌구 이 게임은 영국에서부터 시작되어 저쩌구");
			let moveBtnCoverMini = $("<div>").attr("class","d-flex align-items-center justify-content-center h20");
			let moveBtnMini=  $("<button>").html("PLAY GAME").attr("class", "gameBtnsmini moveBestGame fontEnglish bColorPink colorWhite fw900");
			
			miniBottom.append(gameDescMini).append(moveBtnCoverMini.append(moveBtnMini).append($("<input>").attr("type","hidden").val(resp[i].gName)));
			top.append(miniTop).append(miniBottom);
			$("#bestGamesList").append(top);
		}
		
	});
	
	let bestBookmark = $("#bestBookmarkList"); //after

	for(let i=3; i>0; i--){
		let obj = $("<div>").attr("class","col-12 col-md-4 mb80");
		
		let innerObj = $("<div>").attr("class","row g-0 mlr20");
		let title = $("<div>").attr("class","col-12 colorWhite fw900 fs30px mb20").html("게임"+(i));
		
		let imgCover = $("<div>").attr("class","col-12 colorWhite mb20");
		let img = $("<img>").attr("src","/img/img.jpg").attr("class","bookmarkImg");
		imgCover.append(img);
		
		let sexRatios = $("<div>").attr("class","row g-0 d-flex sexRatios");
		let womenRatioCover = $("<div>").attr("class","col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderRight1");
		let womenRatio = $("<i>").attr("class","fa-solid fa-venus fa-xl").css("color","#ffffff");
		womenRatioCover.append(womenRatio).append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%");
		let menRatioCover = $("<div>").attr("class","col-6 fontEnglish colorWhite text-center bcolorDarkgray30 sexRatio fw700 mb20 borderLeft1");
		let menRatio = $("<i>").attr("class","fa-solid fa-mars fa-xl").css("color","#ffffff").after("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%");
		menRatioCover.append(menRatio).append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;50%");
		sexRatios.append(womenRatioCover).append(menRatioCover);
		
		let btnCover = $("<div>").attr("class","col-12 d-none d-md-block mb50");
		let btn = $("<button>").attr("class","fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtns").html("PLAY GAME");
		btnCover.append(btn);
		let btnCoverMini = $("<div>").attr("class","col-12 d-md-none mb50");
		let btnMini = $("<button>").attr("class","fontEnglish colorBlack bColorGreen w-100 fw900 mb20 bookmarkBtnsmini").html("PLAY GAME");
		btnCoverMini.append(btnMini);
		
		innerObj.append(title).append(imgCover).append(sexRatios).append(btnCover).append(btnCoverMini);
		obj.append(innerObj);
		bestBookmark.after(obj);
	}

	
	
	$(document).on("click",".moveBestGame", function(){
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
