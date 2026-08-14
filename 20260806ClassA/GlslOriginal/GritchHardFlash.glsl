


uniform float t;

vec2 seed;

void ResetSeed(vec2 v){
	seed = v;
}

float Hash1D(){
	seed = hash2D(seed);
	return seed.x;
}

vec2 Hash2D(){
	seed = hash2D(seed);
	return seed;
}

out vec4 fragColor;
void main()
{
	vec2 p = vUV.xy;
	
	vec2 pR = p;
	vec2 pG = p;
	vec2 pB = p;
	
	float amount = vec4(texture(sTD2DInputs[1], 0.5.xx)).x;

	float freq = 7.87;
	float ymin = hash1D(floor(t*freq))*2.0 - 1.0;
	float ymax = hash1D(floor(t*freq)) + ymin;

	if( p.y > ymin && p.y < ymax){
		
		pG.x += amount;
		pB.x += amount;
	}

	vec4 color = vec4(texture(sTD2DInputs[0], pR).x ,
		texture(sTD2DInputs[0], pG).y ,
		texture(sTD2DInputs[0], pB).z ,
		1.0);
		
	fragColor = TDOutputSwizzle(color);
}
