trace('menus/StoryMenuAddons.hx has loaded succesfully');
function super_runOnce(){
	var G = FlxG.state;
	var t = 0;
	var spr = null;
	for (sprite in G.members)
	{
		t++;
		if(sprite != null && Reflect.fields(sprite).indexOf("colorTransform")!=-1){
			if(t!=3 && t!=13 && t!=6 && t!=11) {
				trace(t);
				sprite.setColorTransform(-1,-1,-1,1,255,255,255,1);
			}
			else if (t==6) {
				sprite.loadGraphic(Paths.image("amstudio"));
				sprite.setGraphicSize(FlxG.width,-1);
				sprite.updateHitbox();
				sprite.setColorTransform(0.5,0.5,0.5,1,0,0,0,1);
				spr = sprite;
			}
		}
		
	}
	G.remove(spr);
	G.insert(1,spr);
}
