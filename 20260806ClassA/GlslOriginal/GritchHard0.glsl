


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
	int numRect = int(sin(ts)*12 + 16)*5;
	
	vec2 pR = p;
	vec2 pG = p;
	vec2 pB = p;
	
	for(int i = 0; i<numRect; i++){
		
		vec2 rnd = Hash2D();
		
		float xc = Hash1D();
		float width = Hash1D()*0.5 + 0.05;
		float xmi = xc - width*0.5;
		float xma = xc + width*0.5;

		float yc = Hash1D();
		float height = Hash1D()*0.05 + 0.05;
		float ymi = yc - height*0.5;
		float yma = yc + height*0.5;

		float amountX = -0.2 + 0.4*rnd.x;
		float amountY = -0.05 + 0.1*rnd.y;
		vec2 offset = vec2(amountX, amountY);

		if( texture(sTD2DInputs[1], vec2(xc,yc)).x < 0.3+0.2*hash1D(float(i))){
			continue;
		}
		
		if(xmi < p.x && p.x<xma && ymi < p.y && p.y<yma){
			if(i%6==0){
				pR += offset;
			}else if(i%6==1){
				pG += offset;

			}else if (i%6==2){
				pB += offset;
			}else{
				pR += offset;
				pG += offset;
				pB += offset;
			}
		}

	}
	
	
	vec4 color = vec4(texture(sTD2DInputs[0], pR).x ,
		texture(sTD2DInputs[0], pG).y ,
		texture(sTD2DInputs[0], pB).z ,
		1.0);
	// vec4 color = vec4(1.0);
	fragColor = TDOutputSwizzle(color);
}
