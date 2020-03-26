package;

import serialization.*;
import serialization.stream.*;
import haxe.crypto.BaseCode;

class SerialUtils
{
	private static var base:BaseCode = new BaseCode(haxe.io.Bytes.ofString("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+="));

	public static function serial(d:Dynamic, c:Class<Dynamic>=null):String {
		try {
			var obj:Dynamic = {};
			var fields:Array<String> = [];

			if (c == null) fields = Reflect.fields(d);
			else fields = Type.getInstanceFields(c);

			for (field in fields) {
				Reflect.setProperty(obj, field, Reflect.getProperty(d, field));
			}

			var serializer = new Deflater({compressStrings: true});
			serializer.serialize(obj);
			return serializer.toString();

		} catch (e:Dynamic) {
			Main.warn("Failed to serial\n"+e);
			return null;
		}
	}

	public static function unserial(s:String, into:Dynamic, ?intoClass:Class<Dynamic>=null):Void {
			if (!s.contains("player")) { //@cleanup This should never happen, this if statement is for backwards compat
				// var bytes = haxe.io.Bytes.ofString(s);
				// bytes = base.decodeBytes(bytes);
				// bytes = haxe.zip.Uncompress.run(bytes);
				// s = bytes.toString();
			}
			var d:Dynamic;
			var fields:Array<String> = Type.getInstanceFields(intoClass);
			try {
				var unserializer = new Inflater(new StringInflateStream(s));
				d = unserializer.unserialize();
			} catch (e:Dynamic) {
				into = null;
				trace("Failed to unserial");
				return;
			}

			for (field in Reflect.fields(d)) {
				var val:Dynamic = Reflect.getProperty(d, field);
				if (val == null) { // @cleanup This is probably not needed
					trace("Skipping null copy of "+field);
					continue;
				}

				var hasField:Bool = false;
				if (intoClass == null) hasField = Reflect.hasField(into, field);
				else hasField = fields.contains(field);

				if (!hasField) {
					Main.warn("into has no field '"+field+"', but the string has it with the value: "+val);
					continue;
				}
				Reflect.setProperty(into, field, val);
			}

	}
}
