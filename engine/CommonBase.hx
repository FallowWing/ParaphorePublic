package engine;

import motion.Actuate;
import motion.actuators.SimpleActuator;
import motion.easing.*;

class CommonBase {
	private static var easeAssoc:Map<Ease, Dynamic> = [
		LINEAR => Linear.easeNone,
		BACK_IN => Back.easeIn, BACK_OUT => Back.easeOut, BACK_IN_OUT => Back.easeInOut, 
		BOUNCE_IN => Bounce.easeIn, BOUNCE_OUT => Bounce.easeOut, BOUNCE_IN_OUT => Bounce.easeInOut, 
		CUBIC_IN => Cubic.easeIn, CUBIC_OUT => Cubic.easeOut, CUBIC_IN_OUT => Cubic.easeInOut, 
		ELASTIC_IN => Elastic.easeIn, ELASTIC_OUT => Elastic.easeOut, ELASTIC_IN_OUT => Elastic.easeInOut, 
		QUAD_IN => Quad.easeIn, QUAD_OUT => Quad.easeOut, QUAD_IN_OUT => Quad.easeInOut, 
		QUART_IN => Quart.easeIn, QUART_OUT => Quart.easeOut, QUART_IN_OUT => Quart.easeInOut, 
		QUINT_IN => Quint.easeIn, QUINT_OUT => Quint.easeOut, QUINT_IN_OUT => Quint.easeInOut, 
		SINE_IN => Sine.easeIn, SINE_OUT => Sine.easeOut, SINE_IN_OUT => Sine.easeInOut
	];

	public static var keyBinds:Array<KeyBind> = [];
	public static var timers:Array<Dynamic> = [];
	public static var keyStatus:Array<Bool> = [];
	public static var keyRealStatus:Array<KeyStatus> = [];
	public static var enumList:Array<Dynamic> = [TweenType, Ease, TextProp, SpriteProp, ButtonState];

	public static function commonInit():Void {
		for (i in 0...300) keyRealStatus[i] = UP;
	}

	public static function bindKey(key:Key, fn:Void->Void, state:ButtonState=null, interval:Float=0):Void {
		if (state == null) state = RELEASED;
		keyBinds.push({key: key, fn: fn, state: state, interval: 0, maxInterval: interval, isDown: false});
	}

	public static function unBindKey(key:Key, fn:Void->Void=null):Void {
		for (bind in keyBinds) {
			if (fn == null) {
				if (bind.key == key) keyBinds.remove(bind);
			} else {
				if (bind.key == key && fn == bind.fn) keyBinds.remove(bind);
			}
		}
	}

	public static function tween(obj:Dynamic, params:Dynamic, seconds:Float, config:TweenConfig=null):Void {
		if (config == null) config = {};
		if (config.ease == null) config.ease = LINEAR;
		var tween = Actuate.tween(obj, seconds, params);

		if (config.type == PINGPONG) tween.repeat().reflect();
		if (config.type == LOOP) tween.repeat();
		if (config.type == REVERSE) tween.reverse();

		tween.ease(easeAssoc.get(config.ease));
		if (config.startDelay != null) tween.delay(config.startDelay);
		if (config.onUpdate != null) tween.onUpdate(config.onUpdate, []);
		if (config.onComplete != null) tween.onComplete(config.onComplete, []);
	}

	public static function cancelTweensOn(obj:Dynamic):Void {
		Actuate.stop(obj, null, false, false);
	}

	public static function timer(seconds:Float, fn:Void->Void, loops:Int=1):Int {
		if (loops == 1) {
			timers.push(Actuate.timer(seconds).onComplete(fn, []));
		} else if (loops > 1) {
			timers.push(Actuate.timer(seconds).onRepeat(fn, []).repeat(loops));
		} else {
			throw "You want at least one loop (given "+loops+")";
		}

		return timers.length-1;
	}

	public static function timerCancel(id:Int):Void {
		Actuate.stop(timers[id], null, false);
	}

	public static function pauseTimers():Void {
		for (timer in timers) timer.pause();
	}

	public static function resumeTimers():Void {
		for (timer in timers) timer.resume();
	}

	public static function getRealKeyStatus(key:Key):KeyStatus {
		return keyRealStatus[cast(key, Int)];
	}

	public static function updateKeyStatus():Void {
		for (i in 0...keyRealStatus.length) {
			if (keyRealStatus[i] == JUST_DOWN) keyRealStatus[i] = DOWN;
			if (keyRealStatus[i] == JUST_UP) keyRealStatus[i] = UP;
		}
	}

	public static function getKeyStatus(key:Key):Bool {
		return keyStatus[cast(key, Int)];
	}

	public static function keyCameUp(keyCode:Int):Void {
		keyStatus[keyCode] = false;
		keyRealStatus[keyCode] = JUST_UP;

		for (bind in keyBinds) {
			if (keyCode == cast(bind.key, Int)) {
				bind.isDown = false;
				if (bind.state == RELEASED) bind.fn();
			}
		}
	}

	public static function keyWentDown(keyCode:Int):Void {
		keyStatus[keyCode] = true;
		keyRealStatus[keyCode] = JUST_DOWN;

		for (bind in keyBinds) {
			if (keyCode == cast(bind.key, Int)) {
				bind.isDown = true;
			}
		}
	}

	public static function resetKeyboard():Void {
		for (i in 0...keyStatus.length)
			keyStatus[i] = false;
	}
}

enum TweenType { PINGPONG; LOOP; REVERSE; }
enum Ease {
	LINEAR;
	BACK_IN; BACK_OUT; BACK_IN_OUT;
	BOUNCE_IN; BOUNCE_OUT; BOUNCE_IN_OUT;
	CUBIC_IN; CUBIC_OUT; CUBIC_IN_OUT;
	ELASTIC_IN; ELASTIC_OUT; ELASTIC_IN_OUT;
	QUAD_IN; QUAD_OUT; QUAD_IN_OUT;
	QUART_IN; QUART_OUT; QUART_IN_OUT;
	QUINT_IN; QUINT_OUT; QUINT_IN_OUT;
	SINE_IN; SINE_OUT; SINE_IN_OUT;
}

enum TextProp {
	X; Y; WIDTH; HEIGHT; FIELD_WIDTH; FIELD_HEIGHT;
	VISIBLE; ALPHA; ROTATION; TEXT; REGIONS;

	AUTO_SIZE; WORD_WRAP; SELECTABLE; INPUT;
	FONT_SIZE; FONT_NAME; FONT_COLOUR;
	ALIGN; V_SCROLL; MAX_V_SCROLL; BORDER; VISIBLE_LINES;
}

enum SpriteProp {
	WIDTH; HEIGHT; VISIBLE; ALPHA;
}

enum ButtonState { RELEASED; PRESSED; }
enum KeyStatus { DOWN; UP; JUST_DOWN; JUST_UP; }

typedef TweenConfig = {
	?onComplete:Void->Void,
	?onUpdate:Void->Void,
	?startDelay:Float,
	?ease:Ease,
	?type:TweenType
}

typedef KeyBind = {
	key:Key,
	fn:Void->Void,
	state:ButtonState,
	interval:Float,
	maxInterval:Float,
	isDown:Bool
}

typedef FormatRegion = {
	start:Int,
	end:Int,
	bold:Bool,
	italic:Bool,
	underline:Bool,
	?fontSize:Int
}

typedef TextFieldFormat = {
	?autoSize:String,
	?wordWrap:Bool,
	?wordWrapWidth:Int,
	?selectable:Bool,
	?fontColour:Int,
	?fontSize:Int,
	?fontName:String,
	?border:Bool,
	?center:Bool,
	?borderColour:Int
}

typedef SoundConfig = {
	?loops:Int,
	?startVolume:Float,
	?startTime:Int,
}

@:enum
abstract Key(Int) {
	var BACKSPACE = 8;
	var TAB = 9;
	var ENTER = 13;
	var SHIFT = 16;
	var CONTROL = 17;
	var CAPS_LOCK = 20;
	var ESCAPE = 27;
	var SPACE = 32;
	var PAGE_UP = 33;
	var PAGE_DOWN = 34;
	var END = 35;
	var HOME = 36;
	var LEFT = 37;
	var UP = 38;
	var RIGHT = 39;
	var DOWN = 40;
	var INSERT = 45;
	var DELETE = 46;
	var NUM_LOCK = 144;
	var SCROLL_LOCK = 145;
	var PAUSE_BREAK = 19;
	var A = 65;
	var B = 66;
	var C = 67;
	var D = 68;
	var E = 69;
	var F = 70;
	var G = 71;
	var H = 72;
	var I = 73;
	var J = 74;
	var K = 75;
	var L = 76;
	var M = 77;
	var N = 78;
	var O = 79;
	var P = 80;
	var Q = 81;
	var R = 82;
	var S = 83;
	var T = 84;
	var U = 85;
	var V = 86;
	var W = 87;
	var X = 88;
	var Y = 89;
	var Z = 90;
	var a = 65;
	var b = 66;
	var c = 67;
	var d = 68;
	var e = 69;
	var f = 70;
	var g = 71;
	var h = 72;
	var i = 73;
	var j = 74;
	var k = 75;
	var l = 76;
	var m = 77;
	var n = 78;
	var o = 79;
	var p = 80;
	var q = 81;
	var r = 82;
	var s = 83;
	var t = 84;
	var u = 85;
	var v = 86;
	var w = 87;
	var x = 88;
	var y = 89;
	var z = 90;
	var ZERO = 48;
	var ONE = 49;
	var TWO = 50;
	var THREE = 51;
	var FOUR = 52;
	var FIVE = 53;
	var SIX = 54;
	var SEVEN = 55;
	var EIGHT = 56;
	var NINE = 57;
	var COLON = 186;
	var EQUALS = 187;
	var MINUS = 189;
	var SLASH = 191;
	var GRAVE = 192;
	var LEFT_BRACKET = 219;
	var BACKSLASH = 220;
	var RIGHT_BRACKET = 221;
	var QUOTE = 222;
	var COMMA = 188;
	var PERIOD = 190;
	var NUM_ZERO = 96;
	var NUM_ONE = 97;
	var NUM_TWO = 98;
	var NUM_THREE = 99;
	var NUM_FOUR = 100;
	var NUM_FIVE = 101;
	var NUM_SIX = 102;
	var NUM_SEVEN = 103;
	var NUM_EIGHT = 104;
	var NUM_NINE = 105;
	var NUM_MULTIPLY = 106;
	var NUM_ADD = 107;
	var NUM_ENTER = 13;
	var NUM_SUBTRACT = 109;
	var NUM_DECIMAL = 110;
	var NUM_DIVIDE = 111;
	var F1 = 112;
	var F2 = 113;
	var F3 = 114;
	var F4 = 115;
	var F5 = 116;
	var F6 = 117;
	var F7 = 118;
	var F8 = 119;
	var F9 = 120;
	var F11 = 122;
	var F12 = 123;
	var F13 = 124;
	var F14 = 125;
	var F15 = 126;
}
