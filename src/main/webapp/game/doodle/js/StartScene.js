class StartScene extends Phaser.Scene {
  constructor() {
    super({ key: "StartScene" });
  }

  preload() {
    this.load.image("background", "/game/doodle/imgs/doodlejumpbg.png");
    this.load.image("doodle", "/game/doodle/imgs/doodleR.png");
    this.load.image("platform", "/game/doodle/imgs/platform.png");
    this.load.image("buttonbg", "/game/doodle/imgs/buttonbg.png");
    this.load.image("setting", "/game/doodle/imgs/setting.png");
    this.load.image("ufoBody", "/game/doodle/imgs/ufoBody.png");
    this.load.image("ufoLight", "/game/doodle/imgs/ufoLight.png");
    this.load.audio("jump", "/game/doodle/audio/MP_Jump.mp3");
  }
  init() {
    this.velocityX = 0;
    this.velocityY = 0;
    this.initialVelocityY = -8;
    this.gravity = 0.25;
    this.hitFlag = true;
    this.startY = 0;
    this.currentY = 0;
    this.frame = 0;
    this.timeCount = 0;
    this.jumpSound;
  }

  create() {
    this.back = this.add.tileSprite(0, 0, 360, 650, "background");
    this.back.setOrigin(0, 0);

    this.jumpSound = this.sound.add("jump");

    this.title = this.add
      .text(this.cameras.main.width / 2, 100, "doodle jump", {
        fontFamily: "Typo_CrayonM",
        fontSize: "50px",
        fill: "#B31511",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5).angle = -10;

    this.platform = this.physics.add
      .sprite(30, 450, "platform")
      .setOrigin(0, 0)
      .setScale(0.5);
    this.platform.setImmovable();

    this.doodle = this.physics.add
      .sprite(40, 395, "doodle")
      .setOrigin(0, 0)
      .setScale(0.4)
      .setSize(55 / 0.4, 53 / 0.4);

    this.ufoBody = this.physics.add
      .sprite(200, 150, "ufoBody")
      .setOrigin(0, 0)
      .setScale(0.5);
    this.ufoLight = this.physics.add
      .sprite(200, 182, "ufoLight")
      .setOrigin(0, 0)
      .setScale(0.5);

    this.startBtn = this.add
      .tileSprite(
        this.cameras.main.width / 2,
        550,
        this.width,
        this.height,
        "buttonbg"
      )
      .setScale(0.3)
      .setInteractive();

    this.startTitle = this.add
      .text(this.cameras.main.width / 2, 545, "start", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.settingBtn = this.add
      .tileSprite(5, 5, this.width, this.height, "setting")
      .setOrigin(0, 0)
      .setScale(0.25)
      .setInteractive();

    //시작 버튼 이벤트
    this.startBtn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
      this.startTitle.setColor("#B31511");
      this.startTitle.fontSize = "20px";
    });
    this.startBtn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
      this.startTitle.setColor("#000000");
    });

    this.startBtn.on("pointerdown", () => {
      setTimeout(() => {
        this.scene.start("GameScene");
      }, 1000);
    });
    //설정 버튼 이벤트
    this.settingBtn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
    });
    this.settingBtn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
    });

    this.settingBtn.on("pointerdown", () => {
      this.scene.start("SettingScene");
    });

    this.velocityY = this.initialVelocityY;

    this.physics.add.collider(this.doodle, this.platform, () => {
      if (this.velocityY >= 0) {
        this.velocityY = this.initialVelocityY;
        if ($("#soundSetting").val() == "true") {
          this.jumpSound.play();
        }
      }
    });

    console.log($("#soundSetting").val());
  }

  // 키를 눌렀을 때 자신의 한 사이클을 돌고나서 끝나게 하려면 this.player.play("key",true) -> true를 꼭 줘야함
  update() {
    //doodler
    this.velocityY += this.gravity;
    this.doodle.y += this.velocityY;
    this.frame++;
    if (this.frame % 60 == 0) {
      this.timeCount++;
    }
    if (this.timeCount % 3 == 0) {
      if (this.frame % 20 == 0) {
        this.ufoLight.visible = false;
      } else {
        this.ufoLight.visible = true;
      }
    }
  }
}
