shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;

uniform float progress : hint_range(0.0, 1.0) = 0.0;

uniform float seed = 1.0;
uniform float randomness : hint_range(0.0, 1.0) = 0.5;

uniform bool pixelate = false;
uniform float pixel_count = 10.0;

uniform vec2 from_point = vec2(0, 0.5);

float random(vec2 uv) {
	return fract(sin(dot(uv + seed, vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
	vec2 uv = UV;
	if (pixelate) {
		uv = floor(UV * pixel_count) / pixel_count;
	}
	
	vec4 color = texture(SCREEN_TEXTURE, UV);
	
	float rnd = random(uv);
	
	float dis_to_point = pow(distance(uv, from_point), 0.8);
	float value = (dis_to_point/1.414 * (1.0 - randomness)) + (rnd * randomness);
	
	//float bias = uv.x;
	//if (false) { //right_to_left
		//bias = 1.0 - uv.x;
	//}
	//float value = rnd + bias;
	
	if (value < progress) {
		COLOR = vec4(0.0, 0.0, 0.0, 1.0);
	} else {
		COLOR = color;
	}
}