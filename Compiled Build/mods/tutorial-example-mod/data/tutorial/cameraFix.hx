function onCreatePost(){
	var G = FlxG.state;
	//Instantly snap camera to correct position (GF's camera position in this case)
	G.camFollowPos.setPosition(G.camFollow.x,G.camFollow.y);
	
	//Reminder, this is 0.6.3, camera stuff is different from 0.7.X !!!!
}
