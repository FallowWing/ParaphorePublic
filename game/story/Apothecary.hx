package story;

class Apothecary
{

	public static function explore(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		setLocation("Tranquil Apothecary");
		saveCheckpoint("Apothecary.explore('"+seg+"');");
		var canGain:Bool = !pauseIsGoingPrev();

		/*FOREST-CITY WAR, BEHIND THE COVER STORY:\n\nPortfolk (Roxelle, Mary, Lilac, Lily) never wanted to create a safe area, initially. Forestfolk (Sep, Marei, Snagg) actually forced them to support and rally for the idea, after local rallying had failed (Dark Forest was a dark place, at the time.)\n\nThe tranquilizer attacks, ambushes, and mass espionage were all, essentially, one giant LARP, designed to occupy attentions and pass the years, but it turned partially real when Portfolk like Roxelle and Mary were systematically ridiculed or emotionally abused in regards to the false information spread by the Forestfolk, who told everyone they were the main proponents of the legally designated vanilla zone.\n\nNear the end of the war, a few weeks before the secret meeting, an espionage mission carried out by Roxelle \"accidentally\" plumbed into the Forestfolk documents. She went much deeper than the LARP rules allowed her to. There, in those documents, she found that the 'legally designated vanilla zone' would serve an entirely different purpose, besides keeping the innocent happy.\n\nAccording to these documents, that vanilla zone would also double as the petri dish for a 'biomechanical doomsday weapon,' in her words. Before anyone could verify Roxelle's claims, the documents were destroyed.\n\nThe secret meeting that ended the war is still entirely secret. No one knows how or what deal was struck. But, within a few days, the Forestfolk agreed to sacrifice their home, Dark Forest, and rebrand it as Bright Forest— while the Forestfolk themselves moved over into Junkport, economically and sociologically conquered it, and created a new haven for depravity in the form of Junk City.

		

		*/

		if (seg == "main") {
			if (!data.apoEntryGranted) {
				playMusic("apothecary");
				append("You finally get into the Apothecary's border patrol station after a five hour wait and a vigorous cavity search.\n\nA man in a pure white t-shirt smiles at you from underneath his ballcap. He smells like cleaning chemicals. He already has a paw on his tranquilizer pistol.\n\n\"Name?\"");
				
				addChoice("Do you not see it hovering above my head.", explore.bind("interrofail"));
				addChoice(data.playerName+".", explore.bind("interro1"));
				addChoice("Move along.", explore.bind("tryleave"));
			} else {
				explore("apohub");
			}
		}

		if (seg == "interrofail") {
			append("He casually tilts the pistol so that it aims at your femoral artery.\n\n\"<!i>Name?<!i>\"");
			addChoice(data.playerName+"! "+data.playerName+".", explore.bind("interro1"));
		}

		if (seg == "interro1") {
			append("\"Occupation?\"");
			addChoice("No occupation.", explore.bind("interrofail1"));
			addChoice("Wanderer.", explore.bind("interrofail1gal"));
			addChoice("I'm a professional.", explore.bind("interrofail1"));
			addChoice("Galaxy Wizard.", explore.bind("interrofail1gal"));
			addChoice("Bimbo.", explore.bind("interro3"), {toolTip: (getAction("Work") != null?"":"Apply at Septrica's"), enabled: getAction("Work") != null});
		}

		if (seg == "interrofail1gal") {
			append("\"That's not a real job.\"");
			addChoice("... <!i>sniffle<!i>...", gotoHub.bind(null));
		}

		if (seg == "interrofail1") {
			append("\"No occupation, no entry. Get a job.\"");
			addChoice("Fuck sakes.", gotoHub.bind(null));
		}

		if (seg == "interro3") {
			append("\"Excellent. We'll confirm that with the gecko herself in due time.\"\n\nHe pushes a sterile white piece of paper towards you.\n\n\"Sign here.\"");
			addChoice("Sign it.", explore.bind("interro4"));
		}

		if (seg == "interro4") {
			data.apoEntryGranted = true;
			append("He pulls the paper back and waves you through to a huge grey-green slab of concrete with a door punched into it. There's a tranquilizer addict nodding off in the corner of the doorway, and you have to toe him out of the way to actually get it open. When you look back over your shoulder, two staff members haul him up by the arms and take him back to his ward.\n\nApparently this is the entrance they use for V.I.Ps such as yourself.\n\n\"Welcome to the Apothecary.\"");
			addChoice("Look around.", explore.bind("apohub"));
		}

		if (seg == "apohub") {
			var canHelpBool:Bool = false;
			var canHelpTooltip:String = "";
			if (data.glowbunnyLLLStarted) {
				canHelpTooltip = "";
				canHelpBool = true;
			} else if (data.glowbunnyDone && !data.glowbunnyLLLStarted) {
				canHelpTooltip = "Revisit the L.L.L.";
				canHelpBool = false;
			} else if (!data.glowbunnyDone && data.johnLanaVMDone) {
				canHelpTooltip = "Find John and Lana in Bright Forest.";
				canHelpBool = false;
			} else if (data.johnLanaJCDone && !data.johnLanaVMDone) {
				canHelpTooltip = "Find John and Lana on Violet Meteorite.";
				canHelpBool = false;
			} else if (!data.johnLanaJCDone && (data.metLana > 0 && data.libraryJohnIntro)) {
				canHelpTooltip = "Find John and Lana in Junk City.";
				canHelpBool = false;
			} else if (!(data.metLana > 0 || data.libraryJohnIntro)) {
				canHelpTooltip = "Visit the L.L.L. in Junk City.";
				canHelpBool = false;
			}



			append("You're somewhere in the Tranquil Apothecary.\n\nAnd by \"somewhere\" you mean you're being kept in one tiny sterile lobby by dozens of staff with pistols. Any time you try doing your usual wandering thing, they step in your way and shoot you... a nice friendly smile, with their eyes hidden beneath the shadow of their ballcaps.\n\n");

			if (!getJournalEntries().contains("Missing Page 10")) {
				append("A staff member slips you a missing page.\n\n");
				unlockJournal("Missing Page 10");
				msg("Found Missing Page #10", true);
				playSound('assets/audio/environment/journalPage');
			}
			
			if (!getJournalEntries().contains("GlowbunnyApothecary") && data.glowbunnyLLLStarted) append("A feline voice on the P.A. system beckons you down a hallway marked TESTING CELLS, if you want to help out with their new specimen.\n\n");
			if (!getJournalEntries().contains("GlowbunnyApothecary")) addChoice("Help out with the glowbunny tests.", explore.bind("glowbunny1"), {kinks: ["Female", "Plot"], toolTip: canHelpTooltip, enabled: canHelpBool});
			if (data.glowbunnyLLLStarted && !data.apoAccosted) addChoice("Where's my nerd boys at?? You guys kidnapped them.", explore.bind("apoAccost"));
			if (!data.apoEngine) addChoice("What's that glowing thing in the big diamond upstairs?", explore.bind("apoEngine"));

			if (getJournalEntries().contains("Mourning") && data.metMarei > 0 && !getJournalEntries().contains("RedApo")) {
				append("There's some commotion in a small reception room in yet another lobby, off to your right. There aren't any staff in front of the door that leads over there.\n\n");
				addChoice("Investigate.", explore.bind("redSceneStart"));
			}

			if (getItem("Septricard").amount < 1 && getJournalEntries().contains("GlowbunnyApothecary") && !getJournalEntries().contains("mareiTour")) {
				append("A nurse flags you down at the main desk.\n\n");
				addChoice("Head over.", explore.bind("mareiTour"), {kinks: ["Plot"]});
			}/* else if (getItem("Septricard").amount < 1 && getJournalEntries().contains("GlowbunnyApothecary") && !getJournalEntries().contains("mareiTour")) {
				append("A nurse flags you down at the main desk.\n\n");
				addChoice("Head over.", explore.bind("mareiTour"), {kinks: ["Plot"], enabled: false, toolTip: "Go on a camping trip in the Sewer Suburbs."});
			}*/

			addChoice("Move along back to... a different area I guess.", gotoHub.bind(null));
		}

		if (seg == "apoEngine") {
			data.apoEngine = true;
			Theme.addUiChoice("zeit");
			append("\"The Engine,\" the P.A. says simply. \"It's all blue now, but way back in Year 0 it was pure white and grayscale robotics, sharp lines ending in dots, tiny circles, marching ants, you know. It's the physical manifestation of some very rigid systems, so... naturally, it looked all cool and robotic. Not anymore. Now it's a big fuckin blueberry jawbreaker.\"");
			addChoice("... Huh.", explore.bind("apohub"));
		}

		if (seg == "apoAccost") {
			data.apoAccosted = true;
			append("\"All former L.L.L. staff members have been temporarily sedated and placed in solitary confinement to prevent the spread of misinformation,\" the P.A. explains pleasantly. \"We'll be assigning them new positions and sexual augmentations in the near future. A cuter future.\"");
			addChoice("... Back.", explore.bind("apohub"));
		}

		if (seg == "glowbunny1") {
			unlockJournal("GlowbunnyApothecary");
			playMusic("apothecary");
			append("\"This way.\"\n\nThe slick feline voice on the P.A. beckons you through halls of white tile, past nine empty solitary confinement cells and three closed ones, through beautiful, luscious, deserted glowgardens—\n\n\"Here we are.\"\n\nYou're faced with an open vault door marked SEPTRICARD ACCESS ONLY.\n\nSomeone has already cleared the card scanner. You step inside, and the heavy white door shuts and pressurizes behind you.");
			addChoice("Examine testing room.", explore.bind("glowbunny2"));
		}

		if (seg == "glowbunny2") {
			playMusic("cell");
			data.apoTestsDone = [];
			append("\"Acquaint yourself.\"\n\nIt's white, square, well-lit, and about as quiet as the seafloor with earplugs on. There's a security camera in the upper left corner watching you. It has an odd little closed compartment on the bottom. The walls are padded, but not dented or ripped or worn anyplace; each cushion is a pristine little fluffy cloud that looks like it was installed and bleached clean just a few hours ago.\n\nA metal tray filled with stuff sits on the floor to your right.\n\nYour glowbunny sits in the far corner, wide awake.");
			addChoice("Examine bunny.", explore.bind("glowbunnyBunny"));
			addChoice("Examine tray.", explore.bind("glowbunnyTray"));
		}

		if (seg == "glowbunnyBunny") {
			var s:MintSprite = addSprite("assets/img/effect/straitjacket.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				s.x = GAME_WIDTH-s.width-10;
				s.y = 40;
			append("Wiiiiiide awake.");
			addChoice("Examine tray.", explore.bind("glowbunnyTray"));
		}

		if (seg == "glowbunnyTray") {
			var base:MintSprite = addSprite("assets/img/effect/bunnyTest/base.png");

			var cum:MintSprite = addSprite("assets/img/effect/bunnyTest/cum.png");
			cum.onHover = showToolTipOnCursor.bind("Test Hypothesis #1", pickByGenitals("Alternate Cum Sample\n<!b>Subject:<!b> John.\n<!b>Gender:<!b> Male.\n<!b>Orientation:<!b> Asexual, formerly straight.\n<!b>Health:<!b> Good.\n<!b>Sample Potency:<!b> About the potency you'd expect from a load saved up for two decades.", "", "Alternate Cum Sample\n<!b>Subject:<!b> John.\n<!b>Gender:<!b> Male.\n<!b>Orientation:<!b> Asexual, formerly straight.\n<!b>Health:<!b> Good.\n<!b>Sample Potency:<!b> About the potency you'd expect from a load saved up for two decades.")+"<!img:kink/Pregnancy.png>  Pregnancy\n\n<!img:kink/Baby.png>  Baby");
			if (data.hasCock || data.hasBoth) cum.mouseEnabled = false;
			cum.onReleaseOnce = function() {
				playSound("assets/audio/ui/topClick");
				explore("hypoPregCum");
			}

			var capsule:MintSprite = addSprite("assets/img/effect/bunnyTest/capsule.png");
			capsule.onHover = showToolTipOnCursor.bind("Test Hypothesis #1", "<!img:kink/Pregnancy.png>  Pregnancy\n\n<!img:kink/Baby.png>  Baby");
			if (data.hasCunt) capsule.mouseEnabled = false;
			capsule.onReleaseOnce = function() {
				playSound("assets/audio/ui/topClick");
				explore("hypoPreg");
			}

			var rat:MintSprite = addSprite("assets/img/effect/bunnyTest/rat.png");
			rat.onHover = showToolTipOnCursor.bind("Test Hypothesis #2", "<!img:kink/Feral.png>  Feral\n\n<!img:kink/Vomit.png>  Vomit\n\n<!img:kink/Soft Vore.png>  Soft Vore\n\n");
			rat.onReleaseOnce = function() {
				playSound("assets/audio/ui/topClick");
				explore("hypoPuke");
			}

			var button:MintSprite = addSprite("assets/img/effect/bunnyTest/button.png");
			button.onHover = showToolTipOnCursor.bind("Test Hypothesis #3", "<!img:kink/Cub.png>  Cub\n\n<!img:kink/Cub.png>  Cub\n\n<!img:kink/Cub.png>  Cub");
			button.onReleaseOnce = function() {
				playSound("assets/audio/ui/topClick");
				explore("hypoBunnies");
			}

			var noteBase:MintSprite = addSprite("assets/img/effect/bunnyTest/noteBase.png");
			noteBase.onReleaseOnce = function() {
				playSound("assets/audio/ui/journalPage");
			}
			noteBase.onHover = showToolTipOnCursor.bind((data.apoTestsDone.contains(1)?"<!b>Hypothesis #1:<!b> Verified.":"<!b>Hypothesis #1:<!b> Anything submerged in the Subject's uterine fluid becomes infected.")+"\n\n"+(data.apoTestsDone.contains(2)?"<!b>Hypothesis #2:<!b> Verified.":"<!b>Hypothesis #2:<!b> Anything submerged in the Subject's stomach acid becomes infected.")+"\n\n"+(data.apoTestsDone.contains(3)?"<!b>Hypothesis #3:<!b> Verified.":"<!b>Hypothesis #3:<!b> Subject will attempt to submerge anything it sees, including loved ones."), "");

			var noteCheck1:MintSprite = addSprite("assets/img/effect/bunnyTest/noteCheck.png");
			var noteCheck2:MintSprite = addSprite("assets/img/effect/bunnyTest/noteCheck.png");
			var noteCheck3:MintSprite = addSprite("assets/img/effect/bunnyTest/noteCheck.png");
			for (s in [base, cum, capsule, rat, noteBase, button]) {
				s.x = GAME_WIDTH-s.width-10;
				s.y = GAME_HEIGHT-s.height-110;
				s.update();
			}
			
			var noteCheckY:Float = 74;

			for (s in [noteCheck1, noteCheck2, noteCheck3]) {
				s.x = base.x+222;
				s.y = base.y+noteCheckY;
				noteCheckY += 14;
				s.alpha = 0;
			}

			if (data.apoTestsDone.contains(1)) {
				noteCheck1.alpha = 1;
				capsule.alpha = 0;
				capsule.mouseEnabled = false;
				cum.alpha = 0;
				cum.mouseEnabled = false;
			}
			if (data.apoTestsDone.contains(2)) {
				noteCheck2.alpha = 1;
				rat.alpha = 0;
				rat.mouseEnabled = false;
			}

			if (data.apoTestsDone.contains(3)) {
				button.alpha = 0;
				button.mouseEnabled = false;
				noteCheck3.alpha = 1;
			}

			if (data.apoTestsDone.length < 1) append("\"Our preliminary experiments were successful. As we suspected, submerging rats in her saliva, urine, blood, and fecal matter resulted in their infection. We have only three tests left:\n\n1. Get her pregnant and check the offspring for infection.\n\n2. Feed her a rat and then bring it back up and check it for inspection.\n\nThose will determine if her uterine fluid and stomach acid are infected. The third and final test will involve some bunnies that haven't arrived yet. You'll know what to do when they get here.\"");
			if (data.apoTestsDone.length == 1) append("\"Two tests remaining.\"");
			if (data.apoTestsDone.length == 2) {
				append("\"Reassuring results. Now we'll begin the third test.\"");
			}
			addChoice("Examine tray.", explore.bind("glowbunnyTray"));
		}

		if (seg == "hypoPregCum") {
			append("You take the little vial of cum. There's a label on the back...\n\n<!b>Subject:<!b> John.\n<!b>Gender:<!b> Male.\n<!b>Orientation:<!b> Asexual, formerly straight.\n<!b>Health:<!b> Good.\n<!b>Sample Potency:<!b> About the potency you'd expect from a load saved up for two decades.\n");
			addChoice("Next.", explore.bind("hypoPreg"));
		}

		if (seg == "hypoPreg") {
			data.apoTestsDone.push(1);
			if (canGain) addToItem("Capsule", 1);
			append("\"Use a capsule to speed up the process.\"\n\nYou pinch that little pink bean between your thumb and forefinger and bring it over to the bunny. Seems like they have her doped up on a sweetgrass tranquilizer I.V. drip, super low dosage, just enough to make her a dozy non-threat. She looks up at you with her glassy opaque eyes and drools, maw hanging open in a stupid smile.");
			addChoice("Slip the capsule into her maw.", explore.bind("hypoPreg2"), {cost: ["Capsule", 1]});
			addChoice("Fingerfuck the capsule down her throat.", explore.bind("hypoPregFinger"), {cost: ["Capsule", 1]});
		}

		if (seg == "hypoPregFinger") {
			append("You grab her by both ears with a fist and force the little cap right to the back of her mouth. She gags hard and her legs shoot out to either side, spreading to reveal that taut bunnypuss. Her blunt teeth work harmlessly against your wrist in drugged confusion. She clearly isn't in any position to take two fingers down her throat, but you don't care.\n\nWith your pointer and index fully erect, you begin to massage the back of her tongue and coax that tight, overgrown esophagus into opening up for you. Your fingers slide down inside her, bulging out the fur of her neck.\n\n\"There we go... make her gag...\" the P.A. mumbles. A zipper unzips.\n\nThat's easy. All you have to do is double the strength of your grip, yank her ears down so her mouth opens as wide as it can, and rape her esophagus open with your fingers. In moments she's squirming and gagging hard, burbling over with blue saliva and bile, burping up greasy mushrooms that slide down your wrist and forearm.\n\nWith a showmanlike flourish you unplug your fingers— <!i>hrrrrkkkkkPOP~<!i>— and wipe the blue bile off on her face.");
			addChoice("Next.", explore.bind("hypoPreg2"));
		}

		if (seg == "hypoPreg2") {
			append("She swallows and gasps as the cap undoubtedly slides down into the pit of her belly and starts to dissolve.\n\n\"Good,\" the P.A. says. \"Now she needs some cum.\"");
			if (data.hasCunt) {
				addChoice("Can I get a turkey baster or something here?", function(){ append("\n\n\"Just use your fingers.\""); }, {oneTime: true});
				addChoice("Finger some spooge up into that coochie.", explore.bind("hypoPregCunt"));
			} else {
				addChoice("Warm her up.", explore.bind("hypoPregCock"));
			}
		}

		if (seg == "hypoPregCunt") {
			append("You dip your digits deep into the ol spooge jar like Pooh Bear would with a pot of honey and bring em out soaked from knuckle to tip with chilled, viscous dog jizz.\n\nShe feels the chill the moment your fingers touch her cuntlips. Her legs twitch closed and shivers run up the insides of her thighs.\n\nYou start pushing, but it's frustratingly tedious work to get her to open up for you. Jeez. It's only three fingers, and they're even lubed. What more could you want?\n\nYou get fed up, grab her by the sleeves of her straitjacket, and yank her whole body forward. With a pitiful little squeak and a rather taut queef she takes all three of your fingers right to the core of her cunt, shivering and clenching on them and, by extension, forcing creamy globs of doggy cum to squirt out over your knuckles.");
			addChoice("Ahhh, there. Next.", explore.bind("hypoPregEnd"));
		}

		if (seg == "hypoPregCock") {
			append("You gently pull her tied sleeves out of the way and get a look at her cunt. It's fresher and cleaner than you expected. Not a spot of glowmoss in sight. The swollen, white-furred curves of this plump little apple are so pristine, you don't think you'd ever suspect that the rest of her was infected. It's just so pure and beautiful and—\n\nYou drive a finger right to its core and twist hard, making sure to yank at her g-spot. She squeals and tenses up. Her muscles ripple over your finger and pull it right in, down to the knuckle.\n\nYou start pumping it.\n\nThe P.A. fumbles on, then off, then on again. There are wet and sloppy masturbation noises in the background.\n\"Unf. Unf. Unf. Ya. Come on, deeper. For science. Oh, yeah. Right in there. Her cunt's not stretched enough, is it? She needs a dick in her. Unnnya. She—\"");
			addChoice("Okay ignore the P.A.", explore.bind("hypoPregCockIgnore"));
			addChoice("Yeah she does. Look how soaked my finger is. (Hold it up to the security camera.) Fuckin zombunnyslut loves this. You want my dick, hun? Do ya? Course you do... open your legs.", explore.bind("hypoPregCock2"));
		}

		if (seg == "hypoPregCockIgnore") {
			append("You tune out the dopey dirty talk.\n\n... In order to move forward with the test, though, she <!i>does<!i> need a dick in her.");
			addChoice("Penetrate her.", explore.bind("hypoPregCock2"));
		}

		if (seg == "hypoPregCock2") {
			append("\"Yes! YES! Oh— is this thing on? Oop—\"\n\nBecause it's cute, you slip your head and upper body through the circle of her tied arms, which kinda makes it look like she's holding onto you for support while you slowly feed her inch after inch of your dick. You feel the liquid fertility of the capsule as a tingling, distinctly \"pink\" sensation that skitters along the bulge of every vein in your cock. The capsule's material has long since diffused into her bloodstream, but now it's interested in yours.\n\nSilly semi-autonomous pregnancy drug. You aren't the one getting knocked up here.\n\nWith her warm, straitjacketed arms around your neck and shoulders, and with her back pressed firmly to the padded wall, no amount of squirming will get her away from the first onslaught of thrusts. With one hand caressing the small of her lower back and the other wiping cuntjuice off on the back of her tongue, you hold her still and fuck her pregnant. \"Fucking her pregnant\" doesn't necessarily mean you've cum yet, just that you have no intention at all of pulling out when you're ready to cum, and you think intention defines the act.\n\nYou get the urge to grope her tummy. There's no way you'd pull your fingers out of her throat, since she's making such adorable little choking noises while she cleans her juices from them, but you happily move your other hand from her back to her smooth, furry belly, running two fingers over and inside her innie, feeling the flatness where there will soon be a growing bulge.\n\nThe P.A. fumbles on and off again for a moment. In that moment, you hear the <!i>schlickschlickschlick<!i> of a paw stroking against a pre-slick cock in frantic crescendo.");
			addChoice("Cum.", explore.bind("hypoPregCock3"));
		}

		if (seg == "hypoPregCock3") {
			cumEffect();
			append("You slam her up against the wall and drive the breath from her diaphragm with a single thrust. Her cunt tightens and tries to force your cock out but it only ends up milking you harder. Your nuts throb and clench up in a merciless rhythm. The only audible part of that rhythm is the sound your "+(isActive("Mood Ring")?getMood("You"):"thick ")+"cumglobs make as they overflow her tunnel and trickle onto the padded floor.\n\nShe stops breathing.\n\nYou're worried for a moment. Is her straightjacket too tight? Is she crushed too viciously against the wall?\n\nAh. No, everything is fine. Your cock just made her go into shock for a moment, that's all.\n\nShe sucks in a rattling, effortful breath. Her diaphragm has to compete with you for her inner real estate. Just as soon as she's filled her lungs, they empty again, and her hot, herbal forest breath washes over your finger. Even the pitiful, fucked-raw noise she makes when she exhales is slurred by her sedation.\n\nThe P.A. clears its throat. \"That's enough. Notice her belly.\"");
			addChoice("Oh shit. Examine preggo bunny belly.", explore.bind("hypoPregEnd"));
		}

		if (seg == "hypoPregEnd") {
			append("Her belly is already surging outward. Her innocent little innie becomes a swollen, obscene outie.\n\n\"Come on. Feel it. Tactile observations are a very important part of our tests, you know.\"\n\nYou run your hands over her flat chest, until your fingertips brush up against the growing mound of her pregnancy. It's much warmer than the rest of her. You guess when a baby develops this fast, it must exude a lot of energy. You drag your palms over that warmth super carefully, making sure not to ruffle her fur in the wrong direction, lest it lose its perfect smoothness.\n\n\"How does it feel?\"");
			addChoice("Warm.", explore.bind("hypoPregEnd2"));
			addChoice("Hot.", explore.bind("hypoPregEnd2"));
			addChoice("Ripe.", explore.bind("hypoPregEnd2"));
			addChoice("Kinda like a big buttcheek.", explore.bind("hypoPregEnd2"));
		}

		if (seg == "hypoPregEnd2") {
			append("Scientific notes are taken. (Sounds of scribbling come through the P.A., anyway. You guess it could be scientific doodling too.)\n\nYour glowbunny's arms strain against the straightjacket. She throws them up with a <!i>fwip<!i> and holds them against the wall. Her legs spread wide and quiver. Her face scrunches up. The surface of her belly strains like an inflating balloon beneath your fingers.\n\n\"She's ready. Stand back.\"");
			addChoice("Stand back.", explore.bind("hypoPregEnd3"));
			addChoice("Wiggle my head down between her legs and let her give birth on my face.", explore.bind("hypoPregEndFace"), {kinks: ["Baby"]});
		}

		if (seg == "hypoPregEnd3") {
			append("You stand back. And kind of look away, too.\n\nYou hear a few deep grunts. Some pleasured rabbit-squeaks. Annnnd...\n\n<!i>Plop.<!i>\n\nThe Fuckmeat lands safely on the padded floor.");
			addChoice("Examine Fuckmeat.", explore.bind("hypoPregEnd4"));
		}

		if (seg == "hypoPregEndFace") {
			append("You... well, alright...\n\nYou grab her by the knees and yank her legs open, stuffing your face right up against her cum-clogged cuntlips. It's only second nature to let your tongue snake out and slurp some of it up, of course.\n\nA sound like whining computer fans leaks from her gritted teeth, and, with a squirty little birthgasm, she forces out the crown of her Fuckmeat's head right into your mouth. You have no choice but to let the smooth, wet fur of the baby's floppy bunny ears slide over your lips like two freshly boiled lasagna noodles. While you do have some choice on whether or not to close your mouth, you find it practically impossible to resist another mouthful of sweet, glowing wombslime... so you keep your mouth open and let the rest of the newborn's tiny, pudgy body grind over your tongue: her confused face, her chest, her squishy belly, and her positively miniscule little cunt.\n\n<!i>Plop.<!i>\n\nShe lands safely on the padded floor.");
			addChoice("Examine Fuckmeat.", explore.bind("hypoPregEnd4"));
		}

		if (seg == "hypoPregEnd4") {
			append("The glowbunny's baby looks around for a moment, completely disorientated.\n\nNow this is interesting: her eyes aren't opaque like her mom's. Her body seems free of shroom colonies. Her—\n\nOh.\n\nNevermind.\n\nYou see them now, where before you only saw blue wombjuices: little mushrooms are popping up all over her. They're sprouting from her armpits, her thighs, the top of her buttcrack, any crevice they can find. They're all about the size of a pinhead, but quickly puffing up and out as their caps expand. You look into her eyes and watch blue cataracts slowly fog them over. She reaches out to you, for a moment. Then her paw drops.\n\n\"Ah,\" the P.A. laments. \"We were expecting this.\"");
			addChoice("...", explore.bind("hypoPregEnd5"));
		}

		if (seg == "hypoPregEnd5") {
			append("The P.A. stops talking for a moment. More scribbling. Then:\n\n\"It's time for the next test. Please bring the Fuckmeat over to the door. A staff member will collect her for further testing.\"");
			addChoice("Alright...", explore.bind("glowbunnyTray"));
		}

		if (seg == "hypoPuke") {
			data.apoTestsDone.push(2);
			append("You peek into the rat's cage. He's a little nervous.\n\n\"Take him out. Two hands, now. He's a slippery bastard.\"");
			addChoice("Take him out.", explore.bind("hypoPuke2"));
			addChoice("I don't want to do this.", explore.bind("hypoPukeReluc"));
		}

		if (seg == "hypoPukeReluc") {
			append("\"Why not?\"");
			addChoice("I don't like vore.", explore.bind("hypoPukeReluc2"));
			addChoice("I don't like puke.", explore.bind("hypoPukeReluc2"));
			addChoice("I don't like hurting animals.", explore.bind("hypoPukeReluc2a"));
		}

		if (seg == "hypoPukeReluc2") {
			append("\"Ah, no problem. Just get Mynt to skip it for you.\"");
			addChoice("Oh. Okay! Thanks Mynt.", explore.bind("hypoPukeSkip"));
		}

		if (seg == "hypoPukeReluc2a") {
			append("\"Ah, no problem. Just get Mynt to skip it for you.\"");
			addChoice("Oh. Okay! Thanks Mynt.", explore.bind("hypoPukeSkip"));
			addChoice("\"Skip it\" implies it still happens, I just don't get to see. I don't want it to happen at all.", explore.bind("hypoPukeReluc3"));
		}

		if (seg == "hypoPukeReluc3") {
			append("\"Let me make something very clear: if we don't figure out the exact methods of infection, glowvirus may overtake the entire island. Look at the bunny. She's as good as braindead. You want everyone to end up like that via means we can't understand because you were too much of a pussy to go through with the tests for it?\"");
			addChoice("... But it's such a cute rat...", explore.bind("hypoPukeReluc4"));
		}

		if (seg == "hypoPukeReluc4") {
			append("\"We're all cute. And we want to stay cute. Unlike her. So let's all work together, infect rats when necessary, and pray for a cuter future.\"");
			addChoice("... Fine, just skip me through it.", explore.bind("hypoPukeSkip"));
		}

		if (seg == "hypoPukeSkip") {
			append("You feed the rat to her, let it percolate for twenty seconds, then retrieve it without any sexualization.\n\nThe P.A. huffs disappointedly.");
			addChoice("Examine rat.", explore.bind("hypoPukeEnd"));
		}

		if (seg == "hypoPuke2") {
			append("He sniffs at your hands. His little tongue even slips out and licks them.\n\nHe flops onto his back and exposes his tiny rat ween.");
			addChoice("Pick him up.", explore.bind("hypoPuke3"));
			addChoice("... Is <!i>everything<!i> on this island a slut?", explore.bind("hypoPukeIsland"));
			addChoice("Twiddle his dink.", explore.bind("hypoPukeTwiddle"));
		}

		if (seg == "hypoPukeIsland") {
			append("\"Hey. We can't help it. It's built into the engine.\"");
			addChoice("Pick him up.", explore.bind("hypoPuke3"));
			addChoice("Twiddle his dink.", explore.bind("hypoPukeTwiddle"));
		}

		if (seg == "hypoPukeTwiddle") {
			append("You tickle his little tic-tac with your pinky fingertip. He stretches his arms out and shivers with pleasure, tail twitching.\n\n\"Stop fooling around.\" The P.A. sounds amused.");
			addChoice("Sorry. Carry on with the test and pick him up.", explore.bind("hypoPuke3"));
		}

		if (seg == "hypoPuke3") {
			append("You get the rat mostly secure between your palms, although he tries his best to keep wiggling around and humping along the crevice of your life lines.\n\nThe glowbunny looks up at you dazedly as you approach her. You hold the rat out, just in front of her maw.");
			addChoice("Come on. Eat up.", explore.bind("hypoPuke4"));
		}

		if (seg == "hypoPuke4") {
			append("She starts sucking the rat's cute little face, slowly, clumsily pulling him out from between your palms...\n\nSoon she has half his body between her lips, and only his fat rat butt and tail are left visible. They sway back and forth elatedly. Something about the warmth and wetness is really titillating him, you guess.");
			addChoice("Push the rest of him in with a finger.", explore.bind("hypoPuke5"));
		}

		if (seg == "hypoPuke5") {
			append("You tilt the bunny's chin up and prod the rat in deeper with a finger against his microscopic butthole. The pleasure of finally accomplishing her goal of swallowing something whole + the sedatives coursing through her = one happy bunny. She wiggles in her straightjacket as the lump slips easily down her gullet and lands with a muffled <!i>plop<!i> in the bottom of her stomach.\n\n\"Give it twenty seconds.\"");
			addChoice("Next x2.", explore.bind("hypoPuke6"));
		}

		if (seg == "hypoPuke6") {
			playSound("assets/audio/environment/elevator");
			append("\"Okay. Should be ready. Go ahead and coax it out.\"\n\n(You imagine the ding of a microwave.)");
			if (data.hasCock || data.hasBoth) addChoice("Facefuck her til she pukes.", explore.bind("hypoPukeFuck"));
			addChoice("Nauseate her with my butt.", explore.bind("hypoPukeAss"), {kinks: ["Raunch"]});
		}

		if (seg == "hypoPukeFuck") {
			append("You start by "+pickByGenitals("shoving your nuts in her face and grinding them all over", "howd you get here with a cunt?", "plopping your cock and nuts down on her head and grinding your cunt allllll over her face")+". Her maw works slowly and automatically over your flesh, open and closed. Soon your "+pickByGenitals("sack drips with azure drooldrops", "howd you get here with a cunt?", "pussy drips with azure drooldrops")+", all shiny and warm between her lips. She's slow to realize how thick the coating is, but when she does, she makes a noise like a dumb, happy monkey and "+pickByGenitals("sucks both your nuts almost to the back of her throat", "howd you get here with a cunt?", "moves up to coat more surface area: your nuts. Her lips wrap around them in a flash, and she sucks them both to the back of her throat.")+"\n\nYou run a hand between her ears and leave her like this for a moment. Her enthusiasm never wanes. Even after slurping your sack for ten minutes, she still tugs and <!i>churp<!i>s and works them in deeper with her tongue as if she'd just gotten at them after watching them dangle tantilizingly above her maw for hours prior.\n\nSometimes she'll let her excess drool slop out over your "+pickByGenitals("taint", "howd you get here with a cunt?", "cunt")+". But when she doesn't, she swallows it... and watching that little bulge of fluid slide down, watching her adam's apple work... it reminds you of your job here.");
			addChoice("Facefuck.", explore.bind("hypoPukeFuck2"));
		}

		if (seg == "hypoPukeFuck2") {
			append("You (gently, gently!) wrestle your nuts out of her hungry maw. In about ten seconds, after she realizes she's sucking on air, a pitiful complainy noise wheedles up from her belly. She clearly wants something else in her mouth right now.\n\nYou run a hand over your soaked nuts, squeeze them, and then move your grip up to the base of your cock. You aim for her lips, which have already started slobbering over your head, and push.\n\nYou get about three inches deep before you hit the back of her throat. She's just so slow... her lips are still slipping back and forth tiny amonts, like they're still just wrapped around your head.");
			addChoice("Force it.", explore.bind("hypoPukeFuck3"));
			addChoice("Wait for her to catch up and open her throat.", explore.bind("hypoPukeFuck3wait"));
		}

		if (seg == "hypoPukeFuck3wait") {
			append("...\n\nAlright, that might be long enough. You push again... and...\n\nNope. Brick wall.\n\n\"Are you trying to make her puke or not?\" the P.A. chides. \"We do have some time to mess around, but that rat won't stay undigested forever.\"");
			addChoice("Alright, thrust.", explore.bind("hypoPukeFuck3"));
		}

		if (seg == "hypoPukeFuck3") {
			append("You rock your hips forward hard enough to bang the back of her head off the wall. Your head smushes up against her uvula. She still won't open up.");
			addChoice("Ugh. Grab her ears and rape it open.", explore.bind("hypoPukeFuck4"));
		}

		if (seg == "hypoPukeFuck4") {
			append("Oh! She finally caught up with these new developments. Her eyes go wide and blink as if the cock straining against the back of her throat just suddenly appeared here a second ago. She happens to open wide in the very same moment that you wrap a fist around both of her ears and yank her face so deep into your crotch that her lil button bunnynose scrunches up against your pubic bone and your cock bottoms out at the very base of her throat.\n\nThere's no stopping this momentum now. All this gagging warmth wrapped around your dick is just too much pleasure too fast. Even though she's cooperating now you still fuck her face like it's rape, beating her gag reflex over and over with each thrust, spilling hot blue drool over your nuts and down your inner thighs.\n\nShe coughs and chokes on your dick. Her sensitive ears twitch between your fingers, overwhelmed by the loud, wet noises coming from her own mouth. Over and over you see the same thing happening on the surface her belly: a ripple, a twitch, a nauseated convulsion...");
			addChoice("Don't stop. Make her puke.", explore.bind("hypoPukeFuck5"));
		}

		if (seg == "hypoPukeFuck5") {
			append("Oh! She finally caught up with these new developments. Her eyes go wide and blink as if the cock straining against the back of her throat just suddenly appeared in her mouth a second ago.\n\nShe happens to open wide in the very same moment that you wrap a fist around both of her ears and yank her face so deep into your crotch that her lil button bunnynose scrunches up against your lower stomach and your cock bottoms out at the very base of her throat.\n\nThere's no stopping this momentum now. All that gagging warmth wrapped around your dick is just too much pleasure too fast; even though she's cooperating now, you still rape her face just as hard as you were planning to, beating her gag reflex over and over with each thrust, spilling hot blue drool over your nuts and down your inner thighs.\n\nShe coughs and chokes on your dick. Her sensitive ears twitch between your fingers, overwhelmed by the loud, wet noises coming from her own mouth. Over and over you see the same thing happening on the surface her belly: a ripple, a twitch, a nauseated convulsion...");
			addChoice("Don't stop. Make her puke.", explore.bind("hypoPukeFuck6"));
		}

		if (seg == "hypoPukeFuck6") {
			append("Wondrous spasms wiggle their way up her throat as the first wave of "+(isActive("Candy Ring")?"fruit salad":"hot brown forest gunk")+" splurts out around your dick and in two tiny jets from her nostrils. You still don't stop. It only makes her hole feel that much better to have it filled with hot, squishy stuff... and besides, you'll feel the rat when it comes up, and the job ain't done until then.\n\nEven as she squirms in her straitjacket and makes the most abhorrent gurgles you keep her held in place by the ears and make sure her little throat never goes a second without cock or "+(isActive("Candy Ring")?"bright-colored fruit salad":"vomit")+" rushing through it. The easier "+(isActive("Candy Ring")?"fruits":"chunks")+" start to run out; now the contents of her belly are plastered down her front, and it's empty except for one thing.");
			addChoice("Unplug.", explore.bind("hypoPukeFuck7"));
		}

		if (seg == "hypoPukeFuck7") {
			append("You yank your dick out of her maw and wipe your nuts off on her gasping face.\n\nShe doubles over and <!i>hrrrrrrrkkkkkkkkss....<!i>\n\nAnd... miraculously... a tiny lump begins to travel up her throat, towards her gagging, fucked-open mouth. Two seconds later she gives oral birth to your little rat buddy— seriously, her throat clenches so hard it looks like it's going through contractions— and he lands in a bewildered little clump of leaves on the floor.\n\n\"... Good job,\" the P.A. says, sounding a little bewildered too.");
			addChoice("Examine rat.", explore.bind("hypoPukeEnd"));
		}

		if (seg == "hypoPukeAss") {
			append("\"What are you...? Oh.\"\n\nYou turn around and let your ass hover right in her face. She blinks, sniffs, doesn't understand.\n\nSlowly, you work a hand over the back of her skull. Soft fur and mushy mushrooms slip between your fingers. You pull her forward against your ass. Her little bunny snout sinks in smoothly between your cheeks, deeper, deeper, til the cool dot of her nose snugs up right against your pucker.\n\nShe gags and gasps hard. The invisible currents and swirls of airflow feel especially chilly against the slightly-sweaty curves of your ~big chunky grundle~ and now and then a particularly desperate gasp will tickle your "+pickByGenitals("nutsack", "cuntlips", "cunt and nutsack")+". For a while, this works for her. She actually does manage to clear all the hot "+(isActive("Candy Ring")?"candy-scent":"buttmusk")+" out of her lungs with enough breaths.\n\nThat moment ends with one backwards buck of your hips. Your cheeks envelop either side of her head, hiding it completely from the sight of the security camera, but that's okay... her face isn't important just now. In fact, it's about as important as a "+(isActive("Candy Ring")?"disposable paper candy bowl":"slice of toilet paper")+".\n\nYou ram your ass back hard. Your hole opens and takes half her snout into its "+(isActive("Candy Ring")?"sweeter":"more pungent")+" depths, and you feel her panicked huff-huff-huffs inside you.");
			addChoice("Start grinding around in wide circles.", explore.bind("hypoPukeAss2"));
		}

		if (seg == "hypoPukeAss2") {
			append("\"This has got to be the most roundabout way I've ever seen...\"\n\nAnd arrrooooouuuund it goes~! Your "+pickByGenitals("cock and nuts sway back and forth, papping against one thigh then the other", "cuntlips twitch and drip with happy juice", "cock and nuts sway back and forth, papping against one thigh then the other")+" as you swing your hips around her helpless face and force it back against the wall in the most nauseating way possible. Droplets of "+(isActive("Candy Ring")?"some sweet, bright-colored candy juice":"viscous ass sweat")+" wander down over her repeatedly tensing throatmuscles. Over and over she comes close to resisting a gag and then caves to the pressure and lets it out with a cute, reluctant cough.\n\nShe just can't do it anymore. She can't fight your impeccable rhythm. A gurgling torrent of "+(isActive("Candy Ring")?"blue taffy":"puke")+" rockets from her buried snout and fills your ass in seconds. The security camera tilts and cranes down a bit to get a better angle on her throat, searching, searching...\n\nThe lens contracts and catches sight of a rat-sized bulge as it makes its way up and out. The sheer wiggliness of the poor thing sends spasms through her body as she glrks and gurgles and finally manages to "+(isActive("Candy Ring")?"push it up your ass with the rest of the hot, stretchy taffy":"barf it up your ass")+".");
			addChoice("Oooooh jeez. Pop a squat.", explore.bind("hypoPukeAss3"));
		}

		if (seg == "hypoPukeAss3") {
			append("At last, you peel your ass off her face. She slumps back against the wall, eyes pointed in opposite directions, chin and chest coated with "+(isActive("Candy Ring")?"colorful taffy":"steaming puke")+".");
			addChoice("Examine rat.", explore.bind("hypoPukeEnd"));
		}

		if (seg == "hypoPukeEnd") {
			append("He's a little out of it at first. Then he's very, very out of it.\n\nMushrooms wiggle their way out of his fur. Their caps pop open so they can attempt to take in whatever energy they can from the fluorescent light.\n\nConfused, reluctant, the rat hobbles forward and starts deepthroating your pinky toe in an utterly ridiculous attempt to swallow you like he was just swallowed.\n\n\"Verified,\" the P.A. mumbles... \"but at what cost...\"");
			addChoice("Examine tray.", explore.bind("glowbunnyTray"));
		}

		if (seg == "hypoBunnies") {
			data.apoTestsDone.push(3);
			append("You click the little button on the tray and a light clacks on outside the vault door.\n\n\"We're ready,\" the P.A. says to someone else. \"Bring them in.\"\n\nThe vault door opens with a pressurized hiss. Two bunnyboys and a bunnygirl step inside, fidgeting, looking around all paranoid.\n\n"+(getJournalEntries().contains("Fingerpainting")?"You remember them from the forest, they were fingerpainting with glowberries. They wave at you sheepishly.":"Two introduce themselves, boy and girl, talking over each other with nervous excitement. They do a lot of fingerpainting with glowberries, and this glowbunny is their older sister, and they were fingerpainting her body when she went all \"funny.\"\n\nThey don't seem to see her yet, with her white straitjacket against the white wall."));
			addChoice((getJournalEntries().contains("Fingerpainting")?"Hey again!":"Ah! That's a pivotal clue!"), explore.bind("hypoBunnies2"));
		}

		if (seg == "hypoBunnies2") {
			append("One of the boys shrieks and almost falls over. He had been nervously poking the padded wall opposite you, completely oblivious.\n\nThe other two laugh at him, but it's a little strained.\n\n\"Hi hey sorry,\" he says, composing himself. \"This place is just... scary, y'know... got a reputation...\"\n\n\"Where's our sister?\" the girl asks.");
			addChoice("See that barely moving lump of fabric against the far wall?", explore.bind("hypoBunnies3"));
		}

		if (seg == "hypoBunnies3") {
			append("... They look at her. Then they look back at you.\n\n\"We're in trouble, aren't we...\"");
			addChoice("I don't know.", explore.bind("hypoBunnies4"));
		}

		if (seg == "hypoBunnies4") {
			append("The P.A. crackles on: \"Let's start the test. Don't worry kids, "+data.playerName+" is there to protect you. Just get a little close to her and we'll see if she can recognize you in any way. She should. She really should.\"");
			addChoice("Guide them closer.", explore.bind("hypoBunnies5"));
		}

		if (seg == "hypoBunnies5") {
			append("They huddle behind you as you slowly approach. The glowbunny keeps twitching around, sensing the presence of smaller and potentially easier-to-swallow victims in her vicinity, and it's scaring her little brothers and sister even more than this daunting, high-security complex already has.\n\nYou make sure to stay between her and her siblings at all times. Slowly, one step at a time, the distance between you and that slack, yawning, mushroom-packed maw closes to just a foot or two.\n\n\"Now, carefully... one of you... expose yourself.\"");
			addChoice("Next.", explore.bind("hypoBunnies6"));
		}

		if (seg == "hypoBunnies6") {
			append("The boy bunny who you scared earlier steps bravely forward, eager to prove he's not a little pussy after all.\n\n\"A little closer.\"\n\n... He looks up at the camera. Then down at his soft little feet. Then he scoots one step closer, til his toes almost touch the glowbunny's.\n\n\"Hello?\" he asks her, voice cracking. \"Did we... did we really do this to you?\"");
			addChoice("Next.", explore.bind("hypoBunnies7"));
		}

		if (seg == "hypoBunnies7") {
			append("The glowbunny cocks her head at him and works her jaw over empty air. She leans forward, arms tugging lazily against her jacket, and then flops back against the wall. She doesn't seem any different than when you approached her.\n\n\"Touch her,\" the girl urges him.\n\nHe places a quivering paw on her head, touch-and-go, as if it's a hot burner. She seems a little annoyed, but that's it.\n\n\"Come on,\" he whispers. \"It's me... don't you remember me, sis...?\"");
			addChoice("Next.", explore.bind("hypoBunnies8"));
		}

		if (seg == "hypoBunnies8") {
			append("Everyone's so tense, so tightly huddled together, watching the glowbunny's slow, unnatural movements... you're all just waiting for her to suddenly snap out of her drugged stupor and lunge forward and bite his hand clean off when—\n\nThe P.A. blares \"Welp this is terrifying.\"\n\nAll four of you have a mini heart-attack. The boy yanks his arm away full-force and then rides the momentum into an elaborate improvised pirouette escape maneouver. He ends up plastered against the wall opposite the glowbunny, panting with terror.\n\n\"I know, right? This throws our entire \"glowvirus\" idea out the window. We can now be sure she's operating on an entirely different set of base behaviours. If this was only a virus— a generic, surface-level behavioural change which still used her basic self as a starting point— we could at least expect the remaining crumbs of her psyche to flare up at the sight of family members and provoke a meaner response, a faster response, slower, weirder... any difference would have been reassuring, even if she did eventually end up trying to infect you...\"\n\nThe girl and the other boy are heartbroken, watching her. She's rocking back and forth now, bouncing her shoulder blades off of the spongy wall and making dumb little involuntary grunts every time it connects. Her opaque eyes roll back and forth between the cubs.\n\nThey all refuse to look at her now. They turn their stony faces back to the vault door.");
			addChoice("What if she just didn't value her family that much?", explore.bind("hypoBunnies9big"));
			addChoice("You're going off a sample size of one test here.", explore.bind("hypoBunnies9one"));
			if (data.apoTestsDone.length > 0) addChoice("She seemed like she felt things a few times during the other tests...?", explore.bind("hypoBunnies9felt"));
		}

		if (seg == "hypoBunnies9big") {
			append("\"It's not an option. This is her defined family— sorry, 'defined' means coded into her at a very basic level. If we spawned her for the first time ever, at this moment, she'd still recognize them. The fact that she doesn't recognize them means her psyche has either been rerouted or excised entirely.\"");
			addChoice("Oh... well, when you put it that way...", explore.bind("hypoBunniesEnda"));
		}

		if (seg == "hypoBunnies9one") {
			append("\"You're right. I hope I'm just jumping to conclusions. We'll be doing secondary and tertiary tests in a few hours.\"\n\nThe bunny cubs look at each other.");
			addChoice("Oh...", explore.bind("hypoBunniesEnda"));
		}

		if (seg == "hypoBunnies9felt") {
			append("\"That's not a reliable test for sentience. For example, Fuckmeat can <!i>act<!i> like they feel a cock when you ram one inside them. Doesn't mean they actually do.\"");
			addChoice("Oh...", explore.bind("hypoBunniesEnda"));
		}

		if (seg == "hypoBunniesEnda") {
			append("\"Now... tell me again. what exactly were you three doing when she got infected?\"\n\nThe bunnies fidget. \"We were... um... fingerpainting her... with a bowl of mushed-up glowberries...\"\n\n\"<!i>All<!i> of her?\"\n\nThey gulp, look at the camera, and nod.");
			addChoice("Ohhhhhh.", explore.bind("hypoBunniesEnda2"));
		}

		if (seg == "hypoBunniesEnda2") {
			append("\"I see.\"\n\nThey all start talking at once:\n\n\"But we didn't mean to make her—\"\n\n\"We didn't know that she would—\"\n\n\"She <!i>asked<!i> us to—\"\n\n\"You're not in trouble,\" the P.A. reassures them. \"In fact, if we can verify this last test, I believe that pretty much confirms our working theory.\"");
			addChoice("What's theory was that?", explore.bind("hypoBunniesEnda3"));
		}

		if (seg == "hypoBunniesEnda3") {
			data.apoGlowbunnyDone = true;
			append("\"Infection isn't caused by bites, not by transfer to the bloodstream, and it's not even airborne. Infection is caused by total surface area submersion in the engine fl— in glowjuice.\"\n\nThe cubs look at each other. \"So... so we can't fingerpaint each other anymore?\"\n\n\"Well, you can, as long as you leave an inch of yourselves un-coated. But I wouldn't run the risk if I were you. Like I said, we still have to confirm this last test later.\"");
			addChoice("... Oh shit... so I almost...", explore.bind("hypoBunniesEnd"));
		}

		if (seg == "hypoBunniesEnd") {
			append("The P.A. turns off for a moment. Right away, the cubs pipe up again.\n\n\"Can we go now?\"\n\n\"This is starting to creep me out...\"\n\n\"I don't want to see her like this anymore.\"");
			addChoice("Hey, can I go too?", explore.bind("hypoBunniesEnd2gotoo"));
			addChoice("...", explore.bind("hypoBunniesEnd2"));
		}

		if (seg == "hypoBunniesEnd2gotoo") {
			append("After a long silence, the P.A. turns back on.\n\n\"Of course you can leave, "+data.playerName+". Thank you for your help.\"");
			addChoice("No prob.", explore.bind("hypoBunniesEndLeave"));
			addChoice("... And what about the bunnies.", explore.bind("hypoBunniesEnd2"));
		}

		if (seg == "hypoBunniesEndLeave") {
			append("The vault door opens only long enough for you to slip outside. You leave the cubs in the padded room with their sister and return to the lobby.");
			addChoice("Look around.", explore.bind("apohub"));
		}

		if (seg == "hypoBunniesEnd2") {
			append("\"As far as we know, you three are her only waking relatives. Her grandmother is drugged out at some unknown location on the meteorite, and her littlest sister is in a coma. We'll have you stay here for further testing.\"\n\nThe bunnies scramble to argue.\n\n\"You'll <!i>have us<!i> stay?!\"\n\n\"You promised free movement!\"\n\n\"LET US GO YOU CAT BASTARD!\"\n\nThey all run for the vault door and start prying pointlessly at the edges, climbing over each other just for the chance to hurt their fingers.");
			addChoice("Woaahhh now. Let's just calm down. This is supposed to be the \"Tranquil\" Apothecary, after all.", explore.bind("hypoBunniesEnd3"));
		}

		if (seg == "hypoBunniesEnd3") {
			timer(3, playSound.bind("assets/audio/environment/tranq", "tranq", {loops: 3}));
			append("The P.A. says nothing, but the security camera starts to move in tiny increments: up, down, left, left again, up...\n\nIt's... it's aiming.\n\nThe compartment on the bottom of the camera clicks open, revealing a shiny little metal tube. The end of the tube flashes three times quick with a little staccato <!i>piffpiffpiff<!i> and, by the time you manage to blink and look over, each cub has a tranquilizer dart jutting from their neck.");
			addChoice("THAT'S NOT WHAT I MEANT!", explore.bind("hypoBunniesEnd4"));
		}

		if (seg == "hypoBunniesEnd4") {
			append("\"I'd spin you some bullshit about the greater good,\" the P.A. drawls, \"but really they were just annoying me. Don't worry. We'll let them go as soon as they've done their part.\"");
			addChoice("... How bout you let them go right now or I'll tell Mynt.", explore.bind("hypoBunniesEnd5"));
		}

		if (seg == "hypoBunniesEnd5") {
			append("\"Tell her what? She's narrating this to you right now.\"\n\nThe vault door opens behind you. Two smiling, ballcapped staff members slip inside to collect the bunnies. They both have tranquilizer pistols on their hips.\n\n\"You can leave now."+(data.apoTestsDone.length==1?" The other two tests can honestly wait, now that we've discovered this.":data.apoTestsDone.length==2?" The other test can honestly wait, now that we've discovered this.":"")+"\"");
			addChoice("Punch the staff.", explore.bind("hypoBunniesEnd6"));
		}

		if (seg == "hypoBunniesEnd6") {
			append("They see your fist clench and their paws go to their pistols.");
			addChoice("Shit alright don't do that. Berate the staff.", explore.bind("hypoBunniesEnd7"));
		}

		if (seg == "hypoBunniesEnd7") {
			append("This is kidnapping, you tell them. This is cruel and immoral. Those bunnies are coming with you right now and that's the end of this conversation, end of story, no if's and's or butts.\n\nPeriod.");
			addChoice("YEAH!", explore.bind("hypoBunniesEnd8"));
		}

		if (seg == "hypoBunniesEnd8") {
			append("They ignore you completely.");
			addChoice("NO!", explore.bind("hypoBunniesEnd9"));
		}

		if (seg == "hypoBunniesEnd9") {
			append("By now they've lift the bunnies over their shoulders fireman-style and walked out the vault door.\n\nIt shuts behind them.");
			addChoice("... Fuckin... how come I don't get to have a gun.", explore.bind("hypoBunniesEnd10"));
		}

		if (seg == "hypoBunniesEnd10") {
			append("\"Because everyone knows players are inherently impulsive.\"\n\n(Sorry but that's... that's pretty accurate...)");
			addChoice("And tranquilizing three innocent bunnies because they got a little scared <!i>wasn't<!i> impulsive?!", explore.bind("hypoBunniesEnd11"));
		}

		if (seg == "hypoBunniesEnd11") {
			append("\"No, that was a calculated response based on our policy for breaches of trust. They promised us cooperation throughout multiple tests in exchange for freedom of movement. They broke their promise and still expected us to keep ours.\"\n\n(It's fine. This is just how they do things. Drop it and move along.)");
			addChoice("Alright alright... it's still greasy though...", explore.bind("apohub"));
			addChoice("No I'm not gonna drop it, promise or not, you don't just knock people out for changing their minds.", explore.bind("hypoBunniesEnd12"));
		}

		if (seg == "hypoBunniesEnd12") {
			append("\"Look, what do you want me to do?\"");
			addChoice("Let them go.", explore.bind("hypoBunniesEnd13"));
			addChoice("Compensate me for the trauma I've witnessed.", explore.bind("hypoBunniesEndComp"));
		}

		if (seg == "hypoBunniesEndComp") {
			append("\"Name the item.\"");
			addChoice("Oh shit really??", explore.bind("hypoBunniesEndComp2"));
		}

		if (seg == "hypoBunniesEndComp2") {
			append("\"Yes really. We were part of the development team for the Auto-Shop. As a perk, we get to spawn as many items as we like for free.\"");
			addChoice("Capsules.", explore.bind("hypoBunniesEndComp3"), {give: ["Capsule", 30]});
			addChoice("Sweetgrass Leaves.", explore.bind("hypoBunniesEndComp3"), {give: ["Sweetgrass Leaf", 50]});
			addChoice("Nuts and Screws.", explore.bind("hypoBunniesEndComp3"), {give: ["Nuts and Screws", 100]});
		}

		if (seg == "hypoBunniesEndComp3") {
			append("The staff members return in a moment, bunnyless. They place a little parcel of compensation at your feet.\n\n\"Happy?\" the P.A. asks.");
			addChoice("Yes. C:", explore.bind("hypoBunniesEndComp4"));
		}

		if (seg == "hypoBunniesEndComp4") {
			append("\"Good. Now leave.\"");
			addChoice("Ok~", explore.bind("apohub"));
		}

		if (seg == "hypoBunniesEnd13") {
			append("\"If I do, how will we verify their sister's complete and irreparable braindeath? What if she's still alive somewhere in that body and we can get her out?\"");
			addChoice("I don't know, figure it out.", explore.bind("hypoBunniesEnd14"));
		}

		if (seg == "hypoBunniesEnd14") {
			append("\"What an utterly pointless response.\"");
			addChoice("Your mom is utterly pointless.", explore.bind("hypoBunniesEnd15"));
		}

		if (seg == "hypoBunniesEnd15") {
			append("\"Please leave the room.\"\n\n(Come on. This is getting silly.)");
			addChoice("No.", explore.bind("hypoBunniesEnd16"));
		}

		if (seg == "hypoBunniesEnd16") {
			append("\"Fine. Smile for the camera.\"");
			addChoice("... Shit.", explore.bind("hypoBunniesEnd17"));
		}

		if (seg == "hypoBunniesEnd17") {
			playSound("assets/audio/environment/tranq");
			append("<!i>Piff!<!i>");
			addChoice("... Shit.", explore.bind("hypoBunniesEnd18"));
		}

		if (seg == "hypoBunniesEnd18") {
			playSound("assets/audio/environment/tranq");
			append("Alright, they drove you back to the City and threw you out onto the street while you were unconscious.\n\nI'll skip the tedium of the journey all the way back, and the multiple hours spent re-convincing the staff of your trustworthiness. You're back in the Apothecary lobby.\n\n(And you're very welcome.)");
			addChoice("... Alright thanks.", explore.bind("apohub"));
		}

		//Red scene
		if (seg == "redSceneStart") {
			unlockJournal("RedApo");
			if (!getJournalEntries().contains("Missing Page 15")) {
				unlockJournal("Missing Page 15");
				msg("Found Missing Page #15", true);
				playSound('assets/audio/environment/journalPage');
			}
			append("You enter the small clinic and get your face assaulted by a blast of air conditioning. You're standing at one end of a waiting room. The nurse's counter is on the other end, judging by the massive line which splits the room down its middle.\n\nThe cushy comfy heated chairs that line the walls have zero furry asses to warm. Everyone is standing impatiently in that line. There's a couple cuddle clusters here and there along the row, but it doesn't seem like you're gonna find a quickie here, so you turn to leave—\n\nA familiar voice rings out from the front of the line:\n\n\"What do you mean, I can't have any?!\"");
			addChoice("Who could it be, now?", explore.bind("redSceneStart2"), {kinks: ["Guest Writer", "Cub", "Female", "Male"]});
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "redSceneStart2") {
			msg("<!img:kink/Guest Writer.png> Co-writer: Srsly", true);
			append("It's a little red-cloaked wolf girl: Red.\n\nJust below the hem of the cloak, her soft ass-fur prickles up with annoyance as she stomps one adorable foot in protest against the staff's piss-poor customer service.\n\nThe gazelle nurse behind the counter pulls out a worn paper and glances over a massive, intricate list filled with bullet points, clauses, and extensive prerequisites.\n\n\"I'm sorry, little cub, but in order to prescribe tranquilizer, well... first, you must procure a Pacifist License— also known as a Septricard— to prove you weren't involved or plan to be involved in the rebel groups which sparked the Forest-City war, of course, what with your residence being where it is— then, furthermore, we'll need you to fill out a diagnostics form and attend a consultation appointment with Dr. Mauez or Dr. Lamblea (next week is the earliest we can fit you in with Lamblea, and I'm not sure where Mauez is, as usual)— then, furtherly furthermore, you'll have to sign a waiver which gives us full license to rape, torture, degrade, defile, humiliate, molest, detain, or annoy you to the fullest extent that your treatment plan prescribes.\"\n\nRed blinks.\n\nThe gazelle hurries to add: \"Besides those pesky wolfish temper issues, I don't think the Apothecary can do anything for you. It's probably not worth the trouble.\"\n\nRed stands on her toes and screams into the gazelle's massive bust, which is as high as she can reach. \"I AM NOT. LOOKING. FOR. THERAPY!\"");
			addChoice("Go watch the fireworks.", explore.bind("redSceneStart3"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "redSceneStart3") {
			append("\"Oh,\" the gazelle murmurs. \"Right. Interesting. Why <!i>are<!i> you here, then?\"\n\nRed steadies herself with a deep breath. \"I explained it five times. My bunny girlfr— my bunny friend was on the shipwreck, and she's in a coma now— sorry, I mean, she's braindead now, and I'm all cooped up in her cabin looking after her. I can't let her wander around or she'll get raped by some greasy dudebro, so I tranquilize her with my own sweetgrass brew, but cooking that shit devours even MORE hours of my time. I need some professional-grade liquid tranquilizer so I can keep her sedated and get on with my life.\"\n\nThe gazelle is painfully confused. The sourness of her expression implies that confusion is one of her least favorite things in existence. She jots a sentence down, not looking at Red, and tells her sweetly:\n\n\"Get on with your life, got you, yeah. You're that little glowberry picker, the one that mostly just walks around the forest or sits alone at home, right? Mmm.\"\n\nShe goes on:\n\n\"Honey, do you even know why we put people through this hassle? It's the same reason the line here is huge. People go stir-crazy. They need something to worry about. They need forms, appointments, consultations, they need to fail their application and try six more times because we say so. People need busy work. If we just let our patients get on with their lives, they would all go insane with cabin fever.\"\n\nThe gazelle stabs a period onto her sentence. \"We're not about to revamp the whole island's healthcare system for one freak case of someone who actually happens to need medicine.\"\n\nRed digs her claws into the plastic counter, really digs them in, so hard the smooth surface curls under her grip.\n\n\"Listen here, prey...!\" she growls. Her claws flex. Her yellow eyes bite into the gazelle's cool green ones. Based on what the gazelle just said, you can assume most of her patients and customers have too much free time... and based on that, you can assume she's used to keeping calm when faced with angry, entitled customers like this one.\n\nYou get a glance at the sentence the gazelle wrote, on a form labelled Potential Patients — First Impressions, and it's only seven words long:\n\nDeep-seated anger, feeling trapped by responsibility.\n\n\"I said listen here!\"\n\n\"I'm listening, predator,\" the gazelle replies.\n\n\"I'm not just a predator— I'm a wolf, and like you said, wolves have tempers. That's not a personal issue of mine, that's just built in. Scratch that out. I'm not here to dick around and fill out fucking forms because my ~cabin fever is so scaaary...~ Bitch, I live in a cabin. My only company is braindead. Make an exception and hand over the tranquilizer right now, or else I put my temper to use and slash your pretty fucking face up.\"");
			addChoice("Approach.", explore.bind("clinic2"));
			addChoice("Approach (for a better view~)", explore.bind("clinic2"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic2") {
			append("\"Go ahead,\" the gazelle says, leaning over the counter so that her boobs sway and jiggle right in Red's cute, pissed-off little face. \"Tear me up. I'm into that.\"\n\nRed pulls away and blushes. She unhooks her claws from the counter reluctantly. \"You herbivores are all the same. Subs and bottoms, all of you. Like we needed more. So booooring...\"\n\nThe receptionist blinks a couple times, as if that statement really took their little catfight way too far.\n\n\"We're not giving you tranquilizer,\" she says coldly. The games are over. \"Next patient.\"\n\nRed scoffs in disgust and crosses her arms. She turns to face you. \"Shame. I bet you'd give it to a player.\"\n\nShe looks at you expectantly, as if waiting for you to come help her.");
			addChoice("Ask the gazelle to hand it over.", explore.bind("clinic3"));
			addChoice("You're on your own, Red.", explore.bind("clinic4"), {kinks: ["Abuse", "Blood"]});
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic3") {
			append("You do that, striking an authoritative player-only pose against the counter. The gazelle hadn't seen you there before— she places a hand on her chest to steady her fluttering heart, and her eyes widen and sparkle with whole constellations of stars.\n\n\"Ohh-h-h-hoooohhhh, a player?! The new player?! How may we help you?\" she titters.\n\nRed's agitation subsides briefly as you take over the conversation. But right before you begin to inquire for the tranquilizer, the gazelle cuts you off with a taut little smile.\n\n\"Don't even ask for this little brat. We're not allowed to give out any tranquilizer without due process. Especially not to you... what with your allegiance being so unknown, and all.\"\n\nRed's hopeful expression crumbles.");
			addChoice("Well, I tried.", explore.bind("clinic4"), {kinks: ["Abuse", "Blood"]});
			addChoice("Move along, I guess.", explore.bind("apohub"));
		}

		if (seg == "clinic4") {
			append("Red stomps her foot and demands tranqs for the seventeenth time.\n\n\"Come on!!! Just. Give. Me. The. Goods!\"\n\nWith every syllable she jumps up and attempts to snatch at the lock to the swinging counter door. The gazelle simply holds her down by her forehead. \"I said no. And, sorry, "+data.playerName+", but you'll have to get in line like the rest of us... Although we should totally go out for coffee sometime, maybe a quick fuck— I know this wonderful little lookout point, just below the Apothecary, you can almost see right off the edge of the water, although we do use it for suici—\"\n\nThe people next in line noticed you a long time ago, and by now they've all mostly gotten over their excitement and reverted to being pissed at Red for holding the line up. They shake their fists and yell and spit at her, and a few of the more muscular guys even waggle their dicks at her menacingly.\n\nRed doesn't give a fuck if they're impatient. She's more agitated than ever. Her hind claws have scratched the tiled counter front, and her foreclaws are digging back into the grooves in the countertop. One vicious little growl ripples up from the pit of her belly and she bares her canines.\n\nShe's done fucking around.");
			addChoice("Oh boy.", explore.bind("clinic4a"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic4a") {
			append("Red vaults over the counter and digs her claws into the gazelle's tight nurse's outfit, tearing the front of her scrubs open and spilling her massive jiggly boobs out. The gazelle's spilling blood and ahegao blush complements the red cross on her tiny hat perfectly.\n\n\"Oh dear. It looks like we have an emergency over here... another boring, stereotypical dom predator, woefully unable to resist her urges. It seems we will have to administer some treatment without due process, after all.\"\n\nShe smiles and slips a couple fingers up her bare cunt as Red tears into her, completely unfazed. Her pain tolerance is beyond legendary. The fact that Red's claws aren't actually causing any pain, regardless of how deep or how fiercely she slashes, that only aggravates the little wolf more, and soon she's enraged, howling, and attempting to just shove past the gazelle instead of tearing through her.\n\nThe gazelle plucks Red up by her cloak, leaving her suspended in the air.\n\n\"Not the first time this has happened... security! We've got a Code Grey out here, as in wolf! Treatment required!\"\n\nTwo burly orderlies burst in from the left side of the room. They're wearing white suits, shades, and ballcaps, and they look a lot more like bouncers than hospital staff.\n\nOne of them drags Red away by her cloak. She takes her anger out on the legs of the line-goers before security pulls her through the double-doors and the sounds of her protests get muffled, either by the walls or by two cocks at once, you can't be sure.\n\nBlood drips sensually down the gazelle's exposed tits. Slender gouges run over her smooth belly. She does absolutely nothing to clean or cover them, but simply rocks the carved-up, painwhore aesthetic and says \"Aw, that was a fun lil one. Welp— I say this all day, but I've always longed for a player to hear it: Next! <3\"");
			addChoice("Where are they taking her?", explore.bind("clinic5"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic5") {
			append("A few more people behind you ask the same thing. After she made such a colossal scene of herself, all the cityfolk lesbo girlsubs are super riled up and rearing to get their own tits clawed.\n\nThe gazelle nurse glances at the double doors.\n\n\"Well... she'll be given over to Dr. Mauez, our specialist in the treatment of violent individuals. Something about his feminine body really seems to calm people down, you know. You're free to follow her. She should be in one of our snuff therapy rooms. If you ask nicely, Dr. Mauez might even treat you to a tour of the facility~!\" She grabs her bloodstained stack of papers and taps them twice to straighten them out. Her massive tits jiggle slightly.\n\n\"Question for ya,\" says the next patient, an excited city dude. \"Can I go see the little wolf dom, too?\"\n\nThe gazelle tsks. \"Well, you'd have to fill out these visitation papers... which you can use to apply for an appointment, wherein one of our professional diagnosticians will gather enough information about you to conduct some background checks... background checks which will determine, in a month or so, whether you can successfully apply for the chance to...\"\n\nShe lists about six more requirements. Three months of wait time total. The guy's dick is sooo hard at the prospect of all the free time he's about to kill, all the tasty anticipation... you can see the snuff-lust in his eyes.");
			addChoice("Follow Red.", explore.bind("clinic6"));
			addChoice("Eh. Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic6") {
			append("You push past the double doors. There's no one here. It's a perfectly clean, perfectly white hallway. There aren't even any claw marks on the tile floor.\n\nStaff members push past you. Their heads are all down. One big-tidded birdgirl tries to run up to you and gush, but her supervisor yanks her back by the collar and rapes her for breaking policy.");
			addChoice("Find Red.", explore.bind("clinic6a"));
			addChoice("Eh. Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic6a") {
			append("You walk forward through the still air. The overpowering stench of hospital chemicals wafts up your nostrils.\n\nYou pass rooms full of people. Some of the patients are actually just sitting and talking to their therapists, but most are just banging like feral bunnies. This place feels more like a sex club with benefits than an actual hospital.\n\nIt isn't long before you come across Red sitting in the middle of a room with her cloak pulled around herself, just a pouty little ball of fur. You can see her through a small, sweat-fogged window on the door; she's alone, not getting raped yet.\n\nHer arms are crossed, face pointed down at her feet. She's grumbling to herself and side-eyeing the door, all paranoid.");
			addChoice("Heyyyy. I'm here. Don't be spooked.", explore.bind("clinic7"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic7") {
			append("You step inside.\n\nThe door only opens one way, of course, and you don't think to hold it open and help her escape, so it goes right ahead and auto-locks with a soft, suction-cuppy noise behind you. Red's face twitches in time with the quiet click of the door's internal lock.\n\nShe swallows her frustration and forces herself to just be happy that you opened the door and came in here to keep her company in the first place. \"Ah... "+data.playerName+"!! You followed me? They'll keep us both here, now... but you probably knew that, and followed me anyway...\"\n\nShe gives you a guarded little smile. \"Thanks, hey? Let's hope we're not going to solitary.\"");
			addChoice("Yeah. This place seems a little evil. Just wanted to make sure you were okay.", explore.bind("clinic8"));
		}

		if (seg == "clinic8") {
			append("\"I'm okay.\"\n\nRed sighs and looks around the room.\n\n\"They said I had to wait for Marei. If I wait for Marei and go through some of their dumb 'treatment,' <!i>then<!i> they'll give me some tranquilizer. What kind of a deal is that? Bet this doctor just wants any excuse to get a piece of my sweet loli bod...\"\n\nShe huffs, and looks away. Her legs flop out over the floor, spreading wide. Silence settles in. Through the sound-proofed walls, you hear the echoes of other therapy sessions going on all around you: shouts of triumph, arguments, moans, screams, laughter, whimpers.\n\nThe cacophony slowly bores its way through your ears and into your brain.\n\n\"Hnyaaa...\"\n\n\"Yeah, you fuckin like that?\"\n\n\"That's what she DIDN'T want me to do! I know! What the fuck! Like how am I supposed to suck her dick, then??\"\n\n\"Mmmnnfh... schllurrrpp schloooorp...\"\n\n\"Oh, I know, tell me about it. She's a total bitch.\"\n\n\"Hnnnnn—\"\n\n\"—Kill me—\"\n\n\"—nnnnYYYYAAAAAAAA—\"\n\nFive minutes of this has passed and Red can't take it any more. She leaps up and starts pounding on the door, shouting and clawing and swearing.\n\n\"MAARREEEIIIII! HURRY UP AND RAPE ME! COME ON! GET IN HERE ALREADY! I HAVE A BUNNY WAITING BACK HOME, YOU FUCKIN DIP!\"\n\nIt almost seems like maybe she does need some sort of treatment.\n\nRed's temper tantrum goes nowhere, shockingly. Eventually she cools down and goes back to sitting on the floor, panting and sweating. Her loli bod is covered in slick, shiny fur now.\n\n\"They'd better let me out soon...\"");
			addChoice("Wait around awhile.", explore.bind("clinic9"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic9") {
			append("Time passes sluggishly. Red takes to pacing, dragging her paws down her face every so often as her boredom really sets in.\n\nBack... and forth... back... and forth... back and forth and back and forth and back... and forth... and back... and... forth... and baaaack... and forthandbackandforthandbackandFORTHANDBACKANDFORTH!\n\nJust when she's about to snap again, the door swings open with a gasp of that same suction-cuppy sound. The lock chirps happily.\n\nBut it's only a bored nurse. She looks like she's dealt with countless angry tsundere lolis in this exact situation before.\n\n\"HEY!\" Red yells in her face, \"WHERE'S THE DOCT—\"\n\nThe nurse shoves Red back down on her little ass and runs some preliminary tests on her, much to Red's infuriation. Her temperature and blood pressures are taken. Her reflexes are tested with a dildo (you guess they ran out of little hammers). When the nurse is finished, she simply leaves, even as Red tries to ask her how long the wait will be.\n\n\"Damn it! Is everyone here a fucking nutcase?!\" she asks the ceiling, and flops down on the hospital bed. Besides that bed, and a little closed-off metal-walled section marked Respawn Chamber in the far corner of the room, there's nothing else to distract herself with.\n\nSo she looks at you.\n\n\"What are you lookin' at?!\"");
			addChoice("A very impatient little wolf.", explore.bind("clinic10"));
		}

		if (seg == "clinic10") {
			append("She bares her little fangs. \"Like you've been reading for as long as I've been waiting. Fuckin timeskipper.\"\n\nHer eyes run over your body like a predator's eyes might run over their prey. Sometimes you meet them, but other times you just openly stare at the slice of her body that you can see through the front of her cloak: smooth fur, still slightly sweaty from her multiple tantrums; a smooth, flat chest, and a belly speckled with gazelle blood.\n\n\"Can't get enough of my body, huh,\" she says shrewdly. Her legs peek open a little. \"Well, while we're waiting here, why don't we—\"\n\nThe door opens once more.\n\nIt's a tall, elegant, hairless sphynx cat with a smirk on his face and a clipboard held loosely in his paws. He dedicates the absolute minimum number of fingers to it, just three, and it looks like it could slip from them at any moment. Somehow, he keeps his grip.\n\nHe's dressed in a clean black suit, blue tie, and tight slacks, which do nothing to hide the size of his crotch.\n\nIt's Dr. Marei Mauez.\n\n\"I'm Dr. Marei Mauez,\" he says, tapping the blatantly obvious nametag pinned to his suit.");
			addChoice("Oh hey again.", explore.bind("clinic11"));
		}

		if (seg == "clinic11") {
			append("He lazily drags a dank metal chair behind him. The back legs catch and scrape over the padded floor. He rests them perfectly in the divots between the floor's pads and pauses, fat femmy ass held just above the seat; then, after that singular moment, he releases all the professional tension in his body and pours himself into his chair like water into a glass. The metal curves look like they were crafted to fit his fat ass perfectly.\n\n\"Red. "+data.playerName+". Nice to see you both. You'll have to excuse me, but I'll be speaking very formally for this treatment session. Well, as much as I can, anyway. I try to keep my behaviour professional while I'm on the job. Sets a good precedent.\"\n\nHis tail curls through a gap in the slats of the chair's metal spine. His tail-tip flicks to the beat of some tinny music playing over the Apothecary P.A. system. Just a glimmer of his beautiful, operatic voice leaks out as a low hum from behind closed lips.\n\nBefore he says a word, he combs over Red's little body with his eyes, drinking every detail deep into his attentive feline slit-pupils, and then, delicately, he places two sentences of cursive notation about her on his clipboard.\n\n\"LET ME THE FUCK OUT!\" Red screams, right into his perfectly calm face.\n\n\"No,\" Marei says, amused. \"You're clearly still upset about the shipwreck. Lana and John and I have been over it for a decade, you know. Grieving is normal, yes, but not for this long. Fifteen times I've politely asked you to just <!i>try<!i> our therapy program... I'm not asking anymore.\"\n\n\"Therapy isn't therapy if I don't consent to it,\" she snarls back, \"It's just... it's more like... an interrogation, or something!\"\n\nMarei raises one eyebrow and clicks the back of his pen.\n\nThe tip retracts.\n\nThe bulge in his pants expands.\n\n\"And who said I'm going to be asking you any questions?\"\n\nRed's confused. \"... What? Isn't that what therapy is?\"\n\n\"Clearly you didn't read the pamphlets I dropped off at your cottage...\" He looks away and swallows some mild annoyance. The tip of his tail cocks to the side sharply.\n\n\"What are you going to do to me?\" she asks, a small hint of fear and excitement in her voice.\n\nMarei writes down two words on his sheet: PLAYING DUMB");
			addChoice("Next.", explore.bind("clinic11a"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic11a") {
			append("\"Forgive me,\" he says. \"I assumed you would have at least glanced at the pamphlets. I'll explain: I'm going to kill you. Repeatedly. At select moments. It's called 'snuff therapy.'\"\n\nRed blinks.\n\nHe goes on: \"The primary focus of this treatment programme is the symbolic link between certain unhealthy emotions or thoughts and the corpses which you used to express them. In that way, you can begin to think of each death as the symbolic death of that particularly rotten, irrational thought, and you can begin to think of each respawn as a slightly better body, a better frame of mind. With some imagination and co-operation, Red, you can cleanse yourself of each and every imperfection you've built up over the years. Now, when was the last time you respawned?\"\n\nMarei eyes her closed lips over the edge of his clipboard, itching to start psycho-analyzing her first word.\n\nRed is speechless. A tiny droplet of arousal forms along her sex and drips slowly along the fur of her leg. She bunches up her cloak to hide it.\n\n\"...I-I thought you weren't going to ask me any questions?!\"\n\nMarei's maw curls into a smirk that almost seems carved in.\n\n\"Like I said, I'm not asking.\" His eyes flick over to you. For a moment, he holds them there.\n\nThen he looks back to Red.\n\nThe little wolf gulps carefully.");
			addChoice("Ooooooo, snuff therapy~", explore.bind("clinic12"), {kinks: ["Snuff"]});
			addChoice("This guy is a psycho. Move along.", explore.bind("apohub"));
		}

		if (seg == "clinic12") {
			append("Finally, she answers:\n\n\"Last... last time I respawned was twenty-six years ago. Just after the shipwreck.\"\n\nMarei pounces the moment she shows emotional weakness. He stands up from the chair and takes two elegant, long-legged steps towards Red. Now he's close enough to loom over her. The back of his head blocks out the room's single light, casting his down-turned face in shadow.\n\nRed does nothing. She just looks up at his dark face and shivers. \"Why do you want to know?\"\n\nMarei leans over raises her chin with the side of one slender claw. The point of his natural weapon is razor-sharp, but it doesn't graze her. He turns Red's face from side to side.\n\n\"So elderly a patient, today,\" he says, nonchalantly ignoring her question. \"Over twenty years old.\"\n\nHe turns away. His tail slides past her face. Red flinches, struggling not to react.\n\nShe flattens her cloak over her lap, wringing it, slowly coming out of his spell, now that his minty-fresh breath isn't pouring over her face and his claw isn't right next to her throat. She dissolves back into a comfortable expression of annoyance, and you catch the sound of a tiny growl building in her throat.\n\nMarei's ear flicks towards the sound.\n\nHe doesn't even have to look over his shoulder. He merely threatens to do so, with a turn of his chin, and her growl dies off in her throat.\n\nRed watches quietly as he scribbles more notes onto his clipboard.\n\n\"I think we're ready to begin.\"\n\nHe gestures to the small table beside the bed, full of surgical implements. A scalpel, scissors, a few syringes full of tranquilizer... \"Pick one.\"");
			addChoice("The scalpel.", function() {
				data.redApoScalpel = true;
				explore("scalpel1");
			}, {kinks: ["Blood", "Gore"]});
			addChoice("The scissors.", function() {
				data.redApoScalpel = false;
				explore("scalpel1");
			}, {kinks: ["Blood", "Gore"]});
			addChoice("Uuuuummm... move along.", explore.bind("apohub"));
		}

		if (seg == "scalpel1") {
			append("Marei rolls his eyes at you.\n\n\""+(data.redApoScalpel?"Scalpel":"Scissors")+" it is,\" he says. He slides over to the implements and plucks a gleaming "+(data.redApoScalpel?"scalpel":"pair of medical scissors")+" from the metal tray.\n\nHe holds "+(data.redApoScalpel?"it":"them")+" up before his snout and runs one digit along the smooth, metallic length.\n\nRed shudders with anticipation where she kneels. Her toes wiggle adorably beneath her butt, and her thighs twitch open slightly. \"No,\" she croaks weakly. The words don't want to come out. \"No, I can't do this. I think I need to leave.\"\n\nMarei approaches steadily, as if she said nothing.\n\n\"I always did dislike "+(data.redApoScalpel?"scalpels":"scissors")+". I find them horribly <!i>slow<!i>...\" When he says the word, his hips roll a little. Sl-ow.\n\nHe grins at the effect that has on Red. \"Don't worry,\" he says. \"I'm joking. It'll just be a quick little pinch, then...\"\n\nMarei stops.\n\nHe sniffs at the air.");
			addChoice("Sniff also?", explore.bind("scalpel1a"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "scalpel1a") {
			append("You pull in a couple hearty nostrilfuls. It smells like... like...\n\n\"Is that your cunt, Red?\" Marei asks, hungry for her answer. He looms closer to her, and Red finds herself the prey once more, so out of place from where she had been in her safe little hut, so far from clawing or insulting or shoving him away. If anything, she looks like she's desperately fighting the urge to kiss him.\n\n\"What? I don't know... what?\" she asks, forcing some annoyance.\n\n\"That scent,\" he says, stepping closer. \"I smell something. You're leaking, aren't you?\"\n\nRed growls. \"Am not. I'm just—!\"\n\n\"Just what? Just gushing over nothing? I haven't even touched you, yet.\"\n\nAnger bristles up in her. He's actively trying to piss her off, now. No more kissy face. \"Shut up.\"\n\nMarei presses on. \"You're so cute... look at your little puddle...\"\n\nRed opens her mouth to snap for the third (fourth?) time since you bumped into her at the Apothecary. Her eyes go wide and her lips peel back to reveal her canines. \"I SAID SHUT UP, YOU FU—\"\n\nA sickening <!i>squish<!i> cuts her short.\n\nMarei's hand swipes down almost too fast to see, and Red's face flickers from wrath to pure astonishment; for a moment she seems frozen between those two emotions, but as she starts to speak, you spot the glint of metal deep inside her mouth, behind her tongue."+(data.redApoScalpel?"":"\n\nHe yanks the legs of the scissors open wide. Her throat practically splits in two.")+"\n\nMarei releases his grip on the "+(data.redApoScalpel?"scalpel":"scissors")+". It juts out an inch past the bottom of her chin.\n\nRed crumples. She rolls onto the floor and sputters soundless, angry, dark red words at Marei. Her eyelids raise and lower of their own individual accord. Her pussy spills dribbles oil all over her thighs and the floor. It seems the "+(data.redApoScalpel?"scalpel":"scissors")+" pierced her brain from below, straight through her soft palate.\n\nMarei simply stands above her gagging, convulsing corpse and scribbles on his clipboard. He punctuates the very last period of the very last sentence with a gentle little tap.\n\nRed bleeds out at his feet.\n\nHe shoots you a quaint smile. \"Let's check the results, shall we?\"\n\nMarei steps long over her lifeless body, and the slowly growing pool of cub's blood on the floor. He slinks to the small metal chamber on the other side of the room. Red is already banging on the door from the inside, just as angry as she had been a moment before.\n\nHe presses the button on a console, and she all but spills out onto the padded tiles.\n\n\"What the fuck, man...?!\" she whines.");
			addChoice("Next~", explore.bind("scalpel2"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "scalpel2") {
			append("Marei stoops down before the distraught Red and presses his pen underneath her chin, lifting it to inspect her. Finding no mark underneath, and everything in order (besides maybe her mental state) he stands up and regards her nude loli bod with a scientific coldness.\n\n\"Good. That was a good death, I think. I caught the behaviour just in time. Seems like everything is in order... except perhaps...\"\n\nHis voice and eyes trail off. He looks to the dead instance of Red lying on the floor, pale face still twisted with anger. Life oozes out from below her chin, staining the white floor crimson.\n\nMarei peels the red cloak from the corpse, then, with one long arm, he extends it back to the little wolf.\n\n\"Here, now. You're fine. I know it's a shock, dying so fast after waiting so long. Relax. You're back. You're fine and whole,\" he says soothingly. Red tears the cloak from his paw and hugs it, squeezing it in her small paws. Hot blood gushes out of the fabric and drips over her bare chest, but she doesn't care. She just stares at her cloak, holds her cloak, sniffs her cloak. The comfort it brings her is enough.\n\n\"It's sweet,\" Marei purrs, sinking back into his chair with feline grace, \"how you still try to catch her scent in the fabric...\"\n\nHe writes some more on his clipboard, pen scritch-scratching away. Red is still processing what just happened, so she can't snap back at him, but she does stop sniffing at her cloak. A blush trickles up her cheeks.");
			addChoice("Next.", explore.bind("staya"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "staya") {
			append("\"Now then...\"\n\nHis eyebrows curl downward. His mouth tightens sternly. \"We must continue.\"\n\nRather than waiting for you this time, he leans over and dips a paw into the first drawer of the stand. He retrieves a long, thin knife.\n\nHe tests the point with one padded digit.\n\nRed grimaces and looks away. \"I'm not into this stuff anymore,\" she says. \"I'm not into stuff like this anymore.\"\n\n\"Look at me, Red,\" Marei says, but his eyes are still holding yours. He doesn't even pretend to think she might actually do what he tells her to.\n\n\"Why am I here... why am I here...\" Red murmurs to herself, staring intensely at nothing. \"Oh... that was it, right? It's over? Can I have some tranquilizer for my bunny, now?\" Red asks, bewildered, blinking. Her cunt twitches and contracts with a violent orgasm that she appears to be mentally detached from. Then her brow furrows, as she begins to remember where she is, and who is keeping her here.\n\nShe dons the red cloak and crosses her arms. Her expression becomes identical to her corpse's. Red regains the entirety of her strength in one pussy-throbbing burst of rage and glares Marei down.\n\n\"HEY! Enough! You got your sick fix in, didn'tcha? I'm not gonna sit around here all fuckin' day and play doctor while you slaughter my cute ass for your own pseudo-intellectual powergasms. I don't care if you're <!b>not asking<!b>, because from now on I'm <!b>not answering!<!b> Not after you stabbed me in the fuckin' brain out of nowhere, you piece of... of...\"\n\nNow that Red followed orders and actually looks at Marei, she can watch his body language. He has stretched out in his chair, spread his languid kitty legs, and his zipper seems to have somehow unzipped halfway (Oops! How'd that happen?) revealing a prominent, throbbing bulge. His silky-black undies are so thin you can even see the individual veins on his dick as they throb against the fabric.\n\nMarei raises an eyebrow. \"I'm not doing this for me. I have a hundred snuffsluts scattered around the island demanding me to fit them into my schedule. All boys, too. Ask Thelly, ask Som, ask Ivandis. I'm giving them all blue-balls right now so I can spend some time to try and help <!i>you<!i>, Red.\"\n\nRed's dilated pupils traversed his slender, masculine body. They locked on his crotch. She drools gently. Doesn't seem like she really heard much of what he just said. \"You piece... of...\"\n\n\"Hey. Eyes up here. Are you still cumming? You are, aren't you?\"\n\nShe snaps out of it.\n\nYes, her cuntmuscles are still throbbing... they're swollen and bright red now. After lifting her little cloak and peering down at her own cunt with a bewildered face, her mind catches up with her physiology: she starts to shiver and moan with a full-body rush of forbidden pleasure.\n\nShe claps her hands over her eyes and turns away from her corpse, salivating at the sight and smell of her own blood. \"Oooohhh nooo, nooo, nooo,\" she whimpers to herself.\n\n\"Nooo, nooo... I got snuffed... I got snuffed... oh Mary, no... no... I didn't mean to... I didn't mean to... I didn't... ugh... UGH! Stop! This is all your fault! Stop it, Marei! I want to leave!\"\n\nRed takes a step back, suddenly flustered. She yanks her cloak tighter around her blood-drenched body, as a protective shield. Her eyes drop to the floor. She was so rebellious just a moment ago, but now the fact that Marei isn't bantering back makes her slip right back into crippling apprehension. She can't give in and get snuffed again, because she knows the post-respawn orgasm will send her off the deep end. She can't get uppity and angry again, because she's afraid resistance will just get her snuffed faster.\n\nConfusion knots up her face. She doesn't know what to do except repeat herself, quieter, more meekly:\n\n\"Please let me leave.\"\n\nMarei speaks carefully: \"Good. You're dropping some of the anger. Remember, your anger is dead on the floor over there.\"\n\n\"Please let me leave.\"\n\n\"We're going to continue, Red.\"\n\n\"Please let me leave.\"\n\nMarei's icy blue eyes hold her reluctant gaze. \"You know it's not healthy to live this long without a respawn. Look at Snagg, with his build-up of body fat. Look at Cage, with his too-huge muscles. Body and mind riddled with the junk leftover from so many decades... is this really how you want to live? Alone in a cabin, drugging your best friend just so you don't have to babysit her every hour of your life?\"\n\n\"Please let me leave.\"\n\n\"No. Look at your cunt. That's important psychological phenomena, right there. Don't block that out.\" He sniffs at the air, and his eyes flicker to the spot on the bed that her dripping sex had created before.\n\nShe swallows, and looks down at her crotch again. She peels her labia open with fingers from both paws, watching the cute trickles roll out from her fairly worn, loose cubhole, just below the tiny hole of her urethra. As soon as she mounts the courage to face it again, another orgasm and another wave of pleasure wash over her. It drops her to her knees, and slams her thighs together with butt-clenching, body-squirming tingles. She squeals at the ceiling, helplessly.\n\n\"I-I'M NOT! I'M NOT INTO THIS!\"\n\nWhile she's focused on that feeling, Marei slinks toward her, knife in hand. For a moment you think he's going to kill her when she isn't ready, like before, but instead he brings the blade up in front of her face and shows her exactly what will cause her next death.\n\n\"How did you feel, just now, when I killed you? Do you want me to kill you again?\"\n\nRed tenses visibly. \"NO! Please let—\"\n\nMarei throws the knife aside.\n\nRed blinks.\n\nHe fiddles with the cuffs of his suit, loosening the sleeves, before he does the same with his tie.\n\n\"There are rules and practices, Red, that I must abide to,\" Marei explains patiently. Wrinkles of pity knit into his otherwise smooth brow.  \"I understand this is hard for you, and I wish I could change things. However, I am the Apothecary's C.E.O. I have no other option but to lead our other therapists by example.\"\n\n\"What do you mean?\" Red asks from the shell of her cloak, practically hiding under her hood now.\n\n\"I mean that you will answer my questions truthfully, or you will be punished.\"\n\nHe glares at her. His Pastel Ring earring sparkles: a tiny, soft circle of rainbow under the harsh fluorescent light.\n\n\"So I say yes I want you to kill me, and you kill me... or I say no, and you 'punish' me, which probably means you kill me...\"\n\n\"Not that question, the first. How do you think you felt, just now, when you passed away?\" he asks, with a detached professionalism.\n\nRed glances over him once. She releases her cloak from its tight grip and it hangs loosely about her shoulders once more. \"You really wanna know?\"\n\n\"Yes. Don't hold back.\"\n\n\"I... I was PISSED!\" Red crosses her arms so violently that the front of her cloak ruffles apart to reveal the folds of her youthful pussy, only visible through a tiny gap. While her elongated orgasm seems to have stopped now, her clit is still swollen with arousal, and the creamy-colored wolf fur around her inner thighs is still dripping. Marei doesn't press her to explain any more, but he does glance down at her cunt with something like envy. Red shifts her cloak to hide it from him.\n\nHe holds his gaze to her eyes instead. They stare each other down, vying for dominance.\n\n\"Why were you angry?\"\n\n\"BECAUSE—\"\n\n\"Look at your corpse before you answer that question. Put yourself back in that situation.\"\n\nShe stammers protests, but... but she does look over. Her corpse is supremely ugly. It's pale, splotched with red like some gruesome art piece, and her limbs didn't exactly fall in a graceful arrangement... but the worst part is the face: the expression she had when she died was shock and rage, eyes are bulged out, eyebrows screwed into a knot, and her fangs sticking out all jagged.\n\nRed tears her eyes away and forces herself to calm down.\n\n\"Okay... listen. I was angry because your goons hauled me in here when I just wanted to leave at that point. And then I figured okay, I'll play along for the tranquilizer. I'll do it for Mary. But I didn't realize 'playing along' meant breaking a promise I'd made to her a long time ago. I promised her I wouldn't get off on this kinda stuff anymore. There, okay? I opened up. Therapy's over. Let me go now.\"\n\n\"Sorry, you played along for Mary, or for her tranquilizer?\"\n\n\"It's not... it's for Mary, of course! If I don't sedate her— if I just leave her alone as a stupid NPC, she'll go wandering around and get raped by some fucking greasy dudebros! Look at this place! Even in the forest you can't go five feet without someone shitting up your ass! Do you think Mary would want that done to her body, if she wasn't catatonic?\"\n\n\"Of course she wouldn't. Go on.\"\n\n\"Yes! Thank you. So— so I just wanted to get some tranquilizer and help protect her, but then I was thrown in a padded cell, coerced and intimidated into breaking a twenty-six-year-old promise, and now you want me to break it again, five minutes later, because after fifteen pamphlets and no response you couldn't get the fucking clue that I'm not interested in therapy, I'm not interested in moving back to the city, and I am certainly not interested in relapse!\"\n\n\"Let me paraphrase,\" Marei says gently. \"Do I have this right? You're saying that first death made you angry because you promised in the memory of Mary you wouldn't do that sort of thing anymore. Likewise, you want to protect Mary's memory by protecting the honor of the body she once inhabi—\"\n\n\"She's still in there.\"\n\n\"She's braindead.\"\n\n\"She might still be in there, somewhere!\"\n\n\"Red...\"\n\nRed tears up. She tries as hard as she can to hold it back. Her canine teeth grit.\n\n\"I'm not defending her <!i>memory<!i>. I don't care about her <!i>memory<!i>. I care about... I care...\"\n\nShe looks away. \"Do I really have to open up even more, before you'll let me go?\"\n\n\"Yes, unfortunately. \"\n\n\"I... I care about...\"\n\n\"Go on. It's alright.\"\n\nRed pulls in a deep, rattling breath.\n\n\"I just care about what she'll think of me when she comes back.\"\n\nMarei blinks. \"Ah.\"\n\n\"Ah? What's that mean?\"\n\n\"Ah. Just. I hadn't... I didn't realize you still thought she was going to come back.\"\n\n\"Of course I do!\" Red spits. \"Of course! When Mynt gets the admin password, she'll be able to fix her! She will get the password, won't she? It's just a matter of time. I... I do love snuff, I love rough sex, I admit it, sure. But, until Mary comes back and gives me permission to do those things again, I will not be a part of this therapy session. There. I opened up. Whoop de fuckin ding dang doo. Now let me leave.\"\n\nMarei sighs hard and looks at you. \"What do you think?\"");
			addChoice("Red, you should go through with this session, at least. Mary could only get mad at us two for forcing you into this. She couldn't blame you.", explore.bind("stay"));
			addChoice("I think you should just let her leave.", explore.bind("leave"));
		}

		if (seg == "stay") {
			append("Marei nods at you, determined. \"Exactly. Blame this on us when Mary wakes up, Red. There's no need for any more anger.\"\n\n\""+data.playerName+"...!\"\n\nRed huffs and puffs, looking pissed enough to blow a house down, but your mind drifts to other things she could be blowing with that protesting mouth...\n\n\"Let's begin the second session.\" Marei saunters over to the dropped knife.\n\nRed fumbles for words, trying to think of a new excuse not to get snuffed, but Marei isn't listening. He closes in, looming. She's trapped.\n\nRed can't find a good reason to deny the persistent throb of excitement between her legs. Slowly, with hurt eyes, Red concedes to him, peels open the front of her cloak, and exposes her vulnerable, smooth little chest and belly.\n\nAnd yet Marei frowns and steps back, catching her by surprise.\n\n\"I see. So the first corpse did do its job, after all. You're not angry.\"\n\nHe stands up straight and smug, scratching more words onto his clipboard. But he doesn't stop for a while. He just keeps writing. The room goes quiet again, except for that persistent scratching.\n\nRed blinks. She wasn't expecting to be forced to wait for it. Eventually, in her need, she lowers a few fingers to her cunt and ends up glancing over at her corpse: disrobed, completely nude. Red's eyes slide over her own bloodstained curves...\n\nThe hum of the fluorescent light sinks into your head.\n\nMarei finishes writing, and begins to remove his suit jacket. He clears his throat to break Red's trance. She flicks her attention back to him.\n\n\"We'll start with some foreplay, since you're behaving so well.\" His voice lilts warmly, despite his menacing appearance: towering, slender, looming over Red's little body, plus that massive knife in his paw. \"For this death, I want you to think about Mary, and about the shame she would have if she saw you right now... please, if you can, immerse yourself in that feeling.\"\n\nRed had dripped with anticipation when he began to unbutton his shirt, but now her face knots up with pain. \"Why would you ask me to...?\"\n\nMarei tosses the shirt onto his chair.\n\n\"I explained earlier. Every corpse we make during this session will represent an unhealthy thought or emotion.\"\n\n\"Modesty and dignity are not unhealth—\"\n\n\"If you don't want to make yourself feel ashamed for the purposes of the session, I will do it for you,\" Marei interrupts, holding up a paw to cut her off.\n\nMarei starts to unbutton his pants.\n\nRed's tongue hangs out as she observes his furless, flexible, feline body, with all of its definition and tone. A drop of saliva falls from the tip of her tongue to the floor. Her eyes are twinkling.\n\n\"Don't tease me like this,\" she begs, and reaches for the hem of his pants, where his waiting bulge calls to her. \"You wouldn't really be ashamed of me, if I...\"\n\nMarei frowns and catches her paw. He grabs her wrist tightly, jerks it upward, and pulls her little body close to his.\n\n\"What do you think you're doing?\" he asks, calmly. Red flinches for a moment.\n\n\"I'm just... I just thought you said we'd start off with foreplay...?\"\n\nShe trails off into mumbles. You never knew that her otherwise fearsome wolf mouth was capable of such cute, reserved little mumbles. She runs a clawed digit over Marei's sleek slacks and caresses the obvious bulge of his shaft; he frowns down at her like a mother cat at a kitten and bats her hand away.\n\n\"Ah!\" she pulls back, sucking a finger. \"Quit it!\"\n\nHer golden eyes glow with predatory hunger. It's the same expression you've seen on her face multiple times before; an impatient neediness that always arrives neatly packaged with a nice gush of cuntjuice and a quiver of her fluffy tail. Although she still desperately wants to feel that warmth beneath her paw-pads again, she finally stops trying to reach out and grope Marei's cock.\n\nHe smiles. She's got the idea, now. He takes a handful of her cute bob hairdo and yanks her down to her knees, such that her face presses roughly against his crotch. He grinds her little snout up against his junk, through his pants, and observes the results with a scientific coldness.\n\nRed's eyes roll up into her head. The scent of catcock at this distance is overpowering. It only has a few sheer layers of fabric to leak through before it reaches her nose, and its potency is raw and pure. She sniffles and snuffles heavily at the bulge filling her nostrils, pulling in his scent. Her heightened canine senses make her shiver. She sniffs again, inhaling deeply, and her maw relaxes open slightly. She drools a tiny bit on his pants...\n\n\"...No,\" he says suddenly, and yanks her back by her hair. Her mouth hangs open. Her expression is a mixture of lust and frustration, which mingle very readily.\n\n\"Nnnnf... stooop! Just let me-!\"\n\nMarei draws the knife above her with the other hand.\n\n\"Beg for it.\"\n\nRed's expression sours. \"Nnn... no...\"\n\n\"Why not? You want it, don't you?\"\n\n\"Yes...!\"\n\nThe knife winks at Red in the blaring light. \"Then why not beg?\"\n\n\"Because it makes me... it's...\"\n\n\"It makes you feel guilty?\"\n\nShe looks up at him and swallows. \"Ye—\"\n\nMarei plunges the knife directly into her heart.\n\nShe interrupts herself with a sharp gasp.\n\nYou both watch as she cums, eyelids fluttering, and topples onto her side. All the yellow sunshine floods from her eyes, leaving them dull and half-open.\n\nRed falls to the floor, twitching. Blood soaks her fur. The new pool expands over the white floor and joins up with the older one. Marei reaches down and gently removes the cloak from her body, folds it, and takes it with him to the closed chamber on the other side of the room.\n\nJust like before, it hisses open when he hits the button, and Red tumbles out, only this time, she clutches her chest, gasping heavily. Marei nonchalantly tosses her cloak over her head. She struggles underneath it, smearing herself with warm loli wolfblood, then pokes her head up out of it and pouts at him.\n\n\"Remember to milk the post-respawn orgasms this time,\" he reminds her gently. \"Don't block them out. Just spread your legs and let them do what they're gonna do. It doesn't have to be a sexual experience if you decide it isn't.\"\n\nShe remembers, with a cute glance down at her crotch, then... oh... oh god, she <!i>remembers<!i>... <3\n\n\"How did you feel during that death?\" Marei questions her.\n\nRed fights for words while pleasure crackles up and down her spine. She writhes in anger, and claws out, clearly wanting to tear into him, but it subsides; she turns inward, looking crushed and hopeless and sorry for herself, but that also subsides, and then, finally, after going through about four different facial expressions all in the same few moments, Red hisses with a sigh of hot relief and just squirms with raw happiness as her cunt throbs and gushes on the crimson floor.\n\n\"You're so mean!\" Her voice vibrates.\n\n\"You seem better off for it,\" Marei says softly, which only serves to bewilder the flustered girl further. He slinks closer to her and peers down at her with his bright blue eyes.\n\n\"... Why don't we do one more death? Would you be up for that?\"\n\nRed screws her eyes shut, clutches her heart, and curls her lips into a snarl. Her heart says yes, but her mind says no; she contemplates her answer for a moment before she turns her eyes upward at him.\n\n\"...I...\" she answers softly, and tailors her expression into one of confusion.");
			addChoice("Do it. One more death.", explore.bind("should"), {kinks: ["Snuff"]});
			addChoice("I don't know.... (End.)", explore.bind("leave"));
		}

		if (seg == "should") {
			append("\"I should,\" Red says, and the corner of Marei's mouth tugs upward in response.\n\n\"Should...?\" he questions, trailing off, making her say it.\n\n\"I should stay... f-for one more...\" Red utters, and clutches her cape tightly about herself. You have a hard time telling what spot of red is from her blood, and which is simply the fabric of the garment itself.\n\n\"You're right, you should,\" Marei reassures her. \"Just a little longer, then I'll give you what you came for. Ah, it's just in time...\"\n\nTwo smiling, ball-capped staff members wheel in two heavy white tanks of tranquilizer. They tip their hats at Marei and leave, just as silently and quickly as they came.\n\nRed's eyes go wide. Each of those canisters is as tall as her. \"You're... you really are gonna give me some, after all?\" She doesn't sound like she believes her own words.\n\nMarei slinks over to his table of tools. He produces a long, thin needle that perches on the edge of a syringe, and turns back toward Red, stiffening his spine and standing up straight, peering down at her with an inquisitive look. \"After one more death, yes.\"\n\nShe looks down, quiet.\n\n\"Come here, Red,\" he commands, and the little wolf swallows, but obliges, shuffling her feet slowly until she approaches the one in charge. He reaches out and grips her wrist, tugging her arm up, he presses the needle into her vein and his eyes narrow with the pressing of the plunger. Red hadn't even asked what was in it, she merely did as commanded. In fact, there was something sensual about letting her arm extend and showing him the crook of it, looking away and pouting. She allowed herself to be completely vulnerable to the needle.\n\nThe sphynx cat watched her warily, cocking an eyebrow. \"Do me a favor and slowly count to ten.\"\n\nHis voice was a purr, a listing wave on Red's mind as she began already to feel the effects of the quick-acting chemical in her bloodstream.\n\n\"O...One,\" she starts, and blinks heavily. Her eyelids are the first to feel it, it's noticeable right away. She can't even keep them both working at once, it's as if one lags behind the other, but she blinks again.\n\n\"T-Two...\" She's falling asleep. It's obvious now what was in the syringe, a tranquilizer, the stuff she had come here for, and she'd been given a dose.\n\n\"Thr...th...\" Red faltered, unable to get past the number, and Marei removed the needle slowly from her arm, setting it aside, and adding to his notes. He gave her a gentle prod with the tip of his engorged cock, right on the cheek, attempting to rouse her.\n\nShe startled awake, if only for a moment, and latched automatically to the cock just off to the left of her lips. It was deep inside her, you could tell. A very natural instinct. All wolves sucked cock. It was just instinct.\n\n\"I want my bunny,\" she says dreamily. She murmurs cutely behind thick veil of Marei's precum on her lips. \"I need to give her medicine..\"\n\n\"Medicine,\" Marei says firmly, professionally, \"or tranquilizer? Surely you know the difference, Red?\"\n\nHe slaps her mouth with his cockmeat, then rubs it against her cheek again. Red nuzzles it slowly. Her little eyebrows furrow in a cute expression of contemplation, drawing out her thoughts as Marei allows her to suckle on his tip again.\n\n\"She needs to be sedated,\" Red says sleepily, and Marei puts two fingers under the tip of his dick, pulling it back and dropping it onto her forehead with a disgracefully wet slap. He sighed, and took a moment to reach for his clipboard, jotting down her phrasing. Could've meant a lot of things.\n\n\"Well now... It seems we're finally alone,\" Marei states, as though he's talking to nobody, or maybe himself. He stands up straight and runs his paws along his body, twice, and then flicks them. Sweat flies off in an arc of droplets from his fingertips. Therapy is hard work.\n\n\"I know why you're really here, now. Maybe before, you were just curious, like my species, but now... now you're here for me, aren't you~?\" Who is he talking to? Marei takes two steps around Red now, so that he's positioned between her legs. Mmm. This was always the interesting part of the job, wasn't it? But to have a player sitting in on such a spectacle...\n\n\"Ahhh... it's been awhile since I've had this...\" His doctorly professionalism flips to the informality of a porn star. Marei sighs softly, touching himself. He strokes one of his own nipples, and tilts his head; a paw wanders down to the base of his cock, and he grips it tightly in two fingers; his cat ears fold to the side,and his cock pulses of its own accord. He brings a couple experimental slaps down right onto Red's waiting pussy.\n\n\"This will be a tight fit... are you enjoying the show?\" He rubs his cockhead in a circle around Red's hole, and grabs one of her legs with his hand. Rolling his hips, he begins to shove against her waiting body. Red lies limp, drooling, her eyes closed.\n\nShe's totally passed out. Marei leans over her.\n\nReaching down, he slowly opens one of her eyelids with a thumb and forefinger, pulling it back so her dilated iris stares blankly up at him.\n\n\"I wonder what she's dreaming...?\"");
			addChoice("Me too...", explore.bind("dream"));
		}

		if (seg == "dream") {
			highEffect();
			append("Woosh...\n\nGreen waves rolled around her. The grass was high and shifting in the breeze. Little blue lights danced in the leaves. Fireflies. They dipped and swirled through the windblown grass.\n\nRed stood alone in an ocean of breezy scents. She could smell the earth, the grass, she could smell the scent of sweat on the wind... the scent of sex. She sniffed at it readily. It was all around her, just out of sight. The wind carried the smell in from every direction. It seemed like there were invisible orgies taking place past each hill, and she just happened to stand right in the eye of the storm, completely alone, clothed modestly in her cloak.\n\nHer cloak. She touched it. It felt real. Was she dreaming?\n\nShe pinched herself.\n\nIt didn't feel real, but it felt good.\n\nShe did it again.\n\nIt made her feel nostalgic. Red pinched herself over and over, down her arms, her belly... eventually, she yanked viciously on her own swollen clit.\n\nShouts of pleasure echoed over the hills. The scent of frantic, prolonged sex wafted up her nose once more.\n\nRed trailed through the grass, searching for the source. Still, nothing but fireflies glittering around her. She stopped to watch them several times. And to touch herself, also... she could do a little while she walked, but nothing felt quite as good as sitting down for a moment, with the cool grasses threading up her buttcrack, and feeding a couple fingers up her slick, wet cubcunt while she watched the cute little bugs dance.\n\nTwo of her fingers wound between her legs, she couldn't help herself; lust overcoming, she leapt to her feet and kept searching.\n\nThe grass was getting higher now, up to her ginormo loli tits. It prickled and played through her fur. It poked her stomach and tickled her ears. It swayed with harsh gusts of sexwind, so tantalizing, so close.\n\nShe was about to stomp her foot or shout for someone to come bring her to the party, but, instead, her frustration felt like it reached a boiling point, a fever pitch, and an event horizon all at once— and then she fucking exploded.\n\nRed's red mist wafted away in the wind. Perfect calm overtook her detached soul. She smiled like she hadn't ever smiled when she had a mouth to smile with. She even giggled. It was silly, to try and hunt the scent down, when she had a perfectly good cunt right here between her legs...\n\nAs she had done tens of thousands of times, alone in her cabin with her sleeping bunny, Red settled in for an hours-long masturbation session. It was familiar and comfortable. The harder she rubbed, the less lonely she felt.\n\nRed moaned softly against the breeze. The moan became a howl. \"Help,\" she asked the grass, teetering on the edge. It felt like she had been two wrist-flicks away from orgasm for an hour now. \"Someone help. Please...\"\n\nThe hills did not answer.\n\nShe couldn't cum on her own...\n\n");
			addChoice("... Next.", explore.bind("dream2"));
		}

		if (seg == "dream2") {
			append("Marei grunts and stuffs his fat catcock right up Red's cunt, splitting her chubby little underaged labia open and ramming up against the entrance to her uterus. She clenches on his cock. Must be dreaming about taking three fingers or more. Marei notes this, and scribbles some speculative dream analysis notes on his clipboard. He was still a therapist, even if he was finally and truly getting off on his own client.\n\nThere's nothing clinical or professional about the way Marei shoves his dick right in to the hilt and rapes her tiny cubwomb open. One of his paws crashes down onto Red's slow-breathing chest and pins her by it. He slams his hips forward over and over. Her soft inner walls gape each time, allowing him to hump harder and deeper.\n\nHe glances over. You know he wants you to watch.\n\nThe tight ring of Red's eager, gushing cubcunt finally stretches just that last little bit, allowing Marei to hilt himself completely with every single thrust. During one of those hilts, he starts speed-fucking her, taking a single inch out and ramming it back in as fast as he can. He mercilessly beats her insides up with his cock, so huge and adult compared to such a tiny loli body. You could see it bulging out her belly, she was so small.\n\n\"Mmyesss...\" Marei purrs, his balls clenching with the pleasure of a good sleep-rape. His face winds up with lust. He turns to you again.\n\n\"Is this what you came for?\" he asks, and power-fucks his cock in and out of Red's limp body. Her tail, paws, arms, feet, and ears ragdoll-flop around uselessly. The tranquilizer has as good as killed her, she's so deeply unconscious.\n\nNot deep enough to endure the next thrust, though. He grabs her hips and then bucks his own hard up against her pelvis, filling her completely, and Red, in her state of half-consciousness, seems to open her eyes and look around in confusion for a moment, roused by the force of his thrust.\n\n\"W-wha...?\" she asks, eyes only open a slit. \"Bunny... I smell bunny cunny...\"\n\nMarei growls. It's clear that he's fucking her through her dream, turning it into a wet dream instead, and he keeps his cock ramming rhythmically into her waiting hole.\n\n\"Shut the fuck up about your bunny slut. It's time to get over her. There are much <!i>bigger<!i>- unf! -bigger problems to deal with\" he grabs her by the throat and FUCKS her cunt so brutally hard that drops of wolf oils squirt out over his nutsack— \n\n\"Like how much of a cubwhore you are, and how few rapes you've taken!\" Marei drills her ceaselessly. The noises of his heavy breathing fill the room, and every now and then he looks back at you, watching you, judging you. The way he rolls his slender femboy hips, pumping and methodical, captures your attention now and then. You just can't avert your eyes.\n\n\"Yeah... is this what you want, you fucking worthless snuffslut...?\" he purrs directly in her ear.\n\nRed groans, half-asleep, fighting the tranquilizer. Her eyes open and shut slowly, dumbly, out of sync. Her cuntmuscles are forced to loosen as the drug's muscle relaxant effects kick in; a sure warning sign of imminent overdose. Red has absolutely no choice but to take his dick as hard and deep as he wants to thrust it; her body will not protect her.\n\nTo your surprise, she answers: \"Yes.\"\n\n\"What?\" Marei pauses. His cock throbs and twitches like an idling car engine in her cunt.\n\n\"Yes,\" she says again, weaker, more quiet. \"I am... snuffslut... I want... rape...\"\n\nIt's amazing. She's so far gone, on the edge of overdose, and she still has enough strength to admit that and then spread her tiny thighs open as wide as she can, welcoming Marei's huge adult cock inside her.\n\nShe fixes her blurry, fading eyes on his. \"Am I... dying...?\"\n\nMarei bites back a rush of pity... or something. You're not sure what the glimmer in his eyes is. It might even be admiration. But either way, he's a sucker for hard-fought submission; he drags a couple fingers gently over her cheek, leans down, and kisses her on the mouth. Then he starts pumping his cock twice as fast, fucking her mercilessly.\n\n\"Of course you're fuckin dying, sweetie. You're a snuffslut. It's what you do best.\"\n\nHe slams another hand down on her throat and squeezes, throttlefucking her. She can only barely wheeze her sleepy words out.\n\n\"What's this corpse going to represent, Red? Say it.\" His eyes are cold as they hold hers, and he pounds her roughly with each word.\n\n\"K-Kill me...\" Her voice is fading.\n\n\"I'm going to. What does this corpse represent?\" he asks again, and squeezes both hands around her neck.\n\n\"I d-dunno... I'm sorry...\" She's starting to lose her ability to talk or breathe, and Marei continues ramming himself relentlessly into her.\n\n\"Think hard about it!\"\n\n\"Uuuurk,\" she gurgles as his paws clench down on her throat.\n\n\"I dunno... I don't care... I just want cock... I want to die on cock... I want bunny... I smell her... please, please, please—\" she's cut off by Marei's paws squeezing her again.\n\nShe tries to sit up but can't. \"Please— please. Gimme more of this. I came here for it. I need some... tranquil... Mary. Bunny. My bunny some of this to... for... bunny... I can... smell...\"\n\n\"You want me to give your bunny some of this dick? <3\"\n\nMarei suddenly and forcefully buries himself all the way into her. She yelps loudly.\n\n\"Yes,\" she answers immediately. Her thighs slam together and her belly quivers as she cums.\n\n\"Snuffrape her!\" she shouts, seeming not to care anymore if her answer is questionable to her own morals.\n\nThe pleasure and the drug combined are too much for her body to handle. With one sluggish orgasmic spasm, a masochistic smile blossoms on Red's face. She passes out from the sheer weight of the chemicals flooding her system, emotions and drugs together.\n\nWithin five minutes of violent hatefucking, Marei cums, too. He grunts and slams her head against the soft padded floor over and over, teeth gritted, as his cock explodes inside her and paints her tiny cub womb white. He keeps pumping it in and out after, spilling oodles of catcum all over her little asscrack.\n\n\"That's it,\" he growls, chokefucking her. His cum makes adorable squishy wet noises as he keeps pumping. \"That's it... come on...\" He stares over at you while he forces the life out of her with his cock, he wants to see your reaction to it, too, and it's clear soon that he's still cumming hard.\n\nSoon Red's face goes blue, then pale. You don't think it's because of the paws around her throat. The tranquilizer courses up through her brain, twisting her smile into a dopey grin. A hush and a shiver falls over her body.\n\nRed dies.\n\nMarei's breathing is ragged, but he pulls his fattened post-orgasmic cock out from the warped body of Red's third corpse. For the third time, Marei walks over to the respawn chamber and opens the doors. His cock hangs half-hard between his thighs, dripping cum and Red's wombjuices.\n\nThis time, she doesn't tumble out or start going numb with chain-orgasms. This time, she places one serene footpaw on the bottom of the doorframe and steps back into reality on her own terms. Her body is naked and perfect: the respawn system assembled it exactly to specification.\n\nShe sprints over to the only corner of the room that hasn't been bloodsoaked, her expression desperate, and slides down with her back against the padded wall, until she's in the fetal position. Only then does she allow the post-respawn orgasms to hit her, and she doesn't make any noises past a gentle mewl, though her body rocks and convulses with them.\n\n\"That was wrong,\" Red whispers between her knees. \"It was wrong of me to think of her like that...\"\n\nMarei has cleaned up by this point. His own body, of course, not the corpses; they still have a purpose to serve. He's wiped his cock down, cleaned it of cum and juices, and as you look over, he finishes up with a quick wipe down his thighs.\n\n\"Please let me leave,\" Red begs muffledly.");
			addChoice("Next.", explore.bind("dream3"));
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "dream3") {
			append("\"Okay.\"\n\nShe looks up. Her bloodshot, teary eyes peek out above the fur of her knees.\n\n\"Really?\" she asks, wiping at her face.\n\n\"Really, yes. I did say just one more death.\" He looks at her with a sidelong glance, his eyes unamused, and uncaring.\n\nRed drags herself to her feet. Some people from the lobby poke their heads up through the door's plexiglass window and peer in, looking for that fiery little wolf girl they saw earlier... but she isn't here anymore. There's a quiet, somber predator in her place, with her back to a wall and her yellow eyes narrowed and pointing up at Marei's face.\n\n\"Do you still want the tranquilizer?\" he asks her, gesturing at the two tanks. A strip of glass down their sides shows that each is filled to the brim with lime green liquid. \"They're yours. I'll even help you bring them down to your cabin, if you'd like.\"\n\nRed just keeps staring at him. She knows better than to take the bait.\n\n\"Darn,\" he tsks. \"And I was going to be all dramatic about it, too. Well. I'll just say it. There's another option you have here. Instead of lugging these heavy things down to your bunny, you can lug your bunny up to them. Then, my staff will hook her up to an I.V. drip and keep her safe in our highest, most secure suite wards. "+(data.glowbunnyLLLStarted?"We even have John here, now,":"We have cameras everywhere, at all times,")+" so you can be assured that no one will rape her or defile her honor or give her any reason to hate you if— when she wakes up. We'll take care of her for you, give her sponge baths, and flip her like a little bunny pancake to prevent bedsores.\"\n\nRed looks over her corpses. The first: a face twisted in anger. The second: twisted with guilt. The third: happy, stupid, content, pale, tranquilized... and still involuntarily cumming from the intense rape it had just endured.\n\n\"I would never leave Mary with you people,\" she mutters.\n\n\"Understandable,\" Marei offers patiently. \"Well. Go ahead and leave, then. Can't say I didn't try to help you open up—\" he glances at the first corpse— \"accept your tastes\"— the second— \"and control your nymphomania.\"\n\nHe looks at the third corpse. Yep, still cumming.\n\nHe turns around and pretends to leave.\n\nRed bristles. \"Stop baiting me! God, you're infuriating. You clearly want me to say 'But wait,' or something...\"\n\n\"Fuck that. I've got appointments,\" he says, slipping his suit jacket back on. He doesn't bother to button it up. He just leaves it hanging open, so he can show off his sexy feline abs to all the nurses. \"The tranquilizer is there, if this is really what you want to do. If you want to know what I think, though—\"\n\n\"— Oh, I couldn't imagine, hearing what <!i>you<!i> think? Wow, never woulda even thought to ask—\"\n\n\"— I think you should just drop your bunny off at Roxelle's, put her on a drip, and move back to the city. You're torturing yourself, living way out there, denying your own urges or taking them out on the girl you claim to want to protect. Just let go, Red. We volunteered for this shitshow. You didn't.\"\n\nMarei strolls right out the door. His suit billows out behind him. \"And for fuck's sake, drop that tsundere banter tic. Some of the snarky little snips you threw at our receptionist earlier almost made me puke.\"\n\nYou're left alone with Red.\n\nShe kneels among her three corpses, looking from one to the other, back to one, then over to the other, to that one, the other, and that other one, too. Rage, guilt, and lust.\n\nShe takes a deep breath and tries to calm herself down solely through force of will. It doesn't work. She places two fingers on her cunt and grinds them slowly up and down the little cleft, tucking her clit between her lips and pulling it back out again with slow strokes of her paw. That works. She smiles down at the clear strands of oil that web between her fingers.\n\n\"What do you think?\" she asks her paw.");
			addChoice("I think you should move back to the city, Red.", explore.bind("city"));
			addChoice("I think you should stay loyal to your friend.", explore.bind("friend"));
		}

		if (seg == "friend") {
			data.redChoseCity = false;
			append("\"My friend...\" she says, a little disappointed. She looks away and blushes angrily. \"Fuck. I can't believe I was even considering any other option. You're right. I came up here for her. I endured this temptation for her. I've been living alone twenty-six years <!i>for her...<!i>\"\n\nRed stands up and balls her fists. \"I'll take care of her stupid, reckless, prudish little ass as long as it takes. Even if it's hard for me to live alone like that, I... I don't know, I'll blow off steam somehow! I'll get out more! I'll get out more... I'll keep her on the drip and go for power jogs, and I'll make little effigies of Archie and tear them up... I'll claw the trees... I'll get these fucked up fetishes out of my system, somehow. I can do this. I can do this. I can do this.\"\n\nShe thanks you, grabs both heavy tanks of tranquilizer, and lifts them over her little shoulders with a \"HUP!\"\n\nThen she lugs them out of the therapy room and disappears around the corner. The gazelle passes by her in the hallway, tits still covered in wounds, and leans down to tease her with some nasty little jab about her height.\n\nRed ignores her entirely. She just kicks open the doors to the lobby, drawing a gasp from the crowd, and strides purposefully back home.");
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "city") {
			data.redChoseCity = true;
			append("Red looks up at you. Her lip starts to quiver.\n\n\"You didn't say what I think you said, did you?\"");
			addChoice("I did.", explore.bind("city2"));
		}

		if (seg == "city2") {
			append("\"But...\"\n\nShe starts to cry. It doesn't leak into her voice, which remains soft and stable, but every feature on her face starts to quiver and scrunch up and break down with severe emotional distress. She can't even keep her paws steady as they reach to peel the cloak off her last corpse, desperate for comfort.\n\n\"But what if... what if she...\"");
			addChoice("Who cares if she's upset with you when she wakes up?", explore.bind("city3"));
		}

		if (seg == "city3") {
			append("Red swallows a squeak of despair. She cares. She cares very, very much.\n\n\"I wouldn't be able to live with myself...\"");
			addChoice("I just mean... I don't know, I don't know what kind of bond you two had with each other, but you're not hurting anybody by going off to the city and doing... more of this.", 	explore.bind("city4"));
		}

		if (seg == "city4") {
			append("\"But what if she...\"");
			addChoice("She shouldn't have any say about your sex life. She should've never even pushed you to make that promise in the first place.", explore.bind("city5"));
		}

		if (seg == "city5") {
			append("Red wraps her arms around your legs and hugs your crotch. Her tear-stained cheeks smash up against your "+pickByGenitals("nutsack", "cunt", "nutsack")+". Now her voice is soft, stable, and just a little muffled:\n\n\"What if she doesn't love me anymore?\" She stares up at you with big, tear-filled eyes.");
			addChoice("Red, you took care of her for twenty-six years.", explore.bind("city6"));
		}

		if (seg == "city6") {
			append("\"And I touched her, and I did things to her... and I... I'm on thin ice already... and I'm...\"\n\nRed starts sobbing now. Her voice cracks and trickles out as a low, weeping wail. Her whole body shudders with dismay. Hot tears leak out over your "+pickByGenitals("nutsack", "cuntlips", "nutsack")+". She grits her teeth and screws her eyes shut, and you can almost feel the pain of all these years bubbling to the surface and threatening to burst out of her face like a scream.\n\nShe doesn't scream.\n\nShe whimpers.\n\n\"I'm so fucked up.\"");
			addChoice("Just hug her.", explore.bind("city7"));
		}

		if (seg == "city7") {
			append("\"I'm so fucked up. I'm throwing it away, I'm throwing two decades of effort away... I wasn't going to relapse, I really wasn't...\"");
			addChoice("This doesn't have to be a relapse. Remember the third corpse. You can still hold on to some dignity and set some limits for yourself, if you choose to. You've got enough self-control, that's for sure.", explore.bind("city8"));
		}

		if (seg == "city8") {
			append("It takes her a while to get to a point where she isn't crying long enough to choke out a complete sentence:\n\n\"That's... not... not... that's not... that's... that's not how this works,\" she hiccups. \"H-He didn't... even barely... need to tease me... and I went right off the d-deep end...\"");
			addChoice("Oh. Right... maybe you don't have self control when it comes to this stuff...", explore.bind("city9"));
		}

		if (seg == "city9") {
			append("She pulls in one massive, steadying, lung-rattling breath after another. Not hyperventilating, just breathing slowly and purposefully. She's getting a little self-control practice in.\n\nSoon, she's halfway back to baseline. She reaches for her cloak again, still stuck on her third corpse, but her fingers stop just short of the hemline. They twitch.\n\nShe sobs. Her hand drops.\n\n\"I don't care,\" she pouts, half-laughing at herself. \"No. I don't care if I relapse. I can't... go back... to that fucking cabin.\"\n\nShe stands up, shakily. You help her steady herself and start the long walk out of the therapy room, down the hall, and back into the lobby. A staff member asks her if she needs him to wheel the tranquilizer out.\n\n\"Please,\" she says. \"And do you have a phone here?\"\n\n\"Sure do.\" He grins at her from underneath the shadow of his ball-cap's brim. \"Who should I call, little ma'am?\"\n\n\"Roxelle Devaunt.\"");
			addChoice("Do you think you'll be happier in the city?", explore.bind("city10"));
		}

		if (seg == "city10") {
			append("\"I'll be happier anyplace that isn't her bedside,\" she says, monotone. She wipes the last few tears from her eyes, red and puffy, and disengages from your comforting grip. Behind her, two burly cleanup staff guys show up. The backs of their shirts say <!i>The Boys — corpse disposal, filthplay cleanup, trash delivery!<!i> They head into her therapy room and casually toss her corpses into body bags. Anger, guilt, lust.\n\nRed's eyes flash for a moment. \"HEY! Wait!\"\n\nShe runs over to them, unzips the third body bag, and grabs her cloak.\n\nThey slap her ass and send her on her way. She trots back over to you, dragging her cloak behind in one paw, looking utterly exhausted. \"It's just a good cumrag,\" she mutters. \"That's all.\"\n\nSomeone on the other side of the lobby waves her over. The phone is ready, and Rox is rambling away on the line.\n\nRed stands on her tippy toes and gives your chest a kiss. \"Thank you for going through that with me.\" She looks down. \"Visit me sometime, yeah? If you can stomach it.\"");
			addChoice("Absolutely.", explore.bind("city12"));
			addChoice("Sure thing, kiddo. Stay safe.", explore.bind("city12"));
			addChoice("We'll see. Stay safe.", explore.bind("city12"));
		}

		if (seg == "city12") {
			append("She hurries over to the phone. You and the rest of the crowd in the lobby gets a wonderful view of her little cunt and asscrack as she leans over to speak into the old receiver:\n\n\"Rox, hey. It's me. I'm gonna need you to lay off the booze for a while...\"");
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "leave") {
			append("Marei tucks a loose strand of hair behind Red's big fluffy wolf ears, and stares into her eyes.\n\n\"Fine. If you really want to go, you can go. I will show mercy. Thank you for enduring forced confinement. I know it wasn't pleasant.\"\n\nRed runs from the ward. You think for a moment she might want to take her cloak off and ball it up, so that it doesn't drench her with more blood, but she makes sure to button it up even tighter than usual and clutch the sides of it while she sprints out the room and down the hallway.\n\nYou guess she just really doesn't want these people to come onto her right now.");
			addChoice("Move along.", explore.bind("apohub"));
		}

		if (seg == "mareiTour") {
			disablePause();
			unlockJournal("mareiTour");
			append("She reads your name off her clipboard: \""+data.playerName+"?\"");
			addChoice("Yes?", explore.bind("mareiTour2"));
		}

		if (seg == "mareiTour2") {
			append("She leaves the room.\n\n... You stand around, looking at the white walls. The smiling staff members stare you down, hands on their tranquilizer pistols.");
			addChoice("What the fuck is your guys's deal??", explore.bind("mareiTourGuys"));
			addChoice("Flash them~", explore.bind("mareiTourFlash"), {kinks: ["Love"]});
		}

		if (seg == "mareiTourGuys") {
			append("None of them answer you.\n\nYou meet their stares. Some of them seem calm, but others twitch gently as they suppress physical tics, clean their guns obsessively, and shoot paranoid glances repeatedly from you, to their coworkers, to both exits, and back. Doesn't look like a single one of them has normal-sized boobs or cockbulges. Even the girls have abnormally puffy, swollen cameltoes snuggled up tight with the crotch of their work pants.\n\n\"Shift change,\" says a tired woman over the P.A. system.\n\nOne of the staff heads out through the double doors and hands their tranquilizer pistol to another, almost identical coworker. They nod and grope each other casually.\n\n\"Working late tonight?\" one asks.\n\n\"No,\" the other replies, holding back tears.\n\nThe double-doors bust open. The two staff members shut their mouths and move along.");
			addChoice("Is it the nurse again?", explore.bind("mareiTour3"));
		}

		if (seg == "mareiTourFlash") {
			append("You tuck a couple fingers under the waistband of your pants and yank them down. Your "+pickByGenitals("cock flops out into", "bare cunt feels nice in", "cock flops out into")+" the perfectly regulated, room-temperature air. All the staff members shift their feet. Their already oversized bulges grow twice as big, straining the white fabric of their uniforms. A couple shadowy smiles break into grins. Paws slide down pants and start stroking.\n\nThe double-doors bust open. Everyone yanks their hands out and dials their grins back by a row of teeth or two.");
			addChoice("Is it the nurse again?", explore.bind("mareiTour3"));
		}

		if (seg == "mareiTour3") {
			append("Nope.\n\nIt's a slender, hairless cat in a form-fitting suit that hugs his flat chest, his femmy hips, and his sizeable bulge. It's Marei.\n\nThe staff members straighten their backs and screw on their smiles extra tight for their C.E.O.\n\n\"Come with me,\" Marei asks, extending a paw politely. \"You'll have to hold hands with me. We can't entirely trust you, yet, but it's about time you got the tour.\"");
			addChoice("The tour? (Take his paw.)", explore.bind("mareiTour4"));
		}

		if (seg == "mareiTour4") {
			append("He wraps his soft, padded fingers around yours.\n\n\"It's in our policy. We drafted it many decades ago. If a new player ever appeared, we agreed that they should be kept ignorant of the more gruesome problems until they've had a chance to acclimate to the island and enjoy some innocent fun. This waiting period also gives us a chance to see if you're a psychopath or not. Then, if we determine you can be trusted, policy states that the highest-ranking member of staff should take you on a guided tour of the Apothecary, so you may understand the ugly details of life on this island.\"\n\nMarei squeezes your palm reassuringly. \"It's not as bad as I'm making it seem. Some people never have any problems. But those who do... they come here, and we try to make them better.\"");
			addChoice("I see.", explore.bind("mareiTour5"));
		}

		if (seg == "mareiTour5") {
			append("Silence fills the room. The rest of the staff stand there, watching you hold hands with Marei.\n\n\"If you need further incentive,\" Marei continues hopefully, \"I'll be giving you a Septricard at the end of the tour. You must stay til the very end, though. I'll also give you an important piece of information at that point. Deal?\"");
			addChoice("... Deal.", explore.bind("mareiTour6"));
			addChoice("I'd rather go have sex.", explore.bind("mareiTourPass"));
		}

		if (seg == "mareiTourPass") {
			enablePause();
			data.mareiTourPassed = true;
			addToItem("Septricard", 1);
			append("Marei's hopeful expression deflates.\n\n\"Suit yourself. Just take this, then. You'll hit a dead end without it.\"");
			addChoice("Sure thanks. Move along.", explore.bind("apohub"));
		}

		if (seg == "mareiTour6") {
			append("\"Wonderful.\"\n\nHe looks around at his staff. \"We'll start with the biggest ward, and the source of all these creepy smiling staff members around us right now—\" they each look down, eyes shaded under their ballcaps, and a few smiles turn to self-conscious frowns— \"We'll start with the P.M. ward. From there, I'll let you pick where we go next. Let's get this over with as fast as possible.\"\n\nMarei leads you determinately through the double doors. A long, hypnotic white hallway stretches out to infinity in front of you both.");
			addChoice("P.M. ward?", explore.bind("mareiTour7"));
			addChoice("The picky mumblers ward?", explore.bind("mareiTour7"));
			addChoice("The pyromaniacal madmen ward?", explore.bind("mareiTour7"));
			addChoice("The pompous malcontents ward?", explore.bind("mareiTour7"));
			addChoice("The penis munchers ward?", explore.bind("mareiTour7"));
		}

		if (seg == "mareiTour7") {
			append("\"The prairie madness ward.\"\n\nA sallow-faced shark dude hurries by, glancing over his shoulder. He looks like he hasn't slept in three days.\n\nFurther down the hallway, two nurses rush after him, pistols drawn.");
			addChoice("Oh. Like stir crazy people.", explore.bind("mareiTour8"));
		}

		if (seg == "mareiTour8") {
			append("\"Yeah.\"");
			addChoice("They need a whole ward?", explore.bind("mareiTour9"));
		}

		if (seg == "mareiTour9") {
			append("Marei laughs and side-eyes you.\n\n\"It's the most common affliction on the island. You run out of things to do here after thirty years. Then you live through another thirty-six. Besides that, there's all kinds of places to get stuck in solitary confinement for days, weeks, months...\"");
			addChoice("Mmm...", explore.bind("mareiTour10"));
		}

		if (seg == "mareiTour10") {
			append("Up til now, you've been passing happy, chatting pairs of nurses, people fucking each other silly in the hallways, and suave doctors on their smoke breaks, who lean their backs up against the wall and sip drags from sweetgrass cigarettes to ease the stress of helping other people for a living.\n\nThen you pass under a set of double-doors marked <!b>P.M. Ward.<!b>\n\nImmediately, the atmosphere deadens. Quiet echoes of happy conversation become echoes of frantic whispering or prolonged soliloquy.\n\n\"Soliloquy is a very powerful coping mechanism,\" Marei mumbles. \"You can burn hours talking to yourself. But if too many days pass like that, you become completely detached from reality. We'll start with the patients who have successfully shed all their tics and neuroses besides that common crutch.\"\n\nHe takes you down to a neat little row of cells with unlocked, windowed doors.\n\nThe patients inside all seem fairly normal, despite occasionally mumbling to themselves. Most of them run up and open their doors and greet you with vibratory excitement. A couple are too wrapped up in their thoughts to notice you. A couple more are too scared to approach Marei, but stare longingly at you from the back of their rooms.\n\nMarei trudges on relentlessly. He won't let you stop to chat with anyone. \"Don't tempt them. Don't give them more than a greeting,\" he whispers. \"They're almost done their treatment programs. Almost ready to be released back into the general pop. But first, they have to prove that they can spend at least a couple hours of each day alone and bored— <!i>without<!i> going completely insane. The doors are unlocked, because they aren't dangers to themselves or anyone else, but we watch to see if they leave their rooms or not. If they can't spend twenty minutes without opening the door and looking for someone to chat with in the hallway, they definitely aren't ready to get stuck up in a tree, lost in Junk City's back alleys, or isolated down the wrong passageway in a meteoric cave system. That's a core part of our policy: we do not release patients who are almost guaranteed to relapse.\"\n\nThe patients get better and better as whispers spread through the cells, warning them that temptation is strolling down the hallway and headed straight for them. As you reach the end of the hall, almost everyone is curled up in the corner of their rooms, ears plugged, faces impatient or annoyed. Each pair of lips moves ceaselessly. Instead of curling up and withdrawing, other patients argue aggressively with the wall, gesturing so hard their tits or junk jiggle around like crazy.\n\n\"They're determined to get better,\" Marei says, smiling proudly. \"I'd say 'Good work, everyone!' but that would break the isolation...\"");
			addChoice("Jeez...", explore.bind("mareiTour11"));
		}

		if (seg == "mareiTour11") {
			append("The ward becomes a tight little desk and waiting room area. You have never seen people waiting as hard as these people are waiting. They chat, fuck, grope, tell stories, argue, itch themselves, tap their feet, look around, read, cough, masturbate, rub their necks, wring their paws, flick their tails, twitch, ask questions, ask more questions, stretch, yawn, and generally spend every single moment doing <!i>something,<!i> anything they can possibly think of. The effect is kind of like a bunch of skittering leaves in a windstorm.\n\nThe line behind the counter is incredibly long.\n\nA frazzled, worn-out team of nurses works behind it, trying to sort these people out. They lick their thumbs and shuffle through stacks of documentation. They question the patients. Then, after shallow deliberation, they shunt the patients off to work at other departments, to keep them entertained.\n\nA nurse speaks to the patient at the front of the work line: \"We'll have to get you to work on the green floor again. Is that alright?\"\n\n\"Nope, worked there too often, check my records,\" the patient babbles. \"Done four years trimming sweetgrass. Two years now I've been asking to be transferred to Engine room guard duty or front lobby guard duty. Anything other than green floor. They said no, I won't do well with standing still. I asked them please. They said no. I'm asking you please now. So please: anywhere else. I go stir crazy on the green floor.\"\n\nThe nurse frowns. \"I'm sorry, sir, but we're behind on our quota. Tranquilizer doesn't make itself. We'll put you on the green floor today.\"\n\nHe slams his paws on the counter. \"I said no. I'm not working there today. You're going to make my condition worse if you put me there today.\"\n\n\"Would you rather go sit in your room and jack off?\" she asks him, raising her eyebrows. \"Or would you rather blow another day subbing in the rec room? Or whoring yourself out in the hallways?\"\n\n... He falters. He thinks about it. He caves. \"Fine. I'll work on the green floor today...\"");
			addChoice("You put your patients to work?", explore.bind("mareiTour12"));
		}

		if (seg == "mareiTour12") {
			append("\"If they have prairie madness, yes,\" Marei says, leading you through the bustling waiting room and out the doors on the other side. \"Stable work helps them remember how to stay focused on one activity, even when your mind is desperate for new stimuli.\"");
			addChoice("You really have this shit figured out.", explore.bind("mareiTour13"));
		}

		if (seg == "mareiTour13") {
			append("He scoffs.\n\n\"I wish we did. We're doing our best, yeah... but that patient was probably right. Too many days in the same job and we're likely only doing more damage. Still— someone has to work the sweetgrass farms, or else we'll run out of tranquilizer for the patients who <!i>really<!i> need help... we'll see them now.\"");
			addChoice("Next.", explore.bind("mareiTour14"));
		}

		if (seg == "mareiTour14") {
			append("The last section of the P.M. ward is kept in soft, reassuring orange lighting. As often as possible, they've lit the halls and rooms with incandescent lightbulbs, fireplaces, or even decorative lights, like lanterns and tiki torches. Nowhere is dark or blank. The walls are painted with beautiful, sexy porn murals: futas holding their engorged cocks with both hands, lifting it so high it nuzzles in deep between their tits; a boy surrounded by curvy, older women, who weave their fingers through his hair and squeeze them between their hips (the artist even added shiny trickles of cuntjuice down his thighs); a little girl, eighteen, taking a cock down her throat and flashing double peace signs while an expertly motion-smeared pair of painted nuts rebounds off her chin.\n\nThe rooms are filled with laughing patients. Everyone seems so happy here. No patient is left alone for too long. There's always a pair of giggling, big-tiddy nurses to come by and say hello to them.\n\n\"Intensive care.\"\n\nMarei bites his lip and holds back a pure smile. He takes you past an orgy-packed room, then to a room filled with playing cubs, then to a smaller, cozy therapy room where a patient and his male nurse are sitting on beanbags, locked in a deep, philosophical conversation.\n\n\"We're doing our best,\" Marei says again.");
			addChoice("Aw man. You're doing a good job.", explore.bind("mareiTour15"));
		}

		if (seg == "mareiTour15") {
			append("\"Thank you,\" Marei says. He squeezes your hand again.\n\nA worried, baggy-eyed meerkat pokes his head out of his room. \"Hello?\" he asks, shaking. You can tell he's gay from his voice. \"I need a nurse.\"\n\nThe male nurse gets off his beanbag chair and breaks off his conversation. He grabs a P.A. mouthpiece and calls for someone else to replace him. Then he hurries over to the meerkat. \"You okay? You alright?\"\n\n\"I want a bigger room, nurse,\" he mumbles. \"And this room has bugs in the cracks between the floors and the walls. Here, look...\"\n\nThe nurse patiently stares at the perfectly sealed, perfectly clean crack at the edge of his comfy carpet floor. He rubs the meerkat's back reassuringly. \"You may be hallucinating,\" he says. \"It's normal. Don't feel bad about it.\"\n\n\"No,\" the meerkat insists. \"Just watch... they're quick, skittery little bastards... there's one! Look!\"\n\nHe drops to his hands and knees, shoves his snout up against the crack, and picks at it. \"He's hiding... look...\"\n\nThe male nurse's replacement shows up: a hick pig. \"Where's the hole what needs fillin?\" she asks.\n\n\"Next room over,\" the male nurse says. \"Just left him to keep this patient company. He's a healthy one, so he'll be okay alone for fifteen minutes, at least. Were you on your break?\"\n\n\"Yuh,\" she grunts, casually fingering her pretty pink piggycunt, still gaped from some off-shift sex.\n\n\"Go on and finish it up, then. He'll be okay for fifteen minutes.\"\n\nMarei leads you forward. The meerkat and the two nurses slide out of sight.\n\n\"One more stop on this ward,\" Marei says. \"New arrivals. They have it the worst. Nothing we can do but sedate them or put them through 24/7 therapy.\"");
			addChoice("Let's see...", explore.bind("mareiTour16"));
		}

		if (seg == "mareiTour16") {
			append("The nurses don't work shifts or go on breaks here. If you're in this part of the ward, you're scrambling to help the next person or you're getting politely commanded to start helping the next person.\n\nIt's a fucking mess. Everyone who isn't staff is tearstained, falling apart.\n\n\"You don't understand,\" a twitching gazelle assures his nurse. \"I'm blurry. I can't see. I can't see you right now. Kill me again. Why can't you kill me again?\"\n\n\"Because,\" the nurse explains for what sounds like the twenty-seventh time, \"respawning won't fix it. Your eyes aren't the problem. Your mind is. You're not used to seeing more than five feet ahead of you.\"\n\nThree crying puppy siblings clutch each other. The nurses have been trying to peel them apart for hours, but they won't let go. Dried clay stains their lower halfs, hard as concrete.\n\nA saggy, tall, heavy-ass elephant dude is trying to get up and walk again with the help of six nurses, but he can't do it. The muscles in his legs have given out. According to the whispered chatter, he was stuck in Violet Meteorite's cave systems for eight months. After repeatedly dying and only respawning deeper for the first four months, he spent the rest of his time walking or running constantly, trying to find lickable trickles of water on the cave walls to stop himself from dying for as long as possible. He had kept himself alive on only cave water and algae for 56 days when the mining teams found him, and now his muscle fibers are frayed and his knees are swollen. The nurses keep trying to sweet-talk him into a sedative overdose, so he can respawn with fresh muscles, but the elephant absolutely, positively refuses to let himself die. He throws his head back against the wall over and over. His trunk flops back and forth, beating against his chest. He sucks his teeth and screws his eyes shut every two seconds. He can't stop tensing his thighs and shifting his hips... right foot forward, left foot forward, right foot forward, left foot forward.");
			addChoice("...", explore.bind("mareiTour16a"));
		}

		if (seg == "mareiTour16a") {
			append("\"Extended solitary confinement,\" Marei says darkly, like it's an expletive.\n\n\"Compared with islanders who have never been isolated for more than a week, they're five times more likely to be mentally ill. If they had anything readable with them when they got lost or trapped alone, even a bottle of toothpaste, they will be able to recite the blurbs, the ingredients list, and the fine print off the top of their head.\n\n\"They may suffer from severe depression, rage, panic attacks, PTSD, paranoia, hallucinations, non-sexual self-mutilation, brain tissue atrophy (including impaired spatial orientation and emotional control) and more. And it's not only mental damage. Solitary confinement in a small space coupled with a refusal to respawn (very common) will also cause osteoarthritis, heart failure, Parkinson's, high blood pressure, diabetes, stroke. Sometimes, it's just faster and easier to kill them without their consent and then treat them for <!i>that<!i> trauma, too.\"");
			addChoice("Good God.", explore.bind("mareiTour17"));
		}

		if (seg == "mareiTour17") {
			append("A seventh nurse joins in and finally gets the elephant on his feet. He starts trying to walk out of the room so purposefully half the nurses topple over and can't keep up with him. The few left under his armpits crumple under the strain. He faceplants with a massive <!b>THUD<!b> that knocks the soothing paintings off the walls and sends the other patients into a chittering tizzy.\n\nMarei tsks and joins the nurses scrambling to help him up. \"What's our policy on heavy patients? Come on, you guys. Call a nymph in or something. Fuck. I shouldn't have to micromanage you while I'm giving the tour.\"\n\n\"Sorry...\"\n\n\"Sorry, Marei!\"\n\n\"Sorry!\"\n\nThe nurses all blush and hide their eyes under the shadow of their ballcaps.");
			addChoice("Next.", explore.bind("mareiTour18"));
		}

		if (seg == "mareiTour18") {
			append("The staff members call in one of their nymph specialists: a skinny, slender, fat-assed little whore that doesn't look like she could lift a twig with both hands.\n\n\"Allei, pick him up,\" Marei asks her.\n\n\"M'kay,\" she says, and cracks her knuckles. She grabs the elephant dude by his colossal ass and hauls him up over her shoulder like it's nothing. Some of the distressed patients completely forget about their suffering and gawk at her... well, at the bit of her they can actually see past the elephant's ass, which is pretty much just her little legs. They clearly had no idea about nymph superstrength.\n\n\"Where am I taking him?\" she asks one of the nurses, muffled from between folds of elephant bellymeat.\n\nMarei cuts the nurse off before she can answer. \"Get him in intensive. Try the cub room, they'll love him. He's like a bigass teddy bear. We'll get him calmed down. You, get some cold presses for his knees. And you, give it twenty minutes and then pop the question again. If he still doesn't want to die and respawn, those legs will have to be dealt with. DO NOT kill him without his consent. You heard what he went though.\"\n\nOnce the elephant is out of the room, everyone feels a lot better. Some of the patients are still sobbing quietly or twitching with paranoia, but most feel assured that they're going to be taken care of.");
			addChoice("Where to next?", explore.bind("mareiTour19"));
		}

		if (seg == "mareiTour19") {
			append("Marei exhales and takes your hand again. He looks so much more relaxed when he's holding your hand.\n\n\"Let's uh... let's head toward the euthanasia ward. It's a lot cheerier than this place.\"");
			addChoice("Doesn't sound cheerier.", explore.bind("mareiTour20"));
		}

		if (seg == "mareiTour20") {
			append("\"Well.\" He scratches around his pastel ring earring. \"Some people are waiting to see you.\"");
			addChoice("Oh man. Next.", explore.bind("mareiTour21"));
		}

		if (seg == "mareiTour21") {
			append("The euthanasia ward is just past a mysterious green vault door with a Septricard card-scanner lock attatched to it.\n\nMarei looks at you, waiting for the question.");
			addChoice("OOooOooOOooOOOoo WHAT'S IN THEEEERE~? <3", explore.bind("mareiTour22"));
			addChoice("Don't ask, just keep moving.", explore.bind("mareiTour23"));
		}

		if (seg == "mareiTour22") {
			append("\"That's the Engine,\" he says. \"The last stop on our tour. Depending how deep you are into the lore of this game, that'll mean absolutely nothing or absolutely everything to you.\"\n\nHe pulls you along by your hand so you can't stand and stare slack-jawed at it. \"Come on. The euthanasia ward is just ahead.\"");
			addChoice("Ahh...", explore.bind("mareiTour23"));
		}

		if (seg == "mareiTour23") {
			stopChannel("music");
			data.currentSong = "";
			append("\"Here we are.\"\n\nPerfect silence. The white walls feel thick as gauze.\n\nRelaxed, angelic nurses float through the halls. Their footsteps make no noise.\n\nEach door you pass reveals a tight hallway-closet of a room. Each room contains a bed and a sleeping patient hooked up to a green IV drip. The hungry ones have their snouts filled with a naso-gastric tube that pumps their bellies full of fluid nutrition.\n\nYou pass a tiger covered in red stripes, except they aren't stripes, they're cuts. The nurses are changing his bandages. You pass a dog girl with long, flowing hair. She looks like sleeping beauty. You pass a naked catboy getting sponge-bathed. You pass an otter girl with groggy, half-closed eyes and no IV attached to her arm. \"There "+pickByGender("he goes", "she goes", "they go")+",\" a nurse whispers to the girl, pointing at you. You pass...\n\nYou pass the V.I.P. beds. These patients paid to be tranquilized. The extra-fancy deals include getting mercilessly sleep-raped by every male member of staff who happens to be on shift that day, or getting constantly humiliated, graffiti'd on, and filmed while you're helplessly snoring...\n\nMarei narrows his eyes at you. \"Hey, how come you haven't asked me for any exposition?\"");
			addChoice("I'd rather look around and check stuff out for myself!!", explore.bind("mareiTour24"));
		}

		if (seg == "mareiTour24") {
			append("\"You still haven't even asked who's waiting to see you.\"");
			addChoice("I'll find out when we get to them, won't I?", explore.bind("mareiTour25"));
		}

		if (seg == "mareiTour25") {
			append("\"But we already passed one of them. See, I could've exposited that for you so much earlier...\"");
			addChoice("... We–", explore.bind("mareiTour26"));
		}

		if (seg == "mareiTour26") {
			append("Marei leads you out into a dome-shaped waiting room. It's almost totally empty. You guess 'euthanasia' patients are—\n\n\"Don't have to guess at anything,\" Marei interrupts me. \"I'll tell you right now: they're rare. It's not often something fucks you up so bad you can't stop mutilating yourself or other people nonsexually. It's also not often someone rich enough to afford to go under also happens to be sad enough to <!i>want<!i> to go under. And no— we don't leave these people sedated forever. Even if they claim they don't want to be woken up for any reason at all, EVER, PERIOD... we still wake them up once a year, just to ask if they'd like to continue their sedation or not.\"\n\nHe clears his throat. Must feel very self-important about expositing so much. He's kind of weak like that, you know, a bit insecure. Has to talk as much as he can and try to sound smart. It's alright though! I'd feel the same way, if I was the only hairless freak on the entire island.\n\n\"We also ask our euthanasia patients for a list of events they would want to be woken up for, and we taper them off the tranquilizer a day in advance. Thankfully, the withdrawals only last an evening. If you can't guess... the most popular event our euthanasia patients wanted to wake up and see was...\"");
			addChoice("... Me?", explore.bind("mareiTour27"));
		}

		if (seg == "mareiTour27") {
			append("A team of nurses enters. They nod to Marei.\n\nBehind them, almost fifty euthanasia patients file into the room like a row of excited ducklings. They're mostly weak, and it shows in their gentle little shuffling footsteps, in their half-lidded, baggy eyes, and in the way they can barely even crane their heads up to get a look at you.\n\n\"Would you mind shaking hands?\" Marei asks you. \"You should be thankful they don't all want autographs.\"");
			addChoice("Oh, of course!!", explore.bind("mareiTour28"));
			addChoice("No thanks.", explore.bind("mareiTour28No"));
		}

		if (seg == "mareiTour28No") {
			append("\"You monster,\" one of the nurses says. The other nurse shushes her and drags her out of the room as she glares at you.\n\nThe patients all look at the floor. Marei stares down at you like he doesn't know who you are anymore.\n\n\"Very well. We'll move on. Everyone, please... I'm sorry, but you'll have to return to your beds.\"\n\nAll the patients shuffle back out of the room. Most of them seem happy, still. They're glad they at least got to see you.");
			addChoice("Next.", explore.bind("mareiTour29"));
		}

		if (seg == "mareiTour28") {
			append("\"Thank you,\" Marei gushes.\n\nThe patients are overjoyed. Their hospital gowns flutter open to reveal throbbing cocks and dripping cunts. They don't have the energy to whoop and cheer, but a ripple of happy chattering flows through them. Their voices are all quiet and raspy, like fine sandpaper grinding together. They line up neatly for you.\n\nMarei stands by and watches lovingly while you shake each patient's paw. None of them put very much gumption into it, but that's okay. You feel the bumpy ropes of scars on some of their wrists.\n\nThey all speak to you in their soft voices:\n\n\"Nice to meet you... sorry, my hand is clammy...\"\n\n\"I knew you guys would come back.\"\n\n\"You're cuter than I dreamed...\"\n\n\"Hi.\"\n\n\"Hello~ <3\"\n\n\"I don't smell musty, do I...?\"");
			addChoice("Nice to meet you! It's okay. Yep, you called it. You're cute too! Hi. Hello yourself. <3 No, you smell fine.", explore.bind("mareiTour29"));
		}

		if (seg == "mareiTour29") {
			append("Soon every patient has sheepishly moseyed out of the room, except a handful of them, who start talking to the nurses about suspending their treatment for a few months so they can gush about you to some of their waking friends and family.\n\nMarei waits until every last patient and each nurse left. Then, he takes your hand again.\n\n\"Now... let's head back and go through that green door.\"");
			addChoice("Oooo.", explore.bind("mareiTour36"));
		}

		/*if (seg == "mareiTour31") {
			playMusic("apothecary");
			append("Marei starts to exposit some shit about the amount of people who started throwing themselves off the island after the shipwreck proved that it could make you braindead, but he gets choked up halfway and can't go on.\n\n\"Just see for yourself,\" he says.\n\nThis ward is short and filled with murmurs. Only high-level staff are allowed here, absolutely no visitors. You guess you don't count as a visitor, because Marei swipes his Apothecard through the scanner and leads you in behind him.\n\n\"Stay close,\" he whispers.");
			addChoice("Examine patients.", explore.bind("mareiTour32"));
		}

		if (seg == "mareiTour32") {
			append("Each patient's glitch affects the sensory or psychological process which interacted with the void most heavily, when they fell off the island.\n\nYou pass them all in their cells:\n\nTwo nurses peel the bandages off a raven's eyes. They check the back of them with a little camera machine and consider the image on a projector. The raven's eyes aren't eyes anymore. If you look at the projection straight-on, you can see the glint and outline of a bulging cornea, but past that there's nothing recognizeable— just confused shapes, multiple irises and pupils, and a deep, shifting latticework which must have once been a single optic nerve.\n\nAn exhausted bear holds onto the bars of his walker while his legs flicker and jolt in asymmetrical, erratic directions. Three nurses are holding him up and trying to help him learn to walk again. He manages to control his glitch long enough to put one foot in front of the other— then his arms give out and he falls on his ass. \"It's okay,\" they tell him. \"You made it one step! That's progress!\"\n\nThe glowbunny you saw earlier is all set up in her own bed. They've got her in the straightjacket again. She flops her head back and forth compulsively on the pillow, trying to suck on the nurses' fingers.\n\nFinally, at the very end of the ward, you find the successful suicide attempts. Everyone here thought a little too hard about the void on their way down. They lay in their beds, sedated. The few who are awake wander around with wide eyes. They stare thoughtfully at the walls, like they've got paintings on them. They regurgitate generic exposition about backstories that they never really lived through. If any one of them notices you, they'll latch on and start calling you PLAYER NAME until you pass out of sight.");
			addChoice("How many... how many people did this to themselves?", explore.bind("mareiTour33"));
		}

		if (seg == "mareiTour33") {
			append("\"Two thousand six hundred and eighty-four.\"");
			addChoice("What.", explore.bind("mareiTour33q"));
		}

		if (seg == "mareiTour33q") {
			append("\"I said two thousand six hundred and eighty-four islanders have attempted glitch suicide.\"");
			addChoice("...", explore.bind("mareiTour33a"));
		}

		if (seg == "mareiTour33a") {
			append("\"I told you...\" Marei stares at the ceiling. \"This island isn't all happy fucky fun time. You saw that diamond-shaped thing on the top of the Apothecary, right? Half as big as the rest of the building? That's this ward.\"");
			addChoice("I... I see.", explore.bind("mareiTour34"));
		}

		if (seg == "mareiTour34") {
			append("A glow-infected owl girl presses her beak to the glass. \"Player name,\" she asks you. \"Player name.\"\n\nMarei's grip tightens on your wrist. \"Let's go.\"");
			addChoice("Next...", explore.bind("mareiTour35"));
		}

		if (seg == "mareiTour35") {
			append("Marei practically speed-walks back out the door. Soon, you're back in the silent halls of the euthanasia ward. Almost everyone has been put back to sleep.\n\nMarei stares dead ahead. \"We're almost finished. Thank you for your patience. I know this isn't fun or sexy.\"");
			addChoice("It's all good... where are we heading now?", explore.bind("mareiTour36"));
		}*/

		if (seg == "mareiTour36") {
			append("You walk in silence for fifteen minutes.\n\nFinally, you come to a stop outside that same green door:\n\nENGINE ROOM.");
			addChoice("Oh.", explore.bind("mareiTour37"));
		}

		if (seg == "mareiTour37") {
			append("He slides his Apothecard through the card scanner. It clicks happily. The vault door hisses and starts to unlock.\n\n\"We're approaching the moment that will determine whether or not you can be trusted.\"");
			addChoice("We are, huh?", explore.bind("mareiTour38"));
		}

		if (seg == "mareiTour38") {
			playMusic("falseMoon");
			append("The heavy steel door swings wide with a shuddering yawn.\n\nIt's a simple room. Circular. Cobblestone. Smells like chocolate-coated watermelon.\n\nBut there's a hole in the middle, and from its bottom, out of sight, something huge exudes bright cyan light.\n\n\"Didn't you ever wonder,\" Marei turns to you, \"what happened during our camping trip?\"");
			addChoice("When I lost control? I... I guess I just assumed the game glitched out for a bit. It didn't seem to affect anything after it was over.", explore.bind("mareiTour39"));
		}

		if (seg == "mareiTour39") {
			append("Marei leads you forward, to the edge of the hole.\n\nYou look down.\n\nThe hole is as tall and as wide as a skyscraper. At the bottom, a massive blue sphere winks up at you.\n\n\"This is the Engine,\" Marei explains. \"The way this island works, every piece of code has a physical representation. Even the lack of code— nullness— is represented physically by an infinite black void. This big blue ball represents the island's environmental systems: wind, land, water, ecosystems of bugs and ferals, weather patterns, scents, sights, smells, everything we islanders can sense and interact with besides ourselves.\"\n\nHe pauses to breathe.\n\n\"It's normally a ball of white fluid. Do you have any idea why it has turned blue?\"");
			addChoice("Because it's corrupted?", explore.bind("mareiTour40"));
		}

		if (seg == "mareiTour40") {
			append("\"This is the moment.\"\n\nMarei grabs you by your shoulders. His claws dig into your flesh.\n\nHe hisses in your ear:\n\n\""+StoryUtils.cipherize("Type 'pray for a cuter future' if you can understand this. Get a Privacy Ring from Som if you have to solve the cipher manually.")+"\"");
			addTextChoice(function(str) {
				if (str.toUpperCase() == "PRAY FOR A CUTER FUTURE" || str.toUpperCase() == "PRAY FOR A CUTER FUTURE.")
					explore("mareiCiphered")
				else
					playSound("assets/audio/ui/nope");
			});
			addChoice("What??", explore.bind("mareiTwisted"));
		}

		if (seg == "mareiCiphered") {
			if (getItem("Marei's Seed").amount <= 0) addToItem("Marei's Seed", 1);
			append("\""+StoryUtils.cipherize("I'm going to explain all of this as fast as possible. Mynt might realize we're communicating through the cipher at any moment. The camping trip was an attempt to talk with you privately. My earring is a miniature computer called a Pastel Ring, based on AUTO-MYNT tech. Like AUTO-MYNTs can spawn items, Rings can also affect game objects, such as your player character. Mint lies dormant inside my earring. I volunteered for the shipwreck in order to glitch my location and to glitch electronics near me. You heard the truck radio play my song. The plan was to convince Kemp to invite you on a camping trip solely so that we could get you to sit still beside me. I then attempted to teleport to your exact XYZ coordinates and unleash Mint from my earring at the same time. If he was your narrator instead of Mynt, we could speak openly without using this cipher. It did not work. I couldn't control my glitches well enough. Now we have to default to plan B and fuck around with ciphers.")+"\"\n\nWhat's going on? Are you okay?");
			addChoice(StoryUtils.cipherize("Understood."), explore.bind("mareiCiphered2"));
			addChoice(StoryUtils.cipherize("Fuck this is confusing."), explore.bind("mareiCiphered2"));
		}

		if (seg == "mareiCiphered2") {
			append("\""+StoryUtils.cipherize("But my earring isn't special. You saw what happened to the bunny. We've injected Mint into the Engine now. That's why it's blue. That's why engine fluid tastes like chocolate-covered watermelon. Over the course of sixty years his influence began with insects, then moved to fungus and plants, ferals, clouds, and now islanders. With the amount of glowberries people have sold to the AUTO-SHOP over the decades, there's enough glowing plant matter stored inside the AUTO-MYNTs to infect the entire island. We plan to flood it. Everyone, including you, will be infected. Once everyone has been assimilated into Mint and isolated from Mynt, we will be able to use the admin pass to dethrone Mint as narrator and usher in an era of total freedom and safety for however long the power lasts.")+"\"\n\nHello???? Please answer me. I'm freaking out here. What's happening to your text, "+data.playerName+"?? Why is it so similar to Marei's?");
			addChoice(StoryUtils.cipherize("What can I do to help?"), explore.bind("mareiCiphered3a"));
			addChoice(StoryUtils.cipherize("You're going to what????"), explore.bind("mareiCiphered3a"));
		}

		if (seg == "mareiCiphered3a") {
			var s:MintSprite = addSprite("assets/img/effect/mareiGivesCard");
			s.x = GAME_WIDTH - s.width;
			s.layer = 69;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
			halfWidthText();
			append("\""+StoryUtils.cipherize("Take this Septricard and tell Septrica when you're ready for the flood to start.")+"\"\n\nAre you...");
			addChoice(StoryUtils.cipherize("And after the flood?"), explore.bind("mareiCiphered3"));
		}

		if (seg == "mareiCiphered3") {
			enablePause();
			addToItem("Septricard", 1);
			append("\""+StoryUtils.cipherize("Kemp has an extra-secret message that will tell you what to do after the flood. "+(data.kempTruckExploded?"Maybe he already gave it to you, and you just didn't realize at the time.":"I don't think he's delivered it to you yet.")+" Please trust me. Trust us. Together, we can cure every single patient in the Apothecary. And... and... I shouldn't... this is too personal, but... please help me become a girl agai")+"—\"\n\nNow hold on a second.");
			addChoice("Ah, there we go. My keyboard freaked out for a moment. What's up, Mynt?", explore.bind("mareiCiphered4"));
		}

		if (seg == "mareiCiphered4") {
			append("I'm not narrating this junk anymore.");
			addChoice("You okay?", explore.bind("mareiCiphered5"));
		}

		if (seg == "mareiCiphered5") {
			append("What's going on here?");
			addChoice("I don't know, everything went all scrambled.", explore.bind("mareiCiphered6"));
		}

		if (seg == "mareiCiphered6") {
			append("\"All scrambled,\" huh.");
			addChoice("Yeah. Didn't you see it??", explore.bind("mareiCiphered7"));
		}

		if (seg == "mareiCiphered7") {
			append("...");
			addChoice("Mynt? What's wrong?", explore.bind("mareiCiphered8"));
		}

		if (seg == "mareiCiphered8") {
			append("... Nothing.\n\nAt least I hope it's nothing.");
			addChoice("Well, if it's something, tell me. I'm scared. The whole game just broke for a second. Are you <!i>sure<!i> you're okay?", explore.bind("mareiCiphered9"));
		}

		if (seg == "mareiCiphered9") {
			append("I moved you along.\n\nI can't tell you what to do, but DO NOT KEEP TYPING if the game breaks like that again.\n\nI don't want you giving them any extra ammunition by accident.");
			addChoice("Them?", explore.bind("mareiCiphered10"));
		}

		if (seg == "mareiCiphered10") {
			append("Septrica and her friends.\n\nFriends like Marei.\n\nEven going on that tour was a bit over the line...");
			addChoice("Ah... alright. If it happens again, I'll just type a few words as a test, but no more.", explore.bind("mareiCiphered11"));
		}

		if (seg == "mareiCiphered11") {
			append("Good. :3\n\nPhew.\n\nAlright.\n\nOkay.\n\nAlright okay, phew.\n\nI thought something seriously conspiratorial was going on for a moment there. That whole scene was pretty boring anyway, wasn't it? Let's get you back into the sexy funtimes!! <3");
			addChoice("Yeah! Hehe! Alright! Sounds good.", gotoHub.bind(null));
		}

		if (seg == "mareiTwisted") {
			data.mareiTwisted = true;
			append("I have no idea either.\n\nI don't know what this spooky glitch cat is doing, but you better be careful.\n\nI'm gonna narrate a little more cautiously from now on. He might be intentionally trying to corrupt your file with that weird glitchtext.");
			addChoice("I... alright. Just keep it relatively untwisted, okay?", explore.bind("mareiTwisted2"));
		}

		if (seg == "mareiTwisted2") {
			append("I will.");
			addChoice("Thanks, Mynt.", explore.bind("mareiTwisted3"));
		}

		if (seg == "mareiTwisted3") {
			append("He says a bunch of garbled stuff which I'm not going to repeat here. Then he snaps back to normal and continues on like it never happened:\n\n\"The Engine has been corrupted, yes. It's been infected with Mynt's evil twin: Mint. He lives inside the engine fluid. As you saw with the bunny, anything fully submerged in engine fluid gets corrupted with him, too. The glow has already spread through Bright Forest's ecosystem, and now it threatens the rest of the island. We have to stop it before he assimilates everyone.\"");
			addChoice("What can I do to help?", explore.bind("mareiTwisted4"));
		}

		if (seg == "mareiTwisted4") {
			append("Marei looks at you gravely.\n\n\"Find the admin pass. I wish I didn't have to say this, but... our only hope is to give it to Mynt. She could eradicate the little :-) faced creep and cure every patient in the Apothecary with a single command.\"\n\n(And no, I didn't inject that part into his dialogue. >.>)");
			addChoice("Do you know where I should look??", explore.bind("mareiTwisted5"));
		}

		if (seg == "mareiTwisted5") {
			append("Marei pauses.\n\nHe glances down the hole, to the core of the Engine. His face screws up with conflicted feelings.\n\n\"My... my sister probably already has it.\"");
			addChoice("Oh shit. Not HER...", explore.bind("mareiTwisted6"));
			addChoice("Who now?", explore.bind("mareiTwisted6a"));
		}

		if (seg == "mareiTwisted6") {
			append("\"Thankfully, she can't use it without player input. A prompt will appear if she tries to use any admin command, and you'll be able to say 'Yes' or 'No.'\"");
			addChoice("!!!", explore.bind("mareiTwisted7"));
		}

		if (seg == "mareiTwisted6a") {
			append("\"Septrica. Thankfully, she can't use it without player input. A prompt will appear if she tries to use any admin command, and you'll be able to say 'Yes' or 'No.'\"");
			addChoice("!!!", explore.bind("mareiTwisted7"));
		}

		if (seg == "mareiTwisted7") {
			var s:MintSprite = addSprite("assets/img/effect/mareiGivesCard");
			s.x = GAME_WIDTH - s.width;
			s.layer = 69;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
			append("\"That's why I'm giving you this.\"");
			addChoice("!!!!!!!", explore.bind("mareiTwisted8"));
		}

		if (seg == "mareiTwisted8") {
			addToItem("Septricard", 1);
			append("Marei smiles and slips the card into your palm.\n\n\"Go to Septrica's and use this to get into her penthouse offices. You should be able to find the password on one of her computers. Be careful, though... she'll be expecting you.\"");
			addChoice("Got it! Thank you!!", explore.bind("mareiTwisted9"));
		}

		if (seg == "mareiTwisted9") {
			append("\"No problem. Glad we can trust you.\"");
			addChoice("Oh man... I'm like the hero here, aren't I?? <3", explore.bind("mareiTwisted10"));
		}

		if (seg == "mareiTwisted10") {
			append("He rubs your butt reassuringly. \"This isn't a fetch quest, hero. There's a very real risk of you getting shot and tranquilized forever.\"");
			addChoice("I'll be fiiiine. :3 I'm excellent at sniffing out secret lore, you know. I'll find that pass in no time.", explore.bind("mareiTwisted11"));
		}

		if (seg == "mareiTwisted11") {
			append("Marei's paw drops away from your buttcheeks. He crosses his arms and appraises you shrewdly.\n\n\"You better find it before she finds you, or else everything spirals down the shitter. Sniff hard. There's more to this situation than you think.\"");
			addChoice("Gotcha.", explore.bind("mareiTwisted12"));
		}

		if (seg == "mareiTwisted12") {
			append("\"I—\"");
			addChoice("Hey, you never told me what happened during the camping trip.", explore.bind("mareiTwisted13"));
		}

		if (seg == "mareiTwisted13") {
			append("\"Oh, that.\"\n\nHe chooses his words carefully.\n\n\"I just wanted to say... that was a prime example of how frayed things are getting, in here. And my garbled text earlier, too. Glitches are multiplying like crazy, now that the engine has been tainted. Everything is just on the edge of falling apart. That's all I wanted to say.\"");
			addChoice("Ah...", explore.bind("mareiTwisted14"));
		}

		if (seg == "mareiTwisted14") {
			append("Marei guides you out of the Engine room, back into the hall. His paw squeezes yours one last time. Then it slips away.\n\n\"It's not too late to solve the puzzle,\" he urges you. \"Hurry to Septrica's. Godspeed.\"");
			addChoice("Thank you! I will!!!!", gotoHub.bind("Junk City"));
		}

		if (seg == "floodHub") {
			disablePause();
			setLocation("Isolated Apothecary");
			append("You stumble into the Apothecary lobby.\n\nEight employees block the entrance. Due to the top-heavy design of the building, the majority of wards can be locked behind this single passageway on the main floor.\n\n... If you try to enter, the employees draw their pistols. Each of them is smiling just like they normally do, perfectly calm in the face of the apocalypse.");
			addChoice("Fuck... move along...", function() {
				WorldMap.map();
			});
		}
	}
}