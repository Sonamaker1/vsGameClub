
var videoPlayed = false; //:FlxVideo = null;
function onEvent(name){
	if(name == "jake looks ass"){
		var u = FlxG.state.getLuaObject("videoFrames");
		u.setGraphicSize(FlxG.width,FlxG.height);
		u.screenCenter();
		u.visible = true;
		u.animation.play("frames");
	}
}

