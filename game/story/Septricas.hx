package story;

class Septricas
{

	public static function septricasExplore():Void {
		saveCheckpoint("Septricas.septricasExplore();");
		clear();
		if (getPlace("Septrica's") == null) {
			setLocation("Septrica's");
			addPlace(
				"Septrica's",
				"A bigass green skyscraper brothel in the middle of Junk City.",
				"Junk City"
			);

			append("You weave through crowds of grumpy commuters, most of them escorts by the look of their getups. After getting jostled off the sidewalk into a fresh pedestrian current, you find yourself washed up at the foot of the green skyscraper in the shape of a helix, its upper curve so bulbous you can't see the top.\n\nA sign beside the green stained-glass revolving door says:");
		} else { 
			append("You're back at Septrica's.");
		}

		addSprite("assets/img/effect/septricaSign");

		addChoice("Head inside.", enterSept.bind("main"));
		addChoice("Move along.", gotoHub.bind("Junk City"));
	}

	public static function enterSept(seg:String):Void {
		saveCheckpoint("Septricas.enterSept('"+seg+"');");
		clear();

		if (seg == "main") {
			append("You head into the mirror-coated lobby. Suited furs chat over coffee with their elbows on the second-floor balcony railing. Concierges bustle from the Information Desk to an important-looking green glass door to a table marked Free Refreshments with armfuls of refills, all while a row of seven elevators set into the far wall open and close constantly, taking in antsy staff and spitting out satisfied customers.");
			if (data.houseDone && !data.house2Done) append("\n\nOh hey, that hyena family from the Sewer Suburbs is hanging out around the bathrooms~!");

			if (!data.infoDeskDone) addChoice("Information Desk.", enterSept.bind("info desk"));
			if (!data.sepBrokeIn) addChoice("Green door.", enterSept.bind("green door"));
			if (!data.freeRefreshmentsDone) addChoice(
				"Free Refreshments.",
				enterSept.bind("refreshments"),
				{kinks: ["Baby", "Female", "Piss", "Snuff"], faCensor: true, give: ["Sweetgrass Leaf", 7]}
			);

			addChoice("Call an elevator.", function() {
				playSound("assets/audio/environment/elevator");
				elevator("main");
			});
			addChoice("Lobby bathroom.", enterSept.bind("septricasbath"), {kinks: ["Piss"]});
			addChoice("Move along.", gotoHub.bind("Junk City"));
		}

		// {{{ Bathroom
		if (seg == "septricasbath") {
			append("The bathroom splits into a roundabout with five doors: Women, Men, Girls, Boys, and Families.");
			if (data.houseDone && !data.house2Done) append("\n\nThe hyena family heads through the Families door, naturally.");

			addChoice("Women.", enterSept.bind("bathwomen"), {kinks: ["Female"]});
			addChoice("Men.", enterSept.bind("bathmen"), {kinks: ["Male", "Raunch"]});
			addChoice("Girls.", enterSept.bind("bathgirls"), {faCensor: true, kinks: ["Cub", "Female"]});
			addChoice("Boys.", enterSept.bind("bathboys"), {faCensor: true, kinks: ["Patreon Commission", "Cub", "Male"]});
			if (data.houseDone && !data.house2Done) {
				addChoice("Families.", enterSept.bind("bathfamily"), {faCensor: true, kinks: ["Patreon Commission", "Toddler", "Female", "Male", "Intersex", "Scat", "Piss", "Vomit", "Abuse"]});
			} else {
				addChoice("Families.", enterSept.bind("bathfamily"));
			}
			addChoice("Back.", enterSept.bind("main"));
		}

		if (seg == "bathwomen") {
			var choice = "";
			if (!data.bathroomWomenDone) {
				data.bathroomWomenDone = true;
				append("There's a chubby naked boar girl doing her makeup with one hand while the other works two fingers between the lips of her cunt.\n\nShe's using the mirror to stealth-ogle you at an angle. She shifts her weight a little, piggybutt settling with a few healthy ripples, then spins around and gives you a quick stealth cheeksmooch.\n\n\"Big fan~\" she oinks, and scurries away.");
				choice = "Hey thanks!";
			} else {
				append("The only thing left in here is a remnant of feminine boarmusk.");
				choice = "Back.";
			}

			addChoice(choice, enterSept.bind("septricasbath"));
		}

		if (seg == "bathmen") {
			var choice = "";
			if (!data.bathroomMenDone) {
				data.bathroomMenDone = true;
				append("There's a buncha greasy burly dudebros lined up along the urinals. Even though they could've each had an empty urinal between them for privacy, they all opted instead to bunch up around one end... just so they could check out each other's cocks, from the looks of it.");
				choice = "Right on boys.";
			} else {
				append("A couple guys have left by now, but there are still a few pissing hard... two guys even cross the streams.");
				choice = "Back.";
			}

			addChoice(choice, enterSept.bind("septricasbath"));
		}

		if (seg == "bathgirls") {
			if (data.bathroomGirlsDone == 0) {
				data.bathroomGirlsDone = 1;
				append("There's a bunch of tents set up on the piss-stained bathroom floor, connected and tunneling through several stalls.\n\n... It's a bunch of girls having a slumber party in a public bathroom...");
			} else if (data.bathroomGirlsDone == 1) {
				data.bathroomGirlsDone = 2;
				append("They've set up a fire in one of the sinks and they're all criss-cross applesauce on the countertop now, telling stories and roasting marshmellows and occasionally retreating into their tents to scissor each other.\n\nA confused elephant loli wanders in, keeping her big ears down, and the other girls lock right on. They all crowd around and start complimenting her, fandangling her trunk with cuntjuicy paws, and before you can blink the little elephant's setting up her own tent and joining the party.");
			} else {
				append("All the girls are having a crazy wicked dope slumber party in here. The elephant's giving one of the others a vicious, deep trunkfuck.\n\nAll their bright-colored pajamas lay in a yellow-stained heap at your feet.");
			}

			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboys") {
			if (!getJournalEntries().contains("Missing Page 12")) {
				unlockJournal("Missing Page 12");
				msg("Found Missing Page #12", true);
				playSound('assets/audio/environment/journalPage');
			}
			
			if (!data.bathroomBoysDone) {
				halfWidthText();
				var s:MintSprite = addSprite("img/effect/thelly.png");
				s.x = GAME_WIDTH - s.width*1.1;
				s.y = GAME_HEIGHT/2 - s.height/2;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fredek", "");

				data.bathroomBoysDone = true;
				data.metThelly++;
				unlockJournal("Boys bathroom");
				var age = "thirteen";
				if (isActive("Pastel Ring")) age = "ten";

				append("This isn't a bathroom for boys, it's a bathroom <!i>of<!i> boys!\n\nThey kneel in place of urinals along the walls. Most mouths drool through ring gags or suck piss-puddles from the tile floor. The only clean cubs are those who just started their shift, and you can tell by their needy expressions that they all want to get to work as soon as possible.\n\nA femmy "+age+"-year-old retriever waves from among them, boybutt sat firm on two stocking'd heels. His already golden fur is just begging to be soaked moreso.\n\nHe brings his waving paw down to adjust his glasses, bewildered. \"Oh jeez— Hi!— I...I just gotta put on my—!\"\n\n— His ring gag. He crams it past his lips and pulls each piece of the clasp back over his shoulders, back arching. This position puts his flat chest on full display, especially the tiny bulges of his pierced nips past the <!b>Lesser Urinal<!b> work uniform: a cute miniskirt and stockings.\n\n<!i>Click~<!i>\n\nHe keeps his hands behind his head once the ring gag's fastened, lacing his fingers together and lifting his elbows to reveal two smooth puppy pits.\n\nThe boy's info flickers to life on a screen built into the wall above him.");

				addChoice("Check his info.", enterSept.bind("bathboyinfo"));
				addChoice("Back.", enterSept.bind("septricasbath"));
			} else {
				append("The retriever's choking down some random dude's piss now~");
				addChoice("Back.", enterSept.bind("septricasbath"));
			}
		}

		if (seg == "bathboyinfo") {
			append("<!b>NAME:<!b> THELLY\n<!b>AGE:<!b> "+(isActive("Pastel Ring")?"10":"13")+"\n<!b>POSITION:<!b> LESSER URINAL\n<!b>SPECIES:<!b> RETRIEVER\n<!b>CUSTOMERS SERVED:<!b> 9,999\n<!b>PERSONAL MOTTO:<!b> <!i>What? My motto? Um... I just like it when guys piss down my throat... <3<!i>\n\n\n\n\n\n\n\n\n\n\n\n\n\nThelly stares at the poster with you, eyeing the <!b>Golden Guzzler<!b> tier dreamily and salivating hard through his ring gag.");
		var s:MintSprite = addSprite("assets/img/effect/boysMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 175;
			s.y = 200;

			addChoice("Kiss Thelly's open maw. <3", enterSept.bind("bathboy1"));
			addChoice("What would you buy if you were making 9 caps a day?", enterSept.bind("bathboycaps"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboycaps") {
			append("\"Oh, I don't know,\" he says, slurred past the ring gag. \"It's not about the caps, really. I just got a job here to pass the years. But the other boys wouldn't talk so much shit if I was a <!b>Golden Guzzler<!b>!\"");
			addChoice("Ah. Then let me give you a little work. (Kiss his open maw. <3)", enterSept.bind("bathboy1"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy1") {
			append("You kneel, hands on your thighs, and look him in the face.\n\nThat alone pierces Thelly's little heart with shivers and electrifies his chestfur. His eyelids droop automatically. Red blossoms up to his cheeks and eartips.");
			addChoice("Next.", enterSept.bind("bathboy2"));
			addChoice("Mmm. Make him wait a little more for it.", enterSept.bind("bathboy1wait"));
		}

		if (seg == "bathboy1wait") {
			append("You lean in like you're going to kiss him— then stop. Your lips hover inches away from his, currents of hot breath mingling inside your mouths.\n\nHis dick twitches to life beneath the tight black fabric of his thong.\n\n\"<!i>Peas,<!i>\" he whispers past his gag, meaning 'please'.");
			addChoice("... Okay smooch him.", enterSept.bind("bathboy2"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy2") {
			append("You grab him by the clasp of his gag (and a few silky black locks too) and spiral your tongue over his girly lips. You start with a focus on the outer lip-curves, then, leaning in deeper, you lap more inside his maw, over the gag's smooth plastic, only barely brushing his tongue with yours. You pull back just before each spiral-kiss slips in too deep, of course... but, watching the way strings of saliva cling between your mouths when they part, the way his pretty eyes almost tear up every time your tongues bump...\n\nYeah, you drop the spiral technique pretty quick and just plain slam your tongue all the way to the back of his throat. <3");
			addChoice("Pay that puppydick some attention.", enterSept.bind("bathboy3grope"));
			addChoice("So... mmhn... what's with the girly getup?", enterSept.bind("bathboy3girly"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy3girly") {
			append("\"Ish my work uniform,\" he purrs into your mouth, a little embarassed. His cock is straining up against the thong now, only really covered at the front; on either side the fabric has stretched into strands the thickness of a sewing needle, revealing the sides of his throbbing shaft.");
			addChoice("Ah, so they dress you like a whore to attract customers, right?", function () {
				enterSept("bathboy3girly2");
				append("\"Well— urm... that's part of it...\"");
				addChoice("What's the other part?", enterSept.bind("bathboy3girly4"));
				addChoice("Back.", enterSept.bind("septricasbath"));
			});
			addChoice("I prefer my boys to look like boys, to be honest.", function () {
				enterSept("bathboy3girly2");
				append("He squeaks and wiggles his hips in dismay.\n\n\"If you don't like it, then I... I could strip for you? I'm allowed to, you know, if a customer demands it~\"\n\n(He feels a little silly talking through his ring gag, clearly, since you're the only one in the room who receives this written interpretation. The other boys mimic him and giggle with each other. A couple even flick droplets of piss at the poor pup.)");
				addChoice("Oh I demand it. 3:<", enterSept.bind("bathboy3strip"));
				addChoice("Back.", enterSept.bind("septricasbath"));
			});
		}

		if (seg == "bathboy3girly3") {
			append("He grinds his chubby little thighs together, trying and utterly failing to hide his boner.\n\n\"The other part is that... um... that I asked to be dressed like a whore.\"");
			addChoice("Ohooooo now.", enterSept.bind("bathboy3girly3"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy3girly4") {
			append("\"I like dressing girly,\" he mumbles through those fat drooly lips. \"When I slip on these clothes at the start of my shift— like I did just a second ago— it feels like twisting up a crank deep in my belly. That crank doesn't unwind til the end of the day. The very end. Not after my shift, when I'm walking home and drippin yellow all over the sidewalk, and the alley guys a couple blocks down whistle at me and th-throw beer cans at my butt, and they say—\" you picture the retriever's high-pitched voice coming out of some big burly alley rat for this next part— \"they say: 'your ass is so fat we don't even have to aim, piss chugger!' o-or something like that... no, it only unwinds when I get home and flop my butt down on the couch and finally peel off my thong and my top and my stockings, all that tension in my stomach snaps like a rope and that crank goes spinning so wild and fast that I cum all over mysel—\"\n\nHe claps his paws over his mouth. \"Ah! Sorry... too much information?\"");
			addChoice("Oh my god grope that puppydick right now.", enterSept.bind("bathboy3grope"));
			addChoice("No, not enough. <3 Why don't you peel off your thong and top and stockings right now for me?", enterSept.bind("bathboy3strip"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy3strip") {
			append("Thelly scurries to his feet immediately. \"Yes"+pickByGender(" sir", " ma'am", ", whatever you say")+"!\"\n\nHe starts with his stockings, making a point of spinning around first so when he bends over you get a full view of his little "+(isActive("Pastel Ring")?"pre":"")+"teen ass, thong string tucked deep between his cheeks. He hooks two thumbs under the left one and pulls it down real slow over his thigh. Next, the right...\n\nThen he straightens up and turns back around to face you. He pinches the bottom of his black tube top from either side and brings it up over his head with one colossal yank, unintentionally smearing the fabric with drool. Once it's dangling from the tip of his index finger he twirls it around a few times and tosses it off to soak in some piss puddle.\n\n\"Would you mind... um...\" he whispers, pointing to his tented thong. A tiny bead of pre has pushed through to rest on the tip.");
			addChoice("I'd love to.", enterSept.bind("bathboy3grope"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy3grope") {
			append("\"Be gentle, "+pickByGender("sir", "ma'am", "please")+"...\"");
			addChoice("Peel his thong off.", enterSept.bind("bathboy4"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy4") {
			append("You scooch forward on your knees and lean down, letting your butt wiggle in the air. The other boys gawk at it, clearly imagining what your asscheeks would feel like grinding on their faces.\n\nThelly's bulge twitches inches from your nose.");
			addChoice("Next.", enterSept.bind("bathboy5"));
			addChoice("OwO What's this?", enterSept.bind("bathboy4whatsthis"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy4whatsthis") {
			append("<!14px>He blinks.\n\n\"That's... my dick?\"\n\n<!14px><!10px>(He doesn't know the meme.)<!10px>");
			addChoice("<!10px>(Shit nevermind just keep going.)<!10px>", enterSept.bind("bathboy5"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy5") {
			append("You lick your lips and curl two fingers from each hand under his thong's waistband. You pull it up and away from his smooth lower belly, up a bit further.... up a <!i>biiiit<!i> further...\n\n(He's squirming hard. You're giving him a wedgie~)\n\nThen you pull down, letting the fabric snap into place between his shaft and his nutsack. His cock pops free and hangs at 75% hardness, swaying up and down in the recoil and spewing pre all over your fingers.\n\n\"Pull it off!\" he begs you, sack twinging. The fabric silhouettes it so tightly that you can even see the seam between his nuts. \"Just a bit further down— please... they're so cooped up...!\"");
			addChoice("Pull it down to his ankles.", enterSept.bind("bathboy6"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy6") {
			append("<!i>Fwoosh!<!i>\n\n\"Hyaa~!\"\n\nHe covers his open maw with a few fingers as the cool, piss-scented bathroom breeze rushes over his now bare cock and nuts. The other boys immediately start mimicking that girly squeal (Kyaaaa! Nyaaa! Oh, "+data.playerName+" senpai! Pull my thong down too!) but Thelly doesn't pay them any attention. He has eyes only for you.\n\nYou bring a dainty hand up and wrap your fingers around his shaft.\n\nIt's obvious that customers don't often give these boys any pleasure— the whole bathroom goes silent with awe. You milk the attention and his dick, starting with a super-squeezy grip around the base and slowly working your fist up til only the rim of his head peeks out over your fingers. Then you bring it back down, twisting clockwise on the way, and start the cycle fresh.\n\n\"Wait—\"\n\nYour free hand closes around his nuts, squeezing those too.\n\n\"Wait, please—\"\n\nYou crank up into a regular handjob, giving his cock some fierce jackage. His balls throb in your grasp.\n\n\"<!i>Please— I'm—<!i>\"");
			addChoice("You're what~?", enterSept.bind("bathboy7"));
			addChoice("You're loving this~?", enterSept.bind("bathboy7"));
			addChoice("You're a little slut~?", enterSept.bind("bathboy7"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy7") {
			var start:String = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU";
		    var end:String = "";
		    var curSize:Int = 16;
		    var dir:Int = 1;
		    for (i in 0...start.length) {
		        var letter:String = start.charAt(i);
		        end += '<!${curSize}px>$letter<!${curSize}px>';
		        curSize += dir;
		        if (curSize >= 24) dir = -4;
		        if (curSize <= 14) dir = 4;
		    }
			append("<!14px>Thelly doubles over, both paws on your head.\n\n\"I'M— I'M GONNA—\nCUUU<!14px>"+end+"<!16px>UMMMMM~!\"<!16px><!14px>\n\nAll the other boys burst out laughing. At least eight ropes of hot "+(isActive("Mood Ring")?getMood("Thelly"):"")+"puppycum splatter your face"+(data.hasBoobs?" and tits.":".")+"<!14px>");
			addChoice("...", enterSept.bind("bathboy8"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy8") {
			append("\"Fuck sorry!\" he squeaks, cocklet still twitching out a few more afterglow cum-globs on your face. \"I... I told you to wait...\"");
			if (data.hasCock || data.hasBoth) addChoice("Grrrr. Cockslap him.", enterSept.bind("bathboy9cockslap"));
			addChoice("Grrrr. Sit on his face.", enterSept.bind("bathboy9rim"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy9cockslap") {
			append("You stand up, the force of it throwing "+(isActive("Mood Ring")?getMood("Thelly"):"")+"cumdrops from your coated face, and whip your cock out to rest it on his cute <!i>Oh shit<!i> expression.\n\n\"I really am sorry for cumming on your face,\" he adds hurriedly, \"and if it's any consolation I'm very much looking forward to this cocksla—\"\n\nYou reel back and <!i>THWAP<!i> his blushing cheeks with your dick, turning his apologetic cringe into a painful one.\n\n\"Thank you, I deserv—\"\n\nYou cut him off with another one in the opposite direction, making sure both cheeks turn an identical shade of crimson once you're done. By the tenth cockslap your pre hangs in long streaks just below his floppy pierced dog ears, soaking into his hair, and he's almost crying with happiness~\n\nYou pull back.\n\n\"One more,\" he gasps.");
			addChoice("Nah. I've got something better~", enterSept.bind("bathboyresume"));
			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboy9rim") {
			append("In one smooth swoop you pin Thelly's little snout under your ass, smacking his head to the bathroom tile.\n\nThe other boys gasp, scandalized. A lowly <!b>Lesser Urinal<!b> getting used as a toiletseat?! Does this player have no idea how things work around here?!?!\n\nYou make eye contact with each of them in turn through your cum-clogged lashes, slowly rocking your hips. His little yipes come muffled between your cheeks, his paws tapping you on your thighs over and over... but you don't let up quite yet. You see that dogdick throbbing between his legs, those lil boytoes wiggling. No, you ride his snout for another good five minutes before finally getting bored with the feeling of his desperate voice vibrating against your pucker.");
			addChoice("Pull off.", enterSept.bind("bathboyresume"));
		}

		if (seg == "bathboyresume") {
			append("You pull off.\n\nHe stares up at you, drawing in deep, stress-relieving breaths. Despite having orgasmed five minutes ago, he's already gushing pre.\n\n\"H-How can I serve you next"+pickByGender(", sir", ", ma'am", "")+"?\"");
			if (data.hasCock || data.hasBoth) addChoice("With your throat, pup.", enterSept.bind("bathboythroat"));
			addChoice("Golden shower for the golden retriever~", enterSept.bind("bathboypiss"));
		}

		if (seg == "bathboythroat") {
			temp.g = pickByGenitals("the wet slap of your nuts against his chin", "the spatter of your piss against his chest", "the wet slap of your nuts against his chin; the spatter of your piss against his chest");

			append("You make to throatfuck him, but—\n\nHe holds up a paw: STOP!\n\nYou stop.\n\nCarefully, eyes narrowed behind foggy glasses, the retriever lowers his gagged maw over your head, over half your shaft... all while keeping his tongue flat against the bottom of his mouth. The only thing you can feel is the intense warmth of his breath, steam clinging to your bare flesh.\n\nIt dawns on you: he's testing his own self control. How long can he stand having a cock in his mouth without actually slurping upon it~?\n\nYou do really have to go, though... just as he pauses, your tip an inch from the back of his maw, you grab his ears and yank his head down til that cute snout bumps against your lower tummy. You start thrusting. Even while his body locks up with palpitant gags you show no mercy, bouncing his face against your crotch while you pump piss down his little esophagus, almost knocking his glasses off with the force of the facefuck.\n\nSuch a relaxing feeling, emptying your bladder inside a little dog~ You close your eyes and listen to the symphony: deep, piss-clogged gurgles; "+temp.g+"; those tiny squeaks he makes whenever you bottom out in his throat.\n\nEventually the tap runs dry. You hold his face to your crotch for a good ten seconds longer than necessary just to make sure he swallows every last drop. His belly isn't skinny like the rest of him anymore~");

			addChoice("Good boy.", enterSept.bind("bathboyboy"));
			addChoice("Good girl.", enterSept.bind("bathboygirl"));
			addChoice("Good urinal.", enterSept.bind("bathboyurinal"));
		}

		if (seg == "bathboypiss") {
			temp.g = pickByGenitals("against your heavy nuts", "between your legs", "against your heavy nuts");
			temp.g2 = pickByGenitals("casually shake off in his open maw", "park your pussy above his open maw and flex the last few drops out", "casually shake off in his open maw ");

			append("You run a hand through his girly 'do and pull him closer by his neck. His gagged maw slips over your thighs, coating them with puppy drool~\n\nThe other boys stare, jealous, as you pull the dog's face "+temp.g+" and let a stream of hot piss flow out over the crown of his head. It soaks into his locks, hangs in cute little droplets on their tips... from this vantage point, over the kneeling pup, you can watch their entire journey: over his neck nape, between his shoulder blades, pooling into a trickle at the small of his back, running hot down his little asscrack.\n\nOnce his body is soaked head-to-toe, you "+temp.g2+". The retriever takes a well-earned gulp of fresh air, cocklet twitching, and catches the droplets tounge-out like they're snowflakes~");

			addChoice("Good boy.", enterSept.bind("bathboyboy"));
			addChoice("Good girl.", enterSept.bind("bathboygirl"));
			addChoice("Good urinal.", enterSept.bind("bathboyurinal"));
		}

		if (seg == "bathboyboy") {
			append("You ruffle his soaked hair, telling him that with genuine love in your voice.\n\nHe groans, shivers... just watching his thighs slam shut and grind together over his cockbulge sends a pang of pride through your own body.\n\n<!b>CUSTOMERS SERVED:<!b> 10,000!\n\n<!b>NEW POSITION:<!b> GREATER URINAL\n\n\n\n\n\n... The other boys reluctantly applaud.");
			playSound("assets/audio/environment/caveWinMedium");

			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboygirl") {
			append("You ruffle his soaked hair and purr that in his ear.\n\nHe groans, shivers... just watching his pierced nips perk up and throb sends a pang of femininity through your own body.\n\n<!b>CUSTOMERS SERVED:<!b> 10,000!\n\n<!b>NEW POSITION:<!b> GREATER URINAL\n\n\n\n\n\n... The other boys reluctantly applaud.");
			playSound("assets/audio/environment/caveWinMedium");

			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathboyurinal") {
			append("You ruffle his soaked hair and call the little cub what he is: a urinal.\n\nHe groans, shivers... just watching his half-lidded eyes sink to the warm puddle around his pawtoes sends a pang of subbiness through your own body.\n\n<!b>CUSTOMERS SERVED:<!b> 10,000!\n\n<!b>NEW POSITION:<!b> GREATER URINAL\n\n\n\n\n\n... The other boys reluctantly applaud.");
			playSound("assets/audio/environment/caveWinMedium");

			addChoice("Back.", enterSept.bind("septricasbath"));
		}

		if (seg == "bathfamily") {
			if (data.houseDone && !data.house2Done) {
				unlockJournal("Hyena family septricas");
				var pronoun1 = pickByGender("He", "She", "They");

				append("\"Well, look who followed us...\" Grandma says, laying her sissyboy toddler down on a Koala changing table folded out from the wall. The little hyena waves hello again, then his paws go straight to her huge adult cock, barely able to get his grip even halfway around each side before he starts pulling it down between his legs.\n\n\"Did we make that much of an impression...? We don't even have names...\" Mom says inbetween light grunts, her "+(isActive("Candy Ring")?"candy-pink":"dirty")+" asshole winking as she pinches off "+(isActive("Candy Ring")?"some cake":"a log")+" in her hungry daughter's maw.\n\nGrandma grabs her toddler grandson by his nuts and his throat and starts grinding her greasy cock over his puny body, measuring how deep it'd go if she hilted him with the exact amount of cock he so clearly deserves (that is, all of it), keeping him held firm against the changing table, smearing his pretty pink lipstick off those cock-holster fishlips and coating his thong with a healthy helping of nutsack sweat. \"They don't give a shit about names.\"\n\nThe last toddler, that adorable fat-tiddied futalet, she waltzes straight up to you and bends over as a greeting. With nimble paws she yanks her bubblebutt open to give you a perfect view of her fucked-open hole. \"They're just a perv is all. Who could resist a second round of incestual preschooler gangbangs~?\"");

				addChoice("Not I~ (Warm that little ass up.)", enterSept.bind("bathwarmup"));
				addChoice("Well, what are your names?", enterSept.bind("bathnames"));
				addChoice("I'm having trouble keeping track of all the names as it is.", enterSept.bind("bathnames"));
				addChoice("I could. Bye!", enterSept.bind("septricasbath"));

			} else {
				append("A few stalls, urinals, fold-out changing tables. ");
				if (!data.house2Done) append("No families in here... yet~") else append("The hyena family left a huge mess in here...");
				addChoice("Back.", enterSept.bind("septricasbath"));
			}
		}

		if (seg == "bathnames") {
			append("\"Forgot ours twenty years back,\" Grandma says. \"For five years or so after that, we tried making up new ones. But it felt pretty forced. So now we just use Grandma, Mom, and the kids get called whatever we fuckin feel like calling them.\"\n\n\"I'm Toddlerfag~! I'm Rapesock~!\" he squeaks, all proud about it.\n\nGrandma's dick splits his boypussy open with the absolute minimum effort. It practically makes a <!i>whoosh<!i> sound he's so easy. She pulls her hips back and starts beating his innards tender with her cock, rattling the shitty plastic changing table. \"Hnnf... you know Grammy can't control herself when you say shit like that, honey...\"\n\n\"I-I knoooOOOooOOOOooow~\" he screams, high-pitched and faggy. Grandma's grip tightens on his throat, but she can't mute his moans entirely. She shoots you a pleading glance.\n\n\"I think my name started with a T,\" Mom says, staring at the ceiling. \"It's written down somewhere in the house, I'm sure... probably under "+(isActive("Candy Ring")?"a pile of desserts, though...":"one of the attic shitpiles...")+"\"\n\nShe's straddling her daughter's tiny toddlertummy, completely unaware that the adult-sized "+(isActive("Candy Ring")?"cakeload":"shit")+" lodged in that little maw is getting coughed up and choked on, paws scrabbling at mommy's "+(isActive("Candy Ring")?"confectionery":"fat log")+" not to try and pull it out but to pack even more of it down her throat.\n\nMom's blush tells you she's just pretending to be lost in thought. Really, out of the corner of her eye, she's watching her daughter suffocate, letting her cuntjuice dribble out over that smooth, heaving belly. \"Was it Tereza? Maybe...?\" she purrs. \"... No, that was in a book...\"\n\nThe futa toddler pouts as everyone, including you, ignores her perfectly fuckable kiddybutt.");

			addChoice("Shut the sissyboy/toddlerfag/rapesock up.", enterSept.bind("bathshutup"));
			addChoice("Help the girl swallow her meal.", enterSept.bind("bathswallow"));
			addChoice("Warm the futa up.", enterSept.bind("bathwarmup"));
		}

		if (seg == "bathshutup") {
			data.housePlayerPos = "boy";

			var genitals = pickByGenitals("nuts", "ass", "nuts");
			var genitals2 = pickByGenitals("sack clinging", "lips spreading", "sack clinging");
			var genitals3 = pickByGenitals("over your nuts", "up your cunt", "over your nuts");
			var genitals4 = pickByGenitals("sweaty nutsack", "cunt", "sweaty nutsack");
			var genitals5 = pickByGenitals("your cock where it lounges over her brother's bulged stomach", "the dripping cunt her brother is practically muzzlefucking", "your cock where it lounges over her brother's bulged stomach");

			append("You swing a leg over the changing table, hinges and hyena boy groaning. The shadow of your "+genitals+" eclipses his curious expression (OwO what's this) and his nostrils twitch, taking in the sudden rush of musk. You bring your hips down slowly, giving him time to savor the feeling of your "+genitals2+" around his tiny snout, stifling laughter as Grandma's vicious thrusts push air from his lungs and send it rushing cool and tickly "+genitals3+"~\n\n\"Grand<!i>MAAAAAAAAAAAAAAAAA,<!i>\" the futa whines, toddling over, all jealous that her brother gets to be gutfucked <!i>and<!i> suffocated underneath your "+genitals4+". \"I want a fist in my cunnnyyy.\"\n\n\"I told you never to use the word 'cunny', fuckrag. It annoys Grammy.\"\n\n\"Okay, in my <!i>cunt<!i> then. Please? Please?\"\n\nShe looks from you, to "+genitals5+", to Grandma. She gets ignored.\n\nNow she's pissed. Tantrum incoming. \"GRANDMA. Fist me RIGHT NOW.\"\n\n\"Go ask your mother,\" Grandma snaps. \"Or maybe, if you keep being such an annoying little shit, the nice player will end up punchfucking you out of spite.\"");
			addChoice("Ride the boy's pretty muzzle with my ass instead~", enterSept.bind("bathnext"));
			addChoice("Fistfuck her and make her suck her brother's cocklet~", function() {data.houseFutaLoved = true; enterSept("bathnext");});
		}

		if (seg == "bathswallow") {
			data.housePlayerPos = "girl";

			var candy = "shitty";
			var candy2 = "shit";
			var candy3 = "mud";
			if (isActive("Candy Ring")) {
				candy = "sugary";
				candy2 = "cake";
				candy3 = "chocolate cake mud";
			}

			var genitals = pickByGenitals("circling her lips with your cockhead, nudging her "+candy+" fingers away", "resting your cunt on her forehead, stuffing your fingers into the warm mess alongside her own", "circling her lips with your cockhead, nudging her "+candy+" fingers away");
			var genitals2 = pickByGenitals("cock", "fingers", "cock");
			var genitals3 = pickByGenitals("dick", "digits", "dick");

			append("You squat over the girl's blushy brown-smeared face, "+genitals+".\n\nMom blinks out of her daydream, pretend-shocked to find a toddler drowning on her "+(isActive("Candy Ring")?"cake":"shit")+" and locked between her thighs. \"Oh, jeez, is she okay...?\"\n\nThe hyena nods weakly, helping your "+genitals2+" sink into the hot mess past her lips in the process.\n\n\"Ahhh... good girl...\" Mom bites her lip. \"Just keep working on it, hun, they'll get it down for you...\"\n\nYou do mama proud and drive your "+genitals3+" down her daughter's throat, dislodging a "+candy3+"slide over her squinted eyes, her bulging neck. Dutifully Mom scoops it all up and packs it into the corners of that little maw, then wipes her fingers clean on those cute blue cheeks~\n\nThe futa wanders over all lonely. \"Mooooom...\"\n\n\"Yes?\"\n\n\"I'm emptyyy... and horrnnyyyy...\"");
			addChoice("Wash all that "+candy2+" down with enough piss to give her a full body enema~", enterSept.bind("bathnext"));
			addChoice("Make the futa suck "+candy2+" from her sister's maw~", function() {data.houseFutaLoved = true; enterSept.bind("bathnext");});
		}

		if (seg == "bathwarmup") {
			var candy = " globules of kiddyshit";
			var candy2 = "shitting herself";
			var candy3 = "shit";
			var candy4 = "slimy";
			if (isActive("Candy Ring")) {
				candy = ", spongy pieces of angel cake";
				candy2 = "forcing it out";
				candy3 = "candy";
				candy4 = "sugary";
			}

			append("You run an open palm over the futa's left buttcheek, massaging against the grain of her soft fur. Your grope lifts some hairs manually, but twice as much horripilate around your handprint, rising in a shiver so violent it makes her little ass wobble.\n\n\"Please,\" she says, pouting over her shoulder. \"Don't be so gentle. I was born to get... oh, what's the phrase for it... oh yeah, I was born to get brutally molested~\"\n\nYou raise an eyebrow. A thick bead of pussyjuice runs down over the seam of her nuts, clinging presently to the underside of her too-fat toddlercock. Just saying the word 'molested' is apparently enough to get her gushing.\n\nYou do have a job to do here, so you crank the dial a little further clockwise and hotdog her tiny crack with two big grown-up fingers, bringing your ass-groping hand around to her smooth stomach. You push on it. She stumbles backward, ass jiggling, and inadvertently slips both your digits up her own ass with a gasp.\n\nWarm"+candy+" splurt around your fingers, then again, again— you aren't even thrusting them— she's just "+candy2+" with spastic anus oscillations.\n\nYou glance away from that hypnotic ass for a second, checking up with Mom and Grandma.\n\nMom's still straddling her daughter, bouncing her hips gentle and slow on that smooth tummy, forcing the poor girl to cough up more "+candy3+" all over herself every time she manages to scarf some down.\n\nGrandma rails her girlyboi's ass, rattling the changing table with each innard-rearranging thrust. She's got his tight string-thong yanked off to the side, where it can dig into his assmeat and make it all muffintopped.\n\nThe futa is jealous already. That was two seconds too many of watching her siblings. She reaches back and pulls a third finger into her "+candy4+" asshole, fixing you with a fiery stare.\n\n\"Okay, listen, 'brutally molested' does not mean 'a couple fingers up a "+candy3+"-lubed butt. Break me. Fistfuck me.\"\n\nShe pauses, hearing what she just said. Then she blinks, switches back to her cute pout: \"Um... please, I deserve it~\"");

			addChoice("Such attitude. Fistfuck her and make her lick the floor.", enterSept.bind("bathnext"));
		}

		if (seg == "bathnext") {
			var addedScene1 = "";
			var addedScene2 = "";

			if (data.housePlayerPos == "") {
				//You focused on the futa and ignored the boy and girl
				var candy = "caked pawgrease stains from all the barefoot traffic, sucking stray chunks of shit from the grout";
				var candy2 = "grease";
				var candy3 = "brown";
				var candy4 = "nasty";
				if (isActive("Candy Ring")) {
					candy = "frosted sweetstains, the freshest and tastiest remnants of spilled asscandy";
					candy2 = "candystains";
					candy3 = "candy-pink";
					candy4 = "tasty";
				}

				append("Her tongue flops out before her face even hits the tile. With a warbly little groan she starts lapping at the "+candy+". Her other end is just as eager. You don't even have to work to pop your fist up her ass, her little paw wraps around your wrist and practically does it for you.\n\nShe pulls off the floor for a second, glancing back. Testing you.\n\nYou're still angry from her sass, just like she knew you would be, and without a thought your palm comes down hard on the back of her skull, forcing her down again. Did you <!i>say<!i> she could stop sucking "+candy2+"? You mop the bathroom floor with the futa's cute, gasping face, making sure she snorts hard whenever you happen to smear her snout through the 'clean' patches of her own "+candy3+" saliva.\n\nEvery time she inhales or licks a particularly "+candy4+" stain her ring throbs tight on your wrist. Cute as that is, it does cut off your circulation... so annoying, cause then you're too distracted by pins-and-needles in your fingers to appreciate how good it feels to grope her warm little insides. Clearly the only solution is to loosen that fucker up.\n\nYou take your hand off her skull (she better keep that mouth on the floor this time) and instead grab both of her nuts and yank her hips back, burying your arm up her ass halfway to the elbow. She screams and pisses herself while you ramp into a punchfuck so brutal it would've sent her sliding halfway across the bathroom if it weren't for the these fat, throbbing little handle of a sack dangling between her legs.");

				addedScene1 = "Mom's tiny squeak of delight once she finally drops the act and bends to french kiss her toddler daughter's messy, gagging maw";
				addedScene2 = "punchfuck the shit outta her sister whose fat little kiddynuts happen to be trapped in your fist while she groans and sucks the floor like a pathetic little mop";
			} else if (data.housePlayerPos == "boy") {
				if (data.houseFutaLoved) {
					//You focused on the boy then the futa
					var boobs = "against your chest";
					if (data.hasBoobs) boobs = "between your tits";

					var genitals = pickByGenitals("cock", "cunt", "cock");
					var genitals2 = pickByGenitals("nutsack", "cunt", "nutsack");

					append("You pull the needy futa up by her armpits and sit her down square between your legs, resting all the weight of her bubblebutt on her brother's throat. Her back rubs up "+boobs+" as she arches and purrs, her perpetually semi-gaped pucker <!i>churping<!i> on the boy's chin, the radiant warmth of her hole and your "+genitals+" overheating his already blushy cheeks til they're sweaty and beet-red.\n\nGrandma detaches her grip on his throat now that the futa's got him pinned, then brings that hand up to slap her across the face.\n\n\"AH! Grammy, why—\"\n\n\"Shut the fuck up, cunt. Grammy was holding your brother down. Who told you it was okay to steal Grammy's job?\"\n\n\"I'm s-sorry Gram— it's not my fault, the player put me—\"\n\nYou grab the back of her head and slam her face down between her brother's thighs to prevent her digging herself even deeper into trouble. She takes his quivery cocklet down her throat no problem. Grandma growls, still unsatisfied with her... she pops two fingers up the futa's nose and yanks her mouth open wider, then squeezes those tiny nuts into her maw too. \"How's your brother's cock taste?\"\n\n\"Nnrhhhh... hmrmmmm...\" she moans through bulged cheeks, deepthroating him.\n\nGrandma pulls her hips back and slams in to the hilt, making the toddlerboy scream into your "+genitals2+" and piss himself— the futa coughs and gags as yellow splutters from her nose, her ass tensing and quivering in your face.\n\nYou can't <!i>not<!i> fist such a huge, cute, twitchy punching bag. You wind back and start beating her ass open, her nuts jiggling adorably with each blow, until finally she gives up all resistance and takes your fist properly, shaky little hands snaking back to pull her cheeks open for you.");

					addedScene1 = "Mom's satisfied, near-silent purring while her daughter chokes out between her thighs";
					addedScene2 = "punchfucking the shit outta a futa currently getting her throat plastered with "+(isActive("Mood Ring")?getMood():"")+"cum from her brother's tiny cock while she drools around the nuts stuck inside her maw";
				} else {
					//You focused only on the boy
					var genitals = pickByGenitals("taint", "cunt", "pussy");

					var candy = "shit-slick";
					var candy2 = "Brown";
					var candy3 = "shit-speckles";
					var candy4 = "shitty";
					var candy5 = "brown";
					if (isActive("Candy Ring")) {
						candy = "sugary";
						candy2 = "Frosting";
						candy3 = "sugar-speckles";
						candy4 = "messy";
						candy5 = "pink with frosting";
					}

					append("You ignore the futa, teasing her with a big noisy moan as her brother's snout slips over your "+genitals+" and pops up into the crease of your ass. He gets one precious breath of musky anus-scented air before you slam your "+candy+" pucker down on his muzzle, taking it like a cock.\n\n"+candy2+" spatters over her expression of deep betrayal.\n\nGrandma gets a little sympathetic after all. \"Awww... I can't stand it when you make that face. Come here, little slut...\"\n\nShe scoops the futa up, licks the "+candy3+" from her face. \"Tell Grammy what's wrong.\"\n\nShe sniffles. \"It's not fair... <!i>he<!i> gets all the abuse...\"\n\n\"Oh, honey,\" Grandma tsks, nestling the futa's face between her tits. \"What do I always say about your brother?\"\n\nThe futa shakes her head. \"... Don't wanna say... not fair...\"\n\nGrandma pulls her away from her tits. \"Say it, cunt.\"\n\nShe squeaks, reaches out to try and pull herself closer, desperate to get back between those warm furpillows. \"You... you always say...!\" She takes a deep breath, looks forlornly down at her brother over her shoulder. \"He's the most w-worthless, useless little fagbasket on the whole island, a-and he deserves to suffocate in a "+candy4+" asscrack every waking moment for the rest of his l-life...\" she recites. Her hurried \"BUT I DO TOO\" gets cut off:\n\n\"That's right, hun. And what's he doing right now?\"\n\nShe pouts. \"... he's suffocating in a "+candy4+" asscrack...\"\n\n\"Mmmmmmmmhm. Do <!i>you<!i> want to suffocate too?\"\n\nHer eyes light up. \"Yes! Yes! In your butt?!\"\n\n\"No,\" Grandma purrs. \"In my tits.\"\n\nShe buries the futa's smile in them and hunches her shoulders a little, squeezing her boobs together over the toddler's squished-up cheeks, soft fur morphing to cover maw and nostrils.\n\nSomething thwaps against your thigh. You blink.\n\n... Oh, it's the fagbasket thrashing involuntarily~ You reach down and tuck his snout a little deeper in your ass, smearing his blue cheeks "+candy5+".");

					addedScene1 = "the futa's choking noises coming muffled through her prison of sweaty granny titmeat";
					addedScene2 = "at the boys' other end smothering his face between your asscheeks, bouncing your hips so hard the changing table breaks and all four of you spill onto the dirty floor in a flood of moans and cum and bodily fluids";
				}

			} else if (data.housePlayerPos == "girl") {
				if (data.houseFutaLoved) {
					//You focused on the girl then the futa

					var candy = "protruding log of shit";
					var candy2 = "beige toddlerpuke";
					var candy3 = "puke";
					var candy4 = "shit";
					var candy4 = "brown";
					if (isActive("Candy Ring")) {
						candy = "tower of cake";
						candy2 = "and supremely delicious pudding";
						candy3 = "pudding";
						candy4 = "dessert";
					}

					var genitals = pickByGenitals("cock", "fingers", "cock");
					var genitals2 = pickByGenitals("cock down to the base", "fingers", "cock down to the base");

					append("Before Mom can fill or fuck the futa you grab her by the hair and make her spiderman-kiss her sister, basically forcing her to deepthroat the "+candy+" your "+genitals+" barely dented. She does well, despite having such a tiny mouth. Good rhythm: between frantic, gurgling inhales she chews, swallows, chews, swallows— at one point she even drives her little tongue down deep enough to prod her sister's uvula, knowing full well she'd have to lock lips right after and gulp down half a tummyful of hot "+candy2+".\n\nMom's got both paws clapped to her cheeks (the ones on her face) in a gasp. \"Oh, honey! When did you get so good at chugging "+candy3+"!?\"\n\nThe futa pulls away panting, a strand of saliva connecting her and her sister's sparkling clean lips, both rather fishy from a lifetime of cocksuckery. Before she can answer you let her know very <!i>directly<!i> that she missed a spot, plunging your "+candy4+"-coated "+genitals2+" in her maw. The poor fucklet didn't get enough oxygen while she had the chance. Now she's stuck choking on your "+genitals+", toddlerbody jerking and twitching in your grasp— it's too much, she can't help but re-regurgitate all of her sister's warm, sloppy "+candy3+" all over her immature futaboobs and your crotch, making an even bigger mess than she started with.");

					addedScene1 = "her grunt \"TAKE MY LOAD YOU LITTLE FAGBASKET!\"";
					addedScene2 = "cram the futa's throat fuller even while she gags and writhes in her own mess beside her swollen-bellied sister";
				} else {
					//You focused only on the girl

					var genitals = pickByGenitals("straddle her daughter's face", "lock your cuntlips to her daughter's facelips", "straddle her daughter's face");
					var genitals2 = pickByGenitals("busting the resistance open with a brutal thrust of your cock", "grinding your hips down to really get an airtight seal around your cunt", "busting the resistance open with a brutal thrust of your cock");

					append("\"Well...\" Mom says, watching you "+genitals+" and blast a stream of piss into her maw. Mom stands up, a few strands of glistening cuntjuice still connecting her pussy to the girl's belly. \"If you're so needy, I could maybe... um...\"\n\n\"The futa chirps \"GREAT!\" and pulls her mom by the hand into a stall from which wet, smoochy noises immediately emanate.\n\nA gross little GLLLRRRKKGKHHGHHH pulls your attention back to the toddler between your legs. Her throat's closed up reflexively. She can't chug your piss so well; it's pouring from her nose, which clearly burns judging by how heavily her rolled-up eyes are watering, and splashing out over her immature booblets. You hook a couple fingers past her lips and yank her maw open wider, "+genitals2+". That does the trick. Now her belly's getting nice and swollen, her nose leaking only the tiniest dribble over your asscrack; it isn't long before you're giving her tiny body a full enema, hot gold bursting from her ass and cunt and even her urethra, whether she's pissing your piss or her own.\n\n\"From behind you, hot sex-ramblings come from Mom and the futa's stall:\n\n\"NNNhhh... yeah... grind that cunt up...\"\n\n\"Be careful, dear... you might slip in that puddle of my—\"\n\n\"NNNNNNHHHH... Harder... Come on... COME ON, MOM...\"\n\n\"D-Don't yell at me... I'm scissoring as hard as I can...\"\n\n\"HARDER MOM!! UNH. NNH. NNNNHGHHH... SCISSOR ME TIMBERS!!!!!\"\n\nMom starts giggling. \"You get so into it... just like your Grandma...\" She pauses... then tries her hand at some dirty talk: \"... Oh... oh, you look out, little bitc— um, little b-buddy... I'll scissor you good!\"\n\nThe futa's tone drops to flat unarousal. \"Mom, you're not doing it right.\"");

					addedScene1 = "mother and daughter scream in tandem gasm from the back stall";
					addedScene2 = "straddle the girl's face and blast her body so deeply full of piss that it sprays out the other end over this wholesome family scene and catches the light in a beautiful arc of golden rainbow-mist";
				}
			}

			var candy = "brown";
			var candy2 = "beige toddlerpuke";
			var candy3 = "puke";
			var candy4 = "shit";
			var candy4 = "brown";
			if (isActive("Candy Ring")) {
				candy = "pink-tinged";
				candy2 = "and supremely delicious pudding";
				candy3 = "pudding";
				candy4 = "dessert";
			}

			append("\n\nAn innocent, frazzled little family of lambs walks into the bathroom, all tourists from Bright Forest. The dad's steering both kids by their shoulders, rambling: \"Hey, uh, we just came here 'cause it was the biggest building— you've got a young retriever offering <!i>services<!i> over in the Boys— are these the <!i>regular<!i> bathrooms, or—\"\n\nThey're just in time to see Grandma bust a fat nut in her grandson's ass, "+candy+" cum spilling over the fold-out changing table, to hear "+addedScene1+", to see you "+addedScene2+".\n\n... They back away.\n\n\"Daddy...\" one of his cubs says, tired and upset. \"Are we ever gonna find a bathroom you're okay with?\"\n\n\"I don't know, son... I don't know.\"");

			addChoice("...", enterSept.bind("bathnext2"));
		}


		if (seg == "bathnext2") {
			append("Even Grandma's a bit tired. She peels her granddaughter's asscheeks apart, reaches a hand in deep... and out pops a beer and a few chunks of half-melted ice.");
			addChoice("Stare at Grandma.", enterSept.bind("bathgrandma"));
			addChoice("Stare at the girl.", enterSept.bind("bathdaughter"));
		}

		if (seg == "bathgrandma") {
			var candy = "toddlershit";
			var candy2 = "scat";
			var candy3 = "kiddyshit";
			var candy4 = "waste";
			var candy5 = "log";
			var candy6 = "shit";
			var candy7 = "FECES";
			if (isActive("Candy Ring")) {
				candy = "cake from kiddybutts";
				candy2 = "foodplay";
				candy3 = "sugar";
				candy4 = "spongecake";
				candy5 = "slice of cake";
				candy6 = "sweets";
				candy7 = "ASSCANDY";
			}

			append("\"What're you lookin at?\" She cracks it, swigs. \"We eat "+candy+" damn near on the hour. You get numb to the flavor unless you pack a beer inside a handy-dandy cooler like this little cunt and clean your palate once in a while. That's a pro-tip, kid. Scribble that shit down in your Nintendo Prima Power-Gamer Strategy Guide or whatever the fuck. See, now, newcomers to "+candy2+"'ll just get lost in that heavenly flavor, mowin down for days, it's like "+candy3+" addiction. Next thing you know you're scarfing "+candy4+" from some cub's ass, you pull off for a two-second breather, and in that short little chunk of time you realize it doesn't taste as good as it used to, you realize you're just like that poor lamb family, bumbling around somewhere way outta your league, trying to figure out how to fasten the buckle on your big boy pants and really <!i>enjoy<!i> what you're doing— trying to figure out how to get off like you got off the first fifty, seventy times when every cum makes the next one a little harder— when every "+candy5+"'s gotta be choked down to get to the next one— all while your dumb ass is fundamentally ignorant of the <!i>most important<!i> thing about wolfing "+candy6+" down multiple times daily, the singular fact you must sear into your goddamn hippocampus in order to get any lasting pleasure out of this diet: <!i>without a beer now and then you lose appreciation for the FLAVOR OF TODDLER "+candy7+".<!i>\"\n\nOne clawed finger peels off the can to point quivering at you. She's spilled half her beer already just ranting and gesturing wildly. The kids scurry round to suck it from the dirty tile floor.\n\n\"... Yeah!\" Mom adds weakly, clearly wanting to be part of the discussion. \"She's right!.... About... all that!\"");
			addChoice("I never knew eating "+candy6+" was such an art form.", enterSept.bind("bathgrandmanever"));
			addChoice("So... a fancy justification for getting to use her as a beer cooler.", enterSept.bind("bathgrandmafancy"));
		}

		if (seg == "bathgrandmanever") {
			append("She smiles. \"It's not. I'm just fucking with you.\"");
			addChoice("Oh.", enterSept.bind("bathnext3"));
		}

		if (seg == "bathgrandmafancy") {
			append("\"Basically, yeah.\"");
			addChoice("You islanders really like your contrived sex justifications.", enterSept.bind("bathnext3"));
			addChoice("I'm not judging.", enterSept.bind("bathnext3"));
		}

		if (seg == "bathdaughter") {
			var candy = "toddlershit";
			if (isActive("Candy Ring")) candy = "cake from kiddybutts";

			append("She points her gaped ass at you, a few chunks of ice sliding slowly over her swollen cuntlips, leaving trails of cold perspiration on her fur. \"What?\" she purrs. \"Never seen a toddler used as a beer cooler before~? You're as soft as that lamb family...\"");
			addChoice("Isn't it cold keeping all that ice up your ass?", enterSept.bind("bathdaughterice"));
			addChoice("I did, once. Long ago, on a Lazy Saturday...", enterSept.bind("bathnext3"));
		}

		if (seg == "bathdaughterice") {
			append("She giggles. \"I'm numb, silly~! It's the first thirty minutes or so that really get me shivering... but even that's good in a way, cause my puss and my mouth are all vibrational, perfectly pleasurable for a cock or two! Each!\"");
			addChoice("Ah... yes... interesting... I see...", enterSept.bind("bathnext3"));
			addChoice("I think I'm numb too, by this point.", enterSept.bind("bathnext3"));
		}

		if (seg == "bathnext3") {
			append("Grandma polishes her beer and tosses the crushed can wherever. \"I'm— urrp— feelin mean, kiddos,\" she grunts, elbowing a stall door open. \"Who wants a swirly?\"\n\nThe cubs swarm her, hands raised, excited, yammering to be first.\n\nShe grins at you. \"Hey, "+data.playerName+". You like making choices, don't ya? Gohead and pick for me so I don't have to deal with the two whiners leftover.\"");
			addChoice("The girl.", enterSept.bind("bathswirlygirl"));
			addChoice("The sissyboy.", enterSept.bind("bathswirlyboy"));
			addChoice("The futa.", enterSept.bind("bathswirlyfuta"));
		}

		if (seg == "bathswirlygirl") {
			var candy = "creamy brown water";
			if (isActive("Candy Ring")) {
				candy = "blue raspberry kool-aid water";
			}

			append("\"YESSssss~!\" the little beer cooler purrs.\n\nGrandma scoops her up and punches her in the stomach, sending a spray of ice and ass-mist over the other toddlers' disappointed faces. The hyenalet gasps for breath, tummy deflated, and she still hasn't caught her breath even after Grandma takes a slow, mercifully long time time laying her deflated tummy over the rim of the toilet and dunking her upper body in the "+candy+".\n\n\"That's it~\" Grandma says, groping her granddaughter around the neck, feeling each involuntary gulp and gag in her little throat.\n\nGrandma reaches up and slams the lever, watching fondly as she thrashes in the swirling waters~");
			addChoice("Cum.", enterSept.bind("bathswirlycum"));
		}

		if (seg == "bathswirlyboy") {
			var candy = "spluttery diarrhea dump";
			if (isActive("Candy Ring")) {
				candy = "rush of pink cake";
			}

			append("He groans, fingers jumping to his cocklet. \"Yes, please swirlify m—\"\n\nGrandma slaps his hand away and picks him up by his pathetic little package, carrying him over to the toilet like a tote bag. \"Don't tell me what to do. You think just because I fucked your ass and came inside I'll go easy on you for the rest of the day? Get that cute face underwater for Grammy.\"\n\nShe dangles him down through the seat, dunking him down to his neck, his puffy boitits. Then she sits down on it and seals his doom.\n\nShe grunts out a "+candy+" on the trapped cub, then, after squeezing out every last bit, she casually reaches back and slams the lever down. Her purring is so fierce it almost drowns out his wet, gurgly squeals~");
			addChoice("Cum.", enterSept.bind("bathswirlycum"));
		}

		if (seg == "bathswirlyfuta") {
			var candy = "shit";
			var candy2 = "beige toddlerpuke";
			var candy3 = "puke";
			var candy4 = "shit";
			var candy4 = "brown";
			if (isActive("Candy Ring")) {
				candy = "cake";
				candy2 = "and supremely delicious pudding";
				candy3 = "pudding";
				candy4 = "dessert";
			}

			var genitals = pickByGenitals("cock", "fingers", "cock");
			var genitals2 = pickByGenitals("cock down to the base", "fingers", "cock down to the base");

			append("The futa grins, eager for attention. Before Grandma can scoop her up she runs past and dives headfirst into the toilet, her little dick and balls getting pushed up over the toilet's rim and put on full display for everyone. Grandma tsks, muttering \"Insatiable toiletslut,\" and follows her into the stall, slapping her own dick down between those plush cubcheeks. With only a grunted-out piss-splurt for lube she drives her entire cock down the futa's greasy ass, pushing her tiny body almost down the s-bend.\n\nThe fuckling's gurgles grow weaker. She isn't even trying not to get fucked into a toilet, honestly. Her little hands scrabble for a moment at the stained sides of the bowl, then relax and fall to her sides; she hasn't drowned, really. It looks more like a state of concentrated meditation.\n\nGrandma recognizes this and fucks her eight times as hard to try and snap her out of it. In sync with the deepest, hardest thrust yet— one that yanks a flood of bubbles and a muffled underwater squeak from the futa— she drops a thumb on the lever and flushes, groaning deep in her chest as toilet's gyrational current takes the futa for a tight little spin on her cock.");
			addChoice("Cum.", enterSept.bind("bathswirlycum"));
		}

		if (seg == "bathswirlycum") {
			append("\"Don't tell me what to do,\" Grandma says through gritted teeth, and pumps the kid full of cum ten seconds later anyway~");
			addChoice("Wind down.", enterSept.bind("bathswirlywinddown"));
		}

		if (seg == "bathswirlywinddown") {
			Theme.addUiChoice("geist");
			data.house2Done = true;
			append("\"What did I just... hnnnrgh... fuckin say?\"\n\n\"Good job~\" Mom says, meek and admiring, one hand tweaking a tit while the other's all busy between her thighs. \"You really swirled em, mom!\"\n\n\"Yep,\" Grandma says, pulling the funky-furred toddler out by their ankle with a <!i>pop<!i> like a plunger.\n\nGrandma leads Mom and the other two jealous tods out of the bathroom, dragging her dazed, cum-dripping swirlyslut along for the rest of their day trip. \"Alright guys,\" she says, \"Let's go check out the floors on special~\"");
			addChoice("Back.", enterSept.bind("septricasbath"));
		}
		// }}}

		//{{{ info desk
		if (seg == "info desk") {
			var howManyAsked:Int = 0;
			if (data.sepAskedPlace) howManyAsked++;
			if (data.sepAskedVIP) howManyAsked++;
			if (data.sepAskedSpecials) howManyAsked++;
			if (data.sepAskedWork) howManyAsked++;

			if (howManyAsked == 0) {
				data.metBlue++;
				append("You greet a bluebird with a headset working the information desk, and she squeaks and immediately starts texting.\n\n\"Sorry,\" she says, glancing up while her thumbs tip-tap away. \"Sorry, don't mean to be rude— how can I help you?\"");
			}

			if (howManyAsked < 4) {
				if (howManyAsked > 0) append("\"Any more questions?\"");

				if (!data.sepAskedPlace)
					addChoice("What is this place?", enterSept.bind("what is this place"))
				else if (!data.sepAskedWork)
					addChoice("Can I work here?", enterSept.bind("workhere"));
				if (!data.sepAskedSpecials) addChoice("Got any specials on?", enterSept.bind("any specials"));
				if (!data.sepAskedVIP) {
					if (!onFA()) addChoice("Can I get a VIP pass?", enterSept.bind("can i get vip"), {give: ["VIP Pass", 1]});
					else addChoice("Can I get a VIP pass?", enterSept.bind("can i get vip fa"));
				}
				if (data.hoveredMoon && !data.moonUnlocked) addChoice("Wanna fly me to the moon~?", enterSept.bind("moonfly"));
			} else if (data.sepAskedVIP && getItem("VIP Pass").amount < 1 && !data.sepGotNewVIPPass) {
				append("The bluebird smiles. \"How can I help you?\"");
				addChoice("Hey yeah I sold my VIP Pass.", enterSept.bind("soldpass"));
			} else if (data.sepWorkSuspended) {
				append("The bluebird waves at you, full of hope. \"Change your mind about the job?\"");
				addChoice("Yeah alright, I'll be your bimbo.", enterSept.bind("workhere3"));
			} else {
				append(pickOne(["Her supervisor calls her away and gives the bluebird a pat on the shoulder, tone murky with condescension. The bluebird keeps her head down.", "She's busy with another customer all of the sudden: a noisy, kind of unhinged coyote.", "She's on the phone with the owner of the Snagglebank.\n\n\"Yes. No. Of course. Oh, probably ten inches or so when he's hard. No. Probably. I think they were kinda greasy, actually. Yeah. No. Well, no shit. Sorry. No— yeah, my bad, sorry. That was rude. No. No. No. I'll do better next time. Thanks. No. No. Sorry. Sorry. No. Sorry. Okay, I gotta go. No. I gotta go. No, I said. Yes. Okay. Thanks. Bye.\""]));
			}

			addChoice("Look around.", enterSept.bind("main"));
		}

		if (seg == "moonfly") {
			append("\"Oh, no—\" she squeaks, starstruck at the prospect of your ass between her wings, \"I'm not sure I could carry you... and besides, I'm on shift.\"");

			addChoice("Ah, okay.", enterSept.bind("main"));
		}

		if (seg == "soldpass") {
			data.sepGotNewVIPPass = true;

			append("She stifles a little disillusionment. You aren't the perfect cutie she thought you were.\n\n\"That's— well, uh— I'll get you a new one. Don't worry about the cost, I'll pay it. Accidents happen. I will call the Snagglebank, though, and tell them to make the AUTO-SHOP reject your pass next time, alrighty?\"");

			addChoice("Thank you.", enterSept.bind("soldpass2"), {give: ["VIP Pass", 1]});
		}

		if (seg == "soldpass2") {
			append("\"No prob.\"\n\nShe buries her face in her phone again.");

			addChoice("Look around.", enterSept.bind("main"));
		}

		if (seg == "workhere") {
			data.sepAskedWork = true;

			append("She fixes you with her big wide bluebird eyes. \"You... you wanna work with me?\"");

			addChoice("Yes. :3", enterSept.bind("workhereyes"));
			addChoice("Well, what positions do you have open?", enterSept.bind("workhere2"));
		}

		if (seg == "workhereyes") {
			append("\"S'cuse me—\"\n\nShe hides under her desk for a moment. You swear you hear a muffled <!i>squueeeee<!i> of excitement and maybe even a few small squishy schlicks of her birdpussy.\n\nShe pops back up, composed, feathers slightly ruffled. \"Please, do inquire about our open positions, I'd be happy to help you.\"");

			addChoice("Inquire.", enterSept.bind("workhere2"));
		}

		if (seg == "workhere2") {
			append("\"Right,\" she chirps, pulling out a big dusty list of positions: among them you spot BIMBO, URINAL— and a couple other, more <!i>unique<!i> occupations...\n\n\"You'll have to start at the bottom and work up,\" she explains: \"Bimbos. They're our most basic and fuckable employees— we used to call them 'associates' to make it sound nicer, but then we realized they're such worthless cocksleeves they don't deserve a euphemism. You'll work freelance, which is nice, come and go when you like, but while you're working we do require to wear this and only this—\"\n\nShe whips out a bright pink thong. "+pickByGenitals("It's clearly not big enough to cover your cock, but you guess that's part of the appeal", "It's only barely big enough to cover the slit of your pussy", "It's clearly not big enough to cover your cock, but you guess that's part of the appeal")+".");

			addChoice("... Sign me the fuck up.", enterSept.bind("workhere3"));
			addChoice("On second thought, I'll pass.", enterSept.bind("workherepass"));
		}

		if (seg == "workhere3") {
			data.sepWorkSuspended = false;
			addAction("Work", "Whore yourself out at Septrica's skyscraper brothel.", "Junk City");
			append("\"You're hired!!\"\n\nShe pushes the thong into your hand, soft feathers and soft fabric. \"Just use 'Work' from your Act menu at the hub,\" she explains. \"We'll send you to clients all over the building, on marvelous sexual adventures— oh, and um... you'll be paid in mostly worthless scrap metal...\"");

			addChoice("Better try on my uniform~", enterSept.bind("workhere4"));
			addChoice("Look around.", enterSept.bind("main"));
			addChoice("Thanks, I'll go try it! Move along.", gotoHub.bind("Junk City"));
		}

		if (seg == "workhere4") {
			append("You strip right in front of her and everyone else who can ogle an angle on you through the mirror-coated lobby (you realize now that that's why everything is a mirror: no matter where you are, you can usually find the reflected image of jiggly ass by looking in at least one direction). The moment your non-specific clothes hit the floor, that thong slips right up your buttcrack.\n\nYou tug it tight. The fabric yanks at your "+pickByGenitals("nutsack and squishes both balls together into one cute little coin purse", "slit, slipping partially between your cuntlips", "slit and nutsack, squishing both balls together into one cute little coin purse")+".");

			addChoice("Mmmmfff... little tight...", enterSept.bind("workhere5"));
			addChoice("Look around.", enterSept.bind("main"));
			addChoice("Move along.", gotoHub.bind("Junk City"));
		}

		if (seg == "workhere5") {
			append("The bluebird takes one look at the way the thong rides up between your fat asscheeks and faints.\n\nHer surpervisor speedwalks over and gives her a talking-to about her performance this quarter while she drools and replies with half-sensical sentences like \"I'm sorry I just couldn't when the floss goes up into between the butt\" and \"That "+pickByGender("boy", "girl", "cutie")+" sent from beyond the universe O my sweet divine galaxy wizard...\"\n\nEventually she gets back up and re-composes herself, tapping languidly on her phone and biting her lip while her thighs quiver.");

			addChoice("Look around.", enterSept.bind("main"));
			addChoice("Move along.", gotoHub.bind("Junk City"));
		}

		if (seg == "workherepass") {
			data.sepWorkSuspended = true;
			append("\"Oh,\" she says, peeling her eyes off your crotch and tucking the thong away along with her fantasies.\n\n\"Well, just lemme know if you ever change your mind.\"");

			addChoice("Ask another question.", enterSept.bind("info desk"));
			addChoice("Look around.", enterSept.bind("main"));
		}

		if (seg == "what is this place") {
			data.sepAskedPlace = true;

			append("\"Ah,\" the bird says, flicking her professionalism on. \"We're the City's leading brothel and the longstanding bar-setter for all competition. We boast seventy-seven upper floors and seventy-seven basement floors, for a grand total of one-hundred-and-fifty-four different flavors of pleasure— our special brand of Fuckmeat (warmer, tighter, and more lubey than any cheap knockoff) has become a household name thanks to the hard work and dedication of our beloved CEO, Septrica!\"\n\nShe inhales deeply, relieved to be over with the spiel. You crane your neck to look behind the counter; her supervisor was staring at her the whole time. Only now do they turn away, dialing 7 on the phone and muttering quietly.");

			addChoice("Ask another question.", enterSept.bind("info desk"));
		}

		if (seg == "any specials") {
			if (!data.specialsInquired)
				append("\"We've got seven floors on special right now,\" she says, handing you a little pamphlet.\n\n");

			data.sepAskedSpecials = true;

			append("B- 55 TROPICS\nB- 52 LOVE SHACK\nB- 34 MYSTERY ZONE\nB- 14 DOG PARK\n - 04 SUMO\n - 42 GALACTIC\n - 74 FIRING RANGE");

			var specials:Array<String> = ["Tropics?", "Mystery Zone?", "Sumo?"];
			if (!data.specialsYelled)
				for (i in 0...specials.length)
					specials[i] = specials[i].toUpperCase();

			addChoice("Ask another question.", enterSept.bind("info desk"));
			if (!data.specialsTropicsDone) addChoice(specials[0], enterSept.bind("Tropics?"));
			if (!data.specialsMysteryDone) addChoice(specials[1], enterSept.bind("Mystery Zone?"));
			if (!data.specialsSumoDone) addChoice(specials[2], enterSept.bind("Sumo?"), {kinks: ["Baby", "Cub", "Abuse"]});
		}

		if (seg == "Tropics?" || seg == "Mystery Zone?" || seg == "Sumo?") {
			data.specialsInquired = true;

			if (!data.specialsYelled) {
				data.specialsYelled = true;
				append("\""+seg.toUpperCase()+"\" you shout.\n\nThe bluebird flinches back and cowers, feathers ruffled. \"Ah! Please! Don't do that...\"\n\nAfter a moment she composes herself.\n\n");
			}
		}

		if (seg == "Tropics?") {
			data.specialsTropicsDone = true;

			append("\"We flooded B- 55 and made an artificial island in the middle,\" she says. \"And then we rigged up a big lighting system so it's always sunset. Lounge chairs, daquiris, bikinis... it's heaven.\"");

			addChoice("Sounds nice.", enterSept.bind("any specials"));
		}

		if (seg == "Mystery Zone?") {
			data.specialsMysteryDone = true;

			append("\"... No one really knows what's on B- 34,\" she says. \"A couple times guests and staff have tried to science it out; you know, it has a such-and-such percent chance to be a valley full of naked women on Thursdays past 3:00 PM, it's a warm little cabin in the arctic housing a cub research team if you wait however-many hours before you eat breakfast that morning, and on and on. Every time they think they've got a behaviour pinned down it goes and changes on them. So... it could be anything!\"");

			addChoice("Sounds weird.", enterSept.bind("any specials"));
		}

		if (seg == "Sumo?") {
			data.specialsSumoDone = true;

			append("\"Floor four is a wrestling ring,\" she says. \"You can go up against other guests, and you do this foot-stomping thing and try to push em off the ring. I've never done it, of course. I'm a twig. ");

			if (onFA())
				append("\"But you can also go up against...\"\n\nShe covers her beak. \"... um... smaller... contestants... softer! (That doesn't trigger your censor, does it?)\"");
			else
				append("\"But you can also go up against cubs, and Fuckmeat, and I think a lot of the time people do that just so they can work out their stress and body slam something tiny and soft!\"");

			append("\n\nShe places a wing to her beak, thinking. \"Although, I don't really know why it's called 'Sumo.' Sounds like some made-up word.\"");

			addChoice("You don't know what sumo is?", enterSept.bind("you dont know"));
			addChoice("Sounds brutal.", enterSept.bind("any specials"));
		}

		if (seg == "you dont know") {
			append("\"Well.\" She blushes. \"I only know what John told me, which is that it's a Japanese.\"");

			addChoice("It's not A Japanese, it IS Japanese.", enterSept.bind("japanesetalk"));
			addChoice("Basically two fat guys gettin all up on each other.", enterSept.bind("fat guys"));
		}

		if (seg == "japanesetalk") {
			append("\"Oh. Sorry. I don't know much about your... um. Where you come from.\"");

			if (!data.specialsMysteryDone || !data.specialsTropicsDone)
				addChoice("Ask about more specials.", enterSept.bind("any specials"));

			addChoice("Ask another question.", enterSept.bind("info desk"));
		}

		if (seg == "fat guys") {
			append("She tugs at her collar. \"Erh... sounds... sorta nice.\"");

			addChoice("It's really not at all.", enterSept.bind("not at all"));
			addChoice("... You like tha big boyz?", enterSept.bind("you like big"));
		}

		if (seg == "not at all") {
			append("\"To each her own.\"\n\nShe smiles a beaky smile.");

			if (!data.specialsMysteryDone || !data.specialsTropicsDone)
				addChoice("Ask about more specials.", enterSept.bind("any specials"));
			addChoice("Ask another question.", enterSept.bind("info desk"));
		}

		if (seg == "you like big") {
			append("She covers her mouth to stifle tinkling little bird giggles. \"... Tha big boyz? Er... yes... I guess I do.\"");

			if (!data.specialsMysteryDone || !data.specialsTropicsDone)
				addChoice("Right on.", enterSept.bind("any specials"));
			addChoice("Ask another question.", enterSept.bind("info desk"));
		}

		if (seg == "can i get vip fa") {
			data.sepAskedVIP = true;
			append("\"No... ah... sorry.\"\n\nShe puts her wings in her lap and looks down, dejected. \"You've got a [FurAffinity Censor]. It\'s okay. You wouldn\'t want to see those floors anyway, they're really rough places.\"");
			addChoice("Alright.", enterSept.bind("info desk"));
		}

		if (seg == "can i get vip") {
			data.sepAskedVIP = true;
			append("\"Absolutely. Yes. I think.\"\n\nShe glances over at her supervisor. She nods.\n\n\"Yes!\" the bird says, and does a little fist pump, tailfeathers disappearing around the back corner. Her office chair spins wildly.\n\nWhen she returns she's got a silvery green little card for you. \n\n\"Here you go!\" she chirps.");
			addChoice("Thanks!", enterSept.bind("birdnext"));
		}

		if (seg == "birdnext") {
			append("Her phone buzzes and she can't help but whip it back out and text furiously.");

			if (data.metMarei == 0) {
				append("You get a peek at the screen...\n\n");
				addSprite("assets/img/effect/birdChat.png");

				if (data.knownAsPlayer == 0) addChoice("What are you guys talking about?", enterSept.bind("what talking about"));
				addChoice("You can take a picture of me if you want.", enterSept.bind("you can take pic"));
			}

			addChoice("Look around.", enterSept.bind("main"));
		}

		if (seg == "what talking about") {
			append("\"NOTHING!\" she says, blushing, hiding her phone. \"Please... go on. There's a lot more to see in this town than little old me...\"");
			addChoice("Ask another question.", enterSept.bind("info desk"));
			addChoice("Go on.", enterSept.bind("main"));
		}

		if (seg == "you can take pic") {
			data.pictureTaken = true;

			cameraFadeIn(0xFFFFFF, 1.3);

			append("Before you finish your sentence her camera flash blinds you.\n\n\"Thanks!\" she chirps, sending it off.\n\n... But she doesn't send it to the person she was texting. She hurries to hide the name of the recipient:\n\nSeptrica.");

			addChoice("Ask another question.", enterSept.bind("info desk"));
			addChoice("Look around.", enterSept.bind("main"));
		}
		//}}}

		if (seg == "green door") {
			append("You head over to the door.\n\nOn your way, you notice the only people going through it are suited customers with the cleanest-trimmed fur, the whitest teeth, and the biggest bulges, and they're all swiping a purple card at the door.\n\nYou press your face to the glass. Just beyond the door stretches a grassy, mirror-walled corridor with realistic sky simulation, creating the illusion of an infinite field.\n\nThe thin air on either wall is pockmarked with doors: RESERVATIONS, COMPLAINTS, SUGGESTIONS.\n\nThe door's locked, of course. A little digital scanner with Protocol's face asks you to please swipe your Septricard.");

			addChoice("Swipe.", enterSept.bind("swipe VIP"), {req: ["VIP Pass", 1]});
			addChoice("Swipe.", enterSept.bind("swipe Septricard"), {req: ["Septricard", 1]});
			addChoice("Look around.", enterSept.bind("main"));
		}

		if (seg == "swipe VIP") {
			append("You swipe your VIP Pass and the Protocol face does a concerned mewl.\n\n\"SORRY, BUT YOU AREN'T ELITE ENOUGH! GO GET A SEPTRICARD!\"");

			playSound("assets/audio/mynt/protocolmew", "mew");
			addChoice("Well I never...", enterSept.bind("main"));
		}

		if (seg == "swipe Septricard") {
			append("You swipe your Septricard and the Protocol face does a happy mewl.\n\n\"SEPTRICARD ACCEPTRICATED. I MEAN SEPTRICARD ACCEPTED.\"");

			playSound("assets/audio/mynt/compute", "compute");
			timer(0.5, playSound.bind("assets/audio/mynt/okie", "okie"));
			addChoice("Here we go... break in.", enterSept.bind("breakIn1"));
		}

		if (seg == "breakIn1") {
			data.sepBrokeIn = true;
			unlockJournal("sepBreakIn");
			disablePause();
			append("The grassy hallway crunches under your feet.\n\nTiny white pebbles drop onto it.\n\nIt's a lowly gardener passing by, sprinkling extra-potent, extra-cummy fertilizer on the grass. You guess someone has to stop it from getting trampled to death by all the traffic.\n\nYou keep your head down and move forward, even after three snake-eyed hyena gangsters shoulder you out of their way and snuff their cigarettes on your floating player name.\n\nDamn. You really thought that was immaterial. Now it's all smudged with ash...");

			addChoice("Examine RESERVATIONS, COMPLAINTS, and SUGGESTIONS rooms?", enterSept.bind("breakIn2"));
		}

		if (seg == "breakIn2") {
			append("Empty, empty, and empty.\n\nNo chairs. No desks. All three rooms you saw from outside the green door are nothing but facades.\n\nAs you move further down the corridor, the smooth-mirrored walls begin to curve. You take one last glance at the green door over your shoulder before it disappears into the illusion of the infinite field.\n\nThere are no people back here. You're not even sure where the walls are anymore. They widen out and narrow down with no distinct architecture. Once in a while you reach out towards the sky or the plains, and your fingers will brush against cool glass, but usually you just grope the air.");

			addChoice("We're looking for a secret elevator that goes to floor 77, right?", enterSept.bind("breakIn3"));
		}

		if (seg == "breakIn3") {
			append("Yeah, but.\n\nYou're.... you're not really in a position to look for anything. It's only been two minutes and you're already totally lost.\n\nYou try to backtrack the way you came, but you end up finding something totally new: a tiny plaque, set into one of the walls and repeating infinitely around you:\n\n<!i>Thanks for voluntarily trapping yourself in the mirror labyrinth. Stop moving. Septrica will see you shortly.<!i>");

			addChoice("...", enterSept.bind("breakIn4"));
		}

		if (seg == "breakIn4") {
			append("...");

			addChoice("...", enterSept.bind("breakIn5"));
		}

		if (seg == "breakIn5") {
			append("...");

			addChoice("What do we do now?", enterSept.bind("breakIn6"));
		}

		if (seg == "breakIn6") {
			append("... You keep moving.\n\nIf you can just find the fake rooms, you'll know you're near the doorway again.");

			addChoice("But the sign said to stop moving.", enterSept.bind("breakIn7"));
		}

		if (seg == "breakIn7") {
			append("Do we really want Septrica to see you shortly???");

			addChoice("I don't think that part was contingent on moving or not.", enterSept.bind("breakIn8"));
		}

		if (seg == "breakIn8") {
			append("This place is just mirrors and grass and a sky sim. It isn't some chinese finger trap where you magically get un-lost if you stop trying to find the exit.");

			addChoice("Let's just try it.", enterSept.bind("breakIn9"));
		}

		if (seg == "breakIn9") {
			append("Alright, okay. Just for a minute though. If anyone shows up, we run.");

			addChoice("Go for it.", enterSept.bind("breakIn10"));
		}

		if (seg == "breakIn10") {
			append("You slump your back against a mirrored wall. For the very first time, you realize why the infinite field illusion is so convincing:\n\nPlayers don't show up in mirrors.\n\n... You guess that's a performance thing?");

			addChoice("Must be...", enterSept.bind("breakIn11"));
		}

		if (seg == "breakIn11") {
			append("You sit in silence for a moment.");

			addChoice("...", enterSept.bind("breakIn12"));
		}

		if (seg == "breakIn12") {
			append("...");

			addChoice("...", enterSept.bind("breakIn13"));
		}

		if (seg == "breakIn13") {
			append("...");

			addChoice("... This really didn't turn out to be the crazy, high-octane heist I was expecting.", enterSept.bind("breakIn14"));
		}

		if (seg == "breakIn14") {
			append("You're the one who decided we should sit down and do nothing instead of searching further.");

			addChoice("Give it one more minute.", enterSept.bind("breakIn15"));
		}

		if (seg == "breakIn15") {
			append("...");

			addChoice("...", enterSept.bind("breakIn16"));
		}

		if (seg == "breakIn16") {
			append("Hold on. I hear something.");

			addChoice("... Told you!!", enterSept.bind("breakIn17"));
		}

		if (seg == "breakIn17") {
			append("No, it's not a secret passageway opening. -_-\n\nFrom the opposite end of the mirrored corridor, something is cooing softly...");

			addChoice("Oh. Examine it.", enterSept.bind("breakIn18"));
		}

		if (seg == "breakIn18") {
			append("It's a little Fuckmeat girl.\n\nA meerkat, you think. She's playing in the lush grass, plucking fistfuls of green and trying to eat them. She doesn't seem particularly interested in you.");

			addChoice("Try and find where she came from.", enterSept.bind("breakIn19"));
		}

		if (seg == "breakIn19") {
			append("At first, the walls around her are all perfectly smooth. But if you explore further (trailing your hand along one of the walls so that you don't get lost again, and leaving oily fingerprints on the glass) eventually you stumble onto another doorway. Like the others, it has no frame and no actual door inside it, so it looks like it's just a portal floating in midair.\n\nThis isn't RESERVATIONS, COMPLAINTS, or SUGGESTIONS.\n\nThe plaque above this one says FUCKMEAT FACTORY.");

			addChoice("Enter.", enterSept.bind("breakIn20"), {kinks: ["Baby", "Plot"]});
			addChoice("... Skip this part please.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakIn20") {
			append("It's a very comfortable little field. FUCKMEAT INTAKE pipes extrude from the walls and spit confused babies onto the soft grass.\n\nThey all eventually crawl onto a system of carpeted conveyor belts on the floor, which send them off to a room labelled SENTIENCE CHECKS...\n\nThere's also a few historical information plaques on the walls:\n\n<!i>A History of Fuckmeat — Year 0\nChimera Discovery — Year 0.1\nStaff Rules<!i>");

			addChoice("Examine SENTIENCE CHECKS room.", enterSept.bind("breakIn21"));
			addChoice("Read <!i>A History of Fuckmeat.<!i>", enterSept.bind("breakInHistory"), {kinks: ["Plot"]});
			addChoice("Read <!i>Chimera Discovery.<!i>", enterSept.bind("breakInChimera"), {kinks: ["Plot"]});
			addChoice("Read <!i>Staff Rules.<!i>", enterSept.bind("breakInStaff"), {kinks: ["Plot"]});
		}

		if (seg == "breakInHistory") {
			append("<!i>Fuckmeat were automatically generated along with the rest of the island. They use sub-feral systems: the same systems used for bacteria and plants. Leading minds at the L.L.L. and Apothecary agree that they were most likely NOT originally sub-feral; Fuckmeat use the same character model as other anthros and display very limited imitations of sentience, which suggest that they were once sentient, too. Before the game started, we can assume Wendy successfully removed their sentience, out of a justified fear for their safety.\n\nJunkport, now Junk City, saw the first Fuckmeat popularity explosion. Breeding rates were at their historical peak. Within three days after the game's initial launch, bored islanders began harvesting natural Fuckmeat lube, letting it evaporate, and then powdering the residue and filling Capsules with it. Capsules rapidly accelerated pregnancy. They drove the gestation period down from nine months to a minute. There are 394,200 minutes in nine months. Soon, the island was overflowing with Fuckmeat.\n\nAfter the Dark Forest vs Junkport war, islanders agreed to create at least one Fuckmeat-free area: now Bright Forest.\n\nWendy removed Fuckmeat in Patch 0.0.1, creating a spike of sexual aggression towards young ferals, which were (at that point) the only infantile creatures on the island. She re-added them in Patch 0.0.2, thirteen days later. From this initial incident, vegetarian movements were inspired which have only gained momentum today.<!i>");

			addChoice("Examine SENTIENCE CHECKS room.", enterSept.bind("breakIn21"));
			addChoice("Read <!i>Chimera Discovery.<!i>", enterSept.bind("breakInChimera"), {kinks: ["Plot"]});
			addChoice("Read <!i>Staff Rules.<!i>", enterSept.bind("breakInStaff"), {kinks: ["Plot"]});
		}

		if (seg == "breakInChimera") {
			append("<!i>Shortly after the launch of the game, mythical creatures began to visit from the Violet Meteorite. Among these creatures were chimeras: beings who spawn with the default character model (a gray humanoid) and then mimic the body and mind of the first person or creature they fall in love with.\n\nA problem quickly developed: Fuckmeat were too adorable. Chimeras began copying them in massive numbers. These faux-Fuckmeat (Fauxmeat, if you will) were entirely unable to move or speak with any dexterity, and yet the islanders used them like any other NPC.\n\nBefore chimeras had been fully understood, it came to the attention of the Apothecary's anti-rape squads that several cases of mysteriously respawning Fuckmeats had been reported all over the island— and furthermore, they were crying and displaying signs of nonconsent before they had been toggled.\n\nTeams were dispatched to tranquilize the doms and recover any Fauxmeat which had been helplessly stuck in accidentally abusive relationships. The anomalous cases were eventually discovered to be sentient chimeras who had accidentally fallen in love with and taken the form of Fuckmeat.\n\n Thanks to the efforts of Septrica, Marei, Theresa, Little Red, and the anti-rape squads, all known Fauxmeats were rescued and moved to the FAUXMEAT SANCTUARY.<!i>");

			addChoice("Examine SENTIENCE CHECKS room.", enterSept.bind("breakIn21"));
			addChoice("Read <!i>A History of Fuckmeat.<!i>", enterSept.bind("breakInHistory"), {kinks: ["Plot"]});
			addChoice("Read <!i>Staff Rules.<!i>", enterSept.bind("breakInStaff"), {kinks: ["Plot"]});
		}

		if (seg == "breakInStaff") {
			append("<!i>— DO NOT MOLEST THE FUCKMEAT UNTIL THEY HAVE PASSED SENTIENCE CHECKS.\n— DO NOT TOGGLE FUCKMEAT BEFORE SENTIENCE CHECKS, AS UNTOGGLED NON-CONSENT IS A RED FLAG FOR DEFECTIVE FUCKMEAT OR CHIMERICAL FAUXMEAT.\n— DO NOT SHARE INFORMATION ABOUT THIS FACILITY WITH ANYONE WHO DOES NOT HAVE A SEPTRICARD.\n— DO NOT ALLOW PEOPLE WHO HAVE NO SEPTRICARD TO SEE THIS FACILITY OR ENTER THE GREEN DOOR.\n— IF YOU FIND ANY NON-PLAYER TRAPPED IN THE MIRROR LABYRINTH, SHOOT ON SIGHT. TAKE THE TRANQUILIZED TRESSPASSER TO THE SECRET ELEVATOR AND WAIT FOR FURTHER INSTRUCTION.<!i>");

			addChoice("Examine SENTIENCE CHECKS room.", enterSept.bind("breakIn21"));
			addChoice("Read <!i>A History of Fuckmeat.<!i>", enterSept.bind("breakInHistory"), {kinks: ["Plot"]});
			addChoice("Read <!i>Chimera Discovery.<!i>", enterSept.bind("breakInChimera"), {kinks: ["Plot"]});
		}

		if (seg == "breakIn21") {
			append("Happy, smiling, usually naked Fuckmeat ride along the conveyor belts. They clearly think it's a blast to sit on their butts and move at 2 mph through a big grassy sunny field. You're starting to understand the purpose of these interior design choices.\n\nYou follow the belts through the door and poke your head into the SENTIENCE CHECKS room. First, the fuckmeat go through a gentle swabbing station, where septuple-jointed robotic arms dab soft cloths at the corners of their drooling mouths to collect a sample of the natural lube they all exude.\n\nThen, those lube samples are fed into an AUTO-MYNT, which almost always mewls with satisfaction and passes them through.\n\nVery, very rarely, the AUTO-MYNT will sound the alarm and send a Fuckmeat down on a different conveyor belt that leads to another room labelled FAUXMEAT SANCTUARY.");

			addChoice("Examine FAUXMEAT SANCTUARY.", enterSept.bind("breakIn22"));
		}

		if (seg == "breakIn22") {
			append("It's... it's kind of wonderful.\n\nIt's a big bowl-shaped field of grass. Around the edges are gentle padded barricades. Any entrance in or out has a Septricard scanner. Toys riddle the grass: bright, squishy, squeaky, completely non-sexual little things. There are huge, very clean bowls of water and milk placed at strategic points around the field, so that no Fauxmeat has to crawl for too long if they want a meal or a slurp. High-pitched laughter tinkles around you. Little furry butts of all shapes and sizes toddle around happily.\n\nAnd...\n\nOn the opposite side of the field, surrounded in angelic, simulated light...\n\n"+(data.metCage > 0 ? "Cage the bull":"A muscled bull")+" sits on the grass.\n\nHe's fully clothed. His expression"+(data.metCage > 0 ? ", for once,":"")+" is peaceful. He picks up a baby girl (she must know him well, because she babbles happily and holds her arms out for uppies) and sets her down on his knee. He bounces her a little bit.\n\nShe laughs, but that's not what she's looking for. The little Fauxmeat crawls clumsily up his thigh, onto his big belly, and reaches for something behind him...\n\n"+(data.metCage > 0 ? "Cage":"He")+" pulls it out. It's a bottle, filled to the brim with hot, fresh milk. <!i>Roxelle's Farm,<!i> the label says, although you can barely read it from here.\n\nHe slips the bottle's sucky nub between her open lips and holds her gently by the back of her head. The bottle tips up.\n\nHe smiles, pulls his legs in criss-cross applesauce, and meditatively watches the milk bubble and drain down her throat. When she's nice and full, he pats her on the back to get the burps out and then sends her off to play. A small line-up of baby boys and girls has formed now that they notice "+(data.metCage > 0 ? "Cage":"the bull")+" is giving out free milk.\n\nOne by one, he pulls them up into his lap, totally flaccid, and bottle-feeds them til their bellies bulge and shine in the sunlight.");

			addChoice("How should I be feeling right now.", enterSept.bind("breakIn23"));
		}

		if (seg == "breakIn23") {
			append("I don't know.\n\nI never knew any of this existed.");

			addChoice("I don't want people to know about this place.", enterSept.bind("breakIn24"));
		}

		if (seg == "breakIn24") {
			append("Me neither.");

			addChoice("... But.", enterSept.bind("breakIn25"));
		}

		if (seg == "breakIn25") {
			append("?");

			addChoice("If Septrica's collapses, people will find out about it.", enterSept.bind("breakIn26"));
		}

		if (seg == "breakIn26") {
			append("... Okay, yeah. Septrica's will probably collapse when I get admin. I'll admit that.\n\nBut I promise I won't let anyone find out about this sanctuary.\n\nWith the admin pass, I can teleport the whole place out to a far corner of the map. No one will ever be able to hurt them.");

			addChoice("... I guess you're right.", enterSept.bind("breakIn27"));
		}

		if (seg == "breakIn27") {
			append("Mmm?");

			addChoice("It sounds a lot more secure than a card-scanner security system and a shitty chinese finger trap labyrinth, anyway.", enterSept.bind("breakIn28"));
		}

		if (seg == "breakIn28") {
			append("Agreed.\n\nSpeaking of... um. We're still basically lost, aren't we.");

			addChoice("... Right yeah, we totally are.", enterSept.bind("breakIn29"));
		}

		if (seg == "breakIn29") {
			append("I'm still not sure where to go, though. I think we're out of the chinese finger trap part, at least.");

			addChoice("Let's backtrack.", enterSept.bind("breakIn30"));
		}

		if (seg == "breakIn30") {
			append("We'll just get lost again?");
			addChoice("... You're probably right. Let's ask "+(data.metCage > 0 ? "Cage":"the bull")+" for directions.", enterSept.bind("breakInBull"));
			addChoice("I don't think so.", enterSept.bind("breakIn31"));
		}

		if (seg == "breakInBull") {
			append("Cage works for Septrica.\n\nHe might raise the alarm.");
			addChoice("... It's worth a shot anyway.", enterSept.bind("breakInBull2"));
			addChoice("Then we have no choice but to backtrack.", enterSept.bind("breakIn31"));
		}

		if (seg == "breakInBull2") {
			append("Alright, if you say so.\n\nYou walk boldly across the open bowl-shaped field. Everywhere, little heads turn to watch with bright, curious eyes. They've probably never seen a player in their lives. Some of them— the sixty-six-year-old babies— they wave their arms with excitement and smile at you as you pass.\n\nCage sees you coming and his face crackles and hardens up into something like mortified rage. He has to force himself to gently pick up the baby on his lap, arms quivering with repressed emotion, and put the kid down softly on the grass. He stands up and brushes some blades of grass off of his lap. He reaches for a tranquilizer pistol at his side.");
			addChoice("Wait. Don't shoot.", enterSept.bind("breakInBull3"));
		}

		if (seg == "breakInBull3") {
			append("\"You're not allowed to be here,\" he growls. \"If you came here to hurt them, I'm going to—\"");
			addChoice("I'm not going to hurt them.", enterSept.bind("breakInBull4"));
		}

		if (seg == "breakInBull4") {
			append("He draws his pistol and points it at your face.\n\nHis hands shake. He can barely aim it straight.\n\nHis face is a bright, painfully bright red. He kicks the sippy bottle away, disgusted.\n\n\"You're not allowed to be here,\" he says again. \"Why are you here?\"");
			addChoice("I... I'm here to try and find the admin password. That's all.", enterSept.bind("breakInBull5"));
			addChoice("I'm here to try and meet Septrica.", enterSept.bind("breakInBullMeet"));
		}

		if (seg == "breakInBull5") {
			append("\"So you can give it to Mynt, right? Stand still.\"");
			addChoice("Well, see, about that, I—", enterSept.bind("breakInBullMeet3"));
		}

		if (seg == "breakInBullMeet") {
			append("\"She can't talk to you yet.\"");
			addChoice("Yet?", enterSept.bind("breakInBullMeet2"));
		}

		if (seg == "breakInBullMeet2") {
			append("\"I'm not one to dump exposition. Stand still.\"");
			addChoice("Stand—? oh no", enterSept.bind("breakInBullMeet3"));
		}

		if (seg == "breakInBullMeet3") {
			playSound("assets/audio/environment/tranq");
			append("A tranquilizer dart lodges itself directly beside one of the major arteries in your thigh.\n\nYou don't overdose and die. This is exactly what he wants. Instead, the tranquilizer slowly pulls a thin wooly blanket over your eyes... then another one, then another one. The world starts to fade away behind shifting layers of hallucinated fabric. Curious little Fauxmeats crawl over and sniff at you.\n\nA feminine voice comes from somewhere outside the blackness:\n\n\"Cage, did you just— oh... "+pickByGender("his", "her", "their")+" Septricard... Marei gave it to "+pickByGender("him", "her", "them")+" on my orders. I guess you missed the memo. Damn. I wanted to do a big dramatic entrance, too...\"\n\nWithin minutes, you're gone.");
			addChoice("Shit.", StoryUtils.badEnd.bind(Septricas.enterSept.bind("breakIn30")));
		}

		if (seg == "breakIn31") {
			append("You follow the empty conveyor out of the sanctuary and back to the SENTIENCE CHECKS room. The robotic arms waggle away.\n\nThe door we came through has disappeared back into smooth, mirrored air.\n\nNow, there's only the conveyor belt for the Fuckmeat who who tested negative for sentience, which ferries them out of this room and down a long, slanted corridor.\n\nThe room is labelled MINT (a literal one). It overflows with a fog of sweaty air that only ever accumulates when lots of people fuck lots of times in a very enclosed space.\n\nWe... we should probably just keep going down the hallway. Don't go in there.");

			addChoice("Examine literal mint.", enterSept.bind("breakInMint"), {kinks: ["Baby", "Love", "Raunch"]});
			addChoice("Continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint") {
			append("Ugh. I <!i>guess<!i> the secret elevator <!i>might<!i> be this way...\n\nYou follow the conveyor, stepping carefully around curious little babies who keep trying to suck on your toes.\n\nThe grassy field illusion finally falls away. The walls shed their mirrors, revealing bare gray stone. No one cares how pleasant this next room looks.\n\nIt's a massive, dome-shaped sex dungeon, of course. The sex fog clings to your face. Babies happily ride the conveyor belt through to a series of comfy little pens on the other side of the room. Through the middle, dozens of employees are hard at... \"work.\" They're all harvesting something shiny and wet which drips from all those little baby orifices...\n\nThere's a memo for new employees pinned to the wall next to you.");

			addChoice("Examine the employees. And stay out of sight.", enterSept.bind("breakInMint2"));
			addChoice("Read memo.", enterSept.bind("breakInLube"));
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInLube") {
			append("<!i>To our new Juicers:\n\nLook, I'm gonna spell this out for you. You know how sometimes a girl's puss will drip with natural lube? Fuckmeat exude that lube from their little mouths, butts, and cunts. It's simply part of their biology. It's also not quite exactly the same as pussyjuice, though... the lube that drips from Fuckmeat orifices is actually a form of Engine fluid, too, which just means each droplet is a physical representation of their code. We can test those droplets to make sure their code really is as simple as it should be— if it's as simple as a plant's, we know they're not sentient. If it's any more complex, we can assume they are sentient and reroute them to the sanctuary. If you notice ANY signs of sentience while you work, stop molesting them and reroute them to the sanctuary immediately.\n\nCertain actions will cause Fuckmeat to release more lube than normal. Those actions are your job. These actions include: tickling, kissing, licking, and, once the babies start getting too used to the first three, you can move on to pinching, hitting, slapping, swinging them around by their scruff, and light breathplay. Anything that leaves a mark does not increase lube yield. Psychological teasing is a waste of time; they aren't smart enough.\n\nOnce you've juiced the babes sufficiently, give em a fifteen minute break and then start from the top again until they're dried out. DO NOT toggle them to Rapemeat at any point, as the nonconsent simulation will severely reduce lube yield.\n\n— Septrica<!i>");

			addChoice("Examine the employees. And stay out of sight.", enterSept.bind("breakInMint2"));
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint2") {
			data.babyMintJunk = "";
			append("You hunch behind the entranceway like this is a stealth game. Nobody has an exclamation mark above their heads yet.\n\nThe juicers all too busy teasing, molesting, and lightly abusing the babies.\n\nYou decide to follow one specific babe through the whole process, to get a feel for it.\n\nBut which sex?");

			addChoice("Male.", function() {
				data.babyMintJunk = "male";
				enterSept("breakInMint3");
			});
			addChoice("Female.", function() {
				data.babyMintJunk = "female";
				enterSept("breakInMint3");
			});
			addChoice("Both.", function() {
				data.babyMintJunk = "both";
				enterSept("breakInMint3");
			});
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint3") {
			append("You pick out a "+babyJunk("fat-assed baby boy", "plump-cunted baby girl", "baby herm with cock, nuts, and cunt so pudgy they practically overflow from between her tiny thighs")+". "+babyJunk("He", "She", "She")+" rides the conveyor belt like one of those slow mechanical rides you can sometimes find in malls... that is: holding on for dear life, bent over with "+babyJunk("his", "her", "her")+" butt up high in the air, and grinning like "+babyJunk("he", "she", "she")+"'s just about to hit the precipice of a roller coaster.\n\nYou look away from your chosen Fuckmeat to see what awaits "+babyJunk("him", "her", "her")+". Up ahead on the conveyor, the juicers are working. They're all deadpan like factory workers, unsmiling even as they coo soft greetings to the little ones and start to warm them up. Whenever a new Fuckmeat rolls in, someone in a waterproofed work uniform will scoop them up by their armpits and sit them down in one of a hundred little ceramic cisterns. Then they get to work teasing them.\n\nYou look back to your little "+babyJunk("boy", "girl", "herm")+". A bored hyena girl worker with huge tits grabs "+babyJunk("him", "her", "her")+" unceremoniously by "+babyJunk("his", "her", "her")+" ankle and tosses "+babyJunk("him", "her", "her")+" into a cistern. "+babyJunk("His", "Her", "Her")+" fat ass jiggles as it bounces off the metallic drain cover set in the bottom of the bowl. If you glance underneath, you notice it drains out to a big central vat full of bubbly, boiling Fuckmeat lube in the center of the room.\n\n\"Here we go,\" the worker purrs, reciting her lines. She tucks her paw deep between the baby's thighs and starts casually groping "+babyJunk("his tiny nuts", "her little cuntlips", "her tiny nuts")+". The worker massages them fiercely, yanking them apart, squishing them up together... and your baby is loving it. "+babyJunk("His", "Her", "Her")+" maw hangs open and "+babyJunk("his", "her", "her")+" eyes go half-lidded. Glittering, gossamer beads of lube start to leak from the corners of "+babyJunk("his", "her", "her")+" mouth and the "+babyJunk("tip of his cocklet", "deep crevice of her cunt", "tip of her cocklet")+". \"Here we go,\" the worker purrs again. Then she leans in for a kiss.");

			addChoice("Keep watching.", enterSept.bind("breakInMint4"));
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint4") {
			append("Your baby "+babyJunk("boy can barely control himself; his thighs lock tight over his little cock, and fresh, clear, slimy babyjuice squirts from his butthole", "girl can barely keep her shit together; she writhes with simulated anticipation as a slimy gush of babyjuice pours over the worker's paw and into the bowl", "herm can barely keep her shit together; she writhes with simulated anticipation as a slimy gush of babyjuice shoots from her cocklet and ricochets off her own cute face")+".\n\nThe hyena leans down closer and closer. Her warm breath washes over the baby's face, twinged with unrealistically mature lust. There's something extra obscene and bizarre about a baby with both eyelids halfway closed, tongue lolling out, blushing, legs spread wide...\n\nShe looks with a ponderous, bored expression into your Fuckmeat's empty eyes.\n\nThe kiss lands.\n\nIt has no love in it. The Fuckmeat can't tell the difference. "+babyJunk("His", "Her", "Her")+" whole body lights up with violent pleasure spasms as this total stranger takes "+babyJunk("him", "her", "her")+" by the back of "+babyJunk("his", "her", "her")+" head and slowly wraps that huge adult mouth around "+babyJunk("his", "her", "her")+" tiny face. You can just barely see the baby's eyes, rolled back in "+babyJunk("his", "her", "her")+" head. The hyena's tits block your view of that cute baby"+babyJunk("cock", "cunt", "cock and cunt")+" and butt, but you're sure every fuckhole on "+babyJunk("his", "her", "her")+" tiny body is positively gushing over with natural lube at this moment.\n\nThe hyena girl pulls off, cheeks full. She tucks a strand of hair behind her ear and drools a fat, shimmery-clear glob of lube that the baby burped up into her mouth during the kiss. The glob plops right down into the bowl and trickles down the drain.");

			addChoice("Keep watching.", enterSept.bind("breakInMint5"));
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}


		if (seg == "breakInMint5") {
			append("Only so many kisses produce the same lube yield. After three more, your "+babyJunk("boy", "girl", "herm")+" stops gushing so much. "+babyJunk("He", "She", "She")+"'s getting used to the feeling of a big warm maw enveloping "+babyJunk("his", "her", "her")+" entire face, you guess.\n\nThe hyena moves on to harder, lewder stuff. Her coworkers glance over and whisper encouragement— she's so professional about this, so calm and unsmiling. She leans down and drags her musky tongue over your baby's flat chest, "+babyJunk("his", "her", "her")+" plump belly, down "+babyJunk("his", "her", "her")+" inner thighs (but not close enough to touch "+babyJunk("his", "her", "her")+" junk) and only stops once she's wrapped her lips around those adorable little toes.\n\nShe glances up at the Fuckmeat's face.\n\n"+babyJunk("He", "She", "She")+"'s got a thumb jammed in her maw, her face coated with saliva. Even "+babyJunk("his", "her", "her")+" sexy eyelashes are hanging heavy with spitglobs. The poor, overstimulated little baby immediately burps up some lube and gushes a little more out between "+babyJunk("his", "her", "her")+" thighs.\n\nThe hyena can't help it. She drops her surgical attitude for a second and smiles; it's the kind of worn-out smile you'd see on the battered face of an old detective after he cracks a brutal case and heads home to sit down and work through the PTSD, head in his hands, lips tugged up in a weary grin, thinking to himself... you know, man, this is a hell of a job... but I'm proud I got those criminals off the streets.\n\nThat smile slides up and down your baby's ticklish foot as the hyena girl fervently deepthroats "+babyJunk("his", "her", "her")+" leg right up to the knee. The baby squirms and coos with violent pleasure. "+babyJunk("His", "Her", "Her")+" head lulls back against the cool ceramic bowl and "+babyJunk("his", "her", "her")+" tiny spine arches up. The lube yield is voluminous. Every other employee glances over with jealousy and resolves to tease their babies as hard as this hyena girl.\n\n... But all good(?) things must come to an end. Soon, the baby is tired of kissing, licking, tickling, and anything gentle. "+babyJunk("His", "Her", "Her")+" throat tightens up with long, needy whines. "+babyJunk("His", "Her", "Her")+" belly heaves with deep breaths. "+babyJunk("He bucks his little hips up over and over, making his cocklet and nuts jiggle around seductively", "She bucks her little hips up over and over, plastering the hyena's chest with tiny arcs of cuntjuice droplets", "She bucks her little hips up over and over, plastering the hyena's chest with tiny arcs of cuntjuice droplets")+"...");

			addChoice("Keep watching.", enterSept.bind("breakInMint6"), {kinks: ["Baby", "Abuse"]});
			addChoice("Leave and continue down the corridor.", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint6") {
			append("This little slut craves abuse.\n\nThe hyena understands.\n\nShe slips a paw up over the baby's pudgy cheek and rubs gently. Your greedy baby just whines and rolls "+babyJunk("his", "her", "her")+" head around while "+babyJunk("he", "she", "she")+" tries to suck the hyena's fingers. A firm grip on "+babyJunk("his", "her", "her")+" jaw stops that.\n\nThe hyena holds your baby's head still with one paw while the other rubs away at one of those rosy cheeks.\n\n\"You ready, baby?\" she whispers. \"Here we go...\"\n\nPap. Pap. Pap.\n\nThe hyena lightly paps her paw against the baby's face. Tiny ripples flow through "+babyJunk("his", "her", "her")+" cheekfat.\n\n\"Here we goooo...\"\n\nThe papping gets harder. Her paw connects about as hard as lukewarm applause. Still, the baby is already enjoying it. "+babyJunk("He", "She", "She")+" coos and giggles with excitement, wet toes curling.\n\nAll the other juicers look on and drool as their coworker lathers herself up to a constant barrage of full, painful slaps. Over and over she lances her open paw across the baby's face, slapping it to the right, the left, the right. Her jaw-grip slides down and locks around the baby's throat instead. The little painsponge gasps for breath between backhands. "+babyJunk("His", "Her", "Her")+" legs shoot out, "+babyJunk("he", "she", "she")+" goes cross-eyed, and oodles of fresh lube splurt down the drain.\n\nBy the end of it, "+babyJunk("his", "her", "her")+" cheeks are both blazing red, but still unmarked by bruises. Judging from the slight swelling, the hyena held back exactly the minimum amount of force.\n\nLube yield steadily declines from there. Your baby can't stop panting and gushing tiny trickles, even when the hyena gives "+babyJunk("him", "her", "her")+" a ten-minute break and then comes back to start pinching "+babyJunk("his", "her", "her")+" tiny, underdeveloped lil nipples and "+babyJunk("cocktip", "clit", "cocktip")+". That's it, then. Dried out.\n\nWith a satisfied sigh, the hyena girl wipes some Fuckmeat lube off on her tits and throws the baby back on the conveyor belt. It whizzes out of the room and onto a conveyor marked LIGHTLY USED, probably off to get abused even harder by another total stranger.\n\nYep, don't see any secret elevators in here...");

			addChoice("What do they do with all the lube in the big vat?", enterSept.bind("breakInMint7"), {kinks: ["Plot"]});
			addChoice("Mmmn... leave and continue down the corridor~", enterSept.bind("breakIn32"));
		}

		if (seg == "breakInMint7") {
			append("They use it to make Capsules.\n\nThe vat boils up all the lube until it's evaporated. Then, a team of employees scrapes the dried residue off the sides of the vat and they make a powder out of it. They feed that powder into a pill press, which converts about a single Fuckmeat worth of lube into three capsules.");

			addChoice("I see. Leave and continue down the corridor~", enterSept.bind("breakIn32"));
		}

		if (seg == "breakIn32") {
			append("You move on through the labyrinth.\n\nDozens of incomprehensible facilities pass you by. More and more, their doors are closed, and there are no staff inside. Cameras watch you from the sky. The mirrored walls start to close in. They yank you around sharp turns and claustrophobic maintenance passageways. You stop seeing signs of any life at all. Even the grass turns to cold concrete. The hallway comes alive with non-euclidean twists and turns, like a swirling forest trail beaten into the grass by a family of brain-damaged deer. At one point you literally walk in a circle for ten minutes and come out somewhere totally different than you last were.\n\nThe glossy walls railroad you all the way to the deepest pit of the labyrinth. There, finally...\n\nYou spot a pair of elevator doors.");

			addChoice("Open them!!!", enterSept.bind("breakIn33"));
		}

		if (seg == "breakIn33") {
			append("There's no buttons. It's just the two metallic sliding doors, shut perfectly tight.");

			addChoice("... Knock?", enterSept.bind("breakIn34"));
		}

		if (seg == "breakIn34") {
			append("You knock.\n\nNothing happens.");

			addChoice("Hm.", enterSept.bind("breakIn35"));
		}

		if (seg == "breakIn35") {
			append("A camera above the door blinks down at you...\n\nSomehow I don't think we're going to see anything here that Septrica doesn't want us to see.");

			addChoice("...", enterSept.bind("breakIn36a"));
		}

		if (seg == "breakIn36a") {
			append("The camera's lens expands and contracts, pulling you into focus.");

			addChoice("Well... we came this far. Might as well plumb deeper before security hunts us down. Backtrack and let's check out one of those facilities.", enterSept.bind("breakIn36b"));
		}

		if (seg == "breakIn36b") {
			playSound("assets/audio/environment/elevator");
			append("Wait.\n\nThe elevator opens.");

			addChoice("... Step inside.", enterSept.bind("breakIn36c"));
		}

		if (seg == "breakIn36c") {
			append("You step inside.\n\nThere is only one floor to choose from:\n\n77 — PENTHOUSE.");

			addChoice("Press the button.", enterSept.bind("breakIn36d"));
		}

		if (seg == "breakIn36d") {
			append("You press the button with a momentous <!i>click.<!i>\n\nThe elevator purrs beneath your feet. You listen to the soft whoosh of each floor passing by just outside the doors.\n\nAfter two solid minutes of breakneck ascension, the elevator stops with a long sigh of metal on metal.\n\nThe doors begin to open.");

			addChoice("Examine Floor 77.", enterSept.bind("breakIn36e"));
		}

		if (seg == "breakIn36e") {
			append("Okay it's a fucking mess.\n\nThere's papers and coffee cups and wine bottles and napkins strewn everywhere. Sticky notes hanging off of everything, scribbled full of batshit crazy ramblings. Old, dead AUTO-MYNTs lay in heaps, most with their electronic guts hanging out.\n\nYou're naturally drawn to a single circle of cleanliness at the very back of the penthouse. It's a clean hanging light, a posh desk, a neatly shuffled deck of cards, and a single, functional AUTO-MYNT.\n\nThe desk's nameplate says SEPTRICA MAUZE — C.E.O.\n\nHer personal AUTO-MYNT has A.M.C.N. #2 engraved below the screen... whatever that means.\n\nYou poke the keyboard. The AUTO-MYNT chirps to life and brings you to Septrica's equally cluttered desktop. No password lock or anything.\n\nI'm sure she wants us to do this... but let's check the computer for the password. Failing that, maybe we can find traces of a password cracker.");

			addChoice("Gotcha. Examine AUTO-MYNT.", enterSept.bind("breakIn36f"));
		}

		if (seg == "breakIn36f") {
			append("Lots of garbled shit... doing a system-wide search for 'password' reveals nothing. Neither does 'admin,' nor 'cracker' nor 'decrypt' nor 'encrypt'... the only things that seem partially readable are a few text files:\n\n<!b>A Letter to Humanity.<!b>\n<!b>Exposition Blocking.<!b>\n\nAnd... well.\n\nThe last one is labelled <!b>For "+data.playerName+".<!b>\n\nSomething tells me you want to open that one last.");

			addChoice("Examine <!b>A Letter to Humanity.<!b>", enterSept.bind("breakInLetter"));
			addChoice("Examine <!b>Exposition Blocking.<!b>", enterSept.bind("breakInExpo"));
			addChoice("Examine <!b>For "+data.playerName+".<!b>", enterSept.bind("breakInPassword"));
		}

		if (seg == "breakInExpo") {
			append("<!b>Exposition Blocking<!b>\n\n<!i>Hey guys, just a memo. This is a cool info-control technique Som came up with called \"Exposition Blocking.\"\n\nIn the likely event that Mynt wants to twist our words and convince the player to do something that we don't want them to do, this technique will severely restrict the opportunities she has to do that.\n\nBasically it's a batman gambit! Yay, batman, sounds fun, right? We're betting that Mynt is too soft to override sappy backstories. So when you aren't fucking the player: AVOID small talk, AVOID meaningless, interchange-able platitudes. INSTEAD, as much as you possibly can, bombard the player with your tragic backstories, your emotions— hit em with the gay shit. The shit that Mynt can't bring herself to twist or overwrite. Don't lie, though. Just say stuff that Mynt couldn't possibly fuck with.\n\nShe's not evil. At least, she isn't evil yet. So I think we can be fairly certain she'll miss out on prime chances to sway the player to her side using characters that the player already trusts and loves. Course this does fuckall to stop her from just giving the player a formal anti-Septrica speech on her own time, directly, but it helps.\n\nSound good? K good.\n\n— Septrica<!i>\n\n... I didn't twist any of that memo, I promise.");

			addChoice("... Examine <!b>A Letter to Humanity.<!b>", enterSept.bind("breakInLetter"));
			addChoice("... Examine <!b>For "+data.playerName+".<!b>", enterSept.bind("breakInPassword"));
		}

		if (seg == "breakInLetter") {
			append("<!b>A Letter to Humanity.<!b>\n\n<!i>To: Any players still living on Earth who have not been assimilated into the meteorite.\n\nFrom: Septrica.\n\nIf you're having trouble reading, get a P. Ring.\n\n"+StoryUtils.cipherize("Dear reader,\n\nI will proceed to argue why and how you should devote your life to the prevention of mass death.\n\nIf you read up on the last century of human history before impact, I think you'll find that certain mass deaths— the catastrophes of Auschwitz and the gulag, of the Armenian and Rwandan genocides, the Great Leap Forward— those were a magnification of individual pathology up to the social level. That dangerous pathology is built into all individuals (including Mynt, although a little indirectly, because our society was literally created out of her pathology). It lies dormant, waiting to be considered, spoken of, and acted on. That pathology usually rears its head as a social movement in response to a repulsive, killable group of people that appear to be infecting your society.\n\nOne way to prevent mass death is for every individual— for you to accept that you are capable of horrible, repulsive things. Then, recognizing that, you must try to reconstruct yourself away from your pathology and towards goodness. For most people, this means joining a religion, but that's only the first step towards true, informed goodness, and although it is a step in the right direction, that step is often taken simply because your friends or your parents told you to take it— a prime example of a social contract, rather than a reconstruction of yourself on the individual level.\n\nAt the lowest point of a failed life, the option of mass murder will present itself. And maybe a certain group of people really have fucked your life over. You're allowed to resent them, but you must be careful not to resent their being. You must never be resentful towards the structure of being or resentful that life includes such people. You must not allow yourself to resent God (or The Structure of Existence, or whatever you want to call it) because if the idea of being itself ever becomes worthless to you, even when it's attached to an awful group of people, their lives as a whole will not matter, and mass murder will become acceptable behaviour. To prevent mass death, we must reconstruct ourselves on an individual level— away from our own repulsive capabilities and towards a reverence of being itself.\n\nYou have to play this game of reconstruction against yourself, and you have to try to win. You must always tear down your resentment and start over and try to win again, to win against yourself, with that religious tenent in mind: God made existence, and it was good.\n\nIt's a difficult, stressful game to play. You are the hero and the final boss. The weight is entirely on you, and it's crushing. But it's also the game with the most wonderful reward imaginable, because it means that if you really do accept your own repulsive potential and speak about it, meditate on it, or express it through art, you have the chance to be the source of the social process that saves entire categories of people from being systematically slaughtered when social conditions nosedive and everyone scrambles to find a target for their resentment.\n\nWe who pray for a cuter future have devoted our lives to the prevention of mass death. It's a lot more cut-and-dry for us, since the group of people in mortal danger just happens to be everyone but Mynt. We had our salvation planned in a few years, in concrete terms, in code and blueprints. The only individual pathology we really had to worry about was Mynt's and Roxelle's.\n\nYou have a couple billion more to worry about.\n\nCheers and good luck,\nSeptrica")+"<!i>\n\nNo idea what a pee ring is.");

			addChoice("Examine <!b>Exposition Blocking.<!b>", enterSept.bind("breakInExpo"));
			addChoice("... Examine <!b>For "+data.playerName+".<!b>", enterSept.bind("breakInPassword"));
		}

		if (seg == "breakInPassword") {
			addToItem("Auto-Chip", 1);
			enablePause();
			append("<!i>"+StoryUtils.cipherize("Why?\n\nWhy have I been hidden all this time? Why did I let you get this far?\n\nIf you want the truth...\n\nIt's because if I ever appeared to you in person, I knew Mynt would take that opportunity to paint me as the most villainous gecko bitch she possibly could. Forming a relationship with you (gasp, I wish <3) would only give her MULTIPLE opportunities to do that. Plus, I'm lazy.\n\nSo I've stayed in the shadows, puppet mastering everything with my dank chubby gecko fingers, preparing for the climax of our plan: a great, biblical flood. But after that... I think I'd like to finally see you in person.\n\nMeet me at Som's after the flood. You're a player, right? Let's play a little game together.")+"\n\n\nOops, keyboard glitched out for a second there. Serves me right for keeping my office so messy and dusty.\n\nGood thing this next part is legible, because it's very fucking important:\n\nI already have the admin password, and I'm going to use it.\n\nLet me cordially invite you to the Cyan Wedding, the great, biblical conjoinment of bodies into one wet monster. It'll be held by gryphon's cavern, up on the meteorite.\n\nHere's an Auto-Chip. If you know anything about anything, you'll know what it's for.\n\n<!i>— Septrica");

			addChoice("Oh shit.", enterSept.bind("breakInPassword2"));
		}

		if (seg == "breakInPassword2") {
			append("Fuck come on!!! Let's go!!!!!");

			addChoice("Where sorry??", enterSept.bind("breakInPassword3"));
		}

		if (seg == "breakInPassword3") {
			append("I don't know, but we're not doing anyone any good from in here!! We have to warn everyone!? Listen— islanders can't run any commands with the password unless you give them your permission. If you see a prompt appear on your screen with Yes and No, click <!i>NO.<!i>\n\nYou understand me?");

			addChoice("Gotcha. Let's hurry. Move along.", JunkCity.junkCityHub);
		}

		if (seg == "refreshments") {
			data.freeRefreshmentsDone = true;
			unlockJournal("Free refreshments");
			append("The table's overflowing with glazed, cooked-brown cubs, expertly arranged with creamy dip and garnish. In the center a baby's been impaled with a pump through its tiny bubblebutt and made into a piss fountain, both of its arms already ripped off and a bite taken out of its juicy little cuntlips.\n\nYou partake in a wonderfully succulent little chunk and pocket a handful of Sweetgrass Salad.");

			addChoice("Look around.", enterSept.bind("main"));
		}
	}

	public static function elevator(seg:String):Void {
		saveCheckpoint("Septricas.elevator('"+seg+"');");
		clear();
		var canGain:Bool = !pauseIsGoingPrev();

		if (seg == "main") {
			append("After waiting a moment for a group of bloodstained jackrabbits to exit, you step naked into a cool metal elevator. Mirrors stained with pink cub-sized lipstick marks encircle you; even the buttons for each floor are mirror-coated, reflecting rows of your own spherical face.\n\nFrom ground level there are seventy-seven floors above and seventy-seven below. The bottom two are marked VIP.");
			if (getItem("VIP Pass").amount > 0) append(" That's you!");

			setLocation("Septrica's");

			append("\n\n- 04 SUMO\nB- 34 MYSTERY ZONE\nB- 55 TROPICS\nB- 72 FAIRGROUNDS\n\nVIP:\nB- 75 LOUNGE & BAR\nB- 77 BREEDING FLOOR");

			if (!data.breedingDone) addChoice("B- 77 BREEDING FLOOR", elevator.bind("breed"), {kinks: ["Baby", "Pregnancy", "Abuse", "Snuff"], req: ["VIP Pass", 1]});
			if (!data.barDone) addChoice("B- 75 LOUNGE & BAR", elevator.bind("lounge"), {kinks: ["Baby", "Drugs", "Abuse", "Snuff"], req: ["VIP Pass", 1]});
			if (!data.lilacDone || !data.shootingRangeDone) addChoice("B- 72 FAIRGROUNDS", elevator.bind("fairgrounds"), {kinks: ["Snuff"]});
			addChoice("B- 55 TROPICS", elevator.bind("tropics"));
			addChoice("B- 34 MYSTERY ZONE", elevator.bind("mystery"));
			addChoice(" - 04 SUMO", elevator.bind("sumo"), {kinks: ["Female", "Male", "Intersex", "Raunch", "Abuse"]});
			addChoice(" - 77 PENTHOUSE", function() {
				clearText();
				playSound("assets/audio/ui/nope");
				append("The button doesn't work. Instead, it just deploys a calm message:\n\n\"Please use the secondary elevator located behind the green door.\"");
			}, {oneTime: true});

			addChoice("Look around.", enterSept.bind("main"));
		}
		//{{{ sumo
		if (seg == "sumo") {
			data.sepCapCharge++;

			if (!data.sumoVisited) {
				append("The doors whirr open and a blast of musky air knocks you over. Lockers lattice the crowded gym, threading around sumo, boxing, kickboxing, and wrestling rings, around glass-walled showers and saunas and a special little room where anyone can sign up or get signed up as a punching bag.");
			} else {
				append(pickOne(["A muscly, vicious-looking dude covered in blood bumps into you. He says sorry a bunch of times, really concerned that you got hurt. You're alright, you tell him, and he says phew, thank gosh.", "You get distracted by a toned, fierce-looking gazelle teen suplexing a lion twice his size. \"FOR MY ANCESTORS!\"", "You look around. A couple stallions horse around in the open showers.", "Two muscled girls wrestle in the sauna, their bodies stellar with sparkly condensation, bits slippin and jigglin and slidin all over each other.", "You look around the Sumo floor."]));
			}

			addChoice(
				"Examine any old ring.",
				elevator.bind(pickOne(["sumo panda", "sumo baby punch", "sumo cub wrestle"])),
				{kinks: ["Baby", "Cub", "Abuse"], faCensor: true}
			);

			addChoice(
				"Take a shower.",
				elevator.bind("sumo showers"),
				{kinks: ["Male", "Intersex", "Female", "Male", "Intersex", "Female", "Male", "Intersex", "Female"]}
			);

			if (!data.sumoBagsDone) addChoice("Examine punching bags.", elevator.bind("sumo bags"), {kinks: ["Female", "Abuse"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "sumo showers") {
			append("You go for a soak.\n\nAs expected, the constant islandwide sexual tension means any room specifically meant for furs to get naked and wet is even more of a constant orgy than everywhere else.\n\nThere's a community vibe in here above the fuckfest, though. This is where the Sumo floor regulars hang out. Little cliques coalesce and drift apart; some reptile herms gossip in a steaming stall for a bit, soaping and groping each other's nuts; some beefy bros share jokes and ass-slappery, one getting double-buttfucked the moment his soap hits the tile; there's even a goth clique taking cold showers in the far back: a coyote, a snake, and a black cat.\n\nTwo lesbian bunny sisters squeeze up on either side of you out of nowhere, their fingers running shampoo through your hair, one gently pulling you to your knees so she can grind her leaking pussy on your locks.\n\n\"Conditioner,\" she purrs.");

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo bags") {
			append("You head up to the training zone: a forest of punching bags.\n\nFurs with blazing eyes and sweaty gloves right-left-right-left bags left and right, a couple of those bags actually being subs tied up and crying tears of pain/happiness, their bellies purpled and sore from the constant abuse.\n\n");
			if (!data.sumoZebraDone) {
				append("A zebra girl leans with both hands flat on the far wall, legs spread wide, begging every random passerby please if they could be so kind as to punch her cunt. A couple beefy guys kneel and oblige her, one yanking her thighs apart while the other beats her all over her soft buttcheeks, denting her vulva, each brutal blow making her whole body jump and quiver.\n\n");
				addChoice("Help the zebra out.", elevator.bind("sumo zebra"), {kinks: ["Art", "Abuse"]});
			}
			if (!data.sumoCubBagDone) {
				append("There's a little area off to the side marked PERSONAL TRAINERS too.");

				addChoice(
					"Poke around the Personal Trainers room.",
					elevator.bind("sumo trainers"),
					{kinks: ["Cub", "Intersex", "Abuse"], faCensor: true}
				);
			}

			if (data.sumoZebraDone && data.sumoCubBagDone) data.sumoBagsDone = true;

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo zebra") {
			data.sumoZebraDone = true;
			unlockJournal("Training zone");
			append("You casually walk up. She squeaks just from the anticipation,\nher shiny, swollen buttcheeks almost seeming to throb bigger \nunder the flourescent lights. Then you realize it isn't getting bigger,\nit's getting closer; she's raising her hips a little for you, clearly desperate for a good\nbutt-beating.\n\nYou lance a couple right hooks across both cheeks at once, drawing out a\nwavery little scream from her as her raw assmeat twitches and quivers,\n decorated now with two more pretty bruises.\n\n\"Thank you~!\" she gasps, and flashes you a shy peace sign as you leave.");
			addChoice("Back.", elevator.bind("sumo bags"));
			addSprite("assets/img/effect/zebraGirl.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
		}

		if (seg == "sumo trainers") {
			data.sumoCubBagDone = true;
			var age:String = "six";
			var foo:String = "cub";
			if (isActive("Pastel Ring")) {
				age = "three";
				foo = "toddlerbitch";
			}

			append("Inside there's a fat-breasted "+age+"-year-old otter herm tied up and hung by her armpits as a punching bag, her face all ahegao, thighs stuck in a spread position, her overlarge nuts and cubcock hanging swollen between them.\n\nIn front of her stands a scrawny bunny guy and his tiger trainer. \"No,\" the tiger grunts, facepalming. \"You gotta throw em like you <!i>mean<!i> em. Picture your motivation again: this little cunt just sauntered up to you on the street in nothing but a thong and begged you to beat her purple. Now, feet square. Try again.\"\n\nThe bunny guy adjusts his glasses and throws a weak punch at the "+foo+"'s dangling cock which misses, hits her tummy, and barely connects enough to make her squeak. She looks disappointed.\n\nThe tiger shakes his head and goes for his water bottle.\n\n\"I'm sorry,\" the bunny whispers to her.\n\n\"S'alright,\" she squeaks. \"You're way gooder than yesterday. Try uppercutting my nuts maybe! They're hard to miss, heh~\"\n\n\"Sure thing.\" He smiles, re-motivated.");

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo panda") {
			append("In the center of the biggest, grandest sumo ring stands a ");
			if (data.pandaChatted) append("familiar ");
			append("chubby panda girl. She barely even attempts to adhere to the rules of Sumo, launching across the ring with a running start and bodyslamming a happy, helpless little baby ass-first. With a sigh of relief she rocks her hips back and forth, grinding her sweaty asscrack over the Fuckmeat's tiny body, muffling its little squeaks.\n\n\"How's that smell, cutie~?\" she asks, lifting her ass up only long enough to give the fucklet one breath. In that moment you spot their cute, sweat-slick expression of pure bliss; they even reach their little paws up to grope the panda's asscheeks just as she brings them down hard again, happily bouncing her hips on the infant's soft little skull.");

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo baby punch") {
			var foo:String = "";
			if (data.metCage > 0) foo = " familiar";

			append("You happen across a tiny boxing ring painted bright primary colors. BABY BOXING, the banner says. There isn't much of a line.\n\n\"In this corner!\" shouts the ref, pointing to a muscled, steamy-snouted,"+foo+" bull. \"Cage!\"\n\nThe ref spins to point at a baby lamb, her eyes wide, mini-gloves strapped to her hooflets. She's making frustrated little sounds, trying to rub herself, her dumb babybrain unable to understand why she can't tweak her clit through the thick gloves. \"And in this corner... uh, some random Fuckmeat!\"\n\nThe ref takes each fighter by the wrist, pretty much just picking up the baby in the process, and touches their gloves.\n\n\"Ok, I wanna see a clean fight.\" He looks at Cage. \"No snuff, no weapons, no rape, no drugs, no scat, no piss, no—\"\n\n\"I get it,\" he says.\n\n\"Alright, then. 3... 2... 1... FIGHT!\"");

			addChoice("Watch.", elevator.bind("sumo baby punch 2"), {kinks: ["Plot"]});
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo baby punch 2") {
			append("Cage nudges the sitting baby's snout with his glove. She falls over.\n\n\"K.O.!!!!!!\" The ref jumps in.\n\n\"Look,\" Cage says, squatting over his territory, his fat, greasy nuts hanging just over her perfectly round belly. \"Can we just skip the bullshit preamble? I just want to beat this baby up.\"\n\nShe's still trying and failing to touch herself; that's upsetting her more than the huge intimidating bull. \"Look at the little bitch,\" Cage grunts. \"She deserves it.\"\n\nThe ref pouts, hardening. \"But that's no fun. You have to have <!i>rules...<!i> You wanna go back before the war, when everything was just a free-for-all?!\"\n\nCage raises an eyebrow. \"You really gonna—\"\n\n\"— No kink segregation, babies getting beaten right next to straight couples in the missionary—\"\n\n\"Fuck rules.\"\n\nCage winds back and drives his glove directly onto the lambling's innocent face, bouncing her skull against the mat with a cute squeal. Her toes curl a little as she finally gets her release.");

			addChoice("Keep watching.", elevator.bind("sumo baby punch 3"), {kinks: ["Blood"]});
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo baby punch 3") {
			append("\"Hey now! Whoa now!\"\n\nThe ref scoots back at a mere glance from the bull. \"Well,\" he says, \"Um— round 2, begin!\"\n\nCage pulls his glove off, a string of pink saliva connecting it to her bloody mouth. She gurgles cute little bloodbubbles, hooflet rubbing harder than ever at her babycunt. He grabs both her wrists with one hand and beats her perfect belly in with the other, each blow yanking a breathless mewl from deep in her pudgy underdeveloped chest.\n\n");

			append("By the time he's done ravishing her little body it's swollen and purple head-to-toe, twitching, both eyes black, both lips split.\n\n\"Okay,\" the ref says, stepping meekly forward. \"Okay, I think you won—\"\n\nJust then, with the last of her strength, the lamblet reaches both tiny hands up and grabs hold of Cage's glove, pulling it gently down to her face and making a slutty little cooing which could only be interpreted as \"Harder.\"");

			addChoice("Stare in amazement.", elevator.bind("sumo baby punch 4"));
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo baby punch 4") {
			append("\"I said I wanted a clean—\"\n\nCage rips his glove away from her and gets to his feet, driving a heel down right on her mewling mouth. She screams past his foot, her pudgy, abused little body quivering hard.\n\n\"Hey! The kickboxing ring is over there!\"\n\n\"How's that feel?\" he asks her, ignoring the ref, casually fucking her tiny broken maw with his big toe. She replies with desperate muffled babywhore babble, sucking his toe like a cock.\n\n\"More?\" he asks. \"Harder?\"");

			addChoice("Watch more.", elevator.bind("sumo baby punch 5"), {kinks: ["Snuff", "Gore"]});
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo baby punch 5") {
			append("He pulls his toe from her mouth to grind his greasy foot over her face. Now that her mouth is mostly unstoppered she releases another slew of moans and gurgles, hands wrapping around his ankle, weakly pulling it up and down, up and down...\n\n\"I said no snuff!\" the ref squeaks. \"No snuff or you're disqualified! And banned! And no refunds!\"\n\nCage doesn't even deign to look at him. He has eyes only for the lamb. With loving, tranquil, brutal stomps he crushes the Fuckmeat's soft little skull, staining the mat pink and red, wiggling his toes in her stupid squishy babybrains as she twitches and pisses herself.\n\nThe ref gawks at all this mess for a moment and then jumps off the ring and runs into a little booth, dialing 7 on his company landline.\n\n\"This is why!\" he sighs. \"This is why we have a blacklist!\"\n\nCage pulls a sponge from nowhere and cleans up after himself as best he can, then hauls the headless Fuckmeat up over his shoulder and leaves.");

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "sumo cub wrestle") {
			append("You roll up to a mud wrestling ring set deep into the floor... <!i>Is<!i> that mud?");

			addChoice("Better look a little closer to be sure.", elevator.bind("wrestle 1"), {kinks: ["Cub", "Male", "Male", "Scat"]});
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "wrestle 1") {
			append("You pick a good front-row seat "+(isActive("Candy Ring")?"(the sweet, rich smell confirms your suspicions: it's hot fudge~)":"(the powerful wafting smell confirms your suspicions)")+" and watch a couple matches go by. At least one contestant is always a cub; one round in particular was literally just two babies getting thrown into the muck, people cheering them on as they gurgled and struggled to stay above the surface, their thrashings sending ripples through the creamy pool of "+(isActive("Candy Ring")?"fudge":"shit")+".\n\nThe best match by far is between two ");

			if (isActive("Pastel Ring")) append("five-year-old toddler boarboys")
			else append("eight-year-old boarboys");

			append(". From the very start of the match the smaller one got painted as the underdog, his opponent spitting a "+(isActive("Candy Ring")?"little":"viscous glob of phlegm")+" into his eye, talking shit, telling the little guy he's gonna get knocked out then raped by spectators who threw their caps away betting on him.\n\nFirst round the underdog gets his open mouth slammed into the "+(isActive("Candy Ring")?"fudge":"shit")+"-smeared tile wall, his curly tail yanked, his belly bruised... Eventually he goes limp in a chokehold and sinks under the surface. The winner throws both little brown fists into the air to great applause. Then...");

			addChoice("Then?", elevator.bind("wrestle 2"));
			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "wrestle 2") {
			append("Then the underdog kicks off the bottom of the mudpool and comes flying with a mighty "+(isActive("Candy Ring")?"chocolate ":"shit")+"splash onto his opponent's ass, slipping his well-hung "+(isActive("Candy Ring")?"fudge":"diarrhea")+"-lubed piggycock easily inside him, stifling those pitiful squeaks by dunking his opponent's face underwater.\n\n\"Foul!\" The ref does a big X with his arms, feeling important. He disqualifies the underdog for use of the forbidden Crouching Tiger Hidden Assrape technique.\n\nThe little boar doesn't give a shit. He can already see the lineup of spectators who bet on him stroking their cocks menacingly. All he cares about right now is shoving as much "+(isActive("Candy Ring")?"thick, overpoweringly sweet chocolate":"shit")+" into his opponent's gasping, gagging mouth as he can and pumping as many ropes up his tiny butt as he can before someone finally gets down into the muck to pull him off.");

			addChoice("Look around.", elevator.bind("sumo"));
		}

		if (seg == "mystery") {
			var day:Int = Date.now().getDay();
			unlockJournal("Mystery Floor");

			if (day == 1) {
				data.mysteryDone.push("Monday");
				
				setLocation("Flesh Vortex");
				append("You step out into a bizarre, alien fleshscape: plains of dicks rippled by misty pheromone zephyrs rolling down strong from the peaks of distant ass mountains.\n\nA storm boils over the horizon. As it nears you realize it's not actually a storm but a self-propagating cluster of interdimensional glory holes; dicks the size of jumbo jets thrust from nothingness in the sky, parting clouds, cumming thunderstorms.\n\nJust a regular old Monday at the Mystery Zone.");

				addChoice("Head up. Tongue out.", elevator.bind("head tongue out"));

			} else if (day == 2) {
				data.mysteryDone.push("Tuesday");
				setLocation("???");
				append("The elevator spits you out inside a cluttered caravan. Teapots, spice racks, long dresses, and oaken wardrobes spill off the walls in precarious stacks beneath hammocks which sway from the ceiling; a few contain snoring kitten vagabonds with holey ears, all teenaged, their tails hanging over the edges.");

				addChoice(
					"Find out who's driving.",
					elevator.bind("driving"),
					{kinks: ["Cub", "Intersex", "Female", "Female", "Abuse"], faCensor: true}
				);

			} else if (day == 3) {
				data.mysteryDone.push("Wednesday");
				setLocation("???");
				append("You step out of the elevator into the middle of a busy street. A truck whizzes by you, taking a few hairs off your eyebrows.\n\nYou hurry off the street into a little cafe. A kitten cub in a maid outfit waves hello and asks what you'd like.");

				addChoice("Where am I?", elevator.bind("chat"), {kinks: ["Cub", "Male"], faCensor: true});
			} else if (day == 4) {
				data.mysteryDone.push("Thursday");
				setLocation("???");
				append("You step into a sunlit valley, too real and too big to actually be inside Septrica\'s. It takes a while of walking until you start to realize there are structures high in the trees; little hanging treehouses and ropebridges. You lean against a mossy trunk and watch as the occupants scurry around; all jaguar women, all naked, all painted with curvaceous dye patterns. A few climb down ladders and stand on a thick bough high above you, making faces, slapping their butts.\n\nA glob of spit flies down and spatters on your face. They both giggle and hide, childish despite their age, fat butts giving away their hiding spot as they waggle in the air.");
			} else if (day == 5) {
				data.mysteryDone.push("Friday");
				setLocation("H.G.V.Z.");
				append("The elevator stops in a tiny pink room. There's a door on the opposite wall marked HAPPY GENTLE VANILLA ZONE.");

				addChoice(
					"... Head inside.",
					elevator.bind("vanilla zone"),
					{
						kinks: ["Cub", "Baby", "Male", "Female", "Intersex", "Scat", "Piss", "Vomit", "Raunch", "Abuse", "Snuff", "Gore", "Blood", "Pregnancy", "Hyper"],
						faCensor: true
					}
				);

			} else if (day == 6) {
				data.mysteryDone.push("Saturday");
				setLocation("A Waterpark");
				append("You step out from the elevator into a sunny waterpark. Except it's a little too yellow to be water...");

				addChoice("Swim.", elevator.bind("water park"), {kinks: ["Piss", "Cub"], faCensor: true});

				addChoice(
					"Visit the sauna.",
					elevator.bind("sauna"),
					{kinks: ["Piss", "Raunch", "Male", "Male", "Male", "Male", "Male", "Male"]}
				);

			} else if (day == 0) {
				data.mysteryDone.push("Sunday");
				setLocation("A Church");
				append("The doors open to reveal a church of the depraved, complete with towering stained-glass depictions of holy figures— most of them extremely underage.");

				addChoice("Pray.", elevator.bind("pray"), {kinks: ["Cub"], faCensor: true});
			}

			addChoice("Get back on the elevator.", elevator.bind("main"));

		}

		if (seg == "head tongue out") {
			append("You open your mouth to the sky and delight in the pitter-patter of cum rain on your face and tongue. It's got an electric, alien musk to it.");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "driving") {
			var age:String = "twelve-year-old";
			if (isActive("Pastel Ring")) age = "six-year-old";

			append("You make your way to the front of the caravan, where a grizzled grandma cat holds the reins on two "+age+" horse twins, both girls. From their powerfully built bodies you deduce they've been pulling this caravan for decades, but today must've been brutally long, because both are panting and near-collapsed in the dirt, their inner thighfur damp with sweat, cunts swollen-red with whip marks.\n\nDespite being older the grandma still has tight curves, not to speak of the ten-inch cock hanging thick between her legs. She doesn't pay you more mind than a glance before dropping the reins with a frustrated sigh and busting out the whip. The horse girls squeal and plead as she cracks it directly between their legs, abusing their tiny underdeveloped pussies relentlessly.\n\n\"You—\" crack \"— little—\" crack \"— cunts—\" crack \"— deserve—\" crack \"— this!\" The old cat growls, holstering her whip fat-end first inside the cunt of the leftmost "+age+", mounting up on the other and raping her into the dusty road.\n\nA catboy emerges from behind you, wiping his eyes blearily. \"Gram-mamaaaa,\" he whines, \"There's an elevator in the wall again... it's covering up my toothbrush...\"\n\n\"Honey, Gram-mama's busy raping our horsie's womb,\" she says, fat nuts slapping against the pitifully squealing horsegirl as she bottoms out inside.");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "chat") {
			append("\"Heck if I know,\" the cub says. \"People just sorta end up here. I think it connects to a lot of weird code in the Engine that it isn't supposed to... but who doesn't love company~?\"\n\nHe gets all up on you, grinding his tiny cockbulge along your thigh, the soft fabric of his panties already spotted with pre. The cafe patrons completely ignore this, reading their newspapers, sipping their coffee... in fact, there's almost nothing sexual to be seen anywhere.\n\nThe cub hooks a thumb under the waistband and pulls his panties down to his knees, hopping up onto a table and sprawling out on his smooth stomach, sending teacups to the floor with tinkling smashes. Already he's drooling and panting and you haven't even touched him yet. \"Come on,\" he says, spreading his bare, plush buttcheeks for you. \"Rape me in front of everyone... they won't mind~!\"");

			addChoice("Go for it.", elevator.bind("rape"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "rape") {
			append("You grip the little kittycunt around the nape of his neck and slip your "+pickByGenitals("cock", "fingers", "cock")+" along his bubbly cheeks, drawing out a low purr. \"Please,\" he mewls, \"as deep as you can~!\"\n\nYou drive "+pickByGenitals("your cock", "three of them", "your cock")+" up his already well-used hole and he screams and claws at the table with frantic pleasure, wrapping his little tail around your thigh, bouncing his ass back in rhythm. Still, no one looks up; not even the feline ears perk in your direction.");

			addChoice("Press hard on his stomach, just to see what happens~", elevator.bind("press on"), {kinks: ["Scat"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "press on") {
			append("You palm his cute tummy hard, and a disgusting, wet little "+(isActive("Candy Ring")?"cakefart":"fart")+" splurts out around your "+pickByGenitals("cock", "fingers", "cock")+". He squeaks and blushes, truly embarassed now. \"Agh! Sorry... I... I didnyyyyAAAA—\"\n\nYou "+pickByGenitals("rape", "fingerfuck", "rape")+" him all the harder for being such a gross little kittyslut, pratically beating his tummy in with the heel of your palm, and soon the he's "+(isActive("Candy Ring")?"dripping cake":"shitting")+" all over you, fat globs of it pattering onto the formerly neatly-set cafe table. The warm "+(isActive("Candy Ring")?"confection":"cubshit")+" makes for great lube, getting softer and softer every time you mush it up with a"+pickByGenitals(" thrust of your cock", "n extra-vicious thrust of your fingers", " thrust of your cock")+"; by the time you "+pickByGenitals("cum deep inside his guts", "get bored with the little fucktoy", "cum deep inside his guts")+" the entirety of his smooth thighs and nuts are coated with "+(isActive("Candy Ring")?"frosting":"a particularly mushy brown")+" and even more is still leaking out of his ruined hole.\n\nPanting, maid outfit ruined, he babbles thanks and curls up in his "+(isActive("Candy Ring")?"cake":"own filth")+" for a little catnap.\n\nEven still no one says anything. They can't even smell the little whore's "+(isActive("Candy Ring")?"baking":"mess")+"; you come to realize, now, that both of you are invisible to these people.\n\nThe catboy catches you puzzling over it and smiles. \"It's cause we're not from here.\"");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "vanilla zone") {
			append("The moment you open the door a flood of squishy red cubguts floods out like The Shining; you only barely manage to grab the doorframe and pull it shut behind you.\n\nThe entire room is packed from end-to-end with cubs, most half-dead, missing limbs, getting raped. Bloodsoaked adult furs in colorful bathing suits laugh and chat with each other whilst casually murderfucking one kid after another, two Fuckmeat Dispensers set into the wall, both buttons duct-taped down, spewing an endless stream of babymeat for those who appreciate their particularly soft destrutibility.\n\nA tiny weasel boy suffocates to the far left, his cute little face held between a boar's clenched asscheeks while he forces "+(isActive("Candy Ring")?"cake":"a shitlog")+" down the kid's throat. Elsewhere two herms are bruising babies for fun, landing vicious blows on their perfectly round little tummies until they "+(isActive("Candy Ring")?"spew soft, melted candies":"puke")+" all over the two herms' cunts, both of which are crowning while they give birth to even more sexy little punching bags.\n\nElsewhere-er, a girl of about seven pants and moans whorishly as a man hooks all his fingers into her ass and cunt, one by one, deep as they can go, before yanking them in opposite directions, grunting, stretching her until the skin between them is a pencil-thin line, until finally her torso rips open up to her bellybutton and her intestines spill out cute as can be. He then dives in, happily making out with them, gnawing her colon as little girl guts drips over his chin.\n\nElsewhere-er-er, a gazelle employee hands out power tools and weaponry to the adults before going on break to get some use out of them himself. He picks up a naked big-breasted two-year-old herm and bounces the fucklet on his hyper cock, which is about two times as big as her entire body. He coos: \"Open wide honey~!\"\n\nThe cub opens her maw, little strands of saliva connecting her lips, and the gazelle starts fucking her throat with the barrel of a glock. \"Wanna die for me~?\" he asks rhetorically. \"Gag as hard as you can for yes, and squeal as hard as you can for no.\"\n\nThe two-year-old's cocklet sticks straight up as she glrks and gurgles in a deep, disgusting little gag, so excited she pisses all over herself. \"Good snuffmeat,\" the gazelle chirps, and pulls the trigger.");

			addChoice("Nice.", elevator.bind("main"));
			addChoice("ALLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLRIGHTY THEN.", elevator.bind("main"));
		}

		if (seg == "water park") {
			data.waterparkSwam = true;
			append("You go for a dip in a pool of piss, sort of surprised to find its all kept warm. A kangaroo mom and her kids wade in the shallow end, all of them, even her son, clad in tight-fit bikinis. The cubs are splashing each other, wrestling, at times hiding underwater (underpiss?) and blowing bubbles; you notice the mom and the lifeguard both have their hands down their suits, watching the sexy little piss-soaked 'roos play.\n\nThe lifeguard climbs down from his tower and comes over to chat with the mom. She nods and a wicked grin spreads over her face. \"Honey,\" she says to the boy, \"come here.\"");

			addChoice("Keep watching.", elevator.bind("water park watch"), {kinks: ["Cub", "Snuff"]});
			if (!data.saunaDone) addChoice(
				"Visit the sauna.",
				elevator.bind("sauna"),
				{kinks: ["Piss", "Raunch", "Male", "Male", "Male", "Male", "Male", "Male"]}
			);
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "water park watch") {
			append("The boy steps out of the water shyly, looking up at the sizeable lifeguard. \"This nice man is gonna drown you. I want you to struggle extra hard for mommy, mkay?\" she says sweetly, dragging her finger in slow circles around her clit.\n\n\"Mkay, mum,\" the little roo says, spinning around and pulling down his bikini bottom to reveal a perfect little butt dripping with yellow. The lifeguard is on top of the cub in a second, his cock between those wet cheeks as he straddles the fucklet and shoves the kid's face underpiss.\n\nThe boy's sister goes automatically to her mom, hopping up onto the kangaroo's lap and making out with her while she watches the lifeguard start the rape properly, slamming into the boy's swollen pucker and holding his thrashing head under by the throat. You can hear his cute little screams even through the water, big fat bubbles rising to the surface, his feet kicking and splashing pointlessly as he drowns.");

			addChoice("Keep watching.", elevator.bind("water park watch 2"));
			if (!data.saunaDone) addChoice(
				"Visit the sauna.",
				elevator.bind("sauna"),
				{kinks: ["Piss", "Raunch", "Male", "Male", "Male", "Male", "Male", "Male"]}
			);

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "water park watch 2") {
			append("Finally, well after the boy goes limp, the lifeguard cums inside him and leaves his corpse floating in the pool for other random passerby to rape.\n\nThe little girl pouts while her mother gets off. \"When does he come back, mommy?\" she asks.\n\n\"Fifteen minutes or so and he'll be back good as new,\" she says.\n\n\"Fifteen minutesss... uuuughh... but I wanna playyy!\" the girl whines, getting all worked up. \"And how come he always gets to die! I wanna die too!\"\n\n\"We talked about this sweetie. You got to die yesterday. Today it's your brother's turn. Now turn around for mommy and spread your cunt, okay? Only got fifteen minutes...\"");

			if (!data.saunaDone) addChoice(
				"Visit the sauna.",
				elevator.bind("sauna"),
				{kinks: ["Piss", "Raunch", "Male", "Male", "Male", "Male", "Male", "Male"]}
			);

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "sauna") {
			data.saunaDone = true;
			append("You strip and walk into the sauna with a towel around your waist, "+(data.hasBoobs?"tits hanging free, ":"")+" and the stank hits you like a brick wall. There's six burly dudes in here, one regularly tipping a pot full of piss over hot coals and snorting up the hot steam.\n\nEven after five minutes you're overheating, but none of these guys seem to mind. In fact, they're getting a little intimate now that you're here to watch, grinding their fat bellies together, making out with each other's sweaty pits; a couple rhinos way in the back are even slurping the "+(isActive("Candy Ring")?"frosting":"smegma")+" from each other's foreskins and then swapping it back and forth in a sloppy makeout sesh.");

			if (!data.waterparkSwam) {
				addChoice("Swim.", elevator.bind("water park"), {kinks: ["Piss", "Cub"], faCensor: true});
			}

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "pray") {
			append("You take a spot between two naked lioness nuns and clasp your hands together.");

			addChoice(
				"Oh Lord, please do your will unto me, like seriously, I'm down for anything...",
				elevator.bind("prayed")
			);
			addChoice(
				"Oh God above me in Heaven, with all the cute little naked cub angels, please take me when my time comes...",
				elevator.bind("prayed")
			);
		}

		if (seg == "prayed") {
			append("One of the lioness nuns hands you a bible, interrupting your prayer. It's warm, bordered with golden trim... she opens it to the bookmarked page and shows you a picture of an adorable eight-year-old deity, neither boy nor girl, getting spitroasted with two dicks in each hole by four disciples.\n\n<!i>And lo,<!i> the passage reads, <!i>our Lord did taketh the fourth with nary a shiver, for the Lord's insides contain all space that was, and all that would be; and the warmth of the Lord's small throat was of the sun on the clouds, and the moisture of their sacred orifices was of dew in morning grass...<!i>");

			addChoice("Keep reading.", elevator.bind("prayed 2"), {kinks: ["Snuff"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "prayed 2") {
			append("You turn the page, and the lioness nods her approval, reaching down to stroke your "+pickByGenitals("bulge", "cunt", "bulge")+". This picture shows the lifeless body of the child deity, Their stomach bulging out with seventeen inches of cockmeat.\n\n<!i>And lo,<!i> it goes on, <!i>there were those among us lacking endowment, and the Lord came unto them and turned their manhoods to great 'cumbers with a flick of Their tail; and though the Lord had no manhood They gave more freely and with more love to the lesser among us than any. On the eve of the Lord's return to Heaven, a scribe lumbered from the desert— a great hairy beast— and at our Lord's insistence we fed and watered the man; and lo, when his loins were free of ragged sandy cloth we saw that he was greater than all men before us, and in whispers amongst ourselves we thought it certain he would need no miracle.\n\nYet the scribe was unhappy. He had run his soles flat on the dunes searching in vain for comfort and a quench to his flame; for an oasis in which to dip his girth, which at that moment we realized could be naught but mirage.\n\nAnd lo, our Lord did rise from Their seat and find good purchase for each ample buttock on the lap of the scribe, and They spoke unto him: Use me as you wish, although I could not survive, for I would find no peace alive nor dead til the lust of every mortal being would be sated; and the scribe grew firm and needing, and our Lord did bare the womanhood betwixt Their cheeks and beg to be his Saviour.<!i>\n\n\"Probably my favourite passage,\" the nun whispers.");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}
		//}}}
		//{{{ tropics
		if (seg == "tropics") {
			append("\"Basement floor fifty-five,\" says the speaker. \"The tropics.\"\n\nThe elevator doors gape to reveal rolling sunset sand dunes, sparkly turquoise lazy rivers, furs flopped on beach towels, under parasols, eating watermelons, playing volleyball, splashing in the simulated sea. A doberman struggles and pants, buried up to his neck in the sand next to a kitten cub stretched out on a stripey towel.");

			//data.sepCapCharge++;//
			addChoice("Chat with the volleyballers.", elevator.bind("chat volleyball"));
			addChoice("Throw down some hefty volleys.", elevator.bind("throw down"), {enabled: !data.bigBoiJudged, toolTip: (data.bigBoiJudged?"Big Boi refuses to play with you.":"")});
			addChoice("Wade in the lazy river.", elevator.bind("wade river"));
			addChoice("Check out the buried guy.", elevator.bind("check buried"), {kinks: ["Cub", "Male", "Female"], faCensor: true});
			addChoice("Swim.", elevator.bind("swim"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "chat volleyball") {
			append("You consider the options...\n\nAn athletic tiger. (Captain)\nA chubby panda.\nA twitchy gecko.\nA lithe raven.\nA... you're not sure what he is, but he's white-furred, ripped, and ready to throw down. People apparently call him Big Boi.");

			addChoice("Captain.", elevator.bind("ask captain"));
			addChoice("Panda.", elevator.bind("ask panda"));
			addChoice("Gecko.", elevator.bind("ask gecko"));
			addChoice("Raven.", elevator.bind("ask raven"));
			addChoice("Big Boi.", elevator.bind("ask big boi"), {enabled: !data.bigBoiJudged, toolTip: (data.bigBoiJudged?"Big Boi refuses to talk to you.":"")});
			addChoice("Throw down some hefty volleys.", elevator.bind("throw down"), {enabled: !data.bigBoiJudged, toolTip: (data.bigBoiJudged?"Big Boi refuses to play with you.":"")});
			if (!data.riverWaded) addChoice("Wade in the lazy river.", elevator.bind("wade river"));
			if (!data.swam) addChoice("Swim.", elevator.bind("swim"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "ask captain") {
			data.captainChatted = true;
			append("Captain gives you a crossed-arms nod of stern fatherly approval. \"Just 'cause I'm captain doesn't mean I'm the best. I'm alright. But certainly nothing to write home about.\"");

			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "ask panda") {
			data.pandaChatted = true;
			append("\"Hi,\" Panda says, giving you a big squishy hug. \"I'm Panda. It's great to meet you, seriously. Anyway, I'm decent at hitting, decent at passes... I just can't jump too high, y'know?\"\n\nShe grabs her belly fat with both hands. \"This gosh darn frickin' blubber always messes up my spikes.\"");

			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "ask gecko") {
			data.geckoChatted = true;
			append("Gecko doesn't let you get near him until he's thoroughly checked out your clothes and your hands and your feet and your face.\n\n\"Okay. That's good. No closer. I'm Gecko. I hit well. Don't like passing. Too much trust. Spikes too. I see the plan. Nets are for catching people. No way in fuck am I jumping up into one. Can't catch me.\"\n\nHe runs off.");

			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "ask raven") {
			append("He just ignores you at first. After trying to get his attention for two minutes he finally acknowledges you with a scoff and a subtle flex. \"Back off, Jankmaster. Your moves are weak.\"");

			addChoice("Tell me what you're good at please.", elevator.bind("what your good at"));
			addChoice("Jankmaster? Immense disrespect. 1v1 me bro.", elevator.bind("1v1 me"));
		}

		if (seg == "what your good at") {
			append("\"Why should I tell you shit, Jack?\"");
			addChoice("Fight me you feathered motherfucker.", elevator.bind("1v1 me"));
		}

		if (seg == "1v1 me") {
			append("You both square up on the court. 1v1 volleyball, you start to realize, is a lot like high-net tennis without racquets.\n\nHe serves to you in a beautiful arc.");

			addChoice("Hit.", elevator.bind("spike"));
			addChoice("Spike.", elevator.bind("spike"));
		}

		if (seg == "spike") {
			data.ravenChatted = true;
			append("The moment the ball passes back over the net, Raven gets mad air with a single wingbeat and spikes it into your face with 100% accuracy.\n\nYou collapse.\n\n\"What's up?\" he asks, standing over you with his wings out. \"What's up now huh? What's good? What's up Jack Jankster?\"\n\nCaptain shoves him away and helps you to your feet. Once you've shaken the sand from your nose he crosses his muscled arms and fixes Raven with a glare. \"Oh, he's real tough,\" the tiger says. \"But I'll tell you a little secret: the bird can't hit for shit.\"\n\nRaven's feathers get ruffled, but he doesn't snap back.");

			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "ask big boi") {
			data.bigboiChatted = true;
			append("Big Boi doesn't seem to have the capacity for speech. Up close he's even bigger than you thought. The sparkly droplets of seaspray misted throughout his white fur form constellations in the vast universe of his girth.\n\nHe's always smiling, always looking for something nice to do...\n\nHe plucks you a tiny glowing cyan flower from a vent. Asking around, you discover that he'll always be there for you with the passes, and his spikes tend to fracture bones, but every time he tries to hit to mid or back-court he ends up accidentally sending the ball into the water.\n\nIt's not his fault. He's just a Big Boi.");

			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "throw down") {
			append("You roll up to the nets and fill in for a kangaroo chick with an ice pack to her head.\n\nYour teammates:\nAn athletic tiger. (Captain)\nA chubby panda.\nA twitchy gecko.\nA lithe raven.\nA... you're not sure what he is, but he's white-furred, ripped, and ready to throw down. People apparently call him Big Boi.\n\nFirst to five points wins.");

			addChoice("Start.", volleyballGame);
			addChoice("Back.", elevator.bind("chat volleyball"));
		}

		if (seg == "wade river") {
			data.riverWaded = true;

			if (data.metKemp >= 2) {
				append("Kemp floats by, ass lodged firmly in an inner tube.\n\n");
				append("This dude apparently just shows up wherever there's water.");
			}

			if (data.metKemp == 1) {
				append("Kemp the ottle floats by, ass lodged firmly in an inner tube.\n\n");
				append("This dude apparently just shows up wherever there's water.");
			}

			if (data.metKemp == 0) {
				data.metKemp++;
				append("An otter in a beanie floats by, ass lodged firmly in an inner tube.\n\n");
				append("\"Yo,\" he says. \"Name\'s Kemp. S\'great meeting ya. Tell you what, you should come camping with me and... boys... dank trees... bright...");
				if (data.bfcampClean) append(" janitor bro...\"");
				append("\n\nHe floats away.");
			}

			if (!data.swam) addChoice("Swim.", elevator.bind("swim"));
			if (!data.volleyballersChatted) addChoice("Chat with the volleyballers.", elevator.bind("chat volleyball"));
			addChoice("Throw down some hefty volleys.", elevator.bind("throw down"), {enabled: !data.bigBoiJudged, toolTip: (data.bigBoiJudged?"Big Boi refuses to play with you.":"")});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "check buried") {
			data.buriedGuyDone = true;
			unlockJournal("That dude buried in the sand on the Tropics floor");
			var age:String = "ten";
			if (isActive("Pastel Ring")) age = "seven";

			append("As you approach the kitten gets lazily to her feet— "+age+" years old max— and saunters up to her captive adult. \"How's the vibrator?\" she asks the buried doberman, nudging his snout with a sandy pawtoe.\n\n\"Come on,\" he says, sweat dripping down his face. \"Just turn it down one notch... <!i>one<!i>...\"\n\n\"Mmmm,\" she says, a bit disappointed. She fishes a couple fingers down into her bikini bottom and pulls out a tiny pill-shaped remote glistening with pussyjuice. She thumbs the SPEED button up three more notches, grinning as the doberman squeals girlier than she ever could. \"You wanna say that again?\"\n\n\"No!\" he gasps. \"No! I'm happy! Please!\"\n\n\"You're happy? Weird, I thought you could only ever be one thing. I forget what that was, though... what are you?\" she asks, slowly working a toe past his lips. He glances around, shooting you an embarassed, apologetic wince. Then he whispers: \"I'm your... your little... your......... little sandslut.\"\n\n\"You wanna get your throat stomped, sandslut~?\"\n\nHe whimpers.");

			addChoice("Keep watching.", elevator.bind("sand slut"), {kinks: ["Abuse", "Abuse", "Abuse"]});
			addChoice("Back.", elevator.bind("tropics"));
		}

		if (seg == "sand slut") {
			var age:String = "ten";
			if (isActive("Pastel Ring")) age = "seven";

			append("With all the innocent poise expected of a "+age+"-year-old kitten she daintily wiggles and works her foot into the doberman's mouth, a purr building deep in her flat, smooth chest as she curls her toes on his tongue, cleaning the sand from them, pushes deeper, pinches his uvula between her big toe and the next over...\n\nHe's struggling hard now, gagging as sandy drool pours over his chin. \"Please,\" he says again, muffled past half her footpaw.\n\n\"Please what? Please break your warm little esophagus~? I think I had to stop at the ankle last time because I was wearing socks... but now...\"\n\nShe grabs the back of his head and yanks it back, stifling his gurgling whimpers with the rest of her foot. \"Come on bitch,\" she mewls sweetly as her heel pops past his lips. \"Open wide.\"\n\nWith her little toe-beans pointed down ballerina-style she begins stompfucking the doberman's throat open properly. He's crying, squeaking each time she forces another inch deeper, not even attempting to hide his deep gags by the time her ankle disappears inside his maw. Her expression is serene, perfectly innocent, even as a bead of oil rolls down her inner thigh, even as the words \"I told you to open your fucking mouth~\" come out of her own, even as she yanks his jaw open with both hands and rams her foot so far down his frantically contracting esophagus that he's forced to kiss her knee.\n\n\"Ahhhhh. There. Much deeper than the last.\" She kneels in the sand, sitting on the heel that isn't currently gaping a dude's stomachtube, and starts slowly rubbing suntan lotion over her smooth, sweat-speckled little body. She keeps her eyes on his rolled-up ones the whole time~");

			addChoice("Back.", elevator.bind("tropics"));
		}

		if (seg == "swim") {
			data.swam = true;
			append("You go for a dip. The water's warm, if a little salty. You swim all the way to the invisible wall and press a hand to the simulated horizon.");

			if (!data.volleyballersChatted) addChoice("Chat with the volleyballers.", elevator.bind("chat volleyball"));
			if (!data.riverWaded) addChoice("Wade in the lazy river.", elevator.bind("wade river"));

			addChoice("Back.", elevator.bind("tropics"));
		}

		if (seg == "volleyball won") {
			data.volleyballWon = true;
			unlockJournal("Unbirth");
			append("You walk away from victory with your team, all clappin each other on the back and shit, Captain slappin butts left and right. \"That was some <!i>solid<!i> teamplay, boys. And girl.\"\n\nPanda shrugs politely. You can tell she feels a little left out among all these fit boys.");
			addChoice("What's the prize for winning?", elevator.bind("unbirth1"));
		}

		if (seg == "unbirth1") {
			append("\"The friendships we've formed with each other,\" Captain says.\n\n\"Gains,\" Raven says, flexing.\n\nGecko twitches. \"W-What are you insinuating?\"\n\nBig boi shrugs and smiles at you.\n\n\"About four caps,\" Panda says, and holds them out in her palm.");
			addChoice("If I stuff those in your maw, does that make you the prize?", elevator.bind("unbirth2"), {kinks: ["Female", "Pregnancy"]});
			addChoice("Wow sweet thanks. (End)", elevator.bind("unbirthendearly"));
		}

		if (seg == "unbirthendearly") {
			if (canGain) addToItem("Capsule", 8);
			append("\"Oh jeez. I thought you were gonna— you know what, nevermind, just uh... take these too...\"\n\nShe fishes a couple more out of her rolls. You scoop em all up and stroll away along the synthetic shoreline.\n\n\"W-Were those just from your savings?\" Gecko asks her, suspicious.\n\n\"Maybe. So what? Players need a reward.\"");
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth2") {
			append("She blinks. You become acutely aware of the sweat droplets racing over her somewhat chubby bod, them big bouncy tits, the curve of her belly, the half-covered folds of her cunt— oop, wait, those droplets aren't sweat.\n\n\"Yes,\" she says, carefully, \"under one condition...\"");
			addChoice("It's gonna be a super kinky condition, isn't it.", elevator.bind("unbirth3"), {kinks: ["Female", "Male", "Baby", "Snuff", "Pregnancy", "Piss", "Piss", "Piss"]});
			addChoice("(Get spooked and look around instead.)", elevator.bind("tropics"));
		}

		if (seg == "unbirth3") {
			append("\"When those little caps get me preggers... and when I birth the quadruplets... you have to help me stuff each one back up into my womb.\"\n\n(She's shivering just from the thought of it.)\n\nYou're about to give an answer when she adds one more detail, breathless, last-minute. You think she didn't really have the courage to say it up til this very moment:\n\n\"T-They won't survive.\"");
			addChoice("Sounds cute! (Stuff those capsules in her maw.)", elevator.bind("unbirth4"));
			addChoice("(Uh nope fuck this noise go look around instead.)", elevator.bind("tropics"));
		}

		if (seg == "unbirth4") {
			append("She squeaks with relieved happiness and opens wide.\n\nYou work your fingers into her moist little panda-paw and fish each Capsule out from between the crevices of its pads. They're all slick and shiny. One by one you pinch them between two fingertips and bring them to her lips, pushing them down into the wet warmth, down deeper, til your finger bumps against her uvula and she gags. After the last one, Panda grabs your wrist and pistons your finger right down to her throat and back, sucking it like a cock.\n\nDownstairs, she drives two fingers up her cunt in order to warm it up for the inevitable quadruplets. Droplets of sweat, saliva, and cuntjuice pitter-patter onto the sands, leaving cute craters.\n\n\"I've always wanted to try this,\" she whispers. \"We'll need some lube, though... hm... or maybe just a lot of liquids in general...\"");
			addChoice("Hmmm...", elevator.bind("unbirth5"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth5") {
			append("The other volleyballers shuffle away with their heads down, all except Big Boi. At first you think they just feel awkward about the little PDA moment you and Panda are having... and then you remember everything and (almost) everyone on this island is hypersexual, so it's impossible for PDA to be awkward.\n\n... They're all sad that they didn't get to be your prize, you think. Especially Raven. He's sitting over in the shade, flipping through a little mpreg porn booklet from the L.L.L. and angry-sad-fapping so hard he loses a couple feathers... and a couple tears.\n\n\"Ignore them,\" Panda begs you, bumping her chubby belly into your relatively flat one: squish, squish. You already feel it starting to balloon a little. \"No need for cum to get the babies growing,\" she purrs, tossing a wink over her shoulder at Big Boi. \"Already filled up before the match... now, about those liquids...\"");
			addChoice("Let's hit the showers. You're sweaty.", elevator.bind("unbirth6"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth6") {
			append("She lifts an arm and the intense, salty musk of her armpit washes over you. Matted clumps of pandafur dangle from it, dripping. \"Oh? You don't like it?\"");
			addChoice("Actually I love it, but let's use the showers to keep your babes slicked-up.", function(){
				data.pandaSweat = true;
				elevator("unbirth7");
			}, {kinks: ["Raunch"]});
			addChoice("Not particularly.", function(){
				data.pandaSweat = false;
				elevator("unbirth7");
			});
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth7") {
			append("\"Ah,\" she says, dropping her arm. \"To the showers, then!\"\n\nShe shows you to a concrete shower station on the opposite end of the beach. It's only half a station, really; just a floor and two walls. Most faucets are free, but there are a few straight chipmunk couples having steamy shower sex near the opposite end, and Big Boi just so happens to be taking a rinse here too. (He's using two faucets, due to his girth.) He glances at you over his shoulder and sheepishly smiles.\n\nBy the time you two get comfortable under a faucet of your own, Panda's belly juts out about as far as her tits do, and four distinct little bulges have just started to form beneath her fur.\n\n\"Feel it,\" she says, and guides one of your hands onto her stomach.");
			addChoice("Squeeze.", elevator.bind("unbirthsqueeze"));
			addChoice("Stroke.", elevator.bind("unbirthstroke"));
			addChoice("Grope.", elevator.bind("unbirthgrope"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthsqueeze") {
			append("You give her belly a vicious squeeze. She squeaks and exhales all in one rush of breath: \"Ohgodthey'rekicking...\"");
			addChoice("Next.", elevator.bind("unbirth8"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthstroke") {
			append("Your fingers glide over her perfectly round preggotum, lubed by sweat and the steam from the other showers. She sighs and leans back against the tile wall, hands on her hips, pushing it out even further to accentuate the size. \"A full womb feels so good...\"");
			addChoice("Next.", elevator.bind("unbirth8"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthgrope") {
			append("Ah, groping! Such a wonderful combination of squeezing and stroking! You dig your digits into her soft bellyflesh (two handfuls of it at once) and just manhandle it around like who fuckin cares, yanking that fat beachball hard enough to hurt, slapping, squeezing inward from either side to grind those little fetuses against each other, spreading her innie open with your thumbs like it's just a pussy.\n\nShe loves it. She's got one paw on the faucet for support so her wobbling knees don't have to do all the work.");
			addChoice("Next.", elevator.bind("unbirth8"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth8") {
			append("Suddenly, Panda doubles over.\n\n\"Hnnnghh... hnff...\"");
			addChoice("They coming?", elevator.bind("unbirth9"));
			addChoice("You okay?", elevator.bind("unbirth9"));
			addChoice("Did I hurt you?", elevator.bind("unbirth9"));
			addChoice("Morning sickness?", elevator.bind("unbirth9"));
			addChoice("Gotta shit?", elevator.bind("unbirth9scat"), {kinks: ["Scat"]});
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth9") {
			append("\"No, I... I...\"");
			addChoice("You gonna be alright??", elevator.bind("unbirth10"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth9scat") {
			append("\"Ya,\" she grunts, casually pinching off a "+(isActive("Candy Ring")?"piece of ice cream cake":"greasy log")+" right there in the showers. \"But I also gotta...\"");
			addChoice("Pee??", elevator.bind("unbirth10"));
			addChoice("Look around.", elevator.bind("tropics"));
		}
		
		if (seg == "unbirth10") {
			append("\"Yeah... I just gotta... gnnnnnnnNnnnnNNNN!\"\n\nHer gritted-teeth moan spikes in pitch. She drops to her knees on the floor. From between her thicc, jittering thighs, a fierce little jet of piss erupts. It ricochets off the tiles in a fan of mist that's wide and wet enough to soak your feet in seconds.\n\n\"Ahhhhhhh...\" she sighs. Her belly gurgles and grows another two inches. \"My ‘water' broke...\"");
			addChoice("Slurp some of that up and give her a piss kiss.", elevator.bind("unbirth11"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth11") {
			append("You drop to your knees and noisily slurp up a full mouthful of piss from the growing puddle. You don't even have to ask her to open her maw, she does it automatically— she also automatically grabs you by the back of your head and sucks her own piss from your maw like a vacuum; not gulp-by-gulp, but all at once, way more than she can even fit.\n\nHot yellow fountains out from her nose and splashes down over her chubtits as she struggles to swallow it all regardless. Her massive target of a belly catches the worst of it: after one or two more of those kisses, its white splotches are soaked a caustic hazard-tape yellow. Now the whole beach can tell she's got quadruplets. All it takes is one glance at the swollen, shiny, piss-stained beachball hanging between her knees and it's obvious.\n\nShe grunts, primal and deep. Her piss stream doubles in intensity. It's now gushing from her slit like the hardest setting on a hose nozzle, spluttering, painting her inner thighs with yellow speckles. \"First one,\" she says as warning, one hand barely able to hold her now ridiculously massive belly.\n\nShe grits her teeth and pushes, but not before one saying last thing: \"Don't catch it.\"");
			addChoice("Next.", elevator.bind("unbirth12"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth12") {
			append("As a full-body orgasm wracks her strained cuntmuscles, she gives birth to the first little slab of Fuckmeat: a baby panda boy.\n\nYou don't catch him. He lands face-first in her piss puddle with a splash— and instead of crying, naturally, he starts happily playing around in it.\n\nNext comes two girls and another boy. They all topple down over the firstborn and smear piss all over mommy and themselves, each one just as chubby as her and each just as eager to grope each other's pudgy bodies. Panda sighs, riding the tail end of her fourth cum... and then she releases another gallon of piss and intentionally aims to soak her quadruplets completely. \"You like that, pissbabies~?\" she coos to them. They giggle and open their maws obediently, guzzling their sweet gift.\n\n\"Don't look at them,\" she whispers, pulling you close as her belly deflates. \"I'm the prize, remember? They're just NPCs... and besides, they're not gonna be visible for much longer...\"\n\nShe yanks her cunt open with three fingers, showing you every inch of her stretchy insides.");
			addChoice("Put the boy back where he came from~", elevator.bind("unbirth13"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth13") {
			append("You grab the firstborn boy by his skull and make him kiss mommy's pissing cunt, grinding his face deep against the acrid stream. Just need a little lube is all. He sneezes and coughs a bit, but otherwise he's squirming with happiness!\n\n\"Shove him inside,\" Panda demands. She reaches behind her and cranks on the shower. Hot, steamy water cascades over the cub, lubing him even further.\n\nYou double the strength of your grip on the back of his head and wrap your other hand around both of his tiny ankles, which basically turns his entire body into a cute little phallus. One, two, three... <!i>fwoomp!<!i>\n\nJust kidding, his tiny skull and shoulders slipping back up mommy's cunt actually makes a boring sound more like <!i>schlck.<!i> What's less boring, however, is the sound of his adorable lil coos as they come muffled from halfway inside the tight walls of her cervix.\n\n\"Oh fuck,\" she pants, gaped like she's taking horsecock. Her cuntlips clench and shiver hard just above her baby boy's stomach. \"Deeper... I wanna feel him squirm in my womb...\"");
			addChoice("Oh I'll get him deeper. ("+(data.hasCunt?"Fistf":"F")+"uck that baby back into her womb.)", elevator.bind("unbirth14"));
			addChoice("Look around.", elevator.bind("tropics"));
		}
		
		if (seg == "unbirth14") {
			append("You line your "+(data.hasCunt?"fist":"cock")+" up to his perfect little baby buttcheeks and spear the bitch right down to your "+(data.hasCunt?"wrist":"nuts")+". His naturally stretchy anatomy accommodates you just fine, even though his tiny hips are stretched apart and you feel the entrance to his stomach clenching just below your "+(data.hasCunt?"knuckles":"head")+".\n\nWith one hand on Panda's throat and the other on her belly (to feel it bulge of course) you start "+(data.hasCunt?"punching":"thrusting")+" brutally hard, ignoring her desperate pleas of \"Faster! Deeper!\" and simply going at your own pace: slow, deliberate, and forceful enough to make her baby squeal from deep inside her belly.\n\nEventually the only thing left sticking out are his cute lil feetsies. You unplug your "+(data.hasCunt?"fist":"dick")+" and grind your "+(data.hasCunt?"dripping cunt":"precum-spewing cockhead")+" over them, pushing, pushing— stopping for a second to appreciate how unique it feels to have baby toes wiggle so violently against the most sensitive part of your "+(data.hasCunt?"body":"dick")+"— and then pushing, pushing more...\n\nFinally the last little toe disappears up her tunnel's churning walls. She groans all vibrationally, and beneath your hand you feel the babybump settling into the very deepest corner of her womb.\n\n\"More,\" Panda says, groping her other three children at random. She's totally lusted out. Shower water runs over her ahegao face.");
			if (data.pandaSweat) {
				append("\n\n\"A-And fer the next one... use my sweat as lube...\"");
				addChoice("Show me your armpit.", elevator.bind("unbirthsweat"));
			} else {
				addChoice("Your turn. (Hand her a baby girl.)", elevator.bind("unbirth15"));
			}
			
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthsweat") {
			append("Panda bites back some girly excited noise and lifts her arm.\n\nCoagulated pithairs dangle everyplace. She's careful not to let the shower wash away her carefully fermented musk.");
			addChoice("Would you do the honors? (Hand her a baby girl.)", elevator.bind("unbirth15"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth15") {
			append("You pick up a baby girl Fuckmeat by her throat, like she's just an inanimate object, just as destined to be fucked back into the womb as a doorstep is destined to stop doors.\n\n\"Y-You want me to...?\"");
			if (data.pandaSweat) {
				addChoice("Get her nice and coated, kay? <3", elevator.bind("unbirthsweat2"));
			} else {
				addChoice("Please.", elevator.bind("unbirth16"));
			}
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthsweat2") {
			append("She's honored.\n\nPanda kisses her newborn daughter softly on the forehead, whispers something sweet and comforting to her (maybe like \"Nose and maw open, sweetie!\") then promptly buries the little Fuckmeat's face deep inside the jungle of her pitfur. She grinds her baby back and forth, up and down. Dislodged sweatdrops trickle over the girl's flat, pudgy little chest. Even when she starts twitching and gagging on her mommy's overpowering musk, Panda still doesn't let her off. She just scoops a little more sweat up and smears it over the Fuckmeat's body with her paw, up her asscrack and deep inside her tiny, puffy cuntlet, making sure to lube every crevice heavily.\n\n\"There,\" she says, and peels the gasping cub out at last. Her happy blue face is coated with grease and little errant armpit hairs. \"She looks a little ugly, doesn't she? Probably best to hide her away. <3\"\n\nPanda pauses. Then, hesitantly: \"... Would you mind if I did the next part myself, too? I wanna try something.\"");
			addChoice("Go for it!", elevator.bind("unbirth16"));
			addChoice("Look around.", elevator.bind("tropics"));
		}
		
		if (seg == "unbirth16") {
			append("Panda simply toes the other babies out of the way. They slide happily along the piss-coated floor.\n\nThen, where she was kneeling before, she stands the cub up and holds both her tiny paws to keep her steady. \"Ready to be mommy's little dildo?\" she asks her. The baby girl replies with an excited nonsense syllable or two.\n\nWithout any warning Panda spreads her legs and squats over the girl, kissing the crown of her tiny skull with those sloppy, gaped, <!i>still<!i> pissing cuntlips. The size difference is remarkable. You only now realize, in full, that her adult cunt is more than capable of swallowing the little girl entirely on its own, if the right muscles were flexed at the right time.\n\nMommy doesn't give a fuck about flexing her cuntmuscles. No, she just starts wiggling her hips down, chub swaying slowly. The Fuckmeat below coos and closes her eyes as two hundred pounds of panda crush down over her. She stumbles a couple times, at first, trying to keep herself erect— but once those cuntlips slide over her sweaty face and quiver shut around her throat, rippling with Panda's fifth orgasm, she really can't even wiggle out accidentally anymore. Her fate is sealed.\n\nThis fifth orgasm is too much for Panda. She squeezes her baby's paws tight. \"Oh, you're ready—\" she moans, voice fluttering— \"you're so ready! That's it! Here we go, baby~! Here we go! Now you see her... now... you... don't! <3\"\n\nPanda's wobbly knees give out. She ground-pounds her fat ass onto the shower tiles. Two of them crack. Her steaming piss puddle explodes outward and tidal-waves the other babies.\n\nHer tiny, helpless daughter disappears up her cunt, gapes her cervix as a matter of course, and faceplants into her baby brother's asscheeks.\n\n\"Oooooooooogh,\" she groans, holding her bloated belly.\n\n... Either she's actually a little tuckered after that one, or her kids are already getting frisky with each other in the womb.");
			addChoice("Stuff the rest up there.", elevator.bind("unbirth17"));
			addChoice("Unf. Fuck. Stuff those fuckers up there. Next x2.", elevator.bind("unbirth17"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth17") {
			append("You stuff the other two babes inside her easily after that. ‘Stuff' means shove, grind, and hump, of course. Her cunt can hardly even close after that. It hangs open, hungry for more. Her clit throbs, chubby like the rest of her.\n\nShe fixes you with those dusky bedroom eyes, the kind that say \"Give my unbirthed quadruplets something to drown in and overflow my womb with "+(data.hasCunt?"piss":"jizz")+".\"\n\n... She has very expressive eyes.");
			if (data.hasCunt) {
				addChoice("Scissor her.", elevator.bind("unbirthcunt"));
			} else {
				addChoice("Cuntfuck her.", elevator.bind("unbirth18"));
			}
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthcunt") {
			append("You press your swollen cuntlips to hers and start pissing right up into her womb. The sloppy, shiny oils leaking from both your pussies form a vacuum-seal around her birth canal.\n\nPanda's belly swells big enough to obscure her ahegao. Golden yellow splurts from both her nostrils.\n\nAt first her babies gulp loudly at your acrid piss. Then, slowly, one by one, they stop.\n\nYou pull off. Little bubbles of air start coming out interspersed with a gush of piss and wombjuice. \"Hey,\" she says, smacking her belly. \"They stopped kicking...\"");
			addChoice("Why don't you give birth to them one more time for me?", elevator.bind("unbirthend"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth18") {
			append("You spear her cunt open with zero resistance.\n\nYou've never fucked an easier hole~ The only lube you need is her residual piss and wombslime to reach full jackhammer speed with comfort. Every time you bottom out, your head bounces off some piece of squishy babymeat jostling around in her belly— oh, and her belly is <!i>jostling<!i>. You half-suspect she's swinging her hips forward in a rhythm that intentionally makes it jiggle around as violently as possible. She delights in the feeling of her baby bumps squirming, cooing excitedly, and banging against each other. She loves the way they muffledly squeal as your cock pounds against them so mercilessly~");
			addChoice("Bottom out in her womb.", elevator.bind("unbirth19"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth19") {
			append("You slam your cock right up to the back of her womb.\n\nBoth of you freeze. Breaths are held. The only sounds are the distant chatter of the beachgoers, the soft hiss of a few showers...\n\nAnd then, from deep in her fat, shiny stomach... suckling noises. A warm little maw wraps around your cock. Two pudgy paws start working up and down your shaft.\n\n\"Are... are they doing what I think they're doing?\" she whispers in awe.
");
			addChoice("Little sluts...", elevator.bind("unbirth20"));
			addChoice("Look around.", elevator.bind("tropics"));
		}
		
		if (seg == "unbirth20") {
			append("\"Sluts!\" she repeats, flabbergasted. \"They're working your dick for me... unf, that's so rude! <!i>I'm<!i> your prize, not them!\"\n\nShe grabs her belly from both sides and shakes it around hard. All her babybumps rearrange, and that tiny maw pops off your dick. \"You little cunts... well, what are you waiting for? They clearly want dick. Give it to them.\"");
			addChoice("Wombfuck.", elevator.bind("unbirth21"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth21") {
			append("You pick up the speed you just had, except this time you're slamming even deeper than balls-deep— you squeeze your nuts up inside her cunt too. Four slabs of babymeat writhe and grind around your shaft. That same breathless maw gets pinned between your cock and the far wall of her womb, babbling, sucking, squealing. Over and over you pound into it, almost managing to sink your whole head down the newborn's (well, unborn's) helpless little throat.");
			addChoice("Cum.", elevator.bind("unbirth22"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth22") {
			cumEffect();
			append("Without caring in the slightest for their comfort or her's, you push down on Panda's fat belly with both palms and crush all four babies firmly against your throbbing cock. By now they understand how to make you cum, and that's to just keep squirming and thrashing as hard as they can in order to maximize the number of newborn asses, thighs, cunts, cocklets, and faces grinding against your dick at any given moment.\n\nThey do a good job. You explode inside her. <3\n\nCum gurgles out in fat, sticky ropes. It fills in all the cracks between the cubs and then overfills them. For all their infant sluttitude, they can't even guzzle it fast enough. Your nuts stop the flow for a while once it rushes down her birth canal, but soon even they're forced to pop out from the pressure and jiggle around merrily, coated in your "+(isActive("Mood Ring")?getMood("You"):"")+"waterfall.\n\nPanda gasps with relief as your jizz bursts from her cunt and globs down into the sea of piss below you both. The only clue that she ever actually gave birth was in a few tiny pawprints on the edges of that puddle, which have now been washed away by its increased volume and erased forever.\n\n\"You hear that?\" she asks huskily, giving her tummy one last jiggle. It's the sound of tiny throats gulping, and gulping, and gulping... \"They might get some air in there if you're not careful...\"");
			addChoice("Piss in her womb.", elevator.bind("unbirth23"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirth23") {
			append("You let your hot, fresh urine tsunami over their tiny bodies, aiming for maws, cunts, and babybutts whenever you feel them grinding against you from within the thick mess of cum. Panda's belly swells big enough to obscure her ahegao. Golden yellow splurts from both her pussyholes.\n\nSlowly... one by one... her babies stop gulping. Little bubbles of air start coming out interspersed with globs of yellow-stained cum.\n\n\"Hey,\" she says, smacking her belly. \"They stopped kicking...\"");
			addChoice("Why don't you give birth to them one more time for me?", elevator.bind("unbirthend"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthend") {
			append("Panda picks herself up off the ground in a flash, already excited. \"Absolutely.\"\n\nShe cranks the shower up to full and sticks her ass out into the powerful stream, washing off all the"+(data.hasCunt?"":" cum,")+" piss, sweat, and wombslime... making sure she's nice and presentable for the public.\n\nShe turns around and announces to the entire beach:\n\n\"Everybody, come see what we did to these cuties~!\"\n\n... Most people ignore her at first, but when she squats over, holding her bloated belly in both hands, and starts pushing... then people start paying attention.\n\nPanda bites her lip and nearly screams with pleasure as her sixth orgasm arrives and four tiny, sexy little corpses sputter out onto the hard tile floor amid a flood of steamy piss"+(data.hasCunt?"":" and cum")+".\n\nEars perk.\n\nJaws drop.\n\nShe doesn't even try to hold herself up; she just clenches for one more moment, long enough to spray a little more of your "+(data.hasCunt?"spicy urine":"thick "+(isActive("Mood Ring")?getMood("You"):"")+"jizz")+" out over the babies' cute, vacant expressions, and then lets her ass drop onto them, crushing their soft, squishy, "+(data.hasCunt?"piss":"cum")+"-clogged bodies into the tile with the weight of her whole body.\n\n\"Whoever pees in my maw and washes more caps down first gets dibs on round two!\" she announces, and busts out another couple Capsules from somewhere in her rolls.\n\n\"Take it to the Breeding Floor,\" a lifeguard timidly suggests, but she ignores him entirely. She flops onto her back, smiles at you upside-down, and thanks you so so so much!\n\n\"You know,\" she says to you upside-downishly, \"I learned something today. I would've been much too shy to publically post-unbirth abort my babies alone, that's for sure. But with you... heck, it was the easiest thing in the world. <!i>Soooo<!i> easy...\"\n\nShe concludes muffledly, past the fingers of some stranger cramming more caps down her throat: \"I think Captain's on to something... with the power of teamwork, we really can do anything!\"\n\nOver in the showers, Big Boi sheepishly washes some white out of his fur. It's obvious the poor boi feels like he's a total piece of shit for getting off to something so bizarre and horrible.");
			addChoice("Comfort Big Boi.", elevator.bind("unbirthcomfort"), {kinks: ["Love"]});
			addChoice("Judge Big Boi.", elevator.bind("unbirthjudge"), {kinks: ["Abuse"]});
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthcomfort") {
			append("You try to sorta just put an arm around his shoulder or something, but he's just way too fucking Big for that to be physically possible.\n\nInstead you hug him. Well, as much of him as you can wrap your arms around. Your cheek smushes into his freshly showered chestfur.");
			addChoice("It's okay to like this, Big Boi. They weren't real babies, just Fuckmeat. NPCs.", elevator.bind("unbirthcomfort2"));
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthcomfort2") {
			append("Big Boi looks at you with worried contempt.\n\nIf he could speak, you think he'd be saying something like \"Yeah sure, and my OC isn't a loli, she's a 1000-year-old demon.\"");
			addChoice("Look around.", elevator.bind("tropics"));
		}

		if (seg == "unbirthjudge") {
			data.bigBoiJudged = true;
			append("You glare Big Boi down and tell him he's a monster for getting off to dead babies. Seriously, he's a fucking piece of shit. Oh my god dude see a therapist. You're fucked up. Living garbage. You fucking garbolord. You deserve to die.\n\n... Everything you just said makes him harden right back up again. Big Boi is a sub.\n\nHe looks down at the Big length growing between his thighs. He looks back up. Now, Big self-hatey tears well up in his eyes.\n\nAll in one agonized rush, he starts sobbing and wailing voicelessly and runs away with his eyes covered, knocking a bunch of nude and bikini'd beachgoers over with his girth in the process.");
			addChoice("Look around.", elevator.bind("tropics"));
		}
		//}}}
		//{{{ faigrounds
		if (seg == "fairgrounds") {
			append("The elevator opens to a county fair at dusk, ding-dong whizz-bang game booths and naked crowds threaded between colorful tents. The nearest booth sports a row of nets and a swimming pool filled with happy volunteers: GOLDFISH CATCHERY.\n\nA bit farther but much busier looms a huge curtained stage. The spotlights crack on. SHOOTING RANGE, the sign reads, TONIGHT'S TARGET: THE AMAZING GOO MONSTER!");

			if (!data.lilacDone) addChoice("Check out the catchery.", elevator.bind("gold fish catchery"), {kinks: ["Patreon Commission", "Snuff", "Female", "Love"]});
			if (!data.shootingRangeDone) addChoice(
				"Try the shooting range.",
				elevator.bind("shooting range"),
				{kinks: ["Patreon Commission", "Baby", "Female", "Abuse", "Snuff"], faCensor: true}
			);

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "gold fish catchery") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/lilacStraight.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "Edits: Kittery");
				s.x = 400;
				s.y = 50;
			unlockJournal("Lilac");

			append("\"Come one, come all,\" the announcer booms. \"The water's fulla big catches tonight folks! No offense, Marlene,\" he says to a hyena girl doing an evasive breaststroke. \"Step right up and fish one out! You get ONE swing of the net, and if you can make your catch in half a minute we'll slip your little goldfish into a baggie and you can take em right home!\"\n\nThe only person in the pool actively avoiding the nets is a small-boobed ");
			if (onFA()) {
				append("eighteen-year-old ");
			} else {
				append("sixteen-year-old ");
			}
			append("horse girl with a shock of purple down her long, wet hair. Once she spots you ogling, her little ears fold back and she floats inconspicuously away.\n\nYou take a peek at some of the other booths and realize they're all drowning-themed, in one way or another.");

			addChoice("Try the net game.", elevator.bind("net game"));
			addChoice("Go try the shooting range instead.", elevator.bind("shooting range"), {kinks: ["Patreon Commission", "Baby", "Female", "Abuse", "Snuff"], faCensor: true});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "net game") {
			if (data.lilacAttempts == 0) {
				append("You roll up and the announcer welcomes you with a clap on the back. \"Now, here's a "+pickByGender("man", "woman", "body")+" that can <!i>play!<!i>\"");
			} else {
				append("You put down your net, disappointed. The announcer says you can have another go if you like.");
			}

			var choiceText:String = "nil";
			if (data.lilacAttempts > 0) choiceText = "Try to catch her again." else choiceText = "Attempt to catch the horse girl.";

			addChoice(choiceText, lilacGame);
			addChoice("Go try the shooting range instead.", elevator.bind("shooting range"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "shooting range") {
			unlockJournal("Shooting range");
			append("The curtains part.\n\nFat blue goo pours out in beanbag-chair globs over the stage, stopping just short of a painted target. The monster's face is a ._. squashed up by a gajillion chins and barely recognizable. The crowd oooo's and falls back in a wave of awed fear, most cradling happy little ammo or whiplashing themselves in search of the announcer.\n\nSeveral girls and one muscled dude shriek, pointing up.\n\nHigh above the stage and behind the churning goo monster rattles an empty diving board. Your eyes flick up to catch the zenith of a flawless dive: the announcer. His clasped hands pierce the monster's face (it distorts to ._____.) on impact as he plummets through the goo— then, a moment before his scuba mask nicks the stage's wooden boards, he curves his dive up and shoots from the monster's belly. Applause erupts as he lands with outstretched arms on the target's bullseye.\n\n\"LADIES AND GENTLEMEN!\" he booms, even through the mask. \"WELCOME TO THE SHOOTING RANGE!\"");

			addChoice("Examine guns?", elevator.bind("shooting range guns"));
			addChoice("Examine ammo?", elevator.bind("shooting range ammo"), {kinks: ["Toddler"]});
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range guns") {
			append("The \"guns\" are a row of sexy bright red cannons which spectators are already fighting over. Each is equipped with a big FIRE button and an empty, cub-sized maw.");

			addChoice("Find some ammo...", elevator.bind("shooting range ammo"), {kinks: ["Toddler"]});
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range ammo") {
			append("Looks like most people have Fuckmeat or cubs with them as ammo. The cutest are dressed up in bullet-shaped helmets and aerodynamic slutwear. Two hawks operate a Fuckmeat vending booth further down, grabbing money, dishing toddlers out left and right... but they're gouging people with quadruple the standard price.\n\nYou sift through the crowd for an unattended cub. There's a foxling laying down just past— oh, nope, that's a corpse. There's a little figure loping slowly past the fringe of the crowd— oh, nope, that's a feral sloth. There's a curvy little hyena girl with long amber hair down to her oversized kiddytits striking a sexy ass-out pose for— oh, nope, she's just a cardboard cutout in front of the CUBSLUT MAKEOVER booth. <!i>Free thong with every purchase of extra-runny mascara~!<!i> her speech bubble reads.");

			addChoice("Check the dumpster behind the booth.", elevator.bind("shooting range 2"));
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range 2") {
			append("You sniff around behind the makeover booth, lift the dumpster's lid and... jackpot~!\n\nSomeone threw away a perfectly good slab of Fuckmeat: a two-year-old bunnygirl with impeccable mascara, creamy pink lipstick— she's even got the free thong still on tight, two sizes too small for her, the red string pulled taught between her tiny toddlercuntlips. You pull her out and dust her off while she giggles and coos cutely, excited to be your ammo.\n\nA mangy smoking coyote lopes over from some dark alleyway. \"You want some help?\" he asks, then smoothly steals your Fuckmeat without waiting for an answer. \"Lemme see here...\"");

			addChoice("Hey. Finders keepers.", elevator.bind("shooting range 3"));
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range 3") {
			append("\"Ya... hold on... ya.\" He turns the bunny upside-down, sideways, slaps her bubbly little ass. She squeaks happily. \"Ya. This's Fuckmeat. You wanna know how to get Rapemeat?\"");

			addChoice("What's the difference?", elevator.bind("shooting range 4"));
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range 4") {
			data.shootingRapemeat = true;

			append("\"Nothin really,\" he says. \"Same meat. S'just that Fuckmeat act like lil sluts—\" he crams three fingers past her lips by example, which she promptly starts deepthroating while her little pussy drips— \"whereas Rapemeat... lemme just... remember how to switch her from one mode to the other here...\"\n\nHe scratches his scraggly beard for a second, then it comes to him: he gives her tiny poof-tail two quick tugs.\n\nHer happy smile flickers away. Suddenly she's squirming and whining in his hands, trying to escape. The coyote tosses her back to you. \"There y'are. She's Rapemeat now, til ya double-tug her tail again. Meat don't got feelings or thoughts or any of that other shit either way. They're NPCs. Like I said, s'just one acts slutty and the other acts... well, cuter.\"\n\nHe stares at you. \"So. There's some <!i>valuable<!i> information, ya?\"");

			addChoice("Alright, here you go...", elevator.bind("shooting range donate"), {cost: ["Capsule", 1]});
			addChoice("Sorry, man. I'm broke.", elevator.bind("shooting range broke"));
			addChoice("Toggle her back to Fuckmeat.", elevator.bind("shooting range toggle"));
		}

		if (seg == "shooting range donate") {
			append("\"Aw, man, thanks...\"\n\nHe takes the single capsule and leaves with a scowl.");
			addChoice("Back to the range.", elevator.bind("shooting range 5"));
		}

		if (seg == "shooting range broke") {
			append("\"Hey, me too. Doesn't gotta be caps, man, anything, just anything...\"");

			addChoice("I got some... uh... leaves...", elevator.bind("shooting range leaves"), {cost: ["Sweetgrass Leaf", 3]});
			addChoice("I gotta get back to the range.", elevator.bind("shooting range 5"));
		}

		if (seg == "shooting range leaves") {
			append("His bagged eyes light up. \"Mmm, fuck yeah, man, those'll do...\"\n\nHe drags them under his snout, sniffing hard. \"Fresh, too... fuck, thanks man... I'm gonna get ripped today...\"\n\nA fat boar leans out from two booths down. \"HEY! YOUR BREAKS NOT TWENNY MINUTES, IT'S FIF-FUCKIN-TEEN!\"\n\n\"Comin, comin...\" The coyote shoots you a wink and tucks the leaves away securely between his buttcheeks.");

			addChoice("Back to the range.", elevator.bind("shooting range 5"));
		}

		if (seg == "shooting range toggle") {
			data.shootingRapemeat = false;
			append("It takes some wrangling since she's squirming around so desperately but eventually you get a hold of her tail and pull it twice quick. As if snapped out of a nightmare she melts into your arms, completely relaxed, her chubby toddlerthighs automatically spreading for you.\n\n\"I see how it is,\" the coyote says, and skulks off.");

			addChoice("Back to the range.", elevator.bind("shooting range 5"));
		}

		if (seg == "shooting range 5") {
			append("You work your way through the crowd and up to one of the shiny red cannons.\n\nYou lower your two-year-old bunny snufflet down to the cannon's maw. She blinks up at you, confused, a little scared of the dark opening... so, naturally, you decide to take her by her ankles and lower her down face-first, grinning as she gives a "+(data.shootingRapemeat?"pitiful little squeak":"happy \"Weeee~!\"")+" and slides to the bottom. \"Boom?\" she asks.\n\nYou coo the affirmative, adjust the height of the cannon a little, then slam your fist down on the FIRE button.\n\n<!i>BOOM~!<!i>\n\nA spring jolts out, sending her flying with a squeal through the air. Her pudgebutt thumps directly onto the stage's bullseye. The goo monster looms over her for a moment, then scoops her up in a dripping fist and slowly wraps his lips around her little skull. She starts "+(data.shootingRapemeat?"crying and thrashing":"squirming and smearing the goo all over her curvy body")+", asscheeks jiggling cutely for the huge crowd, her innocent face "+(data.shootingRapemeat?"contorted into deep, frantic fear":"blushing cutely")+" as she gulps hard and fills her little lungs with thick goojuice.");

			addChoice("Claim my prize!", elevator.bind("shooting range 6"));
		}

		if (seg == "shooting range 6") {
			if (!data.shootingRangeDone && canGain) addToItem("Capsule", 10); 
			data.shootingRangeDone = true;
			append("The announcer strips as you approach. \"Well!\" he says. \"A bullseye is a bullseye... here's the scuba gear and a couple caps! Go get a close-up!\"");
			addChoice("Woo~!", elevator.bind("shooting range 7"));
		}

		if (seg == "shooting range 7") {
			append("You wade into the goo monster's rolls, your leg getting caught in its extra-thick belly button for a moment. Then you take the plunge.\n\nInside the world is quiet and slow; swimming upward through the goo takes persistent, calculated muscle movements; above, suspended in soft blue light, your ammo ");

			if (data.shootingRapemeat) {
				append("struggles.\n\n");
			} else {
				append("floats, eyes wide with wonder.\n\n");
			}

			append("You float up behind her, taking long, metallic breaths of oxygen from the tank while she stupidly chugs goo.");

			addChoice("Hug her from behind and squeeze the air out.", elevator.bind("shooting range hug"), {kinks: data.shootingRapemeat?[]:["Piss"]});
			addChoice("Give her some oxygen.", elevator.bind("shooting range oxygen"));
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range hug") {
			var foo:String = "nil";
			var bar:String = "nil";

			if (data.shootingRapemeat) {
				foo = "kicks and thrashes against you, her already pitiful strength dampened further by the thick goo, bubbles bursting from her screaming maw";
				bar = "struggles weaken";
			} else {
				foo = "moans breathless and muted into the goo, bubbles rushing from her maw. Your squeeze draw a splurt of piss from her bunnypuss, golden droplets hanging suspended in the goo";
				bar = "pleasured squirms and thigh-rubbings slow down";
			}

			append("You wrap your arms around the bunny toddler's tiny little body and squeeze her tight around the stomach. She "+foo+".\n\nHer eyelids droop and her "+bar+".");

			addChoice("Give her some oxygen.", elevator.bind("shooting range oxygen"));
		}

		if (seg == "shooting range oxygen") {
			append("You take a deep breath and grab the bunny by the back of her head, slipping the mask from your mouth to her's. After a few chokes and gags she starts sucking oxygen down, her face surging out with pink, relieved blush as you caress her from behind, grinding your crotch against her. From the gurgly, rattling sound of her gasps you surmise her lungs are about a third of the way full with goo by now... not nearly full enough.");

			addChoice("Pull the mask off.", elevator.bind("shooting range oxygen 2"));
			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range oxygen 2") {
			var foo:String = "nil";
			var bar:String = "nil";
			var baz:String = "nil";
			var quas:String = "nil";
			if (data.shootingRapemeat) {
				foo = "teary, bloodshot";
				bar = "Rapemeat";
				baz = "into full panic, her throat bulging adorably as she sucks down lungfuls of goo";
				quas = "Rape";
			} else {
				foo = "wide, innocent";
				bar = "Fuckmeat";
				baz = "hurtling into an orgasm, her toddlercunt twitching and squirting oil to mingle with the piss droplets";
				quas = "Fuck";
			}

			append("You look directly into her "+foo+" eyes and pull the mask off, slipping it back over your own mouth. You suck the goo out from inside (it static-shocks your tongue) and watch the understanding dawn on her— as much as "+bar+" can understand anything— that you're drowning her on purpose~\n\nThat simple idea sends her "+baz+", coughing and gagging and drowning hard in your arms. ");

			if (data.hasCock) {
				addChoice(quas+" her while she drowns.", elevator.bind("shooting range fuck"));
			} else if (data.hasBoth) {
				addChoice(quas+" her while she drowns.", elevator.bind("shooting range fuck"));
				addChoice("Scissor her while she drowns.", elevator.bind("shooting range cunt"));
			} else if (data.hasCunt) {
				addChoice("Scissor her while she drowns.", elevator.bind("shooting range cunt"));
			}

			addChoice("Look around.", elevator.bind("fairgrounds"));
		}

		if (seg == "shooting range fuck") {
			var foo:String = "nil";
			var bar:String = "nil";
			var baz:String = "nil";
			var quas:String = "nil";
			if (data.shootingRapemeat) {
				foo = "those thrashing thighs";
				bar = "choking spasm";
				baz = "her suffering";
				quas = "";
			} else {
				foo = "her quivering, cumming pussy";
				bar = "orgasmic spasm";
				baz = "your embrace";
				quas = ", happy";
			}

			append("You guide your cock up along "+foo+" and plunge it deep inside her, using the goo as lube, forcing your hips forward harder and harder until you finally feel your head pop inside her tiny toddlerwomb. You run a hand down her pudgy chest, over the obscene bulge in her lower tummy, stroking yourself through her thin fur, feeling it clench tight around you with every "+bar+" Once more she weakens and starts to fade, so you give her one more breath of oxygen just to draw "+baz+" out that much longer~\n\nWith your mask off for the moment, you plant a romantic kiss on her forehead and wrap both hands tight around her throat, throttlefucking her little body. Even with the oxygen so tantalizingly close, flowing over her lips, she can't breathe any of it... You hold your breath for a bit longer than you're comfortable with, just to get a feel for her desperate"+quas+" panic, slamming the entire length of your cock inside her over and over.\n\nFinally, her eyes close.");

			addChoice("Cum.", elevator.bind("shooting range cum"));
		}

		if (seg == "shooting range cum") {
			cumEffect();
			append("With a one-hand grip on her limp neck you slam her hips down to your own and rip the mask from her maw, taking a colossal gasp of fresh air just as your cock (in contrast) forces the last precious bubbles from her body. You let your hands grope and wander all over the twitching two-year-old's corpse as silken waves of orgasm crash over you, feeling her belly bulge fatter and fatter under your palm with each one.\n\nWith a masked sigh you pull out, letting "+(isActive("Mood Ring")?getMood("You"):"")+"cum-blobs float cutely from her ruined cunt. You palm her stomach harder, forcing more out, playing with her. You spin her around, get a good look at her peaceful, blue little face, miniscule bubbles still rising in a stream from her button nose... then, satisfied, you swim back down to the monster's rolls and break free from his goo with a splash, holding your little snuffrag by her ankle.");

			addChoice("Wind down.", elevator.bind("shooting range wind down"));
		}

		if (seg == "shooting range cunt") {
			append("You grab her little thighs and yank them open, guiding a hand down her crack and pushing her hips forward against your own, her bunnypuss tiny enough to almost fit between the lips of your cunt. Frantically you grind your hips against hers, holding her head close to your chest, letting her cough those fat bubbles against you. You feel her little body shiver head-to-toe in what could be either orgasm or death rattle, grinding all the harder whichever it is, slipping a couple fingers up her ass.\n\nJust as she goes limp you cum, pulling her close to your body and squeezing the last few tiny bubbles from her little button nose, your cunt twitching and throbbing against her smaller one.");

			addChoice("Wind down.", elevator.bind("shooting range wind down"));
		}

		if (seg == "shooting range wind down") {
			append("The crowd cheers as you emerge with your prize. Back in the land of air everything seems too weighted and quick, but soon you adjust enough to climb down from the stage and mingle once more with the spectators. Most people and ammo fix you with jealous stares, throwing questions like \"Did she squirm a lot~? I couldn't see past the bubbles...\" and, from a five-year-old cub as her daddy shoves her into a cannon, \"Wow, that bunny was sooo cute~!\"\n\nA few let their jealousy get the best of them, ignoring you to discuss the goo monster. \"So, it feeds off carbon dioxide... interesting, yes...\" one mumbles, pointedly <!i>not<!i> looking at you as you pass right in front of him.\n\nYou head back to the CUBSLUT MAKEOVER booth and put your gooey little bunny back where she belongs: in the dumpster. On your way out you glance over your shoulder to catch the coyote digging her corpse out, slipping it over his cock...");

			addChoice("Look around.", elevator.bind("fairgrounds"));
		}
		//}}}
		//{{{ lounge
		if (seg == "lounge") {
			data.barDone = true;
			unlockJournal("Bar & Lounge");
			append("The elevator drops drunkenly to 77, then overcorrects back up to 65, then lowers itself down floor-by-floor until it stumbles onto 75.\n\n\"Basement floor seventy-five,\" says the speaker. \"VIP lounge and bar.\"\n\nYour reflection splits in half down the middle as the doors open.");

			addChoice("Next.", elevator.bind("barnext1"));
		}

		if (seg == "barnext1") {
			append("You head through a solitary black-wood hallway, an anteroom with gold-plate baseboards, and finally you reach a towering set of double-doors.\n\nThere's a little cubby sunken into the wall adjacent, connected to a pipe leading to the lower floors. The label reads FUCKMEAT DISPENSER. There's a red button and a coin slot with $ $ TIPS $ $ scribbled in marker next to it.");

			addChoice("Press the button.", elevator.bind("press button"));
			addChoice("Go through the door.", elevator.bind("head to lounge"));
		}

		if (seg == "press button") {
			data.babyGotFuckmeat = true;
			append("You thumb the red button and a low, clanking groan comes from two floors down. A tiny amber-furred fox cub no older than eight months zooms up the tube laughing and tumbles out of the little enclosure, landing on his fat butt. He looks up at you happily, and babbles something which probably means \"Again!\"");

			addChoice("Examine Fuckmeat.", elevator.bind("examine fuckmeat"));
			addChoice("Head to the lounge.", elevator.bind("head to lounge"));
		}

		if (seg == "examine fuckmeat") {
			append("You pick the little cutie up and turn him around a bit, sniffing. He's completely nude, not even a diaper, his abnormally big cocklet flopping around half-hard at four inches. Everything seems bigger between his legs, actually: his little ass is way too curvaceous for an infant's, his thighs too jiggly, his nuts hanging mega-swollen between them.\n\nYou lay him tummy-down on the cool black hardwood floor. His hefty asscheeks need two good yanks apart before they spread wide enough to get a good look at his pucker, which is also fairly engorged and warmed-up from the look of it, a bead of natural lube balanced in the center. His little babycunt twitches just past your nose. He's giving you bedroom eyes over his shoulder.");

			addChoice("Head to the lounge.", elevator.bind("head to lounge"));
		}

		if (seg == "head to lounge") {
			append("The lounge is a sprawling three-tiered wonderland of luxurious depravity with a ceiling high enough for bungee jumping. You count eight bars tucked into various corners, their stools packed with butts. The sound of deep, thudding music, laughter, moans, and squeals rises up in one great overwhelming wind to where you stand on the third tier balcony.\n\nStill adjusting to the noise and roving crowds of naked furs, you consider heading to a candle-lit curtained-off section "+(data.babyGotFuckmeat?"to get to know your warm little slab of Fuckmeat better,":"to see if you can meet some new friends,")+" or maybe pulling up to the singular free stool at the nearest bar.");
			addChoice("Grab a drink.", elevator.bind("grab drink"));
			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "grab drink") {
			data.grabbedDrink = true;
			append("A fierce-looking gazelle teen steals the stool you were going for and orders six shots of vodka, slipping a one-year-old bunny onto his cock without much more than a wiggle and a shove on the shoulders, muffling her ecstatic squeals with a kiss.\n\nOnce the shots arrive the gazelle grips both long bunny ears in a fist and pulls them down, coaxing her drooling maw open. The kiss turns fervent as he crams his tongue down her little throat; gurgling out thick saliva-clogged gags and blinking blearily through watery eyes she still somehow manages to follow her genetically imprinted instincts and lock her lips around his tongue, sucking it like a cock.\n\nTransfixed in that moment, it takes you a couple seconds to realize the kiss has already broken and the gazelle is holding the one-year-old's panting mouth open, squishing her cheeks between thumb and middle finger, two shots hovering just above her lips in his free hand.");

			addChoice("Keep watching.", elevator.bind("barwatch1"));
			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "barwatch1") {
			append("The baby bunny takes those shots like a champ. Through the noise of the bar patrons— a literal and figurative cow most notably, drunk as fuck, falling halfway off her stool and guffawing obnoxiously— you hear the gazelle cooing praise as the bunny licks her lips and reaches with her little hands for the remaining four. She's still impaled on his cock and thus doesn't get very far.\n\nOne by one the gazelle tips the shot glasses up over her waiting mouth, harsh vodka drawing her face into sour-lemon expressions each time it washes down, the alcohol obviously soaking into her dumb baby brain as she espouses vacant babbles and drunkenly rocks her body back and forth to slip her tiny pussy a few inches further down on his cock~\n\n");

			if (data.babyGotFuckmeat) append("Your own slab of fuckmeat looks envious, still clinging to you as you cradle his bare fox butt, his expression furrowing into jealousy while he watches the bunny girl.");

			addChoice("... Okay now grab a drink.", elevator.bind("now grab drink"));
		}

		if (seg == "now grab drink") {
			append("The otter bartender asks you what you'd like.\n\nYou look at the chalk-drawn menu...\n\nCUM (FREE)\nPISS (FREE)\nFORTIFIED 100% PURE FREE RANGE BOVINE ASSCRACK SWEAT (1C)\nFLOATILLERY RESERVE CRAFT BEER (5C)\nEVERCLEAR (1C)\nBLEACH (1C)\n\nAnd in cursive: Girly drinks~\nSPASTIC ACID CORKSCREW (1C)\nTHE FAGGOT BLASTER (2C)\nRAPE ON THE BEACH (1C)\nBLACK AND BLUE RASPBERRY DAQUIRI (3C)\n\n");

			if (data.babyGotFuckmeat) {
				addChoice("The biggest-bottled beverage you serve and some lube, please.", elevator.bind("biggest bottled"), {kinks: ["Snuff"]});
				addChoice("Mind pumping Everclear down my Fuckmeat's throat?", elevator.bind("mind pumping"), {kinks: ["Snuff"]});
			}

			addChoice("One Faggot Blaster please.", elevator.bind("one blaster"));
			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "mind pumping") {
			data.babyGotFuckmeat = false;
			append("\"My pleasure,\" the bartender says, cradling the foxling up in his arms and lovingly working a drippy spray-nozzle tap of Everclear past his lips. The fox sucks on it like a metal nipple, murring, completely content with the powerful burn of the alcohol dribbling into his little maw.\n\nThe bartender closes his grip on the nozzle with brutal finality, the cradling turning into a headlock as the babyslut gurgles and coughs, undoubtedly getting a nice searing 190 proof throat massage. A couple patrons watch and laugh as the fuckling squirms, one even reaching up and groping his tummy as it begins to bloat. \"Chug it... that's it... god, I've seen some chronics before, but never such a ravenous little baby alcoholic~\"\n\nAlmost instant alcohol poisoning wracks the infant's body. Though even as he leaks Everclear from his nose, ass, and ears, he manages a weak little smile and reaches up for the tap when the bartender pulls it away, desperate for more.\n\nThe bartender simply spits on his pale, slack expression and tosses the fox face-first into a garbage bin, then dusts off his hands and attends to the next customer.");

			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "biggest bottled") {
			append("The bartender gives a tacit nod and ducks into the back room. After a moment he returns with a pale green bottle twice the size of your little fox's body labelled:\n\nSPASTIC ACID CORKSCREW — 27% ALCOHOL — DRINK IN SMALL SIPS, FOLKS, SHE BURNS\n\n\"Gettin' him butt-drunk, huh?\" the bartender asks. \"Well, this'd be the stuff to do it... They don't call it acid for nothing. Lay him on the bar, I'll hold his arms.\"");

			addChoice("Lay him on the bar.", elevator.bind("lay him"));
		}

		if (seg == "lay him") {
			append("You lay the baby down on his back and the bartender works his fingers into those warm little armpits, pulling his arms away from his pudgy chest, up over his confused expression. He rips open a little plastic packet of lube marked BABY OIL with his teeth and crushes it just over the fuckling's nuts, fat ropes of clear lube drizzling over them as he grips both tiny wrists in his hand and nods to you. The fox, instantly recognizing the sensation of lube, starts squeaking excitedly, his cocklet throbbing and spewing pre into his little innie.\n\nA passerby grins at the scene and throws in his two cents: \"Shut that fucker up.\"");

			addChoice("Good idea.", elevator.bind("babybarbeat"), {kinks: ["Abuse"]});
			addChoice("Work the neck of the bottle inside.", elevator.bind("work neck"));
		}

		if (seg == "babybarbeat") {
			append("You punch the baby in the face.\n\nIt blinks up at you, stunned, its button nose leaking a couple drops of red. The bartender has to let go of his pudgy arms to serve someone else; immediately your Fuckmeat and grabs for your fist, his tiny hands wrapping around your fingers and pulling them to his face.\n\nFor the second time he makes that babbling \"Again!\" noise...");

			addChoice("Break his face.", elevator.bind("break face"));
			addChoice("Work the neck of the bottle inside.", elevator.bind("work neck"));
		}

		if (seg == "break face") {
			append("You get a vicious grip on his throat with one hand and bring the other down on his forehead this time, feeling his soft brow give under your fist. With every sickening crunch his giggles multiply, until his teeth are mostly lodged in his throat and all his little sounds of mirth come out gurgly.\n\n\"I think he's ready,\" the bartender says from halfway down the bar, serving another customer who also happens to be casually beating an infant's face in.");

			addChoice("Work the neck of the bottle inside.", elevator.bind("work neck"));
		}

		if (seg == "work neck") {
			append("The bartender redoubles his grip on the infant's hands, holding them down with enough force to hurt.\n\nYou pull the cork from the bottle and let the spout kiss his puffy little newborn babycunt, gently pushing his pucker in. His assmeat is so fat that you lose sight of it within moments; the only barometer you have for whether or not you're in is the noises he's making: once about half of the neck is hidden between the little fox's buttcheeks his content babbles turn to a high-pitched squealing murr.\n\n\"There you go,\" the bartender says, spitting in the snuffbaby's face and slapping his pudgy face around while he squirms. As the neck of the bottle gets wider and you keep ramming it mercilessly deeper, he speaks up: \"Let's flip him.\"");

			addChoice("Next.", elevator.bind("babybottlenext"));
		}

		if (seg == "babybottlenext") {
			data.babyGotFuckmeat = false;
			append("With the bartender's help you flip the fuckling upside-down, the bottle jutting cartoonishly huge between his thighs. His already fat little stomach bloats out even fatter as booze rushes into it, searing his intestines and making him thrash in your grip. To keep him happy you stuff his face into your "+(data.hasCock || data.hasBoth?"heavy adult nuts, practically enveloping his little skull entirely.":"gushing cunt, wiping the inside of your folds with his murring mouth.")+"\n\nThe bottle gets to about half-empty before the baby's clearly taken all he can, stomach the size of a watermelon, eyes rolled up and vacant. You give the sexy little corpse a loving kiss on the belly button and throw him on the floor behind you, where some random dude says \"Sweet!\" and carries it off.");

			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "one blaster") {
			append("The bartender ducks under the counter for a second and pulls out a lurid pink cock-shaped bottle labelled Faggot Blaster.\n\nThe sassy liquid doesn't seem to give a shit about the laws of physics. It's bubbling and twirling around on its own, and the bartender really has to wrangle the bottle around to get it to pour straight into your glass.");

			addSprite("assets/img/effect/faggotBlaster.png").onHover = showToolTipOnCursor.bind("Font: Exmouth", "");
			addChoice("Pull aside the curtain.", elevator.bind("pull curtain"));
		}

		if (seg == "pull curtain") {
			append("You pull aside the curtain to REVEAL...............");
			addChoice("Next!!!!", elevator.bind("next!!!"));
		}

		if (seg == "next!!!") {
			append("A sprawled wonderland of turqoise-lit lazy rivers winding around little circular booths packed with blunts by the dozen, spliffs by the score, pipes, hookahs, bongs, and most obviously vapes, since the vapists chuck the fattest and most obnoxious clouds of them all.\n\nBowls and chambers everywhere are packed with all kindsa herb, the most popular being finely ground Sweetgrass Leaves. Otherwise, a dapper cat's tweaking out on nip in a cushioned corner, and a grizzly bear is about to rip through a heaping bowl of chili powder from a 3-foot bong.");

			addChoice("Watch the cat.", elevator.bind("loungecat"));
			addChoice("Watch the bear.", elevator.bind("loungebear"), {kinks: ["Vomit"]});
		}

		if (seg == "loungecat") {
			append("You watch the cat's glossed up crazy-person eyes go wide as he slurps another devastating hit down the gullet and leans back, toes twitching.\n\nGuffaws and cub squeals catch your attention from a corner— an otter and his buddies.");

			addChoice("Hang with the otter.", elevator.bind("loungekemp"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "loungebear") {
			data.loungeBear = true;
			append("The bear destroys the bowl no problem.\n\nHis buddies go wild, shouting about the Chili Champ. Do a victory roar, they tell him.\n\nHe stumbles to his feet, eyes watering, nose running, then slaps his gut and does a victory roar which becomes a victory gurgle halfway through— then the Chili Champ drops to his knees and projectile vomits"+(isActive("Candy Ring")?" spicy chili chocolate":"")+" all over a little cub waiter passing by, the force of the torrent knocking him head-over-butt into one of the turquoise rivers with a SPLUNK.\n\nGuffaws and cub squeals catch your attention from a corner— an otter and his buddies.");

			addChoice("Hang with the otter.", elevator.bind("loungekemp"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "loungekemp") {
			//Kemp recognition
			var kemp1 = "You roll up next to the otter's booth; he's naked except for a beanie,";
			var kemp2 = "the otter's";
			var kemp3 = "\"Name's Kemp,\" the otter says, tipping his beanie and";
			if (data.metKemp == 1) {
				kemp1 = "The otter turns out to be Kemp, still naked except for his beanie, scooting";
				kemp2 = "Kemp's";
				kemp3 = "\"Look who it is,\" he says. \"Told you I wasn't fuckin with ya, boys.\" He scoots";
				data.metKemp++;
			} else if (data.metKemp >= 2) {
				kemp1 = "It's Kemp, of course,";
				kemp2 = "Kemp's";
				kemp3 = "\"Look who it is,\" he says. \"Told you I wasn't fuckin with ya, boys.\" He scoots";
			}
			data.metKemp++;

			append(kemp1+" hauling in tandem with five buddies on a hookah's tentacular tubes while a heaped bowl of sweetgrass crackles and cherries atop it. The majority, Kemp included, have got cubs on their laps with smoke-spewing nozzles crammed into their little mouths.\n\nThere's a "+(isActive("Pastel Ring")?"two-year-old and a one-year-old":"six-year-old and a five-year-old")+", both clearly stoners already, sucking dank fog from their tubes with gusto. There's also two "+(isActive("Pastel Ring")?"babywhores":"toddlerwhores")+", ripped out of their little minds, both too stupid to smoke by themselves; the boys gotta wind em to get them to inhale properly, usually with a couple belly-punches, before shoving the nozzle down their throat while they gasp and choke.\n\nSlowly, red-eyed and dumbstruck, "+kemp2+" buddies turn to look at you.\n\n"+kemp3+" over to make room for you on the cushy booth seat.\n\nYou sit down, the seat still warm from his bare otterbutt.\n\nHe winks at you. \"Anyway, where were we... Oh, right, gettin blasted outta our fuckin domes.\"");

			addChoice("Next.", elevator.bind("loungekemp2"));
		}

		if (seg == "loungekemp2") {
			if (isActive("Pastel Ring")) {
				temp.p = "baby";
			} else {
				temp.p = "toddler";
			}

			append("One of the boys, a boar, speaks up while the others still stare, shifting his hips to slip his foot-long cock up between the thighs of the "+temp.p+" coughing and spluttering on his lap.\n\n\"We were just bout to go find...\" he exhales a phat cloud \"... an ashtray...\"");

			addChoice("You've got one on your lap there.", elevator.bind("loungeashtray"), {kinks: ["Baby", "Abuse"]});
			if (data.babyGotFuckmeat)
				addChoice("I brought this cutie over for just such an occasion. (Fuckmeat x1)", elevator.bind("loungemeatashtray"), {kinks: ["Baby", "Abuse"]});
			addChoice("Can I take a haul on this hookah?", elevator.bind("loungekemp3"));
		}

		if (seg == "loungeashtray") {
			//TODO: Fix possibly unset var
			data.loungeAshtray = true;
			append("The guys get a chuckle out of that. \"Good shit,\" one of them says, clapping you on the back.\n\nThe boar grabs the aforementioned "+(isActive("Pastel Ring")?"infant":"toddler")+" ashtray by its throat and slams the little fucklet down on the table belly-up. Kemp helps out, slipping two fingers from each hand into the cub's tiny maw and yanking it open while it squirms and coughs residual tendrils of smoke.\n\nThe boar pulls his pooched bowl from the hookah and leans down, letting the tiniest sprinkle of hot ash fall into that watery lil mouth. The poor thing jerks and squeals helplessly, tongue a-sizzling swollen red and black.\n\nThe boar grunts: \"Swallow.\"");

			addChoice("Can I take a haul on this hookah?", elevator.bind("loungekemp3"));
		}

		if (seg == "loungemeatashtray") {
			append("\"Shit,\" the boar says. \"You lucked out. For how popular foxes are they don't have much of a spawn rate.\"\n\nHe gets distracted for a second. \"What the fuck did John say the other day? That noise fox sluts make when ya rape em? The... the yiffing?\"");

			addChoice("You guys... use the word yiff?", elevator.bind("word yiff"), {kinks: ["Baby", "Gore", "Abuse"]});
			addChoice("Can I take a haul on this hookah?", elevator.bind("loungekemp3"));
		}

		if (seg == "word yiff") {
			append("\"John,\" Kemp says. \"John uses the word yiff.\"");
			addChoice((data.metJohn==0?"Who's...?":"What a vocabulary that dog nerd has."), elevator.bind("whos"));
		}

		if (seg == "whos") {
			append("\"Anyway,\" the boar says, and grabs your cute little eight-month-old Fuckmeat by the cock to drag him across the table. He lays the foxlet on his back and pushes both legs up to his stomach, way farther than a normal baby should be able to stretch, exposing his fat little ass.\n\nHe extracts the bowl, still embered and trickling smoke, and holds it carefully above your Fuckmeat's hole. The babywhore clumsily spreads his cheeks and eyes the pretty orange-red glow with a wide, curious stare.\n\nThe boys are all batin' brutally fast, some abusing their own cubcunts as a show of solidarity, pinching, biting, just plain raping, and slowly the atmosphere heats up to match the primal temperature of the rest of the lounge.\n\nInstead of pouring the hot ash over your Fuckmeat's hole the boar just drives the whole bowl inside; the infant's warm, wet inner folds sear and spew steam as they melt, fusing with the hot metal. The boar groans at the tantilizing scent of cooked foxflesh, yanking the bowl a good twenty times until it finally comes out glistening red, coated in charred assmeat.\n\nThe foxlet's eyes are watering, but otherwise he seems perfectly happy about his ruined butthole. He releases a few quivery yiffs. You take him back into your lap.");

			addChoice("Next.", elevator.bind("loungemeatnext"));
		}

		if (seg == "loungemeatnext") {
			data.goreBowl = true;
			append("The boar sets the gory bowl back into the hookah. \"Wanna try this?\" he asks, grinning. \"It's got a great flavor, promise.\"");
			addChoice("Can I really?", elevator.bind("loungekemp3"));
		}

		if (seg == "loungekemp3") {
			if (isActive("Pastel Ring")) {
				temp.p = "two-year-old";
			} else {
				temp.p = "six-year-old";
			}

			append("\"Absolutely you can,\" Kemp says");
			if (!data.loungeAshtray) append(", and dumps the pooched bowl in a handy little ash-sack he pulls from nowhere");
			append(". \"Who's pitching?\"\n\n\"Well shit...\"\n\n\"Yeah, 'course.\"\n\n\"Fuck yeah.\"\n\nEvery guy at the table throws in a pinch of green. By the end they're all smiling like idiots at the mountainous bowl they've packed for you.\n\nThe "+temp.p+", a girl, gets all excited, knowing what's coming next.\n\nThe guy beneath her slips a few man-fingers underneath her smooth little armpits. \"Stand up, now... ass-out.\"\n\nShe clambers up, standing with a little pawfoot on each of his thighs, hugging him around his chest and showing off her tiny bubblebutt for everyone. The guy reaches down and drives three fingers brutally deep into her cunt, the little cub shivering with a warblemoan, then he digs around far more than necessary before finally pulling out a lighter slick with her juices.\n\n\"Thanks storage-cunt,\" he says, and kisses her sloppily while he leans forward and lights the bowl.\n\nKemp hands you the nozzle of a tube. \"Go ahead and haul!\"");

			addChoice("Haul.", elevator.bind("haul"));
		}

		if (seg == "haul") {
			if (isActive("Pastel Ring")) {
				temp.p = "baby";
			} else {
				temp.p = "toddler";
			}

			highEffect(1200);

			append("You fuckin haul alright.\n\nThe boys grab their own hoses and get another coupla lungfuls in for good measure, but mostly they just let the whole bowl burn down to ash while you slurp like a "+pickByGender("wildman", "wildwoman", "beast possessed")+". "+(data.goreBowl?"The smoke comes through with a very distinct foxmusk. Your Fuckmeat is reaching up and trying to get a hold of the nozzle greedily, smelling his own scent on it.":"")+"\n\nFinally you're full right up, smoke leaking from your nose and ears.");

			addChoice("Do a dragon exhale.", elevator.bind("dragon exhale"));
			addChoice("Exhale ceilingward.", elevator.bind("exhale ceil"));
			addChoice("Exhale directly into a "+temp.p+"'s mouth.", elevator.bind("exhale next"));
		}

		if (seg == "dragon exhale") {
			highEffect(1200);
			append("You blow from both nostrils and a reptilian growl rises involuntary from your throat. She burns, but she doesn't burn so bad.\n\nThe boys are impressed.");

			addChoice("Next.", elevator.bind("loungekempwinddown"));
		}

		if (seg == "exhale ceil") {
			highEffect(1200);
			append("You lean back and dankulize the whole place chimney-style. The sweetgrass smoke wrangles itself into weird knots, riding the air currents.");

			addChoice("Next.", elevator.bind("loungekempwinddown"));
		}

		if (seg == "exhale next") {
			highEffect(1200);
			if (isActive("Pastel Ring")) {
				temp.p = "baby";
			} else {
				temp.p = "toddler";
			}

			append("You do a hurried pass-that-to-me gesture at one of the boys, cheeks fat with smoke. He overhands his slab of Fuckmeat to you.\n\nLungs screaming, barely able to keep it in, you smash your face up to the "+temp.p+"'s and fill their little lungs in seconds, exhaling far harder and longer than necessary to ensure they suck in every stray tendril.\n\nThe little champ takes it pretty well, although their eyes water.\n\n\"Mainly cloudy today,\" the now-Fuckmeatless bro says, stroking himself while he watches the fog roll out over his meat's "+temp.p+"body.");

			addChoice("Next.", elevator.bind("loungekempwinddown"));
		}

		if (seg == "loungekempwinddown") {
			highEffect(1200);
			append("The high curls itself around your brain and licks between your lobes. The spirit of the sweetgrass pulls your vision five different directions at once, trapping you in a prism of attempted focus. Really, everything just gets blurry.\n\nTime dilation sets in. You hardly notice as an hour of debauchery passes. A few more bros show up from a shopping trip downtown, dropping handfuls of wicked-looking toys on the table; the most merciful among them being a dildo twice the size of your little fox, which of course he promptly latches his mouth onto. It takes two guys to hold the squirmy fucklet still while a third drives the massive toy down his tiny infant esophagus~");

			addChoice("Wind down.", elevator.bind("loungekempwinddown2"));
		}

		if (seg == "loungekempwinddown2") {
			highEffect(400);
			data.barDone = true;
			append("By the time the high wears off you realize you're laying on Kemp's chest, floating down a turqouise river on his inner tube.\n\nHe's mid-sentence: \"... want to make everyone happy. That's the only thing you can do. It's a closed ecosystem in here. If you act like a cunt because <!i>you're<!i> lonely and <!i>you<!i> need to vent your shit, you end up polluting it, cookin up feuds and grudges— this happens in any small town left for long nuff— and it just goes around and around and...\n\nwell. That's all you can do: try to make everybody happy.\"\n\nYou're not sure what exactly he's talking about. You tell him it's alright. He nods.\n\n\"It'll <!i>be<!i> alright,\" he says, smiling. \"Now that you're here.\"\n\nHe drops you off at the elevator and sails off on his tube, fandangling his fingers into a hang-loose.\n\n\"Seeya!\" he says. \"Stay pony golden boy!\"");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}
		//}}}
		//{{{ breed
		if (seg == "breed") {
			data.breedingDone = true;
			unlockJournal("Breeding Floor");

			append("With a petulant whirr the elevator rockets downwards. The floor numbers whip by too quick to read anything but the first digit; throughout the sixties and seventies it slows heavily, platform pressing up against your feet. Your stomach drops. 75... 76...\n\nAnd with a clunk of finality: 77.\n\n\"Basement floor seventy-seven,\" says the speaker. \"VIP breeding floor.\"\n\nYour reflection splits in half down the middle as the doors open.");

			if (getItem("Pastel Ring").amount < 1) {
				addChoice("Next.", elevator.bind("pastelringfind"), {give: ["Pastel Ring", 1]});
			} else {
				addChoice("Next.", elevator.bind("breedingfloor"));
			}

			addChoice("Go to a different floor.", elevator.bind("main"));
		}

		if (seg == "pastelringfind") {
			append("Oh, hold on, there's a tiny ring on the floor of the elevator. You just barely manage to snag it before the doors close around your wrist.\n\nIt's the <!img:item/Pastel Ring.png><!b>Pastel Ring<!b>!");
			addChoice("Hey alright!", elevator.bind("breedingfloor"));
		}

		if (seg == "breedingfloor") {
			var cage = "A bloodstained bull pushes past you";
			if (data.metCage > 0) cage = "Cage pushes past you with a nod, bloodstained";

			append("You step into an underground chamber the size of a baseball stadium. The floor is filthy, tiled, set with drains at regular intervals. Everywhere, pregnant cubs of all ages and genders are getting happily raped, their fat tummies pressed against the tile or the walls or jiggling free for passerby to slap; the oldest you can spot through the mass of bodies is probably thirteen at best, and the youngest... well, you're not quite sure what that furry balloon-looking thing is over there, but it might be a pregnant baby.\n\n"+cage+", slapping you carelessly on the thigh with his cock. His expression implies he's going to go fuck some shit up.");

			addChoice("Go poke the balloon.", elevator.bind("poke balloon"));
			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Examine chamber.", elevator.bind("examine chamber"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "examine chamber") {
			append("There's quite a bit hidden in the thick, gyrational fringes of the room. Several baby-sized pipes (\"FUCKMEAT INTAKE\") run up the high walls and into the ceiling, undoubtedly routed to higher floors. A pair of overalled maintenence men are working on two pipes a ways down the wall which look like they're clogged up with squirming, drooling Fuckmeat. Neither of them stop anyone from shoving one more in, though...");

			addChoice("Go poke the balloon.", elevator.bind("poke balloon"));
			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
		}

		if (seg == "poke balloon") {
			data.babyBalloonPoked = true;
			append("A cheerful gray husky with a shock of pink down his fluffy tail gets the same idea, and you do a classic accidentally romantic hand-touch as you both reach to grope that soft, bulbous tummy.\n\n\"Ah! Sorry...\" he says, blushing. \"Did you want this one? I was just gonna rape its belly button...\"\n\nThe baby coos and giggles, completely immobilized by its own swollen womb, limbs wiggling pointlessly.");

			addChoice("Please, be my guest.", elevator.bind("be my guest"));
			addChoice("I groped it first.", elevator.bind("i groped first"));
			addChoice("Nevermind, go follow the bull.", elevator.bind("follow bull"));
		}

		if (seg == "be my guest") {
			append("His eyes light up. \"Really? Thanks!\"\n\nHe drops to his knees and pulls the little babywhore between them, grinding his cock up against its (His? Her? Its belly is hanging too low to tell) plush stomach fur, pushing his tapered tip against the innie.\n\n\"I mean it,\" he says, lining up with a smile. \"Twofers like this never last longer than five minutes down here!\"\n\nThe wolf starts humping viciously, his cock drooling pre all over the baby's tummycunt, until on the tenth or so he breaks through the underdeveloped skin and plunges almost half of it deep inside the newborn's fetus's cunt. Both of them, albeit one muffled through a womb, simply giggle and coo happily.");

			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Get back in the elevator.", elevator.bind("main"));
		}

		if (seg == "i groped first") {
			append("\"Fair enough,\" the wolf says, and backs off politely.");

			addChoice("Pop the balloon.", elevator.bind("pop balloon"), {kinks: ["Gore", "Snuff", "Abuse"]});
			addChoice("Punt the balloon.", elevator.bind("punt balloon"), {kinks: ["Abuse"]});

			if (data.hasCock || data.hasBoth)
				addChoice("Plough the balloon.", elevator.bind("plough balloon"), {kinks: ["Gore", "Snuff", "Abuse", "Female"]});

			addChoice("... Just poke the balloon, as originally planned.", elevator.bind("poke balloon as planned"));
		}

		if (seg == "pop balloon") {
			append("You nuzzle the fucksphere's face with the sole of your foot for a moment, then move down to give its innie a good toeing, its pregnant belly dimpling a little with each push.\n\nThe wolf is still watching from his place in the crowd, dragging a couple placid fingers over his shaft. He shoots you a grin and does a little jerk of the finger as if to say \"Go on!\"\n\nYou bring your heel down on the balloon's cute tummy with full force and at once it <!i>pops<!i> in a spatter of babymeat, both infants' soft-boned ribcages snapping open.\n\nAfter a long screaming session the little Fuckmeat finally calms down enough to reach inside her broken womb and finger the half-destroyed butt of her fetus as cutely as she can before she dies~");

			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "punt balloon") {
			append("You pick up the fucksphere by its throat and drop-kick it right on the belly. It soars across the room squealing, then some dude in the crowd jumps to catch it and flashes you a thumbs-up.");

			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "plough balloon") {
			append("For some foreplay you drag your cock over its innocent little face, squeezing a warm glob of pre into its mouth when it starts to nurse. You lift your hips and drag lower, pulling away from its greedy mouth with the sound of a suction cup popping off before threading your dripping length between its two babytits, extra-puffy and dripping milk with pregnancy.\n\nYou pick the baby up, one hand on the back of its tiny head, and feed your cock into its little pussy with slow, gentle mini-pushes. Once you've lodged about four inches inside and the entrance to her womb is twitching at your tip you figure she's ready; you pull back and ram in to the hilt, aborting her baby, bulging her stomach out obscenely fat as squishy fetusmeat sputters out around your cock, pouring over your nuts in greasy chunks.");

			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "poke balloon as planned") {
			append("You just poke the balloon's tummy. It giggles.");
			addChoice("Follow "+(data.metCage>0?"Cage":"the bull")+".", elevator.bind("follow bull"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "follow bull") {
			var cage = "The bull";
			if (data.metCage > 0) cage = "Cage";

			append(cage+" pushes past tons of spectacles— an infant being used as a condom, pregnant kittens kissing while they get their babies aborted by two jovial foxes with boxing gloves, a squirrel mom shoving her five-year-old daughter's face between some dude's voluptuous cum-coated asscheeks, all kinds of wacky shenanigans.\n\nFinally, he elbows open a door marked <!b>POST-BIRTH ABORTIONS<!b> and disappears inside.\n\nIt's about to close.");

			addChoice("Keep following.", elevator.bind("keep following"), {kinks: ["Hyper"]});
			if (!data.babyBalloonPoked) addChoice("Nevermind, go poke the balloon.", elevator.bind("poke balloon"));
			addChoice("Turn back and get on the elevator.", elevator.bind("main"));
		}

		if (seg == "keep following") {
			append("The atmosphere shifts entirely.\n\nThis chamber is small and cushioned, lit by cozy candles and fireplaces, filled with soft conversation and delicate squishes. There are a couple private rooms off to the side and a lounge area with big plush couches. A few furs are chatting casually while they bounce squealing infants on their dicks, a few others gangraping a pregnant two-year-old into the floor.\n\nThere's a little AUTO-MYNT terminal set into the far wall.");

			addChoice("Next.", elevator.bind("cagenext2"));
		}

		if (seg == "cagenext2") {
			var cage = "He";
			var cage2 = "— the name on the card says \"Cage\"—";
			if (data.metCage > 0) {
				cage = "Cage";
				cage2 = ",";
			}
			data.metCage++;
			data.sawAutoMynt = true;

			append(cage+" heads for the AUTO-MYNT, swipes a purple card"+cage2+" then bird-pecks at a couple pictographed keys on the screen. He punches in <!b>Fuckmeat x3.<!b> Apparently just for flavor points, he slaps the Enter key with his dick.\n\nThe terminal thinks about it for a second, whirring, and the catface on-screen does a poor impression of "+(data.myntNarrative < 1?"Mynt,":"me,")+" blurting some rehearsed THANK-YOU-FOR-USING-THE-AUTO-MYNT's and PLEASE-WAIT's.\n\nThen, suddenly, three baby herbivores pop into existence on the floor: a deerboy, a bunnygirl, and a koalaboth with a set of tits the size of her head. Both babycocks reach up to their owner's puffy chests.");

			addChoice("Next.", elevator.bind("cagenext2a"), {kinks: ["Art"]});
			if (!data.babyBalloonPoked) addChoice("Nevermind, go poke the balloon.", elevator.bind("poke balloon"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "cagenext2a") {
			append("You scoot forward to get a closer look.\n\nCage throws a death-stare at you over his shoulder.\n\n\"Fuck off. Get your own.\"");
			var s:MintSprite = addSprite("assets/img/effect/cage.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: AeriaQuies", "Edits: Kittery");
				s.x = 490;
				s.y = 10;

			addChoice("I just wanted to watch is all.", elevator.bind("wanted to watch"));
			addChoice("Spawn one for me.", elevator.bind("toddlerbear"), {kinks: ["Art"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear") {
			halfWidthText();
			append("He swipes his card a second time.\n\n\"Fine.\"\n\n(Jeez, that was easy.)\n\nA cute little baby bear spawns at your feet. Within seconds of entering existence she looks to the closest person in the room (you, now that Cage has hauled his three cuties away) and starts slutting it up, babbling happily and showing off her "+(Math.random()>0.05?"bare":"bare bear")+" cunt.");
			var s:MintSprite = addSprite("assets/img/effect/cubberFeet.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Edits: Kittery\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = 400;
				s.y = 20;
			addChoice("Take her somewhere comfortable.", elevator.bind("toddlerbear1"), {kinks: ["Baby", "Blood", "Abuse", "Gore", "Snuff"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear1") {
			append("You scoop her up, making sure to get a firm grip on her asscheeks, and take her over to one of the plush red couches.\n\nShe plops happily into your lap, "+pickByGenitals("auto-hotdogging your bare shaft", "pressing her twitchy pucker directly against your vulva", "auto-hotdogging your bare shaft")+". You lean your chin down to rest on her shoulder, which is a bit higher than it was a moment ago (they grow up so quick!) and plant a wet, sloppy kiss on her cheek.\n\nShe turns her head and works her tiny tongue into your mouth~");
			addChoice("Yank that little cunt open.", elevator.bind("toddlerbear2"), {kinks: ["Art"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear2") {
			halfWidthText();
			append("A crocodile and a cat murmur to each other from across the coffee table, but you don't look up to see if you know them or not; instead, you keep your eyes focused on those chubby baby thighs, both spreading automatically for you the instant you look at them. It's obvious that her all-powerful Fuckmeat instincts are kicking in— every muscle in her body moves only to put it in a sexier pose or to make it easier for her superiors to molest.\n\nYou drag both hands down over her fur, over the crooks where her thighs meet her tum.\n\nShe squeals into your mouth at the barest brush of your fingers against her swollen puss, slurping your tongue up into her little maw and trying her absolute darndest to deepthroat it. You tease her for one more moment, thumbtips trailing in little circles over each mound of her labia... then you mash both thumbs down like it's a quicktime event and yank that tight little babycunt open wide.\n\nA little wisp of musk twirls out. She breaks the kiss, gasping into your mouth.\n\nSomeone on the other couch asks you: \"Want a protip, player~?\"");
			var s:MintSprite = addSprite("assets/img/effect/wyrmlyDragonessPussy.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Animation: WyrmlyDragoness\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = 390;
				s.y = 20;
			addChoice("Hm?", elevator.bind("toddlerbear3"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear3") {
			append("You look over the table.\n\n"+(data.metSnagg > 0 ? "It's Snagg the crocodile, waving":"The croc shoots you a snaggle-smile and a wave")+". He peels a slab of softly crying Fuckmeat off his dick (a weasel boy, all geared up with a ring gag and spreader bars) and hands him to the cat"+(data.metMarei > 0 ? "— oh hey, that's Marei!—":"")+" like one might pass a buddy a cold beer.\n\nHe wipes the "+(isActive("Mood Ring")?getMood("Snagg"):"")+"cum and infant tears off on his wifebeater and scoots over to your couch, leaning down and taking a deep whiff of your cub's aromatic little pussy.\n\n\"Mmmm... freshly spawned, huh. "+(data.bankSnaggAbuse > 1 ? "Hello again. Don't worry, I won't go using you as a sweatrag... you're not in my territory anymore.":"Don't mean to interrupt."+(data.metSnagg > 0 ? "":" Name's Snagg, nice to meet ya.")+" Just wanted to help out, if I could...")+"\"\n\nSnagg takes your Fuckmeat by her chin and spits in her face. She giggles happily and tries her best to lick it up, but her tongue is too small to reach, so she just ends up looking like an especially retarded little bimbo bear.\n\n\"My protip,\" he purrs, and throws a glance over his shoulder at the baby currently squealing and thrashing on "+(data.metMarei > 0 ? "Marei":"his sphynx cat buddy")+"'s barbed dick, \"is to toggle her, like the one we've got over there. He's about done by now, though...\"");
			data.metSnagg++;
			addChoice("Toggle her?", elevator.bind("toddlerbear4"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear4") {
			append("\"She's Fuckmeat right now,\" he says, \"but if you do <!i>this<!i>—\"\n\nHe reaches down and yanks her cute poof-tail twice.\n\n\"— then she'll toggle to Rapemeat.\"\n\nImmediately her expression twists into a knot. Her thighs clamp shut over your hands, so hard it actually hurts a bit, and suddenly she's not at all happy to have a musky glob of croc spit rolling down her face— she reaches up and swipes at it with her paws, smearing it around in the process, crying and squirming with adorable distress~\n\nSnagg sits back on his heels, greasy croc dick throbbing hard against his stomach. \"See the difference?\"");
			addChoice("Thanks guys, she's much cuter this way.", elevator.bind("toddlerbear5"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear5") {
			append("\"No prob~\" "+(data.metMarei > 0 ? "mewls Marei":"the hairless sphynx mewls")+".\n\n\"You owe me,\" says Snagg.\n\nYou try to resume your position, with your thumbs spreading her cunt, but her thighs are locked so tight you can't get in anymore...");
			addChoice("Rrrggh. Pull her legs up and open her holes with both hands.", elevator.bind("toddlerbear6"), {kinks: ["Art"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear6") {
			halfWidthText();
			append("Snagg helps out, holding her ankles together with one hand so she can't kick around. You slide your hands over those plump cheeks, press your palms flat, and yank her ass and cunt open for the whole room to see.\n\n(Not that anyone really pays attention. She's only one Meat of many, and she doesn't even have any lingerie or makeup or stylish accesories to make her stand out!)\n\nShe throws her head back against your chest and shivers, twitching her squishy-pink insides hard enough to make a little natural lube gush out over her tail.\n\nHe scoops two clawfuls up and smears it on her face.\n\n\"Like that smell?\" He jams a couple digits up her button nose and twists them. \"Simple and sweet... just like you.\"\n\nShe panic-snorts her own cuntslime and jerks away so hard that you lose your grip. She tumbles off to the floor, bashing her head on the corner of the coffee table on the way down.\n\nBefore either of you can react, she flips herself onto her hands and knees automatically.\n\nYou look up to Snagg. He makes no move to grab her or stop her from getting away... because she isn't trying to get away.\n\nIn fact, she crawls right back to your feet— and only <!i>then<!i> does she resume wailing and kicking, like the warm lounge breeze is deeply violating her.");
			var s:MintSprite = addSprite("assets/img/effect/cubberSpread.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Edits: Kittery\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = 370;
				s.y = -30;
			addChoice("Wow. What an attention whore~", elevator.bind("toddlerbear7"));
			addChoice("Painslut.", elevator.bind("toddlerbear7"));
			addChoice("I bet she's even more retarded now~", function () {
				elevator("toddlerbear7");
				append("\n\nYou notice, now, that the little one's skull is cracked and bleeding, and that his expression is even more vacuous than your bear's. A single bead of drool droops from his ring-gagged maw.\n\nMarei smirks and purrs. \"They do it all the time. Coffee tables, chairs, dildos— they can't parse anything inanimate. The only thing they're coded to do is breathe, swallow any substance in their mouth, and act like dumb sluts.\"");
			}, {kinks: ["Abuse", "Plot"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear7") {
			data.metMarei++;
			append("Snagg grunts out a greasy laugh. \"Mmmmhm. Same as that fuckstain in Marei's lap.\"\n\nOver yonder the tied-up weasel baby screams loud enough to draw a crowd whilst getting his tight little ass shredded on a tummyful of barbed cat dick. Thrash as he may, the spreader bars latched between his ankles and wrists keep him permanently rapeable. Marei mostly holds him by his shivering hips, which are the fattest part of his already chubby baby body and thus the best handles, but occasionally he gets tired of the noise and holds the boy by his throat instead, throttlefucking him with both paws.");
			addChoice("Mmmm... could I borrow some of that bondage stuff?", elevator.bind("toddlerbear8"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear8") {
			append("\"Oh sure~!\" Marei chirps happily, ramming so deep up the weasel's ass that his cock pierces the baby's tender bellybutton from the inside out. \"Lucky you, I just found some spreaders and a ring gag on this dead baby in my lap.\"\n\n\"Pop goes the weasel,\" says some random dude walking by. At first he leans in, all relaxed, like he wants to join— then he spots Snagg.\n\n\"Sorry— uh— gotta go—\"\n\n\"COME BACK HERE MOTHERFUCKER,\" Snagg growls, taking big sweaty speedwalking strides after the guy. \"YOU OWE ME.\"\n\nMarei peels all the gear off his limp, floppy little fuckbaby, taking special care to throw a few vicious thrusts into that tummycunt while he still has the chance. After some fiddles and more than enough fandangling (stalling for more time up that ass, you bet) he unplugs the ring-gag with a <!i>pop<!i>, gives his pale face one last slap, and dumps the little fucker in a bin marked HEAVILY USED.\n\n\"Now,\" he purrs throatily, and squats down to yank your baby bear's legs apart. She screams, as usual, and tries to close them, but the spreader's already in place and "+pickByGenitals("your cock", "Marei's bloody cock— you're starting to understand why Cage was so defensive when it looked like you were going to mooch his babies earlier— his cock", "your cock")+" is already grinding against her face.\n\nShe shuts her mouth tight and turns away, tears running down her cheeks.\n\nAfter the second spreader's been attached to her little pawsies, he runs a few claws lightly over her exposed, vulnerable little belly and leans down to whisper in her ear: \"We're gonna open you up, sweetie~\"\n\nThe cat's claws sink into her lips as he pries her stubborn cockhole of a maw open and stuffs the ring-gag inside.");
			addChoice("Fuck her throat.", elevator.bind("toddlerbear9"), {kinks: ["Art", "Blood"]});
			addChoice("Wow this is too much get back on the elevator.", elevator.bind("main"));
		}


		if (seg == "toddlerbear9") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/cubberThroat.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Edits: Kittery\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = 320;
				s.y = 10;
			append(pickByGenitals("You feed your", "Marei feeds his", "You feed your")+" cock to the helpless little toddlerbear (Fuckmeat age quickly but only up to one or two years old, "+pickByGenitals("Marei", "he", "Marei")+" explains) and "+pickByGenitals("your", "his", "your")+" first few warm-up thrusts are hard enough to break something at the back of her throat. Oops. Oh well!\n\nNow that she's got some stylish accessories, passerby start to notice her.\n\n\"Harder.\"\n\n\"Oooo do that to me Daddy!\"\n\n\"Is that little cutie sneezing blood while she chokes on a dick?! Oh, honey, we have to get a picture!\"\n\n\"No photographic evidence. We were never here.\"\n\n\"I'll keep it tucked between my tits for later, it'll be super secret~\"\n\n\"Yeah right. I know you fuck with that bluebird at the front desk. Last thing we need is a <!i>birdgirl<!i> to flick the first gossip domino... no, we were never here. Now c'mon, let's go get you an abortion.\"\n\n\"Uuuuuuuugh. Fine.\"\n\nYou stop listening and refocus on the bear.\n\nHer ring gag clenches about halfway down "+pickByGenitals("your", "his", "your")+" shaft as she tries pointlessly to bite down, crying as hard as she can, the soft workings of her jaw only managing to make the gag press a little tight against the bottom of "+pickByGenitals("your", "his", "your")+" urethra. It's just a soft pressure, but it's still enough to cut off "+pickByGenitals("your", "his", "your")+" pre stream and make "+pickByGenitals("you", "him", "you")+" feel heavily pent up"+pickByGenitals("", ", by the looks of it", "")+"~");
			addChoice(pickByGenitals("Grab the back of her head and open that fuckin maw", "Grab her ass and open those fuckin holes", "Grab the back of her head and open that fuckin maw")+" up.", elevator.bind("toddlerbear10"), {kinks: ["Art"]});
		}

		if (seg == "toddlerbear10") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/cubberTeeth.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Edits: Kittery\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = 120;
				s.y = -1;
			append("You pop two digits in easily"+pickByGenitals(" alongside your dick", "", " alongside your dick")+", wiggling til the knuckle kisses her lips. She makes the most adorable panicked choking noise on "+pickByGenitals("your", "Marei's", "your")+" cock, as if trying to hyperventilate past fat globs of saliva and pre. Then... <!i>yyyyaaannnk.<!i>\n\n"+pickByGenitals("Marei takes the southern end, tearing those cocksockets open too. \"Why're you screaming, honey?\" he coos. \"Didn't I tell you we were going to open you up?\"", "\"Why're you screaming, honey?\" Marei coos, humping her throat hard enough to bruise. \"Didn't I tell you we were going to open you up?\"", "Marei takes the southern end, tearing those cocksockets open too. \"Why're you screaming, honey?\" he coos. \"Didn't I tell you we were going to open you up?\""));
			addChoice("Phew... take a breather.", elevator.bind("toddlerbear11"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear11") {
			append("You untie her wrists and ankles.\n\nWhen did the spreader bars change to this pretty silk ribbon thing, you wonder? Marei winks and tugs it tighter, slipping another from his buttcrack like a magician would from their sleeve and daintily dabbing his cock clean with it.\n\nYou set her squirmy little butt down on the floor. Marei casually straddles her throat and beats his bloody dick over her face a couple times for good measure. She screams as loud as she can, thrashing, banging her skull against the hard tile.\n\n\"Wanna toggle her back for a sec?\" he asks, sensitive kitty ears twitching. \"It's starting to grate on me.\"");
			addChoice("Sure. Tug her tail twice.", elevator.bind("toddlerbear12toggle"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12toggle") {
			append("<!i>Tug tug.<!i>\n\nA ray of innocent sunshine breaks over her teary eyes, her broken maw, and instead of scream-gargling blood and precum she starts happily chugging the mess down instead.\n\n\"There's my beautiful little girl~\" Marei purrs, caressing her cheek. (You wonder when she became <!i>his<!i>??)\n\nShe purrs right back, as much as a baby bear can purr, and tries to deepthroat one of his fingers, clearly missing the feeling of warm cock lodged down her esophagus. He pulls his digit away and wipes the blood and spit off on her ticklish lil tummy, leaving her to grabble at anything else vaguely phallic nearby.\n\nHe smiles— not a lewd smirk or a devious grin, just a plain happy smile. \"They do have a simple beauty to them, don't they?\"");
			addChoice("Sure.", elevator.bind("toddlerbear12mhm"));
			addChoice("I guess.", elevator.bind("toddlerbear12mhm"));
			addChoice("She'd look a lot more beautiful as a corpse. <3", elevator.bind("toddlerbear12corpse"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12corpse") {
			append("\"Oh fuck,\" he mewls, squeaky-clean cock surging right back up to full mast. \"What happened to taking a breather!? You never let up...\"");
			addChoice(";3", elevator.bind("toddlerbear12corpse2"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12corpse2") {
			append("He leans in, grinding his dick on her innocent face.\n\n\"Hear that? We're gonna open you up, probably so wide you die. Can you understand us, dumb baby? <3 'Course you can't.\"");
			addChoice("Let's carve some mean stuff into her thighs. >:3", elevator.bind("toddlerbear14"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12mhm") {
			append("\"You don't sound convinced.\"");
			addChoice("Well, I dunno... don't mind me.", elevator.bind("toddlerbear12dunno"));
			addChoice("I feel like we kinda tarnished the beauty.", elevator.bind("toddlerbear12tarnished"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12tarnished") {
			append("He blinks, looking down at the happy little bear as she double-fists her gaped pussy to pass the time while the grown-ups chat.\n\n\"When did we do that?\"");
			addChoice("When she was in 'pretend to get raped' mode.", elevator.bind("toddlerbear12tarnished2"));
			addChoice("Y'know, around the time "+pickByGenitals("I", "you", "I")+" raped her screaming throat open.", elevator.bind("toddlerbear12tarnished2"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12tarnished2") {
			append("\"Look,\" he says, stroking his half-chub thoughtfully. \"I'm alive, Snagg's (unfortunately) alive, Mynt's more alive than any of us, but these slabs of meat definitely aren't. Fifty measly lines of code, half of those acting on the <!b>nearbyCock<!b> object should it exist. An NPC, a drawing, a sentence— doesn't matter what it is— if it's just <!i>mimicking<!i> rape, then you have no real reason to beat yourself up about it.\"");
			addChoice("It's all good. I'm not beating myself up about it.", elevator.bind("toddlerbear12beat"));
			addChoice("To be honest, I just did all that stuff out of morbid curiosity.", elevator.bind("toddlerbear12morbid"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12morbid") {
			append("\"Well then.\"\n\nHe shifts his ass on the tile, fur prickling up a bit.\n\n\"I, uh... I knew players were impulsive, but that's one <!i>prolonged<!i> impulse. I mean, you even "+pickByGenitals("fucked", "yanked", "fucked")+" her—\"");
			addChoice("I know and I'm not proud of it.", elevator.bind("toddlerbear12proud"));
			addChoice("Is it really my fault that this game is so fucked up?", elevator.bind("toddlerbear12fault"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12proud") {
			append("\"...\"");
			addChoice("... So, wanna ditch the whole baby murder thing and "+pickByGenitals("suck my dick", "fuck my face", "suck my dick")+"?", elevator.bind("toddlerbear12proud2"));
			addChoice("... Shall we continue?", elevator.bind("toddlerbear12proud2"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12proud2") {
			append("\"I don't really want to,\" he admits, \"now that I know you just put on a charade for the past twenty minutes.\"");
			addChoice("Ah. Well.", elevator.bind("toddlerbear12proud3"));
			addChoice("It wasn't a <!i>charade<!i>... I was just messing around.", elevator.bind("toddlerbear12proud3"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12proud3") {
			append("He's supremely offended.\n\n\"I thought you were here because we shared the same tastes.\"");
			addChoice("I'm not. Sorry.", elevator.bind("main"));
			addChoice("I'm not sorry.", elevator.bind("main"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12fault") {
			append("His dick softens.\n\nHis face pinches up with betrayed confusion.\n\nHe scoops your little bear into his arms and takes a few steps back.\n\n\"So... really, you've just been sitting there in stunned disbelief, pushing the situation further and further just to see if Mynt would float down and put a stop to it? You're not comfortable with any of this? You don't have any of these kinks?\"");
			addChoice("Basically.", elevator.bind("toddlerbear12cringe"));
			addChoice("Nooo don't take her away. I want more cringe.", elevator.bind("toddlerbear12cringe"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12cringe") {
			append("His lips quiver and hold back insults.\n\n\"This is... you're... that was incredibly uncool of you.\"\n\nHe spins around and leaves, wiping tears away with a forearm. His fat catbutt sways with his emotional strides.\n\nYou'd better go.");
			addChoice("Move along.", gotoHub.bind("Junk City"));
		}

		if (seg == "toddlerbear12beat") {
			append("\"Well good,\" he meows. \"Let me know if you ever start to. I've been down that road, y'know? It ends in a cul-de-sac full of judgemental suburban moms.\"");
			addChoice("Thanks, Marei.", elevator.bind("toddlerbear12thanks"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12dunno") {
			append("He strokes his dick thoughtfully, looking at you. \"Alright. Just seemed like you were a bit down for a moment there. I'm here if you ever wanna talk.\"");
			addChoice("Thanks, doc.", elevator.bind("toddlerbear12thanks"));
			addChoice("Thanks?", elevator.bind("toddlerbear12thanks"));
			addChoice("Thanks.", elevator.bind("toddlerbear12thanks"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear12thanks") {
			append("He toes the little bear's floppy puss, leaning back with his hands crossed behind his head. He really does have a set of hips on him, and his grey-green fur shimmers even in this low light. You get a weird Protector of the Forest vibe.\n\n\"Anytime, "+data.playerName+".\"");
			addChoice("So... shall we continue?", elevator.bind("toddlerbear13"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear13") {
			append("\"Absolutely.\"\n\nHe slaps her across the face as a warm-up. She giggles, smushing up paws up over her bright-red cheek to prolong the hot sting.\n\n\"What does she deserve next?\"");
			addChoice("Let's carve some mean stuff into her thighs. >:3", elevator.bind("toddlerbear14"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear14") {
			append("Marei pulls an exacto knife from his buttcrack, dislodging a few more ribbons from the process. He chuckles at your expression. \"Don't worry, it wasn't inside. I'm just magic.\"\n\n<!i>Click.<!i>\n\nHe drags the gleaming edge of the blade along her soft, perfect thighmeat... the flat edge, that is. Then he tosses it to you.");
			addChoice("Hmmm... I guess we should advertise what she <!i>is<!i> for starters.", elevator.bind("toddlerbear15"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear15") {
			append("You walk to her lower half and drop to hands and knees, getting ready steady for some relaxing calligraphy...\n\nYou close your fist around the hilt and carve <!b>FUCKTOY<!b> mercilessly quick and deep into her left thigh— the blade sinks inside with near-zero resistance, gliding through her underdeveloped flesh like butter and leaving only a trail of dark red. The little Fuckmeat doesn't scream or thrash, she just holds perfectly still so you don't mess up any letters. Still, she squeals from deep inside her chest, and her abused pussy twitches in a dry cum, so you know that she'd be squirming with pleasure if she could right now.\n\nWhile Marei faps at lightspeed in the background you pick two more insults and carve them: <!b>BABYSLUT<!b> (taking your sweet old time on the S) and next, because your hand is getting a little sore, you simply stab the word <!b>CUNT<!b> into her forehead.");
			addChoice("Now for some instructions.", elevator.bind("toddlerbear16"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear16") {
			append("An ethusiastic crowd is forming now. Even those way in the back shout suggestions, people you can't even see.\n\n\"Write <!b>SNUFF ME<!b> on her, big letters, let everybody know what she's for.\"\n\n\"<!b>I DESERVE THIS<!b>, carve that in!\"\n\n\"Do <!b>COCK<!b> and draw a little arrow pointing to her cunny!\"\n\n\"'Cunny'? What the fuck, dude. You promised me you wouldn't call it that anymore.\"\n\n\"Shut up. It's cute.\"\n\nYou accept each suggestion immediately, writing with feverish strokes. The momentum of the crowd wells up at your back. You stand over the cub skank with your elbows out, admiring your handiwork firstly and keeping the horny masses at bay with elbow-jabs secondly. Her hoarse squeals echo through the room as she writhes and shows herself off with sloppy ecstacy, eyes rolled-up, cunt swollen and pulsing with a second dry cum.\n\nYou realize, in this moment, that shooing everyone off and keeping her for yourself is no longer an option. At some point she stopped being yours. Now she's public property, a truly free-use fucksponge. It's only with Marei's help that you hold the crowd back long enough to do one last thing.\n\nHe winks at you. \"What did we say we were gonna do to her?\"");
			addChoice("Open her up.", elevator.bind("toddlerbear17"), {kinks: ["Art", "Abuse", "Blood", "Gore", "Abuse", "Blood", "Gore", "Abuse", "Blood", "Gore"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "toddlerbear17") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/cubberRip.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "Edits: Kittery\n\nThis art was not commissioned for Paraphore. Cubber just gave us permission to use it. Please go check them out on Inkbunny, they have a bunch of dope art!!");
				s.x = GAME_WIDTH/2-s.width*0.5;
				s.y = 0;
			append("<!i>Tug tug.<!i>");
			addChoice("... Ooookay get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "wanted to watch") {
			append("He scoops up his fuckmeat and says nothing.\n\n... You guess that means \"Sure, you can watch!\" because after toeing open the door to a private room down the hall, he keeps it held open for you, looking elsewhere. The little bunnygirl hangs over his shoulder, idly licking the blood from it, blinking at you.");
			addChoice("... Follow him again.", elevator.bind("follow him again"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "follow him again") {
			append("He dumps all the infants on the ground and flips around to blow musky snout-steam right in your face, one titanic arm slamming the door closed behind you.\n\n\"I'm not an asshole,\" he says. \"But don't expect me to water my tastes down just because you're all famous and you think we're here to put on a show. I'm gonna do what I want, alright?\"");

			addChoice("Next.", elevator.bind("cagenext3"), {kinks: ["Abuse"]});
			addChoice("And what do you want to do?", elevator.bind("define good"));
		}

		if (seg == "define good") {
			append("\"Fuck some shit up.\"");
			addChoice("And what's that mean, exactly~?", elevator.bind("do i"));
		}

		if (seg == "do i") {
			append("\"Look, "+pickByGender("man", "lady", "bud")+", I just wanted to be in here privately...\"");
			addChoice("Oh. I get ya. Extreme stuff.", elevator.bind("extreme stuff"));
		}

		if (seg == "extreme stuff") {
			data.cageDefensive = true;
			append("\"Yeah.\"\n\nHe seems kind of defensive now.");

			addChoice("I won't meddle. Fuck as much shit up as you like.", elevator.bind("cagenext3"), {kinks: ["Abuse"]});
			addChoice("I think I'll just go.", elevator.bind("main"));
		}

		if (seg == "cagenext3") {
			append("Cage picks up the seven-month-old deer, getting a good pudgebutt grope in the process. The little fawn's nuts are the size of yo-yos, his overlarge cock nestled between the tiny mounds of his babytits; both quiver and throb as Cage hocks a fat glob of saliva into the infant's mouth then pushes it closed with two fingers on the chin and says: \"Swallow.\"\n\nAt first he seems confused by the musky taste of bullspit, but then his little poof tail waggles with happiness and he swallows it down obediently.\n\n\"Look at him,\" Cage grunts, yanking the boy's thighs apart. \"Spreading his legs for me already.\"");

			addChoice("Next.", elevator.bind("cagenext3b"));
		}

		if (seg == "cagenext3b") {
			append("Cage brings his palm down on the deer's now fully exposed nuts, producing a jiggle and a sharp squeal. The bunnygirl and koalaboth watch with wide, hypnotized eyes, both absent-mindedly and instinctively cramming fingers into their mouth and up their holes, stretching themselves to make their inevitable rape a little easier.\n\nThe blows to the baby's pouch get rougher each time, up-and-down, side-to-side, then Cage winds back and drives his fist into them. The deerling squeals and dry-cums, cocklet throbbing as his nuts redden and twitch between the bull's knuckles.\n\nIn the aftermath the fawn gives Cage bedroom eyes, making sharp, prolonged mewls at the occasional extra-vicious slaps he clearly considers a cooldown.");

			addChoice("Next.", elevator.bind("cagenext4"), {kinks: ["Vomit"]});
		}

		if (seg == "cagenext4") {
			append("Cage grabs the little fucktoy by his skull and folds him over, making him swallow his own oversized cock. He gets a grip on the infant's ass by hooking two fingers into his swollen pucker and plays him like an accordion, dragging his cock in and out of his little esophagus with great brutal movements.\n\n\"Does the babycunt wanna suffocate on his own cock? Moan as loud as you can for 'yes,' Fuckmeat.\"\n\nThe baby gives a pitiful, warbling little moan before Cage can even finish the word \"yes\", throat packed, eyes rolled up, tiny button nose buried in the pillows of his beaten nuts as he gags and pukes all over himself.\n\n\"Too bad,\" says Cage. \"I think I'll use mine instead.\"");

			addChoice("Next.", elevator.bind("cagenext5"), {kinks: ["Snuff", "Piss"]});
		}

		if (seg == "cagenext5") {
			append("The bull tosses the baby deer ouroboros to the carpet where he promptly pops free of his self-throatfuck, stretched out on his chubby, pukestained tummy, panting. Cage's cockhead throbs as he yanks the baby up by both ankles and dangles him above it, painting the little bimbo's face with precum mascara and lipstick, at one point letting that tiny nose slip directly into his piss slit. He lets the boy get a deep whiff... then drops him.\n\nHis head slips past the seven-month-old's lips with a <!i>pop<!i> and forces its way down his tiny windpipe in one smooth push. You realize he timed it on an exhale so the baby's lung would be deflated, serving as a slightly tighter cocksleeve. The mindless thing just waggles his limbs and stares at Cage's nuts, still a ways from the bottom, doing noisy little show-off gags and muffled squeaks while the bull drags his cock back and slams it in again, raping one lungpussy then the other in alternation.\n\nCage sighs, and a trickle of piss starts to flow from the boy's nostrils. For the first time the bull drops his guard and shows the deerling some real affection, giving him a few tender pets on the head. Then a few tender punches on the head.\n\n\"Worthless little urinal.\"");

			addChoice("Next.", elevator.bind("cagenext6"));
		}

		if (seg == "cagenext6") {
			append("Soon the deer passes out and Cage casually impales its limp body from mouth to ass on his cock, pulling the tiny still-warm tongue out and nestling it deep in the crease between his sweaty nuts. There's still a good five inches outside, dripping with the natural lubey inner coating of all Fuckmeat. In his last moments the deer is calm and happy that he had the honor of choking to death on a cock, though he didn't know how to put it in words or really express it at all except by giving one last shivery feeble wiggle in an attempt to sink his little body just that much closer to the base of his rapist's shaft.\n\nCage grips the fuckling around his stomach and uses his body as a furry little onahole, natural lube glistening, piss squirting out from the cracks with every squeeze.\n\n\"That's about as gentle as I get,\" he says. \"Which next?\"");

			addChoice("Bunnygirl.", elevator.bind("bunny girl"));
			addChoice("Koalaboth.", elevator.bind("koala both"), {kinks: ["Gore"]});
		}

		if (seg == "bunny girl") {
			data.cageWhereFromDone = false;
			data.cageBunnyFingerfucked = false;
			data.cageBunnyGroped = false;
			data.cageBunnyPunchfucked = false;
			data.cageBunnySnuffed = false;
			data.cageBunnyCounter = 0;
			append("Cage scoops the girl up and tickles her belly, making her giggle, then slaps her across the face and drives three fingers up her tiny cunt, the stretchy little fucksleeve opening effortlessly, gushing oil.\n\nHe makes a rhythm of it; fingerfuck, slap, fingerfuck, slap, until the baby's facefur is bright red and soaked, beads of her own juices hanging from her eyelashes. Each time a slap lands her tiny body jolts and she squeaks pathetically, spreading her pudgy legs as wide as she can; another instinctual Fuckmeat reflex, you deduce.\n\nCage finally breaks the pattern and stuffs his fingers in her mouth; she happily sucks them clean, poof-tail twitching with happiness as she tastes herself, gaped cunt trying pathetically to close.");

			if (!data.cageKoalaSnuffed) append("Time passes.\n\nAt first you wonder what the hold up is, and then you realize he's kinda peripherally eyeing you. You guess... open to suggestions?\n\nIt's kind of hard to tell with this guy.");

			addChoice("Grope her uvula.", elevator.bind("grope uvula"));
			addChoice("Fingerfuck her nose.", elevator.bind("fingerfuck nose"));
			addChoice("Punchfuck her.", elevator.bind("punch fuck"));
			addChoice("End her.", elevator.bind("end her"));
			addChoice("So, Cage, where ya from?", elevator.bind("where ya from"));
		}

		if (seg == "grope uvula") {
			data.cageBunnyGroped = true;

			if (data.cageBunnySnuffed) temp.a = "corpse twitches" else temp.a = "body tenses up in a whorish gag";

			append("Cage grunts, which you guess means \"Sure,\" and wiggles two fat fingers into the bunny's throat, slapping her "+(data.cageBunnySnuffed?"pale":"sore, red")+" cheeks with his free hand every time her little "+temp.a+". He opens her maw so you can see he's got her uvula pinched between his fingers, jacking it off like it's a little throatcock.");
		}

		if (seg == "fingerfuck nose") {
			data.cageBunnyFingerfucked = true;
			if (data.cageBunnySnuffed) {
				temp.a = "inert face";
				temp.c = ".";
				temp.d = "the corpse's mouth and eyes hanging open vacantly as he molests them.";
			} else {
				temp.a = "blushy expression of wonderment";
				temp.c = ", the bunny sneezing adorably.";
				temp.d = "the little cunt squealing and scrabbling desperately at his hand, sometimes pulling it away and sometimes pushing it deeper, the extreme discomfort of a nostrilfuck apparently not quite overpowering her instinctual desire to have every orifice gaped as wide and as deep as possible.";
			}

			append("Once more, though he cradles her body close to his chest and tries to hide it from you, Cage shows a little affection, giving the baby's "+temp.a+" an eskimo kiss.\n\nHe leans in close and plants a simple peck on her button nose. ");

			if (!data.cageBunnySnuffed) append("\n\n\"Does baby wanna get fucked in her tightest pussies~?\" he whispers sweetly, thinking you can't hear.\n\n");

			append("That turns to a proper kiss, then to something even more, the bull sucking hard on her little nose, warming up both nostrils with vicious thrusts of his tongue"+temp.c+"\n\nOnce he deems her ready he jams a finger up her left nostril and drives it into her sinuses with a brutal twist, "+temp.d);
		}

		if (seg == "punch fuck") {
			data.cageBunnyPunchfucked = true;
			if (data.cageBunnySnuffed) {
				temp.a = "corpse flopping limply";
				temp.c = "\"Mmm... way too warm in here. I think she might've been a couple months pregnant...\"";
			} else {
				temp.a = "body jerking sharply";
				temp.c = "The bunny squeals with raw pleasure, kicking both legs and wiggling around to try and sink the fist in deeper, squeezing the massive bulge in her stomach with both tiny hands.";
			}

			append("Cage doesn't bother with warmup, winding back and beating her cunt open with merciless strikes, sinking only half his fist inside on any given blow, her tiny "+temp.a+" with each impact. Her lower lips are both swollen and purple before Cage finally starts the punchfuck proper, wearing her like a puppet while he lovingly forces his fist into her infant womb and twists it.\n\n"+temp.c+"\n\nAfter a good while he yanks his hand out and wipes the blood and pussydrool off on her face.");
		}

		if (seg == "end her") {
			data.cageBunnySnuffed = true;
			if (data.cageBunnyCounter == 0) temp.a = "You don't waste any time.";
			if (data.cageBunnyCounter == 1) temp.a = "She deserves it after that little display, doesn't she?";
			if (data.cageBunnyCounter == 2) temp.a = "Ah... and I was gonna put the cherry on top. Ah well.";
			if (data.cageBunnyCounter == 3) temp.a = "Took you long enough.";

			append("Cage grins. \""+temp.a+"\"\n\nHe looks the infant in her wide, innocent eyes and spits in them. While she blinks and wipes with pudgy fingers at her saliva-clogged lashes Cage places her on the ground and repositions into a squat above her confused expression. Quite simply, without any ceremony, he drops his ass on her face and puts his full weight on her soft infant skull, casually jerking off while she thrashes underneath him, his heavy nuts bouncing on her stomach.\n\nEventually the bunny checks out. Just to make it certain, Cage grinds his hips back and forth, showing only a speck of emotion in the form of an occasional satisfied flick of his tail.\n\nAfter a good minute longer of grinding than necessary he gets off and cockslaps her pale, vacuous expression a couple times just to double check. ");

			if (data.cageBunnyCounter < 3) append("\"Makes a cute corpse, doesn't she? I almost wanna ruin her a little more...\"");
			else append("\"A decent snuffrag... but I've had better.\"");
		}

		if (seg == "alright") {
			append("...");
		}

		if (seg == "grope uvula" || seg == "fingerfuck nose" || seg == "punch fuck" || seg == "end her" || seg == "alright") {
			data.cageBunnyCounter += 1; 
			if (
				data.cageBunnyGroped &&
				data.cageBunnyFingerfucked &&
				data.cageBunnyPunchfucked &&
				!data.cageBunnySnuffed
			) temp.b = "Okay, now she's ready." else temp.b = "End her.";

			if (!data.cageBunnyFingerfucked) addChoice("Fingerfuck her nose.", elevator.bind("fingerfuck nose"));
			if (!data.cageBunnyPunchfucked) addChoice("Punchfuck her.", elevator.bind("punch fuck"));

			if (!data.cageBunnySnuffed) {
				addChoice(temp.b, elevator.bind("end her"));
			} else {
				if (!data.cageKoalaSnuffed) addChoice("Now the koalaboth.", elevator.bind("koala both"), {kinks: ["Gore"]});
				else addChoice("Wind down.", elevator.bind("cagewinddown"));
			}

			if (!data.cageWhereFromDone) addChoice("So, Cage, where ya from?", elevator.bind("where ya from"));
		}

		if (seg == "koala both") {
			append("\"What?\"");

			addChoice("I mean the koala.", elevator.bind("i mean koala"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "i mean koala") {
			if (data.cageBunnySnuffed)
				temp.a = ", clearly aroused from watching the suffocation of her bunny sister"
			else
				temp.a = "";

			append("Cage picks up the koala by both of her baseball-sized babytits, puffed nipples squished between his knucks.\n\nHe gives em both a vicious honking and drops to a squat over her curvy waist, mostly letting gravity bring his cock down hard against her fat little tummy with a <!i>thwap.<!i> The babywhore shivers with a long, winded mewl, bucking into his greasy nuts where they rest just below her belly button"+temp.a+"; with something close to amusement Cage drags his hips back, leaving thick smears of nutgrease on her fur, and frots with her.");

			if (!data.cageBunnySnuffed) append("Time passes.\n\nAt first you wonder what the hold up is, and then you realize he's kinda peripherally eyeing you. You guess... open to suggestions?\n\nIt's kind of hard to tell with this guy.");

			data.cageAskedOften = false;
			data.cageKoalaBroke = false;
			data.cageKoalaEaten = false;
			data.cageKoalaKissed = false;
			data.cageKoalaSnuffed = false;
			data.cageKoalaCounter = 0;

			addChoice("Break her legs.", elevator.bind("break legs"));
			addChoice("Eat her tits.", elevator.bind("eat tits"));
			addChoice("Gently, lovingly smooch her.", elevator.bind("smooch her"), {kinks: ["Love"]});
			addChoice("End her.", elevator.bind("koala snuff"));
			addChoice("So... er... do you rape babies often?", elevator.bind("rape often"));
		}

		if (seg == "break legs") {
			data.cageKoalaBroke = true;
			if (data.cageKoalaSnuffed) {
				temp.a = "utterly broken koalakunt sprawled";
				temp.c = "spits in her gaping eyesockets";
				temp.d = "The koalaboth's expression twitches for a milisecond into a smile, a tiny morsel of that good agony leaking into the afterlife. Cage gets to his feet.";
				temp.e = "";
			} else {
				temp.a = "happy little piece of babymeat wiggling";
				temp.c = "looks deep into her wide eyes";
				temp.d = "The koalaboth's maw jerks open and her expression electrifies with shock— then both go slack, her eyes roll up, and she cums all over Cage's face with a piercing mewl of ecstasy.\n\nCage blinks and pulls both hands away from her shattered leg, going PBBTPHTPHTBHT and scrabbling to wipe it off. \"Little cunt,\" he growls, and lurches to his feet.";
				temp.e = "drawing a guttural purr-scream from her, ";
			}

			append("Cage looks at you.\n\nThen he looks back down to the "+temp.a+" below him and shrugs. \"Well, sure.\"\n\nHe does the left one by hand, starting at the top of her curvy thigh with a gentle few-fingered massage and working down until he's got three wrapped tight around her kneecap; he leans in and "+temp.c+" all at once quadrupling the force of the massage and crushing her soft little leg bones. "+temp.d+"\n\nHe brings the heel of his foot down on her other thigh, "+temp.e+"stomping the bubbly babymeat to deflation.");
		}

		if (seg == "eat tits") {
			data.cageKoalaEaten = true;
			if (data.cageKoalaSnuffed) {
				temp.a = "";
				temp.c = "The babycorpse of course does nothing, her only purpose being a snack.";
			} else {
				temp.a = "The babycunt blurbles happily at the attention, her chest still sensitive from the earlier honking. ";
				temp.c = "";
			}

			append("He starts with niplet kisses, pulling each to full mast with one expertly placed slurp. "+temp.a+" Squeezing the base, Cage makes a balloon of the rightmost and slips it into his maw...\n\nHe bites it off with one clean chomp, blood splurting from the new pussy gaping on the koala's chest; lovingly he triple-fingers it while he gnaws slowly at the other one, mostly not even eating at first but just leaving deep purple bite marks in her supersoft Fuckmeat flesh.\n\n"+temp.c);
		}

		if (seg == "smooch her") {
			data.cageKoalaKissed = true;
			append("\"No.\"");
		}

		if (seg == "koala snuff") {
			data.cageKoalaSnuffed = true;
			if (data.cageKoalaCounter == 0) temp.a = "You got lucky.";
			if (data.cageKoalaCounter == 1) temp.a = "You're pretty much ruined after that, little cunt. Don't worry, I'll still abuse your corpse.";
			if (data.cageKoalaCounter == 2) temp.a = "You loved that, didn't you?";

			if (data.cageKoalaBroke) temp.c = "weak little broken legs" else temp.c = "stomach";

			append("Cage leans down, his nose almost touching hers. \""+temp.a+"\"\n\nHe flips her like a pancake, squeals reverberating wierdly as she spins in the air, then shoves her face to the floor and hikes her infant ass up to his cock. With a one-handed grip on her "+temp.c+" he backs the koalaboth up onto it, her puffy ring opening to accept his head with only the mildest wiggle.\n\nFor once he actually just makes love, humping her bubbly babybutt with just enough ferocity to coax out those cute squeaks, but not so brutally that it wrecks her.\n\nThat doesn't last long.\n\nCage makes a fist around her throat and starts raping her esophagus from the inside, the smooth curve of her stomach bulging out, cocklet flopping around cutely, mouth alternating between moans and screams as he bashes her face against the floor. Eventually even that isn't enough; he spins her around with a <!i>schlick<!i> on his cock and gently rubs his thumbs in circles on her eyelids, pounding in as deep as possible, then synchronizes his orgasm with a double eye-gouging which draws splurts of cute babybrains out around his thumbs.");
		}

		if (seg == "cagealright") {
			append("...");
		}

		if (seg == "break legs" || seg == "eat tits" || seg == "smooch her" || seg == "cagealright" || seg == "koala snuff") {
			data.cageKoalaCounter += 1; 

			if (!data.cageKoalaBroke) addChoice("Break her legs.", elevator.bind("break legs"));
			if (!data.cageKoalaEaten) addChoice("Eat her tits.", elevator.bind("eat tits"));
			if (!data.cageKoalaKissed) addChoice("Gently, lovingly smooch her.", elevator.bind("smooch her"));

			if (
				data.cageKoalaBroke &&
				data.cageKoalaEaten &&
				data.cageKoalaKissed &&
				!data.cageKoalaSnuffed
			) temp.b = "Okay, now she's ready." else temp.b = "End her.";

			if (!data.cageKoalaSnuffed) {
				addChoice(temp.b, elevator.bind("koala snuff"));
			} else {
				if (!data.cageBunnySnuffed) addChoice("Now the bunny.", elevator.bind("bunny girl"));
				else addChoice("Wind down.", elevator.bind("cagewinddown"));
			}

			if (!data.cageAskedOften) addChoice("So... er... do you rape babies often?", elevator.bind("rape often"));
		}

		if (seg == "rape often") {
			data.cageAskedOften = true;
			append("\"Yes.\"");
			addChoice("Alright.", elevator.bind("cagealright"));
		}

		if (seg == "where ya from") {
			data.cageWhereFromDone = true;
			if (data.cageDefensive) append("\"Nowhere.\"");
			else append("\"Hometown's underneath a bigass meteor.\"");
			addChoice("Alright. Well.", elevator.bind("alright"));
		}

		if (seg == "cagewinddown") {
			StoryUtils.quickMynt("Cage");
			append("Cage scoops up all three corpses and tosses them in a little dumpster marked LIGHTLY USED. Next to it: HEAVILY USED and MISC. MEAT.\n\nHe sniffs and stretches a little, muscular bull 'ceps bulging, then does something with his hands, hiding it from you.\n\n\"I'm leaving,\" he says, and pushes a little scrap of paper into your hand.\n\nHe leaves.");

			addChoice("Read it.", elevator.bind("cagenote"));
		}

		if (seg == "cagenote") {
			data.cagePhoneNumber = true;
			msg("Memorized Cage's phone number.");

			append("1-669-0077.\n\n... It's his phone number.");

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}
		//}}}
	}

	public static function volleyballGame():Void {
		clear();
		/* Events:
					startTurn, afterStratGen,
					choice, startPass, resolvedCatcher, resolvedPass, [resolvedChances],
					afterRound, [beforePassChain], [afterPassChain] */

		temp.volleyBallListener = function(eventName) {
			var strat = data.volleyBall.strat;

			if (eventName == "startTurn") {
				append(pickOne([
						'The game is '+data.volleyBall.pointTeam+' your team and '+data.volleyBall.pointOpponent+' their team.',
						''+data.volleyBall.pointTeam+' Home and '+data.volleyBall.pointOpponent+' Visitor.',
						'Your team\'s got '+data.volleyBall.pointTeam+' points and the other team has '+data.volleyBall.pointOpponent+' points.',
						'It\'s '+data.volleyBall.pointTeam+' to '+data.volleyBall.pointOpponent+'.']));
				append("\n\n");

			} else if (eventName == "afterStratGen") {
				var a = strat.a.name;
				var b = strat.b.name;
				var c = strat.c.name;
				var hs = strat.hitOrSpike;
				var ideahaver = "";
				var fatedone = "";
				if (c == "Panda") {
					ideahaver = 'Panda raises her hand politely. "'+b+' could pass to me and I could probably '+hs+' it! Maybe!"';
					fatedone = 'Panda\'s tuckered already, doubled-over, huffing and puffing. "Sorry... boys... I can\'t do much this round..." \n\n Captain crosses his arms. "Alright, team. '+a+' to '+b+' to '+c+'." \n\n Panda looks up, devastated. Captain walks up and casually cockslaps her— she recoils, blushing as she straightens up, a dribble of pre on her lips. "Push yourself," he says. "Go for a '+hs+', girl." \n\n Panda nods, licking up the pre and drawing immense strength from its flavor.';
					append("\n\n");

				} else if (c == "Gecko") {
					ideahaver = 'Gecko freaks the fuck out for no reason and starts chanting '+hs+' '+hs+' '+hs+'.';
					fatedone = 'Just as Captain is about to lay down his game plan, Gecko cuts him off: "I\'ll pass to '+b+'. And I want '+a+' to pass it to me. No. '+b+' pass to me— after '+a+' passes— and then '+a+' passes to '+b+'. Then '+b+' pass back to '+a+' and '+a+' pass to me and I\'ll pass to '+b+' who passes to '+a+' then I\'ll pass to '+c+' and—" \n\n Captain interrupts: "How about '+a+' passes to '+b+' and then you '+hs+' it, Gecko? Is that okay?" \n\n "Do NOT tell me what to do," Gecko snaps. "But okay. Sure. Yeah. Sure. I\'ll '+hs+'."';
					append("\n\n");

				} else if (c == "Raven") {
					ideahaver = '"Not me," Raven says.';
					fatedone = 'Captain tries to come up with a plan for a bit but it\'s slow going. Raven keeps irking him: "Come on, kitty... it\'s not that hard. Just make up some bullshit plan that doesn\'t necessarily account for any of our strengths or weaknesses. Look, I\'ll do it now: '+a+' should pass to '+b+'," Raven sarcasms. "They\'ll never expect it." \n\nCaptain jolts up. "Perfect. Then you\'ll '+hs+' it! Great thinking, bird." \n\nRaven scowls.';
					append("\n\n");

				} else if (c == "Big Boi") {
					ideahaver = 'Big Boi mimes a '+hs+' and flashes two big beefy thumbs up.';
					append("\n\n");

					if (data.volleyBall.pointTeam < data.volleyBall.pointOpponent) {
						fatedone = 'With the score behind, team morale is hurting. Captain doesn\'t have a plan, nor Panda, nor Gecko, nor Raven...  \n\n Then Big Boi puffs his chest out and stands as tall as he can, white fur glistening in synthetic sunset. He points to '+a+'. Then to '+b+'. And, lastly, he jabs a thumb at himself. \n\nCaptain nods, daring to hope. "Make it a '+hs+', Big Boi. And make it a good one."';
						append("\n\n");
					} else if (data.volleyBall.pointTeam >= data.volleyBall.pointOpponent) {
						fatedone = 'Big Boi points to '+a+' then to '+b+' then strikes a powerful pose. Panda is the only one who claps. "Oho, wow, the muscles... I think he wants to '+hs+'!"';
						append("\n\n");
					}

					//Captain
				} else if (c == "Captain") {
					ideahaver = 'No one says anything. \n\n"Wow, guys..."';
					fatedone = 'Captain lays it down: "'+a+', pass to me, then I\'ll '+hs+' it." \n\n '+b+' seems like they feel a little left out. Captain notices and corrects himself: "Ah, sorry, '+a+' pass to '+b+', then '+b+' can pass to me."';
					append("\n\n");
				}

				if (c != "Captain") {

					append(pickOne([
							'"Listen up", Captain says. "Here\'s what I think: '+a+' should pass to '+b+' who sets it up big time for '+c+'. Then they\'re gonna haul ass and '+hs+'. Let\'s roll."',
							'"Captain\'s gone wild, all greased up and ready to rumble. "HUSTLE," he says, "HUSTLE! I wanna see a CLEAN pass from '+a+' to '+b+' and I wanna see '+c+' '+hs+' it home! LET\'S GO BOYS!" \n\n"And girl..." Panda says.\n\n',
							'"'+a+'..." Captain starts, a little unsure. "Nah. Yah. Fuck it. '+a+', pass to '+b+'... from there... '+hs+', maybe... well, does anyone have any ideas?" \n\n '+ideahaver+' \n\n "It\'s settled, then. '+c+'\'s got it under control."',
							'Captain takes a knee. "Let\'s get '+a+' passing to '+b+' setting for '+c+', and '+c+', look at me right now when I tell you: '+hs+' that ball as hard as you can. Roll out."',
							fatedone]));
					append("\n\n");

				} else { //Captain is c

					append(pickOne([
							'"Listen up", Captain says. "Here\'s what I think: '+a+' should pass to '+b+' who sets it up big time for me. Then I\'ll haul ass and '+hs+'. Let\'s roll."',
							'Captain\'s gone wild, all juiced up and ready to rumble. "HUSTLE," he says, "HUSTLE! I wanna see a CLEAN pass from '+a+' to '+b+' and I wanna '+hs+' that ball home MYSELF! LET\'S GO BOYS!" \n\n"And girl..." Panda says.',
							'"'+a+'..." Captain starts, a little unsure. "Nah. Yah. Fuck it. '+a+', pass to '+b+'... from there... '+hs+', maybe... well, does anyone have any ideas?" \n\n '+ideahaver+' \n\n "It\'s settled, then. Just pass to me, I\'ll do all the work."'
							,
							'Captain takes a knee. "Let\'s get '+a+' passing to '+b+' setting for me. I\'ll '+hs+' it as best I can, but if I fuck this up, it could lose us the game. No pressure."'
							,
							fatedone]));
					append("\n\n");
				}


				if (strat.a.name != data.playerName) {
					append(pickOne([
							''+a+' passes to you.',
							''+a+' practically spikes the ball at you they pass it so hard.',
							''+a+' bumps the ball your way.',
							''+a+'\'s pass nearly sails over your head, but you manage to get underneath it.',
							''+a+' passes the ball your way.',
							''+a+' passes the ball to you.',
							''+a+' passes you the ball.',
							''+a+' punches the ball towards you.',
							''+a+' passes you-ward.']));
					append("\n\n");
				} else {
					append(pickOne([
							'You contemplate the plan, turning the ball over in your hands...',
							'You start with the ball.',
							'You play catch with yourself for a bit, thinking.',
							'It\'s decision time.',
							'The ball\'s in your court.',
							'With the ball in your hands you get a weird urge to do a slam dunk over the net but quickly remind yourself that this ain\'t hoops.',
							'You\'ve got the ball and it\'s time to volley.']));
					append("\n\n");
				}

			} else if (eventName == "resolvedCatcher") {
				append(pickOne([
						'The ball is succesfully passed to '+strat._playerCatching.name+'.',
						'The ball flies over to '+strat._playerCatching.name+'.',
						'The pass goes through to '+strat._playerCatching.name+'.']));
				append("\n\n");

			} else if (eventName == "resolvedChances") {
				var a = strat.a.name;
				var b = strat.b.name;
				var c = strat.c.name;
				var pc = strat._playerCatching.name;
				var hs = strat.hitOrSpike;

				append(pickOne([
						pc+' '+hs+'s the ball over the net.',
						pc+' delivers a devastating '+hs+' to the ball. You can feel their hand stinging from here.',
						pc+' '+hs+'s it good.',
						pc+' watches their '+hs+' sail over the net.',
						'It\'s a solid '+hs+'.',
						pc+' goes absolutely ham on that '+hs+'!!!']));
				append("\n\n");

				if (strat._success) {
					append(pickOne([
							'Gooooooal!',
							'The '+hs+' lands like a glove and your team rejoices with high-fives and group hugs and a couple kisses and a teeny bit of heavy petting.',
							'It lands!',
							'The ball devastates your opponents\' court. There\'s really nothing they could\'ve done to stop it.']));
					append("\n\n");
				} else {
					append(pickOne([
							'Bad shit. The enemy team counters the shot and bounces it off of Big Boi\'s girth.',
							'The enemy team slaps the shot away and counter-scores on ya. '+c+' is beyond distraught.',
							'The shot flies off the court.',
							'The shot just plain sucks, and doesn\'t even get near the opposing team.']));
					append("\n\n");
				}
			} else if (eventName == "resolvedPass") {
				if (!strat._followedRules) append('Well, that wasn\'t the plan, but whatever.');
				append("\n\n");
			}
		}

		function roll(chances) {
			var rand = Math.random();
			var res = rand < chances;
			return res;
		}

		function endGame() {
			var winner = "draw";
			if (data.volleyBall.pointOpponent >= data.volleyBall.maxPoints) winner = "them";
			if (data.volleyBall.pointTeam >= data.volleyBall.maxPoints) winner = "you";

			if (winner == "you") {
				append("You win! The whole team goes nuts. Panda and Big Boi bump bellies. Gecko finally trusts you all enough to get a little close. Even Raven cracks a beaky grin.");
				if (!data.volleyballWon) addChoice("Woooo!!", elevator.bind("volleyball won"));
			}
			if (winner == "they") append("They win! You lost horribly!\n");
			if (winner == "draw") append("It\'s a draw.\n");

			data.volleyBall = null;

			addChoice("Throw down some hefty volleys.", elevator.bind("throw down"), {enabled: !data.bigBoiJudged, toolTip: (data.bigBoiJudged?"Big Boi refuses to play with you.":"")});
		}

		function passVolleyTo(playerName) {
			var playerCatching = null;
			for (player in cast(data.volleyBall.chars, Array<Dynamic>)) if (player.name == playerName) playerCatching = player;

			temp.volleyBallListener("startPass");
			var strat = data.volleyBall.strat;

			/* Print status */
			strat._playerCatching = playerCatching; /* Ref hack */
			temp.volleyBallListener("resolvedCatcher");

			/* Figure out who was suppose to catch the ball to see if rules were followed and what step of the strat we're on. */
			var followedRules = true;
			if (strat.nextPlayer != null) followedRules = strat.nextPlayer == playerCatching.name;
			var turnEnding = !followedRules || strat.nextPlayer == strat.c.name;

			strat._followedRules = followedRules; /* Last minute I realized you'll need to see these vars */
			strat._turnEnding = turnEnding; /* So I shoved them into the struct, aka ref hack */
			temp.volleyBallListener("resolvedPass");

			/* Do what needs to happen next */
			if (!followedRules || turnEnding) {
				var success:Bool;
				if (strat.hitOrSpike == "hit") success = roll(playerCatching.hit) else success = roll(playerCatching.spike);
				strat._success = success; /* Ref hack */
				temp.volleyBallListener("resolvedChances");

				if (success) data.volleyBall.pointTeam++;
				else data.volleyBall.pointOpponent++;

				/* Setup for the next round */
				clearChoices();
				addChoice("Next round.", volleyballGame);
				temp.volleyBallListener("afterRound");
			} else {
				/* Pass again */
				temp.volleyBallListener("beforePassChain");
				strat.nextPlayer = strat.c.name;
				passVolleyTo(strat.c.name);
				temp.volleyBallListener("afterPassChain");
			}
		}

		function startTurn() {
			/* Check if the game is over */
			if (data.volleyBall.pointTeam >= data.volleyBall.maxPoints || data.volleyBall.pointOpponent >= data.volleyBall.maxPoints) {
				endGame();
				return;
			}

			temp.volleyBallListener("startTurn");

			/* Generate a strat */
			var char1 = pickOne(data.volleyBall.chars);
			var char2 = pickOne(data.volleyBall.chars, [char1]);

			var playerChar:Dynamic = {};
			playerChar.name = data.playerName;

			var strat:Dynamic = {};
			data.volleyBall.strat = strat;
			if (roll(0.5)) {
				strat.a = playerChar;
				strat.b = char1;
				strat.c = char2;
				strat.nextPlayer = strat.b.name;
			} else {
				strat.a = char1;
				strat.b = playerChar;
				strat.c = char2;
				strat.nextPlayer = strat.c.name;
			}

			if (roll(0.5)) strat.hitOrSpike = "hit" else strat.hitOrSpike = "spike";
			temp.volleyBallListener("afterStratGen");

			/* Execute strat */
			var toExclude = [strat.a, strat.b, strat.c, playerChar];
			if (playerChar != strat.a) toExclude.push(strat.b);

			for (i in 0...2) {
				var player = pickOne(data.volleyBall.chars, toExclude);
				addChoice("Pass to "+player.name+".", passVolleyTo.bind(player.name));
				toExclude.push(player);
			}
			if (playerChar == strat.a) addChoice("Pass to "+strat.b.name+".", passVolleyTo.bind(strat.b.name));
			if (playerChar == strat.b) addChoice("Pass to "+strat.c.name+".", passVolleyTo.bind(strat.c.name));

			temp.volleyBallListener("choice");
		}

		function startGame() {
			data.volleyBall = {};
			data.volleyBall.chars = [];
			data.volleyBall.pointTeam = 0;
			data.volleyBall.pointOpponent = 0;
			data.volleyBall.maxPoints = 5;

			function makeChar(name:String, pass:Float, spike:Float, hit:Float) {
				var c:Dynamic = {};
				c.name = name;
				c.pass = pass;
				c.spike = spike;
				c.hit = hit;
				return c;
			}

			data.volleyBall.chars.push(makeChar("Panda", .75, .30, .80));
			data.volleyBall.chars.push(makeChar("Gecko", .20, .30, 1));
			data.volleyBall.chars.push(makeChar("Raven", .50, 1, .20));
			data.volleyBall.chars.push(makeChar("Big Boi", 1, 1, .30));
			data.volleyBall.chars.push(makeChar("Captain", 1, .60, .60));

			startTurn();
		}

		/* Start it all up */
		if (data.volleyBall == null) startGame() else startTurn();
	}

	public static function lilacGame():Void {
		function startGame() {
			clear();
			data.inLilacGame = true;
			data.lilacGame = {};
			var g = data.lilacGame;
			g.timer = 40;
			g.pos = new Point();
			g.herPos = new Point();
			if (Math.random() > 0.5) g.herPos.setTo(-2, 2) else g.herPos.setTo(3, -1);

			append("You grab a net and get ready, then subsequently get set, then even more subsequently GO!\n\nTIMER: 40");
		}

		// Probably move these next 3 functions out //
		// If you want a low chance like 10%, roll(0.1) //
		function roll(chance:Float):Bool {
			return Math.random() < chance;
		}

		function rollAndImprove(baseChance:Float, name:String, improveBy:Float):Bool {
			if (data.prngMap == null) data.prngMap = new Map<String, Float>();
			var map:Map<String, Float> = data.prngMap;
			if (!map.exists(name)) map.set(name, 0);

			var chance = baseChance+map.get(name);
			var payout = roll(chance);

			if (payout) map.set(name, 0)
			else map.set(name, map.get(name)+improveBy);

			return payout;
		}

		function capitalize(s:String):String {
			return s.charAt(0).toUpperCase() + s.substring(1, s.length);
		}

		function endGame() {
			data.lilacAttempts++;
			data.lilacGame = null;
		}

		function timeout() {
			clear();

			append("TIMER: 0.\n\nYou ran out of time!");

			var word = pickOne([
				"Dangit.",
				"Fuckin heck sakes!",
				"Darn.",
				"Shoot.",
				"Curses."
			]);

			addChoice(word, elevator.bind("net game"));

			endGame();
		}

		function miss() {
			clear();
			var g = data.lilacGame;

			var wasClose = Point.distance(g.pos, g.herPos) < 2;

			append("You miss her ");
			if (wasClose) {
				append(pickOne([
						"by a teeny tiny margin.",
						"by a hair. One of her long, sleek horsehairs, to be precise."
				]));
			} else {
				append(pickOne([
						"by a long shot.",
						"so badly that you don't even hit the water, instead accidentally smacking a spectating kid in the face.",
						"by quite a bit."
				]));
			}

			addChoice("Next.", elevator.bind("net game"));
			endGame();
		}

		function win() {
			clear();

			append("BAM! Caught her!");
			addChoice("Claim my prize.", lilac.bind("main"));

			endGame();
		}

		function decreaseTimer() {
			var g = data.lilacGame;
			if (Math.random() > 0.5) g.timer -= 7;
			else if (Math.random() > 0.2) g.timer -= 6;
			else g.timer -= 5;
		}

		function giveHint() {
			var g = data.lilacGame;

			clearText();
			append("<!b>TIMER: " + g.timer + "<!b>\n\n");

			var showHint = rollAndImprove(0.7, "lilac", 0.1);
			if (!showHint) return;

			var axisForHint:String = "nil";
			var distanceOff:Float = -1;

			if (g.xOff == 0) axisForHint = "y"
			else if (g.yOff == 0) axisForHint = "x"
			else axisForHint = roll(0.5) ? "x" : "y";

			if (axisForHint == "x") distanceOff = Math.abs(g.xOff);
			if (axisForHint == "y") distanceOff = Math.abs(g.yOff);

			var directionNeeded = "NONE";
			if (axisForHint == "x" && g.pos.x < g.herPos.x) directionNeeded = "right";
			if (axisForHint == "x" && g.pos.x > g.herPos.x) directionNeeded = "left";
			if (axisForHint == "y" && g.pos.y < g.herPos.y) directionNeeded = "down";
			if (axisForHint == "y" && g.pos.y > g.herPos.y) directionNeeded = "up";

			var directionOppose = "NONE";
			if (directionNeeded == "right") directionOppose = "left";
			if (directionNeeded == "left") directionOppose = "right";
			if (directionNeeded == "up") directionOppose = "down";
			if (directionNeeded == "down") directionOppose = "up";

			var lines = [];

			// Very far (3+)
			lines.push([
				"\"Way way wayyy #dirNeed#!\" says a petulant tiger.",
				"\"Daaaad, they're way too far to the #dirOpp#...\" says a pouty little bear in rainbow pajamas.\n\nDad shakes his head. \"I know, honey. I know.\"",
				"Two gazelle herms giggle at you from the back of the crowd. \"Do#gender2# even realize how far left #gender3#....\"",
				"\"Oh my god,\" says a chubby stubble-faced pig with two armfuls of prizes. \"#gender1#. You're a player, yah? So learn how to play. You're <!i>way<!i> too far down.\""
			]);

			// Far (2)
			lines.push([
				"A suited cat judges your aim, eyebrow cocked. \"Your net would find better purchase #dirNeed#ward.\"",
				"\"Way #dirNeed#,\" says a butch gator girl.",
				"\"You'll need to be a great deal farther #dirNeed# before you find any luck in them waters, sonny,\" says a beaver with a missing eye, pulling on a sweetgrass cigarette.",
				"The announcer sneaks over to whisper: \"I'm not supposed to help, but, ah, quite a bit to the #dirNeed#...\"",
				"A group of dudes shit-talk your net skills, saying stuff like \"If they move it any further #dirOpp# the fucker's gonna enter low orbit...\"", // Todo, maybe remove orbit
				"A lanky tatoooed jackrabbit teen barks \"#capDirNeed#!\"",
				"\"#capDirNeed#, #dirNeed#, #dirNeed#...\" sings a giraffe with a flower behind her ear. \"Oh, #dirNeed#, #dirNeed#, #dirNeed#...\"",
				"Two concerned antelopes assure you that a few nudges #dirNeed# would help."
			]);

			// Close (1)
			lines.push([
				"\"Just a wee bit more #dirNeed#ish...\" an old doberman growls.",
				"\"A little to the #dirNeed#,\" says a leopard girl standing on her tippy toes to peek at your net.",
				"\"Scoot to the #dirNeed# some,\" says a boar with trash breath.",
				"\"#capDirNeed#.\"",
				"\"Just a BIT #dirNeed#,\" says a sandy, twitchy gecko. \"Just a TINY.... little... BIT.\"",
				"\"A bit of movement, you should consider, to the #dirNeed#ward,\" says a pink, iridescent-winged nymph with a melodious accent.",
				"\"#capDirNeed#wards... by the way I love you...\"\n\nWhoever said that has been swallowed by the crowd."
			]);

			// Perfect (0)
			lines.push([
				"A burly elephant in the back shouts \"NOW!\"",
				"A little kangaroo is bouncing around like crazy, cheering you on. \"Go #name#! Go #name#! You can do it!\""
			]);

			if (distanceOff > 3) distanceOff = 3;

			// No longer works, was for Close (1)
			// "\"To the stars,\" says a coyote with a rolled-up sign, pointing skyward. His big glassy eyes are swimming with constellations.\n\nYou guess he means go upward."

			var interp:Dynamic = {};
			interp.name = data.playerName;
			interp.dirNeed = directionNeeded;
			interp.dirOpp = directionOppose;
			interp.capDirNeed = capitalize(interp.dirNeed);
			interp.capDirOpp = capitalize(interp.dirOpp);
			interp.gender1 = pickByGender("Dude", "Listen, woman", data.playerName);
			interp.gender2 = pickByGender("es he", "es she", " they");
			interp.gender3 = pickByGender("he is", "she is", " they are");

			append(interpString(pickOne(lines[Std.int(lines.length-distanceOff-1)]), interp));
			append("\n");

		}

		function move(xMove, yMove) {
			var g:Dynamic = data.lilacGame;
			decreaseTimer(); 
			print("Was at "+g.pos+" ("+Point.distance(g.pos,g.herPos)+" off)");
			g.pos.x += xMove;
			g.pos.y += yMove;
			g.xOff = g.pos.x - g.herPos.x;
			g.yOff = g.pos.y - g.herPos.y;
			print("Now at "+g.pos+" ("+Point.distance(g.pos, g.herPos)+" off)");
			print("She's at "+g.herPos);

			if (g.timer <= 0) timeout() else giveHint();
		}

		function drop() {
			var g = data.lilacGame;

			if (roll(0.5)) append("\n\nYou bring the net down with two hands.")
			else append("\n\nYou swing the net down with a mighty FWISH.");
			append("\n\n");

			if (g.pos.equals(g.herPos)) win() else miss();
		}

		if (data.lilacGame == null) startGame();

		addChoice("Up.", move.bind(0, -1));
		addChoice("Down.", move.bind(0, 1));
		addChoice("Left.", move.bind(-1, 0));
		addChoice("Right.", move.bind(1, 0));
		addChoice("Drop!", drop);
	}

	public static function lilac(seg:String):Void {
		clear();
		saveCheckpoint("Septricas.lilac('"+seg+"');");

		if (seg == "main") {
			data.inLilacGame = false;
			data.lilacDone = true;

			append("The announcer helps you haul her out, net-links digging into her curvy hide, puffing it out a little inbetween. She lays still as you pull her from the water, submissive except that she's covering her little breasts with one hand and her not-so-little cuntlips with the other.\n\n\"WEEEEEE'VE GOT A WINNER!\" The announcer shouts, and drops his mic to run over and help you. \"Big fan,\" he says, awkwardly attempting to shake your hand while you both haul the girl from the water.\n\nShe hits the tent's dusky plank floor with a thud, butt-down, dripping with pit-patters.\n\nThe announcer scribbles on a little notebook. \"Right, that's Lilac caught... I think you'll love her, "+pickByGender("sir.", "ma'am.", "she's got a real quiet country charm...")+"\"\n\nPasserby reach through the net to grope her body like tourists rubbing a Buddha belly, casually, treating her as an inanimate prize. Lilac gives in completely to them, lifting her chin so the strangers can run their fingers over her exposed neck, squeaking a thank-you when a drunk boar slaps her ass— but even still she keeps her hands where they are.\n\n\"Just let me get your goldfish a baggie here...\" the announcer says, hurrying into the back.\"");

			addChoice("Shoo the gropers away from my prize.", lilac.bind("lilacnext2"));
		}

		if (seg == "lilacnext2") {
			append("The small crowd fucks off as you near, no shooing required; even the rudest among them understand that property is property, once claimed. And you do claim her.\n\nYou untangle the net with precise and gentle movements, pulling her long hair from its knottage among the net-links. You're close enough to hear her quick breathing.\n\n\"I've... I've never been drowned before...\" she whispers.\n\nThe announcer busts back out with a clear plastic baggie about the size of a beachball filled to spilling with water. \"You fish em out, we bag em up!\" he says, doing a little jig then stepping up to Lilac. \"Hands and knees, hun, and head down~!\"");

			addChoice("Give her a loving, reassuring pet on the head.", lilac.bind("lilacnext3"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext3") {
			append("Lilac reluctantly pulls her hands off, revealing two plump booblets and a particularly protrusive pussy. She keeps her head down, eyes following the droplets falling from the tip of her hair. You give her head a loving, reassuring stroke, working your fingers through it.\n\nThe announcer adds his own hand beside yours to push her face down into the opening of the plastic bag, cool water lapping at her features. In a moment she's submerged\n\nYou step back and let him zip-tie it tight around her neck. Then, he sits her up (she can't move so well with such weight hanging on her head) and gives a little flourish.\n\n\"Your very own!\" he says, casually stroking himself as he looks down at Lilac holding her breath with puffy cheeks.");

			addChoice("Tease her.", lilac.bind("lilacnext4"));
		}

		if (seg == "lilacnext4") {
			append("You tap on her bubble and take a few big breaths of fresh air in front of her; for some reason, instead of rising to your taunts, she blushes, apparently embarassed to drown in front of you.\n\nThe red in her cheeks soon gives way to blue, streams of tiny bubbles rising from her horse snout. She starts squirming, grinding her thighs and feet together as she tries to fight the urge to breathe~");

			addChoice("Choke her.", lilac.bind("lilacnext5"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext5") {
			append("You shoot your hand out and close it tight around her throat just as her squirms grow frantic and she's about to break; a moment later her mouth opens, water rushing past her lips, but thanks to your swift grip she can't even start drowning until you allow her to.\n\nYou slip your free hand down your pants and stroke yourself with a few fingers, lazily, absent-minded, focused mostly on the weakening flicks of her sleek-haired horsetail.");

			addChoice("Alright, let her go.", lilac.bind("lilacnext6"));
		}

		if (seg == "lilacnext6") {
			append("The instant your hand leaves her neck a depth-charge bubble explosion rocks the baggie— she somehow overcomes the urge to scrabble at it as she gasps plastic and water, though her fingers twitch a little. Her drooping eyes lock on the twilit sky, hair floating in weightless strands around her.\n\nAnd yet, slowly, motor control waterlogged, she spreads her legs for you.");

			addChoice("Rub her face~", lilac.bind("lilacnext7"));
		}

		if (seg == "lilacnext7") {
			append("You rub the baggie from both sides, massaging her blue cheeks in wide circles, squishing them up and giving her a fat-lipped fishface. Even as she drowns she raises an eyebrow at you.\n\nYou drag a thumb across her forehead Lion King style, the baggy distorting and crinkling under your fingers, her long hair slinking around in the gentle currents of your movements.\n\nNow that you're so near, your "+pickByGenitals("cock", "stomach", "cock")+" brushes against her thighs. That sends her shivering out of control; her last dregs of composure leak out as she starts hyperventilating water, vaccuum-sealing the plastic to her panicked face as you caress it.");

			addChoice("Keep the baggie off her mouth until she's slurped all the water up~", lilac.bind("lilacnext8"));
		}

		if (seg == "lilacnext8") {
			append("Lest Lilac technically stop drowning you yank the plastic back from her face, twisting your fist to keep it taut, running a caress up the back of her head to push all the water out in front of her mouth and nose. She swallows and snorts gulp after gulp, making deep gagging coughs that fairgoers can hear from four booths down, her stomach beginning to bloat out fat between your legs...\n\nA thickening crowd snickers from afar:\n\n<!i>Such a tiny chest!\n\nOh my god, you can hear her gagging from here... show off~\n\nMmm... when do you think she'll start thrashing~?<!i>");

			addChoice("Next.", lilac.bind("lilacnext9"));
		}

		if (seg == "lilacnext9") {
			append("You scooch closer, lowering your hips such that your "+pickByGenitals("cock", "stomach", "cock")+" squishes up against her bloated heaving belly. Lovingly you wrap your free arm around her, the other still keeping the bag away from her drowned-out face (big blue puffy cheeks, half-closed rolled-up eyes, two nostrils leaking trails of tiny bubbles) and lower your head to her chest so you can spend a moment listening to her quick little heartbeat.\n\nSomeone in the crowd whispers \"Yes! >:3\" as she finally starts to struggle under your weight with instinctual panic, choking hard, spitting up water all over her face. Her limbs thrash around underneath you, way too weak to actually loosen your grip.");

			addChoice("Push on her stomach.", lilac.bind("lilacnext10"), {kinks: ["Vomit"]});
			addChoice("Grind on her face through the baggie.", lilac.bind("grind"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext10") {
			data.lilacPuked = true;
			append("You drive the heel of your palm into her stomach, pushing it mercilessly flat. The poor horse has no choice but to puke cloudy water up all over her face, a few in the crowd stifling laughter as she gurgles so pathetically; still, she chokes most of it right back down, either in an attempt to make you proud or simply because her body is desperate for air.\n\nOnce the water's almost back down to nothing you palm her smooth, soft stomach even harder. This time she doubles over with a series of disgusting glrrrk-chrlp slurp-gags, as much water squirting from her nostrils as her mouth with each wretched regurgitation.");

			addChoice("Grind on her face through the baggie.", lilac.bind("grind"));
		}

		if (seg == "grind") {
			var foo:String = "No matter how much pressure you put on her stomach";
			if (data.lilacPuked) foo = "No matter how many times you force her to vomit her progress up";

			append("You reverse polarity and slip Lilac's head between your thighs, straddling her face. You expect the water to feel cool against your crotch but instead its pleasantly warm, probably from so many trips up and down her hot, panicked throat.\n\nYou bring both hips and hands down on her in a rhythm, bongo-drumming her stomach, bouncing your nuts happily on her anguished expression. Gushes of your "+pickByGenitals("pre", "cuntjuice", "pre")+" spew out over her gulping throat. "+foo+" she just swallows faster and harder, numb toes twitching as her kicks slowly fade to spastic thigh-clenches.");

			addChoice("Did I type 'grind'? I meant 'hump brutally hard.'", lilac.bind("lilacnext11"));
		}

		if (seg == "lilacnext11") {
			temp.g = pickByGenitals("cock", "cunt", "cock");
			temp.g2 = pickByGenitals("nuts", "cuntlips", "nuts");
			temp.g3 = pickByGenitals("cock", "pussy", "cock");

			append("You start dry humping her— more like wet humping, since every time you slam your "+temp.g+" into her face a little bit of water squirts from the baggie, slipperizing everything— bouncing her head against the ground with only an pitiful inch or two of liquid cushion left in the baggy.\n\nFinally you stop pushing her stomach, keeping your hips pressed down hard on her face for the last little bit, forcing her to chug the remaining water. The poor horse is on the edge of unconsciousness, almost totally limp; the only part of her still occassionally twitching is her guzzling throat.\n\nWhile she can still feel it you give her skull a couple more fierce humps, your "+temp.g2+" throbbing as they bang against her forehead, "+temp.g3+" running slick along the baggy.");

			addChoice("Cum.", lilac.bind("lilacnext12"), {kinks: ["Snuff"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext12") {
			cumEffect();
			append("You drag your "+pickByGenitals("cockhead", "cunt", "cockhead")+" over her blank expression, riding out the last few feeble gag-gulps as she sucks pointlessly at damp plastic, clearly eager to drown as cutely as she can for you. Finally, at the exact moment of her death, you cum on her slackened face, "+pickByGenitals("thick globs of "+(isActive("Mood Ring")?getMood("You")+"jizz":"white")+" running over the plastic", "a few beads of juice pattering onto the plastic as you shiver", "thick globs of white and a few beads of juice pattering onto the plastic as you shiver")+".\n\nIn the afterglow you take some time to admire her drowned features, warped and almost oiled-looking under the tight plastic "+pickByGenitals("cum", "juice", "cum")+"-slick baggy.\n\nAfter a couple whoops and smatterings of applause the crowd disperses, leaving you alone with Lilac's corpse.");

			addChoice("Unzip her and check out the rest of the fairgrounds.", lilac.bind("lilacnext13"));
		}

		if (seg == "lilacnext13") {
			append("You unzip the tie around Lilac's neck and slip the bag from her face with one fluid pull. You haul your prize over your shoulder and head off into the crowd.\n\nYou pass by curious faces, lit-up booths... then you feel a gentle touch on your shoulder.\n\nIt's Lilac. She blushes, looking down at her corpse's suffocated ahegao. \"I was pretty loud, wasn't I...?\"\n\nTogether you lift her corpse and haul it into a dumpster off on the sidelines. You're about to throw the bag in too, and then she grabs your hand. \"Wait...\" she says. \"I was gonna keep that... you know, first time and all.\"\n\nYou both walk the fair together for a while until you come upon an empty apple-bobbing booth. She eyes the barrelful of glittering water with shy excitement. \"Again?\"");

			addChoice("Shove her under.", lilac.bind("lilacnext14"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext14") {
			append("Now that she's a little more comfortable, you think she'll be just fine with you grabbing her by the throat and shoving her underwater face-up.\n\n\"Hey, buddy,\" says the fat booth operator— obviously doesn't play his own game so often— \"she's sposed to try and fish em out with her mouth, and then... then you're sposed to... well, you know what, she looks like she's having fun, so carry on.\"\n\nYou wrap your free hand around her snout, closing off her big horsenose and her toothy horsegrin. Her hair is webbing out underwater, mingling with the apples.");

			addChoice("Grind & grope.", lilac.bind("lilacnext15"));
		}

		if (seg == "lilacnext15") {
			append("You grind against her, semi-soft cock hardening as it squishes up between her thighs, keeping your grip firm over her airways. Already you can tell she's going fuzzy with oxygen loss, eyes unfocused, body light and complacent in your arms. You reach down and grope her little tits with callous voracity, pinching her puffy nips between the bridges of your fingers— she breaks from her reverie and gives a bubbly squeak, blushing up at you from beneath the ripples.");

			addChoice("Release.", lilac.bind("lilacnext16"), {kinks: ["Piss"]});
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext16") {
			append("Just as she squeaks you take your hand off her snout and let her gasp water on the inhale. She coughs and gags hard at the rush of cold down her throat, chest rising and falling quick now under your gropings, her esophagus a-bulge with each mouthful she swallows. It's going much quicker than her first drowning; the thought occurs to you that she might be filling her lungs so fast on purpose...\n\nEither way she still can't control her involuntary strugglings once they crank back into motion; she's jerking her head up pointlessly to try and get it above-water, pussy leaking a few golden squirts of panic-pee.");

			addChoice("Fingerfuck her.", lilac.bind("lilacnext17"));
		}

		if (seg == "lilacnext17") {
			append("You press a few fingertips to her fat, dribbling vulva and lazily drive three inside for starters; surprisingly she doesn't make a peep, her face frozen in a shock of ecstasy, half-obscured by apples as they bump gently against her puffy, discolored cheeks.\n\nYou crank into a brutal fingerfuck, her little breasts bouncing as you ram down to the knuckle over and over, pushing her whole body deeper into the barrel, her pitiful little bubble-burst squeals barely audible above-water. When you're deepest her thighs tend to clench on your hand, as if trying to keep it inside.\n\nSince you didn't really take the bait the first time, she spreads her legs once more for you.");

			if (data.hasCock) {
				addChoice("Fuck her.", lilac.bind("lilaccockfuck"));
			}
			if (data.hasCunt) {
				addChoice("Scissor her.", lilac.bind("lilaccuntfuck"));
			}
			if (data.hasBoth) {
				addChoice("Fuck her.", lilac.bind("lilaccockfuck"));
				addChoice("Scissor her.", lilac.bind("lilaccuntfuck"));
			}

			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilaccockfuck") {
			data.lilacCockFucked = true;
			append("Though the angle is a little awkward you manage to straddle her hips and push your head up against her gaped cunt. She really is quite small for sixteen, so it's pretty easy to haul her legs up and cram every last inch of cock inside her— your head even presses against the entrance to her womb.\n\nRight on the time the thrashing starts up again, her spastic twitches making for a wonderful cockmassage as you plough the last bits of air out of her and watch her desperately inhale water face-to-face.\n\nYou scoop up all her errant floating locks and twist them into a fist to keep her head firmly underwater now that she's lost all semblance of control over herself, slamming in as far as you can go with one last titanic thrust. You watch the stream of bubbles die as warm "+(isActive("Mood Ring")?getMood("You"):"")+"cum dribbles out over her inner thighs.");
			addChoice("Finish her off with another stomach-push.", lilac.bind("lilacnext18"));
		}

		if (seg == "lilaccuntfuck") {
			data.lilacCockFucked = false;
			append("Though the angle is a little awkward you manage to straddle her hips and push your cunt up against her gaped one. She really is quite small for sixteen, so it's pretty easy to haul her legs up and keep them wide open while you grind yourself against her, your lips interfolding, slipping a few fingers inside her now and again.\n\nRight on the time her thrashing restarts, her crotch grinding spastically against your own, making for a wonderful massage. You lean over, nose almost touching the ripples, and watch her desperately inhale water.\n\nYou scoop up all her errant floating locks and twist them into a fist to keep her head firmly underwater now that she's lost all semblance of control over herself, bouncing your crotch against hers until you both tense and quiver in another orgasm.");

			addChoice("Finish her off with another stomach-push.", lilac.bind("lilacnext18"));
		}

		if (seg == "lilacnext18") {
			var foo:String = "nil";
			var bar:String = "nil";
			var baz:String = "nil";
			if (!data.lilacCockFucked) {
				foo = "glistening pussyjuice running over the flat stretch of hide above her crotch.";
				bar = "in your arms.";
				baz = "Stroke her.";
			} else {
				foo = "groping your softening cock through her flesh, pushing a little splurt of "+(isActive("Mood Ring")?getMood("You"):"")+"cum over your nuts.";
				bar = "on your cock.";
				baz = "Pull out.";
			}

			append("You push your palm to Lilac's lower stomach and force every last bubble from her lungs, "+foo+" With one last full-body shiver she dies for the second time "+bar+"\n\nNow that her face is unmarred by plastic you can appreciate its finer details past the glassy water's surface; the way her eyelids still twitch over the whites, the way her lips get all puffy (probably from sucking all that water up so hard), the way every feature is either tipped or diffussed with a deep regal blue...");

			addChoice(baz, lilac.bind("lilacnext19"));
		}

		if (seg == "lilacnext19") {
			if (!data.lilacCockFucked) {
				temp.a = "Lilac's bladder empties post-mortem, piss gushing";
				temp.b = "piss";
				temp.c = "her corpse's acrid leakage, snorting and gagging noisily as it stings";
			} else {
				temp.a = "Cum gushes";
				temp.b = "cum";
				temp.c = "your "+(isActive("Mood Ring")?getMood("You"):"")+"cum, snorting and gagging noisily as it clogs up";
			}

			append("You let your grip on her hair slacken, pulling your hands slow through the apples as her silky strands unfurl. You bring your fingers to her head, running your thumb over her so-recently-gulping throat...\n\n"+temp.a+" from her cunny, spilling out over— her own face.\n\nLilac's already respawned and dived in to suck the "+temp.b+" from her corpse, panting, smushing a couple fingers up between her brand-new pussylips. \"Why I didn't try this sooner...\" she says, muffled in her still-warm "+temp.b+"-soaked folds. She's so eager to drown more that she even starts inhaling "+temp.c+" her airways.");

			addChoice("Next.", lilac.bind("lilacnext20"));
		}

		if (seg == "lilacnext20") {
			append("The more voracious her inhalations the further up her corpse slips, until finally the whole thing falls into the barrel with a great <!i>plunk<!i>. Displaced apples thud onto the ground and roll away as she dives in head-first, desperate to finish what she's started, and then... she's stuck.\n\nAss-up, legs waggling helplessly, Lilac makes pitiful attempts to tip the barrel over or wiggle her way out backwards; nothing works. You shrug and decide to go for round three, reaching underwater to shove her"+(data.lilacCockFucked?" cum-filled":"")+" tummy flat once more, listening close to her little gurgling coughs, her gags, every instrument of her drowning body's symphony.");

			addChoice("Wind down.", lilac.bind("lilacnext21"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext21") {
			append("Eventually a line forms behind you, mostly pairs of confident drowners and shy drownees. After a good long tertiary drowning you haul Lilac from the barrel dripping wet, half-conscious, and give her some time to cough the water up while you both cuddle on a cushioned bench with a water fountain next to it.\n\nThe dusk never gets any darker, you notice; it's forever stuck in a purple post-sunset glow. You wrap your arm around Lilac's wet, shivering body and warm her up, dragging a thumb in slow circles over her hard nipples. \"You know,\" she says, \"that small-town feeling? Where everything's close and familiar, and everyone knows each other? Man, I feel that here.\"");

			addChoice("Mhm?", lilac.bind("lilacnext22"));
		}

		if (seg == "lilacnext22") {
			append("Her eyes wander over the warm-lit tents, to the sky, connecting the dots of the star-smatter on the eastern horizon. \"Not just on this floor, I mean, it was great, getting drowned over and over while you "+(data.lilacCockFucked?"fucked the heck outta me":"scissored my timbers")+", don't get me wrong...\"\n\nShe snakes a hand between her thighs and gently rubs herself, reminiscing, glancing over occasionally to make sure she isn't boring you. \"But I mean the City. I lived on the countryside for something like forty, fifty years... tilling fields, swimming in a pond, stupefied in my boredom, thinking, oh no, they do horrible things there, I'd never go there...\"\n\nShe kisses you.\n\n\"Yet here I am.\"");

			addChoice("A city full of death and filth and junk does seem pretty horrible at first glance, yes.", lilac.bind("city a"));
			addChoice("I guess half a century of farmwork will make anything seem interesting.", lilac.bind("city b"));
		}

		if (seg == "city a") {
			append("\"It really does,\" she pouts. \"And it's a shame... cause I could've been having this much fun that whole time!\"");
			addChoice("Wanna smooch?", lilac.bind("lilacnext23"));
		}

		if (seg == "city b") {
			append("She breaks out into giggles, snorting a couple times by accident.\n\n\"Ah! Sorry... "+(!data.lilacCockFucked?"pee":"cum")+" in the nostrils...\"");
			addChoice("Wanna smooch?", lilac.bind("lilacnext23"));
		}

		if (seg == "lilacnext23") {
			append("She blushes a little. \"For some reason I'm perfectly okay with"+(data.lilacCockFucked?"slurping your cum and":"")+" letting you drown me, but when it comes to— er— romance, I get all... nervous. It's like...\"");

			addChoice("Interrupt her with smooch time.", lilac.bind("interrupt"));
			addChoice("Go on.", lilac.bind("lilacnext24"));
		}

		if (seg == "interrupt") {
			append("You wrap your hands around the back of her head and pull her into a big fat smooch, muffling the next couple of words. She hover-hands for a bit and then hugs you back, tongue pressing timidly against your own.");

			addChoice("Next.", lilac.bind("lilacnext25"));
		}

		if (seg == "lilacnext24") {
			append("\"It's like... a curse. It's the same reason I was locked in my routine for so many decades. It's anxiety.\"\n\nHer hands ball into fists. \"Well, no more!\"\n\nShe dives forward, wrapping both arms around you, and kisses you full on the mouth with eager tongue-wrestles and everything, her snout blowing hot little puffs of air over your face as her heartbeat quickens. Is she still out of breath...?");

			addChoice("Next.", lilac.bind("lilacnext25"));
		}

		if (seg == "lilacnext25") {
			append("She reaches down and drags a few fingers along her pussy, getting a little worked up. Her free hand "+pickByGenitals("wanders up and down your shaft with gentle tugs.", "wanders over and does the same to your own.", "wanders over and squeezes your nuts.")+"\n\nMid-kiss, her being so thin and small, you realize that you could actually suck the whole end of her snout if you tried, nose and all... that gives you a really wicked idea.");

			addChoice("DROWNSMOOCH!!!", lilac.bind("d smooch"));
			addChoice("... Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "d smooch") {
			append("You break the kiss for a moment and suck a full mouthful of water from the nearby fountain, cheeks bulging out squirrelish. Lilac's fingers grind even harder yet on her pussy as she realizes what you're about to do. \"Please,\" she says, and nudges your mouth with her nose.\n\nYou take her snout past your lips and submerge her nose and maw in your mouthful of water, a hand on the back of her head, fingers woven into her hair to keep it firmly in place while you quite literally suck her face, forcing water down her nostrils, swallowing her bubbles...\n\nShe gives in completely to you, drowning hard already, gagging into your mouth; once she finally manages to snort and suck all the water up you pull away and fill it right back up, one hand over her airways in the meantime.\n\nAny slight disappointment she might've had about not being drowned all the way after getting stuck in the barrel is clearly fueling her now; while she still has control of her body she's furiously "+pickByGenitals("jacking you off", "fingerbanging you", "jacking you off")+", pushing her maw deeper into your mouth, eager to die for you.");

			addChoice("Wind down for real this time.", lilac.bind("lilacnext26"));
		}

		if (seg == "lilacnext26") {
			append("After a long, romantic drownsmooch you give her a gentle peck on her blue cheek and take your leave before she respawns. As a goodbye you "+pickByGenitals("cum on her corpse", "piss on her corpse", "cum on her corpse")+" in the shape of a heart, knowing she'll dutifully lick it up.");

			addChoice("Get back on the elevator.", lilac.bind("lilacnext27"));
		}

		if (seg == "lilacnext27") {
			append("You turn around, eyes on the open elevator doors, then—\n\n\"HEY!\"");

			addChoice("Look up.", lilac.bind("lilaclookup"));
			addChoice("Look down.", lilac.bind("lilaclookdown"));
			addChoice("Look left.", lilac.bind("lilaclookleft"));
			addChoice("Look right.", lilac.bind("lilaclookright"));
		}

		if (seg == "lilaclookup") {
			data.lilacLookedUp = true;
			append("The sky is about as purple as Lilac's face.");

			if (!data.lilacLookedUp) addChoice("Look up.", lilac.bind("lilaclookup"));
			addChoice("Look down.", lilac.bind("lilaclookdown"));
			if (!data.lilacLookedLeft) addChoice("Look left.", lilac.bind("lilaclookleft"));
			if (!data.lilacLookedRight) addChoice("Look right.", lilac.bind("lilaclookright"));
		}

		if (seg == "lilaclookdown") {
			append("It's a mini version of Lilac, long-haired with a shock of purple and everything. She looks about nine. ");
			if (!onFA()) append("Remarkably, though, the boobs aren't scaled down at all. They actually look somewhat fitting for the size of her body now.");

			addChoice("Oh my god, Lilac, did I smooch you back to childhood?", lilac.bind("lilacnext28"));
		}

		if (seg == "lilaclookleft") {
			data.lilacLookedLeft = true;
			append("There's a little group of cubs in the distance, hopping around in mermaid costumes.");

			if (!data.lilacLookedUp) addChoice("Look up.", lilac.bind("lilaclookup"));
			addChoice("Look down.", lilac.bind("lilaclookdown"));
			if (!data.lilacLookedLeft) addChoice("Look left.", lilac.bind("lilaclookleft"));
			if (!data.lilacLookedRight) addChoice("Look right.", lilac.bind("lilaclookright"));
		}

		if (seg == "lilaclookright") {
			data.lilacLookedRight = true;
			append("There's a bemused fish leaning against a tent far away, shaking his head at all these drowning fanatics.");

			if (!data.lilacLookedUp) addChoice("Look up.", lilac.bind("lilaclookup"));
			addChoice("Look down.", lilac.bind("lilaclookdown"));
			if (!data.lilacLookedLeft) addChoice("Look left.", lilac.bind("lilaclookleft"));
			if (!data.lilacLookedRight) addChoice("Look right.", lilac.bind("lilaclookright"));
		}

		if (seg == "lilacnext28") {
			append("\"No, dummy. That horse you just drowned and "+pickByGenitals("came", "pissed", "came")+" on? <!i>I'm her sister.<!i>\"");

			addChoice("Oh, so I haven't drowned you yet~?", lilac.bind("lilacnext29"), {kinks: ["Cub"], faCensor: true});

			if (onFA()) {
				append("\n\n\"Don\'t even try to fuck with me. I can see the [FurAffinity Censor] above your head... if you take even one more look at my big sister I'll do something sexual and trigger that shit. The admins will kick you out for child porn!!!\"\n\nShe doesn\'t really seem to understand how your censor works. You're about to explain it to her but she starts moving her hand down threateningly so you run away.");
				addChoice("Get back on the elevator.", elevator.bind("main"));
			} else {
				addChoice("Oh. Okay. Well. I'll be going now.", elevator.bind("main"));
			}
		}

		if (seg == "lilacnext29") {
			append("\"Not my thing buddy,\" she says, pushing past you. \"Lilac! LI<!i>LAAAAAAAAAC!<!i> IT DOESN'T TAKE THAT LONG TO RESPAWN!\"\n\nLilac pokes her head out from behind a tent, not looking at her sister. \"Lily...\"");

			addChoice("Ah, flower names. Cute.", lilac.bind("lilacnext30"));
		}

		if (seg == "lilacnext30") {
			append("\"Keep talking to yourself,\" Lily tells you, then marches up to her sister and yanks her elevator-ward by the wrist. \"When are you coming back to the farm? It's been a week. Have you seriously been up here glug-glug-gluggin' this whole time?\"\n\n\"Well— I— Well, now, Lily—\"");

			addChoice("Have you tried it before, Lily?", lilac.bind("lilacnext31"));
		}

		if (seg == "lilacnext31") {
			append("\"I fell in the river twice in one decade, thank you, and no, choking to death didn't quite tickle me. Don't change the subject. I reiterate, Lilac: a week?\"\n\n\"Tuh... Today... it's my first day, okay? I was just sorta... looking around, for the past six...\"\n\n\"So standing around working up the courage.\"\n\nLilac blushes. \"... Okay, yeah, that...\"");

			addChoice("So that means she knows the floor inside and out! Lily, why don't we take you for a tour~?", lilac.bind("lilacnext32"));
		}

		if (seg == "lilacnext32") {
			append("Lily stomps a hoof. \"What?! I don't give a shit about—\"\n\nThen it's her turn to do some wrist grabbing; she spins her little sister around and pulls her towards the bustling tents, blush deepening. \"Just a quick look around. Please, Lil...\"\n\nLily is grumbling. \"... stupid... waste of time... glug-glug...\"");

			data.lilacBobberyVisited = false;
			data.lilacGoldfishVisited = false;
			data.lilacSnacksVisited = false;
			addChoice("Revisit the apple bobbery.", lilac.bind("visit 1"));
			addChoice("Revisit the goldfish catchery.", lilac.bind("visit 2"));
			addChoice("Check out the cub-centric booths.", lilac.bind("visit 3"));
			addChoice("Grab a bite at the snack tent.", lilac.bind("visit 4"));
		}

		if (seg == "visit 1") {
			data.lilacBobberyVisited = true;
			if (data.lilacGoldfishVisited || data.lilacSnacksVisited) {
				temp.a = "And o";
			} else {
				temp.a = "O";
			}

			append("\""+temp.a+"ver here,\" Lilac says, \"we had our second date...\"\n\n\"You're dating now...?\" Lily mumbles, peering over the rim of a barrel.\n\nThe fat operator leans out of his booth. \"Hey, follow the rules this time,\" he says. \"Your little one's gotta at least <!i>try<!i> to get some apples out before you drown her. We don't haul big cases of these up here so people can ignore them, y'know...\"\n\nLily goes beet red and backs away. \"Not interested. Thank you. Bye bye.\"");

			if (!data.lilacBobberyVisited) addChoice("Revisit the apple bobbery.", lilac.bind("visit 1"));
			if (!data.lilacGoldfishVisited) addChoice("Revisit the goldfish catchery.", lilac.bind("visit 2"));
			addChoice("Check out the cub-centric booths.", lilac.bind("visit 3"));
			if (!data.lilacSnacksVisited) addChoice("Grab a bite at the snack tent.", lilac.bind("visit 4"));
		}

		if (seg == "visit 2") {
			data.lilacGoldfishVisited = true;
			if (data.lilacAttempts == 0) {
				temp.a = "caught me on the very first try!";
			} else if (data.lilacAttempts == 1) {
				temp.a = "caught me on the very first try!";
			} else if (data.lilacAttempts == 2) {
				temp.a = "missed me the first time, and I was thinking oh no, they give up... but then try number two came through!";
			} else if (data.lilacAttempts == 3) {
				temp.a = "had to try like five times to catch me... I was really slippery~";
			} else if (data.lilacAttempts >= 4) {
				temp.a = "tried to catch me... god, how many times was it? A ton. I'm sorry about that... I was really nervous... but you perservered!";
			}

			append("\"This is where we met,\" Lilac says, holding your arm. \""+pickByGender("He ", "She ", "They ")+temp.a+"\"\n\n\"How long have you two known each other?\" Lily asks.\n\n\"About thirty minutes, give or take~!\"\n\nLily rolls her eyes.");

			if (!data.lilacBobberyVisited) addChoice("Revisit the apple bobbery.", lilac.bind("visit 1"));
			if (!data.lilacGoldfishVisited) addChoice("Revisit the goldfish catchery.", lilac.bind("visit 2"));
			addChoice("Check out the cub-centric booths.", lilac.bind("visit 3"));
			if (!data.lilacSnacksVisited) addChoice("Grab a bite at the snack tent.", lilac.bind("visit 4"));
		}

		if (seg == "visit 3") {
			append("Lilac leads the way to a row of smaller booths, each swarmed by hordes of excited cubs waving drownsicles and running over each other. \"See, Lily?\" she says. \"Lots of kids your age like this stuff.\"\n\nLily frowns, watching a horse boy up in a dunk tank game. He's dancing in front of a target on a thin plank while cubs chuck dildos and wads of clothing and glowberries and even balloons filled with various bodily fluids at him. Most don't have the muscles to actually throw <!i>well<!i>, though, so the horse lasts for way too long and starts getting cocky, twerking, breakdancing, doing all kinds of crazy shit on the wobbly plank...\n\n\"Let's move along,\" Lily says. \"This clown is a disgrace to horsekind.\"");

			data.lilacPissThrown = false;
			data.lilacCumThrown = false;
			addChoice(
				"Take a shot. (Piss Balloon x1)",
				function() {data.lilacPissThrown=true; lilac("lilacnext33");},
				{cost: ["Piss Balloon", 1]}
			);
			addChoice(
				"Take a shot. (Cum Balloon x1)",
				function() {data.lilacCumThrown=true; lilac("lilacnext33");},
				{cost: ["Cum Balloon", 1]}
			);
			if (getItem("Piss Balloon").amount <= 0 && getItem("Cum Balloon").amount <= 0)
				addChoice("Next.", lilac.bind("lilacnext33b"));
		}

		if (seg == "visit 4") {
			data.lilacSnacksVisited = true;
			append("You and Lilac peruse a cloth menu hanging from the awning of a huge tented cafeteria.\n\nWATER (FREE)\n\nDROWNWICH (1C)\n\nDROWNSICLE (2C)\n\nDROWNPIZZA (3C)\n\nDROWNBUFFET (4C)\n\nDROWNFIVE DROWNCOURSE DROWNMEAL (10C)\n\nLily scoffs. \"They aren't even trying.\"\n\nLilac gets two Drownsicles, handing the lunch lady a couple pink capsules, gives one to Lily. Reluctantly, she takes a lick.\n\nShe blinks. \"... This is just frozen water.\"");

			if (!data.lilacBobberyVisited) addChoice("Revisit the apple bobbery.", lilac.bind("visit 1"));
			if (!data.lilacGoldfishVisited) addChoice("Revisit the goldfish catchery.", lilac.bind("visit 2"));
			addChoice("Check out the cub-centric booths.", lilac.bind("visit 3"));
			if (!data.lilacSnacksVisited) addChoice("Grab a bite at the snack tent.", lilac.bind("visit 4"));
		}

		if (seg == "lilacnext33") {
			if (data.lilacCumThrown) temp.a = "Cum";
			if (data.lilacPissThrown) temp.a = "Piss";

			append("You nudge some of the frustrated cubs out of the way and overhand your "+temp.a+" Balloon right at the boy— it doesn't exactly \"hit\" him, but it does connect with his foot mid-windmill and double his spinning velocity. He flips outta control and falls off the plank into the big glass-walled tank beneath with a huge splash, soaking everyone.");

			addChoice("Next.", lilac.bind("lilacnext34"));
		}

		if (seg == "lilacnext33b") {
			append("After a long while of no one trying the horse boy simply gets bored and does a cannonball into the big glass-walled tank beneath with a huge splash, soaking everyone.");

			addChoice("Next.", lilac.bind("lilacnext34"));
		}

		if (seg == "lilacnext34") {
			append("Lily goes PBTBHPHPHTBH and shakes herself off, launching immediately into a rant, but then a colossal mechanic whirr drowns her out. (heh)\n\nIt's the steel lid of the dunk tank automatically locking shut. The horse boy swims up to the glass and gives the cubs— and you— a thumbs-up.\n\n\"Oh God,\" Lily says, rolling her eyes. \"I don't wanna watch this shit...\"");

			addChoice("If you don't want to watch, would you rather try~?", lilac.bind("lilacnext35"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext35") {
			append("Lily turns to her sister and jerks a thumb at you. \"You like this "+pickByGender("guy", "girl", "person")+"?\"\n\n\"Yes,\" Lilac says absent-mindedly, transfixed with the horse boy's first cute gurglings, one hand wandering down her smooth-hide stomach, between her thighs. She tickles Lily with the other one, also getting lower...\n\n\"... not in the mood...\" Lily grumbles, but her legs spread a little, and she bucks in such a way that her clit just happens to grind against to Lilac's palm.\n\nThe horse boy is putting on quite a show, grasping his throat, letting big bubbles erupt from his mouth, cock throbbing hard against his stomach. Almost every cub's got a paw between their legs— except those who brought an adult, their paws are mostly held behind their back while they get fucked into the soft fairground dirt, or running up and down a cock half the size of their bodies.\n\nThe drowning drags on. Lily is pouting. \"Alright, I get it. Can we go now...?\"\n\n\"Watch,\" Lilac says.");

			addChoice("Casually pull Lily into my lap.", lilac.bind("lilacnext36"));
		}

		if (seg == "lilacnext36") {
			append("\"HEY! WHAT ARE YOU—uuu...\"");

			append(pickByGenitals("You push your cock up between her thighs, shaft pressed to her little lips, head reaching almost to her belly button. You wrap your arms around her in a big hug and rest your chin on her shoulder. She goes >:x", "You wrap your arms around her in a big hug and rest your chin on her shoulder. She does a face like >:x", "You push your cock up between her thighs, shaft pressed to her little lips, head reaching almost to her belly button. You wrap your arms around her in a big hug and rest your chin on her shoulder. She goes >:x"));

			append("\n\nA mini-version of the drowning horse boy (little brother?) pops up and hops through the crowd, pressing his nose to the glass to get the clearest view. The horse inside makes his way to the wall of the tank with feeble kicks, blue-faced, already out of bubbles, and presses his lips to it.\n\nThe crowd awwww's as the horse bros make out through the thick glass, slobbering all over, the older choking hard now, twitching with the first drown-spasms~");

			addChoice("Next.", lilac.bind("lilacnext37"));
		}

		if (seg == "lilacnext37") {
			append("To your surprise Lily doesn't say anything for the rest of the show. Eventually the tank is opened and a carnie hauls the boy's leaky corpse out— then he walks up good as new and throws it over his shoulder as a souvenir, taking his little brother by the hand and letting the next cub scramble up into the tank for their turn.\n\n\"Did that seem so bad?\" Lilac asks gently, massaging her little sister's cunt.\n\nLily won't look at her, instead eyeing the floating globs of cum the horseboy left in the water. \"I dunno. Whatever. Jeez. Can we <!i>please<!i> move on now?\"");

			addChoice("Alright, alright.", lilac.bind("lilacnext38"));
		}

		if (seg == "lilacnext38") {
			append("You lead the way down to the rest of the tents, passing tons of ridiculous and creative drowning-themed games for cubs, including one where contestants have to balance on the edges of a giant glass soup pot and wrestle each other— the first to get thrown in gets the lid shut and the heat turned up. Lily makes a face at that one.\n\nFinally you come upon a cute little shop with fun-sized aquatic costumes. There's a mermaid, a shark outfit, even a diving suit with a special glass helmet and a hole for water intake...");

			addChoice("Would you like to wear any of these, Lily?", lilac.bind("lilacnext39"));
		}

		if (seg == "lilacnext39") {
			append("\"... No...\"\n\n\"The mermaid one, please,\" Lilac says, and hands the shopkeep a couple caps. You find a bench nearby and sit her down.\n\n\"How did I get roped into this...\"\n\nLilac unfolds the costume; it's only the tail, green-purple scales shimmery in the dusk. \"Feet together... there you go.\"\n\nShe slips it over Lily's little feet, over her thighs, cinching it tight around her waist with a little built-in heart-shaped lock.\n\n\"Awwgh you look so cute~!\"\n\nLily tries to stand up, but can't exactly balance with her new tail. \"So I guess the tour is over. Unless you're both gonna drag me around even more literally...\"");

			addChoice("How about one last stop?", lilac.bind("lilacnext40"));
		}

		if (seg == "lilacnext40") {
			append("You hoist Lily up like your mermaid bride (she blushes) and carry her over to a shipwreck-themed ride jutting from a deep, natural pool of water. You've got her upper body cradled in your right arm, so she's facing away from a warning sign to the right: DROWNEES IN THE BACK ROW.\n\n\"Just one ride,\" Lilac says, looking from the sign to you and grinning sheepishly. \"You can even sit in the back, so no one sees your costume, okay?\"\n\nLily crosses her arms. \"Yeah, alright. But then we leave.\"");

			addChoice("Next.", lilac.bind("lilacnext41"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext41") {
			append("You sit the little mermaid in the back and take a seat next to Lilac in the row afore. From the helm the operator drones over the P.A.: \"... arms and legs inside the ride at all times, keep your cub's head below the surface at all times...\"\n\nLily blinks. \"What did he just say?\"");

			addChoice("Quick! Grope her boobs as a distraction!", lilac.bind("lilacnext42"));
		}

		if (seg == "lilacnext42") {
			append("You spin around in your seat and grab two handfuls of nine-year-old tittymeat. Lily huffs and mumbles a string of curses, but makes no move to stop you; as the machinery clunks to life and the ship starts sinking you knead freely at her little breasts, rubbing her nipples in tiny circles with your thumbs, listening to the soft rhythm of her breath... until the water begins to rise over the tip of her tail.\n\nHer mouth crinkles into a sour scowl. \"Oh no. Why. <!i>Why<!i> would I believe that a single part of this place <!i>wouldn't<!i> be drowning related. I cannot <!i>belie—<!i>\"\n\nLilac silences her with a kiss, tongue sinking deep into Lily's maw as she rants muffled past it. Your grope her little tits roughly now, pushing against her chest at the same time to keep her in her seat. The water rises to her knees, then to her waist; her costume isn't airtight, so you tune reality out for a while to imagine the chilly rivulets running over her pussy, beading between the lips...");

			addChoice("Next.", lilac.bind("lilacnext43"));
		}

		if (seg == "lilacnext43") {
			append("Lily shivers hard as the water laps at her belly button, squirming away from the kiss. \"Peh— don't do that! I was talking!\"\n\n\"You're always talking,\" Lilac says. \"Now, you saw how that other horse did it, try to drown as cutely as you can, okay?\"\n\n\"How about I kick you in the boobs, okay?\" Lily jerks her tail up pathetically, not even clearing the surface. \"Agh— right, this goddamn— stupid— ahhh~!\"\n\nThe water's reached her breasts now, both a little reddened and sensitive from your ferocious gropes. Her nipples twitch to full mast as the cold water licks over them.");

			addChoice("Next.", lilac.bind("lilacnext44"));
		}

		if (seg == "lilacnext44") {
			append("Lily blushes at the noise she just made. She looks her sister in the eyes as the water rises over her collarbone, for once letting her fear show: \"It's... it's not gonna hurt, right...?\"\n\nLilac runs a hand through Lily's hair. \"Remember last summer, when we had Rox over for supper? It was glowcorn-on-the-glowcob, right?\"\n\n\"Yeah...\"\n\n\"And remember when she speared your little pussy open on her cock, even though it was way too big for you?\" Lilac asks, reaching down to push at the soft scales of her costume's crotch.\n\n\"... Y-Yeah...\"\n\n\"That hurt, didn't it?\"\n\n\"............................... a little...\"");

			addChoice("Next.", lilac.bind("lilacnext45"));
		}

		if (seg == "lilacnext45") {
			append("\"But it was worth it, right? Because you were so tight that she came harder than we've ever seen her cum. And then she sucked it from you, and it was hours and hours before she finally pulled off... you were both panting, drooling, so out of it... and I was just nibbling at my corn!\"\n\nThe water's at her neck now. \"... She <!i>was<!i> real happy I let her do that...\"\n\n\"Well, it might hurt a little, but I need you to make your big sis happy too,\" Lilac says, and turns to smile at you. \"Push her under.\"");

			addChoice("Push her under.", lilac.bind("lilacnext46"));
			addChoice("Get back on the elevator.", elevator.bind("main"));
		}

		if (seg == "lilacnext46") {
			append("You shove Lily's head underwater, one hand planted on her expression of blank surprise, which immediately turns to one of rage. The little horse launches into thrashes and squirms right away— with the flood of bubbles from her mouth as she rants, with the way she scrabbles at the little lock on her tail, she ends up drowning as cutely as she can without even trying.\n\nEventually, although far too late you think, she realizes she's running out of air and shuts up. She suffices to glare at you and Lilac between your fingers. \"There's my little mermaid,\" Lilac whispers huskily, and boops her little sister's nose. (She mouths \"BITCH!\")\n\nLilac smirks, reaching down and placing a hand on Lily's round belly. \"Mmm... you know, I really liked it whenever you pushed on my stomach earlier...\"");

			addChoice("Help her push.", lilac.bind("lilacnext47"));
		}

		if (seg == "lilacnext47") {
			append("Romantically you place your hand over Lilac's smaller one, threading your fingers between hers, and together you push as hard as you can to force Lily's stomach down. Her cheeks bulge out adorably huge beneath your palm as she tries to keep her remaining air inside— but then you both double your force and she can't help but spew all her bubbles, the tiniest getting caught in her pretty eyelashes.\n\n\"I heard tales of mermaids off the coast who'd lure sailors with a song,\" Lilac says. \"Maybe you should sing for us, Lily...\"\n\nThe little horse can't help but gag and cough on water as you both stop pushing at once, her tiny drowning squeaks barely audible through the water as she struggles.\n\n\"Ahhh, such a beautiful voice~!\"");

			addChoice("Hum softly to her~", lilac.bind("lilacnext48"));
		}

		if (seg == "lilacnext48") {
			append("You start humming a tune off the top of your head, a sweet little melody that warbles up and down in great whimsical tilde-ish swings~~~~\n\nYou place your lips to the surface of the water so she can hear you well. After the first few notes she realizes what you're doing, looks disgusted, and tries to headbutt your mouth, but ends up doing it so softly that you end up kissing her crown of long, flowing hair by accident.");

			addChoice("Kiss her forehead.", lilac.bind("lilacnext49"));
		}

		if (seg == "lilacnext49") {
			append("You wrap both hands around her throat to keep her thrashing still and place a gentle peck on her forehead, then a good hard smooch, and then it turns into an underwater makeout sesh with her upper face. Lovingly you drag your tongue over her grimace-shut eyes, across her forehead, all while squeezing hard on her little neck.");

			addChoice("Let her drown.", lilac.bind("lilacnext50"));
		}

		if (seg == "lilacnext50") {
			append("Once you've had enough of slobbering over Lily's face you lift your head back above-water and take a huge, deep breath, letting go of her. She takes a breath as well, but drags only two fat lungfuls of water down.\n\nShe starts getting truly desperate now, her angry expression slackening as it blues, tail flip-flopping pointlessly against the back of your seats. Her body starts to take over. She hyperventilates water, choking and gagging cutely, coughing it up, jets of tiny bubbles shooting from her nostrils.\n\n\"Pretty pathetic,\" Lilac says, keeping her little sister's snout down with one finger. \"She's hardly even trying not to drown, really...\"\n\nEventually Lily's thrashes turn to flutters of the muscles. She struggles just to keep her eyes open, each bubble-laced eyelash magnetically drawn to its opposite. With the last of her strength she reaches both hands up— for help, it first seems— and then she double-flips you both off and dies.");

			addChoice("Next.", lilac.bind("lilacnext51"));
		}

		if (seg == "lilacnext51") {
			append("The operator yawns and recites:\n\n\"Thank you for riding the New World memorial tribute ride sponsored built and paid-for by the Floatillery staff please exit the ride in an orderly single-file line and remove any cub corpses limbs body parts used condoms weaponry sex toys and/or common household objects serving as sex toys you may have brought with you into the ride thank you again and have a great day.\"\n\nLilac sweeps Lily's corpse up into her arms and gives it a peck on the cheek. You both exit the ride to find her holding her arm outside, scowling at the ground.");

			addChoice("How was it?", lilac.bind("lilacnext52"));
		}

		if (seg == "lilacnext52") {
			temp.g = pickByGender("man", "woman", "player");

			append("\"Stupid,\" she says, and kicks at the dirt.\n\nLilac grabs her corpse by the nose and starts puppeteering it. \"It was soooo awesome, mmm, my cute lil lungs filling up with all that chilly water, oh, and I <!i>loved<!i> it when the big strong "+temp.g+" groped my tiny loli titties~\"\n\n\"YOU'VE GOT SMALLER TITS THAN I DO!\"\n\n\"They're the same size.\"\n\n\"YOU'RE <!i>SIXTEEN!<!i> I'M NINE!\"");

			addChoice("She does have a point.", lilac.bind("lilacnext53"));
		}

		if (seg == "lilacnext53") {
			append("Lilac can't think of a rebuttal so she puppets Lily's corpse again, putting on a whiny voice. \"Mmm, I'm Lily, I'm nine, everybody says I have ginooorrrmo tit—\"\n\nLily tries to grab it. \"Oh my god stop playing with it! You're so gross!\"\n\nLilac simply lets go. Lily topples over right away under the weight of her own waterlogged body, landing butt-down on the dirt with a little <!i>oof.<!i>");

			addChoice("Maybe a kiss will make you feel better.", lilac.bind("lilacnext54"));
		}

		if (seg == "lilacnext54") {
			append("\"Wuh?\" she says, looking confused at the face of her corpse, inches from her own. \"I'm not kissing this thing. What sexual pleasure could you even get from watching me smooch my dead self. You two are into some weird ass—\"\n\nLilac claps her hands together and grins. \"Oh <!i>yes.<!i> Her face is so small, too... it'll be even better than mine.\"\n\n\"Oh no,\" Lily says, scrambling to her feet and dusting her butt off. \"I already let you two drown me (well, 'let' in the sense that I'm not trying to murder you both after that shit) so whatever scheme you're cooking up—\"\n\nLilac darts forward and pulls the little horse's face between her boobs, crushing her with a huge hug. \"Oh, Lily, just trust me... you'll love it.\"\n\n\"... Will I.\"");

			addChoice("I'll do the honors.", lilac.bind("lilacnext55"));
		}

		if (seg == "lilacnext55") {
			append("First, while Lily watches unimpressed, you drop to your hands and knees on the pondside and slurp up a full, bulging mouthful of water. Then Lilac nudges her sister over and you scoop her up in a big hug, resting your chin on her head, grinding your "+pickByGenitals("cock", "pussy", "cock")+" against her little ponycunt.\n\n\"I think I get it,\" she says into your chest, arms limp at her sides.\n\n\"How about you hug them back!\" Lilac whispers.\n\n\"How about go fuck yourself,\" Lily snaps, and hugs you anyway.");

			if (data.hasCock || data.hasBoth) addChoice("Start with her nose.", lilac.bind("lilacnext56"));
			if (data.hasCunt) addChoice("Start with her nose.", lilac.bind("lilacnext56cunt"));
		}

		if (seg == "lilacnext56") {
			append("You weave your hand into her hair and gently pull her head back, locking your lips around her little nostrils. Lilac comes up behind her, reaching down to run her hand over your cock, grinding your pre-soaked slit along her little sister's lips.\n\n\"You want "+pickByGender("his", "her", "their")+" cock inside you?\" she whispers into Lily's ear.\n\n\"Muh,\" Lily says nasally.\n\n\"Well?\"\n\n\"Fine. Yeh.\"\n\n\"Well, snort a little water first...\"\n\nWith remarkably less resistance than expected Lily takes a sizeable sniffle at the water in your mouth; you run your tongue over her nose as she does, the gentle suction like a mini-massage. Lily gives a little cough and grimaces. \"Hgnk. Hade dat sting...\"\n\nLilac spits on the head of your cock and gets it started for you, opening Lily's little cunt with two fingers and guiding half of it inside. \"It's about to sting a lot more, sis...\"");

			addChoice("Drownsmooch her and thrust inside.", lilac.bind("lilacnext57"));
		}

		if (seg == "lilacnext56cunt") {
			append("You weave your hand into her hair and gently pull her head back, locking your lips around her little nostrils. Lilac comes up behind her, reaching down to run her hand over her cuntlips.\n\n\"Wanna couple fingers inside you?\" she whispers into Lily's ear.\n\n\"Muh,\" Lily says nasally.\n\n\"Well?\"\n\n\"Fine. Yeh.\"\n\n\"Well, snort a little water first...\"\n\nWith remarkably less resistance than expected Lily takes a sizeable sniffle at the water in your mouth; you run your tongue over her nose as she does, the gentle suction like a mini-massage. Lily gives a little cough and grimaces. \"Hgnk. Hade dat sting...\"\n\nLilac opens Lily's little cunt with two fingers. \"It's about to sting a lot more, sis...\"");

			addChoice("Drownsmooch her.", lilac.bind("lilacnext57cunt"));

		}

		if (seg == "lilacnext57cunt") {
			append("You take the entire front end of her cub snout into your mouth and Lilac adds two more fingers at the same moment, her fierce little squeal reverberating pleasantly against your tongue. She pulls her hips away, reluctant, trying to ease the pressure, but Lilac gives her a good shove in the butt with her free hand.  \"Come on... take it... be a good little snuffrag~\"\n\nYou keep your grip firm on the back of her head, sucking her snout hard, even getting into a rhythm and \"muzzle\"fucking your own mouth. Lily keeps her eyes on yours, half-lidded, doing a piss-poor job of hiding the fact that she loves this.\n\n\"What did I say about drowning as cutely as you can?\" Lilac whispers darkly, yanking her little sister's asscheeks open and cramming her middle two fingers knuckle-deep up her hole. Lily squeals again, more drawn-out and desperate this time, her little hips almost imperceptibly bucking forward against your pussy and backward onto Lilac's fingers. You feel your cheeks start to deflate a little as she snrrrrks water from your mouth, her body shivering with a hard, pussy-clenching wrack as it flows into her lungs.\n\n\"That's it...\"");

			addChoice("Give her snout a blowjob.", lilac.bind("lilacnext58cunt"));
		}

		if (seg == "lilacnext58cunt") {
			append("You wrap her pretty hair up in a fist and start really shoving her snout into your mouth, sucking it like a cock, the water sloshing around noisily in-between her pathetic tiny horse-squeaks. Lilac helps with the timing, whispering \"Breathe\" every time it hits the back of your throat, her nostrils snuffling pointlessly at your uvula while you suck the bubbles from them.\n\nLilac adds a third finger and starts hammering her little sister's ass. \"How close are you, Lily?\"\n\n\"Mmmm~!\"\n\nShe adds a fourth. \"Didn't catch that. Did you say 'more, please?'\"\n\n\"HHnnnnmm~!\"\n\n\"Really? A whole fist?\"\n\n\"Nnn-nn! Nnn-nn!\"\n\n\"Mhmm?\"\n\n\"NNN-NN!\"");

			addChoice("Next.", lilac.bind("lilacnext59cunt"));
		}

		if (seg == "lilacnext59cunt") {
			append("Lilac slips her thumb in— pretty easily considering the hole's size— and in a blink Lily's little pucker is twitching around her wrist, nice and red and swollen from the abuse. \"Good girl~\"\n\nLily is starting to drift away, her cheeks purpling under a shimmery coat of your slobber where your lips keep slipping over them. Lilac peers up around her sister's thigh, clearly disappointed at the lack of a reaction... so she happily launches into a brutal fistfuck, yanking it out all the way before punching her little ass open anew~\n\nLily screams into your throat, hugging you tighter to try and hold herself steady while you and Lilac rail her holes ragged, gllrrrking and hngrhking and making all sorts of adorable death rattles while you push your tongue deeper and manually force mouthfuls of water down her throat, drownsmooching the ever-loving heck outta her.");

			addChoice("Blow water into her mouth and nose.", lilac.bind("lilacnext60cunt"));
		}

		if (seg == "lilacnext60cunt") {
			append("You take a huge inhale and blow, Lily's eyes rolling back for good as you force the whole mouthful of water into her lungs. Lilac kisses her belly as it heaves with her weakening gags, dragging one slow lick over her throbbing clit, down between her buttcheeks. You let go of Lily's head, just to see if she has any strength left to pull away— surprisingly, she lifts a weak arm and wraps it around your neck, standing wobbly on her tip-toes, and pushes her face even further into your mouth.");

			addChoice("Next.", lilac.bind("lilacnext61cunt"));
		}

		if (seg == "lilacnext61cunt") {
			append("Once she's a goner you pull your mouth off with a <!i>pop.<!i>\n\n\"It's too bad neither of us have a cock,\" Lilac tsks, still making that little horsebutt jiggle with a vicious fisting even though the squeaks have long stopped. \"She'd be so cute with a big preggo tummy...\"\n\nAfter a long embrace you let her second corpse fall to the ground on top of the first one; Lilac dutifully dives to suck the residual juice from Lily's ruined cubcunt, keeping one eye on the corners of the nearby tents... eventually, yep, there she is, peeking out.\n\n\"Come on back,\" Lilac says, waving with one hand and sucking the shimmery pussliquid from her fingers with the other. \"That's the last time, promise... whew, you took that like a champ! Didn't even pee yourself!\"\n\nLily shuffles on over, blushing harder than ever. \"... alright... okay, I think I get why you guys like it...\"");

			addChoice("Wind down, actually, for 100% real this time.", lilac.bind("lilacnext62"));
		}

		if (seg == "lilacnext57") {
			append("You take the entire front end of her cub snout into your mouth and hilt your cock inside her at the same moment, her fierce little squeal reverberating pleasantly against your tongue. She pulls her hips away, reluctant, trying to ease the pressure, but Lilac puts a hand on each of her buttcheeks and shoves them back forward. \"Come on... take it... be a good little snuffrag~\"\n\nYou keep your grip firm on the back of her head, sucking her snout hard, even getting into a rhythm and \"muzzle\"fucking your own mouth. Lily keeps her eyes on yours, half-lidded, doing a piss-poor job of hiding the fact that she loves this.\n\n\"What did I say about drowning as cutely as you can?\" Lilac whispers darkly, yanking her little sister's asscheeks open and cramming two fingers knuckle-deep up her hole. Lily squeals again, more drawn-out and desperate this time, her little hips almost imperceptibly bucking forward onto your cock and backward onto Lilac's fingers. You feel your cheeks start to deflate a little as she reluctantly breathes water from your mouth, her body shivering with a hard, pussy-clenching \"GLRK\" as it flows into her lungs.\n\n\"That's it...\"");

			addChoice("Give her snout a blowjob.", lilac.bind("lilacnext58"));
		}

		if (seg == "lilacnext58") {
			append("You wrap her pretty hair up in a fist and start really shoving her snout into your mouth, sucking it like a cock, the water sloshing around noisily in-between her pathetic tiny horse-squeaks. Lilac helps with the timing, whispering \"Breathe\" every time Lily's snout hits the back of your throat, her nostrils snuffling pointlessly at your uvula while you suck the bubbles from them.");

			addChoice("Long, slow thrusts.", lilac.bind("lilacnext58b"));
		}

		if (seg == "lilacnext58b") {
			append("You start pulling your cock out and driving it back in with huge, slow thrusts; each time you hilt in her fun-sized cubcunt she gasps water, choking hard in your mouth, tears from her watering eyes running cutely over her cheeks.\n\nLilac adds a third finger and starts hammering her little sister's ass with them. \"How close are you, Lily?\"\n\n\"Mmmm~!\"\n\nShe adds a fourth. \"Didn't catch that. Did you say 'more, please?'\"\n\n\"HHnnnnmm~!\"\n\n\"Really? A whole fist?\"\n\n\"Nnn-nn! Nnn-nn!\"\n\n\"Mhmm?\"\n\n\"NNN-NN!\"");

			addChoice("Next.", lilac.bind("lilacnext59"));
		}

		if (seg == "lilacnext59") {
			append("Lilac slips her thumb in— pretty easily considering the hole's size— and in a blink Lily's little pucker is twitching around her wrist, nice and red and swollen from the abuse. \"Good girl~\" she says, snaking her free hand around to stroke at your cockbulge through Lily's stomach.\n\nShe's starting to drift away, her cheeks purpling under a shimmery coat of your slobber where your lips keep slipping over them. Lilac peers up around her sister's thigh, clearly disappointed at the lack of a reaction... so she happily launches into a brutal fistfuck, yanking it out all the way before punching her little ass open anew~\n\nLily screams into your throat, hugging you tighter to try and hold herself steady while you and Lilac rail her holes ragged, gllrrrking and hngrhking and making all sorts of adorable death rattles while you push your tongue deeper and manually force mouthfuls of water down her throat, drown-fuck-smooching the ever-loving heck outta her.");

			addChoice("Blow water into her mouth and nose.", lilac.bind("lilacnext60"));
		}

		if (seg == "lilacnext60") {
			append("You take a huge inhale and blow, Lily's eyes rolling back for good as you force the entire mouthful of water into her lungs. Lilac kisses her heaving belly, dragging one slow lick over her throbbing clit, down between her buttcheeks. You let go of Lily's head, just to see if she has any strength left to pull away— and surprisingly, she lifts a weak arm and wraps it around your neck, standing wobbly on her tip-toes, and suffocates herself in your mouth.");

			addChoice("Cum.", lilac.bind("lilacnext61"));
		}

		if (seg == "lilacnext61") {
			cumEffect();
			append("You ram your cock so deep inside her that you feel it pop into her little underaged womb, which you promptly overfill with pump after pump of creamy "+(isActive("Mood Ring")?getMood("You"):"")+"cum. \"It's too bad she's dead,\" Lilac tsks, still making that little horsebutt jiggle with a vicious fisting even though the squeaks have long stopped.  \"She'd be so cute with a big preggo tummy...\"\n\nAfter a long embrace you let her second corpse fall to the ground on top of the first one; Lilac dutifully dives to suck the cum from Lily's ruined cubcunt, keeping one eye out on the corners of the nearby tents... eventually, yep, there she is, peeking out.\n\n\"Come on back,\" Lilac says, waving with one hand and sucking the "+(isActive("Mood Ring")?getMood("You"):"")+"cum from her fingers with the other. \"That's the last time, promise... whew, you took that like a champ! Didn't even pee yourself!\"\n\nLily shuffles on over, blushing harder than ever. \"... alright... okay, I think I get why you guys like it...\"");

			addChoice("Wind down, actually, for 100% real this time.", lilac.bind("lilacnext62"));
		}

		if (seg == "lilacnext62") {
			append("Once Lily's corpse is all cleaned up"+pickByGenitals(" (she even helps out some— 'I didn't even get to taste any, shut up!')", "", " (she even helps out some— 'I didn't even get to taste any, shut up!')")+" the three of you wander the fairgrounds, talking, reliving your favourite parts. Neither of you have to drag Lily at all.\n\nLilac leads the way, pointing out the cutest regulars she's come to know after a week of visits, the best spots to spectate each booth. Finally she caps off the tour by bringing you both to a tent packed with pillows and gas lanterns; inside a few cubs are sprawled out, mostly on the laps of adults, snoozing peacefully.\n\nYou and Lilac stretch out, and Lily grumbles about having no room and squeezes in between you.");

			addChoice("Rest.", lilac.bind("lilacnext63"));
		}

		if (seg == "lilacnext63") {
			append("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz.......zzzzzzzzzz........zzzzzzzzzz....................zzzzzz............................................................................................................zzzz.....................z....................................");

			cameraFadeIn(0x000000, 4, lilac.bind("lilacnext64"));
		}

		if (seg == "lilacnext64") {
			cameraFadeIn(0x000000, 3);
			append("You wake.\n\nBoth of them are gone.");

			addChoice("Check outside.", lilac.bind("lilacnext65"));
		}

		if (seg == "lilacnext65") {
			append("You lift the flap of the tent and look around. It's still dusk, of course. There's a crowd forming around the dunk tank...");

			addChoice("Spectate.", lilac.bind("lilacnext66"));
		}

		if (seg == "lilacnext66") {
			append("Lily's up in the dunk tank, dodging everything thrown at her with deft skill. A lion lobs some glowcorn at her and she even manages to catch it and throw it back, beaning the guy in his skull. \"TRY HARDER!\"\n\nLilac bumps into you, smiling. \"I think it'll be a while before we head back to the farm.\" She turns to watch Lily. \"I know I was a little rough with her, but don't worry. She was the same way about feral stuff, and about inflation, and about pee, etc etc etc. Deep down, we're pretty similar. You gotta throw her in headfirst, otherwise she never builds up the courage to try anything.\"\n\nShe smacks your butt. \"Anyway. You've been here forever. I'm sure there are tons of Lilies out there waiting for someone like you to show them what's good.\"");

			addChoice("Ah... So, I should...", lilac.bind("lilacnext67"));
		}

		if (seg == "lilacnext67") {
			append("\"Mhm.\"\n\nShe gives you one last peck. \"Do that command the players do all the time! Whatsitcalled...\"");

			addChoice("Move along?", lilac.bind("lilacnext68"));
		}

		if (seg == "lilacnext68") {
			append("You're back at the "+(data.shootingRangeDone?"elevator":"entrance to the fairgrounds")+".");

			addChoice("Oh.", elevator.bind((data.shootingRangeDone?"main":"fairgrounds")));
		}
	}
}
