function onCreate()
initLuaShader('old film')

end


function onUpdatePost()
if curStep > 1736 then
setShaderFloat("Shader2", "iTime", os.clock())
end

if curStep == 1736 then
makeLuaSprite("Shader2")
setSpriteShader("Shader2", "old film")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader2").shader)]);
		]])

addHaxeLibrary("ShaderFilter1", "openfl.filters")
end
end