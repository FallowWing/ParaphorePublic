package;

import mtprng.MT;

class Random
{
	private static var twisters:Array<MT>;

	public static function init():Void {
		twisters = [];
		twisters.push(new MT());
	}

	public static function getPool():Int {
		return twisters.length;
	}

	public static function seed(seed:Int, pool:Int):Void {
		if (twisters.length < pool || twisters[pool] == null) twisters[pool] = new MT();
		var twist:MT = twisters[pool];
		twist.init(seed);
	}

	public static function random(pool:Int=0):Float {
		var twist:MT = twisters[pool];
		return twist.randomFloat32();
	}

	public static function float(min:Float, max:Float, pool:Int=0):Float {
		var twist:MT = twisters[pool];
		var real:Float = twist.randomFloat32() * (max - min) + min;
		return real;
	}

	public static function int(min:Int, max:Int, pool:Int=0):Int {
		var twist:MT = twisters[pool];
		var ret:Int = Std.int(float(min, max));
		return ret;
	}
}
