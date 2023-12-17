function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end--hex color support

function onCreatePost()
setTimeBarColors('000000', rgbToHex(getProperty('dad.healthColorArray')))--timebar color change before the game starts


makeLuaText('scoreTxt2','',getTextWidth('scoreTxt'),getProperty('scoreTxt.x'),getProperty('scoreTxt.y'))
setObjectCamera('scoreTxt2', 'hud')
setTextSize('scoreTxt2', getTextSize('scoreTxt'))
addLuaText('scoreTxt2', true)
setTextColor('scoreTxt2', rgbToHex(getProperty('dad.healthColorArray')))
setTextColor('scoreTxt', rgbToHex(getProperty('boyfriend.healthColorArray')))
end

function onUpdate()
setProperty("scoreTxt2._frame.frame.width", 1 - getProperty('healthBar.percent') * 6.7 + 970)
setProperty('scoreTxt2.scale.x', getProperty('scoreTxt.scale.x'))
setProperty('scoreTxt2.scale.y', getProperty('scoreTxt.scale.y'))
setTextString('scoreTxt2',getTextString('scoreTxt'))
setProperty('scoreTxt2.visible', getProperty('scoreTxt.visible'))
setProperty('scoreTxt2.alpha', getProperty('scoreTxt.alpha'))
end


function onEvent(n)
if n == 'Change Character' then--timebar color change when characters change
setTimeBarColors('000000', rgbToHex(getProperty('dad.healthColorArray')))
setTextColor('scoreTxt2', rgbToHex(getProperty('dad.healthColorArray')))
setTextColor('scoreTxt', rgbToHex(getProperty('boyfriend.healthColorArray')))
end
end