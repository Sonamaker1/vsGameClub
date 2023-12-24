function onCreate()

makeLuaSprite("Shader1")
setSpriteShader("Shader1", "bloom")
setShaderFloat('Shader1', 'Directions', 5)
setShaderFloat('Shader1', 'Quality', 5)
setShaderFloat('Shader1', 'Size', 10)
setShaderFloat('Shader1', 'dim', 1.8)

makeLuaSprite("Shader2")
setSpriteShader("Shader2", "old film")

makeLuaSprite("Shader3")
setSpriteShader("Shader3", "CameraGlitch")
setShaderBool('Shader3', 'vignetteOn', true)
setShaderBool('Shader3', 'scanlinesOn', true)
setShaderBool('Shader3', 'perspectiveOn', true)

runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader2").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])

addHaxeLibrary("ShaderFilter1", "openfl.filters")
end


function onUpdatePost()
setShaderFloat("Shader3", "iTime", os.clock())
if curStep < 256 then
setShaderFloat("Shader2", "iTime", os.clock())
end

if curStep == 256 then
runHaxeCode([[
trace(ShaderFilter);
game.camGame.setFilters([new ShaderFilter(game.getLuaObject("Shader1").shader),new ShaderFilter(game.getLuaObject("Shader3").shader)]);
game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("Shader3").shader)]);
		]])
end
end