class GameoverScene extends Phaser.Scene{
    constructor(){
        super({
            key:"GameoverScene"});
        }
    preload(){
		this.load.image("over","/game/img/gameover.png");
    }
    init(data){
		console.log(data);
		console.log(data.score);
		this.userScore = data.score;
	}
    create(){
        
        let record_btn = this.add.text(this.cameras.main.width/2, this.cameras.main.height/2 + 100,"기록하고 메뉴로", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);

		this.over = this.add.sprite(this.cameras.main.width/2,this.cameras.main.height/2,"over");
        this.over.setOrigin(0.5);

        record_btn.on("pointerover",()=>{
            record_btn.setBackgroundColor("gray");
            this.game.canvas.style.cursor = "pointer";
        });
        record_btn.on("pointerout",()=>{
            record_btn.setBackgroundColor("none");
            this.game.canvas.style.cursor = "default";
        })
        record_btn.on("pointerdown",()=>{
			setRecord(this.userScore);
			this.scene.start("Rhythm_Main_Scene");
        });
    }
    update(){

    }
    
}