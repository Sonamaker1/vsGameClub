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

var tweenThing = null;
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

    if (logo != null && logo.scale.x > minScale && tweenThing==null) {
        logo.scale.x -= decScale * elapsed;
        logo.scale.y -= decScale * elapsed;
    }	
}


function super_stepHit(curStep){
        
    if(curStep%4 == 3){
        var state = FlxG.state;
        var logo = state.logoBl;

        if(logo != null){ 
            //logo.scale.x = newScale;
            //logo.scale.y = newScale;
            FlxTween.cancelTweensOf(logo);
            tweenThing = FlxTween.tween( logo.scale , {x: newScale , y: newScale } , Conductor.stepCrochet/1000, { delay:Conductor.stepCrochet/1000*1/2, ease: FlxEase.sineInOut, onComplete:function(){tweenThing = null;} });
        }   
    }
}

function super_beatHit(){
	var state = FlxG.state;
	var logo = state.logoBl;

	if(logo != null){ 
		//logo.scale.x = newScale;
		//logo.scale.y = newScale;
		FlxTween.cancelTweensOf(logo);
		tweenThing = FlxTween.tween( logo.scale , {x: newScale , y: newScale } , Conductor.stepCrochet/1000*1/8, { delay:Conductor.stepCrochet/1000*1/2, ease: FlxEase.sineOut, onComplete:function(){tweenThing = null;} });
	}   
}
