package;

class Pause
{
	public static var pausedLayers:Array<Bool> = [];

	public static var canPause:Bool = true;
	public static var inMenuLoad:Bool = false;
	public static var pauseGoesPrev:Bool = false;

	private static var myntSecret:MintSprite;
	private static var sliders:Array<Slider>;
	private static var sliderBackground:MintSprite;

	private static var masterSlider:Slider;
	private static var musicSlider:Slider;
	private static var effectSlider:Slider;

	private static var settingsButtons:Array<Button> = [];

	private static var archbishopSlot:MintSprite;

	public static function menuLoad():Void {
		if (!isPaused()) {
			inMenuLoad = true;
			pause();
			createMenu();
		}
	}

	public static function togglePause():Void {
		if (!StaticCallbacks.pauseClickedCallback()) return;
		if (pauseGoesPrev) {
			Main.returnToPrev();
			return;
		}
		if (!canPause) return;

		if (!isPaused()) {
			for (hubButton in [Main.mapButton, Main.loadButton, Main.saveButton, Main.devButton, Main.skinsButton, Main.shopButton])
				Main.hideTopButton(hubButton);
			pause();
			createMenu();
		} else {
			for (hubButton in [Main.mapButton, Main.loadButton, Main.saveButton, Main.devButton, Main.skinsButton, Main.shopButton])
				Main.showTopButton(hubButton);
			unpause();
			destroyMenu();
			inMenuLoad = false;
		}
	}

	public static function pause(layer:Int=0):Void {
		if (pausedLayers[layer] == true) return;
		pausedLayers[layer] = true;

		for (s in MintSprite.mintSprites) {
			if (s.pauseLayer == layer) {
				s.pauseTweens();
				s.isPaused = true;
			}
		}

		if (layer == 0) Engine.pauseTimers();
	}

	public static function unpause(layer:Int=0):Void {
		if (pausedLayers[layer] == false) return;
		pausedLayers[layer] = false;

		for (s in MintSprite.mintSprites) {
			if (s.pauseLayer == layer) {
				s.resumeTweens();
				s.isPaused = false;
			}
		}

		if (layer == 0) Engine.resumeTimers();
	}

	public static function createMenu():Void {
		if (Main.uiState == "hubOpen") Main.changeUiState("hub");
		Main.hideChoices();

		MintSprite.defaultLayer = Main.PAUSE_MENU_LAYER;
		Mynt.show();
		MintSprite.defaultLayer = 0;

		var justClickedMyntSecret:Bool = false;
		myntSecret = Main.addRectSprite(270, 250, 0);
		myntSecret.alpha = 0;
		myntSecret.x = StaticExtern.GAME_WIDTH/2-myntSecret.width/2;
		myntSecret.y = StaticExtern.GAME_HEIGHT/2-myntSecret.height/2;
		myntSecret.onReleaseOnce = function() {
			if (justClickedMyntSecret) return;
			justClickedMyntSecret = true;
			Mynt.queueTransition(StaticExtern.pickOne(["lewd", "dizzy", "tilde", "blush"]));
			Mynt.queueDelay(3);
			Mynt.queueTransition("default");
			Mynt.queueCall(function() { justClickedMyntSecret = false; });
			Mynt.proceed();
			Engine.playSound("assets/audio/mynt/"+StaticExtern.pickOne(["questionmew", "ogosh", "okie"]), "mew");
		}

		/// Archbishop save
		archbishopSlot = new MintSprite("assets/img/effect/archbishopSave.png");
		archbishopSlot.pauseLayer = Main.OPTIONS_PAUSE_LAYER;
		archbishopSlot.x = 20;
		archbishopSlot.y = 57;
		archbishopSlot.layer = Main.PAUSE_MENU_BUTTON_SPRITE_LAYER;

		archbishopSlot.onReleaseOnce = function () {
			togglePause();
			Engine.playSound("assets/audio/ui/tak", "tak");
			MyntScenes.myntFakePrep("intro");
		}

		if (GameData.data.myntFakeDone) {
			archbishopSlot.visible = false;
			archbishopSlot.onReleaseOnce = null;
		}

		/// Sliders
		sliderBackground = Main.addRectSprite(240, 210, Theme.getColour("myntbg"));
		sliderBackground.applyGlowEffect(Theme.getColour("mynt"));
		sliderBackground.x = 10;
		sliderBackground.y = StaticExtern.GAME_HEIGHT-10-sliderBackground.height;
		sliderBackground.layer = 56;

		sliders = [];
		var sliderWidth:Float = 200;

		masterSlider = Sliders.create(sliderWidth, Engine.userVolumeMod, function() {
			Engine.userVolumeMod = masterSlider.percent;
			Engine.resetGlobalVolume();
			masterSlider.label.setText("Master Volume "+Math.floor(masterSlider.percent*100)+"%");
		});
		sliders.push(masterSlider);

		masterSlider.bar.x = sliderBackground.x+sliderBackground.width/2-masterSlider.width/2;
		masterSlider.bar.y = sliderBackground.y+35;

		musicSlider = Sliders.create(sliderWidth, Engine.musicVolume, function() {
			Engine.musicVolume = musicSlider.percent;
			Engine.resetGlobalVolume();
			musicSlider.label.setText("Music/Ambience "+Math.floor(musicSlider.percent*100)+"%");
		});
		sliders.push(musicSlider);

		musicSlider.bar.x = masterSlider.bar.x;
		musicSlider.bar.y = masterSlider.bar.y + 70;

		effectSlider = Sliders.create(sliderWidth, Engine.effectVolume, function() {
			Engine.effectVolume = effectSlider.percent;
			Engine.resetGlobalVolume();
			effectSlider.label.setText("Effects "+Math.floor(effectSlider.percent*100)+"%");
		});
		sliders.push(effectSlider);

		effectSlider.bar.x = musicSlider.bar.x;
		effectSlider.bar.y = musicSlider.bar.y + 70;

		for (slider in sliders) {
			slider.bar.pauseLayer = 57;
			slider.handle.pauseLayer = 57;
			slider.bar.layer = 58;
			slider.handle.layer = 58;
			slider.label.layer = 58;
			Sliders.align(slider);
		}

		/// Settings
		var settingsMap = GameData.data.gameSettings;

		var mapKeys:Array<String> = [];
		for (key in settingsMap.keys()) mapKeys.push(key);

		mapKeys.sort(function(a:String, b:String):Int {
			a = a.toLowerCase();
			b = b.toLowerCase();
			if (a < b) return -1;
			if (a > b) return 1;
			return 0;
		});

		function refreshSettings():Void {
			for (btn in settingsButtons)
				for (key in mapKeys)
					if (btn.label.rawText.contains(key))
					btn.sprite.tint = settingsMap[key]?0x8000FF00:0x80FF0000;
		}

		function settingToggle(key:String):Void {
			settingsMap[key] = !settingsMap[key];
			refreshSettings();
		}

		for (key in mapKeys) {
			Main.print("Key: "+key);

			var b:Button = Buttons.create();
			b.silent = true;
			b.imagePath = "assets/img/hud/"+GameData.data.theme.mynt+"/choiceButton.png";
			b.label.setFormat({fontColour: Theme.getColour("mynt")});
			b.label.setText("<!20px>"+key+"<!20px>");
			b.redraw();

			b.sprite.x = 10;
			b.sprite.y = StaticExtern.GAME_HEIGHT/3.5 + (b.sprite.height + 10)*(settingsButtons.length - 1);
			b.align();

			b.sprite.onHoverOnce = function() {
				StoryUtils.yesNudge([b.sprite, b.label]);
				Engine.playSound("assets/audio/ui/hover1");
			}

			b.sprite.onHover = function() {
				if (key == "Fast World Map Transition") Tooltip.showOnCursor("The area sprites drop faster when you enter the world map.");
				if (key == "Journal Kink Symbols") Tooltip.showOnCursor("Turning Daydream Journal kink symbols off can reduce lag.\nKink text is unaffected.");
				if (key == "World Map Glows") Tooltip.showOnCursor("Reduces lag by removing the glow effect from world map sprites.");
				if (key == "Censor Cub") Tooltip.showOnCursor("Disables all choices that lead to sex scenes with underaged characters.\n<!b>LOCKS STORY CONTENT<!b>");
			}

			b.label.pauseLayer = Main.OPTIONS_PAUSE_LAYER;
			b.sprite.pauseLayer = Main.OPTIONS_PAUSE_LAYER;
			b.result = function() {
				Main.msg("<!b>"+key+"<!b> "+(settingsMap[key]?"disabled.":"enabled"+(key == "Censor Cub" ? ". :(" : Math.random() <= 0.1?"~":"!")), true);
				if (key == "Censor Cub" && !settingsMap[key])
					Engine.playSound("assets/audio/secret/censor")
				else
					Engine.playSound("assets/audio/"+(settingsMap[key]?"environment/bustBJ":"ui/hover6"));

				StoryUtils.yesNudge([b.sprite, b.label]);
				Engine.playSound("assets/audio/ui/hover1");
				settingToggle(key);
			}
			//buttons.push(b);
			settingsButtons.push(b);
		}

		refreshSettings();

		for (b in settingsButtons) {
			b.sprite.layer = Main.PAUSE_MENU_BUTTON_SPRITE_LAYER;
			b.label.layer = Main.PAUSE_MENU_BUTTON_TEXT_LAYER;
		}
	}

	public static function destroyMenu():Void {
		Main.showChoices();
		Mynt.hide();
		archbishopSlot.destroy();
		sliderBackground.destroy();
		myntSecret.destroy();
		Sliders.destroy(masterSlider);
		Sliders.destroy(musicSlider);
		Sliders.destroy(effectSlider);
		for (b in settingsButtons) b.destroy();
		settingsButtons = [];
	}

	public static function isPaused(layer:Int=0):Bool {
		if (pausedLayers.length <= layer) return false;
		else return pausedLayers[layer];
	}

	public static function refresh():Void {
		if (!isPaused()) return;

		if (inMenuLoad) {
			unpause();
			menuLoad();
		} else { 
			destroyMenu();
			createMenu();
		}
	}
}
