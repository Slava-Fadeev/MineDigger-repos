//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float red;
uniform float green;
uniform float blue;
uniform float alpha;

void main()
{
    gl_FragColor = vec4(red, green, blue, alpha) + texture2D( gm_BaseTexture, v_vTexcoord );
}
