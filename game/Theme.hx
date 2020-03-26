package;

class Theme {
	public static var themes:Array<String> = ["default", "zeit", "dawn", "dead", "taro", "geist", "taffy", "trickster", "stinky", "stranger", "suave", "eon", "myrrh", "scrap", "enginetic", "freak"];
	public static var themeParts:Array<String> = ["playerMenu", "background", "choiceBox", "topBar", "mynt"];
	private static var engEmit:Emitter;
	private static var emitTimer:Int;
	private static var engineticParticlesOn:Bool = false;
	private static var engineticParticlesInited:Bool = false;

	private static var themeToColour:Map<String, {highContrast:Int, lowContrast:Int}> = [
		"default" => {highContrast: 0xFF2f32a0, lowContrast: 0xFFffe8e8},
		"dead" => {highContrast: 0xFFffffff, lowContrast: 0xFF5d5c5c},
		"taro" => {highContrast: 0xFFe198ff, lowContrast: 0xFF120927},
		"dawn" => {highContrast: 0xFFffffff, lowContrast: 0xFFd5827b},
		"geist" => {highContrast: 0xFF571ca1, lowContrast: 0xFFaefaff},
		"stinky" => {highContrast: 0xFF542505, lowContrast: 0xFFffc693},
		"taffy" => {highContrast: 0xFF0D5096, lowContrast: 0xFFd9feff},
		"trickster" => {highContrast: 0xFF1989e9, lowContrast: 0xFFffe0fc},
		"zeit" => {highContrast: 0xFF2e1212, lowContrast: 0xFFFFFFFF},
		"stranger" => {highContrast: 0xFFe6b738, lowContrast: 0xFF440465},
		"suave" => {highContrast: 0xFF455ab6, lowContrast: 0xFFe7e0df},
		"eon" => {highContrast: 0xFF00b4ff, lowContrast: 0xFF191919},
		"myrrh" => {highContrast: 0xFF0e3a02, lowContrast: 0xFFfbffc1},
		"scrap" => {highContrast: 0xFFF0F0F0, lowContrast: 0xFF868686},
		"enginetic" => {highContrast: 0xFF7cff9b, lowContrast: 0xFF18505d},
		"freak" => {highContrast: 0xFF24baad, lowContrast: 0xFF03083a}
	];

	public static function setupEnginetic():Void {
		if (!engineticParticlesInited) {
			engineticParticlesInited = true;
			engEmit = StaticExtern.emitterCreate("spritesheet/glowParticles");
			emitTimer = Engine.timer(0.05, function() {
				if (engineticParticlesOn) {
					StaticExtern.emitterEmit(engEmit, engEmit.sprite.frameNames[0]);
				}
			}, 9999999);
			engineticParticlesOn = true;
			engEmit.sprite.layer = Main.CHOICE_BOX_LAYER+1;
			engEmit.position.minX = 0;
			engEmit.position.minY = StaticExtern.GAME_HEIGHT+50;
			engEmit.position.maxX = StaticExtern.GAME_WIDTH-5;
			engEmit.position.maxY = StaticExtern.GAME_HEIGHT+70;
			engEmit.speed.min = 1;
			engEmit.speed.max = 2;
			engEmit.angle.min = 60;
			engEmit.angle.max = 120;
			engEmit.lifeSpan.min = 1;
			engEmit.lifeSpan.max = 2.5;
		}

		if (GameData.data.theme.choiceBox == "enginetic")
			engineticParticlesOn = true
		else
			engineticParticlesOn = false;
	}

	public static function equipUi(theme:String, makeSound:Bool=true):Void {
		equipUiPart("choiceBox", theme, false);
		equipUiPart("playerMenu", theme, false);
		equipUiPart("background", theme, false);
		equipUiPart("topBar", theme, false);
		equipUiPart("mynt", theme, false);
		if (makeSound) Engine.playSound("assets/audio/ui/equipUi");
		Main.resetTheme();
		setupEnginetic();
	}

	public static function equipUiPart(part:String, theme:String, updateNow:Bool=true):Void {
		var partUnlocked:Bool = GameData.data.themeUnlocks.indexOf(theme+"-"+part) != -1;
		Engine.playSound("assets/audio/ui/equipUi");
		if (partUnlocked) Reflect.setProperty(GameData.data.theme, part, theme);
		if (updateNow) Main.resetTheme();
		setupEnginetic();
	}

	public static function isUnlocked(theme:String, part:String):Bool {
		// trace("Looking for: "+theme+"-"+part+"  "+GameData.data.themeUnlocks.contains(theme+"-"+part));
		if (part == "all") {
			for (iPart in themeParts)
				if (isUnlocked(theme, iPart))
					return true;
			return false;
		}
		return GameData.data.themeUnlocks.contains(theme+"-"+part);
	}

	public static function unlockUi(theme:String, part:String, makeSound:Bool=true):Void {
		if (theme != "default") Engine.timer(0.5, StoryUtils.unlockTopButton.bind(Main.skinsButton));
		var themes:Array<String> = cast GameData.data.themeUnlocks;
		if (makeSound) Engine.playSound("assets/audio/ui/unlockUI");
		if (part == "all") {
			for (it in themeParts) unlockUi(theme, it, false);
		} else {
			var entry:String = theme+"-"+part;
			if (themes.indexOf(entry) == -1) themes.push(entry);
		}
	}

	public static function addUiChoice(themeName:String, themePart:String=""):Void {
		if (themePart != "") {
			var themePartText:Map<String, String> = [
				"choiceBox" => "Choice Box",
				"background" => "Background",
				"playerMenu" => "Player Menu",
				"topBar" => "Top Bar",
				"mynt" => "Mynt"
			];
			Main.msg("Unlocked Theme Part: <!b>"+themeName.toTitleCase()+"<!b> — "+themePartText.get(themePart)+" <!img:hud/"+themeName+"/choiceButton.png>", true);
			unlockUi(themeName, themePart);
			Main.addChoice("Equip "+themeName.toTitleCase()+" — "+themePartText.get(themePart)+".", equipUiPart.bind(themePart, themeName));

		} else if (!GameData.getThemeUnlocks().contains(themeName+"-choiceBox")) {
			Main.msg("Unlocked Theme: <!b>"+themeName.toTitleCase()+"!<!b> <!img:hud/"+themeName+"/choiceButton.png>", true);
			unlockUi(themeName, "all");
			Main.addChoice("Equip "+themeName.toTitleCase()+".", equipUi.bind(themeName));
		}
	}

	public static function unlockRandomPiece(themeName:String):Void {
		Engine.timer(0.5, StoryUtils.unlockTopButton.bind(Main.skinsButton));
		var piecesLeft:Array<String> = ["playerMenu", "background", "choiceBox", "topBar", "mynt"];
		for (i in 0...5) {
			var removedPiece:String = piecesLeft.pop();
			if (!isUnlocked(themeName, removedPiece)) piecesLeft.unshift(removedPiece);
		}

		if (piecesLeft.length > 0) {
			var chosenPart:String = StaticExtern.pickOne(piecesLeft);
			Theme.addUiChoice(themeName, chosenPart);
		}
	}

	public static function getPath(piece:String):String {
		if (piece == "background") return "assets/img/hud/"+GameData.data.theme.background+"/background.png";
		if (piece == "choiceBox") return "assets/img/hud/"+GameData.data.theme.choiceBox+"/choiceBox.png";
		if (piece == "topBar") return "assets/img/hud/"+GameData.data.theme.topBar+"/topBar.png";
		if (piece == "choiceButton") return "assets/img/hud/"+GameData.data.theme.choiceBox+"/choiceButton.png";

		if (piece == "divider") return "assets/img/hud/"+GameData.data.theme.choiceBox+"/divider.png";
		if (piece == "playerButton") return "assets/img/hud/"+GameData.data.theme.choiceBox+"/player.png";
		if (piece == "exploreButton") return "assets/img/hud/"+GameData.data.theme.choiceBox+"/explore.png";

		if (piece == "itemMenu") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/itemMenu.png";
		if (piece == "actionMenu") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/actionMenu.png";

		if (piece == "itemHeader") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/itemHeader.png";
		if (piece == "actionHeader") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/actionHeader.png";
		if (piece == "roamHeader") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/roamHeader.png";

		if (piece == "pauseButton") {
			var pausePath:String = "assets/img/hud/"+GameData.data.theme.topBar+"/pauseButton";
			if (GameData.data.theme.topBar == "default") {
				if (GameData.data.myntColour == "red") pausePath += "Red.png";
				if (GameData.data.myntColour == "blue") pausePath += "Blue.png";
				if (GameData.data.myntColour == "mint") pausePath += "Mint.png";
			} else {
				pausePath += ".png";
			}
			return pausePath;
		}
		if (piece == "mapButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/mapButton.png";
		if (piece == "loadButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/loadButton.png";
		if (piece == "saveButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/saveButton.png";
		if (piece == "shopButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/shopButton.png";
		if (piece == "skinsButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/skinsButton.png";
		if (piece == "devButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/devButton.png";

		if (piece == "itemSlot") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/itemSlot.png";
		if (piece == "itemSlotToggled") return "assets/img/hud/"+GameData.data.theme.playerMenu+"/itemSlotToggled.png";
		if (piece == "petButton") return "assets/img/hud/"+GameData.data.theme.topBar+"/petButton.png";

		return null;
	}

	public static function getColour(piece:String):Int {
		if (piece == "mainText") {
			return themeToColour.get(GameData.data.theme.background).highContrast;
		} else if (piece == "choiceText") {
			return themeToColour.get(GameData.data.theme.choiceBox).highContrast;
		} else if (piece == "choiceBack") {
			return themeToColour.get(GameData.data.theme.choiceBox).lowContrast;
		} else if (piece == "locationText") {
			return themeToColour.get(GameData.data.theme.topBar).highContrast;
		} else if (piece == "playerMenu") {
			return themeToColour.get(GameData.data.theme.playerMenu).highContrast;
		} else if (piece == "mynt") {
			return themeToColour.get(GameData.data.theme.mynt).highContrast;
		} else if (piece == "myntbg") {
			return themeToColour.get(GameData.data.theme.mynt).lowContrast;
		} else if (piece == "fader") {
			return themeToColour.get(GameData.data.theme.background).lowContrast;
		} else if (piece == "sliderBg") {
			return themeToColour.get(GameData.data.theme.background).highContrast;
		} else if (piece == "sliderFg") {
			return themeToColour.get(GameData.data.theme.background).highContrast;
		} else if (piece == "background") {
			return themeToColour.get(GameData.data.theme.background).lowContrast;
		}

		return 0;
	}

	public static function getSound(piece:String):String {
		if (piece == "choice") {
			if (GameData.data.theme.choiceBox == "myrrh") return "assets/audio/ui/myrrh/choice";
			else if (GameData.data.theme.choiceBox == "scrap") return "assets/audio/ui/scrap/choice";
			else if (GameData.data.theme.choiceBox == "freak") return "assets/audio/ui/freddyClick";
			else return "assets/audio/ui/choice";
		} else if (piece == "nope") {
			if (GameData.data.theme.choiceBox == "myrrh") return "assets/audio/ui/myrrh/nope";
			else if (GameData.data.theme.choiceBox == "scrap") return "assets/audio/ui/scrap/nope";
			else return "assets/audio/ui/nope";
		} else if (piece == "explore") {
			if (GameData.data.theme.choiceBox == "myrrh") return "assets/audio/ui/myrrh/explore";
			else if (GameData.data.theme.choiceBox == "scrap") return "assets/audio/ui/scrap/explore";
			else return "assets/audio/ui/explore";
		} else if (piece == "menuClose") {
			if (GameData.data.theme.playerMenu == "myrrh") return "assets/audio/ui/myrrh/menuClose";
			else if (GameData.data.theme.playerMenu == "scrap") return "assets/audio/ui/scrap/menuClose";
			else return "assets/audio/ui/menuClose";
		} else if (piece == "menuOpen") {
			if (GameData.data.theme.playerMenu == "myrrh") return "assets/audio/ui/myrrh/menuOpen";
			else if (GameData.data.theme.playerMenu == "scrap") return "assets/audio/ui/scrap/menuOpen";
			else return "assets/audio/ui/menuOpen";
		} else if (piece == "toggle") {
			if (GameData.data.theme.playerMenu == "myrrh") return "assets/audio/ui/myrrh/toggle";
			else if (GameData.data.theme.playerMenu == "scrap") return "assets/audio/ui/scrap/toggle";
			else return "assets/audio/ui/toggle";
		} else if (piece == "hover") {
			if (GameData.data.theme.choiceBox == "eon") return "assets/audio/ui/hover5";
			else if (GameData.data.theme.choiceBox == "taffy") return "assets/audio/ui/hover6";
			else if (GameData.data.theme.choiceBox == "taro") return "assets/audio/ui/hover6";
			else if (GameData.data.theme.choiceBox == "geist") return "assets/audio/ui/hover5";
			else if (GameData.data.theme.choiceBox == "enginetic") return "assets/audio/ui/hover5";
			else if (GameData.data.theme.choiceBox == "freak") return "assets/audio/ui/hover3";
			else if (GameData.data.theme.choiceBox == "suave") return "assets/audio/ui/toggle";
			else if (GameData.data.theme.choiceBox == "stranger") return "assets/audio/ui/hover8";
			else if (GameData.data.theme.choiceBox == "dead") return "assets/audio/ui/hover8";
			else return "assets/audio/ui/hover1";
		}

		return null;
	}
}
