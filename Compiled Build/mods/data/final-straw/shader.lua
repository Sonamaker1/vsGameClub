function onCreate()
initLuaShader('bloom')
initLuaShader('old film')
end


function onUpdatePost()
if curStep > 2668 then
setShaderFloat("Shader2", "iTime", os.clock())
end

if curStep == 2668 then
makeLuaSprite("Shader1")
setSpriteShader("Shader1", "bloom")

setShaderFloat('Shader1', 'Directions', 5)
setShaderFloat('Shader1', 'Quality', 5)
setShaderFloat('Shader1', 'Size', 10)
setShaderFloat('Shader1', 'dim', 1.8)

makeLuaSprite("Shader2")
setSpriteShader("Shader2", "old film")

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader)]);

game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader2").shader)]);
		]])

addHaxeLibrary("ShaderFilter1", "openfl.filters")
end
end