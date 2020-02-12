uniform sampler2D tex;
uniform float tick;
uniform float time_factor;

uniform vec2 ellipsoidalFactor; //(1.0, 1.0) is perfect circle, (2.0, 1.0) is vertical ellipse, (1.0, 2.0) is horizontal ellipse
	
vec4 permute( vec4 x ) {

	return mod( ( ( x * 34.0 ) + 1.0 ) * x, 289.0 );

} 

vec4 taylorInvSqrt( vec4 r ) {

	return 1.79284291400159 - 0.85373472095314 * r;

}

float snoise( vec3 v ) {

	const vec2 C = vec2( 1.0 / 6.0, 1.0 / 3.0 );
	const vec4 D = vec4( 0.0, 0.5, 1.0, 2.0 );

	// First corner

	vec3 i  = floor( v + dot( v, C.yyy ) );
	vec3 x0 = v - i + dot( i, C.xxx );

	// Other corners

	vec3 g = step( x0.yzx, x0.xyz );
	vec3 l = 1.0 - g;
	vec3 i1 = min( g.xyz, l.zxy );
	vec3 i2 = max( g.xyz, l.zxy );

	vec3 x1 = x0 - i1 + 1.0 * C.xxx;
	vec3 x2 = x0 - i2 + 2.0 * C.xxx;
	vec3 x3 = x0 - 1. + 3.0 * C.xxx;

	// Permutations

	i = mod( i, 289.0 );
	vec4 p = permute( permute( permute(
		i.z + vec4( 0.0, i1.z, i2.z, 1.0 ) )
		+ i.y + vec4( 0.0, i1.y, i2.y, 1.0 ) )
		+ i.x + vec4( 0.0, i1.x, i2.x, 1.0 ) );

	// Gradients
	// ( N*N points uniformly over a square, mapped onto an octahedron.)

	float n_ = 1.0 / 7.0; // N=7

	vec3 ns = n_ * D.wyz - D.xzx;

	vec4 j = p - 49.0 * floor( p * ns.z *ns.z );  //  mod(p,N*N)

	vec4 x_ = floor( j * ns.z );
	vec4 y_ = floor( j - 7.0 * x_ );    // mod(j,N)

	vec4 x = x_ *ns.x + ns.yyyy;
	vec4 y = y_ *ns.x + ns.yyyy;
	vec4 h = 1.0 - abs( x ) - abs( y );

	vec4 b0 = vec4( x.xy, y.xy );
	vec4 b1 = vec4( x.zw, y.zw );


	vec4 s0 = floor( b0 ) * 2.0 + 1.0;
	vec4 s1 = floor( b1 ) * 2.0 + 1.0;
	vec4 sh = -step( h, vec4( 0.0 ) );

	vec4 a0 = b0.xzyw + s0.xzyw * sh.xxyy;
	vec4 a1 = b1.xzyw + s1.xzyw * sh.zzww;

	vec3 p0 = vec3( a0.xy, h.x );
	vec3 p1 = vec3( a0.zw, h.y );
	vec3 p2 = vec3( a1.xy, h.z );
	vec3 p3 = vec3( a1.zw, h.w );

	// Normalise gradients

	vec4 norm = taylorInvSqrt( vec4( dot( p0, p0 ), dot( p1, p1 ), dot( p2, p2 ), dot( p3, p3 ) ) );
	p0 *= norm.x;
	p1 *= norm.y;
	p2 *= norm.z;
	p3 *= norm.w;

	// Mix final noise value

	vec4 m = max( 0.6 - vec4( dot( x0, x0 ), dot( x1, x1 ), dot( x2, x2 ), dot( x3, x3 ) ), 0.0 );
	m = m * m;
	return 42.0 * dot( m*m, vec4( dot( p0, x0 ), dot( p1, x1 ),
		dot( p2, x2 ), dot( p3, x3 ) ) );

}  

vec2 snoise2(vec3 pos)
{
	return vec2(snoise(pos), snoise(pos + vec3(0.0, 0.0, 1.0)));
}

float GetFireDelta(float currTime, vec2 pos, float freqMult, float stretchMult, float scrollSpeed, float evolutionSpeed)
{
	//firewall
	float delta = 0.0;
//	pos.y += (1.0 - pos.y) * 0.5;
	//pos.y += 0.5;
	pos.y /= stretchMult;
	pos *= freqMult;
	pos.y += currTime * scrollSpeed;
//	pos.y -= currTime * 3.0;
	
	delta += snoise(vec3(pos * 1.0, currTime * 1.0 * evolutionSpeed)) * 1.5;
	delta += snoise(vec3(pos * 2.0, currTime * 2.0 * evolutionSpeed)) * 1.5;
	delta += snoise(vec3(pos * 4.0, currTime * 4.0 * evolutionSpeed)) * 1.5;	
	delta += snoise(vec3(pos * 8.0, currTime * 8.0 * evolutionSpeed)) * 1.5;
	delta += snoise(vec3(pos * 16.0, currTime * 16.0 * evolutionSpeed)) * 0.5;

	return delta; 
}
vec4 GetFireColor(float currTime, vec2 pos, float freqMult, float stretchMult, float ampMult)
{
	float delta = GetFireDelta(currTime, pos, freqMult, stretchMult, 3.0, 0.1);
	delta *= min(1.0, max(0.0, 1.0 * (1.0 - pos.y)));
	delta *= min(1.0, max(0.0, 1.0 * (0.0 + pos.y)));
	vec2 displacedPoint = pos + vec2(0, delta * ampMult);
	displacedPoint.y = min(0.99, displacedPoint.y);
	displacedPoint.y = max(0.01, displacedPoint.y);
	
	return texture2D(tex, displacedPoint);
}

vec4 GetCheckboardColor(vec2 pos)
{
	vec4 col = vec4(0.0, 0.0, 0.0, 0.0);
	if(pos.x > 0.0 && pos.x < 1.0 && pos.y > 0.0 && pos.y < 1.0)
	{
		if(mod(pos.x, 0.1) < 0.05 ^^ mod(pos.y, 0.1) < 0.05)
			col = vec4(pos.x, pos.y, 0.0, 1.0);
		else
			col = vec4(0.0, 0.0, 0.0, 1.0);
	}
	return col;
}

vec4 GetLightningColor(float phase, vec2 pos)
{
	vec4 col = texture2D(tex, pos);
	float fadeoffTime = 0.7;
	float propagationIntensity = 0.9 * (1.0 - min(phase / (1.0 - fadeoffTime), 1.0));
	col.a -= propagationIntensity;
	col.a /= (1.0 - propagationIntensity);
	col.a *= pow(1.0 - (phase - (1.0 - fadeoffTime)) / fadeoffTime, 2.0);
	return col;
}

vec2 Rotate(vec2 point, float ang)
{
	return vec2(
		point.x * cos(ang) - point.y * sin(ang),
		point.x * sin(ang) + point.y * cos(ang));
}

void main(void)
{
	vec2 radius = gl_TexCoord[0].xy - vec2(0.5, 0.5);

	radius *= ellipsoidalFactor;
	
	float radiusLen = length(radius);
	vec4 resultColor = vec4(0.0, 0.0, 0.0, 0.0);
	float scaledTime = 5.0 * tick / time_factor;//(1.0 + sin(10.0 * tick / time_factor)) * 0.5;
	scaledTime += GetFireDelta(scaledTime, vec2(0.0, 0.0), 0.01, 1.0, 0.0, 0.05) * 0.3;
	float lightningNum = floor(scaledTime);
	float scale = min(1.0, (scaledTime - floor(scaledTime)) * 1.0);

	vec2 offset = vec2(
		GetFireDelta(lightningNum, vec2(0.0, 0.0), 1.0, 1.0, 0.0, 0.3) * 0.1,
		GetFireDelta(lightningNum, vec2(0.0, 0.0), 1.0, 1.0, 0.0, 0.2) * 0.1);

	float antialiasingRadius = 0.92;
	float antialiasingCoef = 1.0;
	float shieldDensity = 0.1 * 0.0;
	float shieldLuminance = 1.8;
	
	float sinAlpha = radiusLen * 2.0;
	float alpha = 0.0;
	if(sinAlpha > 1.0)
	{
		gl_FragColor = vec4(0.0, 0.0, 0.0, 0.0);
		return;
	}else
	{
		if(sinAlpha > antialiasingRadius)
		{
			antialiasingCoef = (1.0 - sinAlpha) / (1.0 - antialiasingRadius);
		}
		alpha = asin(sinAlpha);
	}
	vec2 sphericalProjectedCoord = radius * (alpha / (3.141592 / 2.0)) / radiusLen;
	sphericalProjectedCoord = Rotate(sphericalProjectedCoord + vec2(scale * 0.1, 0.0), offset.x * 200.0) + offset * 1.3 + vec2(1.0, 1.0);


	vec4 c = GetLightningColor(scale, sphericalProjectedCoord / (3.0 + offset.x * 5.0));

	//exponential thin layer absorbtion under angle alpha
	//layer thickness is c.a * shieldIntensity
	c.a = max(c.a, 0.0);
	//c += vec4(0.05, 0.05, 0.05, 0.05);
	float thickness = c.a * max(0.0, 1.0 / cos(alpha) - 0.7);
	c.a = 1.0 - exp(-thickness * shieldDensity) + thickness * shieldLuminance;

	c.a = min(0.99, c.a) * antialiasingCoef;
	c.a *= gl_Color.a;

	gl_FragColor = c;
}
