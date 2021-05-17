

// void main(){
//     vec2 st = gl_FragCoord.xy/iResolution.xy;

//     vec2 left = step(vec2(0.1),st); 

//     vec2 top = step(vec2(0.1),1.0-st);

//     vec3 color = vec3(left.x*left.y*top.x*top.y);


//     gl_FragColor = vec4(color,1.0);
// }
// ---------------------------------------------------------------

// void main(){
//     vec2 st = gl_FragCoord.xy / iResolution.xy;
//     vec2 left = smoothstep(0.1,0.3,st);
//     vec2 top = smoothstep(0.1,0.3,1.0-st);



//     vec3 color = vec3(left.x*left.y*top.x*top.y);
//     vec3 color1 = smoothstep(0.2,0.25,color);

//     gl_FragColor = vec4(color1,1.0);
// }

// ---------------------------------------------------------


// vec3 colorA = vec3(0.5,0.5,0.0);
// vec3 colorB = vec3(0.0,0.5,0.5);

// vec3 box(float angle,float angle1,float edge,float offsetX,float offsetY){
//     // float angle =1.0;
//     // float angle1 =1.0;


//     vec2 st = gl_FragCoord.xy / iResolution.xy;
//     // float offsetX = 1.0;

//     float u = st.x + offsetX;
//     float v = st.y + offsetY;
//     vec2 uv = vec2(u,v);

//     vec2 left = smoothstep(0.2,0.4,uv);
//     vec2 top = smoothstep(0.2,0.4,1.0-uv);

//     vec3 color = vec3(left.x*left.y*top.x*top.y);
//     vec3 color1 = smoothstep(angle,angle1,color);
//     vec3 color2 = smoothstep(angle-edge,angle1-edge,color);
//     vec3 color3 = color2 - color1;
//     return color3;
// }

// void main(){

//     vec3 box1 = box(0.55,0.6,0.05,0.0,-0.1);
//     vec3 colorMix = mix(colorA,colorB,box1);

//     gl_FragColor = vec4 (colorMix,1.0);
// }
// ----------------------------------------------------

// vec2 circle(float min,float max){
//     vec2 st = gl_FragCoord.xy/ iResolution.xy;
//     float len = 0.0;
//     len = distance(st,vec2(0.5));


//     // vec2 color = step(vec2(0.1),vec2(len));
//     vec2 color  = smoothstep(min,max,vec2(len));

//     return color;
// }
// void main(){
//     vec2 circle1 = circle(0.1,0.01);
//     gl_FragColor = vec4(circle1.x,circle1.x,circle1.x,1.0);
// }

//-------------------------------------------------------------

// void main(){
//     vec2 st = gl_FragCoord.xy/iResolution.xy;

//     vec2 uv = abs(st*2.-1.);
//     float d = distance(uv,vec2(0.99));


//     gl_FragColor = vec4 (fract(d*10.0),0.0,0.0,1.0);
// }

//--------------------------------------------------------

// void main(){
//     vec2 st = gl_FragCoord.xy/iResolution.xy;
//     vec3 color = vec3(0.0);

//     vec2 uv = st-vec2(0.5);
//     float r = length(uv)*2.;
//     float a = atan(uv.x,uv.y);

//     float f = cos(a*3.);
//     color = vec3(1.-smoothstep(f,f+0.02,r));

//     // gl_FragColor = vec4(f,0.0,0.0,1.0);
//     gl_FragColor = vec4(color,1.0);



// }
//-------------------------------------------------------

// void main(){
//     vec2 uv = gl_FragCoord.xy/iResolution.xy;
//     uv -=0.5;
//     float r = length(uv)*2.;
//     // float color = smoothstep(0.98,0.99,r);
//     // gl_FragColor = vec4 (color,0.0,0.0,1.0);
//     float color = fract(atan(uv.y,uv.x)/6.28318);
//     gl_FragColor = vec4(color,0.0,0.0,1.0);
// }

//----------------------------------------------------------

// void main(){
//     vec2 st = gl_FragCoord.xy/iResolution.xy;

//     vec2 uv = (st-0.5)*2.;
//     float y = length(uv);
//     float r = sin(atan(uv.y,uv.x)*3.);
//     // float r = fract(atan(uv.y,uv.x));
//     float v = smoothstep(r,r+.01,length(uv));
//     gl_FragColor = vec4(v,0.0,0.0,1.0);
// }
//-----------------------------------------------------------------


float remap (float x,float t1,float t2,float s1,float s2){

    return(x-t1)/(t2-t1)*(s2-s1)+s1;
}


void main(){

    vec2 st = gl_FragCoord.xy/iResolution.xy;
    float remapx = remap(st.x,0.,1.,.1,.6);

    gl_FragColor = vec4(remapx,0.0,0.0,1.0);

}
//-----------------------------------------------------------