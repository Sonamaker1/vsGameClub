trace('menus/MainMenuAddons.hx has loaded successfully');
import('FreeplayState');

function super_new(state){
	state.optionShit =  [
		'story_mode',
		'freeplay',
		'credits',
		'options'
	];
	/*
	'story_mode',
	'freeplay',
	*/
}

function super_runOnce(){
	FlxG.state.bg.setColorTransform(1,1,1,1,255/8,255/8,255/8,1);
}
