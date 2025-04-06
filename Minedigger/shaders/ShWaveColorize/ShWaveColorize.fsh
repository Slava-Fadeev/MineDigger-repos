//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;
uniform vec2 uv;

vec3 hsv2rgb(vec3 c) 
{
	vec4 K = vec4(1.0, 3.0, 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.9, 1.0), c.y);
}

void main()
{
	float pos = (v_vTexcoord.x - uv[0]) / (uv[1] - uv[0]);
	vec3  col = mix(vec3(abs(sin((time * 2.0) + pos) / 2.0) * 2.0, 1.0, 1.0), vec3(2.0, 2.0, 2.0), vec3(2.0, 2.0, 2.0));
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	gl_FragColor = texture2D(gm_BaseTexture, v_vTexcoord) * vec4(hsv2rgb(col), alpha);
}