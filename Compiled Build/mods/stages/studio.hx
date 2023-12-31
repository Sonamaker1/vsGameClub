import("flixel.group.FlxTypedSpriteGroup");
var studioGroup = null;
function onCreatePost(){
	//trace(Type.getClassName(Type.getClass(FlxG.state.gfGroup)));
	
	var G = FlxG.state;
    studioGroup = new FlxTypedSpriteGroup();
    //studioGroup.add(G.modchartSprites.get("bg"));
    studioGroup.add(G.modchartSprites.get("bg2"));
    studioGroup.add(G.gf);
    studioGroup.add(G.modchartSprites.get("bg3"));
    G.variables.set("studioGroup", studioGroup);
}


function onEvent(name){
	if(studioGroup!=null && name == "hide studio group"){
		studioGroup.alpha = 0.0001;
		//studioGroup.color = 0xFF0000;
	}
	
	if(studioGroup!=null && name == "show studio group"){
		studioGroup.alpha = 1;
		studioGroup.color = 0xFFFFFF;
	}
    
    //studioGroup.color = 0xFF0000;
    trace(name);
}
