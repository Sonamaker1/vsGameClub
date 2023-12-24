trace('menus/FreeplayAddons.hx has loaded succesfully');
function super_runOnce(){
	var G = FlxG.state;
	for (songText in G.grpSongs){
		for (sprite in songText._sprites)
		{
			sprite.setColorTransform(-1,-1,-1,1,255,255,255,1);
		}
	}
}

function super_update(){
	var G = FlxG.state;
	for (songText in G.grpSongs){
		for (sprite in songText._sprites)
		{
			sprite.setColorTransform(-1,-1,-1,1,255,255,255,1);
		}
	}
}
