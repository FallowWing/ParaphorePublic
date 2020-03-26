package;

class Mynt
{
	public static var active:Bool = false;

	public static var commandQueue:Array<Void->Void> = [];
	public static var busy:Bool = false;
	public static var delayed:Bool = false;

	public static var bgs:Array<MintSprite>;

	public static var myntBody:MintSprite;
	public static var backgroundBehind:MintSprite;
	public static var backgroundBlueGreen:MintSprite;
	public static var eyes:MintSprite;
	public static var mouth:MintSprite;
	public static var textBar:MintSprite;
	public static var textField:MintText;

	public static var frameCount:Int;
	public static var currentLine:String;
	public static var tillNextLine:Int;
	public static var skipText:Bool;

	public static var currentNarrator:String;

	public static function show():Void {
		Engine.bindKey(SPACE, skipTextFn);
		StaticExtern.isMyntOn = true;
		active = true;
		busy = false;
		bgs = [];
		currentNarrator = "mynt";

		currentLine = "";
		frameCount = 0;
		tillNextLine = 0;
		skipText = false;

		{ /// Background
			function simpleOverlay(img1:String, img2:String):Array<MintSprite> {
				var bg:MintSprite = new MintSprite();
				bg.setupAnimated(img1);

				var overlay:MintSprite = new MintSprite();
				overlay.setupAnimated(img2);
				overlay.alpha = 0.7;
				Engine.tween(overlay, {alpha: 0.1}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
				return [bg, overlay];
			}

			if (GameData.data.theme.mynt == "default") {
				var bgName:String = "assets/img/hud/default/myntBg";
				var colour:String = "Mint";
				if (GameData.data.myntColour == "red") colour = "Red";
				if (GameData.data.myntColour == "blue") colour = "Blue";
				bgName += colour;
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "eon") {
				var bgName:String = "assets/img/hud/eon/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "dawn") {
				var bgName:String = "assets/img/hud/dawn/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "zeit") {
				var bgName:String = "assets/img/hud/zeit/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "trickster") {
				var bgName:String = "assets/img/hud/trickster/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "suave") {
				var bgName:String = "assets/img/hud/suave/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "enginetic") {
				var bgName:String = "assets/img/hud/enginetic/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "myrrh") {
				var bg:MintSprite = new MintSprite();
				bg.setupAnimated("assets/img/hud/myrrh/myntBg1.png");

				bgs = [bg];
			}

			if (GameData.data.theme.mynt == "scrap") {
				var bg:MintSprite = new MintSprite();
				bg.setupAnimated("assets/img/hud/scrap/myntBg1.png");

				bgs = [bg];
			}

			if (GameData.data.theme.mynt == "freak") {
				var bgName:String = "assets/img/hud/freak/myntBg";
				bgs = simpleOverlay(bgName+"1.png",bgName+"2.png");
			}

			if (GameData.data.theme.mynt == "geist") {
				for (i in 1...5) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/geist/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 0.7;
				Engine.tween(bgs[1], {alpha: 0.0}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 0.5;
				Engine.tween(bgs[2], {alpha: 0.1}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[3].alpha = 1;
				Engine.tween(bgs[3], {alpha: 0.7}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
			}

			if (GameData.data.theme.mynt == "stinky") {
				for (i in 1...5) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/stinky/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 0.5;
				Engine.tween(bgs[1], {alpha: 0.3}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[1], {y: 150}, 12, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 0.3;
				bgs[2].y = 75;
				Engine.tween(bgs[2], {alpha: 0.5}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[2], {y: 0}, 12, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[3].alpha = 0.7;
				Engine.tween(bgs[3], {alpha: 0.3}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
			}

			if (GameData.data.theme.mynt == "taffy") {
				for (i in 1...4) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/taffy/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 0.8;
				Engine.tween(bgs[1], {alpha: 0.5}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[1], {y: -600}, 12, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 0.7;
				Engine.tween(bgs[2], {alpha: 0.3}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
			}

			if (GameData.data.theme.mynt == "dead") {
				for (i in 1...4) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/dead/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 1;
				Engine.tween(bgs[1], {alpha: 0.8}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[1], {y: -800}, 12, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 1;
				Engine.tween(bgs[2], {alpha: 0.7}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});
			}

			if (GameData.data.theme.mynt == "taro") {
				for (i in 1...4) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/taro/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 0.7;
				Engine.tween(bgs[1], {alpha: 0.1}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 0.2;
				bgs[2].centerPivot = true;
				Engine.tween(bgs[2], {alpha: 0.05}, 12, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[2], {rotation: 260}, 24, {type: PINGPONG, ease: QUAD_IN_OUT});
			}

			if (GameData.data.theme.mynt == "stranger") {
				for (i in 1...5) {
					var s:MintSprite = new MintSprite();
					s.setupAnimated("assets/img/hud/stranger/myntBg"+i+".png");
					bgs.push(s);
				}

				bgs[1].alpha = 0.7;
				Engine.tween(bgs[1], {alpha: 0.3}, 6, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[2].alpha = 0;
				bgs[2].x = 240;
				bgs[2].y = 145;
				//@TODO make alpha go to 1
				function spikeUp(spr:MintSprite):Void {
					if (!spr.exists) {
						Engine.cancelTweensOn(spr);
						return;
					} else {
						Engine.tween(spr, {alpha: 1}, Math.random()*2, {ease: BOUNCE_OUT, onComplete: function () {
							spr.alpha = 0;
							Engine.timer(Math.random()*5+2, spikeUp.bind(spr));
						}});
					}
				}
				spikeUp(bgs[2]);
				Engine.tween(bgs[2], {y: 162}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});
				Engine.tween(bgs[2], {x: 262}, 0.05, {type: PINGPONG, ease: QUAD_IN_OUT});

				bgs[3].alpha = 1;
				bgs[3].y = 102;
				bgs[3].x = 312;
				Engine.tween(bgs[3], {y: 118}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});
			}
		}

		myntBody = new MintSprite();

		eyes = new MintSprite();
		eyes.setupAnimated("assets/img/mynt/eyes/default.png");

		mouth = new MintSprite();
		mouth.setupAnimated((GameData.data.theme.mynt == "freak"?"assets/img/hud/freak/freddy1.png":"assets/img/mynt/mouth/default.png"));
		if (Math.random() < 0.02) mouth.setupAnimated((GameData.data.theme.mynt == "freak"?"assets/img/hud/freak/freddy2.png":"assets/img/mynt/mouth/default.png"));

		if (GameData.data.theme.mynt == "eon") {
			eyes.tint = 0xFF1cffb2;
			eyes.applyGlowEffect(0x1cffb2);

			mouth.tint = 0xFF1cffb2;
			mouth.applyGlowEffect(0x1cffb2);
		}

		if (GameData.data.theme.mynt == "enginetic") {
			eyes.tint = 0xFFb7ffdb;
			eyes.applyGlowEffect(0x00cca8);

			mouth.tint = 0xFFb7ffdb;
			mouth.applyGlowEffect(0x00cca8);
		}

		if (GameData.data.theme.mynt == "freak") {
			eyes.alpha = 0;
		}

		/*if (data.myntEyebrows) {
				eyebrows = new MintSprite();
				eyebrows.setupAnimated("assets/img/mynt/eyebrows.png");
				Engine.tween(bgs[3], {y: 118}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});
				}*/

		Engine.tween(eyes, {y: 17}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});
		Engine.tween(mouth, {y: 17}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});

		textBar = new MintSprite("assets/img/mynt/textBar.png");
		textBar.y = Engine.height * 0.75;
		textBar.alpha = 0;

		textField = new MintText({fontSize: 18, fontColour: 0xFFFFFF});
		textField.setText("");
	}

	public static function skipTextFn():Void {
		skipText = true;
	}

	public static function hide():Void {
		Engine.unBindKey(SPACE, skipTextFn);
		StaticExtern.isMyntOn = false;

		Engine.cancelTweensOn(eyes);
		Engine.cancelTweensOn(mouth);

		var sprites = [eyes, mouth, textBar, myntBody];
		for (bg in bgs) sprites.push(bg);

		for (sprite in sprites) {
			sprite.destroy();
		}

		if (backgroundBehind != null) backgroundBehind.destroy();
		if (backgroundBlueGreen != null) backgroundBlueGreen.destroy();

		textField.destroy();
		busy = false;
		active = false;
	}

	public static function proceed():Void {
		busy = false;
		delayed = false;
		skipText = false;
	}

	public static function queueSay(text:String):Void {

		commandQueue.push(function() {
			busy = true;
			if (textBar.alpha == 0) Engine.tween(textBar, {alpha: 1}, 3);
			textField.setText("");
			if (GameData.isActive("Curiosity Ring")) text = Main.owO(text);
			currentLine = text;
		});
	}

	public static function queueAddChoice(labelText:String, result:Void->Void, config:ButtonConfig=null):Void {
		commandQueue.push(Main.addChoice.bind(labelText, function() {
			busy = false;
			result();
		}, config));
	}

	public static function queueAddPointlessChoice(labelText:String, result:Void->Void, config:ButtonConfig=null):Void {
		commandQueue.push(Main.addChoice.bind(labelText, function() {
			result();
		}, config));
	}

	public static function queueAddTextChoice(result:String->Void):Void {
		commandQueue.push(Main.addTextChoice.bind(function(str) {
			busy = false;
			result(str);
		}));
	}

	public static function queueShowChoices():Void {
		commandQueue.push(function() {
			if (StaticExtern.isMyntOn)
				busy = false;
			else
				busy = true;
			Main.showChoices();
		});
	}

	public static function queueHideChoices():Void {
		commandQueue.push(function() {
			busy = false;
			Main.hideChoices();
			Main.clear();
		});
	}

	public static function queueCall(fn:Void->Void):Void {
		commandQueue.push(fn);
	}

	public static function queueDelay(seconds:Float):Void {
		commandQueue.push(function() {
			delayed = true;
			busy = true;
			Engine.timer(seconds, proceed);
		});
	}

	public static function queueTransition(emote:String):Void {
		commandQueue.push(function() {
			currentNarrator = "mynt";
			if (emote == "fake" || emote == "mintangry" || emote == "mintsad") currentNarrator = "mint";
			if (emote == "protocol" || emote == "protosurprised" || emote == "protosad" || emote == "offline") currentNarrator = "protocol";
			if (emote == "septrica") currentNarrator = "sep";
			if (GameData.data.theme.mynt == "freak") return;
			busy = true;

			Engine.tween(eyes, {scaleY: 0, alpha: 0}, 0.1, {onComplete: function() {
				eyes.setupAnimated("assets/img/mynt/eyes/"+emote+".png");
				Engine.tween(eyes, {scaleY: 1, alpha: 1}, 0.1);
			}});

			Engine.tween(mouth, {scaleY: 0, alpha: 0}, 0.1, {onComplete: function() {
				mouth.setupAnimated("assets/img/mynt/mouth/"+emote+".png");
				Engine.tween(mouth, {scaleY: 1, alpha: 1}, 0.1);
				busy = false;
			}});
		});
	}

	public static function setupBodyBg():Void {
		commandQueue.push(function() {
			backgroundBehind = Main.addRectSprite(Engine.width, Engine.height, 0xFF0d0d0d, true);

			backgroundBlueGreen = Main.addSprite("assets/img/effect/myntBod/bg", true);
			backgroundBlueGreen.alpha = 0;

			backgroundBehind.update();
			backgroundBlueGreen.update();

			textBar.layer = 48;
			textField.layer = 49;

			backgroundBehind.layer = textBar.layer - 3;
			backgroundBlueGreen.layer = textBar.layer - 2;

			Engine.tween(backgroundBlueGreen, {alpha: 1}, 6, {type: PINGPONG});
		});
	}

	public static function queueBody(bodyNumber:Int):Void {
		commandQueue.push(function() {
			textBar.layer = 48;
			textField.layer = 49;

			myntBody.setupAnimated("assets/img/effect/myntBod/"+bodyNumber);
			myntBody.x = Engine.width/2 - myntBody.width/2;
			myntBody.y = Engine.height/2 - myntBody.height/2 - (bodyNumber > 5 ? 15 : 35); //special padding
			myntBody.layer = textBar.layer - 1;
			myntBody.update();
		});
	}

	public static function update(elapsed:Float=0):Void {
		if (!active) return;
		frameCount++;
		if (!busy && commandQueue.length > 0) {
			skipText = false;
			commandQueue.shift()(); //@cleanup: Insane
		}

		/// Appending text
		var speed:Int = 2; // Frames between letters
		var timeBetweenLines:Int = Math.round((currentLine.length/80 * 3 + 0.5) * 60);

		if (currentLine != "") {
			var charsLeft:Int = currentLine.length - textField.text.length;
			if (frameCount % speed == 0 && charsLeft > 0) {
				//currentNarrator = "mint";
				if (currentLine.charAt(currentLine.length - charsLeft) != " ") Engine.playSound("assets/audio/"+(currentNarrator != "mynt" ? "mynt/"+currentNarrator+"Talk/" : "ui/hoverNope/"));
				textField.append(currentLine.charAt(currentLine.length - charsLeft));
				if (skipText) {
					skipText = false;
					textField.setText(currentLine);
					charsLeft = 1;
				}
				if (charsLeft == 1) tillNextLine = timeBetweenLines;
			}

			if (tillNextLine > 0) {
				tillNextLine--;
				if (skipText) tillNextLine = 0;
				if (tillNextLine == 0) {
					busy = false;
				}
			}
		}

		textField.x = Engine.width/2 - textField.fieldWidth/2;

		/// Input
		if (delayed && skipText) proceed();

		/// Positions
		if (textField != null) textField.y = textBar.y + textBar.height/2 - textField.fieldHeight/2 - 2;
	}

	public static function resetTheme():Void {
		Mynt.hide();
		Mynt.show();
	}
}
