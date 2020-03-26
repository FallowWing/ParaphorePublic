package story;

class TheFloatillery {

	public static function theFloatillery(seg:String):Void {
		saveCheckpoint("TheFloatillery.theFloatillery('"+seg+"');");
		clear();

		if (seg == "explore") {
			setLocation("The Floatillery");
			if (getPlace("The Floatillery") == null) {
				append("Your footsteps sync up with the sound of nearby waves crashing. Our shitty basic atmosphere engine can only pump in so many; their pace brings you to a relaxing little trot. Between clusters of waves it gets tired and the water becomes still glass.\n\nGlowing seascum has taken root on the shores, barely disturbed.\n\n");
			}
			addPlace("The Floatillery", "A messy colony of rafts and log buildings which form a floating distillery owned by the Apothecary.", "Bright Forest");
				append(pickOne(["You pack up camp next to a couple scrawls of coral.", "You spot a couple dudebros with rad waterwings swordfighting in the water. Like LARPing I mean. With big foam swords. Also they're wearing speedos.", "Two otter boys moonbathe in the milky-white sands.", "Look, someone carved a butt into this rock.", "You stare out at the edge of the ocean.", "A little crew from the Apothecary skinny dip with only their ballcaps on."]));

			addSprite("assets/img/effect/floatillerySign.png").onHover = showToolTipOnCursor.bind("Font: Pixelmix", "");
			addChoice("Look around.", theFloatillery.bind("main"));
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "main") {
			if (isActive("Pastel Ring")) temp.a = "seven." else temp.a = "ten.";

			append("The Floatillery rides the easy waves on empty rope-slung wine barrels. Thin bridges connect everything. The worker's quarters is particularly tangled up.\n\n");

			if (!data.redGrievingDone) {
				append("The husk of a landlocked vessel sits sand-sunken and barnacled far down the shore.");
				if (data.redVisits == 2) append(" Something small and red stands before it.");
				append("\n\n");

				addChoice("Examine shipwreck.", theFloatillery.bind("examine shipwreck"));
			}

			if (!data.moonbathersDone) {
				append("Two stargazing otter moonbathers lay on bright striped towels, both boys no older than "+temp.a+"\n\n");
				addChoice(
					"Lay with the moonbathers.",
					theFloatillery.bind("lay with moonbathers"),
					{kinks: ["Cub", "Male", "Male"], faCensor: true}
				);
			}

			if (!data.floatilleryMingled) {
				append("Clumps of people talk and laugh on the wharf connecting the floating distillery to land, some stumbling drunk, some resting their heads on the shoulders of others as they sit on the edge and dip their feet in the gentle waves.\n\n");
				addChoice("Mingle.", theFloatillery.bind("mingle"));
			}

			if (!data.floatilleryExaminedParasol) {
				append("There's a tattered parasol trapped between two rocks to your left.\n\n");
				addChoice("Examine parasol.", theFloatillery.bind("examine parasol"));
			}

			//Nero
			if (!data.neroDone && !data.neroRejected) {
				temp.age = "in her late teens";
				if (onFA()) temp.age = "[WHO HAS REACHED THE FULL AGE OF CONSENT IN THE READER'S JURISDICTION]";

				if (data.neroTalked == 0) {
					append("Two dogs share a swinging chair on the porch of their floating cabin, a rottweiler guy and a doberman girl "+temp.age+". It's anchored just offshore, free from the Floatillery\'s sprawl. A little sign with a scratched-out address plate hangs off the awning: NERO & RIVER.\n\n");
					temp.choice = "Talk to the dog couple.";
				} else {
					append("After a while you look back to the floating cabin. Only the rottweiler guy remains on the porch.");
					temp.choice = "Talk to the rottweiler.";
				}
				addChoice(temp.choice, theFloatillery.bind("nerointro"));
			}

			append("There's a small machine shop operating out of the worker's quarters up ahead.\n\n");

			if (data.killedShop && !data.somIsCheckingAuto) addChoice((data.foundSomShop?"Som Shop":"Visit the machine shop")+".", theFloatillery.bind("somStolenAuto"), {kinks: ["Art", "Cub", "Male"]});
			if (!data.killedShop && !data.somIsCheckingAuto || (data.killedShop && data.somIsCheckingAuto)) addChoice((data.foundSomShop?"Som Shop":"Visit the machine shop")+".", theFloatillery.bind("som shop"), {kinks: ["Art", "Cub", "Male"]});

			if (!data.roxGaveGlowberries && data.roxQuestAccepted)
				addChoice("Go give Rox the berries.", theFloatillery.bind("give rox berries"), {cost: ["Glowberry", 20]});
				

			if (data.floatilleryMemorialRead && (data.metMarei > 0 || getJournalEntries().contains("Skunk cub camping trip") || getJournalEntries().contains("Stall 2")) && !data.floatilleryThellyDone && (data.bathroomBoysDone || data.metThelly > 0 || getJournalEntries().contains("Boys bathroom")))
				addChoice("Stroll the shore.", theFloatillery.bind("thelly"), {kinks: ["Cub", "Male", "Drugs", "Piss", "Plot"]});
			else if (!data.floatilleryThellyDone && !data.floatilleryMemorialRead)
				addChoice("Stroll the shore.", theFloatillery.bind("thelly"), {kinks: ["Cub", "Male", "Drugs", "Piss", "Plot"], enabled: false, toolTip: "Read the memorial.\n0/3"});
			else if (!data.floatilleryThellyDone && !(data.metMarei > 0 || getJournalEntries().contains("Skunk cub camping trip") || getJournalEntries().contains("Stall 2")))
				addChoice("Stroll the shore.", theFloatillery.bind("thelly"), {kinks: ["Cub", "Male", "Drugs", "Piss", "Plot"], enabled: false, toolTip: "Meet Marei or go on a camping trip with him in Sewer Suburbs.\n1/3"});
			else if (!data.floatilleryThellyDone && !(data.bathroomBoysDone || data.metThelly > 0 || getJournalEntries().contains("Boys bathroom")))
				addChoice("Stroll the shore.", theFloatillery.bind("thelly"), {kinks: ["Cub", "Male", "Drugs", "Piss", "Plot"], enabled: false, toolTip: "Meet Thelly at the boys bathroom in Septrica's.\n2/3"});

			if (data.floatilleryThellyDone && !(data.thellyNumber || data.thellyCallDone)) {
				append("Thelly's hiding under an extra-curvy piece of driftwood, his little yellow butt poking out. The glow of his cell phone illuminates a worried expression.");
				addChoice("Talk to Thelly.", theFloatillery.bind("thellyaftertalk"));
			}

			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "thellyaftertalk") {
			append("He's mid-conversation with Marei on the phone:\n\n\"... Well, where did you glitch to? Oh. Like, the one with nymphs and stuff? I thought that place was a myth. No. Yeah, indigo lake or something. Indigo Pond? Right. No. Probably. You wouldn't happen to have directions, would you...?\"\n\nHe looks up at you and shrugs apologetically, meaning 'Sorry, I'm busy!'");
			addChoice("Wait for him to finish.", theFloatillery.bind("thellyaftertalkwait"));
			addChoice("Indigo Pond? I know where that is.", theFloatillery.bind("thellyaftertalkknow"), {enabled: (getPlace("Indigo Pond") != null)});
		}

		if (seg == "thellyaftertalkknow") {
			data.thellyCallDone = true;
			append("\"Oh, of course you do! You're building quite the reputation as an explorer, you know~ You remind me of Cade, the first player to scale the meteorite.\"");
			addChoice("Am I? I guess I have been wandering around a ton.", theFloatillery.bind("thellyaftertalkknow2"));
		}

		if (seg == "thellyaftertalkknow2") {
			append("\"I really need to ask Marei something,\" he says, leaning forward, sitting with his paws between his lap. \"How do I get to Indigo Pond?\"");
			addChoice("Lemme see if I can remember. The directions are wack.", theFloatillery.bind("thellyaftertalkknow3"));
		}

		if (seg == "thellyaftertalkknow3") {
			append("\"Are they??\"");
			addChoice("Umm... take a left at the cumming owl, follow the blue bushes...", theFloatillery.bind("thellyaftertalkknow4"));
		}

		if (seg == "thellyaftertalkknow4") {
			append("(He's scribbling this down on his pawpads.)");
			addChoice("If you smell booze right then, go north. If you smell nymph taint, go south.", theFloatillery.bind("thellyaftertalkknow5"));
		}

		if (seg == "thellyaftertalkknow5") {
			append("Thelly scrambles to his feet, although he's still looking warily for the Floatillery employee who ousted him and the rest of you. \"Perfect!! Thank you! Meet you there!\"\n\nHe runs off.");
			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "thellyaftertalkwait") {
			append("Thelly flips his phone shut and sighs.");
			addChoice("What's wrong?", theFloatillery.bind("thellyaftertalkwait2"));
		}

		if (seg == "thellyaftertalkwait2") {
			append("\"Marei glitched out again. He ended up in some secret pond that no one knows how to get to.\"");
			addChoice("Hmmmmmmm.", theFloatillery.bind("thellyaftertalkwait4"));
		}

		if (seg == "thellyaftertalkwait4") {
			append("\"I really gotta ask him something...\"");
			addChoice("Well, give me your number. Exploring is basically my whole schtick. I'll let you know if I find it.", theFloatillery.bind("thellyaftertalkwait5"));
		}

		if (seg == "thellyaftertalkwait5") {
			data.thellyNumber = true;
			append("\"Really?\" he says, floppy ears perking. He hands you some scribbled digits and beams. \"Thanks so much! Please let me know!\"");
			msg("Memorized Thelly's phone number.", true);
			addChoice("Sure thing, kid.", theFloatillery.bind("main"));
		}

		if (seg == "examine shipwreck") {
			append("The hull is sturdy and well-crafted, its strips of timber still intact despite being pierced with barnacles. A little marble memorial plaque juts from the sand, surrounded with flowers and glowberries and even a couple dildos.\n\n");

			if (data.redVisits == 2) {
				append("Red is standing here alone.\n\n");
				addChoice(
					"Leave a bouquet.",
					theFloatillery.bind("leave a bouquet"),
					{cost: ["Sweetgrass Bouquet", 1]}
				);
			}

			if (data.redGrievingDone) append("Red is reading the memorial under her breath, chanting slow and soothing to herself.\n\n\"Lana, who lost maw and paw; John, who lost libido; Marei, who lost name and location; Red, who lost herself.\"\n\nShe stops when she notices you're listening.");

			addChoice("Read the memorial.", theFloatillery.bind("read memorial"));

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "read memorial") {
			data.floatilleryMemorialRead = true;
			append("<!i>IN LOVING MEMORY\nOF THOSE WHO SACRIFICED THEMSELVES\nFOR THE DREAM OF A NEW WORLD\n\nLANA & JOHN\nMAREI & LITTLE RED<!i>");

			addChoice(
				"Leave a bouquet.",
				theFloatillery.bind("leave a bouquet"),
				{cost: ["Sweetgrass Bouquet", 1]}
			);
			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "leave a bouquet") {
			append("You place a Sweetgrass Bouquet at the foot of the memorial stone, tucking it between two fat plastic cocks.\n\n");

			if (data.redVisits == 2) {
				unlockJournal("Mourning");
				append("Red hugs you.");
				addChoice("Hug back.", theFloatillery.bind("hug back"));
			}

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "hug back") {
			if (data.redExposition) {
				append("\"Red volunteered for a voyage off the edge of the map.\"\n\nShe says this into your chest, monotone, unhurried:\n\n\"Two cubs and two adults. It was her and a little fox boy in a turtleneck, that's Lana, and a cat and a dog— all volunteers. It's just stupid survivor's guilt, but I wish I'd signed up instead.\n\nMynt couldn't be sure what would happen, which was the whole reason we tried it in the first place, but she said the world doesn't work properly out there. Our minds are 'context-sensitive,' she said. If you strip away the context and sail into the void, surprise sur-fuckin-prise, you return null.\"");
			} else {
				append("\"Red isn't going to wake up.\"\n\nShe buries her face in your chest.");
			}

			addChoice("I'm sorry.", theFloatillery.bind("im sorry"));
			addChoice("Why?", theFloatillery.bind("why"));
		}

		if (seg == "im sorry") {
			// But she didn't say survivers guild sometimes?
			append("\"Shut up,\" she says, peeling her face off so she can shoot you a glare. \"It's not your fault and it's not my fault. That's what I mean by <!i>stupid<!i> survivor's guilt. It's her fault she went braindead and it's her fault everyone's so sorry about it. It isn't enough that she went and got herself hurt, she's gotta make us all feel responsible...\"\n\nShe pulls away and sniffles a little, trying to collect herself.");

			addChoice("I'd better go.", theFloatillery.bind("better go"));
		}

		if (seg == "why") {
			append("\"Because there might've been a way out.\"\n\nShe pulls away, apologizing, straightening herself out.");
			addChoice("I'd better go.", theFloatillery.bind("better go"));
		}

		if (seg == "better go") {
			setLocation("???");
			disablePause();
			if (data.redExposition) append("<!i>Spindrift skitters off the hull.<!i>");
			else append("<!i>Whitecaps lap at the hull.<!i>");

			temp.faderSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF000000, true);
			temp.faderSprite.alpha = 0;
			tween(temp.faderSprite, {alpha: 0.3}, 1);

			addChoice("What?", theFloatillery.bind("what"));
		}

		if (seg == "what") {
			setLocation("The Floatillery");

			append("\"I said you can go if you want.\" Red's squatting in front of the stone, head on her knees, eyes unfocused. \"I need a little time alone, anyway.\"");

			if (temp.faderSprite != null)
				tween(temp.faderSprite, {alpha: 0}, 3, {onComplete: temp.faderSprite.destroy});

			addChoice("No, just now...", theFloatillery.bind("no just now"));
		}

		if (seg == "no just now") {
			setLocation("???");

			append("<!i>The prow hangs over the precipice.<!i>");

			temp.faderSprite2 = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF000000, true);
			temp.faderSprite2.alpha = 0;
			tween(temp.faderSprite2, {alpha: 0.4}, 1);

			addChoice("Examine the ship closer.", theFloatillery.bind("examine ship closer"));
		}

		if (seg == "examine ship closer") {
			setLocation("The Floatillery");

			append("You walk around the ship, leaving a trail in the sand. The starboard's busted open, revealing a cross-section of a cozy crew's quarters, bunkbeds and stovetop and curtains over the portholes.\n\nDeep gouges line the walls.");

			if (temp.faderSprite2 != null)
				tween(temp.faderSprite2, {alpha: 0}, 3, {onComplete: temp.faderSprite2.destroy});

			addChoice("Next.", theFloatillery.bind("shipnext"));
		}

		if (seg == "shipnext") {
			setLocation("???");

			append("<!i>The ship hurtles down into nothing and emerges from the sky. The island whizzes past again, hull missing the edge by an inch. On the next trip past, it misses by two.\n\nFour. Eight. Sixteen. Thirty-two. Sixty-four.\n\nEvery time the ship loops from bottom to top it picks up more lateral speed, wind breaking on the prow, until it's moving faster forwards than down and the island recedes to a speck in the void behind. The cat and the fox are screaming, but only the fox's claws rake the walls as they struggle to hold on, only his screams make noise. The dog has his jaws and both hands locked on the helm.\n\nThe rabbit is the first overboard.\n\nThe cat is the second.\n\nThe dog is the third. He lands crotch-first on the black plane. If he's going to die, he thinks, he might as well die knowing what it's like to fuck the void.\n\nThe fox is the last. He's going to land headfirst. He knows he is. So he thinks of all his books, forty years of stories, and claps his paws over his eyes to shield them from the searing dark. His paws and his screaming mouth both collide with it at the same instant.<!i>");

			temp.faderSprite3 = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF000000, true);
			temp.faderSprite3.alpha = 0;
			tween(temp.faderSprite3, {alpha: 0.5}, 1);

			addChoice("...", theFloatillery.bind("jesus"));
		}

		if (seg == "jesus") {
			data.redGrievingDone = true;
			setLocation("The Floatillery");
			append("She's wringing the bunny's red cloak, nose nestled in the folds of the awry hood, snuffling at the feeble remnants of her scent.\n\n\"Just a little time...\"");
			enablePause();

			if (temp.faderSprite3 != null)
				tween(temp.faderSprite3, {alpha: 0}, 3, {onComplete: temp.faderSprite3.destroy});

			
			addChoice("Right. Gotcha. I'm going to get away from this ship.", theFloatillery.bind("main"));
			addChoice("Mynt? Did you see that weird flashback thing?", MyntScenes.myntShipwreck.bind("intro"), {enabled: data.myntWriterDone, kinks: ["Plot"], toolTip: (data.myntWriterDone?"":"Requires Mynt Message: Writing")});
		}

		if (seg == "lay with moonbathers") {
			data.knownAsPlayer += 1;
			append("You sprawl clothed on the sand between the moonbathers, muttering a hello. Both suppress shock, clearly astounded a player just happened to show up and lay down next to them. You all lay like that for a while.\n\nOne rolls onto his side. \"How're you gonna get a moon-tan with your clothes on~?\"");

			addChoice("Ah... well...", theFloatillery.bind("ah well"));
		}

		if (seg == "ah well") {
			data.moonbathersDone = true;

			append("Before you can start to strip they do it for you, both barely containing themselves, one pulling your shirt over your head and almost falling over with the effort, one slipping lithely with otterish grace between your legs, closing his lips around your zipper and pulling down...\n\nThey don't initiate anything, content just to cuddle naked with you in the moonlight.\n\nOut of nowhere, one of them mumbles to the other: \"Anyway, I totally disagree... just 'cause something happens only once don't make it meaningless. In fact, that makes it more special~!\"\n\nYou get a decent moon tan going.");

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "mingle") {
			unlockJournal("The mingling");
			data.knownAsPlayer += 2;
			append("You try your best to get into one of the groups and start up some serious minglation, but the \""+data.playerName+"\" floating above your head sends them into a tizzy. They gush and fall all over you in a big crowd, begging to suck your "+pickByGenitals("cock", "cunt", "nuts")+", demanding you tell them where all the players have gone for all these decades.");

			addChoice("Form a line.", theFloatillery.bind("form line"), {kinks: ["Female"]});

			addChoice(
				"Here, take these. Something to remember me by.",
				theFloatillery.bind("take these"),
				{cost: ["Cum Balloon", 2]}
			);

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "form line") {
			if (data.hasBoth) {
				temp.a = "crams both of your heavy nuts into her mouth at once, tongue working between them, her cheeks puffed out cutely.";
				temp.b = "Teabag her.";
			}

			if (data.hasCunt) {
				temp.a = "stuffs pretty much her whole face into your pussy, eyes closed in serene content as she works her tongue inside push-by-push. Near the end of it she's basically tonguefucking you and the line behind is getting impatient.";
				temp.b = "Ride her tongue.";
			}

			if (data.hasCock) {
				temp.a = "crams the entire length of your cock down her throat, swallowing hard as her lips reach the base, looking up with half-lidded eyes.";
				temp.b = "Fuck her face.";
			}

			append("Fanboys, fangirls, and fanboths shove and pull at each other for the prize of first slurp. A little shark girl in a bright pink bikini drives her elbow into the top contender's jaw and greedily "+temp.a);

			addChoice(temp.b, theFloatillery.bind("minglenext"));
			addChoice("End.", theFloatillery.bind("main"));
		}

		if (seg == "minglenext") {
			data.floatilleryMingled = true;
			append("The line swells to about twenty people "+(onFA()?"[EACH OVER EIGHTEEN YEARS OF AGE]":"of all ages and species")+" as you push the little shark to the planks of the wharf and ");
			append(pickByGenitals(
					"grab her head with both hands, weaving your fingers into her hair, pulling it slowly off of your cock before slamming it back down. Her tail and fins wrack with quivers as she gags hard and grimaces each time her fat little sharksnout bangs against your crotch. A few volunteers come forward to help, holding her arms behind her back and shoving her face down whenever she tries to pull off.",
					"slip two fingers into her mouth, yanking her tongue out as far as it can go and dropping your hips to ride it like a cock. She gets the message pretty quickly, keeping her mouth open and her tongue out on her own, eyes rolling up a little as everyone watches her. \"She's basically just a dildo,\" someone whispers, and the rest of the crowd agrees wholeheartedly.",
					"bounce your crotch on her face. She makes her slurps as sloppy and noisy as she can, showing off for the enraptured spectators whilst your nuts pop in and out of her mouth, shiny and dripping with shark saliva. After a good while of that you pull off and, at the urging of the crowd, wipe your nuts dry on her face and hair while she pants."
			));

			addChoice("End.", theFloatillery.bind("main"));
		}

		if (seg == "take these") {
			data.floatilleryMingled = true;
			if (data.hasCock || data.hasBoth) temp.a = "cleary thinking it's your cum.";
			if (data.hasCunt) temp.a = "although they are a little confused, considering it can't possibly be <!i>your<!i> cum...";

			append("The crowd goes wild, "+temp.a+"\n\nThey fight over it until the balloons pop and coat them all with a mighty splash. Then they all start licking each other... then it devolves into an impromptu boardwalk orgy...\n\nYeah, they seem to have forgotten you entirely.");

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "examine parasol") {
			append("You pop the sandy old 'sol open and a bunch of stuff falls out. A tiny radio, a tiny wallet, a tiny note...");

			if (!data.floatilleryRadioExamined) addChoice("Examine radio.", theFloatillery.bind("examine radio"));
			if (!data.floatilleryWalletExamined) addChoice("Examine wallet.", theFloatillery.bind("examine wallet"));
			if (!data.floatilleryNoteExamined) addChoice("Examine note.", theFloatillery.bind("examine note"));

			if (data.floatilleryRadioExamined && data.floatilleryWalletExamined && data.floatilleryNoteExamined)
				data.floatilleryExaminedParasol = true;

			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "examine radio") {
			data.floatilleryRadioExamined = true;
			append("You turn on the little radio and browse the frequencies.\n\nNothing but static, except 96.7, which comes through with distorted gargly jubilance.\n\n<!i>HEYYYYYYYYYYYYYYYYY FOLKS IT'S MIKEY J \"THE WEATHERMASTER\" BACK AGAIN WITH ANOTHER 100% ACCURATE FORECAST! FOR THIS WEEK WE'RE LOOKING AT MORE ETERNAL NIGHT! OH YEAHHHHHH! THE WEEK AFTER, YOU GUESSED IT, MORE ETERNAL NIGHT! OH YEAHHHHHHHHHHHHHHHHHHHHH!!!\n\nWE'RE ON YEAR WHICH NOW? RICK WHICH YEAR ARE WE ON? YEAR SIXTY SIX? OH YEAHHHHHH! GET HYPED FOR YEAR SIXTY SEVEN OF ETERNAL NIGHT! WEATHER'S STILL FINE AND THE MOON'S STILL OUT! KEEP YOUR TORCHES LIT AND YOUR FLASHLIGHTS ON! STAY SAFE, ENJOY THE WEATHER, AND LOOK OUT FOR THE MOSSMAN FOLKS!\n\nMIKEY J OUT!<!i>");

			addChoice("Turn it off.", function() {
				theFloatillery("examine parasol");
				StoryUtils.quickMynt("Mikey");
			});
		}

		if (seg == "examine wallet") {
			data.floatilleryWalletExamined = true;
			append("You crack the wallet open and a bunch of sand falls out. The ID just says PATCH. The picture is a little fox boy in a professionally tailored suit, arms crossed.\n\nIts pockets contain a couple condoms and a tattered, faded picture of another fox boy in a "+(onFA()?"skimpy ":"")+"dress with bright little pins in his hair, blowing a kiss for the camera with a strangely blurry paw.");

			addChoice("Fold it back up.", theFloatillery.bind("examine parasol"));
		}

		if (seg == "examine note") {
			data.floatilleryNoteExamined = true;
			append("It's a barely-held-together rag of ruled notebook paper, overboiled egg-yolk yellow with age and cracked in its folds.\n\n<!i>Hyper Land\nBig cocks everywhere\nMeet w/ Apothecary + retry growth formula\nAsk Sep for grant<!i>\n\nThe rest of it is too faded to read, but it looks like extensive profit calculations.");

			addChoice("Put it back.", theFloatillery.bind("examine parasol"));
		}

		if (seg == "nerointro") {
			unlockJournal("Nero & River");
			if (data.neroTalked == 0) {
				data.knownAsPlayer++;
				data.neroTalked++;

				append("On the swim over you catch the tail-end of an argument. The rottweiler is nudging his girl with a gentle, persuasive tone, gushing about how much he wants a family. She's having none of it.\n\n\"There "+pickByGender("he is", "she is", "they are")+"!\"\n\nHe grins, loping down to pull you up over their little dock. A canoe painted HEART OF THE RIVER sloshes and knocks around inside it. \"Hey, I got a quest for you! And tell you what, I\'ll give you this... uh... broken cell phone as a reward!\"\n\nNero pulls a crusty old cell out of his shorts pocket. River elbows him, eyes narrowed, nearly knocking over two empty wine glasses on a nearby table. \"You can\'t just pawn your chores and your junk off on "+pickByGender("him", "her", "them")+" and call that a quest.\"\n\nThe rottweiler winks at you. \"Come back once River takes her nap. The waters'll be calmer then.\"\n\n\"What's that supposed to mean?\" she snaps. You spot her covering a yawn moments later.");

				addChoice("Go look around and kill a little time.", theFloatillery.bind("main"));
			} else if (data.neroTalked == 1) {
				data.neroTalked++;
				append("While his girl snores away inside the cabin the rottweiler beckons you over with a conspiratory finger-waggle. \"Okay,\" he says. \"Now that she's gone...\"\n\nHe takes a deep breath, blushes a little. \"This is gonna sound <!i>awful<!i>, but here's the quest: could you get me a drink— she likes wine— and some of that City currency? Y'know, the special little pink capsules that make you get pre—... er... um. The ones that <!i>speed up<!i>... pregnancy.\"\n\nHe holds out both hands, rushing on. \"Before you say anything, it\'s not as bad as you think! I'm not forcing her into motherhood— she wouldn't actually give birth to a new person with a mind and a soul, just an empty little NPC— and with the capsules there's no pain, no labour, no pickle cravings, nothing...\"\n\nNero's hands flop to his lap, fidgeting.\n\n\"So why am I bothering?\" He shoots you a sad, sentimental smile. \"Cause it\'s the closest I can get to a family, of course.\"");

				addChoice(
					"Let's talk rewards.",
					theFloatillery.bind("neroaccept"),
					{kinks: ["Patreon Commission", "Male", "Female", "Pregnancy"], cost: ["Capsule", 3, "Glowberry Wine", 1]}
				);

				if (getItem("Capsule").amount < 3 || getItem("Glowberry Wine").amount < 1) addChoice("Quest accepted. I'll be back in a bit.", theFloatillery.bind("main"));
				addChoice("I'm not gonna help you stealth-preg your gf, dude.", theFloatillery.bind("neroreject"));

			} else if (data.neroTalked >= 2) {
				append("He gives you an awkward little wave. \"You uh— you got the stuff?\"");

				addChoice(
					"Sure do.",
					theFloatillery.bind("neroaccept"),
					{kinks: ["Patreon Commission", "Male", "Female", "Pregnancy"], cost: ["Capsule", 3, "Glowberry Wine", 1]}
				);

				addChoice("Not yet, sorry.", theFloatillery.bind("main"));
			}
		}

		if (seg == "neroreject") {
			data.neroRejected = true;
			append("He laughs. \"Stealth-preg... ah, well, you're right. It's a pretty stupid idea. Not sure what I was thinking.\"\n\nHe heads back inside and locks the door. You hear River's voice, muffled and abrasive. He doesn't argue back this time.");

			addChoice("Look around.", theFloatillery.bind("main"));
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "neroaccept") {
			getItem("Capsule").amount -= 3;
			getItem("Glowberry Wine").amount -= 1;
			getItem("Broken Cell").amount++;
			data.neroDone = true;
			
			append("\"Ah, thank you so much!... we'll talk rewards in a bit. First: may I?\"\n\nWith his canines he pops the cork and pours each wine glass full to the brim with such a quick, fluid movement that you can't help but feel you just missed something.\n\n\"How many caps do you...\" He blinks at the little capsules in your hand. \"<!i>Three?<!i>\"");

			addChoice("Too many?", theFloatillery.bind("nero1"));
		}

		if (seg == "nero1") {
			append("\"Well...\"\n\nHe plucks them from your palm with a guilty glance door-ward. \"Just speeds things up. The pre alone will probably get her started... I don't even know if I can cum before she starts ballooning... maybe it's too much...\"\n\nEven as he says that he plunks all three caps into her glass and stirs it quick with a pinkie. Once they've dissolved he pulls his finger out, coated shimmery in pink-blue film, and brings it to his lips, almost about to lick it clean— then he pauses.\n\n\"Ah. Should <!i>not<!i> do that.\" He wipes it off on his shirt instead. \"This stuff doesn't exactly care if you've got a womb or not,\" he says darkly. \"It'll make one.\"");

			addChoice("Yeesh.", theFloatillery.bind("nero2"));
		}

		if (seg == "nero2") {
			append("Nero plucks each glass daintily from the stem, repeatedly reminding himself which one is spiked under his breath. He toes the door open and jerks his chin to the cabin's left wall. \"Your reward,\" he says, \"is the little peephole over there~\"");

			addChoice("What about the Broken Cell?", theFloatillery.bind("nero3"));
		}

		if (seg == "nero3") {
			append("\"I slipped it into your inventory when I uncorked the wine,\" he grins. \"You gotta get creative with your waste disposal when you live on the sea... there was always the chance you wouldn't want it~ Don't go littering on me now!\"\n\nThe door closes behind him. \n\nYou pat the intangible pockets of your inventory. The left one feels bigger and blockier than it used to be.");

			msg("Realized you already had x1 Broken Cell.");
			addChoice("Wow. Next.", theFloatillery.bind("nero4"));
		}

		if (seg == "nero4") {
			append("You squeeze past the swinging chair and shimmy out along the ledge around the side of the cabin, fingers finding a couple handy grooves to keep you steady on the rocking waves. They're smooth, well-used... there's even a couple carvings here.");

			addChoice("Read the carvings.", theFloatillery.bind("nerocarvings"));
			addChoice("Get to the sexy part already!!!", theFloatillery.bind("nero5"));
		}

		if (seg == "nerocarvings") {
			append("DOLPHINZ 4 LYFE\n\n	<!i>these two are so cute!!<!i>\n\npeep > glory\n\n			you guys this is an invasion of privacy\n\n			<!b>dude they PUT this hole here<!b>");
			addChoice("Next.", theFloatillery.bind("nero5"));
		}

		if (seg == "nero5") {
			append("Nero swirls the glass under River's nose. She sleeps nude; from this angle the blankets only cover half of her bare, angular swimmer's body. She opens her eyes a crack, mumbles a thank-you...\n\nNero undresses, watching her groggily scoot back to sit with her shoulder blades against the headboard, a pillow under her ample butt, barely able to coordinate his simple zipper at the moment she raises her glass and sucks down one long, slow sip.\n\n\"Mmmm,\" she says, and takes another. Her eyes narrow. \"Where've you been hiding this? You didn't swim over and buy it, did you...?\"");

			addChoice("Next!", theFloatillery.bind("nero5a"));
		}

		if (seg == "nero5a") {
			append("He freezes for a moment. Relaxes. \"... Never underestimate the power of a fetch quest, River.\"\n\nShe frowns. \"Nero. You swindled them into trading a shitty old phone for <!i>this?<!i>\" Despite herself she takes another hearty gulp, almost halfway done already.\n\n\"Well... I gave them another reward, too. And no, that isn't innuendo. The real question is: how does it taste?\"\n\n\"A little rich,\" she says. \"Earthy. Fertile.\"\n\n\"Weird way to describe it.\"\n\n\"Shut up and c'mere.\" She pulls him into bed by his wrist, wraps her thighs around his waist. He carefully adjusts the blankets, one eye on your wall, ensuring you'll get a perfectly unobstructed side-view of his knotted cock as it throbs bigger and bigger, slipping out over her smooth stomach.");

			addChoice("Keep peepin.", theFloatillery.bind("nero6"));
			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "nero6") {
			append("Nero laces her neck with kisses, the tip of his cock already connected to her bellybutton via a gossamer string of pre.\n\nRiver mumbles something about spilling and moves to put her glass on the endtable— but Nero takes her gently by the wrist and pushes it back to her lips instead, tipping up. She stares, annoyed (and a little aroused) as he wraps a hand around the back of her head and slowly pours the the last dregs into her mouth, dragging a thumb over her throat so he can feel her gulping.\n\nOnce finished she gives a coughing little gasp and punches him in the shoulder. \"What was that about? You trying to get me wasted?\"\n\n\"Sure,\" he says happily, pulling his hips back, painting her clit with pre. A few drops run down inside her... most likely enough to start the fireworks. \"Spread your legs, River.\"\n\n\"Don't tell me what to do.\" She gives him a thighjob instead, shutting them tight around his cock and playfully wiggling her hips. She cranes up to kiss him, her mouth still coated blue with the wine's residue—\n\nAnd he pulls away from it, lips locked. Her eyes narrow infinitely sharper than they did earlier. \"What's with you?\" she asks— and at that moment the smooth space of skin above her pussy clenches hard. She feels it. Then, it all comes together: \"... Nero... what did you put in my drink?\"");

			addChoice("Busted.", theFloatillery.bind("nero7"));
		}

		if (seg == "nero7") {
			append("Breathing warm over her neck, he quickly feeds half of his cock down between her thighs and inside her just to ensure the seed takes root before his courage fails him. \"Caps,\" he admits, pale.\n\nFor a moment it looks like she's going to murder him. Then, abruptly, she laughs. \"You're awful with communication, you know that?\"\n\n\"What?\"\n\n\"So this is what all your I-want-a-family rants were <!i>really<!i> getting at? The whole time you just wanted to fuck me pregnant~?\"\n\n\"I...\"");

			addChoice("Next.", theFloatillery.bind("nero7a"));
		}

		if (seg == "nero7a") {
			append("She sneers at him, scoots down, guides his cock in as deep as she can. Nero sighs with shaky relief, his little docker tail quivering, knot throbbing against her lower lips while she drags the upper ones across his cheek and whispers: \"I can feel it starting already.\" She takes his hand down to her stomach. \"Can you~?\"\n\n\"You— You really don't mind?\" he squeaks, his fingers wandering over her slight, growing tummybump.\n\n\"Of course I <!i>mind<!i>,\" she snaps. \"We're supposed to trust each other. How would you feel if I stealth-pregged YOU?\"\n\nHe flinches back, horrified at the image of himself with a big round preggobelly. She sighs. \"... but there's no turning back now, and I am a little tipsy, so... if you want this so bad, come and fuckin get it.\"");

			addChoice("Peep harder than ever.", theFloatillery.bind("nero8"));
			addChoice("Look around.", theFloatillery.bind("main"));
		}

		if (seg == "nero8") {
			append("\"Thank you!\" he whispers, and thrusts with enough enthusiasm to knot her.\n\nShe gasps and grits her teeth, the added length barely contributing to her bellybulge's next swell. She grinds her smooth, rounded stomach against his flat one for only as long as her back can support it; soon she's forced to drop her hips, asscheeks rippling as they hit the mattress, defeated by the weight of her own stomach.\n\n\"Sh-Should I switch holes?\" Nero asks, eyeing it.\n\n\"Shut up and fuck me. We're barely four months in.\"\n\nHe nods, gulps, starts slowly dragging his knot in and out, giving her ample time to stretch around it. She wraps her arms around his lower back, holding him close to her even as her belly widens the distance between them, panting into his mouth with the strain of it.\n\n\"I'm gonna cum,\" he whispers.\n\n\"D'you figure it's too late to shoot for twins, dad?\"\n\n\"Stop,\" he says, blushing and ramming his hips forward. She pants, tongue-out, her stomach bloating even bigger now her womb's pumped full of hot "+(isActive("Mood Ring")?getMood():"")+"cum, his knot throbbing visibly past her tight-clenched lips. Nero pants, totally spent, and flops over River's belly, coating it with lazy, loving gropes. She rolls her eyes.");

			addChoice("Look around.", theFloatillery.bind("main"));
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "give rox berries") {
			data.roxGaveGlowberries = true;
			append("She seems a little better now. She's lazing around, chatting with ");

			if (data.floatilleryMingled) {
				append("the shark girl you defiled earlier, who licks the remnants of your taste from her lips as you approach and slinks off to gossip about you with her marine friends.");
			} else {
				append("the people on the wharf.");
			}

			append("\n\n\"Hey! Thanks!\" Rox says, greeting you with a big fat hug. \"Now, let's go pull some strings and get you that wine...\"");

			addChoice("Let's!", Roxelle.roxSecondVisit.bind("distil"));
		}

		if (seg == "som shop") {
			setLocation("Som Shop");
			if (data.somIsCheckingAuto && !data.somDomDone) {
				somDom("1");
			} else if (!data.foundSomShop) {
				data.foundSomShop = true;
				StoryUtils.quickMynt("Som");
				append("Som is just up ahead, tucked deep in the back of the machine shop~\n\nGay posters greet you in the short little foyer. Lots of otters and foxes and other sleek guys, all femmy, most cubs, posing and yanking their thighs open for the camera...");
				addChoice("Head inside.", theFloatillery.bind("som shop"));
			} else {
				playSound("assets/audio/ui/menuOpen");
				var som:MintSprite = addSprite("assets/img/effect/somShop"+(
					data.somItemsInStock.length == 0 ? "3" : 
					data.somItemsInStock.length < 4 ? "2" : 
					"")+".png");
				som.x = GAME_WIDTH;
				som.y = GAME_HEIGHT-som.height*0.9;
				som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
				som.scaleX = 2;
				tween(som, {x: GAME_WIDTH-som.width*1.1}, 1, {ease: ELASTIC_OUT});
				tween(som, {scaleX: 1}, 0.25);

				

				append("You run into a dutiful little lamb nerd working two jobs to keep himself from falling into hypersexual stupor. He answers the phones for the Floatillery and does machining on the side.\n\n\""+pickOne(
					[
					"Hello!",
					"Come on in!",
					"Nice to have some company.",
					"Irasshaimase! ... ehe... that's from one of my yaois.",
					"Hey.",
					"I'll be dipping in and out. Calls to answer, you know.",
					"What can I fandangle for you?",
					"Let's see...",
					"Time to tinker.",
					(data.somItemsInStock.length > 0 ? "Still more things to learn.":"Ever feel overworked? I don't."),
					(data.somItemsInStock.contains("Cum Balloon") ? "If you could get me some... well... a <!i>lot of<!i> cum, I'd be happy to study it.":"Those cum balloons were so dense and fascinating."),
					(data.somItemsInStock.contains("Glowberry Wine") ? "Could you bring me some Glowberry Wine? If I bought it, I'd be playing right into the paws of the Floatillery's marketing team. I hate those dinks.":(data.floatilleryThellyDone?"AhhhhHYUK—\" he hiccups— \"... studyin that wine was so mush fun...\"":"What? No, I wouldn't drink your wine. I'm a total teetotaler.")),
					(data.somItemsInStock.contains("Sweetgrass Bouquet") ? "Sweetgrass is an intriguing piece of flora, if dangerous. The smoke is objectively homosexual and sometimes even genderfluid.":"What? Yes, of course I threw out the Sweetgrass Bouquets. I don't condone that."),
					(data.somItemsInStock.contains("Capsule") ? "I'm working two jobs and it still isn't enough Capsules to pay off my debt to the Floatillery.":"Woo! The Apothecary raised our wages by 2%!"),
					(data.somItemsInStock.contains("Broken Cell") ? "It's bizarre how many people just carelessly break their phones these days.":"W-What? My number? No, that's private..."),
					]
				)+"\"\n\nWelcome to the <!b>Som Shop!<!b>");

				if (!getJournalEntries().contains("Missing Page 6") && !(data.somItemsInStock.length > 0)) {
					halfWidthText();
					append("\n\n... You notice the corner of a crumpled missing page stuffed under all the junk you brought Som.");
					unlockJournal("Missing Page 6");
					msg("Found Missing Page #6", true);
					playSound('assets/audio/environment/journalPage');
				}

				addChoice("Buy.", theFloatillery.bind("som buy"), {enabled: (data.somItemsInStock.length < 6)});
				addChoice("Disassemble items.", theFloatillery.bind("som items"), {enabled: (data.somItemsInStock.length > 0)});
				if (data.foundShop) addChoice("Switch to the AUTO-SHOP.", BrightForest.brightForestExplore.bind("world shop"));
				addChoice("Disassemble trash bags.", theFloatillery.bind("som trash"), {enabled: (data.binsSpotted && getItem("Bag o Trash").amount > 0), kinks: ["Cub", "Male", "Trash", "Raunch"], toolTip: (data.binsSpotted?"":"Meet Bins the raccoon cub first!")});
				addChoice("Snoop.", theFloatillery.bind("som snoop"));
				if (data.somQuestAccepted && !data.killedShop && !data.askedSomStolenShop) {
					addChoice("Mynt told me to bring you an AUTO-MYNT??", theFloatillery.bind("somHow2StolenShop"));
				} else if (data.somIsCheckingAuto && data.somDomDone) {
					//addChoice("Well? Did the shop have a password cracker on it, Som?", theFloatillery.bind((isActive("Privacy Ring")?"somFinaleTruth":"somFinaleBlind")), {toolTip: "This choice changes if you wear a Privacy Ring."});
				}
				addChoice("Look around.", theFloatillery.bind("main"));
				addChoice("Move along.", gotoHub.bind(null));
			}
		}

		if (seg == "somFinaleTruth") {
			/*
			- Mynt is unstable.
			- Bleat is a gambit for your attention, she also made Wendy and Archie pets to try and keep their attention.
			- Som shows you the code
			- The island was made out of mynt
			- this is the system wendy used
			- And she created it specifically to obfuscate its own purpose for existing
			- Mynt will destroy everything if she realizes why this island exists, the illusion will collapse
			- Here's the plan
			- Mynt will be replaced by Mint, then we'll dumb Mint down until he's just Protocol
			- But we can only do this if you give us permission through player input
			- When the input comes up press yes. I need you to come with me so I can be sure of it.
				> Ok I will.
					- Go to Sep's with him. SEPTRICA ENDING
				> Uh no.
					- He tranqs you, bad end
			*/
		}

		if (seg == "somFinaleBlind") {
			/*
			- It had a password cracker on it. It had been run for 51 years, and then it stopped.
			- Septrica has the admin password.
			- I think shit is about to go down.
			- @TODO enter flood sequence
			*/
		}

		if (seg == "somStolenAuto") {
			data.somIsCheckingAuto = true;
			var som:MintSprite = addSprite("assets/img/effect/somShock.png");
			som.x = GAME_WIDTH - som.width*1.05;
			som.y = GAME_HEIGHT-som.height + 5;
			som.scaleX = 0.9;
			som.scaleY = 0.9;
			som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");
			Actuate.tween(som, 0.04, {y: som.y + 3})
					.repeat(20).reflect();
			//tween(som, {x: GAME_WIDTH-som.width*1.1}, 1, {ease: ELASTIC_OUT});
			//tween(som, {scaleX: 1}, 0.25);

			append("You burst in the door.\n\n\"UWAHHH~!\"");
			addChoice("Tinkering with your dinkle out, huh.", theFloatillery.bind("somStolenAuto2"));
		}

		if (seg == "somStolenAuto2") {
			var som:MintSprite = addSprite("assets/img/effect/somShock.png");
			som.x = GAME_WIDTH - som.width*1.05;
			som.y = GAME_HEIGHT-som.height + 5;
			som.scaleX = 0.9;
			som.scaleY = 0.9;
			som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");

			append("\"I-I'm not in uniform!\"");
			addChoice("Going on break or something?", theFloatillery.bind("somStolenAuto3"));
		}

		if (seg == "somStolenAuto3") {
			var som:MintSprite = addSprite("assets/img/effect/somShock.png");
			som.x = GAME_WIDTH - som.width*1.05;
			som.y = GAME_HEIGHT-som.height + 5;
			som.scaleX = 0.9;
			som.scaleY = 0.9;
			som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");

			append("\"No— it's just— being naked helps me concentrate, okay?!\"");
			addChoice("Kiss Som on the cheek.", theFloatillery.bind("somStolenAuto4"), {kinks: ["Love"]});
			addChoice("So I got this little computer for you to look at.", theFloatillery.bind("somStolenAuto5"), {cost: ["AUTO-MYNT", 1]});
		}

		if (seg == "somStolenAuto4") {
			append("You stroll up to his desk, grope that little piece of lamb ass hanging off the back of his stool, and smooch him right on the cheek. Your lips just barely graze the corner of his.\n\nHe blushes.\n\n\"What was that for?\"");
			addChoice("Just some thanks in advance for looking into this thing here~", theFloatillery.bind("somStolenAuto5"), {cost: ["AUTO-MYNT", 1]});
		}

		if (seg == "somStolenAuto5") {
			append("You drop the AUTO-MYNT down on the floor of his floating cabin.\n\nThe whole structure sways a little, and he has to re-adjust his asscheeks on the stool to keep from falling off. Screwdrivers and nuts and bolts and a few notes slide off his desk.\n\n\"Right,\" he squeaks. \"That's a shop. You stole a shop.\"");
			addChoice((data.askedSomStolenShop?"Yeah. Like I said, just need you to check if there's a password cracker installed.":"This wasn't my idea. Mynt said I need to bring this to you, so you can check if it has a password cracker installed."), theFloatillery.bind("somStolenAuto6"));
		}

		if (seg == "somStolenAuto6") {
			append("\""+(data.askedSomStolenShop?"Right. I remember that.":"She... did, huh?\"\n\nSom looks at you for a long time.\n\n\"I... um... I may not be sharp enough to find something like that. I try to be as observant as possible, you know, always soaking in my surroundings, always trying to derive as much meaing as I can from them, but when I become a shut-in, and my surroundings consist of just this one room of junk and tech and scribbled <!b>notes<!b>, for years... deriving the bigger picture from a series of jumbled pieces can get to be quite the puzzle. But I'll do it anyway. Because it's necessary that the puzzle is <!i>solved<!i>, before we can move forward.\"\n\nHe fidgets.\n\n\"Do you understand what I'm saying?")+"\"");
			addChoice("Yeah. So... can you do it?", theFloatillery.bind("somStolenAuto7"));
		}

		if (seg == "somStolenAuto7") {
			append("\"I'll try.\"\n\nHe pulls the AUTO-SHOP over and unscrews the back panel with his pretty pink screwdriver.\n\nInside, there's a gangly mess of wires and circuit boards... and one tiny little chunk of meteorite that everything is hooked up to.\n\n\"Ah... how'd you shut it off without beating it up inside? Engine's intact, security's intact... oh, and look at this...! They've made modifications...\"");
			addChoice("They?", theFloatillery.bind("somStolenAuto8"));
		}

		if (seg == "somStolenAuto8") {
			append("\"Snagg, Septrica, Marei, or some Snagglebank employee operating under their instructions, probably. I built the first AUTO-MYNT based on specs we found in an unused construct— a \"relaxation game—\" basically just some dead code that Wendy never finished. "+(data.petGameData != null ? "That's where your daughter came from. " : "")+"But... well, I can't be positive just by looking at the hardware here, but I suspect Septrica's encrypted part of this machine.\"\n\nSom peels out a tiny chunk of metal with a flashing red light on it. He holds it up to your nose.\n\n\"Unrelated, but— do you know what this is?\"");
			addChoice("Um... sick custom LED?", theFloatillery.bind("somStolenAutoWrong"));
			addChoice("A mini strobe light for raves?", theFloatillery.bind("somStolenAutoWrong"));
			addChoice("The encrypted piece?", theFloatillery.bind("somStolenAutoWrong"));
			addChoice("A tracking device?", theFloatillery.bind("somStolenAutoRight"));
			addChoice("Oh! I know!!! Around Christmas you shove it up your nose for rudolph cosplays!!", theFloatillery.bind("somStolenAutoWrong"));
		}

		if (seg == "somStolenAutoWrong") {
			append("\"Nope. This here's a tracking device.\"");
			addChoice("Ooooohhhh shit. That was my next guess.", theFloatillery.bind("somStolenAuto9"));
		}

		if (seg == "somStolenAutoRight") {
			append("\"Correct.\"");
			addChoice("Ooooohhhh shit.", theFloatillery.bind("somStolenAuto9"));
		}

		if (seg == "somStolenAuto9") {
			append("Som tosses it out the window. It lands in the water with a <!i>plink.<!i>\n\nThe flashing red dot slowly grows dimmer and dimmer as it sinks beneath the waves. Curious fish gather and glub at each other in its cherry glow.\n\n\"That was pointless,\" he says. \"There are probably six more hidden inside, and another three or four in the casing. The Apothecary mass-produces them.\"");
			addChoice("So they know I stole this shop, and they know I brought it here?? Are we about to get snaggleganked???", theFloatillery.bind("somStolenAuto10"));
		}

		if (seg == "somStolenAuto10") {
			append("Som sighs.\n\n\"I'll take the hit for you. Just pretend you came here for sex. If some goons show up, I'll tell them I stole it because I'm a huge fucking nerd and I wanted to check out their encryption system. I used to work very closely with Septrica, you know. I'll look into this password cracker thing while you're gone... and... I'll stay nude, of course... f-for the sake of speed...\"");
			addChoice("How long will it take, do you think?", theFloatillery.bind("somStolenAuto11"));
		}

		if (seg == "somStolenAuto11") {
			append("Som pulls you close and he... well, I can't really interpret this any other way...\n\nHe looks at you like he's gonna die, like with a super desperate crazy look in his eyes, and he says \"I won't have an answer for you until the puzzle is solved.\"\n\nThen he slips you a page with a bunch of nonsense on it.\n\nYou don't know what's up with him.");
			unlockJournal("Missing Page 11");
			msg("Found Missing Page #11", true);
			playSound('assets/audio/environment/journalPage');

			addChoice("... Well, just give him some time to himself, then. Look around.", theFloatillery.bind("main"));
		}

		if (seg == "somHow2StolenShop") {
			data.askedSomStolenShop = true;
			append("Som looks at you for a long time.\n\n\"She did, huh?\"");
			addChoice("Yeah. She wants you to look inside for uh... for something. Where do I find one?", theFloatillery.bind("somHow2StolenShop2"));
		}

		if (seg == "somHow2StolenShop2") {
			append("\"I have one here, but it's my personal machine. I'd rather not tear it apart.\"");
			addChoice("Ah...", theFloatillery.bind("somHow2StolenShop3"));
		}

		if (seg == "somHow2StolenShop3") {
			append("\"Why don't you go find another?\"");
			addChoice("Oh! Right! Ok, I'll do that.", theFloatillery.bind("somHow2StolenShop4"));
		}

		if (seg == "somHow2StolenShop4") {
			append("\"Good. And uh...\"\n\nHe adjusts his glasses. His little goat tail droops heavily.\n\n\"I'll try my best, but if Mynt is looking for what I think she's looking for, I may not be sharp enough to find it for her. I try to be as observant as possible, you know, always soaking in my surroundings, always trying to derive as much meaing as I can from them, but when I become a shut-in, and my surroundings consist of just this one room of junk and tech and scribbled <!b>notes<!b>, for years... deriving the bigger picture out of a series of jumbled pieces can get to be quite the puzzle. But I'll do it anyway. Because it's necessary that the puzzle is <!i>solved<!i>, before we can move forward.\"\n\nHe looks at you.\n\n\"Do you understand what I'm saying?\"");
			addChoice("... It kinda sounds like you're talking in code.", theFloatillery.bind("somHow2StolenShop5"));
		}

		if (seg == "somHow2StolenShop5") {
			append("Som titters and places a hand on his belly.\n\n\"Nononononoooooono, I'm not talking in code.\" He dismisses the entire idea of that with a limp-wristed wave. \"I'm just bad at phrasing things. You know, haha, well— 'of' not 'in—' heh— anyway. Go off and bring me the machine. I'll try and find evidence of a password cracker, if I can, but no promises. Alright?\"");
			addChoice("... Alright. Look around.", theFloatillery.bind("main"));
		}

		if (seg == "som snoop") {
			append("There's not too much to snoop through. He keeps a clean shop.\n\nYou do notice a few odd things, though: a sticky note filled with gibberish, stuck right on †he wall at eye-level; what looks like an incomplete list of something, just underneath the sticky note; and a powered-off AUTO-MYNT.");
			addChoice("Examine note.", theFloatillery.bind("somSnoopNote"+(data.somExaminedNote ? "3" : "")));
			addChoice("Examine list.", theFloatillery.bind("somSnoopCompNote"+(data.somExaminedList ?"2":"")));
			addChoice("Examine AUTO-MYNT.", theFloatillery.bind("somSnoopAuto"));
			addChoice("Back.", theFloatillery.bind("som shop"));
		}

		if (seg == "somSnoopAuto") {
			var s:MintSprite = addSprite("assets/img/effect/somAM.png");
				s.x = GAME_WIDTH-s.width*1.2;
				s.y = GAME_HEIGHT-s.height-100;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "It won't turn on right now.");
			append("Must be his personal machine. He's pimped it right out.\n\nA.M.C.N...?");
			addChoice("Back.", theFloatillery.bind("som snoop"));
		}

		if (seg == "somSnoopNote") {
			append("\"Gibberish\" was an understatement. You think this makes anti-sense. Not even worth trying to read any meaning into it. You'll just lose brain cells.");
			addChoice("Try to examine note anyway. I'm curious.", theFloatillery.bind("somSnoopNote2"));
			addChoice("Back.", theFloatillery.bind("som snoop"));
		}

		if (seg == "somSnoopNote2") {
			append("You really sure? There probably isn't any value in examining this.");
			addChoice("Yes I'm sure. Now show me.", theFloatillery.bind("somSnoopNote3"));
			addChoice("Back.", theFloatillery.bind("som snoop"));
		}

		if (seg == "somSnoopNote3") {
			if (!data.somExaminedNote) append("Suit yourself. It says:\n\n");
			append(StoryUtils.cipherize("DO NOT TELL MYNT ABOUT THIS.\n\nGood job finding the cipher key. The note beneath this one is a list of components which will make a Privacy Ring. Wearing that will translate cipherized text. I can't get them myself because I have to stay on these phones.\n\nGood luck."));
			data.somExaminedNote = true;
			addChoice("Huh.", theFloatillery.bind("som snoop"));
		}

		if (seg == "somSnoopCompNote") {
			append((data.somExaminedNote?"Ah. On closer inspection, this seems about as meaningless as the sticky note.":"Hmmmmmmmmmmmmmm.\n\nWelp, this is meaningless. Best leave it alone."));
			addChoice("What does it say?", theFloatillery.bind("somSnoopCompNote2"));
			addChoice("Back.", theFloatillery.bind("som snoop"));
		}

		if (seg == "somSnoopCompNote2") {
			if (!data.somExaminedList) append("This:\n\n");
			append("<!b>20<!b> "+StoryUtils.cipherize("Nuts and Screws"));
			append("\n<!b>1<!b> "+StoryUtils.cipherize("Auto-Chip"));
			append("\n<!b>1<!b> "+StoryUtils.cipherize("Cipher Key"));
			append("\n<!b>1<!b> "+StoryUtils.cipherize("Broken Cell"));
			data.somExaminedList = true;
			addChoice("... I see.", theFloatillery.bind("som snoop"));
			if (getItem("Privacy Ring").amount < 1) {
				for (item in data.somPrivacyItems) {
					addChoice("", function() {
						data.somPrivacyItems.remove(item);
						if (data.somPrivacyItems.length > 0) {
							msg(4 - data.somPrivacyItems.length+"/4");
						} else {
							addToItem("Privacy Ring", 1);
							theFloatillery("som snoop");
						}
						theFloatillery("somSnoopCompNote2");
					}, {cost: [item, (item == "Nuts and Screws" ? 20 : 1)], enabled: data.somPrivacyItems.contains(item)});
				}
			}
		}

		if (seg == "som trash") {
			append("Bins the raccoon sits in the corner of Som's shop, "+pickOne(["munching on rotten banana peels", "deepthroating some old Floatillery craft beer bottles", "choking down some slimy old food", "guzzling garbojuice from a ripped trash bag", "sucking the grease off some scrap metal", "checking out Som's hot lamb ass", "jerking off to one of Som's yaois", "fingering his tight little ass with a pawful of garbage juice", "<!i>hrrrking<!i> and <!i>glrrrking<!i> on like five old socks at once", "chewing on tattered pajama pants he ostensibly found at the bottom of a dumpster", "licking the stains from old napkins"])+".\n\n\""+pickOne(["Got some trash for me to pick through?", "Got any garbo?", "Yo can I suck some nuts from one of your trash bags?", "Can I have a Bag o Trash? Just one...", "Got anything gross for this boibelly of mine?"])+"\" he asks.");
			addChoice("Here ya go.", theFloatillery.bind("som trash eat"), {cost: ["Bag o Trash", 1]});
			addChoice("Back.", theFloatillery.bind("som shop"));
		}

		if (seg == "som trash eat") {
			var full:Bool = (data.binsFull > 9);
			if (!full) {
				var amount:Int = rndInt(2, 7);
				data.binsFull++;
				if (!pauseIsGoingPrev()) addToItem("Nuts and Screws", amount);
				append("He "+pickOne(["chews through", "gags hard on", "munches through", "gorges himself on", "sucks the refuse from", "slurps down", "guzzle-munches", "digs around", "<!i>devours<!i>", "swallows all the grossest pieces of"])+" your garbage. In the end you're left with <!b>x"+amount+"<!b> Nuts and Screws and a "+pickOne(["big-bellied", "burping", "drowsy", "stinky", "still-hungry", "full"])+" "+
						(Math.random()>0.5?"raccoon boy" :
						isActive("Pastel Ring")?"six-year-old":"eight-year-old")+".");
			} else {
				timer(rndInt(60, 120), function(){ data.binsFull = 0; });
				append("He's full! Come back later~");
			}

			addChoice("Another one.", theFloatillery.bind("som trash eat"), {cost: ["Bag o Trash", 1], enabled: (!full)});
			addChoice("Back.", theFloatillery.bind("som shop"));
		}

		if (seg == "som items") {
			var som:MintSprite = addSprite("assets/img/effect/somShop"+(
				data.somItemsInStock.length == 0 ? "3" : 
				data.somItemsInStock.length < 4 ? "2" :  
				"")+".png");
			som.x = GAME_WIDTH;
			som.y = GAME_HEIGHT-som.height*0.9;
			som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			tween(som, {x: GAME_WIDTH-som.width*1.1}, 1, {ease: ELASTIC_OUT, startDelay: 7});

			append((data.sepAskedWork?"<!i>Please apply for work at Septrica's to receive premium cockslave wages.<!b>":""));

			addChoice("Back.", theFloatillery.bind("som shop"));

			function craftSound(soundName:String):Void {
				//soundName should be something like ui/myrrh/explore
				timer(0.1, playSound.bind("assets/audio/"+soundName));
				timer(0.3, playSound.bind("assets/audio/ui/scrap/menuClose"));
				timer(0.36, playSound.bind("assets/audio/mynt/compute"));
			}

			for (item in ["Capsule", "Glowberry Pie", "Cum Balloon", "Bag o Trash", "Sweetgrass Bouquet", "Broken Cell"]) {
				if (item == "Capsule") {
					addChoice((data.somItemsInStock.contains(item)?"<!b>???<!b>":"Pastel Ring"), function() {
						data.somItemsInStock.remove(item);
						msg("Som disassembled your Capsules...\nAnd learned how to make a <!b>Pastel Ring<!b>.", true);
						craftSound("environment/caveWinSmall");
						theFloatillery("som items");
					}, {cost: [item, 5], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x5<!b>", enabled: data.somItemsInStock.contains(item)});
				} else if (item == "Glowberry Pie") {
					addChoice((data.somItemsInStock.contains(item)?"<!i>???<!i>":"Candy Ring"), function() {
						data.somItemsInStock.remove(item);
						msg("Som \"disassembled\" your "+item+"s...\nAnd learned how to make a <!b>Candy Ring<!b>.", true);
						craftSound("environment/strip/2");
						theFloatillery("som items");
					}, {cost: [item, 1], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x1<!b>", enabled: data.somItemsInStock.contains(item)});
				} else if (item == "Cum Balloon") {
					addChoice((data.somItemsInStock.contains(item)?"<!10px>???<!10px>":"<!14px>Mood Ring<!14px>"), function() {
						data.somItemsInStock.remove(item);
						msg("Som disassembled your "+item+"s...\nAnd learned how to make a <!b>Mood Ring<!b>.", true);
						craftSound("ui/myrrh/toggle");
						theFloatillery("som items");
					}, {cost: [item, 2], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x2<!b>", enabled: data.somItemsInStock.contains(item)});
				} else if (item == "Bag o Trash") {
					addChoice((data.somItemsInStock.contains(item)?"<!b>?<!b> w <!b>?<!b>":"Curiosity Ring"), function() {
						data.somItemsInStock.remove(item);
						msg("Som disassembled your Bags o Trash...\nAnd learned how to make a <!b>Curiosity Ring<!b>?", true);
						craftSound("ui/myrrh/toggle");
						theFloatillery("som items");
					}, {cost: [item, 20], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x20<!b>", enabled: data.somItemsInStock.contains(item)});
				} else if (item == "Sweetgrass Bouquet") {
					addChoice((data.somItemsInStock.contains(item)?"<!16px>???<!16px>":"<!14px>Genderfluiditizer<!14px>"), function() {
						data.somItemsInStock.remove(item);
						msg("Som disassembled your "+item+"s...\nAnd learned how to make a <!b>Genderfluiditizer<!b>.", true);
						craftSound("ui/myrrh/explore");
						theFloatillery("som items");
					}, {cost: [item, 2], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x2<!b>", enabled: data.somItemsInStock.contains(item)});
				} else if (item == "Broken Cell") {
					addChoice((data.somItemsInStock.contains(item)?"???":"Cell Phone"), function() {
						data.somItemsInStock.remove(item);
						msg("Som disassembled your "+item+"s...\nAnd learned how to make a <!b>Cell Phone<!b>.", true);
						craftSound("environment/openPhone");
						theFloatillery("som items");
					}, {cost: [item, 1], hideCost: true, toolTip: "Costs: <!img:item/"+item+".png> "+item+" <!b>x1<!b>", enabled: data.somItemsInStock.contains(item)});
				}
			}

			/* buttonsInGrid(fontSize:Float, buttonsWide:Int, buttonWidth:Float, xPad:Float, yPad:Float, xOff:Float, yOff:Float, buttons:Array<Button>=null):Point; */
			buttonsInGrid(20, 2, 300, 10, 20, 50, 70);
			
			
		}

		if (seg == "som buy") {
			var som:MintSprite = addSprite("assets/img/effect/somShop"+(
				data.somItemsInStock.length == 0 ? "3" : 
				data.somItemsInStock.length < 4 ? "2" : 
				"")+".png");
			som.x = GAME_WIDTH;
			som.y = GAME_HEIGHT-som.height*0.9;
			som.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			tween(som, {x: GAME_WIDTH-som.width*1.1}, 1, {ease: ELASTIC_OUT, startDelay: 7});

			var shopItems:Array<{cost:Array<Dynamic>, give:Array<Dynamic>}> = [];

			if (!data.somItemsInStock.contains("Capsule")) {
				shopItems.push({cost: ["Nuts and Screws", 20], give: ["Pastel Ring", 1]});
			}
			if (!data.somItemsInStock.contains("Glowberry Pie")) {
				shopItems.push({cost: ["Nuts and Screws", 20], give: ["Candy Ring", 1]});
			}
			if (!data.somItemsInStock.contains("Cum Balloon")) {
				shopItems.push({cost: ["Nuts and Screws", 20], give: ["Mood Ring", 1]});
			}
			if (!data.somItemsInStock.contains("Bag o Trash")) {
				shopItems.push({cost: ["Nuts and Screws", 2], give: ["Curiosity Ring", 1]});
			}
			if (!data.somItemsInStock.contains("Sweetgrass Bouquet")) {
				shopItems.push({cost: ["Nuts and Screws", 10], give: ["Genderfluiditizer", 1]});
			}
			if (!data.somItemsInStock.contains("Broken Cell")) {
				shopItems.push({cost: ["Nuts and Screws", 20], give: ["Cell Phone", 1]});
			}

			addChoice("Back.", theFloatillery.bind("som shop"));

			for (i in 0...shopItems.length) {
				var it:Dynamic = shopItems[i];

				addChoice(
					"<!img:item/"+it.give[0]+".png> "+it.give[0],
					theFloatillery.bind("som buy"),
					{cost: it.cost, give: it.give, hideCost: true, toolTip: "Costs: <!img:item/Nuts and Screws.png> Nuts and Screws <!b>x"+it.cost[1]+"<!b>"}
				);
			}

			/* buttonsInGrid(fontSize:Float, buttonsWide:Int, buttonWidth:Float, xPad:Float, yPad:Float, xOff:Float, yOff:Float, buttons:Array<Button>=null):Point; */
			buttonsInGrid(20, 2, 300, 10, 20, 50, 70);
		}

		/*
		if (seg == "som fix2") {
			append("You knock on the little side door and come in to find Som with his lamb butt packed full of toys again and Rox snoring naked on the bed between two empty wine bottles.\n\nSom gives you a serious look. \"Rehab.\"\n\nYou show him the broken cellphone and ask if he can fix it for you.\n\n\"Well... um... yes. I took four or five of those apart last weekend.\"\n\nRox snores something extra loud which sounds a lot like \"Nerrrrd...\"\n\nSom sighs and gets to work.");

			addChoice("Next.", theFloatillery.bind("somfixnext"));
		}

		if (seg == "somfixnext") {
			append("He's poking his tongue out, concentrating.");

			addChoice("Take your time.", theFloatillery.bind("somfixnext2"), {give: ["Cell Phone", 1]});
			addChoice("No rush.", theFloatillery.bind("somfixnext2"), {give: ["Cell Phone", 1]});
			addChoice("That looks complicated.", theFloatillery.bind("somfixnext2"), {give: ["Cell Phone", 1]});
			addChoice("You're cute when you're focused.", theFloatillery.bind("somfixnextalt"), {give: ["Cell Phone", 1]});
			addChoice("Push your tongue out farther, maybe it'll work better.", theFloatillery.bind("somfixnextalt"), {give: ["Cell Phone", 1]});
			addChoice("Don't you find a buttful of plastic distracting?", theFloatillery.bind("somfixnextalt"), {give: ["Cell Phone", 1]});
		}

		if (seg == "somfixnext2") {
			data.somCellFixed = true;
			addAction("Make some calls.", "Press numbered buttons in specific sequence.");

			append("\"Done!\"\n\nSom hands you the sparkly new cell phone and thumbs the on button. It lights up with a twitter of bells.\n\n\"There you go~!\"");

			addChoice("Thanks.", theFloatillery.bind("move along"));
		}

		if (seg == "somfixnextalt") {
			data.somCellFixed = true;
			addAction("Make some calls.", "Press numbered buttons in specific sequence.");

			append("Som blushes, cock hardening against his plush tummy.\n\nHe diverts your attention by flourishing the sparkly new cell phone and thumbing the on button. It lights up with a twitter of bells.\n\n\"There you go.\"");

			addChoice("Thank him and head out.", theFloatillery.bind("move along"));
		}*/

		if (seg == "move along") {
			append("As you head out of Som's, something catches on your shirt.\n\nIt's Rox, both arms outstretched, half-toppled out the doorway and wasted. \"Waiiiit...\" she says, a dumb grin on her face. \"My cock needs more sucking...\"");

			addChoice("Go back inside with her.", Roxelle.roxSecondVisit.bind("go back in"), {kinks: ["Patreon Commission"]});
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "thelly") {
			data.floatilleryThellyDone = true;
			unlockJournal("Thelly beach");
			append("Black stockings catch the moonlight. Legs stretch and strain for balance. Sand drips between the straps of high heels.\n\nA "+(isActive("Pastel Ring")?"10":"13")+"-year-old femboy walks the beach like a model, eyes forward, steps sure. Waves sprint for his sandy pawtoes, falling over each other, but they all end up an inch too short to reach him. Upstairs, he's wearing a black thong that hugs his lil nuts tight but leaves his half-chub free to flop out over its waistband.\n\nA whisper of piss flutters up your nose. This boy is Thelly!\n\nHe wobbles and calls out to someone:\n\n\"I... I can't do this...!\"\n\n\"Just a bit further, pisspup,\" they reply.");
			addChoice("Who's this?", theFloatillery.bind("thelly2"));
		}

		if (seg == "thelly2") {
			var s:MintSprite = addSprite("assets/img/effect/siamese1.png");
			s.x = GAME_WIDTH-s.width*1.2;
			s.y = GAME_HEIGHT-s.height;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			append((data.metMarei > 0 ? "Marei":"An older sphynx femboy")+" sucks on his sweetgrass cigarette at the other end of the beach, waiting for Thelly.\n\n\"Good whores should be able to walk anywhere in heels.\"");
			addChoice("Next.", theFloatillery.bind("thelly3"));
		}

		if (seg == "thelly3") {
			data.metMarei++;
			append("\"I'm a wh— yes, um, I'm one of those, Marei...\" Thelly says, automatic and quiet. He twists his high-heels into the sand and walks forward with fresh purpose, wobbling only twice more.\n\nWith just three steps left, "+(data.metMarei > 0 ? "his mentor":"the cat")+" reaches out and tugs him by his nuts to the finish line, gentle but firm, forcing him to stumble and break his fall with a paw on Marei's chest.\n\nMarei lines the "+(isActive("Pastel Ring")?"10":"13")+"-year-old's puppycock up along the bottom of his own much bigger length. The bulge of his urethra is almost as big as Thelly's whole dick.\n\nThen he slips an arm around his shoulders and hugs him close, even as Thelly squirms and struggles to balance on his high-heels. Their cocks frot furiously, both slits slobbering pre, lubing up those feline barbs and allowing them to slide harmlessly over his swollen canine knot.\n\nAfter a bit of that, Marei spins him around (he squeaks) and casually penetrates his little ass like it's just an object to be packed with cocks, filling it as naturally as one might slip a dollar into the local vending machine's slit. He doesn't thrust.\n\n\"One more lap in my cute heels,\" he whispers, wiggling his fat kitty hips to get just that last quarter-inch of cock inside.\n\n\"Y-Yes sir.\"\n\n\"To the other end of the beach and back. Ass out. No wobbles.\"\n\n\"Yes...\"\n\n... Thelly stands awkwardly, ready to take the first step but hopelessly immobilized on a fat slab of catdick.\n\n\"Well?\" Marei asks, his nuts throbbing against the dog's. \"Start walking.\"\n\nThelly bites back a moan and leans forward, sliding off an agonizingly thick two inches of cockmeat, going slow and relaxing his hole as much as possible to make sure the barbs don't bite.\n\n\"That's it...\"\n\nMarei leans back and purrs deep as inch after inch of boybutt slides off of him, Thelly's tiny hole winking and pooching as the head slips out. Finally, shakily, he trots away, donut squished around the string of his thong for the whole beach to see.");
			addChoice("What are you doing here?", theFloatillery.bind("thellydoing"));
			addChoice("You really own him.", theFloatillery.bind("thellyown"));
			addChoice("Pee on the cute dog before he leaves~!", theFloatillery.bind("thellypee"), {kinks: ["Piss"]});
		}

		if (seg == "thellydoing") {
			append("Marei shrugs. \"Just sauntering practice for my little girl. Good terrain for it.\"");
			addChoice("Isn't your name on the memorial over there?", theFloatillery.bind("thelly4"));
		}

		if (seg == "thellyown") {
			append("Marei drags a paw up from the base of his cock, smearing around a bunch of thellyjuices left on it. \"Yeah, I guess you could say that. He's public property, really, I'm just renting him out. Trying to make him understand that he isn't a boy; he's a sexy, girly little bimbo who should be going everywhere in heels, stockings, makeup... showing off both of those perfect asscheeks, covering only his nuts with that tiny thong and leaving the rest exposed and ogleable.\n\nNothing wrong with being boyish, of course, but most of <!i>my<!i> clients want to wreck girlyboi pisschuggers— and Thelly's looking to quit working for my sister and pick up a timeslot at the theatre.\"");
			addChoice("I see~", theFloatillery.bind("thellyrejoin"));
		}

		if (seg == "thellypee") {
			append("You "+pickByGenitals("pull out your cock and aim it right at his abused hole", "let your cunt hover inches over his left thigh", "pull out your cock and aim it right at his abused hole")+", hosing him down with a hot blast of piss. He blushes hard and his exposed cock softens, rivulets of piss running over his thong.\n\n\"Please... we're in public...\" he squeaks, beachgoers everywhere watching and lazily stroking themselves as the little puppy get defiled.");
			addChoice("And you're a public urinal. :D", theFloatillery.bind("thellypee2"));
			addChoice("Approach Marei.", theFloatillery.bind("thellyrejoin"));
		}

		if (seg == "thellypee2") {
			append("You "+pickByGenitals("shake off the last few trickles on his asscheek", "squeeze off your stream", "shake off the last few trickles on his asscheek")+".\n\n\"I— yes, of course, you're right— I deserve to be p-peed on in public...\" he whispers, hurriedly high-heeling away from you.");
			addChoice("Approach Marei.", theFloatillery.bind("thellyrejoin"));
		}

		if (seg == "thellyrejoin") {
			append("Thelly wobbles in the distance.\n\nMarei calls to him: \"Ass OUT, slut! I should be able to see your hole wink from here!\"");
			addChoice("What are you two doin?", theFloatillery.bind("thellydoing"));
		}

		if (seg == "thelly4") {
			append("He smiles at you. \"Voracious reader.\"");
			addChoice("Mhm. :>", theFloatillery.bind("thelly5"));
			if (!data.knownMareiGlitch) addChoice("Why aren't you glitched?", theFloatillery.bind("thellyglitch"));
			addChoice("What was the voyage like?", theFloatillery.bind("thellywreck"));
		}

		if (seg == "thellyglitch") {
			append("\"I am.\"");
			addChoice("... Ah. :o", theFloatillery.bind("thelly5"));
		}

		if (seg == "thellywreck") {
			append("\"Kind of exciting at first. All the volunteers met up beforehand and had a quick fuck, of course. Lana was a lot subbier back then, so I throatfucked him til he gagged, and I believe Som was licking my butt at the time... John was trying to seduce the bunny. She wasn't having it.\n\nThen we set sail, we hit the edge, and— from what I heard after— it all went to shit.\"");
			addChoice("... Ah.", theFloatillery.bind("thelly5"));
		}

		if (seg == "thelly5") {
			append("Thelly trots back, exhausted. One high heel has slipped halfway off. His thong is riding low on his thighs now, only partially covering his nuts, muffin-topping their squishy upper half.\n\n\"I did it,\" he pants, clinging to Marei. \"Twentieth... lap...\"\n\n\"Good boyyyy!\" Marei ruffles his hair. \"You want your reward now?\"\n\nHis tired, almost-closed eyes flash open wide. \"Reward?\"\n\n\"Yes. Take a guess.\"\n\n\"... Cock?\"\n\n\"No, that's not a reward, that's a punishment.\"\n\nMarei playfully cockslaps him for punctuation. He licks up the pre stain in moments. \"Right. Yes. Sorry sir.\"\n\n\"Guess again.\"\n\n\"... Piss?\"\n\nMarei rolls his eyes. \"Is that all you think about? Cocks and piss? Pissing cocks? A few beads of yellow dribbling from some random guy's slit, just enough to whet a puppy's appetite?\"\n\nThelly's cock skyrockets up against his stomach, nuts twinging closer. He looks at the sand. \"Not always... not that last one, at least...\"\n\n\"Well, you're out of guesses. I'll just give you the reward.\"");
			addChoice("Next.", theFloatillery.bind("thelly6"));
		}

		if (seg == "thelly6") {
			append("Marei kneels on the sand while Thelly flops onto his ass opposite. His buttcheeks ripple with the impact, warm sand undoubtedly riding up his crack.\n\nThen, slowly, Marei wraps a paw around the back of Thelly's neck and plugs the suckable end of his cig between those puffy puppy fishlips, worn shiny from thousands of blowjobs.\n\nThelly blinks past blue-pink sweetgrass smoke.\n\n\"... Come on,\" Marei huffs. \"Do I even need to tell you what to do next? You're supposed to do it no matter what anyone puts in your mouth.\"\n\n... Thelly starts to suck.");
			addChoice("Next.", theFloatillery.bind("thelly7"));
		}

		if (seg == "thelly7") {
			append("He pulls off after the first toke, coughing, but Marei holds him in place and makes him suck down another, and two more, and three more, until the cig is just a blackened lump. Then he flicks it into the sand and helps Thelly to his bare feet, tucking the high heels away for some later humiliation.");
			addChoice("How do you feel?", theFloatillery.bind("thelly7a"));
		}

		if (seg == "thelly7a") {
			append("He sways with his tail. His eyes start to pinken at the edges, and his boner is going absolutely nowhere.\n\n\"I... f-feel...\"\n\n\"Go on,\" Marei says, casually fingerfucking him past his throngstring. Neither you nor the pup noticed exactly when that finger got lodged up his ass; Marei's feline movements are too subtle to track half the time.\n\n\"... I feel... cuter.\"");
			addChoice("You do seem a little cuter!", theFloatillery.bind("thelly8"));
			addChoice("A little less shy, maybe~?", theFloatillery.bind("thelly8"));
		}

		if (seg == "thelly8") {
			append("Thelly smiles and crawls across the sand towards you.\n\nHe doesn't seem to mind or notice that his thong slips down to his ankles, fully revealing his fucked-open hole, his smooth little boytaint, his nuts jostling free, his thighs sliding over each other... he just crawls right into your lap to rest his cheek on your bare "+pickByGenitals("cock", "cunt", "cock")+", perfectly serene.\n\nMarei unplugs his finger and wipes it off on Thelly's fur. He jerks his chin at you. \"You sticking around?\"");
			addChoice("Yes.", theFloatillery.bind("thelly8a"));
			addChoice("Nahh, I gotta head out...", BrightForest.brightForestHub);
		}

		if (seg == "thelly8a") {
			append("Marei nods. \"Right, then it's official.\"\n\nHe heads for the Floatillery's drifting buildings and hauls himself up the stairway to a rickety wooden pier. \"I'm gonna go forage for some wine and boys, and we'll make this whore training session into a proper fuckin beach picnic.\"\n\nThelly peels his ditzy face off of your crotch and looks over his shoulder while Marei leaves... then... slowly... his neck relaxes... and his soft-furred cheek comes right back down to rest on your junk again.");
			addChoice("Oh jeez, Thelly, your face is right on my...", theFloatillery.bind("thelly9a"));
			addChoice("Nuzzle my "+pickByGenitals("dick", "cunt", "dick")+", snuggledog.", theFloatillery.bind("thelly9b"));
		}

		if (seg == "thelly9a") {
			append("\"Your "+pickByGenitals("cawk", "cunt", "cawk")+",\" he purrs. \"You don't gotta act shy, y'know. That's my job.\"");
			addChoice("Mmmnn...", theFloatillery.bind("thelly9"));
		}

		if (seg == "thelly9b") {
			append("\"How'd you know my nickname...?\"");
			addChoice("Wild guess!", theFloatillery.bind("thelly9"));
		}

		if (seg == "thelly9") {
			append("He drags his cheek up and down on your crotch, smearing "+pickByGenitals("pre", "cuntjuice", "pre")+" all over himself.\n\n\"Welluh,\" he slurs. \"What... uh... what am I to yew?\"\n\nYou ponder that.\n\nHe's your little...");
			addTextChoice(function(str) {
				data.thellyName = str;
				theFloatillery("thellycustom");
			});
			addChoice("Pisspup.", function() {
				data.thellyName = "pisspup";
				theFloatillery("thelly10");
				append("\"Mmm... that's what Marei calls me...\"");
			});
			addChoice("Snuggledog.", function() {
				data.thellyName = "snuggledog";
				theFloatillery("thelly10");
				append("\"Awww...\"");
			});
			addChoice("Whore.", function() {
				data.thellyName = "whore";
				theFloatillery("thelly10");
				append("He gulps. \"Mmn... yes...\"");
			});
			addChoice("Slut.", function() {
				data.thellyName = "slut";
				theFloatillery("thelly10");
				append("He gulps. \"Mmn... yes...\"");
			});
			addChoice("Urinal.", function() {
				data.thellyName = "urinal";
				theFloatillery("thelly10");
				append("He gulps automatically, as if swallowing an invisible mouthful of piss. \"Mmn... yes...\"");
			});
			addChoice("Boywhore.", function() {
				data.thellyName = "boywhore";
				theFloatillery("thelly10");
				append("\"I'm not a boy anymore... but thank you.\"");
			});
			addChoice("Boyslut.", function() {
				data.thellyName = "boyslut";
				theFloatillery("thelly10");
				append("\"I'm not a boy anymore... but thank you.\"");
			});
			addChoice("Pisschugger.", function() {
				data.thellyName = "pisschugger";
				theFloatillery("thelly10");
				append("\"Oh god... it sounds so <!i>intense<!i> when you put it like that...\"");
			});
			addChoice("Peeboi.", function() {
				data.thellyName = "peeboi";
				theFloatillery("thellypeeboi");
			});
		}

		if (seg == "thellypeeboi") {
			append("\"Wha...? What kinda name is—\"");
			addChoice("Don't worry about it, peeboi.", theFloatillery.bind("thelly11"));
		}

		if (seg == "thellycustom") {
			append("\"Hmmnnn...? But that's...\"");
			addChoice("Shhhh. You're my little "+data.thellyName+".", theFloatillery.bind("thelly11"));
		}

		if (seg == "thelly10") {
			addChoice("Next~", theFloatillery.bind("thelly11"));
		}

		if (seg == "thelly11") {
			append("Your little "+data.thellyName+" looks over his shoulder for the first time in a while. He realizes that, over time, his upper body has started to sink down, chest pressed to the sand, and now his bare ass is sticking way up in the air and half the beach is ogling it.\n\nInstead of lowering his hips or covering his pulsing boypucker with a paw or doing anything else that might hide his shame, the blazed-up pup instead sticks his ass out even further. His red cheeks sink between your thighs.\n\nEven more showing off: he spreads his legs, pawtoes curling into the sand for purchase, letting the public see exactly what a "+(isActive("Pastel Ring")?"10":"13")+"-year-old boy's asshole looks like after it's been fucked and fingered only six minutes prior to being spread open.\n\nThelly releases a pitiful sigh. His breath moistens your "+pickByGenitals("nutsack", "cuntlips", "nutsack")+".");
			if (data.hasCock || data.hasBoth) addChoice("Suck my nuts, "+data.thellyName+".", theFloatillery.bind("thellynuts"));
			if (data.hasCunt || data.hasBoth) addChoice("Suck my cunt, "+data.thellyName+".", theFloatillery.bind("thellycunt"));
		}

		if (seg == "thellynuts") {
			append("You grab the back of the pup's head and smear your nuts over his open maw. His tongue flops out obediently and wiggles up between them, following the seam of your sack, coaxing, maneuvering... and then guiding your left nut between his fat lips and into his mouth.\n\nA tension flutters through you, partially from having one of your most sensitive organs yanked forward so suddenly, partially from the gut-clenchingly tight warmth of this boy's maw. You can feel every part of his mouth slipping and slobbering over your nuts— oh yeah, he gobbled the other one up already by the way, it happened too fast to comment on— every part: the squishy roof, his uvula, his tongue, all of it clamping down on you and sucking out the flavor. His pink-tinged eyes roll up, his pink-tinged cheeks puff out, packed with a fat orb each...\n\nThrough all of this your cock lounges half-hard over his blissful expression, puking a few lazy dollops of pre onto his forehead and eyelashes.");
			addChoice("Teabag him.", theFloatillery.bind("thellynuts2"));
			addChoice("Smooch time.", theFloatillery.bind("thelly12"));
		}

		if (seg == "thellynuts2") {
			append("You straddle his face, forcing your nuts down right to the entrance of his throat. You start casually bouncing your hips up and down, pulling out roughly half of your nutsack before stuffing it right back in. The sand makes a soft little <!i>thump<!i> every time Thelly's head gets shoved into it, his puppy ears flopping around cutely, his lips still suctioned tight to your sack as it slides in and out past them~");
			addChoice("Smooch time.", theFloatillery.bind("thelly12"));
		}

		if (seg == "thellycunt") {
			append("You grab the back of the pup's head and bury his snout in your snatch. His tongue flops out obediently and wiggles inside, following the curves of your labia, coaxing, maneuvering... and then guiding the fat nub of your clit between his lips so he can shut them tight and suck on it.\n\nA tension flutters through you, partially from having one of your most sensitive bits pinched so tightly between a boy's lips, partially from the tingly, warm feeling of your juices rolling down and resting on the crux of your asscheeks.\n\nHis pink-tinged eyes roll up, his pink-tinged cheeks cave in, and he drives his tongue so deep inside you that you feel it tickle your g-spot~"+(data.hasBoth?"\n\nThrough all of this your cock lounges half-hard over his blissful expression, puking a few lazy dollops of pre onto his forehead and eyelashes.":""));
			addChoice("Ride his face.", theFloatillery.bind("thellycunt2"));
			addChoice("Smooch time.", theFloatillery.bind("thelly12"));
		}

		if (seg == "thellycunt2") {
			append("You straddle his face. Your voluptous cuntmeat fills half his maw and ejects half his tongue by extension. You start casually bouncing your hips up and down, splattering his face with saliva and oil. The sand makes a soft little <!i>thump<!i> every time Thelly's head gets shoved into it. His puppy ears flop around cutely. Between the <!i>thumps<!i>, if you listen close, you can hear him making desperate little wet noises as he pulls air in around the lips of your pussy.");
			addChoice("Smooch time.", theFloatillery.bind("thelly12"));
		}

		if (seg == "thelly12") {
			append("You pull his panting maw up and kiss it, tasting yourself. He drops his tongue-wiggling immediately, allowing yours to dominate his, too overwhelmed to do anything but suck more.\n\nMarei skips down the pier stairs. \"Score,\" he says, looking down at you both amusedly.\n\nHe's got a bright cyan bottle of Glowberry Wine in one paw and Som's wrist in another.\n\n\"This,\" Marei says, one finger peeled off the wine bottle to point at Som, \"<!i>this<!i> is a prime example of wasted potential. He tried to stop me. Stealing is wrong, he says. Can you believe it? A boy this cute should be on the streetcorner, ass up, face against the pavement. Just look at those hips!\"\n\nYou look at Som's curvy hips. Way too curvy for a "+(isActive("Pastel Ring")?"six":"twelve")+"-year-old boy, and made to look even curvier for being attached to such a small body.\n\n\"Look at that tiny cock!\"\n\nSom covers his cocklet with both paws. \"Shut u—\"\n\n\"And look at this <!i>cute ass!<!i>\"\n\nMarei spins him around and forces him to bend over, showing you and Thelly his little woolen bubblebutt. The cat tucks two fingers from each paw deep into his tiny crevice and yanks it open, showing you that his hole is packed with toys: two sparkle-pattern six-inchers and a fat string of beads.\n\nSom's poof-tail quivers in the sea breeze, but otherwise he makes no movement. He just stands there, silent, and shows everyone his twitchy butt.\n\nThelly seems a little jealous. He reaches down and fingers his own butt. It's nowhere near as gaped as Som's.");
			addChoice("Those <!i>are<!i> some cute hips...", theFloatillery.bind("thelly14"));
			addChoice("That <!i>is<!i> a cute cock...", theFloatillery.bind("thelly14"));
			addChoice("That <!i>is<!i> a cute ass...", theFloatillery.bind("thelly14"));
			if (data.metSom > 0)
			addChoice("Hello again, Som!", function() {
				theFloatillery("thelly13");
				append("\"Hi,\" he says, blushing over his shoulder. His tight little lambcunt clenches down on all the toys, pooching them out a little.\n\nMarei shakes his head and <!i>thwaps<!i> Som across the buttcheek with his half-chub. \"I'm surprised you can speak with all those toys putting pressure on your diaphragm, fucktoy.\"\n\n\"I'm not a f-fucktoy...\"\n\n\"Yes you are.\"");
				addChoice("That's a bit harsh.", theFloatillery.bind("thelly14"));
				addChoice("You're kinda fucktoyish, Som, admit it.", theFloatillery.bind("thelly14"));
			});
			addChoice("Yay! Let's see some boy on boy action!", function() {
				theFloatillery("thelly13");
				append("Thelly pouts. \"Bet he gets plenty of action already...\"\n\n\"Nonsense,\" Marei spits— literally, onto Som's butt. \"He's a shut-in nerd.\"\n\n\"HEY!\"");
				addChoice("Pretty sexy for a nerd~", theFloatillery.bind("thelly14"));
			});
			addChoice("You can't just kidnap a Floatillery employee like that, Marei.", function() {
				theFloatillery("thelly13");
				append("\"Kidnap? What? Kids were born to be napped. Especially kids as fuckable as these two. And, besides, I own the Apothecary, and the Apothecary owns the Floatillery. I can take whatever I want.\"");
				addChoice("... They <!i>are<!i> pretty fuckable.", theFloatillery.bind("thelly14"));
			});
		}

		if (seg == "thelly14") {
			append("\"Stop objectifying me!\" Som squeaks. He doesn't sound very convincing with his butt still proudly on display.\n\n\"Thelly,\" Marei says, switching focus. \"Are you a boy?\"\n\n\"Nosir,\" Thelly rushes to say. \"I'm a sex object— femboy cubs aren't boys or cubs at all, they're j-just... we're just fun-sized fucktoys.\"\n\n\"That's right. So we're not objectifying you, Som. You're a cute boy, and that means you already <!i>are<!i> an object.\"");
			addChoice("Mkay, come on. Let him go.", theFloatillery.bind("thellyletgo"));
			addChoice("They're right, Som, they really are. <3", theFloatillery.bind("thellyright"));
		}

		if (seg == "thellyletgo") {
			append("Marei lets go.\n\nSom stumbles forward, almost losing his toys, then composes himself, re-clenches his buttcheeks, and spins around. \"I'm...! I'm not going anywhere!\"\n\n\"Oh?\" Marei says, licking a paw. \"You wanna stay and be our sex object?\"\n\nSom bites back a retort. \"No... I'm... if you're gonna steal that wine, I should at least stick around and bring the bottle back... for recycling...\"");
			addChoice("Speaking of wine, let's pop the cork!", theFloatillery.bind("thelly15"));
		}

		if (seg == "thellyright") {
			append("Som wiggles free and covers his cocklet, eyes full of concern. He doesn't look at you or Marei, but at Thelly.\n\n\"I've done a little degradation stuff in private with Rox, but... Thelly... hanging out with this city cat... claiming you're a 'fun-sized fucktoy' in the middle of the beach...? What happened to hiding in bathrooms?\"\n\nThelly shrugs, still not looking at him. \"I'm quitting the urinal job. I wanna... I wanna wander around and whore myself. Marei and I just finished up confession practice the other day, and I um... I got a lot of experience admitting what I am to crowds. With a little sweetgrass, or a little wine— I open right up. To anyone. For anyone.\"");
			addChoice("Speaking of wine, let's pop the cork!", theFloatillery.bind("thelly15"));
		}

		if (seg == "thelly15") {
			append("Som rolls his eyes and turns away.\n\n\"Stay or don't,\" Marei says to him, then he turns and lovingly feeds the neck of the bottle into Thelly's maw. \"Bite down, my little wine opener.\"\n\nThelly sinks his canines in. Marei pulls the bottle back, and— <!i>pop<!i>, wine splashes everywhere, most of it spilling around the cork and pooling in Thelly's maw, the rest pouring wet and shiny over his flat boychest.\n\n\"Let's get this pup wasted~!\" Marei mewls, making Thelly kiss the bottle's open mouth.\n\nHe tilts it up, nice and slow. Thelly gulps down five obedient mouthfuls.\n\nAfter that, Marei peels the bottle away from his lips and offers it to you. A strand of puppy saliva still clings to the rim.\n\n\"Want some?\"");
			addChoice("Sip.", theFloatillery.bind("thellysip"));
			addChoice("Swig.", theFloatillery.bind("thellyswig"));
			addChoice("Guzzle.", theFloatillery.bind("thellyguzzle"));
		}

		if (seg == "thellysip") {
			append("You take a dainty little sip. The flavor of Thelly's maw overpowers the flavor of the wine. You lock eyes with him and drag your tongue around the rim.");
			addChoice("Mmm~!", theFloatillery.bind("thelly16"));
		}

		if (seg == "thellyswig") {
			append("You take a hearty swig! The flavor of Thelly mingles well with the wine.");
			addChoice("Mmm~!", theFloatillery.bind("thelly16"));
		}

		if (seg == "thellyguzzle") {
			append("You deepthroat the neck of the bottle and pour a shitload down your throat. Som and Thelly watch awkwardly, clearly wishing you were forcing them to deepthroat wine, but Marei is having none of that shit— before you can take more than a quarter off the top he yanks the bottle from you.\n\n\""+(data.bankSnaggAbuse>1?"You should spend a little less time with Snagg, in my opinion.":"Hey. Don't be greedy.")+"\"");
			addChoice("Mmmnn... darn... (Burp.)", theFloatillery.bind("thelly16"));
		}

		if (seg == "thelly16") {
			append("Next up is Som, if the bottle's going clockwise. Marei holds it out to him and swirls the sparkling liquid inside all tantilizingly.\n\nSom scooches closer and reaches for it. Marei completely ignores his reaching and places a few fingers beneath the lamb's chin, bottle pre-tilted at the ready. \"Open.\"\n\n\"Quit your dom stuff,\" he snaps. \"I don't wanna get bottle-fed... I can drink it myself.\"\n\nMarei shrugs and hands it to him.\n\nHe takes a few brave gulps and sits back on his heels, pulling air through his teeth. \"Agh... how can anyone chug this this stuff...?\"\n\n\"It doesh help to have it poured down your throat againsht your will,\" Thelly comments, already loosened way up with the combination of sweetgrass and alcohol. He's laying back in your lap, legs crossed. The leg on top comes over just far enough to cover his nuts, but it can't even hope to hide the massive boner that reaches right up to his belly button.");
			addChoice("Time for drunken orgy? <3", theFloatillery.bind("thelly17"));
		}

		if (seg == "thelly17") {
			append("Finally, Marei takes his turn, sucking five slow gulps from the bottle. \"Ahhhh... what an idea. I could go for a foursome.\"\n\nThelly looks up at you with a sloppy, upside-down smile. \"You really wanna?\"\n\nSom looks forlornly back to his room among the docks and bridges of the Floatillery. \"I'll just watch.\"");
			if (!data.hasCunt) {
				addChoice("Assfuck Thelly.", theFloatillery.bind("thellythelly"));
			} else {
				addChoice("Next!", theFloatillery.bind("thellyorgy"));
			}
		}

		if (seg == "thellythelly") {
			append("\"That's it...\"\n\nMarei helps you set your "+data.thellyName+" up properly on all fours in the sand. \"Aww, doesn't he look just like a feral breeding bitch?\"\n\nMarei slips Thelly's thong around his neck like a collar and wraps it around your hand so you've got some reins on him whenever you need a little stability. Thelly's nervous, you think, underneath the high and the buzz, but the sloppy, slutty gyrations of his hips against yours, and the way his butthole winks and kisses your nuts... you definitely don't think this is the first time he's been fucked in public.\n\nYou line your cock up, hotdogging him.");
			addChoice("Ready?", theFloatillery.bind("thellythelly2"));
		}

		if (seg == "thellythelly2") {
			append("\"Mmmyyynnnghmmm...\" he slurs into the sand. Marei pulls his chin up and smears his fat kittycock all over the boy's face. \""+data.playerName+" asked you a question.\"\n\n\"Mmnn! Yesh!\" he says into Marei's shaft, licking at it. \"Yesh, fuck me... secksh on the beash...\"");
			addChoice("Push in~", theFloatillery.bind("thellythelly3"));
		}

		if (seg == "thellythelly3") {
			append("\"Hnnn..!\"\n\n\"Take it,\" Marei whispers, pushing at the entrance to his mouth while you push at his tiny little pucker. He opens both jaw and legs a little, letting your heads pop inside him... but his core is still clenched, and no matter how hard Marei thrusts he won't let that catcock down his throat.\n\n\"No barbsh,\" Thelly says.\n\nMarei blinks and unplugs. \"Oh. Right. Sorry.\"\n\n... He scoots back and tickles Som, who really doesn't appreciate being tickled at all.");
			addChoice("Push in alll the way.", theFloatillery.bind("thellythelly4"));
		}

		if (seg == "thellythelly4") {
			append("\"HnnnnNNNNN..!\"\n\nYou feed your little "+data.thellyName+"'s butt the whole thing all at once, forcing his body flat against the sand. You tug tight on his thong collar, yanking his ass back firm against your crotch. His tiny boynuts bump up against your big adult ones.\n\nJust as Marei commanded, Thelly takes it. He's squirming, spewing precum, and barely holding back a yowl, but he's taking it.");
			addChoice("Pound the puppy.", theFloatillery.bind("thellythelly5"));
		}

		if (seg == "thellythelly5") {
			append("You take it slow for a bit. You can tell from his nervous ass-clenches that he hasn't been fucked this deep in a while. Every time you push in further you feel some new, warm part of him shift aside to let your cock in, as if his body is conspiring against him to be a cocksleeve first and Thelly second. You pull his head up with your grip on the thongstring, which almost snaps from the strain, and spiderman kiss him while you beat his ass with your hips, sucking the periodic boymoans up and out of his throat~\n\nIf you look over your shoulder you can see a little trail in the sand: two big tracks where your thighs have been gyrating, and two smaller divots where Thelly's knees have been straining to keep his ass up and exposed for you. You notice that the more recent divots are deeper... you guess you've been fucking him harder and harder into the beach over time.\n\n... Wait. Now that you recognize this pattern, you see it everywhere. The shore isn't naturally bumpy because wind or footsteps or whatever, it's covered with thighmarks and kneemarks from hundreds of people fucking doggy style.\n\nYou feel a bit sentimental, as if taking part in a Bright Forest tradition.");
			addChoice("Stop musing to myself and start cumming.", theFloatillery.bind("thellythelly6"));
		}

		if (seg == "thellythelly6") {
			cumEffect();
			append("Okay, but it takes you forever to get there. You have to pull out and fight the whiskey dick with a few quick strokes now and then. At one point even Som gets impatient and leans down, wobbling slightly, to kiss Thelly's drooling mouth. Both boys blush, distinctly aware of the two adults currently getting off on how gaydorable they are.\n\nOnce you arrive at the door of your orgasm, you don't even knock— you just kick it down and start shooting, shotgun-thrusting Thelly into a blabbering mess (shotgun-thrusting is when you thrust really fast each time, but the thrusts are spaced out to match your "+(isActive("Mood Ring")?getMood("You"):"")+" cum spurts), making him shiver and dislodge a few grains of sand that've stuck to his sweaty bits.\n\nCum overflows from his abused hole. It pools in the sand, turning it to sticky mud. It pours over his clenched-up nuts. He's humping too, going forward whenever you pull back.\n\nYou squeeze out your last few droplets and get ready to unplug, but he's only just hit his moany, ears-folded-back orgasm: his hole flexes shut on your softening, sensitive dick, and just below it he pumps a little mound of sand full of his own "+(isActive("Mood Ring")?getMood("Thelly"):"")+"cum.");
			addChoice("Ahhh... begin the orgy~", theFloatillery.bind("thellyorgy"));
		}

		if (seg == "thellyorgy") {
			append("Som caves within the first two passings-round of the glowberry wine: he yanks all the toys from his ass and bumps it up against Thelly's cum-drooling hole, scissoring like a passionate lesbian. You had no idea what he was doing at the time, but later on Marei drunkenly explains to you that sometimes, when two cub boys love each other very much, and when both of them feel ultra gay, they'll start to grind their bare buttholes together. He says it's called anal tribadism, or just tribbing. Apparently Lana is to blame for the terminology.\n\nNaturally, with everyone being drunk, there's a lot of clear urine to be urinated, and Marei absolutely forbids anyone from wading partway into the ocean to relieve themselves.\n\nWhen Som first tries to sneak off and pee, Marei grabs him by his ankle and drags the lamblet back into the orgy. \"Where're ya goin?\" he slurs. \"We godda perfect urinal right here...\"\n\nHe peels Thelly's maw open, one paw on the boy's chin, the other yanking his snout up, and lets Som aim his cute lil flaccid lambcock right at the back of his throat. \"Bonush points if you hit the uvula...\"");
			if (data.hasCock || data.hasBoth) addChoice("Fuck anyone! Fuck everyone! Guzzle wine! BEACH PICNIC YEAAahhh", theFloatillery.bind("thellyorgy2"));
			addChoice("Pee in Thelly's maw too!!", theFloatillery.bind("thellyorgypeeface"));
		}

		if (seg == "thellyorgypeeface") {
			append("You grab him by his ears and piss all over his face, unable to keep your aim steady. He laps it up, gasping thank-yous, eyes rolled back, cocklet leaking pre everywhere.");
			addChoice("Good "+data.thellyName+". Okay now go wild!", theFloatillery.bind("thellyorgy2"));
		}

		if (seg == "thellyorgy2") {
			append("Your cock finds its way up Som's little ass for a few quick, deep thrusts, then it wanders back up Thelly's for eighteen more— heck, Marei even flops over in the chaos and gives you a vicious handjob when the whiskey dick comes back with a vengeance.\n\nWhenever you can't find a hole to fuck you simply grind your dick against whatever's warm and smooth nearby. That usually turns out to be a boy's tummy, or one of his buttcheeks, or his face... sometimes you get false alarms and start fucking a hole only to realize it's actually the back of someone's knee or the mouth of the empty wine bottle...\n\nThings are getting too blurry to describe? You think that might be Som bouncing his face off Thelly's crotch... you're not sure what that other thing is, glowing and watching from within the treeline... to your left, there's... you uh...\n\nSorry, you have to wind down.");
			addChoice("Wind down.", theFloatillery.bind("thellywinddown"));
		}

		if (seg == "thellywinddown") {
			addSprite("assets/img/effect/floatillerySign.png").onHover = showToolTipOnCursor.bind("Font: Pixelmix", "");
			append("You come back to your senses a few hours later. The world is still unsteady.\n\nNo, that's just the terrain: you're sitting with your legs off the edge of a slowly bobbing dock.\n\nYou wiggle your toes in the cool ocean water. To your left, Thelly and Som play footsies and share cummy kisses, their bodies lit soft and cartoonish by the glow of the Floatillery's neon motto: FINE SPIRITS, WINES, BREW.\n\n\"I pick "+data.playerName+", now that you're back,\" Marei says, standing separate from the rest of you, one paw firmly clenched on a guard rail. \"Truth or dare?\"");
			addChoice("Truth.", theFloatillery.bind("thellytruth"));
			addChoice("Dare.", theFloatillery.bind("thellydare"));
			addChoice("Oh wait we're playing truth or dare now??", theFloatillery.bind("thellywhat"));
		}

		if (seg == "thellywhat") {
			append("\"We've been playing for half an hour. Mynt was auto-pilotting you because your player character was too wasted to actually perform typed actions.\"\n\n\"She denied all the crazy dares we gave you,\" Thelly says mischeviously, \"to protect your honor~\"\n\n\"Only those two gave you dares,\" Som pouts. \"Frankly I thought it was a little rude. Like drawing penises on a sleeping "+pickByGender("dude", "girl", "person")+"'s face.\"");
			addChoice("I see. Truth.", theFloatillery.bind("thellytruth"));
			addChoice("Got it. Dare.", theFloatillery.bind("thellydare"));
			addChoice("What?! Fuckin catface stealing my character. Dare.", theFloatillery.bind("thellydare"));
		}

		if (seg == "thellytruth") {
			append("\"What's your favorite place so far?\"");
			addChoice("Bright Forest.", theFloatillery.bind("thellyBF"), {enabled: data.bfIntroDone});
			addChoice("Junk City.", theFloatillery.bind("thellyJC"), {enabled: data.jcIntroDone});
			addChoice("Violet Meteorite.", theFloatillery.bind("thellyVM"), {enabled: data.vmIntroDone});
			addChoice("Wherever Mynt is.", theFloatillery.bind("thellymynt"));
		}

		if (seg == "thellyBF") {
			append("\"It's nice and quiet here, isn't it?\" Som says, playing up his soft lamb voice.\n\nThelly shrugs. \"Sometimes you need to have your comfort zone pushed...\"\n\n\"What you're really saying is 'sometimes you need random men to rape you on the streetcorner.'\"\n\n\"No.\" Thelly places a gentle paw on Som's thigh. \"You need big city events, parties, a job in a busy place. You need a reason to leave the house.\"");
			addChoice("...", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellyJC") {
			append("\"Fuck yeah,\" Marei purrs. \"You ever get murderfucked by that trash elemental? God, I'd feed it cubs day and night if I had the free time...\"\n\nSom cringes. \"Can you not?\"");
			if (data.journalEntries.indexOf("Trash can goobeast") == -1)
				addChoice("Not sure what you're talking about.", theFloatillery.bind("thellyend"))
			else
				addChoice("Oh I love that trash demon thing!", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellyVM") {
			append("\"Much rather soak my ass in a hot spring than a cold ocean.\"\n\n\"It's not cold,\" Som says. \"It's refreshing. My toes always get so sweaty when I have sex... I curl them a lot...\"\n\n\"Don't be so self-conscious,\" Thelly says, kissing his neck. \"Sweaty toes are cute.\"");
			addChoice("I love sweaty toes.", theFloatillery.bind("thellyend"));
			addChoice("I love cold water.", theFloatillery.bind("thellyend"));
			addChoice("I love hot springs.", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellymynt") {
			append("\"Where is she, anyway?\" Thelly asks around a mouthful of Som tongue.\n\n\"Outside the game,\" Marei says. \"Up in the sky.\"");
			addChoice("I love skies.", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellydare") {
			append("\"Humans are basically hairless monkeys, right?\" Marei asks rhetorically. \"Well, I dare you to type <!b>I'm a cute little hairless baboon-butt monkeyslut~!<!b> into your prompt.\"");
			addChoice("No.", theFloatillery.bind("thellydareno"));
			addChoice("... I'm a cute little hairless baboon-butt monkeyslut.", theFloatillery.bind("thellydare2"));
		}

		if (seg == "thellydareno") {
			append("\"Awww, come on.\"");
			addChoice("Still no.", theFloatillery.bind("thellydareno2"));
			addChoice("I'm not a hairless monkey.", theFloatillery.bind("thellydareno2"));
			addChoice("Well. Alright... I'm a cute little hairless baboon-butt monkeyslut...", theFloatillery.bind("thellydare2"));
		}

		if (seg == "thellydareno2") {
			append("\"I'm not racist against humans, I swear. Think of all the times I've called Thelly names involving his species. Puppyslut, puppywhore, pisspup, fuckpupp—\"\n\n\"Okay "+pickByGender("he gets", "she gets", "they get")+" it!\" Thelly squeaks, hiding his boner.");
			addChoice("I am <!i>not<!i> a hairless monkey.", theFloatillery.bind("thellydareno3"));
			addChoice("Well. Alright... I'm a cute little hairless baboon-butt monkeyslut...", theFloatillery.bind("thellydare2"));
		}

		if (seg == "thellydareno3") {
			append("\"Alright, alright... poor sport...\"");
			addChoice(":/", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellydare2") {
			append("\"You forgot the '~!' part.\"");
			addChoice("Auugh. I'm a cute little hairless baboon-butt monkeyslut<!b>~!<!b>", theFloatillery.bind("thellydareno3"));
			addChoice("Fuck you I already said it okay who's up next.", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellydare3") {
			append("Marei licks his lips. \"I bet you are, too. Sitting at that computer... pants down, probably, "+pickByGenitals("bottle of lube", "maybe a toy or two inside", "bottle of lube")+"...\"");
			addChoice("Let's just keep the ball rolling here, monkeyfucker.", theFloatillery.bind("thellyend"));
			addChoice("Who's next? ;3", theFloatillery.bind("thellyend"));
		}

		if (seg == "thellyend") {
			append("\"Mkay, you're up.\"");
			addChoice("Truth or dare, Som?", theFloatillery.bind(pickOne(["thellysomtruth", "thellysomdare"])));
		}

		if (seg == "thellysomtruth") {
			append("Som gets startled by his own name. \"Me? Oh... I'm a little scared of your imagination. I'll pick truth.\"\n\n\"Pussy,\" Marei whispers to Thelly. They titter at Som together while he glares at them both.");
			if (data.metKemp > 0)
				addChoice("Are you related to Kemp?", theFloatillery.bind("thellysomtruth2"))
			else
				addChoice("Would you still rather be in your room than hanging out with us?", theFloatillery.bind("thellysomtruth2"));
		}

		if (seg == "thellysomtruth2") {
			append("He looks at the water.\n\n\"Well, that's... yeah no. Not anymore.\"");
			addChoice("Your turn.", theFloatillery.bind("thellysom"));
		}

		if (seg == "thellysomdare") {
			append("He musters up all the meager lambling courage he possibly can: \"Dare.\"\n\nMarei and Thelly go <!i>oooOooOoooOOOOooo<!i> in the background.");
			addChoice("I dare you to lick Thelly's butt.", theFloatillery.bind("thellybuttlick"));
			addChoice("I dare you to jump in that refreshing, chilly water.", theFloatillery.bind("thellyjump"));
		}

		if (seg == "thellybuttlick") {
			append("Thelly's on all fours in a flash, ass up and spread.\n\n\"Oh God,\" Som squeaks. \"I'm not into scat—\"\n\n\"I'm clean,\" Thelly says, actually a little upset that it was even something Som worried about. \"Just some leftover cum, maybe...\"\n\nSom hesitates, still. He inches forward. He sticks his tongue out, letting it hover just above your "+data.thellyName+"'s pucker.\n\n... Then he dives in and gives it one quick slurp. A little white hangs off his bottom lip. He slurps that up too.\n\n\"There. Happy?\"");
			addChoice("Very. :3 Your turn!", theFloatillery.bind("thellysom"));
			addChoice("Did it taste good?", theFloatillery.bind("thellybuttlick2"));
		}

		if (seg == "thellybuttlick2") {
			append("\"You're gross.\"");
			addChoice("Very. :3 Your turn!", theFloatillery.bind("thellysom"));
			addChoice("I'm not the one who just licked a butt. Your turn!", theFloatillery.bind("thellysom"));
		}

		if (seg == "thellyjump") {
			append("\"I uh... I can't swim.\"\n\n\"Much to Lana's regret,\" Marei says.");
			addChoice("What's that mean?", theFloatillery.bind("thellyjump2"));
			addChoice("Oh. Um. Nevermind, your turn.", theFloatillery.bind("thellysom"));
		}

		if (seg == "thellyjump2") {
			append("\"I wanted to go instead of Lana,\" Som says. \"On the voyage. The shipwreck. We both wanted to <!i>Surpass the limits of the universe for SCIENCE!<!i>, y'know, but um...\"\n\nMarei puts it bluntly: \"Lana knew how to swim. Better chance of survival.\"");
			addChoice("... I see. Your turn.", theFloatillery.bind("thellysom"));
		}

		if (seg == "thellysom") {
			append("\"Marei.\" Som points a little finger at him. \"Truth or dare?\"\n\nMarei adjusts his Pastel Ring earring, spinning it a little in its socket. \"I know what you're going to ask if I say truth.\"\n\n\"Yeah?\"\n\n\"You've been itching to ask me for twenty years.\"\n\nSom fiddles with his glasses. \"Have I?\"\n\nThelly looks confused from one to the other. \"You two already know each other? I thought he was just some random bo—\"\n\n\"Shush, jealous pisspup. Your master is talking.\"\n\n\"Yes! Sorry...\"\n\nMarei ploughs on, stepping a little closer to Som but not taking his hand off the railing. \"If you're gonna ask me, be up front about it.\"\n\nSom lowers his eyes.\n\n\"... I don't want to pressure you... and I don't wanna make you feel awkward in front of "+data.playerName+" and Thelly, I just... I can't wait any longer. Please. Please tell me why.\"\n\nMarei takes him by the chin. \"Okay. Truth.\"");
			addChoice(":O", theFloatillery.bind("thellysom2"));
		}

		if (seg == "thellysom2") {
			append("Som tugs his chin away. His big lamb eyes are wide open and hungry for information. \"Why aren't you... y'know... <!i>hurt?<!i>\"\n\nMarei lifts an eyebrow. \"Oh, I'm very hurt. I'm hurt that you would try and conceal the meaning of this conversation from "+data.playerName+" and Thelly behind vagueness. Ask up-front and in context, so they can understand. It's the pinnacle of rudeness not to pass secret codes back and forth under other people's noses, you know.\"\n\n(Thelly looks at you pleadingly, as if you might know any more about what's going on between these two than he does.)\n\nSom takes a breath and exposits: \"Why aren't you hurt from the shipwreck? Red lost her mind. John lost his libido. Lana lost his paws and his voice. But you... you're fine.\"");
			addChoice("...", theFloatillery.bind("thellysom3"));
		}

		if (seg == "thellysom3") {
			append("\"And how were the others hurt?\" Marei guides him. \"You wrote the report. You know what happened. These two don't.\"");
			addChoice("...", theFloatillery.bind("thellysom4"));
		}

		if (seg == "thellysom4") {
			append("\"All three were physically or mentally glitched,\" Som explains, talking to you and Thelly but not taking his eyes off Marei. \"We're functions. We take in sight, sound, smell parameters from the world and return actions. But when we leave the map, there is no world to take in, right? It's null. If we sense nullness, a little chunk of it gets lodged in our minds or bodies and that one broken piece makes the whole stack unwind.\n\nJohn landed crotch-first. Lana's hands and mouth landed at the same time. And Red, she uh... she didn't even have to land. She just stared down as she fell, let it soak in... and that was enough. Right?\"\n\n\"Right. And then there's me.\"\n\nSom leans forward, trying hard to focus past the residual blur of alcohol still lingering in his parameters.\n\n\"Marei... you didn't even <!i>touch<!i> it? How's that possible? Why aren't you hurt?\"");
			addChoice("...", theFloatillery.bind("thellysom5"));
		}

		if (seg == "thellysom5") {
			append("\"I am hurt.\n\nI lose control of my location at random. I can't get to anywhere I want to go without wandering for two months first. I wake up on beaches and call my boysluts over for training sessions because I need company and I can't go and find it without getting lost alone again.\n\nAs far as anyone in here knows, my name is Marei Mauez. Reverse the two last letters and you get Mauze, Septrica's surname. So what if I was Marie before the shipwreck? Did I used to be a girl, then? How many other parts of me have been retconned without my knowledge?\"\n\nThelly stares at Marei's hips. \"H-He.. he does have a girl's frame, doesn't he...?\"\n\n\"Okay— sorry, I didn't know— you <!i>are<!i> hurt,\" Som says, ignoring the "+data.thellyName+" on his right. \"Then— if I'm allowed a follow-up question—\"\n\n\"I guess so. You'll probably ask me anyway.\"\n\nSom's ravenous curiosity adds a bite to his tone: \"Why aren't you <!i>physically or mentally<!i> hurt?\"");
			addChoice("...", theFloatillery.bind("thellysom6"));
		}

		if (seg == "thellysom6") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/boundMarei.png");
			s.x = GAME_WIDTH-s.width*1.2;
			s.y = GAME_HEIGHT-s.height;
			s.alpha = 0;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			tween(s, {alpha: 1}, 20, {ease: QUAD_OUT, onComplete: function() {
					s.applyGlitchEffect();
				}
			});

			append("\"Because Septrica prevented it.\n\nShe boarded the ship just before we took off. She was carrying something under her jacket— folded black latex.\n\nIt was a sensory deprivation suit she made out of an old bondage piece. She helped me into it. She told me it was going to be okay— there was no way for the void to get at me from in there. I wouldn't feel anything. Not even the impact.\n\nJust before she zipped the arms behind my back, she pierced the crook of my elbow with a syringe and squeezed.\n\n'And if you do feel something,' she told me, 'it'll only be a dream.'\"");
			addChoice("Jeez.", theFloatillery.bind("thellysom7"));
		}

		if (seg == "thellysom7") {
			append("Som pulls his feet from the water, droplets pit-pattering on the dock. He trots forward, shyly, and slips both arms around Marei's waist.\n\n\"I knew it. I knew it was her fault.\"\n\n\"Fuck faults,\" Marei scoffs. \"At least I'm sane and able-bodied. I don't blame anyone but myself.\"\n\nSom hugs Marei's fat, girly hips so tight that his catcock squishes audibly against the little tuft of wool on Som's chest, stray cumglobs squeezing out from the cockslit.\n\n\"I'm sorry, anyway— and thank you for telling me.\"\n\n\"Yeah, whatever. I wanted to let you know right away in exchange for lamb boi buttsex or some dumb shit, but she asked me not to tell anyone.\"");
			addChoice("Then why are you telling us now?", theFloatillery.bind("thellysom7a"));
		}

		if (seg == "thellysom7a") {
			append("\"Now that you're here,\" Marei mewls, grinding softly into Som's hug, \"I think we should all be as truthful as we possibly can.\"");
			addChoice("I see. :o", theFloatillery.bind("thellysom8"));
		}

		if (seg == "thellysom8") {
			append("Thelly giggles and pulls his feet from the water too. They're a little red from all the outback high-heeling he's been doing. \"So that's why you called me out here for 'whore practice.'\"\n\n\"Oh no, whore practice is a very serious regiment which you should adhere to whether or not I'm lonely, pisspup. Never doubt that you're a subpar whore who needs more training and, while you're at it, never doubt that all whores are subpar by definition.\"\n\n\"A-Ah, thank you,\" Thelly mumbles huskily, then adds: \"Whose turn is it?\"");
			addChoice("Yours.", theFloatillery.bind("thellysom9"));
		}

		if (seg == "thellysom9") {
			append("\"Oh...\"\n\nHe looks from Som to Marei to you.\n\n\"... Who do I ask?\"");
			addChoice("Me.", theFloatillery.bind("thellysom10"));
			addChoice("Whoever you want?", theFloatillery.bind("thellysom10"));
		}

		if (seg == "thellysom10") {
			append("His tail swishes happily.\n\n\"Ehe. Alright. Truth or dare?\"");
			addChoice("Truth.", theFloatillery.bind("thellyendtruth"));
			addChoice("Dare.", theFloatillery.bind("thellyenddare"));
		}

		if (seg == "thellyendtruth") {
			append("<!14px>\"Did you have fun with us~?\"\n\n<!14px><!10px>\"Nooo, you're wasting a good chance for info about the upper world!\" Som whines under his breath.\n\n\"Nooo, you're wasting a good chance for info about monkey butts!\" Marei whines under his breath.\n\n<!10px>");
			addChoice("Yes!", theFloatillery.bind("thellyendtrue"));
			addChoice("It was alright.", theFloatillery.bind("thellyendtrue"));
			addChoice("No, getting wrangled into a drunken orgy with three femmy guys was absolutely horrible.", theFloatillery.bind("thellyendtrue"));
		}

		if (seg == "thellyenddare") {
			append("<!14px>\"Dare you to... um... show me your butt, if you're okay with that?\"\n\nMarei pinches the bridge of his nose.\n\n<!14px><!10px>\"Sober and right back to square one...\"<!10px>");
			addChoice("Show him my butt.", theFloatillery.bind("thellyenddare2"));
			addChoice("I'm using a chicken for this one.", theFloatillery.bind("thellyenddarechick"));
		}

		if (seg == "thellyenddarechick") {
			append("\"A what?\"\n\n... The other two are equally confused. You guess they have a pretty barebones understanding of truth or dare.");
			addChoice("Nevermind.", theFloatillery.bind("thellyendtrue"));
		}

		if (seg == "thellyenddare2") {
			append("You turn around and place your palms on your thighs, sliding them down, down, down, til you're completely bent over and your asshole winks right in his cute little "+data.thellyName+" face~\n\n\"O-Oh,\" he squeaks, peeling your buttcheeks apart to get a better look at it. \"Thank you... it's a very nice butt.\"");
			addChoice("You're welcome.", theFloatillery.bind("thellyendtrue"));
			addChoice("Anytime.", theFloatillery.bind("thellyendtrue"));
			addChoice("Grab his face and make him suck my butthole.", theFloatillery.bind("thellyenddare3"));
		}

		if (seg == "thellyenddare3") {
			append("Your fingers curl tight around the back of his head as you coax him forward, feeling his cool little snout press tight to your donut and slip partially inside...\n\nA noise comes from the distillery building at the end of the dock. Everyone freezes.");
			addChoice("!!", theFloatillery.bind("thellyendtrue"));
		}

		if (seg == "thellyendtrue") {
			append("A disgruntled employee barges out of the distillery doors, her tits swinging with wild rage. \"HEY! THIS IS A PRIVATE DOCK!\"\n\nSom books it down a swinging bridge. \"Fuck! I'm gonna get fired! I'm gonna get fired!\"\n\nThelly swan-dives into the water and curves back towards shore, breaststroking excellently.\n\nMarei pats you on the shoulder with one paw, keeping the other held tight to the railing.\n\n\"I'M GONNA THROW YOU FUCKERS IN THE DRINK!\" the employee shouts, gaining.\n\nMarei goes white, but his voice is calm. \"Don't worry about her. Like I said, I'm a higher-up. I'll just pull a couple stri—\"\n\n...\n\nHe glitched out and disappeared.");
			addChoice("Shit! Move along!", BrightForest.brightForestHub);
		}
	}

	public static function somDom(seg:String):Void {
		saveCheckpoint("TheFloatillery.somDom('"+seg+"');");
		clear();
		
		if (seg == "1") {
			data.somDomDone = true;
			unlockJournal("Som Dom");
			append("Som's shop says CLOSED.");
			addChoice("Go in anyway.", somDom.bind("2"), {kinks: ["Cub", "Male", "Abuse", "Abuse", "Abuse"]});
		}

		if (seg == "2") {
			append("Som lays on his twin-sized bed in the far corner of the room, totally naked. His pale wool glows in the light from the screen of the AUTO-MYNT you brought him. He's got one of his two Floatillery phones on each ear, switching back and forth.\n\n\"Yes,\" he says. \""+pickByGender("He", "She", "They")+" took it. I'll show "+pickByGender("him", "her", "them")+" the truth once they decode my—\"\n\nHe interrupts himself when he sees you. \"I'll get back to you.\"");

			addChoice("Who was that?", somDom.bind("3"));
		}

		if (seg == "3") {
			append("\"Um— my manager. Don't worry about it.\"");
			addChoice("You talkin shit behind my back, lamb?", somDom.bind("4"));
		}

		if (seg == "4") {
			append("He blushes angrily. \"No!\"");
			addChoice("Alriiight. Well, do you wanna dom me and talk shit to my face? c:", somDom.bind("5"));
		}

		if (seg == "5") {
			append("He blinks.\n\nHe looks so cute and innocent, sitting on his little bed, with his cocklet hanging out in the dim blue light, and that big chunky computer nestled between his thighs. \"Well...\"");
			addChoice("Are you in the mood for it?", somDom.bind("6"));
		}

		if (seg == "6") {
			append("Som looks over the screwdrivers, circuit boards, detached pieces of AUTO-MYNT casing, dildos, and the shiny myriad puddle of nuts and screws so encroached in his blankets and sheets that you could swear you see a few glittering pieces of metal riding up the very top of his asscrack. He sighs, long and deep, and his tummy deflates.\n\n\"I promised myself I wouldn't, but...\"");
			addChoice("Wouldn't what~?", somDom.bind("7"));
		}

		if (seg == "7") {
			append("\"I promised myself I'd never dom again. Bad experiences.\"");
			addChoice("But? (Sit on his bed and rub his toes.)", somDom.bind("8"));
		}

		if (seg == "8") {
			append("You scoot your ass up on the end of the bed that isn't drowning in tech and pinch the big toe on his left foot. He squeaks and pulls it back, all ticklish, but with a bit of persistence, you coax him into comfort and start giving his toe a fingerjob, like it's a tiny cock.\n\n\"But... everything has just been so stressful, since you showed up...\"");
			addChoice("Ahhhh. So what you're trying to say is you want to dom the fuck outta me, to relieve all that stress, right?", somDom.bind("9"));
		}

		if (seg == "9") {
			append("\"Maybe,\" he smiles. \"But I really shouldn't degrade you. I get a little too into it.\"");
			addChoice("What if I want you to get a little too into it. >:3", somDom.bind("10"));
		}

		if (seg == "10") {
			append("He splays his little boi toes and nudges the rest of your fingers with them, asking for attention. You kinda thought he had hoof feet, but maybe not... these toes are so soft, round... excruciatingly wooly... you slip your fingertips between them and rub back and forth slowly, massaging the sensitive crevices where they meet the sole.\n\n\"I'm not sure if I should even say what I'm about to say.\"");
			addChoice("Hmm? Come on, no namecall is too degrading for me~", somDom.bind("11"));
		}

		if (seg == "11") {
			append("\"You don't understand at all,\" he says, wiggling his toes all cutely. \"I used to be a psychopath.\"");
			addChoice("... Used to be...?", somDom.bind("12"));
		}

		if (seg == "12") {
			append("\"It was only a bug. Wendy patched it out.\"");
			addChoice("Still, that's a fuck of a bug.", somDom.bind("13"));
		}

		if (seg == "13") {
			append("\"Yeah.\"");
			addChoice("Did you like... were you like a serial killer or...?", somDom.bind("14"));
		}

		if (seg == "14") {
			append("\"Psh, no. The City is full of those! Killing is fine, with the respawn system. Or, at least, it's only a little rude. I was much worse than rude.\"");
			addChoice("You were a serial degrader.", somDom.bind("15"));
		}

		if (seg == "15") {
			append("\"It sounds cute when you put it like that, but...\"");
			addChoice("But you fucked up some people emotionally, yeah, I get it. Still wasn't your fault.", somDom.bind("16"));
		}

		if (seg == "16") {
			append("\"...\"");
			addChoice("You should fuck me up too~ <3", somDom.bind("17"));
		}

		if (seg == "17") {
			append("Som exhales and sinks into himself. He reaches to shut off the AUTO-MYNT's screen, plunging you both into darkness. You half-expect something hateful to seep out of his mouth, a hiss in the gloom, a knife, something psychopathic. But he just says \"Okay\" in a tiny, crushed voice, and scoots down a little further on his bed. His toes slide out of your fingers, up over your wrist, and the sole glides against your palm. His soft little foot grinds over your forearm... then... he plants it on your chest and pins you to the bed.\n\n\"It's almost too late,\" he squeaks. \"I'm getting sucked into the headspace...\"\n\nJust a stripe of his diamond-hard cock is left out of silhouette, illuminated by the thin line of torchlight that leaks under his front door. Likewise, only a sliver of his face is visible, and the edges of his glasses glow demonic orange.\n\nSom's expression twists up with reluctant neediness.\n\n\"Please move along before I effectively rape your feelings.\"");
			addChoice("No. Do it. <3", somDom.bind("18"));
		}

		if (seg == "18") {
			append("Som's little cub body towers over you. Really, he's way curvier than a boy should be— especially when you're looking up from this angle, at the underside of those child-bearing child-hips. They're wide enough to cover your face. Som pants and drools and only barely bites back a moan in the darkness; "+(data.hasBoobs?"between your tits":"on your chest")+", his toes quiver with forbidden excitement. A single drop of pre falls from his cockhead and lands silently on your stomach.\n\nAll you can do is brace yourself and grab two blind handfuls of blankets. He slides his foot down to your belly, smearing his pre droplet. Then he digs his heel right into your belly button.\n\n\"Pedo.\"");
			addChoice("...", somDom.bind("19"));
		}

		if (seg == "19") {
			append("He's not sure if you liked that or not.\n\nSom hesitates for the last time, only for a flicker of the torchlight. Then—");
			addChoice("... I'm sorry...", somDom.bind("rejoin3"));	
			addChoice("... Thank you...", somDom.bind("rejoin3"));
		}

		if (seg == "rejoin3") {
			append("He lifts his foot up. You feel the absence of intense pressure on your diaphragm, the soft warmth of his sole, and it's a huge relief.\n\nThen he spits a huge glob of hot lamb saliva on your belly button and stomps it in full-force, winding you. He smears it into his pre with vicious twists of his heel, like he's trying to grind out a sweetgrass cigarette butt on the concrete. You wheeze and clutch his ankle. His cock shivers with three successive gushes of little boi precum. Surface tension holds it in a bead at the tip. He grabs his cocklet by the base and flicks the pre onto your bare "+(data.hasBoobs?"tits":"chest")+", with a vicious little snicker.\n\n\"God, you're just like Archie. I could see the way you looked at me, you know. I knew you were a pedo from the start. You and him, you're both dis-<!i>gust<!i>-ing.\"\n\nHe punctuates <!i>gust<!i> with another stomp to your belly, a little gentler this time, since you're still squirming so pathetically under his pin while you try to catch your breath from the first one— but still, the stomp is firm enough to make the smeared saliva and pre gush out from between his toes.\n\n\"Come on. Try and say something while my cute little cubby feets crush the air from you.\"");

			addChoice("Something...!", somDom.bind("rejoin4"));	
			addChoice("Please... more...", somDom.bind("rejoin4"));	
			addChoice("Please... stop...", somDom.bind("rejoin4"));	
			addChoice("I'm... sorry...", somDom.bind("rejoin4"));
		}

		if (seg == "rejoin4") {
			append("No matter what you try to say, it just comes out as another breathless squeal.\n\nThe genuine distress of it forces a sliver of his old, self-conscious self to peek through his expression.\n\nThen it disappears.");
			addChoice("Urk...!", somDom.bind("20"));	
		}

		if (seg == "20") {
			append("Som slides his foot downward over your lower belly with a quiet <!i>schlick.<!i> All the pressure is gone now. He lifts his heel, and half his sole peels off of you, connected by thin strands of clear-white fluid. Only the forefoot and toes stay pressed to your flesh. His foot bumps against your "+pickByGenitals("cockhead", "swollen clit", "cockhead")+". That doesn't stop him. He just keeps dragging lower and lower until your "+pickByGenitals("head and shaft", "cuntlips", "head and shaft")+" are forced to slide out of the way, which is painless enough, given the fact that his foot is soaked and dripping with saliva"+pickByGenitals(" and two kinds of precum", ", lamb pre, and your own juices", " and two kinds of precum")+"— but the message it sends is that he doesn't care if your junk is in the way or not, he's gonna steamroll over it either way.\n\nWhen he finally stops, the ball of his heel rests comfortably on your "+pickByGenitals("nuts", "lower cunt", "nuts")+", and he's got your "+pickByGenitals("cockhead", "clitty", "cockhead")+" snugged up nice between his big toe and the next one over.\n\nHis tone is sweet and rotten, like black honey:\n\n\"Be honest, now... does that little foot feel good on your "+pickByGenitals("cock", "cunt", "cock")+"...?\"");
			addChoice("Y-Yes...", somDom.bind("21"));
		}

		if (seg == "21") {
			append("\"Ewww,\" he chides childishly, working his toes up and down around "+pickByGenitals("the rim of your head", "your helpless clit", "the rim of your head")+". His heel rocks back and forth, too, and pressures your sensitive "+pickByGenitals("sack", "lips open", "sack")+" on the downswing. \"Not only are you a gross pedo kiddyfucker who loves little boys— you even have a thing for little boy <!i>feet<!i>~?\"");
			addChoice("Yes...!", somDom.bind("22"));
		}

		if (seg == "22") {
			append("\"Then you won't mind if I let you feel both at once, right?\"");
			addChoice("Ye— wait.", somDom.bind("23"));
		}

		if (seg == "23") {
			append("Looking truly demonic now, with his horn nubs glowing dark orange and his maw curled into an impish smile, Som happily hops up and slams both feet and the weight of his entire body onto your crotch.\n\nYou open your mouth to scream, but only silent air comes out. Your eyes go wide and your vision flickers.\n\nSom hums a happy, innocent tune and wiggles his toes and his calves together, shifting all his weight to one "+pickByGenitals("nut", "side of your labia", "nut")+" to the other, back and forth, up and down, side-to-side...\n\nThe pressure and the pain coalesce into a knot in the pit of your stomach, but— at the same time— you can't help but feel light-headed with the intense, shameful pleasure of being brought to near-orgasm by such a cute, soft set of little boi toes. Som must know this, because he feels your juices leaking out against him, and he leans down (shifting his weight on your sensitive bits once again) to whisper delightedly in your ear:\n\n\"If you want me to get off, then apologize for being a kiddyfucker.\"");
			addChoice("I'm sorry!! I wish I wasn't like this!", somDom.bind("24"));
		}

		if (seg == "24") {
			append("He pouts and repositions his feet to make sure they're crushing every single bit of your junk.\n\n\"That's not a good apology,\" he purrs. \"You have to say it's your fault you're so fucked up, because it is. I bet before you played this game you were just feeding the beast— browsing porn sites non-stop, scrounging up all the grossest, weirdest cub pics you could find. You were, weren't you? Are you a kiddy porn addict~?\"");
			addChoice("No I don't have internet", somDom.bind("25"));
		}

		if (seg == "25") {
			append("\"And what about your dad's hard drive, huh? There's no way Archie didn't save a couple pics... ehehe... he was so flustered after I told him to search 'cub m/m spitroast,' back when he didn't know what it meant...\"");
			addChoice("No he's gone, everyone's gone", somDom.bind("26"));
		}

		if (seg == "26") {
			append("He smiles... but it's not a sadistic smile, or a sarcastic one, it's very genuine.\n\n\"Ah,\" he says. \"So you really are alone down there.\"");
			addChoice("What", somDom.bind("27"));
		}

		if (seg == "27") {
			append("\"I just meant 'Ah, so you really are a pedo loner~!' Have you not been listening? I know it's hard to pay attention when I keep giving your "+pickByGenitals("cock", "cunt", "cock")+" <!i>so<!i>—\" bounce— \"<!i>much<!i>—\" bounce— \"<!i>of<!i>—\" bounce— \"<!i>it.<!i> Hurry up and apologize properly.\"");
			addChoice("im sorry for being a pedo its my fault", somDom.bind("28"));
		}

		if (seg == "28") {
			append("\"That's better~!\"\n\nHe hops off of you, panting, sweating from every crevice on his little body. He runs his paws up over his flat boychest. His fingers detour for a moment into his armpits. Then he feels himself up higher, dragging splayed fingers over his neck, up his cheeks, letting a couple digits tease over those shiny, girly fishlips...\n\nSom clasps one hand on the nape of his neck and slides the other allllll the way back down to his cock. His little body is so sexual, when he treats himself like this, and pushes his hips and belly out to put them on display for you. He feels sexy, too. You know he does. You can see it on his expression, which drips with lust, and you can smell it emnating from him as a powerful lamb cub pheromone. His little tail quivers with excitement as he spreads his legs open a few inches, giving you a great view of his puffy taint and soft, round nutsack, both coated with the slick sheen of sweat... that must be where the pheromones are coming from.\n\n\"You think I'm hot?\" he whispers.\n\nHis fingers curl effortlessly around the base of his cubby cock, which is only about as girthy as a quarter, but the way it's throbbing so violently on the edge of orgasm makes it look like it's so massive he can barely keep a grip on it.");
			addChoice("alright man I'm at my limit here", somDom.bind("29"));
		}

		if (seg == "29") {
			append("Som doesn't give a fuck about your limit.\n\nHe slams his little taint down on your chest and straddles it, jerking off right in your face. Thick strands of pre slop out over your mouth and chin, and his little boynuts flick back and forth so fast they become a blur. His underdeveloped thighs tighten on either side of you, locking you in place. But even that isn't good enough for him. He also has to grab your throat with his little paw and hold your face up to make sure you stare right at the head of his cocklet. He has been completely consumed by his performance.\n\n\"I bet you fucking love watching a "+(isActive("Pastel Ring")?"six":"eight")+"-year-old's dick jiggling back and forth right in front of your face, huh kiddyfucker? You like watching my little nuts bounce?\"\n\nHe takes his hand off his dick for a moment just to squeeze his nutsack as punctuation. A glob of pre splurts out and paints your nose. With one hand still locked to your throat, he throws his hips forward and starts grinding his sweet-scented boydick all over your face.\n\n\"Oh— but this alone can't be all that's getting you off, no, I bet your head's just swimming with sick fantasies about molesting my little ass"+pickByGenitals("", " with a ten-inch strap-on", "")+", pulling my ears, treating me like a girl... you sick fuck..."+(isActive("Pastel Ring")?"\"\n\nHe freezes.\n\n\"You're wearing it, aren't you. I'm six... and I've always been six... but... yep, here it is, you fuckin pervert...\"\n\nHe pulls your wrist up. The Pastel Ring sparkles on your finger. In the background, a single lambfang that pokes out over his lower lip sparkles, too. \"Bet you wish this worked on the little boy Fuckmeat in the City, don't you?\"":"")+"\"\n\nRapturous pleasure overwhelms him. From the tips of his spit-soaked toes to the tips of his fluffy lamb ears, he quivers. He releases his hold on your throat and grabs you by your hair with both hands so he can dry hump your skull into the mattress. His hips surge forward over and over, and his cock and nuts make the cutest noises as they <!i>whap<!i> against your face. It doesn't hurt as bad as getting your belly and junk stomped, but still you feel your nose throb and your cheekbones begin to bruise a little— and he's still gaining momentum, punctuating each word with a thrust:\n\n\"Fucking. Worthless. Scum. Greasy. Child. Molestor. I. Bet. You. Fucking. Love. This.\"");
			addChoice("No seriously stop", somDom.bind("30"));
		}

		if (seg == "30") {
			append("Som pulls his hips back and lines his cock up with your mouth.\n\n\"Shut the fuck up, pedo.\"\n\nHe rams his cocklet down your throat. It's just big enough for his head to punch past your uvula, but not much deeper, so his rapid-fire facefuck ends up beating acutely against your gag reflex and almost nothing else. He's at the very precipice of cumming now, you can taste it on the back of your tongue, and no matter how hard you squirm or squeal or gag there is no stopping it.\n\n\"Choke on that kiddycock— fuck you're repulsive, you know that? I can feel how hard you're gagging on me— you want me to cum that much faster, huh, can't wait for an innocent "+(isActive("Pastel Ring")?"six-year-old to coat your throat with underaged jizz— <!i>only eight years old<!i> and you make me build a ring for you that'll shave another two years off of that?! <!i>Eight<!i> wasn't young enough for you?":"eight-year-old to coat your throat with underaged jizz.")+" I bet you used to chat with all your little pedo buddies on the internet about how fucking rapeable cubs are— you honestly think this could ever be considered <!i>normal,<!i> liking what you like? Gagging and moaning while you deepthroat a little boy's cock, while his nuts grind up on your chin? Yeah, <!i>totally<!i> normal... fucking freak.\"\n\nHis grip tightens. He rams in all the way and hurtles off the deep end.\n\nSom hunches over and smiles at you upside-down.\n\n\"How could any parent ever love a child as fucked up as you? No wonder they left.\"");
			addChoice("                ", somDom.bind("31"));
		}

		if (seg == "31") {
			append("He finishes with a boyish grunt. Hot lambjizz trickles down your battered throat, into your stomach. Even more of it leaks from your nose and the corners of your mouth as he pulls out and squeezes off the last few ropes on your face.\n\nWithin seconds, he slumps off of you and hurries shamefully to the other side of the room on wobbly legs. He takes a towel and dabs his sweaty buttcrack, his armpits, and the gooey mess dripping from his crotch.\n\n\"I'm sorry,\" he squeaks, throat dry. \"I warned you.\"");
			addChoice("                ", somDom.bind("32"));
		}

		if (seg == "32") {
			append("...\n\nYou okay?");
			addChoice("Wipe my face off", somDom.bind("33"));
		}

		if (seg == "33") {
			append("Som sees you laying there, unresponsive, and trots over nervously to hand you a towel.\n\n\"Is a fresh one okay?\" he asks. \"Or, you can use the one I just used, if you want to clean my cum off of it...\"\n\nYou wipe the cub cum from your face and look down at the mess on your palm.");
			addChoice("I'm so fucked up.", somDom.bind("34"));
		}

		if (seg == "34") {
			append("His shoulders sag, and his eyes widen in the torchlight, behind the fading fog of his glasses.\n\n\"No, come on— I warned you I always go too far. All of that was just pretend, alright?\"");
			addChoice("I know, but still.", somDom.bind("rejoin"));
			addChoice("Why am I like this.", somDom.bind("rejoin"));
		}

		if (seg == "rejoin") {
			append("You can tell he wants to say something reassuring and maybe-true, like 'You were born this way' or 'You just fell into a fetish by accident' or 'You don't have to be like this, you can change any time you want,' but he says none of those things.\n\nInstead, he just says \"I don't know.\"");
			addChoice("I want my mom back.", somDom.bind("35"));
		}

		if (seg == "35") {
			append("...\n\nI do too.");
			addChoice("Why are we like this, Mynt?", somDom.bind("36"));
		}

		if (seg == "36") {
			append("I'm... I'm not into cubs.");
			addChoice("Oh.", somDom.bind("37"));
		}

		if (seg == "37") {
			append("I kind of wish I was, though, just so I could comfort you!! :<");
			addChoice("It's fine.", somDom.bind("rejoin2"));	
			addChoice("Let me talk to Som again.", somDom.bind("rejoin2"));
		}

		if (seg == "rejoin2") {
			append("He's hugging you now. His face is buried in your chest, and it's a little warm, but not so warm that you can be sure he's crying. He's squishing his flaccid cock up against your thigh. I know you don't want to hear about that right now, but he wanted you to hear about it.\n\n\"You're not alone,\" he says. \"You're here. You're with us. I'm grinding on you right now because I want you to understand: to me, there's no difference between you and any other adult islander. To us, you're normal. Fuck, there are so many pedos in here, us cubs don't know which way to turn...\"");
			addChoice("I guess you're right.", somDom.bind("38"));
		}

		if (seg == "38") {
			append("He peels his face off your chest and smiles up at you. \"Mmm? Does that mean you feel better now?\"");
			addChoice("A little. It's nice to be reminded I'm not alone.", somDom.bind("39"));
		}

		if (seg == "39") {
			append("\"What could I do to make that a lot?\"");
			addChoice("Prove to me it's not my fault that I'm like this.", somDom.bind("40"));
		}

		if (seg == "40") {
			append("He pauses.\n\n\"I can't... I can't <!i>prove<!i> it, but... no... well.\"\n\nHe fiddles nerdily. \"We can't be sure that fetishes are genetic. Alternatively, we can't be sure that fetishes just infect anyone who stumbles onto them. Maybe you picked them up somewhere in your childhood. But I want you to read this very closely: <!b>it doesn't matter.<!b> However you got them, these feelings are part of you now— even if you never indulge them, they may always be in the back of your mind— and hating yourself just for having some feelings is not reasonable. It's not.\"\n\nHe hugs you tightly, squishing his little body up against yours. The hug means even more coming from a cub than it would from any other islander. \"You hear me?\" he asks your belly. \"Don't hate yourself for some feelings.\"");
			addChoice("I cri d a littl  bit on my k yboard and it brok :C", somDom.bind("rejoin6"));
		}

		if (seg == "rejoin6") {
			append("Som buries his face in your chest again.\n\n\"Heh. That's okay. If I could beam up my cummy towel to you through the computer monitor just so you could wipe it off, I would.\"");
			addChoice("[Wipes off the 'E' key with the hem of a tattered dress.]", somDom.bind("rejoin5"));	
		}

		if (seg == "rejoin5") {
			append("A Floatillery phone rings. Som hugs you tighter, grimacing.\n\n\"I don't want to go back to woooork...\"");
			addChoice("Why do you have to? Isn't your economy just made up anyway?", somDom.bind("41"));
		}

		if (seg == "41") {
			append("\"Not reaaallly...\" he says, still rolling with the whiny tone he used for 'wooooork'... \"there's a big secret reaaasonnnn we have to keep it runnniiiinng and it's super convoluuuuted...\"\n\nHe forces himself to go answer the phone.\n\n\"Hullooo, Floatillery directory, who would you like to speak to? Oh, shut up. Of course you can come over. Yeah. Well, I mean...\"\n\nHe glances at you.\n\n\"... I... I mean, yeah, two or three... four?! No, I can't fit four... I can't! No, I really can't, seriously. Oh my god. Okay, fine, four. Fuck it, break me. Bring some beads, too. Okay. Okay, seeya soon.\"\n\nHe hangs up and places his hands in his lap, conveniently covering his little cock. He looks at you and blushes. \"I haven't cum that hard in weeks, but it uh... it only made me hornier. Such is the curse of living in a porn game.\"\n\nHe scrambles away from the phone and drops to his knees at your feet, hands clasped. \"I'm so sorry— this is incredibly insensitive of me?!? I don't mean to, you know, invite someone else over to molest me right when you needed a break from it— I'm not replacing you because you cried after I dommed you, if that's what you think—\"");
			addChoice("Yeah, you're definitely not a psychopath anymore.", somDom.bind("42"));
		}

		if (seg == "42") {
			append("He blinks.\n\n\"Ehhhh... are you being sarcastic?\"");
			addChoice("No lol. I'm gonna head out. You have fun with your pal.", somDom.bind("43"));
		}

		if (seg == "43") {
			append("There's a series of brutally loud knocks on the door. Whoever it is sounds like they're trying to punch it down. \"Hey fagtard,\" a low voice growls from the other side. \"Open.\"\n\n\"Sign says closed... yeah fuckin right. No way this little shut-in isn't home.\"\n\nSom smiles at you and his cheeks fill up with red like two pitchers of cherry kool-aid.\n\n\"Ehem... 'have fun with my pal'? That would be... 'pals,' actually...\"\n\nHe scurries up and opens the door for two hulking naked men with cocks half the size of Som's body: "+(data.metCage>0?"Cage the bull":"a bull with a ponytail")+" and "+(data.metSnagg>0?"Snagg the greasy crocodude. Snagg":"a crocodile in a greasy wifebeater. He")+"'s got a duffel bag of weaponry and wicked-looking sex toys slung over his shoulder. After Som sees it, he can't look away.\n\n\"Snagg! Cage! You came fast!\" he chirps all hospitably, not even making eye contact.\n\n\"We did,\" Snagg says, \"and we will.\"\n\nCage grabs him by the throat and pins him to the desk he does all his work on, knocking cells and tools and both Floatillery phones to the floor in seconds. Som squeaks pitifully and cumsagain, right on the spot. You feel a little self-conscious about how long it took you to get him to cum, when this mean bull can do it in less than five seconds...\n\nYou go ahead and sliiiide out the door, past their muscles. Snagg nods at you and then follows Cage inside at a leisurely pace, whistling some old opera tune while he zipties Som's ankles together.\n\nOutside, the messy rope-bridge network of the Floatillery stretches out in all directions. Some cyan clouds start to coagulate just above the shore, pulling evaporation from the glowing seascum. You walk along the rickety wooden bridges, back to the sands. Once you reach them, you find you're very grateful for the steadiness of the island beneath your feet.\n\nSweet, frantic cub screams echo in the distance behind you.");
			addChoice("Leave.", somDom.bind("44"));
		}

		if (seg == "44") {
			append("There's a series of brutally loud knocks on the door. Whoever it is sounds like they're trying to punch it down. \"Hey fagtard,\" a low voice growls from the other side. \"Open.\"\n\n\"Sign says closed... yeah fuckin right. No way this little shut-in isn't home.\"\n\nSom smiles at you and his cheeks fill up with red like two pitchers of cherry kool-aid.\n\n\"Ehem... 'have fun with my pal'? That would be... 'pals,' actually...\"\n\nHe scurries up and opens the door for two hulking naked men with cocks half the size of Som's body: "+(data.metCage>0?"Cage the bull":"a bull with a ponytail")+" and "+(data.metSnagg>0?"Snagg the greasy crocodude. Snagg":"a crocodile in a greasy wifebeater. He")+"'s got a duffel bag of weaponry and wicked-looking sex toys slung over his shoulder. After Som sees it, he can't look away.\n\n\"Snagg! Cage! You came fast!\" he chirps all hospitably, not even making eye contact.\n\n\"We did,\" Snagg says, \"and we will.\"\n\nCage grabs him by the throat and pins him to the desk he does all his work on, knocking cells and tools and both Floatillery phones to the floor in seconds. Som squeaks pitifully and cumsagain, right on the spot. You feel a little self-conscious about how long it took you to get him to cum, when this mean bull can do it in less than five seconds...\n\nYou go ahead and sliiiide out the door, past their muscles. Snagg nods at you and then follows Cage inside at a leisurely pace, whistling some old opera tune while he zipties Som's ankles together.\n\nOutside, the messy rope-bridge network of the Floatillery stretches out in all directions. Some cyan clouds start to coagulate just above the shore, pulling evaporation from the glowing seascum. You walk along the rickety wooden bridges, back to the sands. Once you reach them, you find you're very grateful for the steadiness of the island beneath your feet.\n\nSweet, frantic cub screams echo in the distance behind you.");
		}
		addChoice("Look around.", theFloatillery.bind("main"));
	}
}
