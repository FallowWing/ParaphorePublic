package;

import Main.*;

class StaticExtern {
	/// Constants
	//@cleanup link these somewhere
	public static var GAME_WIDTH:Int = 800;
	public static var GAME_HEIGHT:Int = 600;
	public static var GAME_VERSION:String = Main.GAME_VERSION;
	public static var debugMode:Bool = Main.debug;
	public static var internal:Bool = Main.internal;

	/// Dynamic
	public static var data:Data;
	public static var temp:Dynamic;
	public static var isMyntOn:Bool = false; //@cleanup Make a function? Yes probably
 //@cleanup Make a function? Yes probably
 //@cleanup Make a function? Yes probably
 //@cleanup Make a function? Yes probably
 //@cleanup Make a function? Yes probably

	/// Basic UI
	public static var append:String->Void = Main.append;
	public static var appendTextField:String->Void = Main.appendTextField;
	public static var setLocation:String->Void = Main.setLocation;
	public static var addTextChoice:(String->Void)->Void = Main.addTextChoice;
	public static var addChoice:String->(Void->Void)->?ButtonConfig->Button = Main.addChoice;
	public static var addSprite:String->?Bool->MintSprite = Main.addSprite;
	public static var prepareSprite:MintSprite->?Bool->Void = Main.prepareSprite;
	public static var clear:Void->Void = Main.clear;
	public static var msg:String->?Bool->?Bool->Void = Main.msg;
	public static var startHub:String->Void = Main.startHub;
	public static var gotoHub:?String->Void = StaticCallbacks.goHubCall;

	/// Expanded UI
	public static var clearChoices:Void->Void = Main.clearChoices;
	public static var clearText:Void->Void = Main.clearText;
	public static var clearTemp:Void->Void = Main.clearTemp;
	public static var enableCursorKeys:Void->Void = Main.enableCursorKeys;
	public static var disableCursorKeys:Void->Void = Main.disableCursorKeys;

	public static var buttonsInGrid:Float->Int->Float->Float->Float->Float->Float->?Array<Button>->Void = Buttons.inGrid;
	public static var makeButtonLine:Array<String>->Float->Float->Direction->Array<Button> = Buttons.makeLine;
	public static var addText:?Bool->MintText = Main.addText;
	public static var halfWidthText:Void->Void = Main.halfWidthText;

	public static var isPaused:?Int->Bool = Pause.isPaused;
	public static var showChoices:Void->Void = Main.showChoices;
	public static var hideChoices:Void->Void = Main.hideChoices;
	public static var makeSmallButtons:Void->Void = Main.makeSmallButtons;

	/// Audio
	public static var playSound:String->?String->?SoundConfig->Void = Engine.playSound;
	public static var stopChannel:String->Void = Engine.stopChannel;
	public static var resetGlobalVolume:Void->Void = Engine.resetGlobalVolume;
	public static var setChannelVolume:String->Float->Void = Engine.setChannelVolume;
	public static var fadeChannel:String->?Bool->?Float->Void = Engine.fadeChannel;

	/// Mynt
	public static var showMynt:Void->Void = Mynt.show;
	public static var hideMynt:Void->Void = Mynt.hide;
	public static var myntQueueSay:String->Void = Mynt.queueSay;
	public static var myntQueueTransition:String->Void = Mynt.queueTransition;
	public static var myntQueueBody:Int->Void = Mynt.queueBody;
	public static var myntQueueSetupBodyBg:Void->Void = Mynt.setupBodyBg;
	public static var myntQueueCall:(Void->Void)->Void = Mynt.queueCall;
	public static var myntQueueAddChoice:String->(Void->Void)->?ButtonConfig->Void = Mynt.queueAddChoice;
	public static var myntQueueAddPointlessChoice:String->(Void->Void)->?ButtonConfig->Void = Mynt.queueAddPointlessChoice;
	public static var myntQueueAddTextChoice:(String->Void)->Void = Mynt.queueAddTextChoice;
	public static var myntQueueShowChoices:Void->Void = Mynt.queueShowChoices;
	public static var myntQueueHideChoices:Void->Void = Mynt.queueHideChoices;
	public static var myntQueueDelay:Int->Void = Mynt.queueDelay;
	public static var myntProceed:Void->Void = Mynt.proceed;

	/// Pause
	public static var pauseIsGoingPrev:Void->Bool = Main.pauseIsGoingPrev;
	public static var pauseGoPrev:Void->Void = Main.pauseGoPrev;
	public static var pauseNoGoPrev:Void->Void = Main.pauseNoGoPrev;
	public static var returnToPrev:Void->Void = Main.returnToPrev;
	public static var enablePause:Void->Void = Main.enablePause;
	public static var disablePause:Void->Void = Main.disablePause;

	public static var saveCheckpoint:String->Void = GameData.saveCheckpoint;
	public static var cameraFadeIn:Int->Float->?(Void->Void)->?Bool->Void = Camera.fadeIn;
	public static var cameraFadeOut:Int->Float->?(Void->Void)->?Bool->Void = Camera.fadeOut;

	/// Game Data
	public static var addPlace:String->String->?String->Void = GameData.addPlace;
	public static var getPlace:String->ActionPlace = GameData.getPlace;
	public static var removePlace:ActionPlace->Bool = GameData.removePlace;

	public static var addAction:String->String->?String->Void = GameData.addAction;
	public static var getAction:String->ActionPlace = GameData.getAction;
	public static var removeAction:ActionPlace->Bool = GameData.removeAction;

	public static var addItem:String->String->Void = GameData.addItem;
	public static var getItem:String->Item = GameData.getItem;
	public static var addToItem:String->Float->?Bool->Void = GameData.addToItem;
	public static var removeItem:Item->Bool = GameData.removeItem;
	public static var isActive:String->Bool = GameData.isActive;
	public static var unlockJournal:String->Void = GameData.unlockJournal;
	public static var getJournalEntries:Void->Array<String> = GameData.getJournalEntries;
	public static var wakeUp:Void->Void = Journal.wakeUp; // @cleanup: Are internal references ok?

	public static var load:Void->Void = GameData.uploadCurSave;
	public static var loadMod:Void->Void = GameData.loadMod;
	public static var saveToString:Void->String = GameData.saveToString;
	public static var loadCurFromString:String->Void = GameData.loadCurFromString;

	/// Util
	public static var pickOne:Array<Dynamic>->?Array<Dynamic>->Dynamic = MintArrayUtils.pickOne;

	public static var onFA:Void->Bool = Main.onFA;
	public static var hookClear:(Void->Void)->Void = Main.hookClear;
	public static var hookUpdate:(Void->Void)->Void = Main.hookUpdate;
	public static var getFps:Void->Float = Main.getFps;

	public static var rndSeed:Int->Int->Void = Random.seed;
	public static var rndInt:Int->Int->?Int->Int = Random.int;
	public static var rndFloat:Float->Float->?Int->Float = Random.float;
	public static var random:?Int->Float = Random.random;

	public static var getAssetList:Void->Array<String> = Engine.getAssetList;
	public static var pathToText:String->String = Engine.pathToText;
	public static var onGainFocusOnce:(Void->Void)->Void = Main.onGainFocusOnce;
	public static var onLoseFocusOnce:(Void->Void)->Void = Main.onLoseFocusOnce;

	/// Tweens
	public static var tween:Dynamic->Dynamic->Float->?TweenConfig->Void = Engine.tween;
	public static var timer:Float->(Void->Void)->?Int->Int = Engine.timer;
	public static var timerCancel:Int->Void = Engine.timerCancel;
	public static var getTimer:Void->Float = Main.getTimer;

	public static var addExplorable:Int->String->(Void->Void)->Int->?Int->Void = GameData.addExplorable;
	public static var disableExplorable:Int->Void = GameData.disableExplorable;
	public static var explore:String->Void = GameData.explore;

	public static var showToolTipOnCursor:String->String->?String->Void = Tooltip.showOnCursor;

	/// Swf
	public static var addMovie:String->Float->Void = Swf.addMovie;
	public static var resizeMovie:String->?Float->?Float->Void = Swf.resizeMovie;
	public static var moveMovie:String->?Float->?Float->Void = Swf.moveMovie;
	public static var removeMovie:String->Void = Swf.removeMovie;
	public static var movieToFrame:String->String->Int->Void = Swf.movieToFrame;

	//Complex Anim
	public static var createComplexAnim:String->ComplexAnim = ComplexAnims.create;

	public static var addRectSprite:Float->Float->Int->?Bool->MintSprite = Main.addRectSprite;
	public static var getStoryText:Void->String = Main.getStoryText;
	public static var print:Dynamic->Void = Main.print;
	public static var warn:Dynamic->Void = Main.warn;
	public static var error:Dynamic->Void = Main.error;

	/// Theme
	public static var resetTheme:Void->Void = Main.resetTheme;
	public static var unlockUi:String->String->?Bool->Void = Theme.unlockUi;
	public static var equipUi:String->?Bool->Void = Theme.equipUi;
	public static var themeGetColour:String->Int = Theme.getColour;

	/// Misc
	public static var getKeyStatus:Key->Bool = Engine.getKeyStatus;
	public static var bindKey:Key->(Void->Void)->?ButtonState->?Float->Void = Engine.bindKey;
	public static var unBindKey:Key->?(Void->Void)->Void = Engine.unBindKey;
	public static var getUrl:String->Void = Engine.getUrl;
	public static var installClassFields:Array<Class<Dynamic>>->Void = Main.installClassFields;

	public static var sliderCreate:Float->?Float->?(Void->Void)->Slider = Sliders.create;
	public static var sliderDestroy:Slider->Void = Sliders.destroy;
	public static var sliderRedraw:Slider->Void = Sliders.redraw;
	public static var sliderAlign:Slider->Void = Sliders.align;

	public static var emitterCreate:String->Emitter = Emitters.create;
	public static var emitterEmit:Emitter->String->Void = Emitters.emit;
	public static var emitterDestroy:Emitter->Void = Emitters.destroy;

	public static var tilemapCreate:String->Int->Int->Int->Int->Tilemap = Tilemaps.create;
	public static var autotileRaw:Array<Array<Int>>->Int->Int->Void = Tilemaps.autotileRaw;

	/// Mods
	public static var modExec:String->Void = Main.modExec;
	public static var loadBase64Png:String->String->(Void->Void)->Void = Engine.loadBase64Png;
}
