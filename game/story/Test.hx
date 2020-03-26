package story;

class Test
{

	public static function test(seg:String) {
		clear();
		saveCheckpoint("Test.test('"+seg+"');");

		if (seg == "main") {
			cameraFadeIn(0x5DF5AC, 0.5);
			setLocation("Dev Menu");
			playMusic("mynt");
			if (data.currentHub == null) data.currentHub = "Bright Forest";
			var donationStrings:Array<String> = ["THANKS VERY HECKA MUCH FOR DONATING!!!! <3", "You are a beautiful little donato potato a-growing in our garden. Thank you. <3", "Thanks so much for donating bud!", "I bet you smell crisp and fresh as a summer's morn. Thanks for donating motherfucker. <3", "You're a wonderful human being, donor. Thank you!", "You're the shit!!! Thanks very much for giving us money in exchange for this dev version!!!!", "I love you, Patreon donor! <3", "Wow fuck you're a nice person for donating to our game like holy shit I can't get over you~!", "Thanks for donating.", "Thank you so much for donating!!", "Our sincerest thanks for the donation, you're making our dreams come true. <3", "Thanks, "+(data.genderMale?"man.":"Grabby Cat~"), "Our warmest, softest, most curvy thanks to you for donating!", "Thank you for the munny stranger!", "Thanks a million for donating~"];

			append("<!24px>Paraphore Dev Version "+GAME_VERSION+"<!24px><!14px>\n\nLegacy greetings: "+pickOne(donationStrings)+"\n\n<!14px>");

			if (
				data.hasCock == false &&
				data.hasBoth == false &&
				data.hasCunt == false &&
				data.playerName == "Nameless" &&
				data.genderMale == false &&
				data.genderFemale == false &&
				data.genderNeutral == false
			) {
				append("Please set your player variables before you teleport anywhere, or you might glitch out.");
			} else {
				if (data.myntColour == "red") data.myntColourFlavorized = "cherry";
				if (data.myntColour == "blue") data.myntColourFlavorized = "blueberry";
				if (data.myntColour == "mint") data.myntColourFlavorized = "mint";

				append("Current player variables:\n\n<!b>Gender:<!b> "+pickByGender("Male", "Female", "Neutral")+"\n<!b>Junk:<!b> "+pickByGenitals("Cock", "Cunt", "Both")+"\n<!b>Chest:<!b> "+(data.hasBoobs?"Boobs":"Flat")+"\n<!b>Name:<!b> "+data.playerName+"\n<!b>Flavor:<!b> "+data.myntColourFlavorized.toTitleCase()+"\n");
			}

			function setPlayerVars():Void {
				clearText();

				var genderString = pickOne(["m", "f", "n"]);
				data.genderMale = genderString == "m";
				data.genderFemale = genderString == "f";
				data.genderNeutral = genderString == "n";

				var hasString = pickOne(["cock", "cunt", "both"]);
				data.hasCock = hasString == "cock";
				data.hasCunt = hasString == "cunt";
				data.hasBoth = hasString == "both";

				data.playerName = pickOne(GameData.randomNames);

				data.myntColour = pickOne(["red", "blue", "mint"]);
				if (data.myntColour == "red") data.myntColourFlavorized = "cherry";
				if (data.myntColour == "blue") data.myntColourFlavorized = "blueberry";
				if (data.myntColour == "mint") data.myntColourFlavorized = "mint";
				resetTheme();

				data.hasBoobs = Math.random() > 0.5;

				StoryUtils.generateCipher();

				append("<!24px>Paraphore Dev Version "+GAME_VERSION+"<!24px><!14px>\n\nLegacy greetings: "+pickOne(donationStrings)+"\n\n<!14px>");

				append("<!b>Gender:<!b> "+pickByGender("Male", "Female", "Neutral")+"\n<!b>Junk:<!b> "+pickByGenitals("Cock", "Cunt", "Both")+"\n<!b>Chest:<!b> "+(data.hasBoobs?"Boobs":"Flat")+"\n<!b>Name:<!b> "+data.playerName+"\n<!b>Flavor:<!b> "+data.myntColourFlavorized.toTitleCase()+"\n");
			}

			addChoice("Randomize Player variables.", setPlayerVars);
			addChoice("Set Player variables.", test.bind("player vars"));

			addChoice("Tests.", test.bind("tests"));
			addChoice("Cheats.", test.bind("devcheats"));
			addChoice("Minigames.", test.bind("devminigames"));
			addChoice("Teleport.", test.bind("devteleport"));
			addChoice("Hub.", BrightForest.brightForestHub);
		}

		if (seg == "player vars") {
			setLocation("Player Vars");
			data.playerName = "Nameless";
			data.hasCunt = false;
			data.hasCock = false;
			data.hasBoth = false;
			data.hasBoobs = false;
			data.genderMale = false;
			data.genderFemale = false;
			data.genderNeutral = false;
			data.myntColour = "mint";

			append("Name?");
			addTextChoice(function(str) {
				data.playerName = str;
				if (data.fatCatUnlockers.indexOf(data.playerName.toUpperCase()) != -1) {
					msg("Welcome, patron! Skins unlocked!");
					unlockUi("zeit", "all");
					unlockUi("trickster", "all");
					test("devequipset");
				} else {
					test("devbodyset");
				}
			});
		}

		if (seg == "devequipset") {
			append("Wanna equip a skin?");

			addChoice("Equip Zeit.", function () {
				equipUi("zeit");
				test("devbodyset");
			});

			addChoice("Equip Trickster.", function () {
				equipUi("trickster");
				test("devbodyset");
			});

			if (data.playerName == "Ivandeus") {
				unlockUi("stinky", "all");
				addChoice("Equip Stinky.", function () {
					equipUi("stinky");
					test("devbodyset");
				});
			}

			if (data.playerName == "nudeplanetorgy") {
				unlockUi("geist", "all");
				addChoice("Equip Geist.", function () {
					equipUi("geist");
					test("devbodyset");
				});
			}

			if (data.playerName == "ari" || data.playerName == "Ari") {
				unlockUi("taro", "all");
				addChoice("Equip Taro.", function () {
					equipUi("taro");
					test("devbodyset");
				});
			}

			if (data.playerName == "DeaDGoD" || data.playerName == "DeadGod" || data.playerName == "Deadgod" || data.playerName == "deadgod") {
				unlockUi("dead", "all");
				addChoice("Equip Dead.", function () {
					equipUi("dead");
					test("devbodyset");
				});
			}

			if (data.playerName == "Cryptic" || data.playerName == "cryptic") {
				unlockUi("stranger", "all");
				addChoice("Equip Stranger.", function () {
					equipUi("stranger");
					test("devbodyset");
				});
			}

			addChoice("Nah.", test.bind("devbodyset"));
		}

		if (seg == "devbodyset") {
			setLocation("Player Vars");
			append("Welcome, "+data.playerName+".\n\nBody?");

			if (!data.hasBoobs) addChoice("Boobs.", function() {data.hasBoobs = true; test("devbodyset"); append("\n\nYou got boobies."); });
			if (!data.hasCunt) addChoice("Cunt.", function() {data.hasCunt = true; test("devbodyset"); append("\n\nYou got a cunt."); });
			if (!data.hasCock) addChoice("Cock.", function() {data.hasCock = true; test("devbodyset"); append("\n\nYou got a cock."); });
			if (!data.hasCock && !data.hasCunt && !data.hasBoobs) addChoice("Everything.", function() {data.hasBoth = data.hasBoobs = true; test("devgenderset");});
			if (data.hasCunt || data.hasCock) addChoice("Okay, ready.", test.bind("devgenderset"));
		}

		if (seg == "devgenderset") {
			append("Gender?");

			if (data.hasCunt && data.hasCock) {
				data.hasBoth = true;
				data.hasCunt = false;
				data.hasCock = false;
			}

			addChoice("She.", function() {data.genderFemale = true; test("devflavorset"); });
			addChoice("He.", function() {data.genderMale = true; test("devflavorset"); });
			addChoice("They.", function() {data.genderNeutral = true; test("devflavorset"); });
		}

		if (seg == "devPass") {
			disablePause();
			setLocation("Dev Menu");
			playMusic("mynt");
			if (data.currentHub == null) data.currentHub = "Bright Forest";

			cameraFadeIn(0xFFFFFF, 0.25);
			append("What's the secret password you got at the end of the game, "+pickOne(["slut", "bitch", "bud", "bruh", "bro", "brew", "buddy", "pal"])+"?\n\nYou gonna fuckin google it pussy? You won't!! You won't!!");
			addTextChoice(function(str) {
				if (str.toUpperCase() == "STAYSTRONGREBECA" || str.toUpperCase() == "STAYSTRONGREBECA." || str.toUpperCase() == "STAYSTRONGREBECCA." || str.toUpperCase() == "STAYSTRONGREBECCA") {
					Main.debug = true;
					StaticExtern.debugMode = true;
					msg("Unlocked <!b>Dev Menu!<!b>", true);
					enablePause();
					Test.test("main");
					playSound("assets/audio/environment/caveWinSmall");
				} else {
					playSound("assets/audio/ui/nope");
				}
			});
			addChoice("Back to Main Menu.", function() {
				stopChannel("music");
				data.currentSong = "";
				Menu.menuResolve();
			});
		}

		if (seg == "devPassAlt") {
			disablePause();
			setLocation("Dev Menu");
			playMusic("mynt");
			append("What's the secret password you got at the end of the game, "+pickOne(["slut", "bitch", "bud", "bruh", "bro", "brew", "buddy", "pal"])+"?\n\nYou gonna fuckin google it pussy? You won't!! You won't!!");
			addTextChoice(function(str) {
				if (str.toUpperCase() == "STAYSTRONGREBECA" || str.toUpperCase() == "STAYSTRONGREBECA." || str.toUpperCase() == "STAYSTRONGREBECCA." || str.toUpperCase() == "STAYSTRONGREBECCA") {
					Main.debug = true;
					StaticExtern.debugMode = true;
					msg("Unlocked <!b>Dev Menu!<!b>", true);
					enablePause();
					Test.test("main");
					playSound("assets/audio/environment/caveWinSmall");
				} else {
					playSound("assets/audio/ui/nope");
				}
			});
			addChoice("Back to World Map.", function() {
				WorldMap.map();
			});
		}

		if (seg == "devflavorset") {
			append("Flavor?");
			addChoice("Cherry.", function() {data.myntColour="red"; resetTheme(); test("main"); msg("Player vars set."); });
			addChoice("Blueberry.", function() {data.myntColour="blue"; resetTheme(); test("main"); msg("Player vars set."); });
			addChoice("Mint.", function() {data.myntColour="mint"; resetTheme(); test("main"); msg("Player vars set."); });
		}

		if (seg == "player vars test") {
			append("Heyoooo. This is the testy place for player var setting.");
			data.playerName = "Craig";
			for (it in cast(data.items, Array<Dynamic>)) it.amount = 999;
			addChoice("Next.", test.bind("devbodyset"));
		}

		if (seg == "devcheats") {
			makeSmallButtons();
			setLocation("Cheats");
			function unlockPlaces() {
				msg("Unlocked every place.");
				data.apothecaryUnlocked = true;
				data.violetUnlocked = true;
				data.moonUnlocked = true;
				addPlace("Roxelle's Farm", "A little farm way deep in the forest. Roxelle grows glowcorn and other crops here, with Bert's help.", "Bright Forest");
				addPlace("Sewer Suburbs", "A pleasant curving lane spotted with cul-de-sacs and condominums, built into the City's main sewage basin.", "Junk City");
				addPlace("Snagglebank", "A cum-coated sperm bank/cap bank/blood bank/abortion clinic tucked away among the alleymaze of the City.", "Junk City");
				addPlace("Indigo Pond", "A nymphs-only relaxation spot tucked deep inside an illusive thicket.", "Bright Forest");
				addPlace("The Floatillery", "A messy colony of rafts and log buildings which form a floating distillery owned by the Apothecary.", "Bright Forest");
				addPlace("Red's Cottage", "A cottage which used to house a grandmother and a bunny in a red cloak. Now it's just the bunny and the big bad wolf.", "Bright Forest");
				addPlace("Septrica's", "A bigass green skyscraper brothel in the middle of Junk City.", "Junk City");
				addPlace("L.L.L.", "A Library Laboratory Labyrinth, home of Lana the librarian. A maze of books and trucks and tents and equipment, possibly the only quiet and clean place in the entire city.", "Junk City");
				addPlace("The Crack", "A hot springs drawing heat from the crack on Violet's skull.", "Violet Meteorite");
				addPlace("Hyper Land", "An inflatable amusement park/casino.", "Violet Meteorite");
				addPlace("Gryphon Cavern", "A secret, feather-strewn cavern tucked away behind a waterfall.", "Violet Meteorite");
			}
			function unlockSkins() {
				unlockUi("geist", "all", false);
				unlockUi("stinky", "all", false);
				unlockUi("zeit", "all", false);
				unlockUi("trickster", "all", false);
				unlockUi("taro", "all", false);
				unlockUi("dead", "all", false);
				unlockUi("dawn", "all", false);
				unlockUi("taffy", "all", false);
				unlockUi("suave", "all", false);
				unlockUi("eon", "all", false);
				unlockUi("myrrh", "all", false);
				unlockUi("scrap", "all", false);
				unlockUi("enginetic", "all", false);
				unlockUi("freak", "all", false);
				unlockUi("stranger", "all");
			}

			addChoice("Get 999 of every item.", function() {
				for (it in cast(data.items, Array<Dynamic>)) it.amount = 999;
				msg("Got 999 of every item.");
			});
			addChoice("Unlock every place.", unlockPlaces);
			addChoice("Unlock all upper buttons.", function () {
				StoryUtils.unlockTopButton(Main.shopButton);
				StoryUtils.unlockTopButton(Main.skinsButton);
				msg("Unlocked Shop and Skins buttons.");
			});
			addChoice("Make explorables happen infinite times.", function () {
				for (it in cast(data.exploreRefs, Array<Dynamic>)) it.times = -1;
				msg("Infinite explorables toggled on.");
			});
			addChoice("Unlock all skins.", function() {
				unlockSkins();
				msg("Unlocked all skins.", true);
				test("devcheatsequip");
			});
			addChoice("Unlock all journal entries.", function() {
				data.allJournal = true;
				msg("Unlocked all journal entries.");
			});
			addChoice("Unlock all endings.", function() {
				for (ending in ["protocol", "mint", "septrica", "mynt", "meteorite"]) {
					data.endingsUnlocked.push(ending);
				}
				msg("Unlocked all endings.");
			});
			addChoice("Back.", test.bind("main"));
		}

		if (seg == "devcheatsequip") {
			append("Wanna equip one?");
			addChoice("Geist.", equipUi.bind("geist"));
			addChoice("Stinky.", equipUi.bind("stinky"));
			addChoice("Taro.", equipUi.bind("taro"));
			addChoice("Taffy.", equipUi.bind("taffy"));
			addChoice("Dead.", equipUi.bind("dead"));
			addChoice("Dawn.", equipUi.bind("dawn"));
			addChoice("Stranger.", equipUi.bind("stranger"));
			addChoice("Suave.", equipUi.bind("suave"));
			addChoice("Eon.", equipUi.bind("eon"));
			addChoice("Myrrh.", equipUi.bind("myrrh"));
			addChoice("Scrap.", equipUi.bind("scrap"));
			addChoice("Enginetic.", equipUi.bind("enginetic"));
			addChoice("Freak.", equipUi.bind("freak"));
			addChoice("Back.", test.bind("devcheats"));
		}

		if (seg == "devminigames") {
			append("Playtime~!");
			addChoice("Play Volleyball.", Septricas.volleyballGame);
			addChoice("Play Goldfish Catchery.", Septricas.lilacGame);
			addChoice("Play the Pet Game.", test.bind("devgoogoat"));
			if (internal) addChoice("Generate a hybrid.", test.bind("character generator"));
			addChoice("Back.", test.bind("main"));
		}

		if (seg == "quickmynt") {
			quickMynt("Som");
			append("This passage is temporarily interrupted");
			addChoice("Back.", test.bind("devminigames"));
		}

		if (seg == "onscreentimer") {
			function displayClock() {
				var clockText:MintText = addText();
				var clockValue:Int = 46;
				var timerValue:Int = 0;
				playSound("assets/audio/music/musicbox", "musicbox");
				clockText.setFormat({wordWrap: false, fontColour: 0x000000, fontSize: 72});
				clockText.setText("00:"+clockValue);
				clockText.x = GAME_WIDTH/2-clockText.fieldWidth/2;
				clockText.y = 10;
				for (tick in 0...47) {
					timer(timerValue, function() {
						clockText.setText("00:"+(clockValue>9?"":"0")+clockValue);
						clockValue--;
					});
					timerValue++;
				}
			}
			displayClock();

			append("This passage has a timer and a sad song");
			addChoice("Back.", test.bind("devminigames"));
		}

		if (seg == "devgoogoat") {
			append("Her name?");

			addTextChoice(function(str) {
				data.gooGoatName = str;
				test("devgoogoat2");
			});

			addChoice("Bleat.", function() {data.gooGoatName = "Bleat"; test("devgoogoat2");});
			addChoice("Goopi.", function() {data.gooGoatName = "Goopi"; test("devgoogoat2");});
			addChoice("Billy.", function() {data.gooGoatName = "Billy"; test("devgoogoat2");});
			addChoice("Bitch.", function() {data.gooGoatName = "Bitch"; test("devgoogoat2");});
			addChoice("Slut.", function() {data.gooGoatName = "Slut"; test("devgoogoat2");});
			addChoice("Whore.", function() {data.gooGoatName = "Whore"; test("devgoogoat2");});
			addChoice("Fuckling.", function() {data.gooGoatName = "Fuckling"; test("devgoogoat2");});
			addChoice("Fucklet.", function() {data.gooGoatName = "Fucklet"; test("devgoogoat2");});
			addChoice("Fucktoy.", function() {data.gooGoatName = "Fucktoy"; test("devgoogoat2");});
		}

		if (seg == "devgoogoat2") {
			append("Your title?");
			addTextChoice(function(str) {
				data.gooGoatPlayerTitle = str;
				test("devgoogoat3");
			});
			addChoice(data.playerName, function() {data.gooGoatPlayerTitle = data.playerName; test("devgoogoat3");});
			addChoice("Master", function() {data.gooGoatPlayerTitle = "Master"; test("devgoogoat3");});
			addChoice("Mistress", function() {data.gooGoatPlayerTitle = "Mistress"; test("devgoogoat3");});
			addChoice("Lord.", function() {data.gooGoatPlayerTitle = "Lord"; test("devgoogoat3");});
			addChoice("Daddy.", function() {data.gooGoatPlayerTitle = "Daddy"; test("devgoogoat3");});
			addChoice("Dad.", function() {data.gooGoatPlayerTitle = "Dad"; test("devgoogoat3");});
			addChoice("Mommy.", function() {data.gooGoatPlayerTitle = "Mommy"; test("devgoogoat3");});
			addChoice("Mom.", function() {data.gooGoatPlayerTitle = "Mom"; test("devgoogoat3");});
			addChoice("Galaxy Wizard.", function() {data.gooGoatPlayerTitle = "Galaxy Wizard"; test("devgoogoat3");});
		}

		if (seg == "devgoogoat3") {
			append("Home title?");

			addTextChoice(function(str) {
				data.gooGoatHome = str;
				test("devgoogoat4");
			});
			addChoice("Moonlit Cabin.", function() {data.gooGoatHome = "Moonlit Cabin"; test("devgoogoat4");});
			addChoice("Luna.", function() {data.gooGoatHome = "Luna"; test("devgoogoat4");});
			addChoice("The Sex Castle.", function() {data.gooGoatHome = "The Sex Castle"; test("devgoogoat4");});
			addChoice("The Bone Zone.", function() {data.gooGoatHome = "The Bone Zone"; test("devgoogoat4");});
			addChoice("Just call it home.", function() {data.gooGoatHome = "Home"; test("devgoogoat4");});
		}

		if (seg == "devgoogoat4") {
			append("Cheats?");

			data.myntPetDone = true;
			data.gooGoatStamina = 100;
			data.gooGoatTrust = 0;
			data.gooGoatLuck = 0;
			data.gooGoatSensitivity = 0;
			data.gooGoatPsyche = 0;
			data.gooGoatCharisma = 0;

			addChoice("Max all stats.", function() {data.gooGoatTrust = data.gooGoatLuck = data.gooGoatSensitivity = data.gooGoatPsyche = data.gooGoatCharisma = 100; msg("Maxed all stats.");});
			addChoice("Max Trust.", function() {data.gooGoatTrust = 100; msg("Maxed Trust.");});
			addChoice("Max Luck.", function() {data.gooGoatLuck = 100; msg("Maxed Luck.");});
			addChoice("Max Sensitivity.", function() {data.gooGoatSensitivity = 100; msg("Maxed Sensitivity.");});
			addChoice("Max Psyche.", function() {data.gooGoatPsyche = 100; msg("Maxed Psyche.");});
			addChoice("Max Charisma.", function() {data.gooGoatCharisma = 100; msg("Maxed Charisma.");});
			addChoice("Begin.", PetGame.petGameResolve);
		}

		if (seg == "character generator") {
			var allAnimals:Array<String> = ["sloth", "lamb", "chameleon", "otter", "cat/tiger/lion", "bear", "kangaroo", "elephant", "horse", "ferret", "snake", "alpaca", "deer", "donkey", "wolf", "fox", "hyena", "moose", "giraffe"];
			append(pickOne(["skunk", "pig"])+" + "+pickOne(allAnimals));

			addChoice("Roll with filthy animals.", test.bind("character generator"));
			addChoice("Roll with some materials.", test.bind("character generator2"));
			addChoice("Roll wild.", test.bind("character generator3"));
			addChoice("Back.", test.bind("devminigames"));
		}

		if (seg == "character generator2") {
			var materials:Array<String> = ["shadow", "candy", "rubber", "mist/gas"];
			var allAnimals:Array<String> = ["sloth", "lamb", "chameleon", "otter", "cat/tiger/lion", "bear", "kangaroo", "elephant", "horse", "ferret", "snake", "alpaca", "deer", "donkey", "wolf", "fox", "hyena", "moose", "giraffe"];

			append(pickOne(materials)+" + "+pickOne(allAnimals));

			addChoice("Roll with some good base animals.", test.bind("character generator"));
			addChoice("Roll with some materials.", test.bind("character generator2"));
			addChoice("Roll wild.", test.bind("character generator3"));
			addChoice("Back.", test.bind("devminigames"));
		}

		if (seg == "character generator3") {
			var allAnimals:Array<String> = ["sloth", "lamb", "chameleon", "otter", "cat/tiger/lion", "bear", "kangaroo", "elephant", "horse", "ferret", "snake", "alpaca", "deer", "donkey", "wolf", "fox", "hyena", "moose", "giraffe"];
			append(pickOne(allAnimals)+" + "+pickOne(allAnimals));

			addChoice("Roll with some good base animals.", test.bind("character generator"));
			addChoice("Roll with some materials.", test.bind("character generator2"));
			addChoice("Roll wild.", test.bind("character generator3"));
			addChoice("Back.", test.bind("devminigames"));
		}

		if (seg == "devteleport") {
			setLocation("Teleports");
			var s:MintSprite = addRectSprite(120, 40, 0);
			s.y = 50;
			s.alpha = 0;
			s.onReleaseOnce = function() {
				getUrl("https://youtu.be/KZaz7OqyTHQ");
				playSound("assets/audio/ui/topClick");
			}
			append("Jump around~");
			data.currentHub = "Bright Forest";
			playMusic("mynt");

			addChoice("Bright Forest.", test.bind("devteleportbf"));
			addChoice("Junk City.", test.bind("devteleportjc"));
			addChoice("Violet Meteorite.", test.bind("devteleportvm"));
			addChoice("Tranquil Apothecary.", Apothecary.explore.bind("apohub"));
			addChoice("AUTO-SHOP.", BrightForest.brightForestExplore.bind("ExploreWorldShop"));
			addChoice("New Scenes", test.bind("devteleportnewscenes"));
			addChoice("Back.", test.bind("main"));
		}

		if (seg == "devteleportnewscenes") {
			makeSmallButtons();
			playMusic("mynt");
			
			addChoice("BUG TEST", function() {
				for (ending in ["protocol", "mint", "septrica", "mynt", "meteorite"]) {
					data.endingsUnlocked.push(ending);
				}
				Endings.explore("endingsHub");
			});
			addChoice("Stealing an auto-mynt", BrightForest.brightForestExplore.bind("world shop kill"));
			addChoice("Bringing the auto-mynt to Som", TheFloatillery.theFloatillery.bind("somStolenAuto"));
			addChoice("Marei & Thelly", Endings.explore.bind("thelly1"));
			addChoice("Protocol Ending", Endings.explore.bind("protocolHub"));
			addChoice("Mint Ending (WIP)", Endings.explore.bind("mintHub"));
			addChoice("Self-replicating AUTO-MYNTs.", test.bind("selfauto"));
			addChoice("Mynt ending", function() {
				data.currentEnding = "mynt";
				test("myntEndingGate");
			});
			addChoice("Marei — Apothecary Tour", Apothecary.explore.bind("mareiTour"));
			addChoice("Cade — Cyan Wedding", VioletMeteorite.violetMeteoriteExplore.bind("ExploreCyanWedding"));
			addChoice("The Flood (WIP)", function() {
				data.floodMode = true;
				BrightForest.brightForestExplore("floodHub");
			});
			addChoice("Breaking into Septrica's", Septricas.enterSept.bind("swipe Septricard"));
			addChoice("<!b>NEXT PAGE<!b>", test.bind("devteleportnewscenes2"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "devteleportnewscenes2") {
			makeSmallButtons();
			playMusic("mynt");
			//addChoice("<!b>NEXT PAGE<!b>", test.bind("devteleportnewscenes3"));
			//addChoice("Redhippy", BrightForest.brightForestExplore.bind("ExploreHippy"));
			addChoice("AMCN scene", MyntScenes.amcn.bind("intro"));
			addChoice("Missing Page 13", MyntScenes.myntMissing13.bind("intro"));
			addChoice("Missing Page 14", MyntScenes.myntMissing14.bind("intro"));
			addChoice("Missing Page 15", MyntScenes.myntMissing15.bind("intro"));
			addChoice("Missing Page 16", MyntScenes.myntMissing16.bind("intro"));
			addChoice("Mynt pass", MyntScenes.myntWriter.bind("intro"));
			addChoice("Sep ending", MyntScenes.amcn.bind("clickedNoPlay"));
			addChoice("Yes no prompt", test.bind("yesno"));
			addChoice("Red after apo", Red.explore.bind("afterApo1"));
			addChoice("Red in City", JunkCity.junkCityExplore.bind("redMove1"));
			addChoice("Protocol ending unlock.", function() {
				data.currentEnding = "protocol";
				Endings.explore("shelter");
			});
			addChoice("Protocol map cutscene", function() {
				//data.currentEnding = "protocol";
				data.floodMode = true;
				Endings.explore("protocolEndingMap");
			});
			addChoice("Meteorite map cutscene", function() {
				//data.currentEnding = "protocol";
				data.floodMode = true;
				Endings.explore("meteoriteEndingMap");
			});
			addChoice("<!b>PREV PAGE<!b>", test.bind("devteleportnewscenes"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "myntEndingGate") {
			append("HUGE SPOILERS AHEAD!");
			/*addTextChoice(function(str) {
				if (str == "grumblepuss") {
					msg("Password accepted.");
					MyntScenes.myntEnding("intro");
				} else {
					msg("Password failed.");
					str = "";
				}
			});*/
			addChoice("Show me the spoilers.", MyntScenes.myntEnding.bind("intro"));
			addChoice("After black hole.", MyntScenes.myntEnding.bind("afterBlackHole"));
			addChoice("Bomb shelter.", Endings.explore.bind("shelter"));
			addChoice("After shelter.", MyntScenes.myntEnding.bind("afterShelter"));
			addChoice("Back.", test.bind("devteleportnewscenes"));
		}

		if (seg == "yesno") {
			StoryUtils.yesNoPrompt(Test.test.bind("devteleportnewscenes2"), Test.test.bind("devteleportnewscenes2"));
		}

		if (seg == "devteleportrefscenes") {
			makeSmallButtons();
			playMusic("mynt");
			addChoice("Som and Archie test the AMCN", MyntScenes.myntMissing6.bind("intro"));
			addChoice("Som and Septrica test Mint", MyntScenes.myntMissing5.bind("intro"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "toolteep") {
			var s:MintSprite = addRectSprite(400, 400, 0);
			s.x = GAME_WIDTH/2-s.width/2;
			s.y = GAME_HEIGHT/2-s.height/2;
			s.onHover = showToolTipOnCursor.bind("<!16px>Big dicks are large and full of cum\nIf you're havin girl problems I feel bad for you son<!16px>", "", "sys");
			addChoice("Back.", test.bind("devteleportnewscenes"));
		}

		if (seg == "sommsg") {
			append("Archie,\n\nStop trying to work with Mynt. I know you don't want to hurt her feelings or whatever but by definition she cannot be part of our plan, in ANY way, so all the time you spend arguing with her or doing big dramatic monologues back and forth is time that could be spent getting your shit together for phase one. We will visit the Engine tomorrow whether you have someone to fap to or not.\n\nYes you read that right. Capital E for Engine. The big kahuna. The large fish. For once I was wrong, cause I guess you actually changed the right y value after all. The big blue bastard is above ground now. It's on the east side of the island. You can probably even see it in on your world map. Marie got right on that shit as soon as it popped up. She convinced Cage to put his <3 muscles <3 to use and build some foundation around it in exchange for two dozen Fuckmeat spawned with my technology. You know, those rare little things you keep begging me to tell you how to delete. Yeah. Not so \"pointlessly repulsive\" after all huh. This is why I'm in charge.\n\nAnyway. Now that Marie and Cage have set up some level of security, no one should be able to just stumble onto the Engine and tell Mynt we hacked it up here at least. The blue light totally bleeds through and looks super enticing and mysterious. If Lana wasn't so busy with his science project I'm sure he would be all over that shit, magnifying glass and everything.\n\nRight now the \"security\" they built around the Engine is just two doors and a handful of log walls. It'll be developed into something bigger later that we're going to call the Apothecary, once the mining ramps up and we can start to make concrete. Septrica set aside some space in the city plans for the production of all the materials and security shit we're gonna need. For example: card scanners that can't just be shorted out by a rogue cum squirt. Thankfully, Lana is looking into that for us on the pretense that we'll leave his project alone.\n\nI know this is a lot of names and terms at once but just keep your heart rate down and you'll be fine.\n\nWhat you have to do now is get your fap material up to date about the trip tomorrow. I believe she just sent you a message, actually, so go check that and don't even reply to this one.\n\nAnd no, I'm not changing your password for you. I intentionally picked it to bother you into taking the initiative and LEARNING HOW TO USE THE COMPUTER MACHINE.\n\n— Som");
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "desktop") {
			append("test");
			addChoice("[Minimize.]", Test.test.bind("desktopinit"));
		}

		if (seg == "desktopinit") {
			disablePause();
			var base:MintSprite = addSprite("img/effect/wendeezcomp/base.png");
			base.y = -base.height;
			tween(base, {y: 0}, 1, {ease: QUAD_OUT});

			//Buttons on the toolbar

			var windowsButton:MintSprite = addRectSprite(60, 40, 0);
			var steamButton:MintSprite = addRectSprite(60, 40, 0);
			var filesButton:MintSprite = addRectSprite(60, 40, 0);
			var sublimeButton:MintSprite = addRectSprite(60, 40, 0);
			var paraButton:MintSprite = addRectSprite(60, 40, 0);

			var buttonShift:Int = 0;
			var buttonList:Array<MintSprite> = [windowsButton, steamButton, filesButton, sublimeButton, paraButton];
			for (button in buttonList) {
				button.alpha = 0;
				button.y = GAME_HEIGHT-button.height;
				button.x = 60*buttonList.indexOf(button)+buttonShift;
				buttonShift += 3;
			}

			windowsButton.onHover = showToolTipOnCursor.bind("wendeezcomp\n\nUsers:\n<!b>Archbishop<!b>\nWendy\nCade\nMike", "");

			//Windows and subwindows that can be opened
			var libraryWindow:MintSprite = addSprite("img/effect/wendeezcomp/steamLibrary.png");
			var chatWindow:MintSprite = addSprite("img/effect/wendeezcomp/steamChat1.png");
			var chatWindow2:MintSprite = addSprite("img/effect/wendeezcomp/steamChat2.png");
			var chatWindow3:MintSprite = addSprite("img/effect/wendeezcomp/steamChat3.png");
			var filesWindow:MintSprite = addSprite("img/effect/wendeezcomp/fileSystem.png");
			var codeWindow:MintSprite = addSprite("img/effect/wendeezcomp/doomsdayCode.png");
			var sublimeWindow:MintSprite = addSprite("img/effect/wendeezcomp/wendyNote.png");

			libraryWindow.x = chatWindow.x = 60;

			chatWindow2.x = chatWindow3.x = 140;
			chatWindow2.y = chatWindow3.y = 60;

			filesWindow.x = 120;
			
			codeWindow.x = 300;
			codeWindow.y = 150;
			
			sublimeWindow.x = 185;

			libraryWindow.y = filesWindow.y = sublimeWindow.y = GAME_HEIGHT;

			libraryWindow.scaleX = libraryWindow.scaleY =
			filesWindow.scaleX = filesWindow.scaleY = 
			sublimeWindow.scaleX = sublimeWindow.scaleY = 0.1;

			//Subwindow buttons
			var friendsButton:MintSprite = addRectSprite(150, 50, 0);
			var friendsButton2:MintSprite = addRectSprite(65, 25, 0);
			friendsButton2.x = 100;
			friendsButton2.y = 40;
			var scrollButton:MintSprite = addRectSprite(30, 320, 0);
			var codeButton:MintSprite = addRectSprite(100, 25, 0);

			friendsButton.x = 5+libraryWindow.width-friendsButton.width;
			friendsButton.y = 30+libraryWindow.height-friendsButton.height;
			friendsButton.onReleaseOnce =
			friendsButton2.onReleaseOnce = function() {
				friendsButton.mouseEnabled =
				friendsButton2.mouseEnabled = false;
				playSound("assets/audio/secret/click", "click");
				setChannelVolume("click", 0.3);
				chatWindow.layer = chatWindow2.layer = chatWindow3.layer = Main.BUTTON_SPRITE_LAYER;
				tween(chatWindow, {x: 140, y: 60, alpha: 1}, 0.3);
				scrollButton.mouseEnabled = true;
			}

			scrollButton.x = 615;
			scrollButton.y = 160;
			var currentChatPage:Int = 1;
			var scrollUp:Bool = true;
			scrollButton.onReleaseOnce = function() {
				playSound("assets/audio/ui/menu"+(Math.random()>0.5?"Open":"Close"));
				//Cycle visibility of chat windows 1,2,3
				chatWindow.alpha = chatWindow2.alpha = chatWindow3.alpha = 0;
				if (currentChatPage == 0) {
					chatWindow.alpha = 1;
					scrollUp = true;
				}
				if (currentChatPage == 1) chatWindow2.alpha = 1;
				if (currentChatPage == 2) {
					chatWindow3.alpha = 1;
					scrollUp = false;
				}

				if (scrollUp)
					currentChatPage++
				else
					currentChatPage--;
			}

			codeButton.x = 300;
			codeButton.y = 160;
			codeButton.onReleaseOnce = function() {
				codeButton.mouseEnabled = false;
				codeWindow.layer = Main.HUB_LAYER;
				playSound("assets/audio/secret/click", "click", {loops: 2});
				setChannelVolume("click", 0.3);
				tween(codeWindow, {x: 0, y: 0, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
			}

			//X buttons
			var libraryCloser:MintSprite = addRectSprite(80, 30, 0);
			libraryCloser.x = 670;
			libraryCloser.y = 30;
			var chatCloser:MintSprite = addRectSprite(60, 30, 0);
			chatCloser.x = 600;
			chatCloser.y = 70;

			var filesCloser:MintSprite = addRectSprite(100, 20, 0);
			filesCloser.x = 570;
			filesCloser.y = 100;
			var codeCloser:MintSprite = addRectSprite(40, 40, 0);
			codeCloser.x = GAME_WIDTH-codeCloser.width;

			var sublimeCloser:MintSprite = addRectSprite(40, 40, 0);
			sublimeCloser.x = GAME_WIDTH-sublimeCloser.width;

			friendsButton.mouseEnabled = friendsButton2.mouseEnabled = scrollButton.mouseEnabled = codeButton.mouseEnabled = libraryCloser.mouseEnabled = chatCloser.mouseEnabled = filesCloser.mouseEnabled = codeCloser.mouseEnabled = sublimeCloser.mouseEnabled = false;

			libraryWindow.alpha = chatWindow.alpha = chatWindow2.alpha = chatWindow3.alpha = filesWindow.alpha = codeWindow.alpha = sublimeWindow.alpha = friendsButton.alpha = friendsButton2.alpha = scrollButton.alpha = codeButton.alpha = libraryCloser.alpha = chatCloser.alpha = filesCloser.alpha = codeCloser.alpha = sublimeCloser.alpha = 0;


			var openWindows:Array<String> = [];
			function openWindow(window:String) {
				playSound("assets/audio/secret/click", "click");
				setChannelVolume("click", 0.3);
				if (window == "steam") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						tween(libraryWindow, {x: 60, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						chatWindow.layer = chatWindow2.layer = chatWindow3.layer = libraryWindow.layer = Main.ADD_SPRITE_LAYER;
						friendsButton.mouseEnabled = friendsButton2.mouseEnabled = scrollButton.mouseEnabled = libraryCloser.mouseEnabled = chatCloser.mouseEnabled = false;
						chatWindow.alpha = chatWindow2.alpha = chatWindow3.alpha = 0;
					} else {
						//Open
						openWindows.push(window);
						libraryWindow.layer = Main.HUB_LAYER;
						friendsButton.mouseEnabled = friendsButton2.mouseEnabled = libraryCloser.mouseEnabled = chatCloser.mouseEnabled = true;
						tween(libraryWindow, {x: 5, y: 30, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}

				if (window == "files") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						tween(filesWindow, {x: 120, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						filesWindow.layer = Main.ADD_SPRITE_LAYER;
						codeButton.mouseEnabled = filesCloser.mouseEnabled = codeCloser.mouseEnabled = false;
						codeWindow.alpha = 0;
					} else {
						//Open
						openWindows.push(window);
						filesWindow.layer = Main.HUB_LAYER;
						codeButton.mouseEnabled = filesCloser.mouseEnabled = codeCloser.mouseEnabled = true;
						tween(filesWindow, {x: 270, y: 100, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}

				if (window == "sublime") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						sublimeCloser.mouseEnabled = false;
						tween(sublimeWindow, {x: 185, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						sublimeWindow.layer = Main.ADD_SPRITE_LAYER;
					} else {
						//Open
						openWindows.push(window);
						sublimeCloser.mouseEnabled = true;
						sublimeWindow.layer = Main.HUB_LAYER;
						tween(sublimeWindow, {x: 0, y: 0, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}
			}

			steamButton.onReleaseOnce = openWindow.bind("steam");
			libraryCloser.onReleaseOnce = chatCloser.onReleaseOnce = openWindow.bind("steam");
			filesButton.onReleaseOnce = openWindow.bind("files");
			filesCloser.onReleaseOnce = codeCloser.onReleaseOnce = openWindow.bind("files");
			sublimeButton.onReleaseOnce = openWindow.bind("sublime");
			sublimeCloser.onReleaseOnce = openWindow.bind("sublime");
			paraButton.onReleaseOnce = Test.test.bind("devteleportnewscenes");
			paraButton.onHover = showToolTipOnCursor.bind("Return to Paraphore", "");
		}

		if (seg == "devteleportbf") {
			append("Bright Forest teleports.");
			var s:MintSprite = addSprite("assets/img/worldMap/brightForest.png");
			s.x = 250;
			s.y = 200;
			playMusic("brightForest");

			addChoice("Bright Forest hub.", BrightForest.brightForestHub);
			addChoice("Roxelle's.", Roxelle.roxExplore);
			addChoice("Red's Cottage.", Red.explore.bind("intro"));
			addChoice("Floatillery.", TheFloatillery.theFloatillery.bind("explore"));
			addChoice("Indigo Pond.", IndigoPond.indigoPond.bind("intro"));
			addChoice("Frog boy.", BrightForest.brightForestExplore.bind("ExploreDarts"));
			addChoice("Landfill.", BrightForest.brightForestExplore.bind("ExploreSalvage"));
			addChoice("Goblin village.", BrightForest.brightForestExplore.bind("ExploreGobbo"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "devteleportjc") {
			append("Junk City teleports.");
			var s:MintSprite = addSprite("assets/img/worldMap/junkCity.png");
			s.x = 215;
			s.y = 230;
			playMusic("junkCity");

			addChoice("Wanderings.", test.bind("devteleportjcwanderings"));
			addChoice("Junk City hub.", JunkCity.junkCityHub);
			addChoice("Septrica's.", Septricas.septricasExplore);
			addChoice("Sewer Suburbs.", JunkCity.junkCityExplore.bind("ExploreSewerSuburbs"));
			addChoice("Snagglebank.", JunkCity.junkCityExplore.bind("ExploreSnagglebank"));
			addChoice("L.L.L.", LLL.libraryExplore.bind("explore"));
			addChoice("Cade party.", JunkCity.junkCityExplore.bind("cadeparty44"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "devteleportjcwanderings") {
			append("Junk City wandering teleports.");
			addChoice("Teen stripper.", JunkCity.junkCityExplore.bind("ExploreTeenStripper"));
			addChoice("Dumpster.", JunkCity.junkCityExplore.bind("ExploreDumpsterDrown"));
			addChoice("Breed Me.", JunkCity.junkCityExplore.bind("ExploreBreedMe"));
			addChoice("Cade.", JunkCity.junkCityExplore.bind("ExploreCade"));
		}

		if (seg == "devteleportvm") {
			append("Violet Meteorite teleports.");
			var s:MintSprite = addSprite("assets/img/worldMap/violetMeteorite.png");
			s.x = 250;
			s.y = 100;
			playMusic("violetMeteorite");

			addChoice("Violet Meteorite hub.", VioletMeteorite.violetMeteoriteHub);
			addChoice("The Crack.", TheCrack.explore.bind("explore"));
			addChoice("Hyper Land.", HyperLand.explore.bind("explore"));
			addChoice("Gryphon.", VioletMeteorite.violetMeteoriteExplore.bind("ExploreGryphon"));
			addChoice("Back.", test.bind("devteleport"));
		}

		if (seg == "tests") {
			makeSmallButtons();
			addChoice("game tests", test.bind("game tests"));
			addChoice("text tests", test.bind("text tests"));
			addChoice("effect tests", test.bind("effect tests"));
			addChoice("save debug", test.bind("save debug"));
			addChoice("Copyable text.", test.bind("copy text"));
			addChoice("Enginetics particles.", test.bind("engineticsParticles"));
			addChoice("Set cipher based on name.", test.bind("generateNewCipher"));
			addChoice("Cipherizer.", test.bind("cipher"));
			addChoice("Endings.", test.bind("endings"));
			addChoice("Toggle WM notifications.", function() { 
				data.notificationTest = !data.notificationTest;
				msg(""+data.notificationTest);
			});
			addChoice("Toggle WM glows.", function() { 
				var bool:Bool = !data.gameSettings.get("World Map Glows");
				data.gameSettings.set("World Map Glows", bool);
				msg(""+data.gameSettings.get("World Map Glows"));
			});

			addChoice("Toggle journal kinks.", function() { 
				var bool:Bool = !data.gameSettings.get("Journal Kink Symbols");
				data.gameSettings.set("Journal Kink Symbols", bool);
				msg(""+data.gameSettings.get("Journal Kink Symbols"));
			});

			addChoice("Toggle Flood mode.", function() { 
				data.floodMode = !data.floodMode;
				msg(""+data.floodMode);
			});
			if (internal) addChoice("On-screen timer.", test.bind("onscreentimer"));
			/*addChoice("benchmark", test.bind("benchmark tests"));
			addChoice("advanced item", Test.test.bind("advanced item test"));
			addChoice("swf", Test.test.bind("swf test"));
			addChoice("console", test.bind("console test"));
			addChoice("copy pixels", test.bind("copy pixels test"));
			addChoice("rng", test.bind("rng test"));
			addChoice("button line", test.bind("button line test"));
			addChoice("disable pause", test.bind("disable pause test"));
			addChoice("unlockpiece", test.bind("unlock piece test"));
			addChoice("examine", test.bind("examine test"));
			addChoice("small choice", test.bind("small choice test"));
			addChoice("history", test.bind("history test"));
			addChoice("volume", test.bind("volume test"));
			addChoice("drop items", test.bind("drop items test"));
			addChoice("mood", test.bind("mood test"));
			addChoice("myntQueueAddTextChoice", test.bind("myntQueueAddTextChoice test"));*/
			
			if (internal) addChoice("theme unlock", test.bind("theme unlock test"));

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "selfauto") {
			var auto:MintSprite = addSprite("img/effect/autoShop");
			auto.x = GAME_WIDTH/2 - auto.width/2;
			auto.y = GAME_HEIGHT/2 - auto.height/2;
			addChoice("Begin.", test.bind("selfauto2"));
			addChoice("Back.", test.bind("main"));
		}

		if (seg == "selfauto2") {
			disablePause();
			playSound("audio/mynt/intro");
			var auto:MintSprite = addSprite("img/effect/autoShop");
			auto.x = GAME_WIDTH/2 - auto.width/2;
			auto.y = GAME_HEIGHT/2 - auto.height/2;

			var mintFace:MintSprite = addSprite("img/effect/mintAutoShop");
			mintFace.x = auto.x;
			mintFace.y = auto.y;
			mintFace.tint = 0xFFFFFFFF;
			mintFace.alpha = 0;

			var auto1:MintSprite = addSprite("img/effect/autoShop");
			auto1.alpha = 0;
			auto1.x = auto.x;
			auto1.y = auto.y;
			auto1.scaleX = 0;
			auto1.scaleY = 0;

			var auto2:MintSprite = addSprite("img/effect/autoShop");
			auto2.alpha = 0;
			auto2.x = GAME_WIDTH - auto2.width - 10;
			auto2.y = auto.y;
			auto2.scaleX = 0;
			auto2.scaleY = 0;

			var auto3:MintSprite = addSprite("img/effect/autoShop");
			auto3.alpha = 0;
			auto3.x = 10;
			auto3.y = auto.y;
			auto3.scaleX = 0;
			auto3.scaleY = 0;

			var canvas:MintSprite = new MintSprite();
			prepareSprite(canvas);
			canvas.setupCanvas("img/effect/autoShop", GAME_WIDTH, GAME_HEIGHT);

			var e:Emitter = emitterCreate("spritesheet/berryParticles");
			e.sprite.layer = Main.ADD_SPRITE_LAYER+1;
			e.position.minX = -30;
			e.position.minY = -30;
			e.position.maxX = GAME_WIDTH+30;
			e.position.maxY = GAME_HEIGHT+30;
			e.speed.min = 15;
			e.speed.max = 20;
			e.angle.min = 0;
			e.angle.max = 360;
			e.lifeSpan.min = 1;
			e.lifeSpan.max = 1;

			var emitterPos:Point = new Point(400, 300);
			//tween(e.position, {minX: e.position.minX+rndInt(-50, 50), maxX: e.position.minX+rndInt(-50, 50)}, 1, {type: PINGPONG});
			//tween(e.position, {minY: GAME_HEIGHT-50, maxY: GAME_HEIGHT-100}, 3, {type: PINGPONG});

			var goCrazyTimer:Int = 0;
			var emitTimer:Int = 0;
			var emitTimer2:Int = 0;
			var emitTimer3:Int = 0;

			function goCrazy():Void {
				if (getItem("AUTO-MYNT").amount >= 777777) {
					timerCancel(goCrazyTimer);
					clearChoices();
					addChoice("Back.", test.bind("main"));

					timer(5, function() {
						for (i in 0...3) {
							var emitTimer:Int = timer(0.01, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);

							var emitTimer2:Int = timer(0.02, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);

							var emitTimer2:Int = timer(0.02, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);
						}
					});
					return;
				}
				for (i in 0...8) {
					if (Math.random() < 0.2 && getItem("AUTO-MYNT").amount < 776778) addToItem("AUTO-MYNT", rndInt(999, 1200));
					if (getItem("AUTO-MYNT").amount < 777777 && getItem("AUTO-MYNT").amount >= 776778) addToItem("AUTO-MYNT", 777777 - getItem("AUTO-MYNT").amount);
					canvas.copyPixels(0, 0, 342, 311, Math.round(rndFloat(-auto.width/2, GAME_WIDTH)), Math.round(rndFloat(-auto.height/2, GAME_HEIGHT)));
				}
			}

			tween(auto, {y: auto.y + 2}, 0.05, {type: PINGPONG});
			tween(mintFace, {y: auto.y + 2}, 0.05, {type: PINGPONG});
			tween(mintFace, {alpha: 1}, 6.5, {onComplete: function() {
				mintFace.tint = 0x00000000;
				playSound("audio/environment/autoshop");
				playSound("audio/environment/mintAppears");
				auto.cancelTweens();
				mintFace.cancelTweens();
			}});

			timer(9, function() {
				playSound("audio/environment/autoshop");
				tween(auto, {x: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(mintFace, {x: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto1, {scaleX: 1, scaleY: 1, x: GAME_WIDTH - auto1.width - 10, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				addToItem("AUTO-MYNT", 1);
			});

			timer(12, function() {
				playSound("audio/environment/autoshop");
				timer(0.2, playSound.bind("audio/environment/autoshop"));
				tween(auto, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(mintFace, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto1, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto2, {scaleX: 1, scaleY: 1, y: GAME_HEIGHT - 10 - auto2.height, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				tween(auto3, {scaleX: 1, scaleY: 1, y: GAME_HEIGHT - 10 - auto3.height, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				addToItem("AUTO-MYNT", 1);
				addToItem("AUTO-MYNT", 1);
			});

			timer(16, function() {
				goCrazyTimer = timer(0.05, function() {
					playMusic("autoSpam", true);
					goCrazy();
				}, 99999);
			});

			hookClear(function() {
				emitterDestroy(e);
				Engine.hideFps();
				timerCancel(emitTimer);
				timerCancel(emitTimer2);
				timerCancel(emitTimer3);
			});

			addChoice("Back.", test.bind("devteleportnewscenes"));
		}

		if (seg == "engineticsParticles") {
			var e:Emitter = emitterCreate("spritesheet/berryParticles");
			e.sprite.layer = Main.CHOICE_BOX_LAYER+1;
			e.position.minX = 0;
			e.position.minY = GAME_HEIGHT+50;
			e.position.maxX = GAME_WIDTH-5;
			e.position.maxY = GAME_HEIGHT+70;
			e.speed.min = 1;
			e.speed.max = 2;
			e.angle.min = 60;
			e.angle.max = 120;
			e.lifeSpan.min = 1;
			e.lifeSpan.max = 3;

			var emitterPos:Point = new Point(200, 200);
			//tween(e.position, {minX: e.position.minX+rndInt(-50, 50), maxX: e.position.minX+rndInt(-50, 50)}, 1, {type: PINGPONG});
			//tween(e.position, {minY: GAME_HEIGHT-50, maxY: GAME_HEIGHT-100}, 3, {type: PINGPONG});

			var emitTimer:Int = timer(0.05, function() {
				emitterEmit(e, e.sprite.frameNames[0]);
			}, 9999999);

			addChoice("explode 100", function() {
				for (i in 0...100) emitterEmit(e, e.sprite.frameNames[0]);
			});

			addChoice("explode 1000", function() {
				for (i in 0...1000) emitterEmit(e, e.sprite.frameNames[0]);
			});

			addChoice("showFps", function() {
				Engine.showFps();
			});

			hookClear(function() {
				emitterDestroy(e);
				Engine.hideFps();
				timerCancel(emitTimer);
			});

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "endings") {
			var base:MintSprite = addSprite("assets/img/effect/endings/endingsBase.png");
			base.x = GAME_WIDTH/2-base.width/2;
			base.y = GAME_HEIGHT/2-base.height/2;

			var mint:MintSprite = addSprite("assets/img/effect/endings/mint.png");
			var proto:MintSprite = addSprite("assets/img/effect/endings/protocol.png");
			var sep:MintSprite = addSprite("assets/img/effect/endings/septrica.png");
			var mynt:MintSprite = addSprite("assets/img/effect/endings/mynt.png");
			var meet:MintSprite = addSprite("assets/img/effect/endings/meteorite.png");
			var endMap:Map<String, MintSprite> = [
				"mynt" => mynt,
				"meteorite" => meet,
				"protocol" => proto,
				"septrica" => sep,
				"mint" => mint
			];

			var endButtX:Float = 0;
			var delay:Float = 0;

			for (endButtName in ["protocol", "septrica", "mynt", "mint", "meteorite"]) {
				var endButt:MintSprite = endMap.get(endButtName);
				endButt.x = -endButt.width;
				endButt.y = base.y+base.height/1.7-endButt.height/2;
				
				tween(endButt, {x: base.x+endButt.width/1.5+endButtX}, 0.5, {ease: ELASTIC_OUT, startDelay: delay+0.1});
				endButtX += endButt.width*1.2;
				delay += 0.1;

				if (data.endingsUnlocked.contains(endButtName)) {
					endButt.setupImage("assets/img/effect/endings/"+endButtName+".png");
				} else {
					endButt.setupImage("assets/img/effect/endings/lock.png");
				}

				var endingNameArray:Array<String> = endButtName.split("");
				var questionMarks:Int = endingNameArray.length;
				endingNameArray = [];
				for (q in 0...questionMarks)
					endingNameArray.push("?");
				var endButtCensor:String = endingNameArray.join("");

				endButt.onHover = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						endButt.applyGlowEffect(0xFFFFFF);
						showToolTipOnCursor(""+endButtName.toTitleCase()+" Ending", "");
					} else {
						endButt.applyGlowEffect(0x000000);
						showToolTipOnCursor(endButtCensor+" Ending", "");
					}
				}

				endButt.onHoverOnce = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						playSound("assets/audio/ui/hover3");
					} else {
						playSound("assets/audio/ui/hover2");
					}
				}

				endButt.onUnHoverOnce = function() {
					endButt.clearEffects();
				}

				endButt.onReleaseOnce = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						msg("Get teleported motherfucker", true);
						playSound("assets/audio/ui/topClick");
					} else {
						StoryUtils.nopeWiggle([endButt]);
						playSound("assets/audio/ui/nope");
					}
				}
			}

			function unlockEnding(endingName:String):Void {
				data.endingsUnlocked.push(endingName);
				var endButt:MintSprite = endMap.get(endingName);
				playSound("assets/audio/ui/endingUnlocked");

				tween(endButt, {scaleX: 0, scaleY: 0}, 1.25, {onComplete: function() {
					endButt.setupImage("assets/img/effect/endings/"+endingName+".png");
					var poof:MintSprite = addSprite("assets/img/effect/poof");
					poof.looping = false;
					poof.animFrameRate = 25;
					poof.centerPivot = true;
					poof.x = endButt.x-poof.width/3;
					poof.y = endButt.y-poof.height/3;

					tween(endButt, {scaleX: 1, scaleY: 1, alpha: 1}, 0.9, {ease: ELASTIC_OUT});
				}, ease: QUAD_IN});
				
			}
			
			for (key in endMap.keys())
				addChoice(key, unlockEnding.bind(key));
			addChoice("Go back.", test.bind("tests"));
		}

		if (seg == "copy text") {
			appendTextField("This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text. This is some test text.");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "save debug") {
			addChoice("Test if mynt is on", function() {
				clearText();
				append((StaticExtern.isMyntOn?"True":"False"));
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "generateNewCipher") {
				StoryUtils.generateCipher();
				append(data.cipherMap.toString());
				/*var abcUpper:String = abcLow.toUpperCase();
				var nameToArray:Array<String> = data.playerName.split("");

				var cipherValues:Array<String> = [];
				var newCipherValues:Array<String> = [];
				var nameToArray:Array<String> = data.playerName.split("");
				for (key in data.cipherMap.keys()) {
					var result:String = data.cipherMap.get(key);
					cipherValues.push(result);
				}
				for (char in nameToArray) {
					var asciiChar:Int = char.charCodeAt(1);
					if (asciiChar > 90) asciiChar = 90;
					if (asciiChar < 65) asciiChar = 65;

					newCipherValues = cipherValues.splice(Math.round(cipherValues.length*(asciiChar*0.01)), (Math.round(10*asciiChar*0.01)));
					if (asciiChar > 12)
						newCipherValues.reverse();
					for (value in newCipherValues)
						cipherValues.insert(Math.round(cipherValues.length*(asciiChar*0.01)), value);
				}

				append(cipherValues.toString());

				for (value in cipherValues)
					for (key in data.cipherMap.keys())
						data.cipherMap.set(key, value);
			}*/
			addTextChoice(function(str) {
				data.playerName = str;
				test("generateNewCipher");
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "cipher") {
			addTextChoice(function(str) {
				test("cipher");
				str = StoryUtils.cipherize(str);
				append(str);
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "mood test") {
			addChoice("Anotha one.", function() {
				test("mood test");
				append("\n\n"+(isActive("Mood Ring")?getMood():""));
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "benchmark tests") {
			addChoice("sprite bench", test.bind("sprite bench test"));
			addChoice("copy tile bench", test.bind("copy tile bench test"));
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "myntQueueAddTextChoice test") {
			showMynt();
			myntQueueHideChoices();
			myntQueueSay("This is a test");
			myntQueueAddTextChoice(function(str) {
				myntQueueSay("The string your gave was "+str);
				myntQueueSay("This concludes the test");
				myntQueueCall(function() {
					test("main");
					hideMynt();
				});
			});

			myntQueueShowChoices();
		}

		if (seg == "drop items test") {
			function spawnItem(itemName:String):Void {
				if (itemName == "Glowberry") {
					var s:MintSprite = addSprite("assets/img/effect/exploreGlowberries.png");
					s.x = GAME_WIDTH;
					s.y = 60+Math.random()*200;
					s.rotation = 100+400*Math.random();
					tween(s, {y: GAME_HEIGHT-100-s.height}, 1.5, {ease: BOUNCE_OUT});
					tween(s, {x: GAME_WIDTH*0.5*Math.random()+50, rotation: (Math.random() > 0.5 ? 0 : 180)}, 2, {ease: QUAD_OUT});

					s.onReleaseOnce = function(){
						addToItem("Glowberry", 1);
						s.destroy();
					}
				} else if (itemName == "Sweetgrass Leaf") {
					var s:MintSprite = addSprite("assets/img/effect/exploreSweetgrass.png");
					s.x = 60+Math.random()*400;
					s.y = GAME_HEIGHT-60-s.height;
					s.scaleY = 0;
					tween(s, {scaleY: 1, y: s.y-40}, 1.5, {ease: ELASTIC_OUT});

					s.onReleaseOnce = function(){
						var amount:Int = Math.round(3*Math.random());
						addToItem("Sweetgrass Leaf", amount);
						s.destroy();
					}
				}
			}

			addChoice("Spawn Glowberry.", spawnItem.bind("Glowberry"));
			addChoice("Spawn Sweetgrass.", spawnItem.bind("Sweetgrass Leaf"));
			addChoice("Go back.", test.bind("tests"));
		}

		if (seg == "effect tests") {
			addChoice("tween", Test.test.bind("tween test"));
			addChoice("glitch effect", test.bind("glitch effect test"));
			addChoice("shrink", test.bind("shrink test"));
			addChoice("rain", test.bind("rain test"));
			addChoice("empty render", test.bind("empty render test"));
			addChoice("drawPixels", test.bind("drawPixels test"));
			addChoice("pivot", test.bind("pivot test"));
			addChoice("complexAnim", test.bind("complexAnim test"));
			addChoice("setupCanvas", test.bind("setupCanvas test"));
			addChoice("tilemap", test.bind("tilemap test"));
			addChoice("emitter", test.bind("emitter test"));
			addChoice("emoji singleline", test.bind("emoji singleline test"));
			addChoice("clip", test.bind("clip test"));
			addChoice("msg", Test.test.bind("msg test"));
			addChoice("high", test.bind("high test"));

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "high test") {
			append("\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"

Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC

\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"");
			addChoice("Minimum.", function() {
				test("high test");
				highEffect(400);
			});
			addChoice("Soft.", function() {
				test("high test");
				highEffect();
			});
			addChoice("Hard.", function() {
				test("high test");
				highEffect(1200);
			});
			addChoice("Brutal.", function() {
				test("high test");
				highEffect(3000);
			});
			addChoice("Go back.", test.bind("tests"));
		}

		if (seg == "msg test") {
			addChoice("msg1", msg.bind("This is a test"));
			addChoice("msg2", msg.bind("This message <!b>Has bold<!b>!"));
			addChoice("Go back.", test.bind("tests"));
		}

		if (seg == "examine test") {
			addChoice("<!b>examine();<!b> function test.", test.bind("examine function test"));
			addChoice("<!b>config.oneTime<!b> test.", test.bind("config onetime test"));
			addChoice("Go back.", test.bind("tests"));
		}

		if (seg == "examine function test") {
			append("This is a test for the <!b>examine();<!b> function in StoryUtils.");

			examine("Examine teacup.", "You look at the teacup.");
			examine("Examine dog.", "You pet the dog.");
			examine("Examine benis.", "You pet the benis.");
			examine("Examine this system.", "Upsides: looks cleaner, saves which choices you've chosen.\nDownsides: Can't use kink symbols or set var upon clicking. Would need to pass a void to void and a button config, and at that rate it might as well just be part of the button config.");
			addChoice("Reset data.examinedStuff.", function () {
				data.examinedStuff = [];
				msg("data.examinedStuff reset.");
				test("examine function test");
			});
			addChoice("Go back.", test.bind("examine test"));
		}

		if (seg == "config onetime test") {
			append("This is a test for the <!b>config.oneTime<!b> button config in Main.");

			addChoice("Examine cunt.", function () {
				clearText();
				append("You peer at the pussy.");
			}, {kinks: ["Female"], oneTime: true});
			addChoice("Examine this system.", function () {
				clearText();
				append("Downsides: ugly, possibly too many configs, not sure how to save which ones you've chosen.\nUpsides: Very flexible, can do anything a choice might need to do. Probably the winner just for that reason.");
			}, {kinks: ["Plot"], oneTime: true});
			addChoice("Go back.", test.bind("examine test"));
		}

		if (seg == "unlock piece test") {
			var piecesLeft:Array<String> = ["playerMenu", "background", "choiceBox", "topBar", "mynt"];
			for (i in 0...5) {
				var removedPiece:String = piecesLeft.pop();
				if (!Theme.isUnlocked("suave", removedPiece)) piecesLeft.unshift(removedPiece);
			}

			if (piecesLeft.length > 0) {
				var chosenPart:String = pickOne(piecesLeft);
				Theme.addUiChoice("suave", chosenPart);
			}
			print(piecesLeft);
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "disable pause test") {
			addChoice("Disable.", function () {disablePause();});
			addChoice("Enable.", function () {enablePause();});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "text tests") {
			addChoice("emoji", test.bind("emoji test"));
			addChoice("text", Test.test.bind("text test"));
			addChoice("half text", test.bind("half text test"));
			addChoice("unified format", Test.test.bind("unified format test"));
			addChoice("text align", test.bind("text align test"));
			addChoice("bumpy effect", test.bind("bumpy effect test"));
			addChoice("prompt", test.bind("prompt test"));
			addChoice("This is a very long button that does nothing but show how buttons go off the right side of the screen if they are long enough which should not happen because it looks kind of ugly to be quite honest and frank about the situation at hand", function(){ append("poop"); });

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "game tests") {
			addChoice("caves", test.bind("cave tests"));
			addChoice("blackjack kemp", test.bind("blackjack kemp test"));
			addChoice("blackjack red", test.bind("blackjack red test"));
			addChoice("blackjack rox", test.bind("blackjack rox test"));
			addChoice("blackjack som", test.bind("blackjack som test"));
			addChoice("blackjack sep", test.bind("blackjack sep test"));
			addChoice("new lilac", test.bind("new lilac test"));
			addChoice("degrade", test.bind("degrade test"));

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "cave tests") {
			for (assetPath in getAssetList()) {
				if (assetPath.contains(".tmx")) {
					var baseNameSplit:Array<String> = assetPath.split(".");
					baseNameSplit.pop();
					baseNameSplit = baseNameSplit.join("").split("/");
					var baseName:String = baseNameSplit.pop();

					addChoice(baseName, function() {
						StaticCallbacks.goCaves(baseName+".tmx", test.bind("tests"));
					});
				}
			}

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "new lilac test") {
			Lilac.startGame(test.bind("new lilac win"), test.bind("new lilac lose"));
		}

		if (seg == "new lilac win") {
			append("You won");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "new lilac lose") {
			append("You lost");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "clip test") {
			var sprite:MintSprite = addSprite("assets/img/effect/owlGirl.png");
			sprite.setClip(0, 0, 800, 300);
			tween(sprite, {rotation: 360}, 2, {type: LOOP});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "rain test") {
			append("It's raining. This text should still be readable.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.\n\nNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.\n\nUt enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?");
			rainEffect("ultrabrutal");
			addChoice("Back.", test.bind("tests"));
		}

		if (seg == "shrink test") {
			data.buttonSize = 14;
			if (data.buttonSize != 0) addChoice("<!"+data.buttonSize+"px>Shrink this button.<!"+data.buttonSize+"px>", function () {
				data.buttonSize--;
				test("shrink test");
			});
			addChoice("Reset.", function () {
				data.buttonSize = 14;
				test("shrink test");
			});
			addChoice("Go back.", test.bind("main"));
		}
		if (seg == "text test") {
			var i:Int = 0;
			timer(0.1, function() {
				append("This <!b>is<!b> some <!i>test<!i> <!u>text<!u>."+(i++)+"\n");
			}, 100);
			addChoice("more", test.bind("more text test"));
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "more text test") {
			for (i in 0...Math.round(Math.random()*100+100)) append("Test"+i+"\n");
			addChoice("more", test.bind("more text test"));
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "tween test") {
			var perRow:Int = 4;
			var perCol:Int = 3;
			for (i in 0...10) {
				var s:MintSprite = addRectSprite(50, 50, 0xFF0000);
				s.x = (i%perRow)*(GAME_WIDTH/perRow);
				s.y = Std.int(i/perRow)*(GAME_HEIGHT/perCol);

				if (i == 0) tween(s, {x: s.x+100}, 0.5, {type: PINGPONG});
				if (i == 1) tween(s, {scaleX: 2}, 1, {type: PINGPONG});
				if (i == 2) {
					s.centerPivot = false;
					tween(s, {scaleX: 2}, 1, {type: PINGPONG});
				}
				if (i == 3) tween(s, {scaleX: 0.5, scaleY: 0.5}, 1, {type: PINGPONG});
				if (i == 4) tween(s, {rotation: 180}, 1, {type: PINGPONG});
				if (i == 5) {
					s.centerPivot = false;
					tween(s, {rotation: 180}, 1, {type: PINGPONG});
				}
				if (i == 6) tween(s, {x: s.x+100, rotation: 180}, 1, {type: PINGPONG});
				if (i == 7) {
					s.centerPivot = false;
					tween(s, {x: s.x+100, rotation: 180}, 1, {type: PINGPONG});
				}
				if (i == 8) tween(s, {x: s.x+100, scaleX: 2}, 1, {type: PINGPONG});
				if (i == 9) {
					s.centerPivot = false;
					tween(s, {x: s.x+100, scaleX: 2}, 1, {type: PINGPONG});
				}
			}

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "unified format test") {
			setLocation("<!i>Italic land<!i>");
			append("This is <!i>show<!i> that you can <!u>format<!u> text <!b>anywhere!<!b>\n\n");
			append("<!10px>This<!10px> text <!20px>varies<!20px><!14px> in size.<!14px>\n");
			addChoice("Go <!b>BACK.<!b>", test.bind("main"), {toolTip: "Even <!u>tooltips<!u>"});
		}

		if (seg == "advanced item test") {
			addChoice("Get 1 capsule", test.bind("advanced item test"), {give: ["Capsule", 1]});
			addChoice("Get 1 leaf and 1 capsule", test.bind("advanced item test"), {give: ["Sweetgrass Leaf", 1, "Capsule", 1]});
			addChoice("Lose 1 capsule", test.bind("advanced item test"), {take: ["Capsule", 1]});
			addChoice("Lose 1 capsule(alt)", test.bind("advanced item test"), {give: ["Capsule", -1]});
			addChoice("Spend simple", test.bind("advanced item test"), {req: ["Capsule", 5], take: ["Capsule", 5]});
			addChoice("Spend complex", test.bind("advanced item test"), {cost: ["Sweetgrass Leaf", 3, "Capsule", 5]});
			addChoice("Spend complex(alt)", test.bind("advanced item test"), {req: ["Sweetgrass Leaf", 3, "Capsule", 5], take: ["Sweetgrass Leaf", 3, "Capsule", 5]});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "swf test") {
			addMovie("goatOral", 35);
			movieToFrame("goatOral", "dick_mc", 2);
			resizeMovie("goatOral", 300);
			moveMovie("goatOral", 60, 0);
			addChoice("Back.", test.bind("tests"));
		}

		if (seg == "glitch effect test") {
			var sprite:MintSprite = addSprite("assets/img/effect/owlGirl.png");
			sprite.applyGlitchEffect();
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "emoji test") {
			append("This is a test of emojis, like this abuse one: <!img:kink/Abuse.png>, or <!b>these one's <!img:kink/Male.png> <!img:kink/Female.png> here<!b>(format mix test)\n\n");

			var s:String = "";
			for (i in 0...10) s += "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget porttitor nisi, sit amet fermentum diam. Vivamus pulvinar orci elit. Nam eu dui id mauris ultricies efficitur id pellentesque quam. Maecenas nulla mauris, fringilla vel vulputate et, blandit at lectus. Nulla commodo dui tellus, sit amet egestas est ultricies eu. Donec nec placerat lectus, non auctor libero. Curabitur in pharetra arcu, venenatis dapibus augue. In euismod nulla magna. Quisque imperdiet iaculis faucibus. Proin eu libero vitae velit vehicula mollis condimentum a neque. Ut pharetra fringilla vulputate. Etiam lobortis purus ac ante feugiat, in volutpat est congue. In cursus lectus sit amet felis ullamcorper venenatis. Pellentesque lacus nunc, tempor sed arcu vel, sollicitudin sodales velit.\n\n";

			var kinkList:Array<String> = [
				"Abuse", "Baby", "Cub", "Feral", "Gore", "Hyper", "Patreon Commission",
				"Pregnancy", "Scat", "Intersex", "Vomit", "Art", "Blood", "Female",
				"Foodplay", "Guest Writer", "Male", "Plot", "Raunch", "Snuff", "Trash", "Piss"
			];

			for (i in 0...100) {
				var add:Int = Math.round(Math.random()*10);
				if (s.length < i*100+add) break;
				s = s.substring(0, i*100+add)+"<!img:kink/"+pickOne(kinkList)+".png>"+s.substring(i*100+add+1, s.length);
			}
			append(s);
			addChoice("More tests emojis        <!img:effect/systemNext.png>        ", msg.bind("Such emoji <!img:kink/Art.png>  "), {toolTip: "Yeah, in here too. <!img:kink/Art.png>"});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "blackjack kemp test") {
			Blackjack.startGame(KEMP, test.bind("blackjack win"), test.bind("blackjack lose"));
			addChoice("Let's play!", function() { Blackjack.startRound(); });
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack rox test") {
			Blackjack.startGame(ROXELLE, test.bind("blackjack win"), test.bind("blackjack lose"));
			addChoice("Let's play!", function() { Blackjack.startRound(); });
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack red test") {
			Blackjack.startGame(RED, test.bind("blackjack win"), test.bind("blackjack lose"));
			addChoice("Let's play!", function() { Blackjack.startRound(); });
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack som test") {
			Blackjack.startGame(SOM, test.bind("blackjack win"), test.bind("blackjack lose"));
			addChoice("Let's play!", function() { Blackjack.startRound(); });
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack sep test") {
			Blackjack.startGame(SEPTRICA, test.bind("blackjack win"), test.bind("blackjack lose"), true);
			addChoice("Let's play!", function() { Blackjack.startRound(); });
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack win") {
			append("You won the blackjack game!");
			addChoice("Back.", function(){
				Blackjack.endGame();
				test("game tests");
			});
		}

		if (seg == "blackjack lose") {
			append("You lost the blackjack game!");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "half text test") {
			halfWidthText();
			append("This is a really long sentence that would normally not wrap around the screen but will in this case because I called halfWidthText() first");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "degrade test") {
			var generateDegrade:Void->Void;
			var kinkList:Array<String> = ["Cub", "Baby", "Gore", "Piss", "Raunch", "Scat", "Vomit", "Trash", "Snuff"];
			var enabledKinks:Array<String> = data.dpgEnabledKinks;

			var prefixList:Array<String> = ["cock", "fuck", "slut", "cum", "dick", "whore", "slut", "booty"];
			var suffixList:Array<String> = ["meat", "slut", "whore", "toy", "bitch", "skank", "cunt", "slave", "rag", "hole", "kitten", "thing", "muffin", "puppet", "sock"];

			var prefixMap:Map<String, Array<String>> = [
				"shit" => ["Scat"],
				"poopy" => ["Scat"],
				"puke" => ["Vomit"],
				"vomit" => ["Vomit"],
				"piss" => ["Piss"],
				"urinal" => ["Piss"],
				"stank" => ["Raunch"],
				"stinky" => ["Raunch"],
				"smeg" => ["Raunch"],
				"musk" => ["Raunch"],
				"trash" => ["Trash"],
				"garbo" => ["Trash"],
				"dumpster" => ["Trash"],
				"toilet" => ["Scat", "Piss"],
				"filth" => ["Scat", "Vomit", "Piss", "Raunch"],
				"baby" => ["Baby"],
				"toddler" => ["Baby"],
				"cub" => ["Cub"],
				"kiddy" => ["Cub"],
				"snuff" => ["Snuff"],
				"murder" => ["Snuff"],
				"torture" => ["Gore"],
				"meat" => ["Gore"],
				];

				var suffixMap:Map<String, Array<String>> = [
					"dumpster" => ["Trash"],
					"toilet" => ["Scat", "Piss"],
					"mop" => ["Scat", "Vomit", "Piss", "Raunch"],
					"stain" => ["Scat", "Vomit", "Piss", "Raunch"],
					"pig" => ["Scat", "Vomit", "Raunch"],
					"piggy" => ["Scat", "Vomit", "Raunch"],
					"baby" => ["Baby"],
					"toddler" => ["Baby"],
					"babe" => ["Baby"],
					"tod" => ["Baby"],
					"cub" => ["Cub"],
					"meat" => ["Gore"],
				];

					var updateKinks:Void->Void;

					function updateKinks() {
						prefixList = ["cock", "fuck", "slut", "cum", "dick", "whore", "slut", "booty"];
						suffixList = ["meat", "slut", "whore", "toy", "bitch", "skank", "cunt", "slave", "rag", "hole", "kitten", "thing", "muffin", "puppet", "sock"];

						for (key in prefixMap.keys())
							for (kinkType in prefixMap.get(key))
								if (enabledKinks.contains(kinkType))
									if (!prefixList.contains(key))
										prefixList.push(key);

						for (key in suffixMap.keys())
							for (kinkType in suffixMap.get(key))
								if (enabledKinks.contains(kinkType))
									if (!suffixList.contains(key))
										suffixList.push(key);
					}

					updateKinks();

					var dpgTerminal:MintSprite = addSprite("assets/img/effect/dpg");
					dpgTerminal.x = GAME_WIDTH/2-dpgTerminal.width/2;
					dpgTerminal.y = GAME_HEIGHT/2-dpgTerminal.height/2;
					dpgTerminal.alpha = 0;
					tween(dpgTerminal, {alpha: 1}, 0.8, {ease: QUINT_OUT});

					var chosenPrefix:MintText = addText();
					var chosenSuffix:MintText = addText();

					var kinkSpriteX:Float = 0;
					var delay:Float = 0;

					for (kinkString in kinkList) {
						delay += 0.05;
						var kinkSprite = addSprite("assets/img/kink/"+kinkString+".png");
						kinkSpriteX += kinkSprite.width*1.3;
						kinkSprite.x = dpgTerminal.x+kinkSpriteX-10;
						kinkSprite.y = dpgTerminal.y*1.3;
						kinkSprite.alpha = 0;
						if (enabledKinks.contains(kinkString)) kinkSprite.applyGlowEffect(0x448328) else kinkSprite.tint = 0xCC000000;

						tween(kinkSprite, {x: dpgTerminal.x+kinkSpriteX, alpha: 1}, 0.6, {ease: QUINT_IN, startDelay: delay});

						kinkSprite.onHover = function() {
							Tooltip.showOnCursor(kinkString+" Combos");
						}

						kinkSprite.onReleaseOnceAnywhere = function () {
							if (enabledKinks.contains(kinkString)) {
								enabledKinks.remove(kinkString);
								kinkSprite.clearEffects();
								kinkSprite.tint = 0xCC000000;
								playSound("assets/audio/ui/tak");
							} else {
								enabledKinks.push(kinkString);
								kinkSprite.tint = 0x00000000;
								kinkSprite.applyGlowEffect(0x448328);
								playSound("assets/audio/ui/toggle");
							}

							tween(kinkSprite, {y: kinkSprite.y+1}, 0.1, {type: REVERSE});
							updateKinks();
						}
					}

					var timesPressed:Int = 0;

					var dpgButton:MintSprite = new MintSprite();
					dpgButton.layer = Main.ADD_SPRITE_LAYER;
					dpgButton.setupCanvas("effect/buttons", 189, 47);
					dpgButton.copyTile("anotherOne1", 0, 0);
					dpgButton.mouseEnabled = true;
					dpgButton.alpha = 0;
					dpgButton.x = dpgTerminal.x+dpgTerminal.width/2-dpgButton.width/2;
					dpgButton.y = dpgTerminal.y+dpgTerminal.height/1.5;
					dpgButton.onReleaseOnceAnywhere = function() {
						if (timesPressed != 50) timesPressed++;
						playSound("assets/audio/ui/explore");
						dpgButton.fillPixels(0, 0, Math.round(dpgButton.width), Math.round(dpgButton.height), 0x00000000);
						dpgButton.copyTile("anotherOne2", 0, 0);
						dpgButton.mouseEnabled = false;
						generateDegrade();
					}
					prepareSprite(dpgButton);
					tween(dpgButton, {alpha: 1}, 1, {ease: QUINT_OUT});

					function checkRewards():Void {
						var chosen:String = chosenPrefix.getText()+chosenSuffix.getText();

						if (GameData.dpgRewardsMap.exists(chosen) && !data.dpgFoundCombos.contains(chosen)) {
							data.dpgFoundCombos.push(chosen);
							var rarity:String = GameData.dpgRewardsMap.get(chosen)[0];
							var itemName:String = GameData.dpgRewardsMap.get(chosen)[2];
							var itemAmount:Int = 1;

							if (rarity == "Rare") {
								itemAmount = Math.round(Math.random()*2+1);
							}

							if (rarity == "Mythical") {
								itemAmount = Math.round(Math.random()*3+1);
							}

							playSound("assets/audio/environment/caveWinSmall", "reward");
							clearText();
							append(rarity+" Combo: <!b>"+chosen.toTitleCase()+"<!b>\n<!i>"+GameData.dpgRewardsMap.get(chosen)[1]+"<!i>");
							addToItem(itemName, itemAmount);
						}
					}

					generateDegrade = function() {
						var iterationTime:Float = Math.random()*0.03+0.1-timesPressed*0.001;
						var currentFlip:Int = 0;
						var preFlip:Int = Math.round(Math.random()*4+2);
						while (preFlip % 2 != 0) preFlip = Math.round(Math.random()*4+2);
						var sufFlip:Int = Math.round(Math.random()*2+6);
						while (sufFlip % 2 != 0) sufFlip = Math.round(Math.random()*2+6);

						tween(dpgButton, {y: dpgButton.y+1}, 0.1, {type: REVERSE});

						chosenPrefix.setFormat({wordWrap: false, fontColour: 0xCECECE, fontSize: 22});
						chosenSuffix.setFormat({wordWrap: false, fontColour: 0xCECECE, fontSize: 22});

						chosenPrefix.setText(prefixList.pickOne());
						chosenSuffix.setText(suffixList.pickOne([chosenPrefix.getText()]));
						chosenPrefix.y = chosenSuffix.y = dpgTerminal.y+dpgTerminal.height*0.42;
						chosenPrefix.scaleY = chosenSuffix.scaleY = 0;
						chosenPrefix.centerPivot = chosenSuffix.centerPivot = true;

						var iter1:Int = 0;
						var iter2:Int = 0;

						function resetX() {
							chosenPrefix.x = dpgTerminal.x+dpgTerminal.width/2-chosenPrefix.fieldWidth-5;
							chosenSuffix.x = dpgTerminal.x+dpgTerminal.width/2+2;
						}

						function flip(chosen:MintText):Void {
							if (chosen == chosenPrefix) {
								iter1++;
								if ((iter1+1) % 2 == 0) {
									return;
								}
								chosen.setText(prefixList.pickOne());
								resetX();
							}

							if (chosen == chosenSuffix) {
								currentFlip++;
								iter2++;
								if ((iter2+1) % 2 == 0) {
									return;
								}

								chosen.setText(suffixList.pickOne([chosenPrefix.getText()]));

								if (currentFlip < sufFlip) {
									playSound("assets/audio/ui/menuOpen", "rolling");
								} else {
									dpgButton.copyTile("anotherOne1", 0, 0);
									dpgButton.mouseEnabled = true;
									tween(dpgButton, {y: dpgButton.y-1}, 0.1, {type: REVERSE});
									playSound("assets/audio/ui/menuClose", "rolling");
									checkRewards();
								}
								resetX();
							}
						}
						resetX();

						Actuate.tween(chosenPrefix, iterationTime, {scaleY: 1})
							.repeat(preFlip).reflect().ease(Quad.easeOut)
							.onRepeat(flip, [chosenPrefix]);

						Actuate.tween(chosenSuffix, iterationTime, {scaleY: 1})
							.repeat(sufFlip).reflect().ease(Quad.easeOut)
							.onRepeat(flip, [chosenSuffix]);
					}

					setChannelVolume("reward", 0.5);
					setChannelVolume("rolling", 0.5);

					addChoice("<!20px>Pull the lever!<!20px>", function () {
						chosenPrefix.setText("");
						chosenSuffix.setText("");
						generateDegrade();
					});
					addChoice("<!20px>Back.<!20px>", test.bind("main"));
					addChoice("<!20px>Max acceleration<!20px>", function () {
						timesPressed = 50;
					});

		}

		if (seg == "console test") {
			addChoice("Print message", print.bind("I'm a message"));
			addChoice("Give warning", warn.bind("I'm a warning"));
			addChoice("Throw an error", error.bind("I'm an error"));
			addChoice("Throw an error indirectly", function() {
				var x:Dynamic = 0;
				x.functionThatDoesntExist();
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "text align test") {
			var t1:MintText = addText();
			t1.setText("abcABC!?|");
			t1.x = 100;
			t1.y = 200;

			var t2:MintText = addText();
			t2.setText("abcABC!?|");
			t2.x = 100;
			t2.y = 300;

			var r1:MintSprite = addRectSprite(5, 5, 0x0000FF);
			r1.x = t1.x;
			r1.y = t1.y;

			var r2:MintSprite = addRectSprite(t1.fieldWidth, t1.fieldHeight, 0x0000FF);
			r2.x = t2.x;
			r2.y = t2.y;

			warn(t1.toString());
			warn(t2.toString());

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "copy pixels test") {
			var sprite:MintSprite = addSprite("assets/img/effect/taroMenu.png");

			addChoice("Copy some pixels", function() {
				sprite.copyPixels(100, 100, 100, 100, 0, 0);
				sprite.fillPixels(100, 100, 100, 100, 0x00FFFFFF);
			});

			addChoice("Reset image (removed)", function() {
				// sprite.resetPixels(); // Removed
			});

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "rng test") {
			// You can specify the pool to draw from on any of the random functions, see Random.hx
			// To create a new pool simply call rndSeed on it, pools are not serializable (yet)

			// Ranges are inclusive-exclusive so rndInt(0, 10) could make 0, but will never make 10
			// This is because rndFloat(0, 10) would create 0.0 up to 9.9999... and the result will be truncated

			append("Ints (0-10):\n");
			for (i in 0...10) append(rndInt(0, 10)+", ");

			append("\n\nFloats (0-10):\n");
			for (i in 0...10) append(rndFloat(0, 10)+", ");

			append("\n\nClassic:\n");
			for (i in 0...10) append(random()+", ");

			addChoice("Seed with 10", rndSeed.bind(10, 0)); // Seeds generator #0 with the value 10
			addChoice("Seed with 20", rndSeed.bind(20, 0)); // Seeds generator #0 with the value 20
			addChoice("Seed with current time", rndSeed.bind(Math.round(getTimer()), 0)); // Seeds generator #0 with the current time
			addChoice("Reroll", test.bind("rng test"));
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "tilemap test") {
			var mapData:Array<Array<Int>> = [
				[8,8,8,8,8,8,8,8,8,8],
				[8,7,0,0,0,0,0,0,0,8],
				[8,0,0,6,0,0,6,0,0,8],
				[8,0,0,0,0,6,0,0,0,8],
				[8,0,1,2,2,2,2,4,0,8],
				[8,0,0,0,0,0,0,0,0,8],
				[8,0,0,0,0,0,0,0,0,8],
				[8,0,0,0,0,0,0,0,0,8],
				[8,0,0,0,0,0,0,0,1,8],
				[8,8,8,8,8,8,8,8,8,8]
			];

				var tileWidth:Int = 16;
				var tileHeight:Int = 16;
				var tilesWide:Int = mapData[0].length;
				var tilesHigh:Int = mapData.length;

				var tilemap:Tilemap = tilemapCreate("spritesheet/caveTilemap.png", tileWidth, tileHeight, tilesWide, tilesHigh);
				tilemap.sprite.x += 50;
				tilemap.sprite.y += 50;
				tilemap.autotileStart = Caves.WALL_0;
				tilemap.autotileEnd = Caves.WALL_15;

				for (y in 0...tilemap.tilesWide)
					for (x in 0...tilemap.tilesHigh)
						tilemap.setTile(x, y, mapData[y][x]);

				tilemap.autotile();

				hookClear(function() {
					tilemap.destroy();
				});
				addChoice("Go back.", test.bind("main"));
		}

		if (seg == "button line test") {
			function callback(label:String):Void { // This callback event is contains {label:String, index:Int}
				warn("Button named "+label+" was pressed.");
			}

			var buttons:Array<Button> = [];
			// makeLine(labels:Array<String>, callback:Dynamic->Void, xpos:Float, ypos:Float, direction:Direction):Array<Button>;
			buttons.fuse(makeButtonLine(["foo", "bar", "baz"], 100, 100, RIGHT));
			buttons.fuse(makeButtonLine(["abc", "def", "ghi"], 500, 200, LEFT));
			buttons.fuse(makeButtonLine(["123", "456", "789"], 100, 300, DOWN));
			buttons.fuse(makeButtonLine(["quas", "wex", "exort"], 300, 500, UP));
			for (b in buttons) b.result = callback.bind(b.label.text);

			hookClear(function() { // This takes a Void->Void that runs once on the next clear()
				for (b in buttons)
					b.destroy();
			});

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "emitter test") {
			var e:Emitter = emitterCreate("spritesheet/kinkParticles");
			e.position.minX = 200;
			e.position.minY = 200;
			e.position.maxX = 200;
			e.position.maxY = 200;
			e.angle.min = 80;
			e.angle.max = 100;
			e.lifeSpan.min = 2;
			e.lifeSpan.max = 4;

			var particleNames:Array<String> = [];
			for (name in e.sprite.frameNames) particleNames.push(name);

			var emitterPos:Point = new Point(200, 200);
			tween(e.position, {minX: 400, maxX: 400}, 1, {type: PINGPONG});
			tween(e.position, {minY: 300, maxY: 300}, 0.5, {type: PINGPONG});

			var emitTimer:Int = timer(0.05, function() {
				emitterEmit(e, pickOne(particleNames));
			}, 9999999);

			addChoice("explode 100", function() {
				for (i in 0...100) emitterEmit(e, pickOne(particleNames));
			});

			addChoice("explode 1000", function() {
				for (i in 0...1000) emitterEmit(e, pickOne(particleNames));
			});

			addChoice("showFps", function() {
				Engine.showFps();
			});

			hookClear(function() {
				emitterDestroy(e);
				Engine.hideFps();
				timerCancel(emitTimer);
			});

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "bumpy effect test") {
			var start:String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
			var end:String = "";
			var curSize:Int = 14;
			var dir:Int = 1;
			for (i in 0...start.length) {
				var letter:String = start.charAt(i);
				end += '<!${curSize}px>$letter<!${curSize}px>';
				curSize += dir;
				// trace(curSize);
				if (curSize == 17) dir = -1;
				if (curSize == 14) dir = 1;
			}

			// trace(end);
			append(end);
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "theme unlock test") {
			clear();
			append(data.themeUnlocks.toString());
			function unlockAndGo(part:String):Void {
				unlockUi("zeit", part);
				test("theme unlock test");
			}

			for (label in ["playerMenu", "background", "choiceBox", "topBar", "mynt"])
				addChoice("Unlock "+label, unlockAndGo.bind(label));

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "mod test") {
			var spr:MintSprite = addSprite("modLoader.png");
			addChoice("Go back.", test.bind("main"));

			spr.setMagicOnClick(function() {
				loadMod();
			});
		}

		if (seg == "prompt test") {
#if js
			var str:String = js.Browser.window.prompt("Give some text", "");
			append(str);
#end

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "empty render test") {
			var s:MintSprite = new MintSprite();
			s.setupEmpty(800, 600);
			s.fillPixels(0, 0, 100, 100, 0xFFFF0000);
			s.fillPixels(0, 0, 20, 20, 0xFF00FF00);
			prepareSprite(s);
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "drawPixels test") {
			var s:MintSprite = new MintSprite();
			s.setupCanvas("minigame/card", 96, 145);
			s.x = 100;
			s.y = 100;
			prepareSprite(s);

			addChoice("draw 10x10",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1));
			addChoice("draw 10x10 1x.99",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1, 0.99));
			addChoice("draw 10x10 1x.95",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1, 0.95));
			addChoice("draw 10x10 1x.9",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1, 0.9));
			addChoice("draw 10x10 1.01x1.01",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1.01, 1.01));
			addChoice("draw 10x10 1.05x1.05",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x00000000, 1.05, 1.05));
			addChoice("draw 10x10 2x1 blue-ish",	s.drawPixels.bind(10, 10, 20, 20, 0, 0, 0x880000FF, 2));
			addChoice("draw 10x10 offset",	s.drawPixels.bind(10, 10, 20, 20, 10, 10, 0x00000000));
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "pivot test") {
			var spr1:MintSprite = addSprite("effect/chimeraEgg");
			spr1.x = 100;
			spr1.y = 100;
			tween(spr1, {rotation: 90}, 1, {type: PINGPONG});

			var spr2:MintSprite = addSprite("effect/chimeraEgg");
			spr2.pivotX = -100;
			spr2.x = 100;
			spr2.y = 300;
			tween(spr2, {rotation: 90}, 1, {type: PINGPONG});

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "complexAnim test") {
			var anim:ComplexAnim = createComplexAnim("RotateAnim");

			// var anim2:ComplexAnim = createComplexAnim("FullAnim");
			// anim2.x = 300;
			// anim2.y = 200;

			// var scaleAnim:ComplexAnim = createComplexAnim("ScaleAnim");
			// scaleAnim.x = 400;
			// scaleAnim.y = 200;

			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "setupCanvas test") {
			var s:MintSprite = new MintSprite();
			s.setupCanvas("minigame/card", 96, 145);
			prepareSprite(s);

			addChoice("blit K", function() {
				s.copyTile("K", 0, 0);
			});
			addChoice("blit Q", function() {
				s.copyTile("Q", 20, 20);
			});
			addChoice("blit J", function() {
				s.copyTile("J", 50, 50);
			});
			addChoice("blit blue J", function() {
				s.copyTile("J", 50, 50, 0xFF0000FF);
			});
			addChoice("blit less blue J", function() {
				s.copyTile("J", 50, 50, 0x880000FF);
			});
			addChoice("blit 10x10", function() {
				s.copyPixels(10, 10, 20, 20, 0, 0);
			});
			addChoice("blit front", function() {
				s.copyTile("front", 0, 0);
			});
			addChoice("blit back", function() {
				s.copyTile("back", 0, 0);
			});
			addChoice("blit block", function() {
				s.copyPixels(10, 10, 20, 20, 20, 20);
			});
			addChoice("blit block2", function() {
				s.copyPixels(0, 0, 20, 20, 10, 10);
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "small choice test") {
			makeSmallButtons();
			for (i in 0...15) addChoice("This is a test", function() {});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "history test") {
			append("These were the last places you were:\n");
			for (entry in data.history) append(entry+"\n");
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "volume test") {
			function scvTest():Void {
				for (vol in [1, 0.5, 0.25]) {
					timer(vol, function() {
						playSound("assets/audio/ui/tak", "tak"+vol);
						setChannelVolume("tak"+vol, vol);
					});
				}
			}

			function soundConfigTest():Void {
				for (vol in [1, 0.5, 0.25]) {
					timer(vol, function() {
						playSound("assets/audio/ui/tak", "tak"+vol, {startVolume: vol});
					});
				}
			}

			addChoice("Test setChannelVolume", scvTest);
			addChoice("Test soundConfig", soundConfigTest);
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "sprite bench test") {
			var numSprites:Float = 1;
			var transparency:Bool = false;
			var moving:Bool = false;
			var sprites:Array<MintSprite>;
			var imageChoices:Array<String> = ["presentBlueApr", "presentRedApr", "presentRedDec", "presentMintFeb", "presentMintDec"];

			function createScene() {
				clearTemp();
				sprites = [];

				for (i in 0...Std.int(numSprites)) {
					var s:MintSprite = addSprite(pickOne(imageChoices));
					s.x = rndFloat(GAME_WIDTH*0.25, GAME_WIDTH*0.75);
					s.y = rndFloat(GAME_HEIGHT*0.1, GAME_HEIGHT*0.5);
					if (transparency) s.alpha = rndFloat(0.25, 1);
					if (moving) tween(s, {x: s.x + rndFloat(-100, -100), rotation: rndFloat(-90, 90)}, rndFloat(1, 3), {type: PINGPONG, ease: QUAD_IN_OUT});
					sprites.push(s);
				}
			}

			function updateText():Void {
				// trace("Doing");
				clearText();
				append("Sprites: "+Std.int(numSprites)+"\nFps: "+Math.round(getFps()*10)/10);

				if (sprites[0].exists) timer(1, updateText);
			}

			createScene();
			updateText();

			addChoice("x2", function() {
				numSprites *= 2;
				createScene();
			});
			addChoice("x0.5", function() {
				numSprites *= 0.5;
				createScene();
			});
			addChoice("transparent", function() {
				transparency = !transparency;
				createScene();
			});
			addChoice("move", function() {
				moving = !moving;
				createScene();
			});
			addChoice("Go back.", test.bind("main"));
		}

		if (seg == "copy tile bench test") {
			var cardNum:Int = 1;
			var iterTime:Float = 1;
			var timerId:Int;
			var cards:Array<MintSprite> = [];
			Engine.showFps();

			function endBench():Void {
				for (c in cards) c.destroy();
				timerCancel(timerId);
			}

			function doBench():Void {
				endBench();

				cards = [];
				for (i in 0...cardNum) {
					var card:MintSprite = new MintSprite();
					card.setupCanvas("minigame/card");
					card.x = rndFloat(100, GAME_WIDTH-100);
					card.y = rndFloat(100, GAME_HEIGHT-100);
				}

				timerId = timer(iterTime, function() {
					var suits = ["K", "Q", "J"];
					for (c in cards) c.copyTile(suits.pickOne(), rndInt(0, c.width), rndInt(0, c.height));
				}, 999999);
			}

			addChoice("card+1", function() {
				cardNum++;
				doBench();
			});
			addChoice("card-1", function() {
				cardNum--;
				doBench();
			});
			addChoice("iterTime/2", function() {
				iterTime /= 2;
				doBench();
			});
			addChoice("iterTime*2", function() {
				iterTime *= 2;
				doBench();
			});
			addChoice("Go back.", function() {
				endBench();
				Engine.hideFps();
				test("main");
			});
		}
		
		if (seg == "emoji singleline test") {
			addChoice("Go back.", test.bind("main"), {toolTip: "This is an emoji: <!img:kink/Abuse>"});
		}
	}
}
