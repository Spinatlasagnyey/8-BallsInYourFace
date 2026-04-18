shader_type canvas_item;

uniform float amount_x: hint_range(0, 256) = 8;
uniform float amount_y: hint_range(0, 256) = 8;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	
	
	vec2 pos = SCREEN_UV;
	pos *= vec2(amount_x, amount_y);
	pos = ceil(pos);
	pos /= vec2(amount_x, amount_y);
	vec2 cellpos = pos - (0.5 / vec2(amount_x, amount_y));
	
	pos -= SCREEN_UV;
	pos *= vec2(amount_x, amount_y);
	pos = vec2(1.0) - pos;
	
	float dist = distance(pos, vec2(0.5));
	
	vec4 c = texture(screen_texture, cellpos).rgba;
	
	float mask = step(dist, 0.5 * c.a);
	
	vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
	
	COLOR = mix(black, c, mask);
}