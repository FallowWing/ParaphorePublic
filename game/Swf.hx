#if OPENFL_ENGINE
package;

import flash.display.*;
import flash.events.Event;
import flash.system.LoaderContext;
import haxe.io.Bytes;

class Swf
{
	public static var movies:Map<String, MovieClip> = new Map();
	public static var movieTimers:Map<String, Int> = new Map();

	public static function addMovie(swfName:String, fps:Float):Void {
		fps = Math.round(fps);
		var mc:MovieClip = openfl.Assets.getMovieClip(swfName+":");
		Engine.stage.addChild(mc);
		mc.stop();
		mc.gotoAndStop(1);
		movies.set(swfName, mc);

		var frameTimerId:Int = Engine.timer(
			1/fps,
			function() {
				if (mc.currentFrame == mc.totalFrames) {
					mc.gotoAndStop(1);
				} else {
					mc.nextFrame();
				}
			},
			99999
		);

		movieTimers.set(swfName, frameTimerId);
	}

	public static function getMovie(swfName:String, canFail:Bool=true):MovieClip {
		var movie:MovieClip = movies.get(swfName);
		if (movie == null && canFail) Main.error("Movie "+swfName+" doesn't exist currently");
		return movie;
	}

	public static function resizeMovie(swfName:String, width:Float=-1, height:Float=-1):Void {
		var mc:MovieClip = getMovie(swfName);
		var wRatio:Float = mc.width / mc.height;
		var hRatio:Float = mc.height / mc.width;

		if (width == -1) {
			mc.height = height;
			mc.width = height * wRatio;
		} else if (height == -1) {
			mc.width = width;
			mc.height = width * hRatio;
		} else if (height != -1 && width != -1) {
			mc.width = width;
			mc.height = height;
		} else {
			Main.error("Invalid move params");
		}

	}

	public static function moveMovie(swfName:String, x:Float=-1, y:Float=-1):Void {
		var mc:MovieClip = getMovie(swfName);
		if (x != -1) mc.x = x;
		if (y != -1) mc.y = y;
	}

	public static function removeMovie(swfName:String):Void {
		var mc:MovieClip = getMovie(swfName, false);
		if (mc == null) return;

		Engine.timerCancel(movieTimers.get(swfName));
		movies.remove(swfName);
		Engine.stage.removeChild(mc);
	}

	public static function movieToFrame(swfName:String, partName:String, frame:Int):Void {
		var mc:MovieClip = getMovie(swfName);
		var part:MovieClip = Reflect.getProperty(mc, partName);
		part.gotoAndStop(frame);
	}

	public static function clearMovies():Void {
		for (key in movies.keys())
			removeMovie(key);
	}
}
#else
package;

class Swf
{
	public static function addMovie(swfName:String, fps:Float):Void {
	}

	/* public static function getMovie(swfName:String):MovieClip { */
	/* } */

	public static function resizeMovie(swfName:String, width:Float=-1, height:Float=-1):Void {
	}

	public static function moveMovie(swfName:String, x:Float=-1, y:Float=-1):Void {
	}

	public static function removeMovie(swfName:String):Void {
	}

	public static function movieToFrame(swfName:String, partName:String, frame:Int):Void {
	}

	public static function clearMovies():Void {
	}
}
#end
