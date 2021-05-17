#ifdef GL_ES
precision mediump float;
#endif

// uniform vec2 iresolution;
// uniform float itime;

vec3 colorA = vec3(0.149,0.2,0.4);
vec3 colorB = vec3(0.6,0.1,0.4);

float plot(vec2 st) {    
    return smoothstep(0.01, 0.00, abs(st.x - st.y));
}

void main() {
	vec2 st = gl_FragCoord.xy/iResolution.xy;

    // float y = pow(st.x,5.0);
    // float y = step(0.5,st.x);
    float y = smoothstep(0.0,1.0,st.x);

    vec2 uv = vec2(y,st.y);

    vec3 color = vec3(1.0,1.0,1.0);

    // Plot a line
    float pct = plot(uv);
    color = pct*color;
    vec3 colorMix = vec3(0.0);
    colorMix = mix(colorA,colorB,color);
	// gl_FragColor = vec4(color,1.0);
    gl_FragColor = vec4(colorMix,1.0);
    // gl_FragColor = vec4(uv.x,uv.y,0.0,1.0);
}

//-------------------------------------------------------------

return 1;

float MyGlobalVariable;

int MyGlobalFunction(int x){
    return x;
}