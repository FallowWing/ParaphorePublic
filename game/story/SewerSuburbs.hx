package story;

class SewerSuburbs
{

	public static function sewerExplore(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		saveCheckpoint("SewerSuburbs.sewerExplore('"+seg+"');");

		if (seg == "explore") {
			if (getPlace("Sewer Suburbs") == null) {
				addPlace(
					"Sewer Suburbs",
					"A pleasant curving lane spotted with cul-de-sacs and condominums, built into the City's main sewage basin.",
					"Junk City"
				);
				append("You follow a random highway until it spirals underground. At first the tunnels are claustrophobic, ceilings bricked with recycled metal scraping at your scalp— then all at once they open up into a miles-wide canal. Below rushes a Nile of "+(isActive("Candy Ring")?"half-melted ice cream":"sewage")+". The highway collapses into a modest lane, stilted off the canal's rightmost wall.\n\nYour wandering finally ends in... a cul-de-sac. This whole underground road runs exclusively through sewer suburbs.");
			} else {
				if (Math.random() > 0.5) {
					append("You're back in the Sewer Suburbs, strolling through some random neighbourhood. A couple of kids are on the corner selling suspiciously murky lemonade for two caps a glass.");
				} else {
					append("You're back in the Sewer Suburbs, peering over the lane's railing. The river's "+(isActive("Candy Ring")?"sugar-mist":"stench")+" wafts up in great billowy "+(isActive("Candy Ring")?"pink":"brown")+" clouds.");
				}
			}

			addChoice("Look around.", sewerExplore.bind("main"));
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (seg == "main") {
			setLocation("Sewer Suburbs");
			append("You look around the suburbs.\n\n");

			if (!data.leakyHillsVisited) {
				append("A tangle of train-sized iron pipes rises before you from the "+(isActive("Candy Ring")?"creamy":"sewage")+" flow, connected to the main street by a couple rickety catwalks. A hanging sign shouts LEAKY HILLS CONDOMINIUMS; your eyes follow its chains up to the ceiling, where they and the pipes disappear into swirling "+(isActive("Candy Ring")?"purple":"yellow")+" fumes.\n\nCurved windows horizontally stripe each pipe. Most have laundry hanging out to dry. You wonder why every resident seemingly needs five to ten multicolored thongs each.\n\n");
				addChoice("Head to Leaky Hills.", sewerExplore.bind("leakyhillsnext"), {kinks: ["Patreon Commission", "Male", "Male", "Piss"]});
			}

			if (!data.ivandisDone) {
				append("Dudely guffaws draw your attention to a posh neighbourhood built right out on the canal. Huge suburban mansions teeter and bob on the currents of the "+(isActive("Candy Ring")?"ice cream":"sewage")+" beneath them.\n\n");

				addChoice(
					"Walk down to the canal.",
					sewerExplore.bind("ivandis1"), 
					{kinks: ["Patreon Commission", "Cub", "Male", "Male", "Male", "Raunch", "Scat", "Vomit", "Piss", "Blood", "Abuse", "Snuff"], faCensor: true}
				);
			}

			if (!data.houseDone) {
				append("The bright, "+(isActive("Candy Ring")?"frosting":"brown")+"-flecked flowers on the porch of a little suburban house catch your eye.\n\n");

				addChoice(
					"Knock at the little house.",
					sewerExplore.bind("houseintro"), 
					{kinks: ["Patreon Commission", "Intersex", "Female", "Piss", "Scat"], faCensor: true}
				);
			}

			append("Off to the side there's a lanky goat hick in a straw hat. He's got his bare ass sat firm on a pink milk crate marked APOTHECARY, fishing pole sagging over the railing.");

			if (!data.shitFishDone) append("\n\nThe low, "+(isActive("Candy Ring")?"creamy":"greasy")+" keen of something huge reverberates from the depths of the sewers...");
			addChoice("Talk to the goat.", sewerExplore.bind("talk goat"), {kinks: ["Male", "Raunch"]});
			if (!data.ivandisDone || data.campTripIntro) {
				addChoice("Move along.", JunkCity.junkCityHub);
			} else {
				addChoice("Move along.", sewerExplore.bind("camptrip1"));
			}
		}

		if (seg == "leakyhillsnext") {
			data.leakyHillsVisited = true;
			unlockJournal("Roddy & Oni");
			append("You hop into an elevator built into a pipe and get off on a random floor. Deep, relieved sighs draw you down the hall, to an apartment with an open door...\n\nFirst you spot the welcome mat, embroidered with two guys, a rat and a dog, holding hands. It reads:\n\n<!b>RODDY & ONI'S PLACE\n\nEVERYONE WELCOME <3)<!b>\n\nThe boys themselves are sprawled naked in a cushy bed/bathtub together, Roddy's rat tail curled around his partner's neck, cock lodged firmly down the dog's throat; if they notice you, they don't care one bit that you're watching. They have eyes only for each other.\n\nThose sighs were coming from Roddy. You inch a little closer, stepping over the mat, and crane your neck to catch a glimpse at a golden trickle as it spurts out over Oni's chin. The dog gives a little gag and a cough, tail twitching, but his top doesn't let up for a second, grabbing the back of Oni's head with both hands, forcing every last inch of ratcock down his throat.\n\nOni holds on long enough to get at least seven full gulps of piss down his gullet before tapping out— immediately Roddy unplugs and lets him get a couple deep breaths in, giving one of his doggy ears an affectionate tweak. \"Taste good?\"\n\n\"Mhm,\" Oni says, then opens his maw wide again. \"More please~\"");

			addChoice("Next.", sewerExplore.bind("leakyhillsnext2"));
			addChoice("Examine condo.", sewerExplore.bind("examine condo"));
			addChoice("Look around.", sewerExplore.bind("main"));
		}

		if (seg == "leakyhillsnext2") {
			append("Roddy grins evilly and scoots up a little further, dragging his shiny, yellow-dripping nuts over Oni's mouth, making sure to grind them hard on that flopped-out panting doggy tongue; then he pulls his hips back, aims his cock down, and releases another jet of hot pee at the exact moment he hilts his cock down his lover's throat.\n\nOni gags hard again, eyes rolling up— just as Roddy notices you.\n\n\"Oh my. Oni, look...\"\n\nWith some effort the dog manages to un-roll his eyes and stare befuddled at you.");

			if (data.hasCock) addChoice("Hi. Mind if I help out~?", sewerExplore.bind("leakyhillsnext3"));
			addChoice("Apologize and scurry off!", sewerExplore.bind("main"));
		}

		if (seg == "leakyhillsnext3") {
			append("\"<!i>Absolutely<!i> you can,\" Roddy says, and beckons you over.\n\nOni pants a greeting, then his partner squeezes the last few dribbles of piss out toothpaste style and flips him onto his hands and knees. With ratlike slipperiness Roddy wiggles underneath the dog, pressing their chests close, and threads his cock along Oni's soft-furred buttcrack.\n\n\"He can take two,\" Roddy says, lining his head up with the pup's winking pucker, dragging a sloppy lick over his face. \"Can't you~?\"\n\n\"M... Mhm... Pleasure to meet you, by the way.\" Oni blushes. "+(data.leakyCondoExamined?"\"As you probably saw in the pictures... I've taken bigger. <3 So, um. Please fuck me as hard as you can!\"":"")+"\n\nRoddy licks him extra hard. \"Good boy.\"");

			addChoice("Double pen the doggy.", sewerExplore.bind("leakyhillsnext4"));
		}

		if (seg == "leakyhillsnext4") {
			append("You grind your cock along the bottom of Roddy's shaft, feeling the bulge of his urethra flatten against your own, until both heads are gushing pre against Oni's hole. At once you nod to each other and begin to push, his little tail quivering as you gape him; about halfway through he starts whimpering warbly into Roddy's ferocious licks, but that only doubles their ferocity.\n\nAfter a few warm-up thrusts you take his words to heart and doublefuck him with brutal devotion, playing this like a rhythm game, never missing a synchronized thrust. Oni's claws come out involuntarily as he scrabbles at the metal headboard— well-scratched already, you notice— making the most pitiful little yowl every time you both hilt inside him, your nuts jiggling and grinding against Roddy's.\n\nYou both cum inside him at the same time,"+(isActive("Mood Ring")?" colors and flavors mingling,":"")+" ramming in as deep as possible. The goo splurts out between your cocks, running thick over Roddy's thighs. After laying on Oni for a while, panting, you finally pull your cock out with a <!i>schlop<!i> and get on your way, waving goodbye.");

			addChoice("Look around.", sewerExplore.bind("main"));
			if (!data.ivandisDone || data.campTripIntro) {
				addChoice("Move along.", JunkCity.junkCityHub);
			} else {
				addChoice("Move along.", sewerExplore.bind("camptrip1"));
			}
		}

		if (seg == "examine condo") {
			data.leakyCondoExamined = true;
			append("It's pretty much a cylindrical metal janitor's closet. A few pipes jut from the wall above a grille in the floor, forming a crude sink; besides that the only furniture is the bed/bathtub. Yet, the two have made it as homely as possible: there's a little metal shelf with a collar and a leash (marked Oni of course), a couple dildos (the biggest being about a foot long, marked \"Little Roddy\")...\n\nOni's fucked-silly expression hangs framed all over the walls. In one picture he takes feral dogcock down to the knot, in another he slobbers on Rod's rod... but the best is the one where he's tied up while Roddy punchfucks his little butt elbow-deep with enough force to blur the shot.");

			addChoice("Next.", sewerExplore.bind("leakyhillsnext2"));
		}

		if (seg == "ivandis1") {
			data.ivandisDone = true;
			setLocation("Canal Shore");
			if (isActive("Pastel Ring")) temp.p = "thirteen" else temp.p = "nine";
			if (isActive("Candy Ring")) {
				temp.c0 = "ice cream";
				temp.c = "cream";
				temp.c2 = "the sugary rush";
			} else {
				temp.c0 = "shit";
				temp.c = "chocolate";
				temp.c2 = "the murky rush";
			}
			unlockJournal("Skunk cub");

			append("There's a scrummage of beefy bros shoreside, all clumped around a struggling shape half-submerged in the river of "+temp.c0+".\n\nYou roll up.\n\nThe shape is a "+temp.p+"-year-old "+temp.c+"-dipped skunk, lithe and curvy. The dudes are yanking at the kid's t-shirt, shorts, popping sneakers off. The dudeliest among them— a hairy-pitted snaggletooth in a sweat-stained wifebeater— has a hold on the skunk's head and tail, occasionally pointing the stink-shooter at random guys just to laugh as they spill their beer stumbling to get out of the way, less occasionally dunking the little cunt's head underwater and drowning them to near-unconsciousness in "+temp.c2+".\n\nThe little skunk is left only in their socks and underwear now. You still can't tell if they're a girl or a boy. There isn't much of a bulge...");

			addChoice("Yank their undies off.", sewerExplore.bind("ivandis1a"));
			addChoice("Piss on the skunk's socks.", sewerExplore.bind("ivandis1b"), {kinks: ["Piss"]});
			addChoice("Look around.", sewerExplore.bind("main"));
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (seg == "ivandis1a") {
			if (isActive("Candy Ring")) {
				temp.c = "colorful, cream";
			} else {
				temp.c = "shit";
			}

			append("You reach forward. The bros were so rowdy that they're only noticing you now; a couple gawk, a couple go \"No fuckin way,\" and the rest grin like idiots, croc included, and watch where you're reaching.\n\nYou curl your fingers over the back of the little skunk's waistband, savouring the humiliation on their "+temp.c+"-smeared face. Slowly you pull down, revealing the muffin-top of their plump buttcheeks... next their puffy hole, clearly accustomed to gape from both directions... and finally, the moment of truth...\n\nIt's a boy!\n\nYou yank the undies down hard enough to jiggle the kid's greasy little taint, nuts, and positively tiny skunklet dick. The guys all burst into laughter. He blushes and buries his face back in the canal out of shame before the croc can even shove it there.");

			addChoice("Next.", sewerExplore.bind("ivandis2"));
		}

		if (seg == "ivandis1b") {
			if (isActive("Candy Ring")) {
				temp.c = "icy rush";
			} else {
				temp.c = "shit-sludge";
			}

			append("You squat over the kid's foot and press "+pickByGenitals("the head of your cock to the little divot between their big toe and next one over", "their socked sole to your pussy, grinding against it a little", "the head of your cock to the little divot between their big toe and next one over")+" and blast the skunklet's toesies with piss, darkening their already yellow socks. They whimper and pointlessly jerk their leg away, clearly tickled by your warmth.\n\n\"Odd choice...\" The croc shrugs. Then, purring in the skunk's ear: \"... but good little boysluts let strangers piss wherever they want on their body, don't they?\" The croc dunks him again. \"I'll keep him under til your finished. Fuck knows we've heard enough of his whining already.\"\n\nThe boy's toes twitch against your "+pickByGenitals("cockhead", "lips", "cockhead")+" as he chokes and gags on the thick "+temp.c+", accidentally swallowing a throatful with the shock of the impact, you deduce, from the way his neck bulges and his tummy heaves so pathetically.\n\nOnce you've had a nice relaxing piss on both of the kid's socked feet— you draw out those last few dribbles til he's thrashing— the croc pulls him up and spits on his mud-soaked face. He's crying now, gasping cloggedly for breath, whining harder than ever.");

			addChoice("Gag the skunkling with one of his dirty socks.", sewerExplore.bind("ivandis1bb"));
			addChoice("Next.", sewerExplore.bind("ivandis1ba"));
		}

		if (seg == "ivandis1ba") {
			if (isActive("Pastel Ring")) {
				temp.p0 = "even";
				temp.p = "nine";
			} else {
				temp.p0 = "especially";
				temp.p = "thirteen";
			}

			if (!data.ivandisSockGagged) {
				if (isActive("Candy Ring")) {
					temp.c = "some stray frosting";
					temp.c2 = "all that thick, sugary cream";
				} else {
					temp.c = "some stray mudchunks";
					temp.c2 = "the gritty mud";
				}
			} else {
				temp.c = "both soaked socks";
				temp.c2 = "the massive, filthy wad of fabric";
			}

			append("\"Who's a little fuckskunk~?\" the croc coos, shoving "+temp.c+" down his gullet with two fingers.\n\nThe skunk attempts obediently to say \"I am,\" but it ends up sounding more like <!i>HRRRRRKKKKGHKLLLLLKKKGHGHRGLH<!i>. Even with the croc's generous push of the fingers he's still struggling to swallow "+temp.c2+", little throat working desperately. The croc shakes his head, tsks, and slowly drives those fingers even further down his throat, molesting the fucklet's maw so deeply that his eyes roll up and he pisses himself.\n\nYou look down. Straining past the fabric of the their undies you can barely make out the teeny little nubble of a cockbulge, positively pitiful, "+temp.p0+" for a "+temp.p+"-year-old.");

			addChoice("Heh.", sewerExplore.bind("ivandis2"));
			addChoice("Awww, look at his little clit~", sewerExplore.bind("ivandis2"));
			addChoice("Skunknubble... nubblecock... nublet... that's a good word.", sewerExplore.bind("ivandis2"));
			addChoice("Next.", sewerExplore.bind("ivandis2"));
		}

		if (seg == "ivandis1bb") {
			data.ivandisSockGagged = true;
			append("You peel both dripping socks from the skunk's feet.\n\nA couple bros jerk themselves silly just at the sight of your fingers sinking past those soft lips, pulling his maw open...\n\nYou cram both socks in at once, bulging the skunk's cheeks out cutely, and push hard on his lower jaw, forcing him to close his mouth; the pressure squishes all the piss from his socks and it splurts out over his girly lips, from his nostrils...\n\n\"Mmmm... fuck yeah... stuff that little cunt's mouth...\" one mutters.\n\nAnother downs his beer, riled up, and lays a few good punches into the skunk's plush thighs, drawing muffled squeals from him, all while casually commenting: \"Fuck those socks are absorbent, kid. Get those from the AUTO-SHOP? Ah. Right. Can't talk, can you...\"\n\nThe skunk doubles over, stomach working, trying to fight the urge to puke. Slowly, after the pain of the punches wears off and the bruises begin to rise he starts sucking your flavor from them, tasting his own rank footstench in the crusty fabric.");

			addChoice("Good bitch.", sewerExplore.bind("ivandis1ba"));
		}

		if (seg == "ivandis2") {
			if (isActive("Candy Ring")) {
				temp.c = "frosted shore";
				temp.c2 = "to dab at a little whipped-cream as it splurts from his nostrils. He's still cracking up about the skunk's tiny dick";
			} else {
				temp.c = "sewer-muck";
				temp.c2 = "as toilet paper for his muddy asscrack";
			}

			append("It takes a brutal throatfisting to get the skunk's esophagus clear. After the croc yanks his hand out, glisteny with spit, he gives a whistle and hauls his sobbing prey up over a shoulder. A couple guys grab beers they'd left lodged in the "+temp.c+"-splattered ahegao face, and says: \"You're welcome to join us.\"\n\n"+(!data.ivandisSockGagged?"One guy yanks the boy's socks off and tosses them wherever.":"One guy yanks the boy's undies off and wraps them around his cock, then hunches over and uses them as a cumrag.")+" One jams his greasy uncut dick into one of the boy's sneakers and grunts, filling it til it overflows with piss. Another uses the skunk's t-shirt (you spot the big sparkly lettering on it now: <!b>PLEASE RAPE ME TO DEATH~<!b>) "+temp.c2+".\n\nEventually they all get their shit together and head back up the shore towards a tower-mansion which dwarfs all neighbours, its highest spires scraping back and forth along the ceiling of the canal with each whim of the rapids.");

			addChoice("Follow them.", sewerExplore.bind("ivandis3"));
			addChoice("Look around.", sewerExplore.bind("main"));
		}

		if (seg == "ivandis3") {
			if (data.hasBoobs) {
				temp.a = "tits";
			} else if (data.hasCock || data.hasBoth) {
				temp.a = "bulge";
			} else {
				temp.a = "butt";
			}

			append("The rusted-iron catwalks, boardwalks, and sidewalks funnel your drunken dudepals back to the mansion's floating cul-de-sac. The whole group stops for at least three piss breaks along the way.\n\nNow the focus is off the skunk they all bro out with you, offering beers, talking shit— most trying not to stare too hard at your "+temp.a+". Once you all stumble up the porch the croc breaks away, tosses the skunk's quivery, light little body to someone else, and says he'll meet you all in the back, he's just gotta have a quick talk with Cage inside.\n\nHe rings the bell to his own house about fifteen times before simply opening the door and stepping in.\n\nOne of the guys hustles you past the ornate garden gate and you find yourself face-to-face with the skunk, who's starting to come back to reality a little, blushing dazedly at you.");

			addChoice("What's your name, hun?", sewerExplore.bind("ivandis4a"));
		}

		if (seg == "ivandis4a") {
			data.ivandisName = "Ivandis";

			append("\"Ivandis,\" he says with immediate obedience. Then he does a double-take, puzzled that you even care about his name. \"... and you're "+data.playerName+" of course");

			if (data.knownAsPlayer < 2) {
				append(". I can see it right above your head. Heh");
				data.knownAsPlayer++;
			}

			append("... nice to meet you.\"");

			addChoice("Nice to meet you too, Ivandis.", sewerExplore.bind("ivandis5"));
			addChoice("Forget that name. I'm gonna pick a new one for you...", sewerExplore.bind("ivandis4name"));
		}

		if (seg == "ivandis4name") {
			append("You stroke the skunk's matted cheekfur with a thumb, so deep in thought you hardly even register which set of cheeks they are. It doesn't really make a difference anyway, you suppose; both border a hole which exists only to be fucked and ruined~\n\nHe shivers a little, knowing perfectly well what sort of name to expect.");

			addTextChoice(function(str) {
				data.ivandisName = str;
				sewerExplore("ivandis4namecustom");
			});
			addChoice("Bitch.", function() {data.ivandisName = "Bitch"; sewerExplore("ivandis4name2"); });
			addChoice("Slut.", function() {data.ivandisName = "Slut"; sewerExplore("ivandis4name2"); });
			addChoice("Whore.", function() {data.ivandisName = "Whore"; sewerExplore("ivandis4name2"); });
			addChoice("Shitstain.", function() {data.ivandisName = "Shitstain"; sewerExplore("ivandis4name2"); });
			addChoice("Rapetoy", function() {data.ivandisName = "Rapetoy"; sewerExplore("ivandis4name2"); });
			addChoice("Fuckskunk.", function() {data.ivandisName = "Fuckskunk"; sewerExplore("ivandis4name2"); });
			addChoice("Pukestain.", function() {data.ivandisName = "Pukestain"; sewerExplore("ivandis4name2"); });
			addChoice("Snufftoy.", function() {data.ivandisName = "Snufftoy"; sewerExplore("ivandis4name2"); });
			addChoice("P.S.S.", function() {data.ivandisName = "Piss-Slit Sniffer"; sewerExplore("ivandis4name2"); });
		}

		if (seg == "ivandis4name2") {
			if (data.ivandisName == "Fuckskunk") {
				temp.a = "Snagg would be proud";
				temp.b = "Where's your manners, cunt?";
			} else if (data.ivandisName == "Piss-Slit Sniffer") {
				append("\"Wuh...?\" The skunk blinks.\n\n");
				temp.a = "It's an acronym, cum-for-brains";
				temp.b = "Stands for Piss-Slit Sniffer.";
			} else {
				temp.a = "Nice";
				temp.b = "Where's your manners, cunt?";
			}

			append("\""+temp.a+",\" says one of the guys, casually cockslapping him. \""+temp.b+"\"\n\nHe flinches back, stammering: \"Thank you, tha... that's exactly what I am... a worthless "+data.ivandisName+"...\"");

			addChoice("That's right.", sewerExplore.bind("ivandis5"));
			addChoice("Don't beat yourself up about it. We'll do that for you~", sewerExplore.bind("ivandis5"));
			addChoice("Next.", sewerExplore.bind("ivandis5"));
		}

		if (seg == "ivandis4namecustom") {
			append("... He wasn't expecting that. In fact, he hardly seems to know how to feel about it. You get the strange sensation that you could've named him anything except some generic degradation and got this same reaction.\n\nFeels weird.");

			addChoice("Pretty name, huh~", sewerExplore.bind("ivandis5"));
		}

		if (seg == "ivandis5") {
			setLocation("Snagg Mansion");
			if (isActive("Candy Ring")) {
				temp.c = "grape jello";
			} else {
				temp.c = "sewage";
			}
			if (isActive("Pastel Ring")) {
				temp.p = "Ten";
				temp.p2 = "Nah man, nine years old... barely even got pubes yet. Just look at that puny dick.\"\n\n\"Fuck, even better...";
			} else {
				temp.p = "Ten";
				temp.p2 = "Haha, nah man, he's just got a puny dick. Thirteen at the youngest.\"\n\n\"Fuck... ah well. Still worth a rape.";
			}

			append("The mansion's backyard is basically a small golf course, lush hills of grass spotted with natural pools of "+temp.c+" in place of sandtraps. Off the back porch extends an oaken lounge latticework, picnic tables, rape-racks, luxurious beds in the grass. Some dudes are playing beer pong off a banquet table in a gazebo, for Christ's sake.\n\nYou narrow your focus from the green sprawl to the guy carrying the skunk— just as he throws him face-first onto a bed swollen with stuffing. Pillows scatter upon impact.\n\nSome random girly cat with a Pastel Ring earring comes out of nowhere. \"Hold my beer?\" he asks, and pushes his beer into the skunk-carrier's hands anyway. The cat kneels on the bed between the kid's legs, tail snaking around to tease his little taint. \"Mmmh,\" he says. \"How old is this cutie? "+temp.p+"?\"\n\n\""+temp.p2+"\"\n\nThe cat yanks "+data.ivandisName+"'s thighs apart. He reaches up, over, intentionally avoiding even a slight brush with the kid's throbbing cocklet, placing his palm smooth and flush on the skunk's belly. \"You full?\" he asks.\n\nThe skunk twitches. \"Y... Yes.\"");

			addChoice("Oh "+(isActive("Candy Ring")?"fudge":"shit")+".", sewerExplore.bind("ivandis6"), {kinks: ["Scat", "Scat", "Scat", "Scat", "Scat", "Scat", "Scat", "Scat"]});
		}

		if (seg == "ivandis6") {
			data.metSnagg++;
			if (isActive("Candy Ring")) {
				temp.c = "a thick, mushy mess of pink fondant cake";
				temp.c2 = "cake";
			} else {
				temp.c = "himself";
				temp.c2 = "shitsludge";
			}

			append("The cat drives his palm down hard on "+data.ivandisName+"'s stomach. With a nauseous burp-moan the skunk's legs spread wide and he shits "+temp.c+" in front of everyone. That loud flatulational splutter draws the attention of every dudebro in a quarter-mile radius and all at once they fall on the boy as a swarm, slapping heavy uncut cockmeat over his throat, using his anguished face to wipe their "+(isActive("Candy Ring")?"sugary":"grease-clotted")+" pits. Things are about to go full primal, the cat winding up a good gutpunch to kick things off— when the croc busts open the mansion's backdoor and reclaims the skunk as his own with a snap of fingers and jaw.\n\nThe guys back off. Most stay nearby, circling, checking their peripherals for the next chance at such a choice piece of underaged skunkmeat.\n\n\"Thought I'd just leave you to the wolves?\"\n\nThe croc falls upon "+data.ivandisName+", all grinning snaggleteeth, and draws a careful claw over his little skunk's chest. "+data.ivandisName+" shakes his head, eyes on the claw, a tiny extra dollop of "+temp.c2+" popping from his butt as it clenches with fear.\n\n\"Good.\" Snagg jabs a thumb at two jealous wolfbros. \"'Cause they don't know shit about breaking in your <!i>finer<!i> holes...\"\n\nThe wolves honestly seem sort of hurt that he would call them out like that...");

			addChoice("Next.", sewerExplore.bind("ivandis7"));
		}

		if (seg == "ivandis7") {
			if (isActive("Candy Ring")) {
				temp.c0 = "frosted";
				temp.c = "pink";
				temp.c2 = "tasty";
				temp.c3 = "cake-chunk";
			} else {
				temp.c0 = "muddy";
				temp.c = "skunkshit";
				temp.c2 = "gross";
				temp.c3 = "shitchunk";
			}

			append("The croc drags that single claw down "+data.ivandisName+"'s "+temp.c0+" crack, carefully loading it with a fat glob of "+temp.c+".\n\nHe yanks the boy's head back and holds the claw under his scrunched nose.\n\n\"Snort.\"\n\n\"P-Please... <!i>hrrrrRRRRRRrrkkkkkk<!i>... I'll... I'll puke...\"\n\nThe croc gives it a second. Another.\n\nHe shakes his head. \"What? Not "+temp.c2+" enough for you? Greedy little bitch.\" He motions to the cat, who never quite left, "+temp.c3+" wiggling precariously atop his claw, then nuzzles that finger up close to the skunk's little pucker.\n\n\"Set off his defense mech for me, would ya. Hands are full.\"\n\nThe cat cracks his knuckles. \"Sure thing.\"");

			addChoice("Next.", sewerExplore.bind("ivandis8"));
		}

		if (seg == "ivandis8") {
			if (isActive("Candy Ring")) {
				temp.c = "glob of green apple nose-syrup";
				temp.c2 = "syrup";
			} else {
				temp.c = "snotwad";
				temp.c2 = "mucous";
			}

			append("The skunkling squirms, agitated, afraid to wiggle his butt away in case he accidentally slices himself on the claw so close to the little stink glands on either side of his fat, abused pucker. He settles for begging in lieu of all-out thrashes, though his tone carries the same panic: \"Wait! Wait! Please!\"\n\nThe cat casually silences "+data.ivandisName+" with a viscous "+temp.c+" to his left eye. With a squeal the boy blinks over and over, only spreading the thick "+temp.c2+" around, his tears soaking it yet deeper as his eyelid gums up.\n\n\"Where ya want it?\" the cat asks Snagg, cracking his knuckles.\n\n\"With all that whining he just did? Punch him in the fuckin head.\"\n\nOn the wind-up you realize what's about to happen directly in front of your face.");

			addChoice("Move out of the way!", sewerExplore.bind("ivandis9"));
			addChoice("Move... along.", JunkCity.junkCityHub);
		}

		if (seg == "ivandis9") {
			if (isActive("Candy Ring")) {
				temp.c = "sprinkles";
				temp.c2 = "sugary scent";
				temp.c3 = "cake";
			} else {
				temp.c = "skunkjuice";
				temp.c2 = "noxious stench";
				temp.c3 = "shit";
			}

			append("You sidestep just in time— the cat drives a fierce right hook into the side of the skunk's head, bouncing his skull against the mattress, drawing out a girly little scream as his buttmuscles clench and he sprays the croc's claw with a glimmery coating of "+temp.c+".\n\nThe croc brings his claw back up to "+data.ivandisName+"'s nose. \"Let's try that again, okay snufflet? You're probably even more brain damaged now, huh... I'll say it nice and slow for you, then: <!i>Snoooort.<!i>\"\n\nDazed, already tearing up from his own "+temp.c2+", the skunk wraps both hands around the croc's wrist and eagerly takes his whole claw up a nostril, cleaning all his "+temp.c3+" from it with one wet, rippling snort.");

			addChoice("Next.", sewerExplore.bind("ivandis10"));
		}

		if (seg == "ivandis10") {
			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "thirteen";
			}
			if (isActive("Candy Ring")) {
				temp.c = "speckled with sprinkles and frosting";
				temp.c2 = "sweet";
				temp.c3 = ".";
				temp.c4 = "syrupy";
				temp.c5 = "cake";
				temp.c6 = "pink";
			} else {
				temp.c = "drippy with spray";
				temp.c2 = "slimy";
				temp.c3 = ", using the back of his tongue as toilet paper.";
				temp.c4 = "acrid";
				temp.c5 = "shit";
				temp.c6 = "filthy";
			}

			append("\"Ugh. Gross little garbage can, ain't he?\" the cat says, jamming his empty beer can up the "+temp.p+"-year-old's "+temp.c5+"smeared hole.\n\n\"Mmmmmmmmhm,\" The croc unplugs his claw from "+data.ivandisName+"'s nostril. He takes a look at it: mostly clean, but still a little "+temp.c+"... he yanks the skunk's jaw open and crams that "+temp.c2+" digit all the way down"+temp.c3+" "+data.ivandisName+" gags and chokes on his own "+temp.c4+" flavor, still sniffling and trying to dislodge the "+temp.c5+" from his nose at the same time, tiny cock throbbing and spewing pre all over himself, asscunt clenching on the beer can.\n\n\"You deserve this, don't you?\" the croc coos, dragging his "+temp.c6+" claw along the back of the skunk's throat just hard enough to tickle.\n\nNose running, eyes watering, "+data.ivandisName+" nods.");

			addChoice("Next.", sewerExplore.bind("ivandis11"));
		}

		if (seg == "ivandis11") {
			append("After that little display the bystanders simple cannot stand by anymore.\n\n\"Come on,\" one of the wolves says, jacking himself so furiously that dribbles of his pre fly several feet to spatter onto the skunk's buttmeat. \"You got your action with the <!i>finer holes<!i> in, Snagg... let us gangrape him.\"\n\nThe croc pulls his claw out, slapping the skunk across the face just to vent his frustration. \"Well, I <!i>was<!i> gonna say fuck you guys and take him inside with me...\"\n\nEven the cat objects, lithely scooching forward. \"Yes, come on,\" he says. \"Just a little gangrape. Just one tiny itty bit of gangrapery.\"\n\nThe croc looks exhaustedly to the stars, surrounded by horny dudes. \"You know what, fine, whatever. I gotta head back inside either way. Someone film this shit for me at least. Anyone got a phone?\"\n\nA couple guys pat their bare thighs, expecting pockets. \"I lost my pants a couple days ago,\" the cat says with a stupid grin. He cowers under the croc's glare and quickly adds: \"... s'only cause you throw the best parties... I was fucked up on sweetmoss tea...\"");

			addChoice(
				"I've got... a flip phone?",
				function() {data.ivandisCell = true; sewerExplore("ivandis12");},
				{req: ["Cell Phone", 1]}
			);
			addChoice("Can't help ya.", function() {data.ivandisCell = false; sewerExplore("ivandis12");});
		}

		if (seg == "ivandis12") {
			if (data.ivandisCell) {
				temp.a = "Fuck yeah, that'll do. The quality is probably worthless, but so is this slut, so it cancels out.";
				temp.a2 = "You whip out your phone and start filming just in time to catch "+data.ivandisName+"'s soft little whimper of despair. F";
				temp.a1 = "\n\nThe cat drags a claw lovingly across the boy's face. \"You're gonna be our little cub pornstar tonight, aren'tcha~?\"";
				data.ivandischoice1 = "Time for a close-up~!";
				data.ivandischoice2 = "Get an angle from behind the guy's nuts and ass a.k.a best/worst porn angle ever.";
				data.ivandischoice3 = "Minimalist camerawork: just the tummy.";
			} else {
				temp.a = "Well, pay good fuckin attention and give me the run down later.";
				temp.a1 = "";
				temp.a2 = data.ivandisName+" releases a soft little whimper of despair as f";
				data.ivandischoice1 = "Watch the skunk's expression.";
				data.ivandischoice2 = "Eat the kitty out while he assfucks "+data.ivandisName+".";
				data.ivandischoice3 = "Just watch that tummy bulge.";
			}

			append("\""+temp.a+"\" Snagg heads back inside.\n\nFive hairy, slobbering dudes take his place immediately."+temp.a1+"\n\n"+temp.a2+"ive dicks (all uncut, most greasy, one pierced) slap down onto different parts of his body, grinding up in his armpits, between his thighs, a pool of pre coalescing in his tight innie from the collective dicksnot of those beating his bruised stomach in.\n\n"+data.ivandisName+" starts freaking out a little, breathing heavy; especially as the fattest cock slips up over his stomach and its nutsack envelops his tiny dick entirely... the head reaching just up to his nips. Both the skunk and his rapist realize just how deeply his insides are about to get destroyed.\n\nThe cat nudges that guy out of the way with implicit authority and pulls his beer can out with a cute little suction-cup <!i>pop<!i>— it was holding my spot, he tells the guy— only to replace it with the tip of his barbed dick.");

			data.ivandisdone1 = false;
			data.ivandisdone2 = false;
			data.ivandisdone3 = false;
			addChoice(data.ivandischoice1, sewerExplore.bind("ivandis12face"));
			addChoice(data.ivandischoice2, sewerExplore.bind("ivandis12butt"));
			addChoice(data.ivandischoice3, sewerExplore.bind("ivandis12tummy"));
			addChoice("Next.", sewerExplore.bind("ivandis13"));
		}

		if (seg == "ivandis12face") {
			data.ivandisdone1 = true;

			if (isActive("Candy Ring")) {
				temp.c = "a curious yellow pudding";
				temp.c2 = "cake";
			} else {
				temp.c = "chunks of expired yellow smeg";
				temp.c2 = "shit";
			}

			if (data.ivandisCell) {
				append("You bring your phone camera right up to his face, making sure to catch those cute tear-tracks running over his pinchable/punchable cheeks and the mess still leaking from his nose.\n\n");
				if (!data.ivandisIntroDone) {
					data.ivandisIntroDone = true;
					append(data.ivandisName+" blushes, sniffling it up, looking away. \"O-Only Snagg's gonna see this... right?\"\n\nThe cat acts as narrator: \"Today we've got a special show for all you loyal viewers, in the living room, the Drive-in, those of you who snuck up to Snagg's room and got into his porn stash, wherever you are!\"\n\n");
				}
			}

			append("You stay focused on the skunklet's face even as it disappears under three hairy, sweaty, expertly-coordinated pairs of nuts. His gasps come muffled past the nut barrage; so naturally a couple happen to slip inside his open mouth, forcing him to suck their musk. Once the guys get bored they switch to grinding their shafts and then heads, puling their hoods open just by dragging them across "+data.ivandisName+"'s cute cheeks, over his eyelashes, coating his disgusted expression with "+temp.c+".\n\n");

			if (data.ivandisCell) append("The cat casually rams his barbed length up the cub's ass, displacing a creamy blast of "+temp.c2+". \"Here we can see the skunkslut in its natural habitat,\" he says to the camera. \"Suffocating on the crotchmusk of guys twice his size— and probably thrice his length.\"");

			if (!data.ivandisdone1) addChoice(data.ivandischoice1, sewerExplore.bind("ivandis12face"));
			if (!data.ivandisdone2) addChoice(data.ivandischoice2, sewerExplore.bind("ivandis12butt"));
			if (!data.ivandisdone3) addChoice(data.ivandischoice3, sewerExplore.bind("ivandis12tummy"));
			addChoice("Next.", sewerExplore.bind("ivandis13"));
		}

		if (seg == "ivandis12butt") {
			data.ivandisdone2 = true;

			if (isActive("Candy Ring")) {
				temp.c = "cake-spattered";
				temp.c2 = "sugar-sprinkled pucker";
				temp.c3 = "sweet";
			} else {
				temp.c = "shit-spattered";
				temp.c2 = "pucker, glistening with a thin film of feline assmusk";
				temp.c3 = "greasy";
			}

			if (data.ivandisCell) {
				append("You squat behind the cat, getting an upskirt-style angle which shows off the length of his cock, the serration of his thorns, and most importantly the utter jiggliness of his ass and nuts as he thrusts in deeper than ever.\n\n");
				if (!data.ivandisIntroDone) {
					data.ivandisIntroDone = true;
					append(data.ivandisName+" squeals off-camera, the rape driving desperation into his tone: \"O-Only Snagg's gonna see this... right?!\"\n\nThe cat acts as narrator: \"Today we've got a special show for all you loyal viewers, in the living room, the Drive-in, those of you who snuck up to Snagg's room and got into his porn stash, wherever you are!\"");
				}
				append("\n\nYou hear the little fucklet's screams come muffled (undoubtedly past someone's junk) as the cat slowly, lovingly pulls his entire length out, his barbs drawing a cute squirt of blood. He inhales through gritted teeth. \"Oooo... yikes... that's gonna get infected. But I guess you'd love that, wouldn't you? Dirty fuckin skunk.\"\n\nHe slams in all the way again, and you film his nuts as they slap against the cub's pudgy "+temp.c+" buttcheeks.");
			} else {
				append("You get into position behind the cat's nuts, pushing your nose up past them (they jiggle) and placing your lips to his "+temp.c2+". You hold onto both of his toned thighs to keep steady, though a hand he places on the back of your skull does that job pretty well already. He starts powerfucking "+data.ivandisName+" brutally deep, taking your face along for the ride; somehow you maintain enough control to tongue-circle his "+temp.c3+" pucker, then tease it with a couple deep licks, and finally plunge inside and eat his raunchy ass out fully, your cheeks squished up against his. Every time he bottoms out inside his little rapesock his ring clenches hard on your tongue.");
			}

			if (!data.ivandisdone1) addChoice(data.ivandischoice1, sewerExplore.bind("ivandis12face"));
			if (!data.ivandisdone2) addChoice(data.ivandischoice2, sewerExplore.bind("ivandis12butt"));
			if (!data.ivandisdone3) addChoice(data.ivandischoice3, sewerExplore.bind("ivandis12tummy"));
			addChoice("Next.", sewerExplore.bind("ivandis13"));
		}

		if (seg == "ivandis12tummy") {
			data.ivandisdone3 = true;

			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "thirteen";
			}

			if (data.ivandisCell) {
				append("You get a nice artistic side-view of "+data.ivandisName+"'s perfectly round cubtum, facing a cock head-on as it grinds directly over the kid's belly button. This would be great in 3D, you muse.\n\n");
				if (!data.ivandisIntroDone) {
					data.ivandisIntroDone = true;
					append(data.ivandisName+" mumbles off-camera: \"O-Only Snagg's gonna see this... right?\"\n\nThe cat acts as narrator: \"Today we've got a special show for all you loyal viewers, in the living room, the Drive-in, those of you who snuck up to Snagg's room and got into his porn stash, wherever you are!\"\n\n");
				}
			}

			append("Once everyone sees you're focused on his stomach they imitate you. One guy takes a running start and delivers a vicious elbow-strike to the skunk's gut, missing his buddy's dick by the mere width of a pubehair. "+data.ivandisName+" wheezes pathetically and curls up, only to be opened again by manhands yanking on his ankles, his wrists. The cat takes advantage of the moment to drive his hips forward and bottom out inside the skunkling, raising a nice fat bulge that strains and throbs against the skunk's bellyfur.\n\n");

			if (data.ivandisCell) {
				append("\"Our little porn star here is only "+temp.p+" years old, folks. Well, cub or not, he certainly felt adult enough to slap on a t-shirt that begged us to rape him to death...\"\n\n"+data.ivandisName+" squeaks.\n\n\"Well?\" the cat asks him, closing a hand tight around his throat while he cranks up the speed of the gutfuck. \"You want to die on our cocks, don't you? Or maybe you want a couple diseases, something nice and slow~?\"\n\n"+data.ivandisName+" shakes his head, tearstained face going red...  the grip doesn't loosen. Slowly he gets it, and gives a whimpery little nod.\n\n\"That's a good little snufftoy,\" the cat purrs, and lets go.");
			}

			if (!data.ivandisdone1) addChoice(data.ivandischoice1, sewerExplore.bind("ivandis12face"));
			if (!data.ivandisdone2) addChoice(data.ivandischoice2, sewerExplore.bind("ivandis12butt"));
			if (!data.ivandisdone3) addChoice(data.ivandischoice3, sewerExplore.bind("ivandis12tummy"));
			addChoice("Next.", sewerExplore.bind("ivandis13"));
		}

		if (seg == "ivandis13") {
			if (isActive("Candy Ring")) {
				temp.c = "cake";
				temp.c2 = "sugardust fart rip";
			} else {
				temp.c = "assmud";
				temp.c2 = "fart rip";
			}

			append("As time goes on the itty bity gangrape becomes just a bitty gangrape, and then a gangrape, and finally, one might even dare to say: a <!i>good, hard<!i> gangrape.\n\nBy about the twenty-minute mark "+(data.ivandisCell?"your phone runs out of storage space (you text the file to some number the cat gives you and tuck it away) and ":"")+data.ivandisName+" is barely conscious, but that only seems to get the boys even more worked up.\n\nOne drives a couple fingers up the skunk's ruined hole and scoops a fat chunk of "+temp.c+" out before cramming it down his sobbing maw, rinse, repeat, rinse, repeat, until "+data.ivandisName+" is choking and spluttering and puking it back up all over himself. All that display earns him is a slap across the face and a loogie in the eye.\n\nThe cat grins, showing his teeth, and lovingly strokes the bruises on the kid's tummy. \"Time to fill him, guys. Who's poz?\"\n\nA few men raise their hands, all beefy as fuck: a boar, a stallion, a long-cocked giraffe...\n\n\"Please—\" the skunk manages, but someone sits their ass on his face and lets a spluttery "+temp.c2+".\n\n\"Please what?\" the cat asks. \"Please infect you with so many STDs you die in a fuckin week~? Sure thing, little buddy.\"");

			addChoice("Keep watching.", sewerExplore.bind("ivandis14"));
			addChoice("Move along.", JunkCity.junkCityHub);
		}

		if (seg == "ivandis14") {
			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "thirteen";
			}

			append("\"Please,\" "+data.ivandisName+" squeals, weakly raising his hands to try and push away the surrounding cocks and of course only really succeeding in giving the boys half-handjobs. \"Please. Plea—\"\n\nThe giraffe yanks his head down flat against the bed by his ears and feeds about a foot and a half of cockmeat directly down his little throat, shutting him up good. It only takes one thrust and a heavy gag from the skunklet, throat muscles constricting, to make him grunt and fill the kid's stomach with hot "+(isActive("Mood Ring")?getMood():"")+"cum.\n\n\"So,\" the cat says, still casually stroking "+data.ivandisName+"'s swollen belly. \"What strains you guys got?\"\n\n\"Mfff... infectin this fuckin "+temp.p+"-year-old with S.P.R., that's what I fuckin got... NRGHHH ya... take it... FUCKIN TAKE IT...\" the giraffe mutters. A couple guys laugh and roast him, talking shit about how he always gets too into it.\n\n\"Severe Penile Restrictosis,\" the cat explains for you. \"If you're an adult, you're fine, as made obvious by the size of that giraffe cock. But if you're elderly, or happen to be a worthless little slab of cubmeat... your dick tends to shrink and fall off~ Not like it'll matter, he hardly has one to begin with.\"");

			addChoice("Prompt the boar.", function() {data.boarPrompted = true; sewerExplore("ivandis15"); });
			addChoice("Prompt the stallion.", function() {data.boarPrompted = false; sewerExplore("ivandis15"); });
		}

		if (seg == "ivandis15") {
			if (isActive("Candy Ring")) {
				temp.c = "pushing a fat, coiled log of ice-cream cake out over it";
				temp.c2 = "sugardust fart rip";
			} else {
				temp.c = "violently shitting and pissing himself, the skunk's thighs quivering as they're coated with diarrhea";
				temp.c2 = "fart rip";
			}

			if (data.boarPrompted) {
				append("You ask the boar what his poison is.\n\n\"Got H.C.L.D.B.B.V.,\" he grunts, and squats over the skunk's pregnant-looking tummy before "+temp.c+".\n\n\"Highly Contagious Laxative Diuretic Bowel Bladder Voiditis\", the cat explains politely to you.");
			} else {
				append("You ask the stallion what his poison is.\n\nHe's a shy sort, you think, effeminate. He's staring at the ground. \"Well, it's, ah... it...\"\n\n\"Go on,\" the boar says. \"No one'll think you're gay, dude. We all just fucked a guy— er, boy, didn't we?\"\n\n\"Ah... well... it...\" The stallion takes a deep breath. \"Your heart starts to produce cum-blood. And then, um, your whole body... your veins... I'm— I'm just filled with cum, alright? I'm j-just fill... I'm...\"\n\nHe breaks down crying, a forearm over his face, trying to hide his tears from the guys.\n\nThe boar pats him on the back. \"Hey, man. It's okay. We're all here for you.\"\n\n\"Yeah,\" a couple guys say, and clap him on the 'ceps. \"Bros stick together.\"\n\nHe sniffles. \"... Th-thanks, guys...\"");
			}

			addChoice("... Next.", sewerExplore.bind("ivandis16"));
		}

		if (seg == "ivandis16") {
			data.ivandisDone = true;
			data.campTripIntro = false;
			if (!data.boarPrompted) temp.a = "Together, as friends," else temp.a = "Together";

			append(""+temp.a+" the boar and the stallion line their cocks up at "+data.ivandisName+"'s ruined boycunt, cockheads bumping and smearing pre around. At once they both ram in to the base and slide along the giraffe's cock inside the little skunk, adding to the swell of "+(isActive("Mood Ring")?getMood():"")+"cum already threatening to pop his cute belly. "+data.ivandisName+" struggles and thrashes and gags, puking up their infected cum, sneezing it, shitting it.\n\n\"There's a good kiddybitch,\" the cat says, and kisses the beyond-ruined skunk on his bloated, cum-stained cheek.\n\n"+data.ivandisName+" gurgles a thank-you and promptly passes out.");

			addChoice("Look around.", sewerExplore.bind("main"));
			addChoice("Move along.", sewerExplore.bind("camptrip1"));
		}

		if (seg == "houseintro") {
			data.houseDone = true;
			unlockJournal("Hyena family sewer");
			data.houseDogDone = false;
			data.houseNurseryDone = false;
			data.houseLibraryDone = false;

			append("You walk up the dirty driveway, each step a little stickier. The porch is stitched together from salvaged particle board, oak, mahogany. The flowers smell good enough to overpower their "+(isActive("Candy Ring")?"saccharine speckles":"speckles of filth")+".\n\nYou step around the doormat (a puddle of cum and piss) and knock.\n\nA naked futa hyena in her sixties answers, half-hard cock swinging toward you with the door, uncut, the tip leaking a constant stream of piss and pre.\n\nYour nostrils twinge at the gust of sweaty air fluttering past her conservative haircut. \"Why, if it isn't "+data.playerName+"! Come in, we're nearly ready for dinner— and please, call me Grandma!\"\n\nYou hesitate at the doorway.");

			addChoice("Follow her inside.", sewerExplore.bind("housekitchen"));
			addChoice("Look around.", sewerExplore.bind("main"));
		}

		if (seg == "housekitchen") {
			append("You follow the hyena through a foyer discolored with years of caked "+(isActive("Candy Ring")?"candystains":"filth")+", your nose already warming up to the "+(isActive("Candy Ring")?"scent":"stench")+". She takes you into an equally "+(isActive("Candy Ring")?"pink":"brown")+"/yellow/white-spattered kitchen. At the stove stands a twenty-year-old hyena wearing only an apron, stirring a pot of chunky stew with exaggerated gyrations, swinging her fat ass around in circles wide and fast enough to run the risk of knocking shit off the adjacent burners. At first you think it's aimed at you...\n\nThen Grandma slips up behind her and grabs a hold of both cheeks, casually ramming her entire cock up that ass with a simple <!i>schlip<!i>. The hyena woman just grunts.\n\n\"How's supper coming along, Mom?\" Grandma asks her daughter.");

			addChoice("I'm confused.", sewerExplore.bind("housekitchen2"));
		}

		if (seg == "housekitchen2") {
			append("\"Oh, sorry!\" Mom says, blushless, taking a slurp of the stew from her wooden spoon while Grandma starts railing away on her ass, making her tits bounce all shiny and slippery in the steam above the pot. \"Yes, it must be confusing. You see—\"\n\n\"Y'see,\" Grandma grunts, muting her daughter with a chokehold so she can properly assfuck her, spoon clattering to the "+(isActive("Candy Ring")?"sugary":"filthy")+" tile floor. \"I knocked my daughter up when she was sixteen, and 'course my <!i>seed<!i>—\" she emphasizes that word by cumming hard up the hyena girl's ass, fat"+(isActive("Candy Ring")?"":" yellow")+" globs of it splurting out over her nuts— \"... oversatured the little bitch's eggs and gave her triplets. So she's Mom... and I'm Grandma~\"\n\nMom goes ahegao at the ceiling while <!i>her<!i> mom squeezes out those last few splurts and cranks back up to a full-force assfuck.\n\n\"Kids should be in the nursery. Be a fuckin dear and go tell em supper's almost ready, wouldja?\" Grandma grunts.");

			addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			addChoice("Doghouse.", sewerExplore.bind("housedog"), {kinks: ["Female", "Feral", "Scat"]});
			addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housenursery") {
			data.houseNurseryDone = true;
			data.houseTodChosen = "";

			append("A trickling river of piss runs down the stairs. You tip toe around it not out of disgust but simply because you don't want to slip and die.\n\nAs you reach the top, you hear three sounds: the soft whirr of a motor, squeals, and laughter.");

			addChoice("But I do wanna walk through the piss river.", sewerExplore.bind("housepissriver"));
			addChoice("Investigate the sounds.", sewerExplore.bind("housenursery2"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housepissriver") {
			append("You specifically climb the stairs only when you can put your foot squarely in a piss-trickle. You have to wait out the intermittent droughts, so it's a lot slower.\n\nOn the penultimate step you put your foot down funny and slip backwards. Your head hits the stairs a total of seventeen times on the way down.\n\n\"Oh my God!\" Grandma yells, rushing out of the kitchen. \"Damn, you got fucked right up! How did I miss that?!\"\n\n... You die.");

			if (data.knownImmortality > 0) temp.c = "Respawn." else temp.c = "Respawn?";
			addChoice(temp.c, sewerExplore.bind("houserespawn"));
		}

		if (seg == "houserespawn") {
			data.knownImmortality++;
			append("You respawn in the next room over and hurry back to help Grandma get your corpse out of the way. You take the head and she takes the feet.\n\n\"It's fine, it's fine,\" she says, heaving your old body out into the street like it's whatever. \"Cleanup boys come around in a couple hours, don't worry about it...\"\n\nYou both head back inside. You go up to the nursery like originally planned, this time avoiding the piss.");

			addChoice("Jokes on you, I'm a climacophiliac.", sewerExplore.bind("housenursery2"));
		}

		if (seg == "housenursery2") {
			if (data.hasCock) {
				temp.g = "your cock and nuts, groping, tweaking";
			} else {
				temp.g = "the folds of your cunt, tweaking your clit";
			}


			append("You push the door open with a palm.\n\nThe "+(isActive("Candy Ring")?"over-sweet aroma":"stench")+" punches you in the face. While struggling to breathe, rubbing the gummy "+(isActive("Candy Ring")?"candy fog":"stank")+" from your eyelids, you feel three sets of toddlerpaws investigating "+temp.g+", one pair circling around back to peel your asscheeks open and sniff at your hole. With a few cautious squinty blinks you open your eyes blearily to see walls coated with "+(isActive("Candy Ring")?"rainbow-sparkle cake":"cubshit")+"— most of it fresh, amazingly. Huge piles of half-eaten "+(isActive("Candy Ring")?"desserts":"logs")+" have built up in the room's corners, its plush primary-colored carpet "+(isActive("Candy Ring")?"glossed":"crusted")+" over with a thousand puddles of cum and piss. The only furniture is a toybox overflowing with massive dildos, anal beads, bonds, lube bottles...\n\nBefore you stand the triplets, pre-school aged, staring up at you with "+(isActive("Candy Ring")?"sugar-stained":"shit-eating")+" grins.\n\nOn the left, a sissyboy with a layer of lipstick and mascara barely visible under his stained facefur.\n\nIn the middle, a futa with her grandma's cock and her mother's tits, both way too big for such a tiny body.\n\nAnd on the right... oh.\n\nYou know what that soft motor whirr was now. A little hyena girl writhes over in the corner, her sweaty thighs spasming inches away from a "+(isActive("Candy Ring")?"cake":"shit")+"-pile, desperately working two fat vibrating dildos set to HIGH in and out of her cunt at the same time. Her tiny hands can barely get a grip around them. She squeaks with shock at the sight of you, making the others laugh again.\n\n\"Don't look! Don't!\" she says, pounding herself in a frenzy. She keeps trying to cram them both all the way inside, but her slick little cunt is having none of that, and the constant vibration only makes them slip out faster every time she gets tired and eases up a little. \"I can get em deeper! Really! Just lemme... unf...!\"\n\n... Yeah, she can't get them any deeper.");

			addChoice("Tell them supper's ready and head back downstairs.", sewerExplore.bind("housekitchen3"));
			addChoice("You cuties down for a quick foursome~?", sewerExplore.bind("housefoursome"));
			addChoice("Put all this "+(isActive("Candy Ring")?"asscandy":"shit")+" back where it came from.", sewerExplore.bind("houseshitpack"), {kinks: ["Abuse"]});
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housefoursome") {
			data.houseFuck = false;
			append("All three immediately run up and start showing off their holes, the girl yanking her dildos out to show you her gaped cunny, the sissyboy begging you to fuck his pussy (while he indicates his tiny asshole), the futa flopping onto her butt, lifting up her heavy cock and nuts with some effort, and spreading her legs until they're parallel. Apparently none of them even considered that a question, so none of them answer, they all just look up at you expectant and desperate.\n\nYou notice their mouths are all held open, too. The mark of good training.");

			addChoice("Foursome begin.", function() {data.houseFuck = true; sewerExplore("housefoursome2"); });
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housefoursome2") {
			temp.g = pickByGenitals("cockhead", "cuntlips", "cockhead");

			append("You grab the futa toddlerslut by her hair and plug that cute little face up between your asscheeks, her button nose slipping along and inside your "+(isActive("Candy Ring")?"sweaty":"greasy")+", leaking pucker. You moan as she snorts "+(isActive("Candy Ring")?"various cakestains":"caked shit")+" from your hole and use your grip on her hair to jiggle that cute face up and down your crack quick, making her own moans vibrate adorably. You piss yourself simply from the pleasure.\n\nThe sissyboy is there in seconds, not willing to let even a single hot golden drop escape his urinal maw; he wraps both girly lips around your "+temp.g+" and sucks hard, practically milking the piss out. You grab the back of his head, too, and spend a few blissful moments as the filling in a warm, eager toddlertongue sandwich.\n\nAs a matter of course you grunt and shit "+(isActive("Candy Ring")?"creamy cake":"hard")+" all over the futa's face, fat chunks sliding languidly down her neck, over her immature tits...");

			addChoice("Next.", sewerExplore.bind("housefoursome3"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housefoursome3") {
			temp.g = pickByGenitals("the entire length of your cock", "your fist", "the entire length of your cock");
			temp.g2 = pickByGenitals("taking cock", "eating pussy", "taking cock");

			append("Before long you're flat on your back while three drooling toddlers ravish every part of your body they can reach. The futa's "+(isActive("Candy Ring")?"cake-smeared":"shitty little")+" tits fly around in wild circles as she bounces her tiny body on "+temp.g+", fat cubnuts thwapping against you. The girl has her mouth latched to yours, her tongue fighting a losing battle— you grab the back of her head and cram your big adult tongue right down her little throat, wiggling it hard as she gags and squirts with a shiver.\n\nThe sissyboy is definitely the sluttiest, which is actually saying something. Guzzling piss, "+temp.g2+", those things are all fine and good, but neither sibling can match his sheer unrelenting devotion to <!i>eroticism<!i>. Presently he's putting on a show for you, cramming a fifth toy up his already toy-packed boycunt, firing a sultry smirk over his shoulder. His body's shiny film of sweat is making his make-up run"+(isActive("Candy Ring")?",":" (shit mascara and shit lipstick, which he applied with an equally sexy show earlier)")+" giving that smirk an extra layer of whorishness.\n\nThe door bangs open. It's Grandma.\n\n\"I told you to tell the little— oh, I should've known.\"\n\nThey all look at her sheepishly.\n\nShe puts her hands on her hips and shakes her head. Even that tiny movement is enough to make her cock and nuts sway too. \"Not your fault, "+data.playerName+". They're little sex fiends, all three of them. Aren't you, kids?\"\n\n\"Mhm! Mhm!\" they all squeak, each providing their own proof— four fingers down the throat, a couple up the ass, a spreading of the thighs... \n\nShe smiles. \"Good cunts. Well, we're almost set up, so your punishment will have to wait til after dinner. Come on down.\"");

			addChoice("Head downstairs.", sewerExplore.bind("housekitchen3"));

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			if (!data.houseDogDone) {
				addChoice("Doghouse.", sewerExplore.bind("housedog"), {kinks: ["Female", "Feral", "Scat"]});
			}

			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houseshitpack") {
			append("You grab a steamy handful of fresh "+(isActive("Candy Ring")?"cake":"shit")+" from one of the piles and the hyenas all gather around, wide-eyed— even the girl, who has to waddle over while the toys whirr away inside her. You ask them which one has the emptiest ass.\n\nOf course, they all start shouting \"Me! Me!\" and bending over for you, pulling their holes open with two little digits from each hand.");

			addChoice("Pick the sissyboy.", function() {data.houseTodChosen = 'boy'; sewerExplore('houseshitpack2'); });
			addChoice("Pick the futa.", function() {data.houseTodChosen = 'futa'; sewerExplore('houseshitpack2'); });
			addChoice("Pick the girl.", function() {data.houseTodChosen = 'girl'; sewerExplore('houseshitpack2'); });
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houseshitpack2") {
			temp.g = pickByGenitals("cock and nuts", "cunt", "cock and nuts");

			if (data.houseTodChosen == "boy") {
				temp.cho = "faglet by his pretty "+(isActive("Candy Ring")?"cake":"shit")+"-clogged hair";
				temp.chog = "his";

			} else if (data.houseTodChosen == "futa") {
				temp.cho = "futa by her knee-length cock";
				temp.chog = "her";

			} else if (data.houseTodChosen == "girl") {
				temp.cho = "girl by her toys, pulling up at an angle so they don't just pop out and, in the process, bulging out her lower tummy cutely";
				temp.chog = "her";

			}

			append("You grab the "+temp.cho+" and hold "+temp.chog+" body firm against your crotch, grinding your "+temp.g+" against "+temp.chog+" adorable face. You bring the handful down until it's hovering just above "+temp.chog+" tiny butt. The other two leap in to help, each pulling one of the hyena's buttcheeks open and exposing "+temp.chog+" pre-gaped, twitching hole.");

			if (data.houseTodChosen != "boy") append("\n\n\"Mmmmm... C'mon, put it inside her...\" the sissyboy mewls to himself, cocklet throbbing against his smooth "+(isActive("Candy Ring")?"cake":"shit")+"-stained tummy.");

			if (data.houseTodChosen != "futa") append("\n\nThe futa takes a "+(isActive("Candy Ring")?"long slurp":"hard sniff")+" at your handful, licking her lips. She sneaks a fingerful out while she can, then smears it happily over one of her engorged kiddynipples.");

			if (data.houseTodChosen != "girl") append("\n\n\"ThaaaAAaaaAaat's it...\" the girl hyena purrs, the toys vibrating her voice. \"Fillerup...\"");

			addChoice("Fillerup.", sewerExplore.bind("houseshitpack3"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houseshitpack3") {
			temp.g = pickByGenitals("nutsack", "leaky cunt", "nutsack");

			if (data.houseTodChosen == "boy") {
				temp.cho = "sissy tod";
				temp.chog = "his";
				temp.chog2 = "he";

			} else if (data.houseTodChosen == "futa") {
				temp.cho = "futa tod";
				temp.chog = "her";
				temp.chog2 = "she";

			} else if (data.houseTodChosen == "girl") {
				temp.cho = "toddlergirl";
				temp.chog = "her";
				temp.chog2 = "she";

			}

			append("You give the "+temp.cho+" one single breath of air, then bury "+temp.chog+" face back in your musky junk and force the handful of "+(isActive("Candy Ring")?"cake":"shit")+" up "+temp.chog+" ass while "+temp.chog+" siblings giggle and help tuck all the loose chunks inside. You smear your crotchgrease hard over "+temp.chog+" face and grab another handful, then another, packing each deep inside "+temp.chog+" tiny butt until "+temp.chog2+"'s moaning muffled into your "+temp.g+" and "+temp.chog+" belly looks pregnant.\n\nThe other two poke around curiously. \"Look!\" one says, \"The innie became an outie~! Wooooow, so full...\"");

			if (data.houseTodChosen == "girl") append("You yank the dildos out and throw them wherever, finding space for two more fistfuls of "+(isActive("Candy Ring")?"dessert":"filth")+" up her kiddycunt. It's red, swollen, and most importantly super-stretchy, undoubtedly from Grammy's constant brutal cuntfucks...");

			addChoice("Anyway... supper's ready~", sewerExplore.bind("housekitchen3"));

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			addChoice("Leave the house.", sewerExplore.bind("main"));
			if (!data.houseDogDone) {
				addChoice("Doghouse.", sewerExplore.bind("housedog"), {kinks: ["Female", "Feral", "Scat"]});
			}
		}

		if (seg == "housedog") {
			data.houseDogDone = true;
			append("The backyard grass is a gradient, suffocated yellow-brown right beside the house, though it brightens to a healthy green further away. The doghouse sits firmly in the yellow-brown section.\n\nYou peek inside. A happy feral \"golden\" retriever with "+(isActive("Candy Ring")?"candy":"shit")+"-clogged fur mirrors your curiousity, head and eyebrows raising from her nap. Her food bowl is overflowing with chocolate-milk cum and creamy "+(isActive("Candy Ring")?"cake":"shit")+"chunks.");


			if (data.hasCock || data.hasBoth) {
				addChoice("Fuck her and shove her face in the bowl~", sewerExplore.bind("housedogfuck"));
				temp.c = "nuts";
			} else {
				temp.c = "cunt";
			}

			addChoice("Rub some 'food' on my "+temp.c+" and make her lick it off~", sewerExplore.bind("housedoglick"));

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housedogfuck") {
			append("You scratch behind her ears a little until she's totally warmed up to you, then drag a couple pets down her back, up her tail... lifting it.\n\nShe understands right away, nosing her bowl over to the back corner of her doghouse and lifting her fluffy ass high for you, hind legs 100% extended. Your pettings reverse, fingers wandering higher and higher through her "+(isActive("Candy Ring")?"sweet":"dirty")+" fur, until they wrap around her skull.\n\nYou line your cock up to her pucker, smearing a leaky "+(isActive("Candy Ring")?"jelly candy":"diarrhea dogshit")+" stream around with your head, then, in perfect sync, you push inside and shove her snout into the bowl.\n\nWith a desperate whine she pisses herself, her puss-fluff catching the dribbles and guiding them along her smooth belly, lapping and slurping voracious at the cum"+(isActive("Candy Ring")?"cake":"shit")+" mixture.");

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housedoglick") {
			temp.g = pickByGenitals("nuts, smushing up the chunks of "+(isActive("Candy Ring")?"cake":"shit")+" until both balls wear a shiny "+(isActive("Candy Ring")?"pastel-pink":"brown")+" sweater", "cuntlips, pushing a few nodules of "+(isActive("Candy Ring")?"cake":"shit")+" deep inside", "nuts, smushing up the chunks of "+(isActive("Candy Ring")?"cake":"shit")+" until both balls wear a shiny "+(isActive("Candy Ring")?"pastel-pink":"brown")+" sweater, a few globs of "+(isActive("Candy Ring")?"sugary":"caramel-colored")+" cum rolling down between your pussylips..");
			temp.g2 = pickByGenitals("nuts", "cunt", "nuts");
			temp.g3 = pickByGenitals("your nutsack, your pucker, and the base of your cock sparkle", "the mound of your vulva, all the sensitive surrounding skin, and every inch of your inner tunnel sparkles", "your nutsack, your cunt, and the base of your cock sparkle");

			append("You steal a warm scoop of her food. She growls a little, territorial.\n\nYou exhale, spread your legs, and smear the handful over your "+temp.g+".\n\nShe bounds forward and starts angrily stealing her food back, sucking and slurping— even nipping a little at your "+temp.g2+". You bop her on the head and hiss with disapproval. Her tail sinks between her legs, over her "+(isActive("Candy Ring")?"gummy":"shit")+"-leaky doggypucker, and she shies off a little, never nipping again.\n\nAt some point your legs start to wobble from the retreiver's fierce, non-stop licking, so you sit your ass down on the muddy yellow grass and grab her scruff, keeping her snout lodged between your thighs for another ten, fifteen minutes, until "+temp.g3+" clean with canine saliva.");

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houselibrary") {
			data.houseLibraryDone = true;
			append("You sniff out the library. It's the only place in the house that smells somewhat acceptable.\n\nBookcases lean exhausted against each other in a lazy grid. Several titles catch your eye:\n\nENGINETICS: FIELD NOTES\n\nPLAYING YOUR CHARACTER\n\nGETTING SOME: ONE HUNDRED HANDY SEGWAYS FROM REGULAR CONVERSATION TO SEX");

			addChoice("ENGINETICS.", sewerExplore.bind("houselibraryengine"));
			addChoice("PLAYING YOUR CHARACTER.", sewerExplore.bind("houselibraryplaying"));
			addChoice("GETTING SOME.", sewerExplore.bind("houselibraryget"));
			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houselibraryengine") {
			append("It's a fat, dusty scrapbook. LANA scribbled their name in jerky cursive under the front cover.\n\nYou thumb through pages of circuitry diagrams, sketches of berries and mushrooms, page-long sentences full of technobabble. Lana wrote none of this. It's all in neat, canine handwriting. Finally you find a paragraph you can somewhat understand:\n\n<!i>... Enginetic fluid, cyan and purple, conductive liquid. Tangy. Good in baking?\n\n8 beakers set up beneath engine leaks in Apothecary construction site. Left for 1 week. Leaked fluid attracted glowmosquitos which laid eggs.\n\n!!!REMINDER: TALK TO SEPTRICA. SEAL ENGINE ROOM!!!<!i>");

			addChoice("PLAYING YOUR CHARACTER.", sewerExplore.bind("houselibraryplaying"));
			addChoice("GETTING SOME.", sewerExplore.bind("houselibraryget"));
			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houselibraryplaying") {
			append("You skim through a chapter called ISOLATION.\n\n\"... sticking to their character as a kind of psychological anchor. Isolation WILL EVENTUALLY erode our sense of self.\n\nAs we near the third decade since impact too many too often forget it was agreed early on that cub or adult, soldier or pacifist, none among us have any right to shunt guilt onto those characters born from archetypes childish or gentle WHO CHOOSE TO STAY THAT WAY— no matter how old their minds nor what we consider the behaviour of a 'normal' thirty-year-old, the children owe us no more maturity nor service in combat than THEY DECIDE THEY OWE. None among us...\"\n\nThe author preaches on.");

			addChoice("ENGINETICS.", sewerExplore.bind("houselibraryengine"));
			addChoice("GETTING SOME.", sewerExplore.bind("houselibraryget"));
			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houselibraryget") {
			append("It's a sexy little pink handbook. you flip it open to a section called DIVERTING OFF OF IDIOMS.\n\n\"74. Hot potato --> I'll get your potato hot~ <3\n\n75. Ball is in your court --> I'll slip my balls in your court~ <3\n\n76. Beat around the bush --> I'll beat around your bush~ <3\n\n77. Cry over spilt milk --> I'll cry if I spill your milk~ <3\n\nPRO TIP: Always say 'if you know what I mean' even if they already know what you mean.\"\n\nWow this is garbage.");

			addChoice("ENGINETICS.", sewerExplore.bind("houselibraryengine"));
			addChoice("PLAYING YOUR CHARACTER.", sewerExplore.bind("houselibraryplaying"));
			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			addChoice("Living Room.", sewerExplore.bind("houselivingroom"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "houselivingroom") {
			append("It's a cute little "+(isActive("Candy Ring")?"candy":"shit")+"-coated living room. A couch, T.V., dining table, sex toys everywhere, framed family portraits. Perfectly normal.");
			if (!data.houseCouchDone) addChoice("Examine couch.", sewerExplore.bind("housecouch"), {give: ["Capsule", 3]});

			addChoice("Examine T.V.", sewerExplore.bind("houseTV"), {kinks: ["Cub", "Scat"]});
			addChoice("Examine portraits.", sewerExplore.bind("houseportraits"), {kinks: ["Cub", "Piss", "Scat", "Abuse"]});
			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}

			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housecouch") {
			data.houseCouchDone = true;
			append("You dig through the crusty cushions and find x3 Capsules!");
			addChoice("Back.", sewerExplore.bind("houselivingroom"));

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}
		}

		if (seg == "houseTV") {
			append("You thumb the old CRT T.V. on and channel surf.\n\nChannel 69 blares COOKING WITH MIKEY J, which is halfway through an eating contest. Cubs from eight to thirteen scarf down "+(isActive("Candy Ring")?"chocolate":"\"chocolate\"")+" pudding with both hands, getting eliminated one-by-one whenever they just can't fit another "+(isActive("Candy Ring")?"spoonful":"log")+" down their little throats.");

			addChoice("Back.", sewerExplore.bind("houselivingroom"));

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}
		}

		if (seg == "houseportraits") {
			append("You gander hard at the portraits.\n\nEven in photos dating back thirty years, every member of the family is the same age they are now. The only difference is the lewdness; in the earliest pictures Grandma and Mom have clothes on, albeit mostly skimpy panties and tight-fit t-shirts. About twenty years back they all start going full nude, and their casual laughing poses turn to voracious brow-furrowed sex positions, getting more and more extreme— there aren't any recent pictures of the toddler triplets <!i>without<!i> Grandma's cock down their throats or up their pudgy little butts, no family dinners where the main course <!i>isn't<!i> a huge "+(isActive("Candy Ring")?"triple-tiered cake":"steaming pile of hyena shit")+".\n\nThe biggest portrait is a beautiful sprawling collage of toddlerabuse, a step-by-step picture story of each cub getting packed almost to bursting with "+(isActive("Candy Ring")?"desserts":"creamy logs of shit")+". Their little futa toddler seems to catch most of it. You spot a chronology:\n\nGrandma holding her little maw open with two fingers in each corner. Mom's fat ass looming above her face. Soft-serve "+(isActive("Candy Ring")?"ice cream":"logs")+" piling up in her little mouth. Grandma packing them down with the sole of her sweaty footpaw. More "+(isActive("Candy Ring")?"ice cream":"logs")+". More packing. The futa clearly choking and gagging, her throat bulged out fat. More "+(isActive("Candy Ring")?"ice cream":"logs")+". More packing. Her little face gone blue. Grandma cockslapping her over and over to keep her conscious. More "+(isActive("Candy Ring")?"ice cream":"logs")+". More packing... this time Grandma uses her cock.\n\nAnd finally, a close-up of the toddler gasping for breath, holding up a double peace-sign, tummy bloated, a little "+(isActive("Candy Ring")?"cream":"shit")+" dripping from her belly button.");

			addChoice("Back.", sewerExplore.bind("houselivingroom"));

			if (!data.houseNurseryDone) {
				addChoice("Nursery.", sewerExplore.bind("housenursery"), {kinks: ["Toddler", "Intersex", "Male", "Female", "Scat", "Piss"]});
			} else {
				addChoice("Kitchen.", sewerExplore.bind("housekitchen3"));
			}

			if (!data.houseLibraryDone) {
				addChoice("Library.", sewerExplore.bind("houselibrary"), {kinks: ["Plot"]});
			}
		}

		if (seg == "housekitchen3") {
			data.houseSippyCups = false;
			append("Mom and Grandma bustle from kitchen to living room, setting the table.\n\nYou head into the kitchen.");
			addChoice("Can I help out?", sewerExplore.bind("housekitchenhelp"));
			addChoice("What's in the stew?", sewerExplore.bind("housekitchenstew"));
			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housekitchenhelp") {
			append("\"Absolutely hun,\" Grandma says all warm and friendly, like you're her grandchild.\n\nShe passes you three sippy cups. \"Shit"+(isActive("Candy Ring")?" some confectionery":"")+" and piss in these, would ya~?\"");
			addChoice("I would love to.", sewerExplore.bind("housekitchenhelp2"));
			addChoice("Nevermind. What's in the stew?", sewerExplore.bind("housekitchenstew"));
		}

		if (seg == "housekitchenhelp2") {
			data.houseSippyCups = true;
			if (data.myntColour == "red") temp.m = "cherries";
			if (data.myntColour == "blue") temp.m = "blueberries";
			if (data.myntColour == "mint") temp.m = "fresh mint leaves...";

			append("You screw one of the tiny, bright-colored cups into the floor's "+(isActive("Candy Ring")?"coating of candy":"filth blanket")+" and squat over it, the rim digging gently into the soft skin around your pucker, pressurizing those first explosive "+(isActive("Candy Ring")?"cake":"shit")+"-splurts. You grunt and fill each like that in turn, then "+pickByGenitals("stand up and aim do the same with a long, relaxing piss", "stand up a little, still crouching, and slip a couple fingers along your cuntcrack to disperse a spray of piss among all three", "blast them in turn with a splurt of piss from both cunt and cock")+".\n\nMom helps you cap them up— but not before taking a huge, deep whiff of your "+(isActive("Candy Ring")?"ass-baking":"waste")+" and a little slurp herself. \"Mmff... a girl gets get tired of the same five flavors around here... your "+(isActive("Candy Ring")?"cake":"shit")+" tastes like "+temp.m+"~\"\n\nThe hyena kids sprint downstairs laughing, each grabbing their cup on the way to the living room.");

			addChoice("Suppertime.", sewerExplore.bind("housesupper"));
		}

		if (seg == "housekitchenstew") {
			append("\"It's an old family recipe,\" Grandma says, eyes fogging over with nostalgia. \"... "+(isActive("Candy Ring")?"Warm, mushed-up candy bars":"Shit")+".\"\n\nThe hyena kids come rocketing downstairs, slapping both your butts on their way to the living room.");

			addChoice("Suppertime.", sewerExplore.bind("housesupper"));
		}

		if (seg == "housesupper") {
			if (data.houseTodChosen == "girl") {
				temp.tod = "The little girl hyena";
				temp.tod2 = "her ass and cunt still packed full of "+(isActive("Candy Ring")?"cake":"shit")+"";
				temp.tod3 = "\"Uh-huh...\" she purrs, sinking a couple fingers up her "+(isActive("Candy Ring")?"pink":"brown")+"-dripping cunt";
			} else if (data.houseTodChosen == "futa") {
				temp.tod = "The little futa hyena";
				temp.tod2 = "her ass still packed to bursting with "+(isActive("Candy Ring")?"cake":"shit")+"";
				temp.tod3 = "\"Uh-huh...\" she purrs, stroking her cocklet with a palmful of "+(isActive("Candy Ring")?"pink":"brown")+"";
			} else if (data.houseTodChosen == "boy") {
				temp.tod = "The little sissyboy hyena";
				temp.tod2 = "swaying his hips sluttily as a little "+(isActive("Candy Ring")?"cake frosting":"shit")+" leaks down his packed-full asscrack";
				temp.tod3 = "\"Yes please!\" he squeaks, stroking his cocklet with a palmful of "+(isActive("Candy Ring")?"pink":"brown")+"";
			}

			append("Even before they get settled at the dinner table the kids start sucking dense lumps of "+(data.houseSippyCups?"your ":"")+""+(isActive("Candy Ring")?"cake":"shit")+" through the tiny spouts of their sippy cups, somehow. You give Grandma an incredulous look.\n\n\"What?\" She blinks, gives her left tit a squeeze. \"They've got well-trained suckin muscles. You tellin me you <!i>can't<!i> suck "+(isActive("Candy Ring")?"cake":"shit")+" through a sippy cup?\"\n\n");

			if (data.houseTodChosen == "") {
				append("The moment your ass hits the chair all three start begging to sit in your lap. They all have incredibly full butts, too...");
				addChoice("Pick the futa.", function() {data.houseTodChosen = 'futa'; sewerExplore("housesupper2"); });
				addChoice("Pick the girl.", function() {data.houseTodChosen = 'girl'; sewerExplore("housesupper2"); });
				addChoice("Pick the boy.", function() {data.houseTodChosen = 'boy'; sewerExplore("housesupper2"); });
			} else {
				append(temp.tod+" waddles toward you, arms outstretched, "+temp.tod2+".\n\n\"Awwww,\" Grandma coos. \"Does someone wanna sit in the player's lap?\"\n\n"+temp.tod3+".\n\nThe other two start complaining that they wanna sit on laps too. Mom and Grandma scoop them up, the latter forcing her cock up that little toddlerbutt as a matter of course.");
				addChoice("Come on up, hun~", sewerExplore.bind("housesupper2"));
			}

			addChoice("Leave the house.", sewerExplore.bind("main"));
		}

		if (seg == "housesupper2") {
			if (data.houseTodChosen == "girl")	temp.chog = "her";
			else if (data.houseTodChosen == "futa")	temp.chog = "her";
			else if (data.houseTodChosen == "boy")	temp.chog = "his";

			temp.g = pickByGenitals("threading your cock up between "+temp.chog+" tiny asscheeks", "hugging "+temp.chog+" close to your chest", "threading your cock up between "+temp.chog+" tiny asscheeks");

			append("You pick the little cub up just underneath "+temp.chog+" armpits and plop em down on your lap, "+temp.g+", loose "+(isActive("Candy Ring")?"asscandy":"cubshit")+" smearing warm over your crotch.\n\n");

			append("Grandma smiles a warm grandmotherly smile and casually fucks her own slab of toddlermeat while ladling out the chunky brown stew into everyone's bowl. Mom offers to help, complaining softly that she's too old to be doing all the work, and gets shut down by an equally grandmotherly scowl.\n\nOnce everyone's bowl is spilling over and the kids are all squirming and drooling with anticipation, she drives her cock deep inside her little cub and cums, grunting: \"HNnnnnghh... dig in~!\"");

			addChoice("Dig in.", sewerExplore.bind("housesupper3"));
		}

		if (seg == "housesupper3") {
			if (data.houseTodChosen == "girl") {
				temp.cho = "She cranes over her shoulder, begging you to feed it to her";
				temp.chog = "her";
				temp.chog2 = "her";
			} else if (data.houseTodChosen == "futa") {
				temp.cho = "She cranes over her shoulder, begging you to feed it to her";
				temp.chog = "her";
				temp.chog2 = "her";
			} else if (data.houseTodChosen == "boy") {
				temp.cho = "He cranes over his shoulder, begging you to feed it to him";
				temp.chog = "her";
				temp.chog2 = "his";
			}

			temp.g = pickByGenitals("hotdogging "+temp.chog+" hard", "rubbing your vulva rough against "+temp.chog+"", "hotdogging "+temp.chog+" hard");

			append(temp.cho+". Without hesitation you grab "+temp.chog2+" hair and slam "+temp.chog2+" face down into the bowl of "+(isActive("Candy Ring")?"melted candy-bar":"shit")+"-stew, listening happily to the fucklet's desperate little gags and gulps as mouthfuls clog "+temp.chog2+" tiny esophagus and slosh over the sides of the bowl~\n\n\"Mmmffff,\" Grandma groans, grabbing the bowl with both hands and tipping it up against her toddler's constantly held-open mouth. Even as the little hyena starts choking and spilling it over "+temp.chog+" chin she doesn't let up for a second, growling deep in "+temp.chog+" ear: \"Chug it down for Grammy... that's it...\"\n\nMom, on the other hand, feeds her toddler dainty little spoonfuls of broth, fishing around the only "+(isActive("Candy Ring")?"melted choco":"shit")+"chunks big enough to really choke on. The poor thing is bored to death...");

			addChoice("Next.", sewerExplore.bind("housesupper4"));
		}

		if (seg == "housesupper4") {
			append("Once the bowls are empty and the cub bellies packed full, Mom dutifully licks everyone's bowl clean— with a little help from her still-hungry daughter— and Grandma starts getting restless.\n\n\"Des-sert~?\" the sissyboy asks, his ass swaying left with the first syllable and right with the second.\n\n\"What're you hungry for, sweetie?\" Grandma coos, dragging her cummy, "+(isActive("Candy Ring")?"candy":"shit")+"-coated cock lovingly over the toddler's face.\n\n\"Hrnnnhmm...\"\n\nThe futa cub speaks up: \""+(isActive("Candy Ring")?"Candy baaaars":"Poop")+"!\"\n\nGrandma shakes her head. \"We just had that for dinner. Let's try to think of something different...\"");

			if (data.hasCock) {
				addChoice("How about my cum~?", sewerExplore.bind("housesuppercum"));
			} else if (data.hasBoth) {
				addChoice("How about my cum~?", sewerExplore.bind("housesuppercum"));
				addChoice("How about my cuntjuice~?", sewerExplore.bind("housesuppercunt"));
			} else if (data.hasCunt) {
				addChoice("How about my cuntjuice~?", sewerExplore.bind("housesuppercunt"));
			}

			addChoice("How about my piss~?", sewerExplore.bind("housesupperpiss"));
		}

		if (seg == "housesuppercum") {
			if (data.houseTodChosen == "girl") {
				temp.cho = "girl";
				temp.chog = "her";
				temp.chog2 = "she";
			} else if (data.houseTodChosen == "futa") {
				temp.cho = "futa";
				temp.chog = "her";
				temp.chog2 = "she";
			} else if (data.houseTodChosen == "boy") {
				temp.cho = "boy";
				temp.chog = "his";
				temp.chog2 = "he";
			}

			append("\"YAY FROSTING~!\"\n\nTwo latch their open mouths to either side of your shaft while your little "+temp.cho+" pops the head past "+temp.chog+" lips, tongue wiggling over your slit. Grandma chuckles and comes up behind, letting her own cockmeat flop out over the toddler"+temp.cho+"'s head, pre dripping down and coalescing in the lashes of their starry-eyes. They clearly consider TWO cocks in their face at once an exciting treat, since usually the only one they get to choke on is Grandma's~\n\nYou thrust forward hard a couple times until you finally ram down the fuckling's tight throat, the other two happily making out around your shaft. Grandma pushes her "+temp.cho+"'s head down hard on your cock until almost half of it bulges "+temp.chog+" esophagus, not caring an ounce how hard "+temp.chog2+"'s gagging or how blue "+temp.chog+" face is, focused only on making you cum down her grandkid's throat.\n\nWith your cock now coated base-to-tip with slimy hyena toddlerslobber you don't last even five more seconds; hot "+(isActive("Mood Ring")?getMood("You"):"")+"cum gushes out, your nuts clench tight to your body and throb, and the first ropes pump directly down into "+temp.chog+" already "+(isActive("Candy Ring")?"choco":"shit")+"-packed belly. As you pull out the rest splurt into "+temp.chog+" mouth and pour from "+temp.chog+" nose— the other two rush up to suck "+temp.chog+" nostrils greedily.");

			addChoice("Wind down.", sewerExplore.bind("housewinddown"));
		}

		if (seg == "housesuppercunt") {
			append("\"Ooooo,\" Grandma purrs, stroking herself and her grandchildren. \"Don't get to chug pussy slobber too often, huh cubs?\"\n\nThey're all bright-eyed with disbelief. \"Does... do they... they really SQUIRT?!\"\n\n\"I'll bet, if they offered,\" Grandma says. \"Mom doesn't squirt, does she?\"\n\n\"Not at ALL!!!\"\n\nMom frowns in the corner.\n\nThey all rush up and start lapping hungrily at your cunt, pushing each other out of the way.");

			addChoice("Next~", sewerExplore.bind("housesuppercuntfuck"));
		}

		if (seg == "housesuppercuntfuck") {
			temp.g = pickByGenitals("at your nutsack", "your ass and lower stomach", "at your nutsack");

			append("Eventually they stop shoving for the best spot (directly in front of your pussy), two wiggling around their sibling so they can slurp "+temp.g+", their little paws groping all over your thighs and cheeks.\n\nGrandma slips up behind and abuses their other ends as hard as she can. She pumps three or four digits up each cubcunt in alternation, forcing their whole bodies forward, pushing their warm little mouths firmer up against your body. Watching her fingerfuck the shit out of her pre-school aged grandkids with such passion sends you right over the edge.\n\nYou cum hard and shit yourself at the same time, thick sprays of "+(isActive("Candy Ring")?"cake":"diarrhea")+" and pussyjuice spattering over their innocent little faces. You grab two heads, boy or girl or futa you don't know, grinding their soft facefur against your squirting cunt, forcing them to chug it. The last one circles around back and latches their mouth to your hole to choke down every last dribble of "+(isActive("Candy Ring")?"cake":"shit")+"slop, then digs their tiny tongue in deep and dutifully cleans you out inside, "+(isActive("Candy Ring")?"candyjuice":"diarrhea")+" running down over their chin.");

			addChoice("Wind down.", sewerExplore.bind("housewinddown"));
		}

		if (seg == "housesupperpiss") {
			temp.g = pickByGenitals("cock", "cunt", "cock and cunt");
			temp.g2 = pickByGenitals("your nuts and asscrack", "your cuntlips", "your nuts and pussy");

			append("\"YAY LEMONADE~!\"\n\nAll three cluster around your "+temp.g+", warm little tongues digging into every crevice they can find. With a grunt you release a hot piss-stream over their cute faces, aiming in their eyes, up their nostrils— although they sneeze and squeak it doesn't dissuade them one bit. In fact, they seem even thirstier for your piss now that some of it has been wasted pouring down their blushy cheeks and onto the floor~\n\nBy the time your stream thins to a dribble they start sucking "+temp.g2+" clean, one of them cumming just from the taste, squealing high and girly as her little paw rubs furiously between her legs.\n\n\"Open,\" Grandma demands, yanking the boy back by his hair. He opens his mouth, panting, showing her his stained-yellow tongue as proof of his high status as a piss-guzzler. \"Good boyyyy~!\" she purrs, sinking four fingers up his tiny ass and molesting it hard as reward. He cums just from that, painting his smooth chest and tummy with spurts of "+(isActive("Mood Ring")?getMood("Boars"):"")+"jizz.");

			addChoice("Wind down.", sewerExplore.bind("housewinddown"));
		}

		if (seg == "housewinddown") {
			append("Dessert lasts for hours.\n\nAfter the cubs lick themselves (and each other) clean and suck the spilled "+(isActive("Candy Ring")?"sweets":"filth")+" from the floor Grandma takes each one and slams them down on the table for an assraping, bowls and spoons flying everywhere. You help Mom tidy and wash those, hugging her naked body from behind while she scrubs them with suspiciously white and goopy soap.\n\nEven after each triplet's had their ass gaped and pumped full of cum Grandma <!i>still<!i> isn't done. She grabs her little granddaughter and wipes that "+(isActive("Candy Ring")?"candy-coated":"shitty")+", cummy adult cock off on her innocent face, then them greasy nuts, then them asscheeks get to wrap around the toddlergirl's entire head as Grandma uses her tiny mouth as toilet paper and grinds it up and down her crack.\n\n... Okay, <!i>now<!i> she's done.\n\nYou thank the family for supper and flop down on the couch with them to watch T.V. Some time passes, everyone panting and sweating. There's a documentary on called THE MOSSMAN: FACT OR FICTION?\n\n\"Fiction,\" Grandma grunts, and changes the channel.");

			addChoice("Look around.", sewerExplore.bind("main"));
		}

		if (seg == "talk goat") {
			data.gotBait = false;
			if (getItem("Glowberry").amount > 0) data.gotBait = true;
			if (getItem("Glowberry Wine").amount > 0) data.gotBait = true;
			if (getItem("Glowberry Pie").amount > 0) data.gotBait = true;
			if (getItem("Sweetgrass Leaf").amount > 0) data.gotBait = true;
			if (getItem("Pastel Ring").amount > 0) data.gotBait = true;


			//Is my fish ready yet?

			if (data.fishCookin) {
				if (data.prevTime <= getTimer()-100) {
					data.fishReady = true;
				} else {
					//Goat kills time
					append(pickOne(["The goat's leaning back while he waits for a bite.\n\nHe yanks the old pole now and again.", "...... He's sleeping at the wheel. The pole jerks him awake.", "You catch him reeling your bait out and licking it.\n\nHe catches you catching him and casually lets it plunk back down into the canal.\n\nHe pretends like nothing happened.", "He's zoned-out, hypnotized by the sound of the rushing water.", "\"It'll be a while yet...\"", "The line jerks taut. \"We got a live one!\" he shouts, reeling so fast and hard his ass\nnearly slips off the back of the milkcrate.\n\nWhatever it was unhooks itself and fucks off.\n\n\"Dangit,\" he says, kicking the rail. \"Almost had er...\"", "A father antelope mows his lawn a few blocks down.\n\nHe and the goat wave to each other and talk about grabbing a beer down\non B-75 next Saturday.", "A pipe grinds open somewhere far down the canal, spilling "+(isActive("Candy Ring")?"frosty ice cream":"brown sewerslop")+".\n\nThe goat squints to see if he can spot any catches."]));
					var s:MintSprite = addSprite("assets/img/effect/fishergoat.png");
						s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: AeriaQuies", "");
						s.x = 350;
						s.y = 14;
					data.fishReady = false;
				}
			} else {
				if (Math.random() > 0.02 || onFA()) {
					append(pickOne(["The goat scratches his nuts again.", "He yawns.", "He pisses hot and murky over the railing.", "You both chat for a while.\n\nHe continually drags the conversation back to fishing with random fish facts.", "He goes on a bit of a rant about the war.\n\nHe lapses into mumbles a lot.\n\nThe only thing you really catch is that he's pissed that slept through so much of it.\n\nApparently it was a real sexy affair.", "You sit with him for a while, listening to the rush of the "+(isActive("Candy Ring")?"creamy waters":"waste")+".", "The goat's whistling an old sailor's song.\n\nIt goes like: <!i>da-da-da-daaaaaaa, da-da-da-da-da-da-da-daaaaaaaaa\n\nda-da, da-da, da-da-da-da-da-da-da-da-da-daaaa-daaaa\n\ndaaa-daaaaaaaa-daaa-daDA-daDA-daDA.<!i>", "Oh! This time he scratches his ass.\n\nAlways an adventure with this guy.", "The goat stretches.\n\nHis body's nice and toned, beneath the greasy curls of his woolen chest-tuft.", "He sneezes, snapping himself out of daydream.", "The goat sniffs his fingers again... then sucks them a little..."]));
					var s:MintSprite = addSprite("assets/img/effect/fishergoat.png");
						s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: AeriaQuies", "");
						s.x = 350;
						s.y = 14;
				} else {
					append(pickOne(["A couple cubs run past from down the street and bean him in the head with a dildo, which you guess they were playing catch with, or something?\n\nHe gets up, fuming. \"YOU FUCKEN KIDS!\"\n\nThey laugh and make faces at him, running away.", "A concerned suburban mom with a bowlcut eyes the naked goat like he's cancer. \"There\'s a lot of kids in this neighbourhood, you know,\" she says, arms crossed.\n\n\"So?\"\n\n\"So... well. You're just so <!i>clean<!i>...\" She pauses. Her tone diffuses like poison gas into the silence. She un-crosses her arms, totally not trying to show off her greasy pits. \"It\'s inappropriate. One might even say you're a bad role model...\"\n\nThe goat sniffs his own pits, self-conscious. \"Well now, ma'am, I... I'm plenty dirty.\"\n\nHer son calls from down the street, whining for a peanut butter and cum sandwich. She gives her cock an exhausted tug and glares at the goat. \"Take a swim sometime,\" she says, and, in mutters on the way out: \"Unbelievable... fucking vanillas... move to the forest, if you're going to go out in public like that... probably wouldn't even fuck my son if I lubed him up and bent him over...\"\n\nThe goat turns to you, baffled. \"Someday, someone's gonna have to break it to that poor kid. Son, I'm sorry to tell you this, but your mum's a total cunt...\""]));
				}
			}

			//Fish is ready!
			if (data.fishReady) {
				if (data.glowberryBait) {
					if (Math.random() > 0.5) {
						if (canGain) addToItem("Sweetgrass Leaf", 3);
						append("\"Caught ya some greasy leaves.\"");
					} else {
						append("The goat leaps up and reels madly, one foot pounding onto the railing. \"WOOOOOOOOAH NOW!\" he bleats, the line racing back and forth with the current, almost yanking him overboard.\n\nYou get behind him to help pull, ");
						append(pickByGenitals("cock threading up between his greasy asscheeks", "crotch pressed to his butt", "cock threading up between his greasy asscheeks"));
						append(", his musk rushing up your nose. Eventually the line slackens and you both topple backwards.\n\nHe reels, reels, reels... something small and black... oh. It's a garbage bag.\n\n\"Tricky devil,\" he says, shaking the bag out and reaching inside to feel the bottom. \"Not a hole in her... wew. Sumbitch like this'll pull when she catches the current...\"");
						if (canGain) addToItem("Garbage Bag", 1);
					}
				} else if (data.glowberryPieBait) {
					if (onFA()) {
						append("He pulls a sexy, "+(isActive("Candy Ring")?"cream":"shit")+"-soaked [FurAffinity Censor] from the depths. \"Well,\" he says with a shrug. \"You get some duds...\"");
					} else {
						append("The goat pulls a chocolate-coated starfish boy up from the depths of the sewers and gently unhooks him. He's all shiny, covered in cute little nubs, the insides of his chest and hands colored lighter and suction-cupped. \"Hullo,\" he says, happily chewing a mouthful of your Glowberry Pie.\n\nThe goat wastes no time, pulling the ");
						if (isActive("Pastel Ring")) append("tiny three-year-old") else append("fishling");
						append(" up against his crotch, grinding his cock— now about eight inches, hard— through the boy\'s soft, brown-dripping nubs. \"It <!i>was<!i> your bait,\" he says, \"but I did all the work...\"\n\nHe crams his cock down the boy\'s suctiony gullet, displacing a splurt of "+(isActive("Candy Ring")?"ice cream":"sewage")+" and glowy pie filling which globs down over his smooth chest. The goat props his catch up against the railing and throatfucks him voraciously, not stopping even as the poor little thing squirms and gags and pukes"+(isActive("Candy Ring")?" ice cream":"")+" all over himself.\n\n\"Mmmf... little fishbitch...\" the goat growls, pumping the kid's nubbly stomach full of "+(isActive("Mood Ring")?getMood():"")+"cum and tossing him back to the canal.\n\nOn the way down he says \"Thanks for the pieeee...\"");
					}

				} else if (data.glowberryWineBait) {
					if (onFA()) append("The goat reels up a [FurAffinity Censor] and tosses it back right away. \"Fuckin\' censors eat right through a glass bottle... and that still ain\'t enough for em...\"\n\nHe holds up his line, frayed where the hook used to be.") else {
						append("The goat reels in a little nymph girl hugging your empty glowberry wine bottle, deepthroating the neck, trying to suck the last few blue droplets of wine from it. The goat just shakes his head and drops her and the bottle back in.");
						append("\n\nThe goat whips out a Broken Cell from nowere. \"She dropped this...\" he says.\n\n... He looks away. You get this feeling he's just trying to pawn his junk off on someone.");
					}
				} else if (data.sweetgrassLeafBait) {
					if (data.metKemp == 0) temp.a = "an otter";
					if (data.metKemp == 1) temp.a = "Kemp the otter";
					if (data.metKemp >= 2) temp.a = "Kemp";
					if (Math.random() > 0.5) {
						append("You peer over the railing in time to see ");
						append(temp.a);
						append(" coasting down the canal on his inner tube. He unhooks your sweetgrass leaves from the fishing line, kicks off the canal wall, and sails away.\n\nOnly now does the goat notice. \"Got-damn otters...\"");
					} else {
						append("\"Real weird bites tonight,\" the goat says, giving the waters wary snake-eyes. Without further comment he hands you a slightly-punctured Cum Balloon and tells you to stay safe.");
						if (canGain) addToItem("Cum Balloon", 1);
					}
				} else if (data.pastelRingBait) {
					append("The goat gives a long whistle, pulling up a perfectly good (if a little dirty) slab of Fuckmeat, hook lodged deep in the baby boy's tiny pucker.\n\n\"Now that's a catch.\"\n\nCarefully, slipping altogether way more finger than necessary up the infant's "+(isActive("Candy Ring")?"icy":"sewage")+"-slick asscunt, the goat unhooks him and hands your Pastel Ring back. He lays the dazed little half-drowned babycunt down belly-first on the milkcrate, slapping his cock between those shiny grease-stained fuckpillows and hoses the boy's bleeding pucker off with a jet of piss.");
					if (canGain) addToItem("Pastel Ring", 1);
					if (data.hasCock || data.hasBoth) {
						append("\n\n\"Wanna take the other end, keep him steady...?\"");
						addChoice("Why, sure. I've always wanted to spitroast a baby.", sewerExplore.bind("goatbabyfuck"));
					} else { 
						append("\n\n\"That's it, sweetie,\" the goat says, working his head up the infant's ass, using his own steaming piss as lube. He reaches down and lifts the fucklet up with a single hand on his chest, letting him slide easily down to the base of his cock; with a little splurt that natural Fuckmeat lube leaks out, tinted "+(isActive("Candy Ring")?"icy white":"beige with a thick helping of sewage")+", rolling in rivulets over the goat's nuts as he pounds the little "+(isActive("Candy Ring")?"fuckdump":"shitsack")+" silly over the course of an hour before getting tired and simply tossing him back in again with the rest of the worthless waste~");
					}
				}
				data.fishReady = false;
				data.fishCookin = false;
				if (data.gotBait)
					addChoice("I've got some more bait for ya.", sewerExplore.bind("goatbait"));
				//Fish is not ready!
			} else {
				if (data.prevTime == -1) {
					clear();
					append("\n\nHis uncut cock droops half-hard at six inches above them, jiggling whenever\nhis wrist bumps it. The goat pulls his fingers from his matted nutwool and gives them\na hard sniff, spreading his legs a little.\n\n\"Hullo,\" he says, and scratches his nuts."+(data.knownAsPlayer>0?"":" \"Heard a lot about ya. What'sit like bein the\nfirst player in half a century? Must get invited to a lot of parties, cool kid.\"")+"\n\nA wave of goat musk washes over you.");
					data.fishCookin = false;
					data.fishReady = false;
					data.prevTime = 0;
					var s:MintSprite = addSprite("assets/img/effect/fishergoat.png");
						s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: AeriaQuies", "");
						s.x = 350;
						s.y = 14;
				}
				if (!data.shitFishDone)
					addChoice("What are you aiming to catch in "+(isActive("Candy Ring")?"waters like these? Candyfish?":"a sewer? Shitfish?")+"", sewerExplore.bind("shitfish"));
				addChoice("Anything biting?", sewerExplore.bind("anything biting"));
				addChoice("I've got some bait for ya.", sewerExplore.bind("goatbait"), {enabled: data.gotBait && !data.fishCookin});
			}

			addChoice("Got any hints??? I'm stuck.", sewerExplore.bind("goatHelp"), {kinks: ["Plot"]});
			addChoice("Look around.", sewerExplore.bind("main"));
			if (!data.ivandisDone || data.campTripIntro) {
				addChoice("Move along.", JunkCity.junkCityHub);
			} else {
				addChoice("Move along.", sewerExplore.bind("camptrip1"));
			}
		}

		if (seg == "goatHelp") {
			if (data.metLana < 1) {
				append("\"You ever met a little nerd fox called Lana? Think he's at the L.L.L., up on street level.\"");
			} else if (!data.libraryJohnIntro) {
				append("\"There's a dog that hangs out at the L.L.L. Real stiff guy. Go warm him up, will ya?\"");
			} else if (!data.johnLanaJCDone) {
				append("\"Last I heard, John and Lana were getting ready to leave the city. You should see em off. Just wander around, I'm sure you'll bump into each other.\"");
			} else if (!data.johnLanaVMDone) {
				append("\"Ayeah... John and Lana are up on the big purple fuck that squashed my hometown, now. Big meteorite. Center of the map. Can't miss it.\"");
			} else if (!data.glowbunnyDone) {
				append("\"I think John and Lana are in the forest, huntin some glowing bitch. Go lend a paw. Er. A hand, I guess. Weird fuckin player model...\"");
			} else if (!data.glowbunnyLLLStarted) {
				append("\"You hear about the L.L.L.? Shit's going down... welp. They had it comin for a while.\"");
			} else if (!getJournalEntries().contains("GlowbunnyApothecary")) {
				append("\"Heard they finally got their glowbitch ready for testing at the Apothecary. That'd be a sight to see. I think you gotta have some cred to get in, though, like a job... ha. Fuck that busywork shit. I'm just gonna fish all day every day. That's all I need to keep myself sane.\"");
			} else if (!getJournalEntries().contains("mareiTour")) {
				append("\"Heard Marei is waiting for ya at the Apothecary. Don't know what that's about, but it's probably important...\"");
			} else if (!data.sepBrokeIn)  {
				append("\"Oooo. Got that special green card now, do ya? Go show it to Septrica. Sure she'll be thrilled.\"");
			} else if (!data.gryphonStarted) {
				append("\"Hey— this is totally left field, but you haven't met a certain gryphon up on the meteorite yet, have you? Man. Such an interesting scent, around the crotch. Would be a lot hotter if it smelled musky, though.\"");
			} else if (data.sepBrokeIn && !data.cyanWeddingStarted) {
				append("\"Hear there's gonna be a wedding up near a cave on the meteorite. Not like I was fuckin invited or anything... too stinky, I guess...\"");
			} else if (getItem("Privacy Ring").amount < 1 && getItem("Cipher Key").amount < 1) {
				append("\"You're friends with some winged folks, right? Ever go up to the moon? I hear if you sit up there for a moment, just listening to the wind whistle... I hear you'll get a nice little gift... ehehehehe! You have no fuckin clue what I'm talkin about, do ya! The iceberg is huge, bud, and this is just a tip...\"");
			} else if (getItem("Privacy Ring").amount < 1 && getItem("Cipher Key").amount > 0) {
				append("He yawns and stretches, smacking his lips.\n\n\"Man, I'm getting tired. You know I've been sitting here for eight years now? Fuck. My ass feels like it's gonna fall off. Well. I'll get up and go for a walk in a bit. If you need more advice about anything, I dunno what to really even tell ya, except that... certain things are just too hard to figure out without a little help from technology, yeah? If you feel like you're bumblin around, trying to dig deeper, but there's just this bigass wall of cryptic shit in your way, well... the only thing I can say is you should really look into getting some fuckin cheats. Hahahah! There's a certain little recipie for a cheat or two at the Som Shop, I think. There's a primo hint. Super clear and literal. But uh— I bet that recipie is probably drenched in cryptic shit itself... maybe you better start putting your noggin to use.\"");
			} else {
				append("He stares at you. \"What? You want a hint? Fuck, I don't know... there's a lot of things you coulda missed. Just go back and retrace your steps. With that special little book, or out around in real life. It's up to you, now. I'm done.\"");
			}

			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatbabyfuck") {
			append("You get in position at the other end, slapping your cock onto the Fuckmeat's head. You pull his "+(isActive("Candy Ring")?"cream":"shit")+"-coated face into your nuts, enjoying the weak vibrational purr between them.\n\n \"That's it, sweetie,\" the goat says, working his head up the infant's ass using his own steaming piss as lube. \"That's it... snort the nice "+pickByGender("man", "woman", "player")+"'s nutgrease before "+pickByGender("he rapes", "she rapes", "they rape")+" your throat in...\" The goat slaps a palm down on the back of the infant's head, grinding that cute face into your nutsack.\n\nHe reaches down and lifts the fucklet up with a single hand on his chest, letting him slide easily down to the base of his cock; with a tiny <!i>sploop<!i> that natural Fuckmeat lube leaks out, tinted "+(isActive("Candy Ring")?"icy white":"beige with a thick helping of sewage")+", rolling in rivulets over the goat's nuts as he pounds the little "+(isActive("Candy Ring")?"fuckdump":"shitsack")+" silly.\n\nHe jams two fingers past the boy's lips and yanks his mouth wide for you. With gracious thanks you line your cock up and slowly push the head inside, keeping the same steady pressure no matter what; his lips stretch, his tongue flattens, his throat opens easily... You grope your cock through his ridiculously bulged esophagus, every twitch and squirm of his tiny body shooting tingles down to your base, where his lips lock and slobber, not to mention those wonderful spastic clenches whenever he gags on your dick. Between his smooth inner thighs, both coated and dripping with "+(isActive("Candy Ring")?"cream":"shit")+", his babydick is so hard it's nearly quivering, a tiny pearl of pre a-jiggling on the tip~");

			addChoice("Synchronized thrusts.", sewerExplore.bind("sync"));
			addChoice("Alternating thrusts.", sewerExplore.bind("alt"));
		}

		if (seg == "sync") {
			append("Together, with synchronized thrusts, your cockheads meeting and grinding inside his little belly, you double-rape the goat's catch until "+(isActive("Candy Ring")?"ice cream":"puke")+" splurts from his little button nose and he just straight-up dies; suffocation by cock, heart attack (you deduce from the feel of the final spasms which drive you both to cum), and probably some sort of disease all playing their part.\n\nThe goat dusts off his hands, unplugs his cock with a little <!i>schloooooop<!i> and tosses the used-up cumrag back in with the rest of the worthless waste~");

			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "alt") {
			append("Together, with alternated thrusts, pushing the babyslut's creamy "+(isActive("Candy Ring")?"icy":"sewage")+" filling back and forth inside his little stomach, you double-rape the goat's catch until "+(isActive("Candy Ring")?"more dessert":"puke")+" splurts from his little button nose and he just straight-up dies; suffocation by cock, heart attack (you deduce from the feel of the final spasms which drive you both to cum), and probably some sort of "+(isActive("Candy Ring")?"sugar overdose":"disease")+" all playing their part.\n\nThe goat dusts off his hands, unplugs his cock with a little <!i>schloooooop<!i> and tosses the used-up cumrag back in with the rest of the worthless waste~");

			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "shitfish") {
			data.shitFishDone = true;

			append("\"SHHHH!\"\n\nThe goat casts a dark, paranoid glance further than any line. He mutters, hunched into himself: \"Well, just legend... still... make a man tremble... eight thousand pounds... tore the leg off a fishergoat just like myself, hip-bone and all... "+(isActive("Candy Ring")?"<!i>candy corn teeth<!i>":"<!i>chunky corn teeth<!i>")+"...\"\n\n\"The "+(isActive("Candy Ring")?"Candy":"Shit")+"fish?\" He straightens up. \"No... No, I wouldn't aim to catch her.\"");
			addChoice("I was joking.", sewerExplore.bind("talk goat"));
			addChoice("My god... a "+(isActive("Candy Ring")?"sweet behemoth":"fecal leviathan")+"...", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatbait") {
			append("\"Oh? And what's that?\"");

			data.glowberryBait = false;
			data.glowberryWineBait = false;
			data.glowberryPieBait = false;
			data.sweetgrassLeafBait = false;
			data.pastelRingBait = false;
			data.cumBalloonBait = false;
			addChoice("", sewerExplore.bind("goatglowberry"), {cost: ["Glowberry", 3]});
			addChoice("", sewerExplore.bind("goatsweetgrassleaf"), {cost: ["Sweetgrass Leaf", 3]});
			addChoice("", sewerExplore.bind("goatcumballoon"), {cost: ["Cum Balloon", 1], kinks: ["Raunch"]});
			addChoice("", sewerExplore.bind("goatglowberrywine"), {cost: ["Glowberry Wine", 1], kinks: ["Cub", "Female"]});
			addChoice("", sewerExplore.bind("goatglowberrypie"), {cost: ["Glowberry Pie", 1], kinks: ["Cub", "Male", "Raunch", "Scat", "Vomit"]});
			addChoice("", sewerExplore.bind("goatpastelring"), {cost: ["Pastel Ring", 1], kinks: ["Baby", "Male", "Raunch", "Scat", "Piss", "Blood", "Abuse", "Snuff"]});
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatglowberry") {
			append("The fishergoat spears all three single-file on the hook. \"Won't catch much,\" he warns you. \"Only enginetic fish bite with glowberries. They're mostly off on the coastline. Hell of a trek upstream...\"\n\nHe shifts his weight on the milk crate and says come back later.");

			data.glowberryBait = true;
			data.fishCookin = true;
			data.prevTime = getTimer();
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatsweetgrassleaf") {
			append("\"What are we tryna catch, here? Otters?\"\n\nHe shakes his head and folds the leaves up before poking the hook through them.");

			data.sweetgrassLeafBait = true;
			data.fishCookin = true;
			data.prevTime = getTimer();
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatcumballoon") {
			append("You slip a warm Cum Balloon from your inventory, shiny rubber bulging to fit through the strangely vaginal portal to your inventory menu.\n\n\"Uh,\" he says.\n\nYou sit the balloon's ass firm on the bulbous hook.\n\nIt pops.\n\nHe jams a cummy thumb in his mouth and squints at you, sucking. \"... You comin onto me?\"");

			addChoice("Just glazing the bagel, if you know what I mean.", sewerExplore.bind("goatvore"));
			addChoice("Okay, now you coat me with cum.", sewerExplore.bind("goatcumcoat"), {kinks: ["Hyper"]});
			addChoice("... Sorry, no...", sewerExplore.bind("goatreject"));
		}

		if (seg == "goatvore") {
			append("\"I'm not into vore,\" he says past his thumb.");
			addChoice("Didn't mean that... I was just daydreaming about a certain curvy, tasty ring of sorts...", sewerExplore.bind("goatrim"));
			addChoice("Okay sorry I do actually have some bait for you.", sewerExplore.bind("goatbait"));
		}

		if (seg == "goatrim") {
			append("He spins and kneels on the milk crate, peeling an asscheek off to the side and staring at you with his slightly open pucker. The other hand cranks at the ol dingus so hard that "+(isActive("Candy Ring")?"big clumps of skittles":"lumps of shit")+" dislodge from the inner folds of both rippling cheeks.\n\nHe grabs the back of your head and starts wiping his ass with your face, blasting a couple "+(isActive("Candy Ring")?"skittle":"shit")+"-sneezes up your nostrils.\n\n\"Open.\"\n\nObediently you open your mouth and slobber up and down his buttcrack, "+(isActive("Candy Ring")?"candy-coating":"caked ass-slime")+" smearing off as your saliva dampens it. The goat lays you down and reverse-cowgirls your skull, riding the tip of your nose like a cock, "+(isActive("Candy Ring")?"rainbow":"brown")+" cheeks clapping against your red ones. By the time he's done cumming "+(isActive("Mood Ring")?"his golden-brown, graham-cracker-flavored sauce ":"")+"all over himself only a thin "+(isActive("Candy Ring")?"multicolored":"beige")+" film remains on his ass and your face.");

			addChoice("Mmmmm~", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatcumcoat") {
			append("He sets his pole down nice and gentle on the grimy ground and pulls a squeeze from base to tip. A gush of pre slops from the slit, flowing much thicker and faster than any normal wang's would.\n\n\"But do you really mean 'coat'... fair warning, I'm a goddamn faucet.\"");

			addChoice("Okay maybe not on me. But I do wanna make you cum.", sewerExplore.bind("goatmakecum"), {kinks: ["Raunch", "Raunch", "Raunch"]});
			addChoice("Bathe me in it motherfucker.", sewerExplore.bind("goatcumbath"), {kinks: ["Raunch"]});
			addChoice("I'm just messing with you. Here's the real bait.", sewerExplore.bind("goatbait"));
		}

		if (seg == "goatmakecum") {
			append("He jacks lazily, ego and cock throbbing huge. \"I turn ya on that much, do I...\"\n\n"+(isActive("Candy Ring")?"White":"Yellow")+" cumglobs schlick between his fingers. Ultra-casually he slips an arm behind his head, exposing a "+(isActive("Candy Ring")?"sweet":"dank")+"-wooled pit.");

			addChoice("Can I suck your pit?", sewerExplore.bind("goatpits"));
			addChoice("Can I suck your butt?", sewerExplore.bind("goatrim"), {kinks: ["Scat"]});
			addChoice("Just teasing. I do actually have bait.", sewerExplore.bind("goatbait"));
		}

		if (seg == "goatpits") {
			append("Without a word he claps his hand around the back of your neck and pulls your face into his pit, "+(isActive("Candy Ring")?"frosted":"musky")+" curls of wool popping up your nostrils.\n\n\"Snort,\" he says.\n\nObediently you pull in two lungfuls of searing air, globs of "+(isActive("Candy Ring")?"sugardust":"grease")+" catching in your sinuses— then, before he can command it, you open your mouth and start making out with his armpit. You worm your tongue into that Dark Forest, untying "+(isActive("Candy Ring")?"sugary":"sweaty")+" woolknots. The goat groans, brings his arm down against the back of your head, and starts grinding his 'cep against the back of your skull, rocking your mouth back and forth on his pit in time with each spurt of "+(isActive("Mood Ring")?getMood("Boars"):"")+"cum over his chest and face.\n\nHe waits until his musk has almost suffocated you before finally pulling off, wool now hung and shiny with slobberglobs.\n\nHe cleans his fingers off down your throat.");

			addChoice("Hahhhh... hahhhhhhhhhhhh...", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatcumbath") {
			if (data.hasBoobs) temp.boobs = "both breasts, massaging the pungent goop into them";
			else temp.boobs = "your flat chest, white globs dripping from your nip tips";

			append("In a blink your nose gets jammed between his sweaty nuts, sackskin plugging up your startled gasp.\n\nHot pre saturates the crown of your hair and spills down over your neck. He bleats deep and rumbly, grabbing his nuts and smearing you with shiny, salty cocksnot lipstick. You feel the first orgasmic spasms of his shaft against your forehead.\n\nAn inch-thick stream of cum overpowers the pre trickle, slopping down over your forehead, eyes... you drag gropes over "+temp.boobs+". The goat pulls your nose from his nuts and recalibrates his aim, blasting both nostrils and forcing you to gasp past a shifting mouthful of jizz for at least fifteen minutes.\n\nFinally he shakes off the last few dribbles over your exposed neck, murmurs thanks, and gets right back to fishing.");

			addChoice("Hahhh... hahhhh... hrrrrrrrguurrrglhhh...", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatreject") {
			append("\"All the same,\" he says.");
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatglowberrywine") {
			append("The goat stares at the full bottle of wine you're handing him. \"What?\"\n\nWith a couple wiggles he sinks the hook into the bottle's cork, then jerks the line a couple times. The cork holds.\n\n\"You're the boss...\" he says, tossing the bottle over the railing with a resigned look.");

			data.glowberryWineBait = true;
			data.fishCookin = true;
			data.prevTime = getTimer();
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatglowberrypie") {
			append("The goat stares agape as you whip an entire pie out from the intangible depths of your inventory, still hot. \"Forgot you could do that,\" he said.\n\nTogether you eat most of it. He tells you a war story about a cow with a tranquilizer gattling gun.\n\nThen he scoops up the last crusty chunk, pinching it between two fingers and squishing out a little glowy filling, impales it on the hook, and says come back later.");

			data.glowberryPieBait = true;
			data.fishCookin = true;
			data.prevTime = getTimer();
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "goatpastelring") {
			append("\"What's this now?\"\n\nThe goat takes the colorful little ring in two fingers, turning it over. He even gives it a sniff. \"Mmmmf... I'd know that smell anywhere. That there's DISTILLED 100% PURE FREE RANGE TODDLER COCKSWEAT. This little number's been on more than a finger or two...\"\n\nHe slips it onto his hook (not without another good sniff) and tells you to come back later.");

			data.pastelRingBait = true;
			data.fishCookin = true;
			data.prevTime = getTimer();
			addChoice("Back.", sewerExplore.bind("talk goat"));
		}

		if (seg == "anything biting") {
			if (!data.anythingBitingAsked) {
				append("\"Fraid not. Water's too calm tonight... pretty piece of bait just up and drops into their secluded neck 'o the canal... they're suspicious. Even the catfish is watching her whiskers.\"\n\nHe leans back and scratches behind a floppy ear. \"Oh, but they'll bite. Not every day they get a visitor.\"");
				addChoice("Cryptic.", sewerExplore.bind("talk goat"));
			} else {
				append("\"You sound like a broken record, bud.\"");
				addChoice("Just making conversation, jeez.", sewerExplore.bind("talk goat"));
			}

			data.anythingBitingAsked = true;
			
		}

		if (seg == "camptrip1") {
			//addExplorable(118, "Violet Meteorite", VioletMeteorite.violetMeteoriteExplore.bind("ExploreKemp"), 20, 1);
			
			if (data.metKemp == 0) {
				temp.kemp = "An otter";
				temp.kemp2 = "Name's Kemp,";
			} else if (data.metKemp == 1) {
				temp.kemp = "Kemp the otter";
				temp.kemp2 = "Boys, look who it is!";
			} else {
				temp.kemp = "Kemp";
				temp.kemp2 = "Yo!";
			}
			data.campTripIntro = true;
			unlockJournal("Skunk cub camping trip");
			data.metKemp++;

			append("You untangle yourself from the twisting burbs and start the long walk back to the surface road. \"Moving along\" really is a slog. You're suddenly thankful that you always get to timeskip through it.\n\nTo speed things up you hold your thumb out and walk backwards. Cars whizz by: a green limosine, a rabbit in a punch buggy...\n\nFinally, a dirt-splattered truck with dope fire decals pulls up along the sidewalk. Three familiar faces peer from the back: Snagg the croc, that sphynx cat with a Pastel Ring earring— and "+data.ivandisName+", sandwiched between them, freshly roused from unconsciousness and whimpering with renewed vigor.\n\nThe driver's side window rolls down. "+temp.kemp+" tips his beanie with two fingers and pinches a sweetgrass cigarette between two more.\n\n\""+temp.kemp2+"\" he says, flabbergasted. \"Down to hang out with a couple boys round the fire, "+data.playerName+"? Roast some fuckin 'mallows? Tell a couple stories? Help us rape this filthy STD-infected skunk~?\"\n\n"+data.ivandisName+" whimpers harder.");

			addChoice(
				"Sure thing bud!",
				sewerExplore.bind("camptrip2"),
				{kinks: ["Patreon Commission", "Cub", "Male", "Male", "Male", "Male", "Feral", "Raunch", "Scat", "Vomit", "Piss", "Blood", "Drugs", "Abuse"]}
			);
			addChoice("I'm good, thanks. You go have fun.", JunkCity.junkCityHub);
		}

		if (seg == "camptrip2") {
			if (data.metCage == 0) {
				temp.cage = "A bull in the passenger seat";
				temp.cage2 = "The bull stares elsewhere.\n\nKemp leans in. \"He's a bit shy around new people...\"\n\n\"Fuck off, Kemp.\"";
				temp.c = "Hop in the back.";
			} else if (data.metCage == 1) {
				temp.cage = "Over in the passenger seat, Cage the bull";
				temp.cage2 = "\"I'm not fuckin surly.\"";
				temp.c = "Oh, I've met him~";
			} else {
				temp.cage = "Over in the passenger seat, Cage";
				temp.cage2 = "\"I'm not fuckin surly.\"";
				temp.c = "Oh, I've met him~";
			}

			append("Kemp cheers, ripping his beanie off and twirling it around on a fingertip. "+temp.cage+" flinches out of the way.\n\nThe otter's all hyped up. \"Fuck yeah camping!!! Hop in the back! We'll be there in three choices or so! Oh, and if you haven't met him, this surly bull over here is Cage.\"\n\n"+temp.cage2);

			data.metCage++;
			data.justListened = false;
			addChoice(temp.c, sewerExplore.bind("camptrip3"));
		}

		if (seg == "camptrip3") {
			if (isActive("Candy Ring")) {
				temp.c = "cake";
				temp.c2 = "confectionery";
			} else {
				temp.c = "shit";
				temp.c2 = "buttslime";
			}

			if (isActive("Pastel Ring")) {
				temp.p = "N-nine";
				temp.p2 = "cub";
			} else {
				temp.p = "Th-Thirteen";
				temp.p2 = "teen";
			}

			append("You swing halfway over the side of the truckbed. The croc hauls you up by your shoulders, then flops back down onto two rolled-up tents with a greasy belch and fishes a beer from the cooler."+(data.snaggAbuse >= 2?"\n\n\"Hi again, fuckpig. Miss me?\"":"")+"\n\nKemp floors it.\n\nAcross from you the cat sits with his dick lodged deep up "+data.ivandisName+"'s ass, cooing a soft interrogation into the little skunk's ear while he nibbles it:\n\n\"How old are you again?\"\n\n\""+temp.p+"...\"\n\n\"And how's my dick feel, little "+temp.p2+"~?\"\n\n\"Good!\" he squeaks obediently, and "+temp.c+" splutters from his ass right on cue, rolling shiny and thick over the cat's nuts.\n\n\"Really?! Even with my barbs tearing your cunt up?\"\n\n\"Mhm! Mhm!\"\n\n\"You promiiiise~?\" he teases, dragging his spiky cock out sssssssssssllllllooooooooooooooowwwwwwwwwwww after each thrust.\n\n\"Yes! Yes! I promise!\"\n\nThe cat accelerates to brutal jackhammery, pulling squirts of blood and "+temp.c2+" from the poor cub's ass. "+data.ivandisName+" screams and slams his thighs shut reflexively, only to have them pulled open again by Snagg, the croc, who chugs the rest of his beer and throws the can out into the canal with his free hand.\n\nWith a burst of fresh air the truck hits the surface. Moonlight washes over the skunk's face, making his tears glitter as he sobs and spasms with pain against the sphynx's chest.\n\nThe cat pecks his cheek. \"You promise this feels good?... Liar~\"");

			addChoice("Next.", sewerExplore.bind("camptrip4rape"));
			addChoice("Listen to Kemp and Cage.", sewerExplore.bind("camptrip4listen"));
		}

		if (seg == "camptrip4rape") {
			
			if (data.boarPrompted) {
				temp.std = "MAKES ME SHIT AND PISS";
				temp.std2 = "giraffe";
				temp.std3 = "'s insides turn to cum";
			} else {
				temp.std = "TURNS ME TO CUM INSIDE";
				temp.std2 = "boar";
				temp.std3 = " shit and piss himself uncontrollably";
			}

			if (isActive("Candy Ring")) {
				temp.c = "sugary";
			} else {
				temp.c = "shitty";
			}

			append("The interrogation continues while "+(data.metMarei>0?"Marei":"the sphynx cat")+" rapes "+data.ivandisName+" stupid:\n\n\"Tell me what you deserve, cunt.\"\n\n\"R-Rayyyy! R-Rayyyyyy!!!\"\n\n\"You can do it...\"\n\n\"R...R-RAPE!\"\n\n\"That's right~!\" he coos, twiddling the skunklet's shrinking cock as reward. Snagg cracks a crocodile grin and pinches "+data.ivandisName+"'s entire tiny nutsack between his thumb and forefinger, squeezing, watching the soft fur sink down around his fingertips. Then he crushes it.\n\n"+data.ivandisName+" screams and pulls his hips back, which of course only gapes his "+temp.c+" ass even wider on catcock. When Snagg finally lets go of them his nuts are bright red and swollen, quivering with the rest of his little body.\n\n\"Are you dirty?\"\n\n\"Yes! Yes!\"\n\n\"How dirty?\"\n\nThe skunk just groans. Snagg slaps him into an answer.\n\n\"Ah! Very! Very dirty!\"\n\n\"Be specific,\" the sphynx demands.\n\n\"I got... I got infected...\"\n\n\"With what?\"\n\n\"STDs...\"\n\nAnother slap, this time with Snagg's greasy cock, hard enough to leave a cute red mark across the skunk's anguished face. \"Marei told ya to be fuckin specific.\"\n\n\"AH! I DUNNO! I don't remember the names!\"\n\n\"Symptoms, then.\"\n\n\"I— ah... please... please just stop for a seco—\"\n\nAnother cockslap cuts him off. Marei only thrusts deep enough to cover the sharpest barbs of his cock, working them hard and relentless over the boy's ring.\n\n\"ONE—\" "+data.ivandisName+" screams, then blabbers on: \"ONE MAKES MY COCK SHRINK— AND, AND THE OTHER "+temp.std+"—\"\n\n\"And the last?\" Marei grunts, his nuts banging up against the skunk's already tiny cock.\n\n\"Ohgodpleasejust I DUNNO! I DUNNO!\"\n\n\"Who was it? The "+temp.std2+"?\" Snagg strokes his cock inches from the skunk's face, fat globs of expired yellow pre dribbling out over his pretty eyelashes.\n\nMarei grins. \"Yeah.\"\n\n\"Heh. They told me when they contracted it... basically, their strain's gonna make the kid"+temp.std3+".\"\n\nMarei grits his fangs and cums, running his hands over "+data.ivandisName+"'s smooth chest, over his little throat... \"Wow... you really <!i>are<!i> dirty~!\"");

			data.metMarei++;

			addChoice("Next.", sewerExplore.bind("camptrip5rape"));
			addChoice("Listen to Kemp and Cage.", sewerExplore.bind("camptrip5listen"));
		}

		if (seg == "camptrip4listen") {
			append("You rest your arms on the sill of the truck's back window and your chin on top of those.\n\nKemp's a careful driver, but he has trouble keeping the wheel straight. He's always drifting left or right, then overcorrecting jerkily.\n\nCage is stone-still with a permanent >:| face, seatbelt way tighter than needed, digging into his muscled chest. His knuckles are white on the holy-shit handle.\n\nKemp looks over, concerned. \"You gotta relax, bud... we're barely going sixty...\"\n\nCage moves only his eyes. \"I am relaxed.\"\n\n\"No, you're lookin at me like I'm about to drive us halfway off the road.\"\n\n\"You are. Every five seconds.\"\n\n\"Well, fuck,\" Kemp grunts, taking a fat drag on his cig. He leaves it at that.\n\nCage narrows his eyes. \"You've been loopy ever since you started smoking that shit.\"\n\nKemp laughs, shifts gears. \"And you've been a backseat driver since impact. Crack a beer or somethin. Loopy's the way to be!\"\n\n\"Not when you're trying to drive it isn't.\"");
			addChoice("Back to the back.", sewerExplore.bind("camptrip4rape"));
		}

		if (seg == "camptrip5rape") {
			if (isActive("Candy Ring")) {
				temp.c = "cream";
				temp.c2 = "chunks of cummy cake";
				temp.c3 = "pink frosting";
				temp.c4 = "frosting";
			} else {
				temp.c = "shit";
				temp.c2 = "viscous globs of cumshit";
				temp.c3 = "brown puke";
				temp.c4 = "tummysludge";
			}

			append("The cat closes his eyes, giving his cumsock a sleepy nuzzle, riding the afterglow as warm white trickles between "+data.ivandisName+"'s cheeks...\n\nThen he locks up and his eyes go wide.\n\n\"Marei,\" the croc sighs, snapping his fingers in front of the cat's face. \"Yo. You out?\"\n\nNo response.\n\n\"C'mere.\" Snagg pulls "+data.ivandisName+" off that catcock with a <!i>pop<!i>, Marei's barbs drawing one last squeak as they rip from his "+temp.c+"-dribbling hole.\n\n\"Wh... what happened to him?\"\n\n\"An accident. Long time ago.\" A little morose, Snagg peels "+data.ivandisName+"'s filthy asscheeks open, spits on his ruined hole, pulls him closer... \"Sometimes that kitty just bugs the fuck out. Don't worry about it.\"\n\nSnagg throws the skunk down onto his hands and knees and grabs him by the hair, threading his cock between the kid's asscheeks, smearing "+temp.c2+" up and down his little crack. \"What you <!i>should<!i> worry about is how you're gonna take this dick and stay conscious.\"\n\nKemp pulls to a stop at the City's border control booth. "+data.ivandisName+"'s panicked, cock-beaten face now stares out at a line of pedestrians; a couple in the line for folks leaving Junk City burst into shameless laughter, pointing at his cute tear-tracks, his drool stains. Most just smile and stroke themselves, happy to have some cub rape entertainment during the wait.\n\nThe line for people coming from Bright Forest have mixed reactions. Some hyenas follow suit and laugh, one running up to spit on the skunk's face and mouth, but the majority either blush and look away or stare disapprovingly at Snagg as he lines his cockhead up to the skunk's hole and twists his hair-grip tighter.\n\nAn old lamb granny hobbles up after the hyenas have their fun. She places a gentle palm on his cheek. \"Are you okay, dear?\"\n\n"+data.ivandisName+" inhales sharp as Snagg's massive cock slips inside him, bulging his belly out fat and ejecting a gush of thick "+temp.c3+" from his maw. Yet, still, he moans and shivers, and his tiny package stirs to full mast.\n\n\"Oh my!\" Lambgranny gasps. \"You... you really know how to take a dick, sonny...\"\n\n\"I'm okay,\" the skunk gurgles through a throatful of "+temp.c4+".\n\nThe truck rolls through towards the forest.");

			data.knownMareiGlitch = true;
			addChoice("Next.", sewerExplore.bind("camptrip6rape"));
			addChoice("Listen to Kemp and Cage.", sewerExplore.bind("camptrip6listen"));
		}

		if (seg == "camptrip5listen") {
			append("Kemp pulls the truck to a wheezing stop at the City's border control booth. A sour owl peers through the window.\n\n\"Where you folks going tonight?\"\n\n\"Just gonna head out and roast up some fuckin 'mallows, boys night at the campsite, feels right, y'know, just a couple guys and their cocksock—\"\n\n\"Which <!i>area<!i>, sir?\"\n\nKemp blinks. \"Oh. Uh. Bright Forest.\"\n\n\"Got a cub in the back there...\"\n\n\"Shit yeah we do, bud... he's a filthy little fucker too, just got infected with—\"\n\n\"Don't need to hear it.\"\n\nThe owl punches something into his computer. \"Lotta folks have been trying to smuggle Fuckmeat out recently. These 'bush parties,' I'm sure you've heard... only those with the thickest pubes get invitations.\"\n\nHe peers over the rim of his little window, checking Kemp's furry ottercrotch. Kemp clears his throat.\n\n\"Now,\" the owl goes on, \"he doesn't look too young to me... but we can't let that <!i>sort of thing<!i> catch on in the B.F. again, you understand... got any ID, sir?\"\n\n\"Well, uh—\" Kemp pats his naked thighs. \"I haven't... worn pants, for a while...\"\n\nThe owl 180's his neck and slams a thumb down on the Enter key. \"Right. I'm gonna need you to step out of the vehicle.\"\n\nKemp flashes a weak, shattered smile. \"What? But... the mallows... feels right...\"\n\nCage's arm shoots out. He's shoving a sharp, sparkly-purple Septricard in the guard's face.\n\nThe owl blinks. \"Oh. You're one of Septrica's...?\"\n\n\"Not an associate. Just an old friend.\"\n\nHis feathers ruffle and his neck un-twists. He spams backspace and stares at the floor.\n\n\"Right. Yes. Sorry. Go on through. Please, sirs, enjoy your— um— your mallows. I'm extremely sorry for the delay. Please send Septrica my best regar—\"\n\n\"Go fuck yourself,\" Cage grunts.\n\nKemp grins like crazy and snuffs his cig in the ashtray, gripping the wheel steady with both hands and driving as smooth as he can through the gate.");

			addChoice("Next.", sewerExplore.bind("camptrip6listen"));
			addChoice("Back to the back.", sewerExplore.bind("camptrip6rape"));
		}

		if (seg == "camptrip6rape") {
			if (data.knownMareiGlitch) {
				temp.marei = "";
			} else {
				data.knownMareiGlitch = true;
				temp.marei = "Marei, the cat, sits slumped against the side of the truckbed, his eyes wide and his muscles tense.\n\n\"Glitched out,\" Snagg explains morosely, noticing your confusion. \"Happens to him sometimes.\"\n\n";
			}

			if (isActive("Candy Ring")) {
				temp.c = "frosting";
			} else {
				temp.c = "diarrhea";
			}

			append(data.ivandisName+" is a complete mess by the end of his second assraping. His hole is a constant "+temp.c+" waterfall, his face stuck in permanent ahegao— if you watch close you can see his cock and nuts shrink another eigth of an inch under the STD cocktail's onslaught, his tiny urethra gushing with a constant piss stream.\n\nSnagg finishes up and pulls out without ceremony, tossing the limp, cum-drunk skunkling to you. "+data.ivandisName+" lands face-down on your naked crotch and promptly burps up a goopy throatful all over you.\n\n"+temp.marei+"The croc cracks a beer, glancing over. \"You just gonna let him spew filth all over you? Punish the little fucker.\" He scoots over and swirls his beer under the cat's nose, gently stroking that slick, cum-coated catcock.\n\n\"Got a fresh beer for ya... come on... come back, bud... you're missin all the fun...\"\n\nNo response.\n\n"+data.ivandisName+" regains some loose idea of his surroundings and looks up at you, gurgling out a few apologies from his cummy maw.");

			setLocation("Bright Forest");
			data.justListened = false;
			addChoice("Fingerfuck his throat.", sewerExplore.bind("camptrip6finger"));
			addChoice("Gutpunch him.", sewerExplore.bind("camptrip6punch"));
			if (data.hasCock || data.hasBoth) {
				addChoice(
					"Go for sloppy thirds, hold his face out over the side of the truck, and use his mouth to catch bugs.",
					sewerExplore.bind("camptrip6bugs"),
					{kinks: ["Raunch", "Raunch", "Raunch"]}
				);
			}
		}

		if (seg == "camptrip6finger") {
			if (isActive("Candy Ring")) {
				temp.c = "cake and frosting";
				temp.c2 = "slice of cake";
				temp.c3 = "pink triangle";
				temp.c4 = "glittery pink frosting";
				temp.c5 = "colorful, cummy batter painting its insides";
			} else {
				temp.c = "pungent shitpuke";
				temp.c2 = "log of cubshit";
				temp.c3 = "brown cylinder";
				temp.c4 = "chunky brown shitpuke";
				temp.c5 = "rancid soup of shit, puke, cum, and little curly strands of pitfur";
			}

			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("You take the "+temp.p+"-year-old gently by his slippery chin, tilting it up and forcing him to look you in the eyes.\n\n\"Sorrysorrysorrysorry—URP—sorrysorry,\" the apologies flow, interrupted only by the occasional cumburp. Pathetically he starts sucking and slurping his mess from your palm, opening his little maw in the process. First mistake.\n\nWhile his lips form the perfect O of a \"sorry\" you cram three digits deep past them, digging into his warm, cum-slick throatmeat. "+data.ivandisName+" lets his eyes roll back, grabbing your wrist with both too-small cub hands. Second mistake. With his pits now exposed, you seize the moment and unplug your cumstained fingers, dragging them along his soft, matted skunkfur, then slamming them back down his maw.\n\nThick bursts of "+temp.c4+" erupt around your fingers, splashing over your palm, down his chin, rolling in globs over his skinny, pubescent little chest. You only drive your fingers harder down his throat, smearing his tongue to ensure he gets a good taste of his own rank sweat. Once you're finished you pull his maw open and spit in it, adding your saliva to the "+temp.c5+".\n\n\"Th-thank you...\" he gurgles, and dives to your crotch to suck up all his spilled mess.");

			addChoice("Next.", sewerExplore.bind("camptrip7"));
			addChoice("You're welcome, "+data.ivandisName+".", sewerExplore.bind("camptrip7"));
		}

		if (seg == "camptrip6punch") {
			temp.g = pickByGenitals("cock, chunks of it sliding over your nuts", "cunt, chunks of it sliding between your lips", "cock, chunks of it sliding over your nuts, your cunt,");

			if (isActive("Candy Ring")) {
				temp.c = "cake and frosting";
				temp.c2 = "slice of cake";
				temp.c3 = "pink triangle";
			} else {
				temp.c = "pungent shitpuke";
				temp.c2 = "log of cubshit";
				temp.c3 = "log";
			}

			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("You haul the "+temp.p+"-year-old fuckskunk upright by his sweaty little pits and drive your fist into his bloated belly, forcing a rush of "+temp.c+" from both ends. Snagg's cock really discombobulated his insides; the poor fucklet starts gagging and glrrrking disgustingly as his esophagus bulges up bottom-to-top and the tip of a full, intact "+temp.c2+" peeks out past his uvula, snakes over his tongue...\n\nTwitching, eyes watering, "+data.ivandisName+" lets the fat "+temp.c3+" part his girly lips and schlorp out onto your "+temp.g+" and coalescing at the top of your asscrack.\n\nThe skunkling clutches his bruised stomach. His grimace lowers to your crotch. Reluctantly he starts the long process of re-eating his filth. \"Th-Thank you...\"");

			addChoice("Next.", sewerExplore.bind("camptrip7"));
			addChoice("Good punching bag~", sewerExplore.bind("camptrip7"));
		}

		if (seg == "camptrip6bugs") {
			if (isActive("Candy Ring")) {
				temp.c = "sugar-slick";
			} else {
				temp.c = "slimy";
			}

			append("You shove "+data.ivandisName+"'s face over the side of the truck. A couple low branches slap him back to reality.\n\nWithout needing to be told he opens his mouth, lips flip-flappin around in the rushing forest air. You barely even have to aim your cock; pushing forward anywhere along his "+temp.c+" crack naturally guides you down to the pucker. Super handy.\n\nWithin seconds the first gnat cloud spatters against his face, getting bugjuice in his eyes, up his nose. He closes his mouth with disgust.\n\nSnagg gives up on waking Marei and spots round two up ahead— a cloud of cyan fireflies. He jumps in quick to help out, slipping a finger up each nostril and more past the kid's lips, then, yanking in opposite directions, Snagg forces his maw open just in time.\n\nWith a whimper "+data.ivandisName+" takes at least twenty fireflies in the face, a couple exploding at the back of his throat, making him cough and gag with spine-twisting disgust. You choose this moment to slam your cock up his ass and rearrange his queasy stomach, which only makes him gag even harder. Snagg grins and runs his fingers over the skunk's face, smearing cyan insect guts around, pushing fingerfuls of it up his cute button nose.");

			addChoice("Next.", sewerExplore.bind("camptrip7"));
			addChoice("Good boy.", sewerExplore.bind("camptrip7"));
		}

		if (seg == "camptrip6listen") {
			append("The truck lurches onto a rough mountain road. A pair of fuzzy pink dice with pawprints for pips jiggle-jangle crazily from Kemp's rear-view mirror. Cage keeps flinching away from them every time they threaten to bop his forehead.\n\n\"Why'd you only pack two tents?\" Cage asks.\n\n\"One for you, one for Snagg and Marei. I'm probably gonna wander off and sleep in a barn or some shit.\"\n\n\"What's the point of camping if you don't have enough self control to <!i>stay at the camp<!i>?\"\n\n\"Shut up,\" Kemp says. \"I gotta concentrate. This piece of road is chunky salsa.\"");

			setLocation("Bright Forest");
			data.justListened = true;
			addChoice("Next.", sewerExplore.bind("camptrip7"));
			addChoice("Back to the back.", sewerExplore.bind("camptrip6rape"));
		}

		if (seg == "camptrip7") {
			if (data.bfcampClean) {
				temp.camp = "the campsite you cleaned up earlier.\n\n\"Oh yeah— guys, it's the most mystical shit ever,\" he says, whipping the driver's side door shut with his fat ottertail and throwing crossed arms over the side of the truckbed. \"Last time I camped here with some boys from B-75 we went for a float down the river, gone <!i>ten minutes<!i>, came back, and some fuckin janitor bro hit this camp and tidied er up til she fuckin sparkled! Can you believe that shit!?\"";
				addChoice("That was me. :3", sewerExplore.bind("camptrip8janitor"));
			} else {
				temp.camp = "a filthy campsite. Beer bottles, an old cooler, and a couple filled condoms lay strewn in the mud. A few tents were even left pitched.\n\nCage slams the passenger side door shut. \"The fucks all this?\"\n\n\"Ah, well...\" Kemp scratches behind his head. \"Might've left a bit of a mess last time...\"\n\nCage forces his mouth to stay shut, stooping to pick up one bottle after another, repelling Kemp with a glare when he sheepishly offers to help.";
				addChoice("Here.", sewerExplore.bind("camptrip8garbo"), {cost: ["Garbage Bag", 1]});
			}

			append("Kemp pulls the truck to a halt up beside "+temp.camp+"");

			data.cageDefensive = true;
			addChoice("Help "+data.ivandisName+" down.", sewerExplore.bind("camptrip8helpdown"));
		}

		if (seg == "camptrip8helpdown") {
			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("You wrap both arms around "+data.ivandisName+"'s chest and lift him from the truck, setting his soft-furred toes down in mud.\n\n\"I'll take it from here.\"\n\nSnagg slams the "+temp.p+"-year-old's face to the muck and sits on the back of his skull, panicked mudbubbles popping just underneath his scaly crocodile nuts. The rest of the cub's body flails pointlessly, feet kicking long ruts in the goop, fingers scrabbling at Snagg's hips as they rock back and forth happily.\n\n\"I'll be a bit,\" he says, reaching back to casually fingerfuck his muddy little ass cushion.");

			addChoice("Gotcha.", sewerExplore.bind("camptrip9"));
		}

		if (seg == "camptrip8janitor") {
			append("Kemp freaks out over that. \"No way! Seriously?! I heard players love to take the initiative, but damn, you didn't have to go and do all that...\"\n\nCage's hand comes down on your back with a firm <!i>clap<!i>, nearly sending you into the mud. His voice is quiet, rough:\n\n\"Good shit.\"");

			data.knownAsPlayer++;
			data.cageDefensive = false;
			addChoice("No problem.", sewerExplore.bind("camptrip9"));
			addChoice("Don't make me say it again: I'm a cleaner.", sewerExplore.bind("camptrip8cleaner"));
		}

		if (seg == "camptrip8cleaner") {
			append("\"What?\"");
			addChoice("Nevermind.", sewerExplore.bind("camptrip9"));
		}

		if (seg == "camptrip8garbo") {
			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("You push a garbage bag into Cage's hand, not caring if he accepts the help or not, and get to cleaning up camp. You pull the cooler from the mud and start wiping it off with a couple leaves— then Snagg hops from the truckbed, carrying "+data.ivandisName+" by the throat, and helps out with a toothy smile by wiping the kid's disgusted expression all over the cooler, digging around inside for a couple empty bottles and cleaning those off by twisting them down his little esophagus.\n\nKemp runs to the truck and back, hauling mallow pokers, extra tents, kindling. He's too embarassed to help clean up, you guess.");

			data.cageDefensive = false;
			addChoice("Next.", sewerExplore.bind("camptrip9"));
		}

		if (seg == "camptrip9") {
			append("Tents rise. Kemp drops to his knees and blows hard and the fire sputters up in smoke. Cage cracks his knuckles and unloads two full beer coolers. Snagg mostly sits around.\n\n\"Hey,\" Kemp says, flopping into a lawnchair once the fire's purring nicely. \"Where's Marei?\"\n\n\"He's out.\" Snagg hauls his ass off his little skunk chair, wiping mud-chunks from his blue face.\n\nThe cat's slumped motionless in the back of the truck, staring past the stars.\n\n\"Ah.\" Kemp shakes his head and spears a mallow.");

			var s:MintSprite = addSprite("assets/img/effect/mallow.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Vaniller", "\"Roasty fuckin toasty, boys.\" — Kemp Lamblea");
				s.x = 675;
				s.y = 343;

			addChoice("Sit around the fire.", sewerExplore.bind("camptrip10"));
			addChoice("Go poke the cat.", sewerExplore.bind("camptrip9poke"));
		}

		if (seg == "camptrip9poke") {
			append("You slip away from the roaring fire and climb into the back of the truck. You prod Marei's now-limp catcock, your fingertip coming away smeared with chilly "+(isActive("Mood Ring")?getMood("Marei"):"")+"cum. A single bead of drool stretches down from his slack mouth.\n\nNo response.");

			addChoice("Helloooo~?", sewerExplore.bind("camptrip9noresp"));
			addChoice("You alive?", sewerExplore.bind("camptrip9alive"));
			if (data.knownMareiGlitch) {
				addChoice("I hope your glitch ends soon.", sewerExplore.bind("camptrip9noresp"));
				addChoice("Turn him on and off again.", sewerExplore.bind("camptrip9kill"), {kinks: ["Snuff"]});
			}
		}

		if (seg == "camptrip9noresp") {
			append("No response.");
			addChoice("Go back to the fire I guess.", sewerExplore.bind("camptrip10"));
		}

		if (seg == "camptrip9alive") {
			append("His eyes are open and his breathing slow.");
			addChoice("Go back to the fire I guess.", sewerExplore.bind("camptrip10"));
		}

		if (seg == "camptrip9kill") {
			append("You wrap your hands gently around his throat and squeeze. The biggest reaction you get is a few involuntary suffocation gurgles.\n\nHe respawns a few moments later, halfway buried in the treeline, just as catatonic as he was before.");

			addChoice("Go back to the fire I guess.", sewerExplore.bind("camptrip10"));
		}

		if (seg == "camptrip10") {
			if (data.hasBoobs) temp.boobs = " and tits" else temp.boobs = "";
			temp.g = pickByGenitals("half-hard cock", "snatch", "half-hard cock");

			if (isActive("Candy Ring")) {
				temp.c = "";
				temp.c2 = "";
				temp.c3 = "";
				temp.c4 = "";
			} else {
				temp.c = "";
				temp.c2 = "";
				temp.c3 = "";
				temp.c4 = "";
			}

			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("You drag a "+data.myntColour+" lawnchair up to the firepit and stretch out, letting your "+temp.g+temp.boobs+" hang out plain for the boys to ogle. Snagg and Kemp both take a healthy gander, fitting mallows to their roasting sticks a little too hard— but Cage has eyes only for "+data.ivandisName+", who's presently shuffling around the campsite with a dazed, muddy expression.\n\nCage sweeps him up with a forearm the size of his little thigh and growls something low into his ear. You surmise it's probably a threat, or a demand, or some lurid description of what his tiny ass is about to endure, because "+data.ivandisName+" shudders and struggles super-cutely, involuntarily grinding his cheeks up and down that fat slab of bullcock.\n\n\"Pass him over here,\" Snagg says, patting his lap.\n\nCage narrows his eyes, slipping his massive cock up over the cub's tummy, gauging the imminent internal damage. \"No.\"\n\n\"Come on...\"\n\n\"You had him the whole trip.\" Cage says, muffled as he bites "+data.ivandisName+"'s ear. \"You're greedy.\"\n\nSnagg polishes off his beer and goes for another one. \"Untrue.\"\n\n\"You run a fucking bank.\"\n\n\"Alright, sort of true.\" Snagg nurses the bottle, pouting a little. \"Still—\"\n\nKemp chimes in diplomatic: \"Tellyawat! Let's spin a couple spooky yarns round the fire, why dont we? Whoever has the skunk, that's whose turn it is.\"");

			addChoice("Listen to Cage's story.", sewerExplore.bind("camptrip11cage"));
		}

		if (seg == "camptrip11cage") {
			if (isActive("Candy Ring")) {
				temp.c = "snotty";
			} else {
				temp.c = "sugary";
			}

			if (isActive("Pastel Ring")) {
				temp.p = "nine";
			} else {
				temp.p = "ten";
			}

			append("\"Fuck fiction.\"\n\nCage yanks a few droopy mallows from Snagg's roasting stick purely out of spite and crams them down the skunk's gagging throat. The first and second slip down easily, but the third catches at the back of his maw. He starts choking on melty mallowgoop, coughing, some spluttering from his little snout. Cage just keeps packing them down, grabbing more from Snagg's stick— not easy, as the croc switches it to his beer hand to try and keep it away, spilling everywhere.\n\nOnce the poor STD-ridden skunklet's cheeks are bulging adorably and he can barely breath through a "+temp.c+" snoutful of mallowcream, Cage throws him to the dirt and starts fucking it down his tight little cocksleeve esophagus, the poor "+temp.p+"-year-old's now toddler-sized dick fwipping around and pissing constantly.\n\nSnagg masturbates reluctantly, still somewhat pissed about the mallow theft.\n\n\"To the <!i>base<!i>,\" Cage growls, nuts bruising the skunk's tender bulged neck, sacksweat smearing off on his fur. He really has to fight to fit much more cock in, but eventually, with a brutal <!i>churp<!i>, Cage fucks open the entrance to the skunk's stomach, a torrent of sugary white mallowgoop splurting out over his crotch.\n\nTo the base.\n\n\"Mmmf... seriously...\" Snagg groans, \"... gimmie a turn...\"");

			addChoice("Listen to Snagg's story.", sewerExplore.bind("camptrip11snagg"));
		}

		if (seg == "camptrip11snagg") {
			if (isActive("Candy Ring")) {
				temp.c = "cake-drippy";
				temp.c2 = "confetti and sprinkles";
			} else {
				temp.c = "shitting";
				temp.c2 = "liquid shit-sneezes";
			}

			append("Snagg pries the skunk from Cage's hands and settles that plump, constantly "+temp.c+" cubcunt up over his thigh. The poor thing can't stop gagging and farting "+temp.c2+".\n\n\"Shut the fuck up so I can tell my story,\" Snagg grunts, slapping the skunk across his face. Right on cue "+data.ivandisName+" burps up a disgusting half-digested chunk of marshmallow. He can only gurgle a noisy apology, grinding his thighs together, clutching his freshly raped throat with both hands to try and keep quiet.\n\n\"Fine, have it your way...\"\n\nSnagg grabs the back of the kid's head and buries his face in the leftmost greasy croc armpit. \"So,\" he says, leaning ominously over the fire. \"It was about six years ago... on a night just like tonight...\"");

			addChoice("Next.", sewerExplore.bind("camptrip11snagg2"));
		}

		if (seg == "camptrip11snagg2") {
			append("\"A croc, a bull, an otter, all gathered round the fire in the middle of the woods...\"\n\n(What about the skunk, Kemp whispers.)\n\n\"(Oh yeah. Easy to forget about such a worthless little fucktard.) And a skunk too, with his little snout tucked deep in the croc's greasy pit hair... his tongue wiggling out a bit...\"\n\n"+data.ivandisName+" obediently laps at the grease.\n\n\"When suddenly, a mewl speared our ear drums.\"\n\nOver in the bed of the truck, Marei's back arches to fit the curve of the moon.\n\n\"The ringle-dingle of an earring.\"\n\nSomeone missing.\n\n\"Someone missing.\"");

			addChoice("Examine the cat.", sewerExplore.bind("camptrip12examinecat"));
			addChoice("Examine vague dread.", sewerExplore.bind("camptrip12examinedread"));
			addChoice("Examine burning red afterimage of a pastel earring seared onto eyeballs.", sewerExplore.bind("camptrip12examineeyes"));
		}

		if (seg == "camptrip12examinedread") {
			append("You cannot examine an object created by a <!b>null object.<!b>");
			addChoice("Um.", sewerExplore.bind("camptrip12loop"));
		}

		if (seg == "camptrip12examinecat") {
			append("You cannot examine a <!b>null object.<!b>");
			addChoice("Um.", sewerExplore.bind("camptrip12loop"));
		}

		if (seg == "camptrip12examineeyes") {
			append("You cannot examine an object directly related to a <!b>null object.<!b>");
			addChoice("Um.", sewerExplore.bind("camptrip12loop"));
		}

		if (seg == "camptrip12loop") {
			function loopPassages() {
				disablePause();
				clearChoices();
				data.loopIteration++;

				if (data.loopIteration == 0) {
					addChoice("???", sewerExplore.bind("camptrip12loop"));
				} else if (data.loopIteration <= 10) {
					for (i in 1...3) {
						temp.c = pickOne(["Resume story.", "Try again.", "Next.", "Continue story.", "Exit.", "Undo.", "Stop.", "Quit.", "Cancel.", "!help", "end", "Restart.", "Keep going.", "/help", "Skip.", "/retry", "Ignore.", "Disable null objects.", "Save & Exit.", "Back.", "Move along."]);
						addChoice(temp.c, sewerExplore.bind("camptrip12loop"));
					}
				} else if (data.loopIteration <= 25) {
					for (i in 1...5) {
						temp.c = pickOne(["Hello?", "Open manual.", "May I speak to Mynt please?", "Next. x4", "Next. x100",  "Examine cat please.", "Apply changes.", "Where is the cat?", "What is happening?", "[SPAMMING SPACEBAR]", "[CLICKING ALL OVER THE SCREEN]", "?????", "2spooky", "Find cat.", "Mynt!!!", "[ESC+ESC+ESC+ESC+ESC+ESC+ESC+ESC+ESC]", "[BACKSPACE]", "[CTRL+Z]", "[F12]", "[F5]", "Hide.", "Please escape from cat.", "Get away from cat.", "Examine exits.", "Freak out.", "Oh god oh god oh god", "HEELLLPPPP", "[ALT+F4]", "[CTRL+SHIFT+ESC]", "Is this where I die.", "Respawn.", "End the madness.", "Game is literally unplayable.", "Why.", "Kemp the cat is stealing your truck ???", "Leave now.", "Exit right now.", "Run into the forest."]);
						addChoice(temp.c, sewerExplore.bind("camptrip12loop"));
					}
				} else {
					for (i in 1...8) {
						temp.c = pickOne(["Next!!!!! x100",  "Examine cat please!", "Where is the cat?!", "Why???", "[SLAMMING SPACE]", "[CLICKING ALL OVER THE SCREEN]", "?????", "2SPOOKY4ME", "Avoid cat!", "Mynt help!!!", "[ESC+ESC+ESC+ESC+ESC+ESC+ESC+ESC+ESC]", "[CTRL+ALT+Z]", "[F12]", "Run.", "Escape cat.", "Get away from cat!!", "Examine exits???", "Start freaking out.", "Oh god oh god oh god", "HEELLLPPPP", "[ALT+F4]", "[CTRL+SHIFT+ESC]", "I CAN HEAR THE MEOWS THROUGH MY HEADPHONES", "WHERE??????", "STOP THIS", "FUUUUCK", "GASLIKREOIHJERKGJERKLGJTHWSLJKWOIUHU", "I MUST PROTECT THE SKUNK", "AWugughugh", "The cat is behind me!! I can smell it!!"]);
						append("\n\n<!b>QUEUED ACTIONS:<!b> "+data.loopIteration);
						addChoice(temp.c, sewerExplore.bind("camptrip12loop"));
					}
				}

				if (data.loopIteration == 55) {
					data.knownMareiGlitch = true;
					sewerExplore("camptrip12loopbreak");
					return;
				}
			}

			if (data.loopIteration == 0) {
				append("Unable to interpret reality.\n\n");
			} else if (data.loopIteration == 1) {
				msg("Object 'MINT' is forcing interpretation.");
				append("The truck radio turns on.\n\n\"Marei's girly cover started blaring over the radio... and then, shivering alone in the darkness of the forest, the campers realized <!i>they were all so fuckin lazy no one would get up to turn it off.<!i>\"\n\n");
				playSound("assets/audio/music/deathless", "deathless");
			} else if (data.loopIteration <= 9) {
				append("Unable to interpret text.\n");
			} else if (data.loopIteration <= 10) {
				msg("OBJECT 'MINT' IS NOT SAFE.");
				append("Unable to interpret text.\n");
			} else if (data.loopIteration <= 35) {
				append("Unable.\n");
			} else if (data.loopIteration <= 36) {
				msg("'MINT' IS PREVENTING RESTORE POINT CREATION.");
				append("Unable.\n");
			} else if (data.loopIteration <= 45) {
				append("Restoring surroundings...");
			}

			loopPassages();
		}

		if (seg == "camptrip12loopbreak") {
			enablePause();
			msg("'MINT' quarantined. Restore point created and interpreted.");
			append("The truck radio turns off.");

			stopChannel("deathless");
			cameraFadeOut(0x000000, 0.1);
			timer(0.07, function() {cameraFadeIn(0x000000, 0.1);});
			timer(0.2, function() {cameraFadeOut(0x000000, 0.1);});
			timer(0.3, function() {cameraFadeIn(0x000000, 0.1);});
			timer(0.4, function() {cameraFadeOut(0x000000, 0.1);});
			timer(0.6, function() {cameraFadeIn(0x000000, 5);});
			addChoice("What in the fuck just happened?", sewerExplore.bind("camptrip13"));
		}

		if (seg == "camptrip13") {
			append("Snagg ignores your interruption.\n\nYou turn back to the fire, still hearing the distant ringle-dingle of an earring.\n\n\"They knew right away it was the cat,\" he goes on. \"The cat was missing.\"");

			stopChannel("deathless");
			addChoice("Stop its too spooky.", sewerExplore.bind("camptrip14stop"));
			addChoice("...", sewerExplore.bind("camptrip14"));
		}

		if (seg == "camptrip14stop") {
			append("\"What, are you actually pussing out?\"");

			addChoice("... no...", sewerExplore.bind("camptrip14"));
			addChoice("Listen to Kemp's story.", sewerExplore.bind("camptrip18kemp"));
		}

		if (seg == "camptrip14") {
			append("\"What were these guys's names?\" Kemp asks, dumbfounded.\n\n\"What were— they're us, dude.\"\n\n\"Oh. But you left out "+data.playerName+". You said a croc, a bull, an otter, a skunk with his little snout tucked deep in the croc's greasy—\"\n\nSnagg sighs, the kid's snout slipping a little deeper into his pit as his chest deflates. \"Okay, yes, and "+data.playerName+".\"\n\n\"Get back to the story bruh,\" Kemp says, smiling around the mouth of his bottle.");

			addChoice("Why is no one concerned.", sewerExplore.bind("camptrip15cat"));
		}

		if (seg == "camptrip15cat") {
			var gender = pickByGender("his", "her", "their");
			append("\"And no one was concerned because ever since the shipwreck it was a totally normal and unremarkable thing for that cat to glitch out, mess with electronics, and then disappear for a while,\" Snagg goes on, deaf to you.\n\n\"They were all huddled listening to the greasy croc drone on, to the crackle of the fire, the residual hum of the radio left detuned... the real scary shit went down later that night. Yep, later that night... the cat came back to camp, gravity so fuckin glitched up their toes barely touched the ground... the only thing anyone heard was the light rustle of leaves. Of course that's just a normal forest sound, so "+data.playerName+" didn't see it coming when a set of claws slowly started to rip through "+gender+" tent...\"");

			addChoice("Why do this to me.", sewerExplore.bind("camptrip18kemp"));
		}

		if (seg == "camptrip17") {
			//Intentionally skipped 16
			append("\"Then it was Kemp's turn.\"");
			addChoice("Goddamnit.", sewerExplore.bind("camptrip18kemp"));
		}

		if (seg == "camptrip18kemp") {
			append("Snagg unpeels the skunk's face from his armpit and tosses him over to Kemp.\n\nKemp catches him by his nuts and throat, then promptly plugs a full beer past his lips and upends it. "+data.ivandisName+" chugs like a good little alcoholic, eyes watering from the sour burn.\n\nOnce he's finished sucking every last morsel of moisture from the rim Kemp shoves the bottle fat-end first up his cute little trash can of a butt. "+data.ivandisName+" squeaks and pisses himself even harder than his constant blasting stream, ring clenching tight around its neck. With an otterish slip Kemp kisses him, softly, letting the kid deepthroat his tongue.\n\n\"Using Marei like that is cheating,\" Kemp says, eyeing Snagg. \"I can't get that spooky effect without a glitched cat handy. So whatever. I'm gonna tell ya what my buddy's buddy told me sixty-seven days ago walkin through the forest baked as fuck.\"");

			addChoice("What happened?", sewerExplore.bind("camptrip18kemp2"));
		}

		if (seg == "camptrip18kemp2") {
			append("After a squishy slurpy make-out break he goes on:\n\n\"Buddy was strollin,\" he says, catching his breath. \"Strollin, and he comes across no fuckin other than Archbishop.\"\n\n\"Who's Archbishop?\" "+data.ivandisName+" murmurs into the otter's mouth.\n\nKemp grabs the neck of the empty beer bottle and starts furiously fucking his little ass with it. \"Don't interrupt.\"\n\n\"AH! AH! SORRY!\"\n\n\"Archbishop looks his way. So buddy hunkers down behind a bush and waits.\"\n\n...\n\n\"And waits more, even.\"\n\nCage stares intently at his charred mallow. \"Get on with it.\"\n\n\"Well, the big goon's just standing there, staring. Buddy's gotta move eventually. So he starts sidling away, real chill, not touching anything... and that's when the fuckin <!i>Grassy Ghoul<!i> came to life in old Archie, <!i>roarin<!i> hungry, fuckin chased buddy down til he was waddlin on ankle stubs, halfway cross the island, starved for days in the chase, this mossy Ghoul just chargin through the brush <!i>right<!i> on buddy's bloody heels, rippin fungi from the tree trunks and scarfin it down, you know, the Ghoul's a cyan maniac—\"\n\n\"What the fuck are you talking about?\"\n\n\"— six fuckin ways from Sunday and a bag of potato chips he <!i>ran,<!i>\" Kemp rambles, pumping the beer bottle into "+data.ivandisName+"'s hole as punctuation.");

			if (data.metKemp == 0) temp.c = "Otter";
			if (data.metKemp >= 1) temp.c = "Kemp";
			addChoice(temp.c+" pls.", sewerExplore.bind("camptrip18kemp3"));
			if (data.roxVisits >= 2) addChoice("I've seen this guy.", sewerExplore.bind("camptrip18archie"), {kinks: ["Plot"]})
			else addChoice("I've seen this guy.", sewerExplore.bind("camptrip18archie"), {kinks: ["Plot"], enabled: false});
			addChoice("Six fuckin ways from Sunday???", sewerExplore.bind("camptrip18kemp3"));
		}

		if (seg == "camptrip18archie") {
			append("\"Yeah?\"");

			function cowResp(choice:String) {
				clear();
				if (choice == "lady") {
					append("\"The <!i>lady,<!i> huh?\" Cage grunts.");
					temp.c = "Yeah her.";
				}

				if (choice == "rox") {
					append("\"She's a regular at the bank,\" Snagg says, plucking spilled mallowcream from his belly.");
					temp.c = "She helped me inside.";
				}

				if (choice == "futa") {
					append("\"She's got a cock?!\" Kemp says, suddenly enthralled.\n\nSnagg pretends to be completely focused on his mallow, which has now become a roasty-toasty molten mess quivering with surface tension on the tip of his stick.");
					temp.c = "Oh yeah she does buddy.";
				}

				if (choice == "cow") {
					append("All the anthropomorphic animals seem a little uncomfortable.");
					temp.c = "... Sorry?... Anyway.";
				}

				addChoice(temp.c, sewerExplore.bind("camptrip18archie2"));
			}

			addChoice("I was with the farm cow lady.", cowResp.bind('lady'));
			addChoice("I was with Roxelle.", cowResp.bind('rox'));
			addChoice("I was with the cow futa.", cowResp.bind('futa'));
			addChoice("I was with the cow.", cowResp.bind('cow'));
		}

		if (seg == "camptrip18archie2") {
			append("...");
			addChoice("He broke into her basement.", sewerExplore.bind("camptrip18archie3"));
		}

		if (seg == "camptrip18archie3") {
			append("...!");

			addChoice("His eyes were so bright.", sewerExplore.bind("camptrip18archie4"));
			addChoice("He was ravenous.", sewerExplore.bind("camptrip18archie4"));
			addChoice("I hate that guy.", sewerExplore.bind("camptrip18archie4"));
			addChoice("Who was he?", sewerExplore.bind("camptrip18archiewho"));
		}

		if (seg == "camptrip18archie4") {
			append("\"So, anyway,\" Kemp says, as if you hadn't interrupted his story...");
			addChoice("Oop.", sewerExplore.bind("camptrip18kemp3"));
		}

		if (seg == "camptrip18archiewho") {
			append("Kemp shrugs. \"Probably whoever owned your computer sixty years back. I kept to my farm. Never met him.\"");
			addChoice("This computer was a first-anniversary gift.", sewerExplore.bind("camptrip18archiegift"));
			addChoice("This is the shelter's library computer. My mom donated it when she left.", sewerExplore.bind("camptrip18archiemom"));
		}

		if (seg == "camptrip18archiegift") {
			append("\"Wonder if the game was pre-installed.\"\n\nKemp goes :3c with an otterpaw.");
			addChoice("Anyway, continue with your story.", sewerExplore.bind("camptrip18kemp3"));
		}

		if (seg == "camptrip18archiemom") {
			append("\"From what I heard he sure fuckin sounded like a librarian.\"");
			addChoice("Anyway, continue with your story.", sewerExplore.bind("camptrip18kemp3"));
		}

		if (seg == "camptrip18kemp3") {
			append("\"And at the end,\" Kemp ploughs on, shaking his head. \"... the way buddy's buddy told it, the Grassy Ghoul caught up and ate him inside out.\"\n\n...\n\n\"... he respawned two trees over with PTSD...\"\n\nKemp passes you "+data.ivandisName+", who promptly quivers as the bottle jostles out from his loose, destroyed ass. It plops into the mud.");

			addChoice("Are you both challenging me to tell a weird and cryptic story?", sewerExplore.bind("camptrip19story"));
			addChoice("Hug "+data.ivandisName+".", sewerExplore.bind("camptrip19hug"), {kinks: ["Scat"]});
		}

		if (seg == "camptrip19story") {
			append("Kemp whispers to Cage: \"Was my story that bad?\"\n\nCage shakes his head.");

			addChoice("It was a hot, stormy night... (Kiss his neck.)", function() {data.campStory = 'night'; sewerExplore('camptrip19night'); }, {kinks: ["Plot"]});
			addChoice("It was a cold, sunny day... (Wrap my hands around his neck.)", function() {data.campStory = 'day'; sewerExplore('camptrip19day'); }, {kinks: ["Plot", "Abuse"]});
			addChoice("It was a lukewarm, overcast afternoon, and I don't have much to say about it, so this is my entire story the end. (Next)", function() {data.campStory = 'skipped'; sewerExplore('camptrip20'); });
		}

		if (seg == "camptrip19hug") {
			if (isActive("Candy Ring")) {
				temp.c = "rocky road ice cream";
			} else {
				temp.c = "skunkshit";
			}

			append("You wrap your arms around "+data.ivandisName+"'s belly and hug him so hard "+temp.c+" splatters all over your lap.");

			addChoice("It was a hot, stormy night... (Kiss his neck.)", function() {data.campStory = 'night'; sewerExplore('camptrip19night'); }, {kinks: ["Plot"]});
			addChoice("It was a cold, sunny day... (Wrap my hands around his neck.)", function() {data.campStory = 'day'; sewerExplore('camptrip19day'); }, {kinks: ["Plot", "Abuse"]});
			addChoice("It was a lukewarm, overcast afternoon, and I don't have much to say about it, so this is my entire story the end. (Next)", function() {data.campStory = 'skipped'; sewerExplore('camptrip20'); });
		}

		if (seg == "camptrip19night") {
			append("You slobber down "+data.ivandisName+"'s nape, dropping beads of saliva between his shoulder blades.");
			addChoice("I heard wings in the molten rain. (Suck his neck.)", sewerExplore.bind("camptrip19wingbeats"));
			addChoice("My parents had both left. (Bite his neck.)", sewerExplore.bind("camptrip19bite"), {kinks: ["Blood"]});
		}

		if (seg == "camptrip19wingbeats") {
			append("You suck at his scruff with such gusto it pushes him almost off your lap. His ruined skunkbutt plops down onto the lawnchair, three little fingers sneaking up over his taint and slipping easily inside.");

			addChoice("When suddenly—", sewerExplore.bind("camptrip19suddenly"));
		}

		if (seg == "camptrip19bite") {
			append("Your jaws bear down on almost half of the skunk's little neck, drawing a couple globules of blood and a spurt from his cock.");
			addChoice("When suddenly—", sewerExplore.bind("camptrip19suddenly"));
		}

		if (seg == "camptrip19day") {
			append("You do it gently, letting him get used to it. He squeaks, scrabbling a little for show, writhing his hips. The boys ogle.\n\nHe whispers to you:\n\n\"I want to sleep in your tent...\"");

			temp.g = pickByGenitals("fuck", "", "fuck");
			addChoice("My dad was preaching. (Throttle"+temp.g+" him.)", sewerExplore.bind("camptrip19throttle"));
			addChoice("My mom was coding. (Grope his throat til he pukes.)", sewerExplore.bind("camptrip19puke"), {kinks: ["Scat", "Vomit"]});
		}

		if (seg == "camptrip19throttle") {
			if (isActive("Candy Ring")) {
				temp.c = "mint-flavored ice cream";
			} else {
				temp.c = "grassy brown sludge";
			}

			if (data.hasBoobs) temp.boobs = "tits" else temp.boobs = "chest";

			temp.fuck = pickByGenitals("You slip your cock easily up his gaped hole, dislodging a blast of "+temp.c+", and throttlefuck the shit outta him.\n\n", "", "You slip your cock easily up his gaped hole, dislodging a blast of "+temp.c+", and throttlefuck the shit outta him.\n\n");

			append(temp.fuck+"\n\nHis little body spasms hard, back bouncing against your "+temp.boobs+". Your grip tightens.");
			addChoice("When suddenly—", sewerExplore.bind("camptrip19suddenly"));
		}

		if (seg == "camptrip19puke") {
			if (isActive("Candy Ring")) {
				temp.c = "mint-flavored ice cream";
			} else {
				temp.c = "thick, cummy puke";
			}

			append("You work him like a tube of toothpaste, crushing his esophagus bottom-to-top. With a bodily spasm "+temp.c+" spills out over his chest, splattering over his tiny cock, pooling in his belly button.\n\nHe gurgle-purrs and grinds his asscheeks against you by way of thanks. You only wring his neck harder.");

			addChoice("When suddenly—", sewerExplore.bind("camptrip19suddenly"));
		}

		if (seg == "camptrip19suddenly") {
			if (data.campStory == "night") {
				append(data.ivandisName+" cranes his neck, soft fur shifting between your lips.");
				addChoice("Someone banged at the shelter door's reinforced window.", sewerExplore.bind("camptrip19ending"));
				addChoice("My dad croaked hello.", sewerExplore.bind("camptrip19ending"));
			} else {
				append(data.ivandisName+" taps out, gasping for breath.");
				addChoice("The sky turned purple.", sewerExplore.bind("camptrip19ending"));
				addChoice("Mom slapped her laptop shut.", sewerExplore.bind("camptrip19ending"));
				addChoice("Dad knocked the particle board altar over running.", sewerExplore.bind("camptrip19ending"));
			}
		}

		if (seg == "camptrip19ending") {
			if (data.campStory == "night") {
				append("The skunk's stomach twists and gurgles with fear.");
				addChoice("He was winged and smiling.", sewerExplore.bind("camptrip20"));
				addChoice("Almost ninety now.", sewerExplore.bind("camptrip20"));
				addChoice("He wanted me to come outside with him.", sewerExplore.bind("camptrip20"));
			} else {
				append("The skunk pulls long, calming breaths.");
				addChoice("The meteor came down.", sewerExplore.bind("camptrip20"));
				addChoice("People started screaming and crying.", sewerExplore.bind("camptrip20"));
				addChoice("I was five.", sewerExplore.bind("camptrip20"));
			}
		}

		if (seg == "camptrip20") {
			if (data.campStory == "skipped") {
				append("\"Can I have the skunk then?\" Cage grunts.");
				addChoice("Wanna be a good torturetoy for Cage, "+data.ivandisName+"?", sewerExplore.bind("camptrip21"));
			} else {
				if (data.campStory == "night") {
					append("Everyone is quiet.");
					addChoice("Every night after that one was cold.", sewerExplore.bind("camptrip21"));
				} else {
					append("\"J"+(data.myntJenga?"enga":"esus")+",\" Kemp says.");
					addChoice("That was the last cold day.", sewerExplore.bind("camptrip21"));
				}
			}
		}

		if (seg == "camptrip21") {
			if (data.campStory == "skipped") {
				temp.boys = "It takes the skunk a second to muster up a reply, his eyes locked on the greasy cuntwrecker lazily laid over Cage's thigh. Then:";
				temp.ivan = "Y...yes... please abuse me, I'm";
			} else {
				if (data.campStory == "night") temp.boys = "\"Sounds like a fuckin spooky night,\" Kemp says." else temp.boys = "Snagg cracks a beer. \"Sounds like a shitty one.\"";
				temp.ivan = "I liked the part about the";
			}

			append(temp.boys+"\n\n\""+temp.ivan+"—\" "+data.ivandisName+" starts, then a shiver wracks him and he's forced to clap a paw over his mouth. Thick white dribbles leak between his fingers.\n\n\"My insides...\" His eyes widen. \"... feel goopy.\"\n\nSnagg cracks a grin. \"Standard for that strain. Salivary glands are the first to start producing... then the digestive acids go creamy, then the bladder, bowels... and finally,\" he says, and whips his stick from the fire to nuzzle his perfect golden mallows over the skunk's chest— \"finally, your heart starts pumping cum, too.\"\n\n"+data.ivandisName+" hesitates, every camper watching his little neck... then obediently starts gulping down the constant flow of cum-saliva from his own glands.\n\nSnagg jams the roasting stick's prongs up his little nostrils, cleaning off charred mallowguts inside while he grimaces and sneezes. \"Now there's a good little fag. Happily chugging cum for the rest of your life~\"");

			addChoice("Next x4.", sewerExplore.bind("camptrip22"));
		}

		if (seg == "camptrip22") {
			append("Cage takes another turn torturefucking "+data.ivandisName+", and then a couple more turns, and then a couple more...\n\nKemp wanders off, a bobbing orange-lit cig among the trunks.\n\nSnagg pulls out his business phone and starts playing a pay-to-win mobile game.\n\nMarei is no longer <!b>null.<!b>");

			addChoice("Next. x8", sewerExplore.bind("camptrip23"));
		}

		if (seg == "camptrip23") {
			if (isActive("Candy Ring")) {
				temp.c = "eight-hundredth sweet dessert crammed down his throat~";
			} else {
				temp.c = "first piece of actual food he had eaten in hours~";
			}

			append("Eight moments later is quite a few.\n\nDue to a drawn-out bickering match between Cage and Snagg, three moments got disrupted and it took a little longer.\n\nYou missed a bluebird girl that soared from the night to snatch a mallow right from "+data.ivandisName+"'s mouth. It was to be the "+temp.c+"\n\nPresently the skunk tugs at your arm.\n\n\"Hey, where'd the otter go?\"");

			addChoice("I dunno. Wanna go look for him?", sewerExplore.bind("camptrip24"));
			addChoice("Next x18. (End)", sewerExplore.bind("camptrip24skip"));
		}

		if (seg == "camptrip24skip") {
			append("You regain control the next day.\n\n"+data.ivandisName+" is now a fully broken, eager little slave. He even helps take the tents down~");
			addChoice("Move along.", startHub.bind(data.currentHub));
		}

		if (seg == "camptrip24") {
			if (data.campStory == "day") {
				temp.ivan = "\"I still wanna sleep in your tent.\"";
			} else if (data.campStory == "night") {
				temp.ivan = "\"Can you do that thing to my neck again sometime~?\"";
			} else if (data.campStory == "skipped") {
				temp.ivan = "";
			}

			append("With some wrangling you manage to weasel "+data.ivandisName+" away from the rape-hungry boys and head off into the forest with him, looking for that bobbing orange light in a leafy sea of blue ones. All you have to go on is his sweetgrass smoke trail.\n\nShyly the skunk slips his little hand inside yours. You look down. He has to waddle to keep up, ass gaped way too wide to walk normally.\n\n"+temp.ivan+"");

			addChoice("Mmmm...", sewerExplore.bind("camptrip25"));
		}

		if (seg == "camptrip25") {
			setLocation("Lamblea Farm");
			append("You track the scent down to farmland. Yellow silhouettes gyrate and embrace in every country home's window.\n\nKemp pokes his head out from the stinkiest stables, grinning. \"Fuck sakes, you guys followed me way out here... can't get a moment alone. I'm glad, though, cause boy have I got a special place for your face, skunk.\"\n\n"+data.ivandisName+" looks wide-eyed from you to Kemp, then rushes inside— attempts to rush inside, that is... At the door his bare toesies catch a slippery mudsmear, sending his skull into the doorframe with a <!i>thwack.<!i>\n\nKemp stifles laughter, squatting to grind his greasy half-hard cock and nuts over the skunk's dazed expression while he has the chance. He helps the skunk to his knees, wipes his tears with a thumb. \"Cracked your dome good there. You okay kiddo?\"\n\n"+data.ivandisName+" sniffles. \"It... it hurts...\"\n\nKemp runs a few fingers over the growing lump, testing it. The skunk fights back a scream and buries his teary face in the otter's chestfur. \"Am I gonna be okay?\" he sniffles.\n\nKemp kisses him on the forehead. \"Don't worry, hun. I doubt you could possibly get more retarded~\"\n\n"+data.ivandisName+"'s tiny cock hardens.");

			addChoice("Head inside.", sewerExplore.bind("camptrip26"));
		}

		if (seg == "camptrip26") {
			if (isActive("Candy Ring")) {
				temp.c = "a crack drippy with frosting";
				temp.c2 = "sweet";

			} else {
				temp.c = "a sweaty, musky crack smeared from top to bottom with chunks of loose shit";
				temp.c2 = "slimy";
			}

			append("You head inside the stable.\n\nKemp peels back a feral bull's asscheek, revealing "+temp.c+". The beast grunts and flicks his tail, nervous around all these new folks.\n\n\"Been warming him up for ya,\" Kemp purrs, bringing the skunk's face closer and closer. He plugs two fingers up that "+temp.c2+" pucker and yanks down, opening its insides so "+data.ivandisName+" can get a proper couple lungfuls of pungent assmusk while Kemp plants a paw on the back of the kid's head and shoves half his little snout inside.\n\n\"That's it,\" he says sweetly, rocking the skunk's face gently up and down. \"Breathe...\"");

			addChoice("Examine bull pucker.", sewerExplore.bind("camptrip26sex"));
			addChoice("Why'd you wander all the way out here?", sewerExplore.bind("camptrip26talk"));
		}

		if (seg == "camptrip26sex") {
			if (isActive("Candy Ring")) {
				temp.c = "cake";
			} else {
				temp.c = "shit";
			}

			append("It's real juicy. Every time it twitches or Kemp pulls it open a little wider it swallows more of "+data.ivandisName+"'s cute "+temp.c+"-smeared face.");

			addChoice("Examine "+data.ivandisName+"'s cute "+temp.c+"-smeared face.", sewerExplore.bind("camptrip27sex"));
			addChoice("Where did that cat go, Kemp?", sewerExplore.bind("camptrip27talk"));
		}

		if (seg == "camptrip26talk") {
			append("\"Grew up on this farm,\" Kemp says simply, as if that answers your question. \"Some other people work it now. Still keep their bulls just as messy, though...\"");
			addChoice("Where did that cat go?", sewerExplore.bind("camptrip27talk"));
			addChoice("Examine "+data.ivandisName+" rimming that messy bull.",sewerExplore.bind("camptrip27sex"));
		}

		if (seg == "camptrip27talk") {
			append("Kemp grabs the back of the skunk's injured head and starts really suffocating him, two-handing his face against that sloppy donut.\n\n\"Literally nowhere,\" he says, hauling on his cig. \"Little librarian friend of mine calls it 'non-localized.' Don't worry, he'll be back by the time we wake up.\"\n\nHe pulls "+data.ivandisName+" off for two breaths of \"fresh\" stable air, which the kid sucks in gratefully. Then Kemp pinches "+data.ivandisName+"'s nose shut, closes his lips, and plugs the sweetgrass cig between them. The skunk has no choice but to get high as fuck, cheeks flushed red, tail poofed, hauling in lungful after lungful of multicolored smoke and blowing it out through his clogged nostrils.");

			addChoice("Should we head back to camp?", sewerExplore.bind("camptrip28talk"));
			addChoice("Examine skunkbutt.", sewerExplore.bind("camptrip28sex"));
		}

		if (seg == "camptrip27sex") {
			if (isActive("Candy Ring")) {
				temp.c = "cake";
			} else {
				temp.c = "shit";
			}

			append("You look the nearly-suffocated skunk in his drooping eyes, pulling both lids back with a thumb. A couple chunks of "+temp.c+" slip underneath his eyelids. He tries to blink it away, eyes watering furiously, but only ends up smearing it around his corneas.\n\nKemp pulls "+data.ivandisName+" off for two breaths of \"fresh\" stable air, which the kid sucks in desperately. Then he pinches "+data.ivandisName+"'s nose shut, closes his lips, and plugs the sweetgrass cig between them. The skunk has no choice but to get high as fuck, cheeks flushed red, tail poofed, hauling in lungful after lungful of multicolored smoke and blowing it out through his clogged nostrils.");

			addChoice("Examine skunkbutt.", sewerExplore.bind("camptrip28sex"));
			addChoice("Should we head back to camp?", sewerExplore.bind("camptrip28talk"));
		}

		if (seg == "camptrip28talk") {
			if (isActive("Candy Ring")) {
				temp.c = "pink from his frosting-clogged";
			} else {
				temp.c = "brown from his shit-clogged";
			}

			append("\"Nah. I'm sleepin here.\"\n\nKemp snuffs his cig on the stable's metal baseboards, then flicks it into a puddle far from anything flammable and flops down on a pile of hay.\n\n"+data.ivandisName+" coughs and hacks, his eyes burning red, crying "+temp.c+" tearducts.");

			addChoice("... Bedtime already?", sewerExplore.bind("camptrip29"));
		}

		if (seg == "camptrip28sex") {
			if (isActive("Candy Ring")) {
				temp.c = "constant dessert ";
				temp.c2 = "sparkles and sugar";
				temp.c3 = "caramel fudge cake";
				temp.c4 = "sugary";
			} else {
				temp.c = "shit";
				temp.c2 = "hair and shit";
				temp.c3 = "shit and mud";
				temp.c4 = "greasy";
			}

			append("Kemp shoves the kid's face right back in, even while he's still hacking and coughing. You check out that skunkbutt.\n\n"+data.ivandisName+"'s ass is sticking high in the air and wiggling as he concentrates on staying conscious, tongue snaking between the bull's sweaty assmeat, pulling out clumps of "+temp.c2+". Kemp doesn't let off even when the bull blows steam and a fat log smushes out into "+data.ivandisName+"'s open mouth, bulging out his little throat. The otter strokes himself, happily bouncing "+data.ivandisName+"'s cute disgusted grimace directly into the "+temp.c+"stream.\n\nWhen it's all done, the toiletskunk drops drunkenly to his knees in a pile of "+temp.c3+" and immediately starts scarfing down everything he spilled. What little of his eyes you can see past that cute squinty grimace is bright red.\n\n\"Little stoner~\" Kemp says sweetly... and plants a foot on the back of his head. His stinky toes wiggle into the skunk's hair as he drags it back and forth, using that cute mouth as a mop for the stable floor.\n\nOnce everything is super squeaky clean, including the bull's "+temp.c4+" asscrack, Kemp flops down on a pile of hay in the corner. He pants hard, one hand on his lower stomach.");

			addChoice("Bedtime already?", sewerExplore.bind("camptrip29"));
		}

		if (seg == "camptrip29") {
			append("\"Depends... you stayin here, skunk? Or are ya gonna head back to camp and share a sleeping bag with Cage while he uses your body as a sleeping bag for his cock~?\" Kemp asks.\n\nThe skunk flops down beside him as an answer, too baked to form words that fast. He snuggles up and opens his maw wide to reveal another cause: thick goopy strands connecting the roof of his mouth to the bottom.\n\n\"Lookid,\" he says, talking gummy. \"I'm infecded. <3\"\n\nKemp groans, slurping "+data.ivandisName+"'s white drool from the tap. \"God kid, you're so fuckin gross...\"");

			addChoice("Sandwich the skunk between us.", sewerExplore.bind("camptrip30"));
			addChoice("End.", sewerExplore.bind("camptripend"));
		}

		if (seg == "camptrip30") {
			temp.g = pickByGenitals("cock", "fingers", "cock");
			temp.g2 = pickByGenitals("your head", "their tips", "your head");

			if (isActive("Candy Ring")) {
				temp.c = "dessert";
				temp.c2 = "sparkles and sugar";
				temp.c3 = "caramel fudge cake";
				temp.c4 = "sugary";
			} else {
				temp.c = "brown";
				temp.c2 = "sweat and shit";
				temp.c3 = "shit and mud";
				temp.c4 = "greasy";
			}

			append("You lay down and align your "+temp.g+" to the skunk's little crack, smearing chunks of "+temp.c+" over "+temp.g2+". A couple grape-sized "+(isActive("Mood Ring")?getMood("Kemp"):"")+"cumglobs squirt from his pucker as he tenses and pushes his ass back against your "+temp.g+".");

			addChoice("Spitroast.", sewerExplore.bind("camptrip30spit"));
			addChoice("Why don't you go ahead and make out with our noses, cubcunt~?", sewerExplore.bind("camptrip30nose"), {kinks: ["Raunch", "Raunch", "Raunch"]});
		}

		if (seg == "camptrip30spit") {
			temp.g = pickByGenitals("cock", "palm", "cock");
			temp.g2 = pickByGenitals("every inch of your cock", "four fingers", "every inch of your cock");
			temp.g3 = pickByGenitals("nutsacks", "crotches", "nutsacks");
			temp.g4 = pickByGenitals("get your tips to meet inside his little body, grinding cocks, spewing pre all over each other~", "pop a whole fist up his little snatch and punchfuck his cummy innards brutally hard~", "get your tips to meet inside his little body, grinding cocks, spewing pre all over each other~");

			append("You slap between his cheeks with your "+temp.g+" hard enough to leave red marks. \"A roast, eh,\" Kemp says, flipping around so his greasy slab of ottercock paps "+data.ivandisName+" on the nose. The skunklet opens up. His training shines through: a tap on the nose always means \"open the lid, toilet.\"\n\nTogether, hands finding a grip on random parts of your shared skunkmeat, you drive "+temp.g2+" deep up his little ass, marvelling that this is probably like the fifty-sixth time it's been fucked in one night. While the poor fucklet thrashes and chokes and his cummy insides squish out over your "+temp.g3+", you both rape him as hard as you possibly can, as deep as you can— until finally you "+temp.g4+"\n\nYou high-five.");

			addChoice("Cum.", sewerExplore.bind("camptrip30cum"));
		}

		if (seg == "camptrip30nose") {
			if (isActive("Candy Ring")) {
				temp.c = "cake";
			} else {
				temp.c = "bullshit";
			}

			temp.g = pickByGenitals("cock", "fingers", "cock");

			append("He gulps. Nods. Opens.\n\nKemp flashes you a grin and a sniffle. \"Read my mind.\"\n\nYou both hook a couple fingers in "+data.ivandisName+"'s maw and keep it open wide, nuzzling snouts just above his cumbreath.\n\nKemp sneezes first, sending a"+(isActive("Candy Ring")?" tasty candyglob":"n icky snotglob")+" down the back of the skunk's throat. The poor thing really has to work to get that sludge down, choking when it clogs the wrong tube.\n\nYou use his tongue as kleenex, grinding your nostrils over it, and blast two green "+(isActive("Candy Ring")?"gummy-candy wads":"snotwads")+" against his sensitive taste buds. He flinches back, cringes... then, with a single look from Kemp, he flips 180 and starts eagering chugging your "+(isActive("Candy Ring")?"goopy nosecandy":"snot")+". Chunks of "+temp.c+" dangle cutely from his chin.\n\nThings reach a fever pitch when Kemp starts using the kid's tongue like a warm little sex toy to fuck his nose. At that point you both go full primal, ramming your "+temp.g+" up the skunk's ass, stifling his whorish squeaks with your mouth...");

			addChoice("Cum.", sewerExplore.bind("camptrip30cum"));
		}

		if (seg == "camptrip30cum") {
			cumEffect();
			temp.g = pickByGenitals("cock", "cunt", "cock");
			temp.g2 = pickByGenitals("even more cum up the kid's already overflowing ass", "a couple beads of pussyjuice", "even more cum up the kid's already overflowing ass");

			if (isActive("Candy Ring")) {
				temp.c = "syrup";
				temp.c2 = "blue-raspberry";
			} else {
				temp.c = "shit";
				temp.c2 = "assjuice";
			}

			append("You slam your crotch forward and cum, "+temp.g+" spewing "+temp.g2+". His butt contracts from the shock and skunk"+temp.c+" splatters out over your inner thighs, dripping down in curly patterns around your knees, ankles; one bead of "+temp.c2+" makes it all the way down to the gap between your big toe and the next over, tickling horrendously.\n\nKemp cums too, panting, diving forward to deepthroat "+data.ivandisName+" with a tongue-kiss.\n\n\"I... I love you...\" the skunk says, muffled through a throatful of "+(isActive("Mood Ring")?getMood("Kemp"):"")+"cum and ottertongue. \"I love... you both. <3\"");

			addChoice("Wind down.", sewerExplore.bind("camptrip30winddown"));
		}

		if (seg == "camptrip30winddown") {
			append("\"Aw, fuck,\" Kemp says, all blushy. He hugs the skunk, squeezing him hard enough to hurt on purpose. \"We love you too, rapetoy. G'night.\"\n\n\"Niii--ighhhi----hrrrrrrkkkk...\" "+data.ivandisName+" wheezes huskily, "+(isActive("Mood Ring")?"a colorful mixture of ":"")+"cum burbling up from his esophagus and pouring out over his chin.");

			addChoice("G'night, you two.", sewerExplore.bind("camptrip30sleep"));
		}

		if (seg == "camptrip30sleep") {
			timer(1, function() {append('\n\n'+data.ivandisName+' finally passes out, strained past his limits.');});
			timer(3, function() {append('\n\nKemp pulls his beanie rim over his eyes.');});
			timer(5, function() {append('\n\nYou snuggle up to them and fall asleep.');});
			timer(7, function() {clear(); cameraFadeOut(0x000000, 4, sewerExplore.bind("camptripend"));});
			timer(11, sewerExplore.bind("camptripend"));
		}

		if (seg == "camptripend") {
			cameraFadeIn(0x000000, 3);
			Theme.addUiChoice("stinky");

			append("You wake. Moonlight pours over the feral bull's sparkly clean asscrack.\n\n"+data.ivandisName+" is gone.\n\nYou look outside. Up in the rafters. Under the hay pile. Under Kemp's asscheeks. (Hey, uhn... little early in the morning for that...)\n\nIt's only once you stop looking and stand still that you hear the gentle slurps coming from two stalls down...\n\n"+data.ivandisName+" sits on his heels in the stable mud, sucking the sweat from a bull's nutsack. The little cub's concentrating so deeply, brow furrowed, tail raised... you just can't bring yourself to bother him.");

			addChoice("Move along.", JunkCity.junkCityHub);
		}
	}
}
