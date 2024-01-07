import("hxcodec.flixel.FlxVideo");

var video:FlxVideo = null;
function onCreatePost(){
	//trace(Type.getClassName(Type.getClass(FlxG.state.gfGroup)));
	
	var G = FlxG.state;
    video = new FlxVideo();
    video.play(Paths.video("jake looks ass"));
    video.pause();
    video.time = 0;
	video.stop();
    
	G.add(video);

}


function onEvent(name){
	if(video!=null && name == "jake looks ass"){
		var G = FlxG.state;
		video.time = 0;
		video.play(Paths.video("jake looks ass"));
		video.onEndReached.add(function()
		{
			video.dispose();
			return;
		}, true);
		//trace(name);
		//trace(FlxG.sound.music.time +" / "+video.time);		
		resyncVideo(115208);
	}
}

function resyncVideo(a:Int){
	//trace("Initial: "+FlxG.sound.music.time);
	var timeOffset = FlxG.sound.music.time - a;
	if(video.time>0){
		//trace(video.time);
	}
	if(video!=null && FlxG.sound.music.time>0 && (video.time - (FlxG.sound.music.time - a))>5){
		if(video.time < video.length-2){
			var prevTime = video.time;
			var nextTime = Std.int(timeOffset+2);
			if(prevTime < nextTime){
				video.time = nextTime;
			}
			trace("resynced : " + prevTime +" / "+ video.time);
			
		}else{
			video.stop();
		}
	}
}

function onUpdate(){
	if(video!=null){
		resyncVideo(115208);
	}
}
