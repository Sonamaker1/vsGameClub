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

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
        addHaxeLibrary("DialogueUtil","tools")
        runHaxeCode([[
            DialogueUtil.buffer = [];
		    DialogueUtil.makeLine("So this is my studio, what do you think? ", "am", 'talk', 'normal', 0.05, '');
		    DialogueUtil.makeLine("beep bap bo bop! ", "bf", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine("Thanks man, I really appreciate it.", "am", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine("Now with my new studio, How about we record a rap battle", "am", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine("I'm not the best at rapping but, I think I have what it takes to beat you", "am", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine("Bee bop bee bu ski bap!", "bf", 'excited', 'normal', 0.05, '');
			DialogueUtil.makeLine("Alright then fine! Show me what you got!", "am", 'talk', 'normal', 0.05, '');

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
