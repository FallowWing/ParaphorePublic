package;

class Init
{
	public static var elapsed:Float = 0;
	public static var lastTime:Float = 0;

	public static function main() {
#if WEBGL_ENGINE
		for (field in Reflect.fields(Macros.AssetNames))
			Engine.assetList.push(field);
#elseif OPENFL_ENGINE
		Engine.newTextRenderer = false;
		Engine.assetList = openfl.Assets.list();
#end

		// Engine.init(testInit, testUpdate);
		Engine.init(Main.init, Main.update);
	}

	private static function testInit():Void {
		var testNum:Int = 7;

		if (testNum == 1) {
			for (i in 0...10) {
				var s:MintSprite = new MintSprite();
				s.setupImage("kink/Abuse");
				s.move(Math.random()*Engine.width/2, Math.random()*Engine.height/2);
				s.alpha = Math.random()*0.5 + 0.5;
				s.scaleX = 3;
				s.scaleY = 3;
				Engine.tween(s, {scaleX: s.scaleX+Math.random(), scaleY: s.scaleY+Math.random(), rotation: Math.random()*360}, 1, {type: PINGPONG});
			}
		} else if (testNum == 2) {
			var s:MintSprite = new MintSprite();
			s.setupImage("effect/larpZone");
			s.move(100, 100);

			var s2:MintSprite = new MintSprite();
			s2.alpha = 0.75;
			s2.setupImage("testAlpha");
			s2.move(s.x, s.y);

			var s3:MintSprite = new MintSprite();
			s3.setupImage("kink/Abuse");
			s3.scaleX = 5;
			s3.scaleY = 5;
			s3.alpha = 0.5;
			s3.move(s.x+100, s.y+100);
		} else if (testNum == 3) {
			var s:MintSprite = new MintSprite();
			// s.setupAnimated("dead/pauseButton");
			s.setupAnimated("eyes/default");
			// s.move(Math.random()*Engine.width/2, Math.random()*Engine.height/2);
			// s.scaleX = 3;
			// s.scaleY = 3;
			// Engine.tween(s, {scaleX: s.scaleX+Math.random(), scaleY: s.scaleY+Math.random(), rotation: Math.random()*360}, 1, {type: PINGPONG});
		} else if (testNum == 4) {
			var s:MintSprite = new MintSprite();
			s.setup9Sliced("hud/toolTipButton", 5, 5, 10, 10, 200, 100);
			// s.move(200, 200);
			// Engine.tween(s, {scaleX: s.scaleX+Math.random(), scaleY: s.scaleY+Math.random(), rotation: Math.random()*360}, 1, {type: PINGPONG});
			// s.alpha = Math.random()*0.5 + 0.5;
			// s.scaleX = 2;
			// s.scaleY = 2;
		} else if (testNum == 5) {
			var s:MintSprite = new MintSprite();
			s.centerPivot = false;
			s.setupImage("whiteSquare.png");
			s.scaleX = 2;
			s.scaleY = 2;
			s.rotation = 20;
			s.move(100, 100);
			// s.move(10, 0);
			// Engine.tween(s, {rotation: 90}, 2, {type: PINGPONG});
			s.onHoverOnce = function() {s.alpha = 0.5;}
			s.onUnHoverOnce = function() {s.alpha = 1;}
			s.pixelPerfectOverlapping = false;
			// s.scaleX = 5;
			// s.scaleY = 5;
			// s.move(100, 100);
		} else if (testNum == 6) {
			var tf:MintText = new MintText({fontColour: 0xFFFFFF});
			tf.setText("This is a test\nof the text system\nIt should\nwork");
			Engine.tween(tf, {x: 100}, 2, {type: PINGPONG});
		} else if (testNum == 7) {
			var tf:MintText = new MintText({fontColour: 0xFFFFFF, wordWrapWidth: 300});
			tf.setText("This <!b>is<!b> a <!20px>test<!20px>\nof the <!i>text<!i> system\nThis line is reeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaallllllllllllllllllly long.");
			Engine.tween(tf, {x: 100}, 2, {type: PINGPONG});
		} else if (testNum == 8) {
			var s:MintSprite = new MintSprite();
			s.setupCanvas("minigame/card", 96, 145);
			// s.copyTile("K", 0, 0);
			// s.copyTile("Q", 20, 20);
			// s.copyTile("J", 50, 50);
			// s.copyPixels(10, 10, 20, 20, 0, 0);
			// s.copyTile("front", 0, 0);
			// s.copyTile("back", 0, 0);
			// s.copyPixels(10, 10, 20, 20, 20, 20);
			s.copyPixels(0, 0, 20, 20, 10, 10);
		}
	}

	private static function testUpdate():Void {
		// trace(MintSprite.mintSprites[0]);
		elapsed = Engine.currentTime - lastTime;
		lastTime = Engine.currentTime;

		// cast(MintSprite.mintSprites[0], MintText).setText("This is a test\nof the text system");
		for (s in MintSprite.mintSprites) s.update(elapsed);
	}
}

