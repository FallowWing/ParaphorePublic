package engine.base;

import haxe.io.Bytes;
import haxe.io.BytesInput;

import motion.Actuate;
import motion.actuators.SimpleActuator;
import motion.easing.*;

import js.html.webgl.*;
import js.html.Element;
import js.html.ButtonElement;
import js.html.CanvasElement;
import js.html.CanvasRenderingContext2D;
import js.html.Image;
import js.html.ImageData;
import js.html.Float32Array;
import js.html.Uint8Array;
import js.html.Uint8ClampedArray;
import js.html.ArrayBufferView;
import js.html.XMLHttpRequest;
import js.*;

class WebGLEngine
{
	public static var assetList:Array<String> = [];
	public static var textAssetMap:Map<String, String> = new Map();
	public static var textureMap:Map<String, TextureBundle> = new Map();

	public static var tempCounter:Int = 0;

	public static var mobile:Bool = false;
	public static var mouse:Point = new Point(0, 0);
	public static var justLeftMouse:Bool = false; //@incomplete Doesn't work
	public static var leftMouse:Bool = false;
	public static var rightMouse:Bool = false;
	public static var mouseWheel:Int = 0;
	public static var hasFocus:Bool = true; //@cleanup Add this properly

	public static var glInspectorExtention;
	public static var mainDiv:Element;
	public static var loadingDiv:Element;
	public static var canvas:CanvasElement;
	public static var canvasSize:Point = new Point(0, 0);
	public static var gl:RenderingContext;
	public static var sprites:Array<Sprite> = [];

	public static var textureFramebuffer:Framebuffer;
	public static var renderTextureVerts:Buffer;
	public static var emptyTexture:TextureBundle;

	public static var gameInit:Void->Void;
	public static var updateLoop:Void->Void;
	public static var started:Bool = false;

	public static var width:Int = 800;
	public static var height:Int = 600;

	public static var timers:Array<Dynamic> = [];
	public static var fonts:Array<BitmapFont> = [];

	public static var currentTime:Float;
	public static var elapsed:Float;
	public static var inFullscreen:Bool = false;
	public static var isLoading:Bool = false;
	public static var cameraViewport:Rect = new Rect();

	private static var a_position:Int;
	private static var u_matrix:UniformLocation;
	private static var u_colour:UniformLocation;
	private static var u_tint:UniformLocation;
	private static var u_alpha:UniformLocation;
	private static var u_hasTexture:UniformLocation;
	private static var u_texture:UniformLocation;
	private static var u_frameRect:UniformLocation;
	private static var u_clipRect:UniformLocation;
	private static var u_userClipRect:UniformLocation;
	private static var u_textureSize:UniformLocation;

	private static var rt_a_position:Int;
	private static var rt_u_matrix:UniformLocation;
	private static var rt_u_texture:UniformLocation;
	private static var rt_u_textureSize:UniformLocation;
	private static var rt_u_uvMatrix:UniformLocation;
	private static var rt_u_clipRect:UniformLocation;
	private static var rt_u_tint:UniformLocation;
	private static var rt_u_bleed:UniformLocation;

	private static var currentProgram:Program;
	private static var defaultProgram:Program;
	private static var renderTextureProgram:Program;

	private static var rect:Rect = new Rect();
	private static var point:Point = new Point();

	public static var enumList:Array<Dynamic> = CommonBase.enumList;
	public static var bindKey:Key->(Void->Void)->?ButtonState->?Float->Void = CommonBase.bindKey;
	public static var unBindKey:Key->?(Void->Void)->Void = CommonBase.unBindKey;
	public static var tween:Dynamic->Dynamic->Float->?TweenConfig->Void = CommonBase.tween;
	public static var cancelTweensOn:Dynamic->Void = CommonBase.cancelTweensOn;
	public static var timer:Float->(Void->Void)->?Int->Int = CommonBase.timer;
	public static var timerCancel:Int->Void = CommonBase.timerCancel;
	public static var pauseTimers:Void->Void = CommonBase.pauseTimers;
	public static var resumeTimers:Void->Void = CommonBase.resumeTimers;
	public static var getKeyStatus:Key->Bool = CommonBase.getKeyStatus;
	public static var getRealKeyStatus:Key->KeyStatus = CommonBase.getRealKeyStatus;

	public static var defaultVolumeMod:Float = 1;
	public static var userVolumeMod:Float = 0.1; // This is set by the preloader in openfl
	public static var musicVolume:Float = 1;
	public static var effectVolume:Float = 1;
	public static var mute:Bool = false;
	public static var playSound:String->?String->?SoundConfig->Void = WebGLSm.playSound;
	public static var stopChannel:String->Void = WebGLSm.stopChannel;
	public static var resetGlobalVolume:Void->Void = WebGLSm.resetGlobalVolume;
	public static var setChannelVolume:String->Float->Void = WebGLSm.setChannelVolume;
	public static var fadeChannel:String->?Bool->?Float->Void = WebGLSm.fadeChannel;


	public static function init(gameInit:Void->Void, updateLoop:Void->Void):Void {
		/// Init page
		var browserAgent:String = js.Browser.navigator.userAgent;
		trace("agent: "+browserAgent);
		if (browserAgent != null) {
			if	(
				browserAgent.contains("Android") ||
				browserAgent.contains("BlackBerry") ||
				browserAgent.contains("iPhone") ||
				browserAgent.contains("iPad") ||
				browserAgent.contains("iPod") ||
				browserAgent.contains("Opera Mini") ||
				browserAgent.contains("IEMobile")
			) mobile = true;
			else mobile = false;
		}

		Browser.document.body.style.margin = "0px";
		mainDiv = Browser.document.getElementById("mainDiv");
		loadingDiv = Browser.document.createDivElement();
		mainDiv.appendChild(loadingDiv);

		mainDiv.style.position = "absolute";
		mainDiv.style.left = "50%";
		mainDiv.style.top = "50%";

		canvas = Browser.document.createCanvasElement();
		canvas.style.position = "absolute";
		canvas.style.display = "block";
		canvas.width = width;
		canvas.height = height;
		mainDiv.appendChild(canvas);

		var button:ButtonElement = Browser.document.createButtonElement();
		button.innerHTML = "Fullscreen";
		// Browser.document.body.appendChild(button);

		untyped __js__('
			function goFullscreen() {
				// Must be called as a result of user interaction to work
				{0}.webkitRequestFullscreen();
				{0}.style.display="";
			}
			{1}.onclick = goFullscreen;
			', canvas, button);

		pageResize();

		function pointerMove(x:Float, y:Float):Void {
			var canvasRect = canvas.getBoundingClientRect();
			mouse.x = (x - canvasRect.left) * width/canvasRect.width;
			mouse.y = (y - canvasRect.top) * height/canvasRect.height;
		}

		canvas.addEventListener("touchstart", function(e) {
			e.preventDefault();
			var touch = e.changedTouches.item(0);
			pointerMove(touch.clientX, touch.clientY);
			// leftMouse = true;
		});

		canvas.addEventListener("touchend", function(e) {
			e.preventDefault();
			var touch = e.changedTouches.item(0);
			pointerMove(touch.clientX, touch.clientY);
			leftMouse = true;
		});

		canvas.addEventListener("touchmove", function(e) {
			e.preventDefault();
			var touch = e.changedTouches.item(0);
			pointerMove(touch.clientX, touch.clientY); // @cleanup This doesn't actually do anything
		});

		canvas.addEventListener("mousedown", function(e) {
			e.preventDefault();
			leftMouse = true;
		});

		canvas.addEventListener("mouseup", function(e) {
			e.preventDefault();
			leftMouse = false;
		});

		canvas.addEventListener("mousemove", function(e) {
			e.preventDefault();
			var canvasRect = canvas.getBoundingClientRect();
			pointerMove(e.clientX, e.clientY);
		});

		Browser.document.addEventListener("keydown", function(e) {
			CommonBase.keyWentDown(e.keyCode);

			// for (bundle in spriteBundles) {
			// 	if (bundle != null && bundle.hasTextFocus) {
			// 		if (e.keyCode == cast Key.BACKSPACE)
			// 			bundle.nativeText.text = bundle.nativeText.text.substr(0, bundle.nativeText.text.length-1);
			// 		else
			// 			bundle.nativeText.appendText(String.fromCharCode(e.charCode));

			// 		if (bundle.nativeText.text.length == 2 && bundle.nativeText.text.charAt(0) == " ")
			// 			bundle.nativeText.text = bundle.nativeText.text.charAt(1);

			// 		drawText(spriteBundles.indexOf(bundle));
			// 	}
			// }
		});

		Browser.document.addEventListener("keyup", function(e) {
			CommonBase.keyCameUp(e.keyCode);
		});

		Browser.window.onresize = function(evt:Void) {
			Browser.window.scrollTo(0,1);
			pageResize();
		}

		/// Init gl
		// alpha : Bool;
		// antialias : Bool;
		// depth : Bool;
		// failIfMajorPerformanceCaveat : Bool;
		// premultipliedAlpha : Bool;
		// preserveDrawingBuffer : Bool;
		// stencil : Bool;
		// gl = canvas.getContextWebGL({alpha: false, premultipliedAlpha: true, antialias: true});

		var names = ["webgl", "experimental-webgl", "webkit-3d", "moz-webgl"];
		for (name in names) {
			try {
				gl = canvas.getContext(name, {alpha: false, premultipliedAlpha: true, antialias: true, forceFXAA: true});
			} catch(e:Dynamic) {}
			if (gl != null) break;
		}

		// trace("Gl: "+gl);
		glInspectorExtention = gl.getExtension("GLI_frame_terminator");
		gl.clearColor(0.0, 0.0, 0.0, 1.0);
		gl.disable(GL.DEPTH_TEST);
		gl.enable(GL.BLEND);
		gl.blendFunc(GL.SRC_ALPHA, GL.ONE_MINUS_SRC_ALPHA);

		for (path in assetList)
			if (path.contains("openflManifest")) continue;
			else if (path.contains(".png")) textureMap.set(path, null);
			else if (path.contains(".spr") || path.contains(".tmx") || path.contains(".fnt") || path.contains(".dat") || path.contains(".xml")) textAssetMap.set(path, null);

		WebGLEngine.gameInit = gameInit;
		WebGLEngine.updateLoop = updateLoop;
		preloadAssets(afterLoaded);
	}

	private static function preloadAssets(callback:Void->Void):Void {
		var assetsLeft:Int = 0;
		for (textAssetPath in textAssetMap.keys()) assetsLeft++;
		for (texturePath in textureMap.keys()) assetsLeft++;
		var assetsTotal:Int = assetsLeft;

		for (textAssetPath in textAssetMap.keys()) {
			var client:XMLHttpRequest = new XMLHttpRequest();
			client.open("GET", textAssetPath+"?rng="+Std.int(Math.random()*1000));
			client.onreadystatechange = function() {
				if (client.readyState == XMLHttpRequest.DONE && client.status == 200) {
					textAssetMap.set(textAssetPath, client.responseText);
					assetsLeft--;
					loadingDiv.innerHTML = "Loading "+Math.round((assetsTotal-assetsLeft)/assetsTotal*100)+"% Add to Homescreen to play in full screen";
					if (assetsLeft == 0) afterLoaded();
				}
			}
			client.send();
		}

		for (texturePath in textureMap.keys()) {
			var img:Image = new Image();

			img.onload = function() {
				textureBundleFromImage(img, texturePath, true);
				assetsLeft--;
					loadingDiv.innerHTML = "Loading "+Math.round((assetsTotal-assetsLeft)/assetsTotal*100)+"% Add to Homescreen to play in full screen";
				if (assetsLeft == 0) afterLoaded();
			}
			img.src = texturePath;
		}
	}

	private static function pageResize():Void {
		var maxW:Int = Browser.window.innerWidth;
		var maxH:Int = Browser.window.innerHeight;
		var newW:Int;
		var newH:Int;
		if (maxW > maxH) {
			newH = maxH;
			newW = Std.int(maxH * width/height);
		} else {
			newW = maxW;
			newH = Std.int(maxW * height/width);
		}

		canvasSize.x = newW;
		canvasSize.y = newH;

		mainDiv.style.margin = "-"+Std.int(newH/2)+"px 0 0 -"+Std.int(newW/2)+"px";
		canvas.style.width = newW+"px";
		canvas.style.height = newH+"px";
	}

	private static function textureBundleFromImage(img:Image, name:String=null, isSource:Bool=false):TextureBundle {
		var doLinear:Bool = false;
		if (name.contains("/font/bitmap/")) doLinear = true;
		var tex:Texture = genTexture(img.width, img.height, null, doLinear);
		gl.bindTexture(GL.TEXTURE_2D, tex);
		gl.texSubImage2D(GL.TEXTURE_2D, 0, 0, 0, GL.RGBA, GL.UNSIGNED_BYTE, img);
		var texBundle:TextureBundle = {texture: tex, width: img.width, height: img.height, isSource: isSource, key: name};
		textureMap.set(name, texBundle);
		return texBundle;
	}

	private static function textureBundleFromEmpty(w:Int, h:Int):TextureBundle {
		var name:String = "TEMP_"+tempCounter++;
		var tex:Texture = genTexture(w, h, null);
		var texBundle:TextureBundle = {texture: tex, width: w, height: h, isSource: false, key: name};
		textureMap.set(name, texBundle);
		return texBundle;
	}

	private static function afterLoaded():Void {
		/// Finish loadeding
		loadingDiv.innerHTML = "";
		mainDiv.removeChild(loadingDiv);

		/// Font parsing
		for (key in textAssetMap.keys()) {
			if (!key.contains(".fnt")) continue;
			var fontData:String = textAssetMap.get(key);

			var dataLines:Array<String> = fontData.split("\r\n");
			var info:Array<String> = [];
			var common:Array<String> = [];
			var page:Array<String> = [];
			var charsStr:Array<Array<String>> = [];
			var kernsStr:Array<Array<String>> = [];

			for (line in dataLines) {
				var entries:Array<String> = line.split(" ");
				while (entries.remove("")) {};

				for (i in 0...entries.length) {
					if (entries[i].contains("=")) entries[i] = entries[i].split("=")[1];
					entries[i] = entries[i].replace("\"", "");
				}

				if (entries[0] == "info") info = entries;
				if (entries[0] == "common") common = entries;
				if (entries[0] == "page") page = entries;
				if (entries[0] == "char") { 
					entries.shift();
					charsStr.push(entries);
				}
				if (entries[0] == "kerning") { 
					entries.shift();
					kernsStr.push(entries);
				}
			}

			var chars:Array<Array<Int>> = [];
			var kerns:Array<Array<Int>> = [];

			for (charLine in charsStr) {
				var intLine:Array<Int> = [];
				for (charEntry in charLine)
					intLine.push(Std.parseInt(charEntry));
				chars.push(intLine);
			}

			for (kernLine in kernsStr) {
				var intLine:Array<Int> = [];
				for (kernEntry in kernLine)
					intLine.push(Std.parseInt(kernEntry));
				kerns.push(intLine);
			}

			fonts.push({
				info: info,
				common: common,
				page: page,
				texture: getTexture("assets/font/bitmap/"+page[2].split("/").last()),
				chars: chars,
				kerns: kerns
			});

			// log("Loaded font: "+info);
		}

		ComplexAnims.init();

		/// Init shaders
		function buildProgram(vertStr:String, fragStr:String):Program {
			var vertShader:Shader = gl.createShader(GL.VERTEX_SHADER);
			gl.shaderSource(vertShader, vertStr);
			gl.compileShader(vertShader);
			if (!gl.getShaderParameter(vertShader, GL.COMPILE_STATUS))
				Browser.alert("An error occurred compiling the vert shader: " + gl.getShaderInfoLog(vertShader));  

			var fragShader:Shader = gl.createShader(GL.FRAGMENT_SHADER);
			gl.shaderSource(fragShader, fragStr);
			gl.compileShader(fragShader);
			if (!gl.getShaderParameter(fragShader, GL.COMPILE_STATUS))
				Browser.alert("An error occurred compiling the frag shader: " + gl.getShaderInfoLog(fragShader));  

			var shaderProgram:Program = gl.createProgram(); 
			gl.attachShader(shaderProgram, vertShader);
			gl.attachShader(shaderProgram, fragShader);
			gl.linkProgram(shaderProgram);
			if (!gl.getProgramParameter(shaderProgram, GL.LINK_STATUS))
				Browser.alert("An error occurred linking the shader program: "+gl.getProgramInfoLog(shaderProgram));

			return shaderProgram;
		}

		defaultProgram = buildProgram(ShaderSource.defaultVert, ShaderSource.defaultFrag);
		renderTextureProgram = buildProgram(ShaderSource.renderTextureVert, ShaderSource.renderTextureFrag);

		a_position = gl.getAttribLocation(defaultProgram, "a_position");
		u_matrix = gl.getUniformLocation(defaultProgram, "u_matrix");
		u_colour = gl.getUniformLocation(defaultProgram, "u_colour");
		u_tint = gl.getUniformLocation(defaultProgram, "u_tint");
		u_alpha = gl.getUniformLocation(defaultProgram, "u_alpha");
		u_hasTexture = gl.getUniformLocation(defaultProgram, "u_hasTexture");
		u_texture = gl.getUniformLocation(defaultProgram, "u_texture");
		u_frameRect = gl.getUniformLocation(defaultProgram, "u_frameRect");
		u_clipRect = gl.getUniformLocation(defaultProgram, "u_clipRect");
		u_userClipRect = gl.getUniformLocation(defaultProgram, "u_userClipRect");
		u_textureSize = gl.getUniformLocation(defaultProgram, "u_textureSize");

		rt_a_position = gl.getAttribLocation(renderTextureProgram, "rt_a_position");
		rt_u_uvMatrix = gl.getUniformLocation(renderTextureProgram, "rt_u_uvMatrix");
		rt_u_matrix = gl.getUniformLocation(renderTextureProgram, "rt_u_matrix");
		rt_u_texture = gl.getUniformLocation(renderTextureProgram, "rt_u_texture");
		rt_u_textureSize = gl.getUniformLocation(renderTextureProgram, "rt_u_textureSize");
		rt_u_clipRect = gl.getUniformLocation(renderTextureProgram, "rt_u_clipRect");
		rt_u_tint = gl.getUniformLocation(renderTextureProgram, "rt_u_tint");
		rt_u_bleed = gl.getUniformLocation(renderTextureProgram, "rt_u_bleed");

		renderTextureVerts = genVertBuffer(0, 0, width, height);
		textureFramebuffer = gl.createFramebuffer();
		emptyTexture = textureBundleFromEmpty(width, height);

		setProgram(defaultProgram);
		currentTime = 0;
		CommonBase.commonInit();
		gameInit();
		Browser.window.requestAnimationFrame(update);
	}

	private static function update(timer:Float):Void {
		elapsed = (timer/1000)-currentTime;
		currentTime = timer/1000;
		updateLoop();

		if (mobile) leftMouse = false;

		var layered:Array<Sprite> = [];
		var ordered:Array<Sprite> = [];

		for (sprite in sprites) {
			if (sprite == null) continue;
			if (sprite.layer == 0) ordered.push(sprite);
			else layered.push(sprite);
		}

		var curLayer:Int = 0;
		var totalLeft:Int = layered.length;
		while (true) {
			for (sprite in layered) {
				if (sprite.layer == curLayer) {
					ordered.push(sprite);
					totalLeft--;
					if (totalLeft == 0) break;
				}
			}
			if (totalLeft == 0) break;
			curLayer++;
		}

		gl.viewport(0, 0, width, height);
		gl.clear(GL.COLOR_BUFFER_BIT|GL.DEPTH_BUFFER_BIT);
		setProgram(defaultProgram);

		var hasTexture:Bool = true;
		for (sprite in ordered) {
			if (sprite == null || !sprite.visible || sprite.vertexBuffer == null) continue;

			if (sprite.texture == null) hasTexture = false;
			else hasTexture = true;

			gl.enableVertexAttribArray(a_position);
			gl.bindBuffer(GL.ARRAY_BUFFER, sprite.vertexBuffer);
			gl.vertexAttribPointer(a_position, 2, GL.FLOAT, false, 0, 0);

			if (hasTexture) {
				gl.activeTexture(GL.TEXTURE0);
				gl.bindTexture(GL.TEXTURE_2D, sprite.texture.texture);
				gl.uniform1i(u_texture, 0);
			} else {
				gl.uniform3f(
					u_colour,
					((sprite.colour >> 16) & 0xff)/255,
					((sprite.colour >> 8) & 0xff)/255,
					(sprite.colour & 0xff)/255
				);
			}
			gl.uniform4f(
				u_tint,
				((sprite.tint >> 16) & 0xff)/255,
				((sprite.tint >> 8) & 0xff)/255,
				(sprite.tint & 0xff)/255,
				((sprite.tint >> 24) & 0xff)/255
			);

			gl.uniform1i(u_hasTexture, hasTexture?1:0);
			gl.uniform1f(u_alpha, sprite.alpha);

			if (sprite.userClipRect != null) {
				gl.uniform4f(u_userClipRect, sprite.userClipRect.x, sprite.userClipRect.y, sprite.userClipRect.width, sprite.userClipRect.height);
			} else {
				gl.uniform4f(u_userClipRect, -1, -1, -1, -1);
			}


			if (sprite.curFrameRect.width != 0) {
				gl.uniform4f(u_frameRect, sprite.curFrameRect.x, sprite.curFrameRect.y, sprite.curFrameRect.width, sprite.curFrameRect.height);

				gl.uniform4f(
					u_clipRect,
					sprite.curOffsetPoint.x,
					sprite.curOffsetPoint.y,
					sprite.curFrameRect.width,
					sprite.curFrameRect.height
				);

				gl.uniform2f(u_textureSize, sprite.texture.width, sprite.texture.height);
			} else {
				if (hasTexture) gl.uniform2f(u_textureSize, sprite.texture.width, sprite.texture.height);
				else gl.uniform2f(u_textureSize, sprite.width, sprite.height);
				gl.uniform4f(u_frameRect, 0, 0, sprite.width, sprite.height);
				gl.uniform4f(u_clipRect, 0, 0, sprite.width, sprite.height);
			}

			gl.uniformMatrix3fv(u_matrix, false, sprite.transform.getArray());
			gl.drawArrays(GL.TRIANGLES, 0, sprite.triangles*3);
		}

		if (glInspectorExtention != null) glInspectorExtention.frameTerminator();
		Browser.window.requestAnimationFrame(update);
	}

	public static function log(message:Dynamic):Void {
#if debug
		trace("LOG: "+message);
#end
	}

	public static function getSpriteProp(id:Int, prop:SpriteProp):Dynamic {
		var sprite:Sprite = sprites[id];

		if (prop == WIDTH) return sprite.width;
		if (prop == HEIGHT) return sprite.height;

		return null;
	}

	public static function setTextFieldFormat(id:Int, newFormat:TextFieldFormat):Void {
		var format:TextFieldFormat = sprites[id].textFieldFormat;

		if (format.wordWrapWidth != null) format.wordWrap = true;

		for (field in Reflect.fields(newFormat)) {
			var val:Dynamic = Reflect.field(newFormat, field);
			if (val != null) Reflect.setProperty(format, field, val);
		}
	}

	public static function setTextProp(id:Int, prop:TextProp, value:Dynamic):Void {
		var sprite:Sprite = sprites[id];

		if (prop == REGIONS)  {
			var regions:Array<FormatRegion> = cast value;
			for (region in regions)
				if (region.fontSize == null)
					region.fontSize = sprites[id].textFieldFormat.fontSize;
			sprite.regions = regions;
		}

		if (prop == TEXT) {
			sprite.text = value;
			drawText(id);
		}

	}

	private static function getCSSColour(num:Int):String {
		var alpha:Float;
		var red:Float;
		var green:Float;
		var blue:Float;

		if (num & 0xFF000000 == 0) {
			alpha = 255;
			red = num >> 16 & 0xFF;
			green = num >> 8 & 0xFF;
			blue = num & 0xFF;
		} else {
			alpha = num >> 24 & 0xFF;
			red = num >> 16 & 0xFF;
			green = num >> 8 & 0xFF;
			blue = num & 0xFF;
		}

		return 'rgba($red, $green, $blue, ${alpha/255})';
	}

	private static function drawText(id:Int):Void {
		var sprite:Sprite = sprites[id];

		var fontSize:Int = 0;
		var fontOptions:Array<BitmapFont> = []; //@cleanup Is this even used?
		var font:BitmapFont = null;

		var sizeRatio:Float = 0;

		var colour:Int = sprite.textFieldFormat.fontColour;

		function setFormatParams(region:FormatRegion=null):Void {
			var fontName:String;
			if (region == null) {
				fontName = "OpenSans-Regular";
				fontSize = sprite.textFieldFormat.fontSize;
			} else {
				if (region.italic) fontName = "OpenSans-Italic";
				else if (region.bold) fontName = "OpenSans-Bold";
				else fontName = "OpenSans-Regular";
				fontSize = region.fontSize;
			}

			fontSize += 2;

			var fontOptions:Array<BitmapFont> = [];
			for (f in fonts)
				if (f.info[1] == fontName)
					fontOptions.push(f);
			font = fontOptions[0];

			for (f in fontOptions) {
				if (fontSize == Std.parseInt(f.info[2])) {
					font = f;
					break;
				}
				if (Math.abs(Std.parseInt(f.info[2]) - fontSize) < Math.abs(Std.parseInt(font.info[2]) - fontSize)) font = f;
			}

			sizeRatio = fontSize/Std.parseInt(font.info[2]);
			if (sizeRatio != 1) {
				trace("Warning, using font "+fontName+" size "+fontSize+" ingame size "+(fontSize-2));
				// throw "Bad";
			}
		}

		setFormatParams();

		var text:String = sprite.text;
		var maxWidth:Int = sprite.textFieldFormat.wordWrapWidth;

		sprite.width = width;
		sprite.height = height;
		resetSpriteGl(id);
		sprite.texture = textureBundleFromEmpty(Std.int(sprite.width), Std.int(sprite.height));
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);

		function getLineHeight():Int {
			return Std.parseInt(font.common[1]);
		}

		function getRegionAt(ind:Int):FormatRegion {
			for (r in sprite.regions)
				if (ind >= r.start && ind < r.end)
					return r;

			return null;
		}

		function getCharLine(id:Int):Array<Int> {
			if (id == 9) id = 32; //@hack So tabs don't crash
			// trace("Char: "+id+" "+String.fromCharCode(id));
			for (line in font.chars)
				if (line[0] == id)
					return line;
			throw "Missing char "+id;
		}

		function getKern(prevId:Int, curId:Int):Int {
			if (prevId != -1)
				for (line in font.kerns)
					if (line[0] == prevId && line[1] == curId)
						return line[2];
			return 0;
		}

		function getWordWidth(start:Int, end:Int):Int {
			var prevId:Int = -1;
			var width:Int = 0;
			for (i in start...end) {
				setFormatParams(getRegionAt(i));
				var charId:Int = text.charCodeAt(i);
				var charLine:Array<Int> = getCharLine(charId);

				width += charLine[3] + charLine[5] + charLine[7] + getKern(prevId, charId);

				prevId = charId;
			}

			return width;
		}

		var cursor:Point = new Point();
		var prevId:Int = -1;
		sprite.textHeight = 0;
		sprite.charRects = [];
		sprite.lineBreaks = [];
		for (i in 0...text.length) {
			if (text.charAt(i) == "\n") {
				cursor.x = 0;
				cursor.y += getLineHeight()*sizeRatio;
				sprite.textHeight += getLineHeight();
				sprite.lineBreaks.push(i);
				continue;
			}

			if (prevId == 32) {
				var nextBreakIndex:Int = text.length-1;
				var nextSpace:Int = text.indexOf(" ", i);
				var nextNewLine:Int = text.indexOf("\n", i);
				if (nextSpace != -1) nextBreakIndex = cast Math.min(nextBreakIndex, nextSpace);
				if (nextNewLine != -1) nextBreakIndex = cast Math.min(nextBreakIndex, nextNewLine);
				var wordWidth:Float = getWordWidth(i, nextBreakIndex)*sizeRatio;
				if (cursor.x + wordWidth > maxWidth) {
					cursor.x = 0;
					cursor.y += getLineHeight()*sizeRatio;
					sprite.textHeight += getLineHeight();
				}

				sprite.lineBreaks.push(i);
			}

			// trace("On char "+i+" out of "+text.length);
			setFormatParams(getRegionAt(i));
			var char:String = text.charAt(i);
			var charId:Int = text.charCodeAt(i);
			if (charId == 0) continue; // New line removal makes this happen.
			var charLine:Array<Int> = getCharLine(charId);

			cursor.x += Math.round(getKern(prevId, charId)*sizeRatio);
			point.setTo(cursor.x + charLine[5]*sizeRatio, cursor.y + charLine[6]*sizeRatio);
			point.x = Math.round(point.x);
			point.y = Math.round(point.y);
			renderToTexture(font.texture, sprite.texture, charLine[1], charLine[2], charLine[3], charLine[4], Std.int(point.x), Std.int(point.y), 0xFF000000|colour, sizeRatio, sizeRatio);

			sprite.charRects.push(new Rect(point.x, point.y, charLine[3], charLine[4]));

			sprite.textWidth = Math.max((point.x+charLine[3]*sizeRatio), sprite.textWidth);
			cursor.x += charLine[7]*sizeRatio;
			prevId = charId;
		}

		sprite.textHeight += getLineHeight();
	}

	private static function resetSpriteGl(id:Int):Void {
		var sprite:Sprite = sprites[id];
		if (sprite.text != null && sprite.texture != null) gl.deleteTexture(sprite.texture.texture);
		if (sprite.vertexBuffer != null) gl.deleteBuffer(sprite.vertexBuffer);
		if (sprite.texture != null && !sprite.texture.isSource) {
			textureMap.remove(sprite.texture.key);
			gl.deleteTexture(sprite.texture.texture);
		}

		sprite.texture = null;
		sprite.vertexBuffer = null;
	}

	public static function getTextCharRect(id:Int, charIndex:Int):Rect {
		var sprite:Sprite = sprites[id];
		return sprite.charRects[charIndex];
	}

	public static function getTextLineIndexOfChar(id:Int, charIndex:Int):Int {
		var sprite:Sprite = sprites[id];
		for (i in 0...sprite.lineBreaks.length)
			if (charIndex < sprite.lineBreaks[i])
				return i;

		return 0;
	}

	public static function getTextProp(id:Int, prop:TextProp):Dynamic {
		var sprite:Sprite = sprites[id];

		if (prop == WIDTH) return sprite.maxWidth;
		if (prop == HEIGHT) return sprite.maxHeight;
		if (prop == FIELD_HEIGHT) return sprite.textHeight;
		if (prop == FIELD_WIDTH) return sprite.textWidth;

		if (prop == TEXT) return sprite.text;
		if (prop == WORD_WRAP) return sprite.textFieldFormat.wordWrap;
		if (prop == V_SCROLL) return 0;
		if (prop == MAX_V_SCROLL) return 0;
		if (prop == VISIBLE_LINES) return 100;

		return null;
	}

	public static function setTextFieldMaxHeight(id:Int, height:Float):Void {
		sprites[id].maxHeight = height;
	}

	public static function setTextFieldMaxWidth(id:Int, width:Float):Void {
		sprites[id].maxWidth = width;
	}

	public static function textFieldStealFocus(id:Int) {
	}

	public static function transformSprite(id:Int, x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, alpha:Float, visible:Bool, centerPivot:Bool, layer:Int, pivotX:Float, pivotY:Float, scolls:Bool):Void {
		var sprite:Sprite = sprites[id];

		if (centerPivot) {
			x += sprite.width/2;
			y += sprite.height/2;
		}
		x -= pivotX;
		y -= pivotY;

		sprite.x = x;
		sprite.y = y;
		sprite.scaleX = scaleX;
		sprite.scaleY = scaleY;
		sprite.rotation = rotation;
		sprite.alpha = alpha;
		sprite.centerPivot = centerPivot;
		sprite.visible = visible;
		sprite.layer = layer;

		genMatrixTransform(sprite.transform, x, y, scaleX, scaleY, rotation, centerPivot, sprite.width, sprite.height, pivotX, pivotY);

		// trace('${sprite.assetId} was given: ${sprite.transform.getArray()}');
	}
	private static function genMatrixTransform(matrix:Matrix, x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, centerPivot:Bool, origWidth:Float, origHeight:Float, pivotX:Float, pivotY:Float):Void {
		matrix.identity();
		matrix.project(width, height);
		matrix.translate(x, y);
		matrix.rotate(rotation);
		matrix.scale(scaleX, scaleY);

		if (centerPivot) matrix.translate(-origWidth/2, -origHeight/2);
		matrix.translate(pivotX, pivotY);
	}

	public static function tintSprite(id:Int, colour:Int):Void {
		sprites[id].tint = colour;
	}

	public static function clearSprite(id:Int):Void {
	}

	public static function pointOverlapSprite(p:Point, id:Int, pixelPerfect:Bool=false):Bool {
		var sprite:Sprite = sprites[id];

		var radRot:Float = sprite.rotation*(Math.PI/180);
		var x:Float = sprite.x;
		var y:Float = sprite.y;
		var w:Float = sprite.width*sprite.scaleX;
		var h:Float = sprite.height*sprite.scaleY;
		if (sprite.centerPivot) {
			x -= w/2;
			y -= h/2;
		}
		var result:Bool = false;

		point.setTo(p.x, p.y);
		point.x -= x;
		point.y -= y;
		if (sprite.centerPivot) rotatePoint((sprite.width*sprite.scaleX)/2, (sprite.height*sprite.scaleY)/2, radRot, point)
		else rotatePoint(0, 0, radRot, point);
		if (point.x > 0 && point.x < w && point.y > 0 && point.y < h) result = true;

		// trace('Point $point, rect: $x $y $w $h, result: $result');
		// trace(point.x > 0);
		// trace(point.x < w);
		// trace(point.y > 0);
		// trace(point.y < h);

		if (pixelPerfect) {
			// Get pixel
			// return false;
		}

		return result;
	}

	private static function rotatePoint(cx:Float, cy:Float, angle:Float, p:Point) {
		var s:Float = Math.sin(angle);
		var c:Float = Math.cos(angle);

		// translate point back to origin:
		p.x -= cx;
		p.y -= cy;

		// rotate point
		var xnew:Float = p.x * c - p.y * s;
		var ynew:Float = p.x * s + p.y * c;

		// translate point back:
		p.x = xnew + cx;
		p.y = ynew + cy;
	}

	public static function resolveAssetName(assetId:String, crash:Bool=true, extention:String=".png"):String {
		assetId = assetId.replace(".png", "");
		assetId = assetId.replace(".txt", "");
		assetId = assetId.replace(".json", "");

		var allChoices:Array<String> = [];
		var realId:String = "";

		if (extention == ".png")
			for (key in textureMap.keys())
				if (key.contains(assetId))
					allChoices.push(key);

		if (extention == ".txt")
			for (key in textAssetMap.keys())
				if (key.contains(assetId))
					allChoices.push(key);

		for (asset in allChoices)
			if (realId == "" || asset.length < realId.length)
				realId = asset;

		if (realId == "" && crash) throw "Asset "+assetId+" not found";

		return realId;
	}

	private static function getTexture(assetId:String):TextureBundle {
		if (textureMap.exists(assetId)) return textureMap.get(assetId);
		else return null;
	}

	public static function createSprite():Int {
		var sprite:Sprite = {
			assetId: "not yet set",
			x: 0,
			y: 0,
			width: 0,
			height: 0,
			scaleX: 0,
			scaleY: 0,
			rotation: 0,
			curFrameRect: new Rect(),
			curOffsetPoint: new Point(),
			centerPivot: false,
			alpha: 1,
			layer: 0,
			visible: true,
			transform: new Matrix(),
			colour: 0x000000,
			tint: 0x00000000,
			curFrame: -1,
			triangles: 2,
		}
		sprites.push(sprite);

		return sprites.length-1;
	}

	public static function setupImageSprite(id:Int, assetId:String):{width:Int, height:Int} {
		var assetId:String = resolveAssetName(assetId, true, ".png");
		var sprite:Sprite = sprites[id];
		sprite.assetId = assetId;
		sprite.texture = getTexture(assetId);
		sprite.width = sprite.texture.width;
		sprite.height = sprite.texture.height;
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);

		return {width: Std.int(sprite.width), height: Std.int(sprite.height)};
	}

	public static function setupRectSprite(id:Int, width:Float, height:Float, colour:Int):Void {
		var sprite:Sprite = sprites[id];
		sprite.width = width;
		sprite.height = height;
		sprite.assetId = "rect";
		sprite.colour = colour;
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);
	}

	public static function switchFrame(id:Int, xpos:Int, ypos:Int, w:Int, h:Int, xoff:Int, yoff:Int):Void {
		var sprite:Sprite = sprites[id];
		sprite.curFrameRect.setTo(xpos, ypos, w, h);
		sprite.curOffsetPoint.setTo(xoff, yoff);
	}

	public static function setup9SliceSprite(id:Int, assetId:String, x1:Int, y1:Int, x2:Int, y2:Int, w:Int, h:Int):Void {
		// trace("Params: "+id+"|"+assetId+"|"+x1+"|"+y1+"|"+x2+"|"+y2+"|"+w+"|"+h);
		assetId = resolveAssetName(assetId, true, ".png");
		var srcTexture:TextureBundle = getTexture(assetId);

		var sprite:Sprite = sprites[id];
		sprite.texture = textureBundleFromEmpty(w, h);
		sprite.assetId = assetId;
		sprite.width = w;
		sprite.height = h;

		var rows:Array<Int> = [
			0, 
			Math.floor(y1), 
			Math.floor(y2), 
			Math.floor(srcTexture.height)
		];
		var cols:Array<Int> = [
			0, 
			Math.floor(x1), 
			Math.floor(x2), 
			Math.floor(srcTexture.width)
		];

		var dRows:Array<Int> = [
			0, 
			Math.floor(y1), 
			Math.floor(h - (srcTexture.height - y2)), 
			Math.floor(h)
		];
		var dCols:Array<Int> = [
			0, 
			Math.floor(x1), 
			Math.floor(w - (srcTexture.width - x2)), 
			Math.floor(w)
		];

		var origin:Rect = new Rect();
		var draw:Rect = new Rect();
		var mat:Matrix = new Matrix();

		for (cx in 0...3) {
			for (cy in 0...3) {
				origin.setTo(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
				draw.setTo(dCols[cx], dRows[cy], dCols[cx + 1] - dCols[cx], dRows[cy + 1] - dRows[cy]);
				renderToTexture(
					srcTexture, sprite.texture,
					cast origin.x, cast origin.y, cast origin.width, cast origin.height,
					cast draw.x, cast draw.y, 0, cast draw.width/origin.width, cast draw.height/origin.height
				);
				// trace("Params: "+image+"|"+origin.x+"|"+origin.y+"|"+origin.width+"|"+origin.height+"|"+draw.x+"|"+draw.y+"|"+draw.width+"|"+draw.height);
			}
		}

		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);
	}

	public static function applyGlitchEffect(id:Int):Void {
	}

	public static function applyGlowEffect(id:Int, colour:Int, alpha:Float, blurX:Float, blurY:Float, strength:Float, inner:Bool, knockout:Bool):Void {
	}

	public static function clearEffects(id:Int):Void {
	}

	public static function destroySprite(id:Int):Void {
		if (sprites[id] == null) return;
		resetSpriteGl(id);
		sprites[id] = null;
	}

	public static function createText(id:Int):Void {
		var sprite:Sprite = sprites[id];
		sprite.assetId = "text";
		sprite.maxWidth = 800;
		sprite.maxHeight = 600;
		sprite.textWidth = 0;
		sprite.textHeight = 0;
		sprite.regions = [];
		sprite.textFieldFormat = {
			autoSize: "none",
			wordWrap: false,
			wordWrapWidth: 800,
			selectable: false,
			fontColour: 0,
			fontSize: 14,
			fontName: "OpenSans",
			border: false,
			borderColour: 0
		};
		sprite.text = "";
	}

	public static function getContainerUrl():String {
		return null;
	}

	public static function loadBase64Png(name:String, str:String, onComplete:Void->Void):Void {
		var img:Image = new Image();
		if (!str.contains("data:image/png;base64,")) str = "data:image/png;base64," + str;
		img.src = str;
		img.onload = function() {
			textureBundleFromImage(img, "external_"+name+".png");
			onComplete();
		}
	}

	public static function loadFromDisk(callback:String->String->Void):Void {
		if (isLoading) return;
		isLoading = true;

		function uploadDone(name:String, bytes:Bytes) {
			if (name.contains(".tar")) {
				var tarData = new format.tar.Reader(new BytesInput(bytes, 0, bytes.length)).read();
				var mainText:String = "";

				var pngsToParse:Array<{fileName:String, data:Bytes}> = [];
				for (tarFile in tarData) {
					if (tarFile.fileName == "main.txt") mainText = Std.string(tarFile.data);
					else if (tarFile.fileName.contains(".png")) pngsToParse.push({fileName: tarFile.fileName, data: tarFile.data});
				}

				for (p in pngsToParse) {
					loadBase64Png(p.fileName, haxe.crypto.Base64.encode(p.data), function() {
						pngsToParse.remove(p);
						if (pngsToParse.length == 0) callback(mainText, "success");
					});
				}
			} else {
				callback(Std.string(bytes), "success");
			}
		}

		var fileName:String = "";
		var elem:Dynamic = Browser.document.createElement("input");
		var br = Browser.document.createBRElement();
		elem.setAttribute("type", "file");
		elem.style.position = "absolute";
		elem.style.zIndex = "1";
		elem.onchange = function() {
			var reader:Dynamic = untyped __js__('new FileReader()');
			isLoading = false;
			reader.onloadend = function() {
				uploadDone(fileName, Bytes.ofData(reader.result));
				elem.remove();
				br.remove();
			}
			reader.onerror = function() {
				callback(null, "error");
				elem.remove();
				br.remove();
			}
			fileName = elem.files[0].name;
			reader.readAsArrayBuffer(elem.files[0]);
		}
		Browser.document.body.appendChild(br);
		Browser.document.body.appendChild(elem);
	}

	public static function getUrl(url:String):Void {
	}

	public static function saveToDisk(string:String, fileName:String, callback:String->Void):Void {
		untyped __js__('saveAs(new Blob([{0}], {type: "text/plain;charset=utf-8"}), {1})', string, fileName);
	}

	public static function loseTextFocus(id:Int) {
	}

	public static function fillSpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, colour:Int):Void {
		var sprite:Sprite = sprites[id];

		if (sx+sw > sprite.width) sw = Std.int(sprite.width-sx);
		if (sy+sh > sprite.height) sh = Std.int(sprite.height-sy);

		renderToTexture(emptyTexture, sprite.texture, 0, 0, sw, sh, sx, sy, colour, 1, 1, true);
	}

	private static function renderToTexture(from:TextureBundle, to:TextureBundle, x:Int, y:Int, w:Int, h:Int, dx:Int, dy:Int, tint:Int=0x00000000, scaleX:Float=1, scaleY:Float=1, bleed:Bool=false):Void {
		// trace("Rendering: "+from.key+"|"+to.key+"|"+x+"|"+y+"|"+w+"|"+h+"|"+dx+"|"+dy+"|"+tint+"|"+scaleX+"|"+scaleY);

		setProgram(renderTextureProgram);
		gl.bindFramebuffer(GL.FRAMEBUFFER, textureFramebuffer);
		gl.framebufferTexture2D(GL.FRAMEBUFFER, GL.COLOR_ATTACHMENT0, GL.TEXTURE_2D, to.texture, 0);
		// if (gl.checkFramebufferStatus(GL.FRAMEBUFFER) != GL.FRAMEBUFFER_COMPLETE)
		// 	Browser.alert("The textureFramebuffer failed to init");  

		gl.viewport(0, 0, width, height);

		gl.enableVertexAttribArray(rt_a_position);
		gl.bindBuffer(GL.ARRAY_BUFFER, renderTextureVerts);
		gl.vertexAttribPointer(rt_a_position, 2, GL.FLOAT, false, 0, 0);

		var trans:Matrix = new Matrix();
		trans.identity();
		trans.translate(0, -(height-from.height));
		trans.translate(x, -y);
		gl.uniformMatrix3fv(rt_u_uvMatrix, false, trans.getArray());
		gl.uniform2f(rt_u_textureSize, from.width, from.height);

		gl.uniform4f(
			rt_u_tint,
			((tint >> 16) & 0xff)/255,
			((tint >> 8) & 0xff)/255,
			(tint & 0xff)/255,
			((tint >> 24) & 0xff)/255
		);

		gl.uniform4f(rt_u_clipRect, x, y, w, h);
		gl.uniform1i(rt_u_bleed, bleed?1:0);

		trans.identity();
		// trans.scale(0.5, 0.5);
		trans.project(width, height);
		trans.translate(dx, -dy);
		trans.translate(0, height*(1-scaleY));
		trans.scale(scaleX, scaleY);
		gl.uniformMatrix3fv(rt_u_matrix, false, trans.getArray());

		gl.activeTexture(GL.TEXTURE0);
		gl.bindTexture(GL.TEXTURE_2D, from.texture);
		gl.uniform1i(rt_u_texture, 0);

		gl.drawArrays(GL.TRIANGLES, 0, 2*3);

		gl.bindFramebuffer(GL.FRAMEBUFFER, null);
	}

	public static function drawSpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, ?colour:Int, scaleX:Float=1, scaleY:Float=1):Void {
		if (colour == -1) colour = null;
		var sprite:Sprite = sprites[id];
		renderToTexture(sprite.srcTexture, sprite.texture, sx, sy, sw, sh, dx, dy, colour, scaleX, scaleY);
	}

	public static function copySpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, ?colour:Int):Void {
		if (colour == -1) colour = null;
		var sprite:Sprite = sprites[id];
		renderToTexture(sprite.srcTexture, sprite.texture, sx, sy, sw, sh, dx, dy, colour);
	}

	public static function getTextFocus(id:Int):Void {
		if (mobile) {
			// var str:String = js.Browser.window.prompt("", sprites[id].text);
			// sprites[id].text = str;
			// drawText(id);
			// return;
		}
	}

	public static function getAssetList():Array<String> {
		return assetList.copy();
	}

	public static function setupAnimatedSprite(id:Int, assetId:String, w:Int, h:Int):Void { 
		assetId = resolveAssetName(assetId, true, ".png");

		var sprite:Sprite = sprites[id];
		sprite.assetId = assetId;
		sprite.texture = getTexture(assetId);
		sprite.width = w;
		sprite.height = h;
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);
	}

	public static function setupCanvasSprite(id:Int, assetId:String, w:Int, h:Int):Void {
		assetId = resolveAssetName(assetId, true, ".png");

		var sprite:Sprite = sprites[id];
		sprite.assetId = assetId;
		sprite.srcTexture = getTexture(assetId);
		sprite.width = w;
		sprite.height = h;
		sprite.texture = textureBundleFromEmpty(cast sprite.width, cast sprite.height);
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);
	}

	public static function setSpriteClip(id:Int, x:Int, y:Int, w:Int, h:Int):Void {
		var sprite:Sprite = sprites[id];
		if (sprite.userClipRect == null) sprite.userClipRect = new Rect();
		sprite.userClipRect.setTo(x, y, w, h);
	}

	public static function pathToText(assetId:String):String {
		assetId = resolveAssetName(assetId, true, ".txt");
		return textAssetMap.get(assetId);
	}

	public static function showMouse():Void {
	}

	public static function hideMouse():Void {
	}

	public static function showFps():Void {
	}

	public static function hideFps():Void {
	}

	public static function setupEmptySprite(id:Int, w:Int, h:Int):Void {
		var sprite:Sprite = sprites[id];
		sprite.assetId = "empty";
		sprite.width = w;
		sprite.height = h;
		sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);
		sprite.texture = textureBundleFromEmpty(cast sprite.width, cast sprite.height);
	}

	private static function genVertBuffer(x:Float, y:Float, w:Float, h:Float):Buffer {
		var verts:Array<Float> = [
			x, y,
			w, y,
			w, h,
			x, y,
			x, h,
			w, h
		];

		var buff:Buffer = gl.createBuffer();
		gl.bindBuffer(GL.ARRAY_BUFFER, buff);
		gl.bufferData(GL.ARRAY_BUFFER, new Float32Array(verts), GL.STATIC_DRAW);
		return buff;
	}

	private static function genTexture(w:Int, h:Int, data:Uint8Array=null, linear:Bool = false):Texture {
		var tex:Texture = gl.createTexture();
		gl.bindTexture(GL.TEXTURE_2D, tex);
		gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_S, GL.CLAMP_TO_EDGE);
		gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_WRAP_T, GL.CLAMP_TO_EDGE);
		if (linear) {
			gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.LINEAR);
			gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.LINEAR);
		} else {
			gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
			gl.texParameteri(GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);
		}
		gl.texImage2D(GL.TEXTURE_2D, 0, GL.RGBA, w, h, 0, GL.RGBA, GL.UNSIGNED_BYTE, data);
		return tex;
	}

	private static function genErrorTest():Void {
		var err = gl.getError();
		if (err != GL.NO_ERROR) trace("Error: "+err);
	}

	private static function setProgram(program:Program):Void {
		if (currentProgram == program) return;
		currentProgram = program;
		gl.useProgram(program);
	}
}

typedef TextureBundle = {
	texture:Texture,
	width:Float,
	height:Float,
	isSource:Bool,
	key:String,
}

typedef Sprite = {
	width:Float,
	height:Float,
	colour:Int,
	tint:Int,

	x:Float,
	y:Float,
	scaleX:Float,
	scaleY:Float,
	rotation:Float,
	centerPivot:Bool,
	alpha:Float,
	visible:Bool,
	layer:Int,
	transform:Matrix,
	?userClipRect:Rect,

	?regions:Array<FormatRegion>,
	?text:String,
	?textFieldFormat:TextFieldFormat,
	?textWidth:Float,
	?textHeight:Float,
	?maxWidth:Float,
	?maxHeight:Float,
	?charRects:Array<Rect>,
	?lineBreaks:Array<Int>,

	curFrame:Int,
	curFrameRect:Rect,
	curOffsetPoint:Point,
	?assetId:String,

	?srcTexture:TextureBundle,

	triangles:Int,
	?texture:TextureBundle,
	?vertexBuffer:Buffer
}

typedef BitmapFont = {
	info:Array<String>,
	common:Array<String>,
	page:Array<String>,
	texture:TextureBundle,
	chars:Array<Array<Int>>,
	kerns:Array<Array<Int>>,
}
