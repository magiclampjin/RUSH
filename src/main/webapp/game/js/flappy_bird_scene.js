// assets
const assets = {
    // 캐릭터
    bird: {
        red: 'bird-red',
        yellow: 'bird-yellow',
        blue: 'bird-blue'
    },
    // 파이프
    obstacle: {
        pipe: {
            green: {
                top: 'pipe-green-top',
                bottom: 'pipe-green-bottom'
            },
            red: {
                top: 'pipe-red-top',
                bottom: 'pipe-red-bo'
            }
        }
    },
    // 배경 & 바닥
    scene: {
        width: 144,
        background: {
            day: 'background-day',
            night: 'background-night'
        },
        ground: 'ground',
        gameOver: 'game-over',
        restart: 'restart-button',
        messageInitial: 'message-initial'
    },
    // 점수
    scoreboard: {
        width: 25,
        base: 'number',
        number0: 'number0',
        number1: 'number1',
        number2: 'number2',
        number3: 'number3',
        number4: 'number4',
        number5: 'number5',
        number6: 'number6',
        number7: 'number7',
        number8: 'number8',
        number9: 'number9'
    },
    // 애니메이션
    animation: {
        bird: {
            red: {
                clapWings: 'red-clap-wings',
                stop: 'red-stop'
            },
            blue: {
                clapWings: 'blue-clap-wings',
                stop: 'blue-stop'
            },
            yellow: {
                clapWings: 'yellow-clap-wings',
                stop: 'yellow-stop'
            }
        },
        ground: {
            moving: 'moving-ground',
            stop: 'stop-ground'
        }
    }
};

// 게임 오버
let gameOver;
let gameOverBanner;

// 게임 시작 (현재)
let gameStarted;
let messageInitial;

// 버튼
let upButton;
let restartButton;

// 캐릭터
let player;
let birdName;
let framesMoveUp;

// 배경
let backgroundDay;
let backgroundNight;

// 바닥
let ground;

// 통과 구간
let gapsGroup;

// 파이프
let pipesGroup;
let nextPipes;
let currentPipe;

// 점수
let scoreboardGroup;
let score;

function preload() {
    // 배경 & 바닥
    this.load.image(assets.scene.background.day, 'game/assets/background-day.png');
    this.load.image(assets.scene.background.night, 'game/assets/background-night.png');
    this.load.spritesheet(assets.scene.ground, 'game/assets/ground-sprite.png', {
        frameWidth: 336,
        frameHeight: 112
    });

    // 파이프
    this.load.image(assets.obstacle.pipe.green.top, 'game/assets/pipe-green-top.png');
    this.load.image(assets.obstacle.pipe.green.bottom, 'game/assets/pipe-green-bottom.png');
    this.load.image(assets.obstacle.pipe.red.top, 'game/assets/pipe-red-top.png');
    this.load.image(assets.obstacle.pipe.red.bottom, 'game/assets/pipe-red-bottom.png');

    // 시작 화면
    this.load.image(assets.scene.messageInitial, 'game/assets/message-initial.png');

    // 게임 오버 화면
    this.load.image(assets.scene.gameOver, 'game/assets/gameover.png');
    this.load.image(assets.scene.restart, 'game/assets/restart-button.png');

    // 캐릭터
    this.load.spritesheet(assets.bird.red, 'game/assets/bird-red-sprite.png', {
        frameWidth: 34,
        frameHeight: 24
    });
    this.load.spritesheet(assets.bird.blue, 'game/assets/bird-blue-sprite.png', {
        frameWidth: 34,
        frameHeight: 24
    });
    this.load.spritesheet(assets.bird.yellow, 'game/assets/bird-yellow-sprite.png', {
        frameWidth: 34,
        frameHeight: 24
    });

    // 점수
    this.load.image(assets.scoreboard.number0, 'game/assets/number0.png');
    this.load.image(assets.scoreboard.number1, 'game/assets/number1.png');
    this.load.image(assets.scoreboard.number2, 'game/assets/number2.png');
    this.load.image(assets.scoreboard.number3, 'game/assets/number3.png');
    this.load.image(assets.scoreboard.number4, 'game/assets/number4.png');
    this.load.image(assets.scoreboard.number5, 'game/assets/number5.png');
    this.load.image(assets.scoreboard.number6, 'game/assets/number6.png');
    this.load.image(assets.scoreboard.number7, 'game/assets/number7.png');
    this.load.image(assets.scoreboard.number8, 'game/assets/number8.png');
    this.load.image(assets.scoreboard.number9, 'game/assets/number9.png');
};

function create() {
    // 배경
    backgroundDay = this.add.image(assets.scene.width, 256, assets.scene.background.day).setInteractive();
    backgroundNight = this.add.image(assets.scene.width, 256, assets.scene.background.night).setInteractive();
    // 배경 클릭하면 캐릭터 움직임
    backgroundDay.on('pointerdown', moveBird);
    backgroundNight.on('pointerdown', moveBird);
    backgroundNight.visible = false;

    // 바닥
    ground = this.physics.add.sprite(assets.scene.width, 458, assets.scene.ground);
    ground.setCollideWorldBounds(true);
    ground.setDepth(10); // 레이아웃 기능

    // 점수
    messageInitial = this.add.image(assets.scene.width, 156, assets.scene.messageInitial);
    messageInitial.setDepth(30); // 레이아웃 기능
    messageInitial.visible = false;

    // 그룹
    gapsGroup = this.physics.add.group(); // 통과 구간 그룹
    pipesGroup = this.physics.add.group(); // 파이프 그룹
    scoreboardGroup = this.physics.add.staticGroup(); // 점수 그룹

    // 화살표 위쪽 버튼
    upButton = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.UP);

    // 바닥 애니메이션
    this.anims.create({ // 움직일 때
        key: assets.animation.ground.moving,
        frames: this.anims.generateFrameNumbers(assets.scene.ground, {
            start: 0,
            end: 2
        }),
        frameRate: 15,
        repeat: -1
    });
    this.anims.create({ // 멈출 때
        key: assets.animation.ground.stop,
        frames: [{
            key: assets.scene.ground,
            frame: 0
        }],
        frameRate: 20
    });

    // 캐릭터 애니메이션
    // 빨간색
    this.anims.create({ // 움직일 때
        key: assets.animation.bird.red.clapWings,
        frames: this.anims.generateFrameNumbers(assets.bird.red, {
            start: 0,
            end: 2
        }),
        frameRate: 10,
        repeat: -1
    });
    this.anims.create({ // 멈출 때
        key: assets.animation.bird.red.stop,
        frames: [{
            key: assets.bird.red,
            frame: 1
        }],
        frameRate: 20
    });
    // 파란색
    this.anims.create({ // 움직일 때
        key: assets.animation.bird.blue.clapWings,
        frames: this.anims.generateFrameNumbers(assets.bird.blue, {
            start: 0,
            end: 2
        }),
        frameRate: 10,
        repeat: -1
    });
    this.anims.create({ // 멈출 때
        key: assets.animation.bird.blue.stop,
        frames: [{
            key: assets.bird.blue,
            frame: 1
        }],
        frameRate: 20
    });
    // 노란색
    this.anims.create({ // 움직일 때
        key: assets.animation.bird.yellow.clapWings,
        frames: this.anims.generateFrameNumbers(assets.bird.yellow, {
            start: 0,
            end: 2
        }),
        frameRate: 10,
        repeat: -1
    });
    this.anims.create({ // 멈출 때
        key: assets.animation.bird.yellow.stop,
        frames: [{
            key: assets.bird.yellow,
            frame: 1
        }],
        frameRate: 20
    });

    prepareGame(this);

    // 게임 오버 화면
    gameOverBanner = this.add.image(assets.scene.width, 206, assets.scene.gameOver);
    gameOverBanner.setDepth(20);
    gameOverBanner.visible = false;

    // 재시작 버튼
    restartButton = this.add.image(assets.scene.width, 300, assets.scene.restart).setInteractive();
    restartButton.on('pointerdown', restartGame);
    restartButton.setDepth(20);
    restartButton.visible = false;
};

function update() {
    if (gameOver || !gameStarted) { return; };

    // 캐릭터가 천장에 닿았다면
    if (framesMoveUp > 0) {
        framesMoveUp--;
    // 화살표 위쪽 버튼 눌렀을 때
    } else if (Phaser.Input.Keyboard.JustDown(upButton)) {
        moveBird();
    } else {
        player.setVelocityY(120);

        // 캐릭터 고개 숙이기
        if (player.angle < 90) {
            player.angle += 1;
        };
    }

    // 파이프 그룹에 있는 모든 객체
    pipesGroup.children.iterate(function (child) { // 지정된 콜백에 전달
        if (child == undefined) {
            return;
        }

        // 파이프가 화면에서 사라지면 삭제
        if (child.x < -50) {
            child.destroy();
        // 파이프 이동
        } else {
            child.setVelocityX(-100);
        }
    });

    // 통과 구간 그룹에 있는 모든 객체
    gapsGroup.children.iterate(function (child) {
        // 통과 구간 이동
        child.body.setVelocityX(-100);
    });

    // 130 프레임에 1개 생성
    nextPipes++;
    if (nextPipes === 130) {
        makePipes(game.scene.scenes[0]);
        nextPipes = 0;
    }
};

// 캐릭터가 부딪혔을 때
function hitBird(player) {
    this.physics.pause();

    gameOver = true;
    gameStarted = false;

    player.anims.play(getAnimationBird(birdName).stop);
    ground.anims.play(assets.animation.ground.stop);

    gameOverBanner.visible = true;
    restartButton.visible = true;

    setRecord(score); // 점수 집계
};

// 점수 업데이트
function updateScore(_, gap) {
    score++;
    gap.destroy();

    // 10점 단위마다 배경 & 파이프 색 변경
    if (score % 10 == 0) {
        backgroundDay.visible = !backgroundDay.visible;
        backgroundNight.visible = !backgroundNight.visible;

        if (currentPipe === assets.obstacle.pipe.green) {
            currentPipe = assets.obstacle.pipe.red;
        }
        else {
            currentPipe = assets.obstacle.pipe.green;
        }
    }

    updateScoreboard();
};

// 파이프 생성
function makePipes(scene) {
    if (!gameStarted || gameOver) { return; };
    // 파이프 생성 위치
    const pipeTopY = Phaser.Math.Between(-120, 120);

    // 통과 구간 위치
    const gap = scene.add.line(288, pipeTopY + 210, 0, 0, 0, 98);
    gapsGroup.add(gap);
    gap.body.allowGravity = false;
    gap.visible = false;

    // 상단 파이프
    const pipeTop = pipesGroup.create(288, pipeTopY, currentPipe.top);
    pipeTop.body.allowGravity = false;

    // 하단 파이프
    const pipeBottom = pipesGroup.create(288, pipeTopY + 420, currentPipe.bottom);
    pipeBottom.body.allowGravity = false;
};

// 캐릭터 움직임
function moveBird() {
    if (gameOver) {
        return;
    };

    if (!gameStarted) {
        startGame(game.scene.scenes[0]);
    };

    player.setVelocityY(-400);
    player.angle = -15; // 고개 들기
    framesMoveUp = 5; // 위로 이동
}

// 캐릭터 색 랜덤
function getRandomBird() {
    switch (Phaser.Math.Between(0, 2)) {
        case 0:
            return assets.bird.red;
        case 1:
            return assets.bird.blue;
        case 2:
        default:
            return assets.bird.yellow;
    };
};

// 캐릭터 색에 따른 움직임
function getAnimationBird(birdColor) {
    switch (birdColor) {
        case assets.bird.red:
            return assets.animation.bird.red;
        case assets.bird.blue:
            return assets.animation.bird.blue;
        case assets.bird.yellow:
        default:
            return assets.animation.bird.yellow;
    };
};

// 점수 보드 갱신
function updateScoreboard() {
    // 기존 점수 텍스트 삭제
    scoreboardGroup.clear(true, true);

    const scoreAsString = score.toString();
    if (scoreAsString.length == 1)
        scoreboardGroup.create(assets.scene.width, 30, assets.scoreboard.base + score).setDepth(10);
    else {
        let initialPosition = assets.scene.width - ((score.toString().length * assets.scoreboard.width) / 2);

        for (let i = 0; i < scoreAsString.length; i++) {
            scoreboardGroup.create(initialPosition, 30, assets.scoreboard.base + scoreAsString[i]).setDepth(10);
            initialPosition += assets.scoreboard.width;
        }
    };
};

// 게임 재시작
function restartGame() {
    pipesGroup.clear(true, true);
    pipesGroup.clear(true, true);
    gapsGroup.clear(true, true);
    scoreboardGroup.clear(true, true);
    player.destroy();
    gameOverBanner.visible = false;
    restartButton.visible = false;

    const gameScene = game.scene.scenes[0];
    prepareGame(gameScene);

    gameScene.physics.resume();
};

// 게임 준비
function prepareGame(scene) {
    framesMoveUp = 0;
    nextPipes = 0;
    currentPipe = assets.obstacle.pipe.green;
    score = 0;
    gameOver = false;
    backgroundDay.visible = true;
    backgroundNight.visible = false;
    messageInitial.visible = true;

    birdName = getRandomBird();
    player = scene.physics.add.sprite(60, 265, birdName);
    player.setCollideWorldBounds(true);
    player.anims.play(getAnimationBird(birdName).clapWings, true);
    player.body.allowGravity = false;

    scene.physics.add.collider(player, ground, hitBird, null, scene);
    scene.physics.add.collider(player, pipesGroup, hitBird, null, scene);

    scene.physics.add.overlap(player, gapsGroup, updateScore, null, scene);

    ground.anims.play(assets.animation.ground.moving, true);
};

// 게임 시작
function startGame(scene) {
    gameStarted = true;
    messageInitial.visible = false;

    const score0 = scoreboardGroup.create(assets.scene.width, 30, assets.scoreboard.number0);
    score0.setDepth(20);

    makePipes(scene);
};

function setRecord(userScore){
	  $.ajax({
	      url:"/setGameRecord.game",
	      data:{
	          game:'Fluppy Bird',
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