$(document).ready(function() {
	// 페이지 처음 들어갔을 때 고정 체크
	var game = $("#candy");
	
    // 카테고리 전환
    $(document).on("click", ".game", function(){
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
    });
	
    // 상위 5개 추출
    let listNum = 5;
    
    for(let i = 1; i <= 5; i++) {
        let scoreBox = $("<div>");
        scoreBox.addClass("scoreBox row g-0");

        let rank = $("<div>");
        rank.attr("id", "rank");
        rank.addClass("col-1 fontEnglish");
        if(i <= 3) {
            rank.addClass("colorPink");
        } else {
            rank.addClass("colorWhite");
        }
        rank.html(i);

        let infoDiv = $("<div>");
        infoDiv.addClass("col-11");

        let userInfo = $("<div>");
        userInfo.addClass("userInfo row");
        if(i % 2 == 0) {
            userInfo.addClass("bColorBlack");
        } else {
            userInfo.addClass("bcolorDarkgray");
        }

        let idLevDiv = $("<div>");
        idLevDiv.addClass("col-8 col-md-9");

        let userId = $("<div>");
        userId.attr("id", "userId");
        userId.addClass("colorWhite");
        userId.html("게임 유저 아이디" + i);

        let userLevel = $("<div>");
        userLevel.attr("id", "userLevel");
        userLevel.addClass("colorWhite");
        userLevel.html("Lv." + i);

        let score = $("<div>");
        score.attr("id", "score");
        score.addClass("col-2 col-lg-3 colorWhite");
        score.html(1000 - (i * 100));

        idLevDiv.append(userId).append(userLevel);
        userInfo.append(idLevDiv).append(score);
        infoDiv.append(userInfo);
        scoreBox.append(rank).append(infoDiv);
        $("#ranker").append(scoreBox);
    }
});