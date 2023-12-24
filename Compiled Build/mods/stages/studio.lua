function onCreate()
makeLuaSprite("bg","amstudio",0,0)
scaleObject('bg', 1.2, 1.2, true)
addLuaSprite("bg",false)

makeLuaSprite("bg2","BG_GF",1012,430)
scaleObject('bg2', 0.975, 0.978)
addLuaSprite("bg2",false)

makeLuaSprite("bg3","FG_GF",1012,430)
scaleObject('bg3', 0.975, 0.978)
addLuaSprite("bg3",false)
end

function onCreatePost()
setObjectOrder('bg3', getObjectOrder('gfGroup') + 1)
setObjectOrder('dadGroup', getObjectOrder('bg3') + 1)
setProperty('gf.scale.x', 0.875)
setProperty('gf.scale.y', 0.875)
end


function onUpdatePost()
setProperty('bg2.visible', getProperty('bg.visible'))
setProperty('bg2.alpha', getProperty('bg.alpha'))

setProperty('bg3.visible', getProperty('bg.visible'))
setProperty('bg3.alpha', getProperty('bg.alpha'))

setProperty('gf.visible', getProperty('bg.visible'))
setProperty('gf.alpha', getProperty('bg.alpha'))
end
