uniform sampler2D Texture1;

void main(void)
{
	vec4 ret = texture2D( Texture1, gl_TexCoord[0].st );
	if( ret.rgb == vec3(0.0, 0.0, 0.0) )
	{
		ret.a = 0.0;
	}

	gl_FragColor = ret;
}
