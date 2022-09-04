var greenHillZone:FlxSprite;
var isCameraMoving:Bool = true;
var animName = "";
var animName2 = "";

function create(){
     greenHillZone = new FlxSprite(310,125).loadGraphic(Paths.image('stages/cant-run-xd-pixel/GreenHill'));
     greenHillZone.setGraphicSize(Std.int(greenHillZone.width * PlayState.daPixelZoom));
     greenHillZone.visible = false;
     add(greenHillZone);
}

function stepHit(){
     switch(curStep){
          case 528:
               PlayState.remove(PlayState.dad);
               isCameraMoving = false;
               greenHillZone.visible = true;
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
     PlayState.health = PlayState.health / 1.1;
     animName = PlayState.boyfriend.animation.curAnim.name;
     animName2 = PlayState.dad.animation.curAnim.name;
     if(isCameraMoving){
          if (animName == 'singLEFT') {
               PlayState.camFollow.x -= 10;
          }
          if (animName2 == 'singLEFT') {
               PlayState.camFollow.x -= 10;
          }
          if (animName == 'singRIGHT') {
               PlayState.camFollow.x += 10;
          }
          if (animName2 == 'singRIGHT') {
               PlayState.camFollow.x += 10;
          }
          if (animName == 'singUP') {
               PlayState.camFollow.y -= 10;
          }
          if (animName2 == 'singUP') {
               PlayState.camFollow.y -= 10;
          }
          if (animName == 'singDOWN') {
               PlayState.camFollow.y += 10;
          }
          if (animName2 == 'singDOWN') {
               PlayState.camFollow.y += 10;
          }
     }
     if(!isCameraMoving){
          PlayState.camFollow.x = PlayState.gf.getGraphicMidpoint().x;
          PlayState.camFollow.y = PlayState.gf.getGraphicMidpoint().y;
     }
}