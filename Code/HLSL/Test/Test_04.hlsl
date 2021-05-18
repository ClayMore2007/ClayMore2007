return 0;
}
//-----Shape Lib
float sphere( float3 rp, float3 c, float r){// in Pos, sphere centroid, sphere Radius.
    return distance(rp, c) - r;
}
//----Building SDF Field
float sceneSDF( float3 rp){
    float d = 0;
    float sp1 = sphere(rp, float3(0, 0,0), 100);
    float sp2 = sphere(rp, float3(0, 0,100) , 80);

    d = sp1;//SDF operation.

    return d;
}
//----Ray step march
float2 RayMarch( float3 ro, float3 rd){
    float dO = 0.0;
    int hit = 0;
    for(int i = 0; i < 64; i++){
        float3 p = ro + rd * dO;
        float ds = sceneSDF(p);

        dO += ds;

        if(ds < 0.01){
            hit = 1;
            break;
        }else if(ds > 1000){
            hit = 0;
            break;
        }
    }
    return float2(dO, hit); //dO是距离场，hit是用于做opacity mask的值。



    float d = RayMarch(ro,rd);
    return d.y;