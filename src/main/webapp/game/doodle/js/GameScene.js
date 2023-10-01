class GameScene extends Phaser.Scene {
  constructor() {
    super({ key: "GameScene" });
  }

  preload() {
    this.load.image("background", "/game/doodle/imgs/doodlejumpbg.png");
    this.load.image("platform", "/game/doodle/imgs/platform.png");
    this.load.image("doodleR", "/game/doodle/imgs/doodleR.png");
    this.load.image("doodleL", "/game/doodle/imgs/doodleL.png");
    this.load.image("pause", "/game/doodle/imgs/pause.png");
    this.load.image("play", "/game/doodle/imgs/play.png");
    this.load.audio("jump", "/game/doodle/audio/MP_Jump.mp3");
    this.load.audio("gameOver", "/game/doodle/audio/gameOver.mp3");
  }
  init() {
    this.soundCheck = $("#soundSetting").val();
    this.platformArray = [];
    this.boardWidth = $("#container").width();
    this.boardHeight = $("#container").height();
    this.velocityX = 0;
    this.velocityY = 0;
    this.initialVelocityY = -8;
    this.gravity = 0.25;
    this.score = 0;
    this.maxScore = 0;
    this.gameOver = false;
    this.firstCrashedY = 0;
    this.firstCrashedCurrentY = 0;
    this.secondCrashedY = 0;
    this.currentMaxHeight = 650;
    this.pause = false;
    this.gameOverPlayCount = 0;
    this.gameRecordCheck = $("#gameOver");
  }

  create() {
	this.gameRecordCheck.val("false");
    this.cursors = this.input.keyboard.createCursorKeys();
    this.back = this.add.tileSprite(0, 0, 360, 650, "background");
    this.back.setOrigin(0, 0);

    this.jumpSound = this.sound.add("jump");
    this.gameOverSound = this.sound.add("gameOver");

    this.platform = this.physics.add
      .sprite(this.boardWidth / 2 - 30, this.boardHeight - 50, "platform")
      .setScale(0.5)
      .setOrigin(0, 0)
      .setImmovable();
    this.platformArray.push(this.platform);
    
    for (let i = 0; i < 6; i++) {
      let randomX = Phaser.Math.Between(0, this.boardWidth - 55);
      // console.log(randomX);
      let platform = this.physics.add
        .sprite(randomX, this.boardHeight - 75 * i - 150, "platform")
        .setScale(0.5)
        .setOrigin(0, 0)
        .setImmovable();
      this.platformArray.push(platform);
    }

    this.doodle = this.physics.add
      .sprite(this.boardWidth / 2 - 25, this.boardHeight - 85, "doodleR")
      .setScale(0.32)
      .setOrigin(0, 0)
      .setSize(45 / 0.32, 45 / 0.32);

    this.socreBar = this.add
      .rectangle(0, 0, this.boardWidth, 40, 0x4287f5, 150)
      .setOrigin(0, 0);
    this.physics.add.existing(this.socreBar, true);

    this.scoreText = this.add.text(10, -10, "0", {
      fontFamily: "GangwonEduHyeonokT_OTFMediumA",
      fontSize: "50px",
      fill: "#000000",
      fontWeight: "bold",
      align: "center",
    });

    this.pauseBtn = this.physics.add
      .sprite(this.boardWidth - 35, 7.5, "pause")
      .setScale(0.05)
      .setOrigin(0, 0)
      .setInteractive();

    this.pausePage = this.add
      .rectangle(0, 40, this.boardWidth, this.boardHeight - 40, 0x111111, 100)
      .setOrigin(0, 0)
      .setVisible(false);

    this.title = this.add
      .text(this.cameras.main.width / 2, 250, "doodle jump", {
        fontFamily: "Typo_CrayonM",
        fontSize: "50px",
        fill: "#B31511",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);
    this.title.visible = false;

    this.pauseText = this.add
      .text(this.cameras.main.width / 2, 300, "pause", {
        fontFamily: "Typo_CrayonM",
        fontSize: "50px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);
    this.pauseText.visible = false;

    //일시정지 이벤트
    this.pauseBtn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
    });
    this.pauseBtn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
    });

    this.pauseBtn.on("pointerdown", () => {
      //this.scene.start("StartScene");
      this.pauseBtn.visible = false;
      this.pause = true;
      this.pausePage.setVisible(true);
      this.title.visible = true;
      this.pauseText.visible = true;
      this.pausePage.setDepth(2);
      this.title.setDepth(999);
      this.pauseText.setDepth(999);

      this.playBtn = this.physics.add
        .sprite(this.boardWidth - 34, 8.5, "play")
        .setScale(0.045)
        .setOrigin(0, 0)
        .setInteractive();
      this.playBtn.on("pointerover", () => {
        this.game.canvas.style.cursor = "pointer";
      });
      this.playBtn.on("pointerout", () => {
        this.game.canvas.style.cursor = "default";
      });

      this.playBtn.on("pointerdown", () => {
        //this.scene.start("StartScene");
        this.playBtn.visible = false;
        this.pauseBtn.visible = true;
        this.pause = false;
        this.pausePage.setVisible(false);
        this.title.visible = false;
        this.pauseText.visible = false;
      });
    });

    this.velocityY = this.initialVelocityY;

    this.physics.add.collider(
      this.doodle,
      this.platformArray,
      (doodle, platform) => {
        if (this.velocityY >= 0) {
          this.velocityY = this.initialVelocityY; // 점프하기
          this.secondCrashedY = platform.y;

          // 위에 발판을 밟았다가 다시 내려온 다음에 위로 다시 올라갔을 때 점수 올라가는 거 방지
          if (platform.y < this.currentMaxHeight) {
            if (this.secondCrashedY - this.firstCrashedY < 0) {
              this.score += -Math.floor(
                (this.secondCrashedY - this.firstCrashedY) / 10
              );
              this.scoreText.setText(this.score);
              if (this.currentMaxHeight >= platform.y) {
                this.currentMaxHeight = platform.y;
              }
            }
          }

          this.firstCrashedY = platform.y;
          
          if (this.soundCheck === "true") {
            this.jumpSound.play();
          }
        }
      }
    );

    this.aKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.A);
    this.dKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.D);
  }
  update() {
    if (!this.pause) {
      // 게임이 만약 끝나면
      if (this.gameOver) {
        if (this.soundCheck === "true" && this.gameOverPlayCount == 0) {
          this.gameOverSound.play();
          this.gameOverPlayCount++;
        }
        $("#score").val(this.scoreText.text);
        this.gameRecordCheck.val("true");
        setTimeout(() => {
          this.scene.start("GameOver");
        }, 2000);
      }
      // doodle x 축 위치
      // doodle이 화면 밖으로 나가면 반대편으로 다시 돌아오도록 설정
      this.doodle.x += this.velocityX;
      if (this.doodle.x > this.boardWidth) {
        this.doodle.x = 0;
      } else if (this.doodle.x + this.doodle.width < 0) {
        this.doodle.x = this.boardWidth;
      }
      // doodle y 축 조절
      // doodle이 화면보다 위로 올라가지 못하도록 설정

      if (this.velocityY <= 8 && this.velocityY >= -8) {
        this.velocityY += this.gravity;
      }
      this.doodle.y += this.velocityY;

      if (this.doodle.y < 40) {
        this.doodle.y = 40;
      }

      // 두들 키보드 조절
      if (this.cursors.left.isDown || this.aKey.isDown) {
        console.log("왼쪽");
        this.velocityX = -4;
        this.doodle.setTexture("doodleL");
      }

      if (this.cursors.right.isDown || this.dKey.isDown) {
        console.log("오른쪽");
        this.velocityX = 4;
        this.doodle.setTexture("doodleR");
      }

      // 게임 오버
      if (this.doodle.y > this.boardHeight) {
        this.gameOver = true;
      }

      for (let i = 0; i < this.platformArray.length; i++) {
        let nowPlatform = this.platformArray[i];
        // 플랫폼 아래로 밀어내기
        if (this.velocityY < 0 && this.doodle.y < this.boardHeight * (1 / 2)) {
          nowPlatform.y -= this.initialVelocityY;
          this.firstCrashedY -= this.initialVelocityY;
          this.currentMaxHeight -= this.initialVelocityY;
        }
      }

      // 화면 밖으로 나간 플랫폼 배열을 지우고 새로운 플랫폼 생성
      while (
        this.platformArray.length > 0 &&
        this.platformArray[0].y >= this.boardHeight
      ) {
        let destroy = this.platformArray.shift();
        destroy.destroy();

        let randomX = Phaser.Math.Between(0, (this.boardWidth * 3) / 4);
        let newPlatform = this.physics.add
          .sprite(randomX, 18, "platform")
          .setScale(0.5)
          .setOrigin(0, 0)
          .setImmovable();
        this.platformArray.push(newPlatform);
      }
    }
  }
}
