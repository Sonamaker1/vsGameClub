function onCreatePost(){
		var BG = new FlxSprite();
		BG.makeGraphic(2,2,0xFF6f6f6f);
		BG.scale.set(FlxG.width, FlxG.height);
		BG.scrollFactor.set();
		BG.updateHitbox();
		BG.screenCenter();
		FlxG.state.insert(0,BG);
}
