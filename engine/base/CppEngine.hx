package engine.base;

import motion.Actuate;
import motion.actuators.SimpleActuator;
import motion.easing.*;

import haxe.Timer;
import haxe.io.Bytes;
import haxe.io.BytesInput;
import haxe.crypto.BaseCode;

class CppEngine
{
	public static inline var TEST_VAR:Int = 15;

	public static var newTextRenderer:Bool = true;

	public static var assetList:Array<String> = [];
	public static var extendedAssetNames:Array<String> = [];
	// public static var extendedAssetDatas:Array<BitmapData> = [];
	public static var fonts:Array<BitmapFont> = [];

	public static var mouse:Point = new Point(0, 0); // @hack: You need to make a Vec2 class, this is a flash.geom.Point and it fucks up everything
	public static var leftMouse:Bool = false;
	public static var rightMouse:Bool = false;
	public static var mouseWheel:Int = 0;
	public static var hasFocus:Bool = false;

	public static var mobile:Bool = false;
	// public static var stage:Stage;
	// public static var gameSprite:Sprite;
	public static var gameInit:Void->Void;
	public static var updateLoop:Void->Void;

	public static var width:Int = 800;
	public static var height:Int = 600;

	// public static var tempData:BitmapData;
	// public static var bitmapDataPool:Array<BitmapData> = [];
	// public static var spriteBundles:Array<SpriteBundle> = [];

	public static var currentTime:Float;
	public static var elapsed:Float;

	// private static var fps:openfl.display.FPS;

	// private static var rect:Rectangle = new Rectangle();
	// private static var point:Point = new Point();
	// private static var m:Matrix = new Matrix();
	// private static var colourTrans:ColorTransform = new ColorTransform();

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

	public static var defaultVolumeMod:Float = 1;
	public static var userVolumeMod:Float = 0.1; // This is set by the preloader in openfl
	public static var musicVolume:Float = 1;
	public static var effectVolume:Float = 1;
	public static var mute:Bool = false;
	public static var playSound:String->?String->?SoundConfig->Void = function(str:String, str2:String="", config:SoundConfig=null) {};
	public static var stopChannel:String->Void = function(str:String) {};
	public static var resetGlobalVolume:Void->Void = function() {};
	public static var setChannelVolume:String->Float->Void = function(str:String, flo:Float) {};
	public static var fadeChannel:String->?Bool->?Float->Void = function(str:String, boo:Bool=false, flo:Float=0) {};

	public static function init(gameInit:Void->Void, updateLoop:Void->Void):Void {
		// Engine.stage = flash.Lib.current.stage;
		// Engine.gameInit = gameInit;
		// Engine.updateLoop = updateLoop;

		// tempData = new BitmapData(width, height);

		// gameSprite = new Sprite();
		// stage.addChild(gameSprite);

		// stage.frameRate = 60;
		// currentTime = Timer.stamp();

		// stage.addEventListener(Event.ENTER_FRAME, update);
		// stage.addEventListener(MouseEvent.MOUSE_DOWN, function(_){leftMouse=true;});
		// stage.addEventListener(MouseEvent.MOUSE_UP, function(_){leftMouse=false;});
		// stage.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, function(_){rightMouse=false;});
		// stage.addEventListener(MouseEvent.RIGHT_MOUSE_UP, function(_){rightMouse=false;});
		// stage.addEventListener(MouseEvent.MOUSE_WHEEL, function(e:MouseEvent){mouseWheel=e.delta;});
		// stage.addEventListener(Event.DEACTIVATE, function(_) {hasFocus = false;});
		// stage.addEventListener(Event.ACTIVATE, function(_) {hasFocus = true;});

		// stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		// stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
// #if js
		// var head:Dynamic = js.Browser.document.getElementsByTagName("head")[0];
		// var script:Dynamic = js.Browser.document.createElement("script");
		// script.type = "text/javascript";
		// script.src = "lib/FileSaver.min.js";
		// head.appendChild(script);

		// var browserAgent:String = js.Browser.navigator.userAgent;
		// trace("agent: "+browserAgent);
		// if (browserAgent != null) {
		// 	if	(
		// 		browserAgent.contains("Android") ||
		// 		browserAgent.contains("BlackBerry") ||
		// 		browserAgent.contains("iPhone") ||
		// 		browserAgent.contains("iPad") ||
		// 		browserAgent.contains("iPod") ||
		// 		browserAgent.contains("Opera Mini") ||
		// 		browserAgent.contains("IEMobile")
		// 	) mobile = true;
		// 	else mobile = false;
		// }

// #end

// #if flash
		// // flash.Security.allowDomain("*");
// #end

		// /// Font parsing
		// for (assetPath in assetList) {
		// 	if (!assetPath.contains(".fnt")) continue;
		// 	var fontData:String = Assets.getText(assetPath);

		// 	var dataLines:Array<String> = fontData.split("\r\n");
		// 	var info:Array<String> = [];
		// 	var common:Array<String> = [];
		// 	var page:Array<String> = [];
		// 	var charsStr:Array<Array<String>> = [];
		// 	var kernsStr:Array<Array<String>> = [];

		// 	for (line in dataLines) {
		// 		var entries:Array<String> = line.split(" ");
		// 		while (entries.remove("")) {};

		// 		for (i in 0...entries.length) {
		// 			if (entries[i].contains("=")) entries[i] = entries[i].split("=")[1];
		// 			entries[i] = entries[i].replace("\"", "");
		// 		}

		// 		if (entries[0] == "info") info = entries;
		// 		if (entries[0] == "common") common = entries;
		// 		if (entries[0] == "page") page = entries;
		// 		if (entries[0] == "char") { 
		// 			entries.shift();
		// 			charsStr.push(entries);
		// 		}
		// 		if (entries[0] == "kerning") { 
		// 			entries.shift();
		// 			kernsStr.push(entries);
		// 		}
		// 	}

		// 	var chars:Array<Array<Int>> = [];
		// 	var kerns:Array<Array<Int>> = [];

		// 	for (charLine in charsStr) {
		// 		var intLine:Array<Int> = [];
		// 		for (charEntry in charLine)
		// 			intLine.push(Std.parseInt(charEntry));
		// 		chars.push(intLine);
		// 	}

		// 	for (kernLine in kernsStr) {
		// 		var intLine:Array<Int> = [];
		// 		for (kernEntry in kernLine)
		// 			intLine.push(Std.parseInt(kernEntry));
		// 		kerns.push(intLine);
		// 	}

		// 	var bitmapData:BitmapData = getBitmapData(page[2].replace("../", ""));
		// 	fonts.push({
		// 		info: info,
		// 		common: common,
		// 		page: page,
		// 		bitmapData: bitmapData,
		// 		chars: chars,
		// 		kerns: kerns
		// 	});

		// 	// log("Loaded font: "+info);
		// }
		// ComplexAnims.init();

		// Engine.gameInit();
	}

	public static function log(message:Dynamic):Void {
#if debug
		trace("LOG: "+message);
#end
	}

	public static function getSpriteProp(id:Int, prop:SpriteProp):Dynamic {
		// var bitmap:Bitmap = spriteBundles[id].bitmap;

		// if (prop == WIDTH) return bitmap.width;
		// if (prop == HEIGHT) return bitmap.height;

		return null;
	}

	public static function setTextFieldMaxHeight(id:Int, height:Float):Void {
		// spriteBundles[id].nativeText.height = height;
	}
	public static function setTextFieldMaxWidth(id:Int, width:Float):Void {
		// spriteBundles[id].nativeText.width = width;
	}

	public static function setTextFieldFormat(id:Int, newFormat:TextFieldFormat):Void {
		// var nativeText:TextField = spriteBundles[id].nativeText;
		// var nativeFormat:TextFormat = new TextFormat();
		// var format:TextFieldFormat = spriteBundles[id].textFieldFormat;

		// if (format.wordWrapWidth != null) format.wordWrap = true;

		// for (field in Reflect.fields(newFormat)) {
		// 	var val:Dynamic = Reflect.field(newFormat, field);
		// 	if (val != null) Reflect.setProperty(format, field, val);
		// }

		// nativeText.autoSize = format.autoSize;
		// nativeText.wordWrap = format.wordWrap;
		// nativeText.multiline = format.wordWrap;
		// nativeText.selectable = format.selectable;
		// nativeText.mouseEnabled = format.selectable;
		// nativeFormat.color = format.fontColour;
		// nativeText.border = format.border;
		// nativeText.borderColor = format.borderColour;
		// nativeFormat.size = format.fontSize;
		// nativeFormat.font = Assets.getFont("assets/font/"+format.fontName+"-Regular.ttf").fontName;
		// if (nativeText.wordWrap) nativeText.width = format.wordWrapWidth;

		// nativeText.defaultTextFormat = nativeFormat;

		// drawText(id);
	}

	//@cleanup Remove this?
	public static function setTextProp(id:Int, prop:TextProp, value:Dynamic):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// var nativeText:TextField = bundle.nativeText;
		// var bitmap:Bitmap = bundle.bitmap;

		// if (prop == TEXT) {
		// 	if (value == "") value = " ";
		// 	bundle.text = value;
		// 	nativeText.text = value;
		// 	if (!nativeText.wordWrap) nativeText.height = nativeText.textHeight + 4;
		// 	drawText(id);
		// }

		// if (prop == V_SCROLL) {
		// 	nativeText.scrollV = Std.int(Math.min(nativeText.maxScrollV, value));
		// 	drawText(id);
		// }

		// if (prop == REGIONS) { 
		// 	var regions:Array<FormatRegion> = cast value;
		// 	for (region in regions)
		// 		if (region.fontSize == null)
		// 			region.fontSize = spriteBundles[id].textFieldFormat.fontSize;
		// 	spriteBundles[id].regions = regions;
		// }
	}

	public static function drawText(id:Int):Void {
		// if (newTextRenderer) drawTextNew(id);
		// else drawTextOld(id);
	}

	public static function drawTextNew(id:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];

		// var fontSize:Int = 0;
		// var fontOptions:Array<BitmapFont> = [];
		// var font:BitmapFont = null;

		// var sizeRatio:Float = 0;

		// var colour:Int = bundle.textFieldFormat.fontColour;

		// function setFormatParams(region:FormatRegion=null):Void {
		// 	var fontName:String;
		// 	if (region == null) {
		// 		fontName = "OpenSans-Regular";
		// 		fontSize = bundle.textFieldFormat.fontSize;
		// 	} else {
		// 		if (region.italic) fontName = "OpenSans-Italic";
		// 		else if (region.bold) fontName = "OpenSans-Bold";
		// 		else fontName = "OpenSans-Regular";
		// 		fontSize = region.fontSize;
		// 	}

		// 	fontSize += 2;

		// 	var fontOptions:Array<BitmapFont> = [];
		// 	for (f in fonts)
		// 		if (f.info[1] == fontName)
		// 			fontOptions.push(f);
		// 	font = fontOptions[0];

		// 	for (f in fontOptions) {
		// 		if (fontSize == Std.parseInt(f.info[2])) {
		// 			font = f;
		// 			break;
		// 		}
		// 		if (Math.abs(Std.parseInt(f.info[2]) - fontSize) < Math.abs(Std.parseInt(font.info[2]) - fontSize)) font = f;
		// 	}

		// 	// trace(fontName);
		// 	// trace(fonts);
		// 	// trace(fontOptions);
		// 	// trace(font);
		// 	sizeRatio = fontSize/Std.parseInt(font.info[2]);
		// 	if (sizeRatio != 1) {
		// 		trace("Warning, using font "+fontName+" size "+fontSize+" ingame size "+(fontSize-2));
		// 		// throw "Bad";
		// 	}
		// }

		// setFormatParams();

		// var text:String = bundle.text;
		// var maxWidth:Int = bundle.textFieldFormat.wordWrapWidth;

		// bundle.origSize.x = width;
		// bundle.origSize.y = height;
		// bundle.bitmap.bitmapData.dispose();
		// // sprite.texture = textureBundleFromEmpty(Std.int(sprite.width), Std.int(sprite.height));
		// // sprite.vertexBuffer = genVertBuffer(0, 0, sprite.width, sprite.height);

		// function getLineHeight():Int {
		// 	return Std.parseInt(font.common[1]);
		// }

		// function getRegionAt(ind:Int):FormatRegion {
		// 	for (r in bundle.regions)
		// 		if (ind >= r.start && ind < r.end)
		// 			return r;

		// 	return null;
		// }

		// function getCharLine(id:Int):Array<Int> {
		// 	// trace("Char: "+id+" "+String.fromCharCode(id));
		// 	for (line in font.chars)
		// 		if (line[0] == id)
		// 			return line;
		// 	throw "Missing char "+id;
		// }

		// function getKern(prevId:Int, curId:Int):Int {
		// 	if (prevId != -1)
		// 		for (line in font.kerns)
		// 			if (line[0] == prevId && line[1] == curId)
		// 				return line[2];
		// 	return 0;
		// }

		// function getWordWidth(start:Int, end:Int):Int {
		// 	var prevId:Int = -1;
		// 	var width:Int = 0;
		// 	for (i in start...end) {
		// 		setFormatParams(getRegionAt(i));
		// 		var charId:Int = text.charCodeAt(i);
		// 		var charLine:Array<Int> = getCharLine(charId);

		// 		width += charLine[3] + charLine[5] + charLine[7] + getKern(prevId, charId);

		// 		prevId = charId;
		// 	}

		// 	return width;
		// }

		// var cursor:Point = new Point();
		// var prevId:Int = -1;
		// var renderQueue10:Array<Dynamic> = [];
		// bundle.textHeight = 0;
		// for (i in 0...text.length) {
		// 	if (text.charAt(i) == "\n") {
		// 		cursor.x = 0;
		// 		cursor.y += getLineHeight()*sizeRatio;
		// 		bundle.textHeight += getLineHeight();
		// 		continue;
		// 	}

		// 	if (prevId == 32) {
		// 		var nextBreakIndex:Int = text.length-1;
		// 		var nextSpace:Int = text.indexOf(" ", i);
		// 		var nextNewLine:Int = text.indexOf("\n", i);
		// 		if (nextSpace != -1) nextBreakIndex = cast Math.min(nextBreakIndex, nextSpace);
		// 		if (nextNewLine != -1) nextBreakIndex = cast Math.min(nextBreakIndex, nextNewLine);
		// 		var wordWidth:Float = getWordWidth(i, nextBreakIndex)*sizeRatio;
		// 		if (cursor.x + wordWidth > maxWidth) {
		// 			cursor.x = 0;
		// 			cursor.y += getLineHeight()*sizeRatio;
		// 			bundle.textHeight += getLineHeight();
		// 		}
		// 	}

		// 	// trace("On char "+i+" out of "+text.length);
		// 	setFormatParams(getRegionAt(i));
		// 	var char:String = text.charAt(i);
		// 	var charId:Int = text.charCodeAt(i);
		// 	if (charId == 0) continue; // New line removal makes this happen.
		// 	var charLine:Array<Int> = getCharLine(charId);

		// 	cursor.x += Math.round(getKern(prevId, charId)*sizeRatio);
		// 	point.setTo(cursor.x + charLine[5]*sizeRatio, cursor.y + charLine[6]*sizeRatio);
		// 	point.x = Math.round(point.x);
		// 	point.y = Math.round(point.y);
		// 	// renderToData(font.bitmapData, bundle.bitmap.bitmapData, charLine[1], charLine[2], charLine[3], charLine[4], Std.int(point.x), Std.int(point.y), 0xFF000000|colour, sizeRatio, sizeRatio);
		// 	renderQueue10.push(font.bitmapData);
		// 	renderQueue10.push(charLine[1]);
		// 	renderQueue10.push(charLine[2]);
		// 	renderQueue10.push(charLine[3]);
		// 	renderQueue10.push(charLine[4]);
		// 	renderQueue10.push(Std.int(point.x));
		// 	renderQueue10.push(Std.int(point.y));
		// 	renderQueue10.push(0xFF000000|colour);
		// 	renderQueue10.push(sizeRatio);
		// 	renderQueue10.push(sizeRatio);

		// 	bundle.textWidth = Math.max((point.x+charLine[3]*sizeRatio), bundle.textWidth);

		// 	cursor.x += charLine[7]*sizeRatio;
		// 	prevId = charId;
		// }
		// bundle.textHeight += getLineHeight();

		// if (bundle.textWidth == 0) bundle.textWidth = 1;
		// if (bundle.textHeight == 0) bundle.textHeight = 1;

		// bundle.bitmap.bitmapData = new BitmapData(Math.ceil(bundle.textWidth), Math.ceil(bundle.textHeight), true, 0);
		// while(renderQueue10.length != 0) {
		// 	renderToData(renderQueue10.shift(), bundle.bitmap.bitmapData, renderQueue10.shift(), renderQueue10.shift(), renderQueue10.shift(),
		// 	renderQueue10.shift(), renderQueue10.shift(), renderQueue10.shift(), renderQueue10.shift(), renderQueue10.shift(), renderQueue10.shift());
		// }
	}

	public static function drawTextOld(id:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// var nativeText:TextField = bundle.nativeText;
		// var dest:BitmapData = bundle.bitmap.bitmapData;

		// /// Regions
		// var defaultFormat:TextFieldFormat = spriteBundles[id].textFieldFormat;
		// for (region in bundle.regions) {
		// 	if (region.end >= nativeText.text.length) continue;

		// 	var textFormat:TextFormat = new TextFormat();
		// 	textFormat.font = Assets.getFont("assets/font/"+defaultFormat.fontName+"-Regular.ttf").fontName;
		// 	textFormat.size = region.fontSize;
		// 	textFormat.color = defaultFormat.fontColour;

		// 	if (region.bold) textFormat.font = Assets.getFont("assets/font/"+defaultFormat.fontName+"-Bold.ttf").fontName;
		// 	if (region.italic) textFormat.font = Assets.getFont("assets/font/"+defaultFormat.fontName+"-Italic.ttf").fontName;
		// 	textFormat.underline = region.underline;
		// 	nativeText.setTextFormat(textFormat, region.start, region.end);
		// }

		// /// Get bitmap
		// if (dest.width < nativeText.width || dest.height < nativeText.height) {
		// 	dest.dispose();
		// 	dest = new BitmapData(Std.int(nativeText.width), Std.int(nativeText.height));
		// 	bundle.bitmap.bitmapData = dest;
		// 	bundle.bitmap.smoothing = true;
		// }

		// rect.setTo(0, 0, width, height);
		// bundle.bitmap.bitmapData.fillRect(rect, 0x00000000);
		// rect.setTo(0, 0, bundle.nativeText.width+1, bundle.nativeText.height+1);
		// bundle.bitmap.bitmapData.draw(bundle.nativeText, null, null, null, rect, true);
	}

	public static function getTextCharRect(id:Int, charIndex:Int):Rect {
		// return spriteBundles[id].nativeText.getCharBoundaries(charIndex);
		return null;
	}

	public static function getTextLineIndexOfChar(id:Int, charIndex:Int):Int {
		// return spriteBundles[id].nativeText.getLineIndexOfChar(charIndex);
		return 0;
	}

	public static function getTextProp(id:Int, prop:TextProp):Dynamic {
		// var nativeText:TextField = spriteBundles[id].nativeText;

		// if (prop == WIDTH) return nativeText.width;
// #if js
		// if (prop == FIELD_HEIGHT) return nativeText.textHeight+3;
		// if (prop == HEIGHT) return nativeText.height+3;
// #else
		// if (prop == FIELD_HEIGHT) return nativeText.textHeight;
		// if (prop == HEIGHT) return nativeText.height;
// #end 
		// if (prop == FIELD_WIDTH) return nativeText.textWidth+6;

		// if (prop == TEXT) {
		// 	if (nativeText.text == " ") return "";
		// 	return nativeText.text;
		// }
		// if (prop == AUTO_SIZE) return nativeText.autoSize;
		// if (prop == WORD_WRAP) return nativeText.wordWrap;
		// if (prop == SELECTABLE) return nativeText.selectable;
		// if (prop == V_SCROLL) return nativeText.scrollV;
		// if (prop == MAX_V_SCROLL) return nativeText.maxScrollV;
		// if (prop == VISIBLE_LINES) return nativeText.bottomScrollV - nativeText.scrollV;

		return null;
	}

	public static function loseTextFocus(id:Int) {
		// spriteBundles[id].hasTextFocus = false;
	}

	public static function getTextFocus(id:Int) {
// #if js
// 		if (mobile) {
// 			var str:String = js.Browser.window.prompt("", spriteBundles[id].nativeText.text);
// 			spriteBundles[id].nativeText.text = str;
// 			drawText(id);
// 			return;
// 		}
// #end
// 		for (bundle in spriteBundles)
// 			if (bundle != null)
// 				bundle.hasTextFocus = false;
// 		spriteBundles[id].hasTextFocus = true;
	}

	public static function transformSprite(id:Int, x:Float, y:Float, scaleX:Float, scaleY:Float, rotation:Float, alpha:Float, visible:Bool, centerPivot:Bool, layer:Int, pivotX:Float, pivotY:Float):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// var origWidth:Float;
		// var origHeight:Float;
		// if (bundle.nativeText == null) {
		// 	origWidth = bundle.origSize.x;
		// 	origHeight = bundle.origSize.y;
		// } else {
		// 	origWidth = getTextProp(id, FIELD_WIDTH);
		// 	origHeight = getTextProp(id, FIELD_HEIGHT);
		// }
		// bundle.layer = layer;

		// m.identity();
		// if (centerPivot) m.translate(-origWidth/2, -origHeight/2);
		// m.translate(-pivotX, -pivotY);
		// m.rotate(rotation*Math.PI/180);
		// m.scale(scaleX, scaleY);
		// m.translate(pivotX, pivotY);
		// if (centerPivot) m.translate(origWidth/2, origHeight/2);
		// m.translate(x, y);

		// if (spriteBundles[id].magicSprite != null) spriteBundles[id].magicSprite.transform.matrix = m;
		// spriteBundles[id].bitmap.transform.matrix = m;
		// spriteBundles[id].bitmap.alpha = alpha;
		// spriteBundles[id].bitmap.visible = visible;
	}

	public static function tintSprite(id:Int, colour:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// bundle.tint = colour;

		// copySpritePixels(id, 0, 0, bundle.sourceData.width, bundle.sourceData.height, 0, 0, colour);
	}

	public static function update():Void {
		// mouse.x = stage.mouseX;
		// mouse.y = stage.mouseY;

		// var newTimer:Float = Timer.stamp();
		// elapsed = newTimer-currentTime;
		// currentTime = newTimer;

		// for (bind in CommonBase.keyBinds) {
		// 	if (!bind.isDown || bind.state != PRESSED) continue;

		// 	bind.interval -= elapsed;
		// 	if (bind.interval <= 0) {
		// 		bind.interval = bind.maxInterval;
		// 		bind.fn();
		// 	}
		// }

		// // try {
		// updateLoop();
		// // } catch (error:flash.errors.Error) {
		// // 	throw error;
		// // }

		// var layered:Array<SpriteBundle> = [];
		// for (bundle in spriteBundles) {
		// 	if (bundle == null) continue;
		// 	if (bundle.layer != 0) layered.push(bundle);
		// }

		// var curLayer:Int = 0;
		// var totalLeft:Int = layered.length;

		// while (true) {
		// 	for (bundle in layered) {
		// 		if (bundle.layer == curLayer) {
		// 			gameSprite.setChildIndex(bundle.bitmap, gameSprite.numChildren-1);
		// 			totalLeft--;
		// 			if (totalLeft == 0) break;
		// 		}
		// 	}
		// 	if (totalLeft == 0) break;
		// 	curLayer++;
		// }

		// if (fps != null) stage.setChildIndex(fps, stage.numChildren-1);
		// mouseWheel = 0;
	}

	public static function pointOverlapSprite(p:Point, id:Int, pixelPerfect:Bool=false):Bool {
		// var bundle:SpriteBundle = spriteBundles[id];
		// var bitmap:Bitmap = bundle.bitmap;

		// if (bitmap == null || bundle.nativeText != null) pixelPerfect = false;

		// if (bundle.nativeText != null) {
		// 	rect.setTo(bitmap.x, bitmap.y, bundle.nativeText.width, bundle.nativeText.height);
		// } else rect.setTo(bitmap.x, bitmap.y, bitmap.width, bitmap.height);
		// var pointInRect:Bool = rect.containsPoint(p);

		// if (pointInRect && pixelPerfect) {
		// 	var bitmapData:BitmapData = bundle.bitmap.bitmapData;
		// 	return bitmapData.hitTest(new Point(0, 0), 1, bundle.bitmap.globalToLocal(p));
		// } else {
		// 	return pointInRect;
		// }
		return false;
	}

	public static function showFps():Void {
		// if (fps != null) return;
		// fps = new openfl.display.FPS(10, 25);
		// stage.addChild(fps);
	}

	public static function hideFps():Void {
		// if (fps == null) return;
		// stage.removeChild(fps);
		// fps = null;
	}

	public static function createSprite():Int {
		// var bundle:SpriteBundle = new SpriteBundle();
		// bundle.bitmap = new Bitmap(new BitmapData(1, 1));
		// bundle.trans = new Matrix();

		// spriteBundles.push(bundle);
		// return spriteBundles.length-1;
		return 0;
	}

	public static function resolveAssetName(assetId:String, crash:Bool=true, extraContains:String=".png"):String {
		// var realId:String = "";
		// var allChoices:Array<String> = [];

		// for (asset in assetList)
		// 	if (asset.contains(assetId) && asset.contains(extraContains))
		// 		allChoices.push(asset);

		// for (asset in extendedAssetNames)
		// 	if (asset.contains(assetId) && asset.contains(extraContains))
		// 		allChoices.push(asset);

		// for (asset in allChoices)
		// 	if (realId == "" || asset.length < realId.length)
		// 		realId = asset;

		// if (realId == "" && crash) {
		// 	throw "Asset "+assetId+" not found";
		// }

		// return realId;
		return "";
	}

	public static function setupImageSprite(id:Int, assetId:String):{width:Int, height:Int} {
		// //@cleanup: Factor out debug?
		// // log("Loading image: "+assetId+" into id: "+id);
		// assetId = resolveAssetName(assetId);

		// var bundle:SpriteBundle = spriteBundles[id];
		// bundle.assetId = assetId;

		// bundle.sourceData = getBitmapData(assetId);
		// if (bundle.sourceData == null) throw "No bitmap data";
		// bundle.bitmap.bitmapData.dispose();
		// bundle.bitmap.bitmapData = new BitmapData(bundle.sourceData.width, bundle.sourceData.height);
		// bundle.bitmap.smoothing = true;

		// bundle.origSize.x = bundle.bitmap.bitmapData.width;
		// bundle.origSize.y = bundle.bitmap.bitmapData.height;

		// resetSpritePixels(id);
		// return {width: Std.int(bundle.origSize.x), height: Std.int(bundle.origSize.y)};
		return {width: 0, height: 0};
	}

	public static function setupAnimatedSprite(id:Int, assetId:String, w:Int, h:Int):Void { setupCanvasSprite(id, assetId, w, h); }
	public static function setupCanvasSprite(id:Int, assetId:String, w:Int, h:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// assetId = resolveAssetName(assetId, true, ".png");
		// bundle.assetId = assetId;
		// bundle.bitmap.bitmapData.dispose();
		// bundle.sourceData = getBitmapData(assetId);

		// bundle.bitmap.bitmapData = new BitmapData(w, h, true, 0);
		// bundle.bitmap.smoothing = true;

		// bundle.origSize.x = w;
		// bundle.origSize.y = h;
	}

	public static function setupEmptySprite(id:Int, w:Int, h:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// bundle.bitmap.bitmapData.dispose();
		// bundle.sourceData = new BitmapData(w, h, true, 0);
		// bundle.bitmap.bitmapData = new BitmapData(w, h, true, 0);
		// bundle.bitmap.smoothing = true;
	}

	public static function setSpriteClip(id:Int, x:Int, y:Int, w:Int, h:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];

		// if (bundle.mask != null) bundle.mask.bitmapData.dispose();

		// bundle.mask = new Bitmap(new BitmapData(w, h));
		// rect.setTo(0, 0, bundle.mask.width, bundle.mask.height);
		// bundle.mask.bitmapData.fillRect(rect, 0xFF000000);
		// bundle.mask.x = x;
		// bundle.mask.y = y;
		// bundle.bitmap.mask = bundle.mask;
	}

	public static function switchFrame(id:Int, xpos:Int, ypos:Int, w:Int, h:Int, xoff:Int, yoff:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];

		// rect.setTo(0, 0, bundle.bitmap.width, bundle.bitmap.height);
		// bundle.bitmap.bitmapData.fillRect(rect, 0x00000000);

		// rect.setTo(xpos, ypos, w, h);
		// point.setTo(xoff, yoff);
		// copySpritePixels(id, xpos, ypos, w, h, xoff, yoff, -1, false);

		// if (bundle.tint != 0) { // Tinting animations is faster this way because we don't need to draw to another surface first becasue the frame is cleared.
		// 	rect.setTo(0, 0, bundle.bitmap.width, bundle.bitmap.height);
		// 	bundle.bitmap.bitmapData.colorTransform(rect, getColourTransform(bundle.tint));
		// }
	}

	public static function setup9SliceSprite(id:Int, assetId:String, x1:Float, y1:Float, x2:Float, y2:Float, w:Float, h:Float):Void {
		// // log("Loading 9slice: "+assetId+" into id: "+id);
		// var data:BitmapData = getBitmapData(assetId);
		// var scaledData:BitmapData = new BitmapData(Std.int(w), Std.int(h), true, 0);

		// var rows:Array<Int> = [
		// 	0, 
		// 	Math.floor(y1), 
		// 	Math.floor(y2), 
		// 	Math.floor(data.height)
		// ];
		// var cols:Array<Int> = [
		// 	0, 
		// 	Math.floor(x1), 
		// 	Math.floor(x2), 
		// 	Math.floor(data.width)
		// ];

		// var dRows:Array<Int> = [
		// 	0, 
		// 	Math.floor(y1), 
		// 	Math.floor(h - (data.height - y2)), 
		// 	Math.floor(h)
		// ];
		// var dCols:Array<Int> = [
		// 	0, 
		// 	Math.floor(x1), 
		// 	Math.floor(w - (data.width - x2)), 
		// 	Math.floor(w)
		// ];

		// var origin:Rectangle;
		// var draw:Rectangle;
		// var mat:Matrix = new Matrix();

		// for (cx in 0...3) {
		// 	for (cy in 0...3) {
		// 		origin = new Rectangle(cols[cx], rows[cy], cols[cx + 1] - cols[cx], rows[cy + 1] - rows[cy]);
		// 		draw = new Rectangle(dCols[cx], dRows[cy], dCols[cx + 1] - dCols[cx], dRows[cy + 1] - dRows[cy]);
		// 		mat.identity();
		// 		mat.a = draw.width / origin.width;
		// 		mat.d = draw.height / origin.height;
		// 		mat.tx = draw.x - origin.x * mat.a;
		// 		mat.ty = draw.y - origin.y * mat.d;
		// 		scaledData.draw(data, mat, null, null, draw, false);
		// 	}
		// }

		// var bundle:SpriteBundle = spriteBundles[id];

		// bundle.sourceData = scaledData;
		// bundle.assetId = assetId;
		// bundle.bitmap.bitmapData.dispose();
		// bundle.bitmap.bitmapData = new BitmapData(bundle.sourceData.width, bundle.sourceData.height);
		// bundle.bitmap.smoothing = true;
		// bundle.origSize.x = bundle.bitmap.width;
		// bundle.origSize.y = bundle.bitmap.height;

		// resetSpritePixels(id);
	}

	public static function setupRectSprite(id:Int, width:Float, height:Float, colour:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];

		// var w:Int = Std.int(width);
		// var h:Int = Std.int(height);

		// if (bundle.sourceData == null) {
		// 	bundle.sourceData = new BitmapData(w, h);
		// 	bundle.bitmap.bitmapData = new BitmapData(w, h);
		// 	bundle.bitmap.smoothing = true;
		// }

		// rect.setTo(0, 0, w, h);
		// bundle.sourceData.fillRect(rect, 0xFF000000|colour);

		// bundle.origSize.x = w;
		// bundle.origSize.y = h;

		// resetSpritePixels(id);
	}

	public static function clearSprite(id:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// bundle.sourceData = null;
		// resetSpritePixels(id);
	}

	public static function applyGlowEffect(id:Int, colour:Int, alpha:Float, blurX:Float, blurY:Float, strength:Float, inner:Bool, knockout:Bool):Void {
		// spriteBundles[id].bitmap.filters = [new GlowFilter(colour, alpha, blurX, blurY, strength, 1, inner, knockout)];
	}

	public static function clearEffects(id:Int):Void {
		// spriteBundles[id].bitmap.filters = [];
	}

	public static function drawSpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, tint:Int=-1, scaleX:Float=1, scaleY:Float=1):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// if (bundle.sourceData == null || bundle.bitmap == null) throw "Can't draw pixels of nil";

		// renderToData(bundle.sourceData, bundle.bitmap.bitmapData, sx, sy, sw, sh, dx, dy, tint, scaleX, scaleY);
	}

	// private static function renderToData(src:BitmapData, dest:BitmapData, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, tint:Int=-1, scaleX:Float=1, scaleY:Float=1):Void {
		// rect.setTo(sx, sy, sw, sh);
		// point.setTo(0, 0);
		// tempData.copyPixels(src, rect, point, null, null, false);

		// m.identity();
		// m.scale(scaleX, scaleY);
		// m.translate(dx, dy);

		// rect.setTo(dx, dy, sw*scaleX, sh*scaleY);
		// dest.draw(tempData, m, getColourTransform(tint), null, rect, true);
	// }

	public static function copySpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, tint:Int=-1, alphaMerge:Bool=true):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// if (bundle.sourceData == null || bundle.bitmap == null) throw "Can't copy pixels of nil";

		// if (tint == -1) {
		// 	rect.setTo(sx, sy, sw, sh);
		// 	point.setTo(dx, dy);
		// 	bundle.bitmap.bitmapData.copyPixels(bundle.sourceData, rect, point, null, null, alphaMerge);
		// } else {
		// 	rect.setTo(sx, sy, sw, sh);
		// 	point.setTo(0, 0);
		// 	tempData.copyPixels(bundle.sourceData, rect, point, null, null, false);

		// 	rect.setTo(0, 0, sw, sh);
		// 	tempData.colorTransform(rect, getColourTransform(tint));

		// 	point.setTo(dx, dy);
		// 	bundle.bitmap.bitmapData.copyPixels(tempData, rect, point, null, null, true);
		// }
	}

	public static function fillSpritePixels(id:Int, sx:Int, sy:Int, sw:Int, sh:Int, colour:Int):Void {
		// if (spriteBundles[id].bitmap == null) throw "Can't fill pixels of nil";

		// var dest:BitmapData = spriteBundles[id].bitmap.bitmapData;

		// rect.setTo(sx, sy, sw, sh);
		// dest.fillRect(rect, colour);
	}

	private static function resetSpritePixels(id:Int):Void {
		// if (spriteBundles[id].sourceData == null || spriteBundles[id].bitmap == null) return;

		// var src:BitmapData = spriteBundles[id].sourceData;
		// var dest:BitmapData = spriteBundles[id].bitmap.bitmapData;

		// rect.setTo(0, 0, src.width, src.height);
		// point.setTo(0, 0);
		// dest.copyPixels(src, rect, point);
	}

	public static function applyGlitchEffect(id:Int):Void {
		// var src:BitmapData = spriteBundles[id].sourceData;
		// var dest:BitmapData = spriteBundles[id].bitmap.bitmapData;

		// var xpos:Float = Math.random()*src.width-1;
		// var ypos:Float = Math.random()*src.height-1;
		// var timerId:Int;
		// timerId = timer(2, function() {
		// 	for (i in 0...Std.int(Math.random()*20)+10) {
		// 		timer(i*(Math.random()*0.05), function() {
		// 			if (spriteBundles[id] == null) {
		// 				timerCancel(timerId);
		// 				return;
		// 			}
		// 			rect.setTo(xpos, ypos, 100, 100);
		// 			var exX:Float = Math.random()*40-80;
		// 			var exY:Float = Math.random()*40-80;
		// 			xpos += Math.random()*15-7.5 + exX;
		// 			ypos += Math.random()*15-7.5 + exY;
		// 			if (xpos < 0 || xpos > src.width-1) xpos = Math.random()*src.width-1;
		// 			if (ypos < 0 || ypos > src.height-1) ypos = Math.random()*src.height-1;
		// 			point.setTo(xpos, ypos);
		// 			dest.copyPixels(src, rect, point);

		// 			if (i == 20) {
		// 				point.setTo(0, 0);
		// 				dest.copyPixels(src, src.rect, point);
		// 			}
		// 		});
		// 	}
		// }, 9999);
	}

	public static function setMagicSpriteClick(id:Int, fn:Void->Void):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// if (bundle.magicSprite != null) stage.removeChild(spriteBundles[id].magicSprite);

		// var magicSprite:Sprite = new Sprite();
		// magicSprite.graphics.beginFill(0xFF0000, 0);
		// magicSprite.graphics.drawRect(bundle.bitmap.x, bundle.bitmap.y, bundle.bitmap.width, bundle.bitmap.height);
		// bundle.magicSprite = magicSprite;

		// magicSprite.addEventListener(MouseEvent.CLICK, function(_) {
		// 	fn();
		// }, false, 0, true);

		// stage.addChild(magicSprite);
	}

	public static function destroySprite(id:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];

		// if (bundle.bitmap != null) {
		// 	if (bundle.bitmap.bitmapData.width == width && bundle.bitmap.bitmapData.height == height) bitmapDataPool.push(bundle.bitmap.bitmapData);
		// 	else bundle.bitmap.bitmapData.dispose();
		// }

		// if (bundle.mask != null) {
		// 	bundle.mask.bitmapData.dispose();
		// }

		// if (bundle.magicSprite != null)
		// 	stage.removeChild(bundle.magicSprite);

		// spriteBundles[id] = null;
	}

	public static function createText(id:Int):Void {
		// var bundle:SpriteBundle = spriteBundles[id];
		// bundle.assetId = "text";

		// var tf:TextField = new TextField();
		// tf.height = height;
		// tf.embedFonts = true;
		// tf.gridFitType = GridFitType.SUBPIXEL;
		// tf.antiAliasType = AntiAliasType.ADVANCED;
		// tf.sharpness = -200;

		// // @cleanup Why doesn't this exist any more?
		// // tf.thickness = -100;

		// bundle.nativeText = tf;
		// bundle.textFieldFormat = {
		// 	autoSize: "none",
		// 	wordWrap: false,
		// 	wordWrapWidth: 800,
		// 	selectable: false,
		// 	fontColour: 0,
		// 	fontSize: 14,
		// 	fontName: "OpenSans",
		// 	border: false,
		// 	borderColour: 0
		// };
	}

	public static function getContainerUrl():String {
		// if (stage.loaderInfo != null) return stage.loaderInfo.url.toLowerCase();
		return null;
	}

	public static function loadBase64Png(name:String, str:String, onComplete:Void->Void):Void {
		// str = str.replace("data:image/png;base64,", "");
		// var bytes:Bytes = haxe.crypto.Base64.decode(str);
		// loadPngBytes(name, bytes, onComplete);
	}

	private static function loadPngBytes(name:String, bytes:Bytes, onComplete:Void->Void):Void {
		// var loader:Loader = new Loader();
		// loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e:Event):Void {
		// 	extendedAssetNames.push("external_"+name+".png");
		// 	extendedAssetDatas.push(cast(loader.content, Bitmap).bitmapData);
		// 	onComplete();
		// });
		// loader.loadBytes(bytes);
	}

	public static function loadFromDisk(callback:String->String->Void):Void {
		// CommonBase.resetKeyboard();

		// function uploadDone(name:String, bytes:Bytes):Void {
		// 	if (name.contains(".tar")) {
		// 		var tarData = new format.tar.Reader(new BytesInput(bytes, 0, bytes.length)).read();
		// 		var mainText:String = "";

		// 		var pngsToParse:Array<{fileName:String, data:Bytes}> = [];
		// 		for (tarFile in tarData) {
		// 			if (tarFile.fileName == "main.txt") mainText = Std.string(tarFile.data);
		// 			else if (tarFile.fileName.contains(".png")) pngsToParse.push({fileName: tarFile.fileName, data: tarFile.data});
		// 		}

		// 		for (p in pngsToParse) {
		// 			loadPngBytes(p.fileName, p.data, function() {
		// 				pngsToParse.remove(p);
		// 				if (pngsToParse.length == 0) callback(mainText, "success");
		// 			});
		// 		}
		// 	} else {
		// 		callback(Std.string(bytes), "success");
		// 	}
		// }

// #if flash
		// try {
		// 	var file:FileReference = new FileReference();
		// 	file.addEventListener(Event.SELECT, function (e:Event):Void {
		// 		file.addEventListener(Event.COMPLETE, function(e:Event):Void {
		// 			uploadDone(file.name, file.data);
		// 		}, false, 0, true); 
		// 		file.load();
		// 	}, false, 0, true);
		// 	file.browse();
		// } catch (e:flash.errors.Error) {
		// 	callback(e.message, "error");
		// }
// #elseif js
		// // @incomplete Mobile
		// var fileName:String = "";
		// var elem:Dynamic = js.Browser.document.createElement("input");
		// elem.setAttribute("type", "file");
		// elem.style.position = "absolute";
		// elem.style.zIndex = "1";
		// elem.onchange = function() {
		// 	var reader:Dynamic = untyped __js__('new FileReader()');
		// 	reader.onloadend = function() {
		// 		uploadDone(fileName, Bytes.ofData(reader.result));
		// 		elem.remove();
		// 	}
		// 	reader.onerror = function() {
		// 		callback(null, "error");
		// 		elem.remove();
		// 	}
		// 	fileName = elem.files[0].name;
		// 	reader.readAsArrayBuffer(elem.files[0]);
		// }
		// var div = js.Browser.document.getElementById("openfl-content");
		// div.insertBefore(elem, div.firstChild);
// #end
	}

	public static function saveToDisk(string:String, fileName:String, callback:String->Void):Void {
// #if flash
// 		try {
// 			var file:FileReference = new FileReference();
// 			file.save(string, fileName);
// 			file.addEventListener(Event.COMPLETE, function (e:Event):Void {
// 				callback("success");
// 			}, false, 0, true);
// 		} catch (e:flash.errors.Error) {
// 			callback("error");
// 		}
// #elseif js
// 		untyped __js__('saveAs(new Blob([{0}], {type: "text/plain;charset=utf-8"}), "{1}")', string, fileName);
// #end
	}

	public static function getUrl(url:String):Void {
		// openfl.Lib.getURL(new openfl.net.URLRequest(url));
	}

	public static function getAssetList():Array<String> {
		// return assetList.copy();
		return [];
	}

	public static function pathToText(assetId:String):String {
		// return Assets.getText(resolveAssetName(assetId, true, ""));
		return "";
	}

	// private static function keyUp(e:KeyboardEvent):Void {
		// CommonBase.keyCameUp(e.keyCode);
	// }

	// private static function keyDown(e:KeyboardEvent):Void {
		// CommonBase.keyWentDown(e.keyCode);

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
	// }

	// private static function getColourTransform(colour:Int):ColorTransform {
		// var trans:ColorTransform = colourTrans;
		// var multiplier:Float = ((colour >> 24) & 0xFF)/255;
		// trans.redMultiplier = trans.greenMultiplier = trans.blueMultiplier = 1 - multiplier;
		// var r:Int = (colour >> 16) & 0xFF;
		// var g:Int = (colour >>  8) & 0xFF;
		// var b:Int =  colour        & 0xFF;
		// trans.redOffset   = Math.round(r * multiplier);
		// trans.greenOffset = Math.round(g * multiplier);
		// trans.blueOffset  = Math.round(b * multiplier);
		// return trans;
	// }
}

//@cleanup Make this a typedef
class SpriteBundle {
	public var assetId:String = "<no asset>";

	public var text:String = "";
	public var regions:Array<FormatRegion> = [];
	public var textWidth:Float = 0;
	public var textHeight:Float = 0;

	// public var nativeText:TextField = null;
	public var textFieldFormat:TextFieldFormat = null;
	public var hasTextFocus:Bool = false;

	// public var trans:Matrix = null;

	// public var bitmap:Bitmap = null;
	// public var sourceData:BitmapData = null;
	// public var mask:Bitmap = null;

	public var origSize:Point = new Point();
	// public var magicSprite:Sprite = null;
	public var layer:Int = 0;
	public var tint:Int = 0;

	public function new() {}
}

typedef BitmapFont = {
	info:Array<String>,
	common:Array<String>,
	page:Array<String>,
	// bitmapData:BitmapData,
	chars:Array<Array<Int>>,
	kerns:Array<Array<Int>>,
}
