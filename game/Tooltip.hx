package;

class Tooltip
{
	private static var titleText:MintText;
	private static var bodyText:MintText;
	private static var bg:MintSprite;
	private static var active:Bool;

	public static function init():Void {
		bg = new MintSprite();
		bg.layer = Main.TOOLTIP_SPRITE_LAYER;
		bg.visible = false;

		titleText = new MintText({fontSize: 14});
		titleText.layer = Main.TOOLTIP_TEXT_LAYER;
		titleText.visible = false;

		bodyText = new MintText({autoSize: "left", wordWrapWidth: 200 });
		bodyText.layer = Main.TOOLTIP_TEXT_LAYER;
		bodyText.visible = false;

		active = false;
	}

	public static function showOnCursor(title:String, body:String="", type:String="default"):Void {
		if (type == "default") show(title, body, Engine.mouse.x, Engine.mouse.y);
		if (type == "sys") showSys(title, Engine.mouse.x, Engine.mouse.y);
	}

	public static function show(title:String, body:String, x:Float, y:Float):Void {
		var quickUpdate:Bool = false;
		titleText.clearEffects();
		if (titleText.rawText != title || bodyText.rawText != body) {
			quickUpdate = true;
			titleText.setText(title);
			bodyText.setText(body);

			titleText.x = 0;
			titleText.y = 0;
			titleText.setFormat({fontColour: 0x1b1b1b});

			bodyText.x = 0;
			bodyText.y = titleText.y + titleText.fieldHeight + 10;
			bodyText.setFormat({fontColour: 0x1b1b1b});

			var bgWidth:Float = Math.max(titleText.fieldWidth, bodyText.fieldWidth) + 10;
			var bgHeight:Float = bodyText.y + bodyText.fieldHeight + 15;
			if (body == "") bgHeight = titleText.x + titleText.fieldHeight + 15;
			bg.setup9Sliced("assets/img/hud/toolTipButton.png", 5, 5, 10, 10, bgWidth, bgHeight);
		}

		bg.x = x + 10;
		bg.y = y + 10;
		if (bg.x+bg.width > Engine.width) bg.x = x - bg.width - 10;
		if (bg.y+bg.height > Engine.height) bg.y = y - bg.height - 10;
		bg.update(); //@cleanup This is required because of trans not being set between frames

		titleText.x = bg.x + 5;
		titleText.y = bg.y + 5;
		bodyText.x = bg.x + 5;
		bodyText.y = titleText.y + titleText.fieldHeight + 10;

		if (quickUpdate) {
			titleText.update();
			bodyText.update();
		}

		active = true;
	}

	public static function showSys(title:String, x:Float, y:Float):Void {
		var quickUpdate:Bool = false;
		if (titleText.rawText != title) {
			quickUpdate = true;
			titleText.setText(title);

			titleText.x = 0;
			titleText.y = 0;
			titleText.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			bg.setupAnimated("assets/img/effect/systemBox.png");
			titleText.setFormat({wordWrap: true, wordWrapWidth: bg.width - 30, fontColour: 0xFFFFFF, center: true});
		}

		bg.x = x + 10;
		bg.y = y + 10;
		if (bg.x > Engine.width - bg.width) bg.x = Engine.width - bg.width;
		if (bg.y > Engine.height - bg.height) bg.y = Engine.height - bg.height;
		bg.update(); //@cleanup This is required because of trans not being set between frames

		titleText.x = bg.x + 15;
		titleText.y = bg.y + 15;
		titleText.update();

		//if (quickUpdate) titleText.update();

		active = true;
	}

	public static function update(elapsed:Float):Void {
		if (active) {
			bg.visible = true;
			titleText.visible = true;
			bodyText.visible = true;
		} else {
			bg.visible = false;
			titleText.visible = false;
			bodyText.visible = false;
		}

		active = false;
	}
}
