local zoom = 0;
function onMoveCamera(char)
    if zoom == 0 then
        zoom = getProperty("defaultCamZoom");
    end

    if char == 'dad' then
        setProperty("defaultCamZoom", 0.8);
    else
        setProperty("defaultCamZoom", zoom);
    end
end
