
let lineCnt;
let cnt;
let $lines;
let end;
let dap; // 자모 분리된 정답
let oriWord; // 자모 결함된 정답


$(document).ready(function() {
	$(".game").css("height","800px");
	
	function gameInit(){
		let container = $("#gameContainer").css("margin-top","25px");
		let gameBoard = $("<div>").attr("class","row g-0").attr("id","gameBoard");
		let startCover = $("<div>").attr("class","covers").attr("id","startCover");
		let gameStartBtn = $("<button>").attr("class","gameStartBnts").attr("id","gameStartBtn").html("Start Game");
		startCover.append(gameStartBtn);
		
		let endCover = $("<div>").attr("class","covers").attr("id","endCover");
		let gameReStartBtn = $("<button>").attr("class","gameStartBnts").attr("id","gameReStartBtn").html("ReStart Game");
		endCover.append(gameReStartBtn);
		
		gameBoard.append(startCover).append(endCover);
		for(let i=0; i<6; i++){
			let line = $("<div>").attr("class","col-12 line");
			let row = $("<div>").attr("class","row g-0");
			for(let j=0; j<6; j++){
				let cell = $("<div>").attr("class","col-2 cell");
				row.append(cell);
			}
			line.append(row);
			gameBoard.append(line);
			
		}
		container.append(gameBoard);
		
		let inputString = ["ㅂ","ㅈ","ㄷ","ㄱ","ㅅ","ㅛ","ㅕ","ㅑ","ㅁ","ㄴ","ㅇ","ㄹ","ㅎ","ㅗ","ㅓ","ㅏ","ㅣ","확인","ㅋ","ㅌ","ㅊ","ㅍ","ㅠ","ㅜ","ㅡ","지우기"];
		let cellCnt = [8,9,9];
		let containerInputs = $("<div>").attr("class","containerInputs");
		let inputBoard = $("<div>").attr("class","inputBoard");
		let stringIdx = 0;
		let idx = 0 ;
		for(let i=0; i<cellCnt.length; i++){
			let inputLine = $("<div>").attr("class","inputLine g-0 m-0 p-0").addClass("line"+(++idx));
			for(let j=0; j<cellCnt[idx-1]; j++){
				let inputBtn = $("<button>").attr("class","input").attr("id",inputString[stringIdx]).html(inputString[stringIdx++]);
				if(stringIdx == 18 || stringIdx == 26)
					inputBtn.addClass("btns");
				inputLine.append(inputBtn);
			}
			inputBoard.append(inputLine);
		}
		container.after(containerInputs.append(inputBoard));
		
		$.ajax({
			url: "/kordleGameStart.game",
			dataType:"Json"
		}).done(function(resp){
			dap = resp.jamo_word;
			oriWord = resp.ori_word;
		});
		
		lineCnt = 0;
		cnt = 0;
		$lines = document.getElementsByClassName("line");
		end = true;
	}
	gameInit();
	
	$(document).on("click", "#gameStartBtn", function(){
		$("#startCover").css("display","none");
		end = false;
	})

	$(document).on("click", "#gameReStartBtn", function(){
		$("#endCover").css("display","none");
		$("#gameBoard").remove();
		$(".containerInputs").remove();
		gameInit();	
	})
	
	$(document).on("click", ".input", function(){
		if(!end){
   		   let inputTxt = $(this).html();
           inputPush(inputTxt, -1);
    	}
	})
	

    $(document).on("keyup", function (e) {
    	if(!end){
   	    	let inputTxt = e.key;
            let inputCode = e.keyCode;
            inputPush(inputTxt, inputCode);
    	}
    });
    
    function inputPush(txt, code) {
            if (txt == "Backspace" || txt=="지우기") {
                if (cnt != 0)
                    $($lines).eq(lineCnt).children().children().eq(--cnt).html("");
            } else if (txt == "Enter" || txt=="확인") {
                if (cnt == 6) {             
               	  	let lineTxt = "";
                    for(let i=0; i<$($lines).children().length; i++){
                    	lineTxt = lineTxt + $($lines).eq(lineCnt).children().children().eq(i).html();
                    }
                   
                    if(lineTxt == dap){ // 정답 일경우
                   		for(let i=0; i<$($lines).children().length; i++){
                        	$($lines).eq(lineCnt).children().children().eq(i).css("background-color","green");
                        }
                   		$("#endCover").css("display","flex");
                    	setTimeout(function(){
                    		alert("win");
                    	},0);
                    	end= true;
                    	 // 엔딩 띄우기
                    } else{ // 오답일 경우 DB에 있는 내용인지 검사 (실제 존재하는 단어인지 검사 )
                    	$.ajax({
                        	url: "/kordleWordCompare.game",
                        	dataType:"Json",
                        	data:{
                        		noun : lineTxt
                        	}
                        }).done(function(resp){
                        	if(resp == true) { // 존재하는 단어
                        		let i=0;
                        		 for(let dapChar of dap){
 	                            	let j=0;
 	                            	for(let inputChar of lineTxt){
 	                            		let target = $($lines).eq(lineCnt).children().children().eq(j);
 	                            		let btnId = target.html();
                         				if($("#"+btnId).css("background-color") != "rgb(0, 128, 0)" && $("#"+btnId).css("background-color") != "rgb(255, 165, 0)" ) // 자판에 틀린 글자 진한 회색
                         					$("#"+btnId).css("background-color","darkgray");
 	                            		
 	                            		if(target.css("background-color") == "rgb(173, 216, 230)" )//게임 글자판 (상단)에 틀린 글자는 진한 회색
	                            			target.css("background-color","darkgray");
	                            			
 	                            		if(dapChar == inputChar){ 
 	                            			let color = "rgb(0, 128, 0)"; // 자리 맞았을 떄
 	                            			if(i!=j) // 자리 틀렸을 때
 	                            				color = "orange"     
 	                            			if(target.css("background-color") != "rgb(0, 128, 0)") { // 초록색으로 칠해지지 않은 곳만ㅊ
 	                            				target.css("background-color",color);
 	                            				if($("#"+btnId).css("background-color") != "rgb(0, 128, 0)") // 자판에 현재 상태 반영
 	                            					$("#"+btnId).css("background-color",color);
 	                            				
 	                            			}
 	                            		}
 	                            		j++;
 	                            	}
 	                            	i++;
 	                            }
                        	
	  	                     	lineCnt++;
	                            cnt = 0;
	                            
	                            if (lineCnt == 6) { // 테스트중이라 3으로 줄임 추후에 6으로 수정할 것. 
	                                end= true;
	                                // 게임 엔딩 띄우기
	                                $("#endCover").css("display","flex");
	                                setTimeout(function(){
	                                	if(confirm(oriWord+" (이)라는 단어의 뜻이 궁금하신가요?"))
	  	                                	window.open("https://www.google.co.kr/search?q="+oriWord);  
	                            	},0);
	                              
	                            }     
                        	} else if (resp == false){
                        		alert("존재하지 않는 단어입니다.");
                        	}              
                        });
                    }           
                }
            } else {
                if(code == -1 || (65 <= code && code <= 90)){
                    if (cnt == 6) {
                        alert("확인 또는 enter를 누르세요.");
                    }
                    else{
                    	let input = convertEnglishToKorean(txt,code);
                    	
                    	if(input != null){
							let cell = $($lines).eq(lineCnt).children().children().eq(cnt++);
                    		cell.html(input);	
                    		cell.css({"border":"1px solid white"});
                    		setTimeout(function(){
                    			cell.css({"border":"3px solid white"});
                        	},100);
                    	}
                        	
                    }   
                }
            }
        }
        
        
     function convertEnglishToKorean(char,code){
        if(code == "65") return "ㅁ";
        else if(code == "66") return "ㅠ";
        else if(code == "67") return "ㅊ";
        else if(code == "68") return "ㅇ";
        else if(code == "69") return "ㄷ";
        else if(code == "70") return "ㄹ";
        else if(code == "71") return "ㅎ";
        else if(code == "72") return "ㅗ";
        else if(code == "73") return "ㅑ";
        else if(code == "74") return "ㅓ";
        else if(code == "75") return "ㅏ";
        else if(code == "76") return "ㅣ";
        else if(code == "77") return "ㅡ";
        else if(code == "78") return "ㅜ";
        else if(code == "79") return null;
        else if(code == "80") return null;
        else if(code == "81") return "ㅂ";
        else if(code == "82") return "ㄱ";
        else if(code == "83") return "ㄴ";
        else if(code == "84") return "ㅅ";
        else if(code == "85") return "ㅕ";
        else if(code == "86") return "ㅍ";
        else if(code == "87") return "ㅈ";
        else if(code == "88") return "ㅌ";
        else if(code == "89") return "ㅛ";
        else if(code == "90") return "ㅋ";
        else if(char =="ㅐ") return null;
        else if(char =="ㅔ") return null;
        else return char;       
  	  }
  	
  	
});	


