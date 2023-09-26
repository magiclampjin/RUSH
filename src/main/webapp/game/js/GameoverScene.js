class GameoverScene extends Phaser.Scene{
    constructor(){
        super({
            key:"GameoverScene"});
        }
    preload(){

    }
    init(data){
		console.log(data);
		console.log(data.score);
		this.userScore = data.score;
	}
    create(){
        this.add.text(this.cameras.main.width/2,this.cameras.main.height/2,"Game Over",{
            fontSize : "40px",
            fill : "#FFFFFF"
        }).setOrigin(0.5);
        let record_btn = this.add.text(this.cameras.main.width/2 -100, this.cameras.main.height/2 + 100,"기록하고 메뉴로", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);

        let restart_btn = this.add.text(this.cameras.main.width/2 + 100, this.cameras.main.height/2 + 100,"메뉴", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);

        restart_btn.on("pointerover",()=>{
            restart_btn.setBackgroundColor("gray");
            this.game.canvas.style.cursor = "pointer";
        });
        restart_btn.on("pointerout",()=>{
            restart_btn.setBackgroundColor("none");
            this.game.canvas.style.cursor = "default";
        })
        restart_btn.on("pointerdown",()=>{
			this.scene.stop('GameoverScene');
            this.scene.start("Rhythm_Main_Scene");
            console.log("No 누름");
        });

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