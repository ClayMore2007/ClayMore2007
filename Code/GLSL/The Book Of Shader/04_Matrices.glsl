
// float box( vec2 _st, vec2 _size){
//     _size = vec2(0.5) - _size*0.5;
//     vec2 uv = smoothstep(_size,_size+vec2(0.001),_st);
//     uv *= smoothstep(_size, _size+vec2(0.001),vec2(1.)-_st);
    
//     return uv.x;
// }


float sphere (vec2 uv, float rmax,float rmin){
    uv = uv-.5;
    float uv1 = length(uv);
    float _sphere = smoothstep(rmin,rmax,uv1);
    return _sphere;
}

void main(){

    vec2 st = gl_FragCoord.xy/iResolution.xy;
    vec3 color = vec3(0.0);


    vec2 translate = vec2(cos(iTime),sin(iTime));

    st = st+translate*0.35;

    float sphere1 = sphere(st,0.11,0.1);



    gl_FragColor = vec4(sphere1*.2,sphere1*.2,sphere1*.2,1.0);

}