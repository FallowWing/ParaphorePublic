package;

class Camera
{
	private static var faderSprite:MintSprite;
	private static var fading:Bool = false;

	public static function flash(colour:Int, time:Float, timeSolid:Int=0, onComplete:Void->Void=null, force:Bool=true):Void {
		if (fading && !force) return;
		resetEffects();
		fading = true;
		faderSprite.visible = true;

		faderSprite.setupRect(StaticExtern.GAME_WIDTH+10, StaticExtern.GAME_HEIGHT+10, colour);
		faderSprite.alpha = 1;
		Engine.timer(timeSolid, Engine.tween.bind(faderSprite, {alpha: 0}, time, {onComplete: function(){
			if (onComplete != null) onComplete();
			fading = false;
		}}));
	}

	public static function fadeIn(colour:Int, time:Float, onComplete:Void->Void=null, force:Bool=true):Void {
		if (fading && !force) return;
		resetEffects();
		fading = true;
		faderSprite.visible = true;

		faderSprite.setupRect(StaticExtern.GAME_WIDTH+10, StaticExtern.GAME_HEIGHT+10, colour);
		faderSprite.alpha = 1;
		faderSprite.update();
		Engine.tween(faderSprite, {alpha: 0.0}, time, {onComplete: function() {
			if (onComplete != null) onComplete();
			faderSprite.visible = false;
			fading = false;
		}});

		Engine.update(null);
	}

	public static function fadeOut(colour:Int, time:Float, onComplete:Void->Void=null, force:Bool=true):Void {
		if (fading && !force) return;
		resetEffects();
		fading = true;
		faderSprite.visible = true;

		faderSprite.setupRect(StaticExtern.GAME_WIDTH+10, StaticExtern.GAME_HEIGHT+10, colour);
		faderSprite.alpha = 0;
		Engine.tween(faderSprite, {alpha: 1.0}, time, { onComplete: function() {
			if (onComplete != null) onComplete();
			fading = false;
		}});
	}

	public static function update(elapsed:Float=0):Void {
	}

	private static function resetEffects():Void {
		if (faderSprite == null) {
			faderSprite = new MintSprite();
			faderSprite.layer = Main.FADER_LAYER;
		}
		Engine.cancelTweensOn(faderSprite);
	}
}
