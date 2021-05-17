
// vec3 colorA = vec3(0.149,0.2,0.4);
// vec3 colorB = vec3(0.6,0.1,0.4);

// void main(){
//     vec3 color = vec3(0.0);
//     float pct = abs(sin(iTime));
//     color = mix(colorA,colorB,pct);
//     gl_FragColor = vec4(color,1.0);
// }

// -------------------------------------------------------------------------------------
// float PI= 3.14;
// vec3 colorA = vec3(0.149,0.141,0.912);
// vec3 colorB = vec3(1.000,0.833,0.224);

// float plot (vec2 st, float pct){
//   return  smoothstep( pct-0.01, pct, st.y) -
//           smoothstep( pct, pct+0.01, st.y);
// }

// void main() {
//     vec2 st = gl_FragCoord.xy/iResolution.xy;
//     vec3 color = vec3(0.0);

//     vec3 pct = vec3(st.x);

//     pct.r = smoothstep(0.0,1.0, st.x);
//     pct.g = sin(st.x*PI);
//     pct.b = pow(st.x,0.5);

//     color = mix(colorA, colorB, pct);

//     color = mix(color,vec3(1.0,0.0,0.0),plot(st,pct.r));
//     color = mix(color,vec3(0.0,1.0,0.0),plot(st,pct.g));
//     color = mix(color,vec3(0.0,0.0,1.0),plot(st,pct.b));

//     gl_FragColor = vec4(color,1.0);
// }
// ------------------------------------------------------------------------------------------------------
    vec3 colorA = vec3(0.8,0.3,0.0);
    vec3 colorB = vec3(0.3,0.3,0.8);
    vec3 colorC = vec3(0.9,0.6,0.0);
    vec3 colorD = vec3(0.3,0.3,0.6);
void main(){
    vec2 st = gl_FragCoord.xy/iResolution.xy;
    vec2 uv = st;


    float a = abs(uv.y - 0.3);

    float b = smoothstep(0.0,1.0,a);
    float e = smoothstep(0.0,0.3,a);
    vec2 aa = vec2 (uv.x-0.8,uv.y-0.3-sin(iTime*0.1)*0.3);
    float c = length(aa);
    float d = smoothstep(0.022,0.011,c);

    // vec3 colorD = vec3(d*1.0,d*0.7,0.0);
    
    vec3 colorMix = vec3(b-d,1.0-e,d);

    vec3 color = mix(colorA,colorB,colorMix.x);
    vec3 color2 = mix(color,colorD,colorMix.y);
    vec3 color1 = mix(color2,colorC,colorMix.z);
 


    gl_FragColor = vec4(color1,1.0);
    // gl_FragColor = vec4(d,0.0,0.0,1.0);
    


}

