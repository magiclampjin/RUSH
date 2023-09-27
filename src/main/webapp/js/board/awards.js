$(document).ready(function() {
	
	let gameArr = ["Candy Crush", "Doodle Jump", "Flappy Bird", "KJMAX", "Kordle"];
	for(let i = 0; i < 5; i++) {
		$("#game"+i).attr("id", gameArr[i]);
	}
	
	// 페이지 처음 들어갔을 때 고정 체크
	loadList(gameArr[0]);
	
    // 카테고리 전환
    $(document).on("click", ".game", function(){
		$(".scoreBox").remove();
	
		//let selectGame = "CandyCrush";
	
		game = $(this).attr("id");
		console.log(game);
	
        $(this).removeClass("bColorBlack");
        $(this).removeClass("colorWhite");
        $(this).addClass("bColorGreen");
        $(this).addClass("colorBlack");
        
        if(game == "Kordle"){
			$(".subTitleScore").html("");
        	$(".subTitleScore").html("연속 정답 수");
		}else{
			$(".subTitleScore").html("");
        	$(".subTitleScore").html("점수");
		}
        

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
	
			console.log(rankerList);
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
		        rank.addClass("pl-0 pl-md-15 col-1 fontEnglish");
		        if(i <= 2) {
		            rank.addClass("colorPink");
		        } else {
		            rank.addClass("colorWhite");
		        }
		        rank.html(rankerList[i].ranker);
		
		        let infoDiv = $("<div>");
		        infoDiv.addClass("recordPost col-11 colorWhite");
		
		        let userInfo = $("<div>");
		        userInfo.addClass("userInfo g-0 row");
		        if(i % 2 == 1) {
		            userInfo.addClass("bColorBlack");
		        } else {
		            userInfo.addClass("bcolorDarkgray30");
		        }
		
		        let idLevDiv = $("<div>");
		        idLevDiv.addClass("col-8 pl-15");
		
		        let userId = $("<div>");
		        userId.attr("id", "userNickname");
		        userId.addClass("colorWhite");
		        userId.html(rankerList[i].nickName);
		
		        let userLevel = $("<div>");
		        userLevel.attr("id", "userLevel");
		        userLevel.addClass("colorWhite");
		        userLevel.html("Lv." + rankerList[i].level);
		
		        let score = $("<div>");
		        score.addClass("col-4");
		        
		        let scoreAlign = $("<div>");
		        scoreAlign.attr("id", "score");
		        scoreAlign.addClass("pe-0 pe-md-5 colorWhite fontEnglish");
		      
		       
		        if(rankerList[i].gameName == 'Kordle'){
					scoreAlign.html(rankerList[i].score + " 개");
				} else {
					scoreAlign.html(rankerList[i].score + " 점");
				}
		        
		
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

