function onCreatePost()
setProperty('boyfriend.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)

setProperty('camGame.alpha', 0)
setProperty('camHUD.alpha', 0)

for i = 0,3 do
setPropertyFromGroup('strumLineNotes', i, 'x', 80000002)
end
setPropertyFromGroup('strumLineNotes', 4, 'x',412)
setPropertyFromGroup('strumLineNotes', 5, 'x',524)
setPropertyFromGroup('strumLineNotes', 6, 'x',636)
setPropertyFromGroup('strumLineNotes', 7, 'x',748)


makeAnimatedLuaSprite('dad2', 'characters/creature', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('dad2', 'left', 'left0', 24, false)
addAnimationByPrefix('dad2', 'down', 'down0', 24, false)
addAnimationByPrefix('dad2', 'up', 'up0', 24, false)
addAnimationByPrefix('dad2', 'right', 'right0', 24, false)
setProperty('dad2.alpha', 0)
addLuaSprite('dad2', false)

setProperty('dad2.colorTransform.blueOffset', -255)
setProperty('dad2.colorTransform.redOffset', -255)

makeAnimatedLuaSprite('dad3', 'characters/creature', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('dad3', 'left', 'left0', 24, false)
addAnimationByPrefix('dad3', 'down', 'down0', 24, false)
addAnimationByPrefix('dad3', 'up', 'up0', 24, false)
addAnimationByPrefix('dad3', 'right', 'right0', 24, false)
setProperty('dad3.alpha', 0)
addLuaSprite('dad3', false)
setProperty('dad3.colorTransform.blueOffset', -255)
setProperty('dad3.colorTransform.greenOffset', -255)


makeAnimatedLuaSprite('dad4', 'characters/creature', getProperty('dad.x'),getProperty('dad.y'))
addAnimationByPrefix('dad4', 'left', 'left0', 24, false)
addAnimationByPrefix('dad4', 'down', 'down0', 24, false)
addAnimationByPrefix('dad4', 'up', 'up0', 24, false)
addAnimationByPrefix('dad4', 'right', 'right0', 24, false)
setProperty('dad4.alpha', 0)
addLuaSprite('dad4', false)
setProperty('dad4.colorTransform.redOffset', -255)
setProperty('dad4.colorTransform.greenOffset', -255)
end


local anim = {
 'left','down','up','right'
}
canplayfake = false
function opponentNoteHit(id, direction, noteType, isSustainNote)
if not isSustainNote then
playAnim('dad2', anim[getRandomInt(1,4)], true)
playAnim('dad3', anim[getRandomInt(1,4)], true)
playAnim('dad4', anim[getRandomInt(1,4)], true)
end

setProperty('dad2.alpha', 0.5)
setProperty('dad3.alpha', 0.5)
setProperty('dad4.alpha', 0.5)
doTweenAlpha('1', 'dad2', 0,0.7)
doTweenAlpha('2', 'dad3', 0,0.7)
doTweenAlpha('3', 'dad4', 0,0.7)
end


function onStepHit()
if curStep == 1 then
doTweenAlpha('1', 'camGame', 1, 10)
elseif curStep == 192 then
doTweenAlpha('1', 'dad', 1, 5)
elseif curStep == 480 then
setProperty('boyfriend.visible', false)
setProperty('iconP1.visible', false)
setProperty('healthBar.visible', false)
setProperty('healthBarBG.visible', false)
setProperty('iconP2.visible', false)
setProperty('scoreTxt.visible', false)
setProperty('timeBar.visible', false)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)
elseif curStep == 1464 then
doTweenAlpha('6', 'camGame', 1, 1.5)
elseif curStep == 1472 then
doTweenAlpha('6', 'camGame', 0, 0.01)
end
end