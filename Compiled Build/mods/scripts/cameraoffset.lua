offsetX = 50--offset for the X
offsetY = 50--offset for the Y

--i stole this lol

CLO = false--original cam switch from false or true

CLX = nil--original cam but X
CLY = nil--original cam but Y

CPX = nil--this is the cam movement it self supported by the offsetX
CPY = nil--same this above but for y


function onMoveCamera()
CPX = getProperty('camFollow.x')
CPY = getProperty('camFollow.y')
CLO = false
end

function onUpdatePost()
--this is reset the offset without changing the actual tag it self
if CLO then
setProperty('camFollow.x', CLX)
setProperty('camFollow.y', CLY)
end
end


--bf and gf if camera focus on gf
function goodNoteHit(id, direction, noteType, isSustainNote)
if mustHitSection or gfSection and mustHitSection then

CLO = true
if direction == 0 then
CLX = CPX - offsetX
CLY = CPY
elseif direction == 1 then
CLX = CPX
CLY = CPY + offsetY
elseif direction == 2 then
CLX = CPX
CLY = CPY - offsetY
elseif direction == 3 then
CLX = CPX + offsetX
CLY = CPY

end
end
end


--dad and gf if camera focus on gf
function opponentNoteHit(id, direction, noteType, isSustainNote)

if not mustHitSection or gfSection and not mustHitSection then

CLO = true
if direction == 0 then
CLX = CPX - offsetX
CLY = CPY
elseif direction == 1 then
CLX = CPX
CLY = CPY + offsetY
elseif direction == 2 then
CLX = CPX
CLY = CPY - offsetY
elseif direction == 3 then
CLX = CPX + offsetX
CLY = CPY

end
end
end
