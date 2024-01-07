function onCreatePost()
setProperty('camGame.zoom', 2)
setProperty('camHUD.zoom', 2)
setProperty('camHUD.alpha', 0)
setProperty('cameraSpeed', 10000)
setProperty('camGame.alpha', 0)

makeLuaSprite('jake1', 'Jake_Dance', -1200, 300)
addLuaSprite('jake1', false)

makeLuaSprite('jake2', 'Jake_Dance', 3000, 300)
setProperty('jake2.flipX',true)
addLuaSprite('jake2', false)

makeLuaText('txt1', "you're my friend now", 1000,150,500)
setObjectCamera('txt1', 'other')
setTextSize('txt1', 50)
setProperty('txt1.visible', false)
addLuaText('txt1')

makeAnimatedLuaSprite('ping', 'Ping', getProperty('dad.x') + 550,getProperty('dad.y') + 960)
addAnimationByPrefix('ping', 'Anim', 'Anim', 24, false)
scaleObject('ping', 0.4, 0.47, true)
setProperty('ping.visible', false)
addLuaSprite('ping', true)

makeAnimatedLuaSprite('twk', 'characters/biggie-nose-cheese', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('twk', 'twerk', 'twerk', 24, true)
setProperty('twk.scale.x', 0.4)
setProperty('twk.scale.y', 0.4)
setProperty('twk.visible', false)
addLuaSprite('twk', true)
end

function onSongStart()
doTweenZoom('1', 'camGame', 1.5, 1, 'sineInOut')
doTweenAlpha('2', 'camGame', 1, 1, 'sineInOut')
doTweenAlpha('3', 'camHUD', 1, 1, 'sineInOut')
end

function onStepHit()
if curStep == 24 then
setProperty('cameraSpeed', 1)
elseif curStep == 36 then
setProperty('txt1.visible', true)
elseif curStep == 50 then
setTextString('txt1', 'were having')
elseif curStep == 56 then
playAnim('ping', 'Anim', true)
setProperty('ping.visible', true)
setProperty('txt1.visible', false)
setProperty('dad.visible', false)
elseif curStep == 64 then
setProperty('dad.visible', true)
setProperty('ping.visible', false)
elseif curStep == 320 or curStep == 896 then
beat = 1
elseif curStep == 323 then
doTweenX('x', 'jake1', -200, 2, 'elasticOut')
doTweenX('x2', 'jake2',1200, 2, 'elasticOut')

elseif curStep == 440 or curStep == 568 or curStep == 1016 or curStep == 1144 then
doTweenAlpha('1', 'camGame', 0.5,0.7,'sineInOut')
beat = 0
elseif curStep == 448 or curStep == 1024 then
doTweenAlpha('1', 'camGame', 1,0.01)
beat = 1
elseif curStep == 576 then
doTweenAlpha('1', 'camGame', 1,0.01)

elseif curStep == 792 then
playAnim('twk', 'twerk', true)
setProperty('twk.visible', true)
setProperty('dad.visible', false)
elseif curStep == 832 then
setProperty('dad.visible', true)
removeLuaSprite('twk', true)
elseif curStep == 1152 then
--startVideo('jake looks ass')
triggerEvent("jake looks ass")
end
end

beat = 0
bleft = false
function onBeatHit()
if curBeat %1 == 0 and beat == 1 then
triggerEvent('Add Camera Zoom', 0,0.1)


scaleObject('jake1', 1,0.5,true)
doTweenY('yscale', 'jake1.scale', 1, 0.5 ,'quadIn')

scaleObject('jake2', 1,0.5,true)
doTweenY('yscale2', 'jake2.scale', 1, 0.5 ,'quadIn')
if bleft then
setProperty('jake1.flipX', true)
setProperty('jake2.flipX', false)
setProperty('camHUD.angle', -3)
doTweenAngle('AngleMove', 'camHUD', 0, crochet/1000, 'quadIn')

bleft = false
else
 setProperty('jake1.flipX', false)
setProperty('jake2.flipX', true)
setProperty('camHUD.angle', 3)
doTweenAngle('AngleMove', 'camHUD', 0, crochet/1000, 'quadIn')

bleft = true


end
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
end

folowcam = false
camX = 700
camY = 500
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
