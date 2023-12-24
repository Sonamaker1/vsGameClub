trace('menus/CreditsAddons.hx has loaded successfully');

function setFunction(obj, tag, func){
	if(obj.functionVariables != null){
		obj.functionVariables.set(tag, func);
	}
}

import("CreditsState");
//import("Type");
function super_new(){
	var G =  FlxG.state;

	//trace(Type.typeof("")); 
	
	//G.grpOptions.members.length = 0;
	setFunction(CreditsState, "addCreditItem", addCreditItem);
	setFunction(CreditsState, "selectionControls", selectionControls);
	//setFunction(CreditsState, "selectNewItem", selectNewItem);
	//trace(CreditsState.functionVariables);
	//trace(Achievements.myFunc);
}
var headers = [];
function super_runOnce(){
	var G =  FlxG.state;
	var spr = new FlxSprite(0,0).loadGraphic(Paths.image('menuArrows'));
	spr.setGraphicSize(FlxG.width, -1);
	spr.updateHitbox();
	spr.screenCenter();
	G.add(spr);
	
	var spr = new FlxSprite(0,0).makeGraphic(2,2,0xFF003333);
	spr.setGraphicSize(FlxG.width+20, FlxG.height+20);
	spr.updateHitbox();
	spr.screenCenter();
	spr.alpha = 0.5;
	spr.blend = 8;
	G.insert(G.members.indexOf(G.bg)+1, spr);
	
}

var newHeader = "";
var curindex = -1;

function super_update(){
	var G =  FlxG.state;
	//var icon:AttachedSprite = new AttachedSprite('credits/' + G.creditsStuff[i][1]);
	for( i in headers){
		var nullCheck = [i[0]!=null,i[1]!=null, i[2]!=null];
		var isInSection = nullCheck[2] ? (G.curSelected > i[1] && G.curSelected <= i[2]) : false;
		i[0].visible = false;
		if (nullCheck[0] && isInSection){
			i[0].visible = true;
			curindex = i[1];
		}
	}
}


import("AttachedSprite");
import("Alphabet");

function selectionControls(expected:Int){
	var controls = FlxG.state.controls;
	switch(expected){
		case -2: return controls.UI_LEFT;
		case -1: return controls.UI_LEFT_P;
		case 1:  return controls.UI_RIGHT_P;
		case 2:  return controls.UI_RIGHT;
		default: return false;
	}
	return false;	
}

function selectNewItem(item:Alphabet, memberIndex:Int){
	var G =  FlxG.state;
	item.targetY = memberIndex - curSelected;
	item.targetX = memberIndex - curSelected;
	
	if(!G.unselectableCheck(memberIndex)) {
		item.alpha = 0.6;
		if (item.targetY == 0) {
			item.alpha = 1;
		}
	}
}
var repeats = [];
import("options.OptionsState");
function addCreditItem(i:Int){
	if(repeats[i]!=null)
		return;
	repeats[i] = 1;
	
	var G =  FlxG.state;
	var isSelectable:Bool = !G.unselectableCheck(i);
	var optionText:Alphabet = new Alphabet(0, 300, G.creditsStuff[i][0], !isSelectable);

	optionText.screenCenter();
	optionText.isMenuItem = true;
	optionText.targetY = i;
	optionText.distancePerItem.x = FlxG.width *4;
	optionText.startPosition.x = optionText.width/2+FlxG.width/2;
	//optionText.targetX = i;
	optionText.changeX = true;
	optionText.changeY = false;
	optionText.snapToPosition();
	G.grpOptions.add(optionText);

	if(isSelectable) {
		for (sprite in optionText._sprites)
		{
			OptionsState.transformColor(sprite,255,255,255);
		}
		if(G.creditsStuff[i][5] != null)
		{
			Paths.currentModDirectory = creditsStuff[i][5];
		}

		var icon:AttachedSprite = new AttachedSprite('credits/' + G.creditsStuff[i][1]);
		icon.xAdd = -icon.width/2;//optionText.width + 10;
		icon.yAdd = -150;//optionText.width + 10;
		icon.sprTracker = optionText;
		
		var icon2:AttachedSprite = new AttachedSprite('credits/' + G.creditsStuff[i][1]);
		icon2.xAdd = -icon.width/2-icon.width*0.1;//optionText.width + 10;
		icon2.yAdd = -150-icon.height*0.1;//optionText.width + 10;
		icon2.sprTracker = optionText;
		icon2.scale.set(icon2.scale.x+0.2,icon2.scale.x+0.2);
		icon2.updateHitbox();
		OptionsState.transformColor(icon2,255,255,255);
		
		// using a FlxGroup is too much fuss!
		G.iconArray.push(icon);
		G.add(icon2);
		G.add(icon);
		Paths.currentModDirectory = '';
		optionText.setAlignmentFromString("center");
		if(G.curSelected == -1) G.curSelected = i;
		
		if(headers.length>0 && headers[headers.length-1].length>0)
			headers[headers.length-1][2] = i;
	}
	else {
		for (sprite in optionText._sprites)
		{
			sprite.setColorTransform(-1,-1,-1,1,255,255,255,1);
		}
		optionText.setAlignmentFromString("center");
		optionText.visible = true;
		optionText.startPosition.x = FlxG.width/2;
		optionText.startPosition.y = 40;
		optionText.changeX =true;
		optionText.changeY =true;
		optionText.distancePerItem.x = 0;
		optionText.distancePerItem.y = 0;
		optionText.snapToPosition();
		headers.push([optionText,i]);
	}
}



