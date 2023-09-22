$(document).ready(function() {
	
	let gameArr = ["CandyCrush", "doodle jump", "FlappyBird", "KJMAX", "kkodle"];
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
		        rank.addClass("col-1 fontEnglish");
		        if(i <= 2) {
		            rank.addClass("colorPink");
		        } else {
		            rank.addClass("colorWhite");
		        }
		        rank.html(i+1);
		
		        let infoDiv = $("<div>");
		        infoDiv.addClass("col-11");
		
		        let userInfo = $("<div>");
		        userInfo.addClass("userInfo row");
		        if(i % 2 == 1) {
		            userInfo.addClass("bColorBlack");
		        } else {
		            userInfo.addClass("bcolorDarkgray");
		        }
		
		        let idLevDiv = $("<div>");
		        idLevDiv.addClass("col-8 col-md-9");
		
		        let userId = $("<div>");
		        userId.attr("id", "userId");
		        userId.addClass("colorWhite");
		        userId.html(rankerList[i].id);
		
		        let userLevel = $("<div>");
		        userLevel.attr("id", "userLevel");
		        userLevel.addClass("colorWhite");
		        userLevel.html("Lv." + rankerList[i].level);
		
		        let score = $("<div>");
		        score.attr("id", "score");
		        score.addClass("col-2 col-lg-3 colorWhite");
		        score.html(rankerList[i].score);
		
		        idLevDiv.append(userId).append(userLevel);
		        userInfo.append(idLevDiv).append(score);
		        infoDiv.append(userInfo);
		        scoreBox.append(rank).append(infoDiv);
		        $("#ranker").append(scoreBox);
		    }
       });
}
	
});

