


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
	float ts = floor(t*14.345);
	ResetSeed(vec2(ts*0.123, ts*0.456));

	vec2 p = vUV.xy;
	
	vec2 pR = p;
	vec2 pG = p;
	vec2 pB = p;
	
	float yy = floor(p.y*20+sin(p.y*123.1+sin(p.y*114.1)*45.2)*0.01)/20.0;
	float wi = sin(t*12.3)+sin(t*31.1)+sin(t*41.34);
	pR.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.0)), 5326.0)*0.05*wi;
	pG.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.0 + 0.01)), 5626.0)*0.062*wi;
	pB.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.0 + 0.016)), 5426.0)*0.082*wi;
	pR.x += (0.5-abs(p.x-0.5))*pow(abs(sin(p.y*3.1 + t*1.31)), 2326.0)*0.02;
	pG.x += (0.5-abs(p.x-0.5))*pow(abs(sin(p.y*3.1 + t*1.31 + 0.01)), 626.0)*0.032;
	pB.x += (0.5-abs(p.x-0.5))*pow(abs(sin(p.y*3.1 + t*1.31 + 0.016)), 426.0)*0.011;
	pR.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.43)), 326.0)*0.018;
	pG.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.43 + 0.01)), 2626.0)*0.016;
	pB.x += (0.5-abs(p.x-0.5))*pow(abs(sin(yy + t*1.43 + 0.016)), 2426.0)*0.0134;
	
	
	vec4 color = vec4(texture(sTD2DInputs[0], pR).x ,
		texture(sTD2DInputs[0], pG).y ,
		texture(sTD2DInputs[0], pB).z ,
		1.0);
	// vec4 color = vec4(1.0);
	fragColor = TDOutputSwizzle(color);
}
