class SettingScene extends Phaser.Scene {
  constructor() {
    super({ key: "SettingScene" });
  }

  preload() {
    this.load.image("background", "/game/doodle/imgs/doodlejumpbg.png");
    this.load.image("buttonbg", "/game/doodle/imgs/buttonbg.png");
  }
  init() {
    this.mouseIsOn = false;
    this.mouseIsOff = false;
    this.soundSetting = $("#soundSetting");
    this.soundCheck = $("#soundSetting").val();
  }

  create() {
    this.back = this.add.tileSprite(0, 0, 360, 650, "background");
    this.back.setOrigin(0, 0);

    this.title = this.add
      .text(this.cameras.main.width / 2, 100, "doodle jump", {
        fontFamily: "Typo_CrayonM",
        fontSize: "50px",
        fill: "#B31511",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5).angle = -10;

    this.homeBtn = this.add
      .tileSprite(
        this.cameras.main.width / 2,
        550,
        this.width,
        this.height,
        "buttonbg"
      )
      .setScale(0.3)
      .setInteractive();

    this.homeTitle = this.add
      .text(this.cameras.main.width / 2, 545, "home", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.soundText = this.add
      .text(this.cameras.main.width / 2, 250, "sound", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "60px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.soundOn = this.add
      .text(120, 320, "on", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#7d7d7d",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5)
      .setInteractive();

    this.soundOff = this.add
      .text(240, 320, "off", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#519454",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5)
      .setInteractive();

    //홈버튼 이벤트
    this.homeBtn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
      this.homeTitle.setColor("#B31511");
    });
    this.homeBtn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
      this.homeTitle.setColor("#000000");
    });

    this.homeBtn.on("pointerdown", () => {
      this.scene.start("StartScene");
    });

    // 사운드 on 버튼 이벤트
    this.soundOn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
      this.mouseIsOn = true;
    });
    this.soundOn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
      this.mouseIsOn = false;
    });
    this.soundOn.on("pointerdown", () => {
      this.soundSetting.val("true");
      this.soundCheck = "true";
    });
    // 사운드 off 버튼 이벤트
    this.soundOff.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
      this.mouseIsOff = true;
    });
    this.soundOff.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
      this.mouseIsOff = false;
    });
    this.soundOff.on("pointerdown", () => {
      this.soundSetting.val("false");
      this.soundCheck = "false";
    });
  }
  update() {
    if (this.soundSetting.val() === "true") {
      this.soundOn.setColor("#519454");
      this.soundOff.setColor("#7d7d7d");
    } else {
      this.soundOn.setColor("#7d7d7d");
      this.soundOff.setColor("#519454");
    }

    console.log("this.sound : " + this.soundCheck);
    if (this.soundCheck === "true") {
      if (this.mouseIsOff) {
        this.soundOff.setColor("#000000");
      } else {
        this.soundOff.setColor("#7d7d7d");
      }
    } else {
      if (this.mouseIsOn) {
        this.soundOn.setColor("#000000");
      } else {
        this.soundOn.setColor("#7d7d7d");
      }
    }
  }
}
