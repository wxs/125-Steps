uniform float time;
uniform vec2 mouse;
uniform vec2 screen;

vec3 concentric(vec2 center, float scale) {
	vec2 screenCoord = gl_FragCoord.xy;
	vec2 delta = screenCoord - center;
	float r = length(delta);
	//float theta = atan2(delta.y, delta.x);
	float s = 0.5 * pow(sin(r/scale) + 1.0, 3.0);
	return vec3(s, s, s);
}

void main() {
	//gl_FragColor = vec4(mouse.x / screen.x, mouse.y / screen.y, mod(time/1000.0, 1.0), 1.0);
	//vec3 a = concentric(screen/2.0, 1.0);

	float scale = mouse.y * 10.0 / screen.y;

	vec3 a = concentric(screen-mouse, scale) * vec3(1.0, 0.0, 0.0);
	vec3 b = concentric(mouse, scale) * vec3(0.0, 1.0, 0.0);

	gl_FragColor = vec4(a + b, 1.0);
}

