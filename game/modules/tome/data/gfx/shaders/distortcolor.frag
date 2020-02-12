uniform sampler2D tex;
uniform float tick;
uniform sampler2D mainfbo;
uniform vec2 texSize;
uniform float power;
uniform float power_time;
uniform float power_amp;
uniform float blacken;
uniform vec4 distort_color;

void main(void)
{
	float distortionPower = power * (abs(cos(tick / power_time)) * power_amp + 1.0 - power_amp);
	vec4 distortionColor = texture2D(tex, gl_TexCoord[0].xy);
	vec2 distortionOffset = vec2(distortionColor.r - 0.5, distortionColor.g - 0.5) * distortionPower;
	gl_FragColor = texture2D(mainfbo, gl_FragCoord.xy / texSize.xy + distortionOffset.xy);
	gl_FragColor = mix(gl_FragColor, distort_color, length(distortionOffset) * blacken);
	gl_FragColor.a *= gl_Color.a;
}
