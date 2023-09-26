$(document).ready(function() {
	
	let gameArr = ["Candy Crush", "doodle jump", "Flappy Bird", "KJMAX", "kordle"];
	for(let i = 0; i < 5; i++) {
		$("#game"+i).attr("id", gameArr[i]);
	}
	
	// 페이지 처음 들어갔을 때 고정 체크
	loadList(gameArr[0]);
	
    // 카테고리 전환
    $(document).on("click", ".game", function(){
		$(".scoreBox").remove();
	
		let selectGame = "CandyCrush";
	
		game = $(this).attr("id");
		console.log(game);
	
        $(this).removeClass("bColorBlack");
        $(this).removeClass("colorWhite");
        $(this).addClass("bColorGreen");
        $(this).addClass("colorBlack");

        $(".game").not($(this)).removeClass("bColorGreen");
        $(".game").not($(this)).removeClass("colorBlack");
        $(".game").not($(this)).addClass("bColorBlack");
        $(".game").not($(this)).addClass("colorWhite");
        
        loadList(game);
    });
    
    function loadList(game) {
	$.ajax({
           type:"post",
           url:"/rankerList.board",
           dataType: "json",
           data: {
              game: game
           },
        }).done(function(rankerList){
           // 상위 5개 추출
           let listNum = 5
          	if(rankerList.length < listNum) {
				listNum = rankerList.length;
			}
		    
		    for(let i = 0; i < listNum; i++) {

		        let scoreBox = $("<div>");
		        scoreBox.addClass("scoreBox row g-0");
		
		        let rank = $("<div>");
		        rank.attr("id", "rank");
		        rank.css("font-size", "40px");
		        rank.addClass("pl-15 col-2 col-xs-1 col-md-1 col-lg-1 col-xl-1 fontEnglish");
		        if(i <= 2) {
		            rank.addClass("colorPink");
		        } else {
		            rank.addClass("colorWhite");
		        }
		        rank.html(i+1);
		
		        let infoDiv = $("<div>");
		        infoDiv.addClass("recordPost col-10 col-xs-11 colorWhite");
		
		        let userInfo = $("<div>");
		        userInfo.addClass("userInfo g-0 row");
		        if(i % 2 == 1) {
		            userInfo.addClass("bColorBlack");
		        } else {
		            userInfo.addClass("bcolorDarkgray30");
		        }
		
		        let idLevDiv = $("<div>");
		        idLevDiv.addClass("col-8");
		
		        let userId = $("<div>");
		        userId.attr("id", "userId");
		        userId.addClass("colorWhite");
		        userId.html(rankerList[i].id);
		
		        let userLevel = $("<div>");
		        userLevel.attr("id", "userLevel");
		        userLevel.addClass("colorWhite");
		        userLevel.html("Lv." + rankerList[i].level);
		
		        let score = $("<div>");
		        score.addClass("col-4");
		        
		        let scoreAlign = $("<div>");
		        scoreAlign.attr("id", "score");
		        scoreAlign.addClass("pe-0 pe-md-5 colorWhite");
		        scoreAlign.html(rankerList[i].score + " 점");
		
		        idLevDiv.append(userId).append(userLevel);
		        score.append(scoreAlign);
		        userInfo.append(idLevDiv).append(score);
		        infoDiv.append(userInfo);
		        scoreBox.append(rank).append(infoDiv);
		        $("#ranker").append(scoreBox);
		    }
       });
}
	
});

