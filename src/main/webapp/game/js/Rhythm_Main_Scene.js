class Rhythm_Main_Scene extends Phaser.Scene{
    constructor(){
        super({
            key:"Rhythm_Main_Scene"});
        }
    preload(){

    }
    create(){
        this.add.text(this.cameras.main.width/2,this.cameras.main.height/2,"버튼을 눌러 게임을 시작",{
            fontSize : "40px",
            fill : "#FFFFFF"
        }).setOrigin(0.5);

        let start_btn = this.add.text(this.cameras.main.width/2 , this.cameras.main.height/2 + 100,"게임 시작", {
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
            this.scene.start("Scene01");
        });
    }
    update(){

    }
    
}