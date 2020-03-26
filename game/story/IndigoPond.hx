package story;

class IndigoPond
{

	public static function indigoPond(seg:String):Void {
		clear();
		saveCheckpoint("IndigoPond.indigoPond('"+seg+"');");

		if (seg == "intro") {
			setLocation("Indigo Pond");

			if (!data.indigoIntro) {
				data.indigoIntro = true;
				append("You squirm and wiggle through a gnarled wall of tree trunks and branches, snagweed and bramblesnatches, at times getting seriously stuck. Then, finally, you burst through, trip, and fall with a splash into a massive phosphorescent pond.");
			} else {
				append("You work your way through the foliage maze and wade into Indigo Pond.");
			}

			append("\n\nLittle nymphs of varying colours flit around everywhere, some floating on the calm surface, others hanging from tree branches, none paying particular attention to you. There are no shores; the pond's edges are mottled by wet tree trunks and massive, twisting roots.");

			addChoice("Look around.", indigoPond.bind("main"));
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "main") {
			if (!getJournalEntries().contains("Missing Page 13")) {
				unlockJournal("Missing Page 13");
				msg("Found Missing Page #13", true);
				playSound('assets/audio/environment/journalPage');
			}

			if (isActive("Pastel Ring")) temp.a = "six-year-old";
			else temp.a = "nine-year-old";

			if (data.metKemp >= 1) temp.c = "Kemp the otter";
			else temp.c = "A bare-butt otter guy with a beanie";

			append("Looking around, you spot...\n\n");

			if (!data.indigoBoyDone) {
				if (onFA()) append("A "+temp.a+" pink-skin nymph boy lounging on a lilypad across the pond.\n\n");
				else append("A "+temp.a+" pink-skin nymph boy lounging naked on a lilypad across the pond.\n\n");
				addChoice("Swim over to the boy on the lilypad.", indigoPond.bind("swim over"), {kinks: ["Cub", "Male", "Love"], faCensor: true});
			} else {
				append("Your little nymph boy, busy hanging out with his friends.\n\n");
			}

			if (!data.indigoKempDone) {
				append(temp.c+" floating on an inner tube in the center of the pond, soaking his feet in the gentle little waves. He's got a cherried roll of sweetgrass hanging from his mouth");

				if (data.metKemp >= 2) append(" as usual.\n\n");
				else append(".\n\n");
				addChoice("Approach the otter.", indigoPond.bind("approach otter"));	
			}

			if (!data.indigoPrivateDone) {
				append("A bunch of velvet cushions spilling from a gnarl-tucked hideaway marked <!i>PRIVATE AREA.<!i>\n\n");

				addChoice(
					"Peek into the private area.",
					indigoPond.bind("peek into"),
					{kinks: ["Cub", "Abuse", "Scat", "Feral"], faCensor: true}
				);
			}

			append("A little bar chiseled into the trunk of a great tree.\n\n");

			addChoice("Check out the bar.", indigoPond.bind("check out bar"), {kinks: ["Cub", "Female"], faCensor: true});

			if (data.thellyCallDone && !data.thellyPondDone) {
				append("Marei lounges off the side of the pond, perched with catlike frigidity on an exposed tangle of tree roots. He's distracting himself from his loneliness by obsessively arranging gangfucks among his boys and his clients.\n\nThelly pushes through the thicket and approaches him.\n\n");

				addChoice("Eavesdrop on Marei and Thelly.", indigoPond.bind("thelly1"), {kinks: ["Male", "Male", "Cub", "Abuse"], faCensor: true});
			}
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "thelly1") {
			data.thellyPondDone = true;
			unlockJournal("Thelly Pond");
			append("Thelly tugs Marei's sleeve, puppy tail wagging with suppressed curiosity. \"Marei,\" he asks quietly.\n\nLooking over, you see now that the femmy cat wears <!i>only<!i> sleeves: two cute arm warmers. \"Sir,\" Marei reminds him, more out of habit than domination.");
			addChoice("Next.", indigoPond.bind("thelly2"));
		}

		if (seg == "thelly2") {
			append("\"Sir... do you think maybe... maybe I could borrow that suit you were talking about?\"\n\nMarei looks down at him contemptuously. \"You want to try going off the edge of the map.\"");
			var s:MintSprite = addSprite("assets/img/effect/siamese2.png");
				s.x = 480;
				s.y = 100;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "Edits: Kittery");
			addChoice("Next?", indigoPond.bind("thelly3"));
		}

		if (seg == "thelly3") {
			append("Thelly won't look at him.\n\n\"I know it's insensitive to ask— and I know it's no fun having your um... teleporting condition thingie— but I thought maybe, now that I've had some training in being treated like a girl... I could handle having my gender glitched.\"");
			addChoice("Next.", indigoPond.bind("thelly4"));
		}

		if (seg == "thelly4") {
			append("Marei runs two paws over Thelly's little body, starting at the small of his back and moving down to squeeze both perfect golden buttcheeks, roaming back up to massage his shoulderblades, circling around the front and then tweaking both his nips viciously.\n\n\"You don't know shit about being a girl,\" he explains all sweet and kindly. \"If you did, you'd know it was perfectly possible to be one without getting your cocklet glitched off. You haven't explored half of the pussies on your body, you haven't taken any efforts to advertise the fact that they're pussies in the first place, you haven't even tried to pass as a girl beyond slapping on a thong or some high heels and reeling in all the boylover lites on this island— the lazy fucks who call a boy with mascara and two girly accessories their ‘good little girl' like the walking cockholster put more than seven joules of effort into his getup.\"");
			addChoice("Damn next.", indigoPond.bind("thelly5"));
		}

		if (seg == "thelly5") {
			append("Marei inhales after his rant.\n\nThelly's starry-eyed and out of breath himself. \"How?\" he asks, leaning forward— which shows how closely he's paying attention, but also, you think, makes it just a bit easier for Marei to tug his fat little nips. \"How can I become a girl~?\"");
			addChoice("Next.", indigoPond.bind("thelly7"));
		}

		if (seg == "thelly7") {
			append("Marei shakes his head. \"Dig the cum out of those floppy retriever ears, "+data.thellyName+". I just told you. Passing is easy enough with a little time and the right clothes, you've got the body for it already. In the short term...\"\n\n\"My... pussies, right? Can you show—\"\n\nThelly squeaks as a catpaw closes tight around his quivery little dick. It's obvious he doesn't get groped there too often. Marei's shiny, round pinky-finger pawpad works left and right over the tip, smearing it open to expose his urethra's sensitive, shiny interior. \"Here.\"\n\n\"Th-There?\"\n\nMarei's pinky clamps down harder, spreading Thelly's slit open half an inch. That left-and-right motion becomes up-and-down instead; he starts mashing Thelly's pisshole like a scrub playing a fighting game. It takes twenty intense minutes to massage it open. He warms it up gently, testing the stretchiness...\n\nAnd then he starts to seriously push.\n\n\"Mmmyygh! Wait!\" Thelly bitches. \"I-I don't know if I can take—\"\n\n\"I'm not gonna fingerfuck your peehole, kid.\"\n\n\"O-Oh! Good! But— A-AAAahhh that one was deep—!\"\n\nMarei slips the tip of his pinky down that little doggydick and pulls it back out with a pop. A tiny string of pre clings to Thelly's pussy. It yawns for a moment and slowly shuts.");
			addChoice("Next~", indigoPond.bind("thelly8"));
		}

		if (seg == "thelly8") {
			append("\"Just teasing you a little,\" Marei reassures him. \"Nnnf. There. You get the idea, right?\"\n\n\"Y-Yeah... that was... I feel...\"\n\n\"Like a girl.\"\n\n\"A little... m-more like a... just a cocksleeve, really...\"\n\n\"Same thing.\"\n\nMarei scoops him up by his ass and throws him onto a nearby couch like he really is just a portable sex object. \"There's one pussy. Homework for tonight is to find three more on your own and give them a little test-fuck with your finger. And no, each nostril and each ear do not count individually.\"\n\n\"Right, um, thank yo—\"\n\n\"Your other homework for tonight is to moan and squeal adorably while I give you a makeover and then throw you into a room full of men who desperately want to ruin your newfound feminine beauty with their cocks. And no, none of them will ever call you a boy, because after tonight you will never be a boy again.\"\n\nThelly gulps.");
			addChoice("Next.", indigoPond.bind("thelly9"));
		}

		if (seg == "thelly9") {
			append("\"... And you can stop gulping, I'm not going to castrate you. What would even be the point of warming up your slit?\"\n\nThelly un-gulps and smiles, reassured. \"You know my limits so well.\"\n\nMarei takes him by the chin. \"Wow, you're right, it's almost like you've been my bitch for a decade. Show me your face.\"\n\nThelly scrambles obediently into a proper sitting position on the couch, paws between his thighs. He holds his face out.\n\nMarei holds his catcock in one hand and looks as if he's about to whap it across Thelly's face. \"Close your eyes.\"\n\nInstead, he gently nuzzles the tip against Thelly's eyelashes, painting them nice and slow with a viscous layer of cum mascara. Next he applies some cum lipstick and cum eyeshadow. Then, finally, the cockslap arrives: six, twelve, eighteen of them in a row, each side, til he's perma-blushing and begging Marei to stop under his breath.\n\n\"Fine, that's red enough... alright, now the clothes...\"");
			addChoice("Next.", indigoPond.bind("thelly10"));
		}

		if (seg == "thelly10") {
			append("Marei saunters over to his closet and picks out a saucy little sundress that hugs Thelly's hips. His dogcock tents the front out lewdly, and a dark wet spot forms as the first few drops of pre gush into the fabric.\n\n\"C-Can I wear panties?\" Thelly asks.\n\n\"Absolutely not.\"\n\n\"... Can I wear the leather legwarmers?\"\n\n\"How do you know about those?\"\n\nThelly smiles shyly. \"You're a carnivore.\"\n\nMarei disappears into V.I.P. buildings for a moment. You hear the sound of some machine whirring up. He comes back:\n\n\"Sorry, just wanted to get that started... where were we. Oh, right, I was about to feminize your special little cunt for bringing up my dietary habits in front of "+data.playerName+".\"");
			addChoice("Don't mind me, just peepin~ (Next!)", indigoPond.bind("thelly11"));
		}

		if (seg == "thelly11") {
			append("Marei whips a tampon out of nowhere and plugs it neatly up Thelly's butt. Thelly didn't see what it was, but all the same he tugs one of his asscheeks aside and takes it as deep as it'll go like a good little girl.\n\n\"W-What was that?\"\n\n\"If your cum makeup is an advertisement,\" he explains, \"this is a fucking billboard. Remember when I talked about advertising your pussies? Bitch-made boyfuckers off the street need to be led by the nose about these things. If you don't advertise, you'll soon find you're getting raped into the dirt by some dude who won't even call your pucker a pussy, won't even <!i>consider<!i> you a girl. To him, you're just a boyslut, a boywhore, whatever suffix he "+(data.hyperLandSlotsIntro?"most recently rolled on Hyper Land's slot machines":"likes")+"— but when he sees this cute little thing dangling out between your asscheeks, he'll know. He'll know what you are and what you deserve.\"");
			addChoice("Next.", indigoPond.bind("thelly12"));
		}

		if (seg == "thelly12") {
			append("Thelly fidgets. \"O-Okay, but do boys and girls deserve different—\"\n\n\"What are you, sexist? Obviously little boys and girls deserve to be gangraped equally hard.\"\n\n\"Okay yes sorry sir— um, could you please tell me what you put up my—\"\n\nMarei just abruptly leaves to the other room again, not even deigning to listen to the rest of the pup's sentence.");
			addChoice("...", indigoPond.bind("thelly13"));
		}

		if (seg == "thelly13") {
			append("... You sit there with Thelly for a bit.\n\nHe looks at you. \"What did he put up my...?\"");
			addChoice("A tampon.", indigoPond.bind("thellytampon"));
			addChoice("Hmm, not sure. Why don't you show me your ass so I can see what it is?", indigoPond.bind("thelly14"));
		}

		if (seg == "thellytampon") {
			append("Thelly cranes his neck to try and see it. He ends up looking like a goof.\n\n\"What's that?\"");
			addChoice("Little white cotton things for periods? You've never heard of them??", indigoPond.bind("thellytampon2"));
		}

		if (seg == "thellytampon2") {
			append("\"Perio— ohhhhhh right, those leaky things that girls— ooog,\" he interrupts himself with a girly shiver, fully understanding how humiliating the little piece of cotton up his ass is. \"Our girls don't get periods. Pretty sure Wendy coded that bit in specifically. Where you come from, do... do girls really stuff these up their...?\"");
			addChoice("Oh yeah. Deep, too. Lemme check if yours is deep enough.", indigoPond.bind("thelly14"));
		}

		if (seg == "thelly14") {
			append("\"Oh... I...\" he wavers. \"Yes "+pickByGender("sir", "ma'am", data.playerName)+".\"\n\nHe scampers up and puts both paws on the wall. His yellow butt sticks out right at you, and you get a wonderful view of his backsack as it settles into place just below the embarrassing, dangling tampon string trapped between the folds of his juicy little taint.\n\nMarei comes back in with a wicked branding iron. This must be what he \"got started\" earlier. By now the symbol on its end has been heated to a cherry red:\n\n <!img:kink/Female.png>\n\n\"Oh, good,\" Marei says, looking at Thelly's exposed ass. \"You're already in position.\"");
			addChoice("Next~!", indigoPond.bind("thelly15"));
		}

		if (seg == "thelly15") {
			append("\"Wait, wh—\"\n\n\"Three two one go.\"\n\nWithout warning Marei drives the brand down on Thelly's left cheek, flattening it and accentuating the curve of the other one by comparison. Your little "+data.thellyName+" squuuuEEEAAAALLLLssss and digs his claws into the tree roots, sweating, shivering. His hips swing forward via involuntary attempt to get away from the pain and, in the process, he squashes his rock-hard puppycock against their soaked-soft wood.");
			addChoice("Ooog next.", indigoPond.bind("thelly16"));
		}

		if (seg == "thelly16") {
			append("After the brand sets in, Marei peels the iron circle off and slaps his raw ass.\n\nThelly crumples to all fours and cums harder than you've ever seen.\n\nAll motor function goes out the window. Most mental function does, too. He's reduced to a dumb little puddle of a boy who can only clutch his burning buttcheek in one paw and his throbbing dick in the other, who can only vocalize needy animalistic grunts and whimpers.\n\nYou chat with Marei for a bit while Thelly writhes on the ground.");
			addChoice("Was that really necessary?", indigoPond.bind("thelly17"));
		}

		if (seg == "thelly17") {
			append("\"Oh, absolutely.\"");
			addChoice("But won't it just go away when he respawns next?", indigoPond.bind("thelly18"));
		}

		if (seg == "thelly18") {
			append("\"Thelly's not into snuff,\" Marei explains, scratching him affectionately behind the ears while he spasms. \"It's a shame, I know, but it's also the only reason I got this branding thing set up for him in the first place. It took you both quite a while to find me here, you know. I had time to plan.\"\n\nHe goes on: \"With my other boys, it's usually not worth the trouble. They'd just get overconfident after they had their special girly mark seared on and then they'd go end themselves on dick in twenty minutes anyway. Thelly's hardly ever confident, let alone overconfident— when he's sober, at least. He's the perfect girlmeat for a brand. Aren't you, bitch?\"\n\nThelly lifts his ass up, snivelling, and accepts two more slaps~");
			addChoice("Ah. What's next for him?", indigoPond.bind("thelly19"));
		}

		if (seg == "thelly19") {
			append("\"Cocks. Lots and lots and lots of cocks.\"\n\n\"AAAaaayyghhhh... hhghhh... it stings...\"\n\nMarei rubs his back, toying with the straps of his sundress. \"Aw, I know, hun. But it's worth it, right?\"\n\nThelly looks up at Marei with teary, reddened eyes, batting his cum-coated eyelashes adorably and still clutching at the owie on his poor widdle bum bum. \"I g-guess it is... a p-pretty big... a-a-a-advertisement...\"\n\nMarei takes a knee like a concerned baseball coach. He peels Thelly's shaky clutches off his butt and replaces it with a firm but gentle paw of his own. Thelly winces.\n\n\"This one isn't just an advertisement,\" Marei says. \"You can wash off your makeup and unplug the tampon up your ass, but you can't ever undo this. You understand me?\"\n\n\"B-Because I'm not into—\"\n\n\"Even if you do get into it, even if you find yourself in a situation where something happens to your body and it's more convenient or pleasant to just get a respawn and move on— you can't undo this. This is forever.\"");
			addChoice("Next.", indigoPond.bind("thelly20"));
		}

		if (seg == "thelly20") {
			append("... Thelly slowly nods.\n\n\"Good girl.\" Marei's claws dig into Thelly's tender assmeat. \"I told you already: you're never going to be a boy again.\"\n\nHappy and pained tears dingle (mingle and dangle) on his cum-slathered face. For once he speaks softly and confidently, without stammers: \"Thank you, sir. I understand, sir.\"\n\n\"Good.\"\n\nMarei slaps him in the face, <!i>fwooosh<!i>es his sundress back down, and points to the backdoor of a V.I.P. building labelled Cub Rape Zone.\n\n\"Now get off your ass and go please my clients.\"\n\nThelly doesn't hesitate. He pulls himself cautiously to his feet and wipes the jizz off his belly. Those jizzy pawbeans go right up to his face, where he uses them to refresh his makeup. He tucks the tampon just a tiny bit deeper up his asscrack, to make sure it can't jostle out while he walks. He kisses Marei on the cheek.\n\nThen he waves goodbye to both of you and opens the door.");
			addChoice("Next.", indigoPond.bind("thelly21"));
		}

		if (seg == "thelly21") {
			append("Two strong arms grab him, one by the shoulder and one by the dick. \"Hey!\" the dick-grabber booms, hanging off the doorframe where Thelly was standing just a second ago, \"You said we'd get a girl next!\"\n\n\"We're working on it,\" Marei explains. \"Even if her clit's a little oversized, I expect you'll find her insides indistinguishable from the real thing. She's a girl where it counts. Check out the fresh brand and the feminine hygeiene product. What more proof do you need?\"\n\nIt doesn't take much more persuasion than that for the guy to head back inside. In fact, it takes only fifteen more words of it, and they come from one of his buddies back in the room, a drooly guy who's currently molesting the fuck outta Thelly's shiny, welted ass with his tongue: \"Mmmmbhphhbph— Bro! Check this shit out! She's got a fuckin tampon hanging out of her cunt...\"");
			if (data.hasCock || data.hasBoth) addChoice("Go treat Thelly like the girl she is.", indigoPond.bind("thellyfuck"), {kinks: ["Male", "Male", "Male", "Male", "Abuse"]});
			addChoice("Hang with Marei.", indigoPond.bind("thellymarei"), {kinks: ["Plot"]});
		}

		if (seg == "thellymarei") {
			append("\"What? Why are you still here?\"");
			addChoice("I wanted to get to know you better.", indigoPond.bind("thellymarei2"));
		}

		if (seg == "thellymarei2") {
			append("Marei narrows his eyes.");
			addChoice("So like... what's your fave color...?", indigoPond.bind("thellymarei3"));
		}

		if (seg == "thellymarei3") {
			append("Marei hesitates.\n\nThen:\n\n\"Mint.\"");
			var s:MintSprite = addSprite("assets/img/effect/siamese2.png");
				s.x = 480;
				s.y = 100;
			addChoice("Cool, cool, so—", indigoPond.bind("thellymarei4"));
		}

		if (seg == "thellymarei4") {
			append("He winks and walks away.\n\n\"Think about it.\"");
			addChoice("... Alright. Go treat Thelly like the girl she is.", indigoPond.bind("thellyfuck"), {kinks: ["Male", "Male", "Male", "Male", "Abuse"]});
			addChoice("... Look around.", indigoPond.bind("main"));
		}

		if (seg == "thellyfuck") {
			append("You take a step inside with the guys.\n\nThey don't pay much attention to you. They're currently preoccupied with who gets which end of Thelly.\n\nThat dispute gets settled with a quick game of rock-paper-scissors (their version is boner-maw-butt, the rationale being that boners ruin butts, well-practiced maws ruin boners, and sufficiently rimmable butts ruin maws).\n\nAfter dick-grabbing guy wins with a sneaky butt play, they all get their paws on Thelly and force her to her hands and knees. The frustrated losers drive both of their dicks deep between her branded assmeat while the winner takes her cummy-lipsticked maw. The guys in the back start doublefucking her pussy around the tampon without any foreplay, while the one at Thelly's front takes his time, slowly and agonizingly packing her throat with cock.");
			addChoice("Get in there.", indigoPond.bind("thellyfuck2"));
		}

		if (seg == "thellyfuck2") {
			append("You completely disrespect the result of the rock-paper-scissors game. Instead you assert your dominance as Thelly's two-time fuckbuddy by shoving a chubby dude aside (he seems used to it, the other guys must bully him a lot) and then wiggling yourself into position beneath the pup, missionary style.\n\nNow that you're staring her in the face, you can see that her cum makeup is starting to smear against this guy's potbelly as she's throatfucked.\n\nIt's a gorgeous view~");
			addChoice("Triplefuck that puppycunt.", indigoPond.bind("thellyfuck3"));
		}

		if (seg == "thellyfuck3") {
			append("You only get that view for a moment before the guy's cock plunges back down her tiny cub throat. His undershaft drips cum and sweat onto your forehead. His nuts swing back and forth. They almost hit you as they bounce so violently off Thelly's drool-slick chin.\n\nYou snugly fit your"+pickByGenitals("self", " finger", "self")+" along the other two guys inside her and start up a casual triplefuck on her ass, watching her little tummy jiggle as you bounce her along your "+pickByGenitals("cock", "digit", "cock")+". It's no wonder she's so inflated already; the other two guys are hitting their second cum each purely from the sight of her ridiculously stretched pussy. You try to sync your thrusts up with them, "+pickByGenitals("bucking", "fingerfucking", "bucking")+" in and out at the same time in order to cause her cunt as much stress as possible.");
			addChoice("Thrust over and over and over and over. Next x5.", indigoPond.bind("thellyfuck4"));
		}

		if (seg == "thellyfuck4") {
			append("After a long, multi-hour gangrape during which Thelly was completely and totally degraded to the point of willingly keeping her maw open for an hour while every single guy in the room used her face as a seat for his ass— including Marei, who popped in for a minute just to make sure they had indeed kept the tampon lodged inside her cunt while fucking her— after all that, Thelly's left twitching on the V.I.P. room's matted shag carpet, cum bubbling over from her ass, her maw, her yawning cocktip...");
			addChoice("You okay puppy?", indigoPond.bind("thellyfuck5"));
		}
		if (seg == "thellyfuck5") {
			append("You try to like... help her up, or talk to her, or interact in literally any way, but the only thing that can penetrate her cumdrunken mindfog, at this point, are the phrases \"take it\", \"open wide\", \"spread your legs\", or \"who's my pretty lil girl?\", to which she will invariably reply with a vapid, girly cumgurgle and a wiggle or two of her fat ass— wiggles which almost always seem to leave it in a vulnerable, rape-able position, or else to simply show off her cute little feminine brand to as many spectators as possible.\n\nYeah. The guys are going out for a beer. Marei nonlocated again. You think you're done here.");
			addChoice("Look around~", indigoPond.bind("main"));
		}

		if (seg == "swim over") {
			data.knownAsPlayer++;
			unlockJournal("Nymph boy");
			if (data.hasCock || data.hasBoth) temp.a = "fitting your cock neatly between his jiggly buttcheeks.";
			else temp.a = "working his little shaft between the lips of your cunt.";

			append("You start to wade your way over there. Once you hit the halfway point he realizes 1. You're a player and 2. You're headed for him, and freaks the fuck out, eyes alit with incredulous glee.\n\nA set of wings (quad pack, dragonfly-like) unfurl from his back. He soars across the surface of the pond, plucking you from the water with disproportionate strength. His little cocklet and nuts waggle in your face with every hairpin corkscrew skyward as he drags you high into the trees, gripping you with fierce affection "+(data.hasBoobs?"just underneath your boobs.":"around your stomach.")+"\n\nFinally, after a quick stripping, he sets you down belly-up in a nest of pilfered pink satin cushions and alights upon your chest, straddling you, "+temp.a+"\n\n\"Hi!\"");

			addChoice("Hi.", indigoPond.bind("hi"));
		}

		if (seg == "hi") {
			append("\"Hi! I've never seen a player before! I don't think most of us have, actually... we mostly kept to the meteorite in the early days.\" He considers for a moment. Then...\n\n");

			if (data.hasCock) {
				append("\"Wanna fuck my butt~?\"");
				addChoice("... Well, yes.", indigoPond.bind("cockfuck"));
			}

			if (data.hasCunt) {
				append("\"Can I fuck you~?\"");
				addChoice("... Well, yes.", indigoPond.bind("cuntfuck"));
			}

			if (data.hasBoth) {
				append("\"Wanna fuck my butt~? Or!... if you got one of <!i>those<!i>... I could...\" He lifts your nuts up a little and peeks underneath, grinning a boyish grin.");
				addChoice("Sit on my dick, little one.", indigoPond.bind("cockfuck"));
				addChoice("You could...~?", indigoPond.bind("cuntfuck"));
			}

			addChoice("Could you fly me back to the pond, actually?", indigoPond.bind("could you fly"));
		}

		if (seg == "cockfuck") {
			data.nymphBoyCockfuck = true;
			if (isActive("Pastel Ring")) temp.a = "six-year-old" else temp.a = "nine-year-old";

			append("The nymphlet practically purrs with happiness, dragging his butt up and down your cock as it hardens, tiny pucker making adorable squish noises each time it passes over the pre-soaked head. He arches his back, that perfect little potbelly flattening against your own— then he slams his ass down with raw nymphic strength.\n\nThe sheer volume of his buttcheeks (way too fat and jiggly for a "+temp.a+") belies the limited space inside. From the spastic contractions of his warm buttmuscles you can tell even four inches of cock is too many for him to take comfortably. Still, eyes closed, starting to drool a little, he grinds his hips back and forth until another inch slips in.\n\nHe wraps his arms around you. \"Fuck... me...\" <3");

			addChoice("Fuck'im.", indigoPond.bind("fuck him"));
		}

		if (seg == "fuck him") {
			if (data.genderMale) temp.a = "against your chest" else temp.a = "between your tits";

			append("You grab the little nymph by his waist and push as far in as you can get, which is about one more inch, before you feel something give inside and his butt slips down the whole way to your waist in an instant with a tiny <!i>pap<!i>, cheeks jigglin' aplenty.\n\nStarting to drool a lot, he buries his blushy face "+temp.a+", reaching down to massage the fat bulge of your cock through his smooth blubbery fishlike nymphflesh.");

			addChoice("Harder.", indigoPond.bind("nymphboyharder"));
			addChoice("Softer.", indigoPond.bind("nymphboysofter"));
		}

		if (seg == "nymphboysofter") {
			if (isActive("Pastel Ring")) temp.a = "six-year-old" else temp.a = "nine-year-old";

			append("A couple inches of cock slip in and out with sluggish movements of your hips as you wrap your arms around the "+temp.a+"'s little body. Every time he draws in breath to say something he sighs it right back out again, little cock dribbling pre over your lower stomach.\n\nFinally he manages it: \"You can go rougher—\" a sharp inhale \"—if you want...\"");

			addChoice("You asked for it.", indigoPond.bind("nymphboyharder"));
			addChoice("Cum.", indigoPond.bind("nymphboycum"));
		}

		if (seg == "nymphboyharder") {
			if (isActive("Pastel Ring")) temp.a = "your adult mouth covering pretty much the entire lower half of his face as you cram your tongue into his little mouth and wiggle it down his throat";
			else temp.a = "his little tongue battling your bigger one with cute vigor";

			append("You grab the nymphlet by his hair (a silvery dark-blue mess) and yank his face up, arching your back to lock lips with him, "+temp.a+".\n\nAt a feverish pace you pull your hips back until only a meager inch of cockhead remains lodged in his pucker then slam the whole thing back in again, any remaining resistance completely obliterated, your nuts slapping against his too-fat kiddybutt.\n\nEvery time you bottom out he squeaks into your mouth and his cocklet twitches against your stomach.");

			addChoice("Bounce him on my dick.", indigoPond.bind("bounce him"));
			addChoice("Cum.", indigoPond.bind("nymphboycum"));
		}

		if (seg == "bounce him") {
			if (isActive("Pastel Ring")) temp.a = "the ample remnants of his babyfat";
			else temp.a = "just most of his curves in general";

			append("With a low growl you break the kiss, thick strands of saliva still connecting you, and push the boy into a sitting position so you can properly bounce him on your dick, the nymph's lolling tongue, nuts, cocklet, and "+temp.a+" jiggling up and down with each violent skyward thrust.\n\n\"WWWWEeeeeEEEeeeeeEEEeeeeEEEEEE~!\"\n\nOnce more his wings unfold and he beats them downward in time with each buck of your hips, getting him about four more inches higher on your cock before he slams back down~");

			addChoice("Cum.", indigoPond.bind("nymphboycum"));
		}

		if (seg == "nymphboycum") {
			cumEffect();
			append("\"Wait, wait—!\"\n\nHe beats you to the punch, nutsack tightening cutely as he splurts glittery "+(isActive("Mood Ring")?getMood("Nymph Boy"):"")+"cum all over your chest, butt clenching in time with each rope. Those contractions make for an excellent cockmassage, milking out your own "+(isActive("Mood Ring")?getMood("You"):"")+"cum and filling his tummy til it almost looks pregnant.\n\nHe melts into a hyper-affectionate mewling nymph puddle, hugging you and smearing his mess around. His butt relaxes enough to let some of your cum gush out warm over your nuts, staining the pink pillows of his nest~");

			addChoice("Wind down.", indigoPond.bind("nymphboywinddowncock"));
		}

		if (seg == "nymphboywinddowncock") {
			data.indigoBoyDone = true;
			append("Dutifully he cleans up all of the "+(isActive("Mood Ring")?"two-tone mess of ":"")+"cum with his mouth, suckling it from your chest, your bellybutton, happily stuffing his mouth with each of your nuts in turn and keeping his eyes on yours while he slurps far more noisily than necessary.\n\nAfter some cuddles and supplementary pillow-sucking he offers to fly you back down. You peer over the edge of the nest and see a fairly clear drop down to the pond.");

			addChoice("CANNONBALL!", indigoPond.bind("cannonball"));
			addChoice("Nymph! Use Fly!", indigoPond.bind("use fly"), {kinks: ["Plot"]});
		}

		if (seg == "cuntfuck") {
			if (data.hasBoth) temp.a = "frotting with you, then slips his cock between your balls and hotdogs your nutsack, grinning. \"Or I could fuck you~\"";
			else temp.a = "hotdogging the lips of your pussy, smearing them with glittery nymph pre. \"Heck ya...\" he says under his breath.";

			append("He bucks his hips for a bit, "+temp.a+"\n\nHe lines up and slips inside with a tiny <!i>pop<!i>, his expression going melty and his nuts twitching against you. With shy affection he nuzzles up to your stomach, messy dark-blue hair brushing against "+(data.hasBoobs?"the underside of your breasts":"it")+". \"Fwaaa... yeah, you like that, dont'cha... my big dick inside you...\"\n\n");

			if (isActive("Pastel Ring")) append("Although admittedly a decent size for a six-year-old, it's only four inches.");
			else append("It's about four inches.");

			if (data.hasBoobs) addChoice("Stare at him amusedly.", indigoPond.bind("stare amusedly"));
			addChoice("Make up for your size with spunk, kid. If you're gonna fuck me, fuck me.", indigoPond.bind("make up for"));
		}

		if (seg == "stare amusedly") {
			append("He looks up at you from between your "+(data.hasBoobs?"tits":"thighs")+", clearly expecting your expression to be more contorted with lust than it is. \"I\'m not big enough, am I?\" he asks quietly, starting to thrust a little, but not with any real confidence.");

			addChoice("It's okay. You can make up for it by giving the girls some attention~", indigoPond.bind("its ok"));
		}

		if (seg == "its ok") {
			append("\"Okay!\" he chirps, doing a ^3^ face and latching his puckered lips to your left "+(data.hasBoobs?"breast":"buttcheek")+", slurping hard and grabbing it with both hands. He bucks his little cock into you, his tongue first circling the nub of your nipple— then ferociously grinding against it (>3<) as he sucks hard enough to draw out a little squirt of milk.\n\n\"Ish better~?\" he asks through his drippy mouthful of boobmeat, happily humping away.\n\n... To be honest it still doesn't feel like much more than a tickle downstairs, but you can't tell him that.");

			addChoice("Wait until he cums... then make him use his mouth to clean it up.", indigoPond.bind("wait until"));
		}

		if (seg == "make up for") {
			data.nymphBoyMistake = true;
			append("He nods, gets all determined, and winds his hips back a little too far, cock accidentally popping out. He doesn't notice.\n\n\"Alright! Here... we... <!i>go!<!i>\"\n\nHe slams forward— into the wrong hole. Your eyes widen as your butt is fucked open with pretty much zero warmup, small cock or no, and only the little nymph's voluminous flow of sparkling pre saves you from winces as the next few hammers land.\n\nThe sudden gush of juices from your pussy does help a little, too, once you think about it.\n\n\"Ah... ah! You feel a lot tighter now... a-are you clenching?\"");

			addChoice("Wait until he cums... then make him use his mouth to clean it up.", indigoPond.bind("wait until"));
		}

		if (seg == "wait until") {
			append("You don't wait long.\n\nThe nymph rams his cock in as deep as he can and you feel a few warm eruptions not-so-deep in your ");

			if (data.nymphBoyMistake) {
				append("butt, his "+(isActive("Mood Ring")?getMood("Nymph Boy"):"")+"cum leaking out over his nuts, painting them shiny.\n\nHe pulls out, a goopy glittery mess gushing from you, and promptly realizes he was fucking your butt.\n\n\"Oh,\" he says, flashing an apologetic smile. \"Heh. That didn't... um... hurt, did it?\"");

				addChoice("Your mouth. My hole. Right now.", indigoPond.bind("mouth hole now"));

			} else {
				append("cunt, his "+(isActive("Mood Ring")?getMood("Nymph Boy"):"")+"cum leaking out over his nuts as they press to your pucker, painting both shiny.\n\n\"Hnnn... ahh~... wait. You can't get pregnant, can you...?\"\n\nHe looks up, worried, his body still quivering with orgasmic aftershock.");

				addChoice("Mmmm... I dunno. Better do some preventative measures.", indigoPond.bind("preventative measures"));
			}
		}

		if (seg == "mouth hole now") {
			if (data.hasBoth) {
				data.nymphCummyHair = true;
				temp.a = ", your nuts smushed up against his forehead";
				temp.b = " with both of your cummers, thick ropes of goo coating and coagulating the nymph kid's hair while a gush of cuntsauce douses his nostrils.";
			} else {
				temp.a = "";
				temp.b = ", your thighs closing on his head, locking it in place while cuntjuice gushes up the poor fucklet's nose.";
			}

			append("He gulps and slips down, nestling his chin between your thighs, tongue hovering above your slightly-but-not-really-open pucker. You wink it twice, as if to repeat: Right now.\n\nShivering, he lunges forward, tongue pressed flat to the leaky mess between your cheeks, his button nose buried in the folds of your pussy"+temp.a+". From the way you spot his ass wiggling and swaying as he crams his tongue inside, you start to think his mistake was maybe on purpose.\n\nAt an extra-vigorous slurp you lose control and reach down with both hands, yanking his face hard between your legs and cumming "+temp.b+"\n\nHe jerks away, eyes watering. He drags two fingers along your pucker then shows you they're clean (except a shiny coat of saliva) before he ducks down and chain-sneezes adorably.");

			addChoice("Good boy.", indigoPond.bind("good boy"));
		}

		if (seg == "preventative measures") {
			if (data.hasBoth) {
				temp.a = "nuts";
				temp.b = "He doesn't notice that your cock deposited some conditioner in his hair...";
				data.nymphCummyHair = true;
			} else {
				temp.a = "clit";
				temp.b = "";
			}

			append("He looks from you to his mess to you again, then it clicks. \"Oh. With my...?\"\n\nYou grab his head with both hands and yank it down between your legs, his nose pressed up to your "+temp.a+". Obediently he flicks his little tongue out and drags it bottom-to-top, top-to-bottom, even slurping up the "+(isActive("Mood Ring")?getMood("Nymph Boy"):"")+"cum pooled between your cheeks. "+(data.nymphBoyMistake?"Upstairs, a little milk is still dribbling where his mouth used to be...":"")+"\n\nGreedily now, bare boybutt swaying lavishly behind him, he sucks his "+(isActive("Mood Ring")?getMood("Nymph Boy"):"")+"cum from you and drives his tongue inside, a stray beam of moonlight illuminating the shimmery mess when he pulls off for a gasp of air— then you pull him right back down and cum in his mouth, a little mewl rising from deep in his chest as his eyes roll up and his chin runs over with pussyjuice.\n\n"+temp.b);

			addChoice("Good boy.", indigoPond.bind("good boy"));
		}

		if (seg == "good boy") {
			data.indigoBoyDone = true;

			append("He thanks you, flopping over your stomach and panting.\n\nCuddles, reverie, sleepiness. You peer over the edge of the nest; it's a fairly clear drop to the pond. From this height the dim light of the glowberry tree root-tips that riddle the depths of the pond illuminates curving burrows and underwater caves pierced with gnarls of fungi.\n\n... There aren't any tree branches in the way. You could just dive.\n\nHe offers to fly you back down, though his hug doesn't loosen a bit.");

			addChoice("CANNONBALL!", indigoPond.bind("cannonball"));
			addChoice("Nymph! Use Fly!", indigoPond.bind("use fly"), {kinks: ["Plot"]});
		}

		if (seg == "cannonball") {
			var berries:Float = getItem("Glowberry").amount;
			if (berries < 10) {
				temp.a = 5;
				temp.b = "Worth.";
			} else if (berries >= 10 && berries < 20) {
				temp.a = 10;
				temp.b = "Well, shit.";
			} else if (berries >= 20) {
				temp.a = 15;
				temp.b = "Augh!";
			}

			getItem("Glowberry").amount -= temp.a;

			append("You leap over the side of the nest and do a cannonball into the pond, a seismic wall of water dousing everyone remotely near the impact site. Your ass stings for a good while afterward.\n\nYou feel something slip from your inventory, which is a pretty weird sensation considering it's kind of an intangible game construct.\n\nTurns out you somehow dislodged x"+temp.a+" Glowberries from the sheer meteoric force of your cannonball.");

			addChoice(temp.b, indigoPond.bind("main"));
		}

		if (seg == "use fly") {
			append("\"... I'm not a pokemon.\"");
			addChoice("Sure you aren't.", indigoPond.bind("sure you arent"));
		}

		if (seg == "could you fly") {
			append("He seems a little crestfallen, then forces a smile. \"Yeah... sure! It was nice just to get to say hi!\"");
			addChoice("Next.", indigoPond.bind("main"));
		}

		if (seg == "sure you arent") {
			append("\"I'm not!\"");
			addChoice("Well, you are a small cute fantasy creature.", indigoPond.bind("small cute"));
		}

		if (seg == "small cute") {
			append("He's kind of hurt. \"I'm as real as you.\"");
			addChoice("Not really. I'm reading about you on a screen.", indigoPond.bind("not really"));
		}

		if (seg == "not really") {
			append("\"No shit,\" he says. \"I'm part of a game, and games are displayed on a screen. I don't know the specifics since I'm not a goober but I know it's metal and electricity and liquid crystals in a big box. Or a couple boxes. Either way, atoms.\"\n\nHe's pouting down at his lurid pink skin, tucking his wings away, shrinking. \"I am <!i>not<!i> a pokemon.\"");

			addChoice("When you put it like that, I guess I'm atoms too.", indigoPond.bind("when you put it"));
			addChoice("Still, we existed first.", indigoPond.bind("existed first"));
			addChoice("Okay, okay, I'm sorry.", indigoPond.bind("im sorry"));
		}

		if (seg == "when you put it") {
			append("He dives forward and tackles your waist with a exhalatory hug, wings unfurling, and kicks off from the nest of pillows so hard that a couple topple off the edge, shrinking to specks in the instant before the upper canopy swallows you and obscures their splashes.\n\n\"DOES THIS FEEL FAKE?\" he screams past the wind, wings beating so fast they look like they're still.");

			addChoice("Yep, still words on a screen.", indigoPond.bind("slow down"));
			addChoice("OKAY OKAY SLOW DOWN", indigoPond.bind("slow down"));
		}

		if (seg == "slow down") {
			setLocation("The Sky");

			append("He flies you up through whipping leaves and branches. You bury your face in his hair. He wraps his legs around you and locks his feet at the small of your back. His cock throbs more with thrill than lust against your stomach. Pure glee is plastered over his face and mirrored in the sudden flare of warmth between your chests as your heartrates begin to race together.\n\nTwo nymphs fucking mid-flight barrel past you and miss collision by an inch, spitting insults. A wolf howl arcs up muffled from somewhere below, first growing louder and needier, then snapping up an octave into fever pitch as you and the nymph boy pop out above the canopy.\n\nHis wings go still. Twigs and leaves are still suspended in the remnant of your slipstream. Together, at your zenith, you see the ocean spattered with moonlight below, and the shadow of the meteorite behind you, with its softly rushing waterfalls and the orange backlight from its lava. If you strain, you can make out the edge of the sea.");

			if (!data.moonUnlocked)
				addChoice("Oh...! Fly me to the moon!!", indigoPond.bind("nymphboyendpre"))
			else
				addChoice("Oh my...", indigoPond.bind("nymphboyend"));
		}

		if (seg == "nymphboyendpre") {
			append("... You've stopped looking at the edge of the map, but he hasn't. In fact, he can't take his eyes off it. He quivers a little and starts wandering back down through the air in nervous circles.\n\n\"Well,\" he mumbles, \"I wouldn't wanna go out <!i>that<!i> far... don't wanna get glitched if I fall off...\"");
			addChoice("Ah...", indigoPond.bind("nymphboyend"));
		}

		if (seg == "existed first") {
			append("\"Players?\"");
			addChoice("Yeah.", indigoPond.bind("humanity"));
			addChoice("Humanity.", indigoPond.bind("humanity"));
		}

		if (seg == "humanity") {
			append("He's looking over the edge of the nest, eyes tracking the shimmers on the pondwater. \"Well,\" he says.");
			addChoice("End.", indigoPond.bind("nymphboyend"));
		}

		if (seg == "im sorry") {
			append("He says it's fine.");
			addChoice("... Fly me back down?", indigoPond.bind("nymphboyend"));
			addChoice("CANNONBALL!", indigoPond.bind("cannonball"));
		}

		if (seg == "nymphboyend") {
			temp.c = "";
			if (data.nymphBoyCockfuck) {
				temp.a = "globs of "+(isActive("Mood Ring")?getMood("You"):"")+"cum still dripping from his butt";
				temp.b = "Was his butt loose cause he's such a big whore? (HEY!) Did he squeal really hard like he always does?";
			} else { //cuntfucked
				temp.a = "residue of your cuntmusk on his lips";
				temp.b = "Did he squeal really hard when he came inside you~? Did he fuck your mouth or your pussy?";
				if (data.nymphCummyHair) temp.a = "globs of "+(isActive("Mood Ring")?getMood("You"):"")+"cum stuck in his hair";
				if (data.nymphBoyMistake) temp.c = "\n\n(No comment, you say, and he blushes.)";
			}

			if (data.nymphCummyHair) temp.a = "globs of "+(isActive("Mood Ring")?getMood("You"):"")+"cum stuck in his hair";

			append("He flies you down.\n\nYou hang out on his lilypad while his nymph friends crowd around to sniff the "+temp.a+" and barrage you with questions:\n\nIs it fun to be a player? "+temp.b+temp.c+"\n\nAfter the interrogation you say your goodbyes and slip off the lilypad, back into the water.");

			addChoice("Look around.", indigoPond.bind("main"));
		}

		if (seg == "approach otter") {
			unlockJournal("Kemp");
			if (data.metKemp >= 1) {
				temp.a = "Kemp";
				temp.b = "Sup, ";
				addChoice("Not much, you know, wandering.", indigoPond.bind("you know wandering"));
			} else {
				temp.a = "the otter";
				temp.b = "Name's Kemp. Nice to meetcha, ";
				addChoice("Nice to meet you too.", indigoPond.bind("nice to meet"));
			}
			data.metKemp++;

			append("You swim up to "+temp.a+" and hang onto his inner tube. He looks down at you through red, nearly-closed eyes and tips his beanie.\n\n\"Hey. "+temp.b+data.playerName+"!... Erh, sorry. Must be annoying, havin yer name broadcasted up above yer domepiece for all to see.\"");

				addChoice("My... domepiece?", indigoPond.bind("domepiece"));

			append("\n\nHe takes a long drag on sweetgrass and exhales. The blue-pink smoke curves whorishly into the branches above.");
			addChoice(
				"Present for you.",
				indigoPond.bind("present for you"),
				{cost: ["Sweetgrass Bouquet", 1]}
			);
			addChoice("Look around.", indigoPond.bind("main"));
		}

		if (seg == "you know wandering") {
			append("\"O ya bud. Wandering's all I do. You get sucked into your own mind if you stay in one place too long.\n\nHmm... I'm tryna think of something, but I can't remember it so good. John was showin me some book about it, buncha boys on an island.\n\nOr... nah... maybe it's a phrase. Staying in one place too long...\"");

			addChoice("Cabin fever?", indigoPond.bind("cabin fever"));
			addChoice("Lord of the Flies?", indigoPond.bind("lord of flies"));
		}

		if (seg == "cabin fever") {
			append("Kemp snaps. \"Got it! 'Prairie madness!' Same thing as what you said, really. Anyway...\"");
			addChoice("Huh.", indigoPond.bind("kempnext1"));
		}

		if (seg == "lord of flies") {
			append("\"Yeah! That's the one! And the fat kid gets his domepiece beaned in with a rock! Hahaha. Ah, that part was sad. I was really rootin for the little fucker.\"");

			addChoice("Yeah, me too.", indigoPond.bind("kempnext1"));
			addChoice("I never read it.", indigoPond.bind("kempnext1"));
		}

		if (seg == "nice to meet") {
			append("\"I'd invite you aboard, but I don't think she's got enough floatation to support two... tell ya what.\"");
			addChoice("What?", indigoPond.bind("kempnext1"));
		}

		if (seg == "domepiece") {
			append("\"Yer cranial. Yer dome zone. Yer helmet. Yer nog. Whatever ya wanna call it.\"");

			if (data.hasCock || data.hasBoth) addChoice("My head?", indigoPond.bind("kempcock"));
			else addChoice("My head?", indigoPond.bind("kempcunt"));
		}

		if (seg == "kempcock") {
			append("\"Now, see...\" he says, stretching out on his inner tube. As his waist rises his seven-incher peeks over the edge, laying lazily in the crease between his stomach and his left thigh. \"S'not hard to confuse me, and when ya pull out vocab like that...\n\nIt's hard to know <!i>which<!i> head you're talkin about.\"\n\nHe winks.\n\nYou didn't notice during the stretch what with his smooth, otterish movements— but now you realize he slipped his right leg through the inner tube, into the water.\n\nThe sole of his foot brushes gently against your nuts, and he fits your cockhead neatly into the space between his big toe and the next over, then wiggles em good.\n\n\"But, ya, the domepiece is the official, clinical term for yer skull.\"");

			addChoice("Next~", indigoPond.bind("kempnext1"));
		}

		if (seg == "kempcunt") {
			append("\"Ya. 'Domepiece' is the official, clinical term for yer head.\"");
			addChoice("That so?", indigoPond.bind("kempnext1"));
		}

		if (seg == "present for you") {
			if (data.genderMale || data.genderNeutral) temp.a = "bruh";
			else temp.a = "girl";

			append("Kemp takes a fat whiff of your bouquet, stuffing his big otter nose in their midst. \"Thanks, "+temp.a+". Seriously. I was hurtin for a couple leaves, too...\"\n\nHe tucks the bouquet under his beanie and flashes you an excited grin, inadvertently crushing your beautiful handiwork.");

			addChoice("No problem.", indigoPond.bind("kempnext1"));
		}

		if (seg == "kempnext1") {
			append("Kemp slips down through the middle of his inner tube, keeping only his lips and sweetgrass cig above the near-still surface of the pond. Looks sorta like a periscope. He moves the tube to the side, doggy-paddling closer.\n\n\"Never learned to swim properly,\" he says past his cig, expression distorted through the surface of the water. He bobs back up and balances his cig on the tube.\n\n\"Ridiculous for an otter. So... er...\"\n\nKemp closes the last bit of distance and floats awkwardly up against you, ottercock brushing your thigh. \"Can I buttfuck ya underwater?\"");

			addChoice("Sure, why not.", indigoPond.bind("sure why not"));
			addChoice("I'm good, thanks.", indigoPond.bind("main"));
		}

		if (seg == "sure why not") {
			append("\"Fuck yeah bud!\"\n\nKemp wraps his arms around you and pulls you under the surface, bubbles rising in little twirls as he kicks down hard.\n\nThe pressure gets higher and higher as you soar between huge roots, into caverns of hanging fungi, through clumps of sliproot as they reach out to pull at your toes.");

			addChoice("Next.", indigoPond.bind("kempnext2"));
		}

		if (seg == "kempnext2") {
			append("He brings you to a gentle floating stop at the bottom of Indigo Pond.\n\nOnly one moonray penetrates to this depth, and it falls perfectly onto a bed of aquatic glowroses. The water is cool down here.\n\nHe lays you down, floating weightless inches above; he opens his mouth to say something, but only bubbles come out.\n\n... Apparently he just forgot he was underwater.");

			addChoice("Guide his cock between my cheeks.", indigoPond.bind("guide his cock"));
			addChoice("Smooch time.", indigoPond.bind("smooch time"));
		}

		if (seg == "guide his cock") {
			append("You grip his cock at the base, dragging a slow grope down til you have his head clasped in a few fingers. Since you can't really see where you're putting it, you have to grind it up and down the crease of your ass for a bit, slipping past the pucker a couple times. Each time you do, it winks~\n\nOkay, you've got it lined up good.");
			
			addChoice("Give him a tacit nod.", indigoPond.bind("kempnext3"));
			addChoice("Give a thumbs-up.", indigoPond.bind("kempnext3"));
			addChoice("Fuck me.", indigoPond.bind("fuck me"));
		}

		if (seg == "fuck me") {
			append("He reads your lips as the bubbles pour from them and reels his hips back...");
			addChoice("Next.", indigoPond.bind("kempnext3"));
		}

		if (seg == "smooch time") {
			append("You crane your neck to kiss the otter, the little sounds of tongue on tongue amplified in the perfect silence of the pond's water.\n\nHe slips his cock between your cheeks, swishing his fat tail up and down as a means to get his hips going, hotdogging you.");

			addChoice("Hug.", indigoPond.bind("hug"));
			addChoice("Spread my butt.", indigoPond.bind("spread"));
		}

		if (seg == "hug") {
			append("He clasps his arms at the small of your back the moment the idea of hugging forms in your brain as a tiny thought-nodule, pulling your close, whispering bubbles into your ear, the smooth curves of his somewhat chubby stomach flattening as it presses to yours.\n\nHe winds his hips back...");

			addChoice("Next.", indigoPond.bind("kempnext3"));
		}

		if (seg == "spread") {
			append("You reach down and pull your cheeks apart for him, two fingers from each hand pressed into the extra squishy spot on either side of your pucker. You quiver a little as it opens, cool pond water rushing up your ass. He accepts the invitation and lines his cockhead up, pushing nearly half-inside, widening you.");

			addChoice("Hug.", indigoPond.bind("hug"));
			addChoice("Fuck me.", indigoPond.bind("fuck me"));
		}

		if (seg == "kempnext3") {
			append("Approximately five thick inches of ottercock slam inside you all at once, and you can't help but gasp, filling your lungs with water; if not for that reflex, you don't think you ever would have thought to inhale.\n\nAt first you panic at the weird sensation, coughing, but he holds you tight, not thrusting but waiting patiently until you feel a little less overwhelmed and a little more accustomed to the feeling of cool water sloshing against nerve endings that don't normally get any attention.\n\nYou take a few deep mental \"breaths\" and tap him to give the okay. He nods and feeds your butt another couple inches, working it in a little more with each gentle flick of the tail and push of the hips, until finally all seven are lodged inside you.");

			addChoice("Next.", indigoPond.bind("kempnext4"));
		}

		if (seg == "kempnext4") {
			append("Watching you always to ensure you're okay, filling his own lungs with greedy gulps of water, he starts pulling his whole cock out and ramming it back in, careful at first and then with erratic voracity, his grip the only thing keeping you both from floating out of the spot of moonlight into the darkness of the pond's bottom.\n\nEyes shut, he places a hand on your stomach where the slight bulge of his cock is pressing through and cums inside you, the warmth spreading and pooling slowly in your lower stomach like hot honey drizzled down the gullet.\n\nA singular fat bubble pops from the \"O\" of his mouth.");

			addChoice("Heheh.", indigoPond.bind("kempnext5"));
		}

		if (seg == "kempnext5") {
			data.indigoKempDone = true;
			append("After some subaquatic snuggles and quite a bit of giggling from both of you when he pulls out and thick globs of "+(isActive("Mood Ring")?getMood("Kemp"):"")+"cum float from your butt, you head back up to the surface and shake/cough the water from your bodies.\n\n\"Mystical shit,\" he says, picking up his still-lit sweetgrass cig and taking another hefty puff to warm er back up, even as he coughs more. \"Been meanin to show a player that spot for twenny years now. Never got the chance when you all used to be around. Ah, but everyone says shit like that to you, probably...\"\n\nHe takes his tube under one arm and hauls himself up onto a low-hanging tree branch, toes curling expertly as he climbs out of the pond one-handed. \"Seeya round. Thanks for the romp, eh?\"");

			addChoice("Anytime!", indigoPond.bind("main"));
		}

		if (seg == "peek into") {
			//Ages: a for boy, b for herm, c for girl
			if (isActive("Pastel Ring")) {
				temp.a = "one-year-old";
				temp.b = "two-year-old";
				temp.c = "three-year-old";
			} else {
				temp.a = "five-year-old";
				temp.b = "seven-year-old";
				temp.c = "nine-year-old";
			}

			append("You swim up to the wall of trees separating the private area from the main pond and stick your face into a gap between two.\n\nThrough the crack you spot...");

			if (!data.indigoPrivateBeating) {
				append("A "+temp.a+" nymph boy getting his nuts beaten.");
				addChoice("Watch the boy.", indigoPond.bind("watch boy"), {kinks: ["Cub", "Male", "Abuse"]});
			}

			if (!data.indigoPrivateShitting) {
				append("A "+temp.b+" nymph herm getting her mouth used as a "+(isActive("Candy Ring")?"food tester":"toilet")+".");
				addChoice("Watch the herm.", indigoPond.bind("watch herm"));
			}

			if (!data.indigoPrivateFeral) {
				append("A "+temp.c+" nymph girl getting mounted by a greasy-furred feral wolf.");
				addChoice("Watch the girl.", indigoPond.bind("watch girl"));
			}

			if (data.indigoPrivateBeating && data.indigoPrivateShitting && data.indigoPrivateFeral) {
				data.indigoPrivateDone = true;
				unlockJournal("Private area");
				append("You've seen it all.");
			}

			addChoice("Look around.", indigoPond.bind("main"));
		}

		if (seg == "watch boy") {
			data.indigoPrivateBeating = true;

			//Ages: a for boy, b for herm, c for girl
			if (isActive("Pastel Ring")) temp.a = "one-year-old" else temp.a = "five-year-old";

			append("You watch a furry adult of an unknown species pound the shit outta the "+temp.a+"'s nutsack, the little boy alternating between cries of pain and deep, guttural groans of pleasure. On the rebound of a particularly thigh-jiggling blow the adult grips those swollen, bruised punching bags in a fist and uses them as a handle to drag the fuckling closer, gently pushing his little legs open. \"Come on,\" he says. \"Keep them spread. I <!i>know<!i> you're a bigger painwhore than that...\"\n\n\"Y...yes, sir...\" the nymph says, threading fingers between both sets of toes and pulling them up to his shoulders, letting his fat little nuts lay completely exposed.\n\n\"That's it...\" the adult says, winding up again.");

			addChoice("Peek more.", indigoPond.bind("peek into"));
			addChoice("Look away.", indigoPond.bind("main"));
		}

		if (seg == "watch herm") {
			data.indigoPrivateShitting = true;

			if (isActive("Pastel Ring")) temp.a = "two-year-old" else temp.a = "seven-year-old";

			append("There's a crowd of people (mostly nymphs) gathered around an ample-chested herm cub sat on her haunches, fitted with a ring gag, her face tear-and-"+(isActive("Candy Ring")?"candy":"shit")+"-stained as she stares at the swollen pucker of her next customer. She makes a tiny squeak of fear as the adult's hole opens wide to reveal the smoothed, rounded "+(isActive("Candy Ring")?"tip of a popsicle":"head of a shitlog")+"— they waste no time in grabbing the back of the "+temp.a+"'s head and slamming her face between their fat asscheeks, "+(isActive("Candy Ring")?"impaling her throat on the 'sicle":"using it as toilet paper and grinding her open mouth up and down over the log as it erupts out with a goopy splatter all over her too-fat kiddytits")+". Mostly it melts in her throat, the fuckling gagging and even splort-chort-churp-hrkkk-coughing some back up as she struggles to guzzle "+(isActive("Candy Ring")?"all the resulting sugary juice":"all that pungent assmuck")+".\n\nIt goes on like this for a while, some patrons throwing in "+(isActive("Candy Ring")?"little chocolates or full scoops of ice cream into her piehole":"a glob of spit or stream of piss into her toiletbowl of a mouth")+", others opting to smear "+(isActive("Candy Ring")?"cake":"errant shitchunks")+" into her hair, eyes, popping nuggets up her nostrils, slapping her tits, slapping her face...\n\nIt's a bit overwhelming to watch, but by the end of it, once the ring gag is finally unlatched, she's smiling and panting with exhausted relief, scooping "+(isActive("Candy Ring")?"food":"filth")+" off her little body and chewing it at her own pace.");

			addChoice("Peek more.", indigoPond.bind("peek into"));
			addChoice("Look away.", indigoPond.bind("main"));
		}

		if (seg == "watch girl") {
			data.indigoPrivateFeral = true;

			//Ages: a for boy, b for herm, c for girl
			if (isActive("Pastel Ring")) temp.a = "three-year-old" else temp.a = "nine-year-old";

			append("At first you can't see much. The wolf seems to be getting his footing, lurching forward every once in a while but otherwise just staying hunched over the little form of the "+temp.a+".\n\nThen, a miracle: the wolf pulls off and noses the side of the girl's tummy, and she giggles, dutifully repositioning to hands-and-knees with her ass pointed directly at you. The wolf bites gently at the nape of her neck, some slobber glistening over it, and drives his cock into her little ass, stopping only at the knot. With clumsy bestial thrusts he works an inch of it in, then another, then as the "+temp.a+" breeding bitch grips a nearby root and howls in time with her pet she takes the widest part and his knot pops inside her nice and deep.\n\nWith brutal excitement the wolf yanks it right back out, making her entire body tense and twitch with the effort of containing her scream. She hisses a string of curses, letting out the pressure, while he happily he makes a rhythm of it, turning it into a violent knotfuck, the girl's pucker distressed by tiny little <!i>pop<!i> sounds each time that massive canine cock slips in or out.");

			addChoice("Peek more.", indigoPond.bind("peek into"));
			addChoice("Look away.", indigoPond.bind("main"));
		}

		if (seg == "check out bar") {
			if (isActive("Pastel Ring")) temp.a = "four-year-old"
			else temp.a = "seven-year-old";

			if (isActive("Pastel Ring")) temp.b = "newborn"
			else temp.b = "five-year-old";

			append("At the bar, you blend in as best you can. None of the nymphs mind. A couple whisper excitedly.\n\nMost nymphs have either pink, cyan, or purplish skin, unfurred and smooth, fishlike. Some have sets of shimmering wings. A nymph bartender is flitting back and forth, taking orders, making drinks to-order: shaken, stirred, cummed-in...\n\n");

			if (!data.indigoPissed) {
				append("A drunken "+temp.a+" nymph girl with a protruding, well-used pussy slaps the table and demands a tall glass of piss and liquor. The bartender asks what kind of liquor. She says she doesn't care, goddammit, just liquor.");

				addChoice("I'll fill it up for you.", indigoPond.bind("ill fill"), {kinks: [(isActive("Pastel Ring")?"Toddler":"Cub")]});

			} else { //after piss

				if (!data.indigoToddlerDone) {
					if (data.hasCock || data.hasBoth) {

						if (isActive("Pastel Ring")) addChoice("Can you talk?", indigoPond.bind("can you talk"), {kinks: ["Baby"]});
						else addChoice("Hit on the nymph toddler.", indigoPond.bind("hit on nymph"), {kinks: ["Toddler"]});

						if (!data.nymphAddressed) append("A "+temp.b+" nymph girl flutters up to a barstool on gossamer wings. The bartender pops the cap off a sippy cup and fills it with goopy glowsap from a meteorite-chunk spile jutting from the tree the bar is built out of.\n\nShe sips.");
						else append("The nymphlet's gone back to sipping her sap, a little morose.");
					}
				}

				if (data.grabbedDrink && !data.bartenderTalked && isActive("Pastel Ring")) addChoice("Deja vu.", indigoPond.bind("deja vu"));
			}
			if (!data.bartenderTalked && !data.nymphAddressed) data.knownAsPlayer += 1;
			addChoice("Look around.", indigoPond.bind("main"));
		}

		if (seg == "can you talk") {
			data.nymphAddressed = true;
			append("She looks at you squarely and says \"Ba. Buh. Ba.\"\n\nNo, it seems her mouth is not yet able to form words. But it can sure suck tree sap down like a champ.");

			addChoice("Give her something to suck.", indigoPond.bind("give her something"));
			addChoice("Alright.", indigoPond.bind("check out bar"));
		}

		if (seg == "give her something") {
			data.indigoToddlerDone = true;
			append("You grab the little babyslut by her skull and cram the head of your cock past her sap-soaked lips. She squeals with happiness and grabs your shaft with both tiny hands, taking to it like a second sippy cup.\n\nThe patrons laugh and cheer, some slapping her jiggly ass, others ramming her face down further on your cock. With a little effort and the lucky happenstance of her being born a fucktoy, five fat inches slip down her infant esophagus before you bottom out in her stomach and pump it full of "+(isActive("Mood Ring")?getMood("You"):"")+"cum.\n\nHer eyes roll up and she says \"Ba. Buh. Ba.\" again, except this time muffled through a mouthful of cockmeat.\n\nAfter you pull out, the other nymphs grab hold of her roughly, by a foot or a thigh or an asscheek or whatever makes a good handle, and aggressively suck the "+(isActive("Mood Ring")?getMood("You"):"")+"cum from her mouth as she sputters and gags on heavy globs of it. Then a nymph boy takes her for round two, then another for round three, and before you know it you've started a chain-reaction barside baby gangbang.\n\nThings do calm down and get back to normal, but it takes forever.");

			addChoice("Next.", indigoPond.bind("check out bar"));
		}

		if (seg == "ill fill") {
			data.indigoPissed = true;
			unlockJournal("Bar");
			if (isActive("Pastel Ring")) temp.a = "four-year-old"
			else temp.a = "seven-year-old";

			//Genital fork
			if (data.hasCock || data.hasBoth)temp.b = "slip your half-hard cock over the rim, all the way to the bottom, releasing";
			else temp.b = "squat over the rim, the lips of your cunt pushing inside a little bit as you release";

				append("The busy bartender welcomes an excuse to get away from the demanding little drunkard. The "+temp.a+" fixes you with half-lidded eyes and slurs her thanks, holding the glass out, barely able to keep it upright.\n\nYou undo your pants and "+temp.b+" a thick jet of piss. She licks her lips as it makes that satisfying glass-filling-up noise (pwiiiip... or plurrrrp... or fwiiiiish...?) and doesn't stop you for any reason, even when her equally wasted girlfriend starts bugging her for a sip, even when your golden juice reaches the rim of the glass and starts to squirt out over her little hand.\n\nHer and her girlfriend slurp a little off the top to make room for the hard stuff, which the bartender exhaustedly pours in on his way to another customer. Then the "+temp.a+" locks her lips to the glass and holds eye contact with you while she chugs your piss down in huge, throat-bulging gulps, tiny "+(isActive("Pastel Ring")?"toddler":"")+"cunt leaking with her own clear pee as she crams two fingers inside it.\n\nThe bartender rolls his eyes. \"Okay, you're cut off...\"");

			addChoice("Look around.", indigoPond.bind("main"));
			addChoice("Ahhh. Much better.", indigoPond.bind("check out bar"));
		}

		if (seg == "hit on nymph") {
			data.nymphAddressed = true;

			append("You slide over a stool and whip out a smooth hey-baby-come-here-often?\n\nShe pulls her plump lips off the spout of the sippy cup, strands of sap lacing down over her flat chest, then fixes you with smitten eyes. A little clumsily, cup still in-hand, she clambers onto the bar and offers her ass to you, swaying it around on all fours, feet crossed, toes wiggling with anticipation.\n\nDespite that, she still seems too shy to ask for anything specific...");

			addChoice("Fuck her in front of everyone~!", indigoPond.bind("fuck her in front"));
			addChoice("Beg for it, sweetie.", indigoPond.bind("beg for it"));
			addChoice("Ignore the swaying nymph ass until she stops.", indigoPond.bind("check out bar"));
		}

		if (seg == "beg for it") {
			append("She blushes and shakes her head.");
			addChoice("Pretend to get up and leave.", indigoPond.bind("pretend to leave"));
		}

		if (seg == "pretend to leave") {
			append("Crestfallen, she reaches out. \"Wait! No! Come back!\"");
			addChoice("For what? You want something?", indigoPond.bind("you want something"));
		}

		if (seg == "you want something") {
			append("\"Cock! I want cock!\" she squeaks as loud as her shyness will allow, several sets of eyes turning to her as she spreads her knees until her cunt is almost touching the smooth surface of the bar.\n\nYou tease her a little further, pretending to consider leaving. She gets even more desperate: \"Look! Look! Wide open! Easy to rape!\"");

			addChoice("Take her.", indigoPond.bind("fuck her in front"));
		}

		if (seg == "fuck her in front") {
			append("You grab the little fucklet by both shoulders and spear her pussy to the hilt on the first thrust, slipping easily into her underaged womb. As she tightens in a shivery gasp, clearly about to belt out an annoyingly loud pleasure-scream, the bartender helps out and plugs her maw with the sippy cup.\n\nAs you work into a rhythm he strokes the nymph's head and whispers loving things into her ear. You listen as best you can, but only hear them at random...");

			var resultNum:Int = Math.floor(Math.random()*3+1);
			var resultPassage:String = "listen" + resultNum;

			addChoice("Listen.", indigoPond.bind(resultPassage));
			addChoice("Cum.", indigoPond.bind("indigotoddlercum"));
		}

		if (seg == "listen1") {
			append("\"That's it... let "+pickByGender("him", "her", "them")+" get as deep as you can, okay? Your womb makes too good a cockholster to go without a gaping.\"");

			addChoice("Cum.", indigoPond.bind("indigotoddlercum"));
		}

		if (seg == "listen2") {
			append("\"Easy... that's it. Heh, your butthole twitches every time "+pickByGender("he bottoms", "she bottoms", "they bottom")+" out...\"");

			addChoice("Cum.", indigoPond.bind("indigotoddlercum"));
		}

		if (seg == "listen3") {
			append("He's breathing on her face, working the spout of the sippy cup between her locked lips like a cock.\n\nHe whispers one word: \"Open.\"\n\nShe opens almost an inch wider, stretching her mouth as much as she can, and the bartender pushes the entire cup in, twisting it against the opening to her little throat and smearing sap across her uvula as she's wracked by deep, gurgly gags.");

			addChoice("Cum.", indigoPond.bind("indigotoddlercum"));
		}

		if (seg == "listen4") {
			append("He reaches down and wraps a hand around each little ankle, yanking her legs open for you, and you listen hard to hear him whisper two words to her:\n\n\"Take it.\"");

			addChoice("Cum.", indigoPond.bind("indigotoddlercum"));
		}

		if (seg == "indigotoddlercum") {
			data.indigoToddlerDone = true;
			cumEffect();
			append("You pump the nymphet's womb to overfilling with "+(isActive("Mood Ring")?getMood("You"):"")+"cum, her already bulged stomach puffing out with each spurt. The bartender holds her sippy cup with one hand and snakes the other down to her toddlercunt, brutally cramming in two fingers alongside your cock and pinching her tiny clit between them, "+(isActive("Mood Ring")?getMood("You"):"")+"cum squishing out over his knuckles.\n\nWith just that she tenses into an orgasm, glancing with a blush from spectator to spectator, her body filled to the deepest nook with both cum and the embarrassment of looking pregnant with it at the ripe old age of five.\n\nAfter a few rounds and some quite greedy cum-sucking on the part of the spectators, things wind down.");

			addChoice("Next.", indigoPond.bind("check out bar"));
			addChoice("Look around.", indigoPond.bind("main"));
		}

		if (seg == "deja vu") {
			append("The bartender laughs. \"Seen a baby at a bar before? You must've been to Septrica's. The otter bartender down on B-75 mentioned you. We bartenders have a secret communication system, you know. Mostly used for celebrity gossip now, if you'll pardon me implying you're a celebrity, but at one point it was nothing but squad talk 24/7.\"\n\nHe works his cloth inside a mug and rubs it til it squeaks.");

			addChoice("Squad talk?", indigoPond.bind("squad talk"));
		}

		if (seg == "squad talk") {
			append("\"You know, military. I won't sugarcoat it. We were a military force of bartenders.\"");
			addChoice("War doesn't sound very sexy.", indigoPond.bind("war doesnt sound"));
			addChoice("That's ridiculous.", indigoPond.bind("ridiculous"));
			addChoice("Holy fuck. Did you mix up molotov cocktails mid-combat or what?", indigoPond.bind("holy fuck"));
		}

		if (seg == "war doesnt sound") {
			data.bartenderTalked = true;
			append("\"Well, let me tell you, we sure <!i>made<!i> it sexy.\"\n\nThe bartender's wings unfold and he flexes. \"Dogfighter, myself. I can still do a couple... acrobatic maneuvers, if I put my mind to it.\"");

			addChoice("Hah.", indigoPond.bind("check out bar"));
		}

		if (seg == "ridiculous") {
			append("He frowns. \"Not like there were a bunch of soldiers coded in, were there?\"");
			addChoice("Well. I guess not.", indigoPond.bind("i guess not"));
		}

		if (seg == "i guess not") {
			data.bartenderTalked = true;
			append("\"It might've been better that way, thinking about it... but I did enjoy my time. I was proud to serve the State.\"");
			addChoice("Gotcha.", indigoPond.bind("check out bar"));
		}

		if (seg == "holy fuck") {
			data.bartenderTalked = true;
			data.knownCharacterImmortality++;
			append("\"Well, no. Everyone respawns, except the ferals and the Fuckmeat, of course. We used tranqs mostly. It's all about the three I's: incapacitation, imprisonment, and inculcation. Mostly the first one, since you never can know how long someone can be held or how sincere their change of heart really is... better to just put them under and keep them under.\"");

			addChoice("Oh.", indigoPond.bind("check out bar"));
		}
	}
}
