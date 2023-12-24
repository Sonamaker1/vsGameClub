function onCreate()
addCharacterToList('AMphase2', 'dad')
addCharacterToList('AMMAD', 'dad')
initLuaShader('squares')
end

local color = {
 'blue', 'red', 'green'
}
function onCreatePost()
setProperty('boyfriend.alpha', 0)
setProperty('bg.alpha', 0)
setProperty('dad.alpha', 0)
--setProperty('camHUD.alpha', 0)
setProperty('camGame.zoom', 0.4)

makeAnimatedLuaSprite('The_thing', 'characters/creature', getProperty('dad.x') - 500,getProperty('dad.y') - 300)
addAnimationByPrefix('The_thing', 'left', 'left0', 24, false)
addAnimationByPrefix('The_thing', 'down', 'down0', 24, false)
addAnimationByPrefix('The_thing', 'up', 'up0', 24, false)
addAnimationByPrefix('The_thing', 'right', 'right0', 24, false)
setProperty('The_thing.alpha', 0)
addLuaSprite('The_thing', false)

makeAnimatedLuaSprite('coolshit', 'Cool_anime_shit', 0,0)
setObjectCamera('coolshit', 'other')
addAnimationByPrefix('coolshit', 'idle', 'Cool', 15, true)
setProperty('coolshit.alpha', 0)
addLuaSprite('coolshit', false)


makeLuaSprite("bgfake","amstudio",0,0)
scaleObject('bgfake', 0.4674, 0.4552, true)
setObjectCamera('bgfake', 'hud')
setProperty('bgfake.alpha', 0)
addLuaSprite("bgfake",true)

makeAnimatedLuaSprite('dadfake', 'characters/AM',-100,-500)

addAnimationByPrefix('dadfake', 'idle', 'idle0', 24, false)
addOffset('dadfake', 'idle', 0,0)

addAnimationByPrefix('dadfake', 'left', 'left0', 24, false)
addOffset('dadfake', 'left', 7,0)

addAnimationByPrefix('dadfake', 'down', 'down0', 24, false)
addOffset('dadfake', 'down', 33,-1)

addAnimationByPrefix('dadfake', 'up', 'up0', 24, false)
addOffset('dadfake', 'up', 0,0)

addAnimationByPrefix('dadfake', 'right', 'right0', 24, false)
addOffset('dadfake', 'right', 40,0)

scaleObject('dadfake', 0.23,0.23)
setProperty('dadfake.alpha', 0)
setObjectCamera('dadfake', 'hud')
addLuaSprite('dadfake', true)

makeAnimatedLuaSprite('bffake', 'characters/BOYFRIEND',600,200)
setProperty('bffake.alpha', 0)
scaleObject('bffake', 0.45, 0.45)
setObjectCamera('bffake', 'hud')
addLuaSprite('bffake', true)



for i = 1,#color do
setProperty('The_thing.colorTransform.'..color[i]..'Offset', 255)
end

end


local anim = {
 'left','down','up','right'
}
canplayfake = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'No Animation' then
playAnim('The_thing', anim[direction + 1], true)
end

if canplayfake then
playAnim('dadfake', anim[direction + 1], true)
canplay = false
runTimer('playidle', 0.5)
end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'playidle' then
playAnim('dadfake', 'idle', true)
canplay = true
end
end

canplay = false
function onBeatHit()
if canplay and curBeat %2 == 0 then
playAnim('dadfake', 'idle', false)
end
end


function onSongStart()
doTweenAlpha('1', 'dad', 1,0.5)
setProperty('cameraSpeed', 1000)
folowcam = true
camX = 1400
camY = 700
end



function onStepHit()
if curStep == 80 then
doTweenAlpha('1', 'The_thing', 1,1)
doTweenAlpha('2', 'dad', 0.5,1)
elseif curStep == 128 then
removeLuaSprite('The_thing', true)
setProperty('boyfriend.alpha', 1)
setProperty('bg.alpha', 1)
setProperty('dad.alpha', 1)
setProperty('camHUD.alpha', 1)
camX = 1900
camY = 900
elseif curStep == 191 then
setProperty('cameraSpeed', 0.5)
elseif curStep == 192 then
doTweenAlpha('1', 'bg', 0,4)
doTweenAlpha('2', 'boyfriend', 0,4)
doTweenAlpha('3', 'camHUD', 0,4)
camX = 1400
camY = 700
elseif curStep == 256 then
doTweenAlpha('1', 'bg', 1,0.01)
doTweenAlpha('2', 'boyfriend', 1,0.01)
doTweenAlpha('3', 'camHUD', 1,0.01)
elseif curStep == 259 then
camX = 1900
camY = 900
elseif curStep == 1056 then
doTweenAlpha('1', 'camGame', 1, 0.5)
elseif curStep == 1072 then
doTweenAlpha('1', 'boyfriend', 1, 0.5)
elseif curStep == 1736 then
doTweenAlpha('1', 'camGame', 1, 0.5)
elseif curStep == 1744 then
setProperty('boyfriend.alpha', 1)
elseif curStep == 2112 then
setProperty('coolshit.alpha', 0.7)
setSpriteShader("bg", "squares")
elseif curStep == 2624 then
removeSpriteShader('bg')
doTweenAlpha('1', 'camGame', 0, 3)
doTweenAlpha('2', 'camHUD', 0, 3.3)
doTweenAlpha('3', 'coolshit', 0, 1)
doTweenAlpha('4', 'WBG', 0, 3)
elseif curStep == 2664 then
removeLuaSprite('coolshit', true)
removeLuaSprite('bg', true)
elseif curStep == 2668 then
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
setProperty('boyfriend.x', getProperty('dad.x') + 230)
setProperty('boyfriend.y', getProperty('dad.y') + 450)
folowcam = true
camX = 1400
camY = 700
elseif curStep == 2672 then
doTweenAlpha('1', 'camGame', 0.3, 3)
canplayfake = true
canplay = true
elseif curStep == 2816 then
doTweenAlpha('1', 'camHUD', 1, 1)
doTweenAlpha('2', 'bffake', 0.3, 1)
doTweenAlpha('3', 'dadfake', 0.3, 1)
doTweenAlpha('4', 'bgfake', 0.3, 1)
switchingcam = true
elseif curStep == 3328 then
doTweenAlpha('1', 'camGame', 0, 2)
doTweenAlpha('2', 'camHUD', 0, 2)
end
end
switchingcam = false

function onMoveCamera(f)
if switchingcam then
if f == 'boyfriend' and not mustHitSection then
doTweenAlpha('bfshow', 'boyfriend', 1,1)
doTweenAlpha('dadhide', 'dad', 0,1)
elseif f == 'dad' and mustHitSection then
doTweenAlpha('dadshow', 'dad', 1,1)
doTweenAlpha('bfhide', 'boyfriend', 0,1)
end
end
end

function onUpdatePost()

if curStep > 2816 then
if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
setProperty('bffake.offset.x', -1)
setProperty('bffake.offset.y', -3)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
setProperty('bffake.offset.x', -15)
setProperty('bffake.offset.y', -21)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
setProperty('bffake.offset.x', -24)
setProperty('bffake.offset.y', 15)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
setProperty('bffake.offset.x', -24)
setProperty('bffake.offset.y', -2)

elseif getProperty('boyfriend.animation.curAnim.name') == 'singLEFTmiss' then
setProperty('bffake.offset.x', -1)
setProperty('bffake.offset.y', 9)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWNmiss' then
setProperty('bffake.offset.x', -15)
setProperty('bffake.offset.y', -8)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singUPmiss' then
setProperty('bffake.offset.x', -25)
setProperty('bffake.offset.y', 12)
elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHTmiss' then
setProperty('bffake.offset.x', -23)
setProperty('bffake.offset.y', 10)
else
 setProperty('bffake.offset.x', -5)
setProperty('bffake.offset.y', 0)
end

setProperty('bffake.animation.frameName', getProperty('boyfriend.animation.frameName'))
end

if curStep > 2112 and curStep < 2660 then
setShaderFloat("bg", "iTime", os.clock())
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



folowcam = false
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
