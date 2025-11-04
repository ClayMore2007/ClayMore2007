while(true) {
    r8.x = (int)r7.w; // 将 r7.w 转换为整数赋值给 r8.x，假设为 0
    r8.x = (r8.x >= r1.x); // r1.x 是 切线空间 的 视向量 的z分量
    if (r8.x != 0) break; // 如果满足条件则跳出循环

    r8.xy = UV; // 将当前 UV 坐标赋值给 r8.xy
    r8.x = t1.SampleGrad(t1Sampler, r8.xy, DDX.x, DDY.x).y; // 采样纹理 t1 的 y 分量，t1是一张眼球中心到边缘过度的灰度图遮罩
    r8.y = (UV.y < r8.x); // 比较当前 UV.y 与采样值
    if(r8.y != 0){
        r8.y = -1+1;
        r8.z = r8.x -1;
        r8.y = r8.y + r8.z；
        r8.yz = -r8.yy * FixPupilTangent + r7.xy;//,r7.xy = (0,0) ，FixPupilTangent 是修正过后的眼睛切线空的视向量
        r7.xy = r8.yz;
        break;
    }
    r7.xy = pupilTangent * CameraVectorTS.z + r7.xy //pupilTangent 是眼球切线空间的视向量，CameraVectorTS.z 是切线空间的视向量的z分量
}
;
return 0;