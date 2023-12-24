function onCreate()
makeLuaSprite('bg', nil, -1500, -1200)
makeGraphic('bg',5000,5000,'696969')
setScrollFactor('bg', 0, 0)
addLuaSprite('bg', false)
end


function onStepHit()
if curStep == 215 or curStep == 651 then
runTimer('move', 4.1, 0)
elseif curStep < 320 then
tag = ('dodo'..i)
setProperty(tag..'.alpha', 0)
elseif curStep >= 320 and curStep < 376 then
tag = ('dodo'..i)
setProperty('dodo1.alpha', 0.3)
setProperty('dodo2.alpha', 0.3)
setProperty(tag..'.alpha', 0.3)
elseif curStep == 568 then
tag = ('dodo'..i)
cancelTimer('move')
elseif curStep == 576 then
removeLuaSprite('dodo1', false)
removeLuaSprite('dodo2', false)
removeLuaSprite('dodo3', false)
removeLuaSprite('dodo4', false)
removeLuaSprite('dodo5', false)
removeLuaSprite('dodo6', false)
removeLuaSprite(tag, false)

elseif curStep > 576 and curStep < 896 then
tag = ('dodo'..i)
setProperty(tag..'.alpha', 0)

elseif curStep >= 896 and curStep < 952 then
tag = ('dodo'..i)
setProperty('dodo1.alpha', 0.3)
setProperty('dodo2.alpha', 0.3)
setProperty(tag..'.alpha', 0.3)

end
end

i = 0
function onTimerCompleted(t)
if t == 'move' then
i = i + 1
if i == 1000 then
i = 0
end
tag = ('dodo'..i)
makeLuaSprite(tag, 'cool thing', 2500,-450)
scaleObject(tag, 2.4, 2.4)
setProperty(tag..'.alpha', 0.3)
setProperty(tag..'.velocity.x', -700)
addLuaSprite(tag, true)
end
end