function onCreate()
addCharacterToList('creature', 'dad')
addCharacterToList('AM', 'dad')
end

function onCreatePost()
setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)
setProperty('boyfriend.alpha', 0)
triggerEvent('camera_target', 'dad', '100')
end

function onSongStart()
setProperty('camGame.alpha', 1)
doTweenAlpha('1', 'camGame', 0,1.5)
end


function onStepHit()
if curStep == 32 or curStep == 64 or curStep == 96 or curStep == 736 then
doTweenAlpha('1', 'camGame', 0,1.5)
setProperty('camGame.alpha', 1)
elseif curStep == 30 or curStep == 94 then
setProperty('boyfriend.alpha', 1)
setProperty('dad.alpha', 0)
elseif curStep == 62 then
setProperty('boyfriend.alpha', 0)
setProperty('dad.alpha', 1)
elseif curStep == 126 then
setProperty('dad.alpha', 1)
elseif curStep == 128 then
doTweenAlpha('1', 'camGame', 1,1)
doTweenAlpha('2', 'camHUD', 1,1)

elseif curStep == 1040 then
setProperty('boyfriend.x', 700)
setProperty('boyfriend.y', 350)
setProperty('dad.x', 0)
setProperty('dad.y', 0)
setProperty('bg.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)

elseif curStep == 1088 then
doTweenAlpha('1', 'camGame', 1, 1.5)
elseif curStep == 1152 then
doTweenAlpha('2', 'camHUD', 1, 1.5)
elseif curStep == 1280 then
setProperty('boyfriend.x', 2000)
setProperty('boyfriend.y', 600 + 350)
setProperty('dad.x', -240 + 1200)
setProperty('dad.y', -445 + 580)
setProperty('boyfriend.alpha', 1)
elseif curStep == 1730 then
setProperty('dad.x', 0)
setProperty('dad.y', 0)
setProperty('bg.visible', false)
setProperty('boyfriend.alpha', 0)
elseif curStep == 1736 then
doTweenAlpha('1', 'camGame', 1, 10)
elseif curStep == 1856 then
doTweenAlpha('1', 'camGame', 0, 0.8)
end
end

function onEvent(n,v1,v2)
if n == 'camera_target' then
if v1 == 'all' then
folowcam = true
else
 folowcam = false
end
end

if n == 'WBG' then
if v1 == 'Bon' or v1 == 'Won' then
setProperty('bg.visible', false)
else
 setProperty('bg.visible', true)
end
end
end

folowcam = true
camX = 1900
camY = 900
function onUpdate()
if folowcam then
if mustHitSection then
if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
setProperty('camFollow.x', camX - 50)
setProperty('camFollow.y', camY)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY + 50)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY - 50)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
setProperty('camFollow.x', camX + 50)
setProperty('camFollow.y', camY)

else
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end

elseif not mustHitSection then
if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
setProperty('camFollow.x', camX - 50)
setProperty('camFollow.y', camY)
elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY + 50)
elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY - 50)
elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
setProperty('camFollow.x', camX + 50)
setProperty('camFollow.y', camY)

else
setProperty('camFollow.x', camX)
setProperty('camFollow.y', camY)
end
end



end
end