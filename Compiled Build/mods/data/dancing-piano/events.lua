function onStepHit()
if curStep == 1156 then
setProperty('boyfriend.color', getColorFromHex('000000'))
setProperty('dad.color', getColorFromHex('000000'))
setProperty('bg.alpha', 0)
elseif curStep == 1160 then
doTweenAlpha('1', 'bg', 1,30)
elseif curStep == 1224 then
doTweenAlpha('1', 'bg', 1,7)
doTweenColor('2', 'boyfriend', 'ffffff',7)
doTweenColor('3', 'dad', 'ffffff',7)
doTweenAlpha('4', 'camHUD', 1,7)
elseif curStep == 1795 then
doTweenAlpha('4', 'camHUD', 0,0.5)
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