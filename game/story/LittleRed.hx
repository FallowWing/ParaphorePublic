package story;

class LittleRed
{

	public static function littleRedExplore():Void {
		saveCheckpoint("LittleRed.littleRedExplore();");
		clear();
		setLocation("Red's Cottage");
		addPlace(
			"Red's Cottage",
			"A cottage which used to house a grandmother and a bunny in a red cloak. Now it's just the bunny and the big bad wolf.",
			"Bright Forest"
		);

		if (data.redVisits == 0) {	
			unlockJournal("Red visit");
			append("You spot a cottage half-hidden in a thicket of bramblesnatches and snagweed.");

			if (!data.metLittleRed) {
				append(".. but you don't think anyone's home right now.");
			} else {
				append("The little red-cloaked wolf girl who gave you glowberries from her basket earlier is sitting in the front window, talking to someone you can't see.");
				addChoice("Go thank her.", littleRedThank, {kinks: ["Art", "Cub", "Female"]});
			}

		}

		if (data.redVisits > 0)
			append("You're back at Red's cottage, but it looks like she's out right now...\n\nA note on the front door: <!i>\"Out for a swim.\"<!i>");

		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function littleRedThank():Void {
		saveCheckpoint("LittleRed.littleRedThank();");
		clear();
		var age:String = (isActive("Pastel Ring")?"seven":"ten")+"-year-old";

		append("You knock once, twice, and then she swings it open with surprising force for a "+age+" before you can land the third. The night air rushes in, billowing her cloak; she's completely naked underneath, her tawny, thick wolf fur coating the  curves of her flat chest and slight potbelly. Your eyes rove down and spot the soft mound of Red's pussy, partially hidden  beneath a tuft of fur, before the cloak flutters to a close.\n\n\"Hi,\" she says, a little impatient. \"Can I help you?\"");

		addSprite("assets/img/effect/littleRed.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");

		addChoice("I... uh...", failedToThank);
		addChoice("I never thanked you.", neverThankedYou);
	}

	public static function failedToThank():Void {
		saveCheckpoint("LittleRed.failedToThank();");
		clear();
		append("She waits a couple seconds for you to finish, eyebrow cocked. \"Okay. You're from the City, right? Well, sorry, but I don't do that kinda stuff anymore. Bye.\"\n\nShe closes the door.");

		addChoice("Knock again.", knockAgain);
		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function neverThankedYou():Void {
		saveCheckpoint("LittleRed.neverThankedYou();");
		clear();
		append("\"For what?\"");

		addChoice("For these.", forThese, {req: ["Glowberry", 5]});
		if (getItem("Glowberry").amount < 5) addChoice("For... uh... well, I don't have them anymore.", dontHave);
	}

	public static function knockAgain():Void {
		saveCheckpoint("LittleRed.knockAgain();");
		clear();
		append("The door swings open at near light-speed and Red's eyes are huge.");

		if (data.knownAsPlayer <= 5) append("\"YOU'RE A PLAYER!\"");
		else append("\"YOU'RE THE CUTE "+pickByGender("GUY", "GIRL", "PLAYER")+" I MET ON THE PATH!\"");

		addChoice("I... yes?", iYes);
		data.knownAsPlayer++;
	}

	public static function forThese():Void {
		saveCheckpoint("LittleRed.forThese();");
		clear();
		append("She peers at the berries in your cupped palms. \"Oh yeah. We met on the path. Keep em, jeez... what, did you think it was a loan?\"");
		addChoice("Well, anyway, thanks.", wellThanks);
	}

	public static function wellThanks():Void {
		saveCheckpoint("LittleRed.wellThanks();");
		clear();
		append("She shrugs. \"You're—\"\n\nYou feel like the word coming next was \"welcome,\" but it changes to \"PLAYER! YOU'RE A PLAYER!\"");
		addChoice("I... yes?", iYes);
	}

	public static function dontHave():Void {
		saveCheckpoint("LittleRed.dontHave();");
		clear();
		append("\"Oh. The glowberries I gave you, right? Don't get too worked up about it, I give them out to everyone. Still,\" she says, \"you're...\"\n\nYou feel like she's about to say \"Welcome,\" but instead her lips snap from a partially open W to a tight-closed P and she blurts: \"PLAYER! YOU'RE A PLAYER!\"");

		addChoice("I... yes?", iYes);
	}

	public static function iYes():Void {
		saveCheckpoint("LittleRed.iYes();");
		clear();
		append("She tackles you with a hug, a steady stream of apologies and questions pouring muffled into your stomach. Against your leg you feel the smooth warmth of her pussy grinding up and down as she bounces on her tippy-toes to hug you harder.\n\nFinally she pulls her face off and looks up at you with her chin resting on your stomach, wolf ears perked up and wolf teeth poking out in a massive grin. \"It's been forever,\" she says, trying her best to put several decades worth of weight into her eternally underaged voice.");

		addChoice("Am I the big bad wolf in this situation?", amITheWolf);
	}

	public static function amITheWolf():Void {
		saveCheckpoint("LittleRed.amITheWolf();");
		clear();
		append("Red pulls you in and shuts the door behind you. The cottage is tiny, low ceiling'd, and smells of meat. By the hand she leads you to a lacy four-poster clearly made for a grandma but instead occupied by a comatose rabbit girl about Red's age.\n\n\"No, dumbass,\" she says, pointing to her canines. \"<!i>I'm<!i> the big bad wolf.\"");

		addChoice("What's with that bunny?", thatBunny);
		addChoice("Not seeing the \"big\" part.", notSeeingTheBig);
	}

	public static function thatBunny():Void {
		saveCheckpoint("LittleRed.thatBunny();");
		clear();
		if (!data.redBunnyExamined) {
			append("\"That's my friend. She's supposed to be Red Riding Hood with this cloak. Twenty years back she volunteered to... well, she got glitched up. She'd just patrol the same path to Grandma's every day and repeat the same things. If you tried to talk to her she'd just look through you. Her brain was dead.\"\n\nRed flops onto the bed and flicks the bunny girl in the face, stuttering her snore. \"So Mynt put her to sleep until they can fix her. That's about it.\"\n\nShe looks up at you, swinging her legs back and forth off the edge of the bed, cloak fluttering with the movement, revealing just a peek of her bare, spread thighs.");

			addChoice("Examine bunny.", examineBunny); 
		} else {
			append("The bunny just snores. No one says anything.");
		}

		addChoice("What did she volunteer for?", whatVolenteer);
		addChoice("Reach between them thighs.", putAFinger);
	}

	public static function notSeeingTheBig():Void {
		saveCheckpoint("LittleRed.notSeeingTheBig();");
		clear();
		var age:String = (isActive("Pastel Ring")?"seven":"ten")+"-year-old";
		append("Red grabs your adult hand with both of hers and yanks it down to her practically planar chest. \"Feel that? That's <!i>huge<!i> for a "+age+", y'know.");

		addChoice("Feel what?", feelWhat);
		addChoice("Holy fuck they're ginormo!", ginormo);
	}

	public static function examineBunny():Void {
		saveCheckpoint("LittleRed.examineBunny();");
		clear();
		append("She flicks the bunny girl in her face and the bunny just takes it.\n\n\"See? Gonzo. I used to be upset about it, since we had this whole routine we'd do together, like a show, y'know? She'd bring the basket of glow-goodies here to grandma and I'd bust in and growl and eat her out... kind of a loose interpretation, but it was fun.\"");

		data.redBunnyExamined = true;
		addChoice("Next.", thatBunny);
	}

	public static function whatVolenteer():Void {
		saveCheckpoint("LittleRed.whatVolenteer();");
		clear();
		append("Red glares at the sea through her window. \"You gotta understand, first, how things got to be on this island after the first couple decades of isolation. I can't give you that good an idea of it, because... well, look at me. I still sit around in this cottage. I still walk the trail with the basket and wear her stupid cloak. To this day I choose nostalgia over paying attention to the state of this repetitious fuckfest.\"");
		addChoice("Can I fingerfuck you while you tell me this?", putAFinger);
		data.redExposition = true;
	}

	public static function feelWhat():Void {
		saveCheckpoint("LittleRed.feelWhat();");
		clear();
		append("With a little growl she yanks your hand down between her thighs instead, cloak fluttering open as she spreads them, and mashes your fingers against the oily, soft-furred lips of her pussy. \"Well THAT'S not flat, is it?\"\n\nShe lets go, leaving your fingers cupped around her little mound, arms seemingly tired already from moving your hand twice.\n\n \"...Well, c'mon. Put a finger in or something. I didn't commit to that awful segway for nothing.\"\n\nShe's blushing.");
		addChoice("Put a finger in.", putAFinger);
		addChoice("Jam three fingers in.", jamThree);
	}

	public static function ginormo():Void {
		saveCheckpoint("LittleRed.ginormo();");
		clear();
		append("She beams with pride as you stroke her practically non-existent boobs; the only thing you can really feel through the thin cloak is the wiggly nubs of her nipples underneath, so you wrap your hands around her chest, just under her arms, and rub your thumbs over them in little circles, her breath rising and falling in your gentle grip.\n\nShe exhales and fixes you with bedroom eyes. \"You're goddamn right they are.\"");
		addChoice("Slurp upon those niplets.", slurp);
		addChoice("Move my hands down...", handDown);
	}

	public static function putAFinger():Void {
		saveCheckpoint("LittleRed.putAFinger();");
		clear();
		data.bfRedFingered = true;

		if (data.redExposition) append("\"... Well. I mean...\"\n\n");
		append("Red scoots forward and hugs your arm and your finger pops in to the knuckle. She's got her cheek smushed up against you.");

		if (data.redExposition) append("\n\n\"It got to a point where most people with a functioning mind wanted out.\" Her voice quivers as you add another finger, little hips bucking with the slow rhythm. \"Mynt is sposed to have a backup plan for times like these, when the game keeps running without any new players to visit or fuck.\"");
		else append("\n\n\"Nnnf...\" She rocks her hips a little, not looking at you. \"Sorry... not as tight as I used to be.\"");

		if (data.redExposition) {
			addChoice("What's that?", clench);
		} else {
			addChoice("Clench for me.", clench);
			addChoice("D'you figure that bunny's tighter?", figureShesTighter);
		}
	}

	public static function slurp():Void {
		saveCheckpoint("LittleRed.slurp();");
		clear();
		append("You slip the cloak off her shoulders and she takes it from you and folds it with impeccable dexterity considering her bare \"niplets\" are now getting thumbed twice as hard; then places the cloak by the bunny, as if temporarily relinquishing ownership, and works her fingers into your hair.\n\nMaking up for the strength her little body lacks with charisma she reads your intentions and pulls your face to her chest, grinding her now quite puffy left nip nub against your lips, your tongue.\n\n\"Suck that ginormo loli tit,\" she demands.");

		addChoice("Wonder what my life has become.", wonder);
		addChoice("Suck that ginormo loli tit.", suck);
	}

	public static function handDown():Void {
		saveCheckpoint("LittleRed.handDown();");
		clear();
		append("You slip your hands over her rounded stomach, just above the V leading to her closed thighs; she opens the cloak herself, showing off her little body. Its fabric was soft, but the plush, cream-coloured markings around her belly button are approximately 4761 times softer.");

		addChoice("Open your legs.", openLegs);
	}

	public static function clench():Void {
		saveCheckpoint("LittleRed.clench();");
		clear();
		append("She holds her breath, clutches your arm, and tightens up as much as she can, warms thighs closing on your wrist. If you lean down and strain to listen you can hear the tiniest little squeak in her chest every time you hit the deepest part of her.\n\n");

		if (data.redExposition == true)
			append("\"Full control,\" she says. \"With no player input for thirty days, Mynt should be able to get full control over the code. We could ask em to change whatever we want. We could create players, a new world to explore— I could ask for nymph wings and go flying!\"\n\n");

		append("With a sudden fur-bristling jolt of surprise, she cums. \"I...!\"\n\nThe full-body shivers force her to cling to you, her cunt contracting hard on your finger"+(data.redExposition?"s":"")+", and the rest of her sentence melts into a little gibberish moan.\n\n\"Abuhhuhmrrrghrmguhmuhmrmrghm.\"");

		addChoice("Wind down.", windDown);
	}

	public static function figureShesTighter():Void {
		saveCheckpoint("LittleRed.figureShesTighter();");
		clear();
		append("\"Oh, definitely. I think the last visitor was her older sister, and that was like... two months ago? Although, she did end up fisting her in both holes, so~\"\n\nHer oils gush over your hand now, and the she gives the littlest buck of her hips.\n\nAlmost inaudible: \"Still, I don't let just anyone rape her in her sleep. Add two more fingers. Then we'll talk.\"");

addChoice("Next.", jamThree);
	}

	public static function jamThree():Void {
		saveCheckpoint("LittleRed.jamThree();");
		clear();
		var age:String = (isActive("Pastel Ring")?"seven":"ten")+"-year-old";
		append("You make a little triangle with your middle three fingers and work them between her lower lips, expecting to hit a roadblock at some point... but to your surprise they all pop right in. You drop the triangle and try driving all three into the "+age+"'s sopping cunt as a horizontal line, marvelling as she instinctively spreads her legs wider and takes it without much more than a shiver.\n\nThough, as the inner massage goes on, she does begin to huff a bit, suppressing her squeals, one hand gripping the bedsheets. She keeps her eyes closed, but her ears perk towards the snores of the comatose bunny. \"Hnnn... okay... you can rape her if you want~\"");

		addChoice("I do want.", iWant);
	}

	public static function iWant():Void {
		saveCheckpoint("LittleRed.iWant();");
		clear();
		append("Red's eyes gloss over with the sheen of nostalgia as she whips off the covers to reveal the bunny in the nude, even smaller than she is, the bottom of her squished-up buttcheeks peeking through her legs. Red, still quite worked up, scurries forward to straddle her friend's waist, grabbing the bunny's head with both hands and cramming her tongue into that snoring mouth.

			All you can focus on is their two thick-furred cubcunts sandwiched together, a cuntwich if you will, Red's spewing so much lube that it coats the bunny's and makes it look equally aroused.");

			if (data.redExposition) append("\n\"Full control,\" she says, still expositing past a mouthful of bunny tongue. \"With no player input for thirty days and a majority vote from all characters, Mynt should be able to get full control over the code. We could ask em to change whatever we want. We could <!i>create<!i> players, a new world to explore— I could ask for nymph wings and go flying!\"");

		addChoice("Dig into that cuntwich.", dig);
	}

	public static function suck():Void {
		saveCheckpoint("LittleRed.suck();");
		clear();
		append("You take long, heavy pulls on her little nipple, twiddling and twangling it with your tongue-tip, making an initial wet schlorp noise by accident and then doing it a couple more times on purpose when she shivers at the raucous debauchery bodily and fights back a blush.\n\nEventually you pull off and reveal her shiny, hickey'd tit, the niplet swollen and capped with a clouded bead of saliva mixed with what seems to be a little of her immature breastmilk.");

		addChoice("So what's with that bunny, anyway?", thatBunny);
		addChoice("Put a finger in.", putAFinger);
	}

	public static function wonder():Void {
		saveCheckpoint("LittleRed.wonder();");
		clear();
		append("She laughs. \"Just joking... Christ. You look distraught.\"");

		addChoice("So what's with that bunny, anyway?", thatBunny);
		addChoice("Put a finger in.", putAFinger);
	}

	public static function openLegs():Void {
		saveCheckpoint("LittleRed.openLegs();");
		clear();
		append("\"Maybe I will, maybe I won't~\"\n\n... She doesn't do it. She's looking at you playfully, one fang poking out.");
		addChoice("Move my hands even lower, then.", evenLower);
	}

	public static function evenLower():Void {
		saveCheckpoint("LittleRed.evenLower();");
		clear();
		append("You stick four fingers from each hand deep into the spot where her thighs meet and yank them open wide; a few gossamer strings of cunnyjuice still connect them at the innermost, and you can't help but smell and notice the tiny puddle she's made on the sheets.\n\n\"Now we're talkin.\"");
		addChoice("Put a finger in.", putAFinger);
		addChoice("Jam three fingers in.", jamThree);
	}

	public static function dig():Void {
		saveCheckpoint("LittleRed.dig();");
		clear();
		append("The moment you lean down for a slurp or two, Red's thighs close hard on her friend's and her paw flicks down to her clit in an instant, her back arching, tail poofing, eyes rolling as she cums. \"A-Ah... ah'm sorry... she always does this to me...\"");

		addChoice("Next.", windDown);
	}

	public static function windDown():Void {
		saveCheckpoint("LittleRed.windDown();");
		clear();
		append("Red pants, sweating, and tosses the cloak aside. \"Stupid... fuckin... y'know, I used to have decent stamina! I could take eight cocks in a row and not bat a cum-coated eyelash! All the sudden Grandma needs to go soak her wrinkly ass in the springs and here I am stuck looking after this little—\"\n\nThe rant fizzles out as Red looks to the bunny's expression of pure, vacuous peace, eyes shut, mouth agape. The little wolf holds back whatever was going to come next and wipes some drool from her friend's mouth, then sucks the saliva from her fingers, looking a little ashamed of herself, as if she's indulging in a bad habit.\n\n\"Well,\" she says, looking first to the tiny puddle of her juices on the hardwood, then to you.");

		if (data.redExposition) {
			append("\"They can't. They can't get control. No one knows why. It's just a little error screen, you can see it in the sky every time Mynt tries to modify the code. It says: You need administrative privileges to perform this action.\"\n\nHer voice is cracking a little.");
			addChoice("You never told me what happened to that bunny!", neverToldMe);
		} else {
			append("\"Sorry, but... I don't think I've got any more in me right now. Visit again sometime, won'tcha?\"");
			addChoice("Sure I will.", sure);
		}
	}

	public static function neverToldMe():Void {
		saveCheckpoint("LittleRed.neverToldMe();");
		clear();
		append("\"I guess I didn't,\" she says.");
		addChoice("...", sure);
	}

	public static function sure():Void {
		saveCheckpoint("LittleRed.sure();");
		clear();
		if (!data.redExposition) append("\"Thanks. Now, if you'll excuse me...\"");

		append("She pulls the covers off the bunny and flips her over onto her side, then disappears into the kitchen. She returns with a sponge and a bowl of soapy water and delicately scrubs the girl down, lifting her arms to get underneath, dragging it down the small of the bunny's back...");

		if (data.redExposition) append("\n\n\"It's just hard to talk about,\" she says. \"I need time.\"")
		else append("\n\nRed watches you. \"I said if you'll <!i>excuse me<!i>...\"");

		data.redVisits = 1;
		if (data.redExposition) addChoice("I'll go.", gotoHub.bind("Bright Forest"));
		else addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}
}
