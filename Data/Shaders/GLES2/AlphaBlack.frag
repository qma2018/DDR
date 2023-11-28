varying lowp vec4 v_TexCoord;
varying lowp vec4 v_Color;

uniform sampler2D Texture1;
uniform sampler2D Texture2;

void main(void)
{
	lowp vec4 ret = texture2D( Texture1, v_TexCoord.st );
	if( ret.rgb == vec3(0.0, 0.0, 0.0) )
	{
		ret.a = 0.0;
	}

	gl_FragColor = ret;
}
