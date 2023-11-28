uniform sampler2D Texture1;
uniform sampler2D Texture2;
uniform sampler2D Texture3;
uniform vec4 Diffuse;
uniform vec4 Glow;

void main()
{
    vec3 YUVColor;

    YUVColor.x = texture2D(Texture1, gl_TexCoord[0].xy).r;
    YUVColor.y = texture2D(Texture2, gl_TexCoord[0].xy).r - 0.5;
    YUVColor.z = texture2D(Texture3, gl_TexCoord[0].xy).r - 0.5;

    float r = YUVColor.x + 1.13983*YUVColor.z;
    float g = YUVColor.x - 0.39465*YUVColor.y - 0.58060*YUVColor.z;
    float b = YUVColor.x + 2.03211*YUVColor.y;
    float a = 1.0;

    gl_FragColor.r = (Diffuse.x)*r;
    gl_FragColor.g = (Diffuse.y)*g;
    gl_FragColor.b = (Diffuse.z)*b;
    gl_FragColor.a = max((Diffuse.w)*a,Glow.w);
    gl_FragColor.rgb = vec3((gl_FragColor.rgb)*(1.0 - Glow.w) + (Glow.xyz * Glow.w));
}