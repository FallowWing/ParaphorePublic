package engine;

class MintArrayUtils
{
	public static function pickOne<T>(array:Array<T>, exclude:Array<T>=null):T {
		if (array.length == 0) return null;
		var result:T = null;

		if (exclude == null)
			return array[Math.floor(Math.random()*array.length)];
		else
			while (result == null || exclude.indexOf(result) != -1)
				result = array[Math.floor(Math.random()*array.length)];
	

		return result;
	}

	public static function fuse<T>(array:Array<T>, array2:Array<T>):Void {
		for (it in array2)
			array.push(it);
	}

	public static function contains<T>(array:Array<T>, item:T):Bool {
		if (array.indexOf(item) == -1) return false else return true;
	}

	public static function containsAnyOf<T>(array:Array<T>, items:Array<T>):Bool {
		var doesContain:Bool = false;
		for (it in items)
			if (array.contains(it))
				doesContain = true;
		return doesContain;
	}

	public static function count<T>(array:Array<T>, item:T):Int {
		var amount:Int = 0;
		for (obj in array)
			if (obj == item)
				amount++;
		return amount;
	}

	public static function last<T>(array:Array<T>):T {
		return array[array.length-1];
	}

	public static function yxAccess<T>(array:Array<Array<T>>, y:Int, x:Int):T {
		if (x < 0 || y < 0 || y >= array.length || x >= array[y].length) return null;
		return array[y][x];
	}

	public static function arrayFromString2d(str:String):Array<Array<Int>> {
		var arr:Array<Array<Int>> = [];

		var strLines:Array<String> = str.split("\n");
		while(strLines.remove("")) {};
		while(strLines.remove("\n")) {};

		for (line in strLines) {
			var tempArray:Array<Int> = [];
			var chars:Array<String> = line.split(",");
			while(chars.remove("")) {};
			for (numStr in chars) tempArray.push(Std.parseInt(numStr));
			arr.push(tempArray);
		}

		return arr;
	}

	public static function printYx(array:Array<Array<Dynamic>>):Void {
		var str:String = "[\n";

		for (y in 0...array.length) {
			for (x in 0...array[y].length) {
				str += array[y][x];
				if (x < array[y].length-1) str += ", ";
			}
			str += "\n";
		}

		trace(str);
	}
}
