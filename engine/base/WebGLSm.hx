package engine.base;

class WebGLSm {
	public static var channels:Array<MintChannel> = [];

	public function new() {}

	public static function playSound(path:String, channelName:String="", config:SoundConfig=null):Void {
	}

	public static function getChannelByName(name:String):MintChannel {
		for (c in channels) if (c.name == name) return c;
		return null;
	}

	public static function stopChannel(name:String):Void {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return;
		/* m.channel.stop(); */
		channels.remove(m);
	}

	public static function resetGlobalVolume():Void {
		for (c in channels) {
		}
	}

	public static function setChannelVolume(name:String, volume:Float):Void {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return;
		/* m.volumeMod = volume; */
		resetGlobalVolume();
	}

	public static function getChannelVolume(name:String):Float {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return 0;
		return m.volumeMod;
	}

	public static function fadeChannel(name:String, fadeIn:Bool=false, time:Float=1):Void {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return;
		Engine.tween(
			m,
			{volumeMod: fadeIn?1:0},
			time,
			{onComplete:
				function(){
					stopChannel(m.name);
				}, onUpdate: function() {
					resetGlobalVolume();
				}
			});
	}

	public static function stopAll():Void {
		for (c in channels) stopChannel(c.name);
	}
}

typedef MintChannel = {
	?volumeMod:Float,
	?name:String,
	?pos:Int
}
