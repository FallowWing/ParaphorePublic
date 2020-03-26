package;

class Buttons
{
	public static function create():Button {
		var s:MintSprite = new MintSprite();
		s.pixelPerfectOverlapping = false;

		var tf:MintText = new MintText({autoSize: "left", wordWrap: true, wordWrapWidth: Main.choiceBox.width-12});
		var b:Button = {label: tf, sprite: s};
		b.sprite.onReleaseOnce = clicked.bind(b);
		b.enabled = true;
		b.silent = false;

		b.destroy = destroy.bind(b);
		b.align = align.bind(b);
		b.redraw = redraw.bind(b);
		b.disable = disable.bind(b);
		b.enable = enable.bind(b);
		b.hide = hide.bind(b);
		b.show = show.bind(b);
		return b;
	}

	private static function clicked(b:Button):Void {
		if (b.enabled) {
			if (!b.silent) {
				if (GameData.data.theme.choiceBox == "dawn")
					Engine.playSound("assets/audio/ui/dawnChoice")
				else
					Engine.playSound(Theme.getSound("choice"));
			}
			
			if (b.result != null) b.result();
			b.sprite.resetMouse();
			Main.update();
		} else {
			for (buttonPiece in [b.sprite, b.label]) {
				StoryUtils.nopeWiggle([b.sprite, b.label]);
			}
			Engine.playSound(Theme.getSound("nope"));
		}
	}

	private static function redraw(b:Button):Void {
		if (b.imagePath == null) b.imagePath = "assets/img/hud/default/choiceButton.png";
		if (b.padding == null) b.padding = 10;

		b.sprite.setup9Sliced(b.imagePath, 5, 5, 10, 10, b.label.fieldWidth + b.padding, b.label.fieldHeight + b.padding);
		b.sprite.resetMouse();
	}

	private static function align(b:Button):Void {
		b.label.x = b.sprite.x + b.sprite.width/2 - b.label.fieldWidth/2;
		b.label.y = b.sprite.y + b.sprite.height/2 - b.label.fieldHeight/2-3;
	}

	private static function destroy(b:Button):Void {
		b.sprite.destroy();
		b.label.destroy();
	}

	private static function hide(b:Button):Void {
		b.sprite.deactivate();
		b.label.visible = false;
	}

	private static function show(b:Button):Void {
		b.sprite.activate();
		b.label.visible = true;
	}

	private static function disable(b:Button):Void {
		b.enabled = false;
		b.sprite.alpha = 0.5;
		b.label.alpha = 0.5;
	}

	private static function enable(b:Button):Void {
		b.enabled = true;
		b.sprite.alpha = 1;
		b.label.alpha = 1;
	}

	public static function inGrid(fontSize:Float, buttonsWide:Int, buttonWidth:Float, xPad:Float, yPad:Float, xOff:Float, yOff:Float, buttons:Array<Button>=null):Point {
		if (buttons == null) buttons = Main.choiceButtons;
		for (i in 0...buttons.length) {
			var s:MintSprite = buttons[i].sprite;
			buttons[i].label.setFormat({fontSize: Std.int(fontSize)});
			buttons[i].label.update();
			buttons[i].redraw();

			s.x = (buttonWidth+xPad) * (i%buttonsWide);
			s.y = (s.height+yPad) * Std.int(i/buttonsWide);

			s.x += xOff;
			s.y += yOff;
			buttons[i].align();
		}

		var w:Float = 0;
		for (b in buttons)
			if (b.sprite.x+b.sprite.width-xOff > w)
				w = b.sprite.x+b.sprite.width-xOff;

		var h:Float = 0;
		for (b in buttons)
			if (b.sprite.y+b.sprite.height-yOff > h)
				h = b.sprite.y+b.sprite.height-yOff;

		return new Point(w, h);
	}

	public static function makeLine(labels:Array<String>, xpos:Float, ypos:Float, direction:Direction):Array<Button> {
		var buttons:Array<Button> = [];
		for (i in 0...labels.length) {
			var label:String = labels[i];
			var button:Button = Buttons.create();
			button.imagePath = "assets/img/pauseScreen/choiceButton.png";
			button.label.setFormat({fontColour: 0xFFFFFF});
			button.label.setText(label);
			button.redraw();

			if (buttons.length == 0) {
				button.sprite.move(xpos, ypos);
			} else {
				var last:Button = buttons.last();
				if (direction == LEFT) {
					button.sprite.x = last.sprite.x - button.sprite.width - 5;
					button.sprite.y = last.sprite.y;
				} else if (direction == RIGHT) {
					button.sprite.x = last.sprite.x + button.sprite.width + 5;
					button.sprite.y = last.sprite.y;
				} else if (direction == UP) {
					button.sprite.x = last.sprite.x;
					button.sprite.y = last.sprite.y - button.sprite.height - 5;
				} else if (direction == DOWN) {
					button.sprite.x = last.sprite.x;
					button.sprite.y = last.sprite.y + button.sprite.height + 5;
				}
			}

			button.align();
			buttons.push(button);
		}

		return buttons;
	}
}

enum Direction { LEFT; RIGHT; UP; DOWN; } // @cleanup Factor these into general utils?

typedef Button = {
	label:MintText,
	sprite:MintSprite,
	?enabled:Bool,
	?silent:Bool,
	?result:Void->Void,
	?imagePath:String,
	?toolTip:String,
	?padding:Int,

	?destroy:Void->Void,
	?redraw:Void->Void,
	?align:Void->Void,
	?disable:Void->Void,
	?enable:Void->Void,
	?hide:Void->Void,
	?show:Void->Void,
}
