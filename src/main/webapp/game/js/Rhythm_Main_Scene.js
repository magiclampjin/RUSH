class Rhythm_Main_Scene extends Phaser.Scene{
    constructor(){
        super({
            key:"Rhythm_Main_Scene"});
        }
    preload(){
		this.load.image("logo","/game/img/kjlogo.png");
		this.load.image("start","/game/img/start.png");
    }
    create(){
        this.logo = this.add.sprite(this.cameras.main.width/2,this.cameras.main.height/2 - 100,"logo");
        this.logo.setOrigin(0.5);
        
        this.logo = this.add.sprite(this.cameras.main.width/2,this.cameras.main.height/2,"start");
        this.logo.setOrigin(0.5);

        let start_btn = this.add.text(this.cameras.main.width/2 , this.cameras.main.height/2 + 100,"Start!", {
            fontSize : "30px",
            fill : "#FFFFFF"
        }).setOrigin(0.5).setInteractive().setPadding(15);
        
        start_btn.on("pointerover",()=>{
            start_btn.setBackgroundColor("gray");
            this.game.canvas.style.cursor = "pointer";
        });
        start_btn.on("pointerout",()=>{
            start_btn.setBackgroundColor("none");
            this.game.canvas.style.cursor = "default";
        })
        start_btn.on("pointerdown",()=>{
			this.scene.stop('Rhythm_Main_Scene');
            this.scene.start("Scene01",{frame:0, sec:0, point : 0, hp : 5});
        });
    }
    update(){

    }
    
}