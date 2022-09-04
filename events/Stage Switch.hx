function stageSwitch(newStage:String)
{
     PlayState.remove(PlayState.stage);
     PlayState.remove(PlayState.bf);
     PlayState.remove(PlayState.dad);
     PlayState.remove(PlayState.gf);
     PlayState.remove(PlayState.stage);
     
     PlayState.stage = loadStage(newStage);
     PlayState.global[""] = stage;
     
     PlayState.add(PlayState.stage);
     PlayState.add(PlayState.gf);
     PlayState.add(PlayState.dad);
     PlayState.add(PlayState.bf);
}