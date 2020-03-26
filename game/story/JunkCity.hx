package story;

class JunkCity {

	public static function init():Void {
		var snippet = 5;
		var common = 10;
		var rare = 2;
		var megarare = 1;

		addExplorable(47, "Junk City", junkCityExplore.bind("rng1"), common, 1);
		addExplorable(48, "Junk City", junkCityExplore.bind("rng2"), common, 1);
		addExplorable(49, "Junk City", junkCityExplore.bind("rng3"), common, 1);
		addExplorable(50, "Junk City", junkCityExplore.bind("rng4"), common, 1);
		addExplorable(51, "Junk City", junkCityExplore.bind("rng5"), common, 1);
		addExplorable(52, "Junk City", junkCityExplore.bind("rng6"), common, 1);
		addExplorable(53, "Junk City", junkCityExplore.bind("rng7"), common, 1);
		addExplorable(54, "Junk City", junkCityExplore.bind("rng8"), common, 1);
		addExplorable(55, "Junk City", junkCityExplore.bind("rng9"), common, 1);
		addExplorable(56, "Junk City", junkCityExplore.bind("rng10"), common, 1);
		addExplorable(57, "Junk City", junkCityExplore.bind("rng11"), common, 1);
		addExplorable(58, "Junk City", junkCityExplore.bind("rng12"), common, 1);
		addExplorable(59, "Junk City", junkCityExplore.bind("rng13"), common, 1);
		addExplorable(68, "Junk City", junkCityExplore.bind("rng14"), common, 1);

		addExplorable(60, "Junk City", junkCityExplore.bind("ExploreTrashCan"), common, 1);
		addExplorable(61, "Junk City", junkCityExplore.bind("ExploreParkingLot"), common, 1);
		addExplorable(62, "Junk City", junkCityExplore.bind("ExploreSeptricas"), common, 1);
		addExplorable(63, "Junk City", junkCityExplore.bind("ExploreDumpsterDrown"), common, 1);
		addExplorable(64, "Junk City", junkCityExplore.bind("ExploreTeenStripper"), common, 1);
		addExplorable(65, "Junk City", junkCityExplore.bind("ExploreSewerSuburbs"), common, 1);
		addExplorable(66, "Junk City", junkCityExplore.bind("ExploreBreedMe"), rare, 1);
		addExplorable(67, "Junk City", junkCityExplore.bind("ExploreLookout"), megarare, 1);
		addExplorable(69, "Junk City", junkCityExplore.bind("ExploreSnagglebank"), common, 1);
		addExplorable(75, "Junk City", junkCityExplore.bind("ExploreWorldShop"), common, 1);
		addExplorable(77, "Junk City", junkCityExplore.bind("ExploreLLL"), rare, 1);
		addExplorable(81, "Junk City", junkCityExplore.bind("ExploreHippy"), rare, -1);
		addExplorable(82, "Junk City", junkCityExplore.bind("ExploreCade"), common, 1);
		addExplorable(117, "Junk City", junkCityExplore.bind("Slums"), common, 1);
		addExplorable(132, "Junk City", junkCityExplore.bind("ExploreScrap"), 20, 5);

		addExplorable(121, "Work", work.bind("work1"), snippet, -1);
		addExplorable(122, "Work", work.bind("work2"), snippet, -1);
		addExplorable(123, "Work", work.bind("work3"), snippet, -1);
		addExplorable(124, "Work", work.bind("work4"), snippet, -1);
		addExplorable(125, "Work", work.bind("work5"), snippet, -1);
		addExplorable(126, "Work", work.bind("work6"), snippet, -1);
		addExplorable(127, "Work", work.bind("work7"), snippet, -1);
		addExplorable(128, "Work", work.bind("work8"), snippet, -1);
		addExplorable(129, "Work", work.bind("work9"), common, -1);
		addExplorable(130, "Work", work.bind("work10"), common, -1);
		addExplorable(135, "Work", work.bind("work11"), common, -1);
		addExplorable(136, "Work", work.bind("work12"), common, -1);
		addExplorable(137, "Work", work.bind("work13"), common, -1);
		addExplorable(138, "Work", work.bind("work14"), common, -1);
		addExplorable(139, "Work", work.bind("work15"), common, -1);
		addExplorable(140, "Work", work.bind("work16"), common, -1);
	}

	public static function junkCityHub():Void {
		clear();

		//Setup
		playMusic("junkCity");
		setLocation("Junk City");
		saveCheckpoint("JunkCity.junkCityHub();");

		//Bank anti-spam
		data.justCheckedBank = false;

		//Unlock Scenes
		if (data.metMarei > 0 && !getJournalEntries().contains("Public Snuff")) {
			addExplorable(142, "Junk City", junkCityExplore.bind("ExplorePublicSnuff"), 10, 1);
			GameData.reInitRefs();
		}

		if (data.metLana > 0 && data.libraryJohnIntro && !data.johnLanaJCDone) {
			addExplorable(146, "Junk City", junkCityExplore.bind("JohnLanaJC"), 20, 1);
			GameData.reInitRefs();
		}

		if (getJournalEntries().contains("Red After Apo") && !getJournalEntries().contains("Red Moved") && data.redChoseCity) {
			addExplorable(152, "Junk City", junkCityExplore.bind("redMove1"), 20, 1);
			GameData.reInitRefs();
		}

		if (!data.jcIntroDone) {
			data.jcIntroDone = true;
			append("You spawn under Junk City's murky garbo streetlights.\n\n"+pickOne(
				["Everything is made of junk and decorated with junk. People let their junk hang out while they scarf down junk food, chat naked on the street, walk their sluts or pets (or literal feral pets), fuck each other mercilessly into the pavement, y'know, just stylish urban-lifestyle stuff.",
				"Crowds form and evaporate around you. Everyone seems flustered and torn between either gushing over you or trying to act like you're just a sex object that hardly deserves notice; when the latter do give you a little attention, they all pay special attention to your "+pickByGenitals
					(
						"cock, pointing out how positively girthalicious your shaft is, how daintily your fat nuts hang below it",

						"cunt. Some excited raccoon drags two soft fingers over the spot where your puffy lips meet (solely to show his turtlenecked fox friend about the curvature, not to invade your privacy!) while a seagull admires the "+(data.hasBoobs?"equally remarkable curvature of your giant fucking tits":"equally remarkable curvature of your bulbous areolas"),

						(Math.random()>0.5?"cock, pointing out how positively girthalicious your shaft is, how daintily your fat nuts hang below it":"cunt. Some excited raccoon drags two soft fingers over the spot where your puffy lips meet (solely to show his turtlenecked fox friend about the curvature, not to invade your privacy!) while a seagull admires the "+(data.hasBoobs?"equally remarkable curvature of your giant fucking tits":"equally remarkable curvature of your bulbous areolas")
					)
					)])+".\n\nYou're not sure what everyone's excited about. They're too excited to tell.\n\nYour eyes wander to the City's centerpiece: the highest skyscraper, scaly with windows and constructed in the shape of a helix from salvaged green steel.");
			addChoice("Head toward the green helix skyscraper.", function() {
				disableExplorable(62);
				Septricas.septricasExplore();
			});
			addChoice("Move along.", junkCityHub);
		} else {
			if (data.theme.background != "dawn" && data.theme.background != "enginetic" && data.theme.background != "freak") {
				var s:MintSprite = addSprite("assets/img/effect/junkCityHub.png");
				var destinationY:Int = 51;
				s.x = 0;
				s.y = destinationY+50;
				s.alpha = 0;
				tween(s, {y: destinationY}, 1.5, {ease: QUINT_OUT});
				tween(s, {alpha: 1}, 1.4, {ease: QUINT_IN});
			}
			startHub("Junk City");
			append("You're somewhere in Junk City.");
			if (!data.myntScenesDisabled) MyntScenes.checkScenes();
		}
	}

	public static function junkCityExplore(which:String):Void {
		clear();
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("JunkCity.junkCityExplore('"+which+"');");
		if (which == "rng1") {
			append("A man and his son peel out of their driveway in a convertible, both wearing aviators and hanging an arm off the side.");
		} else if (which == "rng2") {
			append("You pass a skeevy rat girl shaking her(?) wallet upside-down; one measly cap falls out. \"Pittance,\" she spits.");
		} else if (which == "rng3") {
			if (data.metBins == 0) append("There's a little raccoon cub rooting")
			else append("Bins the raccoon roots");
			append(" through the garbage behind a butchery, striped poof tail a-wagglin.\n\nHe digs up a bunch of gross trash, but leaves five perfectly good Capsules...");
			if (canGain) addToItem("Capsule", 5);
		} else if (which == "rng4") {
			append("A small-time brothel made of tires slumps over the road on rickety stilts. The gazelle matron leans against a lamp-post smoking a pink cigarette.\n\n\"Yet again,\" she says at you, and exhales. \"Hey— let me pass you a message. If you're ever stuck, and you're not sure how to progress, go talk to a stinky goat in the Sewer Suburbs. Got it? Good.\"");
		} else if (which == "rng5") {
			append("You come across Hyper Land's locked entrance gate. 'Grand re-opening soon!'\n\nThe letters have been scratched out and scribbled over with 'Grand re-opening elsewhere'");
		} else if (which == "rng6") {
			append("You pass under the beady gaze of a crocodile billboard. 'Snagglebank', it reads. 'NEW XXX-change rate: x2 Fuckmeat --> x1 Capsule'");
		} else if (which == "rng7") {
			append("A mouse darts from an alley and alights one dainty grope upon ");
			append(pickByGenitals("the bulge of your cock", "the slight mound of your pussy", "each individual bulge of your nuts"));
			append(", then skitters off into the night.");
		} else if (which == "rng8") {
			append("You take a wrong turn and accidentally end up walking down a forty-lane highway which curves over some of the smaller skyscrapers.");
		} else if (which == "rng9") {
			append("A spastic wiry-haired coyote is screaming about the apocalypse on a streetcorner, holding up a sign that says 'BEWARE THE BLUE BUKKAKE.'");
		} else if (which == "rng10") {
			append("Two kangaroo girls shiver at a bus stop, each warming their hands in the other's pouch.");
		} else if (which == "rng11") {
			append("'Ya and maybe I fucken don't have a car then, ya, maybe what if I don't then, ya? What'm I sposed ta do then?'\n\nA homeless beaver is talking shit to his cardboard box, kicking it intermittently.");
		} else if (which == "rng12") {
			append("A limo drifts out of a side-street doing 120, taking out several pedestrians; they all respawn in moments, scrambling to their feet and shouting insults. A singular scaley middle finger extends from the open sunroof.");
			data.knownCharacterImmortality++;
		} else if (which == "rng13") {
			append("Crowds form and disperse over an hour in front of a street show where a cat magician pulls a seemingly endless stream of anal beads from the butt of a pure-white rabbit with her upper body lodged inside a top hat.");
		} else if (which == "rng14") {
			append("There's a couple big, greasy guys fighting down an alley near the bars. One guy knocks the other's braces out, and you scoop up the metal bits. A thin little bluebird watches them from afar, wing on her puss.");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));
		}

		if (which == "redMove1") {
			unlockJournal("Red Moved");
			msg("<!img:kink/Guest Writer.png> Guest Writer: Taylertots", true);
			append("As you walk through an intersection, you glance up at a street labelled <!i>Septric Crescent.<!i>\n\nYou see a brown-and-red blur out of the corner of your eye sprinting towards you from the distance.\n\nIt's closing in. Fast.\n\n\""+data.playerName+"!!\"\n\nRed tacklehugs you and almost knocks you off your feet. You take a step back and plant your foot firmly against the pavement so you don't fall over from her startling loli power. Having rammed her crotch-height head directly into your "+pickByGenitals("cock", "cunt", "cock")+", Red takes a long, deep sniff of your scent and pulls off.\n\nShe looks up. Her twinkling eyes meet yours. An uncharacteristically wholesome ear-to-ear grin is plastered on her face. There isn't even any wolfish mischeif in it. It's just pure glee.\n\n\"I'm all moved in!!!\"");
			addChoice("Woah hey! You're all moved in?", junkCityExplore.bind("redMove2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove2") {
			append("\"YES! Cage put a good word in with Snagg for me, and he was able to hook me up with a temporary rental. No strings attached, no commitment. I love that bull so much, y'know that? We're like kindred tsunderes. Even though we've barely spoken or banged for twenty-something years, we picked things up right where we left off. Oh, shit. I'm so glad you finally came! I knew it was just a matter of time. I couldn't keep you the fuck away from my place in the forest.\"\n\nHer eyes light up even more.\n\n\"Oh yeah!! I gotta take you to this little restaurant I used to hit up all the time. You're gonna love it. They make the best, most greasiest, raunchiest sloppy joes in Junk City. C'mon!!\"\n\nBefore you can say a word, Red grabs your arm and starts jogging down the street like she's on a mission.");
			addChoice("Wuaauaaua okay~", junkCityExplore.bind("redMove3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove3") {
			append("After a short forced run you come up to a decrepit looking hole-in-the-wall, gasping for air. You glance up at a pink neon sign. Half of the letters flicker on and off, threatening to burn out at any moment:\n\n<!i>MARLENE'S DIVE<!i>\n\nRed extends her little paw and shoves the swinging door open. She doesn't even slow down when she gets inside. She just makes a beeline for her usual booth.\n\nYou follow her in.\n\nShe <!i>pomfs<!i> her ass down on the comfy, worn booth seat and wiggles it into the fabric to get comfortable.");
			var spr:MintSprite = addSprite("assets/img/effect/marlenesDive");
				spr.x = GAME_WIDTH/2 - spr.width/2;
				spr.y = GAME_HEIGHT/2;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Font: Rubber");
			addChoice("Take a seat opposite her.", junkCityExplore.bind("redMove4"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove4") {
			append("Your waitress approaches: a chubby hyena chick with fat piercings, ripped stockings, blue lipstick, six barettes, pigtails, and an apron which barely covers her crotch (let alone the hulking tranquilizer pistol on her hip). She sashays up to your table with a pad of paper and a pen. The wide, puffy nipples on her gigantic tits spill out from the sides of her apron. You're not quite sure if there's a point to wearing an apron if it's just gonna be pretty much tucked into her cleavage.\n\nShe looks up from her pad and speaks with a fake southern drawl:\n\n\"Welcome to Marlene's, home of th—\"\n\nThe spiel stops. Her jaw drops.\n\n\"Wh-Wha— Red?! Is that you?!\"\n\nRed beams up at her. \"Marlene! You're still working here? I thought you were into gang shit now.\"\n\n\"Of course I still work here, the fuckin door has my name on it! I just do gangster shit on the weekends with my hyena boys. You know what the fuck is good. Pack lyfe.\"\n\nShe thumps her chest with a fist and throws out some gang sign that kind of looks like a broken spider. You're not sure how she can move her fingers like that...\n\n\"C'mon darlin,\" Marlene purrs, bending over the table so her tits hang in Red's face. \"Let me give you some sugar, Red... like I used to...\"\n\nShe wraps Red in a head-poppingly tight embrace, smothering the poor/lucky loli's face right between her colossal jugs, each one much bigger than Red's whole head. She glances at you. \"And I see you brought your "+pickByGender("boyfriend", "girlfriend", "S.O.")+", too...\"\n\n\""+pickByGender("He's", "She's", "They're")+" not my "+pickByGender("boyfriend", "girlfriend", "S.O.")+",\" Red says into Marlene's tits.\n\n\"Suuure. You think I don't hear the word on the street? "+pickByGender("He's", "She's", "They've")+" barely given anyone the time for multiple scenes besides you. Fuck, they've probably read my name once? Twice, maybe?\"\n\nRed unplugs her face from Marlene's tits and changes the subject hurriedly, scooching an inch away from you on the booth seat. \"Marlene, can we just get two sloppy joes, please?\"");
			addChoice(":3c", junkCityExplore.bind("redMove5"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove5") {
			append("Marlene inhales through her teeth.\n\n\"Ooh... I'm so sorry hon, but we just took em off the menu. I didn't have much say in it. Boys walked in, tossed everything, told me stop serving feral meat, and walked out. Seems the debates in the L.L.L., Apothecary, and Sep's are all over. Kemp and that goddamn deer hippy won the argument, and now there's a feral meat ban on.\"\n\nMarlene tightens her mouth like she's holding in a few more things she'd like to say about that.\n\nRed's expression crumbles. She's disappointed, dejected, depressed, dismayed, and disenchanted with her rosy City memories, all at once.");
			addChoice("Next.", junkCityExplore.bind("redMove6"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove6") {
			append("Red's about to slam her fist on the table and throw a tantrum, but she holds herself back.\n\n\"Wait...\" she mumbles. Marlene shoots her a needy glance that only two scavenger carnivores could share together. Red goes on: \"How long ago did they toss the meat out?\"\n\nMarlene glances to either side. The customers aren't paying you three any attention.\n\n\"Listen...\" Marlene leans in closely and whispers. \"It was just yesterday morning. Haven't told anyone about it yet, cause I know word would reach Bins in no time and then the whole fuckin stash would be gone in a day, but... you might wanna check out back if you're in the mood for somethin a little more... substantial. I won't be hurtin for customers if you head out and grab a bite from there, darlin...\"\n\nThe bell on the entrance door tinkles. Marlene waves to a pack of dark-eyed hyena boys who come in, nod at her, and head up to the breakfast bar.\n\nRed looks at you. She's salivating at her own mental image of the dumpster: hulking, packed full of old meat, almost visible green fumes wafting up to the sky...\n\n\"Do... um. Do you mind?\" Red asks you.");
			addChoice("Not at all. Let's go dumpster diving!", junkCityExplore.bind("redMove7"), {kinks: ["Cub", "Female", "Trash", "Vomit", "Foodplay", "Gore", "Raunch", "Raunch", "Raunch"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove7") {
			append("Marlene gestures for you to follow her. She takes you behind the counter, through the kitchen, and past the heavy steel door that leads to the alleyway behind the restaurant.\n\n\"S'all back there... rotten as fuck. Nice to have you back, Red.\" She winks and slaps that little loli ass through the soft fabric of her cloak. Red jumps forward and blushes. She looks at the ground and tugs her cloak shut around her dripping cunt. \"Th-Thanks, Marlene.\"\n\nThe bells hanging from the front entrance jingle in the distance.\n\nMarlene sighs. \"Ooop! Gotta go seat some new customers. Anyway, there's a meal on the house in there. Knock yerselves out!\"\n\nMarlene turns on her heel and walks back out to the storefront. \"Hi! Welcome to Marlene's, home of...\" her voice fades as she turns the corner.");
			addChoice("Examine dumpster.", junkCityExplore.bind("redMove8"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove8") {
			append("When you turn back around, Red's already sniffing around the sides of the dumpster's heavy lid. She's picked up on the faint scent of meatstains around the edges. Her tail is vibrating. She looks up at you excitedly. Her stomach growls loud enough for you to hear.\n\n\"You've never seen me like this,\" she says, just to put that out there.");
			addChoice("No, I haven't. (Haul open the dumpster lid.)", junkCityExplore.bind("redMove9"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove9") {
			append("A foul odor graces your nostrils the instant heavy metal door cracks open. It swings wide...\n\nThe stench hits you like wasabi up the nose. Your eyelids flutter involuntarily. You turn away from the gush of rotten gasses and look around, eyes watering, reeling with the stank.\n\nAround the two of you is a narrow cobblestone alley lined with bags of trash and various piles of litter. A huge, wide-open dumpster against the back wall dominates the scene. You feel sticky just looking at the viscous, sewage-like grease slowly making its way down the sides.\n\nIt's overfilling. Stuffed to the brim with refuse. There's paper cups, crumpled up tray liners, and used napkins peppered around a deluge of overripe produce and rotten meat.\n\nRed braces her arm against your hips, almost falling over. She huffs, and puffs, and forces out all the air in her lungs. She walks out into the alley, towards the dumpster, and flaps her paws around to waft the dank stench to her little nostrils.\n\nShe takes the deepest breath she can... and instantly falls to her knees.\n\nThey slide apart on the grimy pavement, revealing a bright red wolfcunt. She's gagging. She grips her tensed stomach and dry heaves a few times, then starts puking on the ground in front of her. She really leans into it; head out, neck exposed, ass out. Red clenches and pushes to force the puke out, like she's giving oral birth.\n\nThe chunky, pale yellow-brown contents of her stomach splash onto the concrete and seep into the cracks, flowing outwards. Her retching gives way to moans of total bliss as she keels over face-down, ass-up into her own pukepuddle with a tiny <!i>splish.<!i>\n\nFrom your vantage point, you can see her little slit and asshole as they rapidly wink and twitch. Girlcum squirts out behind her.");
			addChoice("Red, you're such a fuckpig. <3", junkCityExplore.bind("redMovePig"));
			addChoice("Next.", junkCityExplore.bind("redMoveNoPig"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMoveNoPig") {
			append("Red drops her face to the ground and snorts her own puke up like cocaine. The burn and the disgust of it ripples through her body as tangible spasms. She pulls off, throwing arcs of creamy beige through the air, and breathes in with a soul-soothing gasp.\n\nShe lies still for a moment— or at least as still as she can be while her body convulses in post-orgasmic bliss— and her moans are reduced to a slow vocal fry.\n\nRed glances over her shoulder, right at you. She regains enough control of her body to sensually wiggle her lil cub ass. Her cunt is leaking slime that, at this point, drips all the way down her thighs until it beads up in the cracks behind her knees. \"If you don't come fuck me right now I'm gonna be pissed off,\" she states matter-of-factly.");
			addChoice("Come fuck her~", junkCityExplore.bind("redMoveFuck"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMovePig") {
			append("Red grunts affirmation. She doesn't have any space left in her mind to feel embarrased about showing you her winking cunt while her face hovers inches above her own pukepuddle. Lust consumes everything.\n\nShe devolves into absolute fuckpiggery: she drops her face to the ground and snorts her own puke up like cocaine. The burn and the disgust of it ripples through her body as tangible spasms. She pulls off, throwing arcs of creamy beige through the air, and breathes in the stinking air.\n\nShe lies still for a moment— or at least as still as she can be while her body convulses in post-orgasmic bliss— and her moans are reduced to a slow vocal fry.\n\nRed glances over her shoulder, right at you. She's giving you bedroom eyes like having half her face coated with hot puke is a sexy thing, something to be flaunted. She regains enough control of her body to sensually wiggle her lil cub ass for you. Her cunt is leaking pure, clear beads of lube that, at this point, drip all the way down her thighs until they coalesce in the cracks behind her knees.\n\n\"If you don't come fuck me right now I'm gonna be pissed off,\" she states matter-of-factly.");
			addChoice("Come fuck her~", junkCityExplore.bind("redMoveFuck"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMoveFuck") {
			append("You approach her crumpled-over body and kneel. Your calves dip into the puddle of puke that Red lays in. Her cloak has gone from red to dirty orange.\n\nShe flips onto her back with a splash and reaches her paws up for support, shaking. You take one in each hand, interweaving your big fingers between her little cub ones, you and lower your "+pickByGenitals("cocktip to her", "pussylips to her own", "cocktip to her")+" aching cunt. All that drippage slips over your bare skin, warm and wet, and her lips "+pickByGenitals("open for you easily", "kiss yours", "open for you easily")+"...\n\n\"Come on...\"\n\nShe's dripping so much. You "+pickByGenitals("pop your head in, just enough to make her inhale some stinky alley air", "smush your labias together and grind roughly, so roughly her buttcheeks flatten in the warm pukepuddle", "pop your head in, just enough to make her inhale some stinky alley air")+". As the two of you "+pickByGenitals("fuck", "scissor", "fuck")+" in the filth, Red slowly peels her paws away from yours and starts to make goopy snow angels, eyes shut tight with utter bliss.");
			addChoice("Harder.", junkCityExplore.bind("redMove10"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove10") {
			append("You grab her gently by her soft-furred throat and smash your hips down into hers. "+pickByGenitals("Your cock slides all the way inside her, bullying the entrance to her tiny womb", "Your cunt squirts hot "+pickByGender("boy", "girl", "")+"juice over her lips, which then trickles down between her slimy buttcheeks", "Your cock slides all the way inside her, bullying the entrance to her tiny womb")+"~ Red squeaks hard, grabbing fistfuls of her own puke and shovelling them back into her maw. She throws her head back against the pavement, strains her neck, and chews voraciously. The thick, bitter flavor of bile washes over her tongue, and, to her, it's like gnashing up a mouthful of creamy chocolate truffles.\n\n\"Meath,\" she slurs past her mouthful of puke. \"Want meath.\"");
			addChoice("Throw her in the dumpster and keep fucking her.", junkCityExplore.bind("redMove11"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove11") {
			append("You yank Red out of her pitiful puddle with two hands under her armpits and throw her right into the fuckin dumpster where she belongs.\n\nRotten meat and used toilet paper seep around her tiny body, halfway engulfing it. Red moans and stretches, feeling herself up like a cub pornstar, smearing meatgrease and garbojuice up her underdeveloped curves. She turns her head to one side and takes a chomp out of a soggy bun and the fly-ridden sloppy joe spilling out from between it.\n\n\"Jush like I member...\" she purrs, chewing slowly. Slimy strands of grease splurt out between her molars as she chews the chunks of meat. Even more of that grease pours down her chin and her bare, flat chest, forming long rivulets that reach all the way to her little cunt, seep down the crack between her lips, and lube her up even wetter than she already was.");
			addChoice("Jump in and take her.", junkCityExplore.bind("redMove12"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove12") {
			cumEffect();
			append("You jump in too.\n\nThe rotten meat comes up to your thighs "+pickByGenitals("and nuts", "", "and nuts and cunt")+". Feels like a ball pit might feel if they were big meatballs instead of plastic ones. You shift your weight and trudge through the dumpster muck towards her, creating a wake which slowly yawns shut behind you.\n\nWhile that shuts, Red opens: she spreads her legs until they're parallel, presenting a cunt and butthole completely overrun by dark brown meatchunks and clumps of dirt.\n\nYou fall on her all at once with "+pickByGender("crushing thrusts", "violent scissors", "crushing thrusts")+". Red gasps for breath as you beat on her diaphragm with your hips. Every single hump fills the dumpster with an echoing <!i>SPLRGSH<!i>— the sound of Red's body sinking deeper into the viscous meatmud.\n\n\"Please... more... more...\"\n\nYou screw your eyes shut and "+pickByGender("rape", "grind on", "rape")+" Red.\n\nAfter a moment, you open your eyes. Between her legs, "+pickByGenitals((isActive("Mood Ring")?getMood():"")+"cum", "glossy pussy slime", (isActive("Mood Ring")?getMood():"")+"cum")+" leaks out... but that's not where you're looking.\n\nYou're looking at her upper body, which has now been totally enveloped in the meat. You can only spot her two clawed hands, scrabbling around in random directions, scooping up huge fistfuls of sloppy joes and stuffing them down her throat. She must've been doing this the whole time; her belly looks fat and pregnant, and she can't help but burp every two seconds from the rotten gasses forming inside it.\n\nRed cranes her neck above the sea of trash and speaks through a full mouth: \"Fank... ooo...\"");
			addChoice("No prob. Wind down. <3", junkCityExplore.bind("redMove13"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove13") {
			append("You climb out of the dumpster and towel off using some random cub off the street. Well, he offered to be your trash rag, and Red accepted on your behalf...\n\nNow you're sitting in this dingy, shitty alleyway, backs to the wall, cuddling like two lovers on a cruise. The slaps and squeals and screams of violent sex echo all around you.\n\n\"I think I'm already feeling better, just listening to the ambience,\" Red mumbles. \"Compared to the forest silence... fuck, there's just so much to listen to...\"\n\nShe runs a paw over her beachball belly, groping it. If she presses down too hard, a wet, gurgling, rotten burp leaks up her throat. Naturally, she grabs your wrist and forces you to palm her belly roughly~");
			addChoice("Kiss her.", junkCityExplore.bind("redMove14"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "redMove14") {
			append("You press your mouth to hers and suck her wet burps down~\n\nRed blushes, eyes half-lidded. She places a paw on the back of your head and exhales hard, filling your lungs with filthy, grease-tainted air.\n\nAs she breaks the kiss, a green limo pulls up.\n\nThe driver was mid-sentence when one of the back doors opens: \".... ardly have time for this. The flood is coming soon.\"\n\n\"We know,\" "+(data.metSnagg>0?"Snagg":"a greasy croc dude")+" grunts, hauling his own fat ass out of the backseat. \"Just gonna have a little fun. The wolf moved back just a bit ago.\"\n\n\"Alright,\" the driver concedes. \"Have your fun, boys. Just be prepared.\"\n\nA muscled bull gets out the other side. His dark eyes lock to Red, and her eyes lock to his.\n\n\"Cage!\" she says, surprised.\n\n\"Pukewhore!\" Snagg chimes, faux-surprised. \"Crazy that we found you behind your favorite restaurant next to a dumpster full of rotten meat. Last place we thought to check.\"\n\nCage says nothing. He just storms up, grabs Red by one of her comparatively tiny ankles, and throws her into the dumpster so hard her whole body goes <!i>WHUMP<!i> against its metallic back wall. Red writhes and desperately sucks in the garbofumes, winded.\n\nSnagg and Cage brush past you with curt nods. They both alley-oop the rim of the dumpster and disappear inside it.\n\nThe only thing you see from that point on is an occasional splurt of disgusting brown trashjuice or a tiny paw reaching up helplessly. The only thing you hear is low, mean growls of dirty talk, Red's tiny squeaks, and an endless barrage of wet noises: the rhythmic slap of hips meeting asscheeks.\n\n\"The fuck are these?\" Snagg growls.\n\nRed squeals harshly. \"M-My tits! My tits!\"\n\n\"And how fucking big are they? Say your classic line. Say it.\"\n\n\"T-They're g-ginormo!\"\n\n\"SAY THE WHOLE LINE!\"\n\n\"TH-THEY'RE MY G-GINORMO LOLI TIDDIES!\"\n\nSnagg howls with pleasure. Sounds like he thrusts forward mercilessly deep. Red screams and her fingers claw up over the rim of the dumpster.\n\n\"YOU'RE JUST A FUCKIN MEME DISPENSER, YOU KNOW THAT?\" Snagg shouts in her face.\n\n\"I-I'm sorry! I'm sorry!\"");
			addChoice("Move along~", junkCityHub);
		}

		if (which == "floodHub") {
			disablePause();
			setLocation("Sticky City");
			append("Citygoers seemed mostly unconcerned for the first few waves, because they broke against the battlements and lost all momentum. That changed fast. Soon the glowberry mush started piling up, and piling up, and now whole waves gush through the parapets and shower down into the streets. Businessmen pull half-submerged hobos from the gutters. Filthlovers pour out of the manholes, storm drains, and subways as panic spreads down to the Sewer Suburbs.");

			addChoice("Sewer Suburbs.", junkCityExplore.bind("floodSewerSuburbs"));
			addChoice("Snagglebank.", junkCityExplore.bind("floodSnagglebank"));
			addChoice("Septrica's.", junkCityExplore.bind("floodSeptricas"));
			addChoice("Uhhh shit idk save deer hippy?!?", junkCityExplore.bind("floodDeerHippy"));
			addChoice("World Map.", function() {
				WorldMap.map();
			});
		}

		if (which == "floodDeerHippy") {
			append("She stands in the middle of the street, arms out to either side like Christ.\n\n\"Take me,\" she beseeches the approaching wave. \"Take my soul, Mint, and bring it close to your bosom. Make me one with all peoples. Deliver me unto the new world. I am only a deer. I am only an islander. A narrator such as yourself has an inviolable right to my soul. Take me, Mint... take me!\"\n\nThe wave consumes her. It knocks her over and smashes her skull against the pavement. Her flower crown falls off.\n\nThe deer hippy succumbs to full infection with a dreamy smile on her face.");

			addChoice("What the fuck move along!!!", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodSnagglebank") {
			append("You hurry into the Snagglebank, looking for you don't know who. Half the city has crammed themselves into this tiny lobby. They're all screaming and climbing over each other, trying to withdraw all their capsules at once. Bankers in suits punch each other in the face. Employees try not to get hatefucked, tossing out the codes to every vault willy nilly and trying to fight their way to the exit. Hyena gangsters show up and start shooting randomly, barking about the secret stash and where is it and nobody better be a fucking hero or else somebody's gonna—\n\nYou tune out. Something caught your eye:\n\nA shimmer from the hanging crystal prisms. They're rotating slowly. For the first time, you notice they're hollow.\n\nThe reason they're rotating is because all the strings they have been hung by were automtically cut just a second ago. The threads fray and unravel.\n\nThey drop. All of them smash on the floor. Potent sweetgrass gas (sweetgas) bursts out and fills the room, tranquilzing the panicked crowds like dominos. The gangsters piss their pants and turn to leave just before the green smog overtakes them.");

			addChoice("... So that's what those were for.", junkCityExplore.bind("floodSnagglebank2"));
			addChoice("Move along!", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodSnagglebank2") {
			append("You back away to avoid the sweetgas and then rush back in with your nose and mouth shut. The cute seagull secretary isn't in the pile of unconscious employees— she must not have escaped from the wedding.\n\n<!i>Bang.<!i>\n\nSnagg's green office door flies open and collides with some rando's skull.");

			addChoice(".....", junkCityExplore.bind("floodSnagglebank3"));
			addChoice("Move along!", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodSnagglebank3") {
			append("Snagg casually walks out of the office.\n\nHe's two fat sacks of capsules slung over his back, one on each shoulder. He places his steps around the anguished faces and contorted limbs of his customers.\n\n\"Pretty fucked-up reason for an economy, huh?\" he asks you, grinning sharply. \"Couple thousand islanders gathering berries almost every day. Fifty berries sold per islander. Tens of thousands of berries sold per AUTO-SHOP, per day. Multiply that by fifty years or so, and what do you end up with? Billions of glowberries just sitting in AUTO-MYNT inventories, waiting to be spawned en masse.\"\n\nHe leaves. A green limo pulls up out front. He throws his Capsule sacks in the back and gets in.\n\n\"Why'd you waste time grabbing those? Everything is ending, anyway,\" says the driver.\n\nSnagg scratches his ass. \"Ya never know. 'Sides, it'd hurt too much to just let em all get washed away...\"");

			addChoice("Move along...", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodSeptricas") {
			append("You catch Septrica trying to leave her brothel.\n\nHere's my chance...");
			timer(1, function() {
				clearText();
				append("You catch Septrica trying to leave her brothel.\n\nHere's your chance!!!");
				addChoice("Accost her!!", junkCityExplore.bind("floodSeptricas2"));
				addChoice("Move along!", junkCityExplore.bind("floodHub"));
			});
		}

		function bigText(str:String):Void {
			var bigText:MintText = addText();
			bigText.setFormat({wordWrap: false, fontColour: 0x00f0ff, fontSize: 34});
			bigText.setText(str);
			bigText.applyGlowEffect(0xFF000000, 3, 50, 50, 10);
			bigText.x = GAME_WIDTH/2 - bigText.fieldWidth/2;
			bigText.y = GAME_HEIGHT/2 - bigText.fieldHeight/2;
			//bigText.layer = backgroundBlack.layer + 1;
			bigText.alpha = 0.7;
			bigText.update();

			tween(bigText, {y: bigText.y + 1}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(bigText, {alpha: 0.9}, 0.03, {ease: QUAD_IN_OUT, type: PINGPONG});
		}

		if (which == "floodSeptricas2") {
			data.currentSong = "";
			stopChannel("music");
			playSound("assets/audio/music/gunpoint", "music", {loops: 99999});
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.5;
			tween(goo2, {x: goo2.x + 2, y: goo2.y + 2}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("BEHOLD THE ULTIMATE SEXUAL DOMINATION");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas3");
		}

		if (which == "floodSeptricas3") {
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.5;
			tween(goo2, {x: goo2.x + 2, y: goo2.y + 2}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("THE GREAT BLUE BUKKAKE");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas4");
		}

		if (which == "floodSeptricas4") {
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.8;
			tween(goo2, {x: goo2.x + 1, y: goo2.y + 3}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("THOUSANDS POZZED");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas5");
		}

		if (which == "floodSeptricas5") {
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.3;
			tween(goo2, {x: goo2.x + 2, y: goo2.y + 3}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("THOUSANDS SUBJUGATED TO MINT'S WILL:");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas6");
		}

		if (which == "floodSeptricas6") {
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.2;
			tween(goo2, {x: goo2.x + 2, y: goo2.y + 2}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("CHASTITY IN THE NAME OF GOD.");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas7");
		}

		if (which == "floodSeptricas7") {
			if (getItem("Septrica's Seed").amount <= 0) addToItem("Septrica's Seed", 1);
			var goo:MintSprite = addSprite("assets/img/effect/goopocalypse");
			var goo2:MintSprite = addSprite("assets/img/effect/goopocalypse");
			goo.scaleX = goo.scaleY = goo2.scaleX = goo2.scaleY = 1.05;

			goo2.alpha = 0.5;
			tween(goo2, {x: goo2.x + 2, y: goo2.y + 2}, 0.03, {type: LOOP, ease: BOUNCE_OUT});
			tween(goo, {x: goo2.x - 2, y: goo2.y - 2}, 0.03, {type: LOOP, ease: BOUNCE_IN});
			bigText("ENJOY YOUR ETERNAL BLUEBALLS\n               MY LITTLE SLUTS!");

			goo.onReleaseOnceAnywhere = junkCityExplore.bind("floodSeptricas8");
		}

		if (which == "floodSeptricas8") {
			stopChannel("music");
			append("...\n\nShe runs off.\n\nSEE? I <!i>told<!i> you she was evil!! Don't trust anything she says!!");
			addChoice("...", junkCityExplore.bind("floodSeptricas9"));
		}

		if (which == "floodSeptricas9") {
			append("...\n\nWhat? What is it?");
			addChoice("... Move along.", junkCityExplore.bind("floodSeptricas10"));
		}

		if (which == "floodSeptricas10") {
			append("Oh— of course!\n\nWe gotta save people and stop this madness!!!!");
			addChoice("...", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodSewerSuburbs") {
			append("They've caught the worst of it; all the drains and canals of the city funnel glowjuice down here first, and it consumes everything. Roddy and Oni's apartment window cracks and breaks under the pressure of the flood inside. Dirty pipes overflow with cyan. The sewage river overflows and spills over the rickety metal walkways, throwing people into the waves.\n\nSnagg's mansion topples over. Cars crash into each other and clog the road to the surface. People run screaming from their infected friends and topple over into the cyan-swirled sewer water.");

			addChoice("Save fishergoat??", junkCityExplore.bind("floodFisher"));
			addChoice("Move along!", junkCityExplore.bind("floodHub"));
		}


		if (which == "floodFisher") {
			append("You approach the fishergoat...\n\nHe seems oddly calm, considering everyone around him is dying.");
			var s:MintSprite = addSprite("assets/img/effect/fishergoat.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: AeriaQuies", "");
				s.x = 350;
				s.y = 14;

			addChoice("Hey quick, you need a ride man?? I've got a gryphon here", junkCityExplore.bind("floodFisher2"));
			addChoice("I don't like this... move along!", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodFisher2") {
			append("He finally gets off his ass and reaches into the crate he was sitting on...\n\nThe crate marked Apothecary...");

			addChoice("Hello?????", junkCityExplore.bind("floodFisher3"));
			addChoice("Move along right now!", junkCityExplore.bind("floodHub"));
		}

		if (which == "floodFisher3") {
			timer(2, playSound.bind("assets/audio/environment/tranq", "tranq"));
			append("He mumbles to himself: \"Best time to go fishin is during a flood... got me a nice catch... I'll be able to plug you into the A.M.C.N. in no time...\"\n\nHe pulls out a tranquilizer pistol and shoots you in the face with it.");

			addChoice("OH fuck goddammit", junkCityExplore.bind("floodFisher4"));
		}

		if (which == "floodFisher4") {
			StoryUtils.badEnd(JunkCity.junkCityExplore.bind("floodSewerSuburbs"));
		}

		if (which == "JohnLanaJC") {
			data.johnLanaJCDone = true;
			StoryUtils.quickMynt("JohnLana");
			append("You come across the L.L.L. Field Research Van in the middle of a city park.\n\nJohn's on all fours, digging happily in the dirt. His tail wags high above his butt. If it wasn't for the lab coat, he'd be showing off his buttcrack to everyone. Not just style, but function! He peels out long, tenuous strings of mycellium, holds them up to the moonlight between his crossed eyes to ensure they have a healthy structure. Then, gently, he lowers them into glass vials until they're coiled neatly at the bottom.\n\nLana doesn't give a fuck about work. He toys with a rubik's cube, practicing fast and precise paw movement... but he can't get the blocks to move at all, half the time. He might as well be trying to solve a rubik's tesseract.");

			addChoice("Watcha digging up there, John?", junkCityExplore.bind("nerdsJohn"));
			addChoice("Need some help, Lana?", junkCityExplore.bind("nerdsLana"), {kinks: ["Cub", "Male"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "nerdsJohn") {
			append("\"Infected mushroom roots,\" he says. \"They've finally burrowed under the battlements. Usually you only find em in the forest.\"");
			addChoice("Oh? Gonna do some stir fry taste tests?", junkCityExplore.bind("nerdsJohn2"));
		}

		if (which == "nerdsJohn2") {
			append("\"I prefer them raw,\" he says. \"It's a dog thing. But... well... we already have nine refrigerators full, back at the L.L.L...\"\n\nHe screws the lid onto his sample container and tucks it in one of his over-stuffed pockets. \"Really, I'm just killing time until we get a call.\"");
			addChoice("Ah. Hey, I've been meaning to ask...", junkCityExplore.bind("nerdsJohn3"));
		}

		if (which == "nerdsJohn3") {
			append("Apprehension prickles over his face. \"Is it about my penis?\"");
			addChoice("... Yes.", junkCityExplore.bind("nerdsJohn4Penis"));
			addChoice("... Ha... whaaaat? Nooo...", junkCityExplore.bind("nerdsJohn4Penis"));
		}

		if (which == "nerdsJohn4Penis") {
			append("\"You want to see it, don't you.\"");
			addChoice("... Please? I'm so curious. :>", junkCityExplore.bind("nerdsJohn4Penis2"));
		}

		if (which == "nerdsJohn4Penis2") {
			halfWidthText();
			playMusic("falseMoon");
			append("He sighs. \"Alright, but... no touching.\"\n\nHe unzips his pants and coaxes them down. Next come the undies, which have a cute little Apothecary tag hanging off the back. Then his junk flops out, knot and nuts and everything.\n\n\"Before you ask,\" he says, \"yes, we've tried actually using it. Lana did the honors, of course. I couldn't feel anything, but in his report, he said it felt 'distinctly prismatic' against his prostate.\"");
			var s:MintSprite = addSprite("assets/img/effect/johnDick.png");
				s.x = GAME_WIDTH-s.width*1.2;
				s.y = GAME_HEIGHT-s.height-100;
				s.applyGlitchEffect();
			addChoice("Fascinating!!", junkCityExplore.bind("nerdsJohn4Penis3"));
		}

		if (which == "nerdsJohn4Penis3") {
			playMusic("junkCity");
			append("He tucks it back into his undies and shimmies his pants back up, blushing.\n\n\"Well, sure... I guess it's mildly fascinating...\"");
			addChoice("How come it's all glowy, but Lana's glitched paws aren't glowy?", junkCityExplore.bind("nerdsJohn4Penis4"));
		}

		if (which == "nerdsJohn4Penis4") {
			append("John's eyes light up, and his tail starts swishing like crazy.\n\n\"Now— <!i>that's<!i> the fascinating part! You see— when Lana bleeds from his paws, the blood is cyan— and when we performed a lobotomy on Mary— she was another one of us in the shipwreck, glitched brain— her grey matter had become <!i>cyan<!i> matter! I'm sure you also noticed I was hard— I'm always hard, despite having no libido and no tactile perception. Just like Lana's blood, and just like Mary's brain juices, my pre-cum has gone blue. And it uh... as a result of my perma-erection... it's just constantly leaking. The penis itself doesn't glow, but the coating of pre does.\"");
			addChoice("Ahhhh... is this the same glow as the glowy mushrooms...?", junkCityExplore.bind("nerdsJohn4Penis5"));
		}

		if (which == "nerdsJohn4Penis5") {
			append("He grabs you by your shoulders and fixes you with starstruck eyes. \"Ex-<!i>act<!i>ly the same. Is that not the most fascinating thing you've ever heard? What could it mean??\"");
			addChoice("It's mildly fascinating.", junkCityExplore.bind("nerdsJohn4Penis6"));
			addChoice("I yearn for answers!!", junkCityExplore.bind("nerdsJohn4Penis6"));
		}

		if (which == "nerdsJohn4Penis6") {
			append("He strikes a heroic pose and holds his glowshroom sample to the moonlight. \"YES!\" he shouts. \"We must study glowvirus with our full, undivided attention! We must strive every day for <!i>answers!<!i> We must collect more samples, even if we don't really need them! The cure to our glitches has to be hidden in these plants, somewhere— just waiting to be uncovered by the exhaustive efforts of SCIENCE!\"\n\nOver by the van, Lana takes a paw off his rubik's cube so he can stifle a yawn. The inertia multiplies and he smacks himself in the mouth.");
			addChoice("YEAH!... Well I'm gonna head out now.", junkCityExplore.bind("nerdsJohn4Penis7"));
		}

		if (which == "nerdsJohn4Penis7") {
			append("John adjusts his glasses. \"... Right. We'll be heading up the meteorite, next. See you there, maybe!\"");
			addChoice("Seeya.", junkCityHub);
		}

		if (which == "nerdsLana") {
			append("He flashes a deathglare at you. Invisible beams of raw frustration shoot from his eye sockets into yours.\n\n... He looks like he's gonna throw the cube at you, for a moment, but then he sets it down on a nearby park bench, closes his eyes, and forces his breathing to slow down.");
			addChoice("You know how to do it, right? You match up the colors on each side.", junkCityExplore.bind("nerdsLana2"));
		}

		if (which == "nerdsLana2") {
			append("He rolls his eyes and shoves his paws in your face.\n\nIt's been a bit since you got a really good, close-up look at them. For a single fleeting moment, they seem normal. Then... there it is, that flickery prismatic fog that slides up so nauseously from the heel of his palm and warps his little fingers into multiples or dividends of themselves.\n\nHis face says <!i>No shit I know how to do it. These won't let me.<!i>");
			addChoice("Ah. Then let me coach you. (Grab his hands all romantically.)", junkCityExplore.bind("nerdsLana3"), {kinks: ["Gore"]});
		}

		if (which == "nerdsLana3") {
			append("Lana slaps your hands away. His glitch multiplies the force of it a hundredfold. Both your wrists shatter completely.\n\nYou just stand there with your hands flopping around horrifically while he just stands there all tough, chest puffed out. Neither of you say a word... although... his lips do twitch a little, and you get the feeling he might've been close to apologizing if he wasn't mute.\n\nJohn gets his snout out of the dirt and scurries over, apologizing apologizing apologizing. He slips a syringe full of tranquilizer into your neck.\n\nYou pass out, overdose, and respawn with intact wrists.");
			addChoice("Ah... wha... hey, you little shit. I was just trying to help.", junkCityExplore.bind("nerdsLana4"));
		}

		if (which == "nerdsLana4") {
			append("Lana sniffs, holding his chin up, and gets back to praciticing without any help from anyone at all, thank you very much.");
			addChoice("Fuck this kid, hang out with John instead. Watcha digging up there dogdude?", junkCityExplore.bind("nerdsJohn"));
			addChoice("Jeez. Move along.", junkCityHub);
		}

		if (which == "ExplorePublicSnuff") {
			unlockJournal("Public Snuff");
			append("As you walk along the street, a green limousine pulls up beside you.\n\nThe cabin door opens and Marei swings his legs out. His bare footpaws hit the pavement with a double pap.\n\nBefore you can even say \"Hullo kitty!\" he wraps a hand around your neck and pricks you with a tiny syringe. The plunger drops. Green liquid gushes into your jugular.\n\nYou open your mouth to speak but find your tongue is all floppy and numb.\n\n\"Hello,\" he says. \"Don't worry about fighting the sedation hard enough to get out a 'yes' or 'no' or any of that gay shit, okay? You're gonna get raped either way.\"\n\n... You can only babble stupidily as Marei sweeps you off your feet like a true romantic and sets you down in a comfortable little pillow-packed nook way in the back of the limo's spacious interior.\n\nThe world teeters... then... after a moment... wait for it..... totters. The limo starts moving.\n\nHe gets comfy in the seats opposite you. His femmy waistline smears across your vision, catcock swinging lazily with it. He folds his paws politely in his lap and shoots you a self-satisfied grin.\n\nHe starts stroking himself openly. One slender leg extends towards you, and its footpaw nuzzles against your "+pickByGenitals("cock", "cunt", "cock")+".\n\n\"Move along if you like,\" he purrs. \"The crowd won't know the difference.\"");
			addChoice("Pass out.", junkCityExplore.bind("pubsnuff1"), {kinks: ["Patreon Commission", "Male", "Male", "Male", "Abuse", "Blood", "Gore", "Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff1") {
			append("You lay back and melt into the limo seats.\n\nOne moment— the last one you remember— you're warm and comfy in those seats; the next, you're naked face-down on a public stage with two strangers' dicks thrusting vigorously up your ass and a crowd of spectators yelling at someone behind you:\n\n\"Snuff "+pickByGender("him", "her", "em")+" hard!!\"\n\n\"Make "+pickByGender("him", "her", "em")+" deepthroat it, Marei!\"\n\n\"Oh fuck— "+pickByGender("he's", "she's", "they're")+" waking up—\"\n\nA crowd of naked people stands before you. It stretches down at least three blocks. Every single person is either stroking their junk or someone else's, all in one gyrational mass of fur and scales. Oh, and they all want you dead, too.");
			addChoice("Welcome the crowd to my snuff show!", junkCityExplore.bind("pubsnuffwelcome"));
			addChoice("Oh god, cover my shame!", junkCityExplore.bind("pubsnuffcover"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffwelcome") {
			append("You drag your sluggish body to its knees and spread them. Now that the crowd can see "+pickByGenitals("how hard you're throbbing", "how much you're leaking", "how hard you're throbbing and how much you're leaking")+" for them all, you throw your arms out and welcome everyone magnanimously to your public execution!\n\nThe two random guys currently doublefucking your ass grab an arm each and twist them behind your back to make your rape just a little bit easier for them and a little bit more painful for you.\n\nThe crowd breaks into applause. You're pushing demigod status to them. Some of the cubs are even falling to their knees and praising you as the one true prophesized snuffslut. The only people not praising you are doms, who choose instead to hiss insults through their grins.");
			addChoice("Next~", junkCityExplore.bind("pubsnuff2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffcover") {
			append("You shove your two rapists away and their cocks slip from your ass with a double <!i>schpop~!<!i>\n\nYou curl up, blush, and turn away— hiding your crotch from the crowd, but giving them a perfect view of your raped-open asshole which currently drools cum from the dozen-or-so loads that were forced inside your unconscious body earlier.\n\nThe crowd's praises stop entirely. Almost everyone starts fervently demanding that you should get murdered on the spot just for being so pathetic and adorable. Random people stand on their tip-toes and hook their fingers inside your donut, dragging you off the stage, and all at once the crowd falls upon you.");
			addChoice("Cry! Scream!", junkCityExplore.bind("pubsnuffcover2"), {kinks: ["Male", "Female", "Cub", "Abuse"]});
			addChoice("Next~", junkCityExplore.bind("pubsnuff2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffcover2") {
			append("You start wailing like a little bitch as men and women and cubs and even a couple ferals violently molest your body. They treat it like public property. Dozens of paws come down on your "+pickByGenitals("cock", "cunt", "cock")+" and face, slapping, groping, while others tweak your nipples or yank your ass open so two entirely new cocks can beat up your "+pickByGenitals("prostate", "insides", "prostate")+".\n\nOh, and you try to scream, but someone plugs that hole with a cock in about three seconds.");
			addChoice("Hnnn... next!", junkCityExplore.bind("pubsnuff2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff2") {
			append("Marei breaks up the ruckus and drags you by your throat up to a second level of the stage, complete with fizzlers and smoke machines and a huge neon sign that says FIRST PLAYER IN 60+ YEARS — PUBLICLY RAPED AND SNUFFED.\n\n\"My beloved cityfolk!\" he booms. (You never thought a voice that commanding could come from such a slender, femmy little cat.) \"You all know why we're here. It's on the sign, for fuck's sake, and if you haven't learned to read yet or forgot how because you haven't taken the dicks out of your eye sockets for twenty years, you'll just have to figure it out as we go along. Without further ado...\"\n\nSomething cold and metallic presses to the base of your skull, right against your brain stem.\n\n\""+data.playerName+", tell the audience why you deserve this.\"");
			addChoice("Because I chose to continue with this scene...", junkCityExplore.bind("pubsnuffchose"));
			addChoice("Scream and cry instead.", junkCityExplore.bind("pubsnuffscream"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffchose") {
			append("\"That's right~!\" Marei purrs, stroking your neck up and down with the barrel of his glock. \"You had the chance to move along— and <!i>have had<!i> the chance, even right now... yet, you're still here. You <!i>want<!i> to get raped and killed for an audience, don't you? You're the definition of a snuffrag. That's why you deserve this.\"");
			addChoice("Y-You're right...", junkCityExplore.bind("pubsnuff3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffscream") {
			append("You sob and flail pointlessly,"+(data.hasBoobs?" tits swinging around,":"")+" trying to squirm away from the gun. Marei holds you tight against his smooth belly. You can feel the barbs on his cock dragging painlessly up and down your ass.\n\nAs tears pour down your cheeks the crowd jeers their approval, mocking you– \"Oh nooo, pleaaase, please don't shoot me in the head!\"— while Marei simply scoops a few shiny little teardrops up with his claw and sucks it clean.");
			addChoice("Please...", junkCityExplore.bind("pubsnuff3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff3") {
			append("Marei's cock smushes up into the small of your back. His soft-furred nuts jostle between your asscheeks. Your two rapists from earlier step up to the stage's second level only briefly to spit in your face, both still hard and clearly pissed they didn't get to finish inside you one last time before you woke up. One whispers to Marei, and you only catch a piece of it: \"... make "+pickByGender("him", "her", "em")+" suck it from "+pickByGender("his", "her", "their")+" corpse, right? Okay, good...\"\n\nThe crowd's getting bloodthirsty and impatient. Several of the weaker or cuter citizens get throttled and beaten to death in all the excitement.\n\n\"Everyone ready?\" Marei asks. Literally the whole crowd squeals \"YESSSSS!!!\"\n\nYour naked body quivers for everyone to see. Your senses start to dull. The crowd's jeers get muffled. Their faces blur.\n\nMarei cocks the gun.\n\nThe only thing you really feel in this moment is the tiny jerk of the barrel against your scalp.\n\n\"Bye bye, "+data.playerName+"~!\"\n\n<!i>Pow.<!i>\n\nYour brains fountain over the happy, excited faces of the spectators! Your sexy snuffmeat slab of a body slumps onto its front"+(data.hasBoobs?", tits squashed against the grime of the stage!":"!")+" Everyone cheers and gathers around to admire the gaping exit wound in the front of your slack, vapid expression— and within moments, of course, both the entrance and exit holes are getting raped like any other hole on your body.");
			addChoice("Respawn.", junkCityExplore.bind("pubsnuff4"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff4") {
			append("You respawn back on stage. Marei slips you into a casual headlock and hauls you right back down to the front, where the crowd's pulled your corpse halfway off the edge head-first.\n\n\"Eat your own ass or you die again,\" he hisses.");
			addChoice("Eat my own ass!!", junkCityExplore.bind("pubsnuff5"), {kinks: ["Raunch"]});
			addChoice("No! Please! Stop!", junkCityExplore.bind("pubsnuff6"), {kinks: ["Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff5") {
			append("You drop to all fours and gobble fat wads of cum out of your corpse's butthole, slurping it down as disgustingly as you can, since that seems to make the crowd happier. Someone punches your corpse's belly, and before you can pull away you get at least a gallon splurted directly down your throat, a warm cum cocktail from tons of strangers that overflows your esophagus and slops down over your chin.\n\n\"Hmmm. Alright. Type the alphabet backwards in five seconds or you die again.\"");
			addChoice("Z Y X W Q wait um", junkCityExplore.bind("pubsnuff6"), {kinks: ["Snuff"]});
			addChoice("No! Please! Stop!", junkCityExplore.bind("pubsnuff6"), {kinks: ["Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff6") {
			append("\"Worth a shot.\"\n\nThis time he turns you so your ass faces the crowd, pristine and freshly respawned.\n\nThe glock's maw presses against yours. Hot gunpowder grime smears on your lips.\n\n\"Suck.\"");
			addChoice("Suck.", junkCityExplore.bind("pubsnuffsuck"));
			addChoice("PLEASE DON'T KILL ME!", junkCityExplore.bind("pubsnuffplease"), {kinks: ["Abuse", "Vomit"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffsuck") {
			append("Like a good snuffsleeve you take the barrel between your pursed lips. Marei looks deep into your eyes, and a spark of romance pushes through his showmanly executioner facade once more: he's getting a little emotional from your performance. He bites his lip— probably to hold back compliments about how brave you are to perform fellatio on such a lethal phallus, how strong you are to maintain eye contact even though smoke still rises from the barrel and stings your corneas, how positively compelling your performance of pathos with your brows arched and your pupils rolling back and your throatmuscles gagging so hard on cold, deadly metal!\n\nHe swallows his praise and barks at you: \"You ready to die again?\"\n\nFor some reason you think your answer does not matter at all.");
			addChoice("Yes. <3", junkCityExplore.bind("pubsnuff7"), {kinks: ["Snuff"]});
			addChoice("NO!", junkCityExplore.bind("pubsnuff7"), {kinks: ["Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffplease") {
			append("You're treated to a merciless gun-barrel throatfuck for that outburst. Marei's paw closes around the back of your skull to hold you in place while you gag and choke on his glock, one claw digging into the spot where your corpse currently has a new pussy, probably as a reminder that the trigger can be pulled at any moment.\n\n\"Take it,\" he whispers to you, not that you weren't already doing that. More just so he can have something to say, you think. The words themselves don't matter. It's more about the intonation. It could be anything— \"You're gonna die,\" or \"You deserve this,\" or \"Deeper\"— as long as it's said with that same excited rush of breath, it's really more like a moan or a sigh than dialogue.\n\nThose rushes of breath continue, washing over your face, making it even more heated than it already was. One of the exhales comes out sharper and more demanding than the rest, and it actually does mean something: \"Puke for me.\"");
			addChoice("Puke hard.", junkCityExplore.bind("pubsnuffplease2"));
			addChoice("No... please...", junkCityExplore.bind("pubsnuffpleaseno"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffpleaseno") {
			append("His claws dig into your flesh. \"Then I'll make you.\"");
			addChoice("HrrrrRRRRKKK!", junkCityExplore.bind("pubsnuffplease2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffplease2") {
			append("He doubles the speed of the throatfuck. Disgusting little <!i>gllrrrkks<!i> rise from deep inside your belly, dancing up along your esophagus like tingly bubbles and—\n\nWith a pitiful contraction of your throat you puke all over Marei's gun. The barrel overflows with it, even though it isn't that much. Just a mouthful or two. Enough to slop down over your bare chest/tits and make the crowd mock you with their own forced gagging noises. \"Pukeslut! Pukeslut!\" some chick calls you (and by chick I mean a literal a cub bird), followed by \"Murder the little fuck for that one!\" from some other dude...");
			addChoice("Hnff... hnf...", junkCityExplore.bind("pubsnuffplease3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuffplease3") {
			append("\"You ready to die again?\" Marei whispers in your ear.\n\nFor some reason you think your answer does not matter at all.");
			addChoice("Yes. <3", junkCityExplore.bind("pubsnuff7"), {kinks: ["Snuff"]});
			addChoice("NO!", junkCityExplore.bind("pubsnuff7"), {kinks: ["Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "pubsnuff7") {
			append("He still hasn't turned you around. This next moment happens solely between you and him.\n\n\"You're really good at this,\" he says, clearly terrified someone will hear him and that the audience engagement he's so carefully built up with his performance thus far will just slouch back to that of a buncha casual after-work sitcom viewers. It's very specific, but that's the impression you get.\n\nIn a moment he's back to normal, cramming that fuckin piece down your gullet over and over and spitting on your tearstains with his next rush of vitriol:\n\n\"Scream for me nice and loud, and I might just let you live— Oh, I'm kidding of course, you're gonna die.\"\n\nMarei rams the gum as far down your throat as he can and pulls the trigger once, twice, thrice, quarce, quince, and then so many times in a row you lose count. You do try to scream, but you only end up making a stupid little death rattle around the hot barrel. At least three of those bullets impregnate your heart, tearing all your valves and ventricles apart just when your instinctual fear of death started to make them race. The rest of them scatter through your body, peppering it with brand new pussies.\n\nThis time your corpse has been whisked into the crowd's violent, horny hurricane before you've even respawned. You only ever catch sight of a slice of flesh or two through their jostling shoulders and bumping butts. The cocks grinding against and penetrating your corpse are all of different sizes and species, but everyone's face has the same expression of wild lust: tongue out, eyes wide, drooling like starving dogs. They absolutely cannot wait to have a chance at raping the still-warm corpse of the famous "+data.playerName+"!\n\nYou respawn backstage by chance. Marei comes around the curtain, hugs you, and pays you a hefty sum of <!b>x10<!b> Capsules for the trouble.\n\n\"Thanks for sticking around,\" he says, and smooches your cheek.");
			if (canGain) addToItem("Capsule", 10);
			addChoice("No prob~", junkCityHub);
		}

		if (which == "Slums") {
			append("The buildings aren't just made of junk down in the slums, they are literally junk.\n\nThis is where the Sewer Suburbs blur into the Bright Forest landfill. Only a few haggard stragglers live on the streets, and they're mean to each other, genuinely mean, not just domming. The rest live in tunnels and drains under the battlement wall.");
			addChoice("Examine junk.", function() {
				clearText();
				clearChoices();
				append("Signage from failed projects. Old memes. Older memes that are now considered as mythological as chimeras by people who don't know any better, people that sit half-sedated or cumdrunk in their apartments listening to Mikey J's <!i>LATE NIGHT LOOPS<!i>.\n\nOne myth is the Grassy Ghoul, a man swathed in glowmoss that wanders between distant trees whenever you stray too far from the landfill, stalking you, affixing your footprints with his cyan hunter's eyes... licking his lips.\n\nThe L.L.L.'s official position is that he may not exist. He hasn't been sighted by their field experts in twenty years.");
				addChoice("Move along.", junkCityHub);
			}, {kinks: ["Raunch"], oneTime: true});
			addChoice("Examine blur.", function() {
				clearText();
				clearChoices();
				append("Highrises peer down from above. The people there built loose, scaffolding skybridges on the pipes so they could avoid trudging through the slums.\n\nYou come across one or two with the lights on and a circle of laughing friends inside, though. Often the fat, fuckable butt of the joke is a sub on their knees in the middle.");
				addChoice("Move along.", junkCityHub);
			}, {kinks: ["Raunch"], oneTime: true});
			addChoice("Examine tunnels.", function() {
				clearText();
				clearChoices();
				append("It gets sweaty down here.\n\nThese folks are mostly junkies. They don't have houses. They live in sweaty clusters to keep warm. They don't care much about "+(isActive("Candy Ring")?"cakestains":"sewer grime")+" or clothes. Now and then someone overdoses and respawns all bleary and irritable that they just wasted their sweetdust.");
				addChoice("Move along.", junkCityHub);
			}, {kinks: ["Raunch", "Snuff"], oneTime: true});
			addChoice("Examine drains.", function() {
				clearText();
				clearChoices();
				append("Corpses circle them.\n\nA garbage truck emblazoned <!i>The Boys<!i> dumps off a few more. A respawned seagull leaps out from the back and soars down. Her wingtips slice the surface of the swirling water.\n\nShe half-flaps and half-swims hurriedly to the shore.\n\n\"Not pretty.\" She shakes herself dry and splatters you with "+(isActive("Candy Ring")?"pink cakebatter speckles":"grimy sewer muck")+". \"But who doesn't wanna be reborn? It's nice to shed a couple years and feathers. Get spry again! And <!i>yes<!i>, I do feel very vain about it, thank you for not rubbing it in.\"\n\nShe flies away up the pipes, dodging falling corpses deftly.");
				addChoice("Move along.", junkCityHub);
			}, {kinks: ["Snuff", "Trash"], oneTime: true});
			addChoice("Move along.", junkCityHub);
		}
		

		if (which == "ExploreCadeParty") {
			if (data.violetGryphonJunk.length < 0) data.violetGryphonJunk.push("cock");
			unlockJournal("Cade2");
			append("After bumbling around for hours you finally find another house standing across from a cute bench. The front door is \"broken,\" in a sense: six locks hold it permanently shut, their keyholes rusted over.\n\nA white tiger stands just near the curb, one paw behind his back, the other waving. It's Cade!");
			addChoice("Your handwriting really is terrible.", junkCityExplore.bind("cadeparty2"), {kinks: ["Patreon Commission"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadeparty2") {
			append("He trots over quick, tail slipping between his naked thighs from behind, partly to redirect momentum and partly because he's extremely embarassed. Then you say that.\n\nWithout even a few breaths, he starts talking:\n\n\"Oh, I know, I'm sorry— Yay, you made it!— Oh god! You went to the bluebird's house instead, didn't you?! Her's is opposite a cute bench and it has a broken door too, doesn't it?! She has this really vicious, horny dog in the back, I should've warned you— did he give you much trouble—?\"");
			addChoice((data.cadeResisted ? "Oh fuck yeah he did. <3 Sooo much trouble." : data.cadeAlpha ? "No, but I gave him some. >:3" : data.cadeDone ? "Did he ever. <3" : "A little, but I dipped out early with my special Move along command~"), junkCityExplore.bind("cadeparty3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadeparty3") {
			append("Cade's eyes warm right up. \"Ah, thank goodness. That dog... well... he took a bite outta some guy's dingus. Thankfully, the guy was into that, but still— imagine the horror!\"\n\n");
			addChoice("I'd rather not.", function() {
				junkCityExplore("cadeparty3a");
				append("Cade shivers. \"Me neither...\"");
			});
			addChoice("With pleasure. <3", function() {
				junkCityExplore("cadeparty3a");
				append("You stare off into the distance and imagine a set of slobber-soaked canine chompers closing down on "+pickByGenitals("your", "someone's", "your")+" cock and nuts, tearing hot sinewy tendons of flesh away, red saliva running over thighmeat, both balls making the cutest little <!i>pop<!i> between his jaws...\n\nCade is ignoring your blissful expression and awkwardly toeing a pebble on the sidewalk.");
			}, {kinks: ["Gore"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadeparty3a") {
			addChoice("Mmmm. Has the party already started without me?", junkCityExplore.bind("cadeparty4"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadeparty4") {
			append("\"Well,\" he meows, paw to chin. His fat tail swooshes a little.\n\n\"That's an interesting question. When does any party start? You can have a few people over to help set up, that's not a party. You can invite their friends over for pre-drinks. Getting close. And then... at some undefined point, the pre-party reaches a critical mass and it collapses into a big sweaty black hole cuddle pile— or a <!i>supernova<!i> party that explodes out to the streets.\"");
			addChoice("Someone's a stargazer.", junkCityExplore.bind("cadeparty5"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadeparty5") {
			append("He just smiles, fiddling with his tail. \"Not as much as I used to. Anyway— sorry— no, not too many people are here yet. I expect they're all busy with that dog...\"");
			var hasBalloons:Bool = false;
			if (getItem("Cum Balloon").amount >= 3 || getItem("Piss Balloon").amount >= 3) hasBalloons = true;
			addChoice("Ah, so you must still have a bed for me to call dibs on~!", junkCityExplore.bind("cadeparty6"));
			addChoice("We should put up some balloons to help them find it! <!img:item/Cum Balloon.png><!img:item/Piss Balloon.png> Cum/Piss Balloon <!b>x3<!b>", junkCityExplore.bind("cadepartyballoons"), {enabled: hasBalloons});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadepartyballoons") {
			append("\"... You just carry balloons around with you?\"");
			addChoice("You better fuckin believe I do.", function() {
				data.cadePissBalloon = true;
				junkCityExplore("cadepartyballoons2");
			}, {cost: ["Piss Balloon", 3], kinks: ["Piss"]});
			addChoice("Why wouldn't I? My inventory is hammerspace.", function() {
				data.cadePissBalloon = false;
				junkCityExplore("cadepartyballoons2");
			}, {cost: ["Cum Balloon", 3]});
		}

		if (which == "cadepartyballoons2") {
			data.cadePartyGaveBalloons = true;
			append("Cade gawks as you pull out three fat, slippery "+(data.cadePissBalloon?"Piss":"Cum")+" Balloons from your inventory. You cradle them in both hands, holding them out for him to sniff. They jiggle just under his nose.\n\n\"But... they're full... <!i>really<!i> full...\"");
			addChoice("Then we'll just have to empty them, won't we? <3", junkCityExplore.bind("cadepartyballoons3"));
			addChoice("Open your maw, kitty.", junkCityExplore.bind("cadepartyballoons3"));
		}

		if (which == "cadepartyballoons3") {
			append("His lips peel apart. He inches closer. His thighs grind anxiously over his growing kittydick.");
			addChoice("Untie the spout.", junkCityExplore.bind("cadepartyballoons4"));
		}

		if (which == "cadepartyballoons4") {
			append("You curl a single finger around and inside the squishy knot, loosening it up...");
			addChoice("Squirt a little in his mouth~", junkCityExplore.bind("cadepartyballoons5"));
		}

		if (which == "cadepartyballoons5") {
			append((data.cadePissBalloon?"Cade pulls away at the last second. A little warm piss splatters onto the concrete.\n\nHe's blushing hard, green eyes locked to the puddle. \"I'm sorry— I just— it's just a little— well— you see, my tastes are a bit less—\"":"Cade takes about half an orgasm's worth in his open mouth. He cringes, swallows, exhales. Steamy breath washes over your fingers and the balloons butt-end.\n\n\"Gyurrh... I'm sorry, that's... that's way too creamy for me... I can still feel it gumming up my throat...\""));
			addChoice((data.cadePissBalloon?"Hey, it's okay. More for me! >:3":"... Don't worry, I'll handle the rest."), junkCityExplore.bind("cadepartyballoons6"));
			addChoice("Pour the rest out.", junkCityExplore.bind("cadepartyballoonspour"));
		}

		if (which == "cadepartyballoons6") {
			append("You squeeze the balloon with both hands and pump eight massive mouthfuls down your throat, guzzling noisily. Tiny droplets splut out of the corners of your mouth, only barely missing Cade's pure white fur.\n\n\"Jeez you're thirsty!\"\n\n<!i>Uh-huh<!i>, you groan, gargling obscenely, "+(data.cadePissBalloon?"piss":"viscous cum")+" bubbles rising up the back of your throat and popping on your tongue. The next two balloons are just a blur. Only on the very last gulp do you realize that you're on your knees, your chest is soaked, and Cade has slowly inched out of the danger zone. He's observing you from a safe distance with something like terrified reverence.\n\n... You may be addicted to guzzling mystery "+(data.cadePissBalloon?"piss":"cum")+". But rehab can wait. Right now it's party time!");
			addChoice("Aw shoot. Does this island even have helium?", junkCityExplore.bind("cadepartyballoons7"));
		}

		if (which == "cadepartyballoonspour") {
			append("You shrug and toss the balloons down a half-open manhole nearby.\n\n... Splatters and heated moans come from below.\n\nCade goes a little green and looks elsewhere. \"Well, at least you put it to good use. Sewer suburb folks love all kinds of fluids.\"");
			addChoice("Aw shoot. Does this island even have helium?", junkCityExplore.bind("cadepartyballoons7"));
		}

		if (which == "cadepartyballoons7") {
			append("\"Don't need any,\" he purrs, latching his lips carefully to the balloons and puffing them full one-by-one.\n\n\"Balloon code is pretty simple. If they have air inside, they float. If not, they don't! It's just a simple <!i>if<!i>. Honestly, sometimes I wonder who coded your system, all those elements interacting in crazy ways— John told me one out of five of them don't even occur naturally on your planet. Is that right? And how many of those decay immediately into something else before they can be of any use?\"");
			addChoice("Several.", junkCityExplore.bind("cadepartyballoons8"));
			addChoice("I'm not that into science.", junkCityExplore.bind("cadepartyballoons8"));
			addChoice("I don't believe in science.", junkCityExplore.bind("cadepartyballoons8"));
		}

		if (which == "cadepartyballoons8") {
			append("\"Mmm, well—\" he sticks his sandpapery cat tongue out, concentrating on tying them back up— \"either way, it just seems a little wasteful. All that work could be going towards stuff like a respawn system for you guys, y'know?\"");

			addChoice("God gave us 100+ elements for some reason.", function() {
				junkCityExplore("cadepartyballoons9");
				makeSmallButtons();
				append("\"I'm not sure all those elements are for you.\"");
				for (s in ["They must be.", "We couldn't exist without them.", "Our universe was built that way for a reason.", "Well, we haven't found all of them yet.", "We're still learning.", "I don't know.", "I don't think we can ever know.", "Whoever they're for, I want to fuck them. Aliens are probs mega hot."])
					addChoice(s, junkCityExplore.bind("cadepartyballoons10"));
			});
			addChoice("What do you care if we respawn or not?", function() {
				junkCityExplore("cadepartyballoons9");
				append("He turns to you and smiles, a little baffled.\n\n\"I care. Of course I care.\"");
				addChoice("... Yeah I getcha. Permadeath sucks.", junkCityExplore.bind("cadepartyballoons10"));
				addChoice("... Thank you.", junkCityExplore.bind("cadepartyballoons10"));
			});
			addChoice("... Why are we talking about this again?", function() {
				junkCityExplore("cadepartyballoons9");
				append("\"Because balloons!\"");
				addChoice("Right.", junkCityExplore.bind("cadepartyballoons10"));
				addChoice("<!14px>Helium balloons would fuck off way up into the sky if you just let one go like that.\n<!14px><!10px>I learned that the hard way when I was five.<!10px>", junkCityExplore.bind("cadepartyballoons10"));
			});
		}

		if (which == "cadepartyballoons9") {
			append("Cade plucks a shaggy strand of fur from his buttcheek and ties all three stained-"+(data.cadePissBalloon?"yellow":"white")+" balloons up with it. Then he lets them go.\n\nThey float up exactly five feet and stop, hovering lazily at a fixed altitude.\n\n");
		}

		if (which == "cadepartyballoons10") {
			append("For a moment, neither of you say anything.\n\nThen Cade slips you a handful of caps.\n\n\"Anyway, enough of that talk. Thanks for the balloons!\"");
			if (canGain) addToItem("Capsule", 5);
			addChoice("What no! No money. They were a gift.", junkCityExplore.bind("cadepartyballoons11gift"), {req: ["Capsule", 5]});
			addChoice("My pleasure. <3", junkCityExplore.bind("cadepartyballoons11pleasure"));
		}

		if (which == "cadepartyballoons11gift") {
			data.cadeCapGiveBack = true;
			append("You try to give them back, pushing them into his palms or tucking them behind his fluffy ears while he's not looking. He laughs ahd shakes his head.\n\n\"Nononononono, I insist.\"\n\n(... Maybe you could sneak them into one of his belongings inside~)");
			addChoice("Heyyy, so do you have any spare rooms for me? :D", junkCityExplore.bind("cadeparty6"));
		}

		if (which == "cadepartyballoons11pleasure") {
			data.cadeCapGiveBack = false;
			append("\"Mine too.\"\n\nHe blushes a bit, just a sprinkle of red on the cheeks and nosetip. Just a pink pinch on the dimples. Just a few loose rose petals.");
			addChoice("So, got a spare room I could call dibs on?", junkCityExplore.bind("cadeparty6"));
		}

		if (which == "cadeparty6") {
			append("\"Ah. Well. There is one room free, but... I'm saving it for someone.\"");
			addChoice("Oh yeah?", junkCityExplore.bind("cadeparty7"));
		}

		if (which == "cadeparty7") {
			append("Cade takes you by the hand and turns away.\n\n\"Yeah. He's been gone for a very long time— but he might come back at any moment! So I've kept it pristine for him, no cum stains, no pee stains, nothing. All his stuff is still there, too, although some of it had to be relocated after nearly going out the front door in people's pockets...\"");
			addChoice("How about I bunk there for now and then relocate to your room if he shows up~?", junkCityExplore.bind("cadeparty8"));
		}

		if (which == "cadeparty8") {
			append("... He can't say no to you.\n\n\"Sure, "+data.playerName+". It's on the top floor. I'll take you there!\"\n\nHe pulls you by your hand, around the back of his house, through a soft-wood fence (with like three unlocked gates, no jumping required) and the whole way you keep your eyes on his ass, watching layers of white fur shift and mingle as his cheeks slide against each other.\n\nYou burst into the backyard. Blades of mown grass poke up between your toes. Instead of a junky reclaimed-metal fence, like the other suburban houses have around their backyards, Cade's is walled in with spacerock. Big purple cinderblocks run the perimeter, pocked with gardens and trickling fountains and a few small glass-doored bookshelves.\n\nCade pauses at the back door, looking over his shoulder. Some new guests are swinging themselves down over his rock wall. <!i>Muscular<!i> guests.\n\nOne of them's got two armfuls of logs, another two armfuls of folded lawnchairs, another hefting bags of marshmellows over his shoulders. The burly bros start up a fire in a little pit you hadn't noticed earlier, circling it, trading stories and handjobs and sweetgrass blunts, slurping hot, goopy mallows off each other's sticks.");
			addChoice("Head inside.", junkCityExplore.bind("cadeparty9"));
			addChoice("Pit stop by the fire!", junkCityExplore.bind("cadebackyard"), {kinks: ["Male", "Male", "Male"]});
		}

		if (which == "cadebackyard") {
			append((data.metKemp>0?"Kemp":"A stoned otter")+" and "+(data.metSnagg>0?"Snagg":"a croc dude in a wifebeater")+" sit on opposite sides of the fire, staring at each other.\n\n"+(data.metKemp>0?"Kemp":"The otter")+"'s roasting up a marshmellow, but "+(data.metSnagg>0?"Snagg":"the croc")+"'s roasting up a sausage.\n\nThey both give you a nod.\n\nYou get the feeling you just walked in on an argument.");
			addChoice("Hook me up with a mallow, wouldja boys? :3", junkCityExplore.bind("cadebackyard2mallow"));
			addChoice("Can I snag a sausage?", junkCityExplore.bind("cadebackyard2sausage"));
			addChoice("Go back to Cade.", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2mallow") {
			append("\"Fer sure~!\"\n\n"+(data.metKemp>0?"Kemp":"The otter")+" peels his mallow off the end of his stick and tosses it to you with a smile. It lands with a hot little <!i>squish<!i> right in your mouth.");
			addChoice("Thanks! (Share it with him.)", junkCityExplore.bind("cadebackyard2mallow2"), {kinks: ["Foodplay", "Raunch"]});
			addChoice("Thanks. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2mallow2") {
			append("You take him by the back of his head and fit your mouth to his maw sideways, pushing a fat wad of goopy white over his tongue.\n\nHe drops his roasting stick on the grass. That hand grips the nape of your neck instead. Otter laughter burbles up through the mallowmess between you as he works his own tongue through it, pushing it right back into your mouth. After a few gags and one or two bodily shivers, you both manage to get an equal share of marshmellow guts crammed down each other's throats.\n\n"+(data.metSnagg>0?"Snagg":"The crocodile")+" looks mortified. \"Kemp, think where "+pickByGender("his", "her", "their")+" mouth's been.\"\n\n\"Unt curr,\" "+(data.metKemp>0?"Kemp":"the otter")+" murmurs into your now clean and saliva-shiny lips, meaning \"Don't care.\"");
			addChoice("Mmmm... thanks for that~ (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage") {
			append("\"You sure?\" "+(data.metKemp>0?"Kemp":"the otter")+" asks you.\n\n"+(data.metSnagg>0?"Snagg":"The croc")+" glares. \"Don't start again.\"\n\n\"Not starting anything, just wanna make sure buddy knows what "+pickByGender("he's", "she's", "they're")+" eating.\"\n\n\"I'm a crocodile. I eat meat.\"\n\n\"And where'd you get that meat?\"");
			addChoice("I don't care, I gobble any and all meats~", junkCityExplore.bind("cadebackyard2sausage2"), {kinks: ["Foodplay", "Raunch"]});
			addChoice("... From where?", junkCityExplore.bind("cadebackyard2sausagewhere"));
			addChoice("Nevermind. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage2") {
			append((data.metKemp>0?"Kemp":"The otter")+" turns away and talks with some other dude, taking a gargantuan hit of sweetgrass.\n\n"+(data.metSnagg>0?"Snagg":"The croc")+" unplugs his ass from the lawnchair's deep seat and peels the perfectly-roasted sausage off his stick.\n\n\"Open.\"");
			addChoice("Open my mouth for him.", junkCityExplore.bind("cadebackyard2sausage3"), {kinks: ["Abuse"]});
			addChoice("Ah jeez sorry nvm. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage3") {
			append((data.metSnagg>0?"Snagg":"He")+" grabs you by the back of your head and crams the whole sausage down your throat in one brutal punch, leaving you to gargle and gag helplessly on it. The fatter end sticks out past your lips, jiggling all hot and oily for everyone to see as your throatmuscles desperately try to massage the other end down.\n\n\"Havin some trouble there?\" he purrs, bapping his cock against your cheek. \"Need something to wash it down?\"");
			addChoice("Yes please. (Say that all gurgly and pathetically~)", junkCityExplore.bind("cadebackyard2sausage4"), {kinks: ["Piss"]});
			addChoice("No thanks. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage4") {
			append((data.metSnagg>0?"Snagg":"He")+" plugs his dick past your lips and grinds it in deep, squashing the sausage into mush. He grunts and pushes forward. His cocktip spits piss around chunks of loose meat while he thrusts, stirring it all up into one raunchy meatpiss soup.\n\n\"That taste good?\"");
			addChoice("Hrrk... hrkk...", junkCityExplore.bind("cadebackyard2sausage5"), {kinks: ["Vomit"]});
			addChoice("Clean myself up and scurry away. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage5") {
			append("Hot pink sausagepuke bubbles up from the pit of your stomach and splatters out over Cade's back lawn. "+(data.metSnagg>0?"Snagg":"The croc")+" only barely manages to unplug his dick in time.\n\nYou clutch your tum, hunched over, while the last few chunky dribbles drop from your lips.\n\n\"... You just gonna leave that there?\" he growls.");
			addChoice("I'm sorry, I'll clean it up...", junkCityExplore.bind("cadebackyard2sausage6"), {kinks: ["Abuse", "Abuse", "Abuse"]});
			addChoice("Clean myself up and scurry away. (Go back to Cade.)", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyard2sausage6") {
			append("You drop to all fours and start sucking your own hot puke up. <3\n\n"+(data.metSnagg>0?"Snagg":"The croc")+" helps out by slamming one clawed foot down on the back of your skull and stomping your face into the mess, smearing tummysludge all over your grimace, in your eyelashes, up your nose, all while you slurp and gag and make disgusting little noises beneath it.\n\n\"Eat it.\"\n\nYou choke it down, slurping up a little dirt and a few blades of grass, and eventually the only thing left to do is lick your face clean.\n\n... Just before you're done with that, he drops a fat loogie right between your eyes. You obediently scoop it up with a finger, pop that finger in your mouth, and suck it clean.");
			addChoice("Go back to Cade.", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadebackyardrejoin") {
			append("Cade was waiting patiently at the backdoor, looking at the sky. He smiles as you trot back.\n\n\"Have fun with the boys?\"");
			addChoice("Tons. :3", junkCityExplore.bind("cadeparty9"));
			addChoice("It was alright.", junkCityExplore.bind("cadeparty9"));
			addChoice("It was something.", junkCityExplore.bind("cadeparty9"));
			addChoice("Let's head inside.", junkCityExplore.bind("cadeparty9"));

		}

		if (which == "cadebackyard2sausagewhere") {
			append("<!14px>"+(data.metSnagg>0?"Snagg":"The croc")+" smooths out his wifebeater. He slowly, pointedly turns his sausage over to the uncooked side, and his shirt fabric wrinkles right back up.\n\n\"From an animal.\"\n\n\"Whoa, no shit! Those things we all look like? But you didn't get that sausage from an animal who respawns, did you?\"\n\n\"Why are you being such a little cunt tonight?\"\n\n\"Did you?\"\n\n\"No, I didn't, I got it from a feral pig.\"\n\n\"And what was he doing at the time?\"\n\n\"What?\"\n\n\"What was he doing when you killed him ya goddamn dingus?\"\n\n\"... He was fucking around in the mud. Playing or something, I don't fuckin know.\"\n\n"+(data.metKemp>0?"Kemp":"The otter")+" does a big whoop-dee-doo whistle. \"Pretty advanced behaviour for a construct. Almost like it was <!i>alive<!i> and <!i>enjoying<!i> itself.\"\n\nSnagg hauls himself up and fucks off, grumbling. His sausage plops into the fire with a <!i>psssssss<!i>.\n\n<!14px><!10px>\"Don't have to sit there and fuckin take your shit... if you had a house I'd foreclose the fuck outta that bitch... fuckin hobo otter...\"<!10px>");
			addChoice("... Go back to Cade.", junkCityExplore.bind("cadebackyardrejoin"));
		}

		if (which == "cadeparty9") {
			append("Cade puts one paw on the back door. His fingers curl around the handle, muscles tensing.\n\n\"Brace yourself.\"");
			addChoice("???", junkCityExplore.bind("cadeparty10"));
			addChoice("Brace myself.", junkCityExplore.bind("cadeparty10"));
		}

		function cadeMusicToggle(forceOff:Bool=false) {
			if (!forceOff) {
				if (data.cadeListeningMusic)
					addChoice("Ignore the music.", function() {
						data.cadeListeningMusic = false;
						playMusic("junkCity", true);
					}, {oneTime: true});
				else
					addChoice("Listen to the music.", function() {
						data.cadeListeningMusic = true;
						stopChannel("music");
						playSound("assets/audio/music/cade/"+data.cadeMusic, "music", {loops: 999});
					}, {oneTime: true});
			} else {
				data.cadeListeningMusic = false;
				fadeChannel("music", false, 2);
				timer(2, function() {
					playMusic("junkCity", true);
					fadeChannel("music", true, 2);
				});
			}
		}

		if (which == "cadeparty10") {
			data.cadeMusic = "dancefloor";
			data.cadeListeningMusic = true;
			playSound("assets/audio/environment/caveWinBig", "caveWinBig");
			fadeChannel("music", false, 2);
			timer(2, function() {
				msg("<!img:kink/Music.png> Music: Pa-Pa-Pow — by Wronger", true);
				playSound("assets/audio/music/cade/"+data.cadeMusic, "music", {loops: 999, startVolume: 0});
				fadeChannel("music", true, 6);
			});

			var s:MintSprite = addSprite("assets/img/effect/welcomeBanner");
			s.onHover = showToolTipOnCursor.bind("Font: Huruf Miranti", "");
			s.y = 50;
			
			append(" \n\n\n\n\n\n\n\nHe slides it open.\n\nConfetti cannons fire around you with a"+(data.hasBoobs?" tit-jiggling":"n ass-clenching")+" <!i>PA-PA-POW!<!i>, streamers whipple-diddly-doo down from the living room ceiling, whistles and cheers and a mad dope electro loop ring out— and every corner of your vision fills to overflowing with a crowd of excited, furry faces.\n\n"+(data.cadePartyNude?"Every single one of them is nude.\n\n\"We made it a no-clothes thing after all,\" Cade purrs, tail fwipping back and forth behind his thighs.\n\n":"\"I may have lied,\" Cade says. \"You're the last one to arrive. It's been sixty-six years! Of course everyone knows to avoid that dog by now, unless they want to spend a couple hours knotted~\"\n\n")+"They all pull the dicks out of their maws with an echoed <!i>pop<!i> and get together for one big slobbery cheer: \"WELCOME TO PARAPHORE! <3\"");
			
			addChoice("Holy FUCK you guys almost gave me a HEART ATTACK", junkCityExplore.bind("cade11heart"));
			addChoice("Wahhh jeez thanks guys!", junkCityExplore.bind("cade11thanks"));
			addChoice((data.cadePartyNude?"Awww, so sweet of you all to get naked for me. <3":"Of course they all know about that dog by now. ;3"), junkCityExplore.bind("cade11sexy"));
			addChoice("Examine DJ.", function() {
				clearText();
				append(" \n\n\n\n\n\n\n\n\n\nMikey J slaps a banger outta his turntables in the back of the room. It's a selection from his radio show, <!i>LATE NIGHT LOOPS<!i>.\n\nHe's wearing a beanie, big dark sunglasses, headphones, and a poofy hoodie that covers his neck— but he can't fully conceal what's underneath:\n\nHis skin. Flesh. He's a grey humanoid, just like you, but without a player name floating above his head.");
			}, {oneTimeSaved: true});
			cadeMusicToggle();

		}

		if (which == "cade11heart") {
			append("A couple people laugh, but many more look seriously concerned.\n\n\"Quick, everybody! We have to lower "+pickByGender("his", "her", "their")+" heartrate with a relaxing group massage!!\"");
			addChoice("... Brace myself again.", junkCityExplore.bind("cadeparty12"));
			cadeMusicToggle();
		}

		if (which == "cade11thanks") {
			append("\"You're welcome~!\"\n\n\"Anytime.\"\n\n\"We're just glad to finally have you back!\"\n\n\"What were you doing all these years?\"\n\n\"Um, excuse me, "+pickByGender("sir", "ma'am", data.playerName)+", but could I please fuck your "+pickByGenitals("ass?", "puss?", "ass? Or your puss, it doesn't really matter, they both look so enticing...")+"\"\n\n\"Thanks yourself, unf! Just watching your hips sway as you came through that door is enough to last me all night—\"\n\n\"— Cade! Cade! Slap "+pickByGender("his", "her", "their")+" ass! I wanna see it jigg—\"\n\n\"Okay, now, keep it civil you guys,\" Cade says nervously, holding both hands out into the wall of curvy bodies scooching closer and closer...\n\n\"Maybe cramming this many naked furries into a tiny room was a bad idea,\" he whispers to you.");
			addChoice("... Am I about to get gang-cuddled?", junkCityExplore.bind("cadeparty12"));
			cadeMusicToggle();
		}

		if (which == "cade11sexy") {
			append((data.cadePartyNude?"\"We're pretty much naked all the time anyway,\" someone purrs.\n\n\"What's the point of putting on pants if you're just gonna yank em off five minutes later when the next dick is ready to slide up your ass?\" some girl pouts.\n\n\"Clothes might not matter to us,\" Cade butts in, \"But remember, where "+data.playerName+" is from, they have to wear clothes <!i>all the time<!i>.\"\n\nThe room shudders, like a bunch of kids listening to a ghost story.\n\nCade goes on: \"I'm sure "+pickByGender("he appreciates", "she appreciates", "they appreciate")+" us getting totally bare-butt naked for "+pickByGender("him", "her", "them")+" whether or not we would've been naked already. To us, it's nothing. But to "+data.playerName+", I'm sure it's a treat. <3\"\n\n\"Well?\" someone asks, huskily. You can't see her face; only the curve of her hips peeking out from behind two others. \"Are we a treat?\"":"\"I should've detoured,\" someone pouts, sucking their fingers apparently just because oral fixation. \"I haven't been knotted in <!i>hours<!i>...\"\n\n\"You're talking about the bluebird's dog, right? What does she even feed him? He's twice the size he was last year.\"\n\n\"I heard she crams his maw full of those <!i>Aphrodoggy<!i> treats six times a day~\"\n\n\"I heard she just pops a squat over his open maw and—\"\n\nCade shushes them hurriedly. \"No gruesome specifics, please— "+data.playerName+" is our guest. You don't know if "+pickByGender("he's", "she's", "they're")+" into that or not.\"\n\n... Whoever said that huffs and pouts.")+"\n\nWith that, all eyes focus on you, your "+(data.hasBoobs?"tits":"flat chest")+", "+pickByGenitals("your big, floppy cock", "the smooth curve of your labia", "your shaft, your heavy nuts, your semi-hidden cuntlips")+".\n\nYou've got Cade standing protectively by your side, still, but you're starting to feel the heat and pressure coming from all these bodies packed around you. Everyone keeps scooching closer...");
			addChoice((data.cadePartyNude?"Yes, you are.":"I probably am into that~"), junkCityExplore.bind("cadeparty12"));
			addChoice((data.cadePartyNude?"No, you're a full dessert course~":"I'm probably not into that."), junkCityExplore.bind("cadeparty12"));
			addChoice("... Am I about to get gang-cuddled?", junkCityExplore.bind("cadeparty12"));
			cadeMusicToggle();
		}

		if (which == "cadeparty12") {
			append("Before you can do or say anything, the crowd falls upon you.\n\nPaws grope over your inner thighs, tongues lap over the bulge of your esophagus, butts grind against you from all directions. A dozen warm puckers pulse inches away from your bare flesh, separated only by the sheer puffitude of their surrounding buttcheeks.\n\nIn the eye of the storm, you manage to pop your face out of someone's buttcheeks and look over to Cade. A gullgirl is accosting him:\n\n\"Did you fuck "+data.playerName+" yet?\" she demands, one wing a-rubbing at Cade's junk.\n\n\"A-Ah! Hey, didn't I tell you to stop crashing my parties?!\"\n\n\"Yes. But I'm right next door, I can't <!i>not<!i> come over when I hear big J's bumpin loops. Don't change the subject.\"\n\n\"Well,\" Cade huffs, gathering his courage, \"No. I didn't fuck "+pickByGender("him", "her", "them")+".\"\n\n\"Why not?\"\n\n\"Wha— why not?! Because we were right there on the street, it would've been <!i>rude<!i>...\"\n\n\""+(data.seagullDone?"Oh, you've gotta try it. I gagged on "+pickByGender("his", "her", "their")+" cock right out in the open and "+pickByGender("he", "she", "they")+" thought I was positively courteous~\"\n\n\"O-Oh...":"Well, do you want to fuck "+pickByGender("him", "her", "them")+"?\"\n\n\"I... um...")+"\"\n\nCade fidgets.\n\n... The seagull stops rubbing Cade's junk and turns to you, shoving aside a few butts to get a clear view. \"What do you say, player? You wanna fuck this cute white tiger?\"\n\n(He squeaks and watches intently for your reaction.)");
			addChoice("Absolutely.", junkCityExplore.bind("cade13yes"));
			addChoice("We'll see where the night takes us.", junkCityExplore.bind("cadeparty13"));
			addChoice("Meh.", junkCityExplore.bind("cadeparty13"));
			cadeMusicToggle();
		}

		if (which == "cadeparty13") {
			append("<!14px>The seagull shakes her head. \"I tried to set you up! Don't say I didn't try.\"\n\n<!14px><!10px>\"You weren't very subtle about it...\"<!10px><!14px>\n\n\"What was that?\"\n\n\"Nothing! Nothing!\"\n\nThe crowd swallows you again, and you lose sight of them.<!14px>");
			addChoice("Claw my way out of the crowd.", junkCityExplore.bind("cadeparty15"));
			addChoice("Open my mouth, thrust my hips, and grope any body parts I can reach.", junkCityExplore.bind("cadeparty14"), {kinks: ["Male", "Female", "Intersex"]});
			cadeMusicToggle();
		}

		if (which == "cade13yes") {
			append("\"Really?!\" Cade squeaks, peeking out over someone's twerking butt.\n\n\"Really?\" the seagull girl says, amused.\n\nThe crowd swallows you again, and you lose sight of them.");
			addChoice("Claw my way out of the crowd.", junkCityExplore.bind("cadeparty15"));
			addChoice("Open my mouth, thrust my hips, and grope any body parts I can reach.", junkCityExplore.bind("cadeparty14"), {kinks: ["Male", "Female", "Intersex"]});
			cadeMusicToggle();
		}

		if (which == "cadeparty14") {
			append("First, you open your mouth.\n\nImmediately, a stranger's fingers slip inside, tugging at the corners to open it up even wider. Passing cocks take turns slipping in and out of your throat, their owners only staying long enough to say \"Ah! Fuck, that's tight!\" or \"Slobber ALLLLL over my dingus bitch!!\" before the cuddle-current drags them away again. At one point the fingers holding your mouth open take a turn for themselves: they sink down deep and fuck the entrance to your esophagus, twiddling your uvula back and forth.\n\nSecond, you thrust your hips.\n\nHonestly half the time you don't even know if you're fucking a hole or just someone's armpit. Sometimes your "+pickByGenitals("cock slips somewhere really wet and warm, other times it gets stuck deep in a soft-furred crevice", "cunt grinds up against something equally wet, other times cocks or fingers casually impale it", "cock slips somewhere really wet and warm, other times it gets stuck deep in a soft-furred crevice")+". Eventually you don't even have to thrust anymore, people just automatically know to lavish love over your crotch~\n\nThird, and finally, you reach out into the crowd.\n\nYour fingers follow contours of smooth fur, cool scales, even a few seagull feathers. You squeeze thighs, tits, asscheeks, big fat nutsacks, throbbing shafts, gulping throats, and a bajillion other warm squishy body parts you can't identify. If you really apply some pressure to it, you can almost always hear a squeak from somewhere nearby.");
			addChoice("Mmmm. Okay, now get out of the crowd.", junkCityExplore.bind("cadeparty15"));
			cadeMusicToggle();
		}

		if (which == "cadeparty15") {
			append("You wiggle your way out of the bodies and flop, panting, onto your hands and knees. Shag carpet threads slip between your fingers.\n\nThe music fades away"+(data.cadeListeningMusic?"":"— well, you weren't listening to it anyway")+".");
			if (data.examinedStuff.contains("Examine DJ.")) {
				append("\n\nBig J's switching over to a different ten-second loop. How exciting!");
				addChoice("Find Cade.", junkCityExplore.bind("cadeparty17"));
			} else {
				addChoice("Examine DJ?", junkCityExplore.bind("cadeparty16"));
			}
			if (data.cadeListeningMusic) cadeMusicToggle(true);
		}

		if (which == "cade16") {
			append("It's a dude named Mikey J.\n\nHe fiddles with his turntables in the back of the room, picking out another wicked celebratory electro banger. All the records are selections from his radio show, <!i>LATE NIGHT LOOPS<!i>.\n\nHe's wearing a beanie, big dark sunglasses, headphones, and a poofy hoodie that covers his neck— but he can't fully conceal what's underneath:\n\nHis skin. Flesh. He's a grey humanoid, just like you, but without a player name floating above his head.");
			addChoice("... Ignore the mystery and find Cade.", junkCityExplore.bind("cadeparty17"));
		}

		if (which == "cadeparty17") {
			append("You spot him pressed against the back door, trying to push through the newly formed black hole cuddle pile in the middle of his living room.\n\n\"Just— one second here, just gotta— sorry—\"\n\nHe wades over, sometimes lodging his fingers up gaped buttholes or between lips hung with saliva strings for leverage.");
			addChoice("Need some help?", junkCityExplore.bind("cadeparty18"));
		}

		if (which == "cadeparty18") {
			append("\"No!\" he squeaks. His kitty ears poke back out after a full half a minute spent under the surface. They're tipped with red.\n\n\"Don't come close... the current will suck you back in...\"");
			addChoice("Should I just wait?", junkCityExplore.bind("cadeparty19"));
		}

		if (which == "cadeparty19") {
			append("\"Oh no, don't let me keep you, head to the next room, I'll be— HEY! GET YOUR MOUTH OFF MY TAIL!\"\n\n\"Mnnnnn... but I wanna deepthroat it...\" someone chirps.\n\n\"No! Bad seagull! I need that for balance!\"\n\nCade shoots you an apologetic grimace. \"Go on. I'll be there in a second to show you to your room.\"");
			addChoice("Ah. Meet you in the kitchen, then.", junkCityExplore.bind("cadeparty20"));
		}

		if (which == "cadeparty20") {
			append("You're about to walk through the waist-height kitchen door when "+(data.metBins>0?"Bins":"a waist-height raccoon cub")+" leaps up and locks it. He's got a reluctantly floral smell to him, like he had to be hosed down and scrubbed with scented soaps before being allowed into this kitchen.\n\n\"You can't come in here,\" he says. \"It's a surprise.\"");
			addChoice("What's a surprise?", junkCityExplore.bind("cadeparty21"));
		}

		if (which == "cadeparty21") {
			append("\"Nice try.\"");
			if (!data.glowbunnyLLLStarted) {
				addChoice("Dangit.", junkCityExplore.bind("cadeparty22"), {kinks: ["Cub", "Male", "Female"], faCensor: true});
				addChoice("Darn.", junkCityExplore.bind("cadeparty22"), {kinks: ["Cub", "Male", "Female"], faCensor: true});
				addChoice("Golly gosh fuckin dagnabbit sakes.", junkCityExplore.bind("cadeparty22"), {kinks: ["Cub", "Male", "Female"], faCensor: true});
				addChoice("I "+(onFA()?"can't be hanging out":"didn't wanna hang out")+" with a bunch of cubs anyway.", junkCityExplore.bind("cadeparty23"));
			} else {
				addChoice("Hmph.", junkCityExplore.bind("cadeparty23"));
			}
		}

		if (which == "cadeparty22") {
			var guesses:Int = 0;
			var guessPool:Array<String> = ["Two hundred caps.", "A big Glowberry Pie!", "A cake.", "My own personal fuckslave.", "A pair of panties with <!i>"+data.playerName+"<!i> embroidered on them."];

			append("He hangs both arms over the door and swings his legs around, pouting.\n\n\"I miiiight let you in... if you can guess what the surprise is!\"");

			for (guess in guessPool)
				addChoice(guess, function() {
					guesses++;
					if (guess != "A cake.") {
						if (guesses >= 3) junkCityExplore("cadekitchenlost");
						append("\n\n\"Strike "+(guesses == 1 ? "one." : guesses == 2 ? "two." : guesses >= 3 ? "three, you're out! <!i>Wow<!i>. For a player, you sure suck ass at guessing games!" : "Okay, that's too many guesses...")+"\"");
					} else if (guess == "A cake.") {
						junkCityExplore("cadekitchen");
						append("\n\n\"Fuck! How'd you know?!\"");
						if (guesses == 3) addChoice("Third time's the charm.", junkCityExplore.bind("cadekitchen2"));
					}
				}, {oneTime: true});
		}

		if (which == "cadekitchen") {
			if (data.cadePartyDone) addChoice("Just had a weird fit of deja vu.", junkCityExplore.bind("cadekitchen2"));
			addChoice("There are only so many surprises you can make in a kitchen.", junkCityExplore.bind("cadekitchen2"));
		}

		if (which == "cadekitchen2") {
			append((data.metBins>0?"Bins":"The raccoon")+" glances over his shoulder and unlocks the door.\n\n\"Alright, whatever. Just take a sneak peek. I warn you: we're cute. Don't moan or squeak or do any gay shit at the sight of us. Lana may be mute, but he's not deaf... and I already got bitchslapped for tracking mud into the kitchen...\"");
			addChoice("Gotcha. Lemme peek!", junkCityExplore.bind("cadekitchen3"));
			addChoice("Check up on Cade.", junkCityExplore.bind("cadeparty23"));
		}

		if (which == "cadekitchen3") {
			append((data.metBins>0?"Bins":"The raccoon")+" steps aside.\n\nYou're expecting a giant mess, little bodies bustling everywhere, pots and pans flying— but it's actually calm and clean in here. Every cub has a task: a little horse girl works a pot of pink frosting, smooth stomach pressed to the metal to keep it still while she pulls her ladle around in wide circles; a shy frog boy squats in the corner with a bowl of cream (actual cream, you think, not cum) between his plump thighs, plucking up little spheres of chocolate with his ball-end frog fingers and dunking them white; and up on the counter, wearing an apron that says HEAD CHEF, "+(data.metLana>0?"Lana":"a little fox boy")+" practices writing by periodically (and somewhat glitchily) squeezing a giant tube of frosting.\n\nThe stirring, the dunking, the <!i>pfpbpbpbhphthhhbh<!i> of "+(data.metLana>0?"Lana's":"his")+" tube... the sweet scent of cub fur and cake batter... it's all made more special by the fact that it's fleeting: the head chef just turned around and spotted you.\n\n\"Aha! Oh! Sorry, Lana! How did you get in here, "+data.playerName+"?! Come on, let's go—\" Bins scrambles, trying to pull you out.");
			addChoice("Examine each of their butts first!!", junkCityExplore.bind("cadekitchen4"));
			addChoice("Check up on Cade.", junkCityExplore.bind("cadeparty23"));
		}

		if (which == "cadekitchen4") {
			append("That's easy enough to do in the few moments before you get kicked out. They're all nude except their aprons.\n\nYou start with Lana's plump little foxboi butt. His fur is auburn, short, a little spiky around the base of his tail. Deeper inside his asscrack it lightens to a soft peach color, and around his pristine, untouched pucker it gets a little curly.\n\nThe horse girl only glances at you once, embarassed. Her butt has a distinct outback smell to it— the smell that remains after you slide down rolling green hills on your bare butt so many times you permanently grass stain your asscrack. Besides that, it's actually kind of average: frumpy cheeks, a pucker that looks like it gets fingered now and then.\n\nThe frog boy won't show you his butt. He's very protective of it.\n\nLastly, you crane your neck back to take a look at "+(data.metBins>0?"Bins":"the raccoon")+"'s butt. It's in the worst shape, and also the best shape. His cheeks are ripe and glowing a little red from whenever he last got it spanked or slammed against some dude's hips. His pucker is permanently gaped open about the size of a dime from all the dicks and fingers and fists that've been rammed inside it. His tail is short and round and perpetually perked-up, so at all times, no matter where he is, everyone present can see how often and how brutally he gets assfucked.\n\n... Time's up. Lana strides forward and pushes you out of the kitchen.");
			addChoice("Mmm.", junkCityExplore.bind("cadekitchenrejoin"));
		}

		if (which == "cadekitchenrejoin") {
			append("You're back in the living room.\n\n... "+(data.metBins>0?"Bins":"The raccoon")+" tries to follow you, but a glitchy fox-paw closes around his wrist and yanks him back inside.\n\n\"Oh no,\" he squeaks. \"I'm sorry! I'm sorry! I couldn't stop "+pickByGender("him", "her", "them")+"! "+pickByGender("He was", "She was", "They were")+" so big and strong!! AUUUGHHH!!!\"");
			addChoice("Check up on Cade.", junkCityExplore.bind("cadeparty23"));
		}


		if (which == "cadekitchenlost") {
			addChoice("3:< Forget this raccoon, check up on Cade.", junkCityExplore.bind("cadeparty23"));
		}

		if (which == "cadeparty23") {
			append("You turn around.\n\nCade's hunched over on the shore of the orgy, panting, snout smeared with lipstick, tiger tail dripping saliva.\n\n\"Hahhh... okay, I made it out...\"");
			addChoice("Give him a hand.", junkCityExplore.bind("cadeparty24"));
		}

		if (which == "cadeparty24") {
			append("You take one of his soft forepaws and haul him to his feet. Some stray "+(isActive("Mood Ring")?getMood():"")+"cum oozes out between its pads, which he hurriedly wipes off on some random girl's fur.\n\n\"Ah... hah... thanks.\"");
			addChoice("No prob bro.", junkCityExplore.bind("cadeparty25"));
		}

		if (which == "cadeparty25") {
			append("He hides his superwide smile with a forearm, wiping some lipstick away. \"Shall we head through the kitchen?\"");
			addChoice("We can't. It's a surprise.", junkCityExplore.bind("cadeparty26"));
		}

		if (which == "cadeparty26") {
			append("\"What's a surprise?\"");
			addChoice("That's what I said. Wait, you didn't organize this?", junkCityExplore.bind("cadeparty27"));
		}

		if (which == "cadeparty27") {
			append("Cade scratches behind an ear, looking at the wall.\n\n\"Uh, well. To be honest, I don't organize much. I picked the date and told everyone they could use my house... the rest just kind of happened. For example: Lana, the cub in charge of the kitchen right now, he's mute— so I had no idea what he was planning to do when he marched in here with his little squad, he just handed me a note that said <!i>Stay out of this kitchen,<!i> so of course I had to let him take it over— I mean it <!i>is<!i> my kitchen, and he <!i>is<!i> half my size— but man can that boy throw out a bitchslap if he doesn't get his way—\"");
			addChoice("Let's talk detours.", junkCityExplore.bind("cadeparty28"));
		}

		if (which == "cadeparty28") {
			append("\"Right, our goal. Upstairs. Spare room!\"\n\nHe squares up and leads you into a hallway on the other side of the living room, toeing a few ahegao people out of the way to get to it.");
			addChoice("Next.", junkCityExplore.bind("cadeparty29"));
		}

		if (which == "cadeparty29") {
			append("The hallway stretches out in front of you. A few framed pictures dot the walls.\n\n\"It'll be a bit more of a walk than that,\" he says. \"Probably about five 'Next's.\"");
			addChoice("Next x5.", junkCityExplore.bind("cadeparty36"));
			addChoice("Noooo, I'll walk with you.", junkCityExplore.bind("cadeparty30"), {kinks: ["Plot"]});
		}

		if (which == "cadeparty30") {
			append("\"Ahhh, thank you!\"\n\nHe trots to keep up, kitty feet making soft <!i>paps<!i> against the hardwood floor.\n\n\"You're so nice. "+(data.cadePartyGaveBalloons ? "First you give me a bunch of "+(data.cadePissBalloon ? "Piss" : "Cum")+" balloons"+(data.cadeCapGiveBack ? ", try to refuse payment" : "") : "You put in all this effort to find the party even though my dumb handwriting sucks")+", then you help me up after I had my body ravaged in the black hole cuddle pile, <!i>then<!i> you offer to stick with me through a boring hallway walk— oh, you just—!\"\n\nCade swoons. \"You just remind me so much of him.\"");
			addChoice("Shucks.", junkCityExplore.bind("cadeparty31"));
			addChoice("The dude you've been waiting for?", junkCityExplore.bind("cadeparty32"), {kinks: ["Plot"]});
			addChoice("Sayyy, let's have a look at these pictures you've got hung here...", junkCityExplore.bind("cadeparty33"));
		}

		if (which == "cadeparty31") {
			append("\"Shucks yourself. I'm the one who should be blushing. I'm just some random tiger you bumped into on the street!\"");
			addChoice("You're not some random tiger. You have a name and a backstory and stuff.", junkCityExplore.bind("cadeparty31a"));
		}

		if (which == "cadeparty31a") {
			append("He covers up a chuckle. \"Backstory? I'm just a character in a game to you, huh~?\"");
			addChoice("I didn't mean it like that. Just... y'know, a past! (Point to the pictures.)", junkCityExplore.bind("cadeparty33"));
		}

		if (which == "cadeparty32") {
			append("\"Mhm.\"\n\n... He looks away from you, watching the pictures slip by on the opposite wall.");
			addChoice("What was his name?", function() {
				data.cadeKnownName = true;
				junkCityExplore("cadeparty32a");
				append("\"His name was Cade.\"");
			});
			addChoice("How long have you been waiting?", function() {
				data.cadeKnownWait = true;
				junkCityExplore("cadeparty32a");
				append("\"Sixty-six years.\"");
			});
			addChoice("Was he a kind and gentle megacutie just like me~?", function() {
				data.cadeKnownPlayer = true;
				junkCityExplore("cadeparty32a");
				append("\"No, heh. He was rude and pushy and I loved it. No, "+data.playerName+", you remind me of him... because you're a player too!\"");
			});
		}

		if (which == "cadeparty32a") {
			addChoice("... Oh! Well. Good to know. (Look at pictures.)", junkCityExplore.bind("cadeparty33"));
		}

		if (which == "cadeparty33") {
			append("They aren't pictures, now that you see a few up close. They're little mementos, glowing insects, scraps of paper, all pinned to their frames.\n\nEach approaches from down the hall, sits in focus beside you for a few steps, then recedes over your shoulder.");

			var frame1:MintSprite = addRectSprite(150, 150, 0xa48368);
			frame1.x = GAME_WIDTH*0.5-frame1.width*0.5;
			frame1.y = GAME_HEIGHT*0.5-frame1.height*0.5;

			var frame2:MintSprite = addRectSprite(frame1.width*0.95, frame1.height*0.93, 0xeae4c6);
			frame2.x = frame1.x+frame1.width*0.5-frame2.width*0.5;
			frame2.y = frame1.y+frame1.height*0.5-frame2.height*0.5;

			var subject:MintSprite = addSprite("assets/img/effect/chimeraEgg");
			subject.x = frame2.x+frame2.width*0.5-subject.width*0.5;
			subject.y = frame2.y+frame2.height*0.5-subject.height*0.5;

			frame1.alpha = 0;
			frame2.alpha = 0;
			subject.alpha = 0;

			for (s in [frame1, frame2, subject]) 
				tween(s, {alpha: 1}, 6, {ease: QUINT_OUT});

			tween(frame1, {x: 0}, 6, {type: REVERSE, ease: QUAD_IN});
			tween(frame2, {x: frame1.width*0.5-frame2.width*0.5}, 6, {type: REVERSE, ease: QUAD_IN});
			tween(subject, {x: frame2.width*0.5-subject.width*0.5}, 6, {type: REVERSE, ease: QUAD_IN});

			addChoice("Is that an egg?", junkCityExplore.bind("cadeparty34"));
		}

		if (which == "cadeparty34") {
			append("\"Oh,\" Cade squeaks. \"That's— well... it's my egg.\"");
			addChoice("<!i>Your<!i> egg?", junkCityExplore.bind("cadeparty35"));
		}

		if (which == "cadeparty35") {
			append("\"I'll explain upstairs if you really want to know,\" he murmurs, hurrying you along. \"Basically I was born in an egg, okay??\"");
			addChoice("Okay.", junkCityExplore.bind("cadeparty36"));
			addChoice("Not okay.", junkCityExplore.bind("cadeparty36not"));
		}

		if (which == "cadeparty36not") {
			append("\"Not okay? :<\"");
			addChoice("Just kidding I have no clue. It's okay.", junkCityExplore.bind("cadeparty36"));
			addChoice("You're a FREAK.", junkCityExplore.bind("cadeparty36freak"));
		}

		if (which == "cadeparty36freak") {
			append("He looks like he's going to cry for a second. His fur prickles and his tail droops.\n\nThen he turns that droop into the downswing of a mighty tail swish and smiles. \"You remind me even more of him, now. So <!i>rude<!i>.\"\n\nHe baps your belly with a paw. \"C'mon, lets get you to your room.\"");
			addChoice("Okayyy.", junkCityExplore.bind("cadeparty36"));
		}

		if (which == "cadeparty36") {
			append("\"Okay. Almost there.\"\n\nYou arrive at the stairs, but before you can place your foot on the first one, "+(data.metBins>0?"Bins":"that little raccoon from earlier")+" scurries under it and through a door to your left.\n\nYou lose your balance and fall on your ass.\n\n\"I'm back guys!\" he says to some people you can't see, slipping into the garage and completely ignoring you. \"We just put the last bit of frosting on the surprise!\"\n\nCade looks like he's gonna go into fits. He hurries to return the favor and help you up, machine-gun apologizing. \"Ah! I'm so sorry— Bins, get back here you little—\"");
			addChoice("It's fine. Glad this is just text. (Rub my aching tailbone.)", junkCityExplore.bind("cadeparty37"));
			addChoice("Let me get in that garage for a second.", junkCityExplore.bind("cadepartygarage"), {kinks: ["Cub", "Male", "Female", "Abuse", "Trash"]});
		}

		if (which == "cadepartygarage") {
			append("You leave Cade behind and follow "+(data.metBins>0?"Bins":"the raccoon")+" into the garage.\n\nA goth clique sits on some garbage bins in the far back: a coyote, a snake, and a black cat.\n\nThe coyote snuffs his cigarette and slaps the little cub in the face by way of greeting. "+(data.metBins>0?"Bins":"He")+" squeaks and takes it, holding his cheek out for another one.\n\n\"Have fun baking cake, Bins?\"\n\nBins wiggles his lil coon tail. \"Mmmn. He had me on guard duty. 'I don't trust those paws,' he writes to me. 'They've dug through too many garbage bags.'\"\n\n\"Dig through some more,\" the snake girl suggests, and slides off her bin.\n\nThe black cat twitches and fucks with a grimy boombox he apparently found by also digging through the garbage. \"This thing still works. Dang. Fuck yeah. It's even got Mikey J's early shit on here. Experimental shit.\"\n\nThe snake lifts her garbage lid, letting a caustic garbostank flood the room. All the goths pull it into their lungs like air conditioner on a hot day.\n\n\"Well, fuck you waiting for?\" says the coyote, throwing a smirk at the black cat, then at you. \"Press play.\"");
			addChoice("Listen to the music.", junkCityExplore.bind("cadepartygarage2"));
		}

		if (which == "cadepartygarage2") {
			data.cadeMusic = "garage";
			data.cadeListeningMusic = true;
			msg("<!img:kink/Music.png> Music: Garfuckle — by Wronger", true);
			stopChannel("music");
			playSound("assets/audio/music/cade/"+data.cadeMusic, "music", {loops: 999, startVolume: 0.4});
			
			append("This stuttery beat blasts over the black cat's lap, vibrating his private parts and your sinuses equally. Bins sticks his butt out for the world to see and grabs a burger bun, no sesame, scarfing fistfuls of rotten food, snotty tissues, and curdled cum balloons down his gullet with alarming sensuality.\n\nA snake tail, prehensile, forces itself between his asscheeks, and his little muscles tense while gags and <!i>hrrrks<!i> to display its hurtfulness, boi-cervix by default made curvier with the wads of undigested garbo mess he undoubtedly swallowed earlier.\n\nCade peeks in the door behind you. \"What's going on in here?! I heard... 'music'...? Oh God—\"\n\nBins spins around and looks him in the face, snake tail lodged up his ass, burger slime and spoiled cum dripping from his maw.\n\nCade slowly backs out.");
			addChoice("... Follow him.", junkCityExplore.bind("cadepartygaragerejoin"));
			cadeMusicToggle();
		}

		if (which == "cadepartygaragerejoin") {
			cadeMusicToggle(true);
			append("Back at the foot of the stairs, Cade clears his throat. \"Well, that was... yeah. Shall we head upstairs?\"");
			addChoice("We shall. (Go first.)", junkCityExplore.bind("cadeparty38"));
		}

		if (which == "cadeparty37") {
			append("You rub your tailbone slow and sensual, letting your fingers wander just a few inches lower and trace the top of your asscrack. Your buttmeat ripples the tiniest bit. Cade's breathing speeds up a little.");
			addChoice("I'll go first~", junkCityExplore.bind("cadeparty38"));
		}

		if (which == "cadeparty38") {
			append("These stairs are no match for your thighs. You positively destroy the first half, taking them two at a time, working your glutes like a whore at the gym. Cade trails along behind you— a good five stairs apart, just so his snout doesn't slip between your asscheeks every other step.\n\nYou reach the top, panting. You lean against the wall and rest for a moment, butt stuck out directly in Cade's path.");
			for (s in ["Fwahhhh...", "Pwahhhh...", "Gwahhhh...", "Nyahhhh..."])
				addChoice(s, function() {
					data.cadePartyExhaustion = s;
					junkCityExplore("cadeparty39");
				});
		}

		if (which == "cadeparty39") {
			append("He ignores your cute exhausted noise and scooches past your butt, taking extreme care not to brush it with his megaboner.");
			addChoice("Should we pit stop in your room first?", junkCityExplore.bind("cadeparty40"));
		}

		if (which == "cadeparty40") {
			append("His pawpads <!i>pit-pat-pit-pat<!i> as he hurries around the corner, steam practically trailing from his head. \"Yup! Sure! Maybe! Just around here! Follow me!\"");
			addChoice("Follow.", junkCityExplore.bind("cadeparty41"));
			addChoice("... Snoop around.", junkCityExplore.bind("cadepartycloset"), {kinks: ["Plot"]});
		}

		if (which == "cadepartycloset") {
			append("Well, besides the corner ahead, there's only a closet.");
			addChoice("Examine closet.", junkCityExplore.bind("cadepartycloset2"));
			addChoice("Loot closet!", junkCityExplore.bind("cadepartycloset2"));
		}

		if (which == "cadepartycloset2") {
			append("It's a mess in here. The first thing you find is a half-empty baggy of sweetgrass and a pipe.");
			if (canGain) addToItem("Sweetgrass Leaf", 3);
			addChoice("Dig deeper.", junkCityExplore.bind("cadepartycloset2a"));
			addChoice("Stop digging.", junkCityExplore.bind("cadeparty41"));
		}

		if (which == "cadepartycloset2a") {
			unlockJournal("Missing Page 8");
			msg("Found Missing Page #8", true);
			playSound('assets/audio/environment/journalPage');
			append("There's a missing page from the Daydream Journal in here, too, all crumpled up. It's filled with attempted translations, but it looks like he was never quite able to understand what it says.");
			addChoice("Dig deeper.", junkCityExplore.bind("cadepartycloset3"));
			addChoice("Stop digging.", junkCityExplore.bind("cadeparty41"));
		}

		if (which == "cadepartycloset3") {
			append("Bottles of wine at the bottom of a clothes hamper. Only one has anything left in it.");
			if (canGain) addToItem("Glowberry Wine", 1);
			addChoice("Dig deeper.", junkCityExplore.bind("cadepartycloset4"));
			addChoice("Stop digging.", junkCityExplore.bind("cadeparty41"));
		}

		if (which == "cadepartycloset4") {
			append("... Buried at the very back, taped behind a dusty bookshelf and dirty from overuse, there's a packet full of syringes and two empty jugs of liquid sweetdust.");
			addChoice("Mmmmmmkay stop digging.", junkCityExplore.bind("cadeparty41"));
			if (data.cadeCapGiveBack) addChoice("Find a spot to put those capsules Cade gave me.", junkCityExplore.bind("cadepartycloset5"), {cost: ["Capsule", 5]});
		}

		if (which == "cadepartycloset5") {
			append("You tuck them into the pocket of some jeans stained green with tranq juice and feel good about yourself!");
			addChoice("Go find him.", junkCityExplore.bind("cadeparty41"));
		}

		if (which == "cadeparty41") {
			append("You turn the corner.\n\nHe's gone, but the door to the master bedroom is wide open.");
			addChoice("... Peek in.", junkCityExplore.bind("cadeparty42"));
		}

		if (which == "cadeparty42") {
			append("Cade's bedroom has been transformed into a comfy palace for the party. Pillow forts with couch-cushion foundations tower in the corners. "+data.myntColour.toTitleCase()+" duvets hang like strings of christmas lights around them. Every nook has been padded, tucked-in, and warmed with the imprints of casual sex, although everyone is downstairs now.\n\nJust before you go looking, you notice that the hanging blankets are fluttering in a breeze?");
			addChoice("Follow the smell of fresh air.", junkCityExplore.bind("cadeparty43"));
		}

		if (which == "cadeparty43") {
			append("... It's hard to describe this next part.");
			addChoice("Oh god what now.", junkCityExplore.bind("cadeparty44"));
		}

		if (which == "cadeparty44") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/gryphParty.png");
			s.x = GAME_WIDTH - s.width*0.95;
			s.y = GAME_HEIGHT - s.height;
			s.layer = 69;
			s.scaleX = 0.9;
			s.scaleY = 0.9;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Leveretry", "");

			append("The furthest wall of Cade's bedroom is now a giant hole, mostly around where the window used to be. All the rubble and shards of glass have been tucked into a neat little pile.\n\nIn the corner sits "+(data.violetGryphonStrawberry?"Strawberry Crotch, ":"")+"your gryphon friend from up on the meteorite, trying "+gryphJunk("his", "her", "their")+" best to look dignified despite having a tiny party hat tied to "+gryphJunk("his", "her", "their")+" head.\n\n<!i>Greetings.<!i>");
			addChoice("Hi, Strawberry.", junkCityExplore.bind("cadeparty44a"));
		}

		if (which == "cadeparty44a") {
			append("Cade stands next to you with his mouth open, stunned. \"I... I told you to land in the <!i>back<!i>...\"\n\n<!i>There was a fire in the back.<!i>\n\n\"Yes, a fire, in the firepit. I... I understand you don't like it, but—\"\n\n<!i>It's deeper than dislike for us. You know that. We mythological creatures, born from the infinitely deep spring of Nymphore, raised in the rains of Violet's great—<!i>\n\n\"Don't interrupt me! Your stupid mind pictures break my train of thought.\"\n\n<!i>... Sorry.<!i>\n\n\"I know where we were born and I know we don't like fire, but if it's in a pit, it's perfectly safe. Honestly, when was the last time you left your cave? Haven't you seen a firepit before?\"\n\n<!i>No.<!i>\n\nCade flops backwards onto a pillow coated in plaster dust with a cloudy POOF.\n\n... The gryphon hangs "+gryphJunk("his", "her", "their")+" head. <!i>I'm sorry, Cade. I thought I could fit through the window.<!i>\n\nCade just looks at "+gryphJunk("him", "her", "them")+". \"Get out.\"");
			addChoice("Lay down with Cade.", junkCityExplore.bind("cadeparty45lay"));
			addChoice("Wait, hold on, how do you two know each other again?", junkCityExplore.bind("cadeparty45know"), {kinks: ["Plot"]});
		}

		if (which == "cadeparty45lay") {
			append("You snuggle up next to him on the pillow, letting his left thigh slip between both of yours and nuzzle against your "+pickByGenitals("semi-soft cock", "cuntlips", "semi-soft cock")+". His muscles immediately relax, and his pawtoes wiggle just the tiniest bit.");
			addChoice("Do"+gryphJunk("es he", "es she", " they")+" reaaaally have to leave? "+gryphJunk("He", "She", "They")+" even put on that special hat just for you.", junkCityExplore.bind("cadeparty45lay2"));
		}

		if (which == "cadeparty45lay2") {
			append("Cade peels his paws off his face, expression filled with venom. \"That hat looks <!i>stupid<!i> on you.\"\n\nIn a blink the gryphon swoops across the room, displacing half of "+gryphJunk("his", "her", "their")+" so neatly stacked rubble pile, sending blankets and pillows up against the walls.\n\n"+gryphJunk("He stops", "She stops", "They stop")+" just shy of Cade's face, razor-beak glimmering in the moonlight. "+gryphJunk("His", "Her", "Their")+" hat never wobbled once. That's how tightly "+gryphJunk("he", "she", "they")+" tied it.\n\n<!i>Say that again, chimera.<!i>");
			addChoice("Guys, guys, guys. You're arguing over nothing. The hat objectively looks amazing, we all know this.", junkCityExplore.bind("cadeparty45lay3"));
		}

		if (which == "cadeparty45lay3") {
			append("Cade pouts and turns away.\n\nThe gryphon does too, self-consciously adjusting "+gryphJunk("his", "her", "their")+" party hat with a talon.");
			addChoice("Let's all just calm down.", junkCityExplore.bind("cadeparty46"));
		}

		if (which == "cadeparty45know") {
			append("\"We're both mythological creatures,\" Cade mumbles into his hands. \"We grew up together.\"");
			addChoice("If you're not a tiger, what are you?", junkCityExplore.bind("cadeparty45know2"));
		}

		if (which == "cadeparty45know2") {
			data.cadePartyChimeraKnown = true;
			append("\"It's too hard to explain.\"\n\n"+(data.violetGryphonStrawberry?"Strawberry Crotch":"The gryphon")+" fixes you with one sharp eye and penetrates your mind with the image of an egg. The colors and pattern are the same as egg you saw downstairs, maybe a little brighter. It rises from the surface of a spring and breaks open to reveal... Cade, or what you guess must be Cade: a grey humanoid in the fetal position.\n\n<!i>He's a chimera. They're look like that until they find someone they love.<!i>\n\n\"You just showed "+pickByGender("him", "her", "them")+" my baby pictures, didn't you?\"\n\n"+gryphJunk("He", "She", "They")+" looks away. <!i>No.<!i>\n\n\"You totally did!\"");
			addChoice("Let's just calm down here guys.", junkCityExplore.bind("cadeparty46"));
		}

		if (which == "cadeparty46") {
			append("...\n\nNo one does anything. Both of them just pout.");
			addChoice("Okay, for starters, let's hang some of these blankets over the hole.", junkCityExplore.bind("cadeparty47"));
		}

		if (which == "cadeparty47") {
			append("You gather up some blankets and tie them around the jaggier pieces of wall. At least three seperate times you happen to grab a cumstain and the blanket slides out of your grip.\n\n... Cade can't just lay there while someone else does work near him, so he gets up and helps out. The gryphon stands on "+gryphJunk("his", "her", "their")+" hind legs and tackles the higher knots with "+gryphJunk("his", "her", "their")+" deft beak.\n\nBefore long the room is (technically) sealed again, and already the temperature is rising. Without the draft of the night air, the warmth of your two regular-sized bodies and the gryphon's massive furry-feather body soaks into the insulation of the pillow palace around you.");
			addChoice("There now. We're all pals here.", junkCityExplore.bind("cadeparty48"));
		}

		if (which == "cadeparty48") {
			append("The gryphon pokes at the floor with a talon, broadcasting a few warm, squishy images to the both of you.\n\n<!i>Should we...<!i>");
			addChoice("Should we double-team Cade? Absolutely.", junkCityExplore.bind("cadeparty49"));
			addChoice("Head downstairs? Absolutely.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty49") {
			append("<!i>Oh, I like that idea.<!i>\n\n\"What?!\"");
			addChoice("What what? :3 It'll be fun.", junkCityExplore.bind("cadeparty50"));
		}

		if (which == "cadeparty50") {
			append("He gets to his feet and backs up slowly, cock hardening, til his butt bumps against the edge of the four-poster master bed. \"Wait... guys... "+pickByGenitals("not two in one hole, I can't stretch that wide yet", "why do I have to be on the bottom?", "not two in one hole, I can't stretch that wide yet")+"!\"\n\nYou and "+(data.violetGryphonStrawberry?"Strawberry Crotch":"the gryphon")+" both advance on him.\n\n<!i>I'll take his ass.<!i>");
			addChoice("I'll take his maw.", junkCityExplore.bind("cadeparty51"));
		}

		if (which == "cadeparty51") {
			append("The gryphon nuzzles a few pillows out of "+gryphJunk("his", "her", "their")+" way and settles down at the foot of Cade's bed. "+gryphJunk("His cock", "Her body tenses up once more, like it did when you first met her, and a cock glides gracefully into existence between her haunches and", "Their cock")+" flops out onto the blankets, pushing them aside in ripples as it chubs up.\n\n<!i>Mmm. Blankets are soft. Can I borrow some of these for my cave?<!i>\n\n\"N-No,\" Cade says, climbing awkwardly onto the bed. His eyes are stuck on that massive catcock, inching closer and closer as it hardens. \"You're not borrowing anything. You already owe me a wall.\"");
			addChoice("Straddle his face.", junkCityExplore.bind("cadeparty52"));
		}

		if (which == "cadeparty52") {
			append("You swing a leg over his chest and sit your ass down on it for starters.\n\nThen you scooch forward, gyrating your hips to do so, dragging your "+pickByGenitals("fat nuts", "cunt", "fat nuts and cunt")+" over his fur. You"+pickByGenitals("r cock slides up along", " slide it up over", "r cock slides up along")+" his exposed throat. Then you take hold of those round little tiger ears, two fingers each, and slide up higher, "+pickByGenitals("balls bumping", "pussy throbbing", "balls bumping")+" against his chin and "+pickByGenitals("shaft twitching against his snout", "a tiny slice of his lower lip, too", "shaft twitching against his snout")+".\n\n\"Mmmnnnfff,\" he says into your "+pickByGenitals("nutsack", "cuntmeat", "nutsack")+".");
			addChoice("Open your maw, kitty.", junkCityExplore.bind("cadeparty53"));
			addChoice("Open.", junkCityExplore.bind("cadeparty53"));
		}

		if (which == "cadeparty53") {
			append("Cade opens wide in a heartbeat, despite all that earlier faux-reluctance.\n\nHe goes cross-eyed watching a single bead of "+pickByGenitals("pre form at your cocktip. It hangs for a moment between his eyes, quivering, dangling by a single silver thread— then it drops", "pussyjuice form where your lips meet. It hangs for a moment above his mouth, quivering, dangling by a single thread— then it drops right into the back of his maw, and without being told to, he swallows", "pre form at your cocktip. It hangs for a moment between his eyes, quivering, dangling by a single silver thread— then it drops")+".\n\nDownstairs, "+(data.violetGryphonStrawberry?"Strawberry Crotch":"the gryphon")+" is a lot less teasing. "+gryphJunk("He growls and rams his", "She growls and rams her", "They growl and ram their")+" cock up against Cade's ass, tapered tip easily opening him, each thrust throwing shockwave ripples through his nuts and thighs.\n\n<!i>"+pickByGenitals("You can't stretch that wide yet, huh? Then why are you taking my big feral gryphon cock<!i>— yes, he sees his cock that way— <!i>so easily?<!i>", "You have to be on the bottom because you take cock so well, that's why.<!i>", "You can't stretch that wide yet, huh? Then why are you taking my big feral gryphon cock<!i>— yes, they see their cock that way— <!i>so easily?<!i>")+"\n\n\"Mnnnhh!\" Cade protests, muffled by your crotch.");
			addChoice(pickByGenitals("Throatfuck.", "Suck my cunt.", "Throatfuck."), junkCityExplore.bind("cadeparty54"));
		}

		if (which == "cadeparty54") {
			append("You mimic the gryphon and get a little rougher, grabbing those soft little ears in two fists and "+pickByGenitals("plunging your cock directly down his throat", "grinding your cunt over his snout and lips", "plunging your cock directly down his throat")+", holding his face firm against your crotch in case he thinks of pulling away.\n\nShivers wrack his body as the gryphon rams at least halfway inside him. Pre gushes from his dick. A little bulge bubbles up in his lower stomach. His paws wander shakily up your legs, clutching at your hips... and pulling you down harder.\n\nYou can't just let something that whorish slide without reward, so you "+pickByGenitals("throw a few vicious thrusts down his gullet", "flex your cuntmuscles and give him a few more drops of juice to suck on", "throw a few vicious thrusts down his gullet")+", gently bouncing your hips against his head, pushing it deeper and deeper into the mattress.");
			addChoice(pickByGenitals("Make him gag.", "Use your tongue, cat. Did I not just say 'suck my cunt?'", "Make him gag."), junkCityExplore.bind("cadeparty55"));
		}
		
		if (which == "cadeparty55") {
			append("Okay, he's starting to regret pulling your hips down like that.\n\nYour "+pickByGenitals("cock bottoms out in his throat. Your nutsack twitches tight at his chin", "hips slow and stop to make it as easy as possible for Cade to comply. Shyly, his eyes watering, he tests the waters... prodding your cunt, twiddling your clit with it some.", "cock bottoms out in his throat. Your nutsack twitches tight at his chin")+".\n\n<!i>How is he?<!i> the gryphon purrs, pounding the absolute fuck out of his asshole, pulling out a quarter-inch of soft kitty buttmeat with each downswing.");
			addChoice(pickByGenitals("He'd be a lot better if he let me hear how my cock feels in his throat.", "Grrr. He's teasing me.", "He'd be a lot better if he let me hear how my cock feels in his throat."), junkCityExplore.bind("cadeparty56"));
		}

		if (which == "cadeparty56") {
			append("Cade whines and squirms, unable to deal with pretty much anything while his ass is getting ravaged this heavily. The gryphon doesn't slow up at all.\n\n<!i>Your guest is dissatisfied, Cade. "+pickByGenitals("Gag for "+pickByGender("him", "her", "them"), "Fuck "+pickByGender("his", "her", "their")+" cunt with your tongue", "Gag for "+pickByGender("him", "her", "them"))+".<!i>\n\n... He closes his eyes, but not before you see them roll up. Then, slowly, with a shiver so vicious it makes his thighs clamp together over the gryphon's thrusting cock, he "+pickByGenitals("releases a deep, rolling gag from the pit of his dick-filled stomach, and the ripples of his throatmuscles milk another gush of the pre from you", "drives his tongue as far as it can go up your puss, letting your natural lube gush out and pool in the back of his throat", "releases a deep, rolling gag from the pit of his dick-filled stomach, and the ripples of his throatmuscles milk another gush of the pre from you")+".\n\n<!i>That's a good boy.<!i>");
			addChoice("Cum.", junkCityExplore.bind("cadeparty57"));
		}

		if (which == "cadeparty57") {
			cumEffect();
			append("You bounce your hips off his face over and over and over and over, brutally hard, spilling "+pickByGenitals((isActive("Mood Ring")?getMood("You"):"")+"cum", "cuntjuice", (isActive("Mood Ring")?getMood("You"):"")+"cum")+" over his face and bedspread and not caring at all, every muffled gag, every thrash of his tongue bringing on another wave of orgasm. The gryphon matches you thrust-for-thrust, pounding Cade into the matress and filling his belly with spurts of boiling-hot feral cum, the slap of each thrust getting wetter and wetter as a pool forms under his fucked-red buttcheeks.\n\nThen it's over. You both "+pickByGenitals("keep your cocks plugged inside him while they soften.", "pull in hot breaths.", "keep your cocks plugged inside him while they soften.")+".\n\nAfterglow settles into your crotch like vapor rub, cool and tingly.");
			addChoice(data.cadePartyExhaustion, junkCityExplore.bind("cadeparty58"));
		}

		if (which == "cadeparty58") {
			append("Oh gosh, he's almost passed out.\n\nHis maw hangs open, dribbling "+pickByGenitals("jizz", "drool", "jizz")+", and his eyes flutter hopelessly.");
			addChoice("Slap him awake!", junkCityExplore.bind("cadeparty59slap"));
			addChoice("Smooch him awake.", junkCityExplore.bind("cadeparty59smooch"));
		}

		if (which == "cadeparty59slap") {
			append("<!i>WHAP!<!i>\n\nHe makes a kind of guttural groan-snrrrk-hrrkkk sound and snaps back to life, looking up at you through bleary eyes.\n\n\"Unh... that was... so good...\"");
			addChoice("The slap or the face"+pickByGenitals("fuck", "-sitting", "fuck")+"?", junkCityExplore.bind("cadeparty59slap2"));
		}

		if (which == "cadeparty59slap2") {
			append("\"The... uhhhhrk... the face"+pickByGenitals("fuck", "-sitting", "fuck")+". Ow, you slapped me.\"");
			addChoice("Bit of a late reaction there bud. (Wind down.)", junkCityExplore.bind("cadeparty60"));
		}

		if (which == "cadeparty59smooch") {
			append("You bring your lips down to his and suck tenderly, pulling a few hot drops of "+pickByGenitals((isActive("Mood Ring")?"your "+getMood("You"):"")+"cum", "your special sauce", (isActive("Mood Ring")?"your "+getMood("You"):"")+"cum")+" off their curves. He stirs and kisses back, exhaling into your mouth.\n\n\"Unh... that was... so good...\"\n\nThe gryphon licks a cummy talon. <!i>You made the cutest noises when I bottomed out inside you.<!i>\n\n\"Unh... you should... shuddup.\"");
			addChoice("Wind down.", junkCityExplore.bind("cadeparty60"));
		}

		if (which == "cadeparty60") {
			append("All three of you collapse into a micro-black-hole cuddle pile. "+(data.violetGryphonStrawberry?"Strawberry Crotch":"The gryphon")+" flops down first, soaking all the mess into "+gryphJunk("his", "her", "their")+" fur-feathers and acting as a very comfy cushion for the two of you to sprawl out on.\n\nTime passes. The wall of multicolored blankets converts all that boring white moonlight into rainbows. Eventually, rumbly gryphon snores start to vibrate through your bodies.\n\nCade ducks sneakily out from under "+gryphJunk("his", "her", "their")+" forepaw and tip-toes back into the hall, gesturing for you to follow.");
			addChoice("Follow.", junkCityExplore.bind("cadeparty61"));
		}

		if (which == "cadeparty61") {
			append("You meet him there.\n\n\"Alright,\" he says, his voice still sounding a little clogged. \"Enough detours and pit stops. I'm finally gonna show you your room.\"");
			addChoice("Right. This is it.", junkCityExplore.bind("cadeparty62"));
		}

		if (which == "cadeparty62") {
			append("You head down one more bend. Over here the hardwood is unforgiving. Traffic wore the other floors smooth.\n\nCade puts one paw on the door. His fingers curl around the knob, muscles tensing.");
			addChoice("Brace myself?", junkCityExplore.bind("cadeparty63"));
		}

		if (which == "cadeparty63") {
			append("There is no need.\n\nIt's small and tidy and dustless. A set of clothes hang over the back of an armchair: a collared shirt, jeans, raincoat, hiking boots. Off to the side there's hiking poles, a backpack, ropes and climbing gear, scuba masks, oxygen tanks, a first-aid kit—");
			addChoice("Seems like he was ready for anything.", junkCityExplore.bind("cadeparty64"), {kinks: ["Plot"]});
			addChoice("Wew, finally. Thanks! (Head downstairs.)", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty64") {
			append("\"Oh, all that stuff...\" Cade says, teetering on the edge. He doesn't seem to want to come inside.\n\n\"That's how we met in the first place. He was tired of all the characters in the forest and in Junkport— Junk City, I mean— so he bought a bunch of supplies and climbing gear and scaled the meteorite. One of the first to do it. As for the scuba stuff and the first aid— that was for me. I was so sensitive, I told him... 'I don't care if players respawn or not, I couldn't stand to see you die.'\"\n\nHe hangs on the doorframe, looking down. \"I guess my species is just naturally clingy.\"");
			addChoice((data.cadePartyChimeraKnown?"The gryphon said you're a chimera.":"What are you?"), junkCityExplore.bind("cadeparty65"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty65") {
			append("He huffs.\n\n\"I didn't want to tell you. There are enough bizarre things happening constantly as it is.\"");
			addChoice("It's okay, I still got room in my noggin for more bizarre things.", junkCityExplore.bind("cadeparty65a"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty65a") {
			append("\"... Well, "+(data.cadePartyChimeraKnown?"you know I'm a chimera":"I'm a chimera")+". What else do you want to know?\"");
			addChoice((data.cadePartyChimeraKnown?"You were born as a grey humanoid. How did you become a tiger?":"Why do chimeras look exactly like tigers?"), junkCityExplore.bind("cadeparty66"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty66") {
			append("\"We're born with the default character model— the one you're using right now. But the, uh... when we find someone that we really, really, really like...\"");
			addChoice("You fuck the shit outta them! <3", junkCityExplore.bind("cadeparty67"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty67") {
			append("He smiles. \"Yes, first. But then, if we <!i>really<!i> like them, we copy their identity.\"");
			addChoice("Even their name?", junkCityExplore.bind("cadeparty68name"));
			addChoice("Dang. Twincest. Kind of.", junkCityExplore.bind("cadeparty68kinda"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty68kinda") {
			append("\"It's better than twincest. Cade had turned down everyone else's offers until he met me. I was just a grey thing with holes. I think he assumed I was a sex toy— so he treated me like one. After he finished inside me, I spoke for the first time to him, and I said 'Sorry, could you keep it in a second longer?'\"");
			addChoice("And then?", junkCityExplore.bind("cadeparty68"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty68name") {
			append("\"Mhm. After our first time together, I asked him if we could kiss. I didn't mean for it to be a frog-and-the-princess situation, but the moment our lips touched...\"\n\nCade splays his paws.\n\n\"Poof. I became him. I could think of myself and only be called one name: Cade. I couldn't display it above my head like him, of course, that's a player-only thing.\"");
			addChoice("And then?", junkCityExplore.bind("cadeparty68"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty68") {
			append("Cade stifles a laugh. He has to restart his sentence a few times before he can get it out:\n\n\"... He flipped. He was so frazzled. I said it was okay, I wasn't like the others in here, I'm vanilla, I won't push anything on you, please just sit with me for a while... we can make this work. I specifically remember convincing him that we could make this work.\"");
			addChoice("D'awww.", junkCityExplore.bind("cadeparty69"));
			addChoice("That's sweet. :3", junkCityExplore.bind("cadeparty69"));
			addChoice("And did you make it work?", junkCityExplore.bind("cadeparty69"));
			addChoice("Let's head downstairs.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty69") {
			append("\"Mmm. From what the little raccoon said, your surprise is probably ready.\"\n\nHe turns.\n\n\"Let's head downstairs.\"");
			addChoice("...", junkCityExplore.bind("cadeparty70"));
		}

		if (which == "cadeparty70") {
			append("He starts walking away.");
			addChoice("Wait!", junkCityExplore.bind("cadeparty71"));
		}

		if (which == "cadeparty71") {
			append("Cade looks over his shoulder.\n\n\"Yes?\"");
			addChoice("Wanna stargaze with me? :3", junkCityExplore.bind("cadeparty72"));
			addChoice("Nevermind. Let's go.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty72") {
			append("He raises an eyebrow. \"My chimerical mimic powers only work the first time I fall in love, you know.\"");
			makeSmallButtons();
			addChoice("Nonono. I just want to hang out a bit more.", junkCityExplore.bind("cadeparty73"));
			addChoice("Darn! ... Let's hang out more anyway.", junkCityExplore.bind("cadeparty73"));
			addChoice("Tbh the fresh air coming through your utterly destroyed bedroom wall whetted my appetite and now I want more.", junkCityExplore.bind("cadeparty73"));
			addChoice("Ah, nevermind then. Let's go.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadeparty73") {
			append("\"Bah, alright.\"");
			addChoice("Really~?", junkCityExplore.bind("cadeparty74"));
		}

		if (which == "cadeparty74") {
			append("\"Mhm.\"\n\nHe leads you down the hall (you gander at his butt on the way, which is now dripping "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"gryphon cum) and then pushes open a big steel door to the roof.");
			addChoice("Follow.", junkCityExplore.bind("cadeparty75"));
		}

		if (which == "cadewipend") {
			stopChannel("music");
			addChoice("WIP.", junkCityExplore.bind("cadewipend"));
			addChoice("Begin the deep talk.", junkCityExplore.bind("cadeparty60"));
			addChoice("WIP - Restart.", junkCityExplore.bind("ExploreCadeParty"));
			cadeMusicToggle();
		}

		if (which == "cadeparty75") {
			append("You follow Cade onto the roof of his house.\n\nCity battlements tower in the distance.\n\nCade slumps down on a disused tanning chair and pats the seat of the one next to him.");
			addChoice("Lay down.", junkCityExplore.bind("cadeparty76"));
		}

		if (which == "cadeparty76") {
			append("You lay down.");
			addChoice("Cross my legs.", junkCityExplore.bind("cadeparty77"));
			addChoice("Tuck hands behind my head.", junkCityExplore.bind("cadeparty77"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadeparty77") {
			append("You get comfy.");
			addChoice("Look at the stars.", junkCityExplore.bind("cadepartystars"));
			addChoice("Look at the battlements.", junkCityExplore.bind("cadepartybattle"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartystars") {
			append("Light pollution hangs like fog on the streets of the suburbs. Up here, though, the sky is plain.");
			addChoice("Listen to the streets.", junkCityExplore.bind("cadepartystreets"));
			addChoice("Listen to the sky.", junkCityExplore.bind("cadepartysky"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartybattle") {
			append("Bare bulbs, flashlights, and oil lanterns glimmer bright on top of them, along with a few other light sources you can't distinguish. Dimmer light-specks bob in patrols between those— reflections on the long-range tranquilizer rifles slung over every sentry's shoulder.");
			addChoice("Listen to the streets.", junkCityExplore.bind("cadepartystreets"));
			addChoice("Listen to the sky.", junkCityExplore.bind("cadepartysky"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartystreets") {
			append("When you finally stop and pay attention you realize the chatter and the passing of cars repeat themselves every two minutes. You guess any society would seem repetitive if you observed it from a high enough vantage point, though.");
			addChoice("Look at my feet.", junkCityExplore.bind("cadepartyfeet"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartysky") {
			append("Wind pulls pre-calculated patterns through the clouds. Every gust echoes another one you heard two minutes ago.");
			addChoice("Look at my feet.", junkCityExplore.bind("cadepartyfeet"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartyfeet") {
			append("They're grey, humanoid.\n\nYou wiggle your toes.");
			addChoice("Look anywhere.", junkCityExplore.bind("cadepartyanywhere"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartyanywhere") {
			if (data.cadeLookAnywhere.length == 0) data.cadeLookAnywhere = ["an ant-sized car crawling along the street", "the moon", "a cloud shaped like a fat cock. There's no way that's a coincidence", "a cloud spewing rain over the side of the meteorite", "the immense shadow of the meteorite", "the blue-sprinkled tips of Bright Forest's canopy", "two silhouettes entwined in a window. They're both deepthroating one end of a double-sided dildo", "a truck with fire decals parked below, leaking sweetgrass smoke from its windows", "a curl of steam above the distant buildings", "the parapets", "the helical spire of Septrica's brothel", "someone sprinting out of an alley, pursued by three others", "the bustling box of the Snagglebank", "a few gaping tunnels which must lead down to the Sewer Suburbs", "a tiny rainbow-dressed figure bugging passerby on the streetcorner", "three lovers crying together at a bus stop. Two pay the driver with some caps and get on. The third stays", "a green limousine", "the shimmering arc of a tossed beer bottle", "the brown mounds of a landfill just outside the City", "bird-shaped specks racing through the sky", "a girl dangling her legs over the edge of her apartment's balcony", "underlit pools on the roofs of other houses"];
			var result:String = pickOne(data.cadeLookAnywhere);
			data.cadeLookAnywhere.remove(result);

			append("You look at "+result+".");
			if (data.cadeLookAnywhere.length != 1) addChoice("Look anywhere.", junkCityExplore.bind("cadepartyanywhere"));
			addChoice("Look at him.", junkCityExplore.bind("cadepartylook"));
		}

		if (which == "cadepartylook") {
			append("You look at Cade.\n\nHe isn't looking at you.");
			addChoice("You okay?", junkCityExplore.bind("cadepartylook2"));
			addChoice("You miss him?", junkCityExplore.bind("cadepartylook2"));
		}

		if (which == "cadepartylook2") {
			append("A tiny, invisible sniffle. His shoulders quiver.\n\n\"Mhm.\"");
			addChoice("...", junkCityExplore.bind("cadepartylook3"));
		}

		if (which == "cadepartylook3") {
			append("The stars flicker. Two of them hug each other tight in a binary system.\n\nHe works up enough courage to turn his head halfway towards you. Tears glisten on the profile of his muzzle.\n\n\"Cade's dead, isn't he?\"");
			addChoice("I'm sorry?", junkCityExplore.bind("cadepartywho"));
		}

		if (which == "cadepartywho") {
			append("\"Cade the player.\"");
			addChoice("Course not. Just busy.", junkCityExplore.bind("cadepartybusy"));
			addChoice("No one went by their real name when they played this game, so... I dunno who he was.", junkCityExplore.bind("cadepartydunno"));
			addChoice("My dad caught him playing this and threw him outside with the others.", junkCityExplore.bind("cadepartydad"), {kinks: ["Plot"]});
		}

		if (which == "cadepartybusy") {
			append("Cade searches your face with one puffy eye.\n\n\"What? That doesn't make sense. He used to rant about how bored he was. Cooped-up. He always left suddenly, yes, so I suppose he had something to do— but never so suddenly he couldn't at least type out 'I love you bye.'\"\n\nThat eye narrows. \"Except the last time. He didn't say anything when he left for good.\"");
			addChoice("Right. Well. Sometimes real life consumes people. Like I said, he's been busy.", junkCityExplore.bind("cadepartybusy2"));
		}

		if (which == "cadepartybusy2") {
			append("Cade smiles weakly.\n\n\"Yep. You know what, let's change the subject.\"");
			addChoice("... Sure.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadepartydunno") {
			append("\"Ah, I can understand that...\"");
			addChoice("Yeah?", junkCityExplore.bind("cadepartydunno1"));
		}

		if (which == "cadepartydunno1") {
			append("\"Well, there's a lot of stuff in here you wouldn't want your real identity to be associated with. Like the— uh— what are they called? I still can't say it right. The little Fuck—\"");
			addChoice("MmmmmmmmHM let's not talk about those.", junkCityExplore.bind("cadepartydunno2"));
			addChoice("Anyway!", junkCityExplore.bind("cadepartydunno2"));
			addChoice("—meat!!! OH those are my favorite!! <3", junkCityExplore.bind("cadepartydunno3"));
		}

		if (which == "cadepartydunno2") {
			append("Cade smiles at the sky. \"Sorry, yeah. Bizarre stuff.\"");
			addChoice("Anyway anyway anyway.", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadepartydunno3") {
			append("Cade makes a face like :|.\n\nHe's judging you super hard right now.");
			addChoice("... Anyway~", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadepartydad") {
			append("Both eyes snap to you, puffy and wide.\n\n\"I'm sorry— hold on— your dad? Outside of where? Which others?\"");
			addChoice("My dad, our pastor.", junkCityExplore.bind("cadepartydad2"));
			addChoice("Outside of the bomb shelter.", junkCityExplore.bind("cadepartydadout"));
			addChoice("The other members of our following.", junkCityExplore.bind("cadepartydadothers"));
		}

		if (which == "cadepartydad2") {
			append("\"Oh... I see.\"\n\nCade swallows, looking at his feet.");
			addChoice("...", junkCityExplore.bind("cadepartydad3"));
		}

		if (which == "cadepartydad3") {
			append("\"So your dad...\"");
			addChoice("... my dad wouldn't let him back at this computer, no.", junkCityExplore.bind("cadepartydadend"));
			addChoice("... my dad excommunicated him, yes.", junkCityExplore.bind("cadepartydadend"));
		}

		if (which == "cadepartydadout") {
			data.knownBombShelter++;
			append("\"Your... bomb shelter.\"\n\nCade swallows, looking at his feet.");
			addChoice("Yes.", junkCityExplore.bind("cadepartydadout2"));
		}

		if (which == "cadepartydadout2") {
			append("\"So Cade is dead.\"");
			addChoice("... More or less.", junkCityExplore.bind("cadepartydadothers3"));
			addChoice("I'm sure he's somewhere out there, but he's never coming back.", junkCityExplore.bind("cadepartydadothers3"));
		}

		if (which == "cadepartydadothers") {
			append("\"So that's what kept interrupting him.\"\n\nCade swallows, looking at his feet.");
			addChoice("We didn't give each other much privacy.", junkCityExplore.bind("cadepartydadothers2"));
		}

		if (which == "cadepartydadothers2") {
			append("\"So everyone— the following— they're...?\"");
			addChoice("Gone.", junkCityExplore.bind("cadepartydadend"));
			addChoice("Not coming back.", junkCityExplore.bind("cadepartydadend"));
			addChoice("I'm sorry, but there is no way in fuck I'll be letting any of them back inside.", junkCityExplore.bind("cadepartydadothers3"));
		}

		if (which == "cadepartydadothers3") {
			append("Cade opens his mouth, brow furrowed.\n\n... Then he shuts it.\n\n\"I um. I better not ask.\"");
			addChoice("Good move.", junkCityExplore.bind("cadepartydadend"));
		}

		if (which == "cadepartydadend") {
			append("He looks like he's about to cry even harder for a moment.\n\nBut then he smiles, wide and wet, even as fresh tears still peek from the corners of his closed eyes.\n\n\"Finally.\"");
			addChoice("Mmm?", junkCityExplore.bind("cadepartydadend2"));
		}

		if (which == "cadepartydadend2") {
			append("His paws clench.\n\n\"I finally know I was wrong.\"");
			addChoice("Mmmmmmmmmm?", junkCityExplore.bind("cadepartydadend3"));
		}

		if (which == "cadepartydadend3") {
			append("Cade scoots over to your tanning chair and slips his paws under your arms, linking them tight just beneath your shoulderblades. He buries his snout in your chest, smearing tiny dark tearstreaks on you. Breeze skitters off the rooftop and pulls its chilly fingers through your hair and his fur— but you don't even feel it, cause you have this furry little heater latched around your front.\n\nHis voice cracks against you:\n\n\"I used to take tranquilizer. Intravenous. Especially in wartime. I put six locks on the front door and sat in the corner of my house for months at a time. I pierced the crook of my elbow and pumped in as much as my body could handle without overdosing and respawning awake. Whenever the curtains teased open and the world started to come back, I would find the needle and a vein and make it go away again for another day or two.\n\nI didn't do it to feel high. I didn't even do it to feel numb. I did it because I felt the island was better off with me slumped in the corner. If I was sleeping, totally inert— then I couldn't disappoint anyone.\n\nBecause, when Cade left...\"");
			addChoice("You thought it was your fault.", junkCityExplore.bind("cadepartydadend4"));
		}

		if (which == "cadepartydadend4") {
			append("\"Yes!\" he squeaks. \"You understand? I knew if I'd messed up, he would've told me— maybe I could fix it— but... but a tiny voice in the back of my skull kept screaming that it was worse than I realized. Cade had never stopped playing without a goodbye, even if he was rushed. There could only be one reason he would disappear like he did: I had fucked something up so badly that he never wanted to speak to me again.\"\n\nSomething high-pitched and warbling rises from his chest and shudders his shoulders. It's not a sob or a wail or anything like that; it's the start of a happy sigh.\n\n\"But it's okay. I know now... I finally know I was wrong. It wasn't my fault.\"");
			addChoice(":,)", junkCityExplore.bind("cadepartydadend5"));
		}

		if (which == "cadepartydadend5") {
			append("He wipes his eyes with the back of his paws, shooting you a sniffly smile right back.\n\n\"Thank you. Sorry, this is a lot at once.\"");
			addChoice("No, it's okay. <3", junkCityExplore.bind("cadepartydadend6"));
		}

		if (which == "cadepartydadend6") {
			append("You hold him in the moonlight for a moment.");
			addChoice("Let's head downstairs. :3", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadepartydadend7") {
			append("He musters up a :3 face and shoots it right atcha.");
			addChoice("Let's head downstairs!", junkCityExplore.bind("cadepartyend"));
		}

		if (which == "cadepartyend") {
			data.cadeMusic = "kitchen";
			data.cadeListeningMusic = true;
			msg("<!img:kink/Music.png> Music: Snazzblaster — by Wronger", true);
			stopChannel("music");
			playSound("assets/audio/music/cade/"+data.cadeMusic, "music", {loops: 999, startVolume: 0.5});

			append("You head downstairs.\n\nThe orgy in the living room has cleaned itself up a little bit. There are still a ton of people fucking and making out everywhere, but at least now it's traversable.\n\nThe cubs clear a path away from the door of the kitchen and into the center of the room, where the boys in the back are setting up a fold-out table.\n\nCade nods to the head chef cub"+(data.glowbunnyLLLStarted?", a little skunk boy who looks ashamed of himself,":"")+" and clears his throat:\n\n\"Ladies and gentlemen and folks in between and folks who don't consider themselves ladies nor gentlemen, possibly because they're such huge sluts they prefer to be called insults over any respectful terms, I present to you: a very kind and cute individual who makes all the right choices in all the right scenes, item-collector, wanderer, and "+pickByGenitals("big-cocked", (data.hasBoobs?"big-breasted":"big-butted"), "big-balled")+" individual, the first player in sixty-six years: "+data.playerName.toUpperCase()+"!\"\n\nApplause rings out!");
			addChoice("Thank you thank you thank you! (Bow.)", junkCityExplore.bind("cadepartyend2"));
			addChoice("What a title.", junkCityExplore.bind("cadepartyend2"));
			addChoice("(Blow kisses to the crowd and wiggle my ass.)", junkCityExplore.bind("cadepartyend2"));
			cadeMusicToggle();
		}

		if (which == "cadepartyend2") {
			var s:MintSprite = addSprite("assets/img/effect/cake");
			s.onHover = showToolTipOnCursor.bind("Artist: Kittery", "\"Don't beat yourself up, "+(data.glowbunnyLLLStarted?"Ivandis, your hands were just tired after all the handjobs... nooo, I promise, the writing looks fiiine... ":"Lana, it's legible! You're getting better! OW!")+"\" — Bins");
			s.y = GAME_HEIGHT*0.5-s.height*0.5;
			s.x = GAME_WIDTH*0.5-s.width*0.5;

			append("The cubs haul out their surprise:\n\nA giant pink cake with... um... a pretty good attempt at a written thank-you on it.");
			addChoice("Dig in. >:3", junkCityExplore.bind("cadepartyend3"));
			cadeMusicToggle();
		}

		if (which == "cadepartyend3") {
			append("You scarf down the cake all messy and wild with the help of the gryphon, some boys from out back, some cubs sprinkled with flour and frosting, a standoffish goth clique, a seagull who makes an effort to deepthroat as much cake as possible in each bite, and Cade, who only takes the tiniest little sliver for himself. <3");
			addChoice("Next x8!", junkCityExplore.bind("cadepartyend4"));
		}

		if (which == "cadepartyend4") {
			data.cadePartyDone = true;
			cadeMusicToggle(true);
			append("... This party turns out to be a supernova after all. You find yourself wandering the streets with an ever-shifting group of people, new members falling into step and old ones falling out every other block. By the time you make it back to Cade's place your glutes are worn out. You need "+(data.violetGryphonStrawberry?"Strawberry Crotch":"the gryphon")+" to haul you up the stairs, and you need to lean on "+gryphJunk("his", "her", "their")+" shoulder while "+gryphJunk("he walks", "she walks", "they walk")+" you to the guest bedroom.\n\n<!i>Goodnight, "+data.playerName+".<!i>\n\nYou flop into bed. "+gryphJunk("He tucks", "She tucks", "They tuck")+" you in.\n\nThen, after "+gryphJunk("he pokes", "she pokes", "they poke")+" the light off with "+gryphJunk("his", "her", "their")+" beak, you snuggle into the blankets and take a colossal, much-needed snoozer. <3");
			addChoice("Move along. <3", junkCityHub);
		}

		if (which == "ExploreTrashCan") {
			unlockJournal("Trash can goobeast");
			append("A trash can mewls at you.\n\n... There's a suspicious trail of Capsules leading toward it.");
			if (canGain) addToItem("Capsule", 4);
			addChoice("Lift the lid.", junkCityExplore.bind("lift lid"), {kinks: ["Trash"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "lift lid") {
			append("Two eyes glint from the bottom.\n\nA sludgy black arm with no elbow joint shoots up, grabs your wrist, and pulls you in face-first. You hold your breath as black gunkmulch envelops your face, morphing to fit the shape of your body, dragging you deeper than the can is tall.\n\nTendrils of "+(isActive("Candy Ring")?"taffy":"ooze")+" prod politely at your lips.");

			addChoice("Struggle.", junkCityExplore.bind("struggle"), {kinks: ["Snuff"]});
			addChoice("Do the chinese finger trap strat and don't move at all.", junkCityExplore.bind("dont move"));
		}

		if (which == "struggle") {
			append("You thrash around, limbs swinging through "+(isActive("Candy Ring")?"sweet tangy taffy":"viscous slime")+" where there should be metal. The first few globules pop through your lips at the moment they happen to slacken. Your tongue "+(isActive("Candy Ring")?"basks in the chewy yummy flavor~!":"shrinks back under the zesty rot onslaught.")+"\n\nOnce more your gut reaction fucks you over; you yelp and "+(isActive("Candy Ring")?"moan at the succulent taste":"promptly swallow a couple gallons of sewersauce")+", and with sudden sentience the goo at your lips forms a near-solid gag ring.\n\nThe "+(isActive("Candy Ring")?"tangy":"black")+" flow soon bloats both your lungs, writhing its way into the deepest never-caressed corners of your innards. Between your legs a long "+(isActive("Candy Ring")?"taffy":"garbo")+"tentacle worms its way down your urethra and starts humping you.\n\n"+pickByGenitals("Your consciousness fades with a quivery cum, the goo absorbing every glob...", "Your consciousness fades with a quivery squirting cum, the goo absorbing every drop of it.", "Your consciousness fades with a quivery cum, the goo absorbing every glob..."));

			addChoice("Next.", junkCityExplore.bind("trashnext"));
		}

		if (which == "trashnext") {
			append("You respawn next to the trash can, blinking.\n\n");

			if (data.hasCock || data.hasBoth) {
				append("It spits out a tiny version of the goo monster inside with nubbly little arms and legs. In its translucent chest, you spot your "+(isActive("Mood Ring")?getMood("You"):"")+"cum.\n\nIt waddles away.");
				addChoice("So that's how garbo babies are made.", junkCityHub);
				addSprite("assets/img/effect/garbochild.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Fun fact: this little shit was scribbled out 5 seconds before the update went live.");
			}

			addChoice("Move along.", junkCityHub);
		}

		if (which == "dont move") {
			append("You keep still and give the "+(isActive("Candy Ring")?"taffy":"trash")+" demon no temptation.\n\nAfter a few more prods it seems to understand you're not down to get "+(isActive("Candy Ring")?"candy":"ooze")+"fucked and spits you back out.");

			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreParkingLot") {
			append("A graying reflective-vested doberman slaps two citation stickers on a tiny car parked awry.\n\nFrom the double-doors of the cafe adjacent a rabbit bursts out, fat satchel trailing letters, and starts begging him to waive the ticket. The doberman crosses his arms and stands firm.\n\n\"Please,\" she says, \"I'll do <!i>aaaaaaanything<!i>~!\"\n\nHe caves immediately.");

			addChoice("Watch.", junkCityExplore.bind("parkinglotwatch"), {kinks: ["Male", "Female"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "parkinglotwatch") {
			append("He lays her on the hood of her car and smooches her against the windshield, her citations fluttering into the grille of a sewer drain. Only a couple people bother to glance as he grips her by both ears and hotdogs the lips of her pussy; the rest, you gather, have seen this shit going down in the middle of the street too many times to care.");

			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreSeptricas") {
			Septricas.septricasExplore();
		}

		if (which == "ExploreDumpsterDrown") {
			unlockJournal("Dumpster");
			append("The sweet, salty, grimy odor of refuse pours from a dumpster overflowing with unbagged garbage and an aura of advanced decay. Fevered pants come from inside...");

			addChoice("Examine dumpster.", junkCityExplore.bind("examine dumpster"), {kinks: ["Guest Writer", "Male", "Female", "Trash", "Abuse", "Snuff"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "examine dumpster") {
			msg("<!img:kink/Guest Writer.png> Guest Writer: Tholmier", true);
			append("As you focus, two heads pop out above the rim, both panting. The first, a hyena, rocks back and forth, pushing little waves of liquid sludge around as he repeatedly drives the head of the second, a feline, under the muck, giving her barely a second to catch her breath each resurfacing. You wonder if he's using a garbage bag as a condom...\n\nCareful not to startle the lovebirds, your sex beginning to ache with arousal, you watch the hyena break the rhythm and hold his partner's face under the grime for good. It strikes you that it really is just a pool of garbage juice in there; the cat bitch can't get a hold of anything solid, her limbs making sloshing around pointlessly as she flails and thrashes for breath. The hyena clearly doesn't give a shit; his rockings get faster and harder, the trashslop undoubtedly lubing the rape up, her skull clanging against the metal dumpster with each violent thrust.\n\nYou can't help but quietly "+pickByGenitals("stroke yourself", "push a finger over your clit", "stroke yourself with one hand and drag a finger over your clit from the other")+" while you watch the cat's struggles weaken with each thrust until eventually the sludge is still save for the gentle floppings of her limp body and the clangs of her skull against metal.\n\nOnly now does the hyena let her up, kissing her mouth as maggoty filthglobs pour from it, shuddering as he cums inside her. After a tender little moment with her corpse he swings himself out over the side of the dumpster, shakes himself off to lose the thicker strings of seaweed-like garbage clumps, and casually walks off still coated in filth.");

			addChoice("Check her out.", junkCityExplore.bind("check her out"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "check her out") {
			append("You peer into the dumpster, eyes wide and hands sticky. The cat's wearing a collar and she's got goggles strapped over her lifeless emerald eyes, still rolled back with panicked pleasure. As she floats in the trash bath her body turns itself over in a near-paranormal display of sluttery, her shiny filth-slick ass bobbing up to the surface; it seems a broken bottle was shoved inside mid-coitus, which would've surely led to a delightful infection had she survived.\n\nShe comes up behind you with a fresh, tight new body. \"Enjoy the show?\"");

			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreTeenStripper") {
			unlockJournal("Teen stripper");
			append("Girly guttural gags echo out from an alleyway behind a strip club; the garish neon sign rambles about HERBIVORES "+(!onFA()?"and TEEN & PRETEEN ":"")+"and 2 CAPS 2 WATCH, 2 CAPS 2 FUKK...");

			addChoice(
				"Investigate the gags.",
				junkCityExplore.bind("investigate gags"),
				{kinks: ["Cub", "Male", "Intersex", "Scat", "Vomit"], faCensor: true, give: ["Capsule", 2]}
			);

			addChoice("Move along.", junkCityHub);
		}

		if (which == "investigate gags") {
			append("You peek around the corner.\n\nA femmy bunny teen sits on violet heels, the thread of his thong snug to the side of his fat "+(isActive("Candy Ring")?"cake":"shit")+"-stained pucker, looking up with his maw wide to the source of the gags: a herm zebra. She's driving three striped fingers down her throat with one hand and holding the bunny by the hair with the other, keeping his face up, grinding the head of her cock along his neck, painting it with fat globs of "+(isActive("Candy Ring")?"":"rancid yellow ")+"pre.\n\n\"Give 'im that fuckin' zeeb "+(isActive("Candy Ring")?"tummycandy":"slop")+",\" a shadowy cat with a Pastel Ring earring says, leaning on a dumpster and taking a long drag on his cig. Someone else out of sight gives a woop as the zebra's gags finally reach a fever pitch and she yanks her fingers out to send a waterfall of "+(isActive("Candy Ring")?"\"tummycandy\"":"hot puke")+" over the teen's face, his little bunny poof quivering as he chugs it.\n\nShe finishes up and tosses two caps at him. He doesn't even notice.\n\n... Well, you take em, then...");

			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreSewerSuburbs") {
			SewerSuburbs.sewerExplore("explore");
		}

		if (which == "ExploreLLL") {
			LLL.libraryExplore("explore");
		}

		if (which == "ExploreBreedMe") {
			unlockJournal("Breed Me");
			if (!data.leakyHillsVisited) append("A cute dog smelling vaguely of pee");
			else append("Oni the dog (still smelling like pee)");
			append(" sits collared and leashed outside a greasy restaurant called <!i>Marlene's Dive.<!i> A little heart pendant hangs from his collar...");
			addSprite("assets/img/effect/breedMe.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Font: Exmouth");
			addChoice("Check out the menu.", junkCityExplore.bind("breedme1"), {kinks: ["Patreon Commission", "Male", "Piss"]});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "breedme1") {
			if (!data.leakyHillsVisited) temp.dog = "the dog" else temp.dog = "Oni";

			append("You snag a menu from a little box outside, spying on "+temp.dog+" over the top. Two bull guys stumble out from the restaurant's bar, both with a handful of semi-soft cockmeat pointed directly at the tied-up dog.\n\n\"Open up, Oni.\"\n\nThey drench his face before he can~");

			addSprite("assets/img/effect/breedMePee.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Edit: Kittery");
			addChoice("Next.", junkCityExplore.bind("breedme2"));
		}

		if (which == "breedme2") {
			append("Once all the taps are dry and Oni's fur is soaked a rich golden, the bulls head back inside. Not long after, he offers his ass to a pent-up hung-to-his-knees hyena dad in exchange for one measly sweetgrass cigarette, then, not long after that, he offers his mouth to a homeless beaver turned away by restaurant staff (only paying customers may use the indoor restroom, sir) in exchange for a light.\n\nOni leans back and spreads his legs, revealing a fucked-open, piss-soaked, quivering hole. The fingers holding his cig, however, are perfectly still.\n\nThe beaver squats and with a thumb wipes some yellow from the corner of Oni's maw. His other thumb works the lighter.\n\nOni inhales deep, thanks him, and takes one long, relaxing drag.");

			addChoice("Read the menu.", junkCityExplore.bind("breedme3"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "breedme3") {
			append("<!i>APPETIZERS\n\n~ Breadsticks --- 7C\nTwo fresh-baked breadsticks plunged repeatedly into both lower and upper oven racks.<!i>\n\nThe drunk bulls spill outside again, both bored with the atmosphere in the restaurant now they've had a taste of this handy little tied-up breeding station. After working up his whiskey dick by hotdogging Oni— dragging his warm, squishy-soft cock up and down between that fat puppybutt— the one behind twists Oni's leash around his wrist and pulls him back sharp, hilting his cock easily. The other bull casually flicks the hard-earned cig from Oni's lips, wraps a hand around the back of his neck, and pulls his face down, down, until that flat bovine cockhead smears pre lipstick over Oni's maw.\n\nThey high-five and crank their hips back and forth in a brutal rhythm, doublefucking the doggy's ass and throat down to their flares, yanking his body around like he's a puppet until they get him in the perfect spitroasting position~");

			addChoice("Lick my thumb and turn the page.", junkCityExplore.bind("breedme4"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "breedme4") {
			append("<!i>ENTREES\n\n~ SLOPPY JOES (soon to be removed; limited time offer!!!) --- 20C\nA heaping mess of feral bull beef straight from Bright Forest farmland, cooked to perfection and slapped between two greasy, toasted buns.<!i>\n\n\"Can't believe he's out in public wearing a collar like that,\" the bull at the back growls, unplugging his cock from the dog's pucker with a <!i>pop<!i> and slapping it down between his greasy buns to harden himself up again. Something about feeling Oni's pucker twitch on the underside of his cock clearly pushes some special buttons.\n\n\"Yup,\" the other says, caressing Oni's chin with a hand, meeting his eyes. \"You want us to breed you so bad you gotta announce it to the whole world, huh?\"\n\nHe blows a jet of steam from his snout and grabs Oni's pendant and collar in a fist, yanking the poor dog's face down til his nose squishes up against the bull's gut and his long doggy tongue is forced to lap over his nuts. Oni's throat gags and works over the guy's bullcock, bulged so tight you can see his flare from here.\n\n\"Nnnn... nnn-hnnn...\" Oni manages, his own cock twitching as the bull behind him rams back inside.\n\n\"Fine,\" he says, grabbing hold of Oni's fluffy tail. \"If you reaaaaalllly want... we'll breed you.\"\n\n\"NNhn! Nnnnhhh!!\" Oni howls past a throatful of bullcock, wiggling his butt all sexy-like for the boys, shaking off random droplets of piss from his fur~");

			addChoice("Flip to the last page.", junkCityExplore.bind("breedme5"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "breedme5") {
			if (!data.leakyHillsVisited) temp.rat = "a familiar rat" else temp.rat = "Roddy the rat";
			append("<!i>DESSERTS\n\n~ VANILLA MILKSHAKE --- 25C\nA devastating tummyful of creamy white goodness. Please ask your server if you'd like it in a cup or from the tap.<!i>\n\n\"HRRRRRRRRRRRRRRRRRNNNNNNNNNNGH~\"\n\nThe bull behind Oni spears his ass to the hilt and then a little more, wiggling his hips to fit every last possible micrometer of cock up the shivering pup's pucker, doing huge guttural <!i>HRNNNNGHS<!i> with each rope of "+(isActive("Mood Ring")?getMood():"")+"cum he shoots.\n\n\"Dude... you don't have to do that every time you—\"\n\n\"—HRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR—\"\n\n\"Let the guy enjoy himself,\" a customer says, and you turn to notice all the ruckus has drawn a crowd. This whole time Oni's been holding his breath on a throatful of cock, but a vibrant blush overrides any blue in his face— the bystanders are all 100% focused on him, hands all over their own cocks and cunts, none sparing even a glance for the owner of the bullcock currently plunging merciless in and out of his ass, spilling fat globs of equine cum over his thighfur. Whether from nerves or some sense of pride Oni's tail starts wagging furiously in the bull's grip, and his paws leap up to the other bull's nuts to start massaging them while he drags his maw quick as he can over the guy's cock, bouncing his throat over that flat horselike cockhead and making the cutest little <!i>glrkk hrrrrk chrrrp<!i> sounds in the process~\n\nHe doesn't last long after that. With a near-release grimace he grabs Oni by both floppy ears and starts fucking his face like it's just another butt, not caring how hard his fucktoy's snout bounces against his stomach or how sore his neck might be afterward from the bull's nuts constantly banging against it; all he cares about is breeding Oni as hard and deep as he possibly can. The throbs of his urethra show clear to everyone through Oni's bulged throatflesh, making it obvious that he's getting pumped full of hot cum from this end too. A few from the crowd step forward shyly to scoop "+(isActive("Mood Ring")?getMood():"")+"cum from either end of the pup, then bring their fingers up to his ears, his face, wiping them clean on the few precious clean patches of fur he has left.\n\nOnce they're both spent the bulls head home for the night, their cocks slipping with embarassing ease from both holes, leaving each gaped and cum-drenched.\n\n\"Good breeding toy~\" "+temp.rat+" purrs, stepping from the crowd to take his turn. Oni groans at the sight of him, spreading his legs automatically...");

			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreLookout") {
			append("A man and his son pull their convertible up to a wooded lookout. The kid was driving.");
			addChoice("Listen.", junkCityExplore.bind("lookoutlisten"), {faCensor: true});
			addChoice("Move along.", junkCityHub);
		}

		if (which == "lookoutlisten") {
			stopChannel("music");
			data.currentSong = "";
			msg("<!img:kink/Music.png> Music: Late Night — by Wronger", true);
			append("The radio clicks on, playing something simple and electronic from Mikey J's <!i>LATE NIGHT LOOPS<!i>. They snuggle up, arms around each other, watching a cloud eat the moon. Its shadow snuffs the reflective recycled-plastic cul-de-sacs sprawled from here to the City's battlement wall, one by one.\n\n");

			playSound("assets/audio/music/rotatoTomato", "rotatoTomato");
			timer(46, function() {
				if (getStoryText().indexOf("The radio clicks on") == -1) return;
				append("\n\nThe cub thumbs OFF and pulls his dad into the backseat. \"This station's always so boring...\"\n\nEven after the convertible's hood flips up you still hear the boy's deep purring.");
			});

			addChoice("Move along.", function() {
				stopChannel("rotatoTomato");
				junkCityHub();
			});
		}

		if (which == "ExploreSnagglebank") {
			setLocation("Snagglebank");
			append("You follow a trickle of "+(isActive("Mood Ring")?getMood():"")+"cum through the gutter. It leads you to the <!b>SNAGGLEBANK.<!b>\n\nThe building's walls are the source; they're made of old marble chunks, bleeding jizz from the cracks where they're frankensteined together.\n\nThe entrance is a set of double-doors and a plateau on which a trio of homeless hyenas loiter, asking people who go in and out for a cap, just one cap, come on man.");

			addPlace("Snagglebank", "A cum-coated sperm bank/cap bank/blood bank/abortion clinic tucked away among the alleymaze of the City.", "Junk City");
			addChoice("Head inside.", junkCityExplore.bind("snagglebank interior"));
			addChoice("Stay outside.", junkCityExplore.bind("snagglebank exterior"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "snagglebank exterior") {
			append("You look around outside the <!b>SNAGGLEBANK.<!b>\n\n");

			if (!data.hyenaDone) {
				append("\n\nThe hyenas are beckoning you.\n\n");
				addChoice("Talk to the hyena boys.", junkCityExplore.bind("hyena1"));
			}

			if (!data.dragonHermDone) {
				temp.a0 = "The trickle of cum that led you here has another source: a butt-naked dragon herm, her belly looking pregnant, all ahegao sprawled out on the bank's steps.";
				temp.a = "Visit the dragon.";
			} else {
				temp.a0 = "The dragon looks preggo again~ That was quick. As usual, she's yanking her dick with rapid passion to keep herself busy while strangers pass her by.";
				temp.a = "Go for another round!";
			}

			append(temp.a0+"\n\n");

			addChoice(
				temp.a,
				junkCityExplore.bind("dragonherm1"),
				{kinks: ["Patreon Commission", "Intersex", "Pregnancy", "Piss", "Scat"]}
			);

			if (!data.velmanDone) {
				append("Two (also hyena) hobos share furtive glances down the alley next to the bank. One slips out something small and cute from his duffel bag. Stolen goods!?\n\n");
				addChoice("Investigate stolen goods.", junkCityExplore.bind("velman"), {kinks: ["Baby", "Male", "Male", "Female", "Blood", "Gore", "Snuff", "Blood", "Gore", "Snuff", "Blood", "Gore", "Snuff"], faCensor: true});
			}
			
			addChoice("Head inside.", junkCityExplore.bind("snagglebank interior"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "snagglebank interior") {
			playSound("assets/audio/environment/caveDoor");
			append("You look around inside the <!b>SNAGGLEBANK.<!b>\n\nThe star-shaped lobby is packed with customers and clerks. Crystal prisms hang from the ceiling, casting everything in spots of flourescent rainbow. In the center of the room stands a ten-foot statue of a crocodile in a wifebeater, no pants, fat cock hanging out, slouching, one hand scratching his ass and the other flashing a thumbs-up. His nuts are worn smooth and shiny from all the people who rub them for good luck. There's a plaque beneath:\n\n<!b>\"I GOT A FUCKIN DEAL FOR YA.\"<!b>\n<!i>— SNAGG Le TOOTH, C.E.O.<!i>\n\n");
			if (data.bankSnaggAbuse < 3) append("There's a fat green door opposite you, locked by card reader.\n\n");

			if (data.roxVisits == 0) {
				temp.r = "a futa cow politely squeezes her girth past you, her sheepdog";
				temp.r2 = "the cow";
			} else if (data.roxVisits == 1) {
				temp.r = "Roxelle the cow waves and squeezes past you with her sheepdog Bert";
				temp.r2 = "Rox";
			} else {
				temp.r = "Roxelle scoops you up in a surprise hug, whispering a happy hello. She's got Bert";
				temp.r2 = "Rox";
			}

			if (!data.bloodBankVisited) {
				append("There's a blood bank to the left hanging under crimson crystals, sectioned off by a door with a bunch of warnings.\n\n");
				addChoice(
					"Visit the blood bank.",
					junkCityExplore.bind("bloodbankhub"),
					{kinks: ["Gore", "Blood", "Snuff", "Gore", "Blood", "Snuff", "Gore", "Blood", "Snuff"]}
				);
			}

			if (!data.roddyWithdrew || !data.roddyDeposited) {
				append("There's a sperm bank down one of the star's points. Two rats stand in glass-walled booths under two signs: DEPOSIT and WITHDRAW.");
				addChoice("Visit the sperm bank.", junkCityExplore.bind("roddybank1"), {kinks: ["Patreon Commission", "Male", "Male", "Scat"]});
			} else if (!data.roxBankTrigger) {
				data.roxBankTrigger = true;
				unlockJournal("Sperm bank 2");
				append("Just as you leave the sperm bank, "+temp.r+" leashed close behind. He's elated to be here, his tongue flopping around like crazy, shooting doggy-smiles at everybody he sees. The seagull teller practically lunges over her counter to lavish some pettings upon him. \"He's SOOOOOooo cute~!\"\n\n\"Hear that, Bert?\" "+temp.r2+" asks him. He's on his back, fat-knotted cock out already, lifting his paws up for belly rubs. \"Yup,\" "+temp.r2+" says. \"You heard it alright. Don't spoil him too much, ma'am. He's already getting his weekly treat...\"\n\nAfter a good rubbing she pulls him away to Jakky's side of the sperm bank: DEPOSIT.");
				addChoice("Go watch the dog show~", junkCityExplore.bind("roddyferalfuck"), {kinks: ["Male", "Scat", "Feral"]});
			}
			if (data.bankSnaggAbuse < 3) addChoice((data.bankSnaggAbuse==0?"Green door.":"Crawl back to Snagg..."), junkCityExplore.bind("snaggdoor"), {kinks: ["Patreon Commission", "Male", "Raunch", "Trash", "Abuse"]});
			addChoice((data.bankAccountOpened?"Check Savings.":"Open a savings account."), junkCityExplore.bind("savings"));
			if (!data.seagullAskedMoon && data.hoveredMoon && !data.moonUnlocked) addChoice("Ask the seagull to fly me to the moon.", junkCityExplore.bind("moonfly"));
			addChoice("Head outside.", junkCityExplore.bind("snagglebank exterior"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "moonfly") {
			data.seagullAskedMoon = true;
			append("She just laughs in your face. \"No, I'm not a taxi. Why do you even want to go up there? You know it's basically just a big worthless balloon, right?\"");
			addChoice("I dunno, it's a player thing... I got locked areas, I wanna unlock em.", junkCityExplore.bind("moonfly2"));
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "moonfly2") {
			append("The next customer bustles past you, since you aren't doing any banking. She leans out to the side and continues her conversation anyway, tone snarky:\n\n\"Exercise some restraint. There's nothing up there but some tech scrap that Som left behind last time I flew him up. Probably the most boring evening I've ever spent with a cub in my life. The place is baaaare.\"\n\nThe customer raps his fingers on the counter. \"Can I get some service, here?\"\n\n\"Fine,\" she snaps. \"Put your fingers away. Don't gotta be rude about it.\"");
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "velman") {
			msg("<!img:kink/Guest Writer.png> Co-Writer: Cpt. Velman", true);
			data.velmanDone = true;
			unlockJournal("Velman Bank");
			append("It's a little female Fuckmeat baby bear, her paws wandering up and down her fat butt like she's straight off a toilet paper commercial.\n\nShe's turning her head to look back and forth, her eyes all bright and full of wonder; but she isn't taking in the bustle of this big wide world outside the duffel bag, no, she's just looking from one fat hobo cock to the other. Her little maw waters, and her steps toddle pointlessly as they lower her to the filthy alley floor. She reaches out and gropes their cocks to keep her balance— which prompts them both to shake their heads with incredulity at each other, mumbling about just how much of a babywhore she is.\n\nOne of the guys slaps her across the face while the other gropes her fat little thighs, threading his big fingers up into the crack between them.\n\n\"What's the exchange rate? Two of her for one cap?\"\n\n\"Yah... pretty shitty. I ain't brave enough to take another from the bull's place, either. That dude is scary.\"\n\n\"Man, this is fucked. Took us all day just to—\"\n\n\"I know, man,\" the other interrupts out of frustration, \"took us all day just to get the one. You said it five times already.\"\n\n\"Man... I hate it when you interrupt me... hurts my feelings, seriously...\" the first says, slapping her extra hard across the face once more as a form of venting. She giggles and holds her bright red cheek out for another one. \"Let's not even trade her in. She's worth more to us as a little stress reliever.\"\n\nThe other lights up with a grin. \"... Yer right. Let's get inside. Nice white tile to smear her blood on, right?\"\n\nShe smiles up at both of them with big wide eyes and slapped-rosy cheeks.\n\nThe other guy smiles right back at her. \"... Fuck yeah.\"");
			addChoice("Follow them inside.", junkCityExplore.bind("velman2"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman2") {
			append("You sneakily tail the pair inside.\n\nThey slip into the bloodbank section and tuck themselves into a secluded little corner.\n\nIt's cold and clinical in here. They open the duffle bag and dump the baby out face-first onto the floor like she's just some random cargo.\n\nBut they can't start just yet. First they start bickering again, about some bullshit, about their feelings and how much it hurts to be interrupted. Beneath all that their real issues start to surface.\n\nThe deep-seated stress of not being able to stop having sex long enough to hold down even the cheapest apartment; the stew of ennui festering up from the corners of their minds, a stew that had been churning and bubbling since the day they finished exploring every fetish they could imagine and started the laborious, daily routine of finding some sex act that they had at least mostly forgotten about, to keep themselves from going stir-crazy; and, lastly, since gay sex with each other was their solitary goal for so long that it became the new vanilla, they now have to deal with the sexual frustrations of a transient life as two inseperable naked straight bros on the road who only give each other blowies when there's absolutely no other choice, which, in itself, is a form of fetishized chastity they cling to as a means of avoiding crippling boredom.\n\nThey clasp hands and do a big tight bro hug. Their cocks grind up against each other, and those old, boring urges resurface. They make a brotherly pact to face their issues head-on, together, like true bros should.\n\nOne decides that plugging the Fuckmeat's drooling, syrupy snatch with his thumb is a good start. The other quickly tugs twice on her little tail, toggling her NPC mode from happy and sexual to whiny and rapeable.\n\nWith that, her entire world implodes. A high-pitched, confused squeal of fear tears from her lips as she squirms and beats on them with her little balled fists.");

			addChoice("... Keep watching.", junkCityExplore.bind("velman3"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "velman3") {
			append("Before she can squirm away, the first guy's thumb sinks down to her little cervix, locking her in place, while the other grinds his massive, floppy cock against her screaming face.\n\nThe other patrons of the blood bank don't bat an eyelash as the girl gets her cunt thumbed in and her womb stretched wider than it's ever been stretched. Her sexy little infant labia is just another piece of meat among dozens getting fucked or slaughtered for donation, although it is one of the few that isn't dripping blood quite yet.\n\n\"How should we end this fucklet?\" the dude grinding on her face asks, his cock hardening up to a full foot and a half, towering over her scared little expression and casting it in shadow. He lets it come down on her with a <!i>THWAP<!i>, breaking her nose and knocking a couple baby teeth out. Her maw opens up to scream, but before much more than a poor little rapetoy squeak can come out, her throat gets jam-packed with dickmeat and split open.\n\nShe beats her fists against him as hard as she can, whining and sobbing around a mouthful of adult cock. She didn't quite interrupt him, but it's clear she's hurting his feelings...");

			addChoice("... Continue to keep watching.", junkCityExplore.bind("velman4"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman4") {
			append("\"Can you believe her?\" he says, humping her face brutally hard with true, genuine hurt in his voice. \"No consideration <!i>at all<!i> for my feelings...\"\n\n\"Here bro- I got a ziptie for you,\" the other hyena hobo says, tucking a couple fingers down his crack and pulling one out of his ass. With one thumb of one paw still digging at the core of her cunt, he uses the other to ziptie her little arms together tight enough to cut off circulation.\n\n\"Unnhh~! Thanks bro! I know you always got my back!\"\n\n\"Job's only half done,\" he says with a grin. \"I think we gotta stuff that throat with another cock if we want her to stop interrupting.\"\n\nThe other guy stops thrusting, his mouth hanging open with shock. \"Bro!!!!!\" he says, and rams forward with excitement, making her gag and scream horrifically. \"Did we ever even do this before?! Is that a totally new idea?!\"\n\n\"Goddamn right it is,\" he cheers, and both of them start high-fiving and smiling like lunatics. \"Year thirty-two we tag teamed a baby throat, year forty-six we took turns fistfucking a baby throat, but man, think about it— we never did <!i>double-throatfuck<!i> one before!!!\"\n\nThey woop and cheer one more time before digging in like two drooling, raving feral hyenas, both grabbing her lower jaw and yanking in opposite directions. With a quick, violent pull and a sickening pop her jaw splits open wide and hangs loose, only held on by a few remaining strands of supple cheek flesh. The hyena who was previously just thumbing her cunt unenthusiastically now attempts to shove his cock down beside his best buddy's, forcing it so hard the flesh of her cheeks begins to strain.\n\nA couple other patrons watch the show with heartwarmed oh-good-for-them smiles. The boys start making out as their cocks bully each other out of that tight baby throat, whispering steamy stuff like \"Quiet now, isn't she?\" and \"Fuck man, you're so creative\" into their mouths.");

			addChoice("... Continue to keep resuming watching.", junkCityExplore.bind("velman5"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman5") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/cubberSplit2.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH-s.width;
				
			append("They woop and cheer one more time— \"Heck ya!\"— before digging in like two drooling, raving feral hyenas, both grabbing her lower jaw and yanking in opposite directions. With a quick, violent pull and a sickening pop her jaw splits open wide and hangs loose, only held on by a few remaining strands of supple cheek flesh. The hyena who was previously just thumbing her cunt unenthusiastically now attempts to shove his cock down beside his best buddy's, forcing it so hard the flesh of her cheeks begins to strain.\n\nA couple other patrons watch the show with heartwarmed oh-good-for-them smiles. The boys start making out as their cocks bully each other out of that tight baby throat, whispering steamy stuff like \"Quiet now, isn't she?\" and \"Fuck man, you're so creative\" into their mouths.");

			addChoice("... Once more, pursue further resuming of continuing to keep on watching.", junkCityExplore.bind("velman6"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman6") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/cubberSplit1.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH-s.width;
				s.y = GAME_HEIGHT-s.height-81;
			append("The BFFs rail the shuddering girl's throat for a while, giddy with the novelty of this experience and, at the same time, a bit sad that they know they'll only have one \"first time.\" That same can-do attitude rushes back to them soon enough, though, and they both make a pact to squeeze as much enjoyment from her sexy little Rapemeat body as they can: they both count to three together, one, two, three— and hilt their fat cocks in her throat at the exact same time.\n\nIt's just too much for her cheeks. They begin to tear at the seams. Drops of blood leak down her otherwise unmarred flesh as she attempts to scream around the invading cockmeat and utterly fails to make more than a cute gurgle of simulated pain, though she does thrash her arms hard enough to split the ziptie.\n\nSomeone from across the room whistles as those soft, once-perfect baby cheeks split open on either side just so her rapists can get a little excitement in their lives, but otherwise no one else seems to even care that she's getting her face noisily doublefucked apart in their midst. The greasier hyena hobo snags a bucket from somewhere and slides it under her face to collect her blood and tears— then he grabs the back of her tiny skull and crams even MORE fat yeen dick down her throat, not even satisfied with ripping her cheeks down the side of her face. She does that lil pain-gurgle again, which of course sounds adorable past two dicks, but more importantly she spreads her tiny thighs open wide, as if begging them to rape her there just so she can get at least one cock out of her throat.\n\nThey both laugh at her and just thrust harder. Drool pours down her immature babytits, mixed all slick and shiny with blood. Her eyes scrunch and roll up into her head.\n\n\"She's on her way out, bro...\"\n\n\"Need someone to wake her up.\"\n\nThey both look at you.");

			addChoice("... You want my help?", junkCityExplore.bind("velman7"));
			addChoice("... Oh, no thanks. This is just a morbid curiosity thing for me.", junkCityExplore.bind("velmanEnd"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velmanEnd") {
			append("\"Bro... "+pickByGender("is he", "is she", "are they")+" judging us...?\"\n\n\"I dunno... are ya?\"");

			addChoice("Well yeah, you're mutilating a fake baby for sexual gratification.", junkCityExplore.bind("velmanEnd2"));
			addChoice("Well no, I respect your tastes.", junkCityExplore.bind("velmanEnd2"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velmanEnd2") {
			append("They try to just ignore you and keep going, but the momentum's gone. They unplug their dicks from the mangled little thing, all morose, and toss her in the donation bin.\n\nThe dude who came up with the idea in the first place starts blubbering. \"Man, we fucked it up... never gonna get a first time like that again... why didn't we just keep it to ourselves...?\"\n\nHis friend claps him around the shoulder supportively. \"Come on, man. This just means we were wrong! We thought we'd done it all fer sure, but turns out we <!i>can<!i> still think of new stuff after all. Tell ya what, let's suck dick for a couple beers and have a brainstorming session in the city drains, just like old times... whaddayasay?\"\n\n\"I'd like that,\" he sniffles. \"I'd like that.\"");

			addChoice("What the fuck was that shit. Back.", junkCityExplore.bind("velmanEnd3"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velmanEnd3") {
			junkCityExplore("snagglebank exterior");
			StoryUtils.quickMynt("Junk City Hobos");
		}

		if (which == "velman7") {
			append("\"Hell yeah "+pickByGender("man! We're trying to be straight these days, but... nothin wrong with a cock like yours now and again...", "girl! We're totally straight, y'know.", "bud! Not sure if you're a girl or a boy, but we kinda swing both ways regardless, so...")+"\"\n\nThe other guy holds off on speaking for a moment in favor of feverish grunts as he yanks the little bear's mouth open even wider and pounds the fuck outta her gullet in a desperate attempt to wake her up... but she's still fading. \"Hurry!\" he says. \""+pickByGenitals("Fuck her cunt!", "Fist her cunt!", "Fuck her cunt!")+"\"");

			addChoice("Awriiiight!!", junkCityExplore.bind("velman8"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman8") {
			append("You bound forward with a slide and stick the landing perfectly, coming to a halt just beneath her limp, pudgy legs. You "+pickByGenitals("whip your dick out so fast the droolbucket flops over", "knock the droolbucket out of the way", "whip your dick out so fast the droolbucket flops over")+" and press your "+pickByGenitals("cockhead", "knuckles", "cockhead")+" against her drooling lips.\n\nYou give the boys a nod.\n\nThey reply by slamming both their knots into that tiny maw, jamming her whole body down onto your "+pickByGenitals("cock", "fist", "cock")+" in the process. Her cheeks cleave completely, like a overstuffed grocery bag, and blood now streams liberally off her face, coating her perky lil baby tits in crimson sheen.\n\nYeah, that wakes her up.\n\nTogether the three of you gangrape her mercilessly, not listening to her scream-gurgles, never giving her more than two seconds to breath through her bruised, snotty snout, and certainly never checking to see if the bucket is overflowing with blood and drool and precum yet.\n\n\"Fuck her insides up more,\" one of them tells you— not even checking to see how fucked up they are already. You guess as long as she's still warm, they aren't fucked up enough.");
			addChoice("Split that babycunt open.", junkCityExplore.bind("velman9"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman9") {
			append("You oblige him and "+pickByGenitals("bottom out", "punch in like you're trying to get a O.H.K.O. on her womb", "bottom out")+", splitting her lower lips open much like upper ones and biting back a groan of cerebral pleasure as hot red Rapemeat blood gushes over your "+pickByGenitals("nutsack", "wrist", "nutsack")+", washing away a bit of grime from some earlier adventures and metaphorically returning you to a state of utter purity. You can feel her tiny womb split open with your first, most gentle little "+pickByGenitals("thrust", "movement of your fist", "thrust")+"— you almost broke the delicate little thing by accident.\n\nWith her fragility in mind you viciously beat her insides up, making her belly bulge out even fatter than it already was with both hyena boys working their dicks down her throat. Now she's starting to go limp again from blood loss and oxygen deprivation, so the boys slow wayyy down, almost lovingly feeding her cock.\n\n\"Here comes the airplane, little bitch...\" one coos.\n\n\"Bad murdertoy... don't die on us yet...\" another chides, sinking his teeth into her soft, furry left ear.\n\nShe goes wide-eyed and shivers back to life with the intense pain~");
			addChoice("Fuck that! "+pickByGenitals("Let's kill this slut on our cocks, my dudes!", "Choke this slut out on your cocks, my dudes!", "Let's kill this slut on our cocks, my dudes!"), junkCityExplore.bind("velman10"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman10") {
			cumEffect();
			append("\"Oh FUG~!\" they shout, titillated beyond belief. \"Okay okay you're right! It's time! C'mere, cunt...\"\n\nHer tiny, destroyed cunt wrings your "+pickByGenitals("cock", "fist", "cock")+" so tight it forces you to "+pickByGenitals("spill your seed deep within her abdominal cavity. You slap your hips up against that bubbly, cushiony baby ass, leveraging yourself against the tile floor to thrust harder and force her to take those two fat yeen cocks right down to the pit of her overstuffed belly", "squirt, which you only barely manage to catch in the bucket", "spill your seed deep within her abdominal cavity. You slap your hips up against that bubbly, cushiony baby ass, leveraging yourself against the tile floor to thrust harder and force her to take those two fat yeen cocks right down to the pit of her overstuffed belly")+". With a silent, primal yawn of pleasure, one of the guys slips their dick right down her trachea and gives her tiny underdeveloped lungs a nice warm lake of cum to drown in.");
			addChoice("Finish her.", junkCityExplore.bind("velman11"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman11") {
			append("The hyena who hasn't cum yet ignores you both to lean over and make eye contact with her. Well, she can't really look at him since her eyes are tearing over and covered with sweat and drool and cum, but she tries her best. \"You want us to toggle you back for the big finale?\" he asks, mostly for his own pleasure, since he knows she can't respond. \"Huhhh? Course you don't, rapetard. You wanna keep screaming on our dicks til the very end.\"\n\n\"Fuck yeah she does!\" the other one grunts, two-handing her little skull and fucking her so hard she can't even cry or gurgle anymore; instead, her struggles lapse into silent, pathetic little death seizures as she gets triple-raped to pieces. Each one of you grabs a handful of her like she's just a furry little onahole, digging your fingers (or claws, in their case) into whatever supple chunk of babymeat you care for at the time, and then all together you thrust forward and pack her so full of adult dick "+pickByGenitals("", "and knuckles ", "")+"she doesn't even look like anything more then a string of loose gore. Blood and cum explode in a frothy pink mess from both ends, and with a final adorable shiver, she dies.\n\nThe hyena dudes unplug and clean eachother's cocks off with passionate slurps. They can stomach the boredom of gayness if it means slurping chunks of cubguts off a frenulum, you guess.\n\nAt the very end of it all they dump little corpse into the bucket and bring it up to the counter. Her skull bounces off the rim with a happy little ~clang.~");
			addChoice("Yo, can I get a cut of the payout? I did help.", junkCityExplore.bind("velman12"));
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "velman12") {
			append("Hopeful in their afterglow, they ask the seagull receptionist how much she's worth, even though this is usually a donations-only kinda thing.\n\n\"Oh, boys,\" the seagull says, shaking her head. \"Isn't it obvious? She's worthless! <3\"");
			addChoice("Back.", junkCityExplore.bind("snagglebank exterior"));
		}

		function updateAccount() {
			var text1:String = "";
			var text2:String = "";
			var tier:String = "";
			var timePassed:Float = 0;
			var gainedCaps:Int = 0;

			if (data.storedCaps < 1) {
				data.timeSinceTouched = 0;
				text1 = "Account Balance: <!b>"+data.storedCaps+"<!b> Capsules";
			} else if (data.storedCaps > 0) {
				if (!data.justCheckedBank) {
					data.justCheckedBank = true;
					//Get time since you loaded
					timePassed = getTimer() - data.gameLoadedAtProgramTime;
					//If you've touched the amount of caps since your last load, get that time instead
					if (data.timeSinceTouched > 0) timePassed = getTimer() - data.timeSinceTouched;
					//Get the amount gained since then
					gainedCaps = Math.round(Math.pow(data.storedCaps*(data.passagesVisited*timePassed*0.001), 0.1));
					//Check the cap an
					if (gainedCaps + data.storedCaps > 500) gainedCaps = 500 - Math.round(data.storedCaps);
					//Reset timeSinceTouched
					data.timeSinceTouched = getTimer() - data.gameLoadedAtProgramTime;
					//If you've actually gained more than some decimal points, display how much
					if (gainedCaps > 1 && data.storedCaps < 500) {
						text2 = "\n\nYou've accrued <!img:item/Capsule.png> <!b>"+gainedCaps+"<!b> Capsules in interest.";
						data.storedCaps += gainedCaps;
					} else if (data.storedCaps >= 500) {
						text2 = pickOne(["The seagull clears her throat.\n\n\"Snagg says you're making too much money. Sorry,   <!img:kink/Snuff.png>   <!b>Big Killa.<!b>   <!img:kink/Snuff.png>  He's the boss.\"", "Your account has maxed out.", "You smack your account around a little bit, but no Capsules fall out.", "Your Capsules are capped!", "The seagull tosses you an apologetic wince. \"Sorry, we um... we ran out...\""]);
					}
				}

				//Display the amount & tier
				tier =
					data.storedCaps < 25 ? "<!img:kink/Baby.png>   <!b>Lil Bitch<!b>   <!img:kink/Baby.png>" :
					data.storedCaps < 50 ? "<!img:kink/Cub.png>   <!b>"+pickByGender("Boy Scout", "Girl Scout", "Slightly Larger Bitch")+"<!b>   <!img:kink/Cub.png>" :
					data.storedCaps < 75 ? "<!img:kink/Feral.png>   <!b>Fiesty Chihuahua<!b>   <!img:kink/Feral.png>" :
					data.storedCaps < 100 ? "<!img:kink/Art.png>   <!b>Starving Artist<!b>   <!img:kink/Art.png>" :
					data.storedCaps < 125 ? "<!img:kink/Guest Writer.png>   <!b>Starving Writer<!b>   <!img:kink/Guest Writer.png>" :
					data.storedCaps < 150 ? "<!img:kink/Foodplay.png>   <!b>Fat Cat<!b>   <!img:kink/Foodplay.png>" :
					data.storedCaps < 175 ? "<!img:kink/Hyper.png>   <!b>Lord Erectoid<!b>   <!img:kink/Hyper.png>" :
					data.storedCaps < 200 ? "<!img:kink/Pregnancy.png>   <!b>Mother of us All<!b>   <!img:kink/Pregnancy.png>" :
					data.storedCaps < 225 ? "<!img:kink/Piss.png>   <!b>The Golden Sage<!b>   <!img:kink/Piss.png>" :
					data.storedCaps < 250 ? "<!img:kink/Raunch.png>   <!b>Ultimate Mega Stankmeister<!b>   <!img:kink/Raunch.png>" :
					data.storedCaps < 275 ? "<!img:kink/Blood.png>   <!b>Hot Blooded<!b>   <!img:kink/Blood.png>" :
					data.storedCaps < 300 ? "<!img:kink/Gore.png>   <!b>Evisceratops:<!b> Violent Dino   <!img:kink/Gore.png>" :
					data.storedCaps < 400 ? "<!img:kink/Vomit.png>   <!b>The Chunkster<!b>   <!img:kink/Vomit.png>" :
					data.storedCaps < 499 ? "<!img:kink/Snuff.png>   <!b>Big Killa<!b>   <!img:kink/Snuff.png>" :
					"<!img:kink/Plot.png>   <!b>Book Cooker<!b>   <!img:kink/Plot.png>";
				text1 = "Account Balance: <!img:item/Capsule.png> <!b>"+data.storedCaps+"<!b> Capsules\n\nAccount Tier:   "+tier;
			}

			append(text1+text2);
		}

		if (which == "savings") {
			if (data.bankAccountOpened) {
				updateAccount();
			} else {
				var name:String = data.playerName.toUpperCase();
				data.bankAccountOpened = true;
				append((data.seagullDone?"Hey, it's that gullgirl from the landfill.\n\n\"Heyyyyyyyy~!\" she says, leaning over the counter on both elbows, completely disregarding the customers trying to get her attention down at the other end. \"It's me, that gullgirl from the landfill!\"":"The gullgirl behind the counter is a little flattered that you'd go right up and ask her about spreading a savings account wide open like that.")+"\n\nShe coaxes some digits into "+(data.foundShop?"an AUTO-MYNT screen, sort of like the AUTO-SHOP but built for banking":"a little computer thing called an AUTO-MYNT")+".\n\n\"There y'are,\" she says, swivelling the screen around:\n\nAccount Name: <!b>"+name+", THE "+pickOne(["ULTRACUTIE", "GALAXY WIZARD", "MEGASLUT", "BIG-BUTTED", "SUGARPUSS", "SWEET BEAN", "DANKEST", "DORBSTER"])+"<!b>\nAccount Balance: <!b>0<!b> Capsules\n\n\"Oops,\" she chirps, backspacing that last part. \"How'd that get in there...\"");
			}
			addChoice("Deposit.", junkCityExplore.bind("savings deposit"));
			addChoice("Withdraw.", junkCityExplore.bind("savings withdraw"));
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "savings deposit") {
			var capsuleSlider:Slider;
			var amount:Int = 0;
			updateAccount();

			if (getItem("Capsule").amount > 0) {
				capsuleSlider = sliderCreate(400, 0, function() {
					amount = Math.round(capsuleSlider.percent*getItem("Capsule").amount);
					capsuleSlider.label.setText(amount+"C");
				});
				hookClear(function() {
						sliderDestroy(capsuleSlider);
				});

				capsuleSlider.bar.x = 200;
				capsuleSlider.bar.y = 400;
				sliderAlign(capsuleSlider);

				hookClear(function() {
						sliderDestroy(capsuleSlider);
				});

				capsuleSlider.handle.onReleaseOnceAnywhere = function () {
					clearChoices();
					addChoice("Deposit <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.", function () {
						data.timeSinceTouched = getTimer();
						data.storedCaps += amount;
						msg("Deposited <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.");
						junkCityExplore("savings deposit");
					}, {enabled: amount!=0, hideCost: true, cost: ["Capsule", amount]});

					addChoice("Back.", junkCityExplore.bind("savings"));
				}
				var amount:Int = Math.round(capsuleSlider.percent*10);
			} else {
				append("\n\nYou don't have any Capsules to deposit.");
			}

			addChoice("Deposit <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.", function () {
				data.timeSinceTouched = getTimer();
				data.storedCaps += amount;
				msg("Deposited <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.");
				junkCityExplore("savings deposit");
			}, {enabled: amount!=0, hideCost: true, cost: ["Capsule", amount]});

			addChoice("Back.", junkCityExplore.bind("savings"));
		}

		if (which == "savings withdraw") {
			var capsuleSlider:Slider;
			var amount:Int = 0;
			updateAccount();

			if (data.storedCaps > 0) {
				capsuleSlider = sliderCreate(400, 0, function() {
					amount = Math.round(capsuleSlider.percent*data.storedCaps);
					capsuleSlider.label.setText(amount+"C");
				});
				hookClear(function() {
						sliderDestroy(capsuleSlider);
				});

				capsuleSlider.bar.x = 200;
				capsuleSlider.bar.y = 400;
				sliderAlign(capsuleSlider);
				capsuleSlider.handle.onReleaseOnceAnywhere = function () {
					clearChoices();
					addChoice("Withdraw <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.", function () {
						data.timeSinceTouched = getTimer();
						data.storedCaps -= amount;
						getItem("Capsule").amount += amount;
						msg("Withdrew <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.");
						junkCityExplore("savings withdraw");
					}, {enabled: amount!=0});

					addChoice("Back.", junkCityExplore.bind("savings"));
				}
				var amount:Int = Math.round(capsuleSlider.percent*10);
			}

			addChoice("Withdraw <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.", function () {
				data.timeSinceTouched = getTimer();
				data.storedCaps -= amount;
				getItem("Capsule").amount += amount;
				msg("Withdrew <!img:item/Capsule.png> <!b>x"+amount+"<!b> Capsules.");
				junkCityExplore("savings withdraw");
			}, {enabled: amount!=0});

			addChoice("Back.", junkCityExplore.bind("savings"));
		}

		if (which == "snaggdoor") {
			if (data.bankSnaggAbuse == 0) {
				append("You head over to the door.\n\nThere's a hallway in there. Empty, dark, cumstained. You can almost peek to the end if you tip-toe and press your face to the bulletproof glass window. The walls are pockmarked with doors: LOANS, COMPLAINTS, SUGGESTIONS... and HEAD OFFICES.\n\nThe door's got a vault lock. A little digital scanner with Mynt's face asks you to please swipe your Septricard.");

				addChoice("Swipe.", junkCityExplore.bind("snaggabuse2failswipe"), {req: ["VIP Pass", 1]});
				addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
			} else {
				append("You're back outside the green door.");

				addChoice("Swipe.", junkCityExplore.bind("snaggabuse"), {req: ["VIP Pass", 1]});
				addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
			}
		}

		if (which == "snaggabuse") {
			append("Snagg busts it open. This time you remember to side-step so you don't get knocked out again.\n\n\"You got enough caps yet or what?\"");
			if (data.bankSnaggAbuse == 1) {
				addChoice("Is... is this much okay?", junkCityExplore.bind("snaggabuselauncher1"), {cost: ["Capsule", 5]});
			} else if (data.bankSnaggAbuse == 2) {
				addChoice((data.bankSnaggTitle!=""?"Here you go, "+data.bankSnaggTitle+"! <3":"Here you go. Thank you for the opportunity, sir."), junkCityExplore.bind("snaggabuselauncher2"), {cost: ["Capsule", 20]});
			if (getItem("Capsule").amount < 20 && getItem("Capsule").amount > 0)
				addChoice("I... I have "+getItem("Capsule").amount+"?", junkCityExplore.bind("snaggprereject"), {req: ["Capsule", getItem("Capsule").amount]});
			}
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuselauncher1") {
			StoryUtils.quickMynt("Snagg");
			append("Snagg pulls you into his office, then punts your crotch a couple more times to put some fresh bruises on your "+pickByGenitals("dick", "cunt", "dick")+", thinking about his answer.");
			addChoice("W-Well?", junkCityExplore.bind("snaggabuse9"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuselauncher2") {
			append("He blinks a couple times to make sure he isn't hallucinating, exotic crocodile eyelids slipping out side-to-side instead of up-and-down. Once, twice...\n\nHe digs his claws into the double-handful of caps you're just freely giving up to him, trying to verify that this is really happening through touch instead of sight. Then he regains control of himself, letting his genuinely excited smile droop into something more like a sarcastic snaggle-smirk. \"Come on in.\"\n\nHe pulls you by your "+pickByGenitals("dick", "throat", "dick")+" through the hallway, into the dankness of his office, and immediately pins you to the ground with every ounce of his girth.\n\n\"What are you staring at me for?\"\n\nHe indicates your watering, barely-cracked eyes.\n\n\"Expecting a thank-you? Nah. You had a chance to get away from me, a chance to show a little self-respect— but it's obvious you think you're just as worthless as I do. Now shit's about to get a lot worse for you.\"\n\nHe hauls himself up for one second (just long enough to admire your still "+(isActive("Candy Ring")?"blue":"gross yellow")+"-stained face, covered with loose armpit hairs and pouring over with fumes from last time)— then he slams his ass down right on your chest, letting his half-hard cock <!i>fwap<!i> between your eyes.");
			addChoice((data.bankSnaggTitle!=""?"<!i>Hhhhhh...!<!i> "+data.bankSnaggTitle+"! "+data.bankSnaggTitle+"! I can't breathe!":"Wheeze hard for his amusement."), junkCityExplore.bind("snaggabuse17"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse2failswipe") {
			unlockJournal("Snagg Abuse");
			append("The Mynt face mewls, concerned.\n\n\"Agh! I'm sorry, but you aren't elite enough! Go get a Septricard!\"");
			playSound("assets/audio/mynt/protocolmew", "mew");
			addChoice("Give up and feel bad about myself.", junkCityExplore.bind("snaggabuse2"));
		}

		if (which == "snaggabuse2") {
			data.metSnagg++;

			append("You turn around to leave and accidentally bounce your face off someone's warm, sweaty scales.\n\nA gut-punch drops you to your knees before you can even wipe the grease from your eyes.\n\n\""+(data.campTripIntro?"Well if it isn't the happy fuckin camper. Tryna break into my office, cunt?":"And just who the fuck toldja it'd be a good idea to try and break into my office, huh?")+"\"");
			addChoice("Ech! No one! I'm exploring, not breaking in...", junkCityExplore.bind("snaggabuse2a"));
			addChoice("I'm just exploring.", junkCityExplore.bind("snaggabuse2a"));
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse2a") {
			append("He grabs you by your chin, forcing you to look up at him. Two clawed fingers dig into your cheeks.\n\nIt's Snagg.\n\nHe looks mostly like his statue in the lobby: wifebeater, signature snaggle-grin cracked, cock and nuts out— except he's a little harder than the statue, and his balls aren't worn smooth and clean from people rubbing them but coagulated with grease, especially in all them tight little wrinkly sack ripples. It's clear he hasn't washed his crotch in weeks.\n\nThe grip on your cheeks tightens. You spent two seconds too long staring at that fat croc cock.\n\n\""+(data.campTripIntro?"Who put you up to this? Forestfolk?":"Answer me. Who sent you? Roxelle? Red? Or was it that sneaky little faggot lamb?")+"\"");
			addChoice("I was just exploring!!!!!!!! It's what I do!!! Don't hurt me!!!", junkCityExplore.bind("snaggabuse3"));
			addChoice("I was just exploring? Isn't that what "+(data.knownAsPlayer > 0?"players are":"I'm")+" supposed to do...?", junkCityExplore.bind("snaggabuse3"));
			addChoice("I told you, I was exploring. It's what I do.", junkCityExplore.bind("snaggabuse3"));
			
		}

		if (which == "snaggabuse3") {
			append("He grabs you by the scruff.\n\n\"If you try this shit again you'll be exploring my asscrack.\"\n\nHe throws you away from the door (you land hard on your shoulder blades) and swipes his special purple Septricard. He heaves it open and slips into the dark.\n\nThe last you see of Snagg is the sweat beads on his chubby green butt a-winking in the gloom... and just one moment before the door closes, he doubles over, hands on his knees, and pulls in a deep, shaky breath.\n\nAll this hand-to-hand combat was a bit of a workout for him.\n\nHe must have a weapon.");
			addChoice("... Try that shit again.", junkCityExplore.bind("snaggabuse4"));
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse4") {
			append("You mosey back up and uh... allow a frisky digit to wander along the scanner's slit... the Mynt face on-screen blushes and starts purring, and—\n\n<!i>WHAM.<!i>\n\nThe door flies open and steel connects with your skull.\n\nBehind you, the vault lock spins like your head.\n\nYou don't know what just happened?\n\nOh! You're inside that dank hallway now, staring dazedly at the ceiling, two towers of crocodile legmeat guiding your vision right to their apex: his cock. Its piss-slit, magnified by perspective, leaks a stream of rank brown pre right down onto the tip of your nose. A couple beads roll over from the main glob, onto the overhang of your left nostril. The raw stank makes your eyelashes curl.\n\nHe leans down and breathes into your mouth: \"<!i>What did I just fuckin say?<!i>\"\n\nHe whips out his phone, takes a few pictures of your cute expression, and then starts dialing a number.\n\nYou lose consciousness before the end of the first ring.");
			addChoice("Next?"+(data.knownNextXCommand?" Next x[However many moments it takes to wake up?]":""), junkCityExplore.bind("snaggabuse5"));
		}

		if (which == "snaggabuse5") {
			append("You wake with a gasp.\n\nThen you start coughing immediately, because you just gave your lungs a 2nd degree musk burn.\n\nThe instant you open your mouth to start complaining, both of Snagg's heavy nuts pop inside at the same time. You deduce he's been grinding his grundle on your unconscious face for quite a while now from the film of old grease gluing your eyelashes shut.\n\nYour mouth was obviously made to suck his nuts, he murmurs into his phone. It's true, they do both fit perfectly inside your cheeks, bulging them out like a dog gobbling tennis balls... His sack twitches tight and they both swell up, too big to come out easily now, and you feel— but can't see— a single hot bead of drool stretching down on its strand, hanging just low enough to kiss your "+pickByGenitals("cockhead", "pussy", "cockhead")+".\n\n\"... Hm?\" he grunts into his cell. \"Nah, yah, inventory's clear.\"\n\nDown south your nose squishes up into the "+(isActive("Candy Ring")?"sweet":"rotten")+" folds of his taint. You hold your breath in waves, striving for those brief moments of clarity when his musk isn't fogging up your brain— so, naturally, every time your lungs start to beg for air, you're forced to haul in a nostril-searing breath and sink right back down to the depths of stank-delusion, the realm between dreams and nightmares where all subby fantasies grow: you see yourself getting used as a sweatrag for his armpits, pressing the hood of his cock to your nose and snorting his "+(isActive("Candy Ring")?"cock-candy..":"smeg, even ridiculously specific shit like Snagg sneezing on your eyes")+".\n\nYou start holding your breath less and less. These thoughts are just so warm and comfy. <3\n\nCasually, just for something to do while he talks, he starts rocking back and forth on your face, his "+(isActive("Candy Ring")?"sugar":"brown")+"-stained pucker dipping low enough to smooch your forehead on the downswing.\n\n\""+pickByGender("He's", "She's", "They're")+" just suckin my nuts,\" he tells his phone. \"Finally awake now.\"\n\nHe looks down at you over the back of his shoulder, still grinning, and rips a fart so vicious it flutters your eyelashes. You shut your eyes as quick as you can, but you're too late; some gas gets trapped underneath, stinging your corneas.\n\nHe turns back, screws his asscheeks down a little tighter on your head, and jams a finger under the hood of his uncut cock, fishing around idly.\n\n\""+(data.campTripIntro?"Yah, the camping trip went south."+(data.knownMareiGlitch?" Marei fucked it up and had one of his little accidents. I blame you for those.":""):"If you want my honest opinion,\" he says, \""+pickByGender("he seems", "she seems", "they seem")+" like a pathetic sweatrag to me.")+"\"");
			addChoice((data.campTripIntro?"Went south...?":"Th... thank you..."), junkCityExplore.bind("snaggabuse6"));
			addChoice("Fuck this guy. Go look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse6") {
			append("\"Yah, I gotta go. The sweatrag's trying to "+(data.campTripIntro?"ask a stupid question":"thank me")+" past my nuts. Haha, yeah, you know how low I hang— "+pickByGender("he's", "she's", "they're")+" basically just inhaling my sack. I can feel it every time it catches in "+pickByGender("his", "her", "their")+" throat. Mmm, fuck "+pickByGender("he gags", "she gags", "they gag")+" hard... gotta tell em to stop that at some point, really gets on my nerves— oh sure I'll shut up, fuck you too. Anyway. Yeah. No. Yeah. No, of course. Yeah, definitely not. Okay. I'll see you in the penthouse.\"\n\nSnagg shuts his flip-phone and heaves himself up, asscheeks peeling off your face and leaving strings of "+(isActive("Candy Ring")?"bright pink asscandy":"liquid musk")+" to droop and snap in the process. He has to really tug to get his nuts out, though, and even when he finally does distangle his sack from your uvula, a fine film of "+(isActive("Candy Ring")?"sugar":"nutslime")+" coats the inside of your mouth.\n\nHe's huffing and pissed and sweatier than ever.\n\n\"Get up,\" he barks.");
			addChoice("Get up!", junkCityExplore.bind("snaggabuse7"), {kinks: ["Blood"]});
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse7") {
			append("You get up, shakily. A few drops fall from your mouth.\n\nYour eyes adjust to the brightness of his office. The blurry outlines of a desk with a personal AUTO-MYNT computer and an intercom arrange themselves before you. A vault door covers one entire wall, a collection of trophies covers another, and the last sports a dozen snoozing sex slaves hanging from their wrists, ankles, cocks— all boys.\n\nEverything looks fresh and crystalline. It's a lot like emerging from a cave after being lost underground for two days.\n\nAfter a moment you see it isn't crystal at all— the whole place (and especially the wall of slaves) is coated with shiny, crusty yellow cum.\n\nSnagg scoops up a thumbful of half-dried cum from the desk and wipes it off on your hair apparently just because.\n\nYou feel 2% subbier.\n\n\""+(data.campTripIntro?"Yes, it went south. Meaning something else was supposed to happen that didn't,\" he says. \"Anyway, t":"T")+"hanks for keeping still under my ass. Not often I get to make business calls on such a comfortable seat.\"");
			addChoice("Please abuse me more.", function () {
				data.bankSnaggTitle = "";
				junkCityExplore("snaggabuse8");
				append("He chuckles all raspy and dark, like charcoal dragged on stone. \n\nThen he holds out his palm and "+pickByGenitals("kicks you in your nuts", "cuntpunts you", "kicks you in your nuts")+".\n\n\"Sure, "+pickByGender("boy", "girl", "painslut")+". Pay me for it.\"");
			}, {kinks: ["Abuse"]});
			addChoice("Please abuse me more, Daddy.", function () {
				data.bankSnaggTitle = "Daddy";
				junkCityExplore("snaggabuse8");
				append("He chuckles all raspy and dark, like charcoal dragged on stone. \"<!i>Daddy?<!i>\"\n\nThen he holds out his palm and "+pickByGenitals("kicks you in your nuts", "cuntpunts you", "kicks you in your nuts")+".\n\n\"Okay, "+pickByGender("son", "my darling little girl", "kid")+". Pay me for it.\"");
			}, {kinks: ["Abuse"]});
			addChoice("Please abuse me more, Master.", function () {
				data.bankSnaggTitle = "Master";
				junkCityExplore("snaggabuse8");
				append("He chuckles all raspy and dark, like charcoal dragged on stone. \"<!i>Master?<!i>\"\n\nThen he holds out his palm and "+pickByGenitals("kicks you in your nuts", "cuntpunts you", "kicks you in your nuts")+".\n\n\"Okay. Pay me for it.\"");
			}, {kinks: ["Abuse"]});
			if (data.knownMareiGlitch) addChoice("Knock him out.", function () {
				junkCityExplore("snaggknockout");
			}, {kinks: ["Abuse", "Abuse", "Abuse"]});
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
			
		}

		if (which == "snaggknockout") {
			append("<!14px>He catches your fist.\n\nLuckily, you had a second knuckle sandwich already queued right the fuck up.\n\nHis head bounces off the trophy case behind him, shattering the glass, and metal versions of himself in heroic or victorious poses pour down and bounce off his skull.\n\n<!14px><!24px>K.O.<!24px>");
			addChoice("Oops. Shit. Run away.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse8") {
			data.bankSnaggAbuse = 1;
			addChoice("Is... is this much okay?", junkCityExplore.bind("snaggabuse9"), {cost: ["Capsule", 5]});
			if (getItem("Capsule").amount < 5) addChoice("I don't think I have enough.", junkCityExplore.bind("snaggreject"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse9") {
			append("Snagg reaches down and caresses your "+pickByGenitals("purple balls", "bruised, sliced cunt", "purple balls")+"... then squeezes viciously.\n\n\""+(getItem("Capsule").amount > 10?"No five capsules is not fucking okay when I've been in your inventory and know you could shell out <!i>at least<!i> ten more, you silly bitch.\"\n\nHe scratches his asshole with two fingers then shoves both down your throat, twisting them deep in your esophagus and cleaning off all that sweat on the back of your tongue.\n\n\"That right there was your money's worth. Let's see a little more.":"Mmm, sure... that's a good start.")+"\"");
			if (getItem("Capsule").amount > 10)
				addChoice("Ah... fuck... how much abuse will this buy me"+(data.bankSnaggTitle!=""?", "+data.bankSnaggTitle:"")+"?", junkCityExplore.bind("snaggabuse10"), {cost: ["Capsule", 10]})
			else
				addChoice("Thank you"+(data.bankSnaggTitle!=""?", "+data.bankSnaggTitle:"")+"... how much abuse will this buy me?", junkCityExplore.bind("snaggabuse10"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse10") {
			append("\"Shut the fuck up, that's how much. The first rule "+(data.bankSnaggTitle=="Master"?"for my slaves is that you only get to ask one question: 'May I clean that for you, Master?'":"of buying my precious time is that you only get to ask one question: 'May I clean that for you?'")+"\"\n\nWith confident ease he locks claws behind his head, elbows lifted to reveal his armpits, both mounds of hair overflowing, all clumped like haphazard dreadlocks and matted with "+(isActive("Candy Ring")?"blue raspberry bubblegum":"beige filth")+". Sweatstains run down his sides, almost to his belly button— equally hairy, stained, and overflowing with "+(isActive("Candy Ring")?"cookie dough":"lint")+".");
			addChoice("May I clean that for you"+(data.bankSnaggTitle!=""?", "+data.bankSnaggTitle:"")+"? (Indicating his armpit.)", junkCityExplore.bind("snaggabuse11"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse11") {
			append("\"Of course."+(data.bankSnaggTitle=="Daddy" ?
				" Daddy wants his "+pickByGender("little boy to grind his", "little girl to grind her", "darling to grind their")+" taste every inch of him" :
				data.bankSnaggTitle=="Master" ?
				" Master wants his slave to smell like the armpit sniffer "+pickByGender("he is", "she is", "they are") : "")
			+".\"\n\nHe works a paw over your scalp, claws scraping, and pulls your face deep into his pit. Globs of "+(isActive("Candy Ring")?"bubblegum":"some weird yellow substance")+" have built up around the roots of his hairs, where your nose is currently grinding."+(isActive("Candy Ring")?"":" It's not cum, not piss... maybe expired pudding?")+"\n\n\"Take a deep breath"+(data.bankSnaggTitle=="Daddy" ?
				", "+pickByGender("boy", "girl", "hun")+".." :
				data.bankSnaggTitle=="Master" ?
				", slave.." : "")
			+".\"");
			addChoice((data.bankSnaggTitle!=""?"Yes "+data.bankSnaggTitle+"...":"Snort it."), junkCityExplore.bind("snaggabuse12"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse12") {
			append((isActive("Candy Ring")?"This armpit bubblegum tastes amaaaazing~!":"Whatever this yellow shit is, it smells like hot death. You shiver right down to your white blood cells at the thought of taking it inside your body, let alone up your nose...")+"\n\nSo, naturally, you press your nose in deep, so deep it accordions against his warm scales... and then you rip a really ravenous piggy snort~\n\nAll "+(isActive("Candy Ring")?"that blue raspberry goodness":"his pitgunk")+" floods right up into the tight twists of your sinuses, obliterating your sense of smell in moments and permanently staining the back of your throat as it dribbles down to "+(isActive("Candy Ring")?"":"burn a hole like stanky napalm at ")+"the pit of your stomach. You're only barely lucid enough to sift through the matted tufts of pitfur with your fingers and search out the next chunk to snort, coughing, gagging, sneezing it back out...\n\nYou've never "+(isActive("Candy Ring")?"snorted bubblegum before, believe it or not. It's actually a lot of effort":"wanted to vomit more or harder in your entire life, but you keep going like a good fuckpig would")+". You look up to him, begging silently for mercy.\n\nSnagg burps and punches you in the back of your skull. Your face lurches in deeper. All the "+(isActive("Candy Ring")?"gum":"yellow goop")+" you left unsnorted smears over the rest of your face. Some gets in your mouth, your eyes.\n\nHe finally notices it, scooping a thumbful of "+(isActive("Candy Ring")?"blue":"yellow")+" off your cheek and reaching down to tuck it lovingly between your buttcheeks. You feel it smear warm and oily over your hole~\n\n\"Ahhh... fuck,\" he says. \"Forgot I tucked that "+(isActive("Candy Ring")?"treat in there for the boys":"pudding in there for the slaves' breakfast")+" last week... you go ahead and eat it. I don't want it anymore.\"");
			addChoice((data.bankSnaggTitle!=""?"<!i>Hrrkk...<!i> thank you for the delicious "+(isActive("Candy Ring")?"treat":"meal")+", "+data.bankSnaggTitle+"!":"Obey."), junkCityExplore.bind("snaggabuse13"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse13") {
			append("Your tongue slips out into the rainforest.\n\nThe last unhypnotized parts of your mind stand like a mother on the doorstep, watching their child disappear to some incomprehensible war out between the trees and the "+(isActive("Candy Ring")?"blue":"musky")+" fog. "+(Math.random()>0.98?"\n\n<!i>Ganbatte, tongue-kun...<!i>\n\n":"")+"With that weird image in your head you wiggle your tongue around like fuckin crazy, scooping "+(isActive("Candy Ring")?"bubblegum":"hair-clogged gunk")+" chunks up, sucking the flavor out of them, then blissfully chomping down to feel that satisfying pop between your molars.\n\nSnagg only pulls you off once for fresh air, and that's because you were getting so disoriented that you started licking your own nostrils. He allows you one, two breaths... then spits in your mouth and sends you back under.\n\nAfter sucking on his armpit hair for probably like twenty minutes it really starts to clog the back of your throat. You can't even swallow anymore; you're forced to just drool "+(isActive("Candy Ring")?"sloppy half-chewed blue":"filth")+" all over yourself, which means your tongue sometimes has to double-back to an already cleaned section "+(isActive("Candy Ring")?"for another round":"and suck up a couple half-dried globs of your own rank saliva")+". Every time you think you're done you find another realm of "+(isActive("Candy Ring")?"sweet":"grease")+" to slurp in that infinite forest.\n\nSnagg's shifting his weight a little now. He's tired of standing.\n\nYour "+pickByGenitals("cock throbs against the ground, pressing flatter and flatter to it", "cunt leaks pitterings of oil on the cummy tile and your thighs quiver as they buckle into a squat", "cock throbs against the ground, pressing flatter and flatter to it")+"... he's laying you down.\n\nWith a grunt he flops onto his side in a relaxed lounging position, which naturally pins your face between his armpit and the hard tile.\n\n\"Almost done?\" he growls, knowing you can't possibly answer. \"No, huh? Lazy slut...\"\n\nHe re-counts the caps you gave him, casually bringing his heel down on your sensitive, throbbing "+pickByGenitals("shaft", "cuntlips", "cuntlips")+" for each one you gave him. \"Wanna know something fuckin funny? Get this: <!i>I<!i> paid for all those slaves on the wall... yet here I got a slave worth fuckin <!i>negative<!i> value, a worthless bitch that pays me to use "+pickByGender("him", "her", "em")+". Who's that, huh? Can you guess?\"");
			addChoice("Me...", junkCityExplore.bind("snaggabuse14"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse14") {
			append("\"That's right!\" Snagg coos, and punctuates that with a kick so hard "+pickByGenitals("it almost pops your nuts", "that his heel almost forces its way inside your pussy", "that his heel almost forces its way inside your pussy")+".\n\n\"<!i>You're<!i> the fuckrag shelling out caps for abuse. At least prostitutes can claim they sell their bodies. Mmm... come to think, you're taking so long just trying to clean <!i>one<!i> of my pits, I'll probably need a little overtime pay. What d'you say? I bet you still want more, don't you? More brutal, more degrading? You wanna get your fuckin cash drained even <!i>harder<!i>?\"");
			addChoice("Fuck yes... how much?", junkCityExplore.bind("snaggabuse15"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse15") {
			data.bankSnaggAbuse = 2;
			append("\"Twenty.\"");
			addChoice((data.bankSnaggTitle!=""?"Here you go, "+data.bankSnaggTitle+"! <3":"Here you go. Thank you for the opportunity, sir."), junkCityExplore.bind("snaggabuse16"), {cost: ["Capsule", 20]});
			if (getItem("Capsule").amount < 20 && getItem("Capsule").amount > 0)
				addChoice("I... I have "+getItem("Capsule").amount+"?", junkCityExplore.bind("snaggprereject"), {req: ["Capsule", getItem("Capsule").amount]});
			if (getItem("Capsule").amount < 1)
				addChoice("But I'm broke!", junkCityExplore.bind("snaggreject"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse16") {
			data.bankSnaggAbuse = 3;
			append("His beady eyes light right the fuck up.\n\nHe blinks a couple times to make sure he isn't hallucinating, exotic crocodile eyelids slipping out side-to-side instead of up-and-down. Once, twice...\n\nHe digs his claws into the double-handful of caps you're just freely giving up to him, trying to verify that this is really happening through touch instead of sight. Then he regains control of himself, letting his smile droop into something more like a sarcastic snaggle-smirk.\n\n\"What are you staring at me for?\" He indicates your watering, barely-cracked eyes. \"Expecting a thank-you? Nah... you had a chance to show a little self-respect, but it's obvious you think you're just as worthless as I do. Now shit's about to get a lot worse for you.\"\n\nHe hauls himself up for one second— just long enough to admire your "+(isActive("Candy Ring")?"blue":"gross yellow")+"-stained face, covered with loose armpit hairs and pouring over with fumes— then he slams his ass down right on your chest, letting his half-hard cock <!i>fwap<!i> between your eyes.");
			addChoice((data.bankSnaggTitle!=""?"<!i>Hhhhhh...!<!i> "+data.bankSnaggTitle+"! "+data.bankSnaggTitle+"! I can't breathe!":"Wheeze hard for his amusement."), junkCityExplore.bind("snaggabuse17"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse17") {
			append("\"That's right bitch... choke for me.\"\n\nHe grinds his dick over your nose, bringing his uncut cock closer and closer to your nostrils, which are already abused so far beyond belief that you can't even smell what you know is coming next.\n\nBut you don't care. With all this weight on your chest, you can only worry about making it to that next breath.\n\nHe lines up his sloppy overhanging foreskin with your left nostril. If you cross your eyes and look down (\"Ha! You really look like a dumb bimbo now!\") you can spot all those irregular bumps under his hood, all "+(isActive("Candy Ring")?"that yummy cheesecake..":"the lumpy dickcheese that's been festering under there for fuck knows how long")+".\n\nSnagg thumbs the tip of your nose, flattening it and making you look like—\n\n\"A fuckpig,\" he asserts, patiently bouncing his dick off your face. \"That's what you are.\"\n\nYou zone out and watch all that trapped "+(isActive("Candy Ring")?"cake":"smeg")+" jiggle around under his hood.\n\n...\n\n\"Well? Are you a fuckpig or not?\"");
			addChoice((data.bankSnaggTitle!=""?"Yes, "+data.bankSnaggTitle+"! That's what— uh— yes, I am that. I am a pig of fuck.":"Ah— yes— that's what— uh— yes, I am that. I am a pig of fuck."), junkCityExplore.bind("snaggabuse18"));
			addChoice("I am <!i>not<!i> a fuckpig.", function () {
				junkCityExplore("snaggreject");
				data.bankSnaggAbuse = 3;
			});
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse18") {
			append("He grabs your face and forces you to look at him.\n\n\"What the fuck was that sentence. Say it more properlier.\""+(data.myntFakeDone?"\n\nHis eyes narrow, watching for your reaction to that last bit.":""));
			addChoice("I am a fuckpig.", junkCityExplore.bind("snaggabuse19"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse19") {
			append("\"Louder"+(data.bankSnaggTitle=="Daddy" ?
				", "+pickByGender("boy", "girl", "hun") :
				data.bankSnaggTitle=="Master" ?
				", slave" : "")
			+".\"");
			addChoice("(Oh, god... what if someone hears?) <!i>I AM A FUCKPIG!<!i>", junkCityExplore.bind("snaggabuse20"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse20") {
			append("The seagull teller peeks in"+(data.roxBankTrigger?".":" with a phone pressed to her chestfeathers.")+"\n\n\"Sir, Roxelle "+(data.roxBankTrigger?"came in late again (she brought her dog too, he's sooooo cute!) and s":"called in again. S")+"he says she can't pay her—\"\n\nShe gets blasted with a wave of your stench, gagging and covering the little nose-holes on her beak. Still, dutifully, she chokes on: \"... R-Rox... she said she can't quite make her mortgage payment, so...\"\n\nSnagg leans down and rumbles deep in your ear:\n\n\"<!i>I said louder.<!i>\"");
			addChoice("<!20px>I AM "+(data.bankSnaggTitle!=""?data.bankSnaggTitle.toUpperCase()+"'S":"A")+" DISGUSTING, PIT-LICKING, "+(isActive("Candy Ring")?"CAKE-SNIFFING":"SMEG-SNORTING")+" FUCKPIG!<!20px>", junkCityExplore.bind("snaggabuse21"));
			addChoice("<!10px>"+(data.bankSnaggTitle!=""?data.bankSnaggTitle.toLowerCase():"snagg")+"... im sorry... i cant... not in front of the poor gullgirl!!<!10px>", function () {
				junkCityExplore("snaggreject");
				append("\n\nHe hauls you out, disgraced. The gull trails along at his back.\n\n\"So, um,\" she says, \"Rox—\"\n\nYou catch only one word in Snagg's muttered response: <!i>evict.<!i>");
			}, {kinks: ["Plot"]});
		}

		if (which == "snaggabuse21") {
			append("The seagull squawks and flutters away, leaving a few feathers on your side of the door.\n\n\"JEEZ OKAY— I'll tell her to come "+(data.roxBankTrigger?"back":"in")+" later— don't make "+data.playerName+" yell at me!?\"\n\nSnagg ignores her. He squeezes his fingertips at the base of his cockhead, twisting them around the circumference, collecting the lumps... A single bead of "+(isActive("Candy Ring")?"cake":"cheese")+" drips from the spout of his foreskin and lands at the back of your left nostril.\n\nIt tickles horribly. You almost sneeze on his cock.\n\n\"You didn't even sell your body to me,\" he reminds you. \"You surrendered it. And I don't wanna hear any gross little gags from a throat that <!i>I<!i> own, okay? When I give you a treat, you snort it down and keep it down.\"\n\nHe works his fingers closer and closer to the tip— then, just before all the "+(isActive("Candy Ring")?"cake":"smeg")+" he's corralled so far can pop out, he pulls his foreskin all the way back.\n\nWhat this means is that his head now throbs naked right in front of your nose, wearing a cute little blob of "+(isActive("Candy Ring")?"purple cheesecake":"dickcheese")+" as a hat.\n\nWith a groan he sinks his cockhead and its cargo halfway up your nostril, muttering: \"Inhale.\"\n\nYou snort noisily, making that shiny helmet jiggle against the entrance to your nose. The chunk on top is far too "+(isActive("Candy Ring")?"thick and luscious":"fat and crusty")+"; he's gotta start throwing his hips back and forth, pounding his cock against the entrance to your sinuses til its cargo pops inside— so deep inside that you're forced to wonder for a moment if that hot little <!i>squidge<!i> wasn't actually his "+(isActive("Candy Ring")?"cake":"smeg")+" sinking into the folds of your brain.");
			addChoice("Gag.", junkCityExplore.bind("snaggabuse21a"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse21a") {
			append("You can't take it anymore. Your back arches, your "+pickByGenitals("cock twitches", "cunt juices", "cock twitches, your cunt squirts")+", your eyes widen... and you gag hard.\n\n"+(data.bankSnaggTitle!=""?data.bankSnaggTitle:"Snagg")+" cockslaps both of your cheeks purple, sneezes"+(isActive("Candy Ring")?" green-apple":"")+" in your eyes, spits up your unmolested nostril, suffocates you to near-unconsciousness on his fat gut— holy fuck— you can't even keep up with the degradation at this point, every time you start parsing one thing he's already doing another.\n\n\"Fucking disgusting,\" he purrs mid-belch, clearly meaning your entire body. He beats your stomach concave and blue for every gag you let through, no matter how much you cry or squirm, and within minutes you're curled up on the floor of his office clutching your blue-splotched, swollen stomach, chain-gagging and burping up "+(isActive("Candy Ring")?"bubblegum":"pitiful little puddles of armpit gunk")+". He grabs your face and rubs it in your own mess, his foot coming down right on your ass, stompfucking you mercilessly.\n\nWith a few fingers woven into your hair, he peels your face off the tile and looks you in the eyes. "+(isActive("Candy Ring")?"Cheesecake":"Smegma")+" trickles out of your fucked-open nostril, into your panting, open maw. You don't even have the energy left to close it.\n\nWithout breaking eye contact, he stuffs your "+pickByGenitals("cockslit", "urethra", "cunt and cockslit")+" with yet more cheese"+(isActive("Candy Ring")?"cake":"")+" excavated from underneath the rim of his cockhead, doing it nice and slow and painful, at times sinking a full claw inside to push all that muck down as far as it can go inside you.\n\n\"You <!i>still<!i> want more?\"");
				addChoice("Yes "+(data.bankSnaggTitle!=""?data.bankSnaggTitle:"sir")+". (Piss myself.)", junkCityExplore.bind("snaggabuse22"), {kinks: ["Piss"]});
				addChoice("<!10px>... no "+(data.bankSnaggTitle!=""?" "+data.bankSnaggTitle.toLowerCase():"")+"... it hurts...<!10px>", junkCityExplore.bind("snaggreject"));
		}

		if (which == "snaggabuse22") {
			append("You relax your bladder and spray his belly with a creamy "+(isActive("Candy Ring")?"cake":"smeg")+"-piss mixture. Your urethra"+pickByGenitals(" throbs", " throbs", "s throb")+" with pain at the occasional blockage... but all you really have to do is clench extra hard and your piss blasts right past em~\n\nHe gets up and glares at you. You half-expect him to start whaling on you again, but he doesn't.\n\n...\n\nHe just walks slowly to his desk, pulls out a roll of paper towels, and starts cleaning himself off.\n\nOh. He's legitimately pissed. Despite how filthy his body was to start with, something about being coated in another person's filth without his own consent clearly bothers him.");
			addChoice((data.bankSnaggTitle!=""?data.bankSnaggTitle+"? ":"")+"You okay...?", junkCityExplore.bind("snaggabuse23"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse23") {
			append("He finishes cleaning himself and crams the soaked brown-yellow paper towel wad down your throat, not looking at you while you choke it down obediently.\n\n\"That's the last treat you'll get from me, "+data.playerName+". I'm not even gonna call you 'fuckpig.' You don't deserve it after that shit.\"");
			addChoice("C-Could I make it up to you with a little more money...?", junkCityExplore.bind("snaggabuse24"), {req: ["Capsule", getItem("Capsule").amount]});
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggabuse24") {
			append("\"No. You can't buy your way out of this one.\"\n\nSnagg slips his wifebeater back on and jams a button on the intercom. \"Gullbitch whatever-your-name-is,\" he says into the receiver, \"put Ms. Devaunt on the horn.\"\n\n\"Are you sure you don't want to see her in person?\" the gull squeaks through the intercom.\n\n\"Fuck no,\" he says, scratching his belly. His dick flops a little with that movement, perfectly limp now. \""+(data.roxBankTrigger?"That fuckin dog of hers is gonna want to lick the "+(isActive("Candy Ring")?"candy":"grease")+" from my pits":"She's probably gonna want me to use her face as a pissmop")+"—\" he shoots you another glare and a jerk of the chin that asks <!i>Why the fuck are you still here?<!i>— \"and, wouldn't you know it, I'm suddenly not in the mood. So yes, I'm sure I don't want to see her in person, and yes, I expect you <!i>not<!i> to give in when she turns on the charm and asks if there's 'any other way she can pay her mortgage, any way at all, she'll do annyyything,' the fucking sowslut.\"\n\nYeah, he isn't just gonna let you stand here listening anymore.\n\nHe grabs you and hauls you out of his office, down the hall, and throws you into the middle of the busy lobby.\n\nEvery set of eyes in the room locks onto you. Noses get covered. You pick yourself up, dripping with Snagg's filth. It's obvious everybody heard you screaming about how much of a fuckpig you are.\n\nYou uh... pretend to just casually look around.");
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggprereject") {
			append("Immediately his expression sours and he stops driving his heel into your "+pickByGenitals("nuts", "cunt", "cunt")+".\n\n\"First of all, don't type in fucking integers when you speak to me— you <!i>lazy<!i> slut. And is '"+getItem("Capsule").amount+"' more than twenty, or less?\"");
			addChoice("Less...", junkCityExplore.bind("snaggreject"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "snaggreject") {
			append("\"Then fuck off.\"");
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "hyena1") {
			append("\"Hey man,\" one of them says, \"or girl, or whatever— you're basically a celebrity, right? You gotta have caps, right?\"\n\n\"They gotta have caps,\" another purrs, slinking up behind you.");

			data.gavecap = true;
			addChoice(
				"Sorry, boys. Just the one.",
				junkCityExplore.bind("hyenacap1"),
				{cost: ["Capsule", 1]}
			);

			addChoice("I'm broke.", function() {data.gavecap = false; junkCityExplore("hyenacap1");});
		}

		if (which == "hyenacap1") {
			append("\"You sure, <!i>player?<!i>\"\n\nA single short, blunt claw presses to your throat.\n\nThe pack closes in on you.\n\n");

			if (getItem("Capsule").amount > 3) {
				temp.price = Math.round(getItem("Capsule").amount / 2);
				append("\"We know you got more on you...\"");

				addChoice(
					"Big threat. What are you gonna do, boys? Make me cringe at the text on the screen?",
					junkCityExplore.bind("hyenacringe")
				);
				addChoice(
					"Alright, alright. Here.",
					junkCityExplore.bind("hyenapay"),
					{cost: ["Capsule", temp.price], give: ["Sweetgrass Leaf", 8]}
				);
			} else {
				append("Over their jostling shoulders you spot something quick and feminine flying through the air...");
				addChoice("Duck.", junkCityExplore.bind("hyenaduck"), {kinks: ["Female"]});
			}
		}

		if (which == "hyenapay") {
			data.hyenaDone = true;
			temp.g = pickByGender("man", "girl", "bruh");

			append("They back off. Only the scrawniest lags behind, scooting up close and talking low. \"Hey... thanks, "+temp.g+"... I woulda caught the worst of that... they get real angry sometimes...\"\n\nHe pushes something into your palm and runs off with a little wave.\n\nIt's a little satchel of Sweetgrass Leaves!");

			addChoice("No prob.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "hyenacringe") {
			append("\"Nah.\"\n\nThe claw slips past your throat without touching you and catches on the intangible entrance to your inventory.\n\n\"We're gonna take your shit.\"");

			addChoice("Wait.", junkCityExplore.bind("hyenawait"), {
				cost: [
					"Glowberry", Math.round(getItem("Glowberry").amount/2),
					"Capsule", Math.round(getItem("Capsule").amount/2),
					"Sweetgrass Leaf", Math.round(getItem("Sweetgrass Leaf").amount/2)
				],
				hideCost: true
			});

		}

		if (which == "hyenawait") {
			data.hyenaDone = true;
			msg("Lost half of your Glowberries, Capsules, and Sweetgrass Leaves.");

			append("The claw yanks downward and spills your precious items everywhere. The hyenas gather it up, flick you on the nose, and run off.\n\nYou lost half of your Glowberries, Capsules, and Sweetgrass Leaves.");

			addChoice("Goddamnit.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "hyenaduck") {
			data.hyenaDone = true;

			append("You drop to your hands and knees while a single high-stocking'd flying kick beans two hyena skulls.\n\n\"OW! FUCK! MARLENE!\"\n\nBefore you stands a towering hyena chick with fat piercings, ripped stockings, blue lipstick, six barettes, pigtails, and a miniskirt which barely covers her crotch, let alone the hulking tranquilizer on her hip.\n\nShe winds back and kicks one of the boys in the head again to punctuate each word of her sentence: \"Stop. Fuckin. Extorting. Innocent. People. That. Is. Not. How. We. Do. Business. You. Mangy. God. Damn. Grass. Addict.\"\n\n\"OKAY, OKAY, STOP, I'M SORRY!\"\n\n\"You take anything from this "+pickByGender("guy", "girl", "player")+"?\"");

			if (data.gavecap) {
				if (canGain) addToItem("Capsule", 1); // I probably shouldn't put this canGain here
				append("\"... NO...\"\n\nShe kicks him again, this time in the nuts.\n\n\"OKAY OKAY OKAY!!!!! ONE CAP! THAT'S IT!\"\n\n\"Give it back.\"\n\n... Sheepishly, hand trembling, he obeys.");
				addChoice("Thank you, Marlene~!", junkCityExplore.bind("snagglebank exterior"));
			} else {
				append("\"NO!\"\n\n... She turns to you. \"Well, go on, then.\"");
				addChoice("Going!", junkCityExplore.bind("snagglebank exterior"));
			}
		}

		if (which == "dragonherm1") {
			data.dragonHermBabyfuck = false;
			data.dragonHermFilled = false;

			append("You happen to show up mid-orgasm, just as she's moaning through a mouthful of little pink capsules. Off her pours a river of "+(isActive("Mood Ring")?"firey-red dragon ":"")+"cum and feminine oil and wombjuice, all flowing shiny down the bank's steps. She strokes her cock furiously quick with one hand, tits and nuts and belly jiggling every-which-where, dragging a thumb over her gushing, tapered tip, redirecting her splurts so they fan out over herself like the Heavy Mist setting on a hose nozzle.\n\nWith the other hand she rams four fingers as far as they'll go up her cunt, pulling it open, babble-begging through orgasmic mind fog at each passerby to preg her again, please, she feels so empty— seemingly unaware of the egg currently crowning past her fingers. You guess it might be sort of hard for her to tell, being that stretchy.\n\nNo matter how much she begs, no one even glances at her. Well... a teen boy stares from across the street, steps forward— but his friend pulls him back.");
			if (onFA()) {
				append("\n\n\"Look at it, dude,\" he says, tired. \"We can't go near ");
				append(pickByGender("him", "her", "em"));
				append(". Don't you see the big-ass [FurAffinity Censor] over ");
				append(pickByGender("his", "her", "their"));
				append(" head?\"\n\nThe other teen deflates. \"But ");
				append(pickByGender("he's", "she's", "they're"));
				append(" finally back...\"");
			}

			if (!data.dragonHermDone) {
				temp.a = "Time for some hardcore midwifery.";
			} else {
				temp.a = "Time for more hardcore midwifery.";
			}
			addChoice(temp.a, junkCityExplore.bind("dragonherm2"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "dragonherm2") {
			if (!data.dragonHermDone) temp.a = "Hi" else temp.a = "Hello again";

			append("You kneel on the step below her and pull both her thighs apart by way of greeting. \""+temp.a+",\" she says, in-between pants, her expression drooping into a half-lidded smirk. Push, you tell her. She peers down between her thighs, getting some fuzzy bearings in the aftermath of that brain-melting orgasm, apparently a little surprised that she's laying eggs in public on the streetcorner.\n\nShe grits and clenches hard, her smooth, cum-slick dragonskin tightening under your palms. With one big HRRRNGH she births it, her thighs quivering as she wiggles her hips to get past the egg's fatter end.\n\n<!i>SchlooooooOOoOooooOOop~!<!i>\n\nThe immense relief sends her flying meteoric into another cum, amplifying her natural contractions and making her push a little <!i>too<!i> hard— a "+(isActive("Candy Ring")?"buttercream sundae":"fat log of shit")+" rushes from her swollen pucker, smearing over the smooth white surface of the egg and thoroughly splattering a passing group of bankers.\n\nThey look from their ruined suits to her blissed-out face, flabbergasted. The kindest among them is only barely able to keep the others moving up the steps.");

			addChoice("Next.", junkCityExplore.bind("dragonherm2a"));
		}

		if (which == "dragonherm2a") {
			append("You look back down just as the second egg starts to crown. She sits up with surprising speed, considering all that voluptuous preggo dragonmeat in the way, and grabs you around your chest, pulling your face between her soaked tits. \"I got it from here,\" she says, lavishing you with cummy kisses. "+(Math.random() > 0.5?"Her cock keeps bumping up against your thighs, she's jerking it so hard...\n\nShe gives a primal little grunt as the next contraction hits, her nipples throbbing warm against your ears. \"Preg me again... please... need more...\"\n\n... So she <!i>is<!i> aware... just insatiable.":""));

			if (data.hasCock || data.hasBoth) {
				addChoice("I'll uh... I'll wait until you're free downstairs.", junkCityExplore.bind("dragonherm3noegg"));
				addChoice("You want me to fuck you past your egg~?", junkCityExplore.bind("dragonherm3egg"));
			}
			addChoice(
				"... I wanna try something.",
				junkCityExplore.bind("dragonherm3balloon"),
				{cost: ["Cum Balloon", 1]}
			);
			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "dragonherm3noegg") {
			data.dragonHermBabyfuck = false;
			append("The hatchling must've inherited her hips, 'cause the butt-end of the egg gets stuck. You reach down and grope around, trying to see if you can help pull a little maybe, fingers wandering over her cock (she growls with deep satisfaction), her throbbing nuts... then you realize she <!i>still<!i> has four fingers up the pussy she's trying to give birth from. Um, you say. Maybe take those out?\n\n\"What? Heck no... the challenge is the best paaaaHHhhrrr—\" She breaks off into heavy panting, driving her fingers in even deeper and wiggling em cutely around the back of the egg while the fingers of her free hand squeeze cream-dribbles from a puffy nipple, squirting you directly in the face.\n\n\"Ah!\" she squeaks. \"Sorry... I'm close...\"");

			addChoice("Again?! You just came twice!", junkCityExplore.bind("dragonherm4birth"));
		}

		if (which == "dragonherm3egg") {
			data.dragonHermBabyfuck = true;
			append("You slip your pants down and line your cock up square, nuts dragging over the smooth surface of the egg, still warm and slick with her wombjuice. \"Please,\" she says again, a note of true desperation rising from deep in her chest. You start to push your head in, just below her clit, when you realize she still has four fingers lodged up her cunt. Um, you say. Maybe take those out?"+(Math.random() > 0.5?"\n\nIt takes her a moment to respond, 'cause she gets sucked into yet another furious fapping sesh~":"")+"\n\n\"No, no— please— I can take it, promise~!\"\n\nYou hesitate a little. She takes a deep breath, forcing herself to calm down, then fixes you with puppy eyes and begs you sweetly: \"Please... please impregnate me. I need some "+(isActive("Mood Ring")?"of that thick "+getMood():"")+"cum sloshing around in my womb~\"\n\nYou shrug and start pushing forward; immediately she drops the act, tongue lolling out, and goes full dragonwhore again. With some rough pushes you slip your head inside, tight between her fingers and the warm, slick egg... then half your shaft, then three quarters, and finally the very last bit. You're sort of amazed that you managed to sink all of that inside her.\n\n\"Good,\" she purrs, her contractions rippling over your cock. \"Now fuck me.\"");

			addChoice("Fuck her.", junkCityExplore.bind("dragonherm3eggfuck"));
		}

		if (which == "dragonherm3eggfuck") {
			append("You pull out, her fingers groping you along the way, then slam back in. With each thrust your nuts bounce cutely off of her half-born egg, pushing it back in a little at times. Her wrist cramps, so she pulls the hand from her cunt and brings it up, two-handing her tits now; with all those thick, shiny strands of wombslime bridging her fingers it's inevitable that one or two ~accidentally~ pop inside both drooling nips. She groans so loud, even through gritted teeth, that a little clump of tourists across the street startle like a flock of birds, cameras and maps scattering.\n\n\"Ugh... can't take much more...\" she says, annoyed with her own sensitivity— she can only <!i>gently<!i> fingerfuck her tits to the rhythm of your thrusts a couple more times before the sensation threatens to overwhelm her and she's forced to yank them out. Noisily she slurps them clean.\n\n\"I'm cloth,\" she says with a full mouth, meaning \"close.\"");

			addChoice("Again?! You just came twice!", junkCityExplore.bind("dragonherm4birth"));
		}

		if (which == "dragonherm3balloon") {
			append("You fish a Cum Balloon out from your inventory.\n\nHer eyes go wide. She's speechless at the sight of so much "+(isActive("Mood Ring")?"multicolored ":"")+"cum packed into such a tiny space. She reaches up, gropes it, gently massaging the shiny bulbous rubber. \"Mmm... still warm...\"\n\nShe leans back on the steps, spreads her legs wide, egg still bulging from her cunt. She pulls it open wider for you with one hand, grabbing your wrist...\n\n\"Push it in... bonus points if you can get all the way up to the womb without popping it~\"\n\n<!b>BONUS POINTS: 0<!b>");

			addChoice("Ram it in.", junkCityExplore.bind("dragonherm3balloonram"));
			addChoice("Slowly work it in.", junkCityExplore.bind("dragonherm3balloonwork"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "dragonherm3balloonram") {
			data.dragonHermFilled = true;
			append("You ram the jiggly balloon up to her pussylips, slick rubber smearing over the egg, deforming to fit the bulge of her vulva— it pops.\n\nCum explodes over your chest and crotch, her inner thighs, coating her egg, thickening the cum-river on the steps below you. With hypnotic calm she works her fingers back and forth, stuffing fat globs of it up her cunt. \"Not even close,\" she pants, \"... but I am...\"\n\n<!b>BONUS POINTS: -4,983,698<!b>");

			addChoice("Again?! You just came twice!", junkCityExplore.bind("dragonherm4birth"));
		}

		if (which == "dragonherm3balloonwork") {
			data.dragonHermFilled = true;
			append("You nuzzle the balloon up to her pussylips, dragging the slick rubber over her egg. Steady... steady...\n\nSlowly, with extra-careful pushings and pullings of her ample cuntmeat, you manage to slip the balloon inside her. She groans at the sight of her stuffed-full hole, watching the cloudy cum swirl inside the balloon with each contraction. \"Deeper,\" she begs you.\n\nThe thin rubber strains with tension. A tiny dribble of cum leaks from the balloon's tied mouth. \"Almost... almost...!\"\n\nFinally her womb swallows the little balloon whole, fattening her already huge tummy. She grins, fiercely satisfied, and clenches her abdomen hard— you hear a tiny muffled pop as all that warm cum bursts out inside her, a little sloshing out and down over her half-laid egg.\n\nShe melts. \"Oh fuck, I'm close...\"\n\n<!b>BONUS POINTS: 2,976,369<!b>");

			addChoice("Again?! You just came twice!", junkCityExplore.bind("dragonherm4birth"));
		}

		if (which == "dragonherm4birth") {
			append("\"I meant close to getting this little cutie— hrrrnnnghhhh— born...\"\n\nA traumatized Bright Forest tourist group nears, only a couple of them (both nymph cubs) brave enough to run up and slap her bloated beachball belly for luck, or to reach down, scoop up some goopy liquid cum"+(isActive("Candy Ring")?"-sundae":"shit")+", and clean their fingers off deep in her gagging throat. Also for luck.\n\nThe crowd oooo's and a couple applaud as the dragon gives a monumental heave and finally pushes her egg out "+(data.dragonHermBabyfuck?"past your dick ":"")+"with a splat into her steaming pile of "+(isActive("Candy Ring")?"buttercream ":"shit")+"slop.\n\n\"It's a girl!\" the raccoon tour guide shouts, clearly not about to miss a chance to announce something while they have a microphone. The egg wiggles a bit at first, its occupant clearly upset about the sudden temperature change, but soon it settles into the "+(isActive("Candy Ring")?"sundae":"shitlog")+" and calms down, surrounded by warmth again.\n\n\"They're beautiful...\" the dragon says, picking up both eggs, lovingly licking the "+(isActive("Candy Ring")?"cream":"filth")+" from them. ");

			if (!data.dragonHermFilled && (data.hasCock || data.hasBoth)) {
				append("Then, immediately: \"... Now gimmie more.\"");
				addChoice("Greedy~", junkCityExplore.bind("dragonherm5cum"));
			}
			addChoice("Listen to the tour guide.", junkCityExplore.bind("dragonherm3tourguide"));
			if (data.dragonHermFilled) addChoice("Wind down.", junkCityExplore.bind("dragonherm6"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "dragonherm5cum") {
			append("Just to tease her you pretend to miss, letting your cock slip up between her lips, bouncing both nuts out to either side, grinding it along her ridged dragondick and moaning like you think you're balls-deep.\n\n\"Quit it,\" she snaps, thoroughly teased. She huffs steam from both nostrils and reaches down for some cock re-alignment; you look just in time to watch the entire thing disappear with a simple <!i>schlip<!i> inside her, both her "+(isActive("Candy Ring")?"cream":"shit")+"-splattered nuts jiggling happily against your lower stomach.\n\nShe wraps her legs around your hips, locking you in, and proceeds to power-bottom the fuck outta you. In those brief moments where your face isn't buried in her leaky tits you can see your cock's driven her to transcendence, her forked dragon tongue hanging loose and wet over her chin, eyes and eyebrows arched to the night clouds.\n\nShe growls and doubles her speed, clenching her lips tighter than you would've thought possible and working just your head in and out, reading your throbs (lip bitten, one eye closed) until she's positive the final hilting thrust of her hips will ensure you cum directly into her womb.\n\nShe performs that thrust. A couple nymph tourists laugh at you for cumming so early, but that's far away and meaningless, dampened through the deafening waves of your tsunamigasm.");

			addChoice("Daaaaang... a tsunamigasm...!", junkCityExplore.bind("dragonherm6"));
			addChoice("Wind down.", junkCityExplore.bind("dragonherm6"));
		}

		if (which == "dragonherm3tourguide") {
			append("\"... anyway, as I was saying, <!i>this<!i> is one of the biggest banks in the city,\" the guide rattles on. \"Here citizens can deposit and withdraw cum, store their caps in a savings account with 0.69% annual interest (I know, right, it's that sex number! Hah! Whaddayaknowboutthat!) and they can also visit the adjoined blood bank and abortion clinic,\"— a little sheep in the back faints— \"or exchange Fuckmeat for caps 2 to 1. One of the best rates, by gosh.\"");

			if (!data.dragonHermFilled && (data.hasCock || data.hasBoth)) {
				append("The dragon's getting a little agitated without an egg to stretch her. She lifts her hips, grinding her drippy junk over your cock. \"... C'moooon~\"");
				if (Math.random() > 0.5) append("\n\nShe strokes her cock hyperfast to keep herself busy, having a little mini-cum and coating her already coated face, tits, and belly with even more goopy "+(isActive("Mood Ring")?"red ":"")+"cum~");
				addChoice("I'm coming, I'm coming. Or, er, I'm about to.", junkCityExplore.bind("dragonherm5cum"));
			}
			addChoice("Call the tour guide over.", junkCityExplore.bind("dragonherm3tourguide2"));
			if (data.dragonHermFilled) addChoice("Wind down.", junkCityExplore.bind("dragonherm6"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
		}

		if (which == "dragonherm3tourguide2") {
			append("\"Well why didn't you say so!\" He yanks his pants off with a <!i>FWISH<!i>, revealing a fifteen-incher. \"By golly, I'll smash that pussy!\"\n\nThe dragon's not about to turn down more babies, so she somewhat warily spreads her thighs and lets the raccoon mount her. As promised he goes absolutely wild from the get-go, slamming his entire length up to her womb, grabbing both her legs and pinning them up beside her tits, his thrusts so fast they become one bi-directional blur. Almost as suddenly as he launched into this fuck, he releases a primal warble-moan and bottoms out inside her, cumming, raccoon tail poofing erect; one of his hands slips from her ankle and locks in a vicious grip around her cock, which gets yanked in time with each splurt, one of his eyes still cracked to make sure she's feeling just as good as he is.\n\nFinally they unlock from each other, "+(isActive("Mood Ring")?"his vibrant orange tangerine-flavored":"")+"cum pouring everywhere. In the afterglow "+(data.dragonHermBabyfuck?"he catches sight of her nipples, gaped a little from her fingering earlier...":"he blushes, looking awkwardly at her nipples...")+"\n\n\"Ma'am,\" he says, politely wiping his cock off on a 'kerchief pulled from his shirt pocket, \"this may be a little rude of me to ask... heck, maybe just plain ridiculous— but...\"\n\nHe takes a deep breath. \"Could I go right ahead and piss in one of those tits?\"\n\nYou look to the dragon. She's... actually considering it.");

			addChoice("............................... Watch.", junkCityExplore.bind("dragonherm3tourguide3"), {kinks: ["Piss"]});
			addChoice("Wind down. Wind down right now.", junkCityExplore.bind("dragonherm6"));
		}

		if (which == "dragonherm3tourguide3") {
			append("\"Sure,\" she says, still a little flustered by how fast things are happening but undeniably transfixed by that half-hard gargantuan cooncock. She slips a finger from both hands into her left nipple (with a little wiggling) and starts warming it up, tugging it gently in opposite directions.\n\nOnce she's as ready as she'll get the dragon guides his cock down with a gentle grip, stroking it back to life, and presses the cum-sloppy tip to her open nipple. Despite herself she grins at the raccoon and tells him: \"Just ram it in deep as you can.\"\n\n\"Okeydokey!\"\n\nHe drives every last inch of his cock down into her titmeat, milk squirting out around his nuts. She can't help but throw her head back in a fierce squeal, her entire body locking up, tail lashing around, cunt clenching. He keeps his eyes on her expression, carefully letting his bladder go inside her; slowly she un-clenches and starts to relax as the warmth pours out inside her most sensitive fuckhole, ballooning her breast til it overfills and hot raccoon piss dribbles out over her face and tummy.\n\nAs carefully as he can (though it still draws a squeak) he unplugs his cock and cleans off, gathering his discarded pants and ballcap, which flew off somewhere in the flurry. His lonely tourists beckon him back over to the other side of the street, sort of worried that he was going to disappear into this immense chaotic world.\n\n\"See!\" he tells them. \"You don't get to piss in preggo dragon tiddies out in the backwoods, folks! There's <!i>reasons<!i> to visit the City!\"");

			addChoice("Whew. Wind down.", junkCityExplore.bind("dragonherm6"));
		}

		if (which == "dragonherm6") {
			data.dragonHermDone = true;
			if (data.dragonHermDone) temp.a = "something, alright." else temp.a = "even better than last time! He sort of has a knack for repetition, doesn't he?";

			append("\"Ahhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh~~~~~~~\"\n\nShe drags a loving grope over her "+(isActive("Mood Ring")?"rainbow-":"")+"cum-filled belly. \"That was... "+temp.a+" You get your two-spurt wonders, your early birds, your um-sorry-I-came-too-much-today-I'll-have-to-give-you-a-raincheck-ers... but that right there, that was <!i>filling<!i>~!\"\n\nShe blows you a "+(isActive("Mood Ring")?"colorful ":"")+"cum-bubbly kiss, tummy gurgling as the next batch of eggs percolates. ");

			if (!data.hermDragonDone) append("\"Come see me again sometime,\" she purrs. \"By then I'll probably need another round anyway... those little capsules sure speed things up~\"");
			else append("\"Thanks for coming back,\" she purrs. \"Another one couldn't hurt, if you ever get the time...\"");

			addChoice("Look around.", junkCityExplore.bind("snagglebank exterior"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "bloodbankhub") {
			unlockJournal("Blood bank");
			append("You step into the blood bank, which is about as big a shitshow as you expected. Loving, consenting adults of all species and genders are beating and cutting and tearing each other to pieces everywhere you turn, the majority by far missing at least one limb and getting their ass, cunt, or mouth fucked with someone else's limb, severed or not.");

			if (!data.eyeFuckDone) {
				if (onFA()) temp.cen = "n [ADULT]" else temp.cen = " teen";
				append("\n\nSome burly bro is grinding his blood-slick cockhead over a"+temp.cen+" colt's eyelid over in the corner.");
				addChoice("Watch the eyefuck.", junkCityExplore.bind("eyefuck1"), {kinks: ["Male", "Male", "Art"]});
			}

			if (!data.afterCareDone) {
				append("\n\nA doggy couple cuddles to the right, serene in the chaos, the guy gently washing his girl's cuts.");
				addChoice("Watch the couple.", junkCityExplore.bind("aftercare1"), {kinks: ["Female", "Male", "Blood", "Art"]});
			}

			if (data.eyeFuckDone && data.afterCareDone) {
				data.bloodBankVisited = true;
			}
			addChoice("Back.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "eyefuck1") {
			data.eyeFuckDone = true;
			append("Just as you approach the guy plugs his dick into\nthe little colt's eyesocket with a cute <!i>squish.<!i>\n\n\"Ah~!\" he moans all girly, dragging a few fingers\nalong the "+(onFA()?"[ADULT'S]":"teen's")+" neck. \"Your eyepussy... mmff...\"\n\nThe colt's bored. \"What about it?\"\n\n\"HHHhhhnnnn... it's just so... so tight...\"\n\n\"You've hardly got the head inside.\"\n\n\"Just gimmie...\" HUFF \"... a sec...\"\n\n\"Come on. You said you were gonna skullfuck me.\"");

			var s:MintSprite = addSprite("assets/img/effect/eyeFuck1.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			s.x = 40;
			addChoice("Keep watching.", junkCityExplore.bind("eyefuck2"));
			addChoice("Back.", junkCityExplore.bind("bloodbankhub"));
		}

		if (which == "eyefuck2") {
			append("The guy grabs his little colt's head with\nboth hands and slams his dick in down to\nthe base, using the explosion of blood and\nvitreous fluid as lube for a dandy ol skullfuck.\n\nThat gets the colt's attention. \"Hnnk! Ah!\"\n\n\"HARD ENOUGH?\"\n\n\"Hahbah!\" the colt babbles, twitching from his\ntoes up to the very tip of his throbbing cock\nas his brains get raped into mush.\n\n\"What was that~?\" the guy asks playfully, getting\ngirly again, dragging a luscious grope down the\ncolt's smooth chest.\n\n\"HARBAH! HAR—... HARDER!\"\n\n\"Okay darling~\" he coos, doubling his speed. \"Better\nkeep your other eye open... I want you to watch\nme cum in your brains before I fuck you blind, okay~?\"");

			var s:MintSprite = addSprite("assets/img/effect/eyeFuck2.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			s.x = 40;
			addChoice("Back.", junkCityExplore.bind("bloodbankhub"));
		}

		if (which == "aftercare1") {
			data.afterCareDone = true;
			data.knownCharacterImmortality++;
			append("\"I wanna give more,\" she purrs. \"A couple more pints.\"\n\n\"Nooo. You gave so much already.\"\n\n\"Please?\"\n\nHe frowns. \"You'll pass out.\"\n\n\"That's the idea~\"\n\n\"Well, I don't want to carry you!\"\n\nShe snickers. \"Then lemme bleed out and respawn.\"\n\n\"I don't want to <!i>kill<!i> you either!\"\n\nShe grabs his hand. \"Pleeeaaaaaase?\"\n\n...\n\nHe sighs. \"... Ugh. Okay. A couple more pints...\"");

			addSprite("assets/img/effect/afterCare.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			addChoice("Back.", junkCityExplore.bind("bloodbankhub"));
		}

		if (which == "roddybank1") {
			if (data.leakyHillsVisited) {
				temp.a = "\n\nYou give a little hello-again wave to Roddy. He blushes and waves back from his booth.\n\n";
			} else {
				temp.a = "\n\n";
			}

			append("Up close now you can tell the rats are brothers— the one under WITHDRAW has his crotch and stomach pressed through a hole in the glass wall, straps wrapped around his waist to hold him in place. They're tight enough to squish his buttmeat up a little. A sticker on his lower tummy reads \"Hello, my name is Roddy!\""+temp.a+"Opposite him is DEPOSIT, which is a much messier sight. \"Hello, my name is Jakky!\"\n\nJakky's the older brother by a few years. His hips are constrained tight to a circular hole in his glass booth, his soft-furred ratbutt sticking out for any rando to fuck and fill, his pucker gaped and drooling "+(isActive("Candy Ring")?"blue cakecream":"beige shitcum")+".");

			addChoice("DEPOSIT.", junkCityExplore.bind("roddydeposit"));
			addChoice("WITHDRAW.", junkCityExplore.bind("roddywithdraw"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddydeposit") {
			data.roddyDeposited = true;
			unlockJournal("Sperm bank");
			append("You turn to Jakky. The poor rat is panting and drooling, a cock ring cinched just above his nuts and a little pill-shaped vibrator lodged deep in his slit. His cock bulges fat with all that restrained cum, bloated at least five inches longer and a couple wider than it should be, his nuts hanging overheavy in their sack.\n\nYou puzzle over this depositing system. Cum goes in the back... but doesn't come out the front... you guess until his shift ends... but then, that's <!i>his<!i> cum, not—\n\nA zebra dude claps you on the shoulder. \"Don't think about it too hard, kid.\" He steps up and grabs two fistfuls of Jakky's ass, yanking the rat's cheeks apart. A squeak comes muffled through the glass. The zebra rears back and slaps over a foot of greasy cockmeat between them, grinding his shaft up and down, smearing "+(isActive("Candy Ring")?"cake":"shit")+"chunks and globs of "+(isActive("Mood Ring")?"rainbow":"")+"cum around.\n\nWith one powerful thrust he plugs his entire length up Jakky's ass and jizzes at that instant. You peer through the glass and watch the rat's pent-up cock twitch hard, throbbing up against his bulged belly; a tiny connected counter you hadn't noticed before ticks up to <!b>15 ml.<!b>\n\nThe zebra unplugs, somehow miraculously <!i>not<!i> dislodging a flood of cum and "+(isActive("Candy Ring")?"cake":"shit")+" at the same time, swipes his Septricard, and leaves.");

			if (data.hasCock || data.hasBoth) addChoice("Donate.", junkCityExplore.bind("roddydeposit2"));
			if (!data.roddyWithdrew) addChoice("WITHDRAW.", junkCityExplore.bind("roddywithdraw"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddydeposit2") {
			append("You nuzzle your cockhead up against Jakky's ruined ass nice and slow. Apparently that tickles, cause he whimpers and jerks in his restraints, and a messy little splutter of "+(isActive("Candy Ring")?"cake":"shit")+" paints your cock. The rat boy was looking over his shoulder up til then— now he turns away, red-faced, disgusted with himself~\n\nYou take after the zebra and grab him by both cheeks, pressing your thumbs on either side of his hole to pull it open even wider. Your head and the next couple inches slip in like nothing, displacing a squishy "+(isActive("Mood Ring")?"rainbow ":"")+"cocktail of cum from dozens of strangers which runs along the bottom of your shaft in hot dribbles, then, inch-by-inch, the rest sinks in... riiiiight until your nuts are pressed flat to the glass and Jakky's making little incoherent noises.");

			addChoice("Cum.", junkCityExplore.bind("roddydeposit3"));
			if (!data.roddyWithdrew) addChoice("WITHDRAW.", junkCityExplore.bind("roddywithdraw"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddydeposit3") {
			cumEffect();
			append("You pull back, revealing a shaft slick with "+(isActive("Candy Ring")?"blue frosting":"brown")+" and white, then drive your hips forward again. It's lucky he's restrained so tightly, because your next flurry of humps would've definitely knocked him over otherwise; you go absolutely ham on that ass, drawing out the cutest little squeals, fat splorts of "+(isActive("Candy Ring")?"cake":"shit")+" soon coating your nuts and inner thighs.\n\nOn the thirty-seventh thrust (so about five seconds later) you cum. Seems like he does too: his cock throbs extra hard and rhythmic, though only the tiniest drop of white manages to squeak past that viciously big vibrating cockplug.\n\nYou hold your cock as deep as possible inside him until the very last spurt, pumping his belly to the brim, then pull out with a sigh. Once again he keeps it all inside, despite gasping for breath and drooling and generally being miles away from any semblance of self-control.\n\n\"He's very good at his job!\" Roddy says behind you.");

			if (!data.roddyWithdrew) addChoice("WITHDRAW.", junkCityExplore.bind("roddywithdraw"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddywithdraw") {
			data.roddyWithdrew = true;
			unlockJournal("Sperm bank");
			append("You turn to Roddy just as a giraffe lady pulls her ass off his cock— she fucks off, swiping no card, apparently not even a customer. You guess she was just abusing him for her own pleasure. Anyway, Roddy's cock throbs tall and proud through the glass opening, a little red and swollen-shiny from the constant use— and of course smeared from tip to base with creamy giraffe "+(isActive("Candy Ring")?"asscandy":"shit")+". You merely approach and Roddy twitches right up to full mast.\n\n\"Please,\" he says past the glass, his hands flat against it. \"Be gentle...!\"");

			addChoice("Powerfap him with both hands!!!", junkCityExplore.bind("roddywithdrawfap"));
			addChoice("Clean him gently with my mouth~", junkCityExplore.bind("roddywithdrawclean"));
			if (!data.roddyDeposited) addChoice("DEPOSIT.", junkCityExplore.bind("roddydeposit"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddywithdrawfap") {
			append("\"Oh god,\" Roddy squeaks. \"Why did I say that?!\"\n\nWith an evil grin you wrap both hands around his shaft, rub his sensitive head hard with a thumb for starters... You lock eyes with Roddy and start off slow but firm-gripped, giving him a nice squeezy squishy "+(isActive("Candy Ring")?"cake":"shit")+"job, twisting your hands clockwise and counter-clockwise with each stroke. He goes ahegao immediately, letting his forehead thump against the glass. Soon you can't even see <!i>that<!i> past the fog of his panting...\n\nSo you speed up, jerking him faster and faster until chunks of "+(isActive("Candy Ring")?"blue frosting":"shit")+" fly from your fingers and his nuts become one bouncy blur. A high-pitched moan penetrates the fog... you think that means he's close.");

			addChoice("Let er rip!", junkCityExplore.bind("roddywithdrawfap2"));
			if (!data.roddyDeposited) addChoice("DEPOSIT.", junkCityExplore.bind("roddydeposit"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddywithdrawfap2") {
			append("You slam both hands down to the base, slip the lower over his nuts, and squeeze hard. With one final throb Roddy shoots a champion-sized rope of "+(isActive("Mood Ring")?"toxic lime-green":"")+"cum ceiling-ward so hard that it ricochets off one of the hanging prisms. The fog on the glass clears within seconds as he inhales and holds frozen.\n\n(Your talents took his breath away.)\n\nThe weaker spurts fountain out over his cock and tummy, and his breath returns in one huge sigh. \"Sensitive!\" he squeaks, \"Sensitiiiive!\"\n\nYou mercifully pull your hands off. He sighs, cock drooping to half-erect. Every now and then it twitches and a little more cum dribbles from his slit.\n\nA beefy looking banker in a suit taps you on the shoulder. He's got a single rope of "+(isActive("Mood Ring")?"cheery lime ":"")+"cum stuck to his dark expression.\n\n\"Yo, player... you even got an account here?\" he asks. Roddy hurriedly comes to your defense, telling the banker to take it out of his paycheck.");

			if (!data.roddyDeposited) addChoice("DEPOSIT.", junkCityExplore.bind("roddydeposit"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddywithdrawclean") {
			append("You start with a kiss, plucking a single chunk of "+(isActive("Candy Ring")?"tasty cake":"shit")+" from Roddy's cockhead betwixt your lips. He shivers, bucking his hips a little on instinct. \"Thank you,\" he sighs. \"Too many people just take 'Be gentle' to mean 'Abuse my cock as hard as you can'...\"\n\nYou slide your kiss sideways down his shaft, a fine film of "+(isActive("Candy Ring")?"frosting":"shit")+" coagulating at the corners of your mouth. You pull back up, back down, over and over, vertically circling his permahard cock, even dipping down to suckle at his sack for a bit. He squirms and whimpers in his bonds, the anticipation killing him... Once it's mostly clean, only tinged a little "+(isActive("Candy Ring")?"blue":"brown")+", you pull off and prepare yourself. You open your mouth, hovering above his head... then pause.\n\nInstead of sucking him, you simply lower your open lips over his head, his shaft... until his slit presses to your uvula and no other part of cock and mouth touch at all.\n\nRoddy bites his lip.\n\nStill without closing your lips around his cock you push deeper, giving him a pure and simple throatjob, allowing your lips to brush only merely over his shiny-wet nuts, swallowing hard on his head, over and over and over.\n\nIt's just too much. He cums down your throat, smooth stomach heaving in time with your surprised gulps. "+(isActive("Mood Ring")?"Tastes like limes~!\n\n":"")+"You guess you're just too good at sucking (or selectively <!i>not<!i> sucking) cock...\n\n\"Hahhh,\" he pants, giving you a shy smile as the last spurts pour over your held-out tongue. \"Really... thank you.\"");

			if (!data.roddyDeposited) addChoice("DEPOSIT.", junkCityExplore.bind("roddydeposit"));
			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "roddyferalfuck") {
			append("There is no containing Bert's excitement. The moment she loosens his leash he's got both paws up on the glass and his doggycock against Jakky's taint. \"Hi Rox,\" Jakky says, all meek, while her dog cutely tries to get it in, slipping and sliding up the rat's asscrack.\n\n\"Hey ratbitch!\" she says, playfully spanking his helpless, exposed ass. \"Didn't think you were on shift today.\"\n\n\"They called me in...\" he laments.\n\n\"Well, it's good thing. You're Bert's favorite public fuckhole, y'know that~?\"\n\nAt that moment Bert strikes gold, slamming his cock and knot in with one brutal thrust. He looks back at his mommy with a proud, panting smile. Rox rolls her eyes. \"Yes, congratulations, you little butt. You finally managed to get into the slipperiest, most gaped hole in the City in only— what, ten or twelve tries?\"\n\nBert clearly hears the sarcasm in her tone and whines, eager for praise, not sass; he goes about getting that by standing on his hind legs and humping viciously hard into Jakky's stretchy pucker. The rat grunts and grits his teeth. Instead of praise, Rox chastises him: \"Come on, boy, you can buttfuck him harder than that~!\"\n\nBert doubles his speed, pounding his favorite hole so hard his nuts start banging up against Jakky's taint. He licks at the glass pointlessly, trying to give some affection to Jakky too— the rat manages a grimace-smile at that. You try to stick around long enough to see Bert cum, but after thirty minutes of pure unrelenting knotfuckery, the formation of a massive line, and <!i>still<!i> no end in sight... you're forced to give it up.");

			addChoice("Look around.", junkCityExplore.bind("snagglebank interior"));
		}

		if (which == "ExploreWorldShop") {
			BrightForest.brightForestExplore("ExploreWorldShop");
		}

		if (which == "ExploreLLL") {
			LLL.libraryExplore("explore");
		}

		if (which == "ExploreHippy") {
			var s:MintSprite = addSprite("assets/img/effect/deerGirl.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			if (data.hippyFortunes.length != 0) {
				append("A deer hippy stands half-asleep on the streetcorner.\n\n\"Penny for my thoughts~?\" she mumbles.");
				addChoice(
					"Sure.",
					junkCityExplore.bind("hippyget"),
					{cost: ["Capsule", 1]}
				);
				addChoice("Avoid her.", function () {
					disableExplorable(81);
					junkCityHub();
				});
				addChoice("Move along.", junkCityHub);
			} else {
				disableExplorable(81);
				if (canGain) addToItem("Capsule", 31);
				append("The deer hippy gives you back all of your caps in a big double-handful.\n\n\"Ahhh... after all that, my mind's nice and gaped. Got space for some fresh thoughts.\nThanks for listening.\"\n\nShe curls up into a little ball on the sidewalk, using her dress as a bed/blanket.\nIt barely covers her upper half; below, that smooth-furred deerbutt and poofy tail\nstick way out for passerby to ogle.");
				addChoice("Thank you for all your wisdom, Mrs. Deer.", junkCityExplore.bind("hippyend"));
				addChoice("Move along.", junkCityExplore.bind("hippyend"));
			}
		}

		if (which == "hippyend") {
			append("Just as you're about to leave you realize she slipped a piece of taffy into your pocket when she handed you all those capsules.\n\n... You go to thank her, but she's already snoring, and some dude already snuggled up and started sleepfucking her...");
			Theme.addUiChoice("taffy");
			addChoice("Move along.", junkCityHub);
		}

		if (which == "hippyget") {
			var element:String = pickOne(data.hippyFortunes);
			data.hippyFortunes.remove(element);

			append("\""+element+"\"");
			var s:MintSprite = addSprite("assets/img/effect/deerGirl.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			addChoice(
				"Another one.",
				junkCityExplore.bind("hippyget"),
				{cost: ["Capsule", 1], enabled: data.hippyFortunes.length > 0}
			);
			addChoice("Move along.", junkCityHub);
		}

		if (which == "ExploreCade") {
			unlockJournal("Cade");
			data.knownAsPlayer++;
			unlockJournal("Missing Page 7");
			msg("Found Missing Page #7", true);
			playSound('assets/audio/environment/journalPage');
			append("You stroll through suburbs doused in greasy yellow lamplight. A distant dog finishes his barking fit and settles down for the night.\n\nA single page floats down to rest at your feet. Just as you bend to pick it up, someone gasps behind you: \""+(data.knownAsPlayer > 1?"No way...":"Oh no way, a <!i>PLAYER!?<!i> Holy moly, this is awesome!")+"\"\n\nA white tiger dressed casually enough to walk the streets rushes out in front of you.\n\n\""+(data.knownAsPlayer > 1?"":"No way, you're a REAL player! ")+"My name is Cade— you have GOT to come to this party that my friends and I are hosting!\n\nThe excitable feline "+(data.hasBoobs?"tucks something between your tits":"pushes something to your chest")+". It's a card, decorated with little figures that you don't recognize. Cade waits eagerly for a response.");
			addChoice("I guess I'll drop by, but there better be snacks. >:3", junkCityExplore.bind("cadeaccept"), {kinks: ["Patreon Commission", "Guest Writer", "Male"]});
			addChoice("A party? What kind of party?", junkCityExplore.bind("cadequestion"));
		}

		if (which == "cadedecline") {
			append("\"Oh, right... I guess that... that a player really wouldn't have time to go to— to parties or anything like that, huh? Sorry...\"\n\nHe walks away, tail between his legs.");
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadequestion") {
			append("\"Just a get-together with my friends and anyone who cares to show up, nothing too insane. But it'd be incredible if <!i>the<!i> player showed up... may even get a little <!i>crazy<!i> maybe.\"");
			addChoice("Sure, I'll come. But there better be snacks. >:3", junkCityExplore.bind("cadeaccept"), {kinks: ["Patreon Commission", "Guest Writer", "Male"]});
			addChoice("Should I dress casual, like you? Or is it... no clothing allowed~?", junkCityExplore.bind("cadequestion2"));
		}

		if (which == "cadequestion2") {
			append("\"There's no dress code— but— wha— would... would you really want to see me naked?\"\n\nHis tail poofs up drastically.");
			addChoice("Maybe~", junkCityExplore.bind("cadequestion3"));
		}

		if (which == "cadequestion3") {
			data.cadePartyNude = true;
			append("His face steams up. \"Well... um... if that'll make you come...\"\n\nHe realizes what he just said.\n\n\"—TO THE PARTY! I meant if that'll make you come to the party then, sure, it can be a no-clothes thing!!\"");
			addChoice("If you really want to lure me there, promise me snacks. >:3", junkCityExplore.bind("cadeaccept"), {kinks: ["Patreon Commission", "Guest Writer", "Male"]});
		}

		if (which == "cadeaccept") {
			data.cadeAccepted = true;
			Theme.addUiChoice("stranger");
			if (data.metGryphon > 0 && !data.cadePartyDone) addExplorable(109, "Junk City", junkCityExplore.bind("ExploreCadeParty"), 1, 1);
			GameData.reInitRefs();
			msg("<!img:kink/Guest Writer.png> Guest Writer: Cryptic", true);
			append("\"Oh, yeah, there'll be plenty of snacks, even more now that you're coming! Oh man, T is going to FLIP when he hears this.\"\n\nCade can barely contain his excitement...\n\nHe clasps his hands and stares into your eyes for a second. \"Oh, one more thing. I'm really sorry about my hand writing, I'm not very good at it. You shouldn't have any issues though. See you there, "+data.playerName+"!\"");
			addChoice("Seeya.", junkCityExplore.bind("cade1"));
		}

		if (which == "cade1") {
			StoryUtils.quickMynt("Cade");
			append("His writing really is bad. The address is hopelessly smudged, so you sort of have to guess at it based on the peripheral details.\n\n<!i>Beside [...] cute park bench [...] noisy seagull neighbor [...] crashed the last party [...]<!i>\n\nYou follow the squawks and come across a row of houses. One house stands opposite a pink bench. A bunch of gullgirls cackle on the porch next door. The front door looks... broken? And there's no music coming from inside...\n\nYou turn the card over for more clues, which you probably should've done before, and it says: \"Follow the directions and join the fun... the front door is broken, so hop in through the back, okay? Don't worry, it's unlocked and you will be expected! See you soon!\"\n\nAlright, well... this seems like the place.");
			addChoice("Hop in through the back.", junkCityExplore.bind("cade2"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cade2") {
			append("You head around back.\n\nThere's a big iron fence with no gate...");
			addChoice("Well, I made it this far. Jump it.", junkCityExplore.bind("cade3"));
			addChoice("Too much effort, give up.", junkCityHub);
		}

		if (which == "cade3") {
			append("After a couple tries and the acquisition of a few bar-shaped dents on your face, you finally make it over.\n\nYou land with a <!i>squeak.<!i>\n\n...?\n\nYou lift your foot up. <!i>Squeeeeeeeeee...<!i>\n\nIt's a dog toy, chewed to pieces.\n\nFurther down, a broken chain glints in the moonlight.\n\nAnd even further... two eyes glow within the shadows of a doghouse.");
			addChoice("Uh oh.", junkCityExplore.bind("cade4"), {kinks: ["Feral", "Male"]});
			addChoice("Jump back over the fence!!!", junkCityExplore.bind("cadeescape"));
		}

		if (which == "cadeescape") {
			append("The dog sprints for you, teeth bared, a snarling ball of rage and fur.\n\nYou miss the first jump.\n\nHe's three bounds away. You can smell his breath.\n\nThis time you make it, your foot slipping out from between his jaws, and topple over onto the other side.");
			addChoice("Jeez... move along...", junkCityHub);
		}

		if (which == "cade4") {
			append("You say \"Uh oh\" and press your back against the iron fence instead of trying to run or anything.\n\nA lumbering, muscled german shepard comes out, growling, pulling in your scent with steamy breaths. Between his taut hind legs hangs a fat sheath— he's a boy.\n\n... You know what to do. ;3");
			addChoice("Drop to all fours.", junkCityExplore.bind("cadesub1"));
			if (data.hasCock || data.hasBoth) addChoice("Assert my dominance.", junkCityExplore.bind("cadedom1"));
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadesub1") {
			append("You turn around and drop on all fours, looking back at the shepard. He's stopped. The canine cocks his head, as if he was not expecting things to have taken this turn so suddenly.\n\n\"Come on... big fella...\" you say to yourself. You're afraid this isn't going to work.\n\nThe dog walks over to where you are, not quite as sinister as before. He leans in, breathing hot on your "+pickByGenitals("anus", "bare pusslips", "anus")+"...\n\nYou shudder. This wasn't <!i>quite<!i> the party you thought you'd be having, but hey.");
			addChoice("Next?", junkCityExplore.bind("cadesub2"));
		}

		if (which == "cadesub2") {
			append("You feel the dog's cold, wet nose press against your "+pickByGenitals("hole", "lips", "hole")+" followed by the warmth of his tongue. His lustful licks continue with quite a bit of force, thoroughly lubricating you, parting your sex wider and wider with every glide of his warm, prehensile organ.\n\nSuddenly, the canine jumps up and attempts to mount you, resting his front legs on your hips as he pulls his groin into your backside. He presses his sheath to your rear. You can feel the hot flesh of his tip sit at your opening but he's so excited his whole sheath presses inward, as if he's trying to insert that into you instead of his member...");
			addChoice("Just take him like a good breeding bitch~", function () {
				data.cadeResisted = false;
				junkCityExplore("cadesub3");
			});
			addChoice("Resist~", function () {
				data.cadeResisted = true;
				junkCityExplore("cadesub3");
			}, {kinks: ["Abuse"]});
		}

		if (which == "cadesub3") {
			append("The dog "+(data.cadeResisted?"starts slamming his hips at the same time that you start struggling":"begins thrusting his hips")+". You can feel his tip "+(data.cadeResisted?"stabbing":"poke and prod")+" at your entrance. You feel the tip of his member barely make its way inside of you.\n\nHe pauses.\n\nThen, just as suddenly as he mounted, he "+(data.cadeResisted?"forces":"pushes")+" his way into your "+pickByGenitals("ass", "cunt", "ass")+". Pain shoots up your spine as the feral vigorously breeds your hole. His thrusts are wild and inconsistent, almost spastic. You feel every inch of his member push itself deeper and deeper into your body as his sex swells with lust.");
			addChoice((data.cadeResisted?"Claw at the dirt~":"Move my hips up a little for him."), junkCityExplore.bind("cadesub4"));
		}

		if (which == "cadesub4") {
			append((data.cadeResisted?"You rake at the mud, making pitiful little whines. The":"You try to adjust yourself, but the")+" shepard's got you pinned.\n\nYou notice a small bump constantly pushing itself in and out of your "+pickByGenitals("butt", "puss", "butt")+", getting bigger with every thrust. It's his deflated knot!\n\nThe dog grunts with every thrust now, pressing his jaw against you and really getting into it. His rhythm gets steadily heavier. His knot swells, and he starts having issues pushing it in and out. With one final thrust of his hips, he launches his member into your depths, knot pushing its way inside one last time.\n\nOops, nevermind, that wasn't the final thrust at all. He winds up into a "+(data.cadeResisted?"brutal knotrape":"knotfuck")+", delving his fat knob about an inch deeper with every movement.\n\nAfter a while he tenses and pulls his front legs inward, pushing himself into you as deep as he can. His seed spills into you, every pulse of his heartbeat and his own release pouring through your "+pickByGenitals("ass", "puss", "ass")+".\n\nThe dog stops and pants heavily. Your groin feels numb. Your sides ache. "+(data.cadeResisted?"Blood drips from your sides where his claws held firm":"Your sex is steadily dripping")+".\n\nThe canine turns 180 and jumps off, panting, knot still stuck firm inside of you.");
			addChoice("Easy boy... easy...", junkCityExplore.bind("cadesub5"));
		}

		if (which == "cadesub5") {
			append("You're both rear-to-rear now. The dog pumps the last of his seed into you. You realize that his knot is too big to push out by itself. You have no choice but to wait it out...\n\nAfter half an hour of laying in the tall backyard grass with a "+pickByGenitals("buttful", "snatchful", "buttful")+" of dog dick, he finally tugs and ejects his knot from your insides, sliding with some trouble past your "+(data.cadeResisted?"abused orifice":"well-fucked hole")+". The pressure inside begins to relieve itself as feral seed spills out, dripping down your legs and into the grass below. The canine turns around and begins lapping up his mess, tongue delving without issue.\n\nOnce you've received "+pickByGenitals("a thorough rimming", "some thorough cunnilingus", "a thorough rimming")+" the great german shepard retreats into his doghouse, licking and tending to his sore rod...");
			addChoice("Try to... find the invitation.", junkCityExplore.bind("cadeend"));
		}

		if (which == "cadeend") {
			data.cadeDone = true;
			append("You find it half-soaked in mud... well, if you couldn't read it before, you definitely won't be able to now.\n\nBut just then, completely untouched by the mud, you notice a few perfectly legible words:\n\n<!i>Party starts tomorrow!!<!i>\n\n... Goddammit.");
			addChoice("Move along.", junkCityHub);
		}

		if (which == "cadedom1") {
			append("You puff out your chest and swagger towards him. The whites of the canine's eyes widen on either side. He shifts from aggression to alarm. He holds his ground and meets your glare, though his hind legs twitch and he clearly wants to back up.");
			addChoice("All bark and no bite, huh? (Block the entrance.)", junkCityExplore.bind("cadedom2"));
		}

		if (which == "cadedom2") {
			append("Before he can scoot back inside his doghouse you grab him by the scruff and put yourself between him and the door. He wriggles free pretty easily— you didn't hurt him— but now his tail slips between his legs and he bows his head. You guess he's really a timid little softie.\n\nSlowly, too nervous to look away, he turns around and points his butt at you.");
			addChoice("Hold him.", function () {
				data.cadeAlpha = false;
				junkCityExplore("cadedom3");
			});
			addChoice("Show him who the alpha is.", function () {
				data.cadeAlpha = true;
				junkCityExplore("cadedom3");
			}, {kinks: ["Abuse"]});
		}

		if (which == "cadedom3") {
			append("You "+(data.cadeAlpha?"wrap a hand around his neck and push his head to the soft grass":"weave your fingers into the fur of his left flank while your free hand scratches behind his ears")+", immediately ceasing any resistance. The feral goes silent and lowers his upper body to the ground, presenting himself to you.\n\nYou kneel behind him and look at his fleshy entrance, clean and pink. He takes amazing care of himself, for a dog. Either that or he's got a very loving owner.");
			addChoice("Spit on his hole.", junkCityExplore.bind("cadedom4spit"));
			addChoice("Rim that doggy donut~", junkCityExplore.bind("cadedom4rim"));
		}

		if (which == "cadedom4spit") {
			append("You bullseye the dog's pucker with a fat loogie, pausing for a moment to watch it ooze over the lower rim when he twitches.");
			addChoice((data.cadeAlpha?"Fingerfuck that ass as deep as possible":"Finger him")+".", junkCityExplore.bind("cadedom5"));
			addChoice("... Okay... <!i>now<!i> rim his doggy donut~", junkCityExplore.bind("cadedom4rim"));
		}

		if (which == "cadedom4rim") {
			append("You spread his fluffy buttcheeks with a thumb and drive your tongue between them, slobbering "+(data.cadeAlpha?"aggressively":"gently")+" over his hole, making out with it hard enough to send quivers down his hind legs.\n\nWhen you pull off a single strand of clean saliva still connects your mouth to his pucker. Two beads roll onto it from his soaked hole.");
			addChoice((data.cadeAlpha?"Fingerfuck that ass as deep as possible":"Finger him")+".", junkCityExplore.bind("cadedom5"));
		}

		if (which == "cadedom5") {
			append("With his tailhole properly lubed, you bring the tip of your index finger to it and "+(data.cadeAlpha?"drive the whole thing in right away, drawing a shiver of pleasure from the little doggyslut":"start prodding a little")+". The fleshy walls of his sphincter envelope your digit in a second, tightening hard enough to push out a few droplets of your hot saliva. "+(data.cadeAlpha?"You hilt your knuckle over and over, brutally fast, dragging about an inch of assmeat each time you pull it out":"Finally, with a gentle <!i>pop<!i>, the knuckle hilts")+".\n\nYou slowly bring the index finger of your opposite hand up to his entrance and insert it as well, pulling the velvety walls of flesh apart, gaping the canine as wide as he can comfortably go— which is pretty wide. Clearly he's been buttfucked before... from the feel of it, maybe even a few hours ago.\n\nHis member's fully out of the sheath now, dangling between his legs. He must be enjoying this...");
			addChoice("Fuck him.", junkCityExplore.bind("cadedom6"));
		}

		if (which == "cadedom6") {
			append("You rock your hips up, bringing the tip of your erection to the dog's "+(data.cadeAlpha?"abused":"gaped")+" hole and slipping it inside without more than a nudge. "+(data.cadeAlpha?"That's enough to drive you wild. You cram the whole length up his little ass at once, drawing an adorable moan-yipe from him as your nuts grind and throb against his":"The rest of your cock sinks just as easily into those warm doggy depths, his anal canal massaging your shaft as you press deeper and deeper")+". The submissive shepard backs his ass up into your crotch, clearly pining for more, his tail wagging across your "+(data.hasBoobs?"tits":"chest")+".");
			addChoice("Cum.", junkCityExplore.bind("cadedom7"));
		}

		if (which == "cadedom7") {
			cumEffect();
			append("As time goes on you feel the need to "+(data.cadeAlpha?"shove":"rest")+" a hand on his head once more, pushing it to the grass whle his tongue lolls out of his maw.\n\nYou use your new grip to keep steady while you breed the fuck outta him, climax fast approaching. You thrust faster and faster up his ass, those fleshy walls tugging bursts of pre from you with every movement of your hips. Finally, you pull out til just the tip of your cock stays embedded, then "+(data.cadeAlpha?"slam back in deep enough to flatten the hard little nub of his prostate, grinding your slit over it":"rocket down as deep as you can go, forcing out a long, horny little whine from him")+".\n\nYour seed erupts and coats his insides, gushing onto the grass, rolling in rivulets down the soft-furred insides of his shaking legs. You pull out, hilt, pull out, and hilt one last time in rhythm with the pangs of your orgasm, holding him still and pumping it all up into his little tummy as best as you can.");
			addChoice("Fwaaa... Wind down.", junkCityExplore.bind("cadedom8"));
		}

		if (which == "cadedom8") {
			append("You pull out.\n\nHis hole is aboslutely wrecked, gaped so wide his owner is definitely gonna notice. Cum floods out in great globs, pattering down onto his throbbing nuts. There are two distinct cum-ponds forming on the grass now: yours, and another underneath his softening member... he must have climaxed too, somewhere in the fray.\n\nYou flop down butt-first on the grass, making sure not to accidentally sit in one of the steaming puddles.\n\nHe looks at you meekly, eyebrows raised, hind legs still spread and tail still up high.");
			addChoice("Yes, you have permission to stop riding my dick now.", junkCityExplore.bind("cadedom9"));
			addChoice("Get outta here, you.", junkCityExplore.bind("cadedom9"));
			addChoice("Thanks, doggyslut.", junkCityExplore.bind("cadedom9"));
		}

		if (which == "cadedom9") {
			append("The german shepard wobbles back to his doghouse and lays down, folding over to slurp your "+(isActive("Mood Ring")?getMood("You"):"")+"cum from his ass while it's still hot.");
			addChoice("Where did that invitation go...", junkCityExplore.bind("cadeend"));
		}

		if (which == "ExploreScrap") {
			var noUnlock:Bool = pauseIsGoingPrev();
			if (noUnlock) junkCityHub();
			append(pickOne(["The Boys roll by in their garbage truck. A chunk of reclaimed metal UI falls out the back and skitters across the pavement to stop at your feet.", "\""+pickByGender("Sir", "Miss", "Excuse me")+"!\"\n\nA cub scurries up and tucks a chunk of UI into your palm. It doesn't have any distinct temperature, but you get the feeling that it'd be nice and warm if it did.\n\n\"This fell out from between your buttcheeks,\" she says. \"What's that? You didn't tuck it in there? Oh. Well, someone did...\"", "A piece of metal falls from a skyscraper nearby and craters the sidewalk where it lands.\n\nOh, that's... a UI piece...?", (data.metLana>0?"Lana the fox librarian":"A fox boy in a turtleneck")+" approaches you. He's got something metallic clutched in his cautious, unstable little paws.\n\nHe pushes it and a note into your palms, nods, and strolls away.\n\nThe handwriting is jerky and crossed-out in dozens of places where he had to start over.\n\n<!i>A gift. Only spawn when players play. Pretty. Nice to see one again. We tested this sample lots. They're safe.\n\n"+(data.metLana>0?"Thanks for your visit":"Come visit the L.L.L. sometime")+".<!i>", "A burly beaver throws something shiny into traffic. It bounces off a hubcap and beans you in the face.\n\n\"Fuckin croc said it was worth more than wine,\" he complains to his buddy, \"but the fuckin shop wouldn't even register it. Said it doesn't exist. Man, I got ripped off...\"", "You stroll around the outskirts of Septrica's, where dozens of junk refineries chug away.\n\nOld appliances, sex toys, cars, and junk chunks are getting ripped apart and repurposed. She's found a way to channel the constant, destructive sexual energy of the doms by mixing in subs with the junk that needs to be broken down. Likewise, for the subs, she's strategically planted fat dildos among the pieces of scrap that need to be thoroughly cleaned, polished, and hugged/humped/tugged back into something useful.\n\nOne sub, a raccoon boy, scratches his head... he's been sucking a  little piece of scrap for hours, but it just won't get any cleaner. He tosses it over his shoulder and moves to the next pile.\n\nYou snag it. It's a little piece of UI!", "You find a little piece of UI in the gutter.\n\nSomeone pissed on it...", "Two shaggy alley dogs race each other down the main street, knocking over pedestrians. A UI piece falls loose from the winner's fur."]));
			Theme.unlockRandomPiece("scrap");
			addChoice("Avoid these.", function () {
				disableExplorable(132);
				unlockUi("scrap", "all", false);
				junkCityHub();
			});
			addChoice("Move along.", junkCityHub);
		}
	}

	public static function work(which:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		saveCheckpoint("JunkCity.work('"+which+"');");
		clear();

		function reroll():Void {
			clear();
			explore("Work");
		}

		//B- 55 TROPICS\nB- 52 LOVE SHACK\nB- 34 MYSTERY ZONE\nB- 14 DOG PARK\n - 04 SUMO\n - 42 GALACTIC\n - 74 FIRING RANGE
		if (which == "work1") {
			append("A quiet client wants you to stay a while with him on floor <!i>B- 34: MYSTERY ZONE.<!i>");
			addChoice("Accept.", work.bind("work1next"), {kinks: ["Male", "Hyper"]});

		} else if (which == "work1next") {
			append("You step out of the elevator into... nothingness.\n\nBefore you can call out for anyone, a soft pair of invisible hands closes around your waist. Warm fingers of air trail your thongstring. Those hands move down to your asscheeks and squeeze each one in turn, honk honk, while a mouthless voice whispers right into your ear:\n\n\"I am formless; I am eternal; and I am horny.\"\n\nYou spend the next hour or two getting your ass gaped open by ghost(?) cock. It's incredibly arousing to look over your shoulder and see the soft pressure of his fingers on your skin, to see your pucker yawn and stretch seemingly just on its own as he crams probably about twenty inches right up to your stomach and bulges it with throbbing, hot nothing. <3");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work2") {
			append("A futa client and her dog want you on floor <!i>B- 14: DOG PARK.<!i>");
			addChoice("Accept.", work.bind("work2next"), {kinks: ["Intersex", "Male", "Feral"]});

		} else if (which == "work2next") {
			append((data.roxVisits > 0 ? "Roxelle waves you down drunkenly. Her sheepdog Bert runs over and immediately starts slobbering on your "+pickByGenitals("nuts", "cunt", "nuts and cunt")+" through the thong with a big dumb doggy grin on his face":"A futa cow and her sheepdog wave you down politely")+".\n\nThis floor is a perfect simulation of a park. All the invisible walls have been hidden with big fake bushes and trees, and there's even a little artificial doggy beach where swimsuited furs fuck and cuddle their puppies in the shallow water.\n\n\""+(data.roxVisits > 0 ? "Well,\" Rox says, yanking the elastic of your thong and letting it snap back with a sting, \"get on your knees, breeding bitch":"C'mon Bert,\" she says, leading him around to your asscrack, \"the nice bimbo wants you to knot "+pickByGender("him", "her", "them"))+".\"\n\nYou have no choice here. You're on shift, after all.\n\nYou drop to your hands and knees obediently and let the little sheepdog grind his fat doggy dick up between your cheeks, moaning into the grass every time his knot swells and grinds over your pucker.\n\nEventually he starts throwing his hips forward against you. With a little coaxing from "+(data.roxVisits > 0 ? "Rox":"the cow")+" (and her finger pulling aside your thong) it only takes three good tries before he forces your ass open and knotfucks you into the ground with thrusts so rapid and sloppy they could only be delivered by the hips of an overexcited doggywhore.\n\n\"That's it,\" she says, squatting over your face and so you can moan into her heavy nutsack. \"Take that puppydick~\"");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work3") {
			append("Two boys want you on floor <!i>- 42: GALACTIC.<!i>");
			addChoice("Accept.", work.bind("work3next"), {kinks: ["Male", "Male", "Cub"], faCensor: true});

		} else if (which == "work3next") {
			append("This floor is a planetarium. The ceiling is wide and domed and full of stars.\n\nA crowd of nerds from the L.L.L. has gathered. They're all chattering obsessively about the show tonight: a dramatization of some cosmic-scale physics from the upper universe. Most of them have their notepads out, scribbling or doodling.\n\nTonight's show portrays The Milky Way and Andromeda's inevitable collision. Both galaxies will be (naturally) played by a cub boy up on a harness.\n\nMilky is a pale-furred catboy on one side of the dome; Andromeda is a fat-assed siamese on the other, his little crotch decked out with the finest clit glitter in order to imitate stars. You go around as a fluffer, sucking nerd cocks.\n\nThe show begins. Both boys swing slowly back and forth, building up momentum, until finally <!i>SMACK<!i>—\n\nThey collide right in the middle. Just as Milky's tiny boycock frots up against Andromeda's, both boys throw their arms around each other and cum with truly cosmic shivers.\n\n... Neither of them speak to you, even though they called you to be here. They're busy passionately making out mid-air. You think you're just here to beef up the crowd and to coax a few nerdgasms out into your mouth. This show doesn't seem very popular among people who aren't fascinated by the upper world.");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work4") {
			append("A female client wants you to look for her love getaway on floor <!i>B- 52: LOVE SHACK.<!i>");
			addChoice("Accept.", work.bind("work4next"), {kinks: ["Female", "Abuse", "Love"]});

		} else if (which == "work4next") {
			append("This floor is literally just a shack and a jukebox, but for some reason people love to hang out here? You guess there's sort of a no-frills appeal to it. You're either fucking inside the shack or outside the shack.\n\nMost people follow the love theme and act affectionate, but there's a hyena gang who find affection even hotter when it's interspersed with hard abuse. Love takes many forms, according to them.\n\nYou find your client pretty quick: "+(data.hyenaDone?"Marlene the hyena chick":"a hyena chick")+", glaring at your pathetic thong'd ass with her chin tilted up imperiously. She's got chunky facial piercings, ripped stockings, blue lipstick, six barettes, pigtails, and a miniskirt that barely hides her puffy pussy. It throbs and leaks, already glowing rosy with anticipation.\n\nWith only a grunt for a greeting she forces your face between her legs, two hands on your head, and starts using you as her cuntrag. Hot yeen oils gush over your face, up your nose... and you sneeze, which only makes her more repulsed by you.\n\nFollowing her group's philosophy, she whispers mean things in your ear at times— \"Suck my cunt bitch\" or \"Slobber harder ya little bimbo\"— but, other times, she switches gears to affection and runs her fingers through your hair with almost zero downward pressure, letting you gobble her pussy at your own pace, and one time you swear she intentionally pulls back and feigns conversation with a boy from her gang just so you can get a breather in.");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work5") {
			append("A male client wants you on floor <!i>- 74 FIRING RANGE.<!i>\n\nSpecial instructions: \"Forget the "+(data.genderMale?"faggy ":"")+"thong and just come naked. Oh— and act like you hate it, ya?\"");
			addChoice("Accept.", work.bind("work5next"), {kinks: ["Male", "Male", "Male", "Male", "Male", "Abuse", "Gore", "Snuff"]});

		} else if (which == "work5next") {
			append("You step into the firing range, completely nude.\n\nA dozen burly dudes fall on you all at once, coyotes and wolves and bears and hyenas, teeth bared, snouts snuffling at the scent of fresh snuffmeat. Fat, floppy dicks jostle against every part of your body, even in the tight little crooks of your armpits and knees. Surely if you'd kept your thong on it would've just been one more annoyance to yank out of the way (like your thighs or your arms) in their single-minded quest to destroy your worthless bimbo body as fast as possible.\n\nFists shower mercilessly on your "+pickByGenitals("cock and nuts", "mound and inner thighs", "cock and nuts and cunt")+" til they're swollen, shiny, and radiant with bruises. One guy grabs you by the hair and clocks you in the face, forcing you to ask him \"Am I pretty yet?\" which he always answers with \"Fuck no\" and another punch.\n\nIn about five minutes, this sweaty hurricane of muscles and cocks has turned you into a mottled purple punching bag that can't speak or make rational decisions, only grovel on the floor, snot and tears running down its \"pretty\" face. Both your arms are broken. They stomped on one of your ankles til it cracked because they thought it would be funny to watch you try and stumble away before they dragged you back. Random dudes come over just to laugh at your cute little strugglings and spit on your face while you're raped from both ends, or to sit their heavy asses down on your chest and keep you pinned and breathless. Everywhere you turn there's another cock to service: cut, uncut, dripping, sweaty, huge, small, puking pre or going in bone dry.\n\nAfter raping and abusing you and overflowing your throat"+pickByGenitals("and ass", "ass, and cunt", "ass, and cunt")+" with ropes of chunky brojizz, they finally haul over a double-barrel shotgun and make you deepthroat it— if you gag on this, they explain, you fucking die.\n\nOf course you suck the gun like it's a cock, trying your best to gauge their reactions by sound since both your eyes are blackened and puffed-shut, but of course they don't stop thrusting it until the barrel finally rubs your uvula the wrong way and your broken whore body tenses up in a nasty little gag, and—\n\n<!i>POW!<!i>\n\n...\n\n(You respawn and help them clean up the mess, shaking hands and returning high-fives from the dudes who loved your performance. :3 They say they'll put in a good word and get you paid extra.)");
			if (canGain) addToItem("Nuts and Screws", rndInt(15, 25));

		} else if (which == "work6") {
			append("A female client wants you on floor <!i>B— 48 SEWERS.<!i>");
			addChoice("Accept.", work.bind("work6next"), {kinks: ["Female", "Raunch", "Raunch", "Raunch", "Vomit"]});

		} else if (which == "work6next") {
			append("<!i>Ding.<!i>\n\nThe moment the elevator opens, utter putridity assaults your face. The stank of this room is so fierce you can almost feel it gumming up in your throat, your nostrils, and under your eyelids. Fuck, you can't even keep those open; it stings too much.\n\nSome fat pig bitch grabs you by your hand and leads you inside, making \"small talk\" about how they needed a temporary "+(isActive("Candy Ring")?"garbage can for all their hard candy":"pukebucket")+" and you're such a cute "+(isActive("Candy Ring")?"candidate":"pukerag")+" and you'll do just fine and make sure to "+(isActive("Candy Ring")?"suck":"chug")+" <!i>every last "+(isActive("Candy Ring")?"piece":"chunk")+"<!i> you little "+(isActive("Candy Ring")?"candycunt":"pukemop")+" and... dozens of other "+(isActive("Candy Ring")?"candy":"puke")+"-portmanteaus she apparently got from a trip to Hyper Land the other day...\n\nYour bare knees hit the "+(isActive("Candy Ring")?"sugar-coated":"grimy")+" metal floor. Six piggy girls— a whole family?!— crowd around you, their glistening pink guts each individually a-gurgle. The first leans over and peels your maw open with two fingers before opening her own. You stare down her throat through squinted lids: it's cavernous, laced with "+(isActive("Candy Ring")?"bright pink candy bits":"murky saliva strings, and fat chunks of undigested food from some earlier upchuckery cling to her dangling uvula")+".\n\n\"Open,\" she oinks.\n\nYou open your mouth like a good "+(isActive("Candy Ring")?"candycunt":"pukemop")+".\n\n"+(isActive("Candy Ring")?"Pink-and-purple hard candies":"Beige-and-brown bubbles")+" start to burble up from the bottom of her throat. Her snout twitches with the "+(isActive("Candy Ring")?"tantilizing sweetness of their scent":"stench of her own rising belly gasses")+". She repositions her hefty thighs, opens extra extra wide, and burps right into your mouth.\n\nHalfway through, that burp starts to ripple and churn into a flood of "+(isActive("Candy Ring")?"candy. Little spheres of sweetness scatter":"vomit. Hot chunky pigslime splashes")+" out over your entire face, probably about 75% missing your mouth entirely. The remaining quarter slips down your throat with some difficulty; guzzling "+(isActive("Candy Ring")?"dozens of candies":"hot pigpuke")+" straight up is really hard. You have to take sips and suck down one "+(isActive("Candy Ring")?"piece":"chunk of half-digested food")+" at a time.\n\nThe next five loads are surprisingly easier to take; apparently they just came here from an orgy (which says almost nothing about their actual location when it comes to this island) so most of what you're forced to guzzle is just viscous, regurgitated cum."+(isActive("Mood Ring")?" It's all muted, earthy colors, with some flavors of of copper and staleness.":"")+"\n\nBy the end of this you've got such a bloated, preggo-lookin gut that you wouldn't be surprised if they mistook you for one of them and dragged you into their happy piggy family.");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work7") {
			append("Like fifty female clients need your help on floor <!i>- 75 ROOST.<!i>");
			addChoice("Accept.", work.bind("work7next"), {kinks: ["Female", "Female", "Female", "Female", "Female", "Female", "Pregnancy"]});

		} else if (which == "work7next") {
			append("This floor's windows are open to the hot smog of the city. Birdgirls flutter in and out of them. Their talons clack on the metal windowframes.\n\nAcross the room sit your clients. You think? They're in the most distress, anyway.\n\nThey're all huddled in a group nest beneath a wall of cork peg perch-points. From up on those roosts, imperious birdgirls look down at the group nest, at the rainbow collage of shiny-wet feathers below, at the embarassing groans and quivers of labour.\n\nThey whisper and gossip to each other: just <!i>look<!i> at this unfiltered, frankly <!i>embarassing<!i> behaviour, wouldn't you? Look at that bluebird's obscenely bloated preggobelly, those plain finches and sparrows licking cuntslime from their wet eggs so immodestly...! But, whatever you do, certainly <!i>don't<!i> look at those gaudy parrot and parakeet girls, oh yes, you know the ones— those who squat with their belly clasped in both wings as if they really care how much it jiggles, those with their legs and beaks spread wide, groaning for the whole floor to hear as their swollen-red cunts strain to push out the girthiest part of their fifteenth egg— don't even think about giving such exotic attention whores too much validation, lest they fly up to a perch even higher than this one and start saying things like this about us.\n\n... Looks like some rich, let-them-eat-cake birdbitches from up on the meteorite decided to bring their satchel of Capsules here as incentive to start up a bumpin girls-only orgy. One distraught parakeet (not distraught about giving birth, but because no one else is watching her do it) gestures, waving you over. One wingtip is busy twiddling her clit, but she uses the other to gesture wildly while she explains that it wasn't fifteen minutes after the Capsules got here that some greasy crocodile and his banker friends showed up for 'tax collection' and stuffed their beaks full of caps and their wombs full of cum before fucking off back to the bank with the leftover Capsules and leaving them all here immobilized by their bellies.\n\nYou hurry over and start midwifing hard. You don't think anyone even cares how cute your ass looks in this thong. You just keep your palms on pairs of inner thighs and your thumbs on feathered cuntlips, spreading girl after girl open as wide as you can while she spasms from talons to beaktip and forces out her own set of slimy eggs.\n\nBy the end of your shift, you haven't even made a dent in their numbers. Every time a girl gives birth she disappears for a while under the nesting and pops back out pregnant again. You don't think they actually want this to end.");
			if (canGain) addToItem("Nuts and Screws", rndInt(10, 20));

		} else if (which == "work8") {
			append("A futa client wants you on floor <!i>B- 75 LOUNGE & BAR.<!i>");
			addChoice("Accept.", work.bind("work8next"), {kinks: ["Toddler", "Intersex", "Prolapse"], req: ["VIP Pass", 1], faCensor: true});
			if (getItem("VIP Pass").amount < 1) reroll();

		} else if (which == "work8next") {
			append("You head down to the lounge area. Big poofy red couches encircle a stage with three glossy poles. On the centermost, a hyena toddler futa no older than "+(isActive("Pastel Ring")?"two":"four")+" is just finishing up her dance— she's a bimbo, just like you, with her tiny "+(isActive("Pastel Ring")?"infant":"")+" asscheeks all yanked up tight by her pink thong. The string really isn't doing anything, though— it's sunken so deep into the folds of her cunt and the folds of her pucker's raped-loose, hanging lapsemeat that basically nothing is left to the imagination. Around her front, as she spins on the pole to show you and the crowd one last time, her thong's been tugged off to the side of her "+(isActive("Pastel Ring")?"two-year-old babycock":"four-year-old cock")+" and nuts, letting them swing and jiggle freely with her centripetal force.\n\nShe slips off the pole and bows. The crowd cheers, throwing used condoms and stained panties up on stage, which she happily tries to catch in her mouth. Then she toddles cutely over to you, slaps you on the ass, and heads into a VIP booth with five big-cocked adult dudes.\n\n\"Take over for me, yeah?\" she says, dragging one of them behind the curtain by his cock. Her little paw barely fits around it. \"I'm on break~\"");
			if (canGain) addToItem("Nuts and Screws", rndInt(15, 20));

		} else if (which == "work9") {
			append("You head to floor <!i>B— 32 JANITOR'S CLOSET.<!i>\n\n... It's a private, sad little lapdance.");

		} else if (which == "work10") {
			append("You head to floor <!i>B— 40 COLD/HOT.<!i>\n\nThe floor and walls are heated, but in the center stands a giant overflowing ice dispenser. This floor's regulars are either fucked into the walls or floor, sweating profusely, or rubbing melty little cubes of ice over their puffy nips. Someone pulls you inside— you're not sure of their gender or even if they're the client that requested you here— and, after tilting your head back with two fingers and exposing your "+(data.hasBoobs?"tits":"chest")+" completely, they demand that you stay perfectly still and let them hold a chunk of ice to your belly button for as long as you can take it.\n\nThe chill of the ice pierces through you. It sucks the heat from your stomach. Shivers wrack up your lower back."+pickByGenitals("", " It almost feels like it's right inside your womb. <3", "")+"\n\nOthers in the crowd ogle your "+pickByGenitals("semi-soft cock", "cunt", "semi-soft cock")+", pointing out how cute the little rivulets of melted ice look as they run "+pickByGenitals("down the base of your shaft, over your nuts, all the way down, til they hang off of your taint", "over your clit and down between your lower lips where they hang and mingle with your natural lube", "down the base of your shaft, over your nuts, all the way down, til they hang off of your cuntlips")+"...\n\nIt's finally too much to handle. You pull away and warm your button back up with a palm.\n\n... Everyone seems kinda disappointed with your performance there, so to make up for it you snag a fresh ice cube between two pinched fingers, then bring it up to your "+(data.hasBoobs?"breasts":"nipples")+" and begin to rub it in small circles along the curve of your areola.\n\nThe crowd goes wild. Afterwards, once you get to chat with a few of them, they all say they're kind of amazed that you warmed up to this floor so quickly/that you're already so chill with this floor!");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 15));

		} else if (which == "work11") {
			append("You head to floor <!i>B— 1 WELCOME.<!i>\n\nThis is where newcomers go after they're through with the lobby. You've been summoned here by a guide currently rattling off all 77 basement floors. She slips a paw around your neck and casually bends you over so your thong-flossed ass points right at the crowd.\n\nShe smacks your butt with her extendable pointer thingy and explains to everyone that, despite your celebrity status as a player, you're basically just Septrica's bimbo slave. She urges them all to call on you no matter where they are in the building or what they want to do to you. You exist to be fucked in any way they wish~");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 15));

		} else if (which == "work12") {
			append("You head to floor <!i>— 69 RECLINERS.<!i>\n\n... It's exactly what it sounds like.");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 10));

		} else if (which == "work13") {
			append("You head to floor <!i>— 53 WATERBEDS.<!i>\n\n"+pickByGenitals("Together with a big-dicked boar you fuck a hole into the curviest, sexiest waterbed. Water sloshes out and soaks you both til your nuts are dripping and shiny~", "Some cubs just invited you here to jump on the beds platonically. You throw yourself onto a waterbed that bounces and jiggles with the impact, getting some serious airtime.", "Together with a big-dicked boar you fuck a hole into the curviest, sexiest waterbed. Water sloshes out and soaks you both til your nuts are dripping and shiny~"));
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 15));
		} else if (which == "work14") {
			append("You head to floor <!i>— 3 THREESOMES.<!i>\n\n... It's exactly what it sounds like.");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 10));
		} else if (which == "work15") {
			append("You head to floor <!i>— 8 EIGHTSOMES.<!i>\n\n... It's exactly what it sounds like.");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 10));
		} else if (which == "work16") {
			append("You head to floor <!i>— 18 BARELY LEGAL.<!i>\n\nIt's a floor themed after a house party, filled with eighteen-year-old furs, all spry and all somewhat too big in the chest and the crotch for the rest of their bodies. They've got kegs of glowbeer next to every couch and young couples fucking in what's set up to be their parent's bed. They only called you over here so you could take a hit off the funnel while they cheer \"CHUG! CHUG! CHUG!\" and smack your fat bimbo ass around~");
			if (canGain) addToItem("Nuts and Screws", rndInt(5, 15));
		}
			addChoice("Move along.", junkCityHub);
	}
}
