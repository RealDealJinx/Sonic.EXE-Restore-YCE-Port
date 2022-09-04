var animName = "";
var animName2 = "";

function postUpdate(elapsed:Float) {
     animName = PlayState.boyfriend.animation.curAnim.name;
     animName2 = PlayState.dad.animation.curAnim.name;
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