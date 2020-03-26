package engine.base;

class ShaderSource {

	public static var defaultVert:String = "
		attribute vec2 a_position;

	uniform mat3 u_matrix;

	varying vec2 v_texCoord;

	void main(void) {
		v_texCoord = vec2(a_position.x, a_position.y);
		gl_Position = vec4((u_matrix * vec3(a_position, 1)).xy, 0, 1);
	}
	";

	public static var defaultFrag:String = "
		precision mediump float;

	uniform float u_alpha;
	uniform vec3 u_colour;
	uniform vec4 u_tint;
	uniform sampler2D u_texture;
	uniform bool u_hasTexture;

	uniform vec4 u_frameRect;
	uniform vec4 u_clipRect;
	uniform vec2 u_textureSize;

	uniform vec4 u_userClipRect;

	varying vec2 v_texCoord;

	void main(void) { 
		bool inTexture = true;

		// I have to get the frag outside the if-statement
		vec2 pxIn = vec2(v_texCoord.x-u_clipRect.x, v_texCoord.y-u_clipRect.y);
		vec2 realTexCoord = vec2(0, 0);
		realTexCoord.x = (u_frameRect.x + pxIn.x)/u_textureSize.x;
		realTexCoord.y = (u_frameRect.y + pxIn.y)/u_textureSize.y;
		vec4 textureFrag = texture2D(u_texture, realTexCoord);

		if (
			v_texCoord.x < u_clipRect[0] ||
			v_texCoord.y < u_clipRect[1] ||
			v_texCoord.x > u_clipRect[0]+u_clipRect[2] ||
			v_texCoord.y > u_clipRect[1]+u_clipRect[3]
		) {
			inTexture = false;
		}

		if (u_userClipRect[0] != -1.0 || u_userClipRect[1] != -1.0 || u_userClipRect[2] != -1.0 || u_userClipRect[3] != -1.0) {
			if (
				!(gl_FragCoord.x < u_userClipRect[0] ||
				gl_FragCoord.y < u_userClipRect[1] ||
				gl_FragCoord.x > u_userClipRect[0]+u_userClipRect[2] ||
				gl_FragCoord.y > u_userClipRect[1]+u_userClipRect[3])
			) {
				discard;
			}
		}

		if (!u_hasTexture) {
			gl_FragColor = vec4(u_colour, 1.0);
			// gl_FragColor = vec4(1, 1, 0, 1);
		} else if (!inTexture) {
			discard;
		} else {
			// gl_FragColor = textureFrag;
			gl_FragColor = (u_tint - textureFrag)*u_tint.a + textureFrag;
			gl_FragColor.a = textureFrag.a;
		}

		gl_FragColor.a -= 1.0-u_alpha;
	}
	";

	public static var renderTextureVert:String = "
		attribute vec2 rt_a_position;

	uniform mat3 rt_u_matrix;
	uniform mat3 rt_u_uvMatrix;

	varying vec2 rt_v_texCoord;

	void main(void) {
		// rt_v_texCoord = rt_a_position;
		rt_v_texCoord = (rt_u_uvMatrix * vec3(rt_a_position, 1)).xy;
		vec4 realPos = vec4((rt_u_matrix * vec3(rt_a_position, 1)).xy, 0, 1);
		gl_Position = realPos;
	}
	";

	public static var renderTextureFrag:String = "
		precision mediump float;

	uniform sampler2D rt_u_texture;

	uniform vec2 rt_u_textureSize;
	uniform vec4 rt_u_clipRect;
	uniform vec4 rt_u_tint;
	uniform bool rt_u_bleed;

	varying vec2 rt_v_texCoord;

	void main(void) { 
		rt_u_textureSize;
		rt_v_texCoord;
		rt_u_texture;
		rt_u_clipRect;

		float texCoordX = rt_v_texCoord.x;
		float texCoordY = rt_u_textureSize.y-rt_v_texCoord.y;

		// gl_FragColor = vec4(rt_v_texCoord.x/rt_u_textureSize.x, rt_v_texCoord.y/rt_u_textureSize.y, 0, 1);
		vec2 realTexCoord = vec2(0, 0);
		realTexCoord.x = texCoordX/rt_u_textureSize.x;
		realTexCoord.y = texCoordY/rt_u_textureSize.y;
		vec4 textureFrag = texture2D(rt_u_texture, realTexCoord);

		gl_FragColor = (rt_u_tint - textureFrag)*rt_u_tint.a + textureFrag;
		if (!rt_u_bleed) gl_FragColor.a = textureFrag.a;

		if (
			texCoordX < rt_u_clipRect[0] ||
			texCoordY < rt_u_clipRect[1] ||
			texCoordX > rt_u_clipRect[0]+rt_u_clipRect[2] ||
			texCoordY > rt_u_clipRect[1]+rt_u_clipRect[3]
		) {
			discard;
			// gl_FragColor.a = 0.0;
		}
	}
	";

}
