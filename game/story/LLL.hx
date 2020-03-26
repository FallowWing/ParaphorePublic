package story;

class LLL
{

	public static function libraryExplore(seg:String):Void {
			clear();
			setLocation("L.L.L.");
			saveCheckpoint("LLL.libraryExplore('"+seg+"');");

		if (seg == "explore") {
			playMusic("apothecary");
			append("After a while the constant city noise really starts to drill into your skull.\n\nYou head towards a blocky pavillion, the only silent place in earshot.\n\nWithout knowing when or how it happened you find yourself sucked into a maze of interlocked buildings and vehicles, all white metal— everywhere you look there's bare-butted mechanics with their ears folded back and their heads stuffed under the hoods of polished vans marked FIELD RESEARCH, groggy academics pulling on their turtlenecks and lab coats, trucks packed tetris-tight with sterile equipment— and <!i>books<!i>, everywhere books, spilling from windowsills, resting open face-down on the chests of hammock nappers, stacked, annotated, dog-eared, and catalogued down to the syllable count.\n\nIt's an indoor-outdoor rearrangeable library laboratory labyrinth.\n\nNow that you've stopped spinning in circles looking at everything in this place, you see how that alliteration popped into your head: it's in big wooden letters on the front desk, <!b>L.L.L.<!b>\n\nBehind the desk, a fox cub analyzes you over a textbook marked ENGINETICS. He licks a finger— three fingers?— and turns the page.\n\nSomething's wrong with his paws.");
			addPlace("L.L.L.",
				"A Library Laboratory Labyrinth, home of Lana and John. A maze of books and trucks and tents and equipment, possibly the only quiet and clean place in the entire city.",
				"Junk City");
			addChoice("Approach.", libraryExplore.bind("libraryintro"), {kinks: ["Cub", "Male", "Art"]});
			addChoice("Move along.", JunkCity.junkCityHub, {toolTip: "This will lock you out of story content."});
		}

		if (seg == "libraryintro") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/lana.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");
				s.x = GAME_WIDTH-s.width*1.1;
				s.y = GAME_HEIGHT-s.height-80;
			append("You step up to the desk. It's got a little scanner for checking books in and out and a bowl of ball-gags to help maintain the quiet. The librarian's wearing a pair of round-rim glasses and a poofy, pink, too-big turtleneck.\n\n"+(data.metLana>0?"He nods to you. You think that's his way of saying <!i>Nice to see you again.<!i>":"He seems a little peeved to be disturbed from his textbook. For a moment he self-consciously hides his paws beneath his sleeves and points to his name plaque, which hangs in the upper left: <!b>LANA.<!b>"));
			if (data.metLana == 0) addChoice("Hi there, <!b>LANA<!b>. Can you talk?", libraryExplore.bind("librarytalk"));
			if (data.metLana == 0) addChoice("Yo how old are you.", libraryExplore.bind("libraryold"));
			if (data.metLana > 0) addChoice("Inspect those paws.", libraryExplore.bind("librarypaws"));
			data.metLana++;
		}

		if (seg == "librarytalk") {
			var age = "eleven fingers";
			var age2 = "Wait... eleven?";
			if (isActive("Pastel Ring")) {
				age = "eight fingers on one paw";
				age2 = "Wait. Yes. His other paw is flat on the desk.";
			}

			append("Lana raises an eyebrow at your slightly condescending tone and stands up. You realize, yes, he's definitely old enough to talk.\n\nYet he stays quiet and shakes his head. Then he holds up "+age+".\n\n"+age2);
			addChoice("Watch his paws.", libraryExplore.bind("librarypaws"));
		}

		if (seg == "libraryold") {
			var age = "eleven fingers";
			var age2 = "Wait... eleven?";
			if (isActive("Pastel Ring")) {
				age = "eight fingers on one paw";
				age2 = "Wait. Yes. His other paw is flat on the desk.";
			}

			append("Lana shakes his head, points to his silent maw.\n\nHe holds up "+age+".\n\n"+age2);
			addChoice("Inspect those paws.", libraryExplore.bind("librarypaws"));
		}

		if (seg == "librarypaws") {
			var age = "eleven";
			if (isActive("Pastel Ring")) {
				age = "eight";
			}

			append("His fingers shimmer and twist like heat pouring from a grill, unable to make up their minds on what a paw should really look like. Bits and chunks of reality distangle themselves from their natural spots, knuckles becoming bridges, fingertips becoming palms, fur multiplying and dividing itself all over the place.\n\nAlright, well, you can't tell how many fingers he's <!i>really<!i> holding up, so you assume he's "+age+" for now.\n\nLana sits down and pretends to resume reading his textbook... but, peripherally, he's still picking you apart. You must fascinate him.");

			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "main") {
			var snippet = pickOne(["You sit on Lana's desk and swing your feet, pondering where to go. He scooches over cause your butt is blocking his reading light.", "You're at the L.L.L. front desk.", "You're at the front desk.", "An <!i>APOTHECARY<!i> car with a satellite dish rolls through the library, rattling books off shelves. Lana jumps up from his desk and shakes a silent fist.", "A stack of books teeters and almost falls, but you catch it in time."]);

			if (data.glowbunnyLLLStarted) {
				if (!getJournalEntries().contains("Missing Page 9")) {
					unlockJournal("Missing Page 9");
					msg("Found Missing Page #9", true);
					playSound('assets/audio/environment/journalPage');
				}
				append("There's nothing left of the L.L.L. but tire tracks and a few errant pages floating in the wind.\n\nSome big gay real estate investors from the Snagglebank are already eyeing this big open pavillion. They think all this smooth white tile would be just perfect for a full-size, standalone blood bank, because the white and red would contrast so well.");
				addChoice("Move along.", JunkCity.junkCityHub);
			} else if (getItem("Daydream Journal").amount < 1) {
				var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
					s.x = 450;
					s.y = 280;

				append("Your casual escape attempt fails. Lana jumps up with smooth determination and follows you, analytical stare unbroken— he rushes to a bookshelf, sifts through...\n\nAt first you think that's just him trying to look busy while he stalks you, but then he pulls a book the size of his chest from the shelf and hurries closer. He blows dust off the front cover's bubbly pattern, same as the one on the main menu.");
				addChoice("Um... thanks?", function() {
					data.libraryThanks = true;
					libraryExplore("libraryjournal");
				});
				addChoice("Peek inside the cover.", function() {
					data.libraryThanks = false;
					libraryExplore("libraryjournal");
				}, {kinks: ["Plot"]});

			
			} else if (!data.libraryBinsDone) {
				data.libraryBiology = true;
				data.libraryBinsDone = true;
				unlockJournal("Bins getting punished");
				append("Lana scooches between a stack of shitty romance novels and his desk, then comes around and takes you forcefully by the hand, leading you off into the maze of shelves, tents, vehicles. It's insanely difficult to keep hold of his glitchy paw— not only cause it's small and slippery-soft, but cause every time you think you've got at least three fingers in your grip they phase into nothingness and you're left holding only with the tip of his pinky.\n\nThe little fox pushes up his glasses, adjusts his turtleneck, and reveals with an infinite-fingered flourish: the <!b>Biology<!b> section.\n\nYou blink at him. He's watching for your reaction with wide, expectant eyes.\n\nYou fake amazement and open your mouth to thank him— but a brutal stench like hot garbage catches in the back of your throat, scalding your sinuses bottom-up. From Lana's agonized expression you assume he smells it too.\n\nAs if that weren't enough, the smell's punctuated by a wet moan, which sounds all the wetter and louder because it broke the library's silence.\n\nLana trudges two rows over to investigate.");
				addChoice("Follow.", libraryExplore.bind("bins1"), {kinks: ["Patreon Commission", "Cub", "Male", "Raunch"], faCensor: true});
				addChoice("Look around.", libraryExplore.bind("main"));
				addChoice("Move along.", JunkCity.junkCityHub);

			} else if (data.glowbunnyDone && !data.glowbunnyLLLStarted) {
				data.glowbunnyLLLStarted = true;
				append("You get blasted in the face by exhaust from a hundred white vans and trucks.\n\nHuge convoys stretch into the distance. The entirety of the L.L.L. is getting ready to pack up and leave. Anything bolted down has been stripped clean and, in most cases, smashed into little pieces.\n\n\"This city is all about recycling,\" John explains, coming up behind you with a platonic smack on the butt. \"Partly, our love for violence comes from the need to break down all our junk and repurpose it into more homes, sex toys, or whatever else is in demand. Usually sex toys.\"\n\nA ways down the line you spot Lana using his unnaturally powerful paws to just beat the absolute fuck out of any bolted-down structure labelled <!i>Apothecary<!i> that he can find.\n\n\"I wanted to thank you,\" John says, clapping you on the shoulder, \"for distracting that infected bunny in the forest earlier. Now that we've captured her, we can finally put this place to rest.\"");
				addChoice("You're shutting down the library?", libraryExplore.bind("glowbunny1"), {kinks: ["Plot"]});
				addChoice("Move along.", JunkCity.junkCityHub);
			} else {
				var s:MintSprite = addSprite("assets/img/effect/LLL.png");
					s.x = 160;
					s.y = 250;
				var biology = "";
				if (data.libraryBiology) biology = "Biology";
				append(snippet);
				append("\n\nSections Which You Can Sort of Locate Usually:\n\n<!b>Community Writing\nPlayer Writing\nParafiction\nTutorials\nLaw\nHistory\n"+biology+"\nTechnology<!b>");
				addChoice("Community Writing.", libraryExplore.bind("communityhub"));
				addChoice("Player Writing.", libraryExplore.bind("playerhub"));
				addChoice("Parafiction.", libraryExplore.bind("fictionhub"));
				addChoice("Tutorials.", libraryExplore.bind("tutorialhub"));
				addChoice("Law.", libraryExplore.bind("lawhub"));
				addChoice("History.", libraryExplore.bind("historyhub"), {kinks: ["Plot"]});
				//addChoice("Robotics.", libraryExplore.bind("tutorialhub"));
				if (data.libraryBiology) addChoice("Biology.", libraryExplore.bind("biologyhub"));
				addChoice("Technology.", libraryExplore.bind("techhub"));
				addChoice("Move along.", JunkCity.junkCityHub);
			}
		}

		if (seg == "glowbunny1") {
			data.glowbunnyHidingInBack = false;
			append("John doesn't answer right away. First, he looks around. So do you.\n\nNo one really seems to want to leave. They're happy enough to fuck while they idle in their cars and wait for the word go, but there's a sense of hesitance and unease in their thrusts.\n\n\"Now that we have the bunny, we're being relocated to the Apothecary's building. You've seen it, right? Big blocky thing hanging off the side of the island? Detachable upper half covering a giant mysterious ball of light?\"");
			addChoice("Yeah, it's kind of an eyesore. Why are you moving there?", libraryExplore.bind("glowbunny1a"));
		}

		if (seg == "glowbunny1a") {
			append("\"Well, because of her.\"\n\nHe takes you around to the back of the van, where the infected bunnygirl still snoozes. \"The Apothecary is a lot like the L.L.L. It's a hospital, a rehab center, a pharmacy... the people there want to make the world better. We can hope they do, at least. Their policies aren't very transparent. But orders came down from their C.E.O. shortly after you helped Lana and I capture the bunny: now that we have a living test subject, our glowvirus investigation should be kept out to a high-security building with proper equipment. It's not exactly easy to keep a lab tent sterile when there's cars passing through and spewing fumes all the time. That was one reason Lana used to keep this place locked off from the rest of Junkport.\"\n\nA row of engines splutter and rev up, all in a row, like dominoes. The first trucks start to leave.");
			addChoice("So it wasn't always a loose and dirty library laboratory labyrinth...?", libraryExplore.bind("glowbunny1b"), {kinks: ["Plot"]});
		}

		if (seg == "glowbunny1b") {
			append("John scooches out of the way to avoid them as they pull out of the pavillion and head for the city gates. Inside, it seems every driver is getting road head from at least one bimbo with their bare ass smushed to the passenger-side window, and in some of the motor homes with luxurious back-ends, you can see whole crowds of scientists lost in orgies, fogging up their rear windows.\n\nMore often than actual books or equipment, truck after truck hauls shelves of porn and fancy white steel sex machines.\n\n\"When Lana founded this place,\" he says, \"you used to be graded on your work and given a special membership card (Lanacards, they were called) and if you weren't contributing to any new findings, your card got the snip and you were locked out. It was his way of forcing people to stop fucking all the time and get something done. He had such a way of speaking, back then. The voice of a dictator trapped in the body of a cute boi.\"\n\nYou try and watch Lana on his recycling rampage, but you can only catch flashes of him through the cracks of the passing trucks: winding a punch up, busting through shelves and particle board, heaving for breath, spinning to find the next piece of Apothecary equipment.\n\n\"He even initialized the name in order to draw crowds and create mystery. Losers who Love Learning doesn't have the same ring to it. Lots of people wanted to join his mysterious 'L.L.L.' organization. But if you wanted to join, you had to 'disconnect' from your old fuckbuddies. Stop fucking them. Stop dirty talking with them. Don't let them tempt you back into weeks-long orgies. You had to cut out anyone who tried to claim sex was more important than learning about our world. And, if you caved to temptation and left for a while without his permission, your card wouldn't work when you came back— all your friends at the L.L.L. disconnected from you, you risked losing credit for your discoveries, and you'd be left sitting on the street outside the big white pavillion tent, big as a circus, whimsical as a circus, watching the colorful smoke of new chemical reactions spewing from the top, listening to the cries of jubilation from the next great breakthrough— yes, Mynt is telling the truth, we really do live in a computer! Yes, the island does have an edge! No, we don't have proper floating physics, anything inflated will rise to a fixed height and stay there!\n\nYou weren't part of anything like that anymore. You were just another slut in the gutter.\"\n\nThe convoy slows and stops.\n\nLana's done recycling. He trudges over to you both, his turtleneck ripped and covered in dust, splinters jutting from his little knuckles. He plucks them out without wincing. His face is resigned and exhausted. As he hears the tail-end of what John has been telling you, his chin and maw droop down, and the fabric around his neck overtakes them.");
			addChoice("I didn't have to get a Lanacard to come in here.", libraryExplore.bind("glowbunny2"));
			addChoice("I don't see any colorful smoke.", libraryExplore.bind("glowbunny2"));
			addChoice("No one here seems to avoid sex.", libraryExplore.bind("glowbunny2"));
		}

		if (seg == "glowbunny2") {
			append("\"That was in the past. Before I showed up.\"\n\nLana stops before you, arms crossed, paws in his pits. He scrunches his face up and looks at the ground. The fur on his wrists is red and irritated.\n\nJohn digs through the 2398 pockets of his lab coat and pulls out a tiny plastic pack of minty-green soothing gel. He coaxes Lana's paws out and massages them platonically, working the gel into the webbing of his sore, glitchy fingers— all 2398 of them.\n\nIn the distance, seven Apothecary staff members step out from a green limousine.");
			addChoice("Awww. Help rub his paws.", libraryExplore.bind("glowbunny3a"));
		}

		if (seg == "glowbunny3a") {
			append("You try to, but Lana pulls away. John gets exclusive paw access.");
			addChoice("3:<", libraryExplore.bind("glowbunny3b"));
		}

		if (seg == "glowbunny3b") {
			append("John hesitates with the next part of his story.\n\nLana nods for him to go on.\n\n... Carefully, with his tail sagging, he says: \"I showed up and ruined everything. I was a thug for the Apothecary back then, and my libido was my entire identity. I licked my lips and hungered for asses yet unraped.\n\nWe tranquilized everyone. It was easy. They hadn't discovered the sedative properties of sweetgrass yet, so they still had it laying around everywhere. And none of them had been domming— let alone domming for painsluts— so violence never even popped into their heads as an option. We took down the card scanners, the airlocks, and we destroyed every record of Lana's membership system. With that same rifle, I shot his boyfriend in the heart with a sleep dart. The dosage was too much at once, and we had to chase him down and shoot him again after he respawned. He was screaming a lot.\"\n\nThe Apothecary staff begin moving towards you. Lana watches them.\n\n\"With his mysterious circus of science open to everyone now, citygoers flooded in non-stop— doctor doms, pain-lover patients, puffy-nippled nurses— all just medical roleplayers. No real interest in learning anything. Within a week, Lana was the only one left who actually got any work done. Within a month, he was dying of loneliness. We all wore him down. Remember how we got on your ass about it? 'Come on, Lan. Just try it. Just try it once.'\"\n\nLana ignores him. The rest of the trucks roll out. Where there was so much bustle, now there are only used condoms, ripped books, old scrap heaps, measly dots on a stark open field of tile between the city buildings. Even the piles of scrap are already getting hauled away by garbage trucks labelled <!i>The Boys.<!i>\n\nThe Apothecary staff are almost here.\n\n\"Lana wouldn't give in,\" John laughs. \"He tried moving to Dark Forest and stirring up a new following there, but at the time it was hopelessly depraved. People couldn't even fathom the idea of going a day without something down their throat.\n\nSo Wendy gave him Patch. Someone to love and be loved by. Someone he could trust, since he had just been spawned in— no opportunity for the Apothecary to get him on their side. Lana had sex for the first time in his life the night Patch arrived at the docking port on the little ship that Wendy built him. It's been sixty-six years, and Lana hasn't got a shred of work done since.\"\n\nLana punches him in the dick.\n\nJohn stumbles backwards, laughing wheezily. There's a wet spot of minty gel on his crotch now.\n\n\"Thank you,\" he says, standing upright again and wiping it off. If there even was any pain, it disappeared in a second. \"But you can keep the gel. My glitched parts don't need it.\"\n\nLana stares him down. His eyes are red. You're not sure you ever noticed that before, but you sure notice it now that they're glowing with latent hatred.\n\n\"They ruined everything for you,\" John says to him. \"And I'm sorry, but they'll have to do it again.\"");
			addChoice(":O", libraryExplore.bind("glowbunny3"));
		}

		if (seg == "glowbunny3") {
			append("The staff members are here.\n\nThey tap John on the shoulder and whisper something to him. In the back of his van, a single glowing rabbit paw beats against the reinforced back window:\n\n<!i>Thump-thump-thump.<!i>\n\nThe windows of his van are glowing way brighter than they should be. She must have killed herself several times while in captivity. Her corpse pile washes all of you in alien blue light.\n\n\"I,\" John starts, distracted. \"Apparently there's been a... apparently they want us to come too.\"\n\nLana places a paw on the clasp of his rifle sling. He says nothing, of course, but his face says \"Try me.\"\n\nThe staff surround you. Up close you notice they're all sexually augmented: huge tits, asses, and a set of cocks big enough to strain the fabric of their white pants even while flaccid... Each one wears a ballcap pulled down over their eyes and a grin wide enough to let some drool leak out the cracks at the side of their botox lips.\n\n\"Now fellas,\" John says, holding his arms out and stepping in front of Lana. \"He got the bunny for you, didn't he? It was a dead shot, too. We can let him go.\"\n\n\"Direct orders,\" says one of the Apothecary staff.\n\nThey all take out tranquilizer pistols.");
			addChoice("Oh shit. Um. Run??", libraryExplore.bind("glowbunny4"));
		}

		if (seg == "glowbunny4") {
			playSound("assets/audio/environment/tranq");
			timer(1, playSound.bind("assets/audio/environment/tranq"));
			append("John dives in front of Lana and takes a shot to the neck.\n\nLana whips his rifle out and shoots a lady in the tits, point-blank.\n\nTwo men in ballcaps turn their guns on you as you try to run. One holds a finger to his earpiece. \"The player, too?\"");
			addChoice("NOPE NOT THE PLAYER TOO", libraryExplore.bind("glowbunny5"));
		}

		if (seg == "glowbunny5") {
			append("You push past them and book it.\n\nYour bare feet <!i>pitpatpitpatpitpat<!i> against the pavillion tile. You step on shards of metal and glass and broken book spines and you don't care.\n\nLooking over your shoulder, you see Lana scrambling too, dodging lime-green sleep darts. They hit the ground and explode, embedding shards of wet glass into his feet.\n\nThe green limousine rolls up and blocks his exit. Two figures get out from the back: a cat and a gecko.\n\nMarei and Septrica.\n\nLana scrambles to spin around. He slips and loses his balance on a single greasy condom. His feet are going numb.\n\nMarei walks up to him, calmly, and shoots him in the back of the neck.\n\nThe dart hit a tendon. He's still struggling. His turtleneck rips off entirely. He claws at the tile, totally naked, trying to drag himself towards John's limp body, but his paws choose this moment to glitch out. Even if he could make some progress with his elbows, dragging them through spilled tranquilizer would only get him so far before they numbed over.\n\nSo he goes limp.\n\nSeptrica appreciates this. She steps forward and kicks Lana onto his back and shoots him in the throat.");
			addChoice("Fuck... go back and help...!?", libraryExplore.bind("glowbunny6"));
		}

		if (seg == "glowbunny6") {
			append("Septrica, Marei, and their staff divide themselves between their limo and John's van. They throw John and Lana in the back with the glowbunny. She welcomes the opportunity to slobber all over someone new.\n\nThere's nothing you can do.\n\nBy the time you run all the way back across the pavillion, they'll be gone.");
			addChoice("...", libraryExplore.bind("glowbunny7a"));
			if (!data.glowbunnyHidingInBack) addChoice("Mynt I need to talk to you right now.", MyntScenes.myntLLLEnd.bind("intro"), {toolTip: "<!img:kink/Snuff.png>  Bad End  <!img:kink/Snuff.png>  "});
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (seg == "glowbunny7a") {
			StoryUtils.quickMynt("LLL Shooting");
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (seg == "historyhub") {
			append("This section has recently been raided by Apothecary staff. There's nothing left in the <!b>Dark Forest & Junkport War<!b> section nor <!b>Voyage Off The Map.<!b> There are some cursory notes left in <!b>Init<!b> though.\n\n<!b>Patch Notes<!b> is all that's really left in entirety. There are some scuff marks in the floor in front of it. You get the feeling that whoever tried to clean this section out caught eighty-five fox paws to the face.");
			addChoice("Init.", libraryExplore.bind("initHistory"));
			addChoice("Patch Notes.", libraryExplore.bind("patchnotes"));
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "patchnotes") {
			append("<!b>Patch #1<!b> — Year 0, Day 1\n<!b>Patch #2<!b> — Year 0, Day 14\n<!b>Patch #3<!b> — Year 0, Day 87\n\nThey're all signed by Wendy.");
			addChoice("Patch #1.", libraryExplore.bind("patch1"));
			addChoice("Patch #2.", libraryExplore.bind("patch2"));
			addChoice("Patch #3.", libraryExplore.bind("patch3"));
			addChoice("Back.", libraryExplore.bind("historyhub"));
		}

		if (seg == "patch1") {
			append("0.0.1 Changelog\n----------\n\n<!b> > Respawn system changes<!b>\n- Respawning now labels the area you died in as 'deadly' which means you'll respawn on its perimeter. This prevents death loops like the people under the meteorite are stuck in. If you die again on the perimeter of the 'deadly' area its radius doubles\n- Respawning will now always choose the closest place that <!i>no one is looking at<!i>, even if it is upstairs or downstairs from where you died. This is to prevent existential dread\n- You will now respawn belly-button first. In the event that respawning is recorded or photographed this should mitigate existential dread through cuteness\n\n<!b> > Rape prevention measures added<!b>\n- High libido is no longer a choice. I'm sorry but preventing rape becomes borderline impossible if I don't force this\n- Cubs are now spawned with the same default information/memories about sex as everyone else. You may still act like you are innocent of course, so please don't feel like I am stepping on your toes too much with this. I never thought I would ever be saying this but everyone please snuff as many cubs as you can (CONSENSUALLY) so they may respawn with the full information package in their brain zones\n- Rape prevention squads are now being organized by Septrica and Marei. If you wish to patrol the port or the forest please volunteer at the Apothecary. Everyone congratulate our first volunteer, she's a little bunny from the forest but I forgot her name. You know who I mean\n\n<!b> > Fixed bug where you could fall off the map<!b>\n- I pretty much just slapped some invisible walls on it\n\n<!b> > Disabled \"Fuckmeat\"<!b>\n- These things spawned in with the sub-feral systems I guess but they are 100% fucking disgusting and have to go. Sorry not sorry\n\n<!b> > Added \"player customization\" options<!b>\n- The default gray humanoid thing is freaky. If I am going to be checking up on you guys I want to be a cat lol");
			addChoice("Back.", libraryExplore.bind("patchnotes"));
		}

		if (seg == "patch2") {
			append("0.0.2 Changelog\n----------\n\n<!b> > Added Patch<!b>\n- It's literally a fox named Patch lol puns you guys am I right. But for real hopefully this lightens the mood around here. I know its tough with people still trapped and suffering. Please volunteer to help the mining efforts. But yeah Lana was sad that there are no other non-feral fox boys so Bins came to me with his character design and we spawned him in as a present for the little library boi. Thank you for organizing my shitty patch notes, Lan Lan! And everyone, if you are interested in figuring out this mess of a world please help Lana with his L.L.L. thing!! Woo science\n\n<!b> > Un-disabled Fuckmeat<!b>\n- People started taking out their desire to fuck small things on innocent ferals. And a lot of people were crushed when they found out they can't even have fake babies anymore. So. Fine. I'll put them back. But they have to be kept to Dark Forest ONLY\n\n<!b> > Added Sweetgrass<!b>\n- I understand none of you asked to exist. So this plant should have sedative properties I think. Report to the Apothecary if you want to go under. You can choose any amount of time up to one year, and after your year is up you will be asked to explore the island for a month before they put you under again. This is kinda like a continued consent thing. I'm sorry but it's the best solution I can think of right now\n\n<!b> > Ferals now respawn<!b>\n- They appear to be sentient. This is the only thing I can somewhat easily do to make existence better for them. If you guys ever figure out how to communicate to the bunnies tell them I am extremely sorry for the hundreds of lives they lost");
			addChoice("Back.", libraryExplore.bind("patchnotes"));
		}

		if (seg == "patch3") {
			append("0.0.3 Changelog\n----------\n\n<!b> > Ferals no longer respawn<!b>\n- Okay their population got out of hand and the herbivores ate half the L.L.L. papers and almost extincted sweetgrass so idk honestly I have no idea what to do the code is getting too hard to work with and my computer time is getting restricted so please don't hate me I'm sorry\n\n<!b> > Tried to fix psychopathy<!b>\n- Marei and Som and John and Cage have some empathy now. John and Cage have a little too much but I did my best. Snagg is a lost cause. I'm sorry. Please just avoid him if you can\n\n<!b> > Added rain<!b>\n- I'm so tired of my own mistakes. I just want to add something nice for you all. I tested this as much as I could and I don't think it will mess anything up. It has now been three months since the meteorite landed and I still have not been able to rescue most of the people trapped under it. I'm sorry. I'm so sorry. Please don't hate me\n");
			addChoice("Back...", libraryExplore.bind("patchnotes"));
		}

		if (seg == "libraryjournal") {
			var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
					s.x = 450;
					s.y = 280;
			if (data.libraryThanks) append("Lana shakes his head and blushes, as if to say oh, please, not at all, I love giving books away, why else would I be a librarian~?\n\nHe") else append("<!b>PROPERTY OF ARCHBISHOP,<!b> says perfect handwriting.\n\nThe first sixteen pages have been ripped out.\n\nLana");
			append(" pushes it shyly into your hands. He taps his head, miming, then cracks it open and does some invisible scribbles.");

			addChoice("What do you mean?", libraryExplore.bind("libraryjournal2"));
			if (data.libraryThanks) addChoice("DO I GET TO WRITE CUSTOM SCENES???? LEVEL EDITOR??", libraryExplore.bind("libraryjournal2")) else addChoice("Are you trying to tell me a crazy person wrote in this?", libraryExplore.bind("libraryjournal2"));
		}

		if (seg == "libraryjournal2") {
			data.libraryJournal = true;
			append("Lana shakes his head. He places eighty-seven paws to his chin, thinking how best to explain it...\n\n(Okay I'll just tell you: it's a Daydream Journal. You can run through old scenes again and change your choices. Of course, none of it affects reality.)");
				if (data.myntNarrative == 0) addChoice("... And who are you?", libraryExplore.bind("libraryjournal3")) else addChoice("Thanks, Mynt.", libraryExplore.bind("libraryjournal3"));
			addToItem("Daydream Journal", 1);
		}

		if (seg == "libraryjournal3") {
			addChoice("Look around.", libraryExplore.bind("main"));
			if (data.myntNarrative == 0) {
				append("Oops! Um! I mean! Uh! >.<\n\nHEy that shiny new item is in your inventory why don't you go try it out!!!!");
				addChoice("Alright I guess. Move along.", JunkCity.junkCityHub);
			} else {
				append("Hey no prob. :3\n\nIt's in your inventory if you wanna go try it out!");
				addChoice("Sure. Move along.", JunkCity.junkCityHub);
			}
		}

		if (seg == "bins1") {
			var age = "n eight";
			if (isActive("Pastel Ring")) age = " six";

			var bins = "A"+age+"-year-old raccoon";
			if (data.metBins > 0) bins = "Bins the raccoon";
			data.metBins++;

			append(bins+"'s got his paw hooked around the bars of a salvaged metal bookshelf to steady himself while he slams his little ass on a stand-up dildo, free ball-gag bouncing pointlessly as a necklace on his smooth chest, books toppling and swaying around him. The single greasy, matted armpit exposed from his grip on a high shelf is the main source of the stench. Flies circle his moaning maw, some even daring to flit inside for a nibble at those juicy saliva-wet filthstains.\n\nLana comes up behind him and <!i>thwaps<!i> him over the head with his ENGINETICS textbook.\n\nThe raccoon shrieks, nearly falls off his sex toy. \"OW, LAN! WHAT'DJADOTHATFOR?!\"\n\nLana puts a finger to his lips and pinches his nose.\n\nYou realize the coon <!i>was<!i> actually using the library and reading a book, albeit while noisily fucking himself. It's laying open on the ground now: a little \"Physical Biology 4 Kidz\" booklet featuring way-too-detailed diagrams of butts and cocks. He scoops it up, pouting. \"You <!i>know<!i> I can't understand your dumb miming... Just write it out. Why'd you hit me? I'm too loud and stinky?\"\n\nLana crosses his arms, nods, and points to the exit. Just in case he doesn't get <!i>that<!i>, the little fox scribbles it out on a sticky note: \"GTFO BINS.\"\n\nThe raccoon pouts harder. \"Whaaaaat... but I wanted to browwwwwwse... there's a new Cock Anatomy edition with a special article on frenulummmmmms!\"\n\nLana's not the patient type. He gives the period a tail and scribbles his angry ultimatum: \"GTFO BINS, or you're going to the <!b>back room.<!b>\" Those last two words get carved into the paper seven times while Lana deathstares.");
				addChoice("Don't fuck with librarians, little dude.", libraryExplore.bind("bins2"), {kinks: ["Male", "Male", "Abuse"]});
				addChoice("Look around.", libraryExplore.bind("main"));
			}

		if (seg == "bins2") {
			var age = "eight";
			if (isActive("Pastel Ring")) age = "six";

			append("Bins doesn't heed your advice. Instead he turns and jiggles his fat ass at Lana with a smack to the left cheek. \"The ~back room~ huh? Well, you'll have to CATCH ME FIRS—\"\n\nBefore he can even begin to turn and run Lana slaps him across the face. His paw glitches and multiplies the impact a thousandfold, sending the little raccoon flying into a bookshelf.\n\nMethodically, Lana gets a nice firm grip on the raccoon's ankle and drags him away. He turns to you and jerks his chin a little, gesturing for you to follow if you like.\n\n\"Nnnn...\" Bins mumbles. \"Fuggen... cheater...\"");
			addChoice("Follow.", libraryExplore.bind("bins3"));
		}

		if (seg == "bins3") {
			data.libraryBinsKiss = false;
			data.libraryBinsKill = false;
			data.libraryBinsPiss = false;

			append("The <!b>back room<!b> is a dark, concrete cavern stacked with books like YOUR FIRST PSEUDORAPE and VOCAL CONTROL: CUTE SCREAMS EDITION and VOCAL CONTROL: VERBAL ABUSE EDITION and HOW UNDERAGED URINALS DESERVE TO BE TREATED: VERY, VERY POORLY.\n\nBy the time the door's locked behind them both boys are throbbing hard, cocklets pressed up against their bellies and in Lana's case tenting his overlong turtleneck, soaking the pink fabric purple.\n\nBins holds out both hands and scoots back into a corner, whimpering as the little fox stalks closer.\n\n\"C-Come on, Lan... I was just teasing...\"\n\nLana squats, giving you a perfect view of his plump little asscheeks, and reaches down to gently jack the raccoon off... but his paw multiplies again, and it turns into a brutal death-grip lightspeed cocklet yanking sesh, Bins's nuts a blur as they thwap back and forth with the force of it.\n\nHe can't handle it. He starts writhing, squealing at the top of his lungs, thighs grinding together. \"AH! AH! Please!!! Anything! Do anything to me! Just don't use those f-freaky paws!\"\n\nLana doesn't stop, but instead turns to you and flashes that innocent smile. He does a little open-close flap gesture— blah blah blah— then points from Bins to his own mouth, clapping a hand over it.\n\n... <!i>Clearly<!i> asking for suggestions on how to shut him up~");
			addChoice("Um... maybe kiss him?", libraryExplore.bind("binskiss"), {kinks: ["Vomit"]});
			addChoice("Piss down his throat.", libraryExplore.bind("binspiss"), {kinks: ["Piss", "Love"]});
			addChoice("Shut him up for good~", libraryExplore.bind("binskill"), {kinks: ["Snuff", "Piss"]});
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "binskiss") {
			data.libraryBinsKiss = true;

			var candy = "puke";
			if (isActive("Candy Ring")) candy = "cake";

			var kill = "chubbed-up";
			var kill2 = "";
			var piss = "filth-slick";
			
			if (data.libraryBinsPiss) piss = "piss-and-filth-slick";
			if (data.libraryBinsKill) {
				kill = "limp";
				kill2 = "corpse";
			}

			append("Lana takes him by the back of his head, straddling his waist and frotting hard with his "+kill+" cubcock. The silence of the concrete room amplifies every little wet noise, the pop of every saliva bubble, the friction between tongues. Lana's tummy starts to twitch... the flavor of the raccoon's "+piss+" maw draws out gag after gag after gag after gag after—\n\nFinally the dam breaks. Lana turns his head and locks lips with the coon"+kill2+", stomach heaving as a flood of chunky "+candy+" rushes down his throat, some splurting from his nostrils, squishing up between their smooth chests~");

			if (!data.libraryBinsPiss) addChoice("Piss down his throat.", libraryExplore.bind("binspiss"), {kinks: ["Piss"]});
			if (!data.libraryBinsKill) addChoice("Shut him up for good~", libraryExplore.bind("binskill"), {kinks: ["Snuff", "Piss"]});
			addChoice("Cum.", libraryExplore.bind("binscum"));
		}

		if (seg == "binspiss") {
			data.libraryBinsPiss = true;

			var candy = "puke";
			if (isActive("Candy Ring")) candy = "cake";

			var kill = "raccoon's panting maw";
			var kill2 = "poor";
			var kill3 = "";
			var kiss = "releasing a silent sigh";
			
			if (data.libraryBinsKiss) kiss = "washing down the remaining chunks of "+candy;
			if (data.libraryBinsKill) {
				kill = "corpse's pale face";
				kill2 = "dead";
				kill3 = "A respawned Bins watches from a crack in the door, blushing and groping himself as his corpse gets defiled so cutely~";
			}

			append("Lana flips around, smearing his cubnuts up over the "+kill+". His muteness prevents him even from purring or moaning, but from the look of his blissed-out face he totally would if he could right now. In one smooth push he hilts his perky little foxcock down the other boy's throat and lets a thick pissjet fly, "+kiss+". Lana starts bouncing his hips, spilling piss everywhere as he fucks the "+kill2+" cub's throat open wide.\n\n"+kill3);

			if (!data.libraryBinsKiss) addChoice("Um... maybe kiss him?", libraryExplore.bind("binskiss"), {kinks: ["Vomit"]});
			if (!data.libraryBinsKill) addChoice("Shut him up for good~", libraryExplore.bind("binskill"), {kinks: ["Snuff", "Piss"]});
			addChoice("Cum.", libraryExplore.bind("binscum"));
		}

		if (seg == "binskill") {
			data.libraryBinsKill = true;

			var candy = "pukeslime";
			if (isActive("Candy Ring")) candy = "frosting";

			var kiss = "";
			var piss = "";
			
			if (data.libraryBinsKiss) kiss = " he even drags his digit gently over Bins's blushing cheek, scooping up eighty-nine thumbfuls of "+candy+", then pops it up the poor cub's left nostril and twists while he so obediently snorts the filth up...";
			if (data.libraryBinsPiss) piss = " and mingling with the stains of Lana's on his clenched tummy";

			append("The only slice of light in the room comes from the crack of the shut door, and it lands directly on Lana's glasses, making them glow all evil and opaque. Bins squirms and shivers between the fox's thighs, a bit of pee dribbling from his cocklet"+piss+".\n\nLana tweaks one of his cute rounded raccoon ears, runs a paw or three through his dirty hair..."+kiss+"\n\nWith a silent sigh he closes his paws around the raccoon's throat. They were already there this whole time, just waiting to be flexed. The little coon can barely squeak as he suffocates— not that he really tries, you think, since being so noisy got him into this mess in the first place.\n\nLana leans down and plants a gentle kiss on his forehead, glasses fogged with the heat of the kill, and crushes the last bit of air from his throat with such force it's as if those two glitched paws carry behind them the strength of six invisible arms, as if this little turtleneck'd fox boy is secretly an eight-armed deity.\n\nLana pulls off the corpse and smiles at you. One hand roams down to grope gently at the raccoon's slowly softening cock~");

			if (!data.libraryBinsPiss) addChoice("Piss down his throat.", libraryExplore.bind("binspiss"), {kinks: ["Piss"]});
			if (!data.libraryBinsKiss) addChoice("Um... maybe kiss him?", libraryExplore.bind("binskiss"), {kinks: ["Vomit"]});
			addChoice("Cum.", libraryExplore.bind("binscum"));
		}

		if (seg == "binscum") {
			cumEffect();
			var candy = "re-regurgitated tummysludge and";
			if (isActive("Candy Ring")) candy = "thick pink frosting and";

			var kiss = "";
			var kiss2 = "";
			var piss = "cum";
			var kill = "raccoon";
			var kill2 = ", making him wheeze cutely";
			var kill3 = "squealing cub";
			
			
			if (data.libraryBinsPiss) piss = "hot fox piss";
			if (data.libraryBinsKiss) kiss = "At the critical moment a disgusting wet gurgle rushes up the raccoon's throat and a mix of "+candy+" "+piss+" spatters onto the floor.";

			if (data.libraryBinsKill) {
				kill = "snufftoy";
				kill2 = "";
				kill3 = "floppy corpse";
			}

			append("Now that he's had some fun, Lana gets serious.\n\nHe flips the "+kill+" onto his belly and hikes that ass up with a blow to his soft lower tummy"+kill2+". The fox aims and plunges his cock through the stretchy pucker no lube no problem (you guess Bins is just that big a buttslut) and cranks immediately into a knotfuck, pounding the "+kill3+" into the concrete until his glasses are practically dripping with fog and his maw twitches into a silent O, hips slamming forward in spastic sync with his orgasm.\n\n"+kiss);
			addChoice("Wind down.", libraryExplore.bind("binswinddown"));
		}

		if (seg == "binswinddown") {
			data.knownCharacterImmortality++;
			var kill = "pants and twitches helplessly, "+(isActive("Mood Ring")?getMood("Lana"):"")+"fox cum pouring from his little asscrack";
			if (data.libraryBinsKill) kill = "slips through the door, freshly respawned, and tackles Lana with a hug. The two nuzzle and frot, Lana softening while Bins throbs harder than his old body ever could..";

			append("Bins "+kill+".\n\nLana cleans his glasses, dusts his paws off— the little poof-cloud makes them even more amorphous— and heads right back to the front desk as if nothing even happened.\n\nYou linger for one moment still to watch Bins drop his snout to the floor and start sucking up the goopy mess, fingering his gaped ass. He catches you staring and winks.\n\n\"Yer sho wrong,\" he says, muffled through a mouthful of succulent "+(isActive("Mood Ring")?getMood("Lana"):"")+"cubcum. \"Yer ALWAYS sposed tuh fuck with librariams. <3\"");
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "initHistory") {
			append("The notes sum it up for you:\n\n• <!b>Init<!b> was a period of several months before Year 0.\n• During init, all islanders except Patch and the mythologicals were spawned on a flat, empty plane.\n• This period was intended to give people time to adjust to reality, meet each other, and set up arbitrary families if they wished. Islanders were also given the option to disband pre-programmed families, but none did.\n• Many families were established. Four notable pairs:\n     - Lilac & Lily, sisters\n     - Kemp & Som Lamblea, father and son\n     - Septrica & Marei Mauze (Mauez?), sisters\n     - Lana & Cage Statt, father and son\n\n• No ferals were spawned at this time, in order to avoid immense suffering in the event of epidemic psychopathy.\n• After the islanders had mostly accepted their existential situation and their bodies (more or less), Wendy went ahead and spawned the island.\n• Then the meteorite came down, and history began at Year 0.");
			addChoice("Back.", libraryExplore.bind("historyhub"));
		}

		if (seg == "techhub") {
			append("It's a very clean set of manuals and diagnostic guides to do with every kind of contraption, device, machine, or tool on the island. Four short introductory guides stand out:\n\n<!b>AUTO-MYNTs\nRings\nMining Tools\nInflatable Structures\nSeeds<!b>");
			addChoice("AUTO-MYNTs", libraryExplore.bind("AUTO-MYNTs"));
			addChoice("Rings", libraryExplore.bind("Rings"));
			addChoice("Mining Tools", libraryExplore.bind("MiningTools"));
			addChoice("Inflatable Structures", libraryExplore.bind("Inflatable Structures"));
			addChoice("Seeds", libraryExplore.bind("Seeds"));
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "Seeds") {
			append("<!img:item/Roxelle's Seed.png>   Roxelle\n\n<!img:item/Som's Seed.png>   Som\n\n<!img:item/Kemp's Seed.png>   Kemp\n\n<!img:item/Marei's Seed.png>   Marei\n\n<!img:item/Septrica's Seed.png>   Septrica\n\n<!img:item/Cade's Seed.png>   Cade\n\n<!img:item/Red's Seed.png>   Red\n\n<!i>Seeds are the codes the Engine uses to spawn beings on the island. Ferals, islanders, mythos, and players all have seeds. They contain a default verb-based personality for each person.<!i>");
			addChoice("Back.", libraryExplore.bind("techhub"));
		}

		if (seg == "AUTO-MYNTs") {
			append("<!img:item/AUTO-MYNT.png>\n\n<!i>AUTO-MYNTs are tiny computers equipped with a simple Protocol interface. Their code was stolen by an unknown player, who reached into an unfinished construct ('Relaxation Game') and shared the secret to their design with Dr. Somner Lamblea.\n\nUsing a conductive chunk of meteoric rock (now known as an Auto-Chip) Dr. Lamblea equipped the computers with the ability to affect reality one layer up: to spawn and consume items on the island.\n\nSince then, the Snagglebank has claimed all rights to modify, run, sell, or interact with the machinery of AUTO-MYNTs. Under no circumstances is anyone other than Snagg, Marei, Som, Cage, or Septrica allowed to change which code the AUTO-MYNTs execute.\n\nClaims of a secret network between the AUTO-MYNTs, which allows certain privileged elites to chat with each other in perfect privacy, have not been confirmed by any islander at this time.<!i>");
			addChoice("Back.", libraryExplore.bind("techhub"));
		}

		if (seg == "Rings") {
			append("<!img:item/Pastel Ring.png>   <!img:item/Candy Ring.png>   <!img:item/Mood Ring.png>   <!img:item/Curiosity Ring.png>\n\nSee: AUTO-MYNTs.\n\nSomeone scribbled notes at the bottom of the mostly empty page:\n\n<!i>Smaller. More refined. Extra layer's worth of range on their abilities: can spawn and consume items, but can also directly affect the text on the screen. One more layer higher than regular AUTO-MYNTs.\n\nMay also be able to store code without executing it?? Unconfirmed.<!i>");
			addChoice("Back.", libraryExplore.bind("techhub"));
		}

		if (seg == "MiningTools") {
			append("The short description at the top just lists their history:\n\n• <!i>Used to save Kemp Lamblea and other trapped swampfolk from the meteorite's closed cave systems.<!i>\n• <!i>Subsequently used to open those cave systems and hopefully prevent further accidental solitary confinement.<!i>\n• <!i>Was used to carve a gash in the meteorite's eyelid. Project cancelled. Results unknown.<!i>\n• <!i>Used to open the closed cave systems under Junkport. These caves were converted into what is now the Sewer Suburbs shortly afterward.<!i>\n• <!i>Several closed cave systems in Bright Forest were opened and sold as homes, communes, or secret hideouts.<!i>");
			addChoice("Back.", libraryExplore.bind("techhub"));
		}

		if (seg == "Inflatable Structures") {
			append("An inflation enthusiast clearly scribbled out this one.\n\n<!i>Very new tech!! New and exciting. Weight restrictions turned out to be completely irrelevant. Game code does not care what is inside a balloon or balloon-like object: if it is made out of rubber and has air in it, the object will rise to a fixed height and stay there.\n\nFirst tested by the Apothecary during the construction of the False Moon. Recently tested after the reconstruction of Hyper Land.<!i>");
			addChoice("Back.", libraryExplore.bind("techhub"));
		}

		if (seg == "tutorialhub") {
			append("It's a dusty mess of beginner's guides and handbooks. They all have a sort of lazy tone, as if their authors never really expected them to be read. You notice two:\n\n<!b>Basic Commands\nThe Interpretive Loop & You<!b>");
			addChoice("Basic Commands.", libraryExplore.bind("tutorialcommand"));
			addChoice("The Interpretive Loop & Me.", libraryExplore.bind("tutorialprose"));
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "lawhub") {
			append("The Apothecary and Septrica's brothel were the main influences for the island's legal systems. They wrote the book on this stuff.\n\nLiterally. Septrica and Marei wrote a book of laws entitled <!i>The Revered Tome of How Not to Be a Fucking Assclown<!i>, a restatement of the island's criminal code.");
			addChoice("Examine T.R.T.H.N.B.F.A.", libraryExplore.bind("lawbook"));
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "lawbook") {
			msg("<!img:kink/Guest Writer.png> Guest Writer: Amy", true);
			append("<!b>§ 5 — Infliction of Emotional Distress — Essential Factual Elements<!b>
To establish a claim that a person has caused another person severe emotional distress sufficient that the accused should be shunned and punished, the complainant must prove that\n\n     1). The conduct of the accused was extreme and outrageous, taken with the intention of causing, or with reckless disregard of the probability of causing, emotional distress;\n\n     2). The accused was the proximate cause of the complainant's emotional distress;\n\n     3). The complainant actually suffered severe emotional distress;\n\n     4). The accused knew or reasonably should have known that the complainant did not or would not consent to the reasonably expected result of the accused's actions.\n\n<!i>Authorities<!i>
\"A lot of the conduct that could have been called 'outrageous' in the society of our creator is commonplace and natural in ours. Without many of the material trappings that it suffered, we both ultimately value the integrity of at least one thing: our minds. I don't see a problem with punishing people who would try to hurt or destroy them against our will.\" <!i>Issue of Snagg le Tooth<!i>, Sep. Opn. #9, Sep. Ann. Dis. 93, 98.\n\n\"Infliction of emotional distress is the organic law of our society. The wrongfulness of almost all offenses ultimately stems from the emotional distress they cause, from being too loud to keeping someone in a basement for eternity. We can carve out exceptions to the requirements of extreme and outrageous behavior, cut down on the severity of the distress the complainant needs to have suffered and endorse alternative and lesser theories of culpability, like negligence, but always lurking in the background is the one catch-all wrong that keeps our society behaved.\" Kemp Lamblea, <!i>Lamblea on Wrongdoing<!i>, §2.1. (60).\n\n\"The accused admits all of what we need to find her culpable but consent. In this, she should have reasonably expected that the complainants wouldn’t have consented if they knew what would result; and if she couldn’t have known that from the nature of the act alone, which she did, she would have after the first time she did it. It doesn’t matter that they may have consented to the initial act based upon her misrepresentations: the stupidest and most ignorant people amongst us deserve and require protection the most.\" <!i>The Pushover Cases<!i>, Panel Opn. #17 (Statt), Sep. Ann. Dis. 353, 361.\n\n\"We cannot take the complainant's claim of distress at its face value where, as in this case, the complainant has consented to and sought the result of which he now complains. Notwithstanding the paradoctrinal authorities to the contrary which negate consent to the commission of a crime, we will not adopt the doctrine that a person who has merely acted on the complainant's directions can be considered culpable for the results where he had no forewarning of the effect it might ultimately have, even if the alleged conduct was utterly outrageous on its face. To hold otherwise would effectively devastate the sacred reliance on consent which governs our society and make daily interactions a minefield of culpability for otherwise innocent actors.\" <!i>Issue of Cage Statt<!i>, Panel Opn. #12 (John), Sep. Ann. Dis. 293, 296-97.\n\n\"Some evils aren't set out in writing. We didn't have a specific rule against throwing someone off the map until someone tried it, but that didn't make it less worth punishing the person who did it. Some people say it isn't fair to punish people for things that aren't exactly written out to be wrong, but that's just stupid. What exactly is the point of letting people get off on technicalities? How does it make our society any better if psychos can walk freely amongst us without remorse because they have successfully found novel methods of mischief? The crime’s in the intent and the result. The means are ultimately besides the point.\" <!i>The Fayfeather Stalking<!i>, Panel Opn. #23 (Mauez), Sep. Ann. Dis. 570, 574-35.\n\n\"Yes, we cannot and we shall not make people perform a detailed inquiry into the mind of someone they are interacting with to decide whether their apparent consent was in fact a smokescreen for some other issue. Yes, it must be proven that a lack of consent existed in the eyes of the person to whom it is given. And so the collorary is true: the mere reasonable appearance of consent being sufficient to form a defense against culpability, so too is the reasonable appearance of nonconsent sufficient to form proof of culpability. We likewise should not be burdened with the requirement of a detailed inquiry into the subjective mindset of the accused person when they clearly should have known that consent was not present, whether because their victims uttered a safeword or there existed some other obvious appearance of nonconsent; in that case, the complainant has carried their initial burden and it is on the accused to refute the resulting presumption.\" <!i>The Annler Problem<!i>, Panel Opn. #20 (John), Sep. Ann. Dis. 539, 540.\n\n<!i>Paradoctrinal Sources<!i>\n\n• Restatement (Second) of Torts, Intentional Infliction of Emotional Distress § 46 (Am. Law Inst. 1965).\n• Restatement (Third) of Torts, Intentional Torts to Persons, Intentional (or Reckless) Infliction of Emotional Harm § 106 (Am. Law Inst. 2019).\n• 136 Am. Jur. Proof of Facts 3d 175, Proof of Intentional Infliction of Emotional Distress § 106 (Thompson Corp. 2016).\n• Avlana K. Eisenberg, Criminal Infliction of Emotional Distress, 113 Mich. L. Rev. 607 (2014).
");
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "tutorialcommand") {
			data.knownNextXCommand = true;
			append("<!14px>\"Mynt's interpretive loop is an update function that runs every frame. It checks for player commands, updates the state of the island, and more.\n\nHere are several basic commands:\n\n<!14px><!20px>Next.<!20px><!14px>\nGive Mynt control of your character for exactly one moment. Usually results in you waiting politely with your hands on your lap, or you observing the goings-on with a face like :3c.\n\n<!14px><!20px>Next x[Number].<!20px><!14px>\nGive Mynt control of your character for exactly [Number] moments. Beware: arguments, rants, and awkward silences can make one moment drag on for many.\n\n<!14px><!20px>Look around.<!20px><!14px>\nList people who'd like to interact with you and things of interest nearby.\n\n<!14px><!20px>Move along.<!20px><!14px>\nRemove yourself from any situation and return to the default player state: wandering.\n\n<!14px><!20px>Harder/Softer.<!20px><!14px>\nI told you I didn't want to include these...\n\n<!14px><!20px>Back.<!20px><!14px>\nReturn to the last place or player state.\"\n\n— John<!14px>");
			addChoice("Next.", libraryExplore.bind("tutorialcommandnext"));
			addChoice("Look around.", libraryExplore.bind("main"));
			addChoice("Move along.", JunkCity.junkCityHub);
			addChoice("Harder.", libraryExplore.bind("tutorialcommandharder"));
			addChoice("Softer.", libraryExplore.bind("tutorialcommandsofter"));
			addChoice("Back.", libraryExplore.bind("tutorialhub"));
		}

		if (seg == "tutorialcommandnext") {
			append("You stand around looking at Basic Commands for a second.");
			addChoice("Next x5.", libraryExplore.bind("tutorialcommandnext2"));
			addChoice("Back.", libraryExplore.bind("tutorialcommand"));
		}

		if (seg == "tutorialcommandnext2") {
			append("Lana's tugging your sleeve, concerned. You've been staring at one word on the page with a :3c face for a quite a while now.");
			addChoice("Back.", libraryExplore.bind("tutorialcommand"));
		}

		if (seg == "tutorialcommandharder") {
			append("You slam your face into the little handbook and read the absolute fuck out of it.");
			addChoice("Back.", libraryExplore.bind("tutorialcommand"));
		}

		if (seg == "tutorialcommandsofter") {
			append("You drag a finger along your tongue and bring it down, dripping, to touch tips with the upper corner of the next page, peeling it open wide... with a sigh you let your eyes rove over two fresh, pale stretches of words, sucking all their information deep into your pupils.");
			addChoice("Mmmf. Back.", libraryExplore.bind("tutorialcommand"));
		}

		if (seg == "tutorialprose") {
			append("This handbook is mostly about how to phrase commands to get exactly what you want out of Paraphore, but it rambles for a while at the start:\n\n\"The interpretive loop runs our universe, and I don't say that like pseudoscientists say <!i>Mynt the Catface Goddess<!i> or <!i>Divine Electrons<!i> run our universe, I say it literally. From an outside perspective we know very little about the loop: only that it was developed by Wendy, the same woman who coded Mynt, and that during its development she fed it hundreds of novels, yuri mangas, and short stories— all integrated into every facet of the code, referenced and self-referenced and self-self-referenced, and (much later) all catalogued over in the Parafiction section to your far left.\n\nCreating a universe spiderwebbed around hundreds of disconnected text files means the interpretive loop is, naturally, a buggy sprawling mess. Thanks to a mysterious hack, however, Wendy got it working pretty fast.\"");
			addChoice("Back.", libraryExplore.bind("tutorialhub"));
		}

		if (seg == "communityhub") {
			var roxelle = false;
			if (data.roxVisits > 0) roxelle = true;
			var red = false;
			if (data.redVisits > 0) red = true;
			var som = false;
			if (data.roxVisits >= 2) som = true;
			var cage = false;
			if (data.metCage > 0) cage = true;
			var kemp = false;
			if (data.metKemp > 0) kemp = true;
			append("These stacks are all books, journals, and personal documents scrounged up or donated by islanders themselves, sorted alphabetically by surname.");
			addChoice("Wolf. (Big Bad)", libraryExplore.bind("communitywolf"), {enabled: red, kinks: ["Plot"]});
			addChoice("Roxelle Devaunt.", libraryExplore.bind("communityroxelle"), {kinks: ["Scat"], enabled: roxelle});
			addChoice("Red. (Little Riding)", libraryExplore.bind("communityred"), {kinks: ["Female", "Female", "Plot"], enabled: red});
			addChoice("Dr. Somner Lamblea.", libraryExplore.bind("communitysom"), {kinks: ["Male", "Male", "Feral"], enabled: som});
			addChoice("Kemp Lamblea.", libraryExplore.bind("communitykemp"), {enabled: kemp});
			addChoice("Cage Statt.", libraryExplore.bind("communitycage"), {enabled: cage});
			addChoice("Septrica Mauze.", libraryExplore.bind("communitysep"));
			addChoice("Poems", libraryExplore.bind("communitypoems"));
			addChoice("Back.", libraryExplore.bind("main"));
		}

		if (seg == "communitypoems") {
			append("Ah, to be a leaf
       <!b>to<!b> crane towards apricity
           and strain through <!b>city<!b> sidewalk cracks
           <!b>and<!b> to get heartily dehydrated!
                               <!b>heart               rate<!b> lowering slowly
                                                                                  <!b>slow<!b>ly lowering
                                                                                               <!b>lower<!b>ly slowering
                                                                                               <!b>lower<!b> &  <!b>lower<!b>.
Ah, to <!b>smoke<!b> a leaf, though...
Oh fuck I broke the pattern #$& @#@$*
(He penned some frustrated scribbles here.)
— Kemp Lamblea
Squidboy Ink on Dried Nymph Hide Parchment, Year 32");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communityroxelle") {
			append("Rox writes mostly hero's journeys, one-dimensional villains like the school bully, slices of life, comings of age.\n\nYou pick a paragraph from a scribbled little book called <!i>MUD PIES<!i>:\n\n\"I came to realize that all the work we'd done for the contest wasn't in vain. It didn't matter that I'd puked twice and fucked everything up. It wasn't about how fat our logs were, or how crispy our pie shells, because it wasn't about the mud pies at all... the contest's real prize was the friendship we had forged along the—\"\n\nYeah you can't read any more of this.");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communitywolf") {
			append("A bunch of Red's old journals are stacked up here. You pick an older one.\n\n\"... never hated someone with such a searing fucking passion. Can't even hold the pen straight. Broke two already. Want to kill him. No respawns. No ~snuffie~ and no pleasure for either of us. Want to hurt him so deeply for so long that I hurt myself out of necessity. Want to hurt myself so bad I cancel out my own retributive satisfaction in the process. Truly want to.\"\n\n... Well... uh... you skim the next few pages before and after this rant to find out who 'he' is... but no luck.");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communityred") {
			append("It's a tiny pink journal with a carrot clasp. You pick one of the earlier entries.\n\n\"... Did a bad thing, did a <!i>really<!i> bad thing... I can feel God is judging me and I beg for His forgiveness but I know that I do not deserve it...\n\nI told Wolf she could sleep in my bed because it was three months since we slept in the same bed like we used to sleep with a player between us. I didn't want to do it Lord I promise. My body did it. It's not my fault. I just wanted to listen to her heartbeat again.\n\nAnd I trusted her not to TEMPT ME. I said specifically no I do not even want to cuddle. I only want to rest my head on your ginormo loli tits, I said, and I was joking, but she took her pajamas off, this was before we even got in bed, and I begged please don't, please don't tempt me.\n\nShe put her pajamas back on but she was upset. She wanted me. She nuzzled her snout over my neck and she played with my ears and she put her paw between my thighs and her stench of the CITY went up my nose and stuck there.\n\nLord I want you to kill me forever. Kill me so I never respawn.\n\nI didn't tell her to stop. I'm sorry. I let her. I let her.\n\nShe asked me what was wrong and nothing was wrong and she asked me if <!i>he would mind<!i> (IF HE WOULD MIND) and I said yes but I won't tell him and she said when you have ever been able to keep your mouth shut and she slipped her fingers past my lips and I said nothing because I was sucking them as hard as I could, Lord, God, kill me forever, kill me so I never respawn.\"\n\nNo mention of who 'he' is anywhere in the surrounding pages.");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communitycage") {
			append("There's an ancient binderful of business papers with Cage's name all over them. Something about swamp carpentry. From the look of the red numbers there was a huge boom around years one and two where he took way more work than he could handle. He was doing overtime trying to keep the growth up, hiring guys left and right.\n\nThe numbers caught up. It didn't work out.");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communitysom") {
			append("Som's written stacks upon stacks upon stacks of gay erotica. You crack a booklet titled THE SPICY FARMHAND'S MORNING CHORES #27.\n\n\"Craig the spicy farmhand stretched his immaculate torso in the 5:00 AM dawn light, up at the crack so they say. Well, his crack was certainly up. He was stretching to his toes now, sticking his ass out in the dewy air, oh, man, it drove Roxanna the farm owner crazy. He jacked his beefy cock in the kitchen, looking out the window at his spicy farm stud. OH man it was gonna be cum pies for brunch if he kept at it like this.\n\nThe spicy farmhand got around to doing all his chores finally which involved milking the cows with his mouth and feeding the piggies also with his mouth. Those dang old chores kept taking him so long. Roxanna couldn't believe his eyes when he say that spicy farmhand making out with the biggest horniest piggy on the whole farm oh jeez oh MAN he was GONNA cum.\"\n\nThe image of that little lamb getting all flustered at his tech table writing this stuff is stuck in your head now.");
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communitykemp") {
			append("Kemp's quite the writer, actually. He's done a few romantic novels, a few mystery, five essays, two almanacs specifically tailored for the cultivation of sweetgrass. Heck, some of his curly Sweetgrass Leaf bookmarks are still in these.\n\nStill, it's all pretty... Kempish. Over-friendly rambling dudebro speak.\n\nYou read a paragraph from an essay on kindness:\n\n\"So my thesis, I guess, is that we gotta take our stress out NOT on ferals (COUGH CARNIVORES COUGH) nor on other fuckin people, but on subs (who eat that shit up) or on Fuckmeat (which are basically cute squishy lil fuckin stress balls to begin with) like I can't even fuckin believe how you people justify killing shit when we all respawn and don't NEED to tear a chunk outta some poor little bastard to survive in the first place...\"\n\nHis thesis <!i>is<!i> a single sentence... it's just three pages long. One page, if you don't count the 'fuckin's.");
			if (!data.libraryReadKemp) addToItem("Sweetgrass Leaf", 16);
			data.libraryReadKemp = true;
			addChoice("Back.", libraryExplore.bind("communityhub"));
		}

		if (seg == "communitysep") {
            append("The only thing left here is a speech given around Year 5: <!i>On Our Worth.<!i>\n\n\"Considering our situation, we can assume sentient life may exist at tiny scales in the universe.\n\nIf an atomic People found that their observable universe was expanding and searched long and Hard enough for an explanation, they'd have equal chances of discovering that they exist inside a lover's dialating pupil as they would a rising bubble in a steamy pool of diarrhea.\n\nStill, they would inspect their diarrhea pool with scientific rigor, determining liquid physics On this scale, learning that bubbles are pockets of \"gas\" in \"liquid\" and that disparate densities cause them to rise and expand. They might predict their demise in a great <!i>pop<!i>. After enormous effort spent exploring Not only their own universe but the upper scale containing it, they might discover that they were born from the lower half of a massive life form, a thousand bubbles and bigger, yes, prove the existence of god!— and then, analyzing the sound waves from her other end for Eons, learning phonemes, syntax, meaning, they might come to their final discovery before the <!i>pop<!i> and decipher the answer to that ultimate question: <!i>What are we?<!i>\n\nAnd from the mouth of god they would know their existence is shit.\n\nThe universe is absurd. It's stupid to determine our worth or worthlessness from the fact that we're words on a screen.\"");
            addChoice("Back.", libraryExplore.bind("communityhub"));
        }

		if (seg == "fictionhub") {
			if (!data.libraryJohnIntro) {
				data.libraryJohnIntro = true;
				data.metJohn++;
				append("A FIELD RESEARCH van sits parked just outside this section in a neat little library-garage.\n\nUnderneath, a golden retriever's grease-splotched bottom half sticks out, cockbulge skyward, toes twiddling. He's tinkering away at the engine's underbelly.");
				addChoice("Hello?", libraryExplore.bind("johnhello"), {kinks: ["Plot", "Male"]});
				addChoice("Grope his bulge~", libraryExplore.bind("johngrope"), {kinks: ["Plot", "Male"]});
				addChoice("Look around.", libraryExplore.bind("main"));
			} else {
			append("<!i>ATTENTION,<!i> says a sticky note on the Parafiction sign. <!i>These texts were all copied from the interpretive loop and they are NOT the property of the L.L.L. so for fuck's sake HANDLE WITH CARE. NO DOG EARS!!!<!i>\n\nYou notice four: one about a desert planet, one about a crusty old dude, one about a kid on a beach, and one about a suicide.");
			addChoice("Desert.", libraryExplore.bind("desert"));
			addChoice("Angel.", libraryExplore.bind("angel"));
			addChoice("Beach.", libraryExplore.bind("beach"));
			addChoice("Suicide.", libraryExplore.bind("suicide"));
			addChoice("Look around.", libraryExplore.bind("main"));
			}
		}
		
		if (seg == "johnhello") {
			StoryUtils.quickMynt("John");
			append("He rolls out, peeved.\n\n\"Look, Marei, I told you, I don't have time to—\"\n\nHis eyes lock on the \"<!b>"+data.playerName+"<!b>\" floating above your head.\n\nA single drop of grease falls from the tip of his snout.\n\n\"You came back,\" he says, voice cracking. \"You really came back.\"");
			addChoice("Was I here before?", libraryExplore.bind("john1"));
		}

		if (seg == "johngrope") {
			StoryUtils.quickMynt("John");
			append("He rolls out, hurt.\n\n\"Excuse me, sorry, but that's sexual hara—\"\n\nHis eyes lock on the \"<!b>"+data.playerName+"<!b>\" floating above your head.\n\nA single drop of grease falls from his open muzzle.\n\n\"You came back,\" he says, voice cracking. \"You really came back.\"");
			addChoice("... Was I here before?", libraryExplore.bind("john1"));
		}

		if (seg == "john1") {
			append("\"One moment.\"\n\nHe sprints to the beaten garage sink and splashes soap all over himself, yanking his shirt off (dang he's got some tight abs) then pulling on a fresh one, all frantic— now he can run back and bow his head before you, presentable.\n\n\"Humans,\" he answers, reverent. \"Humans were here before.\"");
			addChoice("Other players, you mean.", libraryExplore.bind("johnmean"));
			addChoice("So...?", libraryExplore.bind("johnso"));
		}

		if (seg == "johnmean") {
			append("\"Of course. My apologies. 'Human' isn't like a slur, is it? Do you prefer 'players'?\"");
			addChoice("Just "+data.playerName+" is fine.", libraryExplore.bind("johnnext"));
		}

		if (seg == "johnso") {
			append("\"So,\" he says, face down, eyes up. \"So we've been worried sick about you. In particular we feared apocalypse.\"");
			addChoice("Oh.", libraryExplore.bind("johnnext"));
		}

		if (seg == "johnnext") {
			append("He offers a paw, stiff and formal. \"I haven't introduced myself. My name is John.\"");
			addChoice("Odd name for a dog. (Shake.)", libraryExplore.bind("johnshake"));
			addChoice("Loosen up, Johnboy~! (Hug.)", libraryExplore.bind("johnhug"));
			addChoice("Yo J. You can call me Galaxy Wizard. (Fist bump.)", libraryExplore.bind("johnfist"));
		}

		if (seg == "johnshake") {
			append("You give him a firm, businesslike shake. He grins super hard and relishes it.\n\n\"I picked the name out myself.\" He pops the van's hood and tinkers topside now. \"My character's name was Kau. Spawned with that. About twenty years after impact I started searching Parafiction— sorry, just regular old fiction to you— searching for something more human. The L.L.L. was tiny back then. Just big enough that you could hide from the politics. I kinda got swept up in em anyway. Um.\"\n\nHe forces himself back to the point: \"After all that reading I came up with John. Really generic, I know— but no one here can tell the difference. So it's just a cool good name. So I'm John.\"\n\nHe scrapes around under the van's hood. Flakes of blue float up with the breeze.\n\nHe doesn't pick the conversation back up, but his tail is wagging excitedly.");
			addChoice("Whatcha workin' on there?", libraryExplore.bind("johnnext2"));
			addChoice("Whatcha workin' on there bud?", libraryExplore.bind("johnnext2"));
			addChoice("Whatcha workin' on there pup?", libraryExplore.bind("johnnext2"));
			addChoice("Whatcha workin' on there stud?", libraryExplore.bind("johnnext2"));
			addChoice("Whatcha workin' on there slut?", libraryExplore.bind("johnnext2"));
			addChoice("Whatcha workin' on there fucksock?", libraryExplore.bind("johnnext2"));
		}

		if (seg == "johnhug") {
			append("You wrap him up in a big squeezy hug. His ears flop with the force of the impact.\n\n\"Ah,\" he says, unblushing, patting you on the back. \"Yes, thank you. Yes. I appreciate your affection.\"\n\nHe wiggles out a little too soon and busies himself under the van's hood. He keeps glancing at you and the glowmoss encrusted on his underhood, conflicted between embarassment and reverence.\n\nHe scrapes around under the van's hood. Flakes of blue float up with the breeze.");
			addChoice("Whatcha workin' on there?", libraryExplore.bind("johnnext2"));
		}

		if (seg == "johnfist") {
			data.johnGWizard = true;
			append("He keeps his fingers spread for a handshake while you nuzzle your knuckles into his palm. It makes a turkey.\n\n\"Right. Well. Nice to meet you... G. Wizard.\"\n\nHe scrapes around under the van's hood. Flakes of blue float up with the breeze.");
			addChoice("I had a van like that back in the sixties, except instead of FIELD RESEARCH it said MYSTERY MACHINE on the side.\n................. So....................... whatcha workin' on?", libraryExplore.bind("johnnext2"));
		}

		if (seg == "johnnext2") {
			append("\"She's been making a real vicious purr whenever I haul in any specimen over a hundred pounds,\" John says. \"Basically, I may or may not have to scrape some rogue fungus from her fuel filter.\"");
			addChoice("Sounds gross.", libraryExplore.bind("johnnext3"));
			addChoice("Sounds fun.", libraryExplore.bind("johnnext3"));
			addChoice("Sounds kinda hot.", libraryExplore.bind("johnnext3"));
		}

		if (seg == "johnnext3") {
			append("\"Yeah.\"\n\n<!i>Scrape. Scrape. Scrape-scrape.<!i>");
			addChoice("So... wanna fuck, or like...?", libraryExplore.bind("johnfuck"));
		}

		if (seg == "johnfuck") {
			append("John freezes.\n\n\"No, sorry.\"");
			addChoice("Hey it's alright.", libraryExplore.bind("johnalright"));
			addChoice("So... wanna tell me why not, or like...?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright") {
			append("John relaxes. He goes back to that familiar <!i>scrape<!i>.\n\n\"Yes. Yes, thank you. You're a lot less persistent than the others. I still worry about Lana, sometimes. When he stays up too late, and all the junk memory starts to coagulate in his kinky little brain, and just as you might expect of a librarian, too, he'll give me a look with the bags under his eyelids glowing purple like he wants to loan me out, spread me open, and flick a couple pages over, if you get what I mean. I mean if you see what I'm trying to say. You see?\"");
			addChoice("I see! Yes, sexual book innuendos. Good.", libraryExplore.bind("johnalright2"));
			addChoice("So... wanna tell me why not, or like...?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright2") {
			append("He nods. \"I try not to seem uptight, is all. I don't like saying 'cock.' Mynt narrates it all the time. And 'slut.'\"");
			addChoice("It's fine. But I kind of have a nagging question.", libraryExplore.bind("johnalright3"));
			addChoice("So... wanna tell me why not, or like...?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright3") {
			append("His little doggy butt is covered by jeans and kept neutral, not exposing too much of any particular shape. He reaches a paw down, deep deep down, towards his swollen... throbbing.... stomach— he had just eaten a great meal, cooked by Lana, no doubt— and he ran a paw slickly over his left ear, smoothing it out, just in case the curve of the fold set you off too much. With every ounce of his being he exuded uptightness.\n\n\"A question? Sorry, hold on. She's narrating me like I'm uptight, isn't she.\"");
			addChoice("Yes.", libraryExplore.bind("johnalright4"));
			addChoice("So... wanna tell me why we can't get a bone on, or like...?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright4") {
			append("I'll stop. Sorry.");
			addChoice("You better!", libraryExplore.bind("johnalright5"));
			addChoice("So... wanna tell me why we can't fuuuuuck, or like...?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright5") {
			append("I stop.\n\nI start narrating again, as usual. I just pick it right up, like a journal off the library floor.\n\nSorry, where were we?\n\n\"Yes, Mynt, we were just agreeing to definitely not fuck each other.\"");
			addChoice("I have a nagging question related to that.", libraryExplore.bind("johnalright6"));
			addChoice("Yo why can't we fuck?", libraryExplore.bind("johntell"));
		}

		if (seg == "johnalright6") {
			append("\"Oh, sorry! Yes. Go ahead and ask.\"");
			addChoice("Oh. Well. Just uh.", libraryExplore.bind("johntellpre"));
		}

		if (seg == "johntellpre") {
			append("\"Yes?\"");
			addChoice("Uh you see", libraryExplore.bind("johntellpre2"));
			addChoice("So like um", libraryExplore.bind("johntellpre2"));
		}

		if (seg == "johntellpre2") {
			append("\"You were wondering why?\"");
			addChoice("See, you uh", libraryExplore.bind("johntell"));
			addChoice("Um like so", libraryExplore.bind("johntell"));
		}

		if (seg == "johntell") {
			append("\"I glitched my penis in a shipwreck.\"\n\nHe stuffs his reddening face as deep under the hood as he can. \"Please don't laugh.\"");
			addChoice("I just remembered, I have thing to go do. (Stifle giggles.)", libraryExplore.bind("johnleave"));
			addChoice("... Hey don't worry, I'm into that! Can I see it~?", libraryExplore.bind("johnsee"));
		}

		if (seg == "johnsee") {
			append("\"I'm not... I'm not comfortable with that kind of stuff. Libido's gone.\"");
			addChoice("Ah. That must really suck in a place like this.", libraryExplore.bind("johnsee2"));
		}

		if (seg == "johnsee2") {
			append("He smiles and shakes his head. \"It's alright. I just read books and hang out with Lana. He understands.\"");
			addChoice("Mmm. Move along.", libraryExplore.bind("johnleave"));
		}

		if (seg == "johnleave") {
			append("\"Wait...!\" John begs, though he still can't look at you. \"I... just one question, before you go...\"");
			addChoice("Yes?", libraryExplore.bind("johnleave2"));
		}

		if (seg == "johnleave2") {
			append("A zephyr rushes through the library and ruffles John's golden fur. It licks a few paperbacks open on the shelf, too, playing with their pages.\n\nHe's hiding a hopeful smile. \"It takes a while for me to warm up, and I... well, I'll just ask: how long will you be playing for?\"");
			addChoice("...", libraryExplore.bind("johnleave3"), {kinks: ["Plot"]});
		}

		if (seg == "johnleave3") {
			cameraFadeOut(0xFFFFFF, 3);
			disablePause();
			append("A zephyr rushes through the library and ruffles John's golden fur. It licks a few paperbacks open on the shelf, too, playing with their pages.\n\nHe's hiding a hopeful smile. \"It takes a while for me to warm up, and I... well, I'll just ask: how long will you be playing for?\"");

			
			timer(4, function() {
				playMusic("cell");
				cameraFadeIn(0xFFFFFF, 3);

				var timerBlinkInc:Float;
				timerBlinkInc = 1.165;
				for (i in 0...7) {
					timer(timerBlinkInc, playSound.bind("assets/audio/environment/powerBlink"));
					timerBlinkInc += 2.36; //The most magic of numbers. Delaying each playSound by this duration will make it sync up with the power blinking animation.
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

				squeezy.alpha = 0;
				
				var background:MintSprite = addSprite("assets/img/intro/titleScreen.png");
				var monitor:MintSprite = addSprite("assets/img/intro/monitor.png");
				var monitorWhite:MintSprite = addRectSprite(494, 343, 0xFFFFFF);

				//Zoom out from the white screen
				background.centerPivot = true;

				monitor.centerPivot = true;
				
				monitorWhite.x = 155;
				monitorWhite.y = -156;
				monitorWhite.centerPivot = true;

				background.scaleX = background.scaleY = monitor.scaleX = monitor.scaleY = monitorWhite.scaleY = monitorWhite.scaleX = 3;
				tween(background, {scaleX: 1, scaleY: 1}, 6, {ease: QUART_OUT});
				tween(monitor, {scaleX: 1, scaleY: 1}, 6, {ease: QUART_OUT, onComplete: tween.bind(monitor, {alpha: 0}, 2, {ease: QUAD_OUT})});
				tween(monitorWhite, {scaleX: 1, scaleY: 1, y: 35}, 6, {ease: QUART_OUT, onComplete: tween.bind(monitorWhite, {alpha: 0}, 3, {ease: QUAD_IN})});
			});

			timer(22, function() {
				cameraFadeOut(0x920a0a, 1.2);
			});

			timer(24, function() {
				LLL.libraryExplore("johnleave4");
			});
		}

		if (seg == "johnleave4") {
			playMusic("apothecary");
			enablePause();
			cameraFadeIn(0x920a0a, 3);
			append("\"It's okay if you can't stay long,\" he adds. \"Just, you know... we've been lonesome for half a century, so if it's not too much of a hassle please tell your friends to visit in your stead!\"");
			addChoice("The shelter power is almost out. There are some ways to reroute it, but...", libraryExplore.bind("johnpower"));
		}

		if (seg == "johnpower") {
			append("\"Oh.\"\n\nHe turns back to his van, tail drooping.\n\n\"Forgive me, but... let's keep this formal, then. The whole 'man's best friend' thing, you understand— I'd rather not get attached.\"\n\nJohn shoots you a faltering smile. \"Forgive me for all this sappy stupid bullshit coming out of my mouth. It was a pleasure to meet you.\"\n\nHe shakes your hand <!i>vigorously.<!i> If it were anyone else, you would think it was an attempt to dom you.");
			addChoice("You too.", libraryExplore.bind("main"));
		}

		if (seg == "desert") {
			append("\"\'There's an internally recognized beauty of motion and balance on any man-healthy planet,\' Kynes said. \'You see in this beauty a dynamic stabilizing effect essential to all life. Its aim is simple: to maintain and produce coordinated patterns of greater and greater diversity. Life improves the closed system's capacity to sustain life. Life— all life— is in the service of life. Necessary nutrients are made available to life <!i>by<!i> life in greater and greater richness as the diversity of life increases. The entire landscape comes alive, filled with relationships and relationships within relationships.\'\"\n\n— Dune, Frank Herbert.");
			addChoice("Back.", libraryExplore.bind("fictionhub"));
		}

		if (seg == "angel") {
			append("\"The angel was the only one who took no part in his own act. He spent his time trying to get comfortable in his borrowed nest, befuddled by the hellish heat of the oil lamps and sacramental candles that had been placed along the wire. At first they tried to make him eat some mothballs, which, according to the wisdom of the neighbor woman, were the food prescribed for angels. But he turned them down, just as he turned down the papal lunches that the pentinents brought him, and they never found out whether it was because he was an angel or because he was an old man that in the end ate nothing but eggplant mush. His only supernatural virtue seemed to be patience. Especially during the first days, when the hens pecked at him, searching for the stellar parasites that proliferated in his wings, and the cripples pulled out feathers to touch their defective parts with, and even the most merciful threw stones at him, trying to get him to rise so they could see him standing.\n\nThe only time they succeeded in arousing him was when they burned his side with an iron for branding steers, for he had been motionless for so many hours that they thought he was dead. He awoke with a start, ranting in his hermetic language and with tears in his eyes, and he flapped his wings a couple of times, which brought on a whirlwind of chicken dung and lunar dust and a gale of panic that did not seem to be of this world. Although many thought that his reaction had not been one of rage but of pain, from then on they were careful not to annoy him, because the majority understood that his passivity was not that of a hero taking his ease but that of a cataclysm in repose.\"\n\n— A Very Old Man With Enormous Wings, Gabriel Garcia Marquez.");
			addChoice("Back.", libraryExplore.bind("fictionhub"));
		}

		if (seg == "beach") {
		append("\"He became absorbed beyond mere happiness as he felt himself exercising control over living things. He talked to them, urging them, ordering them. Driven back by the tide, his footprints became bays in which they were trapped and gave him the illusion of mastery.\"\n\n— Lord of the Flies, William Golding.");
		addChoice("Back.", libraryExplore.bind("fictionhub"));
		}

		if (seg == "suicide") {
			var s:MintSprite = addSprite("assets/img/effect/pinkCigarette");
			s.x = GAME_WIDTH-s.width*1.1;
			s.y = GAME_HEIGHT-s.height-100;
			var hitbox:MintSprite = addRectSprite(s.width, s.height, 0);
			hitbox.alpha = 0;
			hitbox.x = s.x;
			hitbox.y = s.y;
			hitbox.onReleaseOnce = function() {
				stopChannel("music");
				hookClear(function() {
					data.currentSong = "";
					playMusic("junkCity");
				});
				playSound("assets/audio/ui/tak");
				getUrl("https://youtu.be/TwWQYg7aS5o");
			}
			append("Hush me, touch me 
Perfume, the wind and the leaves 
Hush me, touch me 
The burns, the holes in the sheets

I'm hoping the smoke 
Hides the shame I've got on my face 
Cognac and broken glass 
All these years I've been your ashtray (not today)

I found a pink cigarette 
On the bed the day that you left 
And how can I forget that your lips were there 
Your kiss goes everywhere, touches everything but me

Hush me, touch me 
Champagne, your hair in the breeze 
Hush me, touch me 
Lipstick, a slap on my cheek

Your eyes cried at last 
Told me everything I was afraid to ask 
Now I'm dressed in white 
And you've burned me for the last time (this ain't the last time)

I found a pink cigarette 
On the bed the day that you left 
And how can I forget that your lips were there 
Your kiss goes everywhere, touches everything but me

You'll find a note and you'll see my silhouette

There's just five hours left until you find me dead 
There's just four hours left until you find me dead 
There's just three hours left until you find me dead 
There's just two hours left until you find me dead 
There's one more hour and then you will find me dead 
There's just

— Pink Cigarette, Mr. Bungle.");
			addChoice("Back.", libraryExplore.bind("fictionhub"));
		}

		if (seg == "biologyhub") {
			append("Lana's scribbly writing illuminates the hierarchy of beings within Paraphore, in order from least to most sentient.\n\n<!b>Diseases/Insects<!b>\n<!b>Flora<!b>\n<!b>Ferals<!b>\n<!b>Islanders<!b>\n<!b>Mythos<!b> (Non-native)\n<!b>Paraphores<!b> (Non-native)\n\n... Also there's some \"biology-based fiction\" in here too, you guess.");
			addChoice("Diseases/Insects.", libraryExplore.bind("entitydiseases"));
			addChoice("Flora.", libraryExplore.bind("entityflora"));
			addChoice("Fauna.", libraryExplore.bind("entityferals"));
			addChoice("Islanders.", libraryExplore.bind("entityislanders"));
			addChoice("Mythos.", libraryExplore.bind("entitymythos"));
			addChoice("Paraphores.", libraryExplore.bind("entityparaphores"));
			addChoice("\"Biology-based fiction.\"", libraryExplore.bind("biologymisc"));
			addChoice("Look around.", libraryExplore.bind("main"));
		}
		
		if (seg == "entitydiseases") {
			append("Diseases combine the <!b>spores<!b> subroutine, found in mushroom code, with the <!b>mass-breeding<!b> and <!b>parasitism<!b> subroutines from insect code. With the exception of the highly non-contagious Glowjuice virus, all known diseases are STDs.\n\n<!b>H.C.L.D.B.B.V.  <!img:kink/Scat.png>  <!img:kink/Piss.png><!b>\n— Highly Contagious Laxative Diuretic Bowel Bladder Voiditis. It does what you'd think.\n\n<!b>Stickyheart Syndrome<!b>\n— Converts all bodily fluids into cum. Interesting to note that the cum will never be from the carrier's own nuts, if they have any. It will always be the cum from patient zero's cock, transferred from their body down through the bodies of each infected person. In some sense they have impregnated thousands with one cumshot.\n\n<!b>Fuckmeat/Rapemeat<!b>\n— Nonsentient infantile entities based on Islander models. Not technically a disease or an insect, but they operate on the same level. They may be created through a mixture of cum and dissolved  <!img:item/Capsule.png> Capsules within the body. Their simplistic behaviour functions include movement presets (such as wiggling, teasing, sucking, bouncing, and squirming), modified by a direction (away or toward sexual situations, determined by their Fuck/Rape toggle state), and several basic responses to pain and pleasure.\n\n<!b>Glowvirus<!b>\n— We know very little about this disease. Research is ongoing. Here's what we know so far:\n\n<!b>Origin:<!b> Bright Forest. First recorded in Year 40. Advanced decay in mosquito colonies suggests it was present in the ecosystem from Year 1 or earlier.\n<!b>Common Hosts:<!b> Insects, plants (including glowberries and glowshrooms), smaller ferals. Contagiousness is inversely proportional to the body mass of potential carriers. Big ferals and islanders are rarely infected.\n<!b>Agent:<!b> The method of infection is unknown.\n<!b>Symptoms:<!b> Carriers attempt to consume other creatures or attempt to be consumed by other creatures in turns. The reason is unknown.\n<!b>Cure:<!b> No cure found.\n<!b>Codebase:<!b> This disease accepts and sends function calls from within itself. It shares no functions with Paraphore's code.");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}
		
		if (seg == "entityflora") {
			append("Flora range in complexity from algae to trees. For sentient plants like overlarge venus flytraps or whore trees, see <!b>Mythos.<!b>\n\nImportant note: Only Bright Forest's flora has been recorded here. Tranquilizer bombing during wartime eradicated all plant life from Junk City, and Spicy Swamp's ecosystems were wiped out with the impact of the meteorite (see <!b>Paraphores<!b>).\n\n<!b>Seascum<!b>\n— Simplistic plankton. Due to shoddy code, it's able to photosynthesize moonlight. Some insects feed on this. Infected with <!b>Glowvirus.<!b> See <!b>Diseases/Insects<!b> for more information.\n\n<!b>Glowberry Bushes/Trees, Glowcorn, Glowmoss<!b>\n— Regular plant life infected with <!b>Glowvirus.<!b> See <!b>Diseases/Insects<!b> for more information.\n\n<!b>Sweetgrass<!b>\n— Curly, homosexual grass with hallucinogenic sedative properties. Smoked recreationally. Ground and refined to create sweetdust, which may then be distilled into Sweetgrass Tea of varying potency and tranquilizer of invariably high potency.\n\n<!b>Bramblesnatches<!b>\n— Fungi fused with meteoric metals which were unearthed during the mass mining operations of Years 0-5. Herbivorous and magnetized.\n\n<!b>Snagweed<!b>\n— Strangles small ferals. Relatively unknown.\n\n<!b>Sliproot<!b>\n— Knobs of root matter native to Junk City which exude a sweet lubricant in order to attract insects. This is the same natural lubricant found inside Fuckmeat.\n\n<!b>Scragglescrub<!b>\n— Thin, needy little shrubs which thrive on cum and groundwater. If any one stem is overloaded with cum, other nearby scragglescrubs will slurp it out.");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}
		
		if (seg == "entityferals") {
			append("Contrary to popular belief through Years 0-35, ferals <!b>do not<!b> operate on the same level as insects, diseases, and plants. We have reason to believe that ferals are as sentient as we are.\n\nThey use the same calls for pleasure and pain. They can form bonds with us and each other. They rarely dom, unless trained, but fuck frequently among themselves, and even appear to enjoy subbing as long as trust has been established.\n\nAll mentally sound ferals are inherently innocent. They cannot understand the world deeply enough to hold grudges or premeditate cruelty. If fed and watered sufficiently, even carnivores will avoid hurting others to the best of their ability.\n\nFerals do not respawn. See <!b>Patch Notes<!b> entry #3 for more information on this.");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}
		
		if (seg == "entityislanders") {
			append("See <!b>Community Writing<!b> to hear about us firsthand.");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}
		
		if (seg == "entitymythos") {
			append("Mythological islanders (Mythos) are people spawned bi-weekly from the Violet Meteorite (see <!b>Paraphores<!b>). The Daydream Journal does not appear to spawn them. Mythos also come in feral form, such as elementals and dragons. They display a greater capacity for intelligence and sexual deviancy than ferals native to the island. Like native ferals, however, they do not respawn.\n\n<!b>Nymphs<!b>\n— Nymphs are creatures with fishlike skin, wings, and a penchant for alcoholism. They were the first to claim and colonize Nymphore, the spring from which all mythological life spawns. They're almost always ageless cubs, feral nymphs included.\n\n<!b>Whore Trees<!b>\n— They're basically just trees, except cum/piss/water/beak softener/pretty much any liquid splattered onto them causes their bark to fall off.\n\n<!b>Dragons<!b> (Feral)\n— Sweet-toothed monstrosities that lay eggs through their cocks. They are all doms, which makes breeding difficult for them; they have to find a non-dragon capable of taking a dick their size. For this reason, they absolutely love size queens.\n\n<!b>Goo Beasts<!b> (Feral)\n— Mostly harmless, although you may drown if one absorbs you. Trash variations capable of cross-species reproduction have evolved within Junk City.\n\n<!b>Hyper-Flytraps<!b> (Feral)\n— Most flytraps die within the first few days of life on the infertile rocks of Violet Meteorite, but some manage to have their seeds blown off on high winds, down to Bright Forest. Their bodies are entirely androgynous until someone begins treating them like a boy or a girl or a both. <!i>DO NOT<!i> overfeed.\n\n<!b>Gryphons<!b>\n— Highly intelligent and very reclusive. Afraid of fire. Although their bodies are feral, they communicate through telepathic imagery. They share the same androgyny of flytraps, except they're able to swap their genitals at will.\n\n<!b>Goblins<!b>\n— Sentimental little things who love performing family relationships, especially parent-child. Their bodies are mostly hollow and muscled inside, and their leathery skin is very stretchable, so they have the ability to redistribute liquid mass around their bodies, upsizing butts or tits or cocks with ease. Their sentimentality prevents them from ever straying far from the meteorite, although some have become bold over time and moved to its very edges.\n\n<!b>Chimeras<!b>\n— Chimeras spawn with the default character model (a gray humanoid) until they fall in love. They then copy the body and identity of their lover. Only two have ever been recorded in existence: Mikey J and Cade.\n\nFeral chimeras should exist, but due to their aggressive affection, they have yet to be observed. Hearsay (note: zero proof!!) claims they purposefully seduce islanders, copy their identities, lure them back into their caverns, collapse the entrance, and take that islander's place like a true malicious doppelganger. This is clearly urban legend.\n\n<!b>Important note:<!b> While some other mythos such as \"potato cats\" have recently spawned, one quirky creature does not constitute a category. This section is reserved for species, not individuals.");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}
		
		if (seg == "entityparaphores") {
			append("(There are parenthetical scribbles all over here for clarity.)\n\n\"Paraphores\" are sentient objects. Yeah, we have no idea how that works either. We can count the things we know about them on one hand:\n\n<!b>1.<!b> There are two that we can observe: the Violet Meteorite, and the Daydream Journal.\n\n<!b>2.<!b> At least one of them (Daydream Journal) has been observed recording the actions of players. The information they record is illegible to us.\n\n<!b>3.<!b> Violet Meteorite landed when the game was first turned on, crushing the area in the center of the island (Spicy Swamp) and trapping several swampfolk within its caverns (Septrica, Marei, Snagg, Cage, Kemp). Thanks to mining efforts on behalf of Som and the first two rescued islanders (Septrica and Marei), as well as respawn system adjustments made by Wendy well before her disappearance (see <!b>Patch Notes<!b> entry #1) all swampfolk but Kemp were saved from isolation within the first year after impact.\n\n<!b>4.<!b> The scope of their code envelops the rest of the game, and thus their class title (Paraphore) must have overrode the game's original title. It was either Library 2 or Mynt, we don't know which.\n\n<!b>5.<!b> \"Paraphore\" appears to be a nonsense name. It sounds kind of cool, at least, we guess. The best interpretation we can make is \"Bearer of\" (phore) and \"Beyond\" (para). Literally no one is pretentious enough to call them the <!i>Bearers of the Beyond,<!i> though.\n\n(Except John.)");
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}

		if (seg == "biologymisc") {
			append("This section is mostly porn dressed up as reproductive biology. You notice three:\n\n<!b>The Butler's Company: Anatomical Study of 'Yaoi'\nBALL FONDLERS\nFallopia<!b>");
			addChoice("The Butler's Company.", libraryExplore.bind("biologybutler"), {kinks: ["Male", "Male"]});
			addChoice("BALL FONDLERS.", libraryExplore.bind("biologyball"), {kinks: ["Abuse", "Blood"]});
			addChoice("Fallopia.", libraryExplore.bind("biologyfallopia"), {kinks: ["Female", "Female", "Female", "Female", "Female"]});
			addChoice("Back.", libraryExplore.bind("biologyhub"));
		}

		if (seg == "biologybutler") {
			append("<!i>Ever since that day I knew... I knew I wanted to feel your penis inside of me, senpai.\n\nE-Eh?! Don't be lewd!<!i>\n\n\"Yaoi is truly the most interesting form of parafiction; as you can see in this panel, Sasuke-chan's hands are freakishly large. This is one of many anatomical curiosities we'll be studying throughout this chapter— so far, the Handjob Theory proposed by Dr. Lamblea is considered the most credible explanation we have for this phenomena. Its hypothesis is that the <!i>seme<!i>'s palm girth allows him to cover more surface area and provides a higher, hotter level of friction whilst he jacks—\"\n\nYou can't go on.");
			addChoice("Back.", libraryExplore.bind("biologymisc"));
		}

		if (seg == "biologyball") {
			append("AN ACTION-ROMANCE NOVEL, the cover screams.\n\nYou flip it over and read the teaser sentence on the back:\n\n\"THE BALL FONDLERS ARE A FOUR-MAN TEAM OF ACES HIRED BY THE U.S. GOVERNMENT TO PUT A STOP TO A BUDDING TERRORIST ORGANIZATION DISCOVERED DEEP IN THE JUNGLE— NOW, TOGETHER, THIS FIESTY FOURSOME WILL HAVE TO BRING NEW DEFINITION TO THE WORD PAIN AND SHOOT THEIR WAY INTO A SECRET MILITARY BASE FLIPPING JEEPS AND CRASHING HELICOPTERS ALL WHILE FONDLING THE FUCK OUT OF EVERY PAIR 'A DASTARDLY TERRORIST TESTICLES THEY CAN GET THEIR BEEFY MITTS ON!!!!!!!!!!\n\n*Educational testes biology pamphlet free with this edition.\"");
			addChoice("Back.", libraryExplore.bind("biologymisc"));
		}

		if (seg == "biologyfallopia") {
			append("It's a sprawling sci-fi novel about a gaseous planet called Fallopia. The fallopians are aliens with vaginas for every orifice, mouth, ears, everything, even two tiny pussy nostrils. The plot follows Ale'Zatiixi, an impoverished fallopian, on her journey to the planet's core, where the gas solidifies into rubbery silicon— there, she must navigate the Dildo Labyrinth constructed there by the antagonist, Daedalus. If she can kill him, his empire will be hers... but if at any point the labyrinth's throbbing cockwalls happen to penetrate every orifice on her body at once, she'll be identified (correctly) as a threat to Daedalus and his gyrating architecture will spit her back out at the entrance.\n\nAle learns about herself along the way. She has to fail the labyrinth eighty-seven times before she finally realizes who she really is: a slut so massive she'll never be able to make it all the way to Daedalus without stopping at least once to fill her entire body with cock.\n\nShe gives up, marries him, and spends the rest of her life ruling over the planet's core, blind, deaf, and dumb with dicks in every hole.");
			addChoice("Back.", libraryExplore.bind("biologymisc"));
		}

		if (seg == "playerhub") {
			append("\"For two glorious weeks after impact, Paraphore was flooded with players,\" an info plaque reminisces. \"They had just enough time to fuck us all hard and dream up a couple choose-your-own-adventure's in their Journals. Some blushed and read their fantasies aloud. Others ripped the pages out and hid them. It made no difference— our little librarian collected, edited, dusted off, laminated, and modernized every page (except sixteen unreadable ones) right here in the L.L.L. May their authors never be forgotten.\"\n\n<!b>The Verminlion Trickster — RyuFire<!b>");
			addChoice("The Verminlion Trickster.", libraryExplore.bind("villain1"), {kinks: ["Guest Writer", "Male", "Raunch"]});
			addChoice("Look around.", libraryExplore.bind("main"));
		}

		if (seg == "villain1") {
			data.roddyVillainDone = true;
			msg("<!img:kink/Guest Writer.png> Guest Writer: RyuFire", true);
			append("A familiar rat bumps into your shoulder as he runs off, dropping something, vaulting over a nearby fence. Not too long after, a few Doberman police officers run past you, looking high and low for any clues before splitting up to find the fugitive. Pondering on how they missed what the rat dropped, you walk closer to inspect it: a bright unlabeled bottle that looks like it's made from glowberries. Something is telling you to try it, but...");
			addChoice("Drink the unusual glowberry drink.", libraryExplore.bind("villain2"));
			addChoice("Have some sense for once in my digital life.", libraryExplore.bind("villainskip"));
		}

		if (seg == "villainskip") {
			append("You put the mysterious drink down, chuckling a bit from your silly thought of just drinking anything this city offers, but you can't shake the feeling of someone staring you down as you walk away.");
			addChoice("Close the book.", libraryExplore.bind("playerhub"));
		}

		if (seg == "villain2") {
			append("Popping off the cap, you hear a satisfying fizzle from the drink. Clearly whoever makes this is very invested in whatever you call these... You feel rather good about yourself, gulping down the sweet beverage without much worry. It wasn't as bad as you thought it would be... Maybe the bitter aftertaste—\n\nThen suddenly a shock passes  through your body, your legs give out, you crash down to the floor, and your vision unfocuses as the street lights start to double and spin.\n\nYou try to see if you still have any sense of locomotion, but your arms are as floppy as a pink horse dildo, and your legs twitch like a blissed-out Fuckmeat. Another wave passes through your nerves, and your head makes a subtle thump as it hits the pavement, your neck unable to support any kind of movement as your eyes helplessly struggle to stay open.\n\nSomeone walks over you with a menacing laugh, leaning to get a good look, his grin wide enough to see before your eyes close and you black out...\n\n...\"You'll do just fine, hehehe...\"");
			addChoice("Next?", libraryExplore.bind("villain3"));
		}

		if (seg == "villain3") {
			append("... With a hazy memory, you come to, your eyes adjusting to the low—lit area as you try to lift yourself up, but not all your strength's returned to you yet— you stumble down on your chest. There's also an unpleasant set of bindings around your hands as they're tied behind you. Luckily your neck is free of bondage. You look around, eyes nearly adjusted to the dim room, when a flash of light coats the area. Nearly blinded, you squint to see a figure approaching.");
			addChoice("Examine figure.", libraryExplore.bind("villain4"));
		}

		if (seg == "villain4") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/verminlion.png");
			s.x = GAME_WIDTH-s.width*1.3;
			s.y = GAME_HEIGHT-s.height-25;
			append("Your eyes widen as everything sharpens, noticing the rat now looming over you. Besides a crimson cloak, his only clothing seems to be shorts and suspenders. The room isn't exactly spacious. You quickly glance around your kidnapper, dusty relics and boxes scattered about.\n\n\"So you're awake! Boy I thought I would have just had to continue with you sleeping... Keheh...\" he snickers, unclipping his suspenders as he nears.");
			addChoice("Who are you?", libraryExplore.bind("villain5"));
		}

		if (seg == "villain5") {
			append("\"W—what!? Have the others not preached my name?!\"");
			addChoice("Raise an eyebrow.", libraryExplore.bind("villain6"));
		}

		if (seg == "villain6") {
			append("You raise a brow as a reply, should you have known about him? He takes a moment to clear out his throat as he strikes a pose, hands on hips while his legs make an arch.\n\n\"I am the Verminlion Trickster! The one who always leaves the toilet seat up! The evil doer that plants cum bombs in drinks! The vandal that wrecks the fuck stations—\"\n\nHe seems well engrossed in his self—plugged intro like a proper TV baddie. Looks like this might take a while...");
			addChoice("Try to worm my way out and find an exit.", libraryExplore.bind("villain7"));
		}

		if (seg == "villain7") {
			append("Flipping over into your stomach, you notice an open door right before you. You give a few tries to move your weakened body like a slug, inching closer. A familiar chuckle echos the room as you get lifted up by your ankles. Your face gets greeted by the rat's twitching cock, its odor slapping your senses as he presses it on your nose.\n\n\"So eager aren't you... escape is right there if you really want it...\"\n\nThe Trickster taunts you, cutting free some of the bindings around your legs and spreading you eagle style. You can feel his hot breath on you as he buries his face between your asscheeks, getting in a few sniffs. You shudder as his moist lick takes a deep run across your pucker, and you feel his meat twitch with each after, hardening up as his tip gets closer and closer to your mouth.\n\n\"But... I'm not letting you go until I've had my fun— Keheh...\"");
			addChoice("Be a good little victim~", libraryExplore.bind("villaingentle"));
			addChoice("Clench my butt and struggle.", libraryExplore.bind("villainrape"), {kinks: ["Abuse"]});
			addChoice("Close the book.", libraryExplore.bind("playerhub"));
		}

		if (seg == "villaingentle") {
			append("You eagerly lick and suckle at his cock, getting him harder as his "+(isActive("Candy Ring")?"sweet-scented":"smelly")+" rod doubles its efforts in stiffening.\n\n\"Ha... That's a good slut!\"\n\nThe rat rewards your compliance: he locks a kiss with your wrinkled ring and his tongue pokes in to explore your depths, wriggling around while his meat beads up some pre at the tip. Eager for his essence you open wide as you take in his length, almost swallowing it all up in one go.\n\nHis snout presses in deeper as he keeps urging onwards, opening up his mouth wider to see how much your depths can handle. You can feel each of his warm breaths in your rectum, his wet licks moisten you. His cock throbs needfully in your mouth as you start to suckle from it, milking out beads of salty pre from his narrow slit. Your nose gets continuously assaulted by his strong musky odors, but you feel yourself smelling it stronger and stronger each time you go.");
			addChoice("Deepthroat him.", libraryExplore.bind("villaingentle2"));
		}

		if (seg == "villaingentle2") {
			append("In a sharp jolt you push yourself as far as you can go on his cock, while your nose is buried into his pubic fur you feel his shaft bend quite nicely down your throat. The Trickster gasps into your gaping ass and pulls out in sheer awe. His meat throbs wildly as your throat contracts around his tip, trying to swallow up more of his length.\n\n \"Ex... excellent! All according to plaaaaah~\"\n\nHe trails off in a haze, hips jutting back and forth helplessly while you bob up and down on his member. You can feel his lips graze across your taint, giving you a rewarding lick to your "+pickByGenitals("balls", "cunt", "cunt")+".");
			addChoice("Next.", libraryExplore.bind("villain8"));
		}

		if (seg == "villainrape") {
			append("Refusing to abide by his lust, you tighten your ass back against his licks as reply, while you turn your head away from his "+(isActive("Candy Ring")?"sugary":"funky")+" smelling cock.\n\n\"Spicy aren't we? Good thing I can take the heat!\"\n\nHis hands move to your butt. He digs two digits into your pucker and spreads you open, your ass trying to fight back but to no avail, your innards revealed for his sick desires as he lowers his other hand clenched in a fist. The rat shows no mercy to your asshole as he pushes it past his fingers, erecting a painful moan from your lips.\n\nHe takes advantage of your mouth and jams in his cock, the overwhelming stench flooding your taste buds as he pushes down... His hips start to buck back and forth and face fuck you. The fist sinks deeper into your ass as he punches you back down on his meat, brutally attacking your ass and mouth.");
			addChoice("Next.", libraryExplore.bind("villainrape2"), {kinks: ["Piss"]});
			addChoice("Next x2.", libraryExplore.bind("villain8"));
		}

		if (seg == "villainrape2") {
			append("You feel him stop for a moment, only to slam down on your face as your nose meet his furry sack. The Trickster lets out a odd sigh as you feel something pass though his shaft and start to shoot into your throat, the hot liquid becoming unmistakable as some of it gets into your mouth. You try to pull back but a hand pushes the back of your head down his shaft and holds it there. You're powerless to stop him from filling up your stomach with piss while you start to gag for air.\n\nHe pulls out just enough for you to catch your breath, but you inhale some of the golden liquid and cough and gag even harder. Letting out a disapproving groan, he pulls out even farther, finishing up in your mouth. You taste most of the salty sour liquid but, wanting to get rid of it, you gulp down drop after drop until he can feel nothing but your moist mouth on his shaft. The Trickster pulls out, happy to see you cleaned up rather nicely despite the fight you put up before.");
			addChoice("Next.", libraryExplore.bind("villain8"));
		}

		if (seg == "villain8") {
			append("You feel his hands grab your waist as he effortlessly picks you up and tosses you to the ground roughly. You skid on your back as you look up to his sinister grin.\n\n\"Now it's time to get to the main attraction— Keheh~\"\n\nHe does his signature evil chuckle, lifting up your legs and pressing his tip on your ass, which has no problem accepting his shaft. Your "+pickByGenitals("cock dribbles", "cunt twitches", "cock dribbles")+" as he starts to thrust in without a care for your well being.\n\n\"It's times like these I love... mnnnf... watching your pitiful faces churn as you get raped... makes me proud to be a villain!\" the Trickster mumbles, as he looks at your expression while his member keeps pounding your "+pickByGenitals("prostate, another leaky stream of pre coating your belly with each thrust. Your own cock lays limp and defeated, making the rat laugh again", "ass, your dry puss twitching cutely", "prostate, another leaky stream of pre coating your belly with each thrust. Your own cock lays limp and defeated, making the rat laugh again")+".\n\n\"Ha! Your body is lying to you! You'd be "+pickByGenitals("hard as a rock", "wet as a fizzy Glowbeverage", "hard as a rock")+" if you were on the other end, wouldn't you~?\"");
			addChoice("Nod.", libraryExplore.bind("villain9"));
		}

		if (seg == "villain9") {
			append("You give him a drunken nod, feeling light headed as you start to pant out of control, tightening around his cock.\n\nThe rat lifts you off your back and sits you in his lap, pounding you effortlessly as you bounce. You feel your "+pickByGenitals("prostate", "insides", "prostate")+" getting hammered over and over, so close to your release. The rat leans on you as you feel his huffs tickle your ear:\n\n\"Now cum...\"");
			addChoice("Obey~", libraryExplore.bind("villain10"));
			addChoice("Close the book.", libraryExplore.bind("playerhub"));
		}

		if (seg == "villain10") {
			cumEffect();
			append("With a moan that echoes off the walls you feel him suddenly slam you down, your walls gripping tight on his cock as your "+(data.hasBoobs?"tits smush up to his chest":"chest slumps on his")+". "+pickByGenitals("Balls twitching, your own member shoots out the gooey hot cream, getting on your chest and his fur as wave after wave pumps out in sync with each rough hump", "Your cunt dribbles a little bit of juice after all, and your thighs clench tight and spasm", "Balls twitching, your own member shoots out the gooey hot cream, getting on your chest and his fur as wave after wave pumps out in sync with each rough hump")+".\n\nWhilst you orgasm he clenches his teeth and keeps pumping away at your insides, you feel his rod cum with a steady flow of seed, each spurt almost feeling heavier than the last. His meat slickens from his own liquids and he starts to calm down. He pants pants on your ear and takes a little nibble at it.");
			addChoice("Wind down.", libraryExplore.bind("villain11"));
		}

		if (seg == "villain11") {
			append("He lifts you off with a relieved sigh and slumps you over his shoulder while your gaping butt struggles to keep in any of his cum. It keeps dripping down onto his chest.\n\n\"That was more enjoyable than our session in the bank~ Keheh...\"\n\nHe carries you through the dusty building, up until he perches you on an open window. He cuts away the rest of your bindings as you're still in afterglow, your knees still too weak to get up at all. He leans in close to you again, his nose touching yours, and you lock eyes.\n\n\"You know what to drink if you want more my little slut...\" he whispers, backs off...\n\nThen he boops your nose, and you fall back.");
			addChoice("Oh shit.", libraryExplore.bind("villain12"), {kinks: ["Trash"]});
		}

		if (seg == "villain12") {
			append("For a good five seconds you feel nothing til suddenly you crash into an unoccupied trash bin, the slushy garbage breaking your fall instead of the concrete under it. You rub your head as you brush off the loose bananas peels and broken condoms, semi-surprised you didn't die. You look up to see the Trickster dash across to the roof of a neighboring building, resuming his pleasurable crime spree.");
			addChoice("Close the book.", libraryExplore.bind("playerhub"));
		}
	}
}
