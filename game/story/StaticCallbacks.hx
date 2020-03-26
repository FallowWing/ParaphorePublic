package story;

class StaticCallbacks
{
	public static function miscPlaceCall(label:String):Void {
		if (label == "Auto-Shop") BrightForest.brightForestExplore("world shop");
		if (label == "Dev Menu") Test.test("main");
	}

	public static function actionPlaceCall(label:String):Void {
		if (label == "Roxelle's Farm") Roxelle.roxExplore();
		if (label == "Red's Cottage") Red.explore("intro");
		if (label == "Septrica's") Septricas.septricasExplore();
		if (label == "The Floatillery") TheFloatillery.theFloatillery("explore");
		if (label == "Snagglebank") JunkCity.junkCityExplore("ExploreSnagglebank");
		if (label == "Sewer Suburbs") SewerSuburbs.sewerExplore("explore");
		if (label == "L.L.L.") LLL.libraryExplore("main");
		if (label == "Indigo Pond") IndigoPond.indigoPond("intro");
		if (label == "The Crack") TheCrack.explore("main");
		if (label == "Gryphon Cavern") VioletMeteorite.violetMeteoriteExplore("gryphonHub");
		if (label == "Hyper Land") HyperLand.explore("explore");
		if (label == data.gooGoatHome) {
			Camera.flash(0xFFFFFFFF, 0.5);
			PetGame.petGameResolve();
		}

		if (label == "Make some calls.") Calls.calls("main");
		if (label == "Gather Glowberries") {
			if (pauseIsGoingPrev()) msg("HEY! This gamestate leads to some mysterious bugs. Tell Kittery or Fallow what buttons you clicked JUST before this moment, please! And if you can't gain items, go to the World Map and then click any hub area.", false, true);
			explore("Gather Glowberries");
		}
		if (label == "Work") explore("Work");
		if (label == "Spelunk Forest") {
				if (Math.random() > 0.5) 
					BrightForest.brightForestExplore("ExploreCaves");
				else
					BrightForest.gatherGlowberries("GatherCaves");
		}
		if (label == "Spelunk Violet") VioletMeteorite.violetMeteoriteExplore("ExploreCaves");
		if (label == "Sweetgrass Bouquet") BrightForest.makeBouquet("main");
	}

	public static function itemCall(label:String):Void {
		var activatable:Array<String> = ["Pastel Ring", "Candy Ring", "Mood Ring", "Curiosity Ring", "Privacy Ring"];

		var it:Item = getItem(label);
		if (it.amount <= 0) return;

		if (activatable.indexOf(it.label) != -1) {
			it.active = !it.active;

			if (it.active && it.label == "Curiosity Ring") {
				msg("*notices*", true);
			} else if (!it.active && it.label == "Curiosity Ring") {
				msg("*ignores*", true);
			} else {
				msg(it.label+" "+(it.active?"":"de")+"activated.", true);
			}

			if (it.active && it.label == "Mood Ring" && (data.hasCock || data.hasBoth)) {
				moodRingCalibration("main");
			}
		}

		/*if (it.label == "Bag o Trash") function() {
			append(pickOne(["",
				"",
				"",
				"",
				"",
				""]));
		}*/
		if (it.label == "Cipher Key") {
			cipherKeyCalibration("main");
		}
		if (it.label == "AUTO-MYNT") {
			BrightForest.brightForestExplore("world shop");
		}
		if (it.label == "Daydream Journal") Journal.journal();
		if (it.label == "Genderfluiditizer") doGenderfluiditizer();
		if (it.label == "Cell Phone") {
			playSound("assets/audio/environment/openphone");
			Calls.calls("main");
		} else if (it.label == "Glowberry Wine" || it.label == "Cum Balloon" || it.label == "Piss Balloon") {
			msg(pickOne(["You spill "+(it.label == "Cum Balloon" ? "cum" : it.label == "Piss Balloon" ? "piss" : "wine")+" all over yourself.", "You guzzle a "+it.label+".", "You drain a "+it.label+".", "Fat sips slip down your hatch.", "SLURRRRRRPPP", "SLUUURrrrrRRRrrRRRP", "Mmff... so tasty...", "First some slurps, then some swizzles."]), true);
			addToItem(it.label, -1);
			playSound("assets/audio/music/sexyBoys");
		} else {
			playSound(Theme.getSound("toggle"));
		}
		//if (i.amount > 0) i.amount--;
	}

	public static function finalExploreCall(hub:String):Void {
		if (hub == "Bright Forest") {
			clear();
			if (!data.exploreFinaleBFDone) {
				var snippet = 5;
				var common = 20;
				var rare = 2;
				var megarare = 1;
				data.exploreFinaleBFDone = true;
				append("You wander down the path for what feels like hours, breathing in the sounds of the forest. Nothing jumps out and tries to fuck you. Nothing really interesting happens at all. Eventually you come across a plain rock sprinkled on its underside with glowmoss and sit your ass down for a good rest.\n\nYou find a single missing page from your Daydream Journal sitting on this rock, tattered from the wind. It's all spaghetti code. You can't read any of it.\n\nMaybe you could visit someone or grind for items in a bit, but for now, you've seen it all.\n\n");
				unlockJournal("Missing Page 4");
				msg("Found Missing Page #4", true);
				playSound('assets/audio/environment/journalPage');
				//@TODO: Fills the area with blank passages
				addExplorable(93, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale1"), snippet, -1);
				addExplorable(94, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale2"), common, -1);
				addExplorable(95, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale3"), common, -1);
				addExplorable(96, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale4"), common, -1);
				addExplorable(97, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale5"), rare, -1);
				addExplorable(98, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale6"), rare, -1);
				addExplorable(99, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale7"), megarare, 15);
				addExplorable(100, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale8"), rare, -1);
				addExplorable(101, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale9"), rare, -1);
				addExplorable(102, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale10"), rare, -1);
				addExplorable(103, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale11"), megarare, 5);
				addExplorable(104, "Bright Forest", BrightForest.brightForestExplore.bind("afterFinale12"), megarare, 2);
				GameData.reInitRefs();

				if (!data.exploreFinaleJCDone || !data.exploreFinaleVMDone) {
					//If you haven't finished Junk City/Violet Meteorite, give the option to go there
					addChoice("Visit Junk City.", JunkCity.junkCityHub);
					addChoice("Climb up to Violet Meteorite.", VioletMeteorite.violetMeteoriteHub);
					addChoice("Stay here.", function () {
						startHub("Bright Forest");
						if (!data.myntScenesDisabled) MyntScenes.checkScenes();
					});
				} else if (!data.myntScenesDisabled) {
					//Otherwise check for Mynt scenes and stay on hub
					MyntScenes.checkScenes();
				}
			} else {
				startHub("Bright Forest");
				append("You're somewhere in Bright Forest.\n\nYou've seen it all.");
			}
		}

		if (hub == "Junk City") {
			clear();
			if (!data.exploreFinaleJCDone) {
				data.exploreFinaleJCDone = true;
				append("You wander into a peaceful suburb hanging off the side of a superhighway. At the highest point you flop onto a bench, soaking in a view of the housing grid and its rolling emerald lawns, listening to the dull roar of traffic and the echoes of cub laughter.\n\nYou find a single missing page from your Daydream Journal sitting on this bench, tattered from the wind. It's all spaghetti code. You can't read any of it.\n\nMaybe you could visit someone or do something in a bit, but for now, you've seen it all.");
				unlockJournal("Missing Page 3");
				msg("Found Missing Page #3", true);
				playSound('assets/audio/environment/journalPage');

			} else {
				if (data.theme.background != "dawn") {
					var s:MintSprite = addSprite("assets/img/effect/junkCityHub.png");
					s.x = 0;
					s.y = 51;
				}
				append("You've seen it all for Junk City.");
				if (!data.exploreFinaleBFDone || !data.exploreFinaleVMDone) {
					addChoice("Hop on over to Bright Forest.", BrightForest.brightForestHub);
					addChoice("Climb up to Violet Meteorite.", VioletMeteorite.violetMeteoriteHub);
					addChoice("Stay here.", function () {
						startHub("Junk City");
						if (!data.myntScenesDisabled) MyntScenes.checkScenes();
					});
				} else if (!data.myntScenesDisabled) {
					MyntScenes.checkScenes();
				}
			}
		}

		if (hub == "Violet Meteorite") {
			clear();
			if (!data.exploreFinaleVMDone) {
				data.exploreFinaleVMDone = true;
				data.apothecaryUnlocked = true;
				append("You sit your tuckered ass down in a little crater that hugs your cheeks just right. Winds and rain swirl around the sides of the meteorite, but not up here. You only feel a ticklish breeze and take in the rains from your warm, dry butt crater. It's calming. Similar to sitting by the fireplace and watching a storm rage just outside the window.\n\nMaybe you could visit someone or do something in a bit, but for now, you've seen it all.");
			} else {
				if (data.theme.background != "dawn") {
					var s:MintSprite = addSprite("assets/img/effect/violetMeteoriteHub.png");
					s.x = 0;
					s.y = 101;
				}
				data.apothecaryUnlocked = true;
				append("You've seen it all for Violet Meteorite.");
				if (!data.exploreFinaleBFDone || !data.exploreFinaleJCDone) {
					addChoice("Throw myself down to Bright Forest.", BrightForest.brightForestHub);
					addChoice("Ask a bird to fly me to Junk City.", JunkCity.junkCityHub);
					addChoice("Stay here.", function () {
						startHub("Violet Meteorite");
						if (!data.myntScenesDisabled) MyntScenes.checkScenes();
					});
				} else if (!data.myntScenesDisabled) {
					MyntScenes.checkScenes();
				}
			}
		}
	}

	public static function goCaves(tmxName:String, onComplete:Void->Void):Void {
		/// Get cave name and path
		var caveName:String = "";
		var tmxPath:String = "";
		for (assetPath in getAssetList()) {
			if (assetPath.contains(tmxName) && assetPath.contains(".tmx")) {
				tmxPath = assetPath;
				var baseNameSplit:Array<String> = assetPath.split(".");
				baseNameSplit.pop();
				baseNameSplit = baseNameSplit.join("").split("/");
				var baseName:String = baseNameSplit.pop();
				caveName = baseName;
			}
		}

		var smallItems:Int = 0;
		var mediumItems:Int = 0;
		var largeItems:Int = 0;
		var specialItems:Int = 0;

		setChannelVolume("item", 0.4);

		function endScreen(won:Bool):Void {
			clear();
			enablePause();

			var totalItems:Int = Math.round(Math.pow((smallItems+mediumItems*2+largeItems*3), 0.6));
			var yield:String = "<!img:kink/Trash.png>   Garbo Yield   <!img:kink/Trash.png>";

			if (won) {
				if (totalItems > 0) {
					if (totalItems > 2) yield = "<!img:kink/Raunch.png>   <!b>Greasy Yield<!b>   <!img:kink/Raunch.png>";
					if (totalItems > 4) yield = "<!img:kink/Cub.png>   <!b>Meager Yield<!b>   <!img:kink/Cub.png>";
					if (totalItems > 6) yield = "<!img:kink/Love.png>   <!b>Sassy Lil Yield<!b>   <!img:kink/Love.png>";
					if (totalItems > 8) yield = "<!img:kink/Foodplay.png>   <!b>Tasty Yield<!b>   <!img:kink/Foodplay.png>";
					if (totalItems > 10) yield = "<!img:kink/Piss.png>   <!b>Juicy Yield<!b>   <!img:kink/Piss.png>";
					if (totalItems > 13) yield = "<!img:kink/Feral.png>   <!b>Primal Yield<!b>   <!img:kink/Feral.png>";
					if (totalItems > 16) yield = "<!img:kink/Music.png>   <!b>Bumpin Yield<!b>   <!img:kink/Music.png>";
					if (totalItems > 19) yield = "<!img:kink/Hyper.png>   <!b>Ginormo Yield<!b>   <!img:kink/Hyper.png>";
					if (totalItems > 25) yield = "<!img:kink/Snuff.png>   <!b>Killer Yield<!b>   <!img:kink/Snuff.png>";

					playSound("assets/audio/environment/caveWin"+(totalItems > 19 ? "Big" : totalItems > 10 ? "Medium" : "Small"), "caveEnd");
					addToItem("Capsule", totalItems);

					append("<!20px>"+pickOne(["You made it out!", "You stumble back into the moonlight.", "You exit the caves.", "You climb out.", "You pull yourself out and examine the yield.", "You make it out of the cave.", "You scurry up onto the surface again."])+"<!20px><!16px>\n\nYield             Ranking<!16px><!10px>\n—————————————————————————————\n<!10px><!14px><!img:item/Capsule.png> <!b>x"+totalItems+"<!b>            "+yield+"\n\nCapsule Bits — <!b>"+smallItems+"<!b>\nCapsule Piles — <!b>"+mediumItems+"<!b>\nFat Capsules — <!b>"+largeItems+"<!b>\n\n<!14px>");

					if (totalItems >= 6) Theme.unlockRandomPiece("suave");
				} else {
					append("<!20px>"+pickOne(["You made it out!", "You stumble back into the moonlight.", "You exit the caves.", "You climb out.", "You make it out of the cave.", "You scurry up onto the surface again."])+"<!20px><!14px>\n\n... but you feel like you should've explored a bit more.<!14px>");
				}
			} else {
				append("<!20px>"+pickOne(["You fucked up!", "You wander the caves for hours.", "You sit in the dark and cry for hours before eventually finding an exit.", "Hours pass before you see light again.", "You get lost in the caves.", "You bump into shit left and right in the dark, dropping all of your items.", "You ran out of light."])+"<!20px><!14px>\n\n"+(totalItems > 0 ? "You found <!img:item/Capsule.png> <!b>x"+totalItems+"<!b> Capsules and lost it all." : "... and you didn't even snag any caps!")+"<!14px>");
				playSound("assets/audio/environment/caveLose", "caveEnd");
			}

			addChoice("Move along.", onComplete);
		}

		function onCollect(tile:Int):Bool {

			if (tile == Caves.SPAWN || tile == Caves.EXIT) {
				playSound("assets/audio/environment/caveDoor", "caveExit");
				Caves.destroyCaves();
				endScreen(true);
				return false;
			} else if (tile == Caves.ITEM_1) {
				playSound("assets/audio/ui/dropbox/1", "item");
				smallItems++;
			} else if (tile == Caves.ITEM_2) {
				playSound("assets/audio/ui/dropbox/2", "item");
				mediumItems++;
			} else if (tile == Caves.ITEM_3) {
				playSound("assets/audio/ui/dropbox/3", "item");
				largeItems++;
			} else if (tile == Caves.ITEM_4) {
				if (caveName != "Reflective Cavern") msg("<!b>You got the Pink Flower!<!b>", true);
				playSound("assets/audio/ui/unlockUI", "item");
				specialItems++;

				if (caveName == "Twisting Cavern" || caveName == "Chimerical Cavern") {
					for (y in 1...Caves.tilemap.tilesHigh-1)
						for (x in 1...Caves.tilemap.tilesWide-1)
							if (Caves.isWall(Caves.getTile(x, y)))
								Caves.setTile(x, y, Caves.GROUND);
					Caves.redraw();
				} else if (caveName == "Ringed Cavern") {
					Caves.replace(Caves.ITEM_1, Caves.ITEM_2);
				} else if (caveName == "Layered Cavern") {
					Caves.replace(Caves.ITEM_3, Caves.EXIT);
				} else if (caveName == "Abandoned Cavern") {
					Caves.power = Caves.MAX_POWER;
				} else if (caveName == "Scattered Cavern") {
					for (y in 0...Caves.tilemap.tilesHigh)
						for (x in 0...Caves.tilemap.tilesWide)
							if (Caves.getTile(x, y) == Caves.SPAWN)
								if (x != Caves.spawnPoint.x || y != Caves.spawnPoint.y)
									Caves.movePlayer(x, y+1);
				} else if (caveName == "Lucky Cavern") {
					Caves.replace(Caves.ITEM_1, Caves.ITEM_3);
				} else if (caveName == "Reflective Cavern") {
					for (y in 1...Caves.tilemap.tilesHigh) {
						for (x in 1...Std.int(Caves.tilemap.tilesWide/2)) {
							var newX:Int = Caves.tilemap.tilesWide-x-2;
							var t1:Int = Caves.getTile(x, y);
							var t2:Int = Caves.getTile(newX, y);
							Caves.setTile(newX, y, t1);
							Caves.setTile(x, y, t2);
						}
					}
					Caves.autotile();
				}
			}

			return true; // Return true to destroy the tile collected
		}

		function onDeath():Void {
			Caves.destroyCaves();
			endScreen(false);
		}

		clear();
		append(pickOne(["A cave yawns at you through the bushes.", "You stumble onto a cave.", "You follow the sound of subterranean whistling. A cave gapes ahead.", "You startle two lovers curled up in a cave's mouth. They scurry away, but not before those last few thrusts~", "Moss and treeroots run slick over the entrance to a tunnel."])+"\n\n");

		if (getJournalEntries().contains(caveName) && !data.daydream) {
			append("You're back at the <!b>"+caveName+"<!b>.");
		} else if (caveName == "Scattered Cavern") {
			append("You peek inside. It looks like it might've been a natural system at one point... but the whole thing's been smashed up inside. Empty tranquilizer darts pepper the walls. Secret passages lay open and eviscerated.\n\nSome real shit went down in here.");
		} else if (caveName == "Abandoned Cavern") {
			append("Lawnchairs and beanbags sag out front, some of them on the verge of tumbling inside. A faded sign:\n\n<!i>Lamblea Commune\n\nRules:\n- You HAVE to be naked all the time period, yes it gets cold but that will make your nips puffy and puffy nips are a valuable community asset\n- Only smoke sweet grass outside 10 ft or further from the entrance\n- It gets damp when it rains so make sure you have a fetish for fucking in the mud\n- No complaining about how many rules there are\n- No snuff no gore no mean stuff period\n- Respect Kemp or he will fuck your butt (if your a girl) and dont enter his mansion at the back of the cave\n- We have glow berry breakfast at 9 and we would like everyone to attend breakfast. Please be up early\n- Have fun and do your own thing (within the constraints of this sign.)<!i>");
		} else if (caveName == "Layered Cavern") {
			append("The corridors spiral aimlessly towards one central den, filled with stale nests and feathers, and tiny burrows pocket the walls. The whole cave smells like bird pussy.");
		} else if (caveName == "Twisting Cavern") {
			append("Someone literally just carved a maze into the rock. You don't think they even started with a cave system; you run a hand over the entrance wall and your fingers fall into line with the grooves of a million chiselmarks.\n\nSixty-six years is a long time.");
		} else if (caveName == "Ringed Cavern") {
			append("You hold your ear to the chasm and soak up the weird acoustics. It sounds like the cave is chewing? Deep rings of rock gargle the fresh air flowing in from behind you and spit it back out in your face stale and heavy with reverb.\n\nSomeone punched a hallway through the concentric ring design. There must've been a real juicy stash in the middle zone, but they cleaned it out. Only a little trail of capsule crumbs remains.");
		} else if (caveName == "Reflective Cavern") {
			append("You take two cautious steps into the darkness. The echo of your footsteps returns backwards.");
		} else if (caveName == "Chimerical Cavern") {
			append("It smells like tiger in here. The walls glitter with stashed capsules.");
		} else if (caveName == "Lucky Cavern") {
			append("<!14px>Oh. My. Fuck.\n\nThis is not a regular ol hole in the ground. This is a massive bank account!!!\n\nIt was hidden deep in the hills, with a false boulder for an entrance, three passcodes, and a vault door, but that didn't stop someone from digging a couple alternate entrances in through the back! >:3\n\n<!14px><!10px>... the owner must be so rich they don't even care enough to come check up on it...<!10px><!14px>\n\nWhy are you still reading this?! Go get some loot!!<!14px>");
			addChoice("Stealing isn't okay.", onComplete);
		}

		if (caveName != "Lucky Cavern") unlockJournal(caveName);
		addChoice("Enter the cavern.", function() {
			disablePause();
			playSound("assets/audio/environment/caveDoor", "caveEnter");
			Caves.caveGame(tmxPath, onCollect, onDeath);
		});

		addChoice("Avoid caves in general.", function () {
			addAction("Spelunk Violet", "The meteorite is wrought with layered, vertical cave systems. The vast majority of them do not have an entrance or exit. The Apothecary does not allow L.L.L. scientists up here.", "Violet Meteorite");
			addAction("Spelunk Forest", "Purple crags have splintered off of Violet Meteorite and now they rest suspended in the canopy. Every crack coaxes you into a porous purple cave system. All of the caves have been determined by the L.L.L. Field Research Team (aka John) to be safe, with no risk of respawning in a closed cave system underground.", "Bright Forest");
			if (!getJournalEntries().contains("Scattered Cavern")) unlockJournal("Scattered Cavern");
			if (!getJournalEntries().contains("Layered Cavern")) unlockJournal("Layered Cavern");
			if (!getJournalEntries().contains("Chemerical Cavern")) unlockJournal("Chemerical Cavern");
			if (!getJournalEntries().contains("Ringed Cavern")) unlockJournal("Ringed Cavern");
			if (!getJournalEntries().contains("Reflective Cavern")) unlockJournal("Reflective Cavern");
			if (!getJournalEntries().contains("Abandoned Cavern")) unlockJournal("Abandoned Cavern");
			if (!getJournalEntries().contains("Twisting Cavern")) unlockJournal("Twisting Cavern");
			for (i in [110, 111, 112]) disableExplorable(i);

			onComplete();
		});
		addChoice("Move along.", onComplete);
	}

	public static function goHubCall(hub:String=null):Void {
		if (hub == null) hub = data.currentHub;
		if (hub == "Bright Forest") BrightForest.brightForestHub();
		if (hub == "Junk City") JunkCity.junkCityHub();
		if (hub == "Violet Meteorite") VioletMeteorite.violetMeteoriteHub();
	}

	public static function goHubCallback():Void {
		if (data.daydream) {
			wakeUp();
			return;
		}
	}

	public static function pauseClickedCallback():Bool {
		if (data.daydream) {
			wakeUp();
			return false;
		}
		return true;
	}

	public static function moodRingCalibration(seg:String):Void {
		clear();

		if (seg == "main") {
			if (data.moodRingColor == "" || data.moodRingFlavor == "") {
				disablePause();
				append("A note from Som: \"Please calibrate your Mood Ring before you put it on!\"");
			} else {
				enablePause();
				append("<!b>Cum Flavor: <!b>"+data.moodRingFlavor.toTitleCase()+".\n<!b>Cum Color: <!b>"+data.moodRingColor.toTitleCase()+".");
			}

			addChoice((data.moodRingFlavor != ""?"Change flavor.":"Set flavor."), moodRingCalibration.bind("flavor"));
			addChoice((data.moodRingColor != ""?"Change color.":"Set color."), moodRingCalibration.bind("color"));
		}

		if (seg == "flavor") {
			append("Pick a flavor!");
			for (s in ["Cherry", "Mint", "Blueberry", "Musk", "Chocolate", "Pizza", "Campfire", "Lemon", "Shit", "Piss", "Vanilla", "Candy"])
				addChoice(s+".", function(){
					data.moodRingFlavor = s;
					msg("Your cum is now "+s.toLowerCase()+" flavored.", true);
					moodRingCalibration("main");
				});
			addChoice("Back.", moodRingCalibration.bind("main"), {enabled: (data.moodRingFlavor != "")});
		}

		if (seg == "color") {
			append("Pick a color!");
			for (s in ["Brown", "Black", "Red", "Orange", "Yellow", "Green", "Blue", "Cyan", "Indigo", "Purple", "Pink"])
				addChoice(s+".", function(){
					data.moodRingColor = s;
					msg("Your cum is now "+s.toLowerCase()+".", true);
					moodRingCalibration("main");
					cumEffect();
				});
			addChoice("Back.", moodRingCalibration.bind("main"), {enabled: (data.moodRingColor != "")});
		}

		addChoice("Move along.", gotoHub.bind(null), {enabled: (data.moodRingColor != "" && data.moodRingFlavor != "")});
	}

	public static function cipherKeyCalibration(seg:String):Void {
		clear();

		if (seg == "main") {
			append("This item is useless. It just has random letters and numbers on it.\n\n");
			for (str in ["P R A Y", "F O R", "A", "C U T E R", "F U T U R E"])
				append(str+"  <!b>|<!b>  "+StoryUtils.cipherize(str)+"\n");
			addChoice("Move along.", gotoHub.bind(null));
		}
	}

	public static function doGenderfluiditizer():Void {
		clear();
		append("Current player variables:\n\n<!b>Gender:<!b> "+pickByGender("Male", "Female", "Neutral")+"\n<!b>Junk:<!b> "+pickByGenitals("Cock", "Cunt", "Both")+"\n<!b>Chest:<!b> "+(data.hasBoobs?"Boobs":"Flat"));

		addChoice("Cycle genders.", function() {
			if (data.genderFemale) {
				data.genderFemale = false;
				data.genderMale = true;
			} else if (data.genderMale) {
				data.genderMale = false;
				data.genderNeutral = true;
			} else if (data.genderNeutral) {
				data.genderNeutral = false;
				data.genderFemale = true;
			}
			msg("Switched to "+pickByGender("male", "female", "neutral gender")+".", true);
			doGenderfluiditizer();
		});

		addChoice("Cycle junk.", function() {
			if (data.hasCunt) {
				data.hasCunt = false;
				data.hasCock = true;
			} else if (data.hasCock) {
				data.hasCock = false;
				data.hasBoth = true;
			} else if (data.hasBoth) {
				data.hasBoth = false;
				data.hasCunt = true;
			}
			msg("Switched to "+pickByGenitals("cock", "cunt", "cock and cunt")+".", true);
			doGenderfluiditizer();
		});

		addChoice("Toggle tits.", function() {
			data.hasBoobs = !data.hasBoobs;
			msg("You "+(data.hasBoobs?"now have big juicy tiddies":"are now flat-chested")+".", true);
			doGenderfluiditizer();
		});

		addChoice("Randomize.", function() {
			data.hasBoobs = !data.hasBoobs;
			var genderString = pickOne(["m", "f", "n"]);
			data.genderMale = genderString == "m";
			data.genderFemale = genderString == "f";
			data.genderNeutral = genderString == "n";

			var hasString = pickOne(["cock", "cunt", "both"]);
			data.hasCock = hasString == "cock";
			data.hasCunt = hasString == "cunt";
			data.hasBoth = hasString == "both";

			msg(pickOne(["Your bod just got shuffled around big time.", "You just got randomized.", "Invisible paws fandangle your junk into new junk.", "Randomized.", "Shuffled yer shit around.", "Randomized junk, gender, and tiddy existence.", "Parts of you grow and shrink at random.", "Your identity and body have been eggbeater'd.", "Randomized everything.", "Your vars get scrambled.", "Scrambled.", "Your body and soul have been scrambled.", "Random pieces and parts get slapped onto ya."]), true);
			doGenderfluiditizer();
		});

		addChoice("Move along.", gotoHub.bind(null));
	}
}
