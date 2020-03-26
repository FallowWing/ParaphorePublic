package engine;

class MintStringUtils
{
	public inline static function contains(str:String, keyword:String):Bool {
		return str.indexOf(keyword) != -1;
	}

	public static function toTitleCase(str:String):String {
		str = str.charAt(0).toUpperCase()+str.substr(1, str.length);
		for (i in 1...str.length)
			if (str.charAt(i-1) == " ")
				str = str.substr(0, i)+str.charAt(i).toUpperCase()+str.substr(i+1, str.length);

		return str;
	}

	public static function containsAnyOf<T>(str:String, items:Array<String>):Bool {
		var doesContain:Bool = false;
		for (it in items)
			if (str.contains(it))
				doesContain = true;
		return doesContain;
	}


	public static function replace(str:String, from:String, to:String):String {
		return StringTools.replace(str, from, to);
	}
}
