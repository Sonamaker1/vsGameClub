function onCreate()
precacheMusic('pause_busridehome')
end
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
		    DialogueUtil.makeLine("WHAT!", "am", 'upset', 'angry', 0.05, '');
			DialogueUtil.makeLine("Bro, there's no way you won that", "am", 'upset', 'normal', 0.05, '');
			DialogueUtil.makeLine("ski brra, u be boop.", "bf", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine("Oh I'm not done. I'm not letting you win this battle", "am", 'upset', 'normal', 0.05, '');
			DialogueUtil.makeLine("skoo ti, bo bap bop.", "bf", 'talk', 'normal', 0.05, '');
			DialogueUtil.makeLine(".......", "am", 'annoyedStatic', 'normal', 0.05, '');

        ]])
		sayDialogue('');
playMusic('pause_busridehome', 0.7, true)
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
