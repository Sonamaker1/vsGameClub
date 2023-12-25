trace('menus/TitleAddons.hx has loaded succesfully');
var newScale = 1;
function startIntroPost(){
	var state = FlxG.state;
	var logo = state.logoBl;
    state.gfDance.visible = false;


	logo.loadGraphic(Paths.image("logo"));
	logo.setGraphicSize(-1,FlxG.height-120);
	newScale = logo.scale.x;
	logo.updateHitbox();
	logo.screenCenter();
	logo.x += 50;
	//logo.y -= 50;
}

function super_update(elapsed:Float){
	var state = FlxG.state;
	var logo = state.logoBl;
	var minScale = newScale*0.85; 
	var decScale = 0.12;	
	if (FlxG.sound.music != null)
    {
        Conductor.songPosition = FlxG.sound.music.time;

        // Workaround for missing a beat animation on song loop
        if (Conductor.songPosition == 0)
        {
            super_beatHit();
        }
    }

    if (logo != null && logo.scale.x > minScale) {
        logo.scale.x -= decScale * elapsed;
        logo.scale.y -= decScale * elapsed;
    }	
}

function super_beatHit(){
	var state = FlxG.state;
	var logo = state.logoBl;
	
	if(logo != null){ 
		logo.scale.x = newScale;
		logo.scale.y = newScale;
		//FlxTween.cancelTweensOf(logo);
		//FlxTween.tween( logo.scale , {x: 1.25 , y: 1.25 } 0.025, { ease: FlxEase.quadInOut });
    }    
}
