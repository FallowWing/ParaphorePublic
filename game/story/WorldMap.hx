package story;

class WorldMap
{
	public static var prevAmbience:String;

	public static function map():Void {

		cameraFadeIn(0x19bfe2, 0.4);

		var canNudge:Bool = false;
		var fastTransition:Bool = data.gameSettings.get("Fast World Map Transition");
		var glowEnabled:Bool = data.gameSettings.get("World Map Glows");

		var violetUnlocked:Bool = ((data.exploreFinaleBFDone || data.exploreFinaleJCDone || data.vmIntroDone) || data.violetUnlocked);
		var apothecaryUnlocked:Bool = data.apothecaryUnlocked;
		var moonUnlocked:Bool = data.moonUnlocked;

		var dawn:Bool = GameData.data.theme.background == "dawn";
		//Display smoke and sweetsmoke?
		var kempReady:Bool = (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip"));
		//Display smoke and water?
		var kempDone:Bool = data.kempTruckExploded;

		//data.cyanWeddingStarted = true;

		var newShit:Array<String> = [];

		function updateNotifications(place:String, placeSprite:MintSprite):Void {
		if (newShit.contains(place)) {
				if (place == "Violet Meteorite" && !violetUnlocked) return;
				if (place == "False Moon" && !moonUnlocked) return;
				if (place == "Tranquil Apothecary" && !apothecaryUnlocked) return;
				var number:Int = 0;
				for (unlock in newShit) {
					if (unlock == place) number++;
				}

				var newBubble:MintSprite = addSprite("assets/img/kink/Plot.png");
				if (place == "Violet Meteorite" && violetUnlocked) {
					newBubble.tint = 0xFF791b27;
				}

				if (place == "False Moon" && moonUnlocked) {
					newBubble.tint = 0xFFf67d3b;
				}

				if (place == "Tranquil Apothecary" && apothecaryUnlocked) {
					newBubble.tint = 0xFFcfc129;
				}

				if (place == "Junk City") {
					newBubble.tint = 0xFF46b135;
				}

				if (place == "Bright Forest") {
					newBubble.tint = 0xFF00c6ff;
				}

				newBubble.y = placeSprite.y - (place == "Bright Forest"?-20:newBubble.height);
				newBubble.x = placeSprite.x + placeSprite.width/2 - newBubble.width/2;

				var bubbleText:MintText = addText();
				bubbleText.setText(""+number);
				bubbleText.setFormat({wordWrap: false, fontColour: 0x000000, fontSize: 16});
				if (glowEnabled) bubbleText.applyGlowEffect(0x000000, 1, 2, 2, 3);
				bubbleText.y = newBubble.y + newBubble.height/2 - 14;
				bubbleText.x = newBubble.x + newBubble.width/2 - 7;
				bubbleText.alpha = 0.7;

				newBubble.onHover = function() {
					Tooltip.showOnCursor(number+" event"+(number>1?"s":"")+" appeared in <!b>"+place+"<!b>!");
				}

				newBubble.onReleaseOnce = function() {
					newBubble.destroy();
					bubbleText.destroy();
					playSound("assets/audio/environment/pearClick");
				}

				newBubble.onHoverOnce = function() {
					playSound("assets/audio/ui/hover6");
					if (canNudge) StoryUtils.yesNudge([newBubble, bubbleText]);
				}

				newBubble.layer = 54;
				bubbleText.layer = 55;

				newBubble.update();
				bubbleText.update();

				tween(newBubble, {y: newBubble.y - 20, scaleX: 0, alpha: 0}, 0.7, {type: REVERSE, ease: ELASTIC_IN});
				tween(bubbleText, {y: bubbleText.y - 20, scaleX: 0, alpha: 0}, 0.7, {type: REVERSE, ease: ELASTIC_IN});
			}
		}

		playSound("assets/audio/mynt/shutdown");
		prevAmbience = GameData.data.currentSong;
		playMusic((dawn?"dawnMap":"cell"));

		data.onWorldMap = true; //Fix world map button misbehaving and not closing the world map due to pauseNoGoPrev being set after clicking a locked area
		for (hubButton in [Main.pauseButton, Main.loadButton, Main.saveButton, Main.devButton, Main.skinsButton, Main.shopButton])
			Main.hideTopButton(hubButton);
		for (b in Main.choiceButtons)
			b.sprite.mouseEnabled = false;

		if (data.owlGirlSeen && data.myntFakeDone && !getJournalEntries().contains("Missing Page 5")) {
			newShit.push("Violet Meteorite");
		}

		if (data.myntFakeDone && !getJournalEntries().contains("Missing Page 2")) {
			newShit.push("Violet Meteorite");
		}

		if (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip") && !getJournalEntries().contains("Kemp Truck")) {
			newShit.push("Violet Meteorite");
		}

		if (data.johnLanaJCDone && !data.johnLanaVMDone) {
			newShit.push("Violet Meteorite");
		}

		if (getJournalEntries().contains("Deerdog femboy") && !getJournalEntries().contains("Deerdog femboy 2")) {
			newShit.push("Violet Meteorite");
		}

		if (!data.vmIntroDone && violetUnlocked) {
			newShit.push("Violet Meteorite");
		}


		if (data.sepBrokeIn && getJournalEntries().contains("Cade2") && !data.cyanWeddingStarted) {
			newShit.push("Violet Meteorite");
		}

		if (data.metMarei > 0 && !getJournalEntries().contains("Public Snuff")) {
			newShit.push("Junk City");
		}

		if (data.metLana > 0 && data.libraryJohnIntro && !data.johnLanaJCDone) {
			newShit.push("Junk City");
		}

		if (data.glowbunnyDone && !data.glowbunnyLLLStarted) {
			newShit.push("Junk City");
		}

		if (data.johnLanaJCDone && data.johnLanaVMDone && !data.glowbunnyDone) {
			newShit.push("Bright Forest");
		}

		if (data.floatilleryMemorialRead && (data.metMarei > 0 || getJournalEntries().contains("Skunk cub camping trip") || getJournalEntries().contains("Stall 2")) && !data.floatilleryThellyDone && (data.bathroomBoysDone || data.metThelly > 0 || getJournalEntries().contains("Boys bathroom"))) {
			newShit.push("Bright Forest");
		}

		if (data.glowbunnyLLLStarted) {
			newShit.push("Tranquil Apothecary");
		}

		if (getJournalEntries().contains("Mourning") && data.metMarei > 0 && !getJournalEntries().contains("RedApo")) {
			newShit.push("Tranquil Apothecary");
		}

		if (getItem("Septricard").amount < 1 && data.apoGlowbunnyDone && !getJournalEntries().contains("mareiTour") && getJournalEntries().contains("Skunk cub camping trip")) {
			newShit.push("Tranquil Apothecary");
		}

		if (data.notificationTest) {
			newShit.push("Junk City");
			newShit.push("Tranquil Apothecary");
			newShit.push("False Moon");
			newShit.push("Violet Meteorite");
			newShit.push("Bright Forest");
		}

		var sky1:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
		var sky2:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
		var sky3:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
		var sky4:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
		sky1.scaleX = 1.00125;
		sky1.scaleY = 1.00166;
		sky2.move(sky1.width, 0);
		sky3.move(0, sky1.height);
		sky4.move(sky1.width, sky1.height);

		var water:MintSprite = addSprite("worldMap/"+(dawn?"dawnSkin":"base")+"Water.png");

		var island:MintSprite = addSprite("worldMap/islandBase.png");
		island.move(0, -20);

		var spicySwamp:MintSprite = addSprite("worldMap/spicySwamp.png");
		spicySwamp.move(279, 221);

		var violet:MintSprite = addSprite("worldMap/violetMeteorite.png");
		violet.move(272, 70);

		var kempWaterBase:MintSprite = addSprite("worldMap/kempWaterBase.png");
		var kempTruckSmoke:MintSprite = addSprite("worldMap/kempTruckSmoke.png");
		var kempSweetSmoke:MintSprite = addSprite("worldMap/kempSweetSmoke.png");
		for (it in [kempTruckSmoke, kempWaterBase, kempSweetSmoke])
			it.move(272, 70);

		var brightForest:MintSprite = addSprite("worldMap/brightForest.png");
		brightForest.move(74, 156);

		var junkCity:MintSprite = addSprite("worldMap/junkCity.png");
		junkCity.move(135, 317);

		var sewage:MintSprite = addSprite("worldMap/sewage"+(isActive("Candy Ring")?"Candy.png":".png"));
		sewage.move(61, 416);

		var apothecary:MintSprite = addSprite("worldMap/apothecary.png");
		apothecary.move(527, 226);

		var apothecaryEngineRays:MintSprite = addSprite("worldMap/apothecaryEngineRays.png");
		apothecaryEngineRays.move(572, 226);

		var apothecaryTop:MintSprite = addSprite("worldMap/apothecaryTop.png");
		apothecaryTop.move(564, 116);

		var apothecaryWindows:MintSprite = addSprite("worldMap/apothecaryWindows.png");
		apothecaryWindows.move(582, 171);

		var moonBase:MintSprite = addSprite("worldMap/moonBase.png");
		moonBase.move(169, 36);

		var moonShine:MintSprite = addSprite("worldMap/moonShine.png");
		moonShine.move(169, 170);

		var devMenu:MintSprite = addSprite("worldMap/devMenu.png");
		devMenu.pixelPerfectOverlapping = false;

		var floodButt:MintSprite = addSprite("worldMap/glowButton"+(data.floodMode?"On":"Off")+".png");
		floodButt.pixelPerfectOverlapping = false;

		var flytrap:MintSprite = addSprite("worldMap/flytrap"+(data.plantGender == "she" || data.plantGender == "it" ? "Tiddy" : "Base")+".png");
		flytrap.x = brightForest.x;
		flytrap.y = brightForest.y;

		var flood:MintSprite = addSprite("assets/img/worldMap/flood.png");
		flood.y = -20;

		var placeAlpha:Int = 0;
		if (data.floodMode) placeAlpha = 1;

		for (it in [sky1, sky2, sky3, sky4, water, island, spicySwamp, violet, kempTruckSmoke, kempWaterBase, kempSweetSmoke, brightForest, junkCity, sewage, devMenu, floodButt, flytrap, apothecary, apothecaryTop, apothecaryEngineRays, apothecaryWindows, moonBase, moonShine, flood]) {
			it.alpha = placeAlpha;
			it.layer = 52;
			//Tint everything but the base sprites if you have Dawn equipped
			if (dawn && it != sky1 && it != sky2 && it != sky3 && it != sky4 && it != water && it != apothecaryEngineRays && it != moonBase) it.tint = 0x99ff9191;
		}

		moonShine.alpha = 0.2;

		if (data.floodMode) flood.alpha = 1;
		flytrap.alpha = 0;
		kempTruckSmoke.alpha = 0;
		kempWaterBase.alpha = 0;
		kempSweetSmoke.alpha = 0;

		//Close the player menu
		if (Main.uiState == "hubOpen") Main.changeUiState("hub");
		Main.playerButton.mouseEnabled = false;
		Main.exploreButton.mouseEnabled = false;

		//Flavor
		if (data.bfVenusFed > 6) {
			tween(flytrap, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.4 : 0.8)});
			tween(flytrap, {y: flytrap.y+30, scaleY: 0}, (fastTransition ? 0.45 : 1), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.4 : 0.8)});
		}

		var iter:Float = 0;
		var birdNumber:Int = 3;
		if (data.owlGirlSeen) birdNumber = 2;

		var timerId:Int = timer((fastTransition?0.5:2.5), playSound.bind("assets/audio/environment/birdfly", "birdfly"));
		setChannelVolume("birdfly", 0.3);

		for (i in 0...birdNumber) {
			var bird:MintSprite = addSprite("worldMap/bird");
			iter += 0.05+Math.random()*0.1;
			bird.x = -bird.width*5;
			bird.y = GAME_HEIGHT*0.7+Math.random()*GAME_HEIGHT*0.5;
			bird.scaleX = 5;
			bird.scaleY = 5;
			bird.rotation = -10;
			bird.layer = 53;
			
			tween(bird, {x: GAME_WIDTH*1.2, y: GAME_HEIGHT*0.3, scaleX: 2, scaleY: 2, rotation: -40}, 2.5, {ease: QUINT_OUT, startDelay: iter+(fastTransition?0.6:3), onComplete: function() {
					bird.scaleX = -1;
					bird.scaleY = 1;
					bird.y = GAME_HEIGHT*0.2+Math.random()*50;
					bird.rotation = 0;

					tween(bird, {x: -100}, 135, {ease: ELASTIC_OUT});
					tween(bird, {y: GAME_HEIGHT*0.2*Math.random()}, 3, {type: PINGPONG, ease: QUAD_IN_OUT});
				}
			});
		}

		var suicider:MintSprite = addRectSprite(2, 3, 0);
		var suiciderDelay:Int = rndInt(3, 8);
		suicider.move(670, 355);
		suicider.layer = 52;
		suicider.alpha = 0;

		timer(suiciderDelay, function(){
			tween(suicider, {alpha: 1}, 0.1, {onComplete:
			tween.bind(suicider, {x: 586, y: 422}, 11, {onComplete:
			tween.bind(suicider, {x: 601, y: 434}, 3, {onComplete:
			tween.bind(suicider, {x: 581, y: 445}, 3.5, {onComplete:
			tween.bind(suicider, {x: 565, y: 442}, 3, {onComplete:
			tween.bind(suicider, {x: 557, y: 445}, 2, {onComplete:
			tween.bind(suicider, {x: 555, y: 456}, 2, {onComplete:
			tween.bind(suicider, {x: 537, y: 464}, 3, {onComplete:
			tween.bind(suicider, {x: 537, y: 470}, 1, {onComplete:
			tween.bind(suicider, {x: 537, y: 468}, 0.3, {startDelay: 4+suiciderDelay, onComplete:
			tween.bind(suicider, {x: 537, y: 483}, 0.4, {onComplete:
			tween.bind(suicider, {scaleY: 0.666}, 0.01, {onComplete:
			tween.bind(suicider, {x: 533, y: 513}, 7, {onComplete:
			tween.bind(suicider, {y: GAME_HEIGHT}, 4.5)
			})
			})
			})
			})
			})
			})
			})
			})
			})
			})
			})
			})
			});
		});

		var waterAnim:MintSprite = addSprite("worldMap/"+(dawn?"dawnWater":"water")+"Anim.png");
		waterAnim.layer = 53;
		waterAnim.y = -20;
		waterAnim.alpha = 0;


		//Base sprites
		for (sky in [sky1, sky2, sky3, sky4])
			tween(sky, {alpha: 1}, 0.3, {ease: QUAD_IN_OUT});
		tween(sky1, {x: -sky1.width, y: -sky1.height}, 40, {type: LOOP});
		tween(sky2, {x: -1, y: -sky2.height-1}, 40, {type: LOOP});
		tween(sky3, {x: -sky3.width-1, y: -1}, 40, {type: LOOP});
		tween(sky4, {x: -1, y: -1}, 40, {type: LOOP});

		tween(water, {alpha: 1}, 0.3, {ease: QUAD_IN_OUT});

		tween(island, {alpha: 1}, 0.3, {ease: QUAD_IN_OUT});

		devMenu.move(10, 130);
		tween(devMenu, {alpha: 1}, 0.5, {ease: QUAD_IN_OUT, startDelay: 0.2});
		tween(devMenu, {x: -100, scaleX: 2.5}, 0.8, {type: REVERSE, ease: ELASTIC_IN, startDelay: 0.2});

		if (data.cyanWeddingStarted || debugMode) {
			floodButt.move(10, 70);
			tween(floodButt, {alpha: 1}, 0.5, {ease: QUAD_IN_OUT, startDelay: 0.2});
			tween(floodButt, {x: -100, scaleX: 2.5}, 0.8, {type: REVERSE, ease: ELASTIC_IN, startDelay: 0.2});
		} else {
			floodButt.move(10, 70);
			tween(floodButt, {alpha: 0.3}, 2, {ease: QUAD_IN_OUT, startDelay: 0.1});
		}

		//Locked areas
		if (!violetUnlocked) violet.tint = 0x99000000;
		if (!moonUnlocked) moonBase.tint = 0x99000000;
		if (!apothecaryUnlocked) {
			apothecary.tint = apothecaryTop.tint = apothecaryWindows.tint = apothecaryEngineRays.tint = 0x99000000;
		}

		//Randomly delay violet's drop, giving the player an opportunity to click Spicy Swamp
		var violetDelay:Float = (fastTransition ? 0.1 : Math.random()<0.8 ? 0.1 : 2);

		
		if (!data.floodMode) {
			tween(violet, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: violetDelay});
			tween(violet, {y: -100, scaleY: 1.5}, 0.7, {type: REVERSE, ease: ELASTIC_IN, startDelay: violetDelay, onComplete: function() { violetDelay = 0.1; spicySwamp.clearEffects(); }});

			//Add Kemp sprites to Violet
			if (kempReady)
				tween(kempTruckSmoke, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: violetDelay+0.1});
			if (kempReady && !kempDone)
				tween(kempSweetSmoke, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: violetDelay+0.1});
			if (kempDone)
				tween(kempWaterBase, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: violetDelay+0.1});

			//Areas
			tween(brightForest, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.05 : 0.2)});
			tween(brightForest, {y: -100, scaleY: (fastTransition ? 3 : 1.3)}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.05 : 0.2)});

			tween(junkCity, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.2 : 0.3)});
			tween(junkCity, {y: -100, scaleY: (fastTransition ? 3 : 1.3)}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.1 : 0.3)});

			tween(apothecary, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.3 : 0.4)});
			tween(apothecary, {y: -100, scaleY: (fastTransition ? 3 : 1.3)}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.2 : 0.4)});
			timer(0.4, tween.bind(apothecaryEngineRays, {alpha: (apothecaryUnlocked?1:0.3)}, 0.03, {type: PINGPONG}));
			tween(apothecaryEngineRays, {y: -100, scaleY: (fastTransition ? 3 : 1.3)}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.2 : 0.4)});
			tween(apothecaryTop, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.3 : 1)});
			tween(apothecaryTop, {y: -apothecaryTop.height, scaleY: 2}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.3 : 1)});

			tween(moonBase, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.2 : 0.7)});
			tween(moonBase, {y:-100, scaleY: 1.7}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.2 : 0.7)});
			tween(moonShine, {alpha: 0.2}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.2 : 0.7)});
			tween(moonShine, {scaleX: 0.1}, (fastTransition ? 0.4 : 0.6), {type: REVERSE, ease: ELASTIC_IN, startDelay: (fastTransition ? 0.2 : 0.7)});
			
			tween(waterAnim, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: 0.1});
			tween(spicySwamp, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: 0.1});
			tween(sewage, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.5 : 1)});
			tween(apothecaryWindows, {alpha: 1}, 0.1, {ease: QUAD_IN_OUT, startDelay: (fastTransition ? 0.5 : 1.7)});
		} else {
			violetDelay = 0.1;
		}

		var mapMap:Map<String, MintSprite> = [
			"Bright Forest" => brightForest,
			"Junk City" => junkCity,
			"Violet Meteorite" => violet,
			"False Moon" => moonBase,
			"Spicy Swamp" => spicySwamp,
			"Toggle Flood" => floodButt,
			"Dev Menu" => devMenu
		];

		timer((fastTransition ? 0.4 : 1.7), function () {
			apothecary.onReleaseOnce = apothecaryTop.onReleaseOnce = function() {
				pauseNoGoPrev();
				if (!apothecaryUnlocked) {
					StoryUtils.nopeWiggle([apothecary, apothecaryTop, apothecaryWindows, apothecaryEngineRays]);
					playSound("assets/audio/ui/nope");
				} else {
					playSound("assets/audio/ui/explore");
					Apothecary.explore(data.floodMode?"floodHub":"main");
				}
			}

			apothecary.onHover = apothecaryTop.onHover = function() {
				if (!apothecaryUnlocked)
					Tooltip.showOnCursor("Tranquil Apothecary <!b>(Locked)<!b>\nFinish exploring Violet Meteorite")
				else
					Tooltip.showOnCursor("Tranquil Apothecary");
			}

			apothecary.onHoverOnce = function() {
				if (canNudge) StoryUtils.yesNudge([apothecary]);
				playSound("assets/audio/ui/hover4");
				if (glowEnabled) apothecary.applyGlowEffect(0xcfc129, 1, 5, 5, 10);
			}

			apothecaryTop.onHoverOnce = function() {
				if (canNudge) StoryUtils.yesNudge([apothecaryTop, apothecaryWindows]);
				playSound("assets/audio/ui/hover4");
				if (glowEnabled) apothecaryTop.applyGlowEffect(0xcfc129, 1, 5, 5, 10);
			}

			apothecary.onUnHoverOnce = function() {
				apothecary.clearEffects();
			}

			apothecaryTop.onUnHoverOnce = function() {
				apothecaryTop.clearEffects();
			}
		});

		for (key in mapMap.keys()) {
			var s:MintSprite = mapMap.get(key);

			timer((data.floodMode? 0.05 : fastTransition ? 0.4 : violetDelay <= 0.1 ? 2 : 3), function() {
				canNudge = true;
				if (key == "Tranquil Apothecary") updateNotifications("Tranquil Apothecary", apothecaryTop);
				updateNotifications(key, s);
			});
		}

		for (key in mapMap.keys()) {
			var s:MintSprite = mapMap.get(key);

			timer((data.floodMode ? 0.05 : fastTransition ? 0.4 : 0.7), function () {
				s.onReleaseOnce = function() {
					pauseNoGoPrev();

					if (key == "Bright Forest") {
						playSound("assets/audio/ui/myrrh/explore");
						if (data.floodMode)
							BrightForest.brightForestExplore("floodHub");
						else
							StaticCallbacks.goHubCall(key);
					}

					if (key == "Junk City") {
						playSound("assets/audio/ui/scrap/explore");
						if (data.floodMode)
							JunkCity.junkCityExplore("floodHub");
						else
							StaticCallbacks.goHubCall(key);
					}

					if (key == "Violet Meteorite" && violetUnlocked && violetDelay <= 0.1) {
						playSound("assets/audio/ui/explore");
						if (data.floodMode)
							VioletMeteorite.violetMeteoriteExplore("floodHub");
						else
							StaticCallbacks.goHubCall(key);
					}

					if (key == "Spicy Swamp" && violetDelay > 0.1) {
						playSound("assets/audio/ui/explore");
						VioletMeteorite.violetMeteoriteExplore("ExploreSpicy");
					}

					if (key == "Violet Meteorite" && !violetUnlocked && violetDelay <= 0.1) {
						StoryUtils.nopeWiggle([s]);
						playSound("assets/audio/ui/nope");
					}

					if (key == "False Moon" && moonUnlocked && !data.floodMode) {
						playSound("assets/audio/ui/explore");
						BrightForest.brightForestExplore("falseMoon");
					}

					if (key == "False Moon" && (!moonUnlocked || data.floodMode)) {
						StoryUtils.nopeWiggle([s, moonShine]);
						playSound("assets/audio/ui/nope");
					}

					if (key == "Dev Menu" && debugMode) {
						playSound("assets/audio/ui/tak");
						stopChannel("music");
						playSound("assets/audio/environment/mynt", "music", {loops: 99999});
						Test.test("main");
					}

					if (key == "Dev Menu" && !debugMode) {
						playSound("assets/audio/ui/tak");
						stopChannel("music");
						playSound("assets/audio/environment/mynt", "music", {loops: 99999});
						Test.test("devPassAlt");
					}

					if (key == "Toggle Flood" && (data.cyanWeddingStarted || debugMode) && !data.floodMode) {
						Main.hideTopButton(Main.mapButton);
						flood.cancelTweens();
						tween(flood, {alpha: 1}, 1);
						s.setupAnimated("assets/img/worldMap/glowButtonOn");
						playSound("assets/audio/ui/tak");
						msg("Fast-forwarded to unstable checkpoint.");
						//stopChannel("music");
						//playSound("assets/audio/music/", "music", {loops: 99999});
						data.floodMode = true;
					} else if (key == "Toggle Flood" && (data.cyanWeddingStarted || debugMode) && data.floodMode) {
						Main.hideTopButton(Main.mapButton);
						flood.cancelTweens();
						tween(flood, {alpha: 0}, 1);
						s.setupAnimated("assets/img/worldMap/glowButtonOff");
						playSound("assets/audio/ui/tak");
						msg("Returned to stable checkpoint.");
						//stopChannel("music");
						//playSound("assets/audio/music/", "music", {loops: 99999});
						data.floodMode = false;
					}

					if (key == "Toggle Flood" && !data.cyanWeddingStarted) {
						s.cancelTweens();
						tween(s, {x: s.x-2}, 0.05, {onComplete:
							tween.bind(s, {x: s.x+4}, 0.05, {onComplete:
								tween.bind(s, {x: s.x-2}, 0.05)
							})
						});
						playSound("assets/audio/ui/nope");
					}
				}

				s.onHover = function() {
					if (key == "Spicy Swamp" && violetDelay <= 0.1) return;
					if (key == "Violet Meteorite" && violetDelay > 0.1) return;
					if (key == "Violet Meteorite" && !violetUnlocked) {
						Tooltip.showOnCursor("Violet Meteorite <!b>(Locked)<!b>\nFinish exploring Bright Forest or Junk City");
					} else if (key == "False Moon" && !moonUnlocked) {
						if (!data.hoveredMoon) data.hoveredMoon = true;
						Tooltip.showOnCursor("False Moon <!b>(Locked)<!b>\nFind a winged cutie");
					} else if (key != "Dev Menu") {
						Tooltip.showOnCursor(key);
					}

				}

				s.onHoverOnce = function() {
					if (canNudge) StoryUtils.yesNudge([s]);
					playSound("assets/audio/ui/hover4");
					if (glowEnabled) {
						if (key == "Junk City") s.applyGlowEffect(0x46b135, 1, 5, 5, 10);
						if (key == "Bright Forest") s.applyGlowEffect(0x00c6ff, 1, 5, 5, 10);
						if (key == "Violet Meteorite") s.applyGlowEffect(0x791b27, 1, 5, 5, 10);
						if (key == "False Moon") s.applyGlowEffect(0xf67d3b, 1, 5, 5, 10);
						if (key == "Spicy Swamp" && violetDelay > 0.1) s.applyGlowEffect(0x6e1818, 1, 5, 5, 10);
						//if (key == "Auto-Shop" && data.foundShop) s.applyGlowEffect(0x0f4937, 1, 5, 5, 10);
						if (key == "Dev Menu") s.applyGlowEffect(0x721414, 1, 5, 5, 10);
						if (key == "Toggle Flood") s.applyGlowEffect(0x00609c, 1, 5, 5, 10);
					}
				}

				s.onUnHoverOnce = function() {
					s.clearEffects();
				}
			});
		}

		/*var buttonLabels:Array<String> = ["Save", "Load"];

		var buttons:Array<Button> = [];
		for (i in 0...buttonLabels.length) {
			var label:String = buttonLabels[i];
			var button:Button = Buttons.create();
			button.imagePath = "assets/img/pauseScreen/choiceButton.png";
			button.label.setFormat({fontColour: 0xFFFFFF});
			button.label.setText(label);
			button.redraw();
			if (buttons.length == 0) button.sprite.x = Main.mapButton.x - button.sprite.width - 5;
			else button.sprite.x = buttons[i-1].sprite.x - button.sprite.width - 5;
			button.sprite.y = 9;
			button.sprite.layer = Main.MSG_LAYER;
			button.label.layer = Main.MSG_LAYER;
			button.align();
			buttons.push(button);
		}

		for (b in buttons) {
			if (b.label.text == "Save") b.sprite.setMagicOnClick(function() {
				if (b.enabled) GameData.downloadCurSave();
			});

			if (b.label.text == "Load") b.sprite.setMagicOnClick(function() {
				if (b.enabled) GameData.uploadCurSave();
			});
			/* if (b.label.text == "Themes") b.sprite.setMagicOnClick(GameData.uploadCurSave);
		}*/

		hookClear(function():Void {
			//for (b in buttons)
			//	b.destroy();
			for (b in Main.choiceButtons)
				b.sprite.mouseEnabled = true;

			for (hubButton in [Main.pauseButton, Main.loadButton, Main.saveButton, Main.devButton, Main.skinsButton, Main.shopButton])
				Main.showTopButton(hubButton);

			timerCancel(timerId);
			Main.playerButton.mouseEnabled = true;
			Main.exploreButton.mouseEnabled = true;
			data.onWorldMap = false;
		});

		pauseGoPrev();
	}
}
