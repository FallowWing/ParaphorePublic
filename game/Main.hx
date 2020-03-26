package;

import hscript.*;

class Main
{
	public static inline var GAME_VERSION:String = "1.0.0";
#if internal
	public static var internal:Bool = true;
#else
	public static var internal:Bool = false;
#end

#if debug
	public static var debug:Bool = true;
#else
	public static var debug:Bool = false;
#end

	public static inline var CONSOLE_TEXT_LAYER:Int = 110;
	public static inline var CONSOLE_BG_LAYER:Int = 100;
	public static inline var FADER_LAYER:Int = 90;
	public static inline var TOOLTIP_TEXT_LAYER:Int = 80;
	public static inline var TOOLTIP_SPRITE_LAYER:Int = 70;
	public static inline var MSG_LAYER:Int = 60;
	public static inline var PAUSE_MENU_BUTTON_TEXT_LAYER:Int = 57;
	public static inline var PAUSE_MENU_BUTTON_SPRITE_LAYER:Int = 56;
	public static inline var PAUSE_MENU_LAYER:Int = 55;
	public static inline var BUTTON_TEXT_LAYER:Int = 51;
	public static inline var BUTTON_SPRITE_LAYER:Int = 50;
	public static inline var HUB_LAYER:Int = 40;
	public static inline var ADD_SPRITE_LAYER:Int = 35;
	public static inline var CHOICE_BOX_LAYER:Int = 30;

	public static inline var GAME_PAUSE_LAYER:Int = 0;
	public static inline var OPTIONS_PAUSE_LAYER:Int = 1;
	public static inline var MSG_PAUSE_LAYER:Int = 2;
	public static inline var CONSOLE_PAUSE_LAYER:Int = 3;

	public static var parser:Parser = new Parser();
	public static var interp:Interp = new Interp();

	public static var modParser:Parser = new Parser();
	public static var modInterp:Interp = new Interp();

	public static var frameCount:Int = 0;
	public static var lastTime:Float;
	public static var elapsed:Float;
	public static var fps:Float = 0;
	public static var hasFocus:Bool = false;

	public static var uiState:String;
	public static var inMod:Bool = false;
	public static var smallButtons:Bool = false;

	public static var petGameButton:MintSprite;
	public static var mapButton:MintSprite;
	public static var loadButton:MintSprite;
	public static var saveButton:MintSprite;
	public static var shopButton:MintSprite;
	public static var skinsButton:MintSprite;
	public static var devButton:MintSprite;
	public static var secretButton:MintSprite;

	public static var background:MintSprite;
	public static var scrollBar:MintSprite;
	public static var topBar:MintSprite;
	public static var choiceBox:MintSprite;
	public static var pauseButton:MintSprite;

	public static var hubMenus:Array<MintSprite>;
	public static var hubButtons:Array<MintSprite>;
	public static var divider:MintSprite;
	public static var exploreButton:MintSprite;
	public static var playerButton:MintSprite;
	public static var itemMenu:MintSprite;
	public static var actionMenu:MintSprite;
	public static var itemHeader:MintSprite;
	public static var actionHeader:MintSprite;
	public static var roamHeader:MintSprite;

	public static var msgs:Array<Button> = [];
	public static var highestMsgHeight:Float = -1;

	public static var itemButtons:Array<MintSprite> = [];
	public static var itemSprites:Array<MintSprite> = [];
	public static var actionButtons:Array<Button> = [];
	public static var roamButtons:Array<Button> = [];

	public static var locationText:MintText;

	public static var storyText:String = "";
	public static var mainText:MintText;
	public static var scrollingText:MintText;
	public static var textWidthChanged:Bool = false;

	public static var kinks:Array<Array<Kink>> = [];
	public static var kinkButtons:Array<MintSprite> = [];
	public static var choiceButtons:Array<Button>;
	public static var choiceText:MintText;
	public static var cursor:MintSprite;
	public static var highlightedButton:Button;

	public static var tempSprites:Array<MintSprite> = [];
	public static var tempClearHooks:Array<Void->Void> = [];
	public static var tempUpdateHooks:Array<Void->Void> = [];
	public static var tempGainFocusHooks:Array<Void->Void> = [];
	public static var tempLoseFocusHooks:Array<Void->Void> = [];

	public static function showTopButton(button:MintSprite):Void {
		if (button == pauseButton || button == saveButton || button == loadButton || button == mapButton) {
			Engine.tween(button, {alpha: 1}, 0.5);
			button.mouseEnabled = true;
		}

		if (debug && button == devButton) {
			Engine.tween(devButton, {alpha: 1}, 0.5);
			devButton.mouseEnabled = true;
		}

		if (GameData.data.foundShop && button == shopButton) {
			Engine.tween(shopButton, {alpha: 1}, 0.5);
			shopButton.mouseEnabled = true;
		}

		if (GameData.data.skinsUnlocked && button == skinsButton) {
			Engine.tween(skinsButton, {alpha: 1}, 0.5);
			skinsButton.mouseEnabled = true;
		}
	}

	public static function hideTopButton(button:MintSprite):Void {
		Engine.tween(button, {alpha: 0}, 0.5);
		button.mouseEnabled = false;
	}

	public static function init():Void {
		lastTime = Engine.currentTime;
		MintSprite.defaultPauseLayer = GAME_PAUSE_LAYER;

		/// Default hud
		choiceButtons = [];

		background = new MintSprite();
		background.pixelPerfectOverlapping = true;
		background.setupAnimated("assets/img/hud/default/background.png");

		topBar = new MintSprite();
		topBar.setupAnimated("assets/img/hud/default/topBar.png");

		choiceBox = new MintSprite();
		choiceBox.setupAnimated("assets/img/hud/default/choiceBox.png");
		choiceBox.y = Engine.height - choiceBox.height;
		choiceBox.layer = CHOICE_BOX_LAYER;

		pauseButton = new MintSprite();
		pauseButton.setupAnimated("assets/img/hud/default/pauseButtonBlue.png");
		pauseButton.animFrameRate = 45;
		pauseButton.x = Engine.width - pauseButton.width - 2;
		pauseButton.y = 2;
		pauseButton.onHover = Tooltip.showOnCursor.bind("Pause", "");
		pauseButton.onReleaseOnce = function() {
			Engine.playSound("assets/audio/ui/topClick");
			Pause.togglePause();
		}
		pauseButton.pixelPerfectOverlapping = false;
		pauseButton.alpha = 0;
		pauseButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		pauseButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		mapButton = new MintSprite();
		mapButton.setupAnimated("assets/img/hud/default/mapButton.png");
		mapButton.x = pauseButton.x - mapButton.width - 1;
		mapButton.y = pauseButton.y;
		mapButton.onHover = Tooltip.showOnCursor.bind("Island", "");
		mapButton.onReleaseOnce = function() {
			Engine.playSound("assets/audio/ui/topClick");

			var meetEnding:Bool = true;

			for (chara in ["Roxelle", "Cade", "Kemp", "Red", "Septrica", "Marei", "Som"]) {
				if (GameData.getItem(chara+"'s Seed").amount < 1) meetEnding = false;
			}

			if (!GameData.data.journalCompleted) meetEnding = false;

			if (!GameData.data.endingsUnlocked.contains("mynt") || !GameData.data.endingsUnlocked.contains("mint") || !GameData.data.endingsUnlocked.contains("protocol") || !GameData.data.endingsUnlocked.contains("septrica")) meetEnding = false;

			if (GameData.data.endingsUnlocked.contains("meteorite")) meetEnding = false;

			//meetEnding = true;

			if (meetEnding) {
				Endings.explore("meteoriteEndingMap");
			} else {
				if (Pause.pauseGoesPrev || GameData.data.onWorldMap) {
					//Hide other hub buttons to kill clutter
					for (button in [mapButton, loadButton, saveButton, devButton, skinsButton, shopButton])
						showTopButton(button);
					returnToPrev();
				} else {
					for (button in [shopButton, saveButton, skinsButton, loadButton, devButton])
						hideTopButton(button);
					Pause.unpause();
					if (WorldMap.prevAmbience != GameData.data.currentSong) StoryUtils.playMusic(WorldMap.prevAmbience);
					WorldMap.map();
				}
			}
		}
		mapButton.pixelPerfectOverlapping = false;
		mapButton.alpha = 0;
		mapButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		mapButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		loadButton = new MintSprite();
		loadButton.setupAnimated("assets/img/hud/default/loadButton.png");
		loadButton.animFrameRate = 45;
		loadButton.x = pauseButton.x - loadButton.width*2 - 2;
		loadButton.y = pauseButton.y;
		loadButton.onHover = Tooltip.showOnCursor.bind("Load", "");
		loadButton.setMagicOnClick(function() {
			Engine.playSound("assets/audio/ui/topClick");
			msg("Loading a file...", true);
			if (loadButton.active) GameData.uploadCurSave();
		});
		loadButton.pixelPerfectOverlapping = false;
		loadButton.alpha = 0;
		loadButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		loadButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		saveButton = new MintSprite();
		saveButton.setupAnimated("assets/img/hud/default/saveButton.png");
		saveButton.animFrameRate = 45;
		saveButton.x = pauseButton.x - saveButton.width*3 - 3;
		saveButton.y = pauseButton.y;
		saveButton.onHover = Tooltip.showOnCursor.bind("Save", "");
		saveButton.setMagicOnClick(function() {
			Engine.playSound("assets/audio/ui/topClick");
			GameData.downloadCurSave();
			msg("Exporting "+GameData.data.playerName+"'s file...", true);
		});
		saveButton.pixelPerfectOverlapping = false;
		saveButton.alpha = 0;
		saveButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		saveButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		shopButton = new MintSprite();
		shopButton.setupAnimated("assets/img/hud/default/shopButton.png");
		shopButton.animFrameRate = 45;
		shopButton.x = pauseButton.x - shopButton.width*4 - 4;
		shopButton.y = pauseButton.y;
		shopButton.onHover = Tooltip.showOnCursor.bind("AUTO-SHOP", "");
		shopButton.onReleaseOnce = function() {
			Engine.playSound("assets/audio/ui/topClick");
			StaticCallbacks.miscPlaceCall("Auto-Shop");
		}
		shopButton.alpha = 0;
		shopButton.mouseEnabled = false;
		shopButton.pixelPerfectOverlapping = false;
		shopButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		shopButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		skinsButton = new MintSprite();
		skinsButton.setupAnimated("assets/img/hud/default/skinsButton.png");
		skinsButton.x = pauseButton.x - skinsButton.width*5 - 5;
		skinsButton.y = pauseButton.y;
		skinsButton.onHover = Tooltip.showOnCursor.bind("Skins", "");
		skinsButton.onReleaseOnce = function() {
			Engine.playSound("assets/audio/ui/topClick");
			if (Pause.pauseGoesPrev) {
				Main.playerButton.mouseEnabled = true;
				Main.exploreButton.mouseEnabled = true;
				for (hubButton in [Main.mapButton, Main.loadButton, Main.saveButton, Main.devButton, Main.pauseButton, Main.shopButton])
					Main.showTopButton(hubButton);
				returnToPrev();
			} else {
				Main.playerButton.mouseEnabled = false;
				Main.exploreButton.mouseEnabled = false;
				for (hubButton in [Main.mapButton, Main.loadButton, Main.saveButton, Main.devButton, Main.pauseButton, Main.shopButton])
					Main.hideTopButton(hubButton);
				Pause.unpause();
				BrightForest.skinSwitcher();
			}
		}
		skinsButton.alpha = 0;
		skinsButton.mouseEnabled = false;
		skinsButton.pixelPerfectOverlapping = false;
		skinsButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		skinsButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		devButton = new MintSprite();
		devButton.setupAnimated("assets/img/hud/default/devButton.png");
		devButton.animFrameRate = 45;
		devButton.x = pauseButton.x - devButton.width*6 - 6;
		devButton.y = pauseButton.y;
		devButton.onHover = Tooltip.showOnCursor.bind("Dev", "");
		devButton.onReleaseOnce = function() {
			Engine.playSound("assets/audio/ui/topClick");
			StaticCallbacks.miscPlaceCall("Dev Menu");
		}
		devButton.alpha = 0;
		devButton.mouseEnabled = false;
		devButton.pixelPerfectOverlapping = false;
		devButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		devButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		secretButton = new MintSprite();
		prepareSprite(secretButton, true);
		secretButton.setupRect(79, 41, 0);
		secretButton.x = pauseButton.x - secretButton.width*7 - 7;
		secretButton.y = pauseButton.y;
		secretButton.alpha = 0;
		secretButton.onReleaseOnce = function() {
			msg("secret button");
		}
		secretButton.pixelPerfectOverlapping = false;
		secretButton.pauseLayer = OPTIONS_PAUSE_LAYER;
		secretButton.layer = PAUSE_MENU_BUTTON_SPRITE_LAYER;

		mainText = new MintText({ wordWrap: true, wordWrapWidth: Engine.width-40 });
		mainText.setText("Hello, this is some test text");
		mainText.setMaxHeight((choiceBox.y-20) - (topBar.height+10));
		mainText.x = 10;
		mainText.y = topBar.height + 10;

		scrollingText = mainText;

		scrollBar = new MintSprite();
		scrollBar.mouseEnabled = true;
		scrollBar.x = Engine.width - 20;

		locationText = new MintText();
		locationText.x = 10;
		locationText.y = 10;

		kinkButtons = [];
		for (i in 0...25) kinkButtons.push(new MintSprite());

		cursor = new MintSprite("hud/cursor");
		cursor.layer = BUTTON_TEXT_LAYER;
		cursor.centerPivot = false;
		cursor.visible = false;

		/// Hub menu
		divider = new MintSprite();
		divider.setupAnimated("assets/img/hud/default/divider.png");
		divider.x = choiceBox.x;
		divider.y = choiceBox.y;

		playerButton = new MintSprite();
		playerButton.pixelPerfectOverlapping = false;
		playerButton.setupAnimated("assets/img/hud/default/player.png");
		playerButton.x = choiceBox.x;
		playerButton.y = choiceBox.y + choiceBox.height/2 - playerButton.height/2;
		playerButton.onReleaseOnce = function() {
			if (GameData.data.theme.topBar == "scrap" || GameData.data.theme.playerMenu == "scrap" || GameData.data.theme.background == "scrap" || GameData.data.theme.choiceBox == "scrap") {
				var scrapTintOptions:Array<Int> = [0x33ec2be1, 0x336a5aff, 0x3300d2ff, 0x3338ff1d, 0x33ff6b37];
				var scrapPlayerMenu:Int = scrapTintOptions.pickOne();
				var scrapBackground:Int = scrapTintOptions.pickOne();
				var scrapChoiceBox:Int = scrapTintOptions.pickOne();
				var scrapTopBar:Int = scrapTintOptions.pickOne();
				var scrapMynt:Int = scrapTintOptions.pickOne();

				if (GameData.data.theme.topBar == "scrap") topBar.tint = scrapTopBar;
				if (GameData.data.theme.playerMenu == "scrap") {
					itemMenu.tint = scrapPlayerMenu;
					actionMenu.tint = scrapPlayerMenu;
					itemHeader.tint = scrapPlayerMenu;
					actionHeader.tint = scrapPlayerMenu;
					roamHeader.tint = scrapPlayerMenu;
				}
				if (GameData.data.theme.background == "scrap") background.tint = scrapBackground;
				if (GameData.data.theme.choiceBox == "scrap") {
					choiceBox.tint = scrapChoiceBox;
					divider.tint = scrapChoiceBox;
					playerButton.tint = scrapChoiceBox;
					exploreButton.tint = scrapChoiceBox;
				}
			}
			Engine.playSound(Theme.getSound("explore"));
			if (uiState == "hubOpen") {
				for (button in [devButton, skinsButton])
					showTopButton(button);
				changeUiState("hub");
			} else {
				for (button in [devButton, skinsButton])
					hideTopButton(button);
				devButton.mouseEnabled = false;
				skinsButton.mouseEnabled = false;
				changeUiState("hubOpen");
			}
			update();
		}

		exploreButton = new MintSprite();
		exploreButton.pixelPerfectOverlapping = false;
		exploreButton.setupAnimated("assets/img/hud/default/explore.png");
		exploreButton.x = choiceBox.x + choiceBox.width - exploreButton.width;
		exploreButton.y = choiceBox.y + choiceBox.height/2 - exploreButton.height/2;
		exploreButton.onReleaseOnce = function(){
			Engine.playSound(Theme.getSound("explore"));
			GameData.explore(null);
		}

		//Player Menu

		itemMenu = new MintSprite();
		itemMenu.setupAnimated("assets/img/hud/default/itemMenu.png");
		itemMenu.y = Engine.height;

		actionMenu = new MintSprite();
		actionMenu.setupAnimated("assets/img/hud/default/actionMenu.png");
		actionMenu.x = -actionMenu.width;

		itemHeader = new MintSprite();
		itemHeader.pixelPerfectOverlapping = false;
		itemHeader.setupAnimated("assets/img/hud/default/itemHeader.png");

		actionHeader = new MintSprite();
		actionHeader.pixelPerfectOverlapping = false;
		actionHeader.setupAnimated("assets/img/hud/default/actionHeader.png");

		roamHeader = new MintSprite();
		roamHeader.pixelPerfectOverlapping = false;
		roamHeader.setupAnimated("assets/img/hud/default/roamHeader.png");

		hubMenus = [itemMenu, actionMenu, itemHeader, actionHeader, roamHeader];
		hubButtons = [divider, playerButton, exploreButton];
		itemMenu.layer = HUB_LAYER;
		actionMenu.layer = HUB_LAYER;
		itemHeader.layer = BUTTON_SPRITE_LAYER;
		actionHeader.layer = BUTTON_SPRITE_LAYER;
		roamHeader.layer = BUTTON_SPRITE_LAYER;
		divider.layer = CHOICE_BOX_LAYER;
		playerButton.layer = CHOICE_BOX_LAYER;
		exploreButton.layer = CHOICE_BOX_LAYER;

		for (sprite in hubMenus) sprite.deactivate();
		for (sprite in hubButtons) sprite.deactivate();

		changeUiState("default");
		setScroll(0);

		/// Data
		GameData.createData();
		StoryExtern.initExternPassages();
		StoryExtern.postLoad();
		GameData.reInitRefs();

		/// Install fields
		installClassFields([GameData, Main, Engine, Math, Pause, EReg, MintSprite, Mynt]);

		for (f in Type.getClassFields(StaticExtern)) {
			interp.variables.set(f, Reflect.getProperty(StaticExtern, f));
			modInterp.variables.set(f, Reflect.getProperty(StaticExtern, f));
		}

		for (e in CommonBase.enumList) {
			for (ei in Type.allEnums(e)) {
				var enumString:String = Std.string(ei);
				var enumLiteral = Type.getEnum(ei);
				interp.variables.set(enumString, ei);
				modInterp.variables.set(enumString, ei);
			}
		}

		modInterp.variables.set("modExit", function() {
			inMod = false;
			Menu.menuResolve();
		});

		/// Entry point
		enableCursorKeys();
		Random.init();
		Tooltip.init();
		Console.init();
		resetTheme();
		Menu.menuResolve();
	}

	public static function owO(str:String):String {
		var charsArray:Array<String> = str.split("");
		for (char in charsArray) {
			var pos:Int = charsArray.indexOf(char);
			if (char == "L" || char == "R") {
				charsArray.insert(pos, "W");
				charsArray.remove(char);
			}
			if (char == "l" || char == "r") {
				charsArray.insert(pos, "w");
				charsArray.remove(char);
			}
		}
		str = charsArray.join("");
		return str;
	}

	public static function append(str:String):Void {
		if (uiState == "hubOpen") changeUiState("hub");

		storyText += str;
		while (storyText.charAt(0) == "\n") storyText = storyText.substr(1, storyText.length); // Removes leading \n's

		if (GameData.isActive("Curiosity Ring")) storyText = owO(storyText);

		mainText.setText(storyText, true);
	}

	public static function refreshScrollBar():Void {
		scrollBar.visible = (scrollingText.maxVScroll > 1);
		if (scrollBar.visible) {
			if (scrollingText == mainText && !GameData.data.gotScrollMessage && !debug) {
				GameData.data.gotScrollMessage = true;
				msg("You can scroll this passage! <!b>==><!b>");
			}
			var scale:Float = scrollingText.visibleLines/(scrollingText.visibleLines+scrollingText.maxVScroll-1);
			if (scale < 0.1) scale = 0.1;

			var maxHeight:Float = scrollingText.height;
			var barHeight:Int = Std.int(scale*maxHeight);

			scrollBar.clear();
			scrollBar.setupRect(10, scale*maxHeight, Theme.getColour("mainText"));
		}
	}
	
	public static function enableCursorKeys():Void {
		Engine.bindKey(W, moveCursorUp);
		Engine.bindKey(S, moveCursorDown);
		Engine.bindKey(A, moveCursorLeft);
		Engine.bindKey(D, moveCursorRight);
		Engine.bindKey(SPACE, selectCursorButton);
	}

	public static function disableCursorKeys():Void {
		Engine.unBindKey(W, moveCursorUp);
		Engine.unBindKey(S, moveCursorDown);
		Engine.unBindKey(A, moveCursorLeft);
		Engine.unBindKey(D, moveCursorRight);
		Engine.unBindKey(SPACE, selectCursorButton);
	}

	//@hack Maybe bindKey should allow a name to be specified so this isn't necessary
	public static function moveCursorUp():Void moveCursor("up");
	public static function moveCursorDown():Void moveCursor("down");
	public static function moveCursorLeft():Void moveCursor("left");
	public static function moveCursorRight():Void moveCursor("right");

	public static function moveCursor(dir:String):Void {
		if (choiceButtons.length == 0) return;

		var shouldTween:Bool = true;
		if (!cursor.visible) {
			cursor.visible = true;
			cursor.alpha = 0;
			Engine.tween(cursor, {alpha: 1}, 0.25);
			shouldTween = false;
		}

		if (highlightedButton == null) {
			highlightedButton = choiceButtons[0];
		} else {
			if (dir == "left") {
				var curIndex:Int = choiceButtons.indexOf(highlightedButton);
				if (curIndex > 0) highlightedButton = choiceButtons[curIndex-1];
			} else if (dir == "right") {
				var curIndex:Int = choiceButtons.indexOf(highlightedButton);
				if (curIndex+1 < choiceButtons.length) highlightedButton = choiceButtons[curIndex+1];
			} else if (dir == "up" || dir == "down") {
				var options:Array<Button> = [];
				for (b in choiceButtons) {
					if (dir == "up" && b.sprite.y < highlightedButton.sprite.y) options.push(b);
					if (dir == "down" && b.sprite.y > highlightedButton.sprite.y) options.push(b);
				}

				if (options.length == 0) return;

				var closest:Button = options[0];
				for (b in options)
					if (Point.rawDistance(b.sprite.x, b.sprite.y, highlightedButton.sprite.x, highlightedButton.sprite.y) < Point.rawDistance(closest.sprite.x, closest.sprite.y, highlightedButton.sprite.x, highlightedButton.sprite.y))
						closest = b;
				highlightedButton = closest;
			}
		}

		var spr:MintSprite = highlightedButton.sprite;
		var newX:Float = spr.x;
		var newY:Float = spr.y + spr.height - cursor.height;
		var newScaleX:Float = spr.width/cursor.width;

		if (shouldTween) {
			Engine.tween(cursor, {x: newX, y: newY, scaleX: newScaleX}, 0.1);
		} else {
			cursor.x = newX;
			cursor.y = newY;
			cursor.scaleX = newScaleX;
		}
	}

	public static function selectCursorButton():Void {
		if (highlightedButton != null) highlightedButton.sprite.onReleaseOnce();
	}

	public static function msg(str:String, silent:Bool=false, lastsLong:Bool=false):Void {
		/// If there are too many msgs, clear them out
		if (highestMsgHeight < topBar.height && highestMsgHeight != -1) {

			for (i in 0...msgs.length) {
				if (msgs[i] == null) continue;
				Engine.cancelTweensOn(msgs[i].label);
				Engine.cancelTweensOn(msgs[i].sprite);
				Engine.tween(msgs[i].label, {alpha: 0}, i*0.075, {onComplete: msgs[i].destroy});
				Engine.tween(msgs[i].sprite, {alpha: 0}, i*0.075);
			}

			highestMsgHeight = -1;
			msgs = [];
		}

		if (!silent) Engine.timer(0.3, function () {Engine.playSound("audio/ui/dropbox");});
		var b:Button = Buttons.create();
		b.imagePath = "assets/img/hud/toolTip.png";
		b.label.setFormat({fontColour: Theme.getColour("mainText"), wordWrap: true, fontSize: 20});
		b.label.setText(str);

		b.label.layer = Main.MSG_LAYER;
		b.label.pauseLayer = Main.MSG_PAUSE_LAYER;
		b.sprite.layer = Main.MSG_LAYER;
		b.sprite.pauseLayer = Main.MSG_PAUSE_LAYER;

		b.sprite.x = Engine.width - b.label.fieldWidth - 20;
		b.sprite.y = choiceBox.y;

		b.sprite.tint = Theme.getColour("background");

		b.sprite.onReleaseOnce = function() {
			Engine.playSound("assets/audio/environment/pearClick");
			Engine.tween(b.sprite, {scaleX: 0, scaleY: 0, alpha: 0}, 0.3, {ease: QUAD_OUT});
			Engine.tween(b.label, {scaleX: 0, scaleY: 0, alpha: 0}, 0.3, {ease: QUAD_OUT, onComplete: function() {
				msgs.remove(b);
				b.destroy();
			}});
		}
		
		b.enabled = false;
		b.label.setMaxWidth(Engine.width-10);

		b.redraw();
		b.align();

		msgs.push(b);

		/*var tf:MintText = new MintText({wordWrap: false, fontSize: 20, fontColour: Theme.getColour("mainText")});
		tf.layer = Main.MSG_LAYER;
		tf.pauseLayer = MSG_PAUSE_LAYER;
		tf.setText(str);
		tf.x = Engine.width - tf.fieldWidth - 10;
		tf.setMaxWidth(Engine.width);
		msgs.push(tf);

		tf.y = choiceBox.y;
		//@cleanup Put msg behind choicebox*/
		var newY:Float = 0;
		if (highestMsgHeight == -1) newY = choiceBox.y - b.sprite.height - (StaticExtern.isMyntOn ? 60 : 10);
		else newY = highestMsgHeight - b.sprite.height - 10;

		//		if (Mynt.active) newY += 10;
		if (newY < highestMsgHeight || highestMsgHeight == -1) highestMsgHeight = newY;
		Engine.tween(b.label, {y: newY}, 0.7, {ease: QUINT_OUT});
		Engine.tween(b.sprite, {y: newY}, 0.7, {ease: QUINT_OUT});

		Engine.tween(b.label, {alpha: 0}, 1, {ease: QUART_IN, onComplete: function() {
			msgs.remove(b);
			b.destroy();
			if (newY == highestMsgHeight) highestMsgHeight = -1;
		}, startDelay: (lastsLong?99:5)});
		Engine.tween(b.sprite, {alpha: 0}, 1, {ease: QUART_IN, startDelay: (lastsLong?99:5)});

		b.sprite.update();
		b.label.update();
	}

	public static function setLocation(str:String):Void {
		locationText.setText(str);
	}

	public static function showChoices():Void {
		choiceBox.alpha = 1;

		for (s in hubMenus) s.alpha = 1;
		for (s in hubButtons) s.alpha = 1;
		for (s in itemButtons) s.alpha = 1;
		for (s in itemSprites) s.alpha = 1;
		for (b in actionButtons) b.show();
		for (b in roamButtons) b.show();

		for (b in choiceButtons) b.show();
		if (choiceText != null) choiceText.alpha = 1;
	}

	public static function hideChoices():Void {
		choiceBox.alpha = 0;

		for (s in hubMenus) s.alpha = 0;
		for (s in hubButtons) s.alpha = 0;
		for (s in itemButtons) s.alpha = 0;
		for (s in itemSprites) s.alpha = 0;
		for (b in actionButtons) b.hide();
		for (b in roamButtons) b.hide();

		for (b in choiceButtons) b.hide();
		if (choiceText != null) choiceText.alpha = 0;
	}

	public static function addTextChoice(result:String->Void):Void {
		disableCursorKeys();
		choiceText = new MintText({border: true, selectable: true, fontColour: Theme.getColour("choiceText"), borderColour: Theme.getColour("choiceText")});
		choiceText.setText("Test.");
		choiceText.setMaxWidth(200);
		choiceText.setMaxHeight(choiceText.fieldHeight+3);
		choiceText.input = true;
		choiceText.x = choiceBox.x + 10;
		choiceText.y = choiceBox.y + 13;
		choiceText.layer = Main.BUTTON_SPRITE_LAYER;
		choiceText.setText("");

		choiceText.onReleaseOnceAnywhere = function() {
			//StoryUtils.yesNudge([choiceText]);
			Engine.playSound("assets/audio/ui/hover6");
		}

		var b:Button = addChoice("Submit.", function() {
			result(choiceText.getText());
		});

		b.sprite.x = choiceText.x + choiceText.width + 10;
		b.align();
	}

	public static function appendTextField(text:String):Void {
		choiceText = new MintText({border: true, selectable: true, fontColour: Theme.getColour("background"), borderColour: Theme.getColour("background")});
		choiceText.setText(text);
		choiceText.setMaxWidth(Engine.width - 50);
		choiceText.setMaxHeight(Engine.height - choiceBox.height - 15);
		choiceText.input = true;
		choiceText.x = 15;
		choiceText.y = 60;
		choiceText.layer = Main.BUTTON_SPRITE_LAYER;

		choiceText.onReleaseOnceAnywhere = function() {
			StoryUtils.yesNudge([choiceText]);
			Engine.playSound("assets/audio/ui/hover6");
		}
	}

	public static function addChoice(labelText:String, result:Void->Void, config:ButtonConfig=null):Button {
		/// Config
		if (config == null) config = {};
		if (config.enabled == null) config.enabled = true;
		if (config.silent == null) config.silent = false;
		if (config.faCensor == null) config.faCensor = false;
		if (config.hideCost == null) config.hideCost = false;
		if (config.oneTime == null) config.oneTime = false;
		if (config.oneTimeSaved == null) config.oneTimeSaved = false;
		if (config.kinks == null) config.kinks = [];
		if (config.give == null) config.give = [];
		if (config.take == null) config.take = [];
		if (config.req == null) config.req = [];
		if (config.cost == null) config.cost = [];

		if (config.oneTimeSaved) {
			if (GameData.data.examinedStuff.contains(labelText)) return null;
			GameData.data.examinedStuff.push(labelText);
		}

		for (cost in config.cost) {
			config.req.push(cost);
			config.take.push(cost);
		}

		for (i in 0...Std.int(config.req.length/2))
			if (GameData.getItem(config.req[i*2]).amount < config.req[(i*2)+1]) config.enabled = false;

		var b:Button = Buttons.create();
		if (smallButtons) b.padding = 5;
		b.label.setFormat({fontColour: Theme.getColour("choiceText")});

		/// Hub state
		if (uiState == "hubOpen") changeUiState("hub");
		if (uiState == "hub") changeUiState("default");

		if (config.req.length > 0 && !config.hideCost) {
			labelText += "  ";
			for (i in 0...Std.int(config.req.length/2)) {
				labelText+= "<!img:item/"+config.req[i*2]+".png>  ";
				if (config.req[i*2] == "Capsule") labelText += "<!b>" + config.req[(i*2)+1]+"C<!b>";
				else labelText += config.req[i*2] + " <!b>x" + config.req[(i*2)+1] + "<!b>";
				if (i != Std.int(config.req.length/2)-1) labelText += ", ";
			}
		}

		var buttonIndex:Int = choiceButtons.length;
		b.toolTip = config.toolTip;
		b.sprite.onHover = function() {
			if (config.toolTip != null) {
				var parts:Array<String> = config.toolTip.split("\n");
				var title:String = parts[0] != null ? parts[0] : "";
				var body:String = parts[1] != null ? parts[1] : "";
				if (title != "") Tooltip.showOnCursor(title, body);
			}
		}

		b.sprite.onHoverOnce = function() {
			// b.sprite.tintTween(0xFF0000, 0.15, 0.15);
			if (b.enabled) {
				StoryUtils.yesNudge([b.sprite, b.label]);
				Engine.playSound(Theme.getSound("hover"));
			} else {
				Engine.playSound("assets/audio/ui/hoverNope");
			}
			if (GameData.data.theme.choiceBox == "eon")
				b.sprite.applyGlowEffect(0xFF00b4ff, 1, 10, 10, 3)
			else
				b.sprite.applyGlowEffect(Theme.getColour("choiceText"), 0.5, 1, 1, 3);
			showKinks(buttonIndex);
			if (config.onHoverOnce != null && !b.sprite.hovering) config.onHoverOnce();
		}

		b.sprite.onUnHoverOnce = function() {
			b.sprite.clearEffects();
		}

		/// Press animation
		b.sprite.onPressOnce = function() {
			if (!b.enabled) return;
			Engine.cancelTweensOn(b.sprite);
			Engine.tween(b.sprite, {scaleX: 0.95, scaleY: 0.95}, 0.1);
		}
		b.sprite.onReleaseOnceAnywhere = function() {
			Engine.cancelTweensOn(b.sprite);
			Engine.tween(b.sprite, {scaleX: 1, scaleY: 1}, 0.1);
		}

		var kinkList:Array<Kink> = [];
		for (kinkStr in config.kinks) {
			if ((kinkStr == "Scat" || kinkStr == "Vomit") && GameData.isActive("Candy Ring")) kinkStr = "Foodplay";
			if ((kinkStr == "Cub" || kinkStr == "Toddler" || kinkStr == "Baby")) config.faCensor = true;  
			kinkList.push({name: kinkStr, desc: ""});
		}
		kinks.push(kinkList);

		if (config.faCensor) {
			if (onFA()) {
				labelText += " [Cub Censor]";
				config.enabled = false;
			}
		}

		if (config.silent) b.silent = true;

		if (!config.enabled) b.disable();

		/// Setup button
		b.label.setText(labelText);
		b.imagePath = Theme.getPath("choiceButton");
		b.sprite.layer = BUTTON_SPRITE_LAYER;
		b.label.layer = BUTTON_TEXT_LAYER;

		b.result = function() {
			for (i in 0...Std.int(config.give.length/2))
				GameData.addToItem(config.give[i*2], config.give[i*2+1]);

			for (i in 0...Std.int(config.take.length/2))
				GameData.addToItem(config.take[i*2], -config.take[i*2+1]);

			if (result != null) result();
			if (config.oneTime || config.oneTimeSaved) b.destroy();
		}

		b.redraw();

		///	Position button
		if (choiceButtons.length == 0) {
			b.sprite.x = choiceBox.x + 10;
			b.sprite.y = choiceBox.y + 10;
		} else {
			var lastButton:Button = choiceButtons[choiceButtons.length-1];
			b.sprite.x = lastButton.sprite.x + lastButton.sprite.width + 10;
			b.sprite.y = lastButton.sprite.y;
			if (b.sprite.x + b.sprite.width > choiceBox.width - 10) {
				b.sprite.x = choiceBox.x + 10;
				b.sprite.y = lastButton.sprite.y + lastButton.sprite.height + 5;
			}
		}

		/// Add button
		b.align();
		choiceButtons.push(b);
		return b;
	}

	public static function showKinks(index:Int):Void {
		if (kinks[index] == null) return;

		for (b in kinkButtons) b.visible = false;

		for (i in 0...kinks[index].length) {
			kinkButtons[i].pixelPerfectOverlapping = false;
			kinkButtons[i].visible = true;
			kinkButtons[i].setupAnimated("assets/img/kink/"+kinks[index][i].name+".png");
			if (i == 0) kinkButtons[i].x = 2;
			else kinkButtons[i].x = kinkButtons[i-1].x+kinkButtons[i-1].width + 2;
			kinkButtons[i].y = choiceBox.y - kinkButtons[i].height - 4;
			kinkButtons[i].visible = true;
			Engine.tween(kinkButtons[i], {y: choiceBox.y - kinkButtons[i].height - 2}, 0.2);
			kinkButtons[i].onHover = function() {
				if (kinkButtons[i].visible)
					Tooltip.showOnCursor(kinks[index][i].name, "");
			}
			kinkButtons[i].onHoverOnce = function() {
				if (kinkButtons[i].visible)
					Engine.playSound("assets/audio/ui/hover2");
					StoryUtils.yesNudge([kinkButtons[i]]);
					kinkButtons[i].applyGlowEffect(Theme.getColour("sliderBg"), 0.5, 10, 10);
			}
			kinkButtons[i].onUnHoverOnce = function() {
				kinkButtons[i].clearEffects();
			}
			kinkButtons[i].update();
		}
	}

	public static function halfWidthText():Void {
		textWidthChanged = true;
		mainText.setFormat({wordWrapWidth: Std.int((Engine.width-40)/2)});
	}

	public static function clear():Void {
		clearTemp();
		clearChoices();
		clearText();
		Swf.clearMovies();
		StoryExtern.postPassage();
	}

	public static function clearTemp():Void {
		while (tempSprites.length > 0) tempSprites.pop().destroy();
		while (tempUpdateHooks.length > 0) tempClearHooks.pop();

		while (tempClearHooks.length > 0)
			tempClearHooks.pop()();
	}

	public static function clearChoices():Void {
		for (k in kinkButtons) k.visible = false;
		kinks = [];

		if (choiceText != null) {
			enableCursorKeys();
			choiceText.destroy();
			choiceText = null;
		}
		for (b in choiceButtons) b.destroy();
		choiceButtons = [];

		if (!Mynt.active && choiceBox.alpha == 0) showChoices();
		smallButtons = false;

		highlightedButton = null;
		if (cursor.visible) Engine.tween(cursor, {alpha: 0}, 0.25, {onComplete: function() {cursor.visible = false;}});
	}

	public static function clearText():Void {
		if (textWidthChanged) {
			textWidthChanged = false;
			mainText.setFormat({wordWrapWidth: Engine.width-40});
		}

		storyText = "";
		mainText.setText("", true);
		mainText.scrollTo(0);
		setScroll(0);
	}

	public static function hookClear(fn:Void->Void):Void {
		tempClearHooks.push(fn);
	}

	public static function hookUpdate(fn:Void->Void):Void {
		tempUpdateHooks.push(fn);
	}

	public static function changeUiState(state:String):Void {
		/// Leaving
	if (uiState == "hubOpen") {
			if (GameData.data.theme.playerMenu == "scrap" || GameData.data.theme.playerMenu == "myrrh") {
				Engine.playSound(Theme.getSound("menuClose"), "menuClose");
			} else {
				Engine.playSound(Theme.getSound("menuClose"), "menuClose", {loops: 2});
			}
			
			Engine.tween(itemMenu, {y: Engine.height}, 0.2, {startDelay: 0.2, ease: QUINT_IN});
			Engine.tween(actionMenu, {x: -actionMenu.width}, 0.2, {ease: QUINT_IN});
			Engine.tween(mainText, {alpha: 1}, 0.2);
		}

		uiState = state;

		/// Entering
		if (uiState == "default") {
			for (sprite in hubButtons) sprite.deactivate();
		}

		else if (uiState == "hub") {
			clearChoices();

			for (sprite in hubMenus) {
				sprite.activate();
			}
			for (sprite in hubButtons) {
				sprite.activate();
			}

			for (s in itemButtons) s.destroy();
			for (s in itemSprites) s.destroy();
			for (b in actionButtons) b.destroy();
			for (b in roamButtons) b.destroy();

			itemSprites = [];
			itemButtons = [];
			for (item in GameData.data.items) {
				var itemButton:MintSprite = new MintSprite();
				itemButton.layer = BUTTON_SPRITE_LAYER;
				itemButton.pixelPerfectOverlapping = false;
				itemButton.setupAnimated(Theme.getPath("itemSlot"+(item.active?"Toggled":"")));

				itemButton.onReleaseOnce = function() {
					StaticCallbacks.itemCall(item.label);
					if (itemButton.exists) itemButton.setupAnimated(Theme.getPath("itemSlot"+(item.active?"Toggled":"")));
				}
				itemButton.onHover = function() {
					if (item.amount > 0) Tooltip.showOnCursor(item.label+" <!b>x"+item.amount+"<!b>", GameData.itemDescs[item.label]);
				}
				itemButtons.push(itemButton);

				var itemSprite = new MintSprite();
				itemSprite.layer = BUTTON_SPRITE_LAYER;
				itemSprite.setupImage("assets/img/item/"+item.label+".png");
				itemSprites.push(itemSprite);

				if (item.amount <= 0) {
					itemSprite.visible = false;
					itemButton.visible = false;
				}
			}

			actionButtons = [];
			for (action in GameData.data.actions) {
				if (action.hub != GameData.data.currentHub && action.hub != "global") continue;
				var b:Button = Buttons.create();
				b.padding = 5;
				b.label.setFormat({fontColour: Theme.getColour("playerMenu")});
				b.label.setText(action.label);
				b.result = StaticCallbacks.actionPlaceCall.bind(action.label);
				b.imagePath = "assets/img/hud/"+GameData.data.theme.playerMenu+"/choiceButton.png";
				b.label.layer = BUTTON_TEXT_LAYER;
				b.sprite.layer = BUTTON_SPRITE_LAYER;
				actionButtons.push(b);
				b.redraw();
			}

			roamButtons = [];
			for (place in GameData.data.places) {
				if (place.hub != GameData.data.currentHub && place.hub != "global") continue;
				var b:Button = Buttons.create();
				b.padding = 5;
				b.label.setFormat({fontColour: Theme.getColour("playerMenu")});
				b.label.setText(place.label);
				b.result = StaticCallbacks.actionPlaceCall.bind(place.label);
				b.imagePath = "assets/img/hud/"+GameData.data.theme.playerMenu+"/choiceButton.png";
				b.label.layer = BUTTON_TEXT_LAYER;
				b.sprite.layer = BUTTON_SPRITE_LAYER;
				roamButtons.push(b);
				b.redraw();
			}
		}

		else if (uiState == "hubOpen") {
			if (GameData.data.theme.playerMenu == "scrap" || GameData.data.theme.playerMenu == "myrrh") {
				Engine.playSound(Theme.getSound("menuOpen"), "menuOpen");
			} else {
				Engine.playSound(Theme.getSound("menuOpen"), "menuOpen", {loops: 2});
			}
			actionMenu.alpha = 0;
			Engine.tween(itemMenu, {y: 0}, 0.2, {ease: QUINT_OUT});
			Engine.tween(actionMenu, {x: itemMenu.width}, 0.2, {ease: QUINT_OUT, startDelay: 0.2});
			Engine.tween(actionMenu, {alpha: 1}, 0.1, {ease: QUINT_OUT, startDelay: 0.3});
			Engine.tween(mainText, {alpha: 0}, 0.2);
		}
	}

	public static function onFA():Bool {
		if (Engine.getContainerUrl() == null) return false;
		var res:Bool = Engine.getContainerUrl().indexOf("d.facdn.net") != -1;
		if (GameData.data.gameSettings.get("Censor Cub")) res = true;
		return res;
	}

	public static function enablePause():Void {
		if (GameData.data.daydream) return;
		for (button in [pauseButton, mapButton, loadButton, saveButton, shopButton, skinsButton, devButton, secretButton])
			showTopButton(button);
		Pause.canPause = true;
	}

	public static function disablePause():Void {
		for (button in [pauseButton, mapButton, loadButton, saveButton, shopButton, skinsButton, devButton, secretButton])
			hideTopButton(button);
		Pause.canPause = false;
	}

	public static function getStoryText():String {
		return storyText;
	}

	public static var print:Dynamic->Void = Console.print;
	public static var warn:Dynamic->Void = Console.warn;
	public static var error:Dynamic->Void = Console.error;

	public static function resetTheme():Void {
		if (Mynt.active) Mynt.resetTheme();

		topBar.setupAnimated(Theme.getPath("topBar"));
		choiceBox.setupAnimated(Theme.getPath("choiceBox"));
		/* dropbox.resetTheme(); */

		divider.setupAnimated(Theme.getPath("divider"));
		playerButton.setupAnimated(Theme.getPath("playerButton"));
		exploreButton.setupAnimated(Theme.getPath("exploreButton"));

		itemMenu.setupAnimated(Theme.getPath("itemMenu"));
		actionMenu.setupAnimated(Theme.getPath("actionMenu"));
		itemHeader.setupAnimated(Theme.getPath("itemHeader"));
		actionHeader.setupAnimated(Theme.getPath("actionHeader"));
		roamHeader.setupAnimated(Theme.getPath("roamHeader"));

		for (i in 0...itemButtons.length) {
			var item:Item = GameData.data.items[i];
			itemButtons[i].setupAnimated(Theme.getPath("itemSlot"+(item.active?"Toggled":"")));
		}

		for (b in actionButtons) {
			b.imagePath = Theme.getPath("choiceButton");
			b.label.setFormat({fontColour: Theme.getColour("playerMenu")});
			b.redraw();
		}
		for (b in roamButtons) {
			b.imagePath = Theme.getPath("choiceButton");
			b.label.setFormat({fontColour: Theme.getColour("playerMenu")});
			b.redraw();
		}
		for (b in choiceButtons) {
			b.imagePath = Theme.getPath("choiceButton");
			b.label.setFormat({fontColour: Theme.getColour("choiceText")});
			b.redraw();
		}

		mainText.setFormat({fontColour: Theme.getColour("mainText")});
		locationText.setFormat({fontColour: Theme.getColour("locationText")});

		background.setupAnimated(Theme.getPath("background"));
		pauseButton.setupAnimated(Theme.getPath("pauseButton"));
		mapButton.setupAnimated(Theme.getPath("mapButton"));
		loadButton.setupAnimated(Theme.getPath("loadButton"));
		saveButton.setupAnimated(Theme.getPath("saveButton"));
		shopButton.setupAnimated(Theme.getPath("shopButton"));
		skinsButton.setupAnimated(Theme.getPath("skinsButton"));
		devButton.setupAnimated(Theme.getPath("devButton"));

		if (Pause.isPaused()) {
			Pause.togglePause();
			Pause.togglePause();
		}

		var hoverAnimSprites:Array<MintSprite> = [pauseButton, mapButton, loadButton, saveButton, shopButton, skinsButton, devButton, itemHeader, actionHeader, roamHeader, exploreButton];
		for (b in hoverAnimSprites) {
			if (b == null) continue;
			b.playing = false;
			b.onHoverOnce = function() {
				if (b != exploreButton && b != itemHeader && b != actionHeader && b != roamHeader) {
					Engine.playSound("assets/audio/ui/hover3");
					b.applyGlowEffect(Theme.getColour("locationText"), 0.8, 1, 1, 5);
				}
				b.playTill(b.totalFrames-1);
			}
			b.onUnHoverOnce = function() {
				b.clearEffects();
				b.gotoFrame(0, true);
			}
		}
	}

	public static function addText(permanent:Bool=false):MintText {
		var tf:MintText = new MintText();
		prepareSprite(tf, permanent);
		return tf;
	}

	public static function openLoad():Void {
		Pause.menuLoad();
	}

	public static function installClassFields(classes:Array<Class<Dynamic>>):Void {
		for (c in classes) {
			var className:String = Type.getClassName(c).split(".").last();
			interp.variables.set(className, c);
			modInterp.variables.set(className, c);
		}
	}

	public static function modExec(haxe:String):Void {
		inMod = true;
		try {
			modInterp.execute(modParser.parseString(haxe));
		} catch (e:hscript.Expr.Error) {
			warn(e);
		}
	}

	public static function exec(haxe:String, canCrash:Bool=true):Void {
		try {
			interp.execute(parser.parseString(haxe));
		} catch (e:hscript.Expr.Error) {
			if (canCrash) error(e);
			else warn(e);
		}
	}

	public static function prepareSprite(sprite:MintSprite, permanent:Bool=false):Void {
		sprite.layer = ADD_SPRITE_LAYER;
		if (!permanent) tempSprites.push(sprite);
	}

	public static function addSprite(path:String, permanent:Bool=false):MintSprite {
		if (inMod) path = "external_"+path;
		var s:MintSprite = new MintSprite();
		prepareSprite(s, permanent);
		s.setupAnimated(path);
		return s;
	}

	public static function addRectSprite(width:Float, height:Float, colour:Int, permanent:Bool=false):MintSprite {
		var s:MintSprite = new MintSprite();
		prepareSprite(s, permanent);
		s.setupRect(width, height, colour);
		return s;
	}

	public static function startHub(hubName:String):Void {
		GameData.data.currentHub = hubName;
		enablePause();
		Main.playerButton.mouseEnabled = true;
		Main.exploreButton.mouseEnabled = true;
		changeUiState("hub");
		StaticCallbacks.goHubCallback();
	}

	public static function getTimer():Float { return Engine.currentTime; }
	public static function onGainFocusOnce(fn:Void->Void):Void { tempGainFocusHooks.push(fn); }
	public static function onLoseFocusOnce(fn:Void->Void):Void { tempLoseFocusHooks.push(fn); }
	public static function makeSmallButtons():Void { smallButtons = true; }
	public static function pauseGoPrev():Void { Pause.pauseGoesPrev = true; }
	public static function pauseNoGoPrev():Void { Pause.pauseGoesPrev = false; }
	public static function pauseIsGoingPrev():Bool { return Pause.pauseGoesPrev; }
	public static function getFps():Float { return fps; };

	public static function returnToPrev():Void {
		exec(GameData.data.prevHaxe);
		Pause.pauseGoesPrev = false;
	}

	public static function setScroll(percent:Float):Void {
		var min:Float = scrollingText.y;
		var max:Float = scrollingText.y+scrollingText.height-scrollBar.height;
		var pos:Float = percent*(max-min)+min;
		refreshScrollBar();
		scrollBar.y = pos;
	}

	public static function update():Void {
#if !debug
		try {
#end
			frameCount++;
			elapsed = Engine.currentTime - lastTime;
			lastTime = Engine.currentTime;
			if (elapsed != 0) {
				var smooth:Float = 0.5;
				fps = (fps*smooth) + ((1/elapsed) * (1.0-smooth));
			}

			if (!hasFocus && Engine.hasFocus)
				while (tempGainFocusHooks.length > 0)
					tempGainFocusHooks.pop()();

			if (hasFocus && !Engine.hasFocus)
				while (tempLoseFocusHooks.length > 0)
					tempLoseFocusHooks.pop()();

			hasFocus = Engine.hasFocus;

			for (fn in tempUpdateHooks) fn();

			/// Hub menu layout
			if (itemMenu != null && itemMenu.active) {
				itemHeader.x = itemMenu.x;
				itemHeader.y = itemMenu.y;

				for (i in 0...itemButtons.length) {
					var b:MintSprite = itemButtons[i];
					b.x = itemHeader.x + 20 + (i%4)*(b.width + 10);
					b.y = itemHeader.y + itemHeader.height + 10 + (Std.int(i/4))*(b.height+10);

					var s:MintSprite = itemSprites[i];
					s.x = b.x + b.width/2 - s.width/2;
					s.y = b.y + b.height/2 - s.height/2;
				}

				actionHeader.x = actionMenu.x;
				actionHeader.y = actionMenu.y + topBar.height;

				var underActions:Float = actionHeader.y + actionHeader.height;
				for (i in 0...actionButtons.length) {
					var b:MintSprite = actionButtons[i].sprite;
					b.x = actionHeader.x + (actionHeader.width-b.width)/2;
					b.y = actionHeader.y + actionHeader.height + (b.height+5)*i;
					actionButtons[i].align();
					underActions = b.y + b.height + 10;
				}

				roamHeader.x = actionMenu.x;
				roamHeader.y = underActions;

				for (i in 0...roamButtons.length) {
					var b:MintSprite = roamButtons[i].sprite;
					b.x = roamHeader.x + (roamHeader.width-b.width)/2;
					b.y = roamHeader.y + roamHeader.height + (b.height+5)*i;
					roamButtons[i].align();
				}
			}

			/// Other input
			if (Engine.mouseWheel != 0 && !Pause.isPaused()) {
				scrollingText.scroll(-Engine.mouseWheel);
				setScroll(scrollingText.vscroll/scrollingText.maxVScroll);
			}

			if (scrollBar.holding) {
				var min:Float = scrollingText.y;
				var max:Float = scrollingText.y+scrollingText.height-scrollBar.height;
				var pos:Float = Engine.mouse.y - scrollBar.holdPivot.y;
				pos = Math.max(min, pos);
				pos = Math.min(max, pos);
				scrollBar.y = pos;

				var percent:Float = (scrollBar.y-min)/(max-min);
				scrollingText.scrollTo(Math.round(percent*scrollingText.maxVScroll));
			}

			locationText.x = 10 + (actionHeader.x > 0 ? actionHeader.x : 0);
			Mynt.update(elapsed);
			Camera.update(elapsed);
			Sliders.update(elapsed);
			Tooltip.update(elapsed);
			Console.update(elapsed);
			Emitters.update(elapsed);
			Tilemaps.update(elapsed);
			ComplexAnims.update(elapsed);

			var wasDirty:Bool = mainText.dirty;
			for (sprite in MintSprite.mintSprites) sprite.update(elapsed);
			if (wasDirty) refreshScrollBar();
#if !debug
		} catch (e:Dynamic) {
			Console.error(e);
		}
#end
	}
}

typedef ButtonConfig = {
	?enabled:Bool,
	?silent:Bool,
	?faCensor:Bool,
	?kinks:Array<String>,
	?toolTip:String,
	?give:Array<Dynamic>,
	?take:Array<Dynamic>,
	?req:Array<Dynamic>,
	?cost:Array<Dynamic>,
	?hideCost:Bool,
	?onHoverOnce:Void->Void,
	?oneTime:Bool,
	?oneTimeSaved:Bool
}

typedef Kink = {
	name:String,
	desc:String
}
