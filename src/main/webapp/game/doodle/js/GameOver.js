class GameOver extends Phaser.Scene {
  constructor() {
    super({ key: "GameOver" });
  }

  preload() {
    this.load.image("background", "/game/doodle/imgs/doodlejumpbg.png");
    this.load.image("buttonbg", "/game/doodle/imgs/buttonbg.png");
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
        this.cameras.main.width / 4,
        550,
        this.width,
        this.height,
        "buttonbg"
      )
      .setScale(0.3)
      .setInteractive();

    this.homeTitle = this.add
      .text(this.cameras.main.width / 4, 545, "home", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.againBtn = this.add
      .tileSprite(
        (this.cameras.main.width * 3) / 4,
        550,
        this.width,
        this.height,
        "buttonbg"
      )
      .setScale(0.3)
      .setInteractive();

    this.againTitle = this.add
      .text((this.cameras.main.width * 3) / 4, 545, "again", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "50px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.score = this.add
      .text(this.cameras.main.width / 2, 250, "score", {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "80px",
        fill: "#000000",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

    this.scoreText = this.add
      .text(this.cameras.main.width / 2, 350, $("#score").val(), {
        fontFamily: "GangwonEduHyeonokT_OTFMediumA",
        fontSize: "100px",
        fill: "#519454",
        fontWeight: "bold",
        align: "center",
      })
      .setOrigin(0.5);

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

    //다시시작 이벤트
    this.againBtn.on("pointerover", () => {
      this.game.canvas.style.cursor = "pointer";
      this.againTitle.setColor("#B31511");
    });
    this.againBtn.on("pointerout", () => {
      this.game.canvas.style.cursor = "default";
      this.againTitle.setColor("#000000");
    });

    this.againBtn.on("pointerdown", () => {
      console.log("ektltkwkr");
      this.scene.start("GameScene");
    });
  }
  update() {}
}
