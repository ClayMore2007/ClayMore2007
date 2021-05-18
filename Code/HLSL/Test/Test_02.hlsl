struct A
{
    float2 B;
    float2 C;
};

A a;
a.B = float2(1,2);
a.C = ++a.B;
return a.C;


float a = A;
if (a==0)
{
    float b = 1;
    return b;
}
else
{
    float b =2;
    return b;
}



float a = Switch;
if (a == 1){
    return ColorTint01;
}
else if (a == 2){
    return ColorTint02;
}
else if (a == 3){
    return ColorTint03;
}
else if (a == 4){
    return ColorTint04;
}
else if (a == 5){
    return ColorTint05;
}
else if (a == 6){
    return ColorTint06;
}
else if (a == 7){
    return ColorTint07;
}
return ColorTint08;


