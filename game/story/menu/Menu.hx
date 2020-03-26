package story.menu;

class Menu {
	public static var creditButtons:Array<MintSprite>;
	public static var creditsOut:Bool;
	public static var creditsText:MintText;
	public static var creditsBg:MintSprite;

	public static var patreon:MintSprite;
	public static var credits:MintSprite;
	public static var timesInfoPressed:Int = 0;
	public static var versionNum:MintText;
	public static var volumeSlider:Slider;

	//Secrets
	public static var savedTint:Int;
	public static var monitorTint:MintSprite;

	public static var tintKink:MintSprite;

	public static var savedMonitor:Int;
	public static var altMonitor:MintSprite;

	public static function menuResolve():Void {
		hideChoices();
		//clear();
		cameraFadeIn(0xFFFFFF, 0.25);

		var rand:Float = Math.random();

		var background:MintSprite = addSprite("assets/img/"+(rand<0.03?"effect/shelter/titleScreenPowered":"intro/titleScreen")+".png");
		if (rand > 0.97) {
			background.tint = 0x40000000;
			background.playing = false;
		}
		var monitor:MintSprite = addSprite("assets/img/intro/monitor.png");
		background.centerPivot = true;
		monitor.centerPivot = true;

		//Main.debug = false;
		//debugMode = false;

		/// Add credits
		creditsBg = addSprite("assets/img/intro/changeLog.png");
		creditsBg.x = 155;
		creditsBg.y = 35;
		creditsBg.alpha = 0;

		creditsText = addText();
		creditsText.setFormat({fontSize: 12, fontColour: 0x0148ba, wordWrapWidth: 494 - 5});
		creditsText.setMaxHeight(creditsBg.height);
		creditsText.x = creditsBg.x+5;
		creditsText.y = creditsBg.y+5;
		creditsText.alpha = 0;
		creditsText.setText("Changelog 1.0.0

<!b> Key Items<!b>
- Added Septricard
- Added Auto-Chip
- Added Privacy Ring
- Added seeds for Roxelle, Red, Cade, Septrica, Marei, and Som

<!b> Unlocked Zeit & Trickster skins for all players<!b>
- One is found at the end of a very short Bright Forest encounter
- One is found after asking a question at the Apothecary lobby

<!b> Endings<!b>
- Added Mynt Ending (unlocks when you give mynt pass)
- Added Mint Ending
- Added Protocol Ending
- Added Septrica Ending
- Added Meteorite Ending (unlocks when you find all other endings, all journal entries, and all seeds)
- Added Credits

<!b> Scenes<!b>
- The fishergoat in Sewer Suburbs now gives you hints about how to progress the plot!!! Use him if you're stuck!
- Added Missing Page 12
- Added Missing Page 13
- Added Missing Page 14
- Added Missing Page 15
- Added Missing Page 16
- Added Cade & Strawberry wedding scene
- Added law lore to the L.L.L. by guest writer
- Added Init piece to the History section of the L.L.L.
- Added Tech section to the L.L.L.
- Added tiny nonsexual ferret dude + Fuckmeat scene to Violet Meteorite
- Added Apothecary tour with Marei
- Added Marei & Thelly arc ending scene
- Added scene where you break into Septrica's
- Added bomb shelter sequence used by multiple endings (+7 photoshopped arts)
- Added two small Red scenes after her Apothecary therapy scene: one in the forest, one in the city! Guest writer: Taylertots

<!b> Art<!b>
- Marei's Present by Fuf
- Roxelle (2 + an animation) by Fuf
- Wolfish Red by Fuf
- Archie Falls by Fuf
- Septrica's Speech by Fuf
- Gryphon presenting by Leveretry
- Gryphon in gown by Leveretry
- Gryphon w/ party hat by Leveretry
- Bomb Shelter photoshopped arts (7) by Kittery
- AUTO-SHOP alt face by Kittery
- Dead Bunny by Kittery
- Thelly by fredek
- Som Shoots by Aogami
- Septrica & Som (3) by Cubber
- Meteorite by Cubber
- Red's Grief by Cubber
- Mynt's Dress (10) by Cubber

<!b> SFX<!b>
- Ominous whistle
- Doorbell
- Power blinking
- Admin gained
- Mint appears
- Shelter fan
- Breaker flip/unflip
- Rox shooting
- Metal footsteps
- Added text appearance noises for Mynt, Mint, Septrica, and Protocol

<!b> Music<!b>
- Forgotten Friend by Rocket
- Dissonance Rupture by Rocket
- Kill Me (music box) by Rocket
- Gunpoint by Rocket
- Credits by Rocket
- Bridal Chorus by Rocket

<!b> Bugfixes & Optimization<!b>
- FINALLY fixed the bug where you can't gather glowberries or gain items!!! It was caused by going to your pet's house.
- Fixed the mynt ambience playing forever whenever you clicked \"Load a mod\"
- Fixed massive lag whenever you returned to the daydream journal
- Fixed a broken \"I gotta go\" option in Kemp's truck crash scene
- Added a warning which will hopefully trigger when someone gets the bug where they can't gain any items, if you see that warning immediately write down what you just did recently in game and tell us please and thanks!!
- Added a \"This will lock you out of story content\" warning to the LLL intro's move along button
- Removed \"Advanced Gramphics\" joke setting from the settings menu, cause it made a big buggy mess and needed to be punished
- \"You've got mail\" sound now fades out properly, also if you click any buttons it will now stop playing
- May have fixed bug where you can sometimes get stuck unable to gain any items. If not, the fix is to go to the world map and click Bright Forest

<!b> Misc<!b>
- Added two 3% chance alternate Main Menu easter eggs.
- Added Endings menu and unlock system to the daydream journal
- Retconned Missing Page 5 date to Year 0.7
- Added a WASD button hint the first time you play the caves minigame
- Added missing music credit for the goblin nightclub
- Retconned the number of missing pages to 16 down from 20
- Retconned 'yaoi mangas' to 'yuri mangas' in the prose engine section of the LLL
- Minor 'dress' retcon to Missing Page 4
- Fixed anachronism when Vanylla finds the password
- Retconned 'prose engine' to 'interpretive loop' to prevent confusion between 'prose engine' and 'The Engine.' The former is Mynt's core, the latter is the core of the island's environment and ecosystems
- Retconned Missing Page 3's corruptive rp buddy from a person to an ero game instead, to prevent confusion when Wendy also mentions a totally different rp buddy (archbishop) in the same scene
");
		creditButtons = [];

		var creditArray:Array<Dynamic> = [];

		creditArray.push({
			iconName: "mintIcon",
			title: "<!20px>FallowWing — Dev<!20px>",
			subtitle: "Programmer.",
			url: "https://inkbunny.net/FallowWing"
		});

		creditArray.push({
			iconName: "kittIcon",
			title: "<!20px>Kittery – Dev<!20px>",
			subtitle: "Writer, Artist, SFX.",
			url: "https://inkbunny.net/Kittery"
		});

		creditArray.push({
			iconName: "inkbunnyIcon",
			title: "Patches here!",
			subtitle: "Inkbunny allows us to edit, so click here for patched versions. You don't have to make an account to view, just click 'Allowed Ratings' and check all the boxes.",
			url: "https://inkbunny.net/submissionsviewall.php?rid=23ddb58021&mode=pool&pool_id=41516&page=1&orderby=pool_order&random=no&success="
		});

		creditsOut = false;

		for (i in 0...creditArray.length) {
			var credit:Dynamic = creditArray[i];

			var icon:MintSprite = addSprite("assets/img/intro/"+credit.iconName+".png");
			icon.alpha = 0;

			icon.onHover = function() {
				if (icon.alpha == 1) showToolTipOnCursor(credit.title, credit.subtitle);
			}
			icon.onReleaseOnce = function() {
				if (icon.alpha == 1) getUrl(credit.url);
			}

			creditButtons.push(icon);
		}

		patreon = addSprite("assets/img/intro/patreonIcon.png");
		patreon.onReleaseOnce = function() {
			tween(patreon, {y: 5}, 0.9, {type: REVERSE, ease: ELASTIC_IN, onComplete: function() { patreon.y = 0; }});
			playSound("assets/audio/environment/caveWinSmall");
			getUrl("https://www.patreon.com/paraphore");
		}

		patreon.onHoverOnce = function() {
			playSound("assets/audio/ui/hover6");
			patreon.applyGlowEffect(0xFFff6000, 1, 20, 20, 5);
		}
		patreon.onUnHoverOnce = function() {
				patreon.clearEffects();
			}

		credits = addSprite("assets/img/intro/infoIcon.png");
		credits.onReleaseOnce = toggleCredits;
		credits.x = GAME_WIDTH - credits.width;

		var devButton:MintSprite = addSprite("assets/img/intro/devMenuButton.png");
		devButton.alpha = 0;
		
		devButton.alpha = 1;
		devButton.x = 700;
		devButton.y = 500;
		devButton.onReleaseOnce = function() {
			stopChannel("music");
			if (debugMode) {
				playSound("assets/audio/ui/tak");
				cameraFadeOut(0xFFFFFF, 0.5, function() {
					Test.test("main");
				});
			} else {
				playSound("assets/audio/ui/tak");
				cameraFadeOut(0xFFFFFF, 0.5, function() {
					Test.test("devPass");
				});
			}
		}

		//Secrets
		savedTint = 0;
		monitorTint = addRectSprite(494, 343, 0);

		tintKink = addSprite("assets/img/kink/Love.png");

		savedMonitor = 0;
		altMonitor = addSprite("assets/img/intro/altMonitor1.png");

		monitorTint.x = 155;
		monitorTint.y = 35;

		tintKink.x = monitorTint.x+234;
		tintKink.y = monitorTint.y+195;

		altMonitor.x = monitorTint.x;
		altMonitor.y = monitorTint.y;

		altMonitor.alpha = monitorTint.alpha = tintKink.alpha = 0;

		function keyboardSecret():Void {
			monitorTint.alpha = 0;
			tintKink.alpha = 0;
			altMonitor.alpha = 1;
			savedMonitor++;

			if (savedMonitor > 3) savedMonitor = 0;
			if (savedMonitor == 0) altMonitor.alpha = 0;
			if (savedMonitor > 0) altMonitor.setupAnimated("assets/img/intro/altMonitor"+savedMonitor+".png");
		}

		function mouseSecret():Void {
			var color:Int = 0xFF000000;
			var symbol:String = "";

			altMonitor.alpha = 0;

			savedTint++;

			if (savedTint > 8) savedTint = 0;

			if (savedTint == 1) {
				color = 0xFFff567e;
				symbol = "assets/img/kink/"+pickOne(["Gore", "Blood", "Abuse"])+".png";
			}

			if (savedTint == 2) {
				color = 0xFFf045ff;
				symbol = "assets/img/kink/Love.png";
			}

			if (savedTint == 3) {
				color = 0xFF002aff;
				symbol = "assets/img/kink/Foodplay.png";
			}

			if (savedTint == 4) {
				color = 0xFF00d2ff;
				symbol = "assets/img/kink/"+pickOne(["Male", "Female", "Intersex"])+".png";
			}

			if (savedTint == 5) {
				color = 0xFF4aff92;
				symbol = "assets/img/kink/"+pickOne(["Feral", "Pregnancy", "Plot"])+".png";
			}

			if (savedTint == 6) {
				color = 0xFFd3ff4b;
				symbol = "assets/img/kink/Piss.png";
			}

			if (savedTint == 7) {
				color = 0xFFda5f05;
				symbol = "assets/img/kink/Hyper.png";
			}

			if (savedTint == 8) {
				color = 0xFF000000;
				monitorTint.alpha = 0.5;
				symbol = "assets/img/kink/"+pickOne(["Snuff", "Candy Gore"])+".png";
			}

			if (savedTint == 0) {
				monitorTint.alpha = 0;
				tintKink.alpha = 0;
			} else {
				tintKink.setupAnimated(symbol);
				if (savedTint != 8) monitorTint.alpha = 0.3;
				tintKink.alpha = 1;
				monitorTint.tint = color;
			}
		}

		var keyboard:MintSprite = addRectSprite(360, 50, 0);
		keyboard.x = 220;
		keyboard.y = 440;
		keyboard.onReleaseOnce = function() {
			keyboardSecret();
			playSound("assets/audio/secret/typing");
		}

		var mouse:MintSprite = addRectSprite(90, 60, 0);
		mouse.x = 630;
		mouse.y = 430;
		mouse.onReleaseOnce = function() {
			mouseSecret();
			playSound("assets/audio/secret/click");
		}

		var squeezy:MintSprite = addRectSprite(60, 130, 0);
		squeezy.y = 315;
		squeezy.onReleaseOnce = function() {
			playSound("assets/audio/secret/squeezy");

			var spurtDelay:Float = 0.1;
			for (i in 0...21) {
				spurtDelay += 0.005+spurtDelay*0.2;
				var spurt:MintSprite = addSprite("assets/img/intro/splurt.png");
				spurt.x = 45;
				spurt.y = 282;
				tween(spurt, {x: spurt.x + 45+200*Math.random()-(200*spurtDelay*0.1), y: spurt.y + 50+150*Math.random()+(10*spurtDelay*0.3)}, 0.2+spurtDelay*0.05, {startDelay: spurtDelay});
				tween(spurt, {alpha: 0}, 5-spurtDelay, {startDelay: spurtDelay, onComplete: function() {
						spurt.destroy();
					}
				});
			}
		}

		squeezy.alpha = mouse.alpha = keyboard.alpha = 0;

		/// Version number
		versionNum = addText();
		versionNum.setFormat({fontSize: 24, fontColour: 0xFFFFFF});
		versionNum.setText(GAME_VERSION);
		versionNum.y = GAME_HEIGHT - versionNum.fieldHeight;
		versionNum.x = devButton.x - versionNum.fieldWidth - 5;

		var modButton:MintSprite = addSprite("assets/img/intro/loadMod.png");
		var modInfo:MintSprite = addSprite("assets/img/intro/modInfo.png");

		modButton.x = GAME_WIDTH*0.5-modButton.width*0.7;
		modButton.y = GAME_HEIGHT-modButton.height;
		modInfo.x = modButton.x+modButton.width*1.05;
		modInfo.y = GAME_HEIGHT-modInfo.height;

		modButton.setMagicOnClick(function() {
			playSound("assets/audio/ui/explore", "explore");
			msg("Mod loader engaged.", true);
			stopChannel("music");
			tween(modButton, {y: GAME_HEIGHT-modButton.height*0.8}, 1.2, {type: REVERSE, ease: QUINT_IN, onComplete: function() { modButton.y = GAME_HEIGHT-modButton.height; } });
			loadMod();
		});
		
		modInfo.onReleaseOnce = function() {
			playSound("assets/audio/ui/explore", "explore");
			msg("This will link to a page explaining how mods work.", true);
			tween(modInfo, {y: GAME_HEIGHT-modInfo.height*0.8}, 1.2, {type: REVERSE, ease: QUINT_IN, onComplete: function() { modInfo.y = GAME_HEIGHT-modInfo.height; } });
			getUrl("https://www.github.com/FallowWing/modExamples");
		}

		for (butt in [credits, devButton, modButton, modInfo]) {
			butt.onHoverOnce = function() {
				butt.applyGlowEffect(0x00c6ff);
				playSound("assets/audio/ui/hover1");
			}

			butt.onUnHoverOnce = function() {
				butt.clearEffects();
			}
		}

		var playButton:MintSprite = addRectSprite(140, 35, 0);
		playButton.pixelPerfectOverlapping = false;
		playButton.alpha = 0;
		playButton.x = 233;
		playButton.y = 313;

		var loadButton:MintSprite = addRectSprite(160, 35, 0);
		loadButton.pixelPerfectOverlapping = false;
		loadButton.setMagicOnClick(load);

		loadButton.alpha = 0;
		loadButton.x = 442;
		loadButton.y = 313;

		volumeSlider = sliderCreate(130, Engine.userVolumeMod, function() {
			Engine.userVolumeMod = volumeSlider.percent;
			resetGlobalVolume();
			volumeSlider.label.setText(Math.floor(volumeSlider.percent*100)+"%");
		});

		volumeSlider.bar.x = 8;
		volumeSlider.bar.y = 570;
		sliderAlign(volumeSlider);

		volumeSlider.bar.tint = 0xFF3e7f5a;
		volumeSlider.handle.tint = 0xFF3e7f5a;
		volumeSlider.label.setFormat({fontColour: 0x3e7f5a});

		var sliderArray:Array<MintSprite> = [volumeSlider.bar, volumeSlider.handle, volumeSlider.label];

		playButton.onReleaseOnce = function () {
			playButton.mouseEnabled = loadButton.mouseEnabled = devButton.mouseEnabled = credits.mouseEnabled = patreon.mouseEnabled = false;
			playSound("assets/audio/ui/explore", "explore");
			playSound("assets/audio/environment/caveWinSmall", "caveWinSmall");
			bindKey(SPACE, continueToMynt);
			fadeChannel("music", false, 3);

			//Zoom in
			var white:MintSprite = addSprite("assets/img/effect/white.png");
			white.alpha = 0;

			tween(white, {alpha: 1}, 4, {ease: QUART_IN});

			for (s in sliderArray)
				tween(s, {x: -100, y: GAME_HEIGHT}, 2, {ease: QUART_IN});

			tween(devButton, {y: GAME_HEIGHT+devButton.height}, 2.5, {ease: QUART_IN});
			tween(modButton, {y: GAME_HEIGHT+modButton.height}, 2.5, {ease: QUART_IN});
			tween(modInfo, {y: GAME_HEIGHT+modInfo.height}, 2.5, {ease: QUART_IN});
			tween(versionNum, {x: GAME_WIDTH, y: GAME_HEIGHT}, 2.5, {ease: QUART_IN});
			tween(credits, {x: GAME_WIDTH+credits.width, y: -credits.height}, 2.5, {ease: QUART_IN});
			tween(patreon, {x: -patreon.width, y: -patreon.height}, 2.5, {ease: QUART_IN});

			tween(monitorTint, {scaleX: 4, scaleY: 4, y: -10}, 4, {ease: QUART_IN});
			tween(altMonitor, {scaleX: 4, scaleY: 4, y: -10}, 4, {ease: QUART_IN});
			tween(tintKink, {scaleX: 4, scaleY: 4, y: 295}, 4, {ease: QUART_IN});
			tween(background, {scaleX: 4, scaleY: 4, y: 230}, 4, {ease: QUART_IN});
			tween(monitor, {scaleX: 4, scaleY: 4, y: 230}, 4, {ease: QUART_IN});

			//Disclaimer
			var disclaimers:Array<String> = ["<!b>This game contains optional extreme kinks.<!b>", "This stuff is fantasy only. Do not try at home."];
			for (text in disclaimers) {
				var disclaimerText:MintText = addText();
				disclaimerText.setFormat({wordWrap: false, fontColour: 0x292929, fontSize: 22});
				disclaimerText.setText(text);
				disclaimerText.layer = Main.CONSOLE_BG_LAYER;
				disclaimerText.x = GAME_WIDTH*0.5-disclaimerText.fieldWidth*0.55;
				disclaimers.indexOf(text) == 0 ? disclaimerText.y = GAME_HEIGHT*0.5-disclaimerText.height*1.3 : disclaimerText.y = GAME_HEIGHT*0.5+disclaimerText.height;
				disclaimerText.alpha = 0;
				tween(disclaimerText, {alpha: 1}, 2, {ease: QUINT_OUT, startDelay: 3+disclaimers.indexOf(text)*1.5});
			}
			

			var kinkList:Array<String> = ["Cub", "Baby", "Abuse", "Gore", "Hyper", "Piss", "Raunch", "Pregnancy", "Feral", "Scat", "Vomit", "Trash", "Snuff"];
			var kinkSpriteX:Float = 0;
			var delay:Float = 0;
			var directionFlipped:Bool = false;

			for (kink in kinkList) {
				delay += 0.07;
				var kinkSprite = addSprite("assets/img/kink/"+kink+".png");
				kinkSprite.layer = Main.CONSOLE_BG_LAYER;
				kinkSpriteX += kinkSprite.width*1.3;
				kinkSprite.x = -kinkSprite.width;
				kinkSprite.y = GAME_HEIGHT*0.5;
				tween(kinkSprite, {x: GAME_WIDTH/kinkList.length+kinkSprite.width*1.3+kinkSpriteX}, 3, {ease: QUINT_OUT, startDelay: delay+1});
			}

			cameraFadeOut(0xFFFFFF, 8, continueToMynt);
		}

		playSound("assets/audio/music/"+(rand<0.03?"credits":rand>0.97?"musicbox":"newFriend"), "music", {loops: 999, startVolume: 0.10});

		onGainFocusOnce(function() {
			fadeChannel("music", true, debugMode?0.5:2);
		});

		//Intro tweens
		for (s in sliderArray) tween(s, {x: -100, y: GAME_HEIGHT}, 2, {type: REVERSE, ease: QUAD_IN});

		tween(devButton, {y: GAME_HEIGHT+devButton.height}, 0.5, {type: REVERSE, ease: QUAD_IN});
		tween(versionNum, {y: GAME_HEIGHT}, 2, {type: REVERSE, ease: QUAD_IN});
		tween(modButton, {y: GAME_HEIGHT*1.1}, 2, {type: REVERSE, ease: QUAD_IN});
		tween(modInfo, {y: GAME_HEIGHT*1.1}, 2, {type: REVERSE, ease: QUAD_IN});
		tween(credits, {x: GAME_WIDTH+credits.width, y: -credits.height}, 2, {type: REVERSE, ease: QUAD_IN});
		tween(patreon, {x: -patreon.width, y: -patreon.height}, 2, {type: REVERSE, ease: QUAD_IN});

		tween(background, {scaleX: 1.2, scaleY: 1.2, y: 50}, 1, {type: REVERSE, ease: QUAD_IN});
		tween(monitor, {scaleX: 0.9, scaleY: 0.9, y: 0}, 2, {type: REVERSE, ease: QUAD_IN});

		disablePause();
		hookClear(destroyMenu);
	}

	public static function continueToMynt():Void {
		unBindKey(SPACE, continueToMynt);
		MyntScenes.myntIntro("main");
	}

	public static function destroyMenu():Void {
		sliderDestroy(volumeSlider);
		enablePause();
		Main.scrollingText = Main.mainText;
		Main.setScroll(0);
		//fadeChannel("music", false, debugMode?0.5:2);
	}

	public static function toggleCredits():Void {
		timesInfoPressed++;

		playSound("assets/audio/ui/toggle");

		if (timesInfoPressed == 12) {
			credits.tint = 0x88000000;
			credits.mouseEnabled = false;
			playSound("assets/audio/mynt/shutdown");
			tween(credits, {y: 600}, 0.9, {ease: QUINT_IN});
			timer(3, function () {if (creditsOut) toggleCredits();});
		} else if (!creditsOut) {
			tween(credits, {y: 5}, 0.9, {type: REVERSE, ease: ELASTIC_IN, onComplete: function() { credits.y = 0; }});
		}

		

		if (!creditsOut) {
			Main.scrollingText = creditsText;
			var prevX:Float = credits.x;
			var prevY:Float = credits.y;
			var prevWidth:Float = credits.width;
			var prevHeight:Float = credits.height;
			var creditsTillShrink:Int = 3;

			//Hide secrets
			altMonitor.alpha = monitorTint.alpha = tintKink.alpha = 0;

			for (i in 0...creditButtons.length) {
				var icon:MintSprite = creditButtons[i];
				icon.x = credits.x;
				icon.y = credits.y;

				/* if (i >= creditsTillShrink) { */
				/* 	icon.scaleX = 0.5; */
				/* 	icon.scaleY = 0.5; */
				/* 	icon.update(); // This is to make sure width and height are updated now rather than next frame */
				/* } */

				var nextX:Float = prevX;
				var nextY:Float = prevY + icon.height;

				if (nextY > GAME_HEIGHT) {
					nextX -= prevWidth;
					nextY = 0;
				}

				tween(icon, {alpha: 1, x: nextX, y: nextY}, 0.5, {ease: QUINT_OUT});

				prevX = nextX;
				prevY = nextY;
				prevWidth = icon.width;
				prevHeight = icon.height;
			}
			tween(creditsText, {alpha: 1}, 0.5, {ease: QUINT_OUT});
			tween(creditsBg, {alpha: 1}, 0.5, {ease: QUINT_OUT});
			var secretText:String = pickOne([";3", ";O", ">;3", ":3", "c:", "C:", "3:", "3:<", "mew", "nya"]);
			if (Math.random() > 0.99) secretText = "POO";
			versionNum.setText(secretText);
		} else {
			//Show secrets
			if (savedMonitor != 0) {
				altMonitor.alpha = 1;
			} else if (savedTint != 0) {
				monitorTint.alpha = 0.3;
				tintKink.alpha = 1;
			}

			for (icon in creditButtons) tween(icon, {alpha: 0}, 0.5);

			tween(creditsText, {alpha: 0}, 0.5);
			tween(creditsBg, {alpha: 0}, 0.5);

			versionNum.setText(GAME_VERSION);
		}

		creditsOut = !creditsOut;
	}
}
