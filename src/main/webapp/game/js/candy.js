
var candies = ["Blue", "Orange", "Green", "Yellow", "Red", "Purple"];
var boardCandy = [];
var rows = 9;
var columns = 9;
var score = 0;
let scoreValid = false;

var currTile;
var otherTile;
var innerTimer;

var time = 30; // 30초

$(document).ready(function() {

// 캔디를 맞출때마다 이미지를 바꾸고 새로 생성해야함
// 캔디 이동은 선택한 캔디를 중심으로 위,아래,왼,오 만 가능

// 점수 30점씩 올림
function scoreUp(){
    if(scoreValid){
        score+=30;
    }
}

function scoreUp4(){
    if(scoreValid){
        score+=40;
    }
}

// 시작 버튼 눌렀을 때, 시간초 시작
document.getElementById("btnStart").onclick = function(){
    $("#overlay").css("height","0%");
    $("#btnStart").css("display","none");
    $("#playerScore").css("display","none");
    scoreValid = true;
    timer();
}

// 다시하기 버튼 누르면 페이지 새로고침
document.getElementById("btnRestart").onclick = function(){
    location.reload();
}


    startGame();
   
    // 0.1초마다 캔디 검사
    window.setInterval(function () {
        crushCandy();
        slideCandy();
        generateCandy();
    }, 100);

// 1000마다 1초씩 시간초 감소
function timer(){
    innerTimer = window.setInterval(function(){
        time -= 1;
        if(time<=0){
            time = 0;
            endGame();
        }
        document.getElementById("time").innerText=time;
    },1000);
}

// 랜덤으로 캔디 생성
function randomCandy() {
    return candies[Math.floor(Math.random() * candies.length)]; //0 - 5.99
}

// 게임판을 초기화하고 랜덤 캔디를 생성해서 게임판에 놓음
function startGame() {
    for (let r = 0; r < rows; r++) {
        let row = [];
        for (let c = 0; c < columns; c++) {
            // 이미지 태그 생성 <img id='r-c' src='/images/Red.png'>
            let tile = document.createElement("img");
            tile.id = r.toString() + "-" + c.toString();
            tile.src = "/game/images/" + randomCandy() + ".png";

            // 드래그 함수
            tile.addEventListener("dragstart", dragStart); // 캔디 클릭, 드래그의 시작을 처리
            tile.addEventListener("dragover", dragOver);  // 캔디 클릭중, 마우스 움직이면서 캔디 드래그
            tile.addEventListener("dragenter", dragEnter); // 캔디를 다른 캔디 위로 드래그
            tile.addEventListener("dragleave", dragLeave); // 드래그 끝
            tile.addEventListener("drop", dragDrop); // 캔디를 다른 캔디 위에 놓음
            tile.addEventListener("dragend", dragEnd); // 드래그 끝나고 캔디 크러쉬 된 후에 캔디를 바꿈

            document.getElementById("boardCandy").append(tile);
            row.push(tile);
        }
        boardCandy.push(row);
    }
}

function endGame(){
    $("#overlay").css("height","460px");
    $("#btnRestart").css("display","block");
    $("#timeover").css("display","block");  
    
    console.log(score);
    clearInterval(innerTimer);
    setRecord(score);
}

// 내가 드래그하고 있는 캔디 타일과 내려놓은 캔디 타일 변수 필요
function dragStart() {
    // this -> 드래그하기 위해 클릭된 캔디 타일
    currTile = this;
}

function dragOver(e) {
    e.preventDefault();
}

function dragEnter(e) {
    e.preventDefault();
}

function dragLeave() {

}

function dragDrop() {
    // this -> curTile이랑 바꿀 캔디 타일
    otherTile = this;
}

function dragEnd() {


    // 캔디를 blank 타일과 바꾸지 못하게 함
    if(currTile.src.includes("blank") || otherTile.src.includes("blank")){
        return;
    }

    let currCoords = currTile.id.split("-"); // id="0-0" -> ["0", "0"]
    let r = parseInt(currCoords[0]);
    let c = parseInt(currCoords[1]);
    console.log("curr " + r + " " + c);

    let otherCoords = otherTile.id.split("-");
    let r2 = parseInt(otherCoords[0]);
    let c2 = parseInt(otherCoords[1]);
    console.log("other " + r2 + " " + c2);

    // 왼쪽 이동
    let moveLeft = c2 == c - 1 && r == r2;
    // 오른쪽 이동
    let moveRight = c2 == c + 1 && r == r2;
    // 위쪽 이동
    let moveUp = r2 == r - 1 && c == c2;
    // 아래쪽 이동
    let moveDown = r2 == r + 1 && c == c2;

    // 옮기려는 타일과 왼,오,위,아래쪽에 있는지 확인
    let isAdjacent = moveLeft || moveRight || moveUp || moveDown;

    if (isAdjacent) {
        // 캔디 타일들의 src를 변경해줌
        let currImg = currTile.src;
        let otherImg = otherTile.src;
        currTile.src = otherImg;
        otherTile.src = currImg;

        let validMove3 = checkValid3();
        // 아무것도 crush 안됨-> 원래대로 돌려줌
        if (!validMove3) {
            let currImg = currTile.src;
            let otherImg = otherTile.src;
            currTile.src = otherImg;
            otherTile.src = currImg;
        }
    }
}

function crushCandy() {
    crushThree();
    document.getElementById("score").innerText=score;
}

function crushThree() {
    // 행 전부 확인
    for (let r = 0; r < rows; r++) {
        for (let c = 0; c < columns - 2; c++) {
            let candy1 = boardCandy[r][c];
            let candy2 = boardCandy[r][c + 1];
            let candy3 = boardCandy[r][c + 2];

            // 이미지 src가 같으면 캔디 crush -> blank 이미지로 대체
            if (candy1.src == candy2.src && candy2.src == candy3.src && !candy1.src.includes("blank")) {
                candy1.src = "/game/images/blank.png";
                candy2.src = "/game/images/blank.png";
                candy3.src = "/game/images/blank.png";
                scoreUp();
            }
        }
    }
    // 열 전부 확인
    for (let c = 0; c < columns; c++) {
        for (let r = 0; r < rows - 2; r++) {
            let candy1 = boardCandy[r][c];
            let candy2 = boardCandy[r + 1][c];
            let candy3 = boardCandy[r + 2][c];

            // 이미지 src가 같으면 캔디 crush
            if (candy1.src == candy2.src && candy2.src == candy3.src && !candy1.src.includes("blank")) {
                candy1.src = "/game/images/blank.png";
                candy2.src = "/game/images/blank.png";
                candy3.src = "/game/images/blank.png";
                scoreUp();
            }
        }
    }
}

// blank 이미지인지 아닌지
function checkValid3() {
    for (let r = 0; r < rows; r++) {
        for (let c = 0; c < columns - 2; c++) {
            let candy1 = boardCandy[r][c];
            let candy2 = boardCandy[r][c + 1];
            let candy3 = boardCandy[r][c + 2];

            // 이미지 src가 같으면 캔디 crush -> blank 이미지로 대체
            if (candy1.src == candy2.src && candy2.src == candy3.src && !candy1.src.includes("blank")) {
                return true;
            }
        }
    }
    // 열 전부 확인
    for (let c = 0; c < columns; c++) {
        for (let r = 0; r < rows - 2; r++) {
            let candy1 = boardCandy[r][c];
            let candy2 = boardCandy[r + 1][c];
            let candy3 = boardCandy[r + 2][c];

            // 이미지 src가 같으면 캔디 crush
            if (candy1.src == candy2.src && candy2.src == candy3.src && !candy1.src.includes("blank")) {
                return true;
            }
        }
    }
    return false;
}


function slideCandy(){
    // 터지고 위에서부터 슬라이드
    for(let c = 0; c < columns; c++){
        let ind = rows - 1;
        for(let r = columns -1; r >=0; r--){
            if(!boardCandy[r][c].src.includes("blank")){
                boardCandy[ind][c].src=boardCandy[r][c].src;
                ind -= 1;
            }
        }

        // 위에 빈 부분을 blank이미지로 채워줌
        for(let r = ind; r >=0 ;r--){
            boardCandy[r][c].src = "/game/images/blank.png";
        }
    }
}

function generateCandy(){
    for(let c = 0 ; c<columns ; c++){
        if(boardCandy[0][c].src.includes("blank")){
            boardCandy[0][c].src = "/game/images/"+randomCandy()+".png";
        }
    }
}

function setRecord(userScore){
	  $.ajax({
	      url:"/setGameRecord.game",
	      data:{
	          game:'Candy Crush',
	          score : userScore
	      },
	      dataType:"json",
	      type: "post"
	   }).done(function(record){
	      reloadRecord(record);
	   });
}

   function reloadRecord(record){
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
   }
   });