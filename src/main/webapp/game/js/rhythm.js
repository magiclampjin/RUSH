class rhythm extends Phaser.Scene{
    constructor(){
        super({
            key : "Scene01"
        });
        this.frame = 0;
        this.sec = 0;
        this.leftbtn;
        this.rightbtn;
        this.downbtn;
        this.Judgement = 0;
        this.jg_point = 0;
        this.bar = [];
        this.times = [30,45,60,90,120,180,240];
        this.speed = 500;
    }
    preload(){
        this.load.image("note","/game/img/bluenote.png");
        this.load.image("gear","/game/img/gear.png");
        this.load.image("bar","/game/img/bar.png");
        //this.load.audio("newjeans","newjeans.mp3");
    }
    
    create(){

        //this.music = this.sound.add("newjeans",{loop:true});
        //this.music.play();

        this.Judgement = this.add.text(350,50,"판정");
        
        this.cursor = this.input.keyboard.createCursorKeys(); 

        this.gear = this.add.sprite(350,350,"gear");

        let BottomBoundary = this.add.rectangle(0,this.cameras.main.height+10, this.cameras.main.width,5, 0xFFFFFF);
        BottomBoundary.setOrigin(0,0);
        this.physics.add.existing(BottomBoundary, true);

        let JudgeLine1 = this.add.rectangle(150,this.cameras.main.height-220, 105,5, 0xFFFFFF);
        JudgeLine1.setOrigin(0,0);
        this.physics.add.existing(JudgeLine1, true);

        let JudgeLine2 = this.add.rectangle(255,this.cameras.main.height-220, 105,5, 0xFFFFFF);
        JudgeLine2.setOrigin(0,0);
        this.physics.add.existing(JudgeLine2, true);

        let JudgeLine3 = this.add.rectangle(360,this.cameras.main.height-220, 105,5, 0xFFFFFF);
        JudgeLine3.setOrigin(0,0);
        this.physics.add.existing(JudgeLine3, true);

        let JudgeLine4 = this.add.rectangle(465,this.cameras.main.height-220, 105,5, 0xFFFFFF);
        JudgeLine4.setOrigin(0,0);
        this.physics.add.existing(JudgeLine4, true);

        this.boxes = [];
        this.aKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.A);
        this.sKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.S);
        this.kKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.K);
        this.lKey = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.L);


        this.physics.add.overlap(JudgeLine1, this.boxes, function(line,box){
            
            console.log(this.jg_point);
            if(this.aKey.isDown){
                this.jg_point++;
                this.boxes.forEach(element => {
                    box.destroy();
                    this.Judgement.setText(this.jg_point);
                });
            }

        }, null, this);

        this.physics.add.overlap(JudgeLine2, this.boxes, function(line,box){
            if(this.sKey.isDown){
                this.jg_point++;
                this.boxes.forEach(element => {
                    box.destroy();
                    this.Judgement.setText(this.jg_point);
                });
            }
        }, null, this);

        this.physics.add.overlap(JudgeLine3, this.boxes, function(line,box){
            
            console.log(this.jg_point);
            if(this.kKey.isDown){
                this.jg_point++;
                this.boxes.forEach(element => {
                    box.destroy();
                    this.Judgement.setText(this.jg_point);
                });
            }

        }, null, this);

        this.physics.add.overlap(JudgeLine4, this.boxes, function(line,box){
            
            console.log(this.jg_point);
            if(this.lKey.isDown){
                this.jg_point++;
                this.boxes.forEach(element => {
                    box.destroy();
                    this.Judgement.setText(this.jg_point);
                });
            }

        }, null, this);

        this.physics.add.overlap(BottomBoundary, this.boxes,function(boundary, box){
            box.destroy();
        });

        this.physics.add.overlap(JudgeLine1, this.bar, function(line, bar){
            bar.destroy();
        });
    }
    
    update(){
        this.frame++;
        if(this.frame%60 == 0){
            this.sec++;
            if(this.sec == 10){
                this.scene.start("GameoverScene",{score : this.jg_point});
            }
        }
        if(this.frame%120 == 0){
            let bar = this.physics.add.sprite(362,0,"bar");
            bar.setImmovable();
            bar.setVelocityY(this.speed);
            this.bar.push(bar);
        }
        if(this.sec>=6){   
            if(this.frame%this.times[(Math.floor(Math.random()*7+1))] == 0){
                let box1 = this.physics.add.sprite(170,-15,"note");
                box1.setOrigin(0,0);
                box1.setImmovable();
                box1.setVelocityY(this.speed);
                this.boxes.push(box1);
            }
            if(this.frame%this.times[(Math.floor(Math.random()*7+1))] == 0){
                let box2 = this.physics.add.sprite(275,-15,"note");
                box2.setOrigin(0,0);
                box2.setImmovable();
                box2.setVelocityY(this.speed);
                this.boxes.push(box2);
            }
            if(this.frame%this.times[(Math.floor(Math.random()*7+1))] == 0){
                let box3 = this.physics.add.sprite(380,-15,"note");
                box3.setOrigin(0,0);
                box3.setImmovable();
                box3.setVelocityY(this.speed);
                this.boxes.push(box3);
            }
            if(this.frame%this.times[(Math.floor(Math.random()*7+1))] == 0){
                let box4 = this.physics.add.sprite(485,-15,"note");
                box4.setOrigin(0,0);
                box4.setImmovable();
                box4.setVelocityY(this.speed);
                this.boxes.push(box4);
            }
        }
        

    }
}