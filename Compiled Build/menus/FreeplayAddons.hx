trace('menus/FreeplayAddons.hx has loaded succesfully');
function super_runOnce(){
	var G = FlxG.state;
	for (songText in G.grpSongs){
		for (sprite in songText._sprites)
		{
			sprite.setColorTransform(-1,-1,-1,songText.alpha,255,255,255,0);
		}
	}
}

function super_update(){
	var G = FlxG.state;
	for (songText in G.grpSongs){
		for (sprite in songText._sprites)
		{
			sprite.setColorTransform(-1,-1,-1,songText.alpha,255,255,255,0);
		}
	}
}
