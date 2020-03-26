package;

class Console
{
	public static var inited:Bool = false;
	public static var active:Bool = false;

	private static var bg:MintSprite;
	private static var output:MintText;
	private static var input:MintText;

	private static var panic:MintSprite;
	private static var panicText:MintText;
	private static var lastPanicTime:Float = -999;

	public static function init():Void {
		bg = new MintSprite();
		bg.setupRect(Engine.width, Engine.height, 0);
		bg.alpha = 0.75;
		bg.layer = Main.CONSOLE_BG_LAYER;
		bg.visible = false;
		bg.pauseLayer = Main.CONSOLE_PAUSE_LAYER;

		output = new MintText({wordWrap: true, wordWrapWidth: Engine.width, fontColour: 0xFFFFFF});
		output.setText("Paraphore version "+Main.GAME_VERSION+" (~ to close)");
		output.setMaxHeight(Engine.height-50);
		output.layer = Main.CONSOLE_TEXT_LAYER;
		output.visible = false;
		output.pauseLayer = Main.CONSOLE_PAUSE_LAYER;

		input = new MintText({wordWrap: false, selectable: true, fontColour: 0xFFFFFF});
		input.input = true;
		input.setText("");
		input.setMaxWidth(Engine.width);
		input.y = Engine.height - input.height;
		input.layer = Main.CONSOLE_TEXT_LAYER;
		input.visible = false;
		input.pauseLayer = Main.CONSOLE_PAUSE_LAYER;

		panic = new MintSprite();
		panic.setupRect(200, 150, 0xf75a45);
		panic.y = Engine.height - panic.height;
		panic.x = Engine.width - panic.width;
		panic.layer = Main.CONSOLE_TEXT_LAYER;
		panic.pauseLayer = Main.CONSOLE_PAUSE_LAYER;
		panic.onReleaseOnce = panicClicked;
		panic.deactivate();

		panicText = new MintText();
		panicText.setText("PANIC!!!!!!!");
		panicText.x = panic.x + panic.width/2 - panicText.fieldWidth/2;
		panicText.y = panic.y + panic.height/2 - panicText.fieldHeight/2;
		panicText.layer = Main.CONSOLE_TEXT_LAYER;
		panicText.pauseLayer = Main.CONSOLE_PAUSE_LAYER;
		panicText.deactivate();

		Engine.bindKey(GRAVE, toggleConsole, RELEASED);
		Engine.bindKey(ENTER, executeCommand, RELEASED);

		inited = true;
	}

	public static function panicClicked():Void {
		if (Main.getTimer() - lastPanicTime > 60) {
			warn("The panic button will attempt to teleport you to a hub, use this if you're stuck somewhere because of a glitch.\nMay cause the game to be unbeatable due to sequence breaking.\nPress the panic button again if you're sure.");
			lastPanicTime = Main.getTimer();
		} else { 
			if (Mynt.active) Mynt.hide();
			Main.enablePause();
			Main.enableCursorKeys();
			StaticCallbacks.goHubCall();
			toggleConsole();
		}
	}

	public static function printRaw(msg:Dynamic):Void {
		if (!inited) return;
		output.append("\n"+Std.string(msg));
	}

	public static function print(msg:Dynamic):Void {
#if debug
		printRaw("print: "+msg);
#end
	}
	public static function warn(msg:Dynamic):Void {
#if debug
		if (!active) toggleConsole();
#end
		printRaw("warning: "+msg);
	}
	public static function error(msg:Dynamic):Void {
#if OPENFL_ENGINE
		if (Std.is(msg, openfl.errors.Error)) {
			error(msg.getStackTrace());
			return;
		}
#end
		if (!active) toggleConsole();
		printRaw("ERROR: "+msg+"\nThe game may now be in an unstable state, consider reloading!");
		throw "ERROR: "+msg;
	}

	public static function executeCommand():Void {
		if (!active) return;

		var command:String = input.getText();
		input.setText("");
		/* traceField.scrollV = traceField.maxScrollV; */

		output.append("\n"+command);
		Main.exec(command);
	}

	public static function toggleConsole():Void {
		if (!inited) return;
		active = !active;
		if (active) {
			Main.disableCursorKeys();
			bg.visible = true;
			output.visible = true;
			input.visible = true;
			panic.activate();
			panicText.activate();
			input.getTextFocus();
		} else {
			Main.enableCursorKeys();
			bg.visible = false;
			output.visible = false;
			input.visible = false;
			panic.deactivate();
			panicText.deactivate();
		}
	}

	public static function update(elapsed:Float=0):Void {
	}

}
