package engine;

// import haxe.xml.*;

class ComplexAnims
{
	public static var complexAnims:Array<ComplexAnim> = [];
	public static var sheets:Map<String, Array<InnerTexture>>;
	public static var animations:Map<String, AnimationDef>;

	public static var timeQueue:Float = 0;

	public static function init():Void {
		var hasSheets:Bool = false;
		for (assetStr in Engine.assetList)
			if (assetStr.contains("assets/info/sheets.xml"))
				hasSheets = true;
		if (!hasSheets) return;

		var sheetsXml:Xml = Xml.parse(Engine.pathToText("info/sheets.xml")).firstElement();
		var animationsXml:Xml = Xml.parse(Engine.pathToText("info/animations.xml")).firstElement();

		{ /// Sheets
			sheets = new Map();

			for (sheetChild in sheetsXml.elements()) {
				sheets.set(sheetChild.get("name"), []);

				for (textureChild in sheetChild.elements()) {
					var texture:InnerTexture = {
						name: textureChild.get("name"),
						path: textureChild.get("path"),
						width: Std.parseFloat(textureChild.get("width")),
						height: Std.parseFloat(textureChild.get("height")),
						pivotX: Std.parseFloat(textureChild.get("registrationPointX")),
						pivotY: Std.parseFloat(textureChild.get("registrationPointY")),
						layer: Std.parseInt(textureChild.get("zIndex"))
					}

					sheets.get(sheetChild.get("name")).push(texture);
				}
			}
		}

		{ /// Animations
			animations = new Map();

			for (animationChild in animationsXml.elements()) {
				var animation:Array<Part> = [];

				for (partChild in animationChild.elements()) {
					var part:Part = {name: partChild.get("name"), frames: []};
					animation.push(part);

					for (frameChild in partChild.elements()) {
						var frame:Frame = {
							x: Std.parseFloat(frameChild.get("x")),
							y: Std.parseFloat(frameChild.get("y")),
							scaleX: Std.parseFloat(frameChild.get("scaleX")),
							scaleY: Std.parseFloat(frameChild.get("scaleY")),
							rotation: Std.parseFloat(frameChild.get("rotation")),
							alpha: Std.parseFloat(frameChild.get("alpha"))
						};
						
						part.frames.push(frame);
					}
				}

				animations.set(animationChild.get("name").toLowerCase(), { frameCount: Std.parseInt(animationChild.get("frameCount")), parts: animation });
			}
		}

		for (key in sheets.keys()) {
			for (texture in sheets.get(key)) {
				if (texture.pivotX == null || Math.isNaN(texture.pivotX)) texture.pivotX = 0;
				if (texture.pivotY == null || Math.isNaN(texture.pivotY)) texture.pivotY = 0;
				if (texture.layer == null || Math.isNaN(texture.layer)) texture.layer = 0;
			}
		}

		for (key in animations.keys()) {
			for (part in animations.get(key).parts) {
				for (i in 0...part.frames.length) {
					var frame:Frame = part.frames[i];
					var prevFrame:Frame = null;
					if (i == 0) prevFrame = {x: 0, y: 0, scaleX: 1, scaleY: 1, rotation: 0, alpha: 1};
					else prevFrame = part.frames[i-1];
					if (frame.x == null || Math.isNaN(frame.x)) frame.x = prevFrame.x;
					if (frame.y == null || Math.isNaN(frame.y)) frame.y = prevFrame.y;
					if (frame.scaleX == null || Math.isNaN(frame.scaleX)) frame.scaleX = prevFrame.scaleX;
					if (frame.scaleY == null || Math.isNaN(frame.scaleY)) frame.scaleY = prevFrame.scaleY;
					if (frame.rotation == null || Math.isNaN(frame.rotation)) frame.rotation = prevFrame.rotation;
					if (frame.alpha == null || Math.isNaN(frame.alpha)) frame.alpha = prevFrame.alpha;
					if (frame.rotation < 0) frame.rotation = frame.rotation+360;
				}
			}
		}
	}

	public static function create(animName:String):ComplexAnim {
		animName = animName.toLowerCase();
		var animation:AnimationDef = animations.get(animName);
		var sprites:Array<MintSprite> = [];
		var partInfo:Array<Part> = [];

		var textures:Array<InnerTexture> = sheets.get(animName);
		var isAtlas:Bool = textures.length > 1;
		// trace("Inner textures are: "+textures);

		for (part in animation.parts) {
			var texture:InnerTexture = null;
			for (t in textures) {
				if (t.name == part.name) {
					texture = t;
					break;
				}
			}

			// trace("I need: "+part.name+" and got "+texture.path);
			var spr:MintSprite = null;
			if (!isAtlas) {
				spr = new MintSprite("complexAnims/"+animName);
			} else {
				spr = new MintSprite();
				spr.setupCanvas("complexAnims/"+animName);
				spr.setTile(part.name);
			}
			spr.centerPivot = false;
			spr.pivotX = texture.pivotX;
			spr.pivotY = texture.pivotY;

			sprites.push(spr);
			partInfo.push(part);
		}

		var anim:ComplexAnim = {
			sprites: sprites,
			x: 0,
			y: 0,
			rotation: 0,
			alpha: 1,
			partInfo: partInfo,
			totalFrames: animation.frameCount,
			currentFrame: 0
		};
		complexAnims.push(anim);
		gotoFrame(anim, 0);
		return anim;
	}

	public static function advanceFrames(anim:ComplexAnim, frames:Int):Void {
		// trace("Advancing: "+frames+" total of: "+anim.totalFrames);
		while (frames > 0) {
			anim.currentFrame++;
			frames--;
			if (anim.currentFrame >= anim.totalFrames) anim.currentFrame = 0;
		}

		gotoFrame(anim, anim.currentFrame);
	}

	public static function gotoFrame(anim:ComplexAnim, frame:Int):Void {
		// trace("Going to: "+frame);
		for (i in 0...anim.sprites.length) {
			var spr:MintSprite = anim.sprites[i];
			var frame:Frame = anim.partInfo[i].frames[frame];
			// trace(frame);

			if (frame.x != null) spr.x = frame.x + anim.x;
			if (frame.y != null) spr.y = frame.y + anim.y;
			if (frame.scaleX != null) spr.scaleX = frame.scaleX;
			if (frame.scaleY != null) spr.scaleY = frame.scaleY;
			if (frame.rotation != null) spr.rotation = frame.rotation+anim.rotation;
			if (frame.alpha != null) spr.alpha = frame.alpha*anim.alpha;
		}
	}

	public static function update(elapsed:Float):Void {
		timeQueue += elapsed;
		
		var framesToAdvance:Int = 0;
		while (timeQueue > 1/60) {
			framesToAdvance++;
			timeQueue -= 1/60;
		}

		for (anim in complexAnims) advanceFrames(anim, framesToAdvance);
	}
}

typedef ComplexAnim = {
	sprites:Array<MintSprite>,
	x:Float,
	y:Float,
	rotation:Float,
	alpha:Float,
	partInfo:Array<Part>,
	currentFrame:Int,
	totalFrames:Int,
}

typedef Part = {
	name:String,
	frames:Array<Frame>
}

typedef InnerTexture = {
	?name:String,
	?path:String,
	?width:Float,
	?height:Float,
	?pivotX:Float,
	?pivotY:Float,
	?layer:Int
}

typedef AnimationDef = {
	frameCount:Int,
	parts:Array<Part>
}

typedef Frame = {
	?x:Float,
	?y:Float,
	?scaleX:Float,
	?scaleY:Float,
	?rotation:Float,
	?alpha:Float
}
