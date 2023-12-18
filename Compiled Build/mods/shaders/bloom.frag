#pragma header
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main


//BLOOM SHADER BY BBPANZU

const float amount = 0.0;

    // GAUSSIAN BLUR SETTINGS
  	uniform float dim;
    uniform float Directions;
   uniform float Quality; 
   uniform float Size;
void main()
{
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
vec2 Radius = Size/openfl_TextureSize.xy;
	vec2 uv = openfl_TextureCoordv.xy ;


float Pi = 6.28318530718; // Pi*2
    
    

    vec4 Color = texture2D( bitmap, uv);
    
    for( float d=0.0; d<Pi; d+=Pi/Directions){
		for(float i=1.0/Quality; i<=1.0; i+=1.0/Quality){
			

float ex = (cos(d)*Size*i)/openfl_TextureSize.x;
float why = (sin(d)*Size*i)/openfl_TextureSize.y;

Color += flixel_texture2D( bitmap, uv+vec2(ex,why));	


	
        }
    }
    
    Color /= (dim * Quality) * Directions - 15.0;
  vec4 bloom =  (flixel_texture2D( bitmap, uv)/ dim)+Color;

gl_FragColor = bloom;

}