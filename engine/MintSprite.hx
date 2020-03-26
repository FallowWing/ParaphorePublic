package engine;

class MintSprite
{
	public static var mintSprites:Array<MintSprite> = [];
	public static var defaultLayer:Int = 0;
	public static var defaultPauseLayer:Int = 0;

	public var id:Int;
	public var exists(default, null):Bool = true;
	public var transDirty:Bool = false;

	public var x:Float = 0;
	public var y:Float = 0;
	public var scaleX:Float = 1;
	public var scaleY:Float = 1;
	public var rotation:Float = 0;
	public var alpha:Float = 1;
	public var visible:Bool = true;
	public var pivotX:Float = 0;
	public var pivotY:Float = 0;
	public var tint:Int = 0;
	public var scrolls:Bool = true;

	public var active(default, null):Bool = true;
	public var width:Int = 0;
	public var height:Int = 0;
	public var isPaused:Bool = false;

	public var mouseEnabled:Bool = true;
	public var mouseRejectAlpha:Float = -1;
	public var pixelPerfectOverlapping:Bool = true;
	public var centerPivot:Bool = true;

	public var onHover:Void->Void;
	public var onPress:Void->Void;
	public var onHoverOnce:Void->Void;
	public var onUnHoverOnce:Void->Void;
	public var onPressOnce:Void->Void;
	public var onReleaseOnce:Void->Void;
	public var onReleaseOnceAnywhere:Void->Void;
	public var onReleaseOnceAnywhereElse:Void->Void;
	public var toCall:Array<Void->Void> = [];

	public var hovering:Bool = false;
	public var pressing:Bool = false;
	public var holding:Bool = false;
	public var exclusiveHolding:Bool = false;
	public var holdPivot:Point = new Point();

	public var onAnimationFinished:Void->Void;
	public var animations:Array<Animation> = [];
	public var currentAnim:Animation = null;

	public var currentFrame:Int = -1;
	public var currentAnimFrame:Int = -1;
	public var animFrameRate:Int = 60;
	public var animated:Bool = false;
	public var playing:Bool = true;
	public var looping:Bool = true;
	public var totalFrames:Int = -1;
	public var timeTillNextFrame:Float = 0;
	public var playingTill:Int = -1;
	public var tileName:String;

	public var frameNames:Array<String>;
	public var frameDatas:Array<Rect>;
	public var offsetDatas:Array<Rect>;

	public var layer:Int;
	public var pauseLayer:Int;

	private var old_x:Float = 0;
	private var old_y:Float = 0;
	private var old_scaleX:Float = 1;
	private var old_scaleY:Float = 1;
	private var old_rotation:Float = 0;
	private var old_alpha:Float = 1;
	private var old_visible:Bool = true;
	private var old_layer:Int = 0;
	private var old_pivotX:Float = 0;
	private var old_pivotY:Float = 0;
	private var old_tint:Int = 0;
	private var old_scrolls:Bool = true;

	public function new(assetId:String=null):Void {
		id = Engine.createSprite();
		layer = defaultLayer;
		pauseLayer = defaultPauseLayer;
		if (assetId != null) setupAnimated(assetId);
		mintSprites.push(this);
	}

	private function parseSpr(path:String):Void {
		path = path.replace(".png", "");
		path = path+".spr";

		var hasSpr:Bool = false;
		for (assetStr in Engine.getAssetList()) {
			if (assetStr.contains(path) && assetStr.contains(".spr")) {
				hasSpr = true;
				break;
			}
		}
		if (!hasSpr) {
			trace("No spr file with base name "+path);
			return;
		}

		var sprData:String = Engine.pathToText(path);
		var frameData:Array<Int> = [];
		var offsetData:Array<Int> = [];
		var tempFrameNames:Array<String> = [];

		var sprLines:Array<String> = sprData.split("\n");
		sprLines.pop();
		while (sprLines.length > 0) {
			tempFrameNames.push(sprLines.shift().replace("\r", ""));
			var lineData:Array<String> = sprLines.shift().split(" ");
			var offsetLineData:Array<String> = sprLines.shift().split(" ");
			for (strData in lineData) frameData.push(Std.parseInt(strData));
			for (strData in offsetLineData) offsetData.push(Std.parseInt(strData));
		}

		frameNames = [];
		frameDatas = [];
		offsetDatas = [];
		while (tempFrameNames.length > 0) {
			var rectName:String = tempFrameNames.shift();
			var frameRect:Rect = new Rect(frameData.shift(), frameData.shift(), frameData.shift(), frameData.shift());
			var frameOffsetRect:Rect = new Rect(offsetData.shift(), offsetData.shift(), offsetData.shift(), offsetData.shift());
			frameNames.push(rectName);
			frameDatas.push(frameRect);
			offsetDatas.push(frameOffsetRect);
		}

		totalFrames = frameNames.length;
	}

	private function getBiggestFrameSize():Point {
		var w:Float = 0;
		var h:Float = 0;

		for (i in 0...frameNames.length) {
			w = Math.max(w, offsetDatas[i].width);
			h = Math.max(h, offsetDatas[i].height);
		}

		return new Point(w, h);
	}

	public function setupImage(assetId:String):Void {
		assetId = assetId.replace(".png", "");
		animated = false;
		var ret = Engine.setupImageSprite(id, assetId);

		width = ret.width;
		height = ret.height;
		transDirty = true;
	}

	public function setup9Sliced(assetId:String, x1:Float, y1:Float, x2:Float, y2:Float, w:Float, h:Float):Void {
		/* centerPivot = false; */
		assetId = assetId.replace(".png", "");
		Engine.setup9SliceSprite(id, assetId, Std.int(x1), Std.int(y1), Std.int(x2), Std.int(y2), Std.int(w), Std.int(h));
		width = Std.int(w);
		height = Std.int(h);
		transDirty = true;
	}

	public function setupAnimated(assetId:String):Void {
		assetId = assetId.replace(".png", "");
		assetId = Engine.resolveAssetName(assetId, true, ".png");
		var isAnim:Bool = false;
		var baseName:String = assetId.replace(".png", "");
		for (assetStr in Engine.getAssetList()) {
			if (assetStr.contains(baseName) && assetStr.contains(".spr")) {
				isAnim = true;
				break;
			}
		}

		if (!isAnim) {
			setupImage(assetId);
			return;
		}

		parseSpr(assetId);

		var biggestFrame:Point = getBiggestFrameSize();
		width = Std.int(biggestFrame.x);
		height = Std.int(biggestFrame.y);

		Engine.setupAnimatedSprite(id, assetId, width, height);
		transDirty = true;

		animated = true;
		currentFrame = -1;
		timeTillNextFrame = 0;
		playingTill = -1;

		animations = [];

		for (i in 0...frameNames.length) {
			var frameName:String = frameNames[i];
			var frameNameSplit:Array<String>;
			if (frameName.contains("/")) frameNameSplit = frameName.split("/");
			else frameNameSplit = frameName.split("_");

			frameNameSplit.pop();
			var baseName:String = frameNameSplit.join("");

			var newAnim:Bool = true;
			for (anim in animations)
				if (baseName == anim.name)
					newAnim = false;

			if (newAnim) animations.push({name: baseName, frames: []});

			for (anim in animations)
				if (baseName == anim.name)
					anim.frames.push(i);
		}

		gotoFrame(0);
	}

	public function setupRect(w:Float, h:Float, colour:Int):Void {
		Engine.setupRectSprite(id, w, h, colour);
		width = Std.int(w);
		height = Std.int(h);
		transDirty = true;
	}

	public function setupCanvas(assetId:String, w:Float=0, h:Float=0):Void {
		assetId = Engine.resolveAssetName(assetId, true, ".png");
		parseSpr(assetId);

		if (w == 0 || h == 0) {
			var biggestFrame:Point = getBiggestFrameSize();
			w = biggestFrame.x;
			h = biggestFrame.y;
		}

		Engine.setupCanvasSprite(id, assetId, Std.int(w), Std.int(h));

		width = Std.int(w);
		height = Std.int(h);
		transDirty = true;
	}

	public function setupEmpty(w:Float, h:Float):Void {
		Engine.setupEmptySprite(id, Std.int(w), Std.int(h));
		width = Std.int(w);
		height = Std.int(h);
	}

	public function resetMouse():Void {
		holding = false;
		pressing = false;
		hovering = false;
	}

	public function update(elapsed:Float=0):Void {
		if (!active || !exists) return;
		if (mouseEnabled && alpha > mouseRejectAlpha && !isPaused) {
			var nowHovering = Engine.pointOverlapSprite(Engine.mouse, id, pixelPerfectOverlapping);
			var nowPressing = hovering && Engine.leftMouse;

			//
			// This is to postpone the function calls till we pass the mouse events through,
			// otherwise there may be infinte loops if Main.update() is called.
			//
			if (nowHovering && !hovering) toCall.push(onHoverOnce);
			if (!nowHovering && hovering) toCall.push(onUnHoverOnce);
			if (nowPressing && !pressing) {
				holdPivot.setTo(Engine.mouse.x - x, Engine.mouse.y - y);
				toCall.push(onPressOnce);
			}

			if (nowHovering && !nowPressing && pressing) toCall.push(onReleaseOnce);
			if (holding && !Engine.leftMouse)	toCall.push(onReleaseOnceAnywhere);

			hovering = nowHovering;
			pressing = nowPressing;
			if (pressing) holding = true;
			else if (!Engine.leftMouse) holding = false;

			for (fn in toCall) {
				if (fn != null) {
					toCall.remove(fn);
					fn();
				}
			}

			// Doing exclusiveHolding late becuase fns() may move sprite
			if (!exclusiveHolding && holding && Engine.justLeftMouse) exclusiveHolding = true;
			if (!holding) exclusiveHolding = false;

			if (hovering && onHover != null) onHover();
			if (pressing && onPress != null) onPress();

			if (!active) return; // If the result of a button event was it no longer being active
		}

		/// Animation
		if (animated && playing) {
			timeTillNextFrame -= elapsed;
			var newFrame:Int = currentFrame;

			while (timeTillNextFrame <= 0) {
				if (currentAnim != null) {
					if (currentAnimFrame+1 >= currentAnim.frames.length) {
						if (onAnimationFinished != null) onAnimationFinished();
						if (playing) currentAnimFrame = 0;
					} else {
						currentAnimFrame++;
					}

					newFrame = currentAnim.frames[currentAnimFrame];
				} else {
					newFrame++;
					if (newFrame >= totalFrames) {
						if (looping) newFrame = 0 else newFrame--;
						if (onAnimationFinished != null) onAnimationFinished();
					}
				}

				timeTillNextFrame += 1/animFrameRate;
			}

			gotoFrame(newFrame);

			if (playingTill == newFrame) {
				pause();
				playingTill = -1;
			}
		}

		/// Transform
		if (old_tint != tint) {
			Engine.tintSprite(id, tint);
			old_tint = tint;
		}

		if (
			old_x != x ||
			old_y != y ||
			old_scaleX != scaleX ||
			old_scaleY != scaleY ||
			old_alpha != alpha ||
			old_visible != visible ||
			old_rotation != rotation ||
			old_layer != layer ||
			old_pivotX != pivotX ||
			old_pivotY != pivotY ||
			old_scrolls != scrolls ||
			transDirty
		) {
			transDirty = false;
			Engine.transformSprite(id, x, y, scaleX, scaleY, rotation, alpha, visible, centerPivot, layer, pivotX, pivotY, scrolls);
			// width = Engine.getSpriteProp(id, WIDTH);
			// height = Engine.getSpriteProp(id, HEIGHT);

			old_x = x;
			old_y = y;
			old_scaleX = scaleX;
			old_scaleY = scaleY;
			old_alpha = alpha;
			old_visible = visible;
			old_rotation = rotation;
			old_layer = layer;
			old_pivotX = pivotX;
			old_pivotY = pivotY;
			old_scrolls = scrolls;
		}
	}

	public function setClip(x:Float, y:Float, w:Float, h:Float):Void {
		Engine.setSpriteClip(id, cast x, cast y, cast w, cast h);
	}

	public function move(x:Float, y:Float):Void {
		this.x = x;
		this.y = y;
	}

	public function scale(factor:Float):Void {
		scaleX = factor;
		scaleY = factor;
	}

	public function deactivate():Void {
		if (!active) return;
		visible = false;
		update(); // Do this before setting active to false
		active = false;
	}

	public function activate():Void {
		if (active) return;
		visible = true;
		active = true;
		update();
	}

	public function gotoFrame(frame:Int, andStop:Bool=false):Void {
		if (currentFrame == frame) return;
		currentFrame = frame;

		var r:Rect = frameDatas[currentFrame];
		var offsetR:Rect = offsetDatas[currentFrame];
		Engine.switchFrame(id, Std.int(r.x), Std.int(r.y), Std.int(r.width), Std.int(r.height), Std.int(offsetR.x), Std.int(offsetR.y));

		if (andStop) playing = false;
	}

	public function pause():Void { // @cleanup Remove this?
		playing = false;
	}

	public function playAnim(animName:String, restart:Bool=false):Void {
		var newAnim:Animation = null;
		for (anim in animations)
			if (anim.name == animName)
				newAnim = anim;

		if ((currentAnim == newAnim && playing) && !restart) return;

		currentAnim = newAnim;
		if (currentAnim == null) {
			trace("Animation "+animName+" doesn't exist");
			return;
		}
		playing = true;
		currentAnimFrame = -1;
		timeTillNextFrame = 0;
	}

	public function playTill(tillWhen:Int, startingFrame:Int=-1):Void {
		if (startingFrame != -1) currentFrame = startingFrame;
		playingTill = tillWhen;
		playing = true;
	}

	public function destroy():Void {
		if (!exists) return;
		exists = false;
		active = false;
		visible = false;
		Engine.cancelTweensOn(this); // @cleanup Is this overkill?
		Engine.destroySprite(id);
		mintSprites.remove(this);
	}

	public function copyTransform(other:MintSprite):Void {
		x = other.x;
		y = other.y;
		scaleX = other.scaleX;
		scaleY = other.scaleY;
		alpha = other.alpha;
		visible = other.visible;
	}

	public function getTileWidth(tileName:String):Int {
		return Std.int(offsetDatas[frameNames.indexOf(tileName)].width);
	}

	public function getTileHeight(tileName:String):Int {
		return Std.int(offsetDatas[frameNames.indexOf(tileName)].height);
	}

	public function pauseTweens():Void {
		Actuate.pause(this);
	}

	public function resumeTweens():Void {
		Actuate.resume(this);
	}

	public function cancelTweens():Void { Engine.cancelTweensOn(this); }

	public function applyGlowEffect(colour:Int=0xFF0000, alpha:Float=1, blurX:Float=6, blurY:Float=6, strength:Float=2, inner:Bool=false, knockout:Bool=false):Void {
		Engine.applyGlowEffect(id, colour, alpha, blurX, blurY, strength, inner, knockout);
	}
	public function applyGlitchEffect():Void { Engine.applyGlitchEffect(id); }
	public function clearEffects():Void { Engine.clearEffects(id); }
	public function copyPixels(sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, tint:Int=-1):Void { Engine.copySpritePixels(id, sx, sy, sw, sh, dx, dy, tint); }
	public function drawPixels(sx:Int, sy:Int, sw:Int, sh:Int, dx:Int, dy:Int, tint:Int=-1, scaleX:Float=1, scaleY:Float=1):Void { Engine.drawSpritePixels(id, sx, sy, sw, sh, dx, dy, tint, scaleX, scaleY); }

	public function setTile(tileName:String, tint:Int=-1):Void {
		this.tileName = tileName;
		fillPixels(0, 0, width, height, 0);
		copyTile(tileName, 0, 0, tint);
	}

	public function copyTile(tileName:String, dx:Int=0, dy:Int=0, tint:Int=-1):Void {
		if (frameNames.indexOf(tileName) == -1) trace("Image "+tileName+" not found in sheet");
		copyTileNum(frameNames.indexOf(tileName), dx, dy, tint);
	}

	public function copyTileNum(tileNum:Int, dx:Int=0, dy:Int=0, tint:Int=-1):Void {
		var r:Rect = frameDatas[tileNum];
		var offsetR:Rect = offsetDatas[tileNum];
		if (r == null) trace("Tilenum "+tileNum+" not found in sheet");
		copyPixels(Std.int(r.x), Std.int(r.y), Std.int(r.width), Std.int(r.height), Std.int(dx+offsetR.x), Std.int(dy+offsetR.y), tint);
	}

	public function fillPixels(sx:Int, sy:Int, sw:Int, sh:Int, colour:Int):Void { Engine.fillSpritePixels(id, sx, sy, sw, sh, colour); }
	public function clear():Void { Engine.clearSprite(id); }

	public function setMagicOnClick(fn:Void->Void):Void {
#if flash
		onReleaseOnce = setMagicOnClick.bind(fn);
		Engine.setMagicSpriteClick(id, fn);
#else
		onReleaseOnce = fn;
#end
	}

	public function toString():String {
		return '$x,$y ${width}x${height}';
	}
}

typedef Animation = {
	name:String,
	frames:Array<Int>
}
