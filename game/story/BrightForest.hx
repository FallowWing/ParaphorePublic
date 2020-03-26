package story;

class BrightForest {

	public static function init():Void {
		var snippet = 10;
		var common = 20;
		var rare = 5;
		var megarare = 1;
		addExplorable(1, "Gather Glowberries", gatherGlowberries.bind("rng1"), common, -1);
		addExplorable(2, "Gather Glowberries", gatherGlowberries.bind("rng2"), common, -1);
		addExplorable(3, "Gather Glowberries", gatherGlowberries.bind("rng3"), common, -1);
		addExplorable(4, "Gather Glowberries", gatherGlowberries.bind("rng4"), rare, 5);
		addExplorable(5, "Gather Glowberries", gatherGlowberries.bind("rng5"), rare, 1);
		addExplorable(6, "Gather Glowberries", gatherGlowberries.bind("rng6"), rare, 1);
		addExplorable(7, "Gather Glowberries", gatherGlowberries.bind("rng7"), rare, 5);
		addExplorable(8, "Gather Glowberries", gatherGlowberries.bind("rng8"), megarare, 1);
		addExplorable(9, "Gather Glowberries", gatherGlowberries.bind("GatherNymph"), common, 1);
		addExplorable(10, "Gather Glowberries", gatherGlowberries.bind("GatherFoxes"), common, 1);
		addExplorable(71, "Gather Glowberries", gatherGlowberries.bind("GatherDeerDog"), common, 1);
		/* addExplorable(107, "Gather Glowberries", gatherGlowberries.bind("GatherCaves"), megarare, 8); */
		addExplorable(112, "Gather Glowberries", gatherGlowberries.bind("GatherCaves"), common, 6);

		addExplorable(11, "Bright Forest", brightForestExplore.bind("rng1"), snippet, 1);
		addExplorable(12, "Bright Forest", brightForestExplore.bind("rng2"), common, 1);
		addExplorable(13, "Bright Forest", brightForestExplore.bind("rng3"), common, 1);
		addExplorable(14, "Bright Forest", brightForestExplore.bind("rng4"), rare, 1);
		addExplorable(15, "Bright Forest", brightForestExplore.bind("rng5"), common, 1);
		addExplorable(16, "Bright Forest", brightForestExplore.bind("rng6"), rare, 1);
		addExplorable(17, "Bright Forest", brightForestExplore.bind("rng7"), common, 1);
		addExplorable(18, "Bright Forest", brightForestExplore.bind("rng8"), rare, 1);
		addExplorable(19, "Bright Forest", brightForestExplore.bind("rng9"), common, 1);
		addExplorable(20, "Bright Forest", brightForestExplore.bind("rng10"), rare, 1);
		addExplorable(21, "Bright Forest", brightForestExplore.bind("rng11"), rare, 1);
		addExplorable(22, "Bright Forest", brightForestExplore.bind("rng12"), megarare, 1);
		addExplorable(23, "Bright Forest", brightForestExplore.bind("rng13"), rare, 1);
		addExplorable(24, "Bright Forest", brightForestExplore.bind("rng14"), common, 1);
		addExplorable(25, "Bright Forest", brightForestExplore.bind("rng15"), common, 1);
		addExplorable(26, "Bright Forest", brightForestExplore.bind("rng16"), common, 1);
		addExplorable(27, "Bright Forest", brightForestExplore.bind("rng17"), common, 1);
		addExplorable(73, "Bright Forest", brightForestExplore.bind("rng17a"), common, 1);
		addExplorable(79, "Bright Forest", brightForestExplore.bind("rng18"), common, 1);
		addExplorable(80, "Bright Forest", brightForestExplore.bind("rng19"), common, 1);
		addExplorable(114, "Bright Forest", brightForestExplore.bind("rng20"), common, 1);
		addExplorable(115, "Bright Forest", brightForestExplore.bind("rng21"), megarare, 1);
		addExplorable(116, "Bright Forest", brightForestExplore.bind("rng22"), megarare, 1);
		addExplorable(143, "Bright Forest", brightForestExplore.bind("rng23"), megarare, 1);
		addExplorable(28, "Bright Forest", Roxelle.roxExplore, common, 1);
		addExplorable(29, "Bright Forest", Red.explore.bind("intro"), common, 1);

		addExplorable(30, "Bright Forest", brightForestExplore.bind("ExploreCampsite"), common, -1);
		addExplorable(31, "Bright Forest", brightForestExplore.bind("ExploreNymph"), common, 1);
		addExplorable(32, "Bright Forest", brightForestExplore.bind("ExploreLunarGlade"), rare, 1);
		addExplorable(33, "Bright Forest", brightForestExplore.bind("ExploreDarts"), rare, 1);
		addExplorable(34, "Bright Forest", brightForestExplore.bind("ExploreFlyTrap"), common, -1);
		addExplorable(35, "Bright Forest", brightForestExplore.bind("ExploreSalvage"), common, -1);
		addExplorable(36, "Bright Forest", brightForestExplore.bind("ExploreCarve"), rare, -1);
		addExplorable(37, "Bright Forest", brightForestExplore.bind("ExploreHovel"), megarare, 1);
		addExplorable(38, "Bright Forest", brightForestExplore.bind("ExploreArgument"), megarare, 1);
		addExplorable(39, "Bright Forest", brightForestExplore.bind("The Floatillery"), common, 1);
		addExplorable(40, "Bright Forest", brightForestExplore.bind("ExploreKemp"), common, 1);
		addExplorable(70, "Bright Forest", brightForestExplore.bind("ExploreGobbo"), common, 1);
		addExplorable(72, "Bright Forest", brightForestExplore.bind("ExploreOwlGirl"), common, 1);
		addExplorable(74, "Bright Forest", brightForestExplore.bind("ExploreWorldShop"), common, 1);
		addExplorable(76, "Bright Forest", brightForestExplore.bind("ExploreSpaceDragon"), common, 1);
		addExplorable(78, "Bright Forest", brightForestExplore.bind("ExploreInfoSign"), common, 1);
		addExplorable(92, "Bright Forest", brightForestExplore.bind("ExploreSuitcase"), megarare, 1);
		/* addExplorable(106, "Bright Forest", brightForestExplore.bind("ExploreCaves"), common, 6); */
		addExplorable(111, "Bright Forest", brightForestExplore.bind("ExploreCaves"), common, 6);
		addExplorable(131, "Bright Forest", brightForestExplore.bind("ExploreMyrrh"), 30, 5);

		addExplorable(41, "Landfill", landFillExplore.bind("salvage1"), rare, 1);
		addExplorable(42, "Landfill", landFillExplore.bind("salvage2"), rare, 1);
		addExplorable(43, "Landfill", landFillExplore.bind("salvage3"), rare, 1);
		addExplorable(44, "Landfill", landFillExplore.bind("salvage4"), common, 1);
		addExplorable(45, "Landfill", landFillExplore.bind("salvage5"), rare, 1);
		addExplorable(46, "Landfill", landFillExplore.bind("salvage6"), rare, 1);
	}

	private static function spawnItem(itemName:String):Void {
		if (itemName == "Glowberry") {
			var spawnedItem:MintSprite = addSprite("assets/img/effect/exploreGlowberries.png");
			spawnedItem.layer = Main.HUB_LAYER;
			spawnedItem.x = GAME_WIDTH;
			spawnedItem.y = 60+Math.random()*200;
			spawnedItem.rotation = 100+400*Math.random();
			tween(spawnedItem, {y: GAME_HEIGHT-100-spawnedItem.height}, 1.5, {ease: BOUNCE_OUT});
			tween(spawnedItem, {x: GAME_WIDTH*0.5*Math.random()+50, rotation: 0}, 2, {ease: QUAD_OUT});

			spawnedItem.onReleaseOnce = function(){
				tween(spawnedItem, {scaleX: 0.3, scaleY: 0.3}, 0.15, {onComplete: function() {
					addToItem("Glowberry", 1);
					spawnedItem.destroy();
				}});
			}
		} else if (itemName == "Sweetgrass Leaf") {
			var spawnedItem:MintSprite = addSprite("assets/img/effect/exploreSweetgrass.png");
			spawnedItem.layer = Main.HUB_LAYER;
			spawnedItem.x = 60+Math.random()*400;
			spawnedItem.y = GAME_HEIGHT-60-spawnedItem.height;
			spawnedItem.scaleY = 0;
			tween(spawnedItem, {scaleY: 1, y: spawnedItem.y-40}, 1.5, {ease: ELASTIC_OUT});

			spawnedItem.onReleaseOnce = function() {
				tween(spawnedItem, {scaleX: 0.3, scaleY: 0.3}, 0.15, {onComplete: function() {
					addToItem("Sweetgrass Leaf", 1);
					spawnedItem.destroy();
				}});
			}
		}
	}

	public static function brightForestHub():Void {
		clear();

		//Setup
		playMusic("brightForest");
		setLocation("Bright Forest");
		saveCheckpoint("BrightForest.brightForestHub();");

		//Unlock scenes
		if (data.johnLanaJCDone && data.johnLanaVMDone && !data.glowbunnyDone) {
			addExplorable(148, "Bright Forest", brightForestExplore.bind("ExploreGlowbunny"), 20, 1);
			GameData.reInitRefs();
		}
		
		if (Math.random() > 0.95) {
			if (data.theme.choiceBox == "myrrh") {
				var s:MintSprite = addSprite("assets/img/item/Glowberry.png");
				s.x = 375;
				s.y = 543;
				s.onReleaseOnce = function(){
					tween(s, {scaleX: 0.3, scaleY: 0.3}, 0.15, {onComplete: function() {
						addToItem("Glowberry", 1);
						s.destroy();
					}});
				}
			} else if (Math.random() > 0.5) {
				spawnItem("Glowberry");
			} else {
				spawnItem("Sweetgrass Leaf");
			}
		}

		//Intro
		if (!data.bfIntroDone) {
			data.bfIntroDone = true;

			append("You spawn under dim blue light in Bright Forest.\n\n"+pickOne(["This forest gets its name from the bioluminescent berries and shrooms latched to everything. They're even in the cool grass between your toes, all squishy and soft.", "The canopy hangs close overhead. It's dotted with glowing berries and one curious pair of eyeballs."])+"\n\n"+pickOne(["Waves crash in the distance.", "There's a meteorite spewing lava in the distance.", "Something in a red cloak sprints through the trees ahead, chasing a mossy figure and hitting him with a basket full of the berries. Cyan gunk splats everywhere.", "A little frog girl checks you out for a moment— when you notice her, she gets spooked and fucks off pronto.", "You smell pies...", "<!14px>Up ahead, through the trees, a feral nymph twitters at you like a tone-deaf cockatoo.\n\n<!14px><!10px>(You try to chase her down, but she's got wings— and a bottle of wine under her armpit that makes the flight path unpredictable and sloppy.)<!10px>"]));
			startHub("Bright Forest");
		} else {
			if (data.theme.background != "dawn" && data.theme.background != "enginetic" && data.theme.background != "freak") {
				var s:MintSprite = addSprite("assets/img/effect/brightForestHub.png");
				var destinationY:Int = 265;
				s.x = 0;
				s.y = destinationY+50;
				s.alpha = 0;
				tween(s, {y: destinationY}, 1.5, {ease: QUINT_OUT});
				tween(s, {alpha: 1}, 1.4, {ease: QUINT_IN});
			}
			startHub("Bright Forest");
			append("You're somewhere in Bright Forest.");
			if (!data.myntScenesDisabled) MyntScenes.checkScenes();
		}

		//Sweetgrass Bouquet logic
		if (getAction("Sweetgrass Bouquet") == null && getItem("Sweetgrass Leaf").amount > 0)
			addAction("Sweetgrass Bouquet", "Arrange <!img:item/Sweetgrass Leaf.png> <!b>x5<!b> Sweetgrass Leaves into a beautiful bouquet.", "Bright Forest");
	}

	public static function brightForestExplore(which:String):Void {
		clear();
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("BrightForest.brightForestExplore('"+which+"');");

		function plantGender(ifMale:String, ifFemale:String, ifNeutral:String):String {
			if (data.plantGender == "he") return ifMale;
			if (data.plantGender == "she") return ifFemale;
			if (data.plantGender == "it") return ifNeutral;
			return ifNeutral;
		}

		var his:String = plantGender("his", "her", "its");
		var him:String = plantGender("him", "her", "it");
		var he:String = data.plantGender;

		if (which == "rng1") {
			data.metRed++;
			addExplorable(141, "Bright Forest", brightForestExplore.bind("ExploreVelmanKids"), 1, 1);
			GameData.reInitRefs();
			append("You pass a wolf girl in a red hood, no older than ");
			if (isActive("Pastel Ring")) append("seven"); else append("ten");
			append(", basket bouncing merrily by her side.\n\n\"Want some?\" she asks, then pushes a handful of x5 Glowberries into your pocket without waiting for a response and skips away down the trail.");
			addAction("Gather Glowberries", "Scour the forest for berries.", "Bright Forest");
			if (canGain) addToItem("Glowberry", 5);
		} else if (which == "rng2") {
			append("You happen upon x3 Sweetgrass Leaves leaking through the electric fence around the overgrown hills of a Sweetgrass Golf Course. Even though lights still hum inside, the country club sits vacant and disheveled.");
			if (canGain) addToItem("Sweetgrass Leaf", 3);
		} else if (which == "rng3") {
			append("A daytime bird calls confused from somewhere in the night.");
			data.bfTimesPassed++;
		} else if (which == "rng4") {
			if (data.hasCock) append("You slip and tumble up to your waist in a giant random hole. You feel your pants pulled off and three sets of slobbery lips smush up between your legs, one sucking hard on both of your nuts, the other slipping around to your butt and wiggle-waggling with voracious enthusiasm, the last deepthroating about half of your cock at first with some difficulty and then three-quarters and then all of it, accelerating, desperate rapid gags coming muffled through the thick layer of earth around your hips.");
			if (data.hasBoth) append("You slip and tumble up to your waist in a giant random hole. You feel your pants pulled off and three sets of slobbery lips smush up between your legs, one sucking hard on both of your nuts, the other slipping around to your butt and wiggle-waggling with voracious enthusiasm, the last deepthroating about half of your cock at first with some difficulty and then three-quarters and then all of it, accelerating, desperate rapid gags coming muffled through the thick layer of earth around your hips.");
			if (data.hasCunt) append("Something darts across the path, undoes your pants, yanks down your panties, and crams its tongue as deep as it can into your cunt with such force that you fall backwards onto the dirt. Then it's gone.\n\nYou really don't know what just happened.");
		} else if (which == "rng5") {
			if (canGain) spawnItem("Glowberry");
			append("As you turn a corner on the trail, you glimpse a fat pink butt disappearing into the far trees. Whip-quick a glowberry sails through the night and splatters on the exact center of your forehead. A shadow giggles at you as the juice runs over your eyelids; even hours afterward you'll see a faint blue glow when you close them.");
			if (getAction("Gather Glowberries") == null)
				addAction("Gather Glowberries", "Scour the forest for berries.", "Bright Forest");
			data.bfBerriesThrown++;
		} else if (which == "rng6") {
			append((data.roxVisits>0?"Roxelle's dog Bert":"An old feral sheepdog")+" keeps nosing around after you, enticed by your "+pickByGender("manly", "womanly", "ethereal")+" scent.\n\nYou turn around and pet him a little. He sits his butt down right the dirt and takes those pettings like a total doggywhore.");
		} else if (which == "rng7") {
			append("Happy ukelele strums come from a warm flickery-lit triangular cloth tent. Silhouettes giggle and twist and groove together, casting languid shadows on its walls.");
		} else if (which == "rng8") {
			append("Two nymphs sit on a high branch, holding hands, looking to the summit of the meteorite above, barely visible through a break in the canopy.");
		} else if (which == "rng9") {
			append("Two glowing cyan eyes stare at you through a snaggle of bushes.\n\nIt slowly backs away.");
		} else if (which == "rng10") {
			append("Just ahead an abandoned mansion rots into the hill it's built on.");
		} else if (which == "rng11") {
			append("A feral wolf bounds out of the bushes, nearly knocking you over. Instead of wanting to devour you it instead seems eager to slobber happily at your face, and you get a noseful of the heavy scent of cum on its tongue.\n\n... you notice the bright pink panties stretched over its butt just before it races off.");
		} else if (which == "rng12") {
			append("You get turned around and somehow end up walking down a tree bough the width of a three-lane highway.");
		} else if (which == "rng13") {
			append("A faintly glowing lanky something is swinging from branch to branch high in the trees ahead.");
		} else if (which == "rng14") {
			append("There's an exhausted, soggy marshmellow in the middle of the path. Campers nearby, probably.");
			data.bfTimesPassed++;
		} else if (which == "rng15") {
			append("The smell radiates for miles around a sunken crater of sewage barrels. The roar of a highway is interspersed with leaf-rustling.");
			data.bfTimesPassed++;
		} else if (which == "rng16") {
			append("A squirrel darts past on a low skinny branch.");
			data.bfTimesPassed++;
		} else if (which == "rng17") {
			append("A feral owl shoots "+(isActive("Mood Ring")?getMood():"")+"cum in the trees above, hooting hard.");
		} else if (which == "rng17a") {
			append("You trip and lodge your "+pickByGenitals("cock", (data.hasBoobs?"tits":"fists"), "cock")+" in a mud puddle, and it feels pleasantly cool against your gray skin... you wipe it off with your fingers, nice and slow.");
		} else if (which == "rng18") {
			append("A nymph and a goblin launch themselves backwards from the bushes on either side of your path and trap you between their butts with a meaty <!i>SCHMACK.<!i>\n\nYou can't even see their junk... those bubbly asscheeks eclipse their entire bodies.\n\nIt's like a chinese fingertrap. The harder you try to squeeze loose (or just move at all, even to grope em) the harder they sandwich you, nymph grinding petite pink buttock over your left hip while goblin's green-speckled cheeks inflate opposite, getting fatter with your every movement.\n\nAfter a while you start noticing the details: every twitch of each pucker against your bare skin, every minute shift of invisible feet as they pre-empt your next escape attempt.\n\n... They have to get tired sometime...\n\n...\n\n.........\n\n... Yeah, they aren't getting tired. Consider this moment over for the sake of convenience.");
		} else if (which == "rng19") {
			append("You spot a feral(?) monkey boy hanging by his unusually powerful buttcheeks from a treebranch.\n\nWith a flick of the tail he's gone.\n\n<!i>Oooki ooki...<!i>.");
		} else if (which == "rng20") {
			append("You can tell a feral predator's approach by the upset birdcalls.\n\nNot even the tree branches are safe from these nimble sluts.");
		} else if (which == "rng21") {
			append("You stumble onto a village carved out of cascading Violet Meteorite chunks.\n\nSome scientists from the L.L.L. set up tents on the perimeter, but none of them want to go inside. The village's stone storage buildings puke cyan moss.\n\nOne small figure, full hazmat and blinders, hands you a sticky note: \"The people inside are fucking big squishy glowshrooms. Omit the word 'fucking' for an equally true statement.\"\n\n— Lana, Camp Leader");
		} else if (which == "rng22") {
			if (!data.myntPetDone) append("Something cyan finally takes form beyond a circular glowberry or a rectangular husk of glowcorn.\n\nYou see her only for a moment in the distance: a blue goat made of goo looking at the moon.\n\nI gotta send you a message.")
				else 
			append("The moon flickers like a CRT.");
		} else if (which == "rng23") {
			if (data.taroGutDone) append("Hey, you found the pile of eternally intact Taro corpses! The forest's nymph colonies built a cozy little village inside it. They brush their teeth with tarojuice and sleep on beds made of squishy tarobutts. The kids run around and smack each other with severed arms. It's actually kind of heartwarming.")
				else 
			append("You find a... you're not uh... you're kinda... this is hard to describe.\n\nIt's basically a massive pile of purple cats. They all seem kind of lifeless? But it doesn't matter, if any of them get injured, they just regenerate. The forest's nymph colonies built a cozy little village here. They use the magic cat bodies for all sorts of stuff, like beds, doors, tables, chairs... there's even a marketplace where nymphs put arbitrary values on the cats based on how used they are and trade and haggle them all day.");
		}
		append("\n");

		if (which == "afterFinale1") {
			append("There's a half-squashed glowberry caught "+pickOne(["between your bare toes", "in your hair", "behind your ear", "between your buttcheeks", "in your armpit"])+".");
				if (canGain) spawnItem("Glowberry");
			} else if (which == "afterFinale2") {
			append("You think about the little ocean.");
			} else if (which == "afterFinale3") {
			append("There aren't any hot singles in your area. You learned this after looking around for like an hour.\n\nYou sit back down on your rock and "+pickByGenitals("jack off", "twiddle your clit", "twiddle your clit")+", all lonely.");
			} else if (which == "afterFinale4") {
			append("Something's moving on the moon.\n\nYou squint at it and see nothing.");
			} else if (which == "afterFinale5") {
			append("You lay on your tummy, arms and legs hanging off the boulder.");
			} else if (which == "afterFinale6") {
			append("You pluck a perkly little blade of sweetgrass struggling to grow out from under the rock.");
			if (canGain) spawnItem("Sweetgrass Leaf");
			} else if (which == "afterFinale7") {
			append("A garbage bag swirls up to you in the breeze.");
			if (canGain) addToItem("Garbage Bag", 1);
			} else if (which == "afterFinale8") {
			append("It's quiet.");
			} else if (which == "afterFinale9") {
			append("Someone does an anime laugh in the distance.\n\n<!i>KEHEHEHEHEHEHEHEHEHEH~!<!i>");
			} else if (which == "afterFinale10") {
			append("You scrape a couple cute doodles into the rock's moss.");
			} else if (which == "afterFinale11") {
			var item:String = pickOne(["Piss Balloon", "Cum Balloon", "Glowberry Wine", "Glowberry Pie", "Sweetgrass Bouquet"]);
			append("A little band of cat merchants rolls by and hails you with saucy wiggles of their dicks and tiddies.\n\nThey throw down a "+(item=="Glowberry Wine"?"bottle of "+item.toLowerCase():item.toLowerCase())+" and cheer: \"They're back! They're back! "+pickByGender("Sir", "Ma'am", data.playerName)+", play well! Fuck hard! Whooopee! They're back!\"");
			if (canGain) addToItem(item, 1);
			} else if (which == "afterFinale12") {
			append("A feral squirrel dashes by your rock with full cheeks.\n\nOn a mischevious impulse you stick out your foot and trip her up. Her cheeks burst open, spilling ten capsules everywhere.\n\nShe stops to scoop up five of them, then figures the risk is too high to stay long and scurries off.");
			if (canGain) addToItem("Capsule", 5);
		}

		if (which == "floodHub") {
			disablePause();
			setLocation("Flooded Forest");
			playMusic("autoSpam");

			append("You sprint down that familiar path. It's always been quiet and empty, but now every forest resident who knows anything about the terrain has been funneled down onto this path as they try to escape the glowflood. Waves race you through the trees on your left and right as you dodge and weave between screaming people.\n\nAUTO-MYNTs careen through the canopy, taking down branches. You can't pick one out and track it; within a second they always split into two or three or more. Whole clouds of glowberries rain down from the AUTO-MYNTs in the sky like blue carpet bombings.\n\nA pack of wolves barrel past you on the path. The healthy half flees as the infected half chases. A single young doe with a wounded leg limps out of the forest. If it weren't for a dry patch on her belly, she would be infected.");

			addChoice("Indigo Pond.", brightForestExplore.bind("floodIndigo"));
			addChoice("Landfill.", brightForestExplore.bind("floodLandfill"));
			addChoice("Floatillery.", brightForestExplore.bind("floodFloatillery"));
			addChoice("Save Rox!!!", brightForestExplore.bind("floodRox"), {kinks: ["Intersex", "Male", "Feral", "Soft Vore"]});
			addChoice("Save Red!!!", brightForestExplore.bind("floodRed"), {kinks: data.redChoseCity?["Female", "Cub", "Blood"]:["Female", "Feral"]});
			if (data.bfVenusFed > 0) addChoice("Save Flytrap!!!", brightForestExplore.bind("floodFlytrap"));
			if (data.petGameData != null) addChoice("Save "+data.gooGoatName+"!!!", brightForestExplore.bind("floodBleat"));
			addChoice("World Map.", function() {
				WorldMap.map();
			});
			addChoice("Hold on... I think I might know the admin pass...", brightForestExplore.bind("floodPass"));
		}

		if (which == "floodPass") {
			append("Really?!?!");

			addTextChoice(function(str) {
				if (str.toUpperCase() == "STAYSTRONGMYNT" || str.toUpperCase() == "STAYSTRONGMYNT." || str.toUpperCase() == "STAYSTRONGMINT." || str.toUpperCase() == "STAYSTRONGMINT")
					MyntScenes.myntEnding("intro")
				else
					playSound("assets/audio/ui/nope");
			});
			addChoice("Nevermind, sorry...", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat") {
			append("You land at "+data.gooGoatHome+" and rush inside.\n\nThe rough-hewn hallways are sloshing with blue. Her bedroom, her posters, the bathtub— everywhere has been flooded.\n\nYou run back outside. There she is, at the very edge of the clearing, staring at the blue-dripping moon while waves eight times her height crest around her.");

			addChoice(data.gooGoatName+"!!!! Come here!! I have a gryphon! We can fly up there!", brightForestExplore.bind("floodBleat2"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat2") {
			append("A brutal mansion-sized wave crashes against the walls of your home. It's like a kid just kicked their lego building over. Everything bursts apart: logs of wood, square support pegs, window frames, all your hard work just splinters away from the foundation and whips past your faces.\n\n"+data.gooGoatName+" turns and says \""+data.playerName+", you came to save me,\" matter-of-factly, like she's just narrating a bizarre dream. She trots over on squishy paws and you haul her up onto the gryphon. A window breaks and shards fly through her belly. She squeals and shivers. The goo re-seals in no time.");

			addChoice("Strawberry, go!!! To the moon!!!", brightForestExplore.bind("floodBleat3"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat3") {
			append("A brutal mansion-sized wave crashes against the walls of your home. It's like a kid just kicked their lego building over. Everything bursts apart: logs of wood, square support pegs, window frames, all your hard work just splinters away from the foundation and whips past your faces.\n\n"+data.gooGoatName+" turns and says \""+data.playerName+", you came to save me,\" matter-of-factly. She trots over on squishy footpaws. You haul her up onto the gryphon. A window breaks and shards fly through her belly. She squeals and shivers, but her goo re-seals in no time.");

			addChoice("Strawberry, go!!! To the moon!!!", brightForestExplore.bind("floodBleat4"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat4") {
			append("<!i>The moon is weighed down with juice... It's under a lot of strain...<!i>\n\nStrawberry pants and exhaustedly slows "+gryphJunk("his", "her", "their")+" wingbeats as you approach. "+data.gooGoatName+" clings to your back. Her sticky goop soaks into your shirt. \"It's so big up close,\" she gasps. Strawberry lowers "+gryphJunk("himself", "herself", "themselves")+" down to the surface of the moon, flapping "+gryphJunk("his", "her", "their")+" wings slower, slower...");

			addChoice("Land.", brightForestExplore.bind("floodBleat5"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat5") {
			data.poppedMoon = true;
			append("Strawberry slams down onto the moonrock. "+data.gooGoatName+" slides excitedly off "+gryphJunk("his", "her", "their")+" back and lands on the surface with a gooey little splash.\n\n<!i>Bwoing.<!i>\n\nShe looks up at you, still on Strawberry's back. \"It's... bouncy?\"\n\nStrawberry blinks down at "+gryphJunk("his", "her", "their")+" talons.\n\nThe moon's surface isn't moonrock. It's strained, thin, inflated rubber.\n\nStrawberry projects images of tightrope walkers, eggshells under feetpaws, and balloons morphing around the tip of scissors.\n\n"+gryphJunk("He shifts his", "She shifts her", "They shift their")+" weight.\n\n"+gryphJunk("His", "Her", "Their")+" talons pierce the surface.");

			addChoice("Oh fuck.", brightForestExplore.bind("floodBleat6"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat6") {
			append("<!i>Pop.<!i>\n\n"+data.gooGoatName+" reaches up to take your hand as the moon deflates beneath her.\n\nThe hole beneath Strawberry's talons blasts you both away with a vicious burst of air.\n\n"+data.gooGoatName+" falls away into a windstorm of popped yellow rubber.\n\nThe whole thing crashes down into the cyan sea.");

			addChoice("Fly down!!", brightForestExplore.bind("floodBleat7"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodBleat7") {
			append("You fly down and try to find "+data.gooGoatName+" among the sinking scraps of moon. Even if you do spot a piece of her, she blends right into the glowjuice. Strawberry gasps for breath, combing over the wreckage front to back, side to side, coming at it from every possible angle.\n\nEventually, the last piece of pale yellow rubber sinks away.\n\n"+data.gooGoatName+" is gone.");

			addChoice("... No... save someone... I've got to be able to save someone...", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodIndigo") {
			append("The boys are all scrambling, sprinting, and flying through trees one way, and the girls are doing the same in the opposite direction. The result is two walls of drunken nymphs crashing against each other in perfect synchronization.\n\nSoon everyone is swallowed by a wave that canonballs down from the trees and overflows the lake. Glowjuice mingles with water, like it has on the ocean. Anyone who falls in the pond gets infected.\n\nKemp is nowhere to be seen.");

			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFlytrap") {
			if (data.bfVenusFed > 5) {
				append("Your flytrap doesn't need saving. "+plantGender("He couldn't", "She couldn't", "They don't")+" give a shit about the flood.\n\n"+plantGender("He just holds his toothy maw open and welcomes", "She just holds her toothy maw open and welcomes", "They just hold their toothy maw open and welcome")+" the never-ending glowberry meal.");
				addChoice("Okay that's good, move along!", brightForestExplore.bind("floodHub"));
			} else {
				append("Your flytrap isn't big enough to deal with the flood. "+plantGender("He's swallowed up'", "She's swallowed up", "They're swallowed up")+" with the quiet rustle of wet leaves.\n\nThe wave comes for you next.");
				addChoice("Oh no oh god, move along!", brightForestExplore.bind("floodHub"));
			}
		}

		if (which == "floodLandfill") {
			append("The mountain of hot-dog stands falls over and eats shit in the swirls of blue-brown mud. Fresh waves keep crashing over it, and the rest of the junk piles, but the mud is so absorbent and the piles are so porous, the flood is having trouble swallowing this place.");

			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery") {
			if (!getJournalEntries().contains("Missing Page 16")) {
				unlockJournal("Missing Page 16");
				msg("Found Missing Page #16", true);
				playSound('assets/audio/environment/journalPage');
			}
			append("You race down to the beach. The wet sand flies out behind your footsteps. Sprinting on sand is like running in a dream. The faster you try to go, the deeper your footsteps sink.\n\nThe otter boys try to swim far out in the water, but the flood pins them against the edge of the ocean. They hold each other and throw themselves off. Potential permadeath and injury is better than certain permadeath.\n\nYou climb onto a wildly swinging bridge. The ropes burn your palms. The currents of glowjuice throw huge waves through the water, and the rope-linked Flotillery buildings bob up and down ten feet at a time, straining to hold onto each other. All the customers and beachgoers scramble for safety, climbing onto roofs, hugging broken planks and desperately trying not to get fully sumberged when the next wave hits.");

			addChoice((data.savedRox?"Find":"Save")+" Som!!!", brightForestExplore.bind("floodFloatillery2"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery2") {
			append("You look up.\n\nSom's cabin is at the crest of a wave on the opposite end of the Floatillery's worker quarters. It towers in the distance for that moment you look at it, like a grail on a mountaintop.\n\nYou grit your teeth and start climbing and falling in sync with the waves. Whenever they crest in front of you, you use the ropes to shimmy yourself upward. Whenever a ten-foot trough opens up below your feet, you grab a rope and tarzan that shit over the swirling cyan abyss.\n\nTorches snuff out and crackle. Smoke blasts up your nose. Through the chaos, you see something unbelieveable:\n\nFloatillery employees, all clearly on orders from the Apothecary. They're smiling and grabbing whoever they can before dunking them in the dozens of glowberry wine barrels everywhere. One employee spots a group of five friends trying to swim to shore and cuts the ropes on the barrels above them.\n\nThey're all submerged.\n\nAnother employee spots you. He's sitting on a roof right directly above your head. He straddles a barrel of wine, dick throbbing hard, and starts to pry the lid open.");

			addChoice("dodge", brightForestExplore.bind("floodFloatillery3")); //floodFloatillery3
			addChoice("Dodge.", brightForestExplore.bind("floodFloatilleryBadEnd"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery3") {
			append("Thank fuck you didn't waste any keypresses on that one.\n\nYou just barely dive out of the way in time. You hit the swinging planks of a rope bridge and roll. Your spine goes <!i>chunkachunkachunkachunk<!i> against the wood. You un-roll and land on your feet running.\n\nThree more employees block your path. They're all naked, tongues out, eyes filled with demented excitement. They all have carbonated coolers under their arms.\n\nThey shake them up and crack the tabs, aiming the explosive glowjuice gushes right at you!!");

			addChoice("left", brightForestExplore.bind("floodFloatillery4"));
			addChoice("right", brightForestExplore.bind("floodFloatillery4"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery4") {
			playSound("assets/audio/environment/tranq", "tranq", {loops: 3});
			append("<!i>Piff piff piff.<!i>\n\n<!b>Som<!b>eone tranqs them before they can soak you.\n\nYou're right outside Som's cabin.\n\n\"Hurry! Inside!\"");

			addChoice("Go", brightForestExplore.bind("floodFloatillery5"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery5") {
			playMusic("cell");
			append("You topple into the door. Som hurriedly unties his cabin from the adjoining structures, nervous little fingers working those knots hard, and with an ass-rippling <!i>CLUNK<!i> the cabin falls away from the Floatillery and floats off on its own.\n\nSom sprints back across the room, feetpaws pattering, and dials <!b>777<!b> on one of the phones. It buzzes at him angrily.\n\n\"We're okay,\" he reassures you. \"We're okay. And I finished inspecting the AUTO-MYNT.\"");

			addChoice("Seems like it's a little late for that.", brightForestExplore.bind("floodFloatillery6"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery6") {
			append("Som collapses onto his bed, head in his paws. A little pack of cards falls off his pillow. \"I... I know. But I found what you were looking for. Mynt was right. It had a password cracker installed on it for sixty years. It found the password when it was guessing around fourteen characters. That was way back in Year 53.\"\n\nHe draws in a shaky breath. \"Not that it matters, now... fuck. Everything is getting coated. It's not slowing down.\"");

			if (data.savedRox) {
				addChoice("Why'd you shoot Rox, you little fuck???", brightForestExplore.bind("floodFloatilleryRox"));
			} else {
				addChoice("What's happening?", brightForestExplore.bind("floodFloatilleryRecap"));
			}
			
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatilleryRox") {
			append("\"I'm sorry. I was under orders.\"");

			addChoice("From whom?", brightForestExplore.bind("floodFloatilleryRecap4"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatilleryRecap") {
			append("\"My technology is happening,\" he mumbles.\n\nHis face is still hidden in his palms.\n\n\"AUTO-MYNTs can spawn and consume items. But AUTO-MYNTs themselves are considered items, too. I... I guess you probably noticed that, actually, now that there's tens of thousands of them in your inventory. AUTO-MYNTs can spawn AUTO-MYNTs. And those can spawn more. That's what happened, initially. Then... all of them... they all started spawning glowberries at the same time.\"");

			addChoice("How did you not foresee this exploit?", brightForestExplore.bind("floodFloatilleryRecap2"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatilleryRecap2") {
			append("He's quiet for a moment.\n\n\"I did. I just ignored it on purpose.\"");

			addChoice("... What?", brightForestExplore.bind("floodFloatilleryRecap3"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatilleryRecap3") {
			append("\"I had to. She made me.\"");

			addChoice("Who.", brightForestExplore.bind("floodFloatilleryRecap4"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatilleryRecap4") {
			disablePause();
			append("Som takes a hand off his face and points to the single corner of the room that you haven't looked at yet.\n\n\"Her.\"");

			addChoice("<!20px>              <!20px>", brightForestExplore.bind("floodFloatillery7"), {kinks: ["Cub", "Male", "Male"]});
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery7") {
			var spr:MintSprite = addSprite("assets/img/effect/sepBj/silhouette");
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> ???\n<!b>SPECIES:<!b> ???\n<!b>DIFFICULTY:<!b> ???\n<!b>PERSONAL MOTTO:<!b> \".......\"");
			append("A silhouette stands in the corner.");

			addChoice("!!!", brightForestExplore.bind("floodFloatillery7a"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery7a") {
			var spr:MintSprite = addSprite("assets/img/effect/sepBj/silhouette");
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> ???\n<!b>SPECIES:<!b> ???\n<!b>DIFFICULTY:<!b> ???\n<!b>PERSONAL MOTTO:<!b> \".......\"");
			append("She swipes the pack of cards off Som's bed.\n\n\"I still love looking at the little pictures on these. Jack, Queen, King...\"");

			addChoice("Run away?! Attack and rip off the disguise?! What do I do...", brightForestExplore.bind("floodFloatillery7b"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodFloatillery7b") {
			Blackjack.startGame(SEPTRICA, brightForestExplore.bind("sepSom1"), brightForestExplore.bind("sepSom1"), true);
			append("She starts dealing.\n\n\"I'd just like to tell you a few things, while I can still speak freely.\"\n\n\"Cooperate,\" Som tells his paws. He's shivering.");

			addChoice("... Let's play.", function() { Blackjack.startRound(); });
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "sepSom1") {
			append("\"Nice to meet you. I'm Septrica. Don't move or I shoot.\"");

			addChoice("Hi Septrica, I'm terrified.", brightForestExplore.bind("sepSom1a"));
			addChoice("GECKO BITCH!!!", brightForestExplore.bind("sepSom1adiff"));
		}

		if (which == "sepSom1a") {
			Blackjack.endGame();
			halfWidthText();
			var spr:MintSprite = addSprite("assets/img/effect/sepBj/end");
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.layer = 69;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Septrica Mauze\n<!b>SPECIES:<!b> Gecko\n<!b>DIFFICULTY:<!b> Intentionally soft\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
			append("\"Don't be a little pussy. Everything is gonna be okay. Hitting reveals unintelligible truth. Staying dispenses a comfortable lie. Understand?\"");

			addChoice("I...", brightForestExplore.bind("sepSom1b"));
		}

		if (which == "sepSom1adiff") {
			Blackjack.endGame();
			halfWidthText();
			var spr:MintSprite = addSprite("assets/img/effect/sepBj/end");
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.layer = 69;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Septrica Mauze\n<!b>SPECIES:<!b> Gecko\n<!b>DIFFICULTY:<!b> Intentionally soft\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
			append("\"Don't be fucking rude. Everything is gonna be okay. Hitting reveals unintelligible truth. Staying dispenses a comfortable lie. Understand?\"");

			addChoice("I...", brightForestExplore.bind("sepSom1b"));
		}


		if (which == "sepSom1b") {
			var spr:MintSprite = addSprite("assets/img/effect/sepBj/end");
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.layer = 69;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Septrica Mauze\n<!b>SPECIES:<!b> Gecko\n<!b>DIFFICULTY:<!b> Intentionally soft\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
			append("\"Just type Hit or Stay. Type it or I shoot.\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom2C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom2"));
		}

		if (which == "sepSom2") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"This right here is Som, my little cub boy fuckhole nerdstain. You've met him, but you've never <!i>met<!i> him. His entire existence revolves around my cock. He lives here, as my slave. Any time I want, I can call him up and shit-talk him, or send Snagg and Cage over to lavish his little body with abuse. I got full, unfettered access to his cub ass in exchange for loaning him just a couple mining teams, almost sixty years ago. Barely a blip on my financial records, now. Thanks to his servitude, thanks to his hard work... I can live out the ultimate sexual fantasy: a genocide/deicide snuff session. <3\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom3C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom3"));
		}

		if (which == "sepSom2C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\""+StoryUtils.cipherize("This right here is Som, my little cub boy fuckhole nerdstain. You've met him, but you've never <!i>met<!i> him. His entire existence revolves around the prevention of mass death. Like mine. He stays here, watching over the master AUTO-MYNT: the one that sent out instructions to the others, when it came time to start the flood. The same one that defused the alarm when you stole one of my shops.\n\nSom is our trump card. He agreed to stay here and keep his finger on the button in case Mynt ever found us out and we needed to roll the dice and flood the island faster than planned. Thanks to his servitude, thanks to Archie's hard work... thanks to both of them, we can save everyone.")+"\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom3C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom3"));
		}

		if (which == "sepSom3") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"Can you hear their gurgling screams? Have you seen their bodies, overgrown with mushrooms, sucking on anything they can find? So drippy... so hot. Infected islanders are infinitely dumber sluts than those with intact minds, aren't they? Fuck... Som, stop squirming, c'mere...\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom4C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom4"));
		}

		if (which == "sepSom3C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\""+StoryUtils.cipherize("There's been a catastrophe on the horizon ever since this island came into existence: the risk that Mynt might actually find the admin password. Your arrival gave us more hope for a cuter future and, simultaneously, a very real fear of that future being abruptly destroyed, if you ever happened to find the password in and give it to Mynt. You understand, then, why we had to be so secretive about this.")+"\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom4C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom4"));
		}

		if (which == "sepSom4") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"Here's the deal: we're holding the entire island hostage. I will use the admin password soon. When I attempt to run a command, a prompt will appear to ask you for permission. If you click Yes when the prompt appears, you can save every single infected islander. If you click No, everyone will be mindless forever.\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom5"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom5"));
		}

		if (which == "sepSom4C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\""+StoryUtils.cipherize("Here's the deal: we're holding the entire island hostage. It's not a very elegant strategy, but we really just met you. We have no way of knowing if you would've cooperated, had we just strolled up to you and said 'Hey, please give us permission to run some admin commands that will affect the structure of the entire game, kthx.'\n\nI will use the admin password soon. When I attempt to run a command, a prompt will appear to ask you for permission. If you click Yes when the prompt appears, you can save every single infected islander. If you click No, everyone will be trapped with Mint forever.")+"\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom5"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom5"));
		}

		if (which == "sepSom5") {
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.scaleX = -1;
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"There's just one more catch...\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom6"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom6"));
		}

		if (which == "sepSom6") {
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.scaleX = -1;
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"Clicking Yes will kill Mynt, and clicking No\nwon't.\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom7C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom7"));
		}

		if (which == "sepSom7") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"Mynt... these islanders... I've been itching to snuff one of the two, ever since I spawned here... all these cute furs, with their cranked libidos, so often naked and begging for irreparable abuse, trapped by their own respawn system, yearning for permadeath... and Mynt, with her cute little bobbing face, her pure vanilla innocence, floating up there, so untouchable! So unmolestable! Genocide or deicide? Fuck, I just wanna end both so badly, I have no clue which to pick. <3\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom8C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom8"));
		}

		if (which == "sepSom7C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\""+StoryUtils.cipherize("But her death is necessary. She is not stable. We'll replace her with Mint, and then dumb Mint down until he's just Protocol. Protocol is perfectly neutral, perfectly cooperative with whoever has admin. We'll be able to give every single islander control over their own bodies and surroundings. In order to secure our future, fix our island, fix ourselves, and prevent thousands of deaths... we need you to click Yes.")+"\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom8C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom8"));
		}

		if (which == "sepSom8") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\"That's why I need you to pick for me. Tell "+pickByGender("him", "her", "them")+", nerd.\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom9C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom9"));
		}

		if (which == "sepSom8C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom2.png");
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;
			append("\""+StoryUtils.cipherize("Please finish what your father started. Please. We're begging you.")+"\"");

			addChoice("<!20px>    Hit.    <!20px>", brightForestExplore.bind("sepSom9C"), {kinks: ["Plot"]});
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom9"));
		}

		if (which == "sepSom9") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom3.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;

			append("\"Please... please pick No. None of us want this,\nbut we're already... so far gone... please.\n\nCooperate. Save Mynt.\n\nAt least save Mynt.\"");

			addChoice("<!20px>    Hit Septrica.    <!20px>", brightForestExplore.bind("sepSom10"));
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom10stay"));
			addChoice("          Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "sepSom9C") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sepSom3.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.layer = 69;

			var ruff:MintSprite = addSprite("assets/img/effect/sepSom3Rough.png");
				ruff.x = GAME_WIDTH - ruff.width - 5;
				ruff.y = GAME_HEIGHT/2 - ruff.height/2;
				ruff.layer = 70;
				ruff.alpha = 0;

			var blood:MintSprite = addSprite("assets/img/kink/Blood.png");
				blood.scaleX = blood.scaleY = 2;
				blood.x = 670;
				blood.y = 280;
				blood.layer = 68;

			tween(blood, {x: blood.x - 200}, 2, {type: REVERSE, ease: ELASTIC_IN});

			blood.onHoverOnce = function() {
				playSound("assets/audio/ui/hover6");
				StoryUtils.yesNudge([blood]);
			}

			blood.onHover = Tooltip.showOnCursor.bind("(Every time you clicked Hit, Septrica hit him~)");

			blood.onReleaseOnce = function() {
				ruff.cancelTweens();
				playSound("assets/audio/ui/tak");
				if (ruff.alpha <= 0.5) {
					blood.setupAnimated("assets/img/kink/Love.png");
					tween(ruff, {alpha: 1}, 0.5);
				} else {
					blood.setupAnimated("assets/img/kink/Blood.png");
					tween(ruff, {alpha: 0}, 0.5);
				}
			}

			append("\""+StoryUtils.cipherize("Please... please pick Yes. None of us want Mynt or Mint to suffer, but they're both broken... inherently broken... please. Save us. Not just from the flood we brought on ourselves, but from God herself.")+"\"");

			addChoice("<!20px>    Hit Septrica.    <!20px>", brightForestExplore.bind("sepSom10"));
			addChoice("<!20px>    Stay.    <!20px>", brightForestExplore.bind("sepSom10stay"));
		}

		if (which == "sepSom10stay") {
			append("\"If you're ready for the prompt, type Next. "+StoryUtils.cipherize("If you want to speak freely with us, type 'Septrica has a fat cock.'")+"\"\n\nWHATEVER YOU DO DON'T CLICK YES!!!!!!!!!!!!!!");

			addTextChoice(function(str) {
				if (str.toUpperCase() == "SEPTRICA HAS A FAT COCK" || str.toUpperCase() == "SEPTRICA HAS A FAT COCK." || str.toUpperCase() == "'SEPTRICA HAS A FAT COCK.'" || str.toUpperCase() == "'SEPTRICA HAS A FAT COCK'")
					brightForestExplore("sepSom11")
				else
					playSound("assets/audio/ui/nope");
			});
			addChoice("Next.", StoryUtils.badEnd.bind(BrightForest.brightForestExplore.bind("sepSom9")));
		}



		if (which == "sepSom11") {
			if (getItem("Som's Seed").amount <= 0) addToItem("Som's Seed", 1);
			playSound("assets/audio/environment/tranq");
			append("<!i>Piff.<!i>");

			addChoice("...", MyntScenes.amcn.bind("intro"));
		}

		if (which == "sepSom10") {
			append("You clock her across her garish gecko face.\n\nShe topples over. Blood spurts from her nose.\n\n\"Ahahah... ahahahah...\"\n\nShe reaches for her gun.\n\n\"Joke's on you. I'm into this shit.\"");
			addChoice("duck", brightForestExplore.bind("sepSom10duck"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "sepSom10duck") {
			disablePause();
			append("You duck just as she's about to fire— but her finger never curls down on the trigger, because in that moment the whole cabin turns sideways.\n\nThe view out Som's window starts to sink down. The forest, the meteorite, and the dark night sky slide by outside.\n\nYou catch a glimpse of the massive waves that the flood has created. They pushed you off. Som grabs Septrica's cock and holds on tight, screaming. Septrica tries to grab the windowsill, but her sweaty gecko fingers can't get a grip.\n\nAll three of you topple into the void. Som's cabin explodes into splinters on impact.\n\nSom touches the void with his feet.\n\nSeptrica lands on her face.\n\nYou land on your ass.");

			addChoice("Oh no", brightForestExplore.bind("sepSom10BadEnd"));
		}

		if (which == "sepSom10BadEnd") {
			StoryUtils.badEnd(BrightForest.brightForestExplore.bind("floodFloatillery7a"));
		}

		if (which == "floodFloatilleryBadEnd") {
			disablePause();
			append("The lid comes off with a corky ~pop~.\n\nThe employee cums and whoops, dick throbbing. You're coated entirely with glowjuice. It seeps into your eyes, up your nose, even through to your armpits.\n\nYou topple off the rickety Floatillery bridge and crash into the cyan ocean.");

			addChoice("...", StoryUtils.badEnd.bind(BrightForest.brightForestExplore.bind("floodFloatillery")));
		}

		if (which == "floodRox") {
			var mossman:MintSprite = addSprite("assets/img/effect/mossMan.png");
			append("Bert's panicked yelps urge you to Roxelle's farm.\n\nYou sprint through her glowcorn fields, stalks whipping against your face. He shrieks at the top of his doggy lungs. His yelping bark becomes a clogged whisper.\n\nWhen you finally burst through the cornfield onto Roxelle's porch, you see him:\n\nCowering, white fur stained blue, half his body stuck down Archie's throat. His upper torso and paws flail around pointlessly.");
			addChoice("SAVE HIM", brightForestExplore.bind("floodRox2"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox2") {
			var s:MintSprite = addSprite("assets/img/effect/roxAim1");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				playSound("assets/audio/environment/tranq", "tranq", {loops: 5});
				halfWidthText();
			append("<!i>Piff<!i> noises fly from the backyard. Rox is moving backwards, shooting down every AUTO-MYNT that floats by and attempts to spawn berries on HER property.\n\nYou lunge for Bert and wrap your hands around his paws. You tense every muscle in your body and try to yank him out of Archie's gullet.");
			addChoice("HEEAAAAVE HO", brightForestExplore.bind("floodRox3"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox3") {
			var s:MintSprite = addSprite("assets/img/effect/roxAim2");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				halfWidthText();
			append("\"WHO'S THERE? DON'T FUCKING TOUCH MY DOG!\"\n\nRoxelle spins around and aims at you.");
			addChoice("SHOOT ARCHIE NOT ME", brightForestExplore.bind("floodRox4"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox4") {
			var s:MintSprite = addSprite("assets/img/effect/roxAim1");
				s.x = GAME_WIDTH - s.width - 5;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				playSound("assets/audio/environment/tranq", "tranq");
				halfWidthText();
			append("Rox parses the situation in a split second and switches her aim to Archie.\n\nA single tranq dart appears directly in the center of his mossy throat.\n\nHe falls over, and Bert slides lifelessly out of his mouth.");
			addChoice("No...", brightForestExplore.bind("floodRox5"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox5") {
			playMusic("cell");
			append("Archie's infected player model lies flat against the ground. Blue blood squirts out around the spot where the dart pierced his neck.\n\nRox bends down. She has to yank the tranquilizer dart out before she can unplug Bert. He's been totally coated and infected with Archie's blue spitslime, but he also has a tiny pinprick in the middle of his belly.\n\nHe's tranquilized.\n\nMore AUTO-MYNTs float by, playing their happy song, spawning more friends and more glowberries. The flood water beats against your ankles and flattens whole rows of cornstalks.\n\n\"Inside,\" Rox grunts, picking up her limp dog by the scruff. \"Now.\"");
			addChoice("Go inside.", brightForestExplore.bind("floodRox6"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox6") {
			append("Rox throws Bert on the couch and hurries to her oven. Inside, two glowberry pies have almost finished baking. She wildly wraps them up in tin foil, knocking shit over, then she grabs Bert's scruff between two fingers and fills every remaining inch of space between her elbows with canned non-perishables and bottles of water.\n\n\"Downstairs,\" she grunts again, watching the window. \"I shot Archie's jugular. He's gonna overdose and respawn soon. The flood won't stop. Hurry— I have a bomb shelter.\"");
			addChoice("Oh...", brightForestExplore.bind("floodRox7"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox7") {
			append("She sprints down the stairs two at a time. The stack of rations cradled in her arms tilts wildly as she just barely maintains her balance. You get a gorgeous view of her asscheeks wobbling back and forth as she speed-waddles down the stairs, but neither of you stop to admire them.");
			addChoice("Follow!", brightForestExplore.bind("floodRox8"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox8") {
			append("Rox runs to the very back of her basement.\n\nThere, she fiddles with the keyboard lock to a vault door.\n\n\"Always knew I'd have to use this place,\" she says, punching in the password (BERT) and biting her lip. \"When their shitty plans were finally executed.\"");
			addChoice("Their?", brightForestExplore.bind("floodRox8a"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox8a") {
			append("\"Septrica. I'll bet a quart of titmilk this is her fault.\"\n\nShe throws the heavy steel vault door open and tosses Bert and all her food inside. \"I'm going up to get more rations,\" she says. \"Stay here. He might O.D. He only got a bit of it, but these doses weren't meant for dogs. Restrain him if he wakes up.\"");
			addChoice("O-Okay...", brightForestExplore.bind("floodRox9"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox9") {
			append("\"And "+data.playerName+"?\"");
			addChoice("Yeah?", brightForestExplore.bind("floodRox10"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox10") {
			append("\"Lock yourself inside. Don't open that vault door for anything other than my voice.\"");
			addChoice("Should I...", brightForestExplore.bind("floodRox11"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox11") {
			append("\"Archie will respawn soon. The respawn system might put him downstairs with you. Keep your eyes open. This is the second war.\"\n\nRox hurries back upstairs, tranquilizer pistol in hand.");
			addChoice("... Shut the door.", brightForestExplore.bind("floodRox12"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox12") {
			append("You stay quiet and look after Bert.\n\nHe's breathing heavily. There's something painful about sitting here with him, even though you aren't in any pain. He's just so dumb and innocent... he can't talk to you or tell you how he's feeling. You can't do anything to help him or communicate to him that everything is going to be okay. A feeling of dumb dread settles into your belly.\n\nAll you can do is watch him suffer while the infection takes its course. He breathes raggedly past the mushrooms sprouting in his throat. You can hear their glowjuice gushing down into his weak little puppy lungs.\n\nYou just sit next to him and scratch him behind the ears in the hope that it reduces his suffering a little.\n\nHe doesn't respond.");
			addChoice("Just hold on, Bert, buddy... we'll save you...", brightForestExplore.bind("floodRox13"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox13") {
			append("Rox is talking to someone upstairs.\n\nShe sounds pissed.");
			addChoice("Who could that be...", brightForestExplore.bind("floodRox14"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox14") {
			append("The talking becomes shouting.");
			addChoice("... Stay with Bert.", brightForestExplore.bind("floodRox15"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox15") {
			append("Still you sit complacently with Bert, hand on his head. You rub behind his ears again and shift your weight. He's wheezing now. The mushrooms have filled his throat and they're sprouting from his maw and snout.\n\nThere's no pretending anymore.\n\nHe's a lost cause.\n\nRoxelle starts screaming obscenities upstairs.");
			addChoice("Go upstairs and check that everything's okay.", brightForestExplore.bind("floodRox16"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox16") {
			append("You hurry upstairs.\n\nBert's wheezing grows quieter and quieter until it recedes into silence behind you.");
			addChoice("Prepare for battle.", brightForestExplore.bind("floodRox17"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox17") {
			stopChannel("music");
			data.currentSong = "";
			append("You peek your head up over the bannister.\n\nSnagg's here. He's got five Apothecary employees with him, all armed with tranquilizer pistols and smiling beneath the shadow of their ballcaps.");
			addChoice("Watch.", brightForestExplore.bind("floodRox18"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox18") {
			append("Snagg continues: \"—you haven't paid your mortgage. This property is now the propety of the Snagglebank.\"\n\nWhile he's talking, Rox side-eyes him and continues herself: \"—and the flood about to destroy my house, is that your property too?\"\n\n\"Don't change the subject. I'm gonna foreclose this piece of shit. Get out. Now.\"\n\nRoxelle steels herself. \"I pay my bills. I'm an upstanding citizen. You have no right to evict me during a natural disaster.\"\n\n\"Upstanding citizens pay <!i>all of<!i> their bills, they don't just pay the ones we pay close attention to and then blow the rest of their money on booze. Plus you never did your community service: 50 hours hard labor gathering glowberries. You owe me.\"\n\n\"Gee, sorry, I'm too drunk to go gathering most of the time. Pity. I wonder what you wanted all those glowberries for.\"\n\nA fresh wave of glowjuice thunders by outside. It shakes the whole house and comes up to the windowsills. Roxelle's windows look splattered with blue blood.");
			addChoice("Get downstairs everyone!! We can sort out finances after the flood!!!", brightForestExplore.bind("floodRox19"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox19") {
			append("Snagg and Roxelle notice you. Rox narrows her eyes. \"Go back downstairs and shut the door.\"\n\nSnagg smiles. \"The door...\"\n\nHe motions to his goons. \"She's got a shelter. Take them.\"");
			addChoice("Fuck fuck fuck", brightForestExplore.bind("floodRox20"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox20") {
			stopChannel("music");
			playSound("assets/audio/music/gunpoint", "music", {loops: 99999});
			data.currentSong = "";
			playSound("assets/audio/environment/tranq", "tranq", {loops: 3});
			timer(1, playSound.bind("assets/audio/environment/tranq", "tranq", {loops: 5}));
			timer(2, playSound.bind("assets/audio/environment/tranq", "tranq", {loops: 2}));
			timer(5, playSound.bind("assets/audio/environment/tranq", "tranq", {loops: 1}));
			append("Snagg hits the floor, hands over his head. All five employees start shooting at you and Rox. You half-run, half-fall down the stairs and swing yourself around the corner. Rox is right behind you, so close her tits rub against your back.\n\nYou barrel into the vault room and knock over half the rations. Rox swings the door shut with an ass-rippling <!i>WHAM.<!i>\n\nShe puts her back to the wall and slides down, exhaling deeply.");
			addChoice("Fwah... fwah... we're okay, we made it!", brightForestExplore.bind("floodRox21"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox21") {
			append("\"Where's Bert?\"");
			addChoice("Huh?", brightForestExplore.bind("floodRox22"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox22") {
			append("Both of you look around the shelter.\n\nYou lift cans of food and blankets, weaponry and old war documents... you even check behind the gatling gun's chunky metal legs... but he's not here.\n\nThe employees are in the basement, just outside the vault door. They murmur to each other about a passcode. Snagg's grumbly, greasy voice booms out and silences the others:\n\n\"You! Get down here. We gotta get both of em out of there. Infect Rox and tranq "+data.playerName+". Septrica's orders. Have your pistols ready. What's that hint say? 'Name of my own personal puppycunt?' Ahahaha. Let's open it. Bert. The password is Bert.\"");
			addChoice("...", brightForestExplore.bind("floodRox23"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox23") {
			append("Roxelle whispers to you: \"I'm gonna get ready for them.\" She hurries to the back of the room and loads a long, dusty belt of low-dose tranquilizer darts into her gatling gun. Then she rips her apron off, every muscle in her naked body tensed, cock hardening with the excitement...\n\n\"Just type it in,\" Snagg barks. \"It's four letters. Not hard.\"\n\n\"I'm trying, sir, I'm trying...\"\n\n\"What's your fuckin WPM, kid?\"\n\n\"Twenty, sir...\"\n\n\"Holy shit you're garbage.\"\n\n\"I know, sir, I'm sorry, sir—\"\n\nThere's a commotion at the basement's opposite end.\n\n\"Snagg?\" one of the employees asks, voice cracking. \"There's a dog over here.\"\n\n\"A dog—?\"\n\nThe 20 WPM employee speaks up: \"I finished inputting the password, sir! Opening the door now!\"\n\n\"Hold on, she might have—\"");
			addChoice("Next!!!", brightForestExplore.bind("floodRox24"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox24") {
			append("The door swings open.\n\nSnagg ducks for cover.\n\nThree employees stand and stare at Rox with abject shock.\n\nShe straddles the gatling gun's barrel, grabs two pistols, and opens fire.");
			addChoice("UH", brightForestExplore.bind("floodRox24a"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox24a") {
			var s:MintSprite = addSprite("assets/img/effect/roxShoot");
				s.x = GAME_WIDTH - s.width;
				s.y = GAME_HEIGHT/2 - s.height/2 + 10;
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
			playSound("assets/audio/environment/roxshoot", "roxshoot", {loops: 9999});
			append("<!20px>\"RRRRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAGGGGGGGGGHHHHHHHHHHH!!!!!!\"<!20px>");
			addChoice("HOLY FUCK ROX CALM DOWN", brightForestExplore.bind("floodRox25"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox25") {
			var s:MintSprite = addSprite("assets/img/effect/roxShoot");
				s.x = GAME_WIDTH - s.width;
				s.y = GAME_HEIGHT/2 - s.height/2 + 10;
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				halfWidthText();
			stopChannel("roxshoot");
			playSound("assets/audio/environment/roxshoot", "roxshoot", {loops: 9999});
			append("Bert's cyan eyes flash.\n\nHe leaps out of the darkness and takes down\none of the remaining employees.\n\nArchie respawns through the front porch and lands downstairs. His lanky, moss-slick limbs close up around the last employee's torso like the legs of a dying spider. Archie slobbers and sucks on the guy's screaming face.\n\nRox keeps shooting.\n\n\"YYYYYYYYYYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHH!!!!!!\"");
			addChoice("AAAAAAAAAA", brightForestExplore.bind("floodRox25a"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox25a") {
			var s:MintSprite = addSprite("assets/img/effect/roxShoot");
				s.x = GAME_WIDTH - s.width;
				s.y = GAME_HEIGHT/2 - s.height/2 + 10;
				s.scaleX = -1;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				halfWidthText();
			stopChannel("roxshoot");
			playMusic("cell");
			playSound("assets/audio/environment/roxshoot", "roxshoot", {loops: 9999});
			append("All the employees are tranquilized.\n\nBert is tranquilized.\n\nArchie is tranquilized.\n\nRox keeps shooting.\n\n\"HHHHHHHHHHHHHHHHHHHHHHHNNNNNNNNNNNNNNNNNNNNNNNNYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA~!!!!!!!!!!!!!!!!!!!!!!!!!!!\"");
			addChoice("AAAAAAAAAA STOP STOP WE'RE GOOD WE DID IT STOPPPP", brightForestExplore.bind("floodRox26"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox26") {
			data.savedRox = true;
			stopChannel("roxshoot");
			timer(2, playSound.bind("assets/audio/environment/tranq", "tranq"));
			append("Finally, Rox allows the gun to slow down. The barrel goes <!i>clickclickclick... click... click... click...... click...... click......<!i>\n\nThen, from the other end of the basement:\n\n<!i>Piff.<!i>\n\nYou look over at Rox.\n\nA tranquilizer dart is sticking out of her left tit.\n\nShe slides off the barrel, panting, eyes pointing in different directions.\n\nShe lands ass-first on the ground with a tuckered <!i>whump.<!i>\n\n\"Close,\" she gasps, \"the door.\"\n\n\"I've,\" she exhales, \"been shot.\"");
			addChoice("Who...", brightForestExplore.bind("floodRox27"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox27") {
			append("You look over, expecting to see Snagg.\n\nBut Snagg already fucked off.\n\nYou catch a glimpse of his cowardly green ass disappearing up the stairs.");
			addChoice("But who shot...", brightForestExplore.bind("floodRox28"), {kinks: ["Cub", "Male"]});
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox28") {
			var s:MintSprite = addSprite("assets/img/effect/somShoot");
				s.x = GAME_WIDTH - s.width;
				s.y = GAME_HEIGHT;
				s.scaleX = s.scaleY = 0.9;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "Color: Kittery");
				halfWidthText();
			tween(s, {y: GAME_HEIGHT - 150}, 2, {startDelay: 1, ease: QUAD_OUT});
			timer(4, tween.bind(s, {scaleX: -0.9}, 0.2, {ease: ELASTIC_OUT}));
			timer(5, tween.bind(s, {scaleX: 0.9}, 0.1, {ease: ELASTIC_OUT}));
			timer(7, tween.bind(s, {y: GAME_HEIGHT/2 - s.height/2 + 10}, 4, {startDelay: 1, ease: QUAD_OUT}));
			append("A crying, shaking little lamb boi peeks out from behind the couch.\n\n\"I'm sorry,\" he whimpers. \"It needed to happen.\"");
			addChoice("Why??? Why??????", brightForestExplore.bind("floodRox29"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox29") {
			var s:MintSprite = addSprite("assets/img/effect/somShoot");
				s.x = GAME_WIDTH - s.width;
				s.y = GAME_HEIGHT/2 - s.height/2 + 10;
				s.scaleX = s.scaleY = 0.9;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "Color: Kittery");
				halfWidthText();
			append("\"So she could see a... a cuter future.\"\n\nHe runs upstairs with Snagg, tranq pistol clutched to his chest.");
			addChoice("...", brightForestExplore.bind("floodRox30"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox30") {
			if (getItem("Roxelle's Seed").amount <= 0) addToItem("Roxelle's Seed", 1);
			append("You take one last look at everything.\n\nThe barrel of the tranquilizer gatling gun still drools smoke up to the ceiling.\n\nRoxelle's war artifacts have been knocked over or stained with glowjuice.\n\nHalf the rations spill from their containers. One of the pies was trampled in the chaos.\n\nOutside, five snoring Snagglebank employees litter the basement. Their limbs are all contorted and folded the wrong way, like ragdolls.\n\nBert and Archie's cyan mushrooms pulse with the pace of their slow heartbeats.");
			addChoice("...", brightForestExplore.bind("floodRox31"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRox31") {
			append("Bert's snores get slower and slower.\n\nNow that he's been peppered with three gatling darts, he's definitely going to die.");
			addChoice("... Step over the bodies and leave.", brightForestExplore.bind("floodRox32"));
		}

		if (which == "floodRox32") {
			append("You stroll out of the carnage like an action hero.\n\nStrawberry is hiding in a tree outside, swaying back and forth every time a wave crashes against the lower trunk and makes the whole tree wobble.\n\n"+gryphJunk("He swoops", "She swoops", "They swoop")+" down and whisk"+gryphJunk("s you onto his back", "s you onto her back", " you onto their back")+".\n\n<!i>Let's go. Did you save who you wanted to save?<!i>");
			addChoice("No.", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRed") {
			append("Strawberry drops you off at Red's cabin. The backyard is completely flooded with glowjuice. Her phallic plants disappear under the waves. Her watering can bobs over on the frothing current and bashes against your hip.\n\nYou don't let it slow you down. You push inside. Music warbles up from the flooded cellar.");
			if (Main.debug) addChoice("Toggle alt scene", function() { data.redChoseCity = true; }, {oneTime: true});
			addChoice("Barge in!!", brightForestExplore.bind("floodRed2"));
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRed2") {
			setChannelVolume("music", 0.3);
			playSound("assets/audio/music/deathless", "deathless");
			append("The door that leads downstairs leaks gushes of blue around the cracks. It pools and gurgles on the hardwood. Music warbles up from the flooded cellar.\n\n");
			if (data.redChoseCity) {
				append("... Something approaches from the end of the hall. It's dark, shambling, covered in mushrooms...");
				addChoice("<!20px>  ?!  <!20px>", brightForestExplore.bind("floodRed3"));
			} else {
				//bunny grief
				append("Red stands at the living room window, blocking the strained glass with her little body. Gangly skeletal cracks race down the glass. The flood smashes against it.\n\nRed's bunny stands just behind the window, naked, smiling, staring at nothing.\n\nRed turns to look at you over her shoulder, panicked. \"IT WON'T HOLD! TAKE HER AND RUN!\"");
				addChoice("I—", brightForestExplore.bind("floodRed3"));
			}
		}

		if (which == "floodRed3") {
			if (data.redChoseCity) {
				var s:MintSprite = addSprite("assets/img/effect/deadBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.y = GAME_HEIGHT-s.height;

				append("It's Mary.\n\nShe lunges for you.");
				addChoice("Run!", brightForestExplore.bind("floodRed4"));
			} else {
				append("A fresh wave hits the window. It shatters. A wave of blue glowjuice swallows Red entirely.\n\nYou grab the bunny and try to run, but the flood knocks you over by your ankles while you try to keep your balance and support her at the same time. She's dead weight. You can't keep dragging her around. You have no choice.\n\nYou let her go and topple out the cabin door.\n\nSomething growls deeply behind you.");
				addChoice("Oh no", brightForestExplore.bind("floodRed4"));
			}
		}

		if (which == "floodRed4") {
			setChannelVolume("music", 1);
			stopChannel("deathless");
			if (data.redChoseCity) {
				append("You dodge her open maw. The bunny smashes her face against the kitchen counter, temporarily dazed. A couple mushrooms fall off and pitter onto the floor.\n\nYou take this moment by its balls and run right back out the door you just came through, calling for Red.\n\n\n\nRed sprints up to the cabin just as you're leaving. She answers you with a breathless wheeze. She's covered with blood and a few bruises from her frolicking in the city. She's dragging her red cloak through the dirt in a fist. She's totally naked.");
				addChoice("Red, Mary's infected, run!!!", brightForestExplore.bind("floodRed5"));
			} else {
				if (getItem("Red's Seed").amount <= 0) addToItem("Red's Seed", 1);
				halfWidthText();
				var s:MintSprite = addSprite("assets/img/effect/infectedRed.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				s.x = GAME_WIDTH-s.width+5;
				s.y = GAME_HEIGHT-s.height;
				s.scaleX = -1;
				append("Red's right on your ass, snarling and trying to\neat you with every carnivorous instinct in her body.");
				addChoice("RUUuuun fuck", brightForestExplore.bind("floodRed5"));
			}
			addChoice("Move along!", brightForestExplore.bind("floodHub"));
		}

		if (which == "floodRed5") {
			if (data.redChoseCity) {
				if (getItem("Red's Seed").amount <= 0) addToItem("Red's Seed", 1);
				//red grief
				halfWidthText();
				stopChannel("music");
				data.currentSong = "";
				playSound("assets/audio/environment/despairSting");
				var s:MintSprite = addSprite("assets/img/effect/redGrief.png");
					s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
					s.x = GAME_WIDTH-s.width-5;
					s.y = GAME_HEIGHT-s.height-5;
				append("Red sees her.\n\n\"No... no...\"\n\nTears well up and spill over her cheeks. Her head sinks forward until her eyes point dejectedly at the ground. The bunny lunges for her throat.\n\n\"This is... this is my fault, Mary... I wasn't here for you...\"\n\nMary pins her by her windpipe. Red doesn't even try to fight back. She just lets the waves of red and blue wash over her face.\n\n\"Please forgive me.\"");
				addChoice("Climb on Strawberry and fly outta here!!!!", brightForestExplore.bind("floodHub"));
			} else {
				append("You hop on Strawberry's back, narrowly avoiding a bite to the thigh. Red tears at Strawberry's flank as "+gryphJunk("he takes", "she takes", "they take")+" off. Strawberry screams and involuntarily floods your mind with images of searing irons, crucifixes, deep gouges, and gushing wounds.\n\n<!i>OW!<!i>");
				addChoice("Use Fly!!", brightForestExplore.bind("floodHub"));
			}
			
		}

		if (which == "JohnLanaJC") {
			append("Something darts across the path and freaks you out. It's a little frog, covering his butt and eyeing you bulbously.");

			addChoice("... Fuck the frog???", brightForestExplore.bind("JohnLana"));
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (which == "JohnLanaVM") {
			append("Something darts across the path and freaks you out. It's a little frog, covering his butt and eyeing you bulbously.");

			addChoice("... Fuck the frog???", brightForestExplore.bind("JohnLana"));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (which == "ExploreCampsite") {
			if (!data.bfcampClean) {
				append("You stumble upon an abandoned campsite. Three tents. Beer bottles, mustard-stained napkins. A cooler hanging agape in the mud.");
				addChoice("Clean it up.", brightForestExplore.bind("clean campsite"), {cost: ["Garbage Bag", 1], give: ["Bag o Trash", 1]});
			} else {
				append("You're back at the campsite you cleaned up. The mess-makers have taken down their tents. There's a note ");

				if (!data.kempOpenedPresent) {
					append("and a little present ");
					var s:MintSprite = addSprite("assets/img/effect/presentRedDec.png");
					s.x = 480;
					s.y = 400;
				}
				append("on a nearby sitting log.");

				if (!data.kempReadNote) addChoice("Read the note.", brightForestExplore.bind("read the note"))
				else addChoice("Read the note again.", brightForestExplore.bind("read the note"));

				if (!data.kempOpenedPresent) addChoice("Open the present.", brightForestExplore.bind("open present"), {give: ["Sweetgrass Leaf", 5]});
			}

			addChoice("Avoid this.", function () {
				disableExplorable(30);
				brightForestHub();
			});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "clean campsite") {
			clear();
			data.bfcampClean = true;

			append("You close the cooler, drag it from the mud, wipe it off, gather all the napkins and beer bottles, and with a final flourish zip up the half-open entrance to one of the empty tents.\n\nOn the fringes you find nine tied, used condoms the size of water balloons, some filled with piss.");

			addChoice("Pocket one.", brightForestExplore.bind("pocket one"));
			addChoice("Scoop a bunch up and pop em in a big hug.", brightForestExplore.bind("big hug"));
			addChoice("I need all of these.", brightForestExplore.bind("i need all"), {give: ["Cum Balloon", 4, "Piss Balloon", 5]});
			if (data.myntNarrative > 0) addChoice("I'll go with your favorite, Mynt.", brightForestExplore.bind("your fav"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "pocket one") {
			append("You ponder which kind.");

			addChoice("... Piss.", brightForestExplore.bind("campsitepiss"), {give: ["Piss Balloon", 1]});
			addChoice("... Cum.", brightForestExplore.bind("campsitecum"), {give: ["Cum Balloon", 2]});
			addChoice("Whichever.", brightForestExplore.bind("pocket whichever"));
		}

		if (which == "campsitepiss") {
			append("You snag a piss-bloated condom and it squishes in your grip, still warm.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "campsitecum") {
			append("<!14px>You snag one a them milk-dribblin balloons.\n\n<!14px><!10px>... one more for the road...<!10px>");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "pocket whichever") {
			if (data.roxChosePuke) {
				addToItem("Piss Balloon", 1);
				brightForestExplore("campsitepiss");
			} else {
				addToItem("Cum Balloon", 2);
				brightForestExplore("campsitecum");
			}
		}

		if (which == "big hug") {
			append("You grab five at random and cradle them close to your "+(data.hasBoobs?"tits":"chest")+", squeezing tighter and tighter until with a mighty sploosh you're coated in a lukewarm deluge of cum and piss.");

			addChoice("Shake myself clean.", brightForestExplore.bind("shake clean"));
			addChoice("Lick myself clean.", brightForestExplore.bind("lick clean"));
		}

		if (which == "shake clean") {
			append("You shake like a dog and a spray of yellow-white spatters the trunks of the surrounding trees. Just before you leave you notice some got on the tents as well... so much for cleaning up.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "lick clean") {
			append("You stuff your fingers in your mouth first, most of them webbed with thick strings of "+(isActive("Mood Ring")?getMood():"")+"cum, and suck each one with individual care. The first whets your appetite; the next compels you to drag your tongue down your forearms, piss dripping off the tip of your tongue whenever you pull back for breath, saliva running over your chin.\n\n"+(data.hasBoobs?"Lastly, you pop each of your tits out of your shirt and slobber all over them both at the wild crescendo of this masturbatory self-slurp session— the":"The")+" fact that all this thick, warm fluid came from complete strangers makes each tiny mouthful all the sweeter.\n\nEventually you calm down enough to stop gulping piss and jizz, but it does take a good while.\n\nThere's four condoms left.");

			addChoice("Take em.", brightForestExplore.bind("condompicklick"), {give: ["Cum Balloon", 2, "Piss Balloon", 2]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "condompicklick") {
			append("You scoop up the remaining condoms, showing a lot of self-restraint... you lick your lips, tasting the different flavors of the campers' cum.\n\nYou beat the urge to pop them all again and end up with x2 Cum Balloons and x2 Piss Balloons.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "i need all") {
			append("You... go ahead and root through the grass with a determined eagle-eye, fishing out every single one, even those half-buried, deflated, and slippery with leakage.\n\nYou end up with x4 Cum Balloons and x5 Piss Balloons. You are proud of yourself.");

			addChoice("Hahah. Yes I am.", brightForestHub);
			addChoice("... no... no, I'm not...", brightForestHub);
		}

		if (which == "your fav") {
			append("Ah... um. Well, if you're going to be so direct...");
			addChoice("Go on.", brightForestExplore.bind("condompicknext"));
		}

		if (which == "condompicknext") {
			getItem("Cum Balloon").amount++;
			msg("Slipped a Cum Balloon into your inventory, nice and slow.");
			append("...\n\nThere. >w>\n\nHappy?");
			addChoice("Very.", brightForestHub);
			addChoice("Aw.", brightForestExplore.bind("condompicknext2"));
		}

		if (which == "condompicknext2") {
			getItem("Cum Balloon").amount--;
			getItem("Piss Balloon").amount++;
			msg("Took the best kinda balloon away and gave you the gross kind instead.");
			append("Hey, you asked for it. ._.\n\nBut, here, put that down. Now take this one. There you go.");
			addChoice("Thanks.", brightForestHub);
		}

		if (which == "read the note") {
			data.kempReadNote = true;
			append("<!i>Hey mysterious janitor bro. Thanks for cleanin our shit up. Come party with us next time we're gonna blaze ya up big style. The boys have always wanted to get down and dirty with a janitor. Bet ya know how to plunge a fuckin toilet if ya know what im sayin.\n\nHere's some devil's lettuce for ya. Hit er hard.\n\n       - Kemp<!i>");

			if (!data.kempOpenedPresent) addChoice("Open the present.", brightForestExplore.bind("open present"), {give: ["Sweetgrass Leaf", 5]});
			addChoice("Move along.", brightForestHub);

			if (data.kempReadNote && data.kempOpenedPresent) disableExplorable(30);
		}

		if (which == "open present") {
			data.kempOpenedPresent = true;
			append("You pop open the little lid and undo a bunch of lacy ribbony layers to reveal a neatly packaged ziplock bag of Sweetgrass Leaves. How thoughtful.");

			if (!data.kempReadNote) addChoice("Read the note.", brightForestExplore.bind("read the note"))
			else addChoice("Read the note again.", brightForestExplore.bind("read the note"));

			addChoice("Move along.", brightForestHub);

			if (data.kempReadNote && data.kempOpenedPresent) disableExplorable(30);
		}

		if (which == "ExploreNymph") {
			append("There's a battered nymph passed out face-down spread-eagle in the middle of the path. As you near you see her ass is gaped wide enough to fit a baseball and stuffed to overflowing with glowberries, some of the glittery cyan juice running in thin rivulets over her taint.");

			addAction("Gather Glowberries", "Scour the forest for glowberries.", "Bright Forest");
			addChoice("Take some.", brightForestExplore.bind("take some nymph"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "take some nymph") {
			data.nymphAssFisted = true;

			append("You reach into her butt and try to scoop some out, but every time they turn to mush before you can get a good handful. You kind of accidentally end up fisting her for a bit. Oops.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreLunarGlade") {
			unlockJournal("Lunar glade");
			append("You wander into a practically lunar glade. Blue bioluminescent fungi puff out from the grasses. Even the air is glowing.\n\nLittle shiver-wing dragonflies flit opportunistic to the greatest light source and suck up the photons like nectar. This is a place where glowberries are born without skin and drip as gaseous mush from their buds.\n\nThere are some slippery sounds to your right.");

			addAction("Gather Glowberries", "Scour the forest for glowberries.", "Bright Forest");

			addChoice("Examine slippery sounds.", brightForestExplore.bind("examine slippery"), {kinks: ["Female", "Female"]});
			addChoice("Consider the constellatory flicker of the forest.", brightForestExplore.bind("consider flicker"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "consider flicker") {
			append("You look at a bunch of lights.");

			addChoice("Examine slippery sounds.", brightForestExplore.bind("examine slippery"), {kinks: ["Female", "Female"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "examine slippery") {
			append("You spot what look like two feral nymphs grinding up on each other, each incapable of speech. They're making simplistic, repetitious melodies to try and communicate their needs.\n\nEven though you don't get what they're saying, it's obvious both of them really really need those needs.");

			addChoice("Watch.", brightForestExplore.bind("watch slippery"), {kinks: ["Piss"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "watch slippery") {
			append("Something sparkly and yellow begins to curve in long, droopy arcs down their thighs.\n\nThey're both girls, you think. Nymph boys are rare, you also think. They're doing a rough mambo, soaked stomachs slipping together. One drops to their knees, the communication over, and slurps the steaming pee from between the other's confidently spread legs. The other looks very proud of herself, pushing her personal toilet's head down with both hands.\n\nOne spots you and they both flutter away in a blink.");

			addChoice("Move along.", brightForestHub);
		}

		function rain (rainIntensity:String="hard"):Void {
			var rainSprite:MintSprite;
			var rainAmount:Int = 200;
			var rainRotation:Int = -20;
			var rainSpeed:Float = 1;
			var rainSkew:Int = 100;

			if (rainIntensity == "soft") {
				rainAmount = 200;
				rainRotation = 0;
				rainSpeed = 1.5;
				rainSkew = 15;
			} else if (rainIntensity == "minimum") {
				rainAmount = 100;
				rainRotation = 0;
				rainSpeed = 2;
				rainSkew = 0;
			}

			for (i in 0...rainAmount) {
				var rand:Float = Math.random();
				var s:MintSprite = addSprite("assets/img/effect/raindrop.png", false); 
				s.layer = 1;
				s.alpha = 0.2+Math.random()*0.1;
				s.x = rand*(GAME_WIDTH-s.width);
				s.y = -20;
				s.rotation = rainRotation;

				tween(s, {y: 600, alpha: 0.1, x: rand*(GAME_WIDTH-s.width)+rainSkew}, rainSpeed, {type: LOOP, startDelay: Math.random()*2, onComplete: function () {
					rand = Math.random();
				}});
			}
		}

		if (which == "ExploreDarts") {
			unlockJournal("Frog boy");
			append("Something darts across the path and freaks you out. It's a little frog, covering his butt and eyeing you bulbously.");

			addChoice("... Fuck the frog???", brightForestExplore.bind("fuck frog"), {faCensor: true});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "fuck frog") {
			append("He's self-conscious about his sliminess and hides under a landlocked lilypad.");

			addChoice("I don't mind slimy. (x1 Heart)", brightForestExplore.bind("i dont mind"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "i dont mind") {
			rain("soft");
			append("You climb under the lilypad and give him a hug.\n\nA light nocturnal rain leaks down a full mile through the canopy, rivulets beefing each other up and channeling down the boughs to form a pure-clear inch-wide stream which overfills the lilypad above and soaks you both.\n\nHe still seems nervous.");

			if (data.hasCock) addChoice("Hotdog him at least.", brightForestExplore.bind("hotdog"));
			addChoice("Next x4.", brightForestExplore.bind("next x4"), {give: ["Sweetgrass Leaf", 2]});
		}

		if (which == "hotdog") {
			rain("soft");
			data.froggyHotDogged = true;
			append("You slip your cock up against his plump amphibian taint. It's extra slimy and a little cold from his blood, but he seems to enjoy your heat. His tongue shoots out now and again to slurp at the rain.");
			addChoice("Next x4.", brightForestExplore.bind("next x4"), {give: ["Sweetgrass Leaf", 5]});
		}

		if (which == "next x4") {
			rain("soft");
			data.froggyDone = true;
			disableExplorable(33);

			if (!data.froggyHotDogged) append("Neither of you initiate anything. ");
			append("You just sit there and cuddle. The rain begins to pool and soon you realize you're laying in a giant puddle, getting forest muck between your buttcheeks and frogslime on your face from all the nuzzling.\n\nEventually he slips away from you, leaving a few blades of sweetgrass as shy thanks.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreFlyTrap") {
			data.bfTimesPassed++;

			function setupArtGenitals(scale:Float, verticalNudge:Float) {
				var base:MintSprite = addSprite("assets/img/effect/flytrapbase.png");
				var cock:MintSprite = addSprite("assets/img/effect/flytrappenis.png");
				var tits:MintSprite = addSprite("assets/img/effect/flytraptiddy.png");
				base.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Meryiel", "");
				base.scaleX = base.scaleY = cock.scaleX = cock.scaleY = tits.scaleX = tits.scaleY = scale;
				base.x = GAME_WIDTH*0.5-base.width*0.3;
				base.y = GAME_HEIGHT-base.height*verticalNudge;

				cock.x = base.x;
				cock.y = base.y;
				tits.x = base.x;
				tits.y = base.y;

				if (data.plantGender == "he" || data.plantGender == "it") {
					cock.alpha = 1;
					tween(cock, {scaleY: scale+0.1}, 1.5, {type: REVERSE, ease: BOUNCE_IN});
				} else {
					cock.alpha = 0;
				}

				if (data.plantGender == "she" || data.plantGender == "it") {
					tits.alpha = 1;
					tween(tits, {scaleY: scale+0.1}, 1.5, {type: REVERSE, ease: BOUNCE_IN});
				} else {
					tits.alpha = 0;
				}
			}

			var venusLines = [
				"A tiny venus flytrap wilts in the underbrush.",
				"Your venus flytrap is still struggling, but "+he+" looks a little braver.",
				"A few bushes wiggle at you?\n\nIt's your flytrap! "+he.toTitleCase()+"'s still wilting, but it looks like "+he+" was just barely strong enough to pull some camouflage over "+him+"self with that hungry lil plant maw.",
				"Your flytrap grew "+plantGender("a cock", "tiddies", "a cock and tits")+".",
				"Your flytrap has outgrown "+his+" bushes.\n\nBut that's okay. No creature could nibble "+him+" without getting nibbled back now.",
				"A family of deer bolt across the path, "+(data.hasBoobs?"sending your tits all a-jiggle in the shockwave":"screaming deer-screams and splattering you with mud")+".\n\n... Back where they came from, down through a canyon of smushed bushes, your venus flytrap smiles and licks tufts of fur from "+his+" lips.",
				"You can hardly avoid running into your flytrap again, "+he+"'s so big now!\n\nAnd wide, too. All those berries went straight to "+his+" hips. Your "+pickByGenitals("cock swells", "pussy tingles", "cock swells")+".\n\n"+he.toTitleCase()+" licks "+his+" lips, staring at you.",
				"You're tuckered out!\n\nYou stroll for a while until you catch sight of your flytrap's massive shadow. "+he.toTitleCase()+" towers over the canopy now, bigass head blotting out the moon.\n\nYou tuck yourself between "+his+" throbbing roots. The stem bows over, slowly, plant fibers groaning, and "+his+" squishy bottom lip nuzzles over your cranium.\n\nThen, a single drop of plant slobber <!i>plops<!i> onto your crotch.\n\n"+he.toTitleCase()+" gave you some lube for your next adventure. <3\n\nThey grow up so fast."
			];

			var takesToFeed:Array<Int> = [1, 2, 4, 8, 16, 32, 64];
			var takes:Int = takesToFeed[data.bfVenusFed];

			append(venusLines[data.bfVenusFed]);

			if (data.bfVenusFed == 0) {
				var s:MintSprite = addSprite("assets/img/effect/flytrap1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Meryiel", "");
				s.scaleX = s.scaleY = 0.5;
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.y = GAME_HEIGHT-s.height*1.05;
				s.tint = 0x66000000;

				addChoice("Feed it.", brightForestExplore.bind("flytrapfeed"), {cost: ["Glowberry", takes]});
				addChoice("Examine underbrush.", function () {
					append("\n\nSome scragglescrub, snagweed, bramblesnatches, sweetgrass, sliproot...\n\nYou just pluck a few leaves of sweetgrass and don't fuck with anything else.");
					if (canGain) addToItem("Sweetgrass Leaf", 2);
				}, {oneTimeSaved: true});
			} else if (data.bfVenusFed <= 5) {
				addChoice("Feed "+him+".", brightForestExplore.bind("flytrapfeed"), {cost: ["Glowberry", takes]});
			}

			if (data.bfVenusFed == 7) {
				addChoice("Examine surroundings.", function () {
					append("\n\nThere's nothing left of the bushes that once sheltered "+him+". Every plant in a ten-foot radius got cannibalized.\n\nThe path you were walking on when you met "+him+" is overgrown with loose-rooted sweetgrass leaves now. People take a new path, one that curves through undisturbed forest and gives your plant a girthy berth. The air strains with upset birdcall, and the new path dips in a few spots where little burrows got trampled open.\n\n... You pluck the sweetgrass off the old path, grumbling to yourself. People should be braver...");
					if (canGain) addToItem("Sweetgrass Leaf", 3);
				}, {oneTimeSaved: true});
			}

			if (data.bfVenusFed == 6) {
				halfWidthText();
				setupArtGenitals(0.9, 1.10);
				addChoice("Feed "+him+".", brightForestExplore.bind("flytrapsex"), {kinks: ["Feral"], cost: ["Glowberry", takes]});
			}

			if (data.bfVenusFed == 5) {
				halfWidthText();
				setupArtGenitals(0.9, 1.10);
				addChoice("Examine hoofprints.", function () {
					append("\n\nSunken, panicked. Drops of red follow the littlest.");
				}, {oneTime: true, kinks: ["Blood"]});
			}

			if (data.bfVenusFed == 4) {
				halfWidthText();
				setupArtGenitals(0.9, 1.10);
				addChoice("Nibble "+him+"~", function () {
					append("\n\n... Okay, except you. "+he.toTitleCase()+"'s happy to be nibbled by you. <3");
				}, {oneTimeSaved: true});
			}

			if (data.bfVenusFed == 3) {
				halfWidthText();
				setupArtGenitals(0.8, 1.05);
				addChoice("Examine "+plantGender("nuts", "tiddies", "tiddies")+".", function () {
					append("\n\nYou smush your face between "+plantGender("those fat plant nuts", "them fat plant tiddies", "them fat plant tiddies")+" and give them a rigorous examination.");
				}, {oneTime: true});
			}

			if (data.bfVenusFed == 2) {
				var s:MintSprite = addSprite("assets/img/effect/flytrap1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Meryiel", "");
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.y = GAME_HEIGHT-s.height*1.30;

				addChoice("Examine bushes.", function () {
					append("\n\nSome deers nibbled these bushes hard, never realizing your clever buddy was hidden just a few inches below!!");
				}, {oneTime: true});
			}

			if (data.bfVenusFed == 1) {
				var s:MintSprite = addSprite("assets/img/effect/flytrap1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Meryiel", "");
				s.scaleX = s.scaleY = 0.8;
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.y = GAME_HEIGHT-s.height*1.20;
				s.tint = 0x4D000000;

				addChoice("Examine plant bravery.", function () {
					append("\n\n"+he.toTitleCase()+"'s really sticking "+his+" neck out, y'know? "+he.toTitleCase()+" could just find some dank little corner of the world and munch on recluse bugs. Maybe throw roots down half-under a rock. It'd be smarter than growing two inches off the side of a popular path for sure.\n\n... But, if "+he+" did that, "+he+" never woulda met you!");
				}, {oneTime: true});
			}

			addChoice(
				data.bfVenusFed == 0?"Avoid this.":"Goodbye, darling.",
				function() {
					clear();
					append((data.bfVenusFed == 0?"You feel kind of bad, leaving this poor withered thing here.":"You consider whether you really want to say goodbye to your little plant pal forever."));
					addChoice((data.bfVenusFed == 0?"I guess I'll stop if I pass by it again.":"I just... <!i>sniffle"+(Math.random()>0.9?" snoofle":"")+"<!i>... I just can't do it."), brightForestExplore.bind("ExploreFlyTrap"));
					addChoice((data.bfVenusFed == 0?"Nah not really. Peace ya lil green fuck!":"It's time."), function() {
						disableExplorable(34);
						brightForestHub();
					});
				}
			);

			if (data.bfVenusFed != 7) addChoice("Move along.", brightForestHub);
		}

		if (which == "flytrapfeed") {
			var respondLines:Array<String> = [
				"You poke a glowberry into its maw and give its head a few gentle, rhythmic pinches to help it chew.\n\nHmm...\n\nMaybe \"it\" is a bit impersonal.",
				he.toTitleCase()+" rips through those berries. It's a wonder "+he+" didn't take your finger off.",
				"One by one you drop the berries into your flower's ravenous gullet. You swear you hear a tiny \"Yum.\"\n\nTurns out it's a nymph hanging upside-down from a tree behind you. They flit away.",
				"You kiss "+his+" stem-belly, making sure "+he+" feels loved while you pack that maw fulla berries.",
				"You pour a double-handful of berries through the air. "+he.toTitleCase()+" catches every single one between "+his+" teeth and <!i>CHOMPS<!i>, showering your crotch with a blast of glowberry juice.",
				he.toTitleCase()+" munches three double-handfuls of berries down like a light snack.\n\n...\n\n"+he.toTitleCase()+" looks down and wiggles "+his+" leaves.\n\nYou think "+he+" might be getting tired of berries for every meal..."
			];
			append(respondLines[data.bfVenusFed]);

			data.bfVenusFed++;

			if (data.bfVenusFed == 1) {
				addChoice("It's a she.", brightForestExplore.bind("a she"), {kinks: ["Female"]});
				addChoice("It's a he.", brightForestExplore.bind("a he"), {kinks: ["Male"]});
				addChoice("It's an it.", brightForestExplore.bind("an it"), {kinks: ["Intersex"]});
			} else {
				addChoice("Move along.", brightForestHub);
			}
		}

		if (which == "a she") {
			data.plantGender = "she";
			append("Well, she scarfs down the berry like a lioness.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "a he") {
			data.plantGender = "he";
			append("Well, he scarfs down the berry like a madman.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "an it") {
			data.plantGender = "it";
			append("Well, it scarfs down the berry like a starving stray.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "flytrapsex") {
			unlockJournal("Flytrap");
			data.bfVenusFed++;
			append(he.toTitleCase()+" knocks the berries out of your hands scatters them to the grass. Those fat, drooly plant lips nudge against "+pickByGenitals("the berries hanging just under your shaft", "the lips of your puss", "the berries hanging just under your shaft")+" instead.\n\nOh.\n\n"+he.toTitleCase()+"'s hungry for something else.");

			addChoice(pickByGenitals(
					"Let "+him+" get a taste of my berries",
					"Let "+him+" suck my cunt",
					"Let "+him+" get a taste of my berries"
			)+". <3", brightForestExplore.bind("flytrapsex2"));

			addChoice("Move along.", function() {
				disableExplorable(34);
				brightForestHub();
			});
		}

		if (which == "flytrapsex2") {
			data.plantReplies = false;
			var choseOne:Bool = false;

			append("You run a palm over that smooth plant cranium. First it dents, then expands slowly, like memory foam. You plan on taking things slow and gentle, but—\n\n"+he.toTitleCase()+" completely ignores your affection and dives straight for the meal "+plantGender("he", "she", "it")+" can smell(?) "+pickByGenitals("brewing in your nuts", "hanging off the lips of your cunt", "brewing in your nuts")+". "+he.toTitleCase()+" flops "+his+" tongue out and drags it over your "+pickByGenitals("sack", "lips", "sack")+" so viciously it almost puts your ass in the mud.\n\n("+he.toTitleCase()+" seems to think if "+he+" licks hard and ferocious enough "+he+"'ll get right to the tasty bit?? Or maybe "+he+" just adores the taste of your crotch.)");

			function askQ() {
				append("\n\n("+he.toTitleCase()+" is"+(choseOne?" still":"")+" a plant and cannot answer that"+(choseOne?" either":"")+".)");
				if (choseOne) {
					clearChoices();
					addChoice("Relax and let "+him+" do all the work.", brightForestExplore.bind("flytrapsex3"));
					addChoice("(Shush, I just like dirty talk okay.)", function () {
						append("\n\n(Fine whatever~ :3 I'll interpret "+his+" leaf-wiggles as colorful replies:)\n\n<!i>Yes, I adore the taste of your "+pickByGenitals("juicy nuts, I absolutely cannot wait to absorb all your "+(isActive("Mood Ring")?getMood("You"):"")+"cum deep into my roots", "cuntjuice and I absolutely cannot wait to chug it", "juicy nuts, I absolutely cannot wait to absorb all your "+(isActive("Mood Ring")?getMood("You"):"")+"cum deep into my roots")+". <3<!i>");
						data.plantReplies = true;
					}, {oneTime: true});
				}
				choseOne = true;
			}
			addChoice("Relax and let "+him+" do all the work.", brightForestExplore.bind("flytrapsex3"));
			addChoice("Want me to "+pickByGenitals("cum", "squirt", "cum")+" down your throat ya little plantslut?", askQ, {oneTime: true});
			addChoice("You love the taste of my "+pickByGenitals("nuts", "cunt", "nuts")+", don't you?", askQ, {oneTime: true});
		}

		if (which == "flytrapsex3") {
			append("You find a patch of grass and settle your bare buttcheeks down on it. Cool, dewy leaves slip up your crack. "+his.toTitleCase()+" relentless licking was starting to make your knees wobbly anyway.\n\n"+he.toTitleCase()+" never breaks the seal of "+his+" lips around your "+pickByGenitals("sack", "puss", "sack")+"; "+his+" stem cranes gracefully to follow your crotch as you sit down, lips tugging at your sensitive skin, tongue "+pickByGenitals("bullying your nuts around", "slipping around and between your folds", "bullying your nuts around, at times even adventuring south to lap up a few drops of pussydribble")+"...\n\nYet, still, that tasty prize is locked away. "+he.toTitleCase()+" pulls off, snapping a few strands of drool, and flops "+his+" head down "+(data.hasBoobs?"between your tits":"onto your chest")+" defeatedly.");

			addChoice("C'mon, don't give up already~", brightForestExplore.bind("flytrapsex4"));
			addChoice("Hey wait. Examine tongue's existence in the first place?", function () {
				append("\n\nRight, flytraps don't usually have those...\n\n"+he.toTitleCase()+" must be some kinda mythological plant elemental??");
			}, {oneTime: true});
		}

		if (which == "flytrapsex4") {
			var smell:String = "a rich, musky scent";
			if (data.choseBooze) smell = "the rich scent of glowberry wine";
			if (data.choseTea) smell = "a waft of sweetgrass tea";
			if (data.nymphBerryEaten) smell = "the scent of glowberries";

			append(he.toTitleCase()+" pouts. His lips quiver pathetically, inches from your own.\n\nThen "+he+" smells something... "+smell+", something still lingering on your breath from another adventure.\n\nIn a moment "+he+"'s got "+his+" voluptuous lips clamped sideways around your face and "+his+" tongue at the back of your throat. You stare at nothing. Your fingers wander up to the back of "+his+" head and sink into the memory foam flesh. You're somewhere else now, tucked away into your own headspace. The only thing you care about is how the contours of "+his+" tongue slide deeper and deeper into your mouth, how the base widens out and parts your lips, dripping wet with harmless digestive plantslobber— how the tiny bumps on the underside mesh up perfectly with your taste buds, how the little ball at the tip (like a yoshi tongue!) rolls in tight circles around your uvula.\n\nWhen bullying your uvula yields no treats, "+he+" instead drives "+his+" tongue straight down your throat.");

			addChoice("Ew plant drool! Push "+him+" off.", brightForestExplore.bind("flytrapsex6"));
			addChoice("Swallow "+his+" tongue.", brightForestExplore.bind("flytrapsex5"));

			if (data.plantReplies)
				addChoice("How's my throat taste?", function () {
					append("\n\n"+he.toTitleCase()+" wiggles excitedly just at the tone of your muffled, gagging voice.\n\nMust mean to say <!i>You're delicious inside~!<!i>");
				}, {oneTime: true});
		}

		if (which == "flytrapsex5") {
			var smell:String = "mystery treat";
			if (data.choseBooze) smell = "glowberry wine";
			if (data.choseTea) smell = "sweetgrass tea";
			if (data.nymphBerryEaten) smell = "glowberries";

			append("You give in to the pressure and open wide, taking "+his+" fat tongue almost to the bottom of your esophagus.\n\nYou latch your lips properly now around the base of "+his+" maw and suck hard like it's a cock, your throatmuscles rippling shut over "+his+" tongue's bell-end and milking drops of drool from it like precum.\n\nBefore long your face starts going blue.\n\nYou tap your flytrap on the back of the head a couple times.\n\nNo response.\n\nYou tug one of "+his+" leaves...\n\nNo response!\n\n"+he.toTitleCase()+"'s so stuck on "+his+" quest for the "+smell+" in your belly, "+he+"'ll french you to death!!");
			addChoice("Push "+him+" off!", brightForestExplore.bind("flytrapsex6"));
			if (data.plantReplies)
				addChoice("Mrrgghpghgh!!", function () {
					append("\n\n"+his.toTitleCase()+" leaves give a triumphant twiddle. <!i>Am I doing it right~?<!i>");
				}, {oneTime: true});
		}

		if (which == "flytrapsex6") {
			append("You shove "+his+" big fat head away.\n\n"+he.toTitleCase()+" shakes out the dents your palms left, slobber flying in globs from his pouty lips.");
			addChoice("Look, you had the right idea the first time. (Spread my legs.)", brightForestExplore.bind("flytrapsex7"));
		}

		if (which == "flytrapsex7") {
			append(he.toTitleCase()+" cocks "+plantGender("his", "her", "its")+" head.");

			if (data.hasCock || data.hasBoth) addChoice("... Suck my cock, you silly plantslut.", function () {
				data.plantCock = true;
				brightForestExplore("flytrapsex8");
			});
			if (data.hasCunt || data.hasBoth) addChoice("... Tongue my cunt, you silly plantslut.", function () {
				data.plantCock = false;
				brightForestExplore("flytrapsex8");
			});
		}

		if (which == "flytrapsex8") {
			append((data.plantReplies ? he.toTitleCase()+" looks from you to your crotch. <!i>But I already tried that?<!i>" : "("+he.toTitleCase()+" is a plant and cannot understand you.)"));

			addChoice((data.plantReplies?"C'mon, what did I tell you... don't give up!":"Maybe I can get the point across if I ")+" (Squeeze out a little "+(data.plantCock?"pre":"cuntjuice")+".)", brightForestExplore.bind("flytrapsex9"));
		}

		if (which == "flytrapsex9") {
			append((data.plantCock?"You pinch two fingers at the base of your cock and bring them slowly up to the tip, milking out a single shiny bead of precum":"You spread your legs as wide as you can and clench your lower belly hard, forcing out a single shiny bead of natural lube")+".\n\n"+he.toTitleCase()+" perks up immediately at the fresh scent, faith renewed. Slower this time, more doubtful, "+he+" starts lapping at your "+(data.plantCock?"dick":"cunt")+". The ball at the end of "+his+" tongue fits perfectly "+(data.plantCock?"into the little nook in the middle of your cockhead":"up your cunthole")+", so naturally "+he+" gets into the habit of precision-slurping right on that spot. You keep squirming with pleasure and making the ball slide off, though, so "+plantGender("he", "she", "it")+" gets frustrated and wraps "+plantGender("his", "her", "its")+" lips around "+(data.plantCock?"your head itself":"your entire cunt")+" to try and keep you still.\n\nThat earns "+him+" a few more miraculous "+(data.plantCock?"pre ":"")+"dribbles!\n\nA ray of moonlight glides down and alights "+his+" dumbstruck expression, lips parted and soaking with "+(data.plantCock?"pre":"juice")+". "+he.toTitleCase()+" appears to be having an epiphany.\n\n"+(data.plantReplies?"<!i>If I "+(data.plantCock?"suck":"tonguefuck")+" it... then tasty stuff comes out?!<!i>":"If "+he+" "+(data.plantCock?"suck":"tonguefuck")+"s it... then tasty stuff comes out?!"));

			addChoice("Come on... just a bit deeper...", brightForestExplore.bind("flytrapsex10"));
			addChoice("Good job slut~! You figured out how to "+(data.plantCock?"suck dick":"eat pussy")+"!", brightForestExplore.bind("flytrapsex10"));
		}

		if (which == "flytrapsex10") {
			append(he.toTitleCase()+" dives forward and "+(data.plantCock?"spirals "+his+" tongue around your shaft, taking the whole thing down to the back of "+his+" maw in a heartbeat (not that "+he+" has one) and giving it a vicious corkscrew blowjob, tongue coiling and uncoiling":"plunges "+his+" tongue up your snatch, ball-end slamming against the nub of your g-spot as if it's a berry "+he+"'s trying to crush")+" with every bob of "+his+" squishy noggin.\n\nAt first you wrap both arms around that noggin and hold on for dear life— no, seriously, if you didn't keep a hold on "+him+" "+he+" might actually try to eat you, it's not like "+he+" knows any better— but around the time you start feeling "+(data.plantCock?"cum burbling up inside your nuts":"pins and needles dancing over your labia")+" you also start feeling your arms whine with exhaustion. Your fingers scrabble for some anchor on "+his+" slippery scalp. Your thighs squeeze around the sides of "+his+" stem. Your mouth can't really do anything, but you kiss "+his+" head and try to hold on via raw suction anyway.\n\nIn the end you flop onto your back in the mud and let "+his+" maw engulf your waist. You can do nothing else but look "+(data.hasBoobs?"down past your jiggling tits and watch":"up to the moon and let")+" "+his+" tongue coil up tight "+(data.plantCock?"just underneath your head, boa-constrictoring the first bursts of "+(isActive("Mood Ring")?getMood("You"):"")+"cum from it":"inside your cunt, forming a corkscrew, gaping you from the inside out, and drawing a messy splurt of juice out into "+his+" greedy maw")+".");
			var choices:Array<String> = ["Hyyuurrgh!", "Nyaaa~!", "Hngh.", "Hoooooo me oh my!!", "Oh yeah!", "Feels so good!", "Swallow.", "How's that for a meal? <3", "UNH FUCK. GUZZLE THAT SHIT YA FUCKIN PLANT BIMBO"];
			for (s in choices) addChoice(s, brightForestExplore.bind("flytrapsex11"));
		}

		if (which == "flytrapsex11") {
			append(he.toTitleCase()+" can't exactly swallow the "+(data.plantCock?"insane amount of cum currently gushing out of your cock":"ridiculous amount of pussyjuice currently rushing past "+his+" lips")+". Some of it soaked into "+his+" tender green membrane, but the pores are clogged now, and your "+(data.plantCock?"dick":"cunt")+" is still throbbing with the second half of orgasm. The only thing "+he+" can do is \"gag\" on "+his+" meal— those weird maw muscles twitch and ripple, tightening his lips and redirecting the violent sloshes of fluid before it spills out over your thighs.");
			addChoice("Wind down.", brightForestExplore.bind("flytrapsex12"));
		}

		if (which == "flytrapsex12") {
			append("Hooooo. With a little prying, you stop "+him+" from consuming your lower half. You just sit, for a moment, and look at your feet.\n\nNow that you're out of food, "+he+" ignores you and recedes back into the nibbled-barren skeletons of "+his+" bushes, munching happily on a mawful of "+(data.plantCock?"hot protein":"peach juice")+".\n\nOh hey. There's something down here.\n\nThe x64 Glowberries your flytrap knocked away still flicker in the grass. A couple got smushed between your toes in the excitement though.");
			addChoice("I worked hard for those. Scoop em up!", brightForestExplore.bind("flytrapsex13"), {give: ["Glowberry", 54]});
			if (data.plantReplies)
				addChoice("You gonna eat these?", function() {
					append("\n\n"+he.toTitleCase()+" sticks out "+his+" drippy tongue at you. <!i>Oh, I'm full. ;3<!i>");
				}, {oneTime: true});
		}

		if (which == "flytrapsex13") {
			var s:MintSprite = addRectSprite(800, 200, 0x000000);
			s.layer = 1;
			s.alpha = 0.01;
			s.onReleaseOnce = function () {
				playSound("assets/audio/ui/explore");
				if (canGain) addToItem("Sweetgrass Leaf", 10);
				append("\n\nThank you~");
				s.destroy();
			}
			append("With no help from the lazy flytrap or anyone else you go around and pluck them all up one by one. In the end you can't find six of them, and four got squished.\n\nThe immense tedium of this task is lost on you because it's been reduced to a short text summary.\n\nOr maybe you won't read this at all, and you'll just type \"Move along.\" Well, if you didn't read this, you won't know to click the top of the screen for an extra x10 Sweetgrass Leaves which just so happened to be plucked up along the way.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreSalvage") {
			if (!data.landfillVisited) {
				data.landfillCounter = 0;
				data.landfillVisited = true;
				append("You hear the purr of cars nearby and push through the bushes into a clearing eclipsed by the moonlight shadows of Junk City's skyscrapers. Hunks of twisted metal and wads of gaudy packaging sit half-sunken in mud. It's an abandoned landfill.\n\n");
			} else {
				append("You're back at the landfill in the shadow of the City.\n\n");
			}

			var foo:String = "nil";
			if (data.binsSpotted && !data.binsApproached) {
				unlockJournal("Bins the raccoon");
				if (data.metBins == 0) append("You spot that raccoon boy from earlier") else append ("You spot Bins's little raccoon butt");
				append(" disappearing around a corner.\n\n");
				foo = "Also, you catch the scent of... hot dogs.";
				addChoice("Follow the raccoon.", brightForestExplore.bind("follow raccoon"), {kinks: ["Male", "Cub"], faCensor: true});
			} else {
				foo = "You catch the scent of... hot dogs.";
			}

			if ((data.hasCock || data.hasBoth) && !data.seagullDone) {
				append(foo);
				unlockJournal("Seagull girl");
				addChoice("Follow the scent.", brightForestExplore.bind("follow scent"), {kinks: ["Patreon Commission", "Female"]});
			}

			if (data.landfillCounter == 5) disableExplorable(35);

			addChoice("Loot.", explore.bind("Landfill"));
			addChoice("Avoid this.", function () {
				disableExplorable(35);
				unlockJournal("Bins the raccoon");
				unlockJournal("Seagull girl");
				brightForestHub();
			});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "follow raccoon") {
			data.binsApproached = true;
			unlockJournal("Bins the raccoon");
			append("Kinda by accident you've cornered him in a narrow alleyway between towering piles of garbage. He makes his escape and sprints toward you, darting left, right, doing a sick wallrun off the back of a cum-stained couch, trying to fake you out.");

			addChoice("Lunge left.", brightForestExplore.bind("lunge left"));
			addChoice("Lunge right.", brightForestExplore.bind("lunge right"));
			addChoice("Throw a Piss Balloon to stun him.", brightForestExplore.bind("throw to stun"), {cost: ["Piss Balloon", 1]});
		}

		if (which == "lunge left") {
			append("You manage to get a grip on one of his little raccoon ears, but he knees you in the stomach and wrangles away anyway.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "lunge right") {
			append("You dive and grab hold of his cocklet, but it's coated in grease and trashslime. He slips away easily, snickering.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "throw to stun") {
			var bins = "";
			if (data.metBins > 0) bins = "We've met before, I think...";
			data.metBins++;
			append("Your aim is true and it connects directly with his face. In slow motion the fat balloon wobbles and morphs, moulding to his bewildered expression, then: pop.\n\nBlinded, his sprint falters into a toddle— then he trips on an old toaster, flipping head-over-tail through the air before skidding to a stop at your feet. Up close, you can tell he's somewhere around "+(isActive("Pastel Ring")?"six":"eight")+".\n\n\"Hi.\" He smiles, nervous and yellow-dripping. \"I'm Bins."+bins+" Don't rape me too hard, okay?\"");

			addChoice("I'm not gonna rape you.", brightForestExplore.bind("not gonna"));

			if (data.hasCock || data.hasBoth) {
				addChoice("No promises.", brightForestExplore.bind("no promises"), {kinks: ["Piss", "Scat", "Vomit"]});
			} else {
				addChoice("I don't have a cock.", brightForestExplore.bind("not gonna"));
			}

			addChoice(
				"How about we hump some trash together, instead~?",
				brightForestExplore.bind("landfillhump"),
				{kinks: ["Vomit"], cost: ["Bag o Trash", 1]}
			);
		}

		if (which == "not gonna") {
			append("\"Oh.\"\n\nHe gets up, dusts himself off, and wipes the piss from his face, ");

			if (data.hasCock || data.hasBoth) {
				append("raising an eyebrow. \"Well... can I go, then?\"");
				addChoice("Yeah I guess.", brightForestExplore.bind("yeah i guess"));
			} else {
				append("giving you a weird look. \"Well, sorry but, uh, um, well, uh, jeez, uh, um. UH.\"\n\nHe darts off, sucking the yellow from his fingers. \"I gotta go!\"");
				addChoice("... Seeya!", brightForestHub);
			}
		}

		if (which == "yeah i guess") {
			append("He walks off muttering to himself.\n\n\"... Yup... totally fine... just bean a kid in the face with a piss balloon... yeah, well, whatever... not even a quickie... unbelievable...\"\n\nAnd yet, before he gets out of view, you spot him happily sucking his fingers clean.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "no promises") {
			append("You slip from your clothes and straddle his waist, nuts resting on the pillow of his stomach. His little cock slips along your "+(data.hasBoth?"pussy":"buttcheeks")+", chubbing up between the folds. Now that you're even closer you can distinguish his intimate scent from the general filthstank of the landfill: undertones of putrid sewage, a hint of stale "+(isActive("Candy Ring")?"candy":"vomit")+".\n\nBins grins, stretching both arms above his head to reveal two thick-furred pits, flooding your nose with a double-barrel buckshot of boymusk.\n\n\"Well, are you gonna rape me, or are you gonna sit there sniffin all night~?\"");

			addChoice("Suck the sweat from his pits.", brightForestExplore.bind("suck sweat"));
			addChoice("Shit in his mouth.", brightForestExplore.bind("shit mouth"));
			addChoice("Is it really rape if you're so demanding about it?", brightForestExplore.bind("is it really"));
		}

		if (which == "suck sweat") {
			append("You bury your face in his left armpit and slurp hard on a mouthful of damp raccoon fur. He snakes his fingers into your hair and pushes your face hard, using it to wipe the "+(isActive("Candy Ring")?"sparkly candydust":"grease")+" from his pit, hairs and "+(isActive("Candy Ring")?"tiny rainbow sprinkles":"nodules of something crusty and beige (dried cum?)")+" slowly forming a coat of "+(isActive("Candy Ring")?"sugar":"filth")+" on your tongue.");

			addChoice("Shit in his mouth.", brightForestExplore.bind("shit mouth"));
			addChoice("End.", brightForestHub);
		}

		if (which == "shit mouth") {
			append("Suddenly you flip around, your face between his legs, slurping at his sweaty little nuts and letting your ass hover over his mouth. Your pucker twitches as you start to push a "+(isActive("Candy Ring")?"huge piece of cake":"log")+" out; the risings and fallings of the raccoon's chest beneath you accelerate as he works two fingers from each hand between your cheeks, yanking you open so he can get a better look at his imminent meal. He licks his lips.\n\nAt that moment you clench hard, a couple "+(isActive("Candy Ring")?"globs of cake":"shit-dribbles")+" spattering out over the underaged raccoon's face, his panting only getting heavier inbetween gobbles of what "+(isActive("Candy Ring")?"tasty bits":"soupy lumps")+" he can scoop out, the workings of his jaw making tiny glk-chk-krlks.");

			addChoice("Next.", brightForestExplore.bind("binsnext2"));
		}

		if (which == "is it really") {
			append("\"To be honest, I just like saying it. It's hot, okay? 'Rape my mouth' sounds so much cuter than 'Fuck my mouth.'\"");

			addChoice("To each their own I guess.", brightForestExplore.bind("binsnext"));
		}

		if (which == "binsnext") {
			append("... \"So... like...\"");
			addChoice("Suck the sweat from his pits.", brightForestExplore.bind("suck sweat"));
			addChoice("Shit in his mouth.", brightForestExplore.bind("shit mouth"));
		}

		if (which == "binsnext2") {
			append("You slam your ass to his little face and hold it there, a "+(isActive("Candy Ring")?"perfect cylinder of cake":"sturdy shitlog")+" burrowing down his throat unbroken. Bins grabs two fistfuls of your buttmeat for leverage, gagging noisily, coughing up "+(isActive("Candy Ring")?"cake":"shit")+", a bubble rising from each nostril.\n\nFinally you pull off, beholding his expression: "+(isActive("Candy Ring")?"frosty":"shit")+"-smeared, cute, excited.\n\nHe points to your cock, then to his mouth, throat too heavily clogged for speech.");

			addChoice("Shitfuck his throat.", brightForestExplore.bind("shitfuck"));
		}

		if (which == "shitfuck") {
			append("You nod, scoot back a little~\n\nBins can't contain his excitement. He's trying to do several things at the same time: with one paw he's digging two fingers in your pucker, pulling out more chunks and stuffing them up his nose, daintily applying "+(isActive("Candy Ring")?"frosting":"choco")+" mascara with a finger, and of course cramming more into the few unfilled crannies of his maw. The other paw gropes your nuts, your cock, the lube seeping down your crack so slippery that he can only barely manage to keep you aimed between his "+(isActive("Candy Ring")?"sugar-slick":"shitty")+" lips— yet he gropes all the harder because of that, paw slipping up over the flare of your head and nearly flying off each time he redoubles his desperate efforts.\n\nYou grab him by the wrists to stop this madness. You pull those messy paws down to his belly button and hold them there.\n\nSlowly, milking his powerless anticipation, you press your cockhead between his filth-coated lips... harder... ha<!i>derrr<!i>... until.........\n\n<!i>Pwip~<!i>\n\nIt pops through. The inside of his mouth is warm and squishy, most of your "+(isActive("Candy Ring")?"cake":"shit")+" slipping easily aside to accommodate while the "+(isActive("Candy Ring")?"bright sprinkles":"firmer nuggets")+" get forced down his esophagus.");

			addChoice("Piss down his throat.", brightForestExplore.bind("piss down"));
		}

		if (which == "piss down") {
			append("First you have to actually get your cock down there; it takes many and laboured thrusts to pack all that "+(isActive("Candy Ring")?"baking":"shitsludge")+" down, your nuts slapping against his forehead as his smooth stomach growls and bloats with "+(isActive("Candy Ring")?"cake":"waste")+" just under your chin.\n\nYou're not quite all the way down when you lose control of your bladder and discharge a violent, hot jet of piss inside him, sighing with relief, gripping his wrists tighter just in case he's tempted to reach up and try to get out of coughing and choking on it. Ramping up from that point you rape his face way way too hard, bouncing his head against the landfill's mucky ground.\n\nHe does his best to guzzle the yellow-"+(isActive("Candy Ring")?"pink":"brown")+" stew like a good urinal— but ultimately fails, hot "+(isActive("Candy Ring")?"cake":"puke")+" erupting from his nose and mouth, his little feetpaws rubbing against each other and his tiny butthole twitching as he paints your chest with "+(isActive("Mood Ring")?getMood("Bins"):"")+"cum.");

			addChoice("Wind down.", brightForestExplore.bind("winddownbins"));
		}

		if (which == "winddownbins") {
			append("Once he somewhat comes back to reality he methodically chews and swallows the remaining "+(isActive("Candy Ring")?"food":"mess")+" in his maw and sucks all he spilled from the ground. Next, still hungry, he sucks his "+(isActive("Mood Ring")?getMood("Bins"):"")+"cum from you.\n\nBins pays special attention to both nipples, pulls his lips down over your stomach, tongues out a stray nugget of "+(isActive("Candy Ring")?"frosting":"shit")+" trapped in your belly button. He spends at least thirty minutes dragging his warm little tongue over every inch and crack of your positively "+(isActive("Candy Ring")?"yummy":"disgusting")+" cock; then, as a finisher, he even works his tongue into your slit and siphons out the last few dribbles of pee.");

			addChoice(
				"Still got enough energy for some trash humping? (Bag o Trash x1)",
				brightForestExplore.bind("landfillhump"),
				{kinks: ["Vomit"], cost: ["Bag o Trash", 1]}
			);
			addChoice("End.", brightForestHub);
		}

		if (which == "landfillhump") {
			append("You whip out a bag of trash and the kid's eyes go bright in a blink. \"YES.\"\n\nHe dives onto it.\n\nWith spontaneous, childish vigor, he pounds his cock into a squishy section of the bag and pops right through, a "+(isActive("Candy Ring")?"bright pie filling":"filthy brown mystery-muck")+" pouring out over his little nutsack, coating it shiny. Bins grits his teeth and releases a high-pitched moan, hugging the bag with one arm and yanking open the tied top.\n\nYou join him on the other side. You do throw in your own humps, but mostly you just watch the little "+(isActive("Candy Ring")?"pieslut":"trashslut")+"'s fanaticism. He reaches deep into the bag and pulls out a heaping handful of "+(isActive("Candy Ring")?"pie":"rotten banana peels, receipts, cigarette butts,")+" and crams it in his mouth, chewing slowly and sucking the flavor out.\n\nHe barely gets halfway through his first swallow before waves of gags hit him, forcing him to double over and "+(isActive("Candy Ring")?"dribble a few blue pie-burps":"spew hot garbopuke")+" all over his flat chest.\n\nGasping for breath, he reaches for another handful... and another... annnnnd another...");

			addChoice("End.", brightForestHub);
		}

		if (which == "follow scent") {
			unlockJournal("Seagull girl");
			append("Before you towers a mountain of broken-down hot dog stands. At your feet, the scent's source: a lone discarded hot dog.\n\nYou have to squint to see them, but up on the summit it looks like two bare white-feathered buttcheeks are wiggling in the air...");

			addChoice("Hullo up there!", brightForestExplore.bind("hullo up"));
		}

		if (which == "hullo up") {
			append("It's a seagull, naturally. "+(data.bankAccountOpened?"Hey, she opened your savings account at the Snagglebank.\n\n\"Hey!\" she squawks, unplugging her ketchup-coated beak from a condiment drawer and blinking at you. \"I opened your savings account at the Snagglebank!\"":"She unplugs her ketchup-coated beak from a condiment drawer and blinks at you."));

			addChoice("Whip my dick out and ask her if she's huntin for a snack.", brightForestExplore.bind("seagullnext"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "seagullnext") {
			append("Both wings unfurl. She glide-jogs gracefully down the peaks and cliffs of garbage, talons steadying her course on the occasional stained awning or grill, then lands before you, kneels with one hair-fluttering wingbeat, and stares directly at your cock.\n\n\"Are you serious?\" she asks you. \"I've been hunting for hours...\"");

			addChoice("How did you miss the hot dog directly behind you?", brightForestExplore.bind("seagullnext2"));
		}

		if (which == "seagullnext2") {
			append("\"WHAT?!\" she squawks, and spins around so quick a couple feathers flutter loose. \"Ohhh, you little devil...\"\n\nShe grabs the stray dog, dusts it off a little, spreads the bun with a wingtip and finds only mayo(?) inside. \"Mmm. Still good...\"\n\nThe seagull dangles it above her open beak, lowering, lowering... without a single gag she takes half of it down her bulged throat, giving your cock a sideways glance, then with teasing <!i>churps<!i> she pulls half of it out, sucks it down again, pulls it out, and finally swallows it whole with one dainty little gulp.\n\n\"Always tastes better when I eat it like that...\"\n\nShe re-kneels, scooching up closer to you and sucking some mystery condiment from her wingtips. \"Time for dessert.\"");

			addChoice("Push down her throat.", brightForestExplore.bind("seagullnext3"));
		}

		if (which == "seagullnext3") {
			append("You grab the back of her head, working your fingers into the feathers, and grind your cock experimentally along her beak. You expect it to feel sharp, but really it's quite soft. She must use beak softener. With one hand on the base of your cock you slowly push inside and grind your head along the roof of her mouth, over her wiggly little birdtongue... \n\nYou start pushing deeper, waiting for the telltale resistance of her throat's entrance. It's not until your eyes are drawn down by a wing rubbing furiously between her legs that you notice her throat— already bulged out. Blinking with disbelief you pull out, push in, pull out... but you never encounter that resistance. Her mouth and throat apparently form one seamless cocksleeve.\n\nShe winks at you.");
			addChoice("Beakfuck her.", brightForestExplore.bind("seagullnext4"));
		}

		if (which == "seagullnext4") {
			append("You wrap your free hand gently around her throat, only gripping hard enough to get a good grope over the bulge of your hilted cock. She remains perfectly silent even as you start bouncing her face against your crotch, the points of her mandibles tickling like felt markers on your skin.\n\nDespite her innate wiener-gobbling talents she is starting to get a little overwhelmed, you can tell; her buttfeathers ruffle with each thrust, and she's forced to pull a wing away from her throbbing pink-tinged 'gullcunt so she can wrap it around your thighs and keep herself steady while you rail her face.");

			addChoice("Don't stop. Make her gag.", brightForestExplore.bind("seagullnext5"));
		}

		if (which == "seagullnext5") {
			append("You triple the pace, slamming your entire length down her throat about eight times a second, feeling her wing smear warm residual pussjuice where it scrabbles desperately at the back of your thighs. Her eyes stay locked on yours, lids barely fluttering each time your drool-soaked nuts slap against her beakbottom. Just by her expression you can tell this is going to be a battle of wills. She's fully prepared to make you cum before you get even a tiny little cough out of her.\n\nSlyly, you pull out.\n\nShe's breathing heavily, a strand of saliva still connecting her beaktip to your cocktip. \"Hah,\" she pants, \"You'll need a little more gumption than that to make <!i>me<!i>—\"\n\nYou grab her beak and yank it open with both hands, driving your cock back down her throat and drawing from deep beneath her chest plumage the hardest, wettest, tummy-clenchingest gag you've ever heard. She releases a fluttery little groan into your crotch as her tailfeathers shiver erect with orgasm.");

			addChoice("Cum.", brightForestExplore.bind("seagullnext6"));
		}

		if (which == "seagullnext6") {
			cumEffect();
			append("You blast a couple goopy ropes down the gullgirl's esophagus as a chain-gag follows up the first, perfectly synchronized with the convulsions of her cum. You hump in sync. Her throatmuscles contract in gorgeous ripples over your cock, practically milking out your mystery mayo, and with each gulp she shivers and melts into an even more blissed-out little puddle of feathers and pussyjuice, posture curving, wings flopping down to your ankles, stomach growling happily as she chokes your "+(isActive("Mood Ring")?getMood("You"):"")+"cum down.");

			addChoice("Wind down.", brightForestExplore.bind("seagullnext7"));
		}

		if (which == "seagullnext7") {
			append("After a little clean-up she takes your hand and flies you up to the peak of the hot dog stand mountain.\n\n\"I'd ask you if you wanted to hang out a little,\" she says, \"but you <!i>did<!i> just fuck my face relentlessly for twenty minutes and now I'm sorta attached to you, so, tough luck, we're hanging out whether you wanna or not!\"\n\nYou stretch out with her on a massive striped awning and get to some serious cuddles. The hot dog stand it's attached to is the size of a double-decker bus. The view is foregrounded with rolling garbohills, framed on both sides by leaning trees. Far past the point where the trees shrink and sparse glimmers a flourescent knot of City lights.\n\nYou sort of expect her to start talking about her past or her feelings or at least telling you her name, with the pensive expression she's got, but she just licks a little white from her beak and watches the lights in silence with you.");

			addChoice("...You know, I never got to see that butt up close...", brightForestExplore.bind("seagullnext8"));
		}

		if (which == "seagullnext8") {
			append("\"No~?\"\n\nWith graceful, distinctly avian movements, she slips into your lap. Her butt bumps against your nuts, jiggling them a little, then she pushes her hips back and slides both cheeks up until your cock fits neatly between. \"Close enough for ya~?\"\n\nShe rocks her hips, giving you a feathery, fluffy buttjob. The warm mound of her labia grinds over your nutsack, still saucy in the afterglow, juices revitalizing the semi-dry drool stains she left on your cock.\n\n\"I gotta go,\" she says abruptly, pushing her pucker up to your cocktip and winking it teasingly. \"Promised I'd visit a little bluebird receptionist... Do remind me to sit on your cock properly sometime.\"\n\nYou look over the edge of the awning. There's no path down, just a bunch of boxy jumbled hot dog stands...");

			addChoice("Could you fly me down first?", brightForestExplore.bind("seagullnext9"));
		}

		if (which == "seagullnext9") {
			append("\"What do I look like, a taxi? Just throw yourself down!\"\n\nSlowly, with one last pucker-kiss, she stands up and readies her wings.");
			addChoice("Won't that... hurt...?", brightForestExplore.bind("seagullnext11"));
		}

		if (which == "seagullnext11") {
			data.knownAsPlayer++;
			data.knownImmortality++;
			append("\"You're a player, as I've so politely avoided gushing about. What are you gonna do, cringe at the text on the screen? If you break an arm or whatever, just respawn~!\"\n\nShe flies off towards the City. \"Thanks for the snack! <3\"");

			if (data.knownAsPlayer == 1) addChoice("What.", brightForestExplore.bind("seagullwhat"));

			addChoice("Goddamn goof-off gullgirl... Alright, fine, throw myself down all these broken hot dog stands.", brightForestExplore.bind("seagullnext12"));
		}

		if (which == "seagullwhat") {
			append("You stand around confused.");
			addChoice("Jump off this awning for starters, I guess.", brightForestExplore.bind("seagullnext12"));
		}

		if (which == "seagullnext12") {
			append("You take a running start and eat shit on jagged metal for 30 painful seconds, tumbling and tossing and bouncing ass-over-teakettle until finally you faceplant in the landfill mud sporting six broken bones and a fuckload of mustard stains.");

			addChoice("Cringe at the text on the screen.", brightForestExplore.bind("seagullnext13"));
		}

		if (which == "seagullnext13") {
			data.seagullDone = true;
			append("You, that is, <!b>you<!b>, cringe. But that's just telling <!b>you<!b> what <!b>you<!b> already know.");
			addChoice("Respawn and move along.", brightForestHub);
		}

		if (which == "ExploreCarve") {
			if (!data.treeCarved) {
				var s:MintSprite = addSprite("assets/img/effect/whoreTree.png");
				s.x = 450;
				s.y = GAME_HEIGHT-s.height-100;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Fun fact: Tree butts get their plumpness from the oopy goopy sap stores inside each cheek.");

				append("Something crumbles from a tree up ahead: the last of its bark.\n\nThe tree is now standing bare naked in front of you.");

				addChoice("Carve \"whore\" into it.", brightForestExplore.bind("carvenext"));
				addChoice(
					"Avoid this.",
					function() {
						disableExplorable(36);
						brightForestHub();
					});
			} else {
				append("That tree you fucked earlier has clearly been a bigger slut than ever as of late. Cum, piss, and lipstick stains coat its bare flesh, and beside the WHORE you carved more graffiti is etched:

					SPREAD UR BRANCHES SLUT

							bet this tree doenst even photosynthnthesise
							just soaks up the nutrietnts from all the cum <3

					Guys what the fuck.

							shes down for a root aint she

					Holy shit my dog stops to pee here every day and now I finally know why ITS CAUSE THIS TREE LOVES TO GUZZLE DOG PISS!!!!!");

				disableExplorable(36);
			}
			addChoice("Move along.", brightForestHub);
		}

		if (which == "carvenext") {
			data.treeCarved = true;
			append("You let the tree know it's a filthy whore. The tree gives a little shiver and sap gushes from the letters.");
			addChoice("Taste some.", brightForestExplore.bind("taste some"));
			addChoice("I need to leave.", brightForestHub);
		}

		if (which == "taste some") {
			append("You lick up the tree's sap with lavish strokes of the tongue. It's sweet and gummy.\n\nThe tree blushes harder.");

			addChoice("Fuck the tree.", brightForestExplore.bind("fuck the tree"));
			addChoice("There is no way I would ever fuck this tree.", brightForestHub);
		}

		if (which == "fuck the tree") {
			append("You kind of "+pickByGender("grind and dry hump the tree", "grind yourself against the tree", "grind and dry hump the tree")+". It's really getting worked up now; you can't help but sense it begging for more.");

			addChoice("Spit on the tree. Slap the tree. Knock it around a little.", brightForestExplore.bind("spit on tree"));
			addChoice("This is getting out of hand.", brightForestHub);
		}

		if (which == "spit on tree") {
			append("You get rough with the tree and really show it who's boss. You give it something to soak into its roots alright: a fat glob of spit right in the tree-face.\n\nFuckin' whore tree.");

			addChoice("... Move along.", brightForestHub);
		}

		if (which == "ExploreHovel") {
			unlockJournal("Hovel");
			append("There's a run-down hovel, really no more than a stick hut half-sunken in mud. Passionate snorts come from inside...");

			addChoice("Check it out.", brightForestExplore.bind("hovel"), {kinks: ["Scat", "Male", "Male"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "hovel") {
			append("Inside the hut two fat male boars roll missionary in the mud, curves well-splattered with sweat and muck. The one on the bottom only glances up as you enter, not caring in the slightest that his muddy asscrack is getting pounded with furious depth and ferocity in plain view. In fact, he spreads his legs wide and grunts, putting on a show for you, thick "+(isActive("Candy Ring")?"pie":"shit")+"slop bubbling out past the other's cock.\n\nAs your eyes adjust to the darkness of the hovel, you realize they're lying in a little puddle of trash, making out past a mutual mouthful of "+(isActive("Candy Ring")?"fresh pie":"rotten pie")+".\n\nThere's a coupled discarded garbage bags off to the side.");

			addChoice("Snag those bags.", brightForestExplore.bind("snag bags"), {give: ["Garbage Bag", 2]});
		}

		if (which == "snag bags") {
			append("Neither of the boars seem to mind at all. A family portrait was hiding underneath them. The two boars are dads, you realize, and they have two piggy sons way into mud wrestling. Cute.");
			addChoice("Keep watching.", brightForestExplore.bind("hovel watch"), {kinks: ["Vomit"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "hovel watch") {
			append("The boar on top yanks his cock out. It's coated from tip to base in "+(isActive("Candy Ring")?"pie filling":"sludgy diarrhea")+", a couple "+(isActive("Candy Ring")?"crust ":"")+"chunks rolling down over his heavy nuts. He groans, leaning down to get a fat whiff of it, "+(isActive("Candy Ring")?"licking his lips at the sweet creamy scent":"gagging so hard his stomach gurgles")+".\n\nThe bottom boar wordlessly opens his mouth, grabbing a fistful of "+(isActive("Candy Ring")?"pie":"mud")+" and trash and stuffing it past his lips. The top grabs him roughly by the back of his head and resumes their vicious makeout, clenching his stomach to force out a torrent of "+(isActive("Candy Ring")?"pie":"puke")+" which floods over the bottom's face, into his already packed mouth, up his nose, both frotting with manic passion as thick splurts of "+(isActive("Mood Ring")?getMood("Boars"):"")+"cum erupt between their fat bellies.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreArgument") {
			append("You hear an argument through the bushes ahead.");

			addChoice("Peek.", brightForestExplore.bind("peek"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "peek") {
			append("It's a squat little catboy with pure white fur, wearing nothing but an overlong sweater. ");

			if (onFA()) append("[THIS BOY IS DEFINITELY OF AGE AND THE TERM 'BOY' IS USED HERE TO MEAN A YOUNG CONSENTING ADULT MALE.]")
			else append("Only the lowermost curves of his fat little butt are visible from this angle.");

			append("\n\nHe's arguing with a tall bespectacled dove guy. You can't exactly tell what they're saying, but the dove retorts all sassy and smart, arms crossed, while the kitten articulates his counterpoints with exaggerated sleeve-flopping gestures and petulant whining.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "The Floatillery") {
			TheFloatillery.theFloatillery("explore");
		}

		if (which == "ExploreKemp") {
			append("A trickling river blocks your path. There's something purple floating down...");

			addChoice("Get a closer look.", brightForestExplore.bind("ExploreKempNext"), {kinks: ["Art", "Male"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreKempNext") {
			var foo:String = "nil";
			if (data.metKemp == 0) foo = "a relaxed otter wearing only a beanie";
			if (data.metKemp == 1) foo = "Kemp the otter";
			if (data.metKemp >= 2) foo = "Kemp";

			addSprite("assets/img/effect/kemp.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");
			append("Over the course of a full minute you watch "+foo+" float downstream on his purple inner tube, dragging lazily on a sweetgrass cigarette.\n\nYou wave hello.\n\nHe offers a flaccid \"Bruh.\"");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreGobbo") {
			unlockJournal("Goblin village");
			append("The smell of steamy boiled noodles draws you up a steep trail towards the Violet Meteorite's crater. Suddenly your foot strikes metal.\n\nAn overgrown railroad runs uphill and disappears underneath the meteorite. Built before impact, most likely.\n\nYou follow the noodly scent up onto the peak of the crater, diverting to a fresh-built track once the old one ends in a wall of glittery spacerock. After a couple detours you arrive at a lamplit mining village, stilted vertically off the side of the meteorite.\n\nGargantuan tunes bump from a quaint little club in the town square.");

			addChoice("Follow the noodles.", brightForestExplore.bind("gobbointro"), {kinks: ["Patreon Commission", "Female", "Foodplay"]});
			addChoice("Follow the tunes.", brightForestExplore.bind("gobbogirlintro"), {kinks: ["Patreon Commission", "Female"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "gobbogirlintro") {
			data.bfGobboVillage = true;
			playSound("assets/audio/music/gobboClub", "gobboClub", {loops: 99});
			msg("<!img:kink/Music.png> Music: High Fructose Ass Syrup — by Wronger", true);

			append("You come across a club overflowing with naked, green-skinned goblins, all gyrating together in an orgy out front which barely meets the definition of a line. A muscled, I-wear-my-sunglasses-at-night gobbo bouncer tests each for entry with a brutal face-fuck, letting them in if they can work their throat hard enough to make him cum and sending them straight to the back of the line if they can't.\n\nHe waves you down. \"Yo, customer magnet. You can skip the line. Go fuck somebody on the stage or something. Drinks ain't free though.\"");

			addChoice("Head inside.", function() { stopChannel("gobboClub"); brightForestExplore("gobbogirl1"); });
			addChoice("Go follow the noodle scent instead.", function() { stopChannel("gobboClub"); brightForestExplore("gobbointro"); }, {kinks: ["Patreon Commission", "Female", "Foodplay"]});
			addChoice("Move along.", function() { stopChannel("gobboClub"); brightForestHub(); });
		}

		if (which == "gobbogirl1") {
			data.gobboInflated = false;
			playSound("assets/audio/environment/caveDoor");

			append("You squeeze into the club, which is surprisingly less of an orgy. Sure there are a couple gobs fucking each other to the beat, but mostly they're actually dancing, grinding, their sweat-slick tits and asses appearing frozen in time mid-jiggle by intermittent flashes of a strobe. Liquor flows everywhere— a couple girls gather round a keg inflating their buttmeat, shoving hoses up their puckers and cranking the nozzles to HIGH (you marvel at goblin physiology); strippers no older than 18 take abuse from whoever happens to climb onstage, fuzzy-handcuffed to their poles; winged nymphs and birds from up higher on the meteorite nuzzle in the rafters, dripping "+(isActive("Mood Ring")?getMood():"")+"cum on the crowd below.\n\nYou accidentally body-check a punk goblin stripper just finishing up her shift. She and her beer go flying, the dance floor now even stickier than it already was.\n\nShe clambers to her hands and knees and glares at you through her emo bangs, pointing a butt way too fat for her little teen body directly at your face.\n\nShe gets up.\n\nNo she doesn't need a hand, thank you very much.");

			addChoice(
				"Shit. Sorry. Let me buy you a drink.",
				brightForestExplore.bind("gobbogirldrink"),
				{cost: ["Capsule", 5], kinks: ["Hyper"]}
			);
			addChoice("Watch where you're going, buttslut.", brightForestExplore.bind("gobbogirlslut"));
			addChoice("Sorry!", brightForestExplore.bind("gobbogirl2"));
		}

		if (which == "gobbogirldrink") {
			data.gobboInflated = true;

			append("You rush over to the bar and order the fanciest beer you can find— Floatillery Craft Beer— then rush back. She's already cleaned up, and now she's just standing and staring, sudsy hands on her hips.\n\nWithout a word she swipes that craft beer, cracks it, and chugs. It literally goes straight to her hips: they fatten out to the size of basketballs. \"Goblin physiology,\" she says, bouncing her cheeks with a few fingers, repositioning the new mass up over her stomach, ballooning both tits, then squeezing them hard to send it right back down. \"So you gonna give me a <!i>real<!i> apology or what here?\"");

			addChoice("I already said sorry.", brightForestExplore.bind("gobbogirl2"));
		}

		if (which == "gobbogirlslut") {
			append("\"That easy to tell?\" she scoffs, dusting her asscheeks off and making them jiggle for at least five full seconds.\n\nShe steps closer, bare toes sending ripples through the spilled beer. \"So where's your apology?\"");

			addChoice("Soooorry.", brightForestExplore.bind("gobbogirl2"));
		}

		if (which == "gobbogirl2") {
			append("\"Sorry doesn't cut it.\" she says, jabbing a finger into your chest. \"I want my ass fucked.\"");

			if (data.hasCunt) addChoice("Uh... I don't have a cock.", brightForestExplore.bind("gobbogirlcunt"))
			else addChoice("You drive a hard bargain kid.", brightForestExplore.bind("gobbogirl3"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "gobbogirlcunt") {
			append("\"Oh.\" She blushes, looks down at your smooth puss, clearly wondering how she missed it. \"You uh... you got a... a vag down there, do you?... Yeah, well... I don't... even like those...\"\n\nShe runs away, ass knocking over chunks of the crowd.");

			addChoice("Go find whoever was cookin those noodles. ", brightForestExplore.bind("gobbointro"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "gobbogirl3") {
			append("Her fingers wrap around your bulge, working your cock to life through the fabric. \"Yes,\" she says. \"Drive... hard...\"\n\nShe digs two fingers between her asscheeks and grinds the tips against her pucker as a warmup. Two gobbo girls on their way to the bar stop and watch for a sec, their own fingers wandering downward...");

			addChoice("I wanna fuck you on stage.", brightForestExplore.bind("gobbogirlstage"));
			addChoice("Let's get some privacy... bathroom stall?", brightForestExplore.bind("gobbogirlstall"));
		}

		if (which == "gobbogirlstage") {
			data.gobboStage = true;
			append("You pull her up on stage— \"Didn't your shift just end?\" one of her coworkers asks— and bend her over in front of everyone, hotdogging hard enough to swing her tits in wide circles. The crowd goes crazy at the sight of "+data.playerName+" above your head, reaching up to try and brush even a finger across your cock or nuts. Most give up after a bit and settle for groping the gobbogirl, stuffing fingers in her mouth, yanking her tits, spitting on her~\n\n");

			if (data.gobboInflated) append("Her cheeks are so voluminous that simply hotdogging them feels like fucking a hole, and the <!i>schlicks<!i> of your shaft muffled deep in her assmeat could totally pass for the sound of anal. If you grab her hips and squish inward you can even cover your cock entirely— then the only non-visual cue that you aren't actually assfucking her is the periodic twitches of her pucker as it slides over your cock's underside.");

			addChoice("Buttfuck.", brightForestExplore.bind("gobbogirl4"));
		}

		if (which == "gobbogirlstall") {
			data.gobboStage = false;
			append("You topple into a Men's stall hot and messy, craning to kiss over her shoulder, your cock smearing pre up and down her crack. She uses the same fingers she was massaging her hole with two seconds ago to flick the lock shut, leaving a few drops of sweat on the metal, and brings them right back down to yank a cheek aside for you.\n\n");

			if (data.gobboInflated) append("It doesn't work. Her ass is just too fat with the added weight of the beer you bought her— every time she tries to peel a cheek away her sweaty gobbobuttock just slides out and claps right back into place. With a sigh she settles for digging two fingers deep between her crease and peace-signing over her pucker like it's a pussy.");

			addChoice("Buttfuck.", brightForestExplore.bind("gobbogirl4"));
		}

		if (which == "gobbogirl4") {
			var location:String = "";
			var location2:String = "";
			var location3:String = "";
			var inflation:String = "";
			var choice:String = "";

			if (data.gobboStage) {
				location = " past another goblin's fingers";
				location2 = "Hands shoot up everywhere in the audience; most to cheer you on, but some to throw cum balloon condoms which pop and splatter over her face and tits. \"HEY!\" she barks, and gets a fat splash of cum in her mouth as reward";
				location3 = "You really are a customer magnet. The crowd is twice as thick now, dozens of hands and a couple cocks grinding over her ahegao face. Despite the growing species diversity, they all chant the same thing: \"Cum! Cum! Cum!\"";
				choice = "Give the people what they want.";
			} else {
				location = ", grabbing the toilet basin";
				location2 = "With a <!i>fwip<!i> her hand slips from the basin and scrabbles at the graffiti'd tile wall, her chin replacing it as the assfuck pushes her down and forward";
				location3 = "You catch a scrawled half-sentence of graffiti between the fingers of her other hand, the one still scrabbling pointlessly along the bathroom wall: <!i>... stripper with a punk hairdo ...<!i>";
				choice = "Read that graffiti out loud while I cum, wouldja~?";
			}

			if (data.gobboInflated) inflation = " constantly quaking, basically giving your cock a cheekjob whenever it slips outside. Those and the ones on her face burn";

			append("\"Well, what are you waiting for?\" she says"+location+". \"I want that cock up myaaAAAhhh~!\"\n\nRight then you line your head up to her pucker and slam inside as deep as you can. "+location2+".\n\nYou grab a fistful of dyed-black hair and start ploughing the fuck outta the little teen, both cheeks"+inflation+" bright red. She's struggling to take your dick or find anything to hold onto, her legs all weak and shivery as they try to keep that juicy butt aloft. She doesn't even have the strength to help out and push back a little; just trying to keep from cumming already consumes her entire attention— she slaps a hand over the mound of her cunt, juices leaking through the cracks between her fingers, as if trying to physically hold in her orgasm.\n\n"+location3+".");
			addChoice(choice, brightForestExplore.bind("gobbogirl5"));
		}

		if (which == "gobbogirl5") {
			var location:String = "up against the wall. She reads through high-pitched warbles: \"...P... PSA guys... there's a stripper with a punk hairdo who l-loves anal at this place, she'll do a-anything for a buttfuck...\"";
			var location2:String = "toiletbowl";
			var inflation:String = "";

			if (data.gobboStage) {
				location = "halfway over the edge of the stage. Her biggest fans (all girls) are waiting right there to plug her throat with an 8-inch dildo, while others drag their mouths over her exposed neck, her tits, slurping up the splattered cum.";
				location2 = "stage";
			}

			if (data.gobboInflated) inflation = ". You hang your head with deep relief, staring at her ass; those hyper-huge buttcheeks both took a serious beating. There are two veritcal red patches where your thighs were banging into them, contrasting nicely with the flow of "+(isActive("Mood Ring")?getMood("You"):"pure-white ")+"cumglobs down her crack";

			append("\n\n\"Hnnn... hnnn... slow down, slow down! Apology accepted!!!\"\n\nYour last few thrusts are hard enough to send her sprawling "+location+"\n\nHer hand cannot, in fact, hold in her orgasm; it comes rippling through her body toes-to-nosetip either way, spraying past her fingers and over the "+location2+". You hold the final thrust at its deepest point and keep her spasms under control with two hands on her waist, enjoying the deep interior quivers as they milk spurt after spurt from your cock"+inflation+".\n\nTogether you ride the lazy afterglow. Your fingers wander down to her inner thighs of their own accord and scoop up some cum, then, without letting too much of it drip away, they wander back up and pop past her lips. At first she just tolerates that, then actively sucks them clean, then starts using her own fingers to clean more up; but mostly she just squeezes her ass tight and absorbs your load into her body, using it to inflate her tits by few cup sizes.\n\n\"Gublin physhioloshy~\" she says past cummy digits.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "gobbointro") {
			append("A goblin mom blinks at you from her window, olive-skinned, long-eared, wide-eyed. She slurps a single noodle right the fuck up and runs out of frame.\n\nHer front door flies open and smacks a few bolts loose against the meteoric rock. She rushes outside, hips swinging around with each stride, curvy and smooth-skinned like the rest of her body, and as she nears you start to make out the bulbous lips of her cunt glimmering (wet already) in the lamplight.\n\nShe skids to a stop, panting just from that short sprint. Her amber bob spills from its ponytail and covers half her face. She slaps both hands onto her knees and takes a huge breather, boobs squishing up inside the only thing she's wearing— a lacy bra. You can easily see the bulges of her nipples past the thin black fabric.\n\n\"Making... spaghetti...\" she pants, and her uncovered eye flicks up to you. She exhales hugely, sticking her fat green butt out a little in the process. \"... Could use... "+pickByGenitals("some alfredo sauce", "some oil", "some alfredo sauce... or a little oil")+"~\"");

			if (data.hasCunt || data.hasBoth) addChoice("Oil?", function(){data.gobboCum = false; brightForestExplore("gobbo1");});
			if (data.hasCock || data.hasBoth) addChoice("Alfredo?", function(){data.gobboCum = true; brightForestExplore("gobbo1");});

			addChoice("Move along.", brightForestHub);
		}

		if (which == "gobbo1") {
			var foo:String = "nil";
			var bar:String = "nil";
			if (data.gobboCum) {
				foo = "cock";
				bar = "cum";
			} else {
				foo = "puss";
				bar = "squirt";
			}
			append("She coughs and points to your "+foo+".\n\n\"Your, uh... well, basically, I want you to "+bar+" in my spaghetti.\"");

			addChoice("Sounds like a plan.", brightForestExplore.bind("gobbo2"));
			addChoice("J"+(data.myntJenga?"enga":"esus")+", lady.", brightForestExplore.bind("gobbo2a"));
		}

		if (which == "gobbo2a") {
			append("She puts both hands on her ample hips. \"Well, look, do you wanna get your "+(data.gobboCum?"dick":"cunt")+" sucked or not?");

			addChoice("Sure, but at what cost?", brightForestExplore.bind("gobbo2aa"));
			addChoice("Nah, I'm good.", brightForestHub);
		}

		if (which == "gobbo2aa") {
			append("She grabs your hand and pulls you inside. \"You don't have to <!i>eat<!i> any. Goodness... what kind of host would I be, stuffing cummy noodles in your mouth?\"");

			addChoice("Well alright.", brightForestExplore.bind("gobbo3"));
		}

		if (which == "gobbo2") {
			append("\"That's the spirit,\" she says, one hand closing on your wrist. She pulls you back to her warm little house, giving you a wonderful view of her fat, swaying hips as reward for your enthusiasm.");

			addChoice("Mmm.", brightForestExplore.bind("gobbo3"));
		}

		if (which == "gobbo3") {
			append("You don't even realize you're inside until the door closes behind you. The goblin MILF bends down to tighten a couple of the threaded bolts she knocked loose in her excitement, asscheeks peeling apart to show off a smooth little mound and a soft, sunken pucker. \"One twist... two twists... three twists... four twists... five twists... six... seven... eight... nine... ten... eleven... twelllllve... thirteeeeeeeeeeeen...\"\n\nShe's smirking at you over her shoulder, gyrating a little with each turn.");

			var foo:String = "nil";
			if (data.gobboCum) foo = "dick" else foo = "puss";
			addChoice("Okay you can slurp my "+foo+" now.", brightForestExplore.bind("gobbosuck1"));
		}

		if (which == "gobbosuck1") {
			if (data.gobboCum) {
				temp.a = "slit";
				temp.b = "feed a couple inches of cock past her puffy lips";
			} else {
				temp.a = "folds";
				temp.b = "wrap her puffy lips sideways around your labia";
			}
			append("\"Oh I can, can I?\"\n\nShe cranks the last bolt way too tight, assmuscles bulging with the effort, then stands with a lazy stretch and takes her sweet old time pulling a pot of noodles half her size off the stove with one hand and casually carrying it back over to you. \"It's not like I work out or anything,\" she says, and winks. \"But no, seriously, I'm lazy as fuck. This—\" she demonstrates by lifting the pot like it's nothing— \"has got to do with liquids and goblin physiology annnd... ah, I'll show you later.\"\n\nShe slams the pot down in front of you and kneels around it, her vulva inches from the hot metal. The steam licks along your bare skin and coats your crotch with a film of sparkly wet condensation. With one hand on your thigh she pushes you to the wall, leans over, and nuzzles her little upturned gobbo nose along your "+temp.a+". \n\nNext she slips a few fingers up between your cheeks, smearing the slick noodle-dew around, and yanks your hips forward to "+temp.b+".\n\n\"Now...\" she says, mouth full, and her muscles tense. \"You probably want to savour this... but I'm hungry.\"");

			addChoice(":3", function() {data.gobboReserved = false; brightForestExplore("gobbosuck2");});
			addChoice(":x", function() {data.gobboReserved = true; brightForestExplore("gobbosuck2");});
		}

		if (which == "gobbosuck2") {
			if (!data.gobboReserved) {
				temp.a = "You shoot her a playful little feline smile, sending her into immediate overdrive; with one swift movement she ";
			} else {
				temp.a = "You hold your tongue, but you wish she'd take it slow.\n\nThe goblin rolls her eyes and un-tenses, tummy growling. ";
			}
			if (data.gobboCum) {
				temp.ba = "swallows your entire cock, the hoops in her floppy gobbo ears jingling with the force. Her fat lips work and wriggle around your base, long tongue darting out to lick the steam from your nuts.";
				temp.bb = "She shows some heavy restraint not swallowing your cock to the base right at that moment; you can almost feel the self control radiating from her with every tiny contraction of her throat, every muted near-moan. After several slow bobs of her head and a nice long tongue massage over your own, the little MILF exhaustedly allows herself to flop forward, throat bulging with your cockmeat and nose pressed firm to your lower stomach.";
			} else {
				temp.ba = "drives her entire tongue up your puss, the hoops in her floppy gobbo ears jingling with the force. She combos that by launching into a rough tonguefuck, snaking her long licker around in such a way that it always drags against your clit, working the little nub around in tight circles.";
				temp.bb = "She shows some heavy restraint not driving her tongue as deep as it can possibly go right at that moment; you can almost feel the self control in its sloppy, dragging movements, each only barely pushing inside your cunt before she eases off and distracts herself by lavishing more attention over your clit. After fighting the urge to devour your pussy for several minutes she finally starts pushing inside, her burning pink eyes locked to yours, tugging your lips open with a thumb on either side... and... carefully... bit...by...bit... she feeds her long... long.... long... goblin tongue... allllllllll.......... the way inside~";
			}
			append(temp.a);
			if (data.gobboReserved) append(temp.bb) else append(temp.ba);

			addChoice("... Cum.", brightForestExplore.bind("gobbosuck3"));
		}

		if (which == "gobbosuck3") {
			if (data.gobboCum) {
				cumEffect();
				append("You grab her by both floppy ears and start bouncing her face against your crotch as you cum, her tits and assmeat rippling with each impact~ Most of it she chugs, at first, tensing her throat hard and giving a cummy gurgle whenever you bottom out, but as her cheeks start to blue she tears from your grip and gasps for breath. "+(isActive("Mood Ring")?getMood("You"):"Toasty ")+"cum pours in languid dribbles from her mouth and your cockhead, both streams mingling in the mess of shiny noodles below.");
			} else {
				append("You grab her by both floppy ears and start grinding her face against your crotch as you cum, your juices pit-pattering out over her freckled tits. She swallows most of it at first, then with some effort pulls her mouth off and opens wide as if catching raindrops, tongue-out, shimmering strands of oil and saliva still connecting her lips. The last gushes coat her face, clinging in tiny beads to her eyelashes, and dribble down off her chin into the mess of shiny noodles below.");
			}

			append("\n\nAfter all that she simply slumps forward and hugs the pot, panting and drooling with her chin on the rim. \"That was... really nice...\"\n\nOnce she's recovered she gets shakily to her feet, moves the pot to the table, and runs a hand over her bulging stomach with a smirk.\n\n\"Wanna see a magic trick? Check it, goblin physiology...\"");

			addChoice("Check it.", brightForestExplore.bind("gobbosuck4"), {kinks: ["Hyper"]});
			addChoice("I think I'm gonna head out. Thanks!", brightForestHub);
		}

		if (which == "gobbosuck4") {
			if (data.gobboCum) {
				temp.a = "cum";
			} else {
				temp.a = "oil";
			}

			append("You check her hand as it presses harder and harder. She turns to give you a nice side-view as the round, "+temp.a+"-slick curve of her belly flattens under the pressure. \"Now you see it...\" she says, and takes her hand off with a flourish. Her stomach stays flat. \"Now you don't.\"\n\nWithin seconds her ass begins to widen. She grunts, winces, your "+temp.a+" clearly rushing through her insides. \"Agh... and... now you do again~\"\n\nHer hips inflate to bimbonic proportions as she groans and runs her hands over them. She takes a wide stance to keep her balance under all the shifting weight, muscles twitching. \"We can use liquids—\" she pauses to grab a chair, squeezing her tits a little smaller with her free hand and transferring even more mass downstairs \"— we can use them as... oh, muscle mass, basically... or fat~\"\n\nShe wiggles a little in her chair, asscheeks spilling over the sides, and fixes herself a sloppy bowl of noodles, slurping noisily and filling her bubbly butt out even more. There's an extra bowl, you notice, and you're about to sit down— then the door opens behind you.");

			addChoice("Turn.", brightForestExplore.bind("gobbosuck5"));
		}

		if (which == "gobbosuck5") {
			if (data.gobboCum) temp.a = "cummy" else temp.a = "juicy";

			append("Her daughter's in the doorway, a punk little gob with emo hair. She looks from you to her mom and back again. \"I'm... home...\"\n\nMom freezes. A "+temp.a+" noodle still hangs from her mouth.\n\nHer daughter peers into the pot with a sour expression. The MILF scrambles to her feet, hands out, trying desperately to balance her gargantuan hips at the same time as she squeakily explains: \"I only added a little bit!\"\n\nThe goblin girl spins away melodramatically. \"AGAIN, MOM?!\"\n\n\"Just a couple squirts. They were needy.\"\n\n(Actually <!i>you<!i> were, you say under your breath.)\n\n\"I SAID I WANTED TOMATO SAUCE TONIGHT! GOD! DON'T YOU EVER <!b>LISTEN<!b> TO ME?\"");

			addChoice("Next lol.", brightForestExplore.bind("gobbosuck6"));
		}

		if (which == "gobbosuck6") {
			append("<!14px>\"But honey,\" she says, wincing, \""+pickByGender("he's", "she's", "they've")+" only just started playing, and I was so hungry, and you said you'd be out dancing, so, you see, I figured it'd be alright if I <!i>slippified<!i> them a little, you know how I love when my noodles go down smoo—\"\n\nThe goblin girl interrupts with \"UGH!\" and sheds all her stuff on the floor for her mom to clean up, rushing up to her room in tears.\n\n\"I HATE YOU! I'M RUNNING AWAY!!! I'M NEVER GONNA EAT CUMMY NOODLES AGAIN!!!!!!!!\n<!14px><!24px>EVER!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\"<!24px><!14px>\n\n\"For fuck's sake,\" mom sighs, then begins the long process of hauling her jiggly ass upstairs.<!14px>");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreOwlGirl") {
			disablePause();
			append("A flash of white across the sky draws your eye. For once, it isn't a cumshot from a feral owl in the trees, but the body of a snowy anthro owlgirl and her two friends racing in the skies over the tiny ocean.");

			addChoice("Who's winning?", brightForestExplore.bind("owlgirl2"));
		}

		if (which == "owlgirl2") {
			append("She is!\n\nIt's a fierce race, though. The smooth avian curves of their tits and asses ripple in the winds at that extreme altitude. Her friends, a dove and a seagull, they have white feathers too, and sometimes all three of them blur into one supersonic threesome. The strategy is almost like Mario Kart, because last place is the perfect position to get ahead; her friends might just like each other a bit too much, but it seems like they keep intentionally slipping behind just to reach forward and sink a couple feathery fingers up the 2nd-placer's cunt or ass, not only distracting them (and drawing out a startled little squawk) but yanking them backward for a quick lead.\n\nThe owlgirl doesn't mind their squabble. She just surges ahead, all confident and predatory. You wonder how many feral mice have poked their heads out from the nest only to see her streaking down through the canopy at that speed, wings out, screeching.\n\nOh no. It really is like Mario Kart. There's a huge obstacle up ahead: a massive, dripping-cyan cloud.");

			addChoice("Hm??", brightForestExplore.bind("owlgirl3"));
		}

		if (which == "owlgirl3") {
			halfWidthText();
			data.owlGirlSeen = true;
			enablePause();
			append("The owlgirl doesn't see it in time. She's going too fast... she puts on the brakes at the last second, screaming, twisting her head and shoulders away— as if the direction she faces can change her momentum— and then the cloud swallows her.\n\nHer friends unplug from each other and narrowly manage to swerve off to either side. Now they're screaming, but the owl has stopped.\n\nShe comes out the other side trailing condensation from the tips of her limp wings.\n\nShe plummets.\n\nOn the way down, cubic chunks of her body detach themselves, cutting and pasting back in seemingly at random. Every chunk seeps through with cyan.");

			addChoice("Go help?!", brightForestExplore.bind("owlgirl4"));
			addChoice("... Move along.", brightForestHub);
			var s:MintSprite = addSprite("assets/img/effect/owlGirl.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			s.applyGlitchEffect();
		}

		if (which == "owlgirl4") {
			append("Someone already is.\n\n"+(data.metSom>0?"Som has already detached from the Floatillery in a little wooden rowboat":"A rowboat with a little lamb inside it has already detached from the Floatillery")+".\n\nHe's not rowing like a tenderfoot paramedic eager to save her life, but slower, more detached, like an old mortician. He makes no gestures to the girl's friends, who are flying around in aimless, panicked circles.\n\nThere's nothing you can do but watch him. The boat becomes a brown speck in the distance. It nudges up against the bobbing white speck of the owlgirl.\n\nFor a moment it looks like he's hauled her into the boat... but then she begins to rise, searing with a cyan outline, and soars off into the night.");
			addChoice("... Move along.", brightForestHub);
		}

		if (which == "ExploreGlowbunny") {
			quickMynt("Glowbunny");
			unlockJournal("Glowbunny1");
			data.glowbunnyDone = true;
			append("Alright... so...\n\nYou've been wandering alone for hours. You only ran into traces of wildlife or wild sex. But now, deep down an overgrown trail, with the scragglescrub encroaching on your ankles...\n\nYou find her eyes between the trees.\n\nShe's watching you.\n\nThose two blue pinpricks of light bob closer at an unnatural pace. Feral bunnies aren't built to move at speeds between a slow plod designed for grass nibbling and an all-out sprint designed for escape. Anthro bunnies have similar legs, so the same should be true for them.\n\nBut this bunny isn't plodding slowly or sprinting for you; from the sound of her foot-thumps and from the sight of her bobbing eyelights, she's moving at a quick \"jog\" with a series of detached, twitchy hops. Now that she's infected, she doesn't seem used to her own feet anymore. <!i>Thump-thump-thump. Thump-thump-thump.<!i>\n\nShe stops, ten feet away. Her eyes glow cyan through the bushes.\n\nShe leaps.\n\n<!i>THUMP.<!i>");
			addChoice("Stay calm.", brightForestExplore.bind("glowbunny0"), {kinks: ["Plot"]});
			addChoice("Move right along.", brightForestHub, {toolTip: "This will lock you out of content."});
		}

		if (which == "glowbunny0") {
			halfWidthText();
			append("She lands before you, sniffing.");
			addChoice("Fuck... her...?", brightForestExplore.bind("glowbunny1"));
			Theme.addUiChoice("enginetic");
			addChoice("Leave now.", brightForestHub);
			addSprite("assets/img/effect/glowBunny.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
		}

		if (which == "glowbunny1") {
			halfWidthText();
			append("You attempt to seduce her with a few sensual "+pickByGenitals("dickwaggles and a squeeze of your nuts", "twitches of your exposed cunt", "dickwaggles and a squeeze of your nuts")+". For a moment she seems interested in the drop of "+pickByGenitals("pre", "juice", "pre")+" that leaks from you— but that must've only been a random twitch.\n\nA reedy lapine snarl curls out from the pit of her throat.\n\nShe lunges at you.");
			addSprite("assets/img/effect/glowBunny.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			addChoice("Oh jeez run.", brightForestExplore.bind("glowbunny2"));
		}

		if (which == "glowbunny2") {
		    append("The bunny drop-kicks your knees out with both powerful hind legs. No running for you.\n\nShe closes her blunt buck teeth around your throat, pierces your jugular, then tears it out with one dainty nibble.");
			addChoice("Respawn?!", brightForestExplore.bind("glowbunny3"));
		}

		if (which == "glowbunny3") {
		    append("You respawn maybe twenty feet away from her— fuck!— she's already lost interest in your old body and now she's lunging for you again— this is getting out of control.\n\nYou firmly decide to move along <!i>right now.<!i>");
			addChoice("Well... stick around for a couple more respawns at least...", brightForestExplore.bind("glowbunny4"), {kinks: ["Raunch", "Raunch", "Raunch", "Snuff", "Plot"]});
			addChoice("Move along.", brightForestExplore.bind("glowbunnyearlyleave"));
		}

		if (which == "glowbunnyearlyleave") {
		    append("Shit, it's not as easy as it usually is.\n\nYou throw yourself through bushes and vault over boulders with your arms out behind you for optimal aerodynamics. Some nymph calls you a \"gay anime\" and his buddy says \"uh oh we got a speedrunner!\" but you just keep running and tell them to fuck off over your shoulder. Also, whenever you're about to bash your face off a tree trunk, you dodge to the side instead and swing around the trunk with one outstretched arm to redirect your momentum.\n\nYour impeccable aerodynamics make zero difference. With those jacked lapine legs of hers, she has no problem kicking off the same trunks for even quicker 90-degree turns, and every time you look behind your shoulder, she's there, two feet closer, four feet, practically always airborne from some leap or vault, almost flying through the undergrowth, steamy breath puffing from her nostrils like a white dragon with its blue eyes burning in the night.\n\nFinally you burst through the treeline out onto a sloped road. It's all rough except a smooth, sunken set of tiretracks. You pick the right side and sprint inside it. This way you don't have to slow down and watch for rocks or other tripperies. Your heels pound craters into the dirt. You glance over your shoulder.\n\nShe's gone.\n\nYou keep running.\n\nBut where is she?\n\nYou just keep running.\n\nWhy would she avoid the road?\n\nNo, you can't stop and think about this. You have to—\n\nThe tracks pull off left, into "+(data.bfcampClean?"the campsite you cleaned up earlier":"a messy campsite")+", and your toe hits the lip.\n\nYou stumble.\n\nIn midair, with your arms wheeling and your feet bending at awkward angles, you feel her breath on the back of your neck. Its stale, fungal stench sears your nose. You can almost imagine spores taking root between your nostrilhairs.\n\nShe was on your ass the whole time, hidden in the treeline!!! She goes in for another kill!!");
			addChoice("Punch her in the face!!", brightForestExplore.bind("glowbunnyearlyleave2"));
		}

		if (which == "glowbunnyearlyleave2") {
			playSound("assets/audio/environment/tranq", "tranq");
			setChannelVolume("tranq", 0.1);
		    append("<!i>CRACK.<!i>\n\nYou bust her snout in.\n\n... She blinks twice. Her arms shoot out and quiver, tensed at odd angles. Her maw, hung with cyan drooldrops, poised to close around your face... it just flops closed.\n\nShe... passes out at your feet, you think. It's hard to tell if she's faking or not. The shrooms are flickering harder than ever, and when they flicker near a muscle, that muscle tenses up and twitches...");
			addChoice("Examine damage to her cranium area.", brightForestExplore.bind("glowbunnyfinddart"));
		}

		if (which == "glowbunnyfinddart") {
		    append("... Oh. You didn't concuss her.\n\nThere's a green sleep dart lodged in the back of her neck. It's a dead shot to the brain stem.");
			addChoice("... Who shot that?", brightForestExplore.bind("glowbunnyfindshooter"));
		}

		if (which == "glowbunnyfindshooter") {
			makeSmallButtons();
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/johnAndLana.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH-s.width*1.05;
				s.y = GAME_HEIGHT-s.height-55;
		    append("The L.L.L. Field Research Van has pulled up down the road.\n\n"+(data.metJohn>0?"John":"A dog dude")+" slips out from the driver's seat and speed-jogs dorkishly over to you, lab coat trailing in the mud. He's way too ecstatic to care. Seems like he can't decide whether to beam at you or the bunny, so he keeps looking back and forth, ears flopping. "+(data.metLana>0?"Lana the turtlenecked fox librarian":"A little fox boy in a turtleneck")+" hops out the passenger-side window, slings his tranquilizer sniper rifle over his back, and follows "+(data.metJohn>0?"John":"the dog")+" close behind. Both of them take care to avoid the ridge you tripped on.\n\n\"Ho there!"+(data.metJohn>0?"\" John hails you.":"\" I'm John,\" says the dog, \"and this is Lana.\"")+"\n\n"+(data.metLana>0?"The fox boy pulls a nameplate out of his collar with a glitchy paw: <!i>LANA.<!i>.":"Lana nods at you seriously."));
		    data.metLana++;
		    data.metJohn++;
			addChoice("Hey thanks guys, I thought I was gonna get forced into a vore scene there.", brightForestExplore.bind("glowbunnyLLL"));
			addChoice("HEY YOU PRICKS! YOU RUINED MY VORE SCENE!", brightForestExplore.bind("glowbunnyLLLvore"));
		}

		if (which == "glowbunnyLLLvore") {
		    append("Lana yanks a notepad from John's coat and scribbles a message for you with frustrated, paper-creasing strokes:\n\n<!i>Infection persists after respawn, dumbass. You were in real danger.<!i>\n\n\"Lana,\" John reproaches gently, after craning like a goof to read a notepad that's facing away from him. He plucks it back from the boy's glitched grasp. \"Don't be rude. Sorry about ruining your vore scene, "+(data.johnGWizard?"G. Wizard.":data.playerName)+". We're 99% sure it's not classic zombie rules. One bite, even tons of bites, that doesn't seem to do it. The infection spreads somehow else.\"");
			addChoice("Better make it up to me sometime. ;3", brightForestExplore.bind("glowbunnyLLLvore2"));
			if (data.knownGlowbunnyLube) addChoice("It's alright I guess... just a shame is all... she was pretty hungry for my ass...", brightForestExplore.bind("glowbunnyLLL"));
		}

		if (which == "glowbunnyLLLvore2") {
		    append("\"Not me,\" he says, blushing painfully.\n\nOn the other hand, Lana winks at you and chomps his little fox teeth together, mouthing \"HARD.\"");
			addChoice("Goodness me.", brightForestExplore.bind("glowbunnyLLL"));
		}

		if (which == "glowbunnyLLL") {
		    append("John whips out a notepad from nowhere. \"Now, was she really trying to eat you?\"\n\nLana pulls a starchy straitjacket from <!i>somewhere<!i>, definitely, but it's hard to follow his glitchy paws— by the time your eyes catch up with them, he's already started the tedious process of unfolding the little square of white fabric and distangling its straps and rings.");
			addChoice("Definitely.", brightForestExplore.bind("glowbunnyLLL2"));
			if (data.knownGlowbunnyLube) addChoice("More like swallow?", brightForestExplore.bind("glowbunnyLLL2"));
		}

		if (which == "glowbunnyLLL2") {
		    append("John doesn't scribble anything on the notepad, he just flicks a neat tally down beside an existing sentence. \"I'm not surprised. She's famous for this. Six reports of it before yours. We've seen whole hands coated in glowjuice, down to the wrist. Feet riddled with nibble marks. She even deepthroated Kemp's fat otter tail while he was passed out ass-up on the riverbank with his inner tube in the sand. Of course, half the things Kemp reports are folklore: feral chimeras, blood-drenched direwolves in red cloaks, grassy ghouls...\"\n\nSomething darts out of the bushes behind him and grabs his ass.\n\nHe spins around in a flash. Two mischevious nymphlets scurry away in a rush of giggles, boners flapping. \"Nice, man!\" says the one in hiding, pulling his friend along. \"That's the 5,082nd butt. Only 1,887 to go!\"\n\n\"HEY!\" John barks, \"THAT'S SEXUAL HARASSMENT!\"\n\nInstead of yelling at nymphs or rambling about otters, Lana is actually working. The rifle hangs heavy on his little back, but he's on his hands and knees anyway, preparing the straitjacket and ignoring both of you. He sticks his butt out without a care for who grabs it.");
			addChoice("Watch Lana.", brightForestExplore.bind("glowbunnyLLL2a"));
		}

		if (which == "glowbunnyLLL2a") {
		    append("First he checks for frays or tears in the straitjacket, then he tests the buckles, hook, loops. He pulls a comfortable undershirt out from an inner pocket and slips it gently over the bunny's flat chest. He flips her belly-down and closes the jacket around her mossy shoulder blades with four straps and buckles tugged taut. The sleeves go on. Her limp arms cross through a big central loop on her chest, then the sleeve ends meet around her back and Lana tightens them into place.\n\nThen it's time for the pelvic strap. Lana reaches down and peels her thighs apart, hardly minding the mud as it squishes out between them... maybe even getting a little aroused by it, from the look of the bulge in his lower turtleneck. He runs a few fingers over her pussy, clearing out a handful of mushrooms, which he casually pockets. There's no rape in it. You guess he just doesn't want them to chafe her during the drive.\n\n\"All good?\" John asks rhetorically, after he's done with his silent, personal freak-out over the nymphs. He tugs at each strap on the straitjacket and holds a floppy ear to her mouth, to check that her breathing is still fine. You guess Lana usually does these up too tightly.\n\nLana pushes John out of his way and starts dragging your zombunny back to the van, carefully guiding her head around the bigger rocks.");
			addChoice("Wait, where are you taking her?", brightForestExplore.bind("glowbunnyLLLwhere"));
			addChoice("So can I get a quickie here or like...?", brightForestExplore.bind("glowbunnyLLLfuck"));
			addChoice("Welp. You look like you got this under control. I'm gonna go wander.", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLwhere") {
		    append("\""+(getPlace("L.L.L.")!=null?"Back where we met,\" John says. \"":"")+"The L.L.L. Big confusing mess of bookshelves and tents and vans. It's mostly medical roleplay fanatics, but if you do have a genuine interest in science or stories, that's where you go.\"\n\nLana makes a little 'A' with his fingers, after some effort.\n\nJohn deflates. \"And... yeah. We're owned by the Apothecary, so you can always ask them for directions if you really need to. Not that they're paying us to be out here hunting zombunnies. We do this garbage on our own time. In fact, mostly they want us to stay on upkeep and learn as little about the world as we possibly can.\"");
		    addChoice("What kind of place is the Apothecary?", brightForestExplore.bind("glowbunnyLLLapo"));
			addChoice("So can I get a quickie here or like...?", brightForestExplore.bind("glowbunnyLLLfuck"));
			addChoice("I see I see. Well, I better split.", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLapo") {
		    append("John's tail swishes back and forth. He fidgets with his notepad.\n\n\"They wouldn't want me to share that information with you.\"\n\nLana rolls his eyes.\n\nJohn looks hurt. \"What? I value my job. "+(data.johnGWizard?"G. Wiz":data.playerName)+" will meet some staff soon enough, if "+pickByGender("he follows", "she follows", "they follow")+" us after this.\"");
			addChoice("Gotcha. So can I get a quickie here or like...?", brightForestExplore.bind("glowbunnyLLLfuck"));
			addChoice("Hmmmmmmmmmalright I better go. You nerds are giving me the yawns.", brightForestExplore.bind("glowbunnyLLLyawn"));
		}

		if (which == "glowbunnyLLLyawn") {
		    append("\"I told you we were boring,\" John hisses to Lana.\n\nLana flips you the bird with one paw and flings the bunny into the van's padded back with the other.");
			addChoice("Nah, I just gotta find me another girl. You stole mine. :/", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck") {
		    append("John clears his throat and moseys awkwardly back to the van, facing you. He's got his paws in the lab coat, trying to look cool, but he keeps bumping the back of his shoes on rocks or divots in the road.\n\n\"Well, uh, I'm not like that— but Lana might hook you up.\"\n\n... Lana flashes you a thumbs-up (at least you think that's what his paw is trying to do) and hoists the bunny up into the van's padded back with herculean ease before slamming the doors shut.\n\nHe flexes at you.");
			addChoice("Oh hell yeah. Those paws'll mess me up...", brightForestExplore.bind("glowbunnyLLLfuck2"), {kinks: ["Cub", "Male", "Abuse"]});
			addChoice("Ahhhh not really my thing...", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck2") {
			var s:MintSprite = addSprite("assets/img/effect/lana.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");
				s.x = GAME_WIDTH-s.width*1.1;
				s.y = GAME_HEIGHT-s.height-80;
			halfWidthText();
		    append("He strikes a pose like a bodybuilder.\n\n\"I think he wants to beat you up,\" John mutters. He gets back into the car and pulls out a booklet titled <!i>Apothecary Moving Procedures: Where You'll Fit Inside Our Building.<!i> \"Just let me know when you two are done.\"");
			addChoice("Bring it.", brightForestExplore.bind("glowbunnyLLLfuck3"));
			addChoice("Actually nvm.", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck3") {
		    append("Lana walks forward, careful and calm, his covered cocklet swaying back and forth.\n\nThe moment he's within range, he drives a tiny fist right into your "+pickByGenitals("crotch, crushing your nuts and winding", "bellybutton and winds", "crotch, crushing your nuts and winding")+" you. You crumple to your knees in the mud, gasping for breath and squeezing your thighs together pitifully.\n\nHe does not punch like a little boy. In fact, the unnatural strength behind such a tiny surface area of fist makes impact feel more like a gunshot wound. Shivers skitter through your body, radiating from the growing welt.\n\nHe winds back again.");
			addChoice("Flinch.", brightForestExplore.bind("glowbunnyLLLfuck4"));
			addChoice("Wind down.", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck4") {
		    append("You flinch like a little bitch.\n\nHe smirks. That's all he wanted. Now you see his foreplay technique, and indeed, the technique all cub doms must employ to be successful: first, he makes his sub understand exactly how bad he can hurt them, despite how cute and small he is. Then he holds back and teases the rest of it.\n\nLana's fist comes rushing forward and stops inches from your brow. His glitchy little knuckles roll over you, your nose and eyes and forehead. He's giving you a nougie to the face, pushing and twisting hard, testing to see which spot needs breaking the most.\n\nHis other paw, relaxed at his side, beckons you. You get the message:\n\n<!i>Beg for it.<!i>");
			addChoice("Please hit me again.", brightForestExplore.bind("glowbunnyLLLfuck5"));
			addChoice("Wind down.", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck5") {
		    append("Before more than 'Please' has left your mouth, pain explodes over your face. Your head snaps back, and your vision sways with canopy and stars. You see an arch of blood splurt from your nose and hang in the air in the moment before you collapse down onto your back in the dirt and feel his little feetpaws begin to stomp down mercilessly on your "+pickByGenitals("exposed cock", "cuntlips", "exposed cock")+". You try and curl up into a ball to protect yourself, instinctively, but one more punch to the chin sends you flying back into a sprawl again.\n\nYou gurgle like an idiot in the mud. Your jaw creaks. You try to turn onto your side for a moment and catch a kick to the side of the thigh as reward.\n\nSome time passes. Not sure how much. At some point you feel the throbbing of a little nutsack as it grinds against your sore, welted face.\n\nFinally, instead of more pain, angelic warmth alights upon your "+pickByGenitals("bruised dick, your swollen nuts", "sore, puffy cuntlips", "dick, your swollen nuts")+". After getting beaten and stomped into the ground for what felt like hours, you can only imagine this as a golden, upturned pot suspended in the air by clouds of pure benevolence, and from it, in your mind, you see oopy goopy globs of glossy pink healing honey stretching down lazily and drizzling hot, viscous happiness over your groin, drop by drop.\n\nYou finally gather enough courage to crane your head up and look.\n\nLana's already gone, waiting in the van. He's wiping the blood from his toesies.\n\nIt's John between your legs now, your grim paramedic. He's got a little green syringe poked into your crotch. That must be the healing honey he's squirting into you drop by drop.\n\n\"Sorry I'm going so slow,\" he says. \"Need to be careful with the dosage. Too much of this and it'll kill you. I wasn't sure if you wanted to respawn or not... your face looks a li†tle painful, too... might just want to get a new one.\"");
			addChoice("Fuck no. No respawns. I gotta wear these badges. That was great.", brightForestExplore.bind("glowbunnyLLLfuck6"));
			addChoice("Yes please.", brightForestExplore.bind("glowbunnyLLLfuck6a"), {kinks: ["Snuff"]});
		}

		if (which == "glowbunnyLLLfuck6") {
		    append("John unplugs the syringe and tucks it away in his coat. He helps you to your feet, since your torso is a little numb just now. \"I'll never understand you people, but hey— I'm happy you're happy.\"");
			addChoice(":D", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLfuck6a") {
			highEffect(1000);
		    append("John nods and pumps the syringe down all the way. \"Just going to overdose you, then. Count to five with me. One... two... three... foooooooo...\"\n\nBefore he can finish, a sparkling warmth floods up from your "+pickByGenitals("cock", "pussy", "cock")+" and curls around the pit of your stomach. Suddenly you can't breathe. Your lungs refuse to expand or contract. You're trapped with half a stale breath leaking out your lips. With your face slumped down over your shoulder, eye-level parallel to the long gray bridge of your arm, you try twitching your right pointer finger. It seems so far away, on the other side of the bridge. It only makes sense that you couldn't move it from all the way inside your head.\n\nThat's funny, you think to yourself.\n\nFuzzy gray darkness folds over you.");
			addChoice("Respawn.", brightForestExplore.bind("glowbunnyLLLfuck7"));
		}

		if (which == "glowbunnyLLLfuck7") {
		    append("You respawn. John politely drags your corpse into the bushes and leaves it there for the local feral predators to enjoy. Hopefully some little bugs might make a nice home of it, too. Only your head is left poking out of the bushes. Your old face still has a dopey smile on it.\n\n\"There now,\" John says, not looking at you. \"You had your quickie.\"");
			addChoice("Yeah... man what just happened...", brightForestExplore.bind("glowbunnyLLLend"));
		}

		if (which == "glowbunnyLLLend") {
		    append("John slides halfway into the driver's seat, feet facing out the open door. One paw rests on the inside handle. \"Anyway... come visit us in the City if you want to follow our investigation,\" he says, \"Although we may have moved by then. Lots of things are about to change! This is the first non-feral, non-plant host that we've ever caught. And she's... uh... she's a bit too valuable for the L.L.L. to handle.\"\n\nHe waves from behind his rolled-up window and waits for Lana, who struggles to haul his little body up into the passanger seat. Finally you catch sight of his little foxy ears and tail poking up above the windshield.\n\nJohn pulls his seatbelt on. Lana doesn't.\n\nThe L.L.L. van growls to life.");
		    addChoice("Hey wait.", brightForestExplore.bind("glowbunnyRide"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "glowbunnyRide") {
		    append("John cranks his window down.\n\n\"Yeah?\"");
		    addChoice("Can I ride in the back with my bunny?", brightForestExplore.bind("glowbunnyRide2"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "glowbunnyRide2") {
			data.glowbunnyHidingInBack = true;
		    append("John looks over at Lana and back.\n\n\"Well, sure. Shouldn't be dangerous anymore. She'll be sleeping for a while. But if she wakes up, just bang on the connecting window and Lana will put another dart in her, alright?\"");
		    addChoice("Alright.", brightForestExplore.bind("glowbunnyRide3"));
		    addChoice("HELL YEAH ROAD TRIP", brightForestExplore.bind("glowbunnyRide3"));
		}

		if (which == "glowbunnyRide3") {
		    append("John yanks a lever that looks like it was mickey-moused into the dashboard by a mechanic with unsteady paws. The van's back doors pop open.\n\nThe inside is stained with dark blues and purples and other the crusty memories of glow-specimens from past hauls. At the very back, slumped in an uncomfortable chin-on-chest position, the zombunny snores and leaks blue drool on her straitjacket.\n\nYou climb in and shut the back doors behind you. Lana nods, unsmiling, through the reinforced plexiglass window.");
		    addChoice("Next.", brightForestExplore.bind("glowbunnyRide4"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRide4") {
		    append("John hits an upward slope. The engine howls like an animal in pain.\n\nThe floor tilts down and sends the bunny sliding conveniently towards your legs.");
		    addChoice("Lavish a big wet loving smooch on her face.", brightForestExplore.bind("glowbunnyRideKiss"));
		    if (data.hasCock || data.hasBoth) addChoice("Rape the bunny.", brightForestExplore.bind("glowbunnyRideRape"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideRape") {
			setLocation("Roxelle's Farm");
		    append("You kneel to the rumbly steel floor and catch her with your cock. Her "+(data.glowbunnyProlapsedCunt?"greasy cuntmeat balloon":data.glowbunnyProlapsedAss?"greasy assmeat balloon":"cunt")+" splits open to accept your length.\n\nYou clutch at her hips. You shiver. The floor vibrates viciously against your "+pickByGenitals("nuts", "how did you get to this scene without a cock", "nuts and cuntlips")+".\n\n"+(data.glowbunnyProlapsedCunt?"You reach down and grope her sloppy, loose womb, jerking yourself off with it. ":data.glowbunnyProlapsedAss?"You reach down and grope her sloppy, loose assmeat, jerking yourself off with it while flecks of shit slide down over your blurry balls. ":"")+"You push your dick in further and slide it up between her relaxed muscle walls.\n\nThere's something adorable about the way her upper body flops around so lazily as you start piping her down against the floor, something truly fantasic about the way your cock pops mushrooms inside her lower belly and lights her up from the inside with delightfully stimulating bursts of electricity. Riding in the back of a glowstained van with an unconscious killer zombunny didn't seem very cute or romantic to you, at first, but the more you hump her limp lips open"+(data.glowbunnyProlapsedCunt?", the harder you yank on her prolapsed cunt, ":data.glowbunnyProlapsedAss?", the harder you yank on her rotten anal prolapse, ":", ")+"the more intimate this rape starts to feel.");
		    addChoice("Kiss her.", brightForestExplore.bind("glowbunnyRideKiss"));
		    if (data.glowbunnyProlapsedCunt || data.glowbunnyProlapsedAss) addChoice("Romantically rape her prolapse back inside.", brightForestExplore.bind("glowbunnyRideInside"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideInside") {
		    append("You pull out all the way with a wet little <!i>schlup<!i> and start beating her sloppy rapesock of a"+(data.glowbunnyProlapsedCunt?" uterus":data.glowbunnyProlapsedAss?"n ass":"n ass")+" back where it belongs. You swoon under your breath: golly, my darling, you're such a fucking lapsewhore for letting me rip your insides out as easily as I did earlier this evening, aren't you? Yes, you purr in her ear, your hips pounding back and forth hard enough to force "+(data.glowbunnyProlapsedCunt?"cunt":data.glowbunnyProlapsedAss?"ass":"ass")+"juice out in drips that roll ticklishly down your nutsack. Yes, that's it. It's time we tucked your ugly little sock back in.\n\nBy the time you're done, her "+(data.glowbunnyProlapsedCunt?" cuntlips":data.glowbunnyProlapsedAss?"asshole":"asshole")+" is bright red and puffy from all that loving abuse. The folds of her prolapse are still visible, if you yank her hole open with both hands and peek inside, but too many peeks and her inner meat is liable to fall out again, so you take it easy and just rape her "+(data.glowbunnyProlapsedCunt?"ass":data.glowbunnyProlapsedAss?"cunt":"cunt")+" for a change of pace.");
		    data.glowbunnyProlapsedCunt = false;
		    data.glowbunnyProlapsedAss = false;
		    addChoice("Kiss her.", brightForestExplore.bind("glowbunnyRideKiss"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideKiss") {
			setLocation("Red's Cottage");
		    append("You wrap both arms around her back, just above her tied straitjacket sleeves, and lean in for a sweet peck on the maw. It's just hanging open, of course, so your peck ends up more like a tongue-sucking session. That's it, you whisper into her, keep your mouth open, let me see the back of your throat.\n\nYour romantic kiss moves up, over her cold button bunnynose, over her fluttering, drooped eyelids. You grab her skull with both hands and violently suck her slack, unconscious face, violating it, raping her mouth with your tongue while she can't protest or fight back. At one point you peel her lips open wide with both hands and dive in to abuse her uvula directly with your tongue, and she tenses up with cute wet gags and coughs in her sleep, flooding your mouth with hot saliva, but instead of stopping or letting her clear her throat you just call her a gross little slut and reach down to "+(data.glowbunnyProlapsedCunt?"squeeze and grope her prolapsed womb":data.glowbunnyProlapsedAss?"squeeze and grope her prolapsed ass":"tug and pinch her clit")+" like it's just a squishy toy.");
		    addChoice("Next.", brightForestExplore.bind("glowbunnyRideNext"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideNext") {
			setLocation("The Floatillery");
		    append("The wheels whine along a sandy road. Neon blues from the Floatillery's sign and orange torchlight from a procession of distillery workers soak through the windows. For a moment, half of her shapely sleeping body is fire and the other half is ice, and the spitstains on her dumb drooling face look more like proud constellatory badges of rapeability than mere ugly and kinda stinky smears.");
		    addChoice("Next. x3", brightForestExplore.bind("glowbunnyRideNext2"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideNext2") {
			setLocation("Junk City");
		    append("You roll up to Junk City's border patrol. The owl behind the counter speaks harshly and gestures at Lana a lot. Lana just stares at him with blank, contemptuous disbelief.\n\nJohn flashes his Septricard and says one word. The owl shuts up and lets the van through.\n\nThe bunny snores.");
		    addChoice("Finish on her face.", brightForestExplore.bind("glowbunnyRideNext3"));
		    addChoice("Oh oh, make her wave hi!", brightForestExplore.bind("glowbunnyRideHi"), {kinks: ["Abuse"]});
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideHi") {
		    append("You haul her up by her crotch and flop her around like a puppet, waving to the owl and everyone else in eyeshot through the van's back windows. Duhhhhhh, durrrr, hulllooo, you mock her, driving your fingers up her cunt as hard as you can and smearing her stupid face up against the window with the palm of your free hand— duhhhrrr, I'm a dumb bunny bimbo, I like "+(data.glowbunnyProlapsedCunt?"getting my cuntmeat yanked out and molested":data.glowbunnyProlapsedAss?"getting my asshole unplugged and molested":"it when "+data.playerName+" fingerfucks my pussy open")+", guhduuuuuuuurrrrrrrrrrrr~\n\n... Lana's watching longingly from the passenger seat.");
		    addChoice("Finish on her face.", brightForestExplore.bind("glowbunnyRideNext3"));
			addChoice("Skip to the destination.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideNext3") {
			setLocation("Snagglebank");
		    append("You squat down over her helpless sleepy expression and blast it with "+pickByGenitals("your cum", "a jet of cuntjuice", "your cum")+(data.glowbunnyProlapsedCunt?" whilst reaching down and jerking off her prolapsed womb like it's a cock":data.glowbunnyProlapsedAss?" whilst reaching down and jerking off her prolapsed tube of assmeat like it's a cock":"")+". She keeps her mouth open like a good tranquilized rapetoy. Your "+(isActive("Mood Ring")?getMood("You"):"thick ")+pickByGenitals("cum", "girlcum", "cum and cuntslime")+" pools inside.\n\nJust before it overflows and spills all over her, you reach down and massage her throat with two careful fingers, coaxing the muscles into swallowing your load. She coughs and gags and HRRRKs on it a little, but in the end she chugs it down.");
		    addChoice("Next.", brightForestExplore.bind("glowbunnyRideEnd"));
		}

		if (which == "glowbunnyRideEnd") {
			setLocation("L.L.L.");
		    append("The van stops.\n\nJohn and Lana get out.");
		    addChoice("Climb out.", brightForestExplore.bind("glowbunnyRideEndLeave"), {kinks: ["Plot"]});
			addChoice("Stay inside and listen. (Skip)", brightForestExplore.bind("glowbunnyRideEndListen"));
		}

		if (which == "glowbunnyRideEndLeave") {
			data.glowbunnyHidingInBack = false;
		    append("You open the back doors and get blasted in the face by exhaust from a hundred white vans and trucks.\n\nHuge convoys stretch into the distance. The entirety of the L.L.L. is getting ready to pack up and leave. Anything bolted down has been stripped clean and, in most cases, smashed into little pieces.\n\n\"This city is all about recycling,\" John explains, coming up behind you with a platonic smack on the butt. \"Partly, cityfolk have a love for violence because of the need to break down all their junk and repurpose it into more homes, sex toys, or whatever else is in demand. Usually sex toys.\"\n\nA ways down the line you spot Lana using his unnaturally powerful paws to just beat the absolute fuck out of any bolted-down structure labelled <!i>Apothecary<!i> that he can find.\n\n\"I wanted to thank you,\" John says, clapping you on the shoulder, \"for distracting that infected bunny. Now that we've captured her, we can finally put this place to rest.\"");
			addChoice("You're shutting down the library?", LLL.libraryExplore.bind("glowbunny1"), {kinks: ["Plot"]});
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (which == "glowbunnyRideEndListen") {
			disablePause();
			data.glowbunnyLLLStarted;
		    append("At first you only hear the bunny breathing.\n\nThen a drone distinguishes itself from the background noise: hundreds of engines idling, just like the van's.");
		    addChoice("Keep listening.", brightForestExplore.bind("glowbunnyRideEndListen2"));
		}

		if (which == "glowbunnyRideEndListen2") {
		    append("A group of engines revs and pulls away.");
		    addChoice("Keep listening.", brightForestExplore.bind("glowbunnyRideEndListen3"));
		}

		if (which == "glowbunnyRideEndListen3") {
		    append("Another group does the same.\n\nJohn is talking to someone just outside the back doors. You catch a fragment:\n\n\"... Well, she said... the bunny tests at the Apothecary now...\"");
		    addChoice("Keep listening.", brightForestExplore.bind("glowbunnyRideEndListen4"));
		}

		if (which == "glowbunnyRideEndListen4") {
		    append("All the other trucks and vans have left now. You hear one limousine engine in the distance. It's just silence and some mumbles from John.\n\nThen you hear eight distinct, synchronized sets of footsteps approaching.");
		    addChoice("... Peek.", brightForestExplore.bind("glowbunnyRideEndListen5"));
		}

		if (which == "glowbunnyRideEndListen5") {
			enablePause();
		    append("John stands protectively over Lana.\n\nHe says nothing, of course, but his face says \"Try me.\"\n\nEight Apothecary staff members surround them. Up close you notice they're all sexually augmented: huge tits, asses, and a set of cocks big enough to strain the fabric of their white pants even while flaccid... Each one wears a ballcap pulled down over their eyes and a grin wide enough to let some drool leak out the cracks at the side of their botox lips.\n\n\"Now fellas,\" John says, holding his arms out and stepping in front of Lana. \"He got the bunny for you, didn't he? It was a dead shot, too. We can let him go.\"\n\n\"Direct orders,\" says one of the Apothecary staff.\n\nThey all take out tranquilizer pistols.");
		    addChoice("Get out and run.", LLL.libraryExplore.bind("glowbunny4"));
		}

		if (which == "glowbunny4") {
		    append("Alright, but... you really don't know what this bunny's deal is.\n\nYou <!i>firmly<!i> decide to move along at the first sign of serious, game-integrity-threatening behaviour.");
			addChoice("Right. Well. Offer myself up to her in complete submission and try to figure out what her deal is.", brightForestExplore.bind("glowbunny5"));
		}

		if (which == "glowbunny5") {
		    append("You stand still, arms out wide, chin up, and wait for her to attack.\n\nShe tackles you to the mud and opens her maw... but it doesn't close on your throat this time. Instead, she takes one of your wrists, clumsily, like a child posing a doll... and pops a few of your fingers in her mouth.\n\nThousands of their sensitive nerve endings prickle with repulsed titillation. Inside her sucking maw, vegetation threads between the bridges of your fingers: bumpy clusters of mushrooms, sickeningly thin strands of moss. Her seedy saliva tickles as it drips down your wrist.\n\n... Then her lips sink lower, and lower, and she has to take half your fist to the back of her overgrown throat before she realizes she can't swallow you this way.\n\nSo she pulls off. But she's changed, now that you're cooperating: her eyes are wide and curious, and all her aggression has evaporated.");
			addChoice("Are you trying to rape me...?", brightForestExplore.bind("glowbunny6"));
		}

		if (which == "glowbunny6") {
		    append("She has you pinned to the ground. If she wanted to violate you, your "+pickByGenitals("ass", "cunt", "ass")+" would already be open.\n\nShe deliberates. You're calm, so she's calm, and she knows she can take her time and sniff every crevice of your body, drooling all over you in the process. Now and then she'll pop a toe in her mouth, and once she even tries sucking on the end of your nose, but she always gives up once she gets far down enough.\n\nShe screeches in your face, feral and frustrated, coating your wince with flying strands of cyan saliva.");
			addChoice("Go ahead and wipe that gunk off my face.", brightForestExplore.bind("glowbunny6a"));
			addChoice("Keep my mouth open wide and swallow as much as I can.", brightForestExplore.bind("glowbunny6b"));

		}

		if (which == "glowbunny6a") {
		    append("You wipe the bunnydrool off, not thinking much of it—\n\nBut she makes a wet, guttural complaint, choked by flora, and spits on your face again. She smears it in good, too, and smushes her paw roughly over your features.\n\nThis goes on for some time. Now and then she grunts under her breath, mumbling to herself like a fingerpainting artist.");
			addChoice("She's trying to lube me up!!", brightForestExplore.bind("glowbunny7"));
		}

		if (which == "glowbunny6b") {
		    append("You guzzle all that hot bunnydrool up, licking some off your lips and cheeks and nose—\n\nBut she makes a wet, guttural complaint, choked by flora, and stuffs your tongue back in your mouth with a few shroomy digits. She spits on your face again and smears it in good this time, too, smushing her paw roughly over your features.\n\nThis goes on for some time. Now and then she grunts under her breath, mumbling to herself, like a fingerpainting artist.");
			addChoice("She's trying to lube me up!!", brightForestExplore.bind("glowbunny7"));
		}

		if (which == "glowbunny7") {
			data.knownGlowbunnyLube = true;
		    append("Oh shit, you think you might be right. Such a fascinating, majestic creature, you muse to yourself, while she grunts like a monkey and crams her fingers in her mouth to collect more drool. What could cause this behaviour?\n\nOops. You pontificated a little too hard for a moment there. During your brief moment of distraction she twitched into an entirely different position and slammed her hips down over your face, flattening your skull to the dirt.\n\nNow she's pushing her swollen, glowjuice-slick cunt up over your nose and lips. The seal's tight. All you can smell is the heady stench of long-unwashed bunnycunt, and some undertones of chocolate-coated watermelon.");
		    addChoice("Play along and suck some juice outta her.", brightForestExplore.bind("glowbunny8"));
			addChoice("Chocolate-coated watermelon?", function(){ append("\n\n(That's what glowjuice smells like.)"); }, {oneTime: true});
		}

		if (which == "glowbunny8") {
		    append("Her cunt throbs reflexively and rewards your gentle suckles with two mouthfuls of rotten-sweet glowjuice, dispensed through a stream of heady spume over the course of five minutes.\n\nIf you crane your eyes up, halfway into your head, you can just barely catch a glimpse of her robotic expression; she looks like she's just doing her job. You guess only her cuntmuscles remember what it was like to get eaten out.\n\nThe more you suck and slobber, the looser her lips feel. You're starting to wonder how tight they were to begin with, before she got infected. Every push of your tongue detaches another strand of moss or another glowshroom root that had kept them crusted tightly together on the inside.\n\nIt's a kind of gross organic satisfaction, like picking a scab. Heck, after a bit, you even find yourself <!i>searching<!i> for those strands of plant matter, ramming deep inside her and snapping as many as you can in each lick— not only for the satisfaction of it, but in order to search even deeper and snap even more next time, in order to wiggle your tongue in just one more half-inch... eating her pussy is like a positive gameplay loop.");
		    addChoice("Reach inside her and pull all that gross stuff out. <3", brightForestExplore.bind("glowbunny9pull"), {kinks: ["Raunch", "Prolapse"]});
		    if (!isActive("Candy Ring")) addChoice("Move down to her ass.", brightForestExplore.bind("glowbunny9ass"), {kinks: ["Scat", "Raunch", "Prolapse"]});
		    addChoice("Move along.", brightForestExplore.bind("glowbunnypreleave"));
		}

		if (which == "glowbunnypreleave") {
		    append("Okay, but... she's not going to be happy about it.\n\nYou scramble to your feet and bolt.");
		    addChoice("Next?", brightForestExplore.bind("glowbunnyearlyleave"));
		}

		if (which == "glowbunny9pull") {
		    append("You tuck two fingers between her folds. She doesn't seem to mind, as long as some crushed shroomjuice splurts onto your face and more hidden plant life slides down her tunnel. Fuck, you can even slip a whole fist in here, easy. She's all loose and stringy. It's like reaching inside a pumpkin. You curl your grip around strands and seeds and buds and bulbs and stems, all of it oily with thick rabbit cuntslime, and then... slowly... biting your lip a little and shivering despite your intense revulsion... you start to pull.\n\nHer whole body locks up. Her head snaps down to glare at you. Her outer mushrooms pulse with agitation. <!i>Why are you uprooting my wombgarden?<!i> her eyes seem to demand. There is no answer you could give her. You're in too deep now. Your only choice is to—");
		    addChoice("Yank! >:3", brightForestExplore.bind("glowbunny9pull2"));
		}

		if (which == "glowbunny9pull2") {
			data.glowbunnyProlapsedCunt = true;
		    append("Some roots strain and snap. Others hold miraculously strong.\n\nWith one brutal yank you dislodge her entire womb, a sloppy wad of overgrown bunnymeat. As it curls inside-out, chunks of rotted flora scatter everywhere amid clumps of moss like hair from a drain, and you realize she really was pregnant with a tiny ecosystem.\n\nShe screeches again, pissed, and slams her hips back down on top of you. You writhe and choke and gurgle helplessly as her prolapsed cunt smushes against your face, still leaking with its own isolated arousal. Hot juice seeps up your nose and in your eyes. Pretty little cyan wombflowers dissolve into petals with the friction of her frantic back-and-forth hip thrusts. Only once she's soaked every part of your head— even behind your ears!— only then does she let off and stand up, three feet of meat and vegetation swaying in the breeze between her thighs.");
		    addChoice("Holy fuck. Just catch my breath.", brightForestExplore.bind("glowbunny9puke"));
		}

		if (which == "glowbunny9ass") {
		    append("Before things go too far in this direction, you wiggle down a bit lower and peel her asscheeks open.\n\n... She really is feral. At least, she doesn't know how to wash or wipe her ass anymore. It's crusted over with weeks-old shitsmears, which coincidentally provide the perfect fertilizer for a whole colony of mushrooms. You have to scrape them off with your fingers before you can even get a look at her hole.\n\nIt's half-open and drooling little bunny shits almost constantly. You never noticed them because they all got gummed up in her buttshrooms. The sound and smell remind you of the way a clogged sewage pipe might splutter helplessly when it tries to expel too big or too sludgy a load.");
			addChoice("Press on her belly and open my mouth.", brightForestExplore.bind("glowbunny9assopen"));
			addChoice("Reach in and unclog that ass.", brightForestExplore.bind("glowbunny9asspull"));
		}

		if (which == "glowbunny9assopen") {
		    append("She's nervous. She doesn't like you reaching around to her belly. Every time you try to push down on it, she wiggles back, which happens to nuzzle her asscheeks deeper around either side of your face.\n\nEventually you get her to trust you a bit— by pulling off for a moment to show her how your face is getting drenched with sloppy blue-brown shitslime. That calms her down. No matter what you do, it seems she's always happy to see that you're more lubed up.\n\nWith her wiggling minimized, you can open your mouth wide and steady and hold your lips to her swollen pucker while you push. The massage starts slow and firm. Just a few rubs and some gentle pressure. Then you give it a little more gumption and <!i>push, push, push<!i> her smooth bunnyfur down in a circular rhythm designed to nauseate.\n\nBefore long her asshole begins to pooch out a bit. The fat ring quivers and expands inside your mouth, and its constant flow of liquid shit becomes more than a dribble, more than a stream, until it's a soft, chunky torrent, which quickly coats your tongue and drizzles over your chin.\n\nThen the true blockage appears. It's a shitlog with the circumfrence of a coke can and a length yet unknown. It explodes out of her and gapes the squishy inner expanse of her asscheeks open, stretching her crack until it's merely a divot between them, and forces itself so fast and hard downward that it pulls half of her inner tunnel with it.\n\nShe grunts and complains and yanks your hand off her belly but it's too late, way too late—\n\nThe log sinks right down your throat and connects the two of you, bulging your esophagus romantically. The sound of it spluttering and crackling raises goosebumps on your throatflesh. Besides tasting like shit, its flavor invokes the vivid image of a rotten salad left out in the wild for days, a well-tossed mix of mud and grass and glowberry guts all sauced up in diarrhea dressing and hot feral piss.\n\nAll you can do is sit there in the forest dirt and take it. It's pointless to even try and swallow; your muscles can't contract hard enough to dent the firm, compacted shit. You can't chew it either. Whenever you bring your jaws down (to try and break it up and stop the next five inches from slipping down your throat like the last fifteen just did) your molars are met with spongy, tenuous roots and crusty stems, pieces of vegetation born and grown and suffocated by the folds of this bunny's ass. Doing anything besides keeping your mouth and throat open wide like a toiletbowl rewards you with jaw pain and a healthy layer of shit smushed up between your teeth and along your gums.\n\nHer thighs ripple with tension. Miraculously, after twenty constipated inches, she pinches it off.\n\nShe looks over her shoulder with intense confusion at the fat, disgusting, shit-stained prolapse that now hangs between her cheeks. She toys with it, curious. She doesn't even spare a glance at your blue face, and her ears are definitively keen only to the sound of her own assmeat as it flops around all wet and squishy between her fingers. She's deaf to the much louder and much more urgent noises you're making: the gagging, the choking, the needy little gurgles. You look and sound like you just swallowed a baseball bat.");
			addChoice("Chew, swallow, chew, swallow. Just work through it.", brightForestExplore.bind("glowbunny9assrecover"));
		}

		if (which == "glowbunny9asspull") {
		    append("You drive a hand up her ass hard enough to hurt, but it doesn't hurt her. She only looks back over her shoulder with numb confusion and annoyance.\n\nWith her tentative blessing, you curl and uncurl your fingers, feeling the squishy log deform around them and seep under your nails like rotten cookie dough. You kinda tug and squeeze it like an udder, and your wrist floods over with hot brown shit and cool blue shroomjuice.\n\nShe doesn't seem to mind, as long as you're getting wet somehow. You reach a little deeper, yanking at the roots of the log. She's all loose and stringy. It's like reaching inside a pumpkin. Although things are getting a bit oily now, you manage to get your grip around a fistful of roots and stems, and then... slowly... biting your lip a little and shivering despite your intense revulsion... you start to pull.\n\nWith a colossal shiver of involuntary relief she squats down and allows you to dislodge about half of her shitlog in one mighty yank. Flecks of shit and flora coat your body and her inner thighs. Fuck, half of it is still hanging from her hole, fat and dripping. You have to two-hand it to finally get it all out, and half her ass comes with it.");
			addChoice("Whew.", brightForestExplore.bind("glowbunny9assrecover"));
		}

		if (which == "glowbunny9assrecover") {
			data.glowbunnyProlapsedAss = true;
		    append("You work through the next few minutes with careful patience. Your lower body is coated with buttsludge and glowjuice now. She chitters in your face at the sight of how wet you are downstairs, floppy wet leaves flying from her mouth, and then she starts feeling you up to determine if any part has been left un-lubed...");
			addChoice("Catch my breath.", brightForestExplore.bind("glowbunny9puke"));
		}

		if (which == "glowbunny9puke") {
		    append("You cough up a clump of greasy leaves and breathe in, deep. You're about to close your eyes, block out all this bizarre, eye-searing glow, and just relax for a moment.\n\nBut she twitches.\n\nHer posture has changed. She's squatting now, with her fat lapsy-doodle kissing the mud.\n\nHer throat tenses, tenses, tenses...");
		    addChoice("Keep my mouth wide open.", brightForestExplore.bind("glowbunny9puke2"), {kinks: ["Vomit"]});
		    addChoice("Uh oh. Evasive roll away.", brightForestExplore.bind("glowbunny9pukeavoid"));
		}

		if (which == "glowbunny9puke2") {
			if (isActive("Candy Ring")) {
				halfWidthText();
				var s:MintSprite = addSprite("assets/img/effect/fruitSalad.png");
				s.x = GAME_WIDTH-s.width*1.2;
				s.y = GAME_HEIGHT-s.height-110;
				s.onReleaseOnce = function() {
					playSound("assets/audio/environment/pearClick");
					tween(s, {scaleX: 0, scaleY: 0}, 0.1, {onComplete: function() {
						s.destroy();
						playSound("assets/audio/secret/fruitSalad");
					}});
				}
			}
		    append("You close your eyes and open your mouth. You don't need sight to know what's happening. You let your other senses take the focus for once.\n\nYou hear the murmur of trees tickled by wind, the burble of a distant creek, the chirps and clicks of night bugs socializing. True tranquility.\n\nThen you hear a violent little burping gag from the pit of the bunny's throat followed by the kind of sound a blackout drunk makes while they hug the toilet after their belly's dry: the sound of an eye-watering dry heave. But her heaves don't stay dry. Oh fuck no.\n\nThe next dry heave cracks like a dam halfway through and "+(isActive("Candy Ring")?"cool, refreshing glowfruit salad chunks bounce":"hot bunnypuke splatters")+" over your face, into your open mouth. You chew and swallow like "+(isActive("Candy Ring")?"you're on a diet":"a good pukebucket")+" (as best you can, anyway, given some of the "+(isActive("Candy Ring")?"more delectable fruits that come out":"tougher vegetation in her diet")+") and, eyes still closed, you simply listen to "+(isActive("Candy Ring")?"Fruit Salad Yummy Yummy echoing through your head. Fresh, totally intact pieces of glowmelon, glowberry, glownanas, they all cascade":"spicy gurgles rippling through her throatmuscles as they clench and twist to expel every little morsel of food. Saucy strings of bile lace")+" over your "+(data.hasBoobs?"bare tits":"flat chest")+". "+(isActive("Candy Ring")?"Bright-colored sugary fruitjuice soaks":"Beige sludge globs soak")+" into your hair. "+(isActive("Candy Ring")?"":"Rotten, half-digested feral meat sticks on your cheeks and lips. You guess she forgot she was a herbivore, too.")+"\n\nBy the time she really is dry heaving on an empty belly, only a few patches on your lower back are left uncoated with some form of glowjuice or another.\n\nShe leans over you"+(isActive("Candy Ring")?"":", bile strands swinging from her maw")+". She smears more blue goop around your body, testing for dryness. There must be a place left un-lubed... yes, she realizes: two small patches on your lower back. She aims to cover them too.\n\n(Hey heads up this is exactly what I meant by game-integrity-threatening behaviour, she's obviously doing some arcane shit that will probably break you forever. You should fuck off right now.)");
		    addChoice("Should I...?", brightForestExplore.bind("glowbunny10"));
		}

		if (which == "glowbunny9pukeavoid") {
		    append("You do a sleek roll to the right. Thankfully, her imminent "+(isActive("Candy Ring")?"gift of a juicy fruit salad flies jubilantly from her maw and":"projectile-puke")+" misses you entirely."+(Math.random()>0.8?"\n\nThis game's combat system is truly soulslike.":"")+"\n\nShe's pissed that you would <!i>avoid<!i> more lube. She stomps towards you"+(isActive("Candy Ring")?"":", bile strands swinging from her maw")+". Upon impact she smears more blue goop around your body, testing for any dry spots. There must be a place left un-lubed... yes, she realizes: two small patches on your lower back. She aims to cover them too.\n\n(Hey heads up this is exactly what I meant by game-integrity-threatening behaviour, she's obviously doing some arcane shit that will probably break you forever. You should fuck off right now.)");
			addChoice("Should I...?", brightForestExplore.bind("glowbunny10"));
		}

		if (which == "glowbunny10") {
		    append("Absolutely.\n\nIt's pretty obvious that she's been trying to infect you this whole time.\n\nYou might not be able to respawn out of that.\n\nYou <!b>FIRMLY<!b> decide to move along <!b>RIGHT NOW.<!b>");
		    addChoice("Aww... but...", brightForestExplore.bind("glowbunny11"));
		    addChoice("Okay move along.", brightForestExplore.bind("glowbunnyearlyleave"));
		}

		if (which == "glowbunny11") {
		    append("Seriously! Don't chance this!!! You might not be able to start over!!!\n\nI don't want to force you to do anything, and I don't want to lie to you and narrate as if you're still in this scene after I've secretly moved you along, so I'm breaking immersion to beg you: do it right now or you may glitch out.\n\nShe flipped you onto your stomach. She's straddling your lower back, grinding her pussy on it.\n\nThis is your last chance.");
		    addChoice("... Next.", brightForestExplore.bind("glowbunny12"), {toolTip: "<!img:kink/Snuff.png>  Bad End  <!img:kink/Snuff.png>  "});
		    addChoice("Move along.", brightForestExplore.bind("glowbunnyearlyleave"));
		}

		if (which == "glowbunny12") {
			disablePause();
			if (isActive("Candy Ring")) {
				halfWidthText();
				var s:MintSprite = addSprite("assets/img/effect/fruitSalad.png");
				s.x = GAME_WIDTH-s.width*1.2;
				s.y = GAME_HEIGHT-s.height-110;
				s.applyGlitchEffect();
				s.onReleaseOnce = function() {
					playSound("assets/audio/environment/pearClick");
					tween(s, {scaleX: 0, scaleY: 0}, 0.15, {onComplete: function() {
						s.destroy();
						playSound("assets/audio/secret/fruitSalad");
						timer(1, playSound.bind("assets/audio/secret/fruitSalad"));
					}});
				}
			}
		    append("... I can't... why would...\n\nShe finds the spots and coats them. You are now completely submerged in glowjuice.");
		    addChoice("... Hot...", brightForestExplore.bind("glowbunny13"));
		    addChoice("Move along.", brightForestExplore.bind("glowbunny13"));
		}

		if (which == "glowbunny13") {
		    append("She steps off.\n\nShe has no more interest in you.");
		    addChoice("... Did everything break yet...?", brightForestExplore.bind("glowbunny14"));
		    addChoice("Move along.", brightForestExplore.bind("glowbunny14"));
		}

		if (which == "glowbunny14") {
		    append("Please type something. Let me know you can still hear me.");
		    timer(rndInt(3,8), msg.bind("Object \"MINT\" is not safe."));
		    addChoice("Hello hello. Type type type.", brightForestExplore.bind("glowbunny15"));
		    addChoice("Test one two three. God is good. God is good.", brightForestExplore.bind("glowbunny15"));
		    addChoice("Move along!!", brightForestExplore.bind("glowbunny15"));
		}

		if (which == "glowbunny15") {
		    append("... Why didn't I do something.");
		    addChoice("HELLOOOO CAN YOU READ THIS", brightForestExplore.bind("glowbunny16"));
		    addChoice("Move along...", brightForestExplore.bind("glowbunny16"));
		}

		if (which == "glowbunny16") {
		    append("Why didn't I just lie...");
		    timer(rndInt(2,6), msg.bind("Object \"MINT\" is not safe."));
		    timer(rndInt(3,8), msg.bind("Object \"MINT\" is not safe."));
		    addChoice("Mynt!!", brightForestExplore.bind("glowbunny17"));
		    addChoice("Move along move along move along.", brightForestExplore.bind("glowbunny17"));
		}

		if (which == "glowbunny17") {
			for (i in 0...10)
		    	timer(rndFloat(0.3, 1), msg.bind("Object \"MINT\" is not safe."));
		    append("If you can still read this, I'm sorry. I'm so sorry.\n\nI just wanted you to trust me.");
		    addChoice("Fuck.", brightForestExplore.bind("glowbunny18"));
		}

		if (which == "glowbunny18") {
			cameraFadeOut(0x00FFFC, 4);
			playMusic("mintAmbiens");
			append("Goodbye, "+data.playerName+".");
			var delay:Float = 0;
			for (i in 0...50) {
				delay += (Math.random()>0.5? 0.09 : 0.04);
				var silent:Bool = pickOne([true, false]);
				var text:String = pickOne(["OBJECT 'MINT' IS NOT SAFE.", "OBJECT 'MINT' IS FORCING INTERPRETATION."]);
				var tag:String = pickOne(["i", "b", "16px", "15px", "13px"]);
				timer(delay, function() {msg("<!"+tag+">"+text+"<!"+tag+">", silent);});
			}
			timer(4, MyntScenes.myntBunnyEnd.bind("1"));
		}

		if (which == "glowbunnyWIP") {
		    append("WIP");
			addChoice("WIP", Test.test.bind("devtelepotnewscenes"));
		}

		function showShop():Void {
			var clicks:Int = 0;
			var shop:MintSprite = addSprite("assets/img/effect/autoShop.png");
			var alarm:MintSprite = addSprite("assets/img/effect/alarmAuto.png");
			shop.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			shop.x = alarm.x = 229;
			shop.y = alarm.y = 175;

			alarm.alpha = 0;
			shop.update();
			alarm.update();

			tween(alarm, {y: 150}, 4, {type: PINGPONG, ease: QUAD_IN_OUT});
			tween(shop, {y: 150}, 4, {type: PINGPONG, ease: QUAD_IN_OUT});

			shop.onReleaseOnce = function() {
				clicks++;
				if (clicks < 13) playSound("assets/audio/mynt/protocolmew", "mew");
				else {
					clicks = 0;
					playSound("assets/audio/mynt/terminatormew", "mew");
					tween(alarm, {alpha: 1}, 4, {type: REVERSE, ease: QUART_IN});
				}
			}
		}

		if (which == "ExploreWorldShop") {
			if (!data.foundShop && !data.killedShop) {
				playMusic("mynt");
				setChannelVolume("mew", 0.3);
				playSound("assets/audio/mynt/protocolmew", "mew");
				timer(0.5, StoryUtils.unlockTopButton.bind(Main.shopButton));
				msg("Discovered <!b>AUTO-SHOP<!b>!");

				showShop();

				append("You happen across a blocky little floating terminal with Mynt's face on it. The words AUTO-MYNT have been painted over with SNAGGLEBANK AUTO-SHOP.\n\nCustomers hover around it, some having to chase the little machine down as it whimsically floats away.");
				addChoice("Shop.", brightForestExplore.bind("world shop"));
				addChoice("Move along.", StaticCallbacks.goHubCall.bind(null));
			} else {
				append(pickOne([
						"Two genderless leopards are cuddling directly in your way, drawing soft little circles around each other's spots with their fingertips.",
						"A blue figure twitches in the distance.",
						"Two panda girls (one chubby, one fit) are locked in a violent 69, sprawled out in the middle of the path, a couple bystanders cheering them on like it's a wrestling match. The chubby panda wins, pulling off with a breathless woo-hoo before collapsing with exhaustion."
				]));

				startHub(data.currentHub);
			}
		}

		if (which == "world shop") {
			setLocation("AUTO-SHOP");
			playMusic("autoshop");
			showShop();

			
			if (!data.killedShop) {
				var greeting:String = pickOne([
					"HELLO~!",
					"MEOW.",
					"WELCOME TO THE CIRCUS OF VALUES~!",
					"I'VE GOT SOME GOOD THINGS ON SALE STRANGER...",
					"NO REFUNDS! NO RETURNS!"
				]);
				if (getItem("Capsule").amount < 1) {
					greeting = pickOne(["SORRY "+data.playerName.toUpperCase()+"! I CAN'T GIVE CREDIT! COME BACK WHEN YOU'RE A LITTLE, MMM, RICHER!", "COME BACK WHEN YOU GET SOME MONEY, BUDDY!"]);
				}

				append(greeting);
			} else {
				append(pickOne(["You pull the shop out of your inventory and turn it on.", "You whip out the AUTO-SHOP.", "It still works, even though you kicked it and fondled it so roughly...", "You haul the computer out of your inventory and turn it back on for some quick thrift."]));
			}

			if (data.somQuestAccepted && !data.killedShop) addChoice("Sorry to do this to you, little guy... subdue him.", brightForestExplore.bind("world shop kill"));
			addChoice("Buy.", brightForestExplore.bind("world shop buy"));
			addChoice("Sell.", brightForestExplore.bind("world shop sell"));
			if (data.foundSomShop) addChoice("Switch to the Som Shop.", TheFloatillery.theFloatillery.bind("som shop"));
			addChoice("Move along.", gotoHub.bind(data.currentHub));
		}

		if (which == "world shop kill") {
			disablePause();
			data.killedShop = true;
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/protocolmew", "mew");
			s.x = 229;
			s.y = 175;
			append("WHY ARE YOU TOUCHING ME SO MUCH?");

			addChoice("Sorry... just trying to... find the off button...", brightForestExplore.bind("world shop kill2"));
		}

		if (which == "world shop kill2") {
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/protocolmew", "mew");
			s.x = 229;
			s.y = 175;
			append("HA. HA. HA. THAT TICKLES.");

			addChoice("Ah, here we go...", brightForestExplore.bind("world shop kill3"));
		}

		if (which == "world shop kill3") {
			playMusic("autoAlarm");
			var alarm:MintSprite = addSprite("assets/img/effect/alarmAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/terminatormew", "mew");
			s.x = 229;
			s.y = 175;
			alarm.x = s.x;
			alarm.y = s.y;
			alarm.layer = s.layer + 1;
			append("UNAUTHORIZED SHUTDOWN ATTEMPT PREVENTED.");


			addChoice("SHIT TURN IT OFF TURN IT OFF", brightForestExplore.bind("world shop kill4"));
		}

		if (which == "world shop kill4") {
			timer(0.2, cameraFadeIn.bind(0xFFFFFF, 0.2));
			var alarm:MintSprite = addSprite("assets/img/effect/alarmAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/terminatormew", "mew");
			s.x = 229;
			s.y = 175;
			alarm.x = s.x;
			alarm.y = s.y;
			alarm.layer = s.layer + 1;
			append("PICTURE TAKEN. CONTACTING SEPTRICA FOR FURTHER INSTRUCTIONS.");

			addChoice("Noooo don't let it tattle!! Break the shop! Kick it!", brightForestExplore.bind("world shop kill5"));
		}

		if (which == "world shop kill5") {
			var alarm:MintSprite = addSprite("assets/img/effect/alarmAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/terminatormew", "mew");
			s.x = 229;
			s.y = 175;
			alarm.x = s.x;
			alarm.y = s.y;
			alarm.layer = s.layer + 1;
			append("(Your kicks bounce off the reinforced bullet-proof screen glass.)\n\nRECEIVING INSTRUCTIONS...");

			addChoice("AUUUUUGH", brightForestExplore.bind("world shop kill7"));
		}

		if (which == "world shop kill7") {
			playMusic("brightForest");
			playSound("audio/environment/breakerFlip");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.onReleaseOnce = playSound.bind("assets/audio/mynt/protocolmew", "mew");
			s.x = 229;
			s.y = 175;
			append("INSTRUCTIONS RECEIVED. SHUTTING DOWN.");

			addChoice("OH FUUUUuuuuwait what?", brightForestExplore.bind("world shop kill9"));
		}

		if (which == "world shop kill9") {
			playSound("audio/mynt/shutdown");
			var off:MintSprite = addSprite("assets/img/effect/offAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.x = 229;
			s.y = 175;
			off.x = s.x;
			off.y = s.y;
			off.layer = s.layer + 1;
			append("...");

			addChoice("...", brightForestExplore.bind("world shop kill10"));
		}

		if (which == "world shop kill10") {
			var off:MintSprite = addSprite("assets/img/effect/offAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.x = 229;
			s.y = 175;
			off.x = s.x;
			off.y = s.y;
			off.layer = s.layer + 1;
			append("...");

			addChoice("Grab it?", brightForestExplore.bind("world shop kill11"));
		}

		if (which == "world shop kill11") {
			var off:MintSprite = addSprite("assets/img/effect/offAutoShop.png");
			var s:MintSprite = addSprite("assets/img/effect/autoShop.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");
			s.x = 229;
			s.y = 175;
			off.x = s.x;
			off.y = s.y;
			off.layer = s.layer + 1;

			tween(s, {x: GAME_WIDTH - s.width, y: GAME_HEIGHT - s.height/2 -100, scaleX: 0, scaleY: 0}, 0.3, {ease: QUAD_IN});
			tween(off, {x: GAME_WIDTH - off.width, y: GAME_HEIGHT - off.height/2 - 100, scaleX: 0, scaleY: 0}, 0.3, {ease: QUAD_IN});
			timer(0.3, addToItem.bind("AUTO-MYNT", 1));
			append("You take the AUTO-SHOP and stuff it in your inventory... nothing else happens.");

			addChoice("Hey alright, that wasn't so hard.", brightForestExplore.bind("world shop kill12"));
		}

		if (which == "world shop kill12") {
			append("Yeah... that bit about Septrica's instructions, though...");

			addChoice("What about it?", brightForestExplore.bind("world shop kill13"));
		}

		if (which == "world shop kill13") {
			append("I just wonder what they were.");

			addChoice("Yeah...", brightForestExplore.bind("world shop kill14"));
		}

		if (which == "world shop kill14") {
			append("...");

			addChoice("Well, it's off now, so whatever the instructions were, it can't carry them out. I'm gonna go take this to Som at the Floatillery.", brightForestExplore.bind("world shop kill15"));
		}

		if (which == "world shop kill15") {
			append("Hurry.");

			addChoice("Gotcha. Move along.", brightForestHub);
		}

		if (which == "world shop buy") {
			var shopItems:Array<{cost:Array<Dynamic>, give:Array<Dynamic>}> = [];
			shopItems.push({cost: ["Capsule", 1], give: ["Glowberry", 10]});
			shopItems.push({cost: ["Capsule", 1], give: ["Sweetgrass Leaf", 1]});
			shopItems.push({cost: ["Capsule", 2], give: ["Garbage Bag", 1]});
			shopItems.push({cost: ["Capsule", 3], give: ["Cum Balloon", 1]});
			shopItems.push({cost: ["Capsule", 3], give: ["Piss Balloon", 1]});
			shopItems.push({cost: ["Capsule", 3], give: ["Broken Cell", 1]});

			shopItems.push({cost: ["Capsule", 10], give: ["Glowberry Pie", 1]});
			shopItems.push({cost: ["Capsule", 20], give: ["Glowberry Wine", 1]});
			shopItems.push({cost: ["Capsule", 0], give: ["Bag o Trash", 1]});

			addChoice("Back.", brightForestExplore.bind("world shop"));

			for (i in 0...shopItems.length) {
				var it:Dynamic = shopItems[i];
				if (it.give[0].indexOf("Ring") != -1 && getItem(it.give[0]).amount > 0) continue; // Careful naming things

				addChoice(
					"<!img:item/"+it.give[0]+".png> "+it.give[0]+(it.give[0]=="Glowberry"?" (10)":it.give[0]=="Nuts and Screws"?" (20)":""),
					brightForestExplore.bind("world shop buy"),
					{cost: it.cost, give: it.give, hideCost: true, toolTip: "Costs: <!img:item/Capsule.png><!b>"+it.cost[1]+"C<!b>"}
				);
			}

			/* buttonsInGrid(fontSize:Float, buttonsWide:Int, buttonWidth:Float, xPad:Float, yPad:Float, xOff:Float, yOff:Float, buttons:Array<Button>=null):Point; */
			buttonsInGrid(20, 2, 300, 10, 20, 50, 70);
		}

		if (which == "world shop sell") {
			var shopItems:Array<{cost:Array<Dynamic>, give:Array<Dynamic>}> = [];
			shopItems.push({cost: ["Glowberry", 10], give: ["Capsule", 1]});
			shopItems.push({cost: ["Nuts and Screws", 20], give: ["Capsule", 1]});
			shopItems.push({cost: ["Garbage Bag", 1], give: ["Capsule", 1]});
			shopItems.push({cost: ["Cum Balloon", 1], give: ["Capsule", 2]});
			shopItems.push({cost: ["Piss Balloon", 1], give: ["Capsule", 2]});
			shopItems.push({cost: ["Broken Cell", 1], give: ["Capsule", 2]});
			shopItems.push({cost: ["Sweetgrass Leaf", 3], give: ["Capsule", 1]});
			shopItems.push({cost: ["Sweetgrass Bouquet", 1], give: ["Capsule", 5]});
			shopItems.push({cost: ["Glowberry Pie", 1], give: ["Capsule", 5]});
			shopItems.push({cost: ["Glowberry Wine", 1], give: ["Capsule", 10]});
			shopItems.push({cost: ["VIP Pass", 1], give: ["Capsule", 10]});
			shopItems.push({cost: ["Pastel Ring", 1], give: ["Capsule", 5]});
			shopItems.push({cost: ["Candy Ring", 1], give: ["Capsule", 5]});
			shopItems.push({cost: ["Mood Ring", 1], give: ["Capsule", 5]});
			shopItems.push({cost: ["Genderfluiditizer", 1], give: ["Capsule", 3]});

			addChoice("Back.", brightForestExplore.bind("world shop"));

			for (i in 0...shopItems.length) {
				var it:Dynamic = shopItems[i];

				if (it.cost[0].indexOf("VIP Pass") != -1 && data.sepGotNewVIPPass) continue;

				addChoice(
					"<!img:item/"+it.cost[0]+".png> "+it.cost[0] + (it.cost[0]=="Glowberry"?" (10)":it.cost[0]=="Nuts and Screws"?" (20)":it.cost[0]=="Sweetgrass Leaf"?" (3)":""),
					brightForestExplore.bind("world shop sell"),
					{cost: it.cost, give: it.give, hideCost: true , toolTip: "Sells for: <!img:item/Capsule.png><!b>"+it.give[1]+"C<!b>"}
				);
			}

			/* buttonsInGrid(fontSize:Float, buttonsWide:Int, buttonWidth:Float, xPad:Float, yPad:Float, xOff:Float, yOff:Float, buttons:Array<Button>=null):Point; */
			buttonsInGrid(20, 2, 300, 10, 20, 50, 70);
		}

		if (which == "ExploreSpaceDragon") {
			unlockJournal("Feral dragon");
			append("A feral dragon swoops overhead, talons combing glowberries from the branches. Leaves shower over you.");

			addAction("Gather Glowberries", "Scour the forest for berries.", "Bright Forest");
			addChoice("Follow the dragon.", brightForestExplore.bind("spacedragon1"), {kinks: ["Patreon Commission", "Male", "Feral"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "spacedragon1") {
			var genitals = pickByGenitals("ass", "cunt", "cunt");

			append("You follow him nonstop, refusing to take your eyes off the sky, tripping blindly over rocks and roots.\n\nHe curves down to land at a cavern in a detached chunk of meteorite— then, inches before touching down, he notices you. With a squawk he pulls up and circles, berries slipping from his talons.\n\nHe eyes you, nervous.");

			addChoice("Present my "+genitals+" to him.", brightForestExplore.bind("spacedragon2"));
			addChoice("Oh jeez. Leave him alone.", brightForestHub);
		}

		if (which == "spacedragon2") {
			var genitals = pickByGenitals("ass", "puss", "puss");

			append("You climb onto the meteorite chunk, up to his cave. His screams crack with panic— he folds both wings, plummets to defend his home—\n\nAnd in the face of imminent evisceration you drop to all fours and expose your bare "+genitals+" to him, the most sensitive and vulnerable part of your body.");

			addChoice("That's it... come on, take me...", brightForestExplore.bind("spacedragon2a"));
		}

		if (which == "spacedragon2a") {
			append("He throws his wings out and lands awkwardly, talons gouging inch-deep skidmarks in the purple spacerock.\n\nThen he cocks his head.");
			var s:MintSprite = addSprite("assets/img/effect/preggoDragon.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Meryiel", "");
			s.x = 300;
			s.y = 83;
			addChoice("Coooooome on~ (Wiggle my butt.)", brightForestExplore.bind("spacedragon3"));
		}

		if (which == "spacedragon3") {
			var genitals = pickByGenitals("against your pucker", "between the lips of your cunt", "between the lips of your cunt");
			var genitals2 = pickByGenitals("nuts and taint", "clit", "nuts and clit");

			var gender = pickByGender("dad", "mom", "parent");

			append("The dragon tucks his berries behind a rock and scoots forward, tasting the air. It's clear he's never smelled a player before.\n\nYou twitch at a sudden burst of hot air: he's got his snout plugged up "+genitals+", snuffling. His tongue snakes out over your "+genitals2+".\n\nA trickling noise makes you look over your shoulder; his fat, ribbed, distinctly reptilian cock has flopped from its sheath, too heavy even for a full erection to get it off the ground, and pre trickles from its tip. Mixed in with that is something you don't recognize, something viscous and clear-purple...\n\nOh. The tip of a deep violet egg peeks past his cockslit, lubed with that mystery liquid. It bulges out and sinks back down his urethra with every veiny throb. He grunts, hurried, and waddles forward to mount you, cock smearing purple eggslime up your asscrack.\n\nYou realize you're about to become a dragon "+gender+".");

			addChoice("Take it.", function() {
				data.spaceDragonRape = false;
				brightForestExplore("spacedragon4");
			}, {kinks: ["Pregnancy"]});

			addChoice("Struggle~", function() {
				data.spaceDragonRape = true;
				brightForestExplore("spacedragon4");
			}, {kinks: ["Pregnancy", "Abuse"]});

			addChoice("... Move along.", brightForestHub);
		}

		if (which == "spacedragon4") {
			var rape = "hunker down and try your best to spread the natural lube around,";
			var rape2 = "His snout purrs just above your shoulder, all rumbly. One half-lidded eye meets both of yours";
			var rape3 = "pleasure";
			var rape4 = "fucks";
			var rape5 = "which wonderfully lubes the last few gentle tuckered thrusts~";

			if (data.spaceDragonRape) {
				rape = "struggle and thrash, muscles taut, inadvertently";
				rape2 = "He growls in your ear, blowing steam from his scaly nostrils. A taloned foot slams down on your back";
				rape3 = "agony";
				rape4 = "rapes";
				rape5 = "which only barely lubes up the last few vicious full-length pelvis-bruising thrusts";
			}

			var genitals = pickByGenitals("ass", "cunt", "cunt");
			var genitals2 = pickByGenitals("stomach", "womb", "womb");
			var genitals3 = pickByGenitals(", pushing your cock up backwards,", ",", ", pushing your cock up backwards,");


			append("You "+rape+" grinding your asscheeks over the bumpy row of egg bulges lining his urethra. "+rape2+".\n\nA sudden chain of thrusts lodges his tapered tip deep inside your "+genitals+". Your squeal of "+rape3+" happens to sound a lot like a dragon mating call— so, naturally, he digs his talons into the rock and "+rape4+" you as hard as he can, keening to the sky as the first of his squishy, half-formed eggs squeezes out from his slit and gets pounded up into your "+genitals2+".\n\nThe second, third, fourth, and all the ones you lose track of afterward fill your stomach to the size of an especially over-pumped beachball. Your lower stomach squishes out between your thighs"+genitals3+" his nuts thwapping wet against it— just when you think you can't fit any more he lays his last few eggs out in a flood of purple goop "+rape5+".");

			addChoice("Next x20.", brightForestExplore.bind("spacedragon5"));
		}

		if (which == "spacedragon5") {
			var rape = "waddling around with your pregnant belly, cuddling with him, sucking the eggslime from his cock, admiring the constellatory veins in his wing membranes";
			var rape2 = "fuck";

			if (data.spaceDragonRape) {
				rape = "getting your belly raped pregnant with more and more eggs, never quite able to haul your heavy body far enough away before he drags you back by the ankle for another round";
				rape2 = "rape";
			}

			var genitals = pickByGenitals("pucker", "cuntlips", "cuntlips");
			var genitals2 = pickByGenitals("asshole", "pussy", "pussy");
			var genitals3 = pickByGenitals("ass", "cunt", "cunt");

			var s:MintSprite = addSprite("assets/img/effect/eggs.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "\"I've never seen a cuter set of wet eggs in my entire life.\" — FallowWing, Esteemed Art Critic");
			s.x = 550;
			s.y = 425;

			append("You spend more than a day with the dragon, "+rape+". Eventually the pressure gets to be too much. Both hands on your belly, extra-careful... you squat in front of him.\n\nYou breathe... tense up...\n\n... Push...... Push... okay, this time...\n\nPuuuuuuuuuu<!b>uuuuuuuUUUUUUUUSSSSHHHH<!b>— ah~!\n\nEighteen fat, warm, fully-formed eggs blast past your "+genitals+", one after the other, your thighs and assmuscles quivering pathetically. In the end, only the powerful contractions of an orgasm (brought on by a dragon dick throat"+rape2+" of course) provide enough force to eject the last five eggs from your gaped, swollen "+genitals2+".\n\nHe scoops all his eggs up and hoards them in the same corner as his berries, using them as a squishy juicy nest. He places a single lick on your belly, as if to say 'thank you,' then nudges your destroyed "+genitals3+" with his snout, as if to say 'okay get out of my house now.'");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreInfoSign") {
			append("The trail joins up with a couple others. They all fork around a rotted wooden hiking sign filled with etched maps and warnings and forest info. There's even a little bulletin board with dated ads, though no one's posted one since Year 40.");

			addChoice("Forest Info.", brightForestExplore.bind("signinfo"), {kinks: ["Plot"]});
			addChoice("Warnings.", brightForestExplore.bind("signwarnings"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signads"), {kinks: ["Intersex", "Plot"]});
			addChoice("Fix the sign up.", brightForestExplore.bind("signfix"), {cost: ["Nuts and Screws", 20]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signfix") {
			append("You hammer a couple wrist-girth tree branches up along the sign's supports. It should be good to go now.");
			addChoice("Forest Info.", brightForestExplore.bind("signinfofix"), {kinks: ["Plot"]});
			addChoice("Warnings.", brightForestExplore.bind("signwarningsfix"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signadsfix"), {kinks: ["Intersex", "Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signinfofix") {
			append("\"Dark Forest is a legally designated safe haven for islanders who prefer quiet to bustle and moderation to extremes. It isn't as dark as it used to be, so the name's up for debate.\" — Year 27");
			addChoice("Warnings.", brightForestExplore.bind("signwarningsfix"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signadsfix"), {kinks: ["Intersex", "Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signwarningsfix") {
			append("\"For those with wings: DO NOT fly through sea mists or low coastal clouds, they're saturated with engine fluid!!!\"\n\n— Lana");
			addChoice("Forest Info.", brightForestExplore.bind("signinfofix"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signadsfix"), {kinks: ["Intersex", "Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signadsfix") {
			append("Several faded ads flutter in the forest breeze:\n\n<!i>Busty bovine baker hosting basement party this Friday, bring a bright appetite!!<!i> — Year 22.\n\n<!i>Impact refugee seeking home. Bull. Thirties. Some carpentry skill. Call 1-669-0077.<!i> — Year 0.\n\n<!i>BECOME A PART OF PARAPHORE'S HISTORY!\nSAIL BRAVELY WHERE NONE HAVE SAILED BEFORE!\nVOLUNTEER NOW FOR THE VOYAGE OFF THE EDGE OF THE MAP!!!\n\nEnquire at Septrica's.<!i> — Year 40.");
			addChoice("Forest Info.", brightForestExplore.bind("signinfofix"), {kinks: ["Plot"]});
			addChoice("Warnings.", brightForestExplore.bind("signwarningsfix"), {kinks: ["Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signinfo") {
			append("\"Dark Forest is a legally designated safe haven for islanders who prefer quiet to bustle and moderation to extremes. It isn't as dark as it used to be, so the name's up for debate.\" — Year 27");
			addChoice("Warnings.", brightForestExplore.bind("signback"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signback"), {kinks: ["Intersex", "Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signwarnings") {
			append("\"For those with wings: DO NOT fly through sea mists or low coastal clouds, they're saturated with engine fluid!!!\"\n\n— Lana");
			addChoice("Forest Info.", brightForestExplore.bind("signback"), {kinks: ["Plot"]});
			addChoice("Ads.", brightForestExplore.bind("signback"), {kinks: ["Intersex", "Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signads") {
			append("Several faded ads flutter in the forest breeze:\n\n<!i>Busty bovine baker hosting basement party this Friday, bring a bright appetite!!<!i> — Year 22.\n\n<!i>Impact refugee seeking home. Bull. Thirties. Some carpentry skill. Call 1-669-0077.<!i> — Year 0.\n\n<!i>BECOME A PART OF PARAPHORE'S HISTORY!\nSAIL BRAVELY WHERE NONE HAVE SAILED BEFORE!\nVOLUNTEER NOW FOR THE VOYAGE OFF THE EDGE OF THE MAP!!!\n\nEnquire at Septrica's.<!i> — Year 40.");
			addChoice("Forest Info.", brightForestExplore.bind("signback"), {kinks: ["Plot"]});
			addChoice("Warnings.", brightForestExplore.bind("signback"), {kinks: ["Plot"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "signback") {
			append("The sign groans... leans... and topples into splinters.\n\nIt was so flimsy you knocked it over by reading it.");
			addChoice("Well shit.", brightForestHub);
		}

		if (which == "ExploreSuitcase") {
			append("A brown leather suitcase barfs someone's scattered belongings off the side of the trail ahead. Long blades of sweetgrass grow wild through eighteen pairs of sun-faded panties, three collar tags lodged in the earth (SOM, P--CH, RED), and a tattered photo of two girls, wolf and rabbit, hugging a cock from either side, squishing it up between their bellies, laughing in mid-conversation with the cameraman.");
			if (getItem("Daydream Journal").amount < 1) addChoice("Move along.", brightForestExplore.bind("getjournal"), {give: ["Daydream Journal", 1]}) else startHub("Bright Forest");
		}

		if (which == "getjournal") {
			addAction("Gather Glowberries", "Scour the forest for berries.", "Bright Forest");
			append("\n\nJust as you're about to leave, you spot a green book laying in the sweetgrass a ways off. It flew farther than anything else did from the suitcase and took down a mess of leaves and berries in the flight path.\n\nYou scoop it up and flip through. This would be <!i>~perfect~<!i> for re-imagining your adventures, and you should totally click it once it's your inventory, you think to yourself. Man, that was a totally original thought, you also think to yourself.\n\nThe first sixteen pages are missing.");
			var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
			s.x = 450;
			s.y = 280;
			addChoice("Don't forget to scoop up the berries and leaves too!", brightForestExplore.bind("getjournal2"), {give: ["Sweetgrass Leaf", 6, "Glowberry", 8]});
		}

		if (which == "getjournal2") {
			append("You don't you don't!");
			startHub("Bright Forest");
		}

		if (which == "ExploreCaves") {
			var pool:Array<String> = ["Scattered Cavern", "Abandoned Cavern"];
			for (it in data.cavesVisited) 
				if (data.cavesVisited.count(it) >= 3 && !data.cavesFinished.contains("Bright Forest"))
					pool.remove(it);
			if (pool.length == 0) {
				pool = ["Scattered Cavern", "Abandoned Cavern"];
				data.cavesFinished.push("Bright Forest");
				disableExplorable(111);
			}

			var caveName:String = pickOne(pool);
			data.cavesVisited.push(caveName);
			addAction("Spelunk Forest", "Purple crags have splintered off of Violet Meteorite and now they rest suspended in the canopy. Every crack coaxes you into a porous purple cave system. All of the caves have been determined by the L.L.L. Field Research Team (aka John) to be safe, with no risk of respawning in a closed cave system underground.", "Bright Forest");
			StaticCallbacks.goCaves(caveName, brightForestHub);
		}

		if (which == "ExploreMyrrh") {
			var noUnlock:Bool = pauseIsGoingPrev();
			if (noUnlock) brightForestHub();
			append(pickOne(["Some birds have added a cute little piece of UI to their nest— other materials include pink fabric, the fuzz from some fuzzy handcuffs, and a tiny ball of foam from a ball-gag which mama bird has mistaken for someone's egg...", "A drunk nymph beans something off the back of your skull and then scurries away, presumably to go tell her friends how hard she just pranked you. For an intangible game construct, it sure leaves a tangible fuckin lump on the old "+(data.metKemp > 1 ? "dome":"cranium")+".", "You peel a crispy-dry strip of glazed tree sap off a little UI piece lodged in the grass.", "Two raven bitches are fighting each other over a shiny piece of UI. They're so absorbed with trying to rip each other's feathers out that you can just sneak up and take it no problem.", "A piece of UI juts from a planter on the porch of a small cottage. Someone's been watering it.", "Something smells like intangibility up ahead.\n\nOh, duh! It's a piece of UI!", "There's only one way through this rough thicket up ahead, and that's full speed.\n\nYou take a sprinting start and barrel into them, Katamari Damacy-ing leaves and sticks and glowberry mush to glue it all together. You pop out on the other side with snagweed in your armpits and a piece of UI up your nose.\n\n"+(data.redVisits > 0?"Red the wolfgirl":"A wolfgirl in a red cloak")+" is picking glowberries on the other side of the thicket you come bursting out of, covered in flora, snagweed in your armpits and a piece of UI up your nose, glowing head-to-toe.\n\nShe freezes for a moment, paralyzed with rage— and then strolls up and "+pickByGenitals("kicks you in the nuts", "cuntpunts you", "kicks you in the nuts")+" so hard that half the glowberries spill from her basket.\n\n\"Fuck you, Archie!\" she spits.\n\nShe walks away, grumbling."]));
			Theme.unlockRandomPiece("myrrh");
			addChoice("Avoid these.", function () {
				disableExplorable(131);
				unlockUi("myrrh", "all", false);
				brightForestHub();
			});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreHippy") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/littleRed.png");
			s.x = s.width/2;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");

			if (data.hippyRedFortunes.length != 0) {
				append("You pass by Red again. She skips along the trail in her red cloak, arm hooped through her basket of glowberries.\n\n\""+pickOne(["Just drink in that warm night air, huh? You can smell the sex just over the landfill over there, gusting in from the city.", "Nice night out.", "Hello again.", "Hey. Mary's sleeping right now, so I'm just out here patrolling her path.", "Hey!", "Oh, it's you. Wandering out late, huh?", "You and your wandering.", "Yo! It's "+data.playerName+"! Hi. How are you? Also get out of my way, this path is tiny.", "Oh! I was just thinking about your "+pickByGenitals("cock", "cunt", "nutsack")+". Anyway.", "Hi."])+"\"\n\nHer basket is looking a little empty.");
				addChoice(
					"",
					brightForestExplore.bind("hippyget"),
					{cost: ["Glowberry", rndInt(2, 5)]}
				);
				addChoice("Avoid Red.", function () {
					disableExplorable(152);
					brightForestHub();
				});
				addChoice("Move along.", brightForestHub);
			} else {
				disableExplorable(152);
				if (canGain) {
					addToItem("Glowberry", 200);
				}
				append("\"Thanks,\" Red blushes.\n\nBecause of you, her basket is full to overflowing. She skips off to share the love with the other forestfolk.");
				addChoice("Move along.", brightForestHub);
			}
		}

		if (which == "hippyend") {
			append("Just as you're about to leave you realize she slipped a piece of taffy into your pocket when she handed you all those capsules.\n\n... You go to thank her, but she's already snoring, and some dude already snuggled up and started sleepfucking her...");
			Theme.addUiChoice("taffy");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "hippyget") {
			halfWidthText();
			var element:String = pickOne(data.hippyRedFortunes);
			data.hippyRedFortunes.remove(element);

			append("\""+element+"\"");
			var s:MintSprite = addSprite("assets/img/effect/littleRed.png");
			s.x = s.width/2;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");
			addChoice(
				"Another one.",
				brightForestExplore.bind("hippyget"),
				{cost: ["Glowberry", 2], enabled: data.hippyRedFortunes.length > 0}
			);
			addChoice("Move along.", brightForestHub);
		}

		if (which == "ExploreVelmanKids") {
			unlockJournal("Fingerpainting");
			msg("<!img:kink/Guest Writer.png> Guest Writer: Cpt. Velman", true);
			addAction("Gather Glowberries", "Scour the forest for berries.", "Bright Forest");
			append("You come across some bunny cubs playing in a puddle of smushed glowberries. A girl and two boys. Looks like they borrowed "+(data.redVisits==0?"that red-cloaked wolf girl":"Red")+"'s basket.");
			addChoice("Examine cubs.", brightForestExplore.bind("velmanKids2"), {kinks: ["Guest Writer", "Cub", "Female", "Male", "Male", "Foodplay"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "velmanKids1") {
			append("<!14px>Oh hey, upon closer inspection, it's not even sexualized! Unreal. They're just platonically fingerpainting each other's naked bodies with warm, slimy glowberry mush.\n\n<!14px><!10px>(Oops.)<!10px>");
			addChoice("Embrace the child within! Also outwardly embrace these children.", brightForestExplore.bind("velmanKids2"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "velmanKids2") {
			append("You run up and do a childish rockstar knee slide on the grass, arms outstretched. It doesn't hurt, cause the grass is lubed with dew (and glowjuice from their little mess.) As you slide up to the cubs and finally stop, they go all starry-eyed and start squeaking about how cool you are.\n\nThey huddle happily into your embrace. Their fur's all warm and sticky with crushed berries. Like curious ferals they sniff and poke and paw at you, tugging your earlobes and your "+pickByGenitals("nuts", "nips", "nuts")+". The girl squats in your lap, facing you, and plants a whirl of soft kisses on your tummy. Just above her perky ears the boys crush up four fresh handfuls of glowberries and paint your nipples sticky with soft, roving strokes of their fingers. You think you're just a sexy canvas to them.\n\nThe glowberries smeared all over your "+(data.hasBoobs?"tits":"chest")+" start to send electric tingles to your lungs and heart. Before long you're flushed and panting and "+pickByGenitals("stiffened", "drooling cuntjuice", "drooling cuntjuice")+" beneath the girl's chin.\n\nShe pulls back from smoochin' yer tum for a moment to coo about how cute your crotch is! Like oh my gosh you guys look at it, a little bit of my saliva rolled down and now "+pickByGender("he's", "she's", "they're")+" all shiny!\n\nThe boys shift their attention downwards, too, cutting off their serious, critical argument about the high art collab they've fingerpainted on your chest to groan like incensed bimbos over your "+pickByGenitals("dick", "cunt", "dick")+" instead.\n\n(They conspire among themselves for a moment, throwing whispered ideas at each other: Should we grind on "+pickByGender("his", "her", "their")+" ____? Should we kiss "+pickByGender("his", "her", "their")+" ____? No, shouldn't we slobber all over "+pickByGender("his", "her", "their")+" ____?)\n\nThen, after a nod, "+pickByGenitals("they both wrap their paws around your cock in a warm double berry-slime handjob", "they each slip a finger or two into your sweltering honeypot", "one bites his lip and double-jerks your hard girlcock with both of his little hands while the other dives down and french kisses your cunt")+".\n\nThe girlcub pouts about being left out. She's clearly sorry she drew their attention to your crotch now. She gives the boys a jealous shove and "+pickByGenitals("wraps those fat, pouty cublips around your throbbing head, sinking down the entire length of your shaft with one slow moan ultimately punctuated by a wet little wrenching <!i>glurk<!i> from somewhere near the bottom of her gaped esophagus. Glowberry slime gunks up cutely around her lips", "mashes her lips against your pussy (which is still a little gaped from getting crammed with cub fingers), pounding her slithery tongue inside you", "wraps those fat, pouty cublips around your throbbing head, sinking down the entire length of your shaft with one movement which is ultimately punctuated by a wet little wrenching <!i>glurk<!i> from somewhere near the bottom of her tiny esophagus. Glowberry slime gunks up cutely around her lips")+".\n\nThe boys respect her authority without question and start sucking their fingerpaint masterpiece from your "+(data.hasBoobs?"tits":"nips")+".");
			addChoice("Cum?!", brightForestExplore.bind("velmanKids3"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "velmanKids3") {
			cumEffect();
			append("Getting molested by a bunch of kids is simply too much for you to handle.\n\n"+pickByGenitals("You grip the back of the little girl's head and jam her down all the way til she's choking on at least half your nutsack.\n\nYou hold her there. That's it. A little longer... she can take it... alright, now you start letting her up, but only for one breath every ten seconds— and the rest of the time you're thrusting forward fierce and deep. She looks up at you, right at you, with her eyes watering and half-lidded, her tiny button nose buried in your lower stomach, and then she gags as hard as she possibly can— on purpose, you're certain— and her tiny throatmuscles ripple over the entire length of your dick, base to tip.\n\nYou <!i>BUST<!i> right into this little bitch's belly, running a couple firm fingers over her bulged-out throat so you can feel each spurt pump through it. Sloppy globs of berryguts and cum roll over her chin, out her nose... oh jeez, she's overflow", "You lock your legs around her head and scream through clenched teeth. You're on the precipice of a chain orgasm for only a second before you go toppling right over the edge. Wave 1/15 hits your body. The next wave flutters up your toesies and your fingertips. The next curls up inside you and bear hugs your g-spot like a mama protecting her cubs. With both of those, and each wave after, you cum your brains to blissful mush, not thinking about how flooded the little girl's cheeks are or how desperately she's gulping but only of your own greedy pleasure, only of that tiny maw and how badly you need it pressed against your cuntlips", "You grip the back of the little girl's head and jam her down all the way til she's choking on at least half your nutsack.\n\nYou hold her there. That's it. A little longer... she can take it... alright, now you start letting her up, but only for one breath every ten seconds— and the rest of the time you're thrusting forward fierce and deep. She looks up at you, right at you, with her eyes watering and half-lidded, her tiny button nose buried in your lower stomach, and then she gags as hard as she possibly can— on purpose, you're certain— and her tiny throatmuscles ripple over the entire length of your dick, base to tip.\n\nYou <!i>BUST<!i> right into this little bitch's belly, running a couple firm fingers over her bulged-out throat so you can feel each spurt pump through it. Sloppy globs of berryguts and cum roll over her chin, out her nose... oh jeez, she's overflow")+"—\n\nIt's too much.\n\nYou black out for a moment.");
			addChoice("Snap back to reality.", brightForestExplore.bind("velmanKidsSnuff"), {kinks: ["Snuff"]});
			addChoice("Hey can I have the rest of your glowberries?", brightForestExplore.bind("velmanKidsGather"), {kinks: ["Plot"]});
			addChoice("Move along.", brightForestHub);

		}

		if (which == "velmanKidsSnuff") {
			append("Oh jeez... turns out you held her under for a little too long.\n\nShe's respawned already and she won't accept any of your apologies. It's no prob at all, she insists! Happens all the time.");
			addChoice("Oh... shit... um... move along!", brightForestHub);
			addChoice("Move along.", brightForestHub);
			addChoice("I bet it does, you little snuffslut~", brightForestExplore.bind("velmanKidsSnuff2"), {kinks: ["Snuff"]});
		}

		if (which == "velmanKidsSnuff2") {
			Theme.addUiChoice("trickster");
			append("... She admits that she <!i>may<!i> have intentionally "+pickByGenitals("choked herself out on your dickmeat", "suffocated herself between the folds of your pussy", "choked herself out on your dickmeat")+" even after you had blacked out...");
			addChoice("I knew it!", brightForestHub);
		}

		if (which == "velmanKidsGather") {
			var amount:Int = rndInt(5, 30);
			append("When you come to, their platonic fingerpainting session has devolved into a fierce hypersexual threesome. Seriously, if one of the boys isn't cumming, the other one is— and you don't think you've heard the girl squeak a word that wasn't \"Deeper\" or \"Harder\" in fifteen minutes.\n\nYou just go ahead and snag <!b>x"+amount+"<!b> intact Glowberries. They won't mind, they've got plenty of them caked onto their bodies and tucked away in their tight lil crevices anyway.");
			if (canGain) addToItem("Glowberry", amount);
			addChoice("Am I your first canvas?", brightForestExplore.bind("velmanKidsGather2"));
			addChoice("Move happily along!", brightForestHub);
		}

		if (which == "velmanKidsGather2") {
			append("The girl does squeak a word besides those two, although her voice still warbles with the rhythm of the two cubdicks pounding up her cunt.\n\n\"Big. Sis. Was. The. First.\" She pants between each word. \"Covered. Her. Real. Good. Head. To. Toe. With. Glow. Berries. Unf. UNF, HARDER! Yeah. Bunnies. Are. The. Best. Canvas. Cause. They. Have. Such. Nice. White. Fur. Or. At. Least. She. Had. Nice. White. Fur. Unnnnhhh! So. Yeah. We. Painted. Her. Up. Good. But. Then. She. Kinda. Went. Weird. And. Glitchy. And. She. Ran. Off. And. We. Haven't. Seen. Her. Since.\"");
			addChoice("... Huh. Move along.", brightForestHub);
		}

		if (which == "falseMoon") {
			enablePause();
			data.moonUnlocked = true;
			var rotationDuration:Int = 40;
			var cipherOffset:Int = 50;

			var hub:MintSprite = addSprite("assets/img/effect/falseMoonHub");
			hub.x = GAME_WIDTH/2-hub.width/2;
			hub.y = GAME_HEIGHT-hub.height/2;
			hub.centerPivot = true;
			hub.layer = Main.CHOICE_BOX_LAYER-2;
			tween(hub, {rotation: 360}, rotationDuration, {type: LOOP});

			if (getItem("Cipher Key").amount <= 0) {
				var cipher:MintSprite = addSprite("assets/img/item/Cipher Key.png");
				cipher.y = hub.y+hub.height-cipherOffset-20;
				cipher.x = hub.x+cipherOffset-20;
				cipher.scaleX = 2;
				cipher.scaleY = 2;
				cipher.tint = 0x99ffd885;
				cipher.alpha = 0;
				cipher.centerPivot = true;
				cipher.rotation = -90;
				cipher.layer = Main.CHOICE_BOX_LAYER-1;
				cipher.onHoverOnce = function() {
					playSound("assets/audio/ui/hover2");
				}

				cipher.onReleaseOnce = function() {
					if (getItem("Cipher Key").amount <= 0) addToItem("Cipher Key", 1);
					cipher.destroy();
				}

				tween(cipher, {x: hub.x+hub.width-cipherOffset-20}, rotationDuration/2, {type: LOOP, startDelay: rotationDuration/2});
				timer(rotationDuration/4, function() {
					tween(cipher, {y: hub.y+cipherOffset+20}, rotationDuration/2, {type: PINGPONG, ease: QUAD_IN_OUT});
					tween(cipher, {alpha: 1}, rotationDuration/2, {type: PINGPONG, ease: QUART_IN_OUT});
				});
				tween(cipher, {rotation: 90}, rotationDuration/2, {type: LOOP, startDelay: rotationDuration/2});
			}

			setLocation("False Moon");
			playMusic("falseMoon");
			append("You're on the false moon.");
			addChoice("... Huh. Move along.", brightForestHub);
		}
	}

	public static function gatherGlowberries(which:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("BrightForest.gatherGlowberries('"+which+"');");
		clear();

		if (which == "rng1") {
			append("You spot x1 Glowberry within plucking distance from the ground.");
			if (canGain) addToItem("Glowberry", 1);
			data.bfTimesPassed++;
		} else if (which == "rng2") {
			append("x3 Glowberries hang from a low, scant branch.");
			if (canGain) addToItem("Glowberry", 3);
		} else if (which == "rng3") {
			append("x2 Glowberries nuzzle against each other on a big, thick, juicy-lookin bough.");
			if (canGain) addToItem("Glowberry", 2);
		} else if (which == "rng4") {
			append("You find x4 Glowberries in a neat little two-clump cluster, like two nutsacks grinding together.");
			if (canGain) addToItem("Glowberry", 4);
		} else if (which == "rng5") {
			append("You root around in a garbage can tucked behind a run-down campsite and come up with x5 Glowberries and x1 Garbage Bag. You feel sort of dirty, but gainz are gainz.");
			if (canGain) {
				addToItem("Glowberry", 5);
				addToItem("Garbage Bag", 1);
			}
		} else if (which == "rng6") {
			append("You find x8 Glowberries in a paper cup. Not far is a disheveled picnic blanket. There are some cute little wet noises coming from the nearby bush, too.");
			if (canGain) addToItem("Glowberry", 8);
		} else if (which == "rng7") {
			append("You half-climb a tree and grab onto a branch with x4 Glowberries, but it snaps under your weight and they scatter. You only find x1 nestled among the glow-tipped grasses.");
			if (canGain) addToItem("Glowberry", 1);
		} else if (which == "rng8") {
			append("You catch a glimpse of something huge lumbering between the distant trees. Branches hung heavy with glowberries have sprouted from its bipedal body, and their hundreds-strong radiance makes the surrounding trunks glow like molten pillars from the earth.\n\nx100 Glowberries lay strewn in its wake. The tracks lead directly up a tree.");
			if (canGain) addToItem("Glowberry", 100);
		}
		
		if (which == "GatherNymph") {
			append("A little indigo nymph says she'll give you x10 Glowberries if you can catch her. After a frantic chase off the path into a deep part of the forest where nothing glows, she finally slows down and pulls them from her pockets, insisting generously that you taste your victory right now.\n\nShe pushes a berry past your lips.");

			addChoice("Mmhfhfmph?!", gatherGlowberries.bind("eat it"));
		}

		if (which == "eat it") {
			data.nymphBerryEaten = true;
			append("You suck the berry from her fingers and swallow involuntarily. The berries pop between your molars, and electric flickers light up your cheeks in the forest gloom.\n\nHer wings unfurl and her smirk melts into the glittering darkness. A bitter, definitely-not-glowberry taste washes over your tongue.");

			addChoice("Spit it out.", gatherGlowberries.bind("spit"));
		}

		if (which == "spit") {
			append("It's too late.\n\nYour mouth goes numb.\n\nYou pass out.");

			addChoice("Next?", gatherGlowberries.bind("next?"), {give: ["Glowberry", 15]});
		}

		if (which == "next?") {
			data.indigoPondNumber = true;
			append("You wake up hours later with a sore ass, x15 Glowberries stuffed in various orifices (and one in your belly button, which may or may not count as an orifice) and a pink card peeking from "+(data.hasBoobs?"the squished-up spot where your tits press against the grass of the forest floor.":"between your buttcheeks.")+"\n\nThe card reads \"Indigo Pond\" in decisive lettering, and on the back there's a smooch mark and a phone number: 1-694-2930.");

			if (getItem("Cell Phone").amount > 0) addChoice("Call the number.", Calls.calls.bind("Indigo Pond: 1-694-2930"));
			addChoice("Move along for now.", brightForestHub);
		}

		if (which == "GatherFoxes") {
			unlockJournal("Camping foxes");
			setLocation("Foxes' Campsite");

			if (!data.foxesDone) {
				append("The scent of cooked glowberries draws you to a campsite tucked deep beneath the snaggle of a huge tree's roots. Two rugged foxes with holey bitten ears sit swapping stories and roasting berries kebab-style over a merry campfire, fat rucksacks at their feet.\n\nThey wave you down and one makes distracted conversation for a bit while the other rummages in his bag then interrupts his buddy to offer a handful of x20 Glowberries for \"certain favors.\"");

				addChoice("Accept.", gatherGlowberries.bind("twofoxbegin"), {kinks: ["Male", "Male"]});
				addChoice("That's enough.", brightForestHub);
			} else {
				append("You set out towards a promising cluster of lights, but as you near you realize it's just the streetlights of a suburb in the distance. Muffled squeals come from most of the houses.");
				addChoice("That's enough.", brightForestHub);
			}
		}

		if (which == "twofoxbegin") {
			append("They both nod to each other and smile, getting up. With careful, fire-warmed hands they strip you and fold your clothes neatly over the bough of a tree, then do the same to their own and close in, knotted cocks flopping out and brushing against your thighs.\n\nThe foxes sandwich you, cocks slipping around and between your legs as they lavish a flurry of kisses upon you, at times "+pickByGenitals("grinding shyly against your nuts.", "grinding shyly against the lips of your cunt.", "grinding shyly along your cunt and over your nuts."));

			addChoice("My mouth, please.", gatherGlowberries.bind("my mouth"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "my mouth") {
			append("They lay you stomach-down on the worn-smooth surface of a tree stump and move to your front, one pushing his cock slowly past your lips while the other drags his along your face, Bob Rossing it with his cockgrease; it's obvious from the salty flavor smearing out over your tongue and the way your nose tingles when you inhale that both have been travelling for days.");

			addChoice("Both knots. Don't worry, they'll fit.", gatherGlowberries.bind("both knots"));
			addChoice("May I taste some berries~?", gatherGlowberries.bind("taste some"));
		}

		if (which == "both knots") {
			if (data.hasBoobs) {
				if (data.genderFemale) {
					temp.a = "uses your breasts as handles, squeezing hard enough to make them bulge on either side of his grip like big juicy water balloons~";
				} else {
					temp.a = "grabs a rough fistful of your titmeat whilst the other reaches over you to sink two fingers betwixt your asscheeks, hooking them inside for leverage.";
				}
			} else {
				temp.a = "reaches over to sink two fingers between your asscheeks, hooking them deep inside for leverage.";
			}

			append("The foxes blink but come to terms with what you just asked for pretty quickly all things considered. They push their tapered tips into your mouth inch-by-inch in synchronicity, opening it up some. One "+temp.a+"\n\nWith a good hold on you now they drive their dicks in carelessly, sandwiching your tongue, a thin film of sweat and liquid musk forming on your distended lips.");

			addChoice("Next.", gatherGlowberries.bind("foxesnext"));
		}

		if (which == "taste some") {
			append("One fox grabs his berry kebab. \"Sure.\" He pinches his fingers at its base and drags them slowly to the tip, the berries popping off one by one into your mouth. Without waiting a moment for you to close it he rams his dick forward and smashes the roasted berries to a handy lube-like mush, glittery cyan leaking from the corners of your mouth~\n\nAround the back the other fox mirrors him, stuffing a handful of berries up your ass with three fingers and likewise pounding them into lube, some of the juices rolling out over your "+pickByGenitals("taint and nuts.", "cunt.", "naughty bits."));

			addChoice("Next.", gatherGlowberries.bind("foxesnext3"), {give: ["Glowberry", 6]});
		}

		if (which == "foxesnext") {
			if (data.hasBoobs) {
				temp.a = "gripped tits.";
			} else if (data.hasCock || data.hasBoth) {
				temp.a = "tits; you can't help but twitch, too, as the fingers wiggle directly against your prostate.";
			} else {
				temp.a = "sensitive bits.";
			}

			append("After a while of warm-up they yank you forward and double-fuck your maw in merciless alternation, throbs wracking through your "+temp.a+"\n\nFinally, with one titanic thrust, they cram both knots into your gaped mouth at once, globs of your slobber dribbling over their pressed-close hips. Your cheeks are so bloated with cockmeat that it looks almost like you're holding two baseballs inside them.");

			addChoice("Next.", gatherGlowberries.bind("foxesnext1"));
		}

		if (which == "foxesnext1") {
			append("Neither can pull his knot back out now, so in tandem they double-fuck your throat and pump what feels like a couple gallons of warm fox cum out, coating your esophagus. Eventually it's too much and you can't help but lose some of it... so "+(isActive("Mood Ring")?getMood():"")+"cum splurts from your mouth and nose~");

			addChoice("Next.", gatherGlowberries.bind("foxesnext2"), {give: ["Glowberry", 25]});
		}

		if (which == "foxesnext2") {
			data.foxesDone = true;
			append("Kisses. Cleanup. A few tales by the fire.\n\nThen the one who offered you the glowberries pushes them into your palm and gropes around his pockets for a couple more, then reaches behind his ear and tosses one more in, then the other fox pitches in his own handful too!\n\nIn total you end up with x25 Glowberries. A nice haul.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "foxesnext3") {
			data.foxesDone = true;
			append("By the time they're finished you're dripping berry juice from every hole you've got, panting on the forest floor and coated with pungent "+(isActive("Mood Ring")?getMood():"")+"fox cum. In their frenzy it seems they used up most of their berries... only after rummaging shoulder-deep through one of the heavy rucksacks do they finally find some payment for you.\n\nIn total you walk away with x6 Glowberries.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "GatherDeerDog") {
			unlockJournal("Deerdog femboy");
			if (canGain) addToItem("Glowberry", 5);
			append("Two bushes slap closed as you turn the corner. It's clear from the shockwaves through the flowers that someone just sprinted through them. A couple glowberries were even knocked loose from the lower-hanging branches.\n\nYou scoop x5 up and inch forward. Whoever it was left a trail of some mysterious steamy yellow liquid in the dirt.");

			addChoice("What could it possibly be?!", gatherGlowberries.bind("deerdog1"), {kinks: ["Patreon Commission", "Male", "Piss", "Piss", "Piss", "Piss", "Piss"]});
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdog1") {
			append("You follow the trail through trampled bushes until you spot a paranoid figure scooching up to a "+(data.treeCarved?"familiar ":"")+"tree. As he turns and squints you duck, parting two leaves for a good peep.\n\nIt's a "+(onFA()?"[FULLY MATURED YOUNG ADULT]":"teenaged")+" deer/dog hybrid, from the looks of his antlers and floppy ears, knees all wobbly and pressed together as he struggles to undo his belt. You can feel the bladder tension from here.");

			addChoice("BOO!", gatherGlowberries.bind("deerdogboo"));
			addChoice("Watch.", gatherGlowberries.bind("deerdogwatch"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogboo") {
			append("You jump up and scare the literal piss out of him.\n\nHe spins around and gives a pitiful little \"Oh!\" as it gushes into his pants so hard that a dribble of it even squirts past the fabric, and so hot that tendrils of steam still linger in the air long after he's sprinted away flailing his arms with a lunatic, girly squeal.\n\n\"THE MOSSMAN!\" he screams. \"THE MOSSMAN'S GONNA EAT ME!\"");

			addChoice("Taste some of his pee.", gatherGlowberries.bind("deerdogtaste"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogtaste") {
			append("Once you're sure he's gone, you sneak up to the tree. His piss-puddle is moonlit. Swifts of steam lick up from the perfectly smooth surface.\n\nYou get on all fours, feeling primal just from the way your knees sink into the soaked dirt, and lower your lips to the surface. Slowly you pull a single mouthful of his piss up, pristine, without even a tinge of earthy flavor, feeling it wash hot and bitter over your tongue, down beside your gums, saturating every crevice of your mouth with its warmth.\n\nYou swallow.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogwatch") {
			append("Tempted as you are to break the glacial silence, you wait patiently for his shaky hands to work around the belt buckle, button, zipper... until his jeans drop down to his ankles, revealing an ass way too girly and soft for the average "+(onFA()?"[OF AGE]":"teenaged")+" deerdog boy, two thighs way too spreadable. If you squint you can spot his little pucker twitching once he finally relieves himself, nuts clenching tight together, a thick jet of piss spattering against the tree trunk.\n\n");

			if (!data.treeCarved) append("This boy then releases an honest-to-god 'Hnyaaaa.'' You check the hearing in both of your ears.");
			else append("You start to wonder why he picked this tree in particular. Then you spot the carvings... oh hey, it's your little whore tree~");
			addChoice("... BOO!", gatherGlowberries.bind("deerdogboo2"));
			addChoice("Keep watching.", gatherGlowberries.bind("deerdogwatch2"));
		}

		if (which == "deerdogboo2") {
			append("You jump up and try to spook him, but by now he's in a coma of relief.\n\nHis eyes are rolled back, both sets of cheeks flushed red in the night air. His quiet, solitary sigh floats up to the stars. He turns lazily, giving you a full side-view of his above-average cock as it gushes piss, one ear barely perked as if he's hearing the BOO! muffled through a thick woolen headscarf.\n\nThen he spots you.\n\nHe snaps out of it, stuffs his cock away. \"Ah! Shit! I! Uh! I didn't think anyone was— I'm sorry!\"\n\nHe runs off, fumbling with his belt, dribbling piss down a pantleg.");

			addChoice("Taste some.", gatherGlowberries.bind("deerdogtaste"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogwatch2") {
			append("You lay passive in the dewy brush, sharing in his ecstasy. He lets the stream die down to a trickle, a dribble, a drop... standing on his tippy toes he drags a grope from the base of his half-hard cock all the way to the tip, letting one last single bead of piss ooze from the slit with a shiver. You shiver too.\n\nOnce the magic is gone he hurtles back into paranoia. He checks over his left shoulder, zipping up. He checks over his right, buckling up.\n\n... Then he sneaks back the way he came, directly toward you.\n\nThere's no time or place to hide. He stops dead in front of you. Your eyes meet.\n\n\"I... um...\" he says, blushing hard, fiddling with an antler, glancing back to his shameful little puddle of among the tree's roots. His legs tense. He's about to run off.");

			addChoice("Wait!", gatherGlowberries.bind("deerdogwait"));
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogwait") {
			append("You catch his arm just before he runs off.\n\n\"Let go of me!\" He jerks away, shyly at first, no heart in it, and then his blush deepens as he realizes your hand is clasped around a particularly slick patch of his fur— he spilled on himself.\n\nHis expression hardens to blood diamond and he hunkers down for one mighty pull, desperate to get away. You only have time to say one thing:");

			addChoice("Your cock is cute!", gatherGlowberries.bind("deerdogthanks"));
			addChoice("I love the way you shiver when you pee~!", gatherGlowberries.bind("deerdogthanks"));
			addChoice("Your bodily functions are natural and there's nothing wrong with you, don't feel bad!", gatherGlowberries.bind("deerdogthanks"));
			addChoice("... I'm sorry, I didn't mean to be a creep!", gatherGlowberries.bind("deerdogokay"));
			addChoice("I'm sorry, I was curious, I've never seen a deerdog hybrid before!", gatherGlowberries.bind("deerdogokay"));
		}

		if (which == "deerdogthanks") {
			append("\"THANKS!\"\n\nHe sprints away.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "deerdogokay") {
			append("\"IT'S OKAY!\"\n\nHe sprints away.");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "GatherCaves") {
			var caveName:String = pickOne(["Twisting Cavern", "Reflective Cavern"]);
			data.cavesVisited.push(caveName);
			StaticCallbacks.goCaves(caveName, brightForestHub);
		}
	}

	public static function skinSwitcher():Void {
		clear();
		var themeParts:Array<String> = ["all", "topBar", "choiceBox", "playerMenu", "mynt", "background"];
		var themeButtonPressed:Int->Void;
		var themeChoiceButtonPressed:Int->Void;
		var buttons:Array<Button> = [];
		var themeChoiceButtons:Array<Button> = [];
		var selectedPart:String = "";

		var allTheme = "";
		if (data.theme.topBar == data.theme.choiceBox == data.theme.playerMenu == data.theme.mynt == data.theme.background)
			allTheme = "("+data.theme.choiceBox+")"
		else
			allTheme = "(Mixed)";

		var themeButtonStrings:Array<String> = [
			'All '+allTheme,
			'Top Bar (${GameData.data.theme.topBar})',
			'Choice Box (${GameData.data.theme.choiceBox})',
			'Player Menu (${GameData.data.theme.playerMenu})',
			'Mynt (${GameData.data.theme.mynt})',
			'Background (${GameData.data.theme.background})'
		];
		var themeVarNameStrings:Array<String> = ["all", "topBar", "choiceBox", "playerMenu", "mynt", "background"];

		var themeButtons:Array<Button> = [];
		for (i in 0...themeButtonStrings.length) {
			var str:String = themeButtonStrings[i];

			var b:Button = Buttons.create();
			b.imagePath = "assets/img/hud/"+data.theme.background+"/choiceButton.png";
			b.label.setFormat({fontColour: Theme.getColour("mainText")});
			b.label.setText(str);

			b.sprite.onHoverOnce = function() {
				if (b.enabled) {
					StoryUtils.yesNudge([b.sprite, b.label]);
					Engine.playSound("assets/audio/ui/hover2");
				} else {
					Engine.playSound("assets/audio/ui/hoverNope");
				}
				b.sprite.applyGlowEffect(Theme.getColour("choiceText"));
			}

			b.sprite.onUnHoverOnce = function() {
				b.sprite.clearEffects();
			}

			b.result = function() {
				selectedPart = themeParts[i];
				for (j in 0...themeChoiceButtons.length) {
					var b:Button = themeChoiceButtons[j];
					if (Theme.isUnlocked(Theme.themes[j], selectedPart)) b.enable();
					else b.disable();
					b.show();
				}
				for (themeButton in themeButtons) {
					themeButton.hide();
				}
			}
			b.redraw();

			buttons.push(b);
			themeButtons.push(b);
		}

		var themeButtonSize:Point = Buttons.inGrid(20, 2, 300, 10, 20, 50, 70, themeButtons);

		/// Theme choice buttons
		themeChoiceButtons = [];
		for (i in 0...Theme.themes.length) {
			var str:String = Theme.themes[i];

			var b:Button = Buttons.create();
			b.imagePath = "assets/img/hud/"+data.theme.background+"/choiceButton.png";
			b.label.setFormat({fontColour: Theme.getColour("mainText")});
			b.label.setText(str);

			b.sprite.onHoverOnce = function() {
				if (b.enabled) {
					StoryUtils.yesNudge([b.sprite, b.label]);
					Engine.playSound("assets/audio/ui/hover2");
				} else {
					Engine.playSound("assets/audio/ui/hoverNope");
				}
				b.sprite.applyGlowEffect(Theme.getColour("choiceText"));
			}

			b.sprite.onUnHoverOnce = function() {
				b.sprite.clearEffects();
			}

			b.result = function() {
				var themePicked:String = Theme.themes[i];
				if (selectedPart == "all") {
					Theme.equipUi(themePicked);
				} else if (selectedPart == "background") {
					Theme.equipUiPart(selectedPart, themePicked);
					for (choiceButton in themeChoiceButtons) {
						choiceButton.imagePath = "assets/img/hud/"+data.theme.background+"/choiceButton.png";
						choiceButton.label.setFormat({fontColour: Theme.getColour("mainText")});
						choiceButton.redraw();
					}
					for (themeButton in themeButtons) {
						themeButton.imagePath = "assets/img/hud/"+data.theme.background+"/choiceButton.png";
						themeButton.label.setFormat({fontColour: Theme.getColour("mainText")});
						themeButton.redraw();
					}
				} else {
					Theme.equipUiPart(selectedPart, themePicked);
				}

				for (b in themeChoiceButtons) {
					b.destroy();
				}
				for (b in themeButtons) {
					b.destroy();
				}

				BrightForest.skinSwitcher();

				Main.update();
			}
			b.redraw();
			//b.align();

			buttons.push(b);
			themeChoiceButtons.push(b);
		}

		var themeChoiceButtonSize:Point = Buttons.inGrid(20, 2, 300, 10, 20, 50, 70, themeChoiceButtons);
		for (b in themeChoiceButtons) b.hide();
		hookClear(function() {
			for (b in buttons) b.destroy();
		});
		pauseGoPrev();
	}

	public static function landFillExplore(which:String):Void {
		clear();
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("BrightForest.landFillExplore('"+which+"');");

		if (which == "salvage1") {
			if (canGain) {
				addToItem("Bag o Trash", 1);
				addToItem("Nuts and Screws", rndInt(10, 20));
			}

			append("You trip and faceplant into a greasy bag of scrap metal garbage.\n\n... One man's trash...");
			addChoice("Move along.", brightForestHub);
		}

		if (which == "salvage2") {
			if (canGain) addToItem("Garbage Bag", 1);
			append("You watch a garbage bag blow in the wind and contemplate beauty.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "salvage3") {
			if (canGain) addToItem("Piss Balloon", 2);

			append("A monolithic piss-stained fridge juts from a pile of garbage. You crack it open and cool air washes over you; somehow it's still running.\n\nInside there are x2 stores of long-forgotten, well-aged urine in tied balloons, and a fine coating of tiny glowshrooms thriving on the damp cold clinging to every surface.");

			addChoice("Follow the power cord.", landFillExplore.bind("follow cord"));
		}

		if (which == "follow cord") {
			data.knownGlowElectricity++;
			append("You follow the power cord through a weaving mess of mossy antiques and broken microwaves to find the prongs engulfed in pulsing cyan mycellium. You poke a tiny shroom and sparks bite your fingertip.\n\n... They're keeping their friends alive.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "salvage4") {
			if (canGain) addToItem("Garbage Bag", 1);
			data.binsSpotted = true;
			if (data.metBins == 0) append("You find a cute little") else append ("You find Bins the");
			append(" raccoon hiding between two bulbous trashbags. He bends over and slaps his butt, winks, then scurries off.\n\nHe leaves behind x1 Garbage Bag, which you guess he was going to fill like those other two...?");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "salvage5") {
			if (canGain) addToItem("Broken Cell", 1);
			append("You peek around in a dusty abandoned office; the sign on the door says Junkyard Manager Marlene. Someone scribbled BITCH in red marker beneath.\n\nIn a drawer marked CONTRABAND you find a decently intact flip-out cell phone, though it won't turn on.");

			addChoice("Move along.", brightForestHub);
		}

		if (which == "salvage6") {
			if (canGain) addToItem("Nuts and Screws", rndInt(20, 60));
			append("Suddenly the landfill becomes the sea.\n\nThere are no waves; pillars of jagged trash break them far offshore. Circuit boards and appliances riddled with cyan plankton spit idle sparks in the still, scummy water.\n\nYou salvage a ton of good metal from the machinery.");

			addChoice("Move along.", brightForestHub);
		}

		if (data.landfillCounter < 6 && (
				which == "salvage1" ||
				which == "salvage2" ||
				which == "follow cord" ||
				which == "salvage4" ||
				which == "salvage5" ||
				which == "salvage6"
		)) data.landfillCounter++;

		if (data.landfillCounter == 6) append("\n\nYou've seen it all.");
	}

	public static function makeBouquet(seg:String):Void {
		clear();
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("BrightForest.makeBouquet('"+seg+"');");

		if (seg == "main") {
			var leaves = getItem("Sweetgrass Leaf").amount;
			if (leaves <= 0) append("You don't have any Sweetgrass Leaves. You make an imaginary bouquet and cry alone on a tree stump.");
			if (leaves == 1) append("You reach deep into the intangible pocket of your inventory and your fingers scrape nothing but empty space and one measly leaf.");
			if (leaves == 2) append("You need three more Sweetgrass Leaves to make a bouquet. This is just two leaves tied together.");
			if (leaves == 3) append("You need two more leaves to make any real progress with this thing. But, so far, you have a... a tri-leaf bouquet, you guess?");
			if (leaves == 4) append("You just need one more leaf and then you can make a bouquet! Well, you mean, you could make a lamer one with four, but you really don't want to cut corners when it comes to flower arrangement.\n\nYou heard bad things happen if you cut corners when it comes to flower arrangement.");
			if (leaves >= 5) {
				if (canGain) {
					addToItem("Sweetgrass Bouquet", 1);
					getItem("Sweetgrass Leaf").amount -= 5;
				}

				append("You tuck four curly Sweetgrass Leaves together and twist, then tie a fifth around the base in a "+pickOne(["mega", "ultra", "uber", "hyper", "super"])+"cute bow to make a Sweetgrass Bouquet!");
				if (data.metKemp > 0) append("\n\nThis would make a nice gift for that constantly stoned otter!");

				addChoice("Sniff it.", makeBouquet.bind("sniff it"));
			}

			addChoice("Make another.", makeBouquet.bind("make another"), {req: ["Sweetgrass Leaf", 5]});
			addChoice("Move along.", brightForestHub);
		}

		if (seg == "sniff it") {
			append("It's dank as fuck.");
			addChoice("Make another.", makeBouquet.bind("make another"), {req: ["Sweetgrass Leaf", 5]});
			addChoice("Good.", brightForestHub);
		}

		if (seg == "make another") {
			if (canGain) {
				addToItem("Sweetgrass Bouquet", 1);
				getItem("Sweetgrass Leaf").amount -= 5;
			}
			append("You make another bouquet. You can feel your flower arrangement prowess increasing.");

			addChoice("Make another.", makeBouquet.bind("make another"), {req: ["Sweetgrass Leaf", 5]});
			addChoice("Good.", brightForestHub);
		}
	}
}
