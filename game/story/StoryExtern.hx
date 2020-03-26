package story;

class StoryExtern
{
	public static var daydreamBreakList:Array<String> = [
		"BrightForest.brightForestHub();", 
		"JunkCity.junkCityHub();",
		"VioletMeteorite.violetMeteoriteHub();",
		"TheCrack.explore('main');",
		"TheCrack.explore('bouncybath');",
		"TheCrack.explore('bouncyhub');",
		"TheCrack.explore('right');",
		"TheFloatillery.theFloatillery('explore');", 
		"TheFloatillery.theFloatillery('main');", 
		"IndigoPond.indigoPond('intro');", 
		"IndigoPond.indigoPond('main');", 
		"JunkCity.junkCityExplore('ExploreSnagglebank');", 
		"JunkCity.junkCityExplore('snagglebank interior');", 
		"JunkCity.junkCityExplore('snagglebank exterior');", 
		"SewerSuburbs.sewerExplore('explore');", 
		"SewerSuburbs.sewerExplore('main');", 
		"LLL.libraryExplore('explore');", 
		"LLL.libraryExplore('main');", 
		"Septricas.septricasExplore();", 
		"Septricas.enterSept('main');", 
		"Septricas.enterSept('septricasbath');", 
		"Septricas.elevator('main');", 
		"Septricas.elevator('sumo');", 
		"Septricas.elevator('tropics');",
		"VioletMeteorite.violetMeteoriteExplore('postWedding');",
		"MyntScenes.gooGoatIntro('googoatwake');"
	];

	public static function initExternPassages():Void {
		installClassFields([
			StoryExtern, StaticExtern,
			LittleRed, Roxelle, Septricas, BrightForest, JunkCity, TheFloatillery, SewerSuburbs, IndigoPond, VioletMeteorite, LLL, TheCrack, HyperLand, Red,
			Calls, MyntScenes, Test, StaticCallbacks, Caves, Journal, Menu, Blackjack, Lilac, Apothecary, Endings,
			PetGame, PetConvos
		]);
		/* installField("WorldMap", StaticCallbacks); */ //@cleanup Do this?
	}

	public static function postLoad():Void {
		BrightForest.init();
		JunkCity.init();
		VioletMeteorite.init();
		PetGame.petGameStartup();
		
		//Legacy
		if (getJournalEntries().contains("Rox second visit")) data.roxVisits = 3;
		if (getJournalEntries().contains("Automated Health Warning 2")) data.somQuestAccepted = true;
		
		if (data.cadeAccepted && data.metGryphon > 0 && !data.cadePartyDone) addExplorable(109, "Junk City", JunkCity.junkCityExplore.bind("ExploreCadeParty"), 1, 1);
		if (data.metLittleRed) data.metRed++;
		if (data.petGameData != null) addPlace(data.gooGoatHome, "A scrappy little cabin built by hand in the center of a moonlit clearing. You live here!", "Bright Forest");
		if (data.exploreFinaleJCDone && !getJournalEntries().contains("Missing Page 3")) {
			unlockJournal("Missing Page 3");
			msg("Found Missing Page #3", true);
		}

		if (getJournalEntries().contains("Gryphon Cavern")) addPlace("Gryphon Cavern", "A secret, feather-strewn cavern tucked away behind a waterfall.", "Violet Meteorite");

		if (data.apoEngine) Theme.addUiChoice("zeit");

		if (data.myntFakeDone) unlockJournal("UNDEFINED");

		if (getJournalEntries().contains("Missing Page 1")) unlockJournal("Red previsit");

		if (data.shootingRangeDone) unlockJournal("Shooting range");

		if (data.floatilleryMingled) unlockJournal("The mingling");

		if (data.redGrievingDone) data.floatilleryMemorialRead = true;

		if (data.exploreFinaleBFDone && !getJournalEntries().contains("Missing Page 4")) {
			unlockJournal("Missing Page 4");
			msg("Found Missing Page #4", true);
		}

		if (data.violetGryphonJunk.length > -1) data.gryphonStarted = true;

		if (getJournalEntries().length > -1) data.daydreamedOnce = true;

		//Var Resets
		data.passagesVisited = 0;
		data.justCheckedBank = false;
		data.onWorldMap = false;
		if (data.storedCaps > 500) data.storedCaps = 500;
		data.binsFull = 0;
 		data.timeSincePassageChange = 0;
 		data.timeSinceTouched = 0;
 		data.daydream = false;
 		if (data.playerName == "insert text") data.playerName = "<insert text>";

 		if (Main.debug)
 			Main.showTopButton(Main.devButton);

 		if (data.foundShop)
 			Main.showTopButton(Main.shopButton);

 		/*for (theme in Theme.themes) {
 			for (part in Theme.themeParts)
 				if (theme != "default" && Theme.isUnlocked(theme, part)) {
 					Main.showTopButton(Main.skinsButton);
 					return;
 				}
 		}*/

		//Ambience
		if (data.currentSong != "") {
			playMusic(data.currentSong, true);
		}

		/// Save correction
		if (data.version == null) data.version = "0.1.4";

		for (place in data.places)
			if (place.label == "Dev Menu" || place.label == "Auto-Shop")
				removePlace(place);

		for (action in data.actions)
			if (action.label == "Gather Glowberries")
				action.hub = "Bright Forest";

		if (data.version == "0.1.4")
			for (action in data.actions)
				if (action.label == "Gather Glowberries")
					action.hub = "Bright Forest";

		if (data.hippyBearFortuneIndicies == null) {
			data.hippyBearFortuneIndicies = [];
			for (i in 0...GameData.hippyBearFortunes.length) data.hippyBearFortuneIndicies.push(i);
		}

		//Currencies
		addItem("Capsule", "<!img:item/Capsule.png>\nPink pills which hasten pregnancy. Used as currency in Junk City.");
		addItem("Nuts and Screws", "<!img:item/Nuts and Screws.png>\nIt doesn't really matter what these little nuggets of scrap metal are, everyone just calls them Nuts and Screws because they cannot resist even the smallest opportunity to shoehorn more sexual innuendo into their lives. Mostly pried from the junk piles of Junk City.");
		addItem("Glowberry", "<!img:item/Glowberry.png>\nPlump little cyan, pink, and purple berries. Their centers exude a prick of dim light and they pop like tiny firecrackers between the molars.");

		//Sellables
		addItem("Glowberry Pie", "<!img:item/Glowberry Pie.png>\nA smooth-topped firm-crust packed-full pie straight outta Roxelle's oven. The flavor is almost too rich to handle, but you know ol Rox would want you to gobble it down as best you can.");
		addItem("Glowberry Wine", "<!img:item/Glowberry Wine.png>\n<!i>Usable<!i>\nA bigass bottle of blue wine, topped off with a fat cork. A little sparkly, too, if you look at it under the right light. Tastes electric.");
		addItem("Sweetgrass Leaf", "<!img:item/Sweetgrass Leaf.png>\nLong, curly, extra-fat leaves of sweetgrass. Upon combustion they get you high as a motherfucker.");
		addItem("Sweetgrass Bouquet", "<!img:item/Sweetgrass Bouquet.png>\nAn elegant arrangement of Sweetgrass Leaves; to be presented vertically, with four leaves pointing to the corners of the compass and one tied in a bow at their bases.");
		addItem("Garbage Bag", "<!img:item/Garbage Bag.png>\nSleek, black, bulbous when full.");
		addItem("Bag o Trash", "<!img:item/Bag o Trash.png>\n<!i>Usable<!i>\nA bag of trash. Fun to hump.");
		addItem("Piss Balloon", "<!img:item/Piss Balloon.png>\n<!i>Usable<!i>\nFilled to the brim with murky yellow piss. You can smell it...");
		addItem("Cum Balloon", "<!img:item/Cum Balloon.png>\n<!i>Usable<!i>\nFilled to the brim with goopy white cum. Fun in the summertime.");
		/*addItem("Broken Condom", "<!img:item/Broken Condom.png>\nA gross, stretchy, cum-clogged condom. They're everywhere on this island, really.");
		addItem("Fuckmeat/Rapemeat", "<!img:item/Fuckmeat.png>\nAn NPC construct that operates basically as super slutty bacteria.");*/
		addItem("Broken Cell", "<!img:item/Broken Cell.png>\nIt's in one piece, but it won't turn on. There's a couple errant wires poking out.");

		//Seeds
		addItem("Roxelle's Seed", "<!img:item/Roxelle's Seed.png>\ne0ebc3c409070d07f1df0f2f4132509e");
		addItem("Red's Seed", "<!img:item/Red's Seed.png>\n21fa2c703119c14d7006e2183640e560");
		addItem("Cade's Seed", "<!img:item/Cade's Seed.png>\nc168a2bc673be90e75392d921959237c");
		addItem("Kemp's Seed", "<!img:item/Kemp's Seed.png>\na4010945e4bd924bc2a890a2effea0e6");
		addItem("Septrica's Seed", "<!img:item/Septrica's Seed.png>\n86fb269d190d2c85f6e0468ceca42a20");
		addItem("Marei's Seed", "<!img:item/Marei's Seed.png>\n70682896e24287b0476eff2a14c148f0");
		addItem("Som's Seed", "<!img:item/Som's Seed.png>\nfffca4d67ea0a788813031b8bbc3b329");

		//Usables
		addItem("VIP Pass", "<!img:item/VIP Pass.png>\nA card proclaiming your status: so lofty you surpass even the run-of-the-mill important person! It's green and silvery.");
		addItem("Septricard", "<!img:item/Septricard.png>\nPurple and silver reclaimed metals intertwined into a fine, delicate, uniquely patterned card. AUTO-MYNT card scanners everywhere can only dream of getting one of these slidden through their tiny slits.");
		addItem("Cipher Key", "<!img:item/Cipher Key.png>\n<!i>Usable<!i>\nA weird little card with mappings from one letter to another. It runs on AUTO-MYNT technology.");
		addItem("Auto-Chip", "<!img:item/Auto-Chip.png>\nThe layer-manipulation chip from an AUTO-MYNT, which allows them to spawn and consume items and affect reality one layer up. It's a tiny chunk of meteorite, at its core.");

		addItem("Pastel Ring", "<!img:item/Pastel Ring.png>\n<!i>Usable<!i>\nA smooth ceramic ring fat enough to fit on a thumb or perhaps a small cock. It's semi-translucent and clouded with diaphanous pastel dyes. Lowers the ages of most cubs by several years when worn.");
		addItem("Curiosity Ring", "<!img:item/Curiosity Ring.png>\n<!i>Usable<!i>\nWhat's this?");
		addItem("Candy Ring", "<!img:item/Candy Ring.png>\n<!i>Usable<!i>\nTiny, pink, made of the same stuff as candy necklaces. No matter how much you lick, it never gets smaller. Replaces shit, smegma, puke, and snot with yummy stuff like cake and candy when worn~");
		addItem("Mood Ring", "<!img:item/Mood Ring.png>\n<!i>Usable<!i>\nA cheap little blue-pink doodad that replaces regular old cum with colorful, exotically flavored cum. Colors and flavors reflect on the personality of the cummer.");
		addItem("Privacy Ring", "<!img:item/Privacy Ring.png>\n<!i>Usable<!i>\nUhhh. I dunno what this does?");

		addItem("Cell Phone", "<!img:item/Cell Phone.png>\nIt's a flip-out cell phone, built like a brick. The battery charge is stuck at 100%.");
		addItem("Genderfluiditizer", "<!img:item/Genderfluiditizer.png>\n<!i>Usable<!i>\nA little device based on the same technology as Rings. You stuff it up your butt and it switches your gender and genitals around as you wish.");
		addItem("AUTO-MYNT", "<!img:item/AUTO-MYNT.png>\n<!i>Usable<!i>\nA stolen AUTO-MYNT which used to be the AUTO-SHOP. You're taking it to Som at the Floatillery to see if it has code for a password cracker in it.");

		addItem("Daydream Journal", "<!img:item/Daydream Journal.png>\n<!i>Usable<!i>\nA minty-colored book with a crescent sun on the cover. Used for scribbling your daydreams: running through old memories and imagining other possibilities.");
		

		unlockUi("default", "all", false);
		data.version = GAME_VERSION;
		data.gameLoadedAtProgramTime = getTimer();
	}

	public static function postPassage():Void {
		if (Main.inMod) return; //@hack

		if ((getTimer() - data.timeSincePassageChange) > 1) data.passagesVisited++;
		data.timeSincePassageChange = getTimer();

		/// Presents
		var yearsSince:Int = Date.now().getFullYear() - 2016;
		var anniversary:Bool = (Date.now().getDate() == 7 && Date.now().getMonth() == 7);
		var monthInt:Int = Date.now().getMonth();
		var rng:Float = Math.random();
		var presentsEnabled:Bool = (monthInt == 11 || monthInt == 1 || monthInt == 3 || anniversary);

		if (Math.random() > 0.98 && presentsEnabled) {
			var rand:Bool = (Math.random() > 0.5);
			var dropAmount:Int = Math.round(Math.random()*20) + 3;
			var month:String = "";
			var years:MintText = addText();

			//Set the month
			if (monthInt == 11) month = "Dec";
			if (monthInt == 3) month = "Apr";
			if (monthInt == 1) month = "Feb";
			if (anniversary) month = "Anniversary";

			var chances:Array<String> = ["assets/img/effect/presentRed"+month+".png", "assets/img/effect/presentBlue"+month+".png", "assets/img/effect/presentMint"+month+".png"];
			if (data.myntColour == null) data.myntColour = pickOne(["red", "blue", "mint"]);

			//Boost chances of one present color depending on your Mynt color
			for (i in 0...2) {
				chances.push("assets/img/effect/present"+cast(data.myntColour, String).toTitleCase()+month+".png");
			}

			var present:String = pickOne(chances);

			function myCallback(s:MintSprite):Void {

				if (present == "assets/img/effect/presentRed"+month+".png") {
					var items = ["Capsule", "Glowberry Wine", "Glowberry Pie"];
					for (i in 0...20) items.push("Capsule");
					var item:String = pickOne(items);
					dropAmount = Math.round(dropAmount*0.3);
					if (dropAmount <= 2) dropAmount += 4;
					addToItem("Capsule", dropAmount);
				} else if (present == "assets/img/effect/presentBlue"+month+".png") {
					var item:String = pickOne(["Glowberry", "Sweetgrass Leaf"]);
					if (item == "Sweetgrass Leaf") dropAmount = Math.round(dropAmount*0.5);
					if (item == "Glowberry" && dropAmount <= 10) dropAmount += Math.round(rng*10);
					addToItem(item, dropAmount);
				} else if (present == "assets/img/effect/presentMint"+month+".png") {
					var item:String = pickOne(["Capsule", "Garbage Bag", "Cum Balloon", "Piss Balloon", "Sweetgrass Bouquet"]);
					if (item != "Capsule") dropAmount = Math.round(dropAmount*0.2);
					if (dropAmount < 1) dropAmount = 1;
					addToItem(item, dropAmount);
				}
				s.destroy();
				years.destroy();
			}

			//Do the sprite
			var s:MintSprite = addSprite(present);
			s.x = Math.random()*(GAME_WIDTH-s.width);
			s.y = -150;
			s.scaleX = 0.2;

			tween(s, {y: rng*(GAME_HEIGHT-100-s.height), scaleX: 1}, 1, {ease: ELASTIC_OUT, startDelay: 0.1});
			//Engine.timer(0.4, function () {playSound("assets/audio/ui/myrrh/toggle", "toggle");});

			if (anniversary) {
				years.setText(yearsSince+" Year"+(yearsSince == 1 ? "" : "s")+" Old");
				years.setFormat({wordWrap: false, fontColour: Theme.getColour("mainText"), fontSize: 22});
				years.y = s.y+s.height*1.1;
				years.x = s.x;
				years.alpha = 0;
				tween(years, {alpha: 1}, 1.5, {startDelay: 1});
				tween(years, {y: (rng*(GAME_HEIGHT-100-s.height))+s.height*1.1}, 1, {ease: ELASTIC_OUT, startDelay: 0.1});
			}

			s.onHoverOnce = function() {
				if (present == "assets/img/effect/presentMint"+month+".png") s.applyGlowEffect(0x46b135);
				if (present == "assets/img/effect/presentBlue"+month+".png") s.applyGlowEffect(0x00c6ff);
				if (present == "assets/img/effect/presentRed"+month+".png") s.applyGlowEffect(0x9600ff);
			}

			s.onUnHoverOnce = function() {
				s.clearEffects();
				if (anniversary) years.alpha = 0;
			}

			s.onReleaseOnce = function() {
				years.destroy();
				myCallback(s);
			}
		}

		/// Transitions
		var time = 0.2;
		if (GameData.data.theme.background == "dawn") time = 0.5;
		if (!Mynt.active) cameraFadeIn(themeGetColour("fader"), time, null, false);

		/// Daydream
		if (data.daydream && daydreamBreakList.contains(data.prevHaxe)) wakeUp();
	}
}
