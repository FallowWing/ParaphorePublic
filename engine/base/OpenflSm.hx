package engine.base;

import openfl.media.*;
import openfl.events.*;
import openfl.*;

class OpenflSm {
	public static var channels:Array<MintChannel> = [];

	public static function playSound(path:String, channelName:String="", config:SoundConfig=null):Void {
		if (config == null) config = {};
		if (config.loops == null) config.loops = 0;
		if (config.startVolume == null) config.startVolume = 1;
		if (config.startTime == null) config.startTime = 0;

		if (Engine.mute) {
			stopAll();
			channels = [];
			return;
		}

		while (getChannelByName(channelName) != null) channelName = Std.string(Math.random());

		{ // Kill sounds with same channel
			var oldChannel:MintChannel = getChannelByName(channelName);
			if (oldChannel != null) OpenflSm.stopChannel(oldChannel.name);
		}

		var options:Array<String> = [];
		for (it in Assets.list())
			if (it.indexOf(path) != -1)
				options.push(it);

		if (options.length == 0) {
			return;
		}

		path = options.pickOne();

		var src:Sound = Assets.getSound(path);
		var dest:Sound = new Sound();
		var c:MintChannel = {src: src, dest: dest, name: channelName, pos: config.startTime, config: config};

		c.volumeMod = config.startVolume;
		c.channel = src.play(config.startTime, config.loops, new SoundTransform(computeVolume(c)));
		if (c.channel == null) return;
		c.channel.addEventListener(Event.SOUND_COMPLETE, soundComplete);
		channels.push(c);
		resetGlobalVolume();
	}

	private static function getChannelByName(name:String):MintChannel {
		for (c in channels) if (c.name == name) return c;
		return null;
	}

	private static function getChannelBySound(sound:Sound):MintChannel {
		for (c in channels) {
			if (c.dest == sound) return c;
			if (c.src == sound) return c;
		}
		return null;		
	}

	private static function getChannelByChannel(channel:SoundChannel):MintChannel {
		for (c in channels) if (c.channel == channel) return c;
		return null;		
	}

	public static function stopChannel(name:String):Void {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return;
		m.channel.stop();
		channels.remove(m);
	}

	private static function computeVolume(c:MintChannel):Float {
		var vol:Float = c.volumeMod*Engine.defaultVolumeMod*Engine.userVolumeMod;
		if (c.name == "music") vol *= Engine.musicVolume;
		else vol *= Engine.effectVolume;
		return vol;
	}

	public static function resetGlobalVolume():Void {
		for (c in channels) {
			var curVol:Float = computeVolume(c);
			if (c.channel.soundTransform.volume != curVol) {
				var trans:SoundTransform = new SoundTransform(curVol);
				c.channel.soundTransform = trans;
			}
		}
	}

	public static function setChannelVolume(name:String, volume:Float):Void {
		var m:MintChannel = getChannelByName(name);
		if (m == null) return;
		m.volumeMod = volume;
		resetGlobalVolume();
	}

	private static function getChannelVolume(name:String):Float {
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
				function() {
					if (!fadeIn) stopChannel(m.name);
				}, onUpdate: function() {
					resetGlobalVolume();
				}
			});
	}

	private static function stopAll():Void {
		for (c in channels) stopChannel(c.name);
	}

	private static function soundComplete(e:Event) {
		stopChannel(getChannelByChannel(cast e.target).name);
	}

}

typedef MintChannel = {
	?volumeMod:Float,
	?src:Sound,
	?dest:Sound,
	?channel:SoundChannel,
	?name:String,
	?config:SoundConfig,
	?pos:Int
}
