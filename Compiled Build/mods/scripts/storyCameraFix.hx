function onCreatePost(){
	//This is needed for story mode dialogue to not have the camera in the wrong spot
	var G = FlxG.state;
	//Instantly snap camera to correct position (GF's camera position in this case)
	G.camFollowPos.setPosition(G.camFollow.x,G.camFollow.y);
	G.camZooming = true;
	//Reminder, this is 0.6.3, camera stuff is different from 0.7.X !!!!
}
