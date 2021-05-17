
// float circle (vec2 _st , float _radius){
//    vec2 l = _st-vec2(.5);
//    return 1.- smoothstep(_radius-(_radius*.01), _radius+(_radius*.01),dot (l,l)*4.);
// }


// void main(){
//    vec2 st = gl_FragCoord.xy/iResolution.xy;
//    // st = st-.5;
//    vec2 uv = fract(st*5.);

//    vec3 color = vec3(.0);

//    // float r = length(uv);
//    // float color = smoothstep(.1,.12,r);
//    color = vec3(circle(uv,1.0));

//    gl_FragColor = vec4(color,1.0);
// }

//---------------------------------------------------------------------

// void main(){
//    vec2 st = gl_FragCoord.xy/iResolution.xy;
//    vec2 uv = st- vec2(.5);
//    float s = fract(dot (uv,uv)*4.);

//    gl_FragColor = vec4 (s,.0,.0,1.);
// }
//-------------------------------------------------------------------

// vec2 rotate2D(vec2 _st,float _angle){
//    _st -=.5;
//    _st = mat2(cos(_angle),-sin(_angle),
//                sin(_angle),cos(_angle))*_st;
//    _st +=.5;

//    return _st ;
// }

// vec2 tile(vec2 _st,float _time){
//    _st *= _time;
//    return fract(_st);   
// }

float box(vec2 _st, vec2 _size, float _smoothEdges){
   _size = .5-_size*.5;
   vec2 aa = vec2(_smoothEdges*.5);
   vec2 uv = smoothstep(_size,_size+aa,_st);
   uv *= smoothstep(_size,_size+aa,vec2(1.)-_st);
   return uv.x * uv.y;

}

// void main(){

//    vec2 st = gl_FragCoord.xy/iResolution.xy;
//    vec3 color = vec3(.0);
//    float PI = 3.141592653;
//    float time = 10.;
//    float roate = iTime*.1;
//    st = rotate2D(st,PI*roate);
//    st = tile(st,time);

//    color = vec3 (box(st,vec2 ((sin(iTime)+1.)/2.*1.),time*.01));
//    vec3 colormix = sin(iTime)*(color);
//    vec3 color1 = vec3(.3,.1,.0);
//    vec3 color2 = vec3 (.1,.3,.4);
//    vec3 color3 = mix(color1,color2,color);
//    gl_FragColor = vec4(color3,1.);
// }
//----------------------------------------------------------

// vec2 brickTile(vec2 _st,float _tileTime){
//    _st *= _tileTime;
//    _st.x += step(1.,mod(_st.y,2.))*.5;
//    // _st.x += .5;
//    return fract(_st);
// }




// void main(){
//    vec2 st = gl_FragCoord.xy/iResolution.xy;
//    float color = .0;
//    // float x = 1.4;

//    st = brickTile(st,5.);

//    color = box(st,vec2(.8),.1);

//    gl_FragColor = vec4(st.x,st.x,st.x,1.);

// }
//-----------------------------------------------
vec2 rotateTilePattern (vec2 _st ,float _angle){

   _st *= 2.;

   float index = .0;
   index += step(1.,mod(_st.x,1.));
   index += step(1.,mod(_st.y,2.))*2.;
   return fract(_st);
}

vec2 brickTile (vec2 _st,float _tileTime,float _offset){
   _st *= vec2(_tileTime);
   _st.x += step(1.,mod(_st.y,2.))*iTime*-_offset;
   _st.x += step(mod(_st.y,2.),1.)*iTime*_offset;
   return fract(_st);
}

void main(){
   vec2 st = gl_FragCoord.xy/iResolution.xy;
   st = vec2(st.y,st.x);

   // st = brickTile(st,6.,.5);
   st = rotateTilePattern(st,.5);
   
   vec3 color = vec3(.0);
   color = vec3(box(st,vec2(.2),.1));
   gl_FragColor = vec4 (color,1.);
}
//-----------------------------------------