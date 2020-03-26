package story;

class Red
{

	public static function explore(seg:String):Void {
		saveCheckpoint("Red.explore("+seg+");");
		clear();
		setLocation("Red's Cottage");

		if (seg == "intro") {
			addPlace(
				"Red's Cottage",
				"A cottage which used to house a grandmother and a red-cloaked bunny. Now it's just the bunny and the big bad wolf.",
				"Bright Forest"
			);
			append((data.redVisits == 0 ? "You roll up to a cottage half-hidden in a thicket of bramblesnatches and snagweed.\n\n" : data.redVisits == 1 ? "You roll up to Red's cottage, stepping around the bramblesnatches and snagweed.\n\n" : "You roll up to Red's cottage.\n\n"));

			if ((data.metRed <= 0 || data.redVisits >= 2) && !getJournalEntries().contains("Missing Page 1")) {
				//If you haven't met red or you've visited (pre-visit optional or post-visit railroad)
				//Appears until you get the page
				append("... You don't think anyone's home right now.");
				addChoice("Snoop around the back.", explore.bind("loot"));
				unlockJournal("Red previsit");
				examine("Examine porch.", "A little stuffed animal family sits neglected on the windowsill: A rabbit grandma, her granddaughter, a grey man in a turtleneck... and, further away, a wolf.");
				if (Math.random() > 0.5) examine("Examine snagweed.", "Snagweed leaves curl a lot like sweetgrass leaves do, but not because they feel just as fruity. No, the primary function of a snagweed's curl is to strangle mice. Snagweed can't digest dead mice, of course, but it can digest the bugs that come to eat them!") else examine("Examine bramblesnatches.", "Bramblesnatches are not actually plants. They're selectively self-magnetizing fungi! First they wax, throwing down roots in nearby twigs and shrubbery, then they wane, flipping their magnetism on and snatching it all up into a nasty, tight lil bramble-clump.\n\nThe pull isn't very strong, though, so usually weeds keep their roots intact and live to get snatched another day.");
			} else if (data.metRed > 0 && data.redVisits == 0) {
				//First visit
				append("The little red-cloaked wolf girl who gave you glowberries from her basket earlier sits at the front window. She's talking to someone you can't see.");
				addChoice("Go thank her.", explore.bind("visit1"), {kinks: ["Art", "Cub", "Female", "Female"]});
			} else if (data.redVisits == 1) {
				//Second visit
				unlockJournal("Red Visit 2");

				append("A thin line of smoke rises from the chimney, hinting at the fire that must be lit in the hearth.");

				addChoice("Knock.", explore.bind("redvisit2knock"), {kinks: ["Guest Writer", "Cub", "Female"], faCensor: true});
			} else if (getJournalEntries().contains("Mourning") && !getJournalEntries().contains("RedApo")) {
				append("\"Went to the Apothecary,\" says a note on the door.");
			} else if (getJournalEntries().contains("RedApo") && !getJournalEntries().contains("Red After Apo")) {
				append("You mosey up to that familiar cottage and find the front door ajar. No note.\n\nYou listen. It’s silent. You rap your knuckles against it quietly. \n\nSilence.\n\nYou knock again.\n\nStill nothing.");
				addChoice("Barge in.", explore.bind("afterApo1"), {kinks: ["Guest Writer", "Cub", "Female"]});
			} else if (data.redVisits == 2) {
				append("\"Out for a swim,\" says a note on the door. \"Sorry about the abruptness last time, "+data.playerName+".\"");
			}
		}

		if (seg == "loot") {
			data.redSnooped = true;
			append("You snoop around the back.\n\nFlaccid sweetgrass leaves hang from the windows of a broken greenhouse. The soil's dry.\n\nThere's a ripped-up pile of Apothecary pamphlets.\n\nA watering can lays spout-down on the lawn.");
			addChoice("Water the sweetgrass.", function () {
				data.redWateredFlowers = true;
				append("\n\n"+pickByGenitals("You take a wide stance and drizzle", "You pop a squat and aim down, drizzling", "You pop a squat and drizzle")+" gold all over them. They curl towards the warmth of your stream with all the might their little leaf muscles can muster~!");
			}, {kinks: ["Piss"], oneTime: true});
			if (!data.redReadPamphlets) addChoice("Read pamphlets.", explore.bind("pamphlets"));
			if (!data.redFlippedCan) addChoice("Flip the can.", explore.bind("flip"));
			addChoice("Check for a cellar door.", explore.bind("cellar"));
		}

		if (seg == "pamphlets") {
			data.redReadPamphlets = true;
			append("They're all a stale, solitary green, big clear lettering, lots of shiny terminology. Not a single one is intact, but some of them are less clawed-up than others. You struggle to frankenstein a readable version out of the pile:\n\nARE YOU STRUGGLING WITH PSYCHOLOGICAL OR EMOTIONAL ISSUES?\nDO YOU FIND YOURSELF DRAWN TO UNHEALTHY, ERRATIC PERSONALITIES, SUCH AS: YANDERES, TSUNDERES, GUILT-TRIPPERS, GASLIGHTERS, OR EMOTIONALLY ABUSIVE PARTNERS?\nDO YOUR FRIENDS OR FAMILY REPEATEDLY TELL YOU THAT YOU'RE ONE OF THE ABOVE?\n\nIf so, you may find great solace and a newfound sense of mind and body after one of the Tranquil Apothecary's patented Snuff Therapy TM sessions. Subject your neuroticisms to our team of highly skilled doctor/executioners, such as Drs. Lamblea and Mauez, and put your feetpaws down on the first steps of a path to a better social life TODAY!\n\nFEELING DEPRESSED OR CLAUSTROPHOBIC? FEEL LIKE YOU JUST WANNA JUMP OFF THE MAP AND NEVER COME BACK?\n\nDo it, pussy! When you sign up for the Apothecary's Ass-sisted Suicide TM program, you get exclusive access to one of our premium lookout points. That's right, EXCLUSIVE access! No embarrassing spectators or innocent forestfolk waiting around to get scarred by your need for infinite nothingness! Just stand out on that lookout in perfect solitude and give in to the call of the void! Wooo!\n\nWhat, you thought we'd really let you do it? Don't be silly! Just before you hit the bottom and glitch yourself beyond repair, we'll detonate the bomb we planted in your brain! Guess what? The respawn system only cares about finding a spot where no one can see you... remember that EXCLUSIVE access? Thaaaaaat's RIGHT! You'll respawn right back on the lookout point! Now that's what I call a SATISFYING SUICIDE SIMULATION!\n\nBUT WAIT, THERE'S MORE!!!!!!!!!!!!!!!!!!\n\nFor an extra 40 Capsules, we'll also tranquilize you as soon as you respawn. What's that matter, you ask this pamphlet out loud? Well, except for a brief moment of confusion, that means there will be NOTHING but unconsciousness waiting for you after death! The simulation lasts as long as you want it to! It's the opposite of heaven and hell— a complete and total LACK of perception!\n\n\"OPT OUT OF TOMORROW, TODAY!\" WITH THE APOTHECARY\n\n... You think you're done for now.");
			addChoice("Jeez.", explore.bind("loot"));
		}

		if (seg == "flip") {
			data.knownGlowElectricity++;
			data.redFlippedCan = true;
			append("You flip it over with a toe and peek inside.\n\nIt looks like some cyan algae plugged up the spout back when this can was full. Lower and lower water lines ring the walls. By now, only a two-inch algae incubation puddle has been left unguzzled.\n\nThis gunk lattices the walls, forming networks of squiggly circuitry. You know it's circuitry because you just poked it and got your finger zapped.");
			addChoice("Fascinating.", explore.bind("loot"));
			addChoice("Ow fuck.", explore.bind("loot"));
		}

		if (seg == "cellar") {
			append("Well, you hesitate for a moment first, just to sort of make yourself fully aware that you're about to break into "+(data.metRed>0?"Red's":"a little")+" cottage for no real reason.\n\nThe cellar door is at your feet.");
			addChoice("Bust it open.", explore.bind("cellar2"));
		}

		if (seg == "cellar2") {
			append("You open it <!i>gently<!i> to prevent property damage.\n\n");
			addChoice("Head inside.", explore.bind("cellar3"));
			addChoice("Close it again and this time BUST it open. >:3", explore.bind("cellar2bust"));
		}

		if (seg == "cellar2bust") {
			data.redMadeNoise = true;
			append("Okay, fine.\n\nYou drive a foot square onto the crack between the doors and bust those fuckers right open. Both bounce off the concrete cellar walls <!i>(WHACK)<!i> and spew dust particles into the moonlight.\n\nSomething stirs upstairs.");
			addChoice("Head inside.", explore.bind("cellar3"));
		}

		if (seg == "cellar3") {
			playSound("assets/audio/environment/caveDoor");
			var s:MintSprite = addSprite("assets/img/effect/black.png");
			append("It's pitch black in here.");
			addChoice("???", function() {
				clearChoices();
				addChoice("???", explore.bind("cellar4"), {enabled: false});
				addChoice("Move along.", gotoHub.bind("Bright Forest"));

				tween(s, {alpha: 0}, 2, {ease: QUAD_OUT, onComplete: function(){
					append("\n\nOops, sorry. Let's pretend there's enough light to read by.");
					clearChoices();
					addChoice("Snoop.", explore.bind("cellar4"));
					addChoice("Move along.", gotoHub.bind("Bright Forest"));
				}});
			});
		}

		if (seg == "cellar4") {
			append("There's a rocking chair, a corner full of broken things, a record player...");
			examine("Examine rocking chair.", "The feet are worn to pointlessness. The arms are scuffed green with old wisps of sweetdust.");
			examine("Examine corner.", "This stuff has been twisted and clawed at and snapped so much you can't even tell what it used to be.\n\nWait, there are a few little stuffed bunnies and wolves near the bottom of the pile. They're all half-finished, sewn with gangly lines, and torn to shit.");
			addChoice("Examine record player.", explore.bind("cellar5"));
			if (data.redMadeNoise) addChoice("Head upstairs.", explore.bind("cellar7"));
		}

		if (seg == "cellar5") {
			append("There's only one record here: \"Deathless,\" a cover by Marei Mauez.\n\nThe rest have been smashed.");
			addChoice("Play it.", explore.bind("cellar6"));
			if (data.redMadeNoise) addChoice("Head upstairs.", explore.bind("cellar7"));
		}

		if (seg == "cellar6") {
			playSound("assets/audio/music/deathless", "deathless");
			append("You put the record on."+(data.redMadeNoise?"\n\nSomething stirs upstairs.":""));
			examine("Read the sleeve.", "<!i>The title track is a piece from the opera Koschei the Deathless.\n\nKoschei was an old man who probably never actually existed. His body was immortal, but his soul was hidden in a needle inside an egg inside a duck inside a hare inside a metal chest buried under an oak tree on an island.\n\nIf the chest ever got excavated and busted open, the hare would pop out and fuck right off. If the hare was hunted down and killed and eviscerated (buy my album fellow carnivores) then the duck in its belly would fly away. If you shot down the duck, yanked the egg out of its butthole, and finally broke the egg open, you got his soul needle.\n\nIf he ever wanted to die, he just had to snap that needle in half.\n\nEven if we had to kill two ferals and crack an egg to get to our needles, our chests are buried too deep for step one. That old fuck had it easy.\n\n— Marei<!i>\n\n... Someone scribbled \"boring\" on here.");
			addChoice("Head upstairs.", explore.bind("cellar7"));
		}

		if (seg == "cellar7") {
			append("<!14px>You creep up the basement staircase.\n\nThe door at the top is shut and locked, but the years have started to weigh on its frame. A crack of light spills through loose hinges.\n\nSomething stirs again. You hear a grinding hum, like wood dragged across wood.\n\n<!14px><!10px>(That's not innuendo.)<!10px>");
			addChoice("Peek.", explore.bind("cellar8"));
		}

		if (seg == "cellar8") {
			append("Someone's slowly pulling a chair past this door. You watch the back legs slink by at a perfect, unchanging speed.\n\nThen the front legs <!i>clunk<!i> down. Fabric rustles against fur, footpaws tuck themselves up onto the edge of the seat.\n\nIf you crane your neck a little harder...");
			addChoice("Crane.", explore.bind("cellar9"));
		}

		if (seg == "cellar9") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append("It's a bunny.\n\nShe's staring right through the crack— and right through you.");
			addChoice("...", explore.bind("cellar10"));
			addChoice("Oh god.", explore.bind("cellar10"));
			addChoice("Hi?", explore.bind("cellar10"));
			if (data.redVisits > 0) addChoice("You woke up?", explore.bind("cellar10"));
		}

		if (seg == "cellar10") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append("\"Hi <!b>player name.<!b>\"");
			addChoice(".......", explore.bind("cellar11"));
			addChoice("My name's not <!b>player name<!b>.", explore.bind("cellar11"));
		}

		if (seg == "cellar11") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append("\"Want some?\" she asks, offering a handful of invisible berries to the door crack.");
			addChoice(".........", explore.bind("cellar12"));
			addChoice("I'm good thanks.", explore.bind("cellar12"));
		}

		if (seg == "cellar12") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append("She blinks.\n\n\"Hi <!b>player name.<!b>\"");
			addChoice("Okay, head back downstairs.", explore.bind("cellar13"));
		}

		if (seg == "cellar13") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append("\"You forgot your <!b>item<!b>.\"");
			addChoice("Hm?", explore.bind("cellar14"));
		}

		if (seg == "cellar14") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
		append("She slips "+(getItem("Daydream Journal").amount > 0 ? "one of the missing pages from your Daydream Journal through the crack. It's already filled with someone else's memories" : "a ripped page through the door. A conversation has been scrawled on it")+".\n\n\"You forgot your <!b>item.<!b>\"");
			unlockJournal("Missing Page 1");
			msg("Found Missing Page #1", true);
			playSound('assets/audio/environment/journalPage');
			addChoice("Oh. Thank you.", explore.bind("cellar15"));
		}

		if (seg == "cellar15") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-25;
			append((data.redVisits > 0 ? "Red calls to her from down the hallway. \"Mary, gimmie the chair back. It's not ours.\"\n\nThe bunny giggles flaccidly. \"What, did you think it was a loan?\"\n\n\"Yes. We borrowed it from Rox, remember? Of course you don't.\"\n\n\"You forgot your <!b>chair<!b>.\"\n\nRed sighs. \"Just come take your medicine and bring it over with you.\"\n\n\"Hi <!b>player name.<!b>\"\n\nSudden silence from Red.\n\nThen: \"<!i>Mary, who are you talking to?<!i>\"\n\nHer footsteps rush down the hall." : "\"What, did you think it was a loan?\""));
		}

		if (seg == "visit1") {
			unlockJournal("Red visit");
			data.redVisits = 1;
			append("You knock once, twice—\n\nThen she swings it open with surprising force for a "+(isActive("Pastel Ring")?"seven":"ten")+"-year-old before you can land the third.\n\nThe night air rushes in, billowing her cloak. She's completely naked underneath. Tawny wolf fur coats the curve of her belly, her thighs. A tuft of the stuff flutters in the center of her flat chest. Your eyes rove down and spot the soft mound of Red's puss, partially hidden beneath fur—\n\nThen the cloak flutters to a close.\n\n\"Hi,\" she says, a little impatient.\n\n\"Can I help you?\"");

			addSprite("assets/img/effect/littleRed.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");

			addChoice("I... uh...", explore.bind("failedToThank"));
			addChoice("I never thanked you.", explore.bind("neverThankedYou"));
		}

		if (seg == "failedToThank") {
			StoryUtils.quickMynt("Red");
			append("She waits a couple seconds, eyebrow still cocked.\n\n\"Okay. You're from the City, right? Well, sorry, but I don't do that kinda stuff anymore. Bye.\"\n\nShe closes the door.");

			addChoice("Knock again.", explore.bind("knockAgain"));
		}

		if (seg == "neverThankedYou") {
			StoryUtils.quickMynt("Red");
			append("\"For what?\"");

			addChoice("For these.", explore.bind("forThese"), {req: ["Glowberry", 5]});
			if (getItem("Glowberry").amount < 5) addChoice("For... uh... well, I don't have them anymore.", explore.bind("dontHave"));
		}

		if (seg == "knockAgain") {
			append("The door swings open at near light-speed and Red's eyes are huge.");

			if (data.knownAsPlayer <= 3) append("\"YOU'RE A PLAYER!\"");
			else append("\"YOU'RE THE "+pickByGender("GUY", "GIRL", "PLAYER")+" I MET ON THE PATH!\"");

			addChoice("I... yes?", explore.bind("iYes"));
			data.knownAsPlayer++;
		}

		if (seg == "forThese") {
			append("She peers at the berries in your cupped palms. \"Oh yeah. We met on the path. Keep em, jeez... what, did you think it was a loan?\"");
			addChoice("Well, anyway, thanks.", explore.bind("wellThanks"));
		}

		if (seg == "wellThanks") {
			append("\"You're—\"\n\nYou feel like the word coming next was \"welcome,\" but it changes to \"PLAYER! YOU'RE A PLAYER!\"");
			addChoice("I... yes?", explore.bind("iYes"));
			data.knownAsPlayer++;
		}

		if (seg == "dontHave") {
			append("\"Oh. The glowberries I gave you, right? Don't get too worked up about it, I give them out to everyone. Part of the red riding hood schtick. Still,\" she says, \"you're...\"\n\nYou feel like she's about to say \"welcome,\" but instead her lips snap from a partially open W to a tight-closed P and she blurts: \"PLAYER! YOU'RE A PLAYER!\"");
			addChoice("I... yes?", explore.bind("iYes"));
		}

		if (seg == "iYes") {
			append("She tackles you with a hug, a steady stream of apologies and questions pouring muffled into your stomach. The smooth warmth of her cunt grinds up and down against your leg as she bounces on her tippy-toes to hug you harder.\n\nFinally she pulls her face off and looks up at you, her chin resting on your stomach, wolf ears perked up, canines poking out in a massive grin.\n\n\"It's been forever,\" she says, trying her best to put several decades worth of weight into her loli voice.");

			addChoice("Am <!i>I<!i> the big bad wolf in this situation?", explore.bind("amITheWolf"));
		}

		if (seg == "amITheWolf") {
			append("Red pulls you in and shuts the door behind you.\n\nThe cottage is tiny, low ceiling'd, and smells of meat. She leads you by hand to a lacy four-poster bed. It's clearly made for a grandma, but right now it's occupied by a comatose rabbit girl about Red's age.\n\n\"No, dumbass,\" she says, pointing to her canines. \"<!i>I'm<!i> the big bad wolf.\"");

			addChoice("What's with that bunny?", explore.bind("thatBunny"));
			addChoice("Not seeing the \"big\" part.", explore.bind("notSeeingTheBig"));
		}

		if (seg == "thatBunny") {
			if (!data.redBunnyExamined) {
				append("\"That's my friend. She's supposed to be Red Riding Hood with this cloak. Twenty years back she volunteered to... well, she got glitched up.\"\n\nRed flops onto the bed and flicks the bunny girl in the face, stuttering her snore. \"So Mynt put her to sleep until she can fix her. That's about it.\"\n\nShe looks up at you, swinging her legs back and forth off the edge of the bed, cloak fluttering with the movement, revealing just a peek of her bare, spread thighs.");

				addChoice("Examine bunny.", explore.bind("examineBunny")); 
			} else {
				append("The bunny just snores. No one says anything.");
			}

			addChoice("What did she volunteer for?", explore.bind("whatVolenteer"));
			addChoice("Reach between them thighs.", explore.bind("putAFinger"));
		}

		if (seg == "notSeeingTheBig") {
			append("Red grabs your adult hand with both of hers and yanks it down to her practically planar chest.\n\n\"Feel that? That's <!i>huge<!i> for "+(isActive("Pastel Ring")?"seven":"ten")+", y'know.");

			addChoice("Feel what?", explore.bind("feelWhat"));
			addChoice("Holy fuck they're ginormo!", explore.bind("ginormo"));
		}

		if (seg == "examineBunny") {
			append("Her little body's stretched out under a thin blanket, curves hugged tight. You can even see the fold of her bunnycunt.\n\nRed examines her too.\n\n\"I used to be upset about it, since we had this whole routine we'd do together, like a show, y'know... she'd bring the basket of glow-goodies here to grandma and I'd bust in and growl and eat her out... kind of a loose interpretation, but it was fun.\"");

			data.redBunnyExamined = true;
			addChoice("Next.", explore.bind("thatBunny"));
		}

		if (seg == "whatVolenteer") {
			append("Red glares at the sea through her window.\n\n\"If I'm going to answer that question, you gotta understand how things got to be on this island after the first couple decades of isolation. I can't give you that good an idea of it, because... well— look at me. I still sit around in this cottage. I still walk the trail with the basket and wear her stupid cloak. I choose nostalgia over paying attention to the state of this repetitious fuckfest.\"");
			addChoice("Can I fingerfuck you while you tell me this?", explore.bind("putAFinger"));
			data.redExposition = true;
		}

		if (seg == "feelWhat") {
			append("With a growl she yanks your hand down between her thighs instead, cloak fluttering open as she spreads them, and mashes your fingers against the oily, soft-furred lips of her puss. \"Well THAT'S not flat, is it?\"\n\nShe lets go, leaving your fingers cupped around her little mound, arms seemingly tired already from moving your hand twice.\n\n\"...Well, c'mon. Put a finger in or something. I didn't commit to that awful segway for nothing.\"\n\nShe's blushing.");
			addChoice("Slip a finger in.", explore.bind("putAFinger"));
			addChoice("Jam three fingers in.", explore.bind("jamThree"));
		}

		if (seg == "ginormo") {
			append("She beams with pride as you stroke the flat expanse where boobs would be; the only things you can really feel through the cloak are the wiggly nubs of her nipples underneath, so you wrap your hands around her chest, just under her arms, and rub your thumbs over them in tiny circles, her breath rising and falling in your gentle grip.\n\nShe exhales and fixes you with bedroom eyes. \"You're goddamn right they are.\"");
			addChoice("Slurp upon those niplets.", explore.bind("slurp"));
			addChoice("Move my hands down...", explore.bind("handDown"));
		}

		if (seg == "putAFinger") {
			data.bfRedFingered = true;

			if (data.redExposition) append("\"... Well. I mean...\"\n\n");
			append("Red scoots forward and hugs your arm. Your finger pops in to the knuckle. She's got her cheek smushed up against you.");

			if (data.redExposition) append("\n\n\"It got to a point where most people just wanted out.\"\n\nHer voice quivers as you add another finger, little hips bucking with the slow rhythm. \"Mynt is sposed to have a backup plan for times like these, when the game keeps running without any new players to visit or fuck.\"");
			else append("\n\n\"Nnnf...\" She rocks her hips a little, not looking at you. \"Sorry... not as tight as I used to be.\"");

			if (data.redExposition) {
				addChoice("What's that?", explore.bind("clench"));
			} else {
				addChoice("Clench for me.", explore.bind("clench"));
				addChoice("D'you figure that bunny's tighter?", explore.bind("figureShesTighter"));
			}
		}

		if (seg == "slurp") {
			append("You slip the cloak off her shoulders. She takes it from you and folds it with impeccable dexterity, considering her bare \"niplets\" are now getting thumbed twice as hard; then places it by the bunny, as if temporarily relinquishing ownership, and works her fingers into your hair.\n\nShe reads your intentions and pulls your face to her chest, grinding her now quite puffy left nip nub against your lips, your tongue.\n\n\"Suck that ginormo loli tit,\" she demands.");

			addChoice("Wonder what my life has become.", explore.bind("wonder"));
			addChoice("Suck that ginormo loli tit.", explore.bind("suck"));
		}

		if (seg == "handDown") {
			append("You slip your hands over her rounded stomach, just above the V leading to her closed thighs; she opens the cloak herself, showing off her body. Its fabric was soft, yeah, but the plush, cream-coloured markings around her belly button are approximately 4761 times softer.");

			addChoice("Open your legs.", explore.bind("openLegs"));
		}

		if (seg == "clench") {
			append("She holds her breath, clutches your arm, and tightens up as much as she can, warms thighs closing on your wrist. If you lean down and strain to listen, you can hear the tiniest little squeak in her chest every time you hit the deepest part of her.\n\n");

			if (data.redExposition == true)
				append("\"Full control,\" she says. \"With no player input for thirty days, Mynt should be able to view and edit everyone's code. We could ask her to change whatever we want— everyone wants to see the sun again, most people want fantastical stuff like wings or new islands to explore, and a few desperately want to change their gender... but I...\n\nI just want her back.\"\n\nShe caresses her little friend's face, leaving a tiny smear of cuntjuice on her cheek.")
			else
				append("She rides your finger like a cock, pounding her hips down to the knuckle, looking into your eyes...\n\n\"Would you wanna... uh... do something with the bunny and me?\"");

			/*append("With a sudden fur-bristling jolt of surprise, she cums. \"I...!\"\n\nThe full-body shivers force her to cling to you, her cunt contracting hard on your finger"+(data.redExposition?"s":"")+", and the rest of her sentence melts into a little gibberish moan.\n\n\"Abuhhuhmrrrghrmguhmuhmrmrghm.\"");*/

			addChoice("Peel those covers off and go wild~", explore.bind("iWant"));
			addChoice("No thanks. Wind down.", explore.bind("windDown"));
		}

		if (seg == "figureShesTighter") {
			append("\"Oh, definitely. I think her last visitor was Patch. He came over last Thursday and brought her some glowroses, fingerfucked her mouth and cunt... he's gentle, though (kind of a pussy to be honest) so he wouldn'tve stretched her much...\"\n\nHer oils gush over your hand now, and the she gives the littlest buck of her hips.\n\nAlmost inaudible: \"Still, I don't let just anyone rape her in her sleep. Add two more fingers. Then we'll talk.\"");

			addChoice("Add two more fingers!", explore.bind("jamThree"));
			addChoice("No thanks. Wind down.", explore.bind("windDown"));
		}

		if (seg == "jamThree") {
			append("You make a little triangle with your middle three fingers and work them between her lower lips, expecting to hit a roadblock at some point... but, to your surprise, they all pop right in. You drop the triangle and try driving all three into her sopping cunt as a horizontal line, marvelling as she instinctively spreads her legs wider and takes them without much more than a shiver.\n\nThough, as the inner massage goes on, she does begin to huff a bit, suppressing her squeals, one hand gripping the bedsheets. She keeps her eyes closed, but her ears perk towards the snores of her bunny.\n\n\"I can't take it... I need to see her naked right now.\"");

			addChoice("Pull the covers off.", explore.bind("iWant"));
			addChoice("No thanks. Wind down.", explore.bind("windDown"));
		}

		if (seg == "iWant") {
			append("Red's eyes gloss over with a nostalgic sheen. She whips off the covers.\n\nThere lays the bunny, nude, wide-hipped, her body even smaller than Red's. The bottom of her squished-up buttcheeks peek through her legs, and just above that her puffy bunny cunt throbs in the open air.\n\nRed scurries forward to straddle her friend's waist, all worked up.\n\n\"Okay,\" she whispers to herself. She grabs the bunny's head with both hands and stifles the light snoring with her tongue.\n\nAll you can focus on from back here is their two thick-furred cubcunts sandwiched together (a cuntwich, if you will) and the way their little cub puckers twitch in unison. Red's leaking so much lube now that it coats the bunny's and makes it look equally aroused.");

			addChoice("Dig into that cuntwich.", explore.bind("dig"));
			addChoice("Wind down.", explore.bind("windDown"));
		}

		if (seg == "suck") {
			append("You take long, heavy pulls on her little nipple, twiddling and twangling it with your tongue-tip, making loud, nasty schlorp noises solely to embarrass her.\n\nEventually you pull off and reveal her shiny, hickey'd niplet, swollen and capped with a bead of wolf-milk.");

			addChoice("So what's with that bunny, anyway?", explore.bind("thatBunny"));
			addChoice("Put a finger in.", explore.bind("putAFinger"));
		}

		if (seg == "wonder") {
			append("She laughs. \"Did I use 'loli' wrong? Aren't they just little girls?\"");

			addChoice("I just didn't think you'd use that word.", explore.bind("wonder2"));
			addChoice("You used it right.", explore.bind("wonder2"));
		}

		if (seg == "wonder2") {
			append("\"Most people don't use it at all. I only learned it cause John found it in some book and told me— he's kinda awkward like that, his idea of conversation is reciting dictionary entries. Most people call little girls little girls. Or cubs, I guess. Or fucktoys.\"\n\nShe reaches down and tugs at her clit, eyes unfocused, perhaps remembering a time she was treated like one.");

			addChoice("Let's change the subject. What's with that bunny?", explore.bind("thatBunny"));
			addChoice("Put a finger in.", explore.bind("putAFinger"));
		}

		if (seg == "openLegs") {
			append("\"Maybe I will, maybe I won't.\"\n\n... She doesn't do it. She's looking at you playfully, one fang poking out.");
			addChoice("Move my hands even lower, then.", explore.bind("evenLower"));
		}

		if (seg == "evenLower") {
			append("You stick four fingers from each hand deep into the spot where her thighs meet and yank them open wide; a few gossamer strings of cunnyjuice still connect them at the innermost, and you can't help but notice the tiny puddle she's made on the sheets.\n\n\"Now we're talkin.\"");
			addChoice("Put a finger in.", explore.bind("putAFinger"));
			addChoice("Jam three fingers in.", explore.bind("jamThree"));
		}

		if (seg == "dig") {
			makeSmallButtons();
			append(pickByGenitals("You slip your bare cock between them, drawing a wobbly moan from Red's belly as your head slides up against its smooth fur", "You slip your juicy fingers between them, drawing a wobbly moan from Red's belly as your fingertips slide up against its smooth fur", "You slip your bare cock between them, drawing a wobbly moan from Red's belly as your head slides up against its smooth fur")+".\n\nTheir disparate breathing rhythms create a unique double-stomach massage. Red's rises and falls with shallow breaths"+pickByGenitals(", grinding fast over your sensitive head", "", ", grinding fast over your sensitive head")+", while the bunny's only expands once every seven seconds— but, when it does, her lungs are packed to the tippy-top with air, and there's so little space between her belly and Red's that "+pickByGenitals("your dick feels like it's actually lodged inside one of them", "you can't even wiggle your fingers", "your dick feels like it's actually lodged inside one of them")+".\n\n\"What are you thinking about?\" Red asks over her shoulder, a tiny bead of bunny saliva hanging off her canines.");

			addChoice("Nothing.", explore.bind("dig2nothing"));
			addChoice("The way her breathing feels"+pickByGenitals(" against my cock", "", " against my cock")+".", explore.bind("dig2breathing"));
			addChoice("Wondering what it would feel like to "+(data.hasCunt?"punch":"")+"fuck this bunny so deep my "+(data.hasCunt?"fist":"dick")+" pops into her womb, that's all.", explore.bind("dig2say"));
		}

		if (seg == "dig2nothing") {
			append("Red starts grinding her hips down, closing the hot cuntwich"+pickByGenitals(". Their lower lips kiss too, around the sides of your shaft", " around your wrist", ". Their lower lips kiss too, around the sides of your shaft")+".\n\n\"Mmnnn...\"\n\nShe lifts her hips off of the bunny's, strings of cuntslime linking them.\n\n\"You sure?\"");
			addChoice("Well, I might've considered this... ("+(data.hasCunt?"Fingerfuck":"Fuck")+" the bunny.)", explore.bind("fuck"));
		}

		if (seg == "dig2breathing") {
			append("Red starts grinding her hips down, closing the hot cuntwich"+pickByGenitals(". Their lower lips kiss too, around the sides of your shaft", " around your wrist", ". Their lower lips kiss too, around the sides of your shaft")+".\n\n\"Mmmm... she breathes so sensually now that she's asleep, huh? Bunnies never slow down, usually.\"");
			addChoice((data.hasCunt?"Fingerfuck":"Fuck")+" the bunny.", explore.bind("fuck"));
		}

		if (seg == "dig2say") {
			append("Red starts grinding her hips down, closing the hot cuntwich"+pickByGenitals(". Their lower lips kiss too, around the sides of your shaft", " around your wrist", ". Their lower lips kiss too, around the sides of your shaft")+".\n\n\"Oh fuck... you can't just <!i>say<!i> something like that...\"");
			addChoice("Do you want me to"+(data.hasCunt?"":" wombfuck her")+" or not?", explore.bind("wombfuck"), {kinks: ["Abuse"]});
			addChoice("I was just joshin, I won't go that deep~ ("+(data.hasCunt?"Fingerfuck":"Fuck")+" the bunny.)", explore.bind("fuck"));
		}

		if (seg == "wombfuck") {
			data.redWombfuck = true;
			append("\"...\"\n\nRed takes a moment to collect herself. She breaks the kiss but keeps her maw open. Her breath pours hot over the bunny's slack tongue.\n\nThen she closes her eyes and says: \"Please.\"");
			addChoice("Please what~?", explore.bind("wombfuck2"));
		}

		if (seg == "wombfuck2") {
			append("\"Don't tease me you dick,\" she snaps, eyes snapping open just so she can glare at you over her shoulder. \"You know what I meant...\"");// 
			addChoice("Beg me to do it.", explore.bind("wombfuck3"));
			addChoice("Alright, I won't tease you any more. <3", explore.bind("fuck"));
		}

		if (seg == "wombfuck3") {
			append("Red rolls her eyes.\n\n\"Please "+(data.hasCunt?"fistfuck":"rape")+" her innocent little womb open, make her squeal in her sleep, let me see the bulge of your "+(data.hasCunt?"knuckles":"cock")+" straining her tight bellyfur, etc, etc— <!i>please<!i> oh <!i>please<!i> could you do that for me?\"");
			addChoice("You got it. <3", explore.bind("fuck"));
		}

		if (seg == "fuck") {
			append("You line up... nice and careful... annnd...\n\nYou pop "+(data.hasCunt?"two fingers":"your cockhead")+" easily up the bunny's tiny cunt. She's much tighter than Red for sure— even her outermost lips seem to curl inward and squeeze around your "+(data.hasCunt?"knuckles":"shaft")+". She stirs in her sleep, brow furrowing into an expression of confusion or neediness, it's hard to tell.\n\n\"You feel that?\" Red whispers into one of her sensitive ears, two claws wandering down to fiddle with her wolfclit. \"It's okay if you don't feel "+(data.hasCunt?"them":pickByGender("his", "her", "their")+" cock")+" yet... "+(data.hasCunt?"they're":"it's")+" gonna go a lot deeper in a second...\"");
			addChoice((data.redWombfuck?"Are you sure I should do this~?":"Ram inside."), explore.bind("fuck2"));
		}

		if (seg == "fuck2") {
			if (data.redWombfuck) {
				append("Red drives two fingers inside herself, curling them deep and tugging frantically at her g-spot.\n\n\"Yes I'm fuckin sure, just do it. Give it to her.\"\n\nYou "+(data.hasCunt?"tuck your fingers into a fist and punch":"reel your hips back and pound")+" that little bunnycunt open, "+(data.hasCunt?"wrist brushing":"nuts slapping")+" against her perfectly relaxed inner thighs. All the breath rushes from her tiny body. Her lips twinge up into the vacant smile of a good dream.\n\n\"Harder,\" Red growls, running her free paw over the fat bulge in her friend's tummy, stroking "+(data.hasCunt?"it":"you fiercely through a layer of flesh and fur")+". \"Don't hold back.\"");
				addChoice((data.hasCunt?"Punchfuck":"Rape her")+".", explore.bind("fuck3"));
			} else {
				append("You drive your "+(data.hasCunt?"fingers":"cock")+" in about halfway, nearly falling forward with the dizzying tightness. You have to grab Red's shoulders (\"Hey! I'm not a handlebar!\") to keep yourself steady as you pull your "+(data.hasCunt?"soaked digits":"dick")+" all the way out and ram "+(data.hasCunt?"them":"it")+" back in again, once, twice, working up a rhythm. The little bunny flops limply against her pillows, maw lolling open, ears twitching.\n\nRed watches her expression intently, working a couple fingers inside herself.\n\n\"Mnnn... she looks like she always used to look whenever a stranger filled her with "+(data.hasCunt?"fingers":"cock")+"...\"");
				addChoice((data.hasCunt?"Three fingers.":"Fuck her")+".", explore.bind("fuck3"));
			}
			addChoice("Wind down.", explore.bind("windDown"));
			
		}

		if (seg == "fuck3") {
			if (data.redWombfuck) {
				append("You pull all the way out. Your "+(data.hasCunt?"fist":"cock")+" drips with clear, sweet-scented bunny oils.\n\nYou press your "+(data.hasCunt?"knuckles back to her entrance and start twisting back and forth, screwing your fist back inside":"head back to her gaped entrance and start sliding it back inside, inch by inch")+", grabbing hold of both supple bunny thighs and yanking them open.\n\n\"Come on,\" Red pants, frantic, one paw holding her bunny by the cheek. \"Come on... what're you doing down there, "+data.playerName+"? Did I not just say 'Don't hold back?'\"\n\nYou're getting there, you're getting there. You just gotta make sure the path to the bunny's womb is absolutely, totally clear... pushing in niiice and deep... then...\n\nYou go berserk, "+(data.hasCunt?"punchfucking":"wombraping")+" the little bunnyslut into oblivion. Every time you feel your "+(data.hasCunt?"fist":"head")+" <!i>pop<!i> into her belly you can only think to yourself that, wow, she's in a coma and even still she's the biggest bunnyslut on the island, laying there with her legs spread like that just begging to get her belly bulged with anyone's "+(data.hasCunt?"fist":"cock")+"—\n\nYou break away from that weird tangent and focus instead on keeping up this speed. Already your muscles are starting to cry out as you force them to keep tense and reflexive, pounding back in before your "+(data.hasCunt?"wrist":"cock")+" pulls even halfway out. Every time you bottom out inside her you feel the tight hug of her womb as it clenches down on your "+(data.hasCunt?"fist":"dick")+", embracing it like it really is her child.\n\n\"Come on!\" Red whines.\n\nHer brows peak in the middle. Her wolf tail droops down between her asscheeks. She collapses, biting back a sob, and her fingers slip pointlessly out of her cunt. She whimpers into the bunny's flat, fluffy chest:\n\n\"Please... go harder, deeper... come on... wake up...\"");
			} else {
				append("You cram "+(data.hasCunt?"three fingers in— the same three you crammed into Red. The bunny squirms a bit, cunt gaping hard over your knuckles, but besides that she takes them just as well":"your cock as far in as it'll go without popping into her belly (she squirms!), then you you pull alllll the way back out and ram back in to that depth, over and over and over")+"~\n\n\"Mmmmhm... classic squirms, classic needy expression, like she's dreaming about having to pee really bad... she'd make that face even when she was awake...\"\n\nYou grab"+(data.hasCunt?" one of":"")+" her supple bunny thighs and yank, opening her crotch up for a deeper, harder "+(data.hasCunt?"fingerfuck":"dicking")+", watching Red's fat ass jiggle with each impact...");
			}
			addChoice("... Pull out"+(data.hasCunt?"":" and cum")+".", explore.bind("cum"));
			addChoice("Wind down.", explore.bind("windDown"));
		}

		if (seg == "cum") {
			append("You unplug, panting, and "+(data.hasCunt?"flop back onto the bed with a sigh":"spray Red's backside with hot "+(isActive("Mood Ring")?getMood("You"):"")+"cum, dragging a clenched fist up and down your shaft to milk every last bit of it out onto her crack")+".\n\nRed "+(data.redWombfuck?"can't help but crack up a little, even though she's sniffling. She peers "+(data.hasCunt?"at your fist for a moment, coated with":"at your cock for a moment, half-hard now, coated with cum and")+" slick bunny wombslime.\n\nHer maw hovers open, panting, just above it.":"peers at the mess of puddles on her grandma's bedsheets. As she crawls off of the ravaged bunny, she lets her maw hang above one for a moment, panting, drooling a tiny bit...")+"\n\n... Then she hurries off and away.\n\n\"I'll get a towel.\"");
			addChoice("Wind down.", explore.bind("windDown"));
		}

		if (seg == "windDown") {
			append("You and Red sit at her kitchen table and cool down. She cracks the window that looks out over her backyard to let the night breeze help out with that.\n\nOut back, her little greenhouse is almost falling over, and the sweetgrass inside looks weary. The whole place is kind of a mess now that you start looking around instead of keeping your eyes locked on her body. She's got pots and pans all over the place, meatstains on the cutting boards, sweetgrass hanging in dried bushels from every pointed object that could be loosely considered a place to hang something.\n\nShe follows your look and shrugs. \"It'd be a lot cleaner if I wasn't twiddling my clit all the time. I'm cursed with amazing stamina. Constant, gut-clenching, cunt-burning stamina. Back in my city days I could take eight cocks in a row (or at once) and not bat a cum-coated eyelash. But I can't go back out there, get lost in a week-long gangbang, and leave this cottage to rot and collapse on my little vegetable here, so... clit-twiddling all day it is.\"");
			addChoice("Why can't grandma look after her for you?", explore.bind("winddowngrandma"));
			addChoice("Do you miss the city?", explore.bind("winddowncity"), {kinks: ["Male", "Abuse"]});
			addChoice("Did I help a little bit? :3", explore.bind("winddownhelp"));
		}

		if (seg == "winddowngrandma") {
			append("\"Grandma's in rehab.\"");
			addChoice("Oh jeez... you guys uh... you have rehab here?", explore.bind("winddowngrandma2"));
		}

		if (seg == "winddowngrandma2") {
			append("\"Not really.\"\n\nShe inhales deep and launches into exposition:\n\n\"It's incredibly difficult to <!i>construct<!i> shit when you and all your carpenters are choking on cock eight hours a day. So, when we do attempt to build a facility, we build it with multi-purpose in mind: The Floatillery is a dock and a distillery, the L.L.L. is a library and a laboratory, the Sewer Suburbs are sewers and suburbs, Hyper Land is an amusement park and a casino...\n\nSo the place granny goes for treatment, the Apothecary— sure, they do rehab, but their building overall functions as a hospital, a morgue... and a pharmacy.\"\n\nShe exhales deep.\n\n\"You can guess how effective the rehab program is.\"");
			addChoice("Ah.", explore.bind("winddown3"));
		}

		if (seg == "winddowncity") {
			append("She sucks a little stray pussyjuice from her finger, staring out the window, past her backyard, into a dark mess of trees and glowflora.\n\n\"I miss the men. Rox is nice and fun to get drunk with, but I'm not a huge fan of tits so big I can't see someone's face while they fuck me. Som is cute and it's fun to make him flustered, but I can't do much for that little faglet without "+(data.redExposition?"Mynt getting the admin pass and growing me ":"")+"a cock.\n\nWhen you live in the city, you can't walk three blocks from anywhere to anywhere else without getting catcalled, without some big-cocked randy telling you to bend over and kiss the sidewalk and take it, telling you right in your ear that you're a worthless cubcunt who <!i>deserves<!i> to get assfucked into the pavement with zero foreplay.\"\n\nShe pops her finger out and frowns at it.\n\n\"No, that's a lie. I don't miss the men. I miss the abuse. And I hate that.\"");
			addChoice("Why?", explore.bind("winddowncity2"));
		}

		if (seg == "winddowncity2") {
			append("\"You don't want to know why.\"");
			addChoice("Yeah I do...", explore.bind("winddowncity2a"), {kinks: ["Blood", "Scat", "Vomit"]});
			addChoice("Oop~ I guess I don't~", explore.bind("winddownhelp2"));
		}

		if (seg == "winddowncity2a") {
			append("Red lets her face sink into her paws, speaking through them.\n\n\"I hate it because... because I puked on her face.\"");
			addChoice("What...!?", explore.bind("winddowncity3"));
		}

		if (seg == "winddowncity3") {
			append("\"One day, a bull named Cage did me up in shit mascara, cum eyeliner, lipstick made of my own blood, fucked me, ass and cunt in alternation, fucked me so hard I couldn't walk and then made me walk down the street anyway. I sauntered past the catcallers and swayed my fucked-open ass for them. I loved to feel disgusting and worthle— I'm sorry, this is... hard to say. I'm not a very emotional person.\"\n\nShe breathes in.\n\n\"I was there, on the street, I'd just finished getting throatfucked by twenty, thirty guys? And then, once they're all gone, Cage walks up and asks me if I want more abuse. And of course I say yes, please, more. So... he punches me in the gut.\"\n\nA loud snore comes from grandma's bed. Red pulls her paws off her face and clasps them tight in a little ball on the tabletop to stop them from shaking.\n\n\"She was right in front of me. She had just recognized me and ran up to say hi, to ask me quickly if I wanted to come back to the cabin for a few days and hang out. No sex with her in those days, never sex, she just... she just wanted to hang out. She didn't see the makeup. She didn't know I'd just been gutpunched.\n\nAnd I puked twenty to thirty cumloads, five or six shitlogs, and three mouthfuls of my own blood all over her face.\"");
			addChoice("J"+(data.myntJenga?"enga":"esus")+" fucking christ.", explore.bind("winddowncity4"));
		}

		if (seg == "winddowncity4") {
			append("\"That's"+(data.myntJenga?"... almost":"")+" what she said.\"\n\nRed looks up at you for the first time since she started talking about Junk City, biting back tears with the ferocity of a wolf, trying so hard not to cry that her face scrunches up and she almost looks angry. Her voice quivers like a leaf.\n\n\""+(data.myntJenga?"She":"That's what she said, and she")+" swore never to take the Lord's name in vain.\"\n\n");
			addChoice("...", explore.bind("winddowncity5"));
		}

		if (seg == "winddowncity5") {
			append("She pushes her chair back with a wood-on-wood squeal and gets herself busy with the kettle. She fumbles for a tube in the wall and unscrews a little valve at the end of it. Rainwater trickles out.\n\n\"She didn't talk to me for three years afterwards. When she finally did, it was to ask a question: You got off on my disgust, didn't you?\"");
			addChoice("Did you?", explore.bind("winddowncity6"));
		}

		if (seg == "winddowncity6") {
			append("She laughs, leaning with both paws on the counter.\n\n\"Of course I did. I hated it, but I did. I wanted to speak with her again more than anything. I wished it hadn't happened at all. But when neither of those were options and I still needed love and pleasure from somewhere... I'd submit myself completely to someone, I'd really convince myself that I was a worthless, disgusting slut... and picturing her face at that moment was very handy.\"");
			addChoice("... Well! I'd better get going.", explore.bind("winddowncityend"));
		}

		if (seg == "winddowncityend") {
			append("Red spins around and narrows her watery eyes.\n\n\"I didn't tell you any of that. Got it?\"");
			addChoice("Yup!", explore.bind("winddownend"));
		}

		if (seg == "winddownhelp") {
			append("She smirks.\n\n\"Well, I didn't cum... but at least I've got someone to fantasize about next time I have two hours to spare.\"");
			addChoice("Oho~", explore.bind("winddownhelp2"));
		}

		if (seg == "winddownhelp2") {
			append("\"So you use tildes too, huh.\"");
			addChoice("I do indeed~", explore.bind("winddownhelp3"));
		}

		if (seg == "winddownhelp3") {
			append("\"Personally, they annoy the fuck out of me.\"");
			addChoice("Ohoooooo dooo theey nowww~", explore.bind("winddownhelp4"));
		}

		if (seg == "winddownhelp4") {
			append("She slaps you.\n\n\"Shuddup.\"");
			addChoice("Hey! Ow!", explore.bind("winddownhelp5"));
		}

		if (seg == "winddownhelp5") {
			append("\"What, did the words on the screen hurt?\"");
			addChoice("My feelings, yes. :<", explore.bind("winddownhelp6"));
			addChoice("... No...", explore.bind("winddownhelp6"));
		}

		if (seg == "winddownhelp6") {
			append("Red pulls out her chair. \"Good!\"\n\nShe grabs a kettle with one hand and a weird tube sticking out of the wall with the other, cranking a little valve open so water can pour out. It's connected to a raincatcher you guess?\n\n\"Thanks for the visit,\" she says, smiling. \"And sorry for the textual slap.\"");
			addChoice("It's okay.", explore.bind("winddownend"));
			addChoice("I guess I forgive you. :/", explore.bind("winddownend"));
		}

		if (seg == "winddown3") {
			append("Red pulls out her chair and huffs. \"I'm complaining!\"\n\nShe grabs a kettle with one hand and a weird tube sticking out of the wall with the other, cranking a little valve open so water can pour out. It's connected to a raincatcher you guess?\n\n\"Really, I don't mind staying out here. I've got Rox and Som to keep me company whenever I'm feeling up for a walk and a cock.\"");
			addChoice("I'd better get walking and cocking myself~", explore.bind("winddownend"));
		}

		if (seg == "winddownend") {
			append("She looks one more time into the bedroom. The bunny's perfectly still, curled up in a lazy attempt at the fetal position, her expression vacuous and peaceful.\n\nRed flicks the kettle on and takes out two teabags of sweetdust.\n\n\"If you'll excuse me...\"");
			if (data.redExposition) addChoice("Wait, you never told me what happened to that bunny? What she volunteered for?", explore.bind("winddownend2"));
			addChoice("Excuse her.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "winddownend2") {
			append("\"Another time, then.\"");
			addChoice("... Alright I guess. :/", gotoHub.bind("Bright Forest"));
			addChoice("... Alright.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "redvisit2knock") {
		msg("<!img:kink/Guest Writer.png> Guest Writer: Srsly", true);
		data.redVisits = 2;
		append("You rap your knuckles across the door.\n\nFrom inside comes panicked mumbles, kitchenware crashing, bumps and bangs.\n\n\"Just a second!\" Red calls. She scrambles to the door and cracks it open one bright yellow eye's width. \"Oh, it's you again. I keep thinking the glowing blue <!i>"+data.playerName+"<!i> above your head is Kemp's truck lights, or some other city fuck.\"\n\nYou can barely see inside of her place. She won't open the door any further. Last time she was pretty quick to invite you inside...\n\n\"I'm sort of busy right now,\" she says, answering the question on your face. \"Wait a few minutes, yeah?\"");

		addChoice("Oh, okay. I'll wait here.", explore.bind("wait1"));
		addChoice("Fuck that! Barge inside!", explore.bind("barge1"), {kinks: ["Blood", "Abuse", "Gore", "Snuff"]});

		}

		if (seg == "barge1") {

		append("You shove past Red and her door.\n\nShe flies backwards, reeling, and her fall is miraculously broken by her enormous bubbly loli ass.\n\n... You can't see why she wanted you to wait a few minutes, at first. There aren't any big-tiddied bimbo or heavy-cocked dudebros in here mid-debauchery. There's only the crackle of the fireplace and the soft breathing of the bunny on her bed.\n\nYou notice something on the fire. You take a step forward, and a floorboard creaks beneath your heel.\n\nA bubbling kettle hangs over the happy flames. A sliver of emerald liquid peeks out from beneath the lid, blurry with dank steam. Some of this stuff has been poured into a cup, which now rests by the bed, cooling...\n\nThere's something in the bunny's mouth, too: a small funnel. Her slow, catatonic breaths wheeze gently through the tube. The dried sweetgrass that Red normally keeps hanging about her kitchen lays meticulously chopped on her counter, a massive pile of curly green waiting for the mortar and pestle. \n\nShe appears to be brewing up her own home-made tranquilizer tea and force-feeding it to her bunny friend.");

		addChoice((data.redSnooped?"So that's why she was awake when I came snooping...":"What is this? Confront Red??"), explore.bind("barge2"));
		addChoice("Keep looking around.", explore.bind("barge2"));

		}

		if (seg == "barge2") {

		append("Your eyes wander about as you turn around and back toward Red, but before you can so much as take two steps, something heavy and painful impacts the back of your head. Your vision blurs and fades to black as you collapse on the floor, unconcious.\n\nA husky whisper in your ear through the darkness: \"I'm about to take out my frustrations on you. You'll want to move along.\"\n\nAn indeterminate amount of time passes before you come to. When you do, your eyes open slowly, vision still throbbing in sync with the lump on the back of your head.\n\nThe stank of boiled sweetdust fills your nostrils. It's pungent, earthy. Almost like a healthy whiff of asparagus urine.\n\nYour vision stabilizes. You can now make out Red straddling the bunny, hips stuck out, one hand on the bunny's flat chest, the other clasping a wooden cup of green brew. She wiggles the funnel a little deeper down her friend's gullet and starts to pour, slowly, slowing only when the bunny starts to gurgle and squirm in her medicated sleep.\n\nWith the cup empty and the funnel full but draining far too slowly, Red wraps a gentle paw around her soft little throat and gropes it, applying special pressure on either side of her windipe to stimulate swallowing.\n\nThe bunny's eyes flutter open for half a second as the old dose wears off. Within seconds this latest dose drags them closed again. She grunts once, confused, and passes out again.\n\nRed turns to look at you. \"I have to do this,\" she says defensively. \"She's a danger to herself awake.\"\n\nWhen you try to move your body, you find that you've been bound to a chair, your clothing completely removed, thick ropes digging into your flesh, with your wrists tied at an uncomfortable angle behind you. It seems Red has tons of practice with this sort of thing.\n\nWithout looking at you, she says:\n\n\"I told you to <!i>wait<!i>.\"");

		addChoice("Why are you drugging your friend?", explore.bind("barge3"));
		addChoice("I'm sorry. I'm a player. I barge into random houses. Please don't hurt me.", explore.bind("barge3"));

		}

		if (seg == "barge3") {

		append("You can't speak. Your fingers jump to where your lips should be and run across leathery duct tape. You mumble what you intended to say against it, but Red just wipes her oily paws off (oily with her own juices, you think) and ignores you. She unplugs the funnel with a <!i>schpup.<!i>\n\n\"Now I have to punish you.\"\n\nShe dismounts the rabbit and licks her lips. With Red's poofy wolftail out of the way now, you can make out the shimmer of girljuices caked on the bunny's belly.\n\nShe stalks over and stops in front of you.");

		addChoice("Plead with my eyes!!", explore.bind("barge3a"));

		}

		if (seg == "barge3a") {
			disablePause();
			var s:MintSprite = addSprite("assets/img/effect/redDominant.png");
			s.x = GAME_WIDTH/2-s.width/2;
			s.y = GAME_HEIGHT-s.height;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "\"Don't type anything. Don't pause. Just click.\"");
			var clickArea:MintSprite = addRectSprite(800, 600, 0);
			clickArea.alpha = 0;
			clickArea.onReleaseOnce = explore.bind("barge3b");
			append("\"No.\"");
		}

		if (seg == "barge3b") {
			append("In a tone too serious and exhausted for such an innocent little face, Red says again: \"I have to do this.\"\n\nShe drops down and straddles your thighs. You can't move them. Your legs have been bound to those of the chair, your hands to the arm rests. You're completely helpless.\n\nShe drags one small, pointed claw up your bare chest, to your chin. She tips your head upward with a painful, tiny poke. Her small fangs jut through a smirk.\n\n\"It's been so long,\" she whines, grinding her slick pussy up against one of your legs, leaving a trail of glittering cuntslime on the knob of your knee. Her lips part slightly. She's blissing out behind closed eyes, surely imagining horrible, horrible things.\n\n\"I'll let you go eventually, yeah... or it'll get too intense for you, and you'll move along... but while I have you here... I have to do this.\"");

		addChoice("Struggle at my bonds.", explore.bind("barge4"));
		addChoice("Accept it, don't fight.", explore.bind("barge5"));

		}

		if (seg == "barge4") {

		append("The sight of your body under thick ropes, of your "+(data.hasBoobs?"tits straining against the fiber":"smooth chest rising and falling so quickly")+"— it seems to excite her. You're completely locked in place, subject to her whim. Right now that whim is to slide off of you, lift one of her feetpaws, place it lightly on your crotch, and grind those squishy pads into your "+pickByGenitals("round nuts", "swollen mound", "swollen rod, nuts, and cunt")+" hard enough to hurt. Upstairs her claws dig into the flesh of your throat. Unlike the ropes and duct tape, this really does encourage you to stop struggling, lest you tear open your own jugular because you squirmed a little too pathetically.\n\nShe moves her stomp-massage up off your crotch and caresses you with the sole of her foot instead. She curls her toes up against your abdomen, letting them really prick at you. She pulls her claws down and circles your junk with them, carving up your inner thighs, your lower belly, and growling at you softly.\n\n\"That's what I want to see... you nosey fuck... bust into <!i>my<!i> house... pry into <!i>my<!i> secrets...\"\n\nShe's breathing heavier and heavier. Lust glazes her eyes over.\n\n\"You know what... let's make this a little game. I'm going to teach you not to stick your face in other people's business,\" she says, leaning closer so you can really see how far gone she is, \"and you're going to try not to die.\"\n\nThe sound of something dripping catches your ear. There's a puddle growing on the floor. You can't see it, past the folds of her red cloak, but you get the feeling her pussy is absolutely gushing at the thought of it.");

		addChoice("Accept my fate.", explore.bind("barge6"));

		}

		if (seg == "barge5") {

		append("Red frowns when you become complacent. The lack of fear in your eyes really seems to be upsetting her. She bares her teeth, and with that, another massive fang peeks out from underneath her cloak. She holds it up, turns it slowly. Firelight licks over the steel and its reflection glints like insanity from the back of her eyes.\n\n\"You're not trying, "+data.playerName+".\"\n\nShe slides the knife up your abdomen, poking the point against one of your nipples and twisting the blade. While pain shoots through the sensitive nub she lets the blade continue upward, slipping over your collarbone, until its point jabs you underneath the chin. It's incredibly sharp. You know that swallowing now might cause serious injury, despite the knot in your throat.\n\nThe look in her eyes still tells you she isn't fooling around, so it's hardly a relief when she slips the blade back under her cloak, pats your cheek, and smiles.");

		addChoice("Next.", explore.bind("barge6"));

		}

		if (seg == "barge6") {

		append("\"Hmmm, now, what to do with this?\" she asks herself and slides a hand over your crotch, fondling you with her small fingers, making sure you're nice and ready for whatever comes next.\n\nShe backs off with a mysterious little chuckle and rummages under her bed. After a few seconds she returns with "+pickByGenitals("a shiny pink cock ring", "a large, double-sided dildo with <!i>Red & Wolf 4 ever<!i> permanent-marker'd on it", "a shiny pink cock ring and a fat vibrator with <!i>Property of Red<!i> permanent-marker'd on it")+". She drops to her knees with a needy sigh and pushes your knees apart. She undoes your ropes... only to do them back up even tighter in a new position, forcing your legs to stay open permanently. Your "+pickByGenitals("throbbing cock and nuts are", "poor pussy is", "quivering cock and cunt are")+" totally exposed. She "+pickByGenitals("fits the ring around the base of your sack, hindering your orgasm", "works one end of the dildo into you, pushing it in until it bumps your cervix", "slides the ring around your cock. It's a tight fit, made even tighter when she jams the vibrator deep inside of you")+".\n\n\"Try...\" Red says hungrily, staring up at you with her wolfish grin. In a burst of movement she rakes her claws briefly down your thighs, leaving thin trails of red. Your skin ropes up in response to the scratches.\n\nIt's not enough. Next, she reaches up to your mouth and tears the tape off quickly, leaving the sting across your face to burn for her pleasure. She slaps you across your burning cheeks so hard she hurts her own paw. Finally, at that unexpected blow, you release a single painsqueak.\n\nRed collapses in a rush of sadistic pleasure. She reaches between her own legs and plays two digits over her clit, looking through her dom-o-vision at your cuts and bruises and seeing them as if they're beautiful works of art that only she has the skill and the kinkitude to produce.\n\nBeneath her cloak, the knife reappears. She slides it along her own belly, up, up, til it slices through the tie of her cloak. The little carrot clasp clatters to the floor.\n\nHer body's free and fully nude now, from her tiny loli cunt to her ginormo loli tiddies. The cloak becomes indistinguishable from the fresh red of your blood puddle.");

		addChoice("Struggle and try not to die.", explore.bind("barge7"));
		addChoice("Bring it on.", explore.bind("barge8"));

		}

		if (seg == "barge7") {

		append("Your squirming only arouses her more. By now her thighs are soaked in the flavors of her greed. She wipes it up with two digits and then smears those around your body, marking you with the cloying, salty scent of her cunt. She coats your chest with it, your belly, your palms. She stuffs four dripping fingers in your mouth and demands that you suck and swallow. She even rests a single furry finger just under your nostrils without saying a word, simply <!i>expecting<!i> you to inhale hard and take her scent down to the bottom of both lungs.\n\nWith so much lubrication everywhere she inevitably ends up grinding her body against yours again, molesting you hands-free. Just as inevitably, her pussy ends up square against the tip of "+pickByGenitals("your forcibly stiff cock", "the double-sided dildo", "your forcibly stiff cock. She turns on the vibrator inside your pussy. (ULTRA-HIGH, naturally)")+".\n\nShe works her little pussy back and forth, at first, and then she starts to bounce her hips, gaping herself an inch or two by proxy. Though they clearly haven't been properly raped open since her City days, they are slowly warming up; with every bounce they open more easily for "+pickByGenitals("you", "the toy", "you")+".\n\nSuddenly she's not content to close her eyes and ride anymore. She grabs your hair and yanks your head back. Your neck is bared. She leans in. Your "+(data.hasBoobs?"tits press to hers":"flat chests smush together")+".\n\nShe runs her tongue over your windpipe, only teasing you with scrapes of her canines. Then, lips locked threateningly around your throat, she forces "+pickByGenitals("your engorged dick", "her end of the toy", "your engorged dick")+" alllll the way inside her, wiggling until her hips bump into yours.\n\nIt hurts her to take the whole thing. She's too small. But she pushes deeper anyway. Deeper, deeper, deeper— even when she's not actually gaining ground but just crushing your groin with her own— deeper, deeper, deeper. There's no grunt, no moan, no squeak of pleasure, just a silent, gritted-teeth grimace, the kind where you feel so overwhelmingly <!i>good<!i> your face doesn't know how to show it, the kind you only get at the breaking point of a long-awaited relapse.\n\nShe's officially unhinged. Her mouth isn't only hanging open lazily anymore, no, now she's keeping her lips parted purposefully, so all her wolfslobber can drip freely over your throat. The flat side of her knife trails up your abdomen, cold and slow. Her maw slides down and locks around your uninjured nipple, hot and fast, licking, tugging, gnawing at it."+(data.hasBoobs?" Fresh breastmilk squirts out pathetically.":"")+" Dots of blood rise around your abused areola.\n\nWith her shoulder-length hair swaying and her wolf ears folded back and her tail flicking viciously, she takes you. Both her paws clasp the back of your chair when they aren't busy throttling you. You hear the pittering of wolfgirl cuntsauce against it's velvet seat. You hear the tiny sounds of pleasure deep inside her petite chest, her belly, heavily pressurized behind the grimace.\n\nShe cums.\n\nHer body tenses against yours. Hot contractions worm down the length of her tunnel. In fifteen seconds it's over, and she lays panting, chin on your shoulder.\n\nYou hope that maybe cumming calms her down a little, now that she's got her fix...\n\nFor a moment, in her post-orgasm guilt, her brow furrows, and she really sees the mess she's made of your body.\n\nThen your "+pickByGenitals("choked cock pulses needily inside her", "pussy twitches against hers", "choked cock pulses needily inside her")+" and a fresh tidal wave of arousal sweeps that moment away.\n\nOne orgasm? ONE? No no no, that's not her fix. Twenty-five drawn out by a brutal torturefuck? <!i>That's<!i> a fix.\n\nShe pulls off and spits on your sensitive "+pickByGenitals("cock", "mound", "cock")+", probably to get the taste of your throat and nips off her tongue.\n\nHer knife flashes in front of your face. \"It's not your turn to cum yet.\"");

		addChoice("That knife is worrying me.", explore.bind("barge9"));
		addChoice("Is that the best you can do?", explore.bind("barge10"));

		}

		if (seg == "barge8") {

		append("Red's frustrated. She needs you to play her game to get off, clearly. She steps closer. She brings the knife to your throat. She straddles you with her naked body. She rests her pussy up against "+pickByGenitals("your engorged dick", "her end of the double-dildo", "your engorged dick")+", working it in close, and growls at you:\n\n\"Don't wanna struggle? Fine. You'll be easier to rape.\"\n\nShe drops her pussy down to "+pickByGenitals("the base of your cock, where her puffy lips press to your nuts", "the dildo's halfway point, her puffy lips meeting yours", "the base of your cock, where her puffy lips press to your vibrating nuts")+".\n\nIt hurts her to take the whole thing. She's too small. But she pushes deeper anyway. Deeper, deeper, deeper— even when she's not actually gaining ground but just crushing your groin with her own— deeper, deeper, deeper. There's no grunt, no moan, no squeak of pleasure, just a silent, gritted-teeth grimace, the kind where you feel so overwhelmingly <!i>good<!i> your face doesn't know how to show it, the kind you only get at the breaking point of a long-awaited relapse.\n\nShe jams her hips hard against yours and her grimace pops into a gasp. She lazily allows the tip of her knife to slide along your chest. Her free paw snakes behind you, yanks hard on your hair, and bares your neck to her. Giggling despite herself, she strikes a vicious dominatrix pose and slides her tongue along the flat of the blade before she presses it square against your throat. Her hips start rolling again, slowly. Her features contort with pleasure, and a fresh gush of wolfjuice drools down her pussylips, between her legs, hanging in glittery droplets from the puffy ring of her bare asshole.\n\nThis knife has been sharpened. You wonder if this was even avoidable. She was clearly prepared to torturefuck somebody when you showed up, at least.\n\nYou stop wondering. The cold, slick steel sinks into the first layer of your skin.");

		addChoice("Ask her to put away the knife nicely.", explore.bind("barge9"));
		addChoice("This is booooooring.", explore.bind("barge10"));

		}

		if (seg == "barge9") {

		append("\"What, this little thing...?\" Red drags the knife over her own nipple, along her lips... she seems to enjoy the metallic taste.\n\nRather than give a fuck about what you just said, she places the tip of her blade against your inner thigh and gradually lets it sink in, two hands on the pommel... and then she <!i>yanks<!i> it downward. Your once-perfect thighmeat splits open and spews blood onto the chair, over your leg, your shivering toes. Pain cackles up through your hips and your lower stomach. All you see is Red.\n\nShe's on the brink of orgasm just from that. Her fingers keep twitching towards her eager little clit, but she always stops them in time before she can take herself over the edge.\n\nSuddenly, with a smile, Red turns her back on you. She heads back to her bunny, plops her butt down on the bed, parts her thin legs, and <!i>smacks<!i> the flat side of the blood-soaked blade right down on her mound. She drags it back and forth, slow. It's not doing any damage. She just wants to feel the chill of the metal. She closes her eyes and, for a moment, she drifts back to the City, back to the faces of every dom who'd rubbed her little snatch with a knife just like this one.\n\nRed returns to this moment with a hunger. Her eyes drink you in, all abused and helpless, ropes digging into your "+(data.hasBoobs?"blood-drenched tits":"hips")+" and ropes holding your legs open so the world can see "+pickByGenitals("your oily, ring-throttled cock", "the dildo hanging so obscenely from your cunthole", "your cock and your vibrator-packed cuntbulge")+"... she's getting off on how vulnerable you look.\n\n\"I think I already came twice... maybe I should keep going. Or should I just put you out of your misery?\"\n\nHer threat isn't empty. She pulls her knife up to your neck again, teasing you with the possibility of cutting it at any moment, sawing gently over your tense muscles. Two fingers pump relentlessly at her cunt.\n\n\"Well?\"");

		addChoice("Please just let me go. (Next x5)", explore.bind("escape1"));
		addChoice("You don't have the GUTS, kid.", explore.bind("barge10"));

		}

		if (seg == "barge10") {

		append("\"Is this just a game to you?!\" she shouts, and even though it is, in fact, a game, you think she's starting to get legitimately pissed that you won't play along. She raises her knife high, so it catches the firelight with an evil gleam, and then plunges it straight down into your leg.\n\n\"Oh yesss... scream for me!\" she cries, and repeats the motion, stabbing your thigh over and over with the full length of her knife, pounding it in and out like a cock. Her free paw is just a blur as it rubs over her clit, now, and grinds two squirted orgasms through her fingers, smearing droplets of your blood around and inside her cuntfur. She pulls her paw away for a moment to gawk at the strings of viscous clear goo intermingling so beautifully with your life essence, wiggling the knife around inside your thigh absent-mindedly.\n\nHer fingers close. Her fist clenches.\n\nShe drives the knife down one more time.\n\nIt pierces your "+pickByGenitals("hard cock right down the urethra, the base, through both your throbbing nuts", "clit and your cuntmeat", "hard cock right down the urethra, the base, through both your throbbing nuts, through your clit and your cuntmeat")+"— and sticks with a <!i>thunk<!i> in the chair's wooden base.\n\nRed throws her head forward and screams in your face: \"DIE, "+data.playerName.toUpperCase()+"!\"\n\nThis time she drives the knife forward, right into your heart. Your thighs are numb and bloodless, but you still feel the drippings of her next orgasm seeping into your wounds. The last thing you see is the yellow of her eyes, bright and pale like overcooked egg yolk. The last thing you feel is the knife twisting.\n\nYou have died.");

		addChoice("Respawn.", explore.bind("respawn1"));

		}

		if (seg == "escape1") {

		append("This goes on for a while longer. Red tortures you while she gets herself off in a variety of ways. At one point, she fucks herself with the handle of her own knife; at another, she turns your body against you, coaxing you to the brink of orgasm only to make you cum with a stab to the gut.\n\nEventually she starts to wear herself down. Upon her twenty-fifth or maybe twenty-sixth orgasm, the knife slides from her fingers and clatters onto the floor, near the chair. She hardly notices.\n\nShe heads back to the bed, dragging her blood-drenched feet. She takes the bunny's cup and mumbles something about putting you under with the same brew she used to drug her. Now that she feels the cushiony matress beneath her bare asscheeks and the warmth of her best friend's snoring breaths against her bare chest, though... she passes right out on the spot and starts cuddling her.\n\nWelp. You're still here, raped and sliced up and bleeding in a chair. You can see the knife by your feet.");

		addChoice("Wait for Red to wake up.", explore.bind("escape2"));
		addChoice("Try to escape using the knife.", explore.bind("escape3"));

		}

		if (seg == "escape2") {

		append("You wait around for what seems like hours. Finally she stirs... yawns... and wakes. She stretches her girly little body out, shivering with the effort, bloodstains crackling and pussy leaking.\n\n... The mess she's made surrounds her. She's mortified. That's nothing, however, compared to the sight of you still tied up on the chair, almost dead from blood loss and still "+pickByGenitals("rock hard", "dripping", "rock hard")+". Red almost seems embarrassed for a moment.\n\n\"You're still here,\" she says incredulously. She musta thought you'd have the courtesy to move along after invading her privacy and driving her to torture you.\n\nShe takes her knife from where she'd left it on the floor without looking at it. Her drowsy, innocent eyes cloud over with a second wave of bloodlust. She bares serrated teeth and walks towards you.\n\nYou're helpless. You can't stop her from gripping your head and yanking it back. Her grip is surprisingly strong for a little one, probably all that predatory adrenaline, but once your throat is bared... her fingers start to loosen.\n\n\"Guess I'll have to keep you here forever. Just like her. You'll babysit for me, kay? You can put her under and still try and have a life, or you can keep her awake and watch her 24/7 to make sure she doesn't get her own retarded ass hurt. That'll be your choice. Choose whichever or find a better way, I don't care. I only want everything to go back to how it was.\"\n\nHer expression twists between guilt and nostalgia as she begins to babble about her old days in the City, about how brutally she was tortured, about how reluctantly, then how naively, then how <!i>efficiently<!i> she tortured others. She blows past the present and starts drafting up manic plans for her new life: she'll invite Cage and Snagg and Marei for a loli gangrape reunion, and she'll do this, and she'll do that, and she'll buy a house in the sewers, she'll try all the freaky shit that she was never brave enough to try when she used to live there, she'll plan Try-A-Kink nights with the boys and never chicken out, she'll go through with <!i>all<!i> of it just as soon as she can get back where she belongs— because sure, she can die as much as she likes, and she does like to, but for the last twenty-six years she's been living with the insidious fact that if a sweet little bunnygirl can go braindead by accident then no one is immortal, nothing is permanent, and if she doesn't live for herself and try out some wacky fuckstyles right now then she may never have another chance.\n\nReality seeps back in with the post-rant inhale. She can't do any of that shit and she never could.\n\nYou feel the blade slide into your throat. The point lodges all the way back in your spine. Red pulls the blade through your neck and out the other side. Blood pours from your gaping wound. The world dims at the edges. She covers her maw and her eyes grow wet. She waits for you to die before she lets you see her cry a second time.");

		addChoice("Respawn.", explore.bind("respawn1"));

		}

		if (seg == "escape3") {

		append("You aren't quite sure how this will work? Hm. Not too hard to scoot down on the chair and pull the knife over with your toes. But your hands will never reach. You crane... and streeetch...\n\nThe chair topples with a floorboard-straining <!i>FWUMP.<!i> Your skull bounces off the hardwood.\n\n... Red stirs. She mumbles \"Archie\" in her sleep, and her fists clench. Then she relaxes again. She feels around on the bed, trailing a bloody paw over the bunny's smooth little belly, and pulls her close by instinct.\n\nThe knife's right beside you now. You take it in one hand and struggle for fifteen minutes with the angle just to cut one wrist free. After a few minutes the other wrist follows, then both legs and— with a sigh of immense relief, you cut the rope binding your "+(data.hasBoobs?"tits":"hips")+". They burst free and jiggle merrily, their curves accentuated by the red, rope-shaped dent circling around either side.\n\nYou're free!!!\n\n... If you can avoid waking her up.");

		addChoice("Run for the door!", explore.bind("escape4"));
		addChoice("Crawl to the hallway quietly.", explore.bind("escape5"));

		}

		if (seg == "escape4") {

		append("Your first step hits the same floorboard that squeaked under your heel earlier.\n\n<!i>Crrreeeaaaaak...<!i>\n\nMovement on the bed. Red's awake. She sits up and looks at you. Her wolf eyes flash with the thrill of a new game. She sees the knife in your hand. She doesn't care.\n\nYou sprint for the door, but the tiny little wolf girl is faster than you expected, fuck, she uses the bed's bounciness as a launching pad for a sick wallrun up to the front door, and by the time you're reaching for the doorknob she's already latched to your back with claw and tooth. Your nude body is completely vulnerable to them. Before you're even out of the cabin you've got long cuts raked down your back and a torrent of blood sliding over your jiggling asscheeks. She growls and sinks her jaws into the scruff of your neck whenever you try to shake her off. She dodges your blind jabs with the knife.\n\nFinally, after a particularly nasty chomp to the ear, you collapse belly-up in the grass, thirty feet from her cabin. Red wastes no time pinning your dominant hand to the dirt with her knife and straddling you.\n\nYour "+pickByGenitals("shaft pulses", "cunt pulses", "shaft and cunt pulse")+" against the heat of her pussy. Laying with her, here, in the sudden calm after the chase, watching the tall grasses curl and sway in the wind... it's easy to think your next move through; in fact, this is the <!i>perfect<!i> time to seize the element of surprise and throw yourself into a freshly improvized escape plan—\n\nOh, nope, too late, she locks her jaws around your throat and closes them. Tendons snap. Cartilage crackles. The bottom row of teeth meet the top.\n\nShe yanks back and rips your windpipe out.\n\nYou have died.");

		addChoice("Respawn.", explore.bind("respawn1"));

		}

		if (seg == "escape5") {

		append("Feeling a little sexually humiliated even without anyone to ogle, you drop to all fours, ass out, and start crawling to the hallway.\n\nYou have to pass the bed. Both girls snooze: Red lightly, the bunny heavily. You keep your eyes on that peaceful, cute expression, the kind of expression you'd only ever find on a sleepy predator after a big hunt, watching for any movement of her bloodstained eyelids.\n\nAlright, you're in the hallway. There are two doors here: one to the left, and one to the right.\n\nRed mumbles behind you, squirming through a nightmare: \"I don't wanna leave... I don't wanna yet...\"");

		addChoice("Door to the left!", explore.bind("escape6"));
		addChoice("Door to the right!", explore.bind("escape7"));
		addChoice("Fuck dead end run for the front door!", explore.bind("escape4"));

		}

		if (seg == "escape6") {
		append("You enter the door to the left. It leads to the cellar.\n\nYou're surrounded by darkness. Your hands run over dirty concrete. Your eyes adjust sluggishly, trying to pick out anything recognizeable from the formless piles of junk scattered all around. There's a record player and a rocking chair on the far side, but right next to you there's a box full of sex equipment, likely left over from the City: chains, leather, whips, dildos, gags, vibrators, masks, knives, pliers, guns, a blowtorch, a pair of panties with \"I  <!img:kink/Love.png>  BOVINE COCK\" on the back—\n\nFootsteps upstairs.\n\nRed calls your name.\n\nAcross the room, by the rocking chair, you can see a small crack of light filtering between the boards of the cellar door. The only other way is back towards Red.");

		addChoice("Escape!!", explore.bind("escape8"));

		}

		if (seg == "escape7") {

		append("You enter the door to the right. It creaks slowly as it opens.\n\nLots of blues and pinks in here. Frilly stuff, too, although it's mostly dusty or boxed up.\n\nYou take time to wander about, touching some of the pictures to brush the dust from their frames...");

		addChoice("Next.", explore.bind("escape7a"));

		}

		if (seg == "escape7a") {
		halfWidthText();
		var s:MintSprite = addSprite("assets/img/effect/littleRedBunny.png");
		s.x = GAME_WIDTH-s.width;
		s.y = GAME_HEIGHT-s.height-100;
		s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "There are tearstains on this photo.");


		append("<!i>Mary spent some time helping Lana start his library. She says her name is Mary now because she wants to be a virgin. She read a book about an innocent girl in a red cloak with a basket. So I asked Rox to sew her a red cloak. And I stole a basket from the restaurant where they hand out baskets of Fuckmeat like breadsticks. I think she looks adorable as Red Rider Hood. I read the story too and she totally fits the part. She even gets stalked through the woods by a wolf and gets sneaky pictures taken of her, haha. ;3\n\nI love her.<!i>");

		addChoice("Next.", explore.bind("escape7b"));

		}

		if (seg == "escape7b") {
		append("<!i>Mary has been reading a lot. She made a new friend with a hippy bunny boy and he's gay like Som so she made him a flower crown too and they cuddled but didn't have sex. She says she doesn't want to have sex any more because she wants to be a virgin. I hate stupid flower crowns. I hope she will grow out of this like the red rider hood thing.<!i>");

		addChoice("Next.", explore.bind("escape7c"));

		}

		if (seg == "escape7c") {
			halfWidthText();
		var s:MintSprite = addSprite("assets/img/effect/sittingBunny.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Keylime Kitten", "No tearstains.");
			s.x = GAME_WIDTH-s.width*1.3;
			s.y = GAME_HEIGHT-s.height-25;
		append("<!i>We found her. She's braindead. She remembers her stupid fucking ~favourite chair~ at least. Guess that was hard-coded in.\n\nI'm gonna gift it to Rox so I don't have to look at it anymore.<!i>");

		addChoice("Next.", explore.bind("escape7d"));

		}

		if (seg == "escape7d") {

		append("The last picture you see is one of the oldest. It's Archie, Red, the bunny, and her grandma. For once, everyone is clothed. On the table before them, they have a big group project laid out, a custom set of cards: the regular suits have been replaced with Cocks, Paws, Leaves, and Crosses. The royalty has been replaced by Archie (King) the bunny (Queen) and "+(data.metSom>0?"Som the":"some")+" lamb nerdboi (Jack).\n\nArchie stands front and center with his left around the smiling bunny, her cheek smushed to his chest. In his right arm squirms Red, supremely uncomfortable. His grip on her is much, much tighter. You guess she fucked up a couple pictures before this one?");

		addChoice("Next.", explore.bind("escape7e"));

		}

		if (seg == "escape7e") {

		append("There's a dirty box in the corner marked \"garbage,\" which you wrote off at first, but as you get closer you see more pictures jutting from the flaps on top.\n\nIt's an amateur porn collection, starring Red and the bunny! There's... well, after skimming through some half-burnt ones, you find a dark photo, a gross one, and a cute one.");

		addChoice("Cute.", explore.bind("escapecute"), {kinks: ["Female", "Female", "Male"]});
		addChoice("Gross.", explore.bind("escapegross"), {kinks: ["Female", "Vomit"]});
		addChoice("Dark.", explore.bind("escapedark"), {kinks: ["Female", "Female", "Piss", "Prolapse", "Blood", "Gore", "Snuff"]});
		
		addChoice("Enough pictures.", explore.bind("escape7f"));

		}

		if (seg == "escapedark") {

		append("Two more pictures fall out as you unearth it. They're all part of a set. <!i>Predator & Prey<!i> is the scribbled title.\n\nThe first: Red, bearing down on the bunny's throat, claws out, slobber dangling from her canines. The bunny cowers and quivers theatrically, and you think you spot a little yellow in her pure-white panties.\n\nThe second: No clawing. No biting. That's all off screen. The only thing shown in this one is the bunny's screaming, blood-soaked face. Tears gush over her cheeks and combine with the blood to make swirling, pinkish stains that frankly look sort of like stage makeup.\n\nThe last: The camera focuses on the bunny's little sex object of a body, no face shown. Her pure white fur is drenched red with bloody clawmarks. Gashes run the length of her throat, scrapes pepper her flat chest, and her belly is a mess of half-eaten entrails. Her cunt has clearly been fucked open with two horsecocks at once, or something just as big, because it's half-prolapsed and her womb's been reduced to sloppy red jello between her thighs.\n\n... You spot the bunny's smile peeking out from the bottom of the frame, and her paw flashing a peace sign. She must've respawned and dived in front of the camera just in time.");

		addChoice("Gross.", explore.bind("escapegross"), {kinks: ["Female", "Vomit"]});
		addChoice("Cute.", explore.bind("escapecute"), {kinks: ["Female", "Female", "Male"]});
		addChoice("Enough pictures.", explore.bind("escape7f"));

		}

		if (seg == "escapegross")  {

		append("No bunny in this one. Just Red sitting at the dinner table in front of a bowl of hot, chunky stew. There are a few guys over in the kitchen with beers in their paws. They must've made the stew, cause they all seem to have a little bit spilled on their chests...?\n\nShe's got a napkin tucked down her shirt and a big soup spoon in one fist. The camera caught her tongue out over her lips, mid-lick.\n\nOh. That's not stew.");

		addChoice("Dark.", explore.bind("escapedark"), {kinks: ["Female", "Female", "Piss", "Prolapse", "Blood", "Gore", "Snuff"]});
		addChoice("Cute.", explore.bind("escapecute"), {kinks: ["Female", "Female", "Male"]});
		addChoice("Enough pictures.", explore.bind("escape7f"));

		}

		if (seg == "escapecute")  {

		append("It's a little flipbook. Each picture is a moment.\n\n1. Red laughing and adjusting the camera.\n\n2. The bunny pounces her and nibbles at her throat.\n\n3-5. You get a couple shots of their fuzzy cubcunts smushing and grinding together in the ruckus.\n\n6. They kiss.\n\n7. Red tries to shove the bunny off, but those powerful hind legs are straddled too firm.\n\n8. The bunny forces Red into another kiss. Red blushes and takes it.\n\n9. Someone grabs the camera and scoots closer.\n\n10. The bunny finally lets her get some air, but only after making Red suck her tongue for a gorgeous, drippy close-up.");

		addChoice("Dark.", explore.bind("escapedark"), {kinks: ["Female", "Female", "Piss", "Prolapse", "Blood", "Gore", "Snuff"]});
		addChoice("Gross.", explore.bind("escapegross"), {kinks: ["Female", "Vomit"]});
		addChoice("Enough pictures.", explore.bind("escape7f"));

		}

		if (seg == "escape7f") {

		append("Red swings the door open with another jarring <!i>CREEEAAAKKK<!i>.\n\nHer ears perk towards the sound, but her eyes stay locked on you. \"She woke me up all the time with this door,\" Red growls, \"when I used to let her stay awake.\"\n\nShe's got her knife gripped in both paws.\n\n\"First you barge in when I tell you no...\"\n\nShe winds her arms back, raising the knife above her head.\n\n\"Then you scuff up her favorite chair and escape...\"\n\nHer yellow eyes flash.\n\n\"... only to SNOOP THROUGH ALL OF OUR PERSONAL PHOTOS?\"\n\nShe hurls the blade at you. It flickers through the air, spinning, and lands with a satisfying <!i>KER-THUNK<!i> in your forehead.\n\nYou have died.");

		addChoice("Respawn.", explore.bind("respawn1"));

		}

		if (seg == "escape8") {

		append("You burst through the double-doors of the cellar and into the fresh, lovely air. You close the shutters behind you. Red's footsteps wander halfway down the basement stairs... then back up.");

		}

		if (seg == "wait1") {

		append("You wait outside while Red bustles behind the door.\n\nFrom inside: swearing, pots and pans clanging, the rustle of bedcovers... seems like whatever you interrupted was pretty involved. After a few minutes, though, the knob of the door turns again, and Red pokes her head out, beaming flimsily.\n\n\"Ah, "+data.playerName+", how truly marvelous to see you again,\" she fakes. \"Sorry about the mess!\"\n\nShe takes you inside and shuts the door behind. It's basically spotless in here, somehow. Especially near the fireplace.\n\nThe bunny's not sleeping so peacefully this time around. She keeps compulsively rubbing her long bunny feet together and shifting her legs. Her cunt is bright red and swollen and dripping, clearly starved for attention, but you guess that's like her version of bedsores: too much time spent sleeping in one place means not even close to enough sexual attention.\n\n\"Why'd you come back so soon?\" Red asks you, flopping down at the table with an exhale. She seems frazzled, despite her confident little fangs-out smile. \"First time whet your appetite that much?\"");

		addChoice("Fuck yeah it did. (Play with Red some more!)", explore.bind("wait2"));
		addChoice("Not really, I just wanna learn more about your backstory.", explore.bind("wait2back"));

		}

		if (seg == "wait2back") {

		append("\"I'm not an exposition dispenser,\" she huffs. \"Even if a lot of us act that way...\"");

		addChoice("Fiine. Let's just play.", explore.bind("wait2"));

		}

		if (seg == "wait2") {

		append("Last time was really bunny-focused, too, you think to yourself. It's about time you took a bite outta this wolf.\n\nYou step toward her, drawing into contrast the size difference here: your big adult frame looks so intimidating, the way it looms over her little body, the way your shadow hugs her nude curves. The ones that peek out past her cloak, anyway.\n\nShe doesn't move an inch away from you. You keep approaching, then, even if she isn't going to let you back her up against the wall or anything mega dommy like that, and in a moment you're so close you might as well be embracing her: the curve of your stomach hovers just before her face, and your "+pickByGenitals("cock", "cunt", "cock")+"bulge brushes her exposed throat. Every time Red feels that stifled warmth against her windpipe, she swallows hard.\n\nRed smiles up at you and places a paw on your bulge. Fuck groping or teasing, she just tucks a claw into your zipper and slashes the whole thing open. Your pants and undies drop. "+pickByGenitals("Your hardening cock holds them up for only a second, curved down with the waistband caught under the rim of your cockhead, then it sproings free and fwaps her in the chin", "Warm air billows from the fireplace and washes over your bare cunt. You get a bizarre urge to pee, as if you'd just dunked your hand in a bowl of hot water, so you tense up. Red smirks at that delicate little pussytwitch", "Your hardening cock holds them up for only a second, curved down with the waistband caught under the rim of your cockhead, then it sproings free and fwaps her in the chin. Just below, tucked behind the nuts, your exposed puss tingles. Warm air billows from the fireplace and washes over it. You get a bizarre urge to pee, as if you'd just dunked your hand in a bowl of hot water, so you tense up. Red smirks at that delicate little pussytwitch")+".\n\n\"Come here,\" she whispers.\n\nShe turns you away from the bunny and throws her arms around your waist in a big squishy wolfhug. It's like a bear hug, except instead of crushing you, she just sticks her muzzle "+pickByGenitals("under your nuts", "between your cuntlips", "under your nuts, between your cuntlips")+", and huffs a huge breath of your scent.\n\n\"Mmmff... you smell good,\" she informs your "+pickByGenitals("nuts", "pussy", "pussy")+". \""+pickByGenitals("Lift them for me, yeah?", "Spread your cuntlips for me.", "Lift them for me, yeah?")+"\"");

		addChoice(pickByGenitals("Lift my nuts.", "Spread them.", "Lift my nuts."), explore.bind("wait2a"));

		}

		if (seg == "wait2a") {

		append("You "+pickByGenitals("pull your nuts up as high as you can", "peel your cunt apart with two fingers, one for each lip", "pull your nuts up as high as you can")+", exposing their sensitive underside.\n\nShe dives right back in. You basically just stand and quiver and focus on what it feels like to have a wolfgirl snoofle so vigorously at your "+pickByGenitals("undersack", "slit", "undersack")+"— with your eyes closed you can pretty much pretend she's an excited feral puppy.\n\nYou can only bring a hand down and rest it tentatively on the back of her head while she enjoys your scent. You really don't want to break the trance she seems to have sniffed herself into. She blasts puffs of hot exhale deep into your crotch, interspersed with ticklish snorts now and then. Over time her snout slips deeper and deeper into your crotch, pushing at the tight triangular crevice of your inner thighs, until she's basically bypassed your "+pickByGenitals("nuts", "cunt", "nuts")+" entirely in favor of inhaling raw grundlemusk.");

		addChoice("Okay pull her off.", explore.bind("wait2b"));

		}

		if (seg == "wait2b") {

		append("You unplug her snout from between your legs.\n\nRed blinks, dazed, and wipes some of your sweat from her nose with a forearm. \"Ah. Hm. Interesting smell you got there. Thanks. I always like to get a good read on someone's scent before I um... before we get too close.\"\n\nYou can still feel the condensation her breath left on the underside of "+pickByGenitals("your cock as it hardens", "your cunt as it begins to drip", "your cock as it hardens")+". It's warm and wet, which you kinda guessed already, but sometimes it's good to remember the basics; for example, little wolf pussies are almost always warm and wet, but it certainly doesn't hurt to specify that Red's pussy is hot enough to pop a glowcorn kernel (if you stuck one deep enough inside her) and wet enough to run streaks of juice down to her knees.\n\nShe smears the ghost of her breath around your "+pickByGenitals("cockmeat", "cunthole", "cockmeat")+" with a paw. Her pads slicken in the moisture and curl to "+pickByGenitals("squeeze your shaft", "dig inside a little, to fish out a few sloppy strands of oil", "dig inside your cunt a little, to fish out a few sloppy strands of oil")+". She stares at you, eyes half-lidded and piercing in their lust. Her free paw roams to your lower stomach.\n\n\"Here,\" she whispers, and undoes her cloak's carrot clasp.\n\nThe cloak slips off her smooth little shoulders and floats down to the hardwood. She steps out daintily, placing her feet inside yours.\n\n\"What do you want to do to me...?\"");

		addChoice("Let's put that little maw to good use.", explore.bind("BJ1"));
		addChoice("How about we skip to the fucking?", explore.bind("fuckin1"));

		}

		if (seg == "BJ1") {

		append("Red grins. \"<!i>That<!i> little maw? It's not <!i>my<!i> little maw anymore?\"");

		addChoice("Sure it is, idk. 'That' just sounded better at the time I guess. Sorry.", explore.bind("BJ1anice"));
		addChoice("Nope. It belongs to me now.", explore.bind("BJ1a"));
		addChoice("Shut the fuck up slut, your throat is public property.", explore.bind("BJ1a"));

		}

		if (seg == "BJ1anice") {

		append("\"Come on.\"\n\nShe shakes her head and tucks a few fingers between her legs to keep her cunt from drying up due to boredom. \"You've got a butt-naked cub at your feet here claiming she actually owns any given part of her body. Set her straight. It's fine, she deserves it. Besides... the only person who could stop you from abusing that little maw is in a coma over there.\"");

		addChoice("3:< Open. Now.", explore.bind("BJ1a"));

		}

		if (seg == "BJ1a") {

		append("She drops her jaw open lazily. Strings of saliva hang between the roof and her tongue.\n\nShe rubs her cheek up against your crotch, painting it with your premature juices. Her tiny tongue hangs out all sloppily, never full-on licking your "+pickByGenitals("dick", "cunt", "dick")+", only ever grazing or hovering only inches above. Her little fangs tease and scrape lightly along the curve of your "+pickByGenitals("shaft", "cunt", "shaft")+".\n\nThen, finally, she pulls back and opens wide, spreading her lips and presenting her tight little throathole as a sub might spread their asscheeks and present their pucker. Your "+pickByGenitals("cock twitches", "cunt throbs", "cock twitches")+" in the rush of hot wolfbreath.");

		addChoice("Get that little maw ready.", explore.bind("BJ1b"));

		}

		if (seg == "BJ1b") {

		append("It's too tempting not to. She's opening so wide for you. You can see every shimmering contour of her tongue, her uvula, her inner cheeks.\n\nStill, you wait a moment. She starts hopping back and forth on her feet with anticipation. Her lust corrupts even that innocent, childish gesture in about five seconds when she realizes she could be shifting her weight through her thighs instead of through hopping, so she promptly starts doing a sexy little squirming dance for you in which she crushes her pussy between two clenched thighs and grinds them back and forth like she's holding in a ferocious piss.\n\nEnough.\n\nYou stick two fingers in that waiting mouth, pressing down on her tongue, making her open as far as she can, stretching both her cheeks out from the inside... you give her uvula a dainty pinch, just to hear her gag. You pump two fingers down the back of her throat, just to hear her do it again.\n\nBy the end she's panting like a puppy, slobber dangling off her tongue and your fingers. She's ready.");

		addChoice(pickByGenitals("Push into her mouth.", "Pull her snout to my cunt.", "Push into her mouth."), explore.bind("BJ1c"));

		}

		if (seg == "BJ1c") {

		append(pickByGenitals("You slowly lower the tip of your cock to that dripping tongue and slide it into her mouth", "You pull her head close and shove her snout between the folds of your pussy, implicitly commanding her to lick", "You slowly lower the tip of your cock to that dripping tongue and slide it into her mouth while she moves her fingers up to play with your wet cunt")+".\n\nThe moment her tongue launches into the first technique, a tingle skitters up your belly. She's good. Oh, she's really good. She's not sucking or licking or slurping, fuck those low tier trash strats. She's not even teasing you with her fangs or "+pickByGenitals("swallowing on your head", "pumping her tonguetip inside you", "swallowing on your head")+". To be honest, you don't know <!i>what<!i> she's doing. All you know is her tongue is flippity-floppering like crazy and twisting back on itself and, in turn, beating the absolute fuck out of your pleasure buttons.\n\nThis is more than a blowjob. This is tactile performance art.\n\nShe looks up at you and winks, all smug about it.");

		addChoice("Hold her head down. Fuck her face.", explore.bind("BJ2"));

		}

		if (seg == "BJ2") {

		append("Those prideful, half-lidded eyes are far too dry. You think you'll make them water a little.\n\nYour adult-sized hand closes easily around the back of her little cub skull. You bury your fingers in her hair and shove her face against your crotch to the point where her nose is forced to scrunch up"+pickByGenitals("", " against your clit", "")+". As her pussy drools down her legs you kick them open to get a better look at it.\n\nAh! Just as suspected, you can increase the flow of her oils by "+pickByGenitals("flexing your cock in her throat", "flexing your cunt and filling her open maw with your own", "flexing your cock in her throat")+". Every time you do, she swallows submissively and shivers out a few fresh droplets.\n\n"+pickByGenitals("You yank her skull forward and bounce your crotch against her face, pumping your sizeable cock through her sweet little muzzle", "You pull her head back and start to hump vigorously at her snout, making sure her tongue dips deep inside your hole", "Between pulling her back and shoving her forward, you happily pound your hips against her face, pumping your sizeable cock through her sweet little muzzle. Somehow, through the lack of breath, Red still manages to keep her fingers up your pussy, sliding in time with the motion of her throat")+".\n\nAh, there we go. You roll your hips and pick up the pace, and that's enough to do the trick: her pretty yellow eyes wince up and start watering. Fat little teardrops roll over her puffed-out cheeks.");

		addChoice(pickByGenitals("Hilt her throat.", "Smother her a little.", "Hilt her throat."), explore.bind("BJ2a"));

		}

		if (seg == "BJ2a") {

		append(pickByGenitals("You spear that little maw open right to the base of your dick. She gags hard, throatmuscles squeezing just a fist's distance above the base", "You smother her with your dripping folds, making sure to keep her cold, sniffy little nose glued to your clit", "You spear that little maw open right to the base of your dick. She gags hard, throatmuscles squeezing just a fist's distance above the base")+".\n\nYou hold her there. Her tongue keeps working, but it's losing steam now.\n\nA little longer... liiiiiittle longer...");

		addChoice("Give her some air.", explore.bind("BJ2b"));

		}

		if (seg == "BJ2b") {

		append("You let her up.\n\nRed gasps as you "+pickByGenitals("unplug your meat", "peel your pussy off her face", "unplug your meat")+". Cute teartracks stripe her cheekfur. Slobberstrings still link her lips to your "+pickByGenitals("tightened sack", "cunt's", "tightened sack")+".");

		addChoice("Examine her breaths.", explore.bind("BJ2c"));

		}

		if (seg == "BJ2c") {

		append("... Well, she just gasped, but that's it. One breath.");

		addChoice("Good enough. Put her back under and cum hard.", explore.bind("BJ2d"));

		}

		if (seg == "BJ2d") {
		cumEffect();
		append("She breathes in for a second time and quickly finds she's inhaling "+pickByGenitals("a throatful of adult cock", "your cuntjuice", "a throatful of adult cock")+". She coughs, gurgles, tries pointlessly to gasp again. You grab her head while she flails and complains and bring it right back down to where it was: "+pickByGenitals("smashed up against your nuts and your lower belly", "deep between your thighs", "smashed up against your nuts and your lower belly")+".\n\n"+pickByGenitals("One, two, three, four vicious thrusts before your balls convulse and you spray a jet of "+(isActive("Mood Ring")?getMood("You"):"")+"cum against the lining of her throat, turning her dry gags into wet little cumgurgles, overflowing her maw and her nose. "+(isActive("Mood Ring")?getMood("You").toTitleCase()+"j":"J")+"izz drips from her nose in big bubbles and slops out over her perfectly clean chest, matting the fur on her ginormo loli tits", "Your pussy convulses against her ferocious little tongue and you re-tighten your grip on her skull to make absolutely sure she guzzles every drop you're so graciously giving her straight from the tap. You roll your hips back and forth, smearing hot cuntslime over her nose, her chin. She even coughs a little and a few bubbles form around her nostrils", "One, two, three, four vicious thrusts before your balls convulse and you spray a jet of "+(isActive("Mood Ring")?getMood("You"):"")+"cum against the lining of her throat, turning her desperate gags into pathetic little cumgurgles, overflowing her maw and her nose. "+(isActive("Mood Ring")?getMood("You").toTitleCase()+"j":"J")+"izz slops out over her perfectly clean chest, matting the fur on her ginormo loli tits, and, likewise, your cuntjuice splurts out over her idle fingers and speckles her chest just afterward")+".\n\nWhen you pull off this time, she can't even get her shit together enough to gasp. She just gawks at you, jaw hanging open, eyes baked over with lust, and allows the remnants of your orgasm to slop out over her chin. She falls to her knees in the puddle and chokes a few wet breaths down her "+pickByGenitals("fucked-raw gullet", "oil-clogged esophagus", "fucked-raw gullet")+".\n\n\"It tastes... so good...\" Red gurgles. There's a mess between her legs. Her cute cubcunt is just begging for attention.");

		addChoice("Time to "+pickByGenitals("drill", "fuck", "drill")+" this slut!", explore.bind("fuckin1"));

		}

		if (seg == "fuckin1") {

		append("Red's small body is easy to manipulate. You get a grip on her throat with one hand and her cunt with the other and toss her easily onto the bed. Her head lands near the Bunny's feet.\n\nAs generally peaceful as the catatonic lagomorph may be, she's still having those little fits with her legs, and she just so happens to grind the sole of one cute footpaw over Red's excited expression.\n\nRed gives the bunny's foot a cursory lick (her toes wiggle) and then flips around so she's on her back, feet facing forward. Her cunt is already waiting for you, and she spreads her legs to accentuate that fact, but before you get too entranced with it she changes position one more time, only slightly:\n\nRed lifts her legs up. Way up. She grabs her own feet and pulls them to her shoulders.\n\nThis has the delightful effect of revealing her tiny cub ass in entirety; two globes of jigglish fat held taut beneath a layer of fur. It's perfect. Gravity coaxes a few precious pearls of oil out from her cunt and funnels them down her asscrack, which is just the cherry on top.\n\nYou're staring. She lets one foot drift off to the side and uses that free paw to reach down and spread her puffy little asshole with two fingers in a V shape like it's nothing but a second cunt to her.\n\nHer fingers tease that little coin slot open and closed, open and closed. Cuntslobber leaks inside it when it opens and dribbles out with a cute wet noise when it closes.\n\nShe's practically begging you to destroy her with her eyes. \"So... which hole you gonna take?\"");

		addChoice("Right in the pussy!", explore.bind("fuckin2"));
		addChoice("Take that ass right now.", explore.bind("anal1"));

		}

		if (seg == "fuckin2") {

		append("However much of a buttslut she clearly is, there's nothing better than a "+(isActive("Pastel Ring")?"seven":"ten")+"-year-old's pussy.\n\nYou get right to it and grab both of her legs, pulling them down and apart. You "+pickByGenitals("press the tip of your slowly engorging cock right up against her hole. She wiggles with anticipation", "move your own pussy up against hers, and she wraps a leg around your thigh to keep it there", "press the tip of your slowly engorging cock right up against her hole. She wiggles with anticipation")+".\n\nShe bites her lip with a fang. \"Alright, respectable choice...\"\n\nShe's warm. Her fur is already starting to glisten with sweat. Her heart's racing. Heat seeps from her cunt. Just as you pass the point of no return, you realize she's actually a little nervous.\n\n"+pickByGenitals("You slowly but relentlessly push forward, crushing her little cubcunt under the weight of your hips. Your cock pops in inch-by-inch. Her pussy stretches to accomodate each one, squeezing your dick like a sleeve", "You roll your hips up against hers experimentally, sliding your wet lips along her stomach first, then lower and lower..", "You slowly but relentlessly push forward, crushing her little cubcunt under the weight of your hips. Your cock pops in inch-by-inch. Her pussy stretches to accomodate each one, squeezing your dick like a sleeve")+". Red breathes deep and slow, like the bunny beside her. That bunny has no idea what you're doing to her best friend right now, just two feet away from her fitful expression.\n\nYou throw all your weight into one good buck, forcing your hips against Red's. She grits her teeth, inhales, and "+pickByGenitals("takes your dick to the core of her cervix like a pro", "pushes her hips right back, sliding her cuntlips all sloppily around and between your own", "takes your dick to the core of her cervix like a pro")+". Ten more bucks follow that one, each faster and harder than the last, and soon you're "+pickByGenitals("spearing her cubcunt open so deeply", "beating her pussy up so mercilessly", "spearing her cubcunt open so deeply")+" that she has to latch to your hips with both sets of claws just to keep from falling off the bed or conking the bunny's head with a stray elbow.\n\n\"Come on!\" she hisses at you through clenched canines. \"Quit messing around and <!i>fuck<!i> me!\"\n\nYeah, she's not nervous anymore.");

		addChoice("<!i>Fuck<!i> her.", explore.bind("fuckin3"));
		addChoice("On second thought, let's pretend I picked ass.", explore.bind("anal1"));

		}

		if (seg == "fuckin3") {

		append("With Red's encouragement, you feel comfortable doubling the already vicious pace.\n\nYou shove her legs up to her shoulders and tuck her paws beneath her knees so she can fold herself in half like a sexy little piece of whorigami while you rail her. Her toes twitch just above her perky ears. The harder she pulls her legs up, the more her back arches, and the further upward her pussy angles. Soon you're leaning over her instead of laying on her, "+pickByGenitals("pounding her straight downward into the mattress. Her petite frame is dwarfed by your upper body alone. It's remarkable. You're not sure anyone could even see her beneath you if they walked into the room right now. Maybe just a tail or an ear poking out from between your hips and the blankets", "grinding her straight downward into the mattress. You yank her legs up and apart even harder, forcing her to do the splits for you as you mash your hot sex up against her own. Her soft fur teases your lips as you work to crush your clits together. Her claws dig into your thighs, and she pushes back against you with the same frantic pace", "pounding her straight downward into the mattress. Her petite frame is dwarfed by your upper body alone. It's remarkable. You're not sure anyone could even see her beneath you if they walked into the room right now. Maybe just a tail or an ear poking out from between your hips and the blankets")+".\n\nRed grabs at you possessively. She's trying to pull you as close as she can, trying to make you fuck her deeper. Her slender little legs wrap around the small of your back and clench there. The back of her knees are super sweaty~\n\nUnder her breath she eggs you on with stuff like \"Unfh... come ON~!\" and \""+pickByGenitals("Fuck is it even in yet?", "Fuck just squirt up my loli cunt already!!", "Let's ruin these fuckin bedsheets with our cuntjuice!")+"\" Eight more thrusts and her tight hole contracts as she cums herself, causing a slick mess to wash over your sensitive bits. The sweetness of her wolfjuice saunters up to your nose and tickles it. The smell is overpowering, soaking up through your sinuses and into your brain; you can feel it rushing you toward your own orgasm.");
		addChoice("Cum.", explore.bind("fuckin3a"));
		}

		if (seg == "fuckin3a") {
			cumEffect();
			append(pickByGenitals("You bury your dick all the way inside her. Your balls smush to her shiny-wet asscheeks. They tense. Pulse. Tighten. Relax. Tightennnn. Relaxxxx.\n\nEach tightening of your sack pushes out about half a cup of "+(isActive("Mood Ring")?getMood("You"):"")+"cum right up against her cervix, so, naturally, by the time you've completely blown your load inside her, the bedsheets are soaked with a puddle of thick "+(isActive("Mood Ring")?getMood("You"):"")+" goo, and her stretchy little cubcunt still gushes more as it contracts with her much longer orgasm. You push your creampie in deeper with a few more thrusts, just to make sure it's soaked nice and deep into her tiny womb", "It hits. You shove yourself hard against her and crank as much friction into your scissors as you can, which is kinda hard to do with so much natural lube sliding around between you. Humping desperately at her smaller body, you feel the warmth of her cum mingling with yours, gushing from hole to hole as both of your asynchronous contractions force it up each other's tunnels periodically. You and Red reach down at the same time to rub your clits, but your bigger fingers bully her little ones out of the way easily, leaving you free to pinch both of them and roll your fingers hard, crushing your tiny nublets together. Red squeals adorably at that, then covers her maw with both cuntjuice-slick paws, blushes, and embarasses herself into a second orgasm.\n\nYour post-orgasm bliss breaks with that squeal, too. You can't <!i>not<!i> cum inside her again if she's gonna press her tiny, quivering pussy to yours and squeal like that while you precision-pinch her cubclit", "You bury your dick all the way inside her. Your balls smush to her shiny-wet asscheeks. They tense. Pulse. Tighten. Relax. Tightennnn. Relaxxxx.\n\nEach tightening of your sack pushes out about half a cup of "+(isActive("Mood Ring")?getMood("You"):"")+"cum right up against her cervix, so, naturally, by the time you've completely blown your load inside her, the bedsheets are soaked with a puddle of thick "+(isActive("Mood Ring")?getMood("You"):"")+" goo and both of your pussyjuices, and her stretchy little cubcunt still gushes more as it contracts with her much longer orgasm. You push your creampie in deeper with a few more thrusts, just to make sure it's soaked nice and deep into her tiny womb")+".\n\n\"Fuck...\" Red moans to you, eyes half-lidded. \"I... I think I'm done... don't wanna go too far here...\"");

		addChoice("Wind down.", explore.bind("bunny1"));
		addChoice("Too bad. Time for anal!", explore.bind("anal1"));
		}

		if (seg == "anal1") {

		append("You manhandle Red onto her hands and knees, both furry paws sinking into the slightly wet sheets. You claim her ass, grabbing it, molesting it, pulling her hips up so it sticks up in the air as sluttily as possible. Her furry little butt is just so round and plump, you mean, you don't wanna be rude, but the pucker just above her swollen sex calls to you clearly. \"Rape me,\" it says. \"Yank me open!\"\n\nWho are you to question a talking butthole? You slide up behind her, bumping your hips to hers, and place a hand on that lovely little butt. She purrs at you, low and quiet. You peel her cheeks apart with a thumb. Red's peeking over her shoulder at you in anticipation.\n\nWhen before she was mostly subdued, now her ears have perked and her tail's lifted high to expose as much of herself to you as possible.\n\nShe winks her pucker at you.\n\n\"Stop groping and just destroy my little ass already.\"\n\n");

		addChoice(pickByGenitals("Assfuck.", "Finger her ass open.", "Assfuck."), explore.bind("anal1a"));

		}

		if (seg == "anal1a") {

		append(pickByGenitals("You move onto your knees to rest your big cock between her comparatively tiny buttcheeks, rubbing it back and forth along her pucker", "The fingers of one hand rub at her holes, smearing her pucker with cuntjuice, while your other hand does the same to your own", "You move onto your knees to rest your big cock between her comparatively tiny buttcheeks, rubbing it back and forth along her pucker")+". Instead of relaxing, now that you're moving forward, this continued foreplay only seems to make her more agitated and impatient. She just wants to get gaped already!!\n\nFine. You cut the foreplay off and "+pickByGenitals("press the head of your dick slowly up against her ring. It stretches reluctantly at first, then, after a good <!i>oomph<!i> of added pressure... it splits open and swallows you whole, sucking right to the base like some kind of ravenous butt throat", "slide two fingers deep into her ass and another two into your own pussy, giving a few experimental thrusts to see her reaction... she groans at you and wiggles, already jamming her butt against your hand. Yes. Yes, the jury is out. She loves the way you punch those digits up against the walls of her ass, confirmed", "press the head of your dick slowly up against her ring. It stretches reluctantly at first, then, after a good <!i>oomph<!i> of added pressure... it splits open and swallows your dick whole, sucking you right in to the base like some kind of ravenous butt throat")+"~\n\nThat long wolftongue lolls from her mouth as she starts to pant, impatiently ramming her ass back against you.");

		addChoice("More and harder.", explore.bind("anal2"));

		}

		if (seg == "anal2") {

		append("Her impatience eventually rubs off on you.\n\nWith her tight ass squeezing you so nicely, you decide to loosen it up a little. "+pickByGenitals("You lean over her and press one hand to the back of her head and shove her face into her own bedsheets. Her hips arch up at you as a result, and right away you punish her for it by slamming downward against her cub ass, filling it entirely with your adult-sized cockmeat. You start to slam downward against her upraised thighs, pinning her against the cushy matress with two hands now. Every time you pound Red's young hole open, the bunny girl bounces on the bed beside you, her tongue lolling and her eyes fluttering adorably", "Adding a third finger seems like a good start, but, in order to make certain she takes it, you lean over her, press one hand to the back of her head, and shove her face into her own bedsheets. Her hips arch up at you as a result, and right away you punish her for it by slamming all three fingers deep into her cub ass. She shiiii<!i>iiii<!i>iivers and makes some cute noise into the bedsheets.\n\nYou take special care to grind your digits right along the inner wall shared by her pussy in an attempt to beat up her g-spot from the inside while you furiously do the same to your own. Red begins to twitch with each impact. Her ass rolls up against your fingers as you jam them in knuckle-deep. She seems to be enjoying it enough, though, cause her pussy is seeping hot, shiny girlsauce down her legs, so you pull three sopping wet fingers out of your own cunt and put them to work on her clit, rubbing it so fast your digits are just a glimmering blur", "You lean over her and press one hand to the back of her head and shove her face into her own bedsheets. Her hips arch up at you as a result, and right away you punish her for it by slamming downward against her cub ass, filling it entirely with your adult-sized cockmeat. You start to slam downward against her upraised thighs, pinning her against the cushy matress with two hands now. Every time you pound Red's young hole open, the bunny girl bounces on the bed beside you, her tongue lolling and her eyes fluttering adorably")+".\n\nAfter a minute or two of this, all of her squeals and groans and moans and twitches, repressed as they were, have stopped. You go faster, harder, deeper... all the standard things you've habitually done in other sex scenes. That's what you're supposed to do if your sub doesn't seem as pleased as they did, right? Just "+(data.hasCunt?"finger":"")+"fuck deeper and harder...?\n\nShe peeks at you from where you're holding her into the bedsheets. Deep in her eyes you see something kind of like reluctant boredom.\n\nShe wants something more. She won't ask for it, that's for sure. But... you need to go a little further to really please her...");

		addChoice("Spank her.", explore.bind("analslap"));
		addChoice("Donkey punch her?", explore.bind("analpunch"), {kinks: ["Abuse"]});

		}

		if (seg == "analslap") {

		append("You lance a palm off her bubbly little asscheek, hard, watching as it ripples and reddens. That's not quite what she wanted, you think, but it's enough to draw a startled squeak from her and snap her out of the boredom. She bites her lip, riding out the sting with a few quivery gyrations on your "+pickByGenitals("dick", "fingers", "cock")+".");

		addChoice("Cum.", explore.bind("anal3"));

		}

		if (seg == "analpunch") {

		append("You bounce a fist off the back of her skull.\n\nHer expression flickers to pure, blissed-out shock. She gasps and cums in that instant. Her cunt convulses and splurts a couple hot droplets over your "+pickByGenitals("throbbing nuts", "wrist", "throbbing nuts")+". \"A-Ahhnnnhgh!\" she drawls pathetically, which is some of the longest and most unmuffled vocalization you've ever heard from her. \"You h-hit me!\"\n\n... Her ass quivers extra hard and pushes up high. She runs a paw over the big round lump on the back of her head, almost groping it. \"... Th-Thanks...\"");

		addChoice("Cum.", explore.bind("anal3"));

		}

		if (seg == "anal3") {
		cumEffect();
		append(pickByGenitals("Forcefully slamming your dick inside of her doesn't get old at all. In fact, it gets better every thrust, because with every thrust her ass loosens up 2% more and her hole gets just that little bit more sloppy and puffy from the constant abuse, which of course means more surface area to massage your shaft. You ram your cock in til you can't fit any more and rest there for just a second while her ass squeezes and contracts around you", "You add another finger to her ass and to your cunt, stretching the both of you too wide for comfort, frankly, but you don't care about comfort any more than she does; you drive your fingers so far inside her abused ass that her soft little anal ring slips hugs your knuckles. You feel her squeezing around you, convulsing with pleasure", "Forcefully slamming your dick inside of her doesn't get old at all. In fact it gets better every thrust, because with every thrust her ass loosens up 2% more and her hole gets all sloppy and puffy from the constant abuse. You ram your cock in til you can't fit any more and rest there for just a second while her ass squeezes and contracts around you")+". The feeling is wonderful, like she's actively clenching and trying to milk you even though she's just wracked with involuntary orgasmic contractions, but you aren't allowed to savor it for long. Red whines at you impatiently, begging you to finish!!\n\n"+pickByGenitals("You squeeze her ass with one hand as you begin to pound her again, drilling her full to the brim. Her buttcheek fur is so soft and nice as it sifts between your fingers, you can't help but spend some time playing with her butt instead of focusing on pumping her full of "+(isActive("Mood Ring")?getMood("You"):"")+"cum like she so desperately wants you to do. A pissed-off little growl speeds that along too. You have no choice but to double your strength and finally give her what she deserves.\n\nHer lil underaged hips are powerless against actual full-power thrusts from an adult— the kind you have to do if you're really trying to get off as fast as you can— and they crumple down against the sheets right away. She lies flat while you destroy her ass, obedient and needy, her cunt grinding down into a puddle of her own arousal.\n\nRed releases a shout of pleasure and cums hard the moment your hot "+(isActive("Mood Ring")?getMood("You"):"")+"goo finally gushes inside her", "You don't see why she cares, it's not like she's gonna be guzzling your cuntjuice or feeling your lips quiver against her, but either way you forcefully thrust your fingers into her, your thumb now pushing into her tight little pussy as well. You punch both holes open with one hand while your the other works at your dripping cunt, yanking at your clit, burying deep inside your folds. Red meets the rhythm. Her hips work in sync with your hand. She clearly enjoys the feel of her ass getting violated more than her slit, since she reaches back to yank her cheeks open for you. She's more interested in your cunt; she looks down between her legs, past the trickling stream of her oils, anticipating the sight of it squirting.\n\n... Ah. Now you see. She cums again, and hides her blushing face. She's probably feeling a little guilty about getting all the attention, and wanted you to cum first. What a little sweetie.\n\nNow, with your hand soaked by her juices, you unplug your thumb, lift her head up, and pop it right in her maw. The sight of her sucking on it lustily, with her eyes half-lidded and her paws clasped around your wrist... that's enough to send you over the edge.\n\nYou tense up and splatter her abused ass with your juices, filling it up right to the brim", "You squeeze her ass with one hand as you begin to pound her again, drilling her full to the brim. Her buttcheek fur is so soft and nice as it sifts between your fingers, you can't help but spend some time playing with her butt instead of focusing on pumping her full of "+(isActive("Mood Ring")?getMood("You"):"")+"cum like she so desperately wants you to do. A pissed-off little growl speeds that along too. You have no choice but to double your strength and finally give her what she deserves.\n\nHer lil underaged hips are powerless against actual full-power thrusts from an adult— the kind you have to do if you're really trying to get off as fast as you can— and they crumple down against the sheets right away. She lies flat while you destroy her ass, obedient and needy, her cunt grinding down into a puddle of her own arousal.\n\nRed releases a shout of pleasure and cums hard the moment your hot "+(isActive("Mood Ring")?getMood("You"):"")+"goo finally gushes inside her")+".\n\nThere.\n\nIt's over.\n\nYou lay there with her on the bed, gasping for breath. You're both pretty much soaked with various juices. The only person present who isn't coated in either sweat or girlcum is the bunny, who's merely splattered partially with sweat and girlcum.\n\nShe's still sleeping fitfully. Her eyes have stopped moving under their lids.");

		addChoice("Wind down.", explore.bind("bunny1"));

		}

		if (seg == "bunny1") {

		append("You cuddle on the bed with her. Red snuggles up to you, ignoring the sticky fur from all of the love fluids. She sighs. She runs a paw over your back, squeezes your butt.\n\nBut... after a while of this, just quiet soft cuddles while the two of you soak in the afterglow, you start to think something is weird: the mattress is kind of uneven sometimes. The balance of weight between you is shifting.\n\nSomething is moving.\n\nIt's not you, and it's not Red.\n\nThe bunny stirs and sits up slowly. Her eyes are empty. Her legs curl up beneath her and extend. In one fluid, robotic motion, she stands up on the bed and looks down at the both of you.\n\n\"Hello <!b>player name.<!b>\"\n\n");

		addChoice("Uh.", explore.bind("bunny2"));

		}

		if (seg == "bunny2") {

		append("Red immediately tackles the bunny and flattens her onto the bed. She grabs the bunny's arms and holds them together and sits on her chest and flashes you a sheepish smile, all at once.\n\n\"Haha! She sometimes sleepwalks, yeah!\" she hurries. \"Nothing to worry about— just gotta finish up uh— you interrupted something when you popped in, so, if you could just let me finish that up...\"");

		}

		if (seg == "respawn1") {

		append("You respawn outside, halfway inside a bush.\n\nRed's suspicious face pops up in a side window. She searches for you frantically, going from window to window, even coming out circling the house, but it turns out being stuck ass backwards in a bush makes for pretty good camoflage.\n\nShe heads back inside. The lock on her front door clicks into place. She unlocks it and locks it again to be sure.\n\nYou see her through the front window, now, bending over the bunny and coaxing her slack maw open with a gentle thumb. A gossamer stream of emerald liquid pours from Red's cup into the bunny's maw— heavily steeped sweetgrass tea, you know now— and Red waits until those last few drops fall past the sweet bunny's lips before she sets the cup aside and grabs a little orange carrot-shaped brush.\n\nShe picks up a handful of long blonde hair and runs the brush through it. Next she brushes the fur of each long ear and the thick patch of fur around her chest tuft. She reaches down and fluffs up that cute little poof tail and brushes it and makes sure it's standing nice and proud.\n\nThen Red looks through the window one last time— almost catching sight of you.\n\nShe leans down... careful... slow... and her lips purse up... but, instead of making out with her friend's helpless maw, or sucking her face, or doing anything lewd, Red simply pecks the bunny's soft white forehead and slips into bed with her. Both their flat chests rise and fall in sync.\n\nTime passes. The bunny's breathing slows down as the sedative courses through her little body, but it never slows enough to kill her.");

		}

		if (seg == "afterApo1") {
			unlockJournal("Red After Apo");
			msg("<!img:kink/Guest Writer.png> Guest Writer: Taylertots", true);
			append("Well, you think it would be rude to 'barge.'\n\nCarefully, you push the door open. It creaks as you creep inside. The unmistakably violent stank of sweetgrass permeates the air and invades your nose like the floral fingers of some dank mossy nostrilfucker.\n\nThe first thing you see are the two tanks of sweetgrass tranquilizer leaning up against her living room wall, and "+(data.redChoseCity?"a pile of packed bags that towers in the back of the kitchen. There's a few pies on the kitchen counter, too. You guess Rox came over and they worked out a babysitting plan. Everything looks neat and wiped-clean.":"a few poorly sewn dolls shaped like little gray men with ties on. The dolls have all been torn to shreds and now they litter the floors. In just the short while since your last visit, Red managed to stain the walls with spilled food, break the hinges on one of her doors, bust a hole in the wall, and uproot about half of the clothes from her bedroom without caring where they ended up. The place is a disaster.")+"\n\nRed sits beside Mary, near the fire. Some tea is boiling. Looks like she made it from scratch"+(data.redChoseCity?" one last time":"")+", ignoring the perfectly good tanks of sweetgrass tranquilizer behind her.\n\nShe pours Mary a steaming hot mug of bright green sweetgrass tea while idly rubbing her little clit. She places the mug down on the coffee table and hangs the steamy kettle back over the fireplace.\n\nMary's ears perk up as the door squeaks. She fixes her wide-eyed stare directly on you.\n\n\"Hi <!b>player name.<!b>\"");
			addChoice("Dodge Red's imminent attack.", explore.bind("afterApo2"));
		}

		if (seg == "afterApo2") {
			append("You barely even snuck past the doorway and Mary's already called you out!!\n\nYou instinctually flinch to the side. The next thing you feel <!i>must<!i> be a balled-up cub fist connecting with your stomach, followed by you doubling over and hitting the floor.\n\n... The abuse doesn't come.\n\nInstead, Red speaks to you in a flat, dejected tone.\n\n\""+data.playerName+"? Hey. I'm not gonna hurt you. I'm just finishing up with today's dose. Wanna help me out this time?\"\n\nShe looks distracted.");
			addChoice("What's wrong?", explore.bind("aside"));
			addChoice("Help give the bunny her medicine.", explore.bind("bunnyGive"));
			addChoice("Let Red take care of it.", explore.bind("redTake"));
		}

		if (seg == "aside") {
			append("She watches the kettle breathe for a moment. Her nostrils flare as the pungent sweetgrass steam drifts upward. Sexy curls of blue and pink roll up her face. She leans over and huffs the fog in deeply. Then... slowly... she exhales a relaxed sigh.\n\n\"Conflicted. It's just... it loosens me up so much. Just wondering if I should try some again, given all that's happened...\"\n\nShe turns to face you with a flaccid, suggestible expression.\n\n\"What do you think?\"");
			addChoice("If that's what you need to cope.", explore.bind("cope"));
			addChoice("I'd give it a bit more thought.", explore.bind("thought"));
		}

		if (seg == "cope") {
			append("\"I can cope,\" she says, hurt.\n\n"+(data.redChoseCity?"She glances at her neatly-packed bags":"You carefully avoid staring at the massive mess behind her")+".");
			addChoice("Help give the bunny her medicine.", explore.bind("bunnyGive"));
			addChoice("Let Red take care of it.", explore.bind("redTake"));
		}

		if (seg == "thought") {
			append("She pulls her face out of the steam and blinks. Her eyes are glazed a light salmony-pink.\n\n\"Maybe you're right.\"");
			addChoice("Help give the bunny her medicine.", explore.bind("bunnyGive"));
			addChoice("Let Red take care of it.", explore.bind("redTake"));
		}

		if (seg == "bunnyGive") {
			append("Red gestures over to the counter.\n\n\"You wanna help? The funnel. Get the funnel.\"");
			addChoice("Get the funnel.", explore.bind("bunnyGive2"));
		}

		if (seg == "bunnyGive2") {
			append("You grab it and stand around like a dork.\n\n\"Now put it in Mary's mouth,\" Red continues. \"Very gently now. Open your mouth, Mary.\"\n\nMary can't communicate, but she does part her lips when she dispenses another \"Hello <!b>player na<!b>—\"\n\nYou gently place the narrow end of the funnel into Mary's waiting maw and cut her off with a deft thrust of the funnel's skinny end. It slides easily down her throat, and the fat part bumps up against her slack lips.\n\nRed covers her cunt with a few fingers and bites her lip.");
			addChoice("Mmmmf... there we go.", explore.bind("redTake2"));
		}

		if (seg == "redTake") {
			append("Red casually places the narrow end of the funnel into Mary's waiting maw. She knows exactly how to fit it so that it slides down her throat with minimal resistance. The fat opening presses against Mary's lips.");
			addChoice("Next.", explore.bind("redTake2"));
		}

		if (seg == "redTake2") {
			append("Red pours the steaming sweetgrass tea down the funnel and pats that soft bunny belly. \"There we go. Good girl.\"\n\nMary softly swallows the tranquilizer. With each gulp, the funnel slowly empties. Her eyelids droop and the creamy whites of her eyes redden as the sedative works its way through her body.\n\nRed sets the empty mug aside and strokes Mary's head, ruffling her long, soft ears. Mary gurgles confusedly. Her empty eyes start to fill with pink.\n\n\"Shh, it's okay... just relax... "+(data.redChoseCity?"the big bad wolf's just gonna be away for a little while... mama Rox is gonna take care of you...":"I'm here... I'll always be here...")+"\"\n\nShe eyes you sideways and drops her speech to a cooing whisper in Mary's ear. Her paw runs in tiny circles over Mary's belly.\n\nWithin minutes, those droopy white eyelids close all the way, and her breathing slows down.\n\nRed turns and glares at you. There's a growing wet spot where her swollen little puss meets the chair she's been sitting on. It's clear there are some needs that aren't being met here.\n\nRed's tiny loli paws make their way back down to her cunt the moment she puts the mug and kettle down. She closes her eyes and tries to get into a rubbing rhythm, but your presence distracts her. She looks up at you as she continues to work on herself, eyes half-lidded— but there's nothing bedroom-y about them, nothing inviting. They're baggy. She's just too exhausted to open them all the way.\n\n\"Help me out or get lost,\" she murmurs.");
			addChoice("Help her!! <3", explore.bind("afterApo3"));
		}

		if (seg == "afterApo3") {
			append("Red grabs your "+pickByGenitals("cock", "face", "cock")+" and rams her pussy up against it, clumsy, tired. You inhale sharply as she violently gyrates her little hips, sparing no time for warmup or foreplay. She drives her "+pickByGenitals("hole down to the base of your dick like it's her job", "cunt up against yours like it's her job", "hole down to the base of your dick like it's her job")+". The bunny snores gently in the background, funnel still hanging out of her maw, only audible between the violent, constant <!i>smack smack smack<!i> of Red's pussylips colliding against you.\n\nShe grits her teeth, canines poking over the lower row, and wraps her legs around the back of your thighs. She pulls you close and fucks you as hard as she possibly can. Beads of sweat appear on her forehead. Ingredients rattle and fall off the nearby tables.\n\n\"Come on,\" she growls, still unsatisfied. You can almost feel the untouched, burning itch in her cunt. You haven't even begun to scratch it yet. \"Come on. Rape me.\"");
			addChoice("Hold her down by her throat.", explore.bind("afterApo4"));
		}

		if (seg == "afterApo4") {
			append("You slam your hand onto her throat and pin her to the wall while you fuck her.\n\nHer little "+(isActive("Pastel Ring")?"seven":"ten")+"-year-old cunt "+pickByGenitals("splits open way wider", "drools harder", "splits open way wider")+" than any cub's should. She shivers with neediness. Sweat smears on the wallpaper as your pin naturally weakens with exhaustion over time and her ass starts to slide down. Beads of cuntjuice roll over her thighs and your own. Her body hopes that more lube will equal a deeper and more pleasurable fuck, but whatever you do, however hard you pound your hips against hers... it's just not good enough.\n\nAfter a while she motions to be let down. She lands on shaky feet. Her pussy twitches, bright red, swollen, thoroughly molested.\n\nBut she doesn't feel molested. She still feels utterly pure and untouched.\n\n\"I knew I shouldn'tve relapsed,\" she gasps, dropping to her knees. Anxiety bubbles up behind her face. She stuffs it in her paws to hide her despair. \"I can't. I can't cum.\"");
			addChoice("... Ah.", explore.bind("afterApo5"));
		}

		if (seg == "afterApo5") {
			append("Mary snores away, perfectly at peace. Red goes to her side for a moment and touches her face. Then she glances sideways at you and her face goes bright red.\n\n\"I'm not going to touch her anymore, if that's what you're thinking. No. Just fuck off. I need some time alone.\"");
			addChoice("I wasn't thinking that.", explore.bind("afterApoLeave"));
			addChoice("Okay...", explore.bind("afterApoLeave2"));
		}

		if (seg == "afterApoLeave") {
			append("She heads for the back, not looking at you.\n\n\"I said fuck off.\"");
			addChoice("Fine, jeez.", explore.bind("afterApoLeave2"));
		}

		if (seg == "afterApoLeave2") {
			append("You kiss Mary's forehead goodbye and leave the little cabin.\n\nAs you head down the front path, something glints and catches your eye in her backyard: the glass door of the run-down greenhouse. It flaps open, swallows a shadow, and then shuts. The shadow moves inside and takes a seat at the opposite end.");
			addChoice("... Go check it out.", explore.bind("afterApo6"));
		}

		if (seg == "afterApo6") {
			append("Smoke bleeds from the cracks in the greenhouse's glass walls and ceiling. There are a lot of cracks.\n\nThe whole structure leans to the side, exhausted by the years.");
			addChoice("Knock...", explore.bind("afterApo7"));
		}

		if (seg == "afterApo7") {
			append("You rap on the flimsy glass.\n\n\"Who is it?\" Red demands.");
			addChoice("It's me. "+data.playerName+".", explore.bind("afterApo8"));
		}

		if (seg == "afterApo8") {
			append("\""+data.playerName+"?\"");
			addChoice("Yeah. "+data.playerName+".", explore.bind("afterApo9"));
		}

		if (seg == "afterApo9") {
			append("\"Didn't I <!i>just<!i> tell you to fuck off, "+data.playerName+"?\"");
			addChoice("Mhm.", explore.bind("afterApo10"));
		}

		if (seg == "afterApo10") {
			append("\"Then why are you still here, "+data.playerName+"?\"");
			addChoice("Because I wanna talk to you.", explore.bind("afterApo11"));
		}

		if (seg == "afterApo11") {
			append("\"Is that so, "+data.playerName+"?\"\n\nShe's getting snotty now. Probably trying to drive you off again.\n\n\"What kind of a name is "+data.playerName+", anyway? Why'd you pick that?\"");
			addChoice("It's special to me.", explore.bind("afterApoGlass"));
			addChoice("I relate to it.", explore.bind("afterApoGlass"));
			addChoice("My mom used to call me "+data.playerName+".", explore.bind("afterApoGlass"));
			addChoice("I don't know.", explore.bind("afterApoGlass"));
		}

		if (seg == "afterApoGlass") {
			append("Silence from inside. The gentle rustle of paper.\n\n\"I uh. I see.\"");
			addChoice("... So can I come in?", explore.bind("afterApo12"));
		}

		if (seg == "afterApo12") {
			append("She doesn't say anything.\n\nThen...\n\n\"I'm gonna be smoking in here, so... don't come in if that's gonna bother you, or if you're gonna lecture me about that.\"");
			addChoice("I won't.", explore.bind("afterApo13"));
		}

		if (seg == "afterApo13") {
			append("\"Alright. Fine. You can come in for a while. But after that, you fuck off. Okay, "+data.playerName+"?\"");
			addChoice("Okay.", explore.bind("afterApo14"));
		}

		if (seg == "afterApo14") {
			highEffect();
			append("As you walk inside, fat plumes of sweetgrass smoke hit you in the face and lather your brain up with a contact high.\n\n\"Close the door,\" Red's silhouette mumbles. \"I'm trying to hotbox. The cracks are already making it hard to get a good smog going.\"\n\nYou close the rickety glass door. The metal frame whines. Aside from the confused daytime birds chirping in the distance, it's perfectly silent in here, just the sound of you and Red breathing.\n\nIt's hazy as fuck. The smoke is so dense, and its blue-pink tint is so opaque, you can barely see the outlines of Red's body. As it clears, you can start to make out Red's hood in the corner. She's lounging among the tangled, overgrown dickflowers. Starlight filters through the windows and illuminates everything pale green.\n\nMoving to the back of the greenhouse and brushing aside the towering cockflowers reveals a strung-out Red. She looks like the overworked madame of a brothel, except instead of a cigarette in a long, spindly cigarette holder, she brings a loosely rolled, amateurish joint up to her lips, takes a drag, and coughs it out.\n\nShe looks at you. Her face is pockmarked by the beams of green light and framed between two diagonal, half-collapsed greenhouse walls. Dickflowers curl and throb under her armpits, around her thighs. The glass walls reflect her image from all sides.\n\n\"You wanna talk to me.\"");
			addChoice("Yeah.", explore.bind("afterApo15"), {kinks: ["Piss"]});
		}

		if (seg == "afterApo15") {
			highEffect();
			append("Red doesn't respond.\n\nShe pulls her hood down even further and scrunches her body inward, trying to ignore you. She wants to focus on finishing off her shitty joint. Her whole body is languid, unmoving. She pisses on the flowers without clenching a muscle. She basically just allows the piss to fall out.\n\nThe dickflowers slurp it up before it even hits the ground.\n\nThe scent of her pungent wolf cub pee fills the greenhouse and mingles with the smoke. Soon, every drop has been absorbed. You're a bit disappointed that you didn't even get to hear the adorable trickle of her piss meeting the floor.");
			addChoice("I do wanna talk to you.", explore.bind("afterApo16"));
		}

		if (seg == "afterApo16") {
			highEffect();
			append("She rolls her eyes, chuckles, and snuffs her roach on the head of a dickflower. It shudders with the pain and grows a few inches with the pleasure.\n\n\"Ugh,\" she spits. She turns her nose up and narrows her eyes til they're just two cherry-colored slits. \"What is it? What do you want me to exposit about? You players always want to wring everybody for every little bit of lore they've got, don't you?\"");
			addChoice("I just want to make sure you're okay, that's all.", explore.bind("afterApo17"));
		}

		if (seg == "afterApo17") {
			highEffect();
			append("She pauses for a moment.\n\nThen she calmly, carefully places her hands in her lap.\n\n\"Okay. Fine. I'll talk to you... if you let me kick your ass first.\"");
			addChoice("Of course...", explore.bind("afterApoReRejoin"), {kinks: ["Abuse", "Blood"]});
			addChoice("Why?", explore.bind("afterApoWhy"));
		}

		if (seg == "afterApoWhy") {
			highEffect();
			append("Red blinks at the ground.\n\n\"So I can... so I can cum. God, are you really that dumb?\"");
			addChoice("Ah. Sure, of course I'll help with that...", explore.bind("afterApoReRejoin"), {kinks: ["Abuse", "Blood"]});
		}

		if (seg == "afterApoReRejoin") {
			highEffect();
			append("\"It's... been a while,\" she sputters out between sudden coughs.\n\nShe regains control of her lungs with a cute little <!i>ahem<!i> and strides over to you from the other end of the greenhouse, leaning violently sideways to keep from bumping her head against the caved-in walls.\n\nAs her pint-sized (but intimidating) body approaches through the fog, you flinch automatically.\n\nShe looks up at you from crotch height and swiftly kicks out your ankles. You topple pathetically to the floor, hard, on your back, but the soft grass and the overgrown dickflowers soften the landing.\n\nA tiny hindpaw slams down onto your stomach and knocks the wind out of you.");
			addChoice("Oof! You really are a city girl...", explore.bind("afterApo18"), {kinks: ["Toddler", "Gore"]});
		}

		if (seg == "afterApo18") {
			highEffect();
			append("\"I fucking miss that place.\" She grinds her heel into your navel. \"You know this already, but... staying here is hard. It's boring. You can only twiddle your clit in so many ways before you need something more.\"\n\nRed kneels down, grabs your throat, and punches you square in the face. Your nose cracks and blood starts to drip. The sight of it gushing so hard out of your nostrils makes Red lick her lips. Her cunt is sopping wet, dripping onto the soil-strewn ground. The dickflower roots eagerly suck it up.\n\n\"This? What I'm doing to you right now? In the city, this can just happen. I don't even need to ask for it. This can just happen to me any time, or I can grab a toddler from the sidewalk and snap her legs and get my own stresses out. I miss that.\"");
			addChoice("I know exactly how you feel! <3", explore.bind("afterApoRejoin"), {kinks: ["Raunch"]});
			addChoice("Yeah, that's... yeah...", explore.bind("afterApoRejoin"), {kinks: ["Raunch"]});
			addChoice("Mmmm I'm gonna go ahead and move right along...", BrightForest.brightForestHub);
		}

		if (seg == "afterApoRejoin") {
			highEffect();
			append("The sweetgrass coursing through Red's body seems to open her up a bit, emotionally. Busying herself with your abuse allows her to speak without a filter.\n\nShe kicks you right in the kidney. Repeatedly. Each hit is punctuated by a short sentence.\n\n\"Maybe Marei was right.\"\n\n<!i>Punt.<!i>\n\n\"I don't think Mary would want me to live like this.\"\n\n<!i>Crunch.<!i>\n\nYou think you felt something snap inside you.\n\n\"She deserves better.\"\n\n<!i>Thud.<!i>\n\nShe walks over your body, faces your legs, and plants her feet on either side of your face, toes pointed to your stomach. She ogles your "+pickByGenitals("cockmeat", "cuntmeat", "cockmeat")+". Slowly, she squats down onto her knees and sits on your nose. Her soaking little cunt dribbles over your chin. She grinds downward, sliding her hips around. Your nose plugs firmly into her deep, sweaty butthole.\n\nHer voice quivers slightly:\n\n\"L-Lick. So I don't have to worry about you saying something stupid.\"");
			addChoice("Lick.", explore.bind("afterApo19"));
		}

		if (seg == "afterApo19") {
			highEffect();
			append("You obediently slide your tongue over the folds of her fuzzy cubcunt. She grinds against you and drives a couple needy punches into your chest, cracking some ribs in the process. When she hears that satisfying crunch, her puss winks over your mouth and sprays girlcum out onto your face.\n\nRed tenses up and stops moving. She's either lost in thought or in the waves of orgasm. She digs in the pockets of her cloak for a moment. You hear the rustle of paper, the flick of a lighter...\n\nShe inhales too hard for too long. She hacks the smoke up, gasping for breath. Some leaks out of her snout. You feel her asshole clench over your nose and her cunt wink over your lips. Wolfjuice squirts into your mouth with every twitch.\n\nAfter catching her breath, she continues:\n\n\"I just— I don't know if I made the right decision, earlier. "+(data.redChoseCity?"When you told me to move back to the city, and I finally came around to it... I felt so excited. Once I got back home it just died in my chest. I packed my bags and stuff easily enough, sure. But then she woke up":"When you told me to stay in the forest... it felt right. I've been resisting temptation for so long... for her. Just because I thought that's what she'd want. But the possibility popped into my head that... if she was awake... maybe she would just tell me to stop being so obsessive and get on with my fucking life")+".\"\n\nShe sighs again. She lifts her sticky wet crotch up off of your face, freeing your mouth.");
			addChoice("You're right. Mary wouldn't want this life for you.", explore.bind("cityGo"));
			addChoice("You owe it to her to stay.", explore.bind("forestStay"));
			if (getJournalEntries().contains("Kemp Truck")) addChoice("Ummm. Hesitate. Examine lighter.", explore.bind("examineLighter"));
		}

		if (seg == "examineLighter") {
			highEffect();
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/kempLighter.png");
				s.x = GAME_WIDTH-s.width*1.5;
				s.y = GAME_HEIGHT*0.5-s.height*0.5;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Upper-Upper-Layer Artist: Cubber\n\n<!img:kink/Art.png>  Current Layer Artist: Somner Lamblea", "");
			append("\"This thing? Kemp gave it to me when I told him I was thinking about smoking again. He said he wanted to try going clean for a while.\"");
			addChoice("Ah... I um. I see.", explore.bind("examineLighter2"));
		}

		if (seg == "examineLighter2") {
			highEffect();
			append("Red slips it back in her cloak pocket and drags on the joint hanging out of her maw, no hands.\n\n\"Were you going to say something else?\"");
			addChoice("Just... you're right. Mary wouldn't want this life for you.", explore.bind("cityGo"));
			addChoice("I was gonna say you owe it to her to stay.", explore.bind("forestStay"));
		}

		if (seg == "forestStay") {
			highEffect();
			data.redChoseCity = false;
			unlockJournal("Red Moved");
			append("Her quivering pussy hovers just above your mouth.\n\n\"Y-You really think so, huh...\"");
			addChoice("You made a promise to her. And there are plenty of other ways for you to get your needs met out here. Like me!", explore.bind("forestStay2"));
		}

		if (seg == "forestStay2") {
			highEffect();
			append("Red seems a little dejected. \"... Yeah. You're right.\"\n\nShe takes her second shitty joint (the rustle of paper you heard) and twists the lit end into your belly button.");
			addChoice("A-Aaah!!", explore.bind("forestStay3"));
		}

		if (seg == "forestStay3") {
			highEffect();
			append("You suck air through your teeth as it sears you and leaves a small red dot on your innie. Red tosses the   <!img:kink/Snuff.png>   snuffed   <!img:kink/Snuff.png>   joint aside and stands up.\n\nShe starts busying herself with trimming some sweetgrass from the corner of her greenhouse. All you can see is her back and the bottom of her buttcheeks.\n\nIn a low voice, she asks you to please go away.");
			addChoice("Ah... I'm sorry... did I say something wrong?", explore.bind("forestStay4"));
		}

		if (seg == "forestStay4") {
			highEffect();
			append("She asks again.");
			addChoice("Alright, alright, I'm going...", BrightForest.brightForestHub);
		}

		if (seg == "cityGo") {
			highEffect();
			data.redChoseCity = true;
			append("Her quivering pussy hovers just above your mouth.\n\n\"You really think so, huh...\"");
			addChoice("She hasn't had the mental capacity to even remember her promise for decades. I'm sure she would understand if you needed to move on with your life at this point.", explore.bind("cityGo2"));
		}

		if (seg == "cityGo2") {
			highEffect();
			append("Just past the curves of her thighs, you can see she has her face set in stone. She's looking out the foggy greenhouse walls, into the empty, dark forest that surrounds you both.\n\n\"... Yeah,\" she croaks dejectedly. \"You're right.\"\n\nShe exhales. She plops back onto your face and grinds. She sounds relieved, now: \"I think it's settled. I'm going to give her an extra dose and then bring her over to Rox... after I'm done with you.\"");
			addChoice("Oho~?", explore.bind("cityGo3"));
		}

		if (seg == "cityGo3") {
			highEffect();
			append("Red entertains thoughts of the city life as she drops her cunt back onto your face with a mighty <!i>squish.<!i> She mumbles various fantasies to herself, trying to make herself cum.\n\n\"Ugh. Fuck. I can't wait to get a new place. I can just... shove myself in a glory hole for the first week or two. So many new faces every day. So much throat abuse. Get... unff...\" She pauses to really smear her little cub pussy over your tongue, riding it. \"Get locked up to a toilet for a few more... dive into a dumpster or some shit... maybe hook up with Cage again...\"\n\nShe loses herself in her fantasies, babbling on about all of the atrocities she's missed so much. She reaches down and rubs her clit while she humps you. \"Mmmffuuck...\" She slams onto your face over and over. \"Tongue out, slut.\"");
			addChoice("Stick my tongue out...", explore.bind("cityGo4"));
		}

		if (seg == "cityGo4") {
			highEffect();
			append("It's instantly enveloped by her inner folds. You feel her hole squeeze around you. The walls of her cunt flex and milk your tongue as she cums a second time.\n\n\"Fuck,\" she gasps, grabbing your skull with two hands and violently banging her cuntlips down to the base of your tongue. \"Orgasms feel so much better when you're high...\"");
			addChoice("Wind down.", explore.bind("cityGo5"));
		}

		if (seg == "cityGo5") {
			highEffect();
			append("Red cums, lifts herself off of you, and thanks you for helping her cum to a decision about moving or not. She finishes her second shitty joint and leaves the greenhouse.\n\nWhile you have to bend down a bit to get through the door, hobbling along with all your injuries, she just walks right through.\n\n\"Come visit me in the City sometime,\" she says. \"I know a place we can get a bite, too, if you wanna make a date out of it.\"");
			addChoice("I'll see you there, Red. Move along.", BrightForest.brightForestHub);
		}

		addChoice("Move along.", function() {
			stopChannel("deathless");
			gotoHub("Bright Forest");
		});
	}
}
