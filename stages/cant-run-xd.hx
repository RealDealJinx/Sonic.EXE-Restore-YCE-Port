var isPixelStage:Bool = false;
var isCameraMoving:Bool = true;
var animName = "";
var animName2 = "";

var greenHillZone:FlxSprite;
var sky:FlxSprite;
var bt:FlxSprite;
var t:FlxSprite;
var g:FlxSprite;

function create(){
     greenHillZone = new FlxSprite(310,125).loadGraphic(Paths.image('stages/cant-run-xd-pixel/GreenHill'));
     greenHillZone.setGraphicSize(Std.int(greenHillZone.width * PlayState.daPixelZoom));
     greenHillZone.visible = false;
     add(greenHillZone);

     sky = new FlxSprite(-540,-170).loadGraphic(Paths.image('stages/cant-run-xd/sky'));
     sky.visible = true;
     sky.scale.x = 1.3;
     add(sky);

     bt = new FlxSprite(-465,-91).loadGraphic(Paths.image('stages/cant-run-xd/backtrees'));
     bt.visible = true;
     bt.scale.x = 1.3;
     add(bt);

     t = new FlxSprite(-450,-86).loadGraphic(Paths.image('stages/cant-run-xd/trees'));
     t.visible = true;
     t.scale.x = 1.3;
     add(t);
     
     g = new FlxSprite(-527,-133).loadGraphic(Paths.image('stages/cant-run-xd/ground'));
     g.visible = true;
     g.scale.x = 1.3;
     g.scale.y = 1.13;
     add(g);

     if(isPixelStage){
          isCameraMoving = false;
          greenHillZone.visible = true;
          sky.visible = false;
          bt.visible = false;
          t.visible = false;
          g.visible = false;
          PlayState.dad.x += 228;
          PlayState.dad.y += 493;
          PlayState.boyfriend.x += 684;
          PlayState.boyfriend.y -= 700;
          PlayState.gf.x += 251;
          PlayState.gf.y -= 26;
          PlayState.defaultCamZoom = 1.1;
          PlayState.dad.setGraphicSize(Std.int(PlayState.dad.width * PlayState.daPixelZoom));
          PlayState.boyfriend.setGraphicSize(Std.int(PlayState.boyfriend.width * PlayState.daPixelZoom));
          PlayState.gf.setGraphicSize(Std.int(PlayState.gf.width * PlayState.daPixelZoom));
     }

     if(!isPixelStage){
          isCameraMoving = true;
          greenHillZone.visible = false;
          sky.visible = true;
          bt.visible = true;
          t.visible = true;
          g.visible = true;
          PlayState.dad.x -= 200;
          PlayState.dad.y += 20;
          PlayState.boyfriend.x += 310;
          PlayState.boyfriend.y += 75;
          PlayState.gf.x += 380;
          PlayState.gf.y += 127;
          PlayState.defaultCamZoom = 0.8;
     }
}

function update(){
     switch(curStep){
          case 528:
               isCameraMoving = false;
               greenHillZone.visible = true;
               sky.visible = false;
               bt.visible = false;
               t.visible = false;
               g.visible = false;
               PlayState.dad.x += 228;
               PlayState.dad.y += 493;
               PlayState.boyfriend.x += 684;
               PlayState.boyfriend.y += 189;
               PlayState.gf.x += 251;
               PlayState.gf.y -= 26;
               PlayState.defaultCamZoom = 1.1;
               PlayState.dad.setGraphicSize(Std.int(PlayState.dad.width * PlayState.daPixelZoom));
               PlayState.boyfriend.setGraphicSize(Std.int(PlayState.boyfriend.width * PlayState.daPixelZoom));
               PlayState.gf.setGraphicSize(Std.int(PlayState.gf.width * PlayState.daPixelZoom));
               PlayState.remove(PlayState.dad);
               newCharacter = new Character(Std.parseFloat(-90), Std.parseFloat(370), mod + ":" + 'ycr-pixel');
               newCharacter.visible = false;
               PlayState.dads.push(newCharacter);
               PlayState.add(newCharacter);
               PlayState.iconP2.changeCharacter('ycr-pixel', mod);
               newCharacter.visible = true;

               PlayState.remove(PlayState.boyfriend);
               PlayState.boyfriend.destroy();
               PlayState.boyfriends = [new Boyfriend(Std.parseFloat(86), Std.parseFloat(-261), mod + ":" + 'bf-new-pixel')];
               PlayState.add(PlayState.boyfriend);
               PlayState.iconP1.changeCharacter('bf-new-pixel', mod);

               PlayState.remove(PlayState.gf);
               newCharacter = new Character(Std.parseFloat(-90), Std.parseFloat(370), mod + ":" + 'gf-new-pixel');
               newCharacter.visible = false;
               PlayState.add(newCharacter);
               newCharacter.visible = true;
     }
}

function postUpdate(elapsed:Float) {
     animName = PlayState.boyfriend.animation.curAnim.name;
     animName2 = PlayState.dad.animation.curAnim.name;
     if(isCameraMoving){
          if (animName == 'singLEFT') {
               PlayState.camFollow.x -= 20;
          }
          if (animName2 == 'singLEFT') {
               PlayState.camFollow.x -= 20;
          }
          if (animName == 'singRIGHT') {
               PlayState.camFollow.x += 20;
          }
          if (animName2 == 'singRIGHT') {
               PlayState.camFollow.x += 20;
          }
          if (animName == 'singUP') {
               PlayState.camFollow.y -= 20;
          }
          if (animName2 == 'singUP') {
               PlayState.camFollow.y -= 20;
          }
          if (animName == 'singDOWN') {
               PlayState.camFollow.y += 20;
          }
          if (animName2 == 'singDOWN') {
               PlayState.camFollow.y += 20;
          }
     }
     if(!isCameraMoving){
          PlayState.camFollow.x = PlayState.gf.getGraphicMidpoint().x;
          PlayState.camFollow.y = PlayState.gf.getGraphicMidpoint().y;
     }
}