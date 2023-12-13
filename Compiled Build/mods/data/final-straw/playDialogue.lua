local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
    
	return Function_Continue;
end

--[[
Angry AM: 
Normal BF: beepop bu bee, ski tup
Angry AM: WHAT KIND OF B###### IS THIS!?
Smug or Loop BF: .........
Annoyed AM: what?
Normal BF: Bu Beep Bap, Bee ta e bah tro
Angry AM: HOW DO YOU EVEN KNOW THAT?!
Angry AM: THAT'S IT, IM NOT BACKING DOWN ON THIS NEXT ONE.
AngryAM: HOPE YOU'RE READY, BECAUSE I'M GOING TO END YOUR CAREER.
Normal BF: Beep ti.
]]
	
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
        addHaxeLibrary("DialogueUtil","tools")
        runHaxeCode([[
            DialogueUtil.buffer = [];
		    DialogueUtil.makeLine("HUH! WHAT!!!!!!! HOW!?!?!?!?", "am", 'angry', 'angry', 0.05, '');
			DialogueUtil.makeLine("beepop bu bee, ski tup", "bf", 'talk', 'normal', 0.01, '');
		    DialogueUtil.makeLine("WHAT KIND OF B###### IS THIS!?", "am", 'angry', 'angry', 0.05, '');
			DialogueUtil.makeLine(".........", "bf", 'statictalk', 'normal', 0.05, '');
			DialogueUtil.makeLine("what?", "am", 'annoyed', 'normal', 0.05, '');
			DialogueUtil.makeLine("Bu Beep Bap, Bee ta e bah tro", "bf", 'talk', 'normal', 0.01, '');
			DialogueUtil.makeLine("HOW DO YOU EVEN KNOW THAT?!", "am", 'angry', 'angry', 0.02, '');
			DialogueUtil.makeLine("THAT'S IT, IM NOT BACKING DOWN ON THIS NEXT ONE.", "am", 'angry', 'angry', 0.03, '');
			DialogueUtil.makeLine("HOPE YOU'RE READY, BECAUSE I'M GOING TO END YOUR CAREER.", "am", 'angry', 'angry', 0.03, '');
			DialogueUtil.makeLine("Beep ti.", "bf", 'talk', 'normal', 0.01, '');
			
        ]])
		sayDialogue('');
	end
    clearDialogue();
end


-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end