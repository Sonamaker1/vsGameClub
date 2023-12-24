local strum = {}

function onCreatePost()
    for Note = 0,7 do 
        strum[Note+1] = getPropertyFromGroup('strumLineNotes', Note, 'y')
    end
end

function onEvent(name, value1, value2)
	if name == 'resetStrums' then
		action = tonumber(value1)
        if action == 1 then
            for Note = 0,7 do 
                strum[Note+1] = getPropertyFromGroup('strumLineNotes', Note, 'y')
                runHaxeCode('trace(" Store: ['.. Note .. '] ' .. strum[Note+1] .. '");')
            end
        end
        if action == 2 then
            for Note = 0,7 do 
                setPropertyFromGroup('strumLineNotes', strum[Note+1], 'y')
                runHaxeCode('trace(" Load: ['.. Note .. '] ' .. strum[Note+1] .. '");' )
            end
        end
    end
end
