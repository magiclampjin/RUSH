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
        this.add.text(this.cameras.main.width/2,this.cameras.main.height/2,"기록하시겠습니까?",{
            fontSize : "40px",
            fill : "#FFFFFF"
        }).setOrigin(0.5);
        let record_btn = this.add.text(this.cameras.main.width/2 -100, this.cameras.main.height/2 + 100,"yes", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);

        let restart_btn = this.add.text(this.cameras.main.width/2 + 100, this.cameras.main.height/2 + 100,"no", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);

        this.cursor = this.input.keyboard.createCursorKeys(); 

        restart_btn.on("pointerover",()=>{
            restart_btn.setBackgroundColor("gray");
            this.game.canvas.style.cursor = "pointer";
        });
        restart_btn.on("pointerout",()=>{
            restart_btn.setBackgroundColor("none");
            this.game.canvas.style.cursor = "default";
        })
        restart_btn.on("pointerdown",()=>{
            this.scene.start("Scene01");
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
        });
    }
    update(){

    }
    
}