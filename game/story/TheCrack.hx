package story;

class TheCrack
{

	public static function explore(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		setLocation("The Crack");
		saveCheckpoint("TheCrack.explore('"+seg+"');");

		if (seg == "explore") {
			addPlace("The Crack", "A hot springs sitting pretty next to the gash on Violet's skull.", "Violet Meteorite");
			append("Eventually you run out of tunnels to haul your ass up. You flop exhausted onto a stone plateau at the summit of the meteorite.\n\nHere she blows, vast and steamy: a network of hot springs built off lava-runs which flume from the crack in Violet's skull.");
			addChoice("Head to the pools.", explore.bind("main"));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "main") {
			append("To your right bubbles the biggest, deepest, and pinkest spring. <!i>Nymphore,<!i> says a chiselled sign.\n\nStraight ahead sprawl beaches of crushed spacerock.\n\nTo your left towers a three-tiered spring crowned with an inflatable bouncy castle.");
			addChoice("Right.", explore.bind("right"));
			addChoice("Straight.", explore.bind("straight"), {kinks: ["Female", "Male"]});
			addChoice("Left.", explore.bind((data.springsLeftIntroDone?"lefthub":"leftintro")));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "right") {
			append("Steamclouds roll milky white over the rims of the pool, avalanching through nymph flocks. None move. When the spring finally calms and the steam passes on down the slope of the crater, they all just pick up where they left off in their conversations and wipe the residual dew from their bodies with slow, sensual gropes, as if it's the most natural way in the world to dry yourself.\n\nSomething big must be happening, because the crowds near the center of the pool are packed too tight to penetrate. And if you've learned anything in your adventures so far it's that almost nothing on this island is too tight to penetrate.\n\n"+(data.taroIntroDone?"Taro's Body Brews is just around the corner.":"You set your sights a little lower, off the side of the summit in fact: something purple gleams down there."));
			if (!data.moonUnlocked && data.hoveredMoon) addChoice("Find a nymph who can fly me to the moon.", explore.bind((data.nymphoreIntro?"moonrejoin":"moonfly")), {kinks: ["Cub", "Male"]});
			addChoice((data.taroIntroDone?"Visit Taro.":"Check out the gleam."), explore.bind("tarointro"));
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "moonfly") {
			data.nymphoreIntro = true;
			append("They've all gathered around for the birth of a new mythological creature.\n\nFrom deep within the sparkling, reverent waters of Nymphore, the Life Spring, the Well of Paraphoric Knowledge, two cute nubbly paws begin to rise. As if stretching from a berjillion year nap, a nymph cub rises out from the misty waters and breaks through the surface of the proverbial pool-womb to fix you all with a pair of seasoned, shrewd little alien eyes, and lo, from his maw pours the words:\n\n\"Hey "+data.playerName+". I'll fly ya to the moon if you pay me.\"");
			addChoice("How much?", explore.bind("moonfly2"));
			addChoice("How do you already know who I am?", explore.bind("moonfly2a"));
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "moonfly2a") {
			append("\"We know a lot of shit before we're born. For example: there's nothing on the moon.\"");
			addChoice("... So how much are you gonna charge to get me there?", explore.bind("moonfly2"));
			addChoice("Forget it, kid.", explore.bind("main"));
		}

		if (seg == "moonrejoin") {
			append("The newborn nymph boy sits like a little prince among his people. Everyone wants to sniff and lick the otherworldly flavors from his body.\n\n\"You <!i>still<!i> wanna fly up to that shithole? Fifty caps.\"");
			addChoice("Fine.", explore.bind("moonfly3"), {cost: ["Capsule", 50], kinks: ["Pregnancy"]});
			addChoice("Forget it, kid.", explore.bind("main"));
		}

		if (seg == "moonfly2") {
			append("He plops down onto the ground unceremoniously. The crowd buzzes around him and sniffs at all the fresh amniotic springwater dripping from his little pink body, his iridescent wings...\n\n\"Fifty caps.\"");
			addChoice("This is bullshit.", explore.bind("moonfly3"), {cost: ["Capsule", 50], kinks: ["Pregnancy"]});
			addChoice("Forget it, kid.", explore.bind("main"));
		}

		if (seg == "moonfly3") {
			disablePause();
			append("He grabs you by the hips, squishing his wet little cocklet against your "+pickByGenitals("nuts", "bare cunt", "nuts")+", and downs all fifty caps in a single gulp.\n\n\"Yeesssss,\" he purrs. \"I just got born and I'm alread gonna have fifty babies~!\"\n\n... He kicks off with that super duper nymph strength and takes flight. His belly grows and grows between you, until you can't even reach the rest of his body anymore. You're forced to just hang from the slippery sides of his belly bulge.\n\nHe flies slow and clumsy, like a bumble bee boi, but he does eventually make it to the moon and drop you off.");
			addChoice("Hey thanks!", BrightForest.brightForestExplore.bind("falseMoon"));
		}
		
		if (seg == "tarointro") {
			if (!data.taroIntroDone) {
				data.taroIntroDone = true;
				halfWidthText();
				unlockJournal("Taro Body Brews");
				var s:MintSprite = addSprite("assets/img/effect/taroPortrait.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Taro!", "potatocat");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-s.height-100;
				append("A gaggle of sweaty nymphs suck milkshake mustaches from each other's mouths outside a purple drink stand hanging off the rim of the summit. The only thing keeping it from tumbling off is a fuckload of rivets and a sturdy striped awning from which everything else dangles.\n\nBehind the counter lounges a purple cat. He's got a strange, rough texture to him...");
				for (it in ["Hello.", "Yo.", "Oi.", "Hey.", "Hai.", "Sup.", "Greetings.", "What's good?", "Hey bb."])
					addChoice(it, explore.bind("tarointro2"));
				if (data.genderMale) addChoice("Ey man how bigs ur dick when its hard no homo.", explore.bind("tarointrodick"));

			} else {
				explore("tarohub");
			}
		}

		if (seg == "tarointro2") {
			data.knownAsPlayer++;
			append("\"Honored to finally meet you!\" Taro says, slurping spilled cream from a finger. Up close now, you realize his entire body is made out of taro.\n\n\"The holy-shit-there's-a-new-player gossip flew up here a few hours ago,\" he purrs. \"Can I getcha anything~?\"");
			var s:MintSprite = addSprite("assets/img/effect/taroMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 150;
			s.y = 230;
			addChoice("What's a \"Body Brew?\"", explore.bind("tarointro3"));
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "tarointrodick") {
			append("\"About this big,\" Taro says, flopping his suddenly erect seven-incher out onto the counter with a <!i>schlap<!i>. Without touching it you can tell it's soft and warm, and like the rest of him it has a somewhat lumpy texture...\n\nUp close now you realize his entire body is made out of taro.\n\n\"Honored to meet you,\" the purple potato cat purrs, and slips his cock back between his legs. \"Can I getcha anything~?\"");
			var s:MintSprite = addSprite("assets/img/effect/taroMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 150;
			s.y = 230;
			addChoice("What's a \'Body Brew?\'", explore.bind("tarointro3"));
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "tarointro3") {
			append("\"Any beverage made from my body, of course! I do snacks too.\"\n\nHe blinks.\n\n\"Oh— Ah— Wait. That's a bit gruesome, isn't it? I regenerate, it's okay! Does that bother you? Sorry, I should've explained this right away...\"");
			addChoice("It's fine it's fine.", explore.bind("tarohub"), {kinks: ["Candy Gore"]});
			addChoice("Prove it.", explore.bind("tarointroexample"), {kinks: ["Candy Gore"]});
			addChoice("Bit much for me, yeah.", explore.bind("taroleave"));
		}

		if (seg == "taroleave") {
			append("\"Gotcha.\"\n\nHe turns away and takes a patient dove's order: Spring Water, stirred.");
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "tarointroexample") {
			append("\"Well...\"\n\nHe reaches down behind him and pulls up his lumpy purple tail.\n\n\"... Like this.\"\n\nHe pops the tip past the middle divot in his :3 lips and nibbles at it, making tiny wet sounds. A bead of saliva rolls down its smooth underside.\n\nAfter a moment, and a little squeak, he nibbles it clean off. The stump dribbles goopy purple 'blood' which coagulates and regenerates into fresh taro within seconds.\n\n\"Thee?\" he says, tail-tip between his teeth, meaning: \"See?\"");
			addChoice("I've seen dragons and nymphs and even a "+(data.exploreFinaleBFDone?"zombunny":"trash demon")+", but a magical regenerating potato cat?\nThat's where I draw the line.", explore.bind("tarointroexample2"));
		}

		if (seg == "tarointroexample2") {
			append("\"Haven't you noticed?\" he giggles, paw to mouth. \"Everything mythical comes from Violet.\"");
			addChoice("And that's all the explanation I'll get, huh.", explore.bind("tarointroexample3"));
		}

		if (seg == "tarointroexample3") {
			append("\"Hey, I just work here~\"\n\nTaro winks and turns, bending to rummage through a drawer over-packed with teabags, carved right out of the spacerock. His fat, shiny purple butt wiggles directly in your face. \"Can I getcha anything?\"");
			addChoice("Mmmmmmmmmmmmmm.", explore.bind("tarohub"));
		}

		if (seg == "tarohub") {
			append("You browse the brews.");
			var s:MintSprite = addSprite("assets/img/effect/taroMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 150;
			s.y = 150;
			if (!data.taroSweetDone) addChoice("Sweetgrass Tea.", explore.bind("tarosweet"), {cost: ["Capsule", 1]});
			if (!data.taroNymphDone) addChoice("Nymph Sweat.", explore.bind("taronymph"), {kinks: ["Raunch"], cost: ["Capsule", 1]});
			if (!data.taroButtDone) addChoice("Butt Cookie.", explore.bind("tarobutt"), {kinks: ["Candy Gore"], cost: ["Capsule", 1]});
			if (!data.taroMilkDone) addChoice("Milkshake.", explore.bind("taromilk"), {cost: ["Capsule", 2]});
			if (!data.taroGutDone) addChoice("Gut Slushie.", explore.bind("tarogut"), {kinks: ["Candy Gore"], cost: ["Capsule", 3]});
			if (data.taroGutDone && data.taroMilkDone && data.taroButtDone && data.taroNymphDone && data.taroSweetDone && !data.taroBabyFuckDone) {
				s.destroy();
				append("\n\n... But Taro's busy in the back, fiddling with something on his counter. His butt sways back and forth absent-mindedly.\n\nAh, he's doing his finances. The caps you gave Taro overflow his cute little kitty bank (it's porcelain, like a piggy bank) and skitter down onto the floor. \"Ohh nooo!\" he wails, squatting down and sticking out his fat potato ass in the process. Just below his hanging nuts, ten Capsules glitter. He plucks one up between his fingers and fixes you with a smirky, half-lidded grin. \"Whatever should I do with all this extra profit...?\"");
				addChoice("Stuff that cap down his maw.", explore.bind("tarobaby"), {kinks: ["Guest Writer", "Baby", "Male", "Intersex", "Pregnancy", "Raunch", "Candy Gore", "Snuff"]});
			}
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "tarobaby") {
			data.taroBabyFuckDone = true;
			msg("<!img:kink/Guest Writer.png> Guest Writer: Taro", true);
			append("You cram the cap past his squishy purple lips. He takes it (and your fingers) like a bitch, letting you push them halfway down his throat before he swallows hard.\n\n\"Ooh...\" he croons, patting his starchy belly. \"I haven't anally birthed a baby in a while~\"");
			addChoice("Keep my hands on that belly.", explore.bind("tarobaby2"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby2") {
			append("You run your fingers over his smooth, splotchy taroflesh, squeezing it, dipping a few digits in and out of his belly button... and before long it starts to swell a little. He leans back and spreads his thighs. \"Listen...\"\n\n... A distinct grumble resonates from deep inside him. His cock surges up and dents the growing balloon of his preggotummy.\n\nHe helps out with the belly rubs and presses his hands over yours, making sure they feel every inch of expansion as it grows to full size. Something's straining against his dudewomb. The hard outer shell of... an egg?\n\n\"See, I'm not <!i>really<!i> a mammal, I guess... my kind lays eggs.\" He pushes your hand in a little harder, causing the shell to dent slightly. \"And they're delicious~\"");
			addChoice("Tuck a couple fingers up his ass and yank it open.", explore.bind("tarobaby3"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby3") {
			append("You slip two fingers from each hand inside his greasy purple ring and pull in opposite directions. The taro stretches remarkably far, barely even causing him any discomfort... even when it starts to tear, and the tapered end of his first egg gets coated in slick tarojuices~\n\nTaro barely needs to push before the egg starts sliding out, rolling like a hot dog down a hallway from his gaping ass. It lands in your lap with a plop, coating your thighs with thick purple ass slime.\n\nTaro reaches down to wipe some juice off, revealing the egg's brown shell. \"See? It's chocolate~\"");
			addChoice("Wow! (Taste it~)", explore.bind("tarobaby4"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby4") {
			append("First, a lick. Some chocolate melts off and clings to your tongue. Next, you take a dainty nibble out of that creamy milk-choco shell. Taro watches amusedly as you dig in, rubbing his defalting tummy. The flavor of chocolate is greatly enhanced by the earthy-sweet taro sludge pouring from his ruined ass... you just can't help yourself!! You take two or three big bites and the inner layers of chocolate splinter away to reveal a confused little purple tarobabe Fuckmeat blinking in the moonlight.");
			addChoice("There's a toy in this chocolate egg!", explore.bind("tarobaby5"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby5") {
			append("A deviant grin cracks over Taro's face.\n\n\"Surprise~\"\n\nHe plucks up the little newborn by its scruff and urges its legs apart. A little babydick and puss glisten between them, freshly coated purple and already throbbing hard.\n\nThe Fuckmeat blinks out of sync for a moment before fixing you with a glossy, vacant stare. You can't tell if it's just tired or... not all there.");
			addChoice("Awwww. Such a dumb little half-baked tatobaby~ <3", explore.bind("tarobaby6"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby6") {
			append("Its tiny kitten ears perk up towards your voice, but its eyes go in completely opposite directions, and it can't really seem to figure out how to reach out to you or coo or gurgle or do anything normal Fuckmeat can. Instead it just pees itself (hot melted chocolate!) and drools adorably.\n\nTaro chuckles and hands it off to you. \"Yeah, these guys never come out right... not sure why. Might be the potato part.\" He watches the kitten wriggle uselessly in your arms. \"So, what're you gonna do with it?\"");
			addChoice("Open its cunt. >:3", explore.bind("tarobaby7"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby7") {
			append("You consider your options for a moment before Taro assures you: \"Please, do whatever you like. I got a kitty bank full of these, essentially. She doesn't mean anything to me~\"\n\nYou nod, and waste no time flipping the fat little tardkitten over and tearing its cunt open. It worms around cutely, showing off its starchy violet curves through accidental strechings of its legs and arms, still ignorant of how limbs work.");
			addChoice("Hmmm. Does it regenerate too? (Rip that cunt open.)", explore.bind("tarobaby8"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby8") {
			append("You tear those tiny lips open with four fingers from each hand. Its smooth little purple legs tense up and stick straight out to either side as instinct wracks its dumb brain and it makes a pitiful little warbling plea for more, spreading its pudgy thighs extra wide, as if it wasn't already getting its lower torso obliterated up the middle~");
			addChoice("Good babybitch!", explore.bind("tarobaby9"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby9") {
			append("Taro grins and watches the spectacle for a bit, but it's clear he's getting pent-up. His cock has been throbbing at max juice capacity since he got pregnant. He reaches out to grab the kitten by the chin, yanking its little maw open with one hand. \"Wanna see how durable these guys are?\"\n\nHe readies a fist and presses it to the kitten's lips... but he's waiting for your go-ahead first.");
			addChoice("Fistfuck that little throat apart, Taro.", explore.bind("tarobaby10"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby10") {
			append("You run a few fingers over that soft, delicate throat, inwardly amazed that Taro's starting with a full, clenched fist instead of a few fingers. All the same, the little tatotard has finally realized there's something in front of its crossed eyes— something big, firm, pushing down on its maw...\n\nIt mistakes Taro's fist for a cock and starts slurping noisily at it. \"Oh gosh,\" he says, curling and uncurling his fist just to hear the dainty little squish of baby saliva between his fingers. \"I really should be used to this by now, but y'know, there's something timeless about hatching your own NPC and then breaking it a few minutes later. Open wide, hun.\"\n\nHe reels back his fist and plows the little slut's throat open in one powerful jab, letting you watch as the kitten's throat bulges and tears, just for it to regenerate itself up around the fist. Now that he has a perfectly fist-sized throathole, Taro pulls back and starts fistfucking its esophagus brutally hard, punching like he hates the little babe, making it gag and gurgle happily and kick its pudgy limbs. The baby's chubby ass and gaped cunt bob invitingly with each punch, and its little tatotail waves at you like a flag.");
			addChoice("Wow, still kicking~! ("+(data.hasCunt?"Fistf":"F")+"uck it. :3)", explore.bind("tarobaby11"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby11") {
			append("You grab the little tatobitch by its tiny flailing arms and plough your "+(data.hasCunt?"fist":"dick")+" up its ruined cunt (which is slowly regenerating as you enter, making it even tighter and somehow more pleasurable, you guess since all the moving flesh is kinda like a vibrating fleshlight??)\n\nWithin a couple seconds you burst into the open warmth of its tiny underdeveloped kittenwomb, kept tight and intact by the cushion of its lungs, which are packed with air corked in there by Taro's impassable fist~\n\nThe Fuckmeat struggles hard, trapped between Taro's fist and your"+(data.hasCunt?"s":" fat adult cock")+". The double abuse slowly tears its little stomach open until it's completely irreparable. Its tissue can't regenerate fast enough. Every time it tries you both just "+(data.hasCunt?"":"fuck and ")+"punch it right back apart. Taro pulls his paw back some, purring at the squelching suction noise the kitten's throat makes. \"Do me the honors of finishing my baby off~?\"");
			addChoice("Wreck that little cunt!", explore.bind("tarobaby12"));
			addChoice("Back.", explore.bind("tarohub"));
		}

		if (seg == "tarobaby12") {
			if (data.hasCock || data.hasBoth) cumEffect();
			append("You "+(data.hasCunt?"beat the fuck outta":"slamfuck")+" its broken tummycunt over and over, chunks of purple potato flying everywhere, splattering against Taro's pumping forearm. Your grip on both of the Fuckmeat's fragile little arms triples in pressure, and it's the easiest and most natural thing in the world to just apply a bit more, a tug or two, and... <!i>pop-pop!<!i>\n\nBoth cute limbs rip right out of their sockets, drawing a pleasured scream from the infant's bruised and beaten throat. Before they can regen"+(data.hasCunt?", Taro plugs":" you plug")+" its cute armsockets with three fingers each, reaching deep inside its chest and molesting the valves of its tiny frantic heart~\n\nYou ram"+(data.hasCunt?"your fist":"")+" in as deep as you can go and "+(data.hasCunt?"crush":"cum in")+" its heart.\n\nQuivering, tearing up (with happiness!) and seizing hard on your "+(data.hasCunt?"fist":"dick")+", the poor little tatobaby gives one last quiver and dies. <3");
			addChoice("Ahhhhh. Thank you, Taro!", explore.bind("tarobaby13"));
		}

		if (seg == "tarobaby13") {
			append("Taro casually tosses the destroyed baby corpse over the side of the meteorite. It spins off into Bright Forest's canopy, leaving behind a graceful, beautiful airborne corkscrew of infant entrails.\n\n\"I should be thanking you,\" he admits, scooting closer. \"The only reason I can waste caps like that is cause I have such dedicated patrons! <3\"\n\nTaro leans in and gives you a soft peck on the cheek.");
			addChoice(":3 Hey no prob you make good snacks and drinks y'know.", explore.bind("tarohub"));
		}

		if (seg == "tarosweet") {
			data.taroSweetDone = true;
			highEffect();
			var memory = "It tastes like liquid silk";
			if (data.metKemp > 0) memory = "Slurping this reminds you of Kemp";
			if (getJournalEntries().contains("Kemp Truck")) memory = "You make sure to take cautious, small little sips, waiting a minute or two after each one to see how you're feeling. You don't want to O.D. again";
			append(memory+".\n\nThe fine-ground sweetgrass residue clings to the inside of your mouth, gumming up in the roof-ripples.\n\nThe first waves of highness are sublingual. The next shoot down the roots of your teeth. You begin to feel like a stalk of grass yourself, pliable, curly, always leaning at least a little bit away from the wind.\n\n\"You okay?\" Taro asks, sipping on his own cup. \"I brew it stronger than Rox does, for sure... jeez, you look like you're gonna fall over.\"");
			addChoice("This shit is potent.", explore.bind("tarosweetfeel"));
			addChoice("I'm fine, but my player character might not be.", explore.bind("tarosweetmused"));
		}

		if (seg == "tarosweetfeel") {
			highEffect(900);
			append("\"Mmmm,\" he says, licking a tinge of tea from his lips. \"Just remember: you're not hallucinating the purple potato cat running a milkshake stand on top of a giant meteorite.\"");
			addChoice("That's exactly the sort of thing a hallucination would say.", explore.bind("tarohub"));
		}

		if (seg == "tarosweetmused") {
			highEffect(900);
			append("Taro eyes your character's slow sways and hurries around the counter to hold "+pickByGender("him", "her", "them")+" steady by "+pickByGender("his", "her", "their")+" waist. \"I'll look after you. Don't worry.\"");
			addChoice("Thanks, heh~", explore.bind("tarohub"));
		}

		if (seg == "taromilk") {
			append("\"You've gotta come around the counter for that one, hun...\"\n\nTaro hauls out a tub of ice cream from a refrigerated drawer one-handed and thumps it down on the counter. The other hand sneaks down below his belly and wraps finger-by-finger around his shaft, which is enough alone to bring it up to full length.\n\nHe cracks the lid off the tub, his nuts bouncing in the recoil like two big fat shiny baked potatos... then, as if it's the most normal and hygenic way to make a milkshake, he plunges his free hand in and pulls out a handful of ice cream, white globs dribbling between his finger-bridges, and plops that into a blender cup.\n\n\"Now,\" he says, pointing his cock at your mouth. \"Just gotta get the milk part~\"");
			addChoice("Kneel for him.", explore.bind("taromilk2"));
			addChoice("Refund.", explore.bind("tarohub"), {give: ["Capsule", 2]});
		}

		if (seg == "taromilk2") {
			data.taroMilkDone = true;
			append("You sink to your knees. The meteoric rock is worn-smooth from Taro's shufflings back and forth behind this stand, and besides that it has a... bouncy quality? It's almost imperceptible right now, but it feels membrane-ish, like if you hit it falling at max velocity you'd pop right through and get stuck in the stone.\n\nTaro pokes your nose with his potato dick, derailing that thought. \"It's comfortable, isn't it~? For rock, I mean...\" he coos, nudging your knees apart with his big toe. \"Come on... spread a little, if you don't mind... a good businesscat monitors their customer satisfaction.\"\n\nThe blowjob starts slow. For the longest time it's just his head, passing between your lips over and over, the flare catching at times, as if his cock was making an effort to stay where it's warm. Over time his taro-skin loosens a little, and with some vigorous tongue work you manage to peel sections off, bemused, tasting the rich purple flavor— it just tastes purple, you don't know how else to describe it— and with a grunt he flexes his abdomen and fills your mouth with a gentle gush of raw cockjuice. Not cum, cockjuice.\n\n\"That's it...\" he purrs, eyeing your "+pickByGenitals("cock as it hardens", "dripping cunt", "cock as it hardens and the stains of vaginal oils down your inner thighs")+".");
			addChoice("Deepthroat.", explore.bind("taromilk3"));
		}

		if (seg == "taromilk3") {
			append("Using the footpaw he nudged open your thighs with, he wiggles his toes up to your "+pickByGenitals("nuts", "puss", "nuts")+"... which means he's balancing on one foot when you decide to slam your face down on his crotch and gape your throat on all six inches of naturally-lubed tarocock. With a squawk he reels off-balance, one paw coming down on the ice cream tub. It flies sideways into a two bird girls: a bluebird and a seagull, coating them.\n\nTaro's other paw claps onto the back of your head, holding you down while his toes get to work massaging your "+pickByGenitals("sack", "labia", "sack")+". He anchors himself on your throat, giving you no option but to take it deep. He starts working back and forth in short bursts, thrusting four or five times quick before stopping to pant. His "+(Math.random()<0.05?"Mr. Potato Head":"head")+" plunges past your uvula, ignoring all resistance, yanking wet gags from the pit of your stomach.\n\nGradually his little breaks get shorter and shorter, until, on the finishing stretch, he just powerfucks your throat open for five minutes straight, mumbling dirty-talk to himself under his breath: \"Mmm... wanna... fuckin... milkshake... do ya...\"");
			addChoice("Cum.", explore.bind("taromilkcum"));
			addChoice("Maybe just... go ahead and...", explore.bind("taromilkbite"), {kinks: ["Candy Gore"]});
		}

		if (seg == "taromilkcum") {
			cumEffect();
			append("Your "+pickByGenitals("nuts", "cunt", "nuts")+" twitch hard. Your "+pickByGenitals("cock throws", "pussy squirts", "cock and pussy throw")+" a spurt of "+pickByGenitals((isActive("Mood Ring")?getMood("You"):"")+"cum", "oil", (isActive("Mood Ring")?getMood("You"):"")+"cum/oil")+" to spatter against the soft stone.\n\n\"Hey man,\" the seagull says, jabbing a cream-clogged wingtip at him. \"I wanna speak to the manager.\"\n\n\"Sorryyyrrghhh...\" Taro wheezes, presently raping your esophagus a little too hard for customer service. \"I'll be... with youuurghhh... in a sec...!\" He throws his hips forward over and over, hardly pulling back each time... by the last few he's got the back of your head pressed to the cool hum of the refrigerator drawer. Then, with a squeak, he yanks his cock out and slips it into the blender alongside the ice cream dollops just in time, filling it to the rim and over with thick purple kittycum.\n\n\"Unbelievable service,\" the bluebird mumbles, texting angrily, unable to see you over the counter. \"Come on. Let's go.\"");
			addChoice("Drink the shake.", explore.bind("taromilkend"));
		}

		if (seg == "taromilkbite") {
			append("You maybe just... go ahead and...");
			addChoice("And... bite his dick off~?", explore.bind("taromilkbite2"), {kinks: ["Candy Gore", "Candy Gore", "Candy Gore"]});
			addChoice("Nvm don't do anything just cum instead.", explore.bind("taromilkcum"));
		}

		if (seg == "taromilkbite2") {
			data.taroBitDick = true;
			append("First you open as wide as you can so you can slip his nuts in your mouth too, with a little push here and there to tuck them nice and deep~ Without really thinking about it you test the waters, bringing your teeth down a bit... the flavor of his sensitive inner flesh gushes out through those tiny divots, filling your mouth. Taro blinks at you. Hesitates. Then, he erupts into purry whispers: \"Pleasepleasepleaseplease... do it, do it~!\"\n\nYou lap at his nuts for a second, your bulged cheeks palpitating with its excited throbs... then, once all his bits are nice and softened up...\n\n<!i>Chomp~<!i>\n\nTaro squeals adorably. His hips push forward even after there's nothing but a juicy hole left. Unable to help himself, his paw shoots down and two big fingers plunge inside his new pussy, displacing a spume of regenerative tissue.\n\nHe only barely manages to tuck the blender cup beneath his cockstump in time to catch the first few bursts of "+(isActive("Mood Ring")?getMood("You"):"")+"cum, which would've sputtered out like the mist setting on a garden hose had he not guided the stream between his plunging fingers. After a couple clenches and perhaps a bit more fingerfucking than totally necessary, Taro pops his digits out and sucks them clean of half-formed flesh and "+(isActive("Mood Ring")?getMood("You"):"")+"cumglobs, finally letting his body regenerate unfettered.\n\nIn moments he's got a new flaccid dicknub and a coin purse. In a few more, his cock is once more totally intact and pulsing in a sort of calm, curative afterglow.\n\nThe birdgirls stare, ice-cream-smeared wingtips covering their mouths.\n\n\"Holy shit,\" the seagull says.\n\n\"My goodness,\" the bluebird says.");
			addChoice("Drink the shake.", explore.bind("taromilkend"));
		}

		if (seg == "taromilkend") {
			append("You make a grab for the shake.\n\n\"Whoawhoawhoa,\" Taro says, moving it out of your reach. \"We're still missing an ingredient, silly.\"\n\n"+(data.taroBitDick?"He pinches your full mouth with a thumb on one side and index on the other.\n\n\"... Come on, spit it out...\"\n\nWith a little reluctance you let his flaccid cock slip out past your lips. It lands with a soft <!i>sploop<!i> in the ice cream, which by now is half-melted with the cat's hot cum. \"There now. :3\"":"With a flourish he pops off his lil kitty nose and drops it in the ice cream, which by now is half-melted in the heat of his cum. In two seconds it's back, popping fresh and clean from the stump on his face. \"There we go~ Just adds that extra flavor POW, y'know...\"")+" He sets the blender cup back on its base and jams a thumb not on LIGHT, not on MEDIUM, not HARD, not HARDER, not HARDEST, not even MEGASHRED, but on the highest setting: MUTILATION.\n\nHe shoots you a wink and lacerates his former "+(data.taroBitDick?"cock":"nose")+" into a fine purple mist.");
			addChoice("Okay now drink the shake.", explore.bind("taromilkend2"));
		}

		if (seg == "taromilkend2") {
			append("You sit with Taro while he wipes the counter, slurping at your milkshake. It's really good, actually, and not just cause you worked so hard for it or because you're partial to guzzling cum. The ice cream he used was vanilla, but there's a crunchy secret ingredient to it, you can just tell...!\n\nAfter some prying you get it out of him: frozen white chocolate shavings. And that tricky potatocat thought he could keep it from you.\n\nYou chug down the last mouthful, lick your white/purple-stained lips, and let your eyes roam back to the menu.");
			addChoice("Mmmm.", explore.bind("tarohub"));
		}

		if (seg == "taronymph") {
			data.taroNymphDone = true;
			append("\"YO! ALLEI!\"\n\nTaro calls out to the barest glimmer of a nymph girl doing yoga on the edge of a crater high above.\n\nShe flits down at length, panting. From the way her tiny hips roll and wobble as she lands, you suspect she's a little drunk. \"Special customer, eh? Get out the scraper, Taro, what are you waiting for?\"\n\n\"Just admiring the sheen,\" he purrs, ripping his eyes from her sweat-shiny bod. Allei scoffs, shifting her posture a bit and pushing her nymphtits out into the moonlight, which just so happens to quadruple their luminosity.\n\nTaro drags a little squeegee up and down her pits for starters. Her cheeks go red and puffy, filled with suppressed giggles. Next he dabs it between her shoulder blades, underneath her iridescent wings, her collarbone, over her smooth little pink belly (dipping the sponge's corner into the button), between her legs, her pusslips, and <!i>DEEP<!i> up her asscrack.\n\n\"Thanks,\" he chirps, squeezing the sweat into a teacup for you and tossing her the capsule you paid.\n\nYou guess he just sells her sweat for free?\n\nAllei slurs something like \"Knew "+pickByGender("he", "she", "they")+"'d show up on yoga day...\" then turns to give you a nice view of her ass and starts the arduous, tipsy flight back up to her curious classmates.\"");
			addChoice("Drink the sweat~", explore.bind("taronymph2"));
		}

		if (seg == "taronymph2") {
			append("You sip her sweat carefully, expecting a salty, pungent flavor... but it doesn't taste like sweat at all. It's got a heavenly, sharp flavor to it. A real hallelujah slap to the taste buds. You'd expect this to be distilled from the inner flesh of some gaudy, spiked fruit, not the buttcrack of a drunken nymph girl.\n\nTaro shares your thoughts. \"Powerfully sweet, isn't it? I can't imagine how their bodies must work to produce a flavor like that... or how mine works in general, for that matter...\"");
			addChoice("Mmm.", explore.bind("tarohub"));
		}

		if (seg == "tarobutt") {
			append("\"Good timing,\" he purrs. \"I was just about to make a new batch.\"\n\nTaro casually pokes a hole in a fresh bag of flour with his cock, readying the bowl beneath. He slips a stick of butter between his thighs to soften it up (you can't bring yourself to question his methodology at this point) then cracks it in half. Next, sugar, cow milk branded with the letters <!i>R.O.X<!i>, dragon egg yolks... and, finally, an imperceptible eyedropper-bead of sweetdust extract.\n\n\"And now,\" Taro says with a flourish, \"the final ingredient...\"\n\nHe slams his fat purple ass down in the bowl, the beige goop rising up his crack, clinging to all that smooth tarochub in strands. \"Break it up for me, would you~?\"");
			addChoice("Take a bite out of his ass.", explore.bind("tarobuttbite"));
			addChoice("You wouldn't happen to have a cheese grater around, would you? I want to reference something.", explore.bind("tarobuttgrate"), {kinks: ["Candy Gore", "Abuse", "Candy Gore", "Abuse", "Candy Gore", "Abuse"]});
			addChoice("Refund.", explore.bind("tarohub"), {give: ["Capsule", 1]});
		}

		if (seg == "tarobuttbite") {
			data.taroButtDone = true;
			data.taroGratedAss = false;
			append("You hold Taro steady with a hand on each hip, squeezing hard enough to make his cheeks puff out a bit. His nuts float on the surface of the batter, sack nice and relaxed... until you press your lips to his left asscheek and start voraciously making out with it; that makes his perfect purple orbs tighten right up.\n\nYou let your teeth graze him, peeling that potatobutt...");
			addChoice("Chomp.", explore.bind("tarobuttbite2"));
		}

		if (seg == "tarobuttbite2") {
			append("You bite off a fat mouthful of ass. He howls with pleasure, purple tarojuice splurting out over your face as he clenches reflexively.\n\n\"Ahh... ah... need a little more than that...\"\n\nYour next bites are slower and deeper, tearing through half-regenerated tissue, tendonic strands of assflesh snapping between your jaws. His blood tastes delicious.\n\nBy the time your feeding frenzy tapers, you've swallowed half as much as you dropped in the bowl, and Taro's ass resembles a cracked-open geode with its insides all shiny and concave. It takes only ten seconds for the bloodgoop to coagulate and form a tight 'n shiny brand-new buttocks.");
			addChoice("Wait, where's your oven?", explore.bind("tarobuttend"));
		}

		if (seg == "tarobuttgrate") {
			data.taroButtDone = true;
			data.taroGratedAss = true;
			append("\"What are you gonna do...?\"\n\nHe reaches down, somehow miraculously keeping his ass lodged in the bowl, and hands you a polished metal cheese grater with a gajillion pinprick barbs clearly designed to grind cheese into fine powder.");
			addChoice("I'm gonna fuck you with it.", explore.bind("tarobuttgrate2"));
			addChoice("Nothing. I'm gonna change my mind and bite your butt.", explore.bind("tarobuttbite"));
		}

		if (seg == "tarobuttgrate2") {
			append("\"I can't imagine what that possibly references.\"\n\nYou plunge the grater fat-end first up his ass by way of reply, lodging about half the barbs inside. They're angled to do the most damage on the way out... so, naturally, one hand peeling open his left cheek, you drive down the heel of your palm over and over on the handle until his potatobutt is packed to the max with sharp metal.\n\nIn the span of three seconds his capacity for speech has gone from full sentences to high-pitched gasmbabbling. You start to pull the grater out, keeping eye contact as he watches it over his shoulder; you make a point not to look at the carnage. It's enough to feel it slopping over your fingers, to feel the handle jerk up or down with Taro's every twitch and cumspurt. Leaves more to the imagination.\n\nOn the tail-end of his \"Moremoremore\" mewls, you start really grating his prostate with it, ramming that spiked box in despite all resistance like a frustrated kid trying to fit the square peg into the circle hole.\n\nYou pull out for the last time to watch his hole spew its last few bloody tarochunks into the batter, tightening as it regenerates. He sighs and pulls off, testing his ass with a few fingers to make sure everything's back in place. He's clearly a little disappointed you stopped~");
			addChoice("Wait, where's your oven?", explore.bind("tarobuttend"));
		}

		if (seg == "tarobuttend") {
			append("\"Don't have one,\" he pants, and whips out a pickaxe from nowhere.\n\nYou scurry away!?\n\nWith one mighty swing he pierces the meteoric rock. Lava trickles out, thicker than honey. Back on the counter he takes his time mixing butt-taro into the batter and slapping a couple fat discs of it down on a foil pan, which he then casually places beside the growing lava-pool and leaves for twenty minutes.\n\n\"What?\" he says, because you looked at him funny. He rests the pickaxe on his shoulder. \"Why spend caps on an oven when you don't need to? I'm resourceful, is all...\"");
			addChoice("Jeez. Next.", explore.bind("tarobuttend2"));
		}

		if (seg == "tarobuttend2") {
			append("You share a couple crispy purple cookies with Taro. You feel a lot closer with him now that you've "+(data.taroGratedAss?"fucked his ass with a cheese grater":"gnawed on his asscheeks")+".\n\nYou can't taste the sweetgrass extract, nor do you get a buzz from it, but the world seems just a little bit softer after your third cookie.\n\nOh, you only paid for one. Dang, he just gave you two free butt cookies! <3");
			addChoice("Thank you potatocat.", explore.bind("tarohub"));
			addChoice("I earned them.", explore.bind("tarohub"));
		}

		if (seg == "tarogut") {
			append("Taro starts insta-purring at the word \"gut.\"\n\n\"Jeez, I need some kinda way to get all these precious ingredients out, don't I...~?\"\n\nHe kicks a bowl out between his legs and saunters forward a little, grinding his ample bellymeat up against yours.");
			addChoice("Lube up his belly button~", explore.bind("tarogut2"), {kinks: ["Candy Gore", "Candy Gore", "Candy Gore"]});
			addChoice("Refund.", explore.bind("tarohub"), {give: ["Capsule", 3]});
		}

		if (seg == "tarogut2") {
			data.taroGutDone = true;
			append("You latch your lips to his innie and start sucking hard enough to turn it temporarily into an outie. Taro runs a hand through your hair with hesitant reverence, as if afraid you'll snap at him for daring to touch them beautiful locks. He pushes your head down gently, guiding your tongue a little deeper into his button, tensing now and then at your more violent <!i>slurbllrpschlps<!i>.\n\nThe time comes. You pull off and "+pickByGenitals("aim your dick", "poise a fingertip", "aim your dick")+" at his glistening bellycunt, which, of all things, makes him relax completely.");
			addChoice(pickByGenitals("Tummyfuck", "Fingerfuck", "Tummyfuck")+".", explore.bind("tarogut3"));
		}

		if (seg == "tarogut3") {
			append("\"Fuck my guts out,\" he whispers in that moment.\n\nYou grant his wish, plunging your "+pickByGenitals("cock to the base", "finger down to the knuckle", "cock to the base")+" in one push, "+pickByGenitals("nuts banging against his soft lower tum", "his flesh already regenerating around it", "nuts banging against his soft lower tum")+". Taro keels forward with a dizzy moan and a gush of blood.\n\nYou show no mercy.\n\nTwo of your fingers join his gaping button, yanking in opposite directions and easily ripping apart his squishy taro flesh, spilling shiny purple taro intestines and taro stomach lining. "+pickByGenitals("You rape the fuck outta his loose entrails", "You drop pretense and straight-up fistfuck his entrails out", "You rape the fuck outta his loose entrails")+", reaching in to yank out beautiful handfuls of him on the off-beats.\n\nOkay... he collapses with a deep, half-moan half-gag. A few beads of purple spill from the corner of his maw.");
			addChoice("Cum.", explore.bind("tarogut4"));
		}

		if (seg == "tarogut4") {
			cumEffect();
			append("You lay with him on the warm rock floor, frantically "+pickByGenitals("fucking", "fisting", "fucking")+" his limp body, not caring that his head is flopping around and banging now and then against the rock. As you near climax you plunge "+pickByGenitals("", "your fist", "")+" as deep as it can go"+pickByGenitals("and spill his guts over with "+(isActive("Mood Ring")?getMood("You"):"")+"cum", ", punchfucking him deep enough to feel his heartbeats rapid against your knuckles", "and spill his guts over with "+(isActive("Mood Ring")?getMood("You"):"")+"cum")+".\n\nAfterglow settles in much quicker than normal. Perhaps it's because he's perfectly still. You slow down to one thrust a second, then one a minute, and, finally, you just lay there in bliss and cuddle with his mangled corpse~\n\nHm. It's still regenerating.");
			addChoice("Next?", explore.bind("tarogut5"));
		}

		if (seg == "tarogut5") {
			append("... Where is he?...\n\n... Oh. He waves from two craters up. You guess respawning doesn't really care about the Z axis.\n\nWhen he does finally make his way down he shows up with a bucket of borrowed ice under his arm, which he promptly dumps into the blender alongside two heaping fistfuls of his old body's guts.\n\nIt takes him a sec to catch his breath, but when he does he says \"Thankyousomuchforthathonestlyohmygod\" and slathers your face with happy, purring kisses~");
			addChoice("My pleasure.", explore.bind("tarogut6"));
			addChoice("It was something!", explore.bind("tarogut6"));
		}

		if (seg == "tarogut6") {
			Theme.addUiChoice("taro");
			append("He pulls off your face with a blush. Unlike the one on his living body, the expression on his corpse is twisted and creepy.\n\n\"Ah, jeez... hold on...\"\n\nHe hauls up his body, purple blood spattering out over his back and butt. Then, with a mighty grunt, he heaves it over the side of the summit. It bounces off the meteor twenty times, crashing down thousands of feet into nothingness.\n\n\"Somewhere,\" he says, serving you an icy-cold, sweet and syrupy gut slushie. \"Somewhere down there is a bigass pile of eternally intact Taro bodies.\"");
			addChoice("My god.", explore.bind("tarohub"));
		}

		if (seg == "straight") {
			append("A bunch of 20-year-old nymph students are sitting through the filler-iest part of their beach episode. The lead boy offers to rub suntan lotion onto the lead girl's back.\n\n\"Uwahhhh,\" she says, and suplexes him comically. Everyone laughs because she has now acquired a red complexion and it is common knowledge that she would secretly enjoy having lotion applied to her back, why, even onto her <!i>buttocks<!i> by the lead boy!");
			addChoice("Back.", explore.bind("main"));
		}

		if (seg == "leftintro") {
			data.knownAsPlayer++;
			append("Some greasy neckerchiefed Tony-lookin tigers have set up a toll booth blocking the path to the leftward springs.\n\n\"What kinda player are you?!\" asks a wet futa, ass balancing her lawnchair on the back legs, fanning steamy breezes away with a splayed handful of tickets. \"Casual? Pro? Do you have what it takes to reach level <!i>two<!i>, at least? The birdbrain gossip said you were a Galaxy Wizard, transcending space to contact us from an upper dimension or some new age shit.\"\n\n\"Pretty tall order,\" the shortest cat freudian-slips. \"You'd think a Galaxy Wizard wouldn't look like such a little scrub. I wonder if "+pickByGender("he", "she", "they")+" could even call "+pickByGender("himself", "herself", "themself")+" a <!i>hardcore gamer<!i>...?\"");
			addChoice("1v1 me.", explore.bind("left1v1"));
			addChoice("You can be bad at this game?", explore.bind("leftbad"), {kinks: ["Plot"]});
			addChoice("What are you trying to sell.", explore.bind("left1"));
		}

		if (seg == "left1v1") {
			append("He scrambles up off his chair— wait, no, everyone but him gets a proper chair, he was just sitting on a milk crate— and puts up his dukes, bobbing and weaving in front of you. \"Let's go! Let's go!\"\n\nThe futa pulls him back by the scruff easily. \"Settle down bud. We haven't even finished the pitch.\"");
			addChoice("Pussy.", explore.bind("left1"));
		}

		if (seg == "leftbad") {
			append("\"The last player couldn't even handle level one,\" says a chubby cat banker counting caps in the back.");
			addChoice("Hm.", explore.bind("left1"));
		}

		if (seg == "left1") {
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			append("\"Just one ticket,\" spits the futa, jumping off her chair and pushing her barely-neckerchiefed tits out all showmanlike. \"With just one ticket, you'll get entry to all three springs— levels one, two, three. Only <!i>skilled<!i> players make it to the third... are <!i>you<!i> up to the challenge, "+data.playerName+"!?\"\n\nShe waggles the tickets and by extension her floopy-doopy flaccid cock in your face.");
			addChoice("How much?", explore.bind("left2"));
		}

		if (seg == "left2") {
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			append("\"Twenty caps.\"");
			addChoice("Fuck off.", explore.bind("left3"));
			addChoice("... Alright.", explore.bind("lefthigh"), {cost: ["Capsule", 20]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "left3") {
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			append("\"Okay, tell ya what, I'll give you a special 50% off deal since you're the first player in a long ass while. How about ten?\"");
			addChoice("Just barge through.", explore.bind("leftbarge"));
			addChoice("How about two?", explore.bind("left4"), {req: ["Capsule", 2]});
			addChoice("... Good enough.", explore.bind("lefthigh"), {cost: ["Capsule", 10]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "left4") {
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			append("\"Come on, "+pickByGender("man", "girl", "bud")+",\" she bitches, scratching her heavy nuts. \"Five. And that's as low as I go.\"");
			addChoice("Just barge through.", explore.bind("leftbarge"));
			addChoice("Three.", explore.bind("left5"), {req: ["Capsule", 3]});
			addChoice("... Okay, fine.", explore.bind("lefthigh"), {cost: ["Capsule", 5]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "left5") {
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			append("\"I just told you five's as low as I go. You know how many people even pay this toll? Most just tell us to fuck off and barge right through. I haven't been able to afford a nug of dust in days, "+pickByGender("man", "bud", "bud")+"...\"");
			addChoice("Welp, time to barge right through.", explore.bind("leftbarge"));
			addChoice("Four, and I'll throw in a blowjob. :3", explore.bind("left6"), {kinks: ["Intersex", "Raunch"], req: ["Capsule", 4]});
			addChoice("... Alright, jeez.", explore.bind("lefthigh"), {cost: ["Capsule", 5]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "left6") {
			append("She looks at your lips.\n\n\"Well... that's...\"\n\nHer dick chubs up a little, nuzzling itself against her thighfur. No barbs; it's smooth and shiny with springwater (or sweat?), uncut, drooling pre.\n\nShe sits back down and crosses her legs, successfully hiding her arousal, but revealing a steamy bit of asscrack in the process. \"Five,\" she says, \"and you throw in a <!i>rim<!i>job for all this trouble.\"");
			addChoice("Barge barge barge.", explore.bind("leftbarge"));
			addChoice("... Deal.", explore.bind("leftrimjob"), {cost: ["Capsule", 5], kinks: ["Scat"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "leftbarge") {
			data.springsBargedThrough = true;
			append("You don't really <!i>barge<!i>, because the cats don't make any move to stop you. They keep their heads down.\n\nThe short one is fighting back tears. \"I coulda beat "+pickByGender("him", "her", "em")+"... why'dja pull me back...\"\n\n\"Don't worry.\" The futa gives him a big-sisterly smooch on the forehead. \""+pickByGender("He'll get his", "She'll get hers", "They'll get theirs")+".\"\n\nHe sniffles and feels a little better.");
			addChoice("Enter level one.", explore.bind("leftlevel1"));
		}

		if (seg == "lefthigh") {
			append("She scoops up all those caps and hands you a ticket.\n\n\"... Seeya later, sucker~\"\n\nThey all cheer behind you. \"Fuck yeaaaaaah we're gettin high tonight boyyyyzzzz~!!!\"");
			addChoice("Gah. Enter level one.", explore.bind("leftlevel1"));
		}

		if (seg == "leftrimjob") {
			append("She spins around in a second, semi-soft cock flopping every-which-where, and takes a knee on her chair to point that curvaceous kitty ass at you.\n\nShe peels open her left cheek, revealing a "+(isActive("Candy Ring")?"peppermint pucker all striped and sugar-slick":"dank-furred crease laced with strings of light-brown liquid musk and a donut slowly puking shitjuice")+".\n\n\"Stuff your payment up there too, if you don't mind,\" she purrs. \"I could go for quintuplets...\"");
			addChoice("... No, just dive in.", explore.bind("leftrimjob2"));
			addChoice("Push the capsules up her butt, one-by-one. Then dive in~", function () {
				data.springsCatPreggo = true;
				explore("leftrimjob2");
			}, {kinks: ["Pregnancy"]});	
		}

		if (seg == "leftrimjob2") {
			append((data.springsCatPreggo?"You pluck a cap from your palmful and tuck it gently between the folds of her fat pucker, feeding it up her ass to the knuckle. Her balls twitch, but otherwise she takes the digit no problem. You do the same for caps two to five, burying them deep up her ass, and by the end of it your finger is all wet and shiny"+(isActive("Candy Ring")?"":" brown")+"~\n\n":"You ignore her request, instead tossing your caps to a cat in the back.\n\n")+"Despite the fact that you're in a shitty toll booth surrounded by spectators, you start to feel a sorta private, romantic atmosphere between you and this cat's butt. It's the way her sack hugs her nuts so tight... the oily gleam of sweat on her fur... the "+(isActive("Candy Ring")?"sexy red peppermint stripes interlaced with the stripes of her assfur":"built-up residue from a hundred shitlogs dripping inches from your tongue")+".\n\nYou dive forward. Your cheeks produce some drag against hers, but, thankfully, her "+(isActive("Candy Ring")?"frosting":"sweat")+" lubes your face up just enough so that you can squeeze your mouth and nose right up against her hole. The world is dim and candelit now. You let your tongue wander out into the hot damp, like a lover searching for another between sheets of summer rain, calling, calling, O, my love, please cum to me through this tempest, umbrella agape with room for two 'neath—");
			addChoice("Gobble the fuck outta that "+(isActive("Candy Ring")?"candy-coated":"shitty")+" asshole.", explore.bind("leftrimjob3"));
			addChoice("... Go enter level one.", explore.bind("leftlevel1"));
		}

		if (seg == "leftrimjob3") {
			append((data.springsCatPreggo?"The caps you shoved up her ass have dissolved now. You can taste them, all potent and sugary. Her tummy grumbles and starts to bulge...\n\n":"")+"You slap a palm down on each fat cheek, spread them, and start rapid-fire tonguefucking her. "+(isActive("Candy Ring")?"Peppermint ice-cream":"Half-liquid shit")+" slops out into your open mouth, spilling from the corners, pooling around your gums. She matches the rhythm with violent gyrations. If you weren't holding her cheeks apart, you feel like they'd be clapping around your face hard enough to bruise.\n\nSuddenly she grunts, ring clenching at the base of your tongue. \"Unhh... keep your mouth open, hun~\"\n\nHer stomach growls"+(data.springsCatPreggo?", and this time it's not because of the capsules":"")+"— before you can do anything your tongue's forced out by a colossal "+(isActive("Candy Ring")?"flood of ice-cream":"shitlog")+" which gapes your throat deeper and more relentless than a cock ever could, morphing to fit the contours of your esophagus and penetrating right to the pit of your stomach.\n\nShe pulls off with a happy sigh, caressing her "+(data.springsCatPreggo?"fat, pregnant":"empty")+" belly. \"Pleasure doing business with you.\"");
			addChoice("Fwahh. Enter level one.", explore.bind("leftlevel1"));
		}

		if (seg == "lefthub") {
			append("<!24px>SELECT YOUR STAGE!<!24px>");
			var s:MintSprite = addSprite("assets/img/effect/tierSpringsMenu.png");
			s.onHover = showToolTipOnCursor.bind("Font: Kalinga.", "");
			s.x = 180;
			s.y = 175;
			addChoice("Level one.", explore.bind("leftlevel1"), {enabled: data.springsLeftIntroDone});
			addChoice("Level two.", explore.bind("leftlevel2"), {enabled: data.springsLeftLevelTwo});
			addChoice("Level three.", explore.bind("leftlevel3"), {enabled: data.springsLeftLevelThree});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "leftlevel1") {
			setLocation("Level One");
			data.springsLeftIntroDone = true;
			unlockJournal("Left");
			append("You wade into level one and wash off the accumulated stains of your adventures.\n\nThis spring is the widest and the easiest to take. Everyone's having a nice relaxed soak, chatting, fucking, having contests to see how long they can hold their breath underwater. You can only assume everyone's doing that as deepthroat practice.");
			addChoice("Explore.", explore.bind("leftlevel1explore"), {kinks: ["Female", "Male", "Intersex", "Feral"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "leftlevel1explore") {

			var rox:String = "A cow futa and her feral sheepdog";
			if (data.roxVisits > 0) rox = "Roxelle and her dog Bert";
			if (data.roxVisits > 1) rox = "Roxelle and Bert";

			var tourguide:String = "a raccoon tour guide";
			if (data.dragonHermDone) tourguide = "that raccoon tour guide you saw outside the Snagglebank earlier";

			if (data.springsExplore1.length == 0)
				data.springsExplore1 = [rox+" hang out beside a wet bar. She's got him hooked up with four little pink waterwings that say DOGGYSLUT in sprakly letters on the sides, trying to teach him how to swim, but he's way too confused to handle it. He just floats around, looking at her with his eyebrows peaked, all four legs waggling randomly.\n\n\"C'mon Bert,\" she says, wading a little distance before pulling her junk above-water and slowly stroking it, making it look all sexy and enticing for him.\n\nHe whines, clearly desperate for a facefuck, breaking his hypnosis with her fat cock only to peer confused at his own bubbles.", "You come across "+tourguide+" leading a water aerobics class for the elderly. He's one of the few furs with any kind of swimsuit on: a speedo that barely contains his gargantuan schlong. Despite that immense weight, he has no problem throwing his hips around willy fuckin nilly.\n\n\"And ONE and TWO and LET'S SEE SOME <!b><!i>HUSTLE<!i><!b> FOLKS!\"\n\nMost of these old folks are surprisingly spry (sixty years worth of aerobics has gotta count for something, you guess) but one among them shines: a hyena grandma, carrying a grandchild on each bicep, piggybacking a third, and still doing effortless vertical splits. \"SPEED IT UP A LITTLE, HUH?!\" she shouts at the raccoon.\n\n\"Well, gosh— now, we— we have to include everybody! I can't just change the routine— even for muscles like those...\"", "A feral nymph squats on the rock, testing the hot water with her toe. Someone's "+(isActive("Mood Ring")?getMood():"")+"cum dribbles from her gaped puss and forms milky clouds in the spring water.", "Two kangaroo girls scissor on a smooth rock island in the middle of the spring, grinding their pouches together.", (data.exploreFinaleBFDone?"You pass by a raised pool filled with bird girls, tits all a-jiggle and voices a-twitter. Three stray worriedly at the edge of the group. You catch pieces of their conversation:\n\n\"... Can't believe she was so stupid, flew right through it... looked over her shoulder... smiled at me. She was all like: look at this cool cloud!\"\n\nAnother nods sympathetically, working her wingtip in calming circles over the worrisome bird's pussy. \"It's okay, it's okay... the player's here now, "+pickByGender("he", "she", "they")+"'ll fix everything...\"\n\n\"I know...\"\n\n\"Second time this year,\" another chimes in, clearly just trying to get more info so she can gossip about this juicy calamity later.\n\n\"Honey,\" the cunt-rubbing birdgirl says to her: \"If you want to spread the story so bad, make yourself useful and report it.\"\n\n\"Ah! Uh! Right!\"\n\nShe flutters off to the City, embarrassed.":"You pass by a group of scientist jackals taking samples from an oddly glowy spring. Teal algae has taken root in its crevices.\n\n\"Did they catch the bunny yet?\" asks the woman working an eyedropper, tits bursting from her lab coat.\n\n\"Nope,\" replies the scientist currently assfucking her.\n\n\"More interference from the board?\" she asks.\n\n\"Nnnngh... Yup.\""), "Two dudes wrestle in the water, cocks jousting.", "You find a big, final-boss looking cave that slopes underwater."];
			var result:String = pickOne(data.springsExplore1);
			data.springsExplore1.remove(result);
			append(result);

			if (result == "You find a big, final-boss looking cave that slopes underwater.") {
				addChoice("Explore a bit more first.", explore.bind("leftlevel1explore"));
				if (data.springsLeftLevelTwo) addChoice("Head to level two.", explore.bind("leftlevel2"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]})
					else
					addChoice("Tackle the boss.", explore.bind("level1boss"), {kinks: ["Hyper"]});
			} else {
				addChoice("Explore.", explore.bind("leftlevel1explore"));
			}

			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1boss") {
			var bondskinks = ["Abuse"];
			var healthkinks = ["Abuse"];
			data.springsPowerup = "";

			if (!data.springsBargedThrough) {
				bondskinks = ["Abuse", "Scat"];
				healthkinks = ["Abuse", "Vomit"];
			}
			append("You swan dive into the underwater cave, bubbles rushing around your ears. Discarded sex toys wink at you from the depths, and cute fish girls wink at you from the left.\n\nYou break the surface, gasping, and climb into a low-ceiling antechamber. A boss door towers opposite you.\n\nBefore you head through, you notice three dusty, disused powerups. A little info plaque on the wall says:\n\n<!i>1. You WILL get assraped!\n2. You can only pick one powerup.\n3. If you leave or cum, you lose. If you make the boss cum, you go on to level two.\n4. Have fun~!<!i>\n\nThere's a cone-shaped anal training toy (SLUTTIFIER), a ring-gag and some bonds (RESISTANCE SUPPRESSOR) and, most ominously, a first-aid kit (HEALTH PACK).");
			addChoice("SLUTTIFIER.", explore.bind("level1boss2"), {kinks: ["Abuse"]});
			addChoice("RESISTANCE SUPPRESSOR.", function () {
				data.springsPowerup = "bonds";
				explore("level1boss2");
			}, {kinks: bondskinks});
			addChoice("HEALTH PACK.", function () {
				data.springsPowerup = "health";
				explore("level1boss2");
			}, {kinks: healthkinks});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1boss2") {
			if (data.springsPowerup == "bonds") {
				append("You fit the ring-gag on your mouth and handcuff yourself, cinching both tight.\n\n... You sure hope the boss has the key for these...\n\nYou're ready.");
				addChoice("Fight!", explore.bind("level1bossfight"));

			} else if (data.springsPowerup == "health") {
				append("You crack open the first-aid kit. Cute   <!img:kink/Cub.png>  -print bandaids, gauze, numbing cream, a splint, and a tiny vial of sweetdust for sedatory purposes.\n\nNice. You're ready.");
				addChoice("Fight!", explore.bind("level1bossfight"));
			} else {
				append("You tuck the toy-tip between your asscheeks. The plastic is warm and wet and smooth. Perhaps the hot water in this cave rises and submerges the powerups sometimes. Or, perhaps, this toy was very recently lodged inside a stranger's ass~\n\nWith a little effort you open your hole and take it almost halfway on the first squat. You feel yourself getting sluttified already; a pesky urge to just slam your ass down on the whole thing at once bubbles up somewhere in your lower stomach...");
				addChoice("Do it. <3", explore.bind("level1boss3"));
			}
		}

		if (seg == "level1boss3") {
			append("You wrap a couple fingers around the skinny part where the cone's butt-end meets its base. You lick your lips. You twitch your hole. Then you take the plunge.\n\nA little howl echoes unbidden from your guts as you attempt to force the whole thing inside them at once— but, oh fuck! You're stuck at the fattest part!— okay, alright, you can do this, go hard or go home— you let your weight rest entirely on the toy, pushing, wiggling, pushing, til your pucker bullies your digits out from the skinny part and shuts tight around it with a <!i>plip<!i>.\n\nYour gasps reflect off the water and the walls.\n\nDespite just being warm plastic, it feels like a throbbing cock: your own heartbeat surges against the toy, pulsing through "+pickByGenitals("your squashed prostate", "the inner walls of your cunt", "your squashed prostate")+".");
			addChoice("Pop it out.", explore.bind("level1boss4"));
		}

		if (seg == "level1boss4") {
			append("Alright... okay. Yep. You're thoroughly sluttified. It takes a good five minutes of effort to convince yourself to pull it out. Having your ass packed just feels so comfy. <3\n\n<!i>Pop.<!i>\n\nYour butt is now wide open, drooling a single bead of wetness— either water that was already on the toy, or some natural lube from you.\n\nOkay. You're ready.");
			addChoice("Fight!", explore.bind("level1bossfight"));
		}

		if (seg == "level1bossfight") {
			append("The door swings open, spilling over with light.\n\nIt's... a toll booth.");
			addChoice((data.springsBargedThrough?"Uh oh.":"Not again."), explore.bind("level1bossfight2"));
		}

		if (seg == "level1bossfight2") {
			var choice:String = (data.springsBargedThrough?"... Let me make up for it. (Wink my gaped asshole at her~)":"Wink my gaped asshole at her~");
			if (data.springsPowerup == "bonds") choice = "Drop to my knees, press my "+(data.hasBoobs?"tits":"chest")+" to the ground, and submit.";
			if (data.springsPowerup == "health") choice = (data.springsBargedThrough?"Quick! Slather my ass with numbing cream!!":"Be as rough as you like. (Slather my ass with numbing cream~)");

			append("Only one operator this time: the tiger futa.\n\nShe steps around the counter, running a hand over "+(data.springsCatPreggo?"her plump, shiny preggobelly":"the fur of her healthy, round little tum")+". Just below that she tugs her cock out to full length (one and a half feet) and full hardness (a solid eight on the Mohs scale). You see why she hid this monster earlier. It's extremely intimidating.\n\n\""+(data.springsBargedThrough?"Barge through my booth, will ya? Phase one begin, motherfucker":"Hello again")+".\"");
			addChoice(choice, explore.bind("level1bossfight3"));
			addChoice("Puss out.", explore.bind("level1bossquit"));
		}

		if (seg == "level1bossquit") {
			append("\"Knew you were a filthy casual,\" she smirks, but her tone is a little lonely. \"I mean a cleanly casual.\"");
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1bossfight3") {
			var powerup = "You slip a couple fingers 'tween your cheeks and pull your ass open for the kitty, twitch-a-twitch-a-twitchin that fat pucker away~";
			if (data.springsPowerup == "bonds") powerup = "You drop your "+(data.hasBoobs?"tits":"chest")+" to the warm rock and present yourself. Your arms shift a little in their cuffs.";
			if (data.springsPowerup == "health") powerup = "You fish the cream from your health pack"+(data.springsBargedThrough?" in a panic and crush the little travel-sized tube in your palm (no time to get the lid off!!) sending a splurt of warm gel down your asscrack. Your hole and fingers twitch reflexively, both slowly tingling into numbness.":", de-capping it with sensual twists, then pinching its cute little bottom and milking out two fat puckerfuls.");
			append(powerup+"\n\n\""+(data.springsBargedThrough?"Acting slutty won't save you":"Cute ass")+",\" the futa purrs— and in a second she's upon you, claws dug firm into your upper shoulder. Her cock threads up between your asscheeks"+(powerup=="health"?", smearing the gel around, pushing a glob or two up your hole":", puking pre")+", and her steamy catbreath condensation-izes your neck-nape."+(data.springsBargedThrough?"\n\n\"You can leave any time you like.\" She hotdogs you with long, slow swings of the hips. \"But if you want to whore your way to the next level, I suggest you curb some of that cute enthusiasm and act like you hate it when I <!i>rape you as hard as I fucking can<!i>.\"":"\n\n\"If you're ready, I'll start phase one,\" she purrs in your ear."));
			addChoice((data.springsBargedThrough?"Act like a little bitch for her.":"Mhm... go ahead."), explore.bind("level1bossfight4"));
			addChoice("Puss out.", explore.bind("level1bossquit"));
		}

		if (seg == "level1bossfight4") {
			var choice = (data.springsBargedThrough?"Oh god, the callback...":"I... I did, ma'am, I can feel it in there. <3");
			var powerup = "back. Thank golly you warmed yourself up, because your ring strains at its absolute limit around the futa's girth, sending only a light twinge of pain through your gaped assmeat despite the "+(data.springsBargedThrough?"violence and ":"")+"depth of that initial thrust and the "+(data.springsBargedThrough?"downright viscious six inches which follow":"immediacy of the next")+". "+(data.springsBargedThrough?"You do as you were told and scream your lungs out like it really does hurt, clawing at the rock.\n\n\"That's it,\" she growls. \"Doesn't feel so fucking good when <!i>I<!i> barge through, does it cunt? Although my cock doesn't really <!i>barge<!i>, because your whore ass just lets me right inside.\"":"\n\n\"That's it,\" she purrs. \"Take it deep into your tummy. <3\"");

			if (data.springsPowerup == "bonds") {
				choice = (data.springsBargedThrough?"KYAAA-HRK-AAAAAAA-HRRRK-AAAAAA-YRK-AAaaa...":"I... I do. They say 'You never go ass to mouth,' but I'm an exception... <3");
				powerup = "bonds, slickening the cuffs with milk dribbles. She squishes your cheeks with a thumb and forefinger, peering at the resulting outpour of drool over your ring-gag with those slitted kitty peepers.\n\n\""+(data.springsBargedThrough?"What's this~? Wasn't enough for you to tie your hands up, you had to make sure your screams came out unmuffled for me too? <3 So sweet of you, slut.\"\n\nShe muffles them anyway, shoving four fingers down your helplessly open throat and simultaneously hilting the last six inches of her cock in your stomach despite firm resistance from some irrelevant things called internal organs. Your screams intersperse with cute little gags.":"Awww! You locked it open for me! You must want my dick in your mouth after I'm finished assfucking you, huh?\" She scoops up a fat glob of spit on your chin and tucks it neatly back beneath your tongue, grinding her fingertip around all slow, swirling it. \"Sure looks like you want it, anyway.\"");
			}

			if (data.springsPowerup == "health") {
				choice = (data.springsBargedThrough?"A-Ah, fuck! It hurts so good! <3":"D... Deeper. <3");
				powerup = "back. Rivulets of titmilk run the length of your spine til finally they hit the tip of your crack and soak into the sparkly numbing gel.\n\n\"Mmmmf.\" She stretches out a bit, enjoying the warmth of your insides as they twitch around her cock... until that goes numb too.\n\n\"Health pack, huh. Sorta ruins it"+(data.springsBargedThrough?". There's no way I'd buy it if you screamed and struggled now":" for me. Well, maybe if I go deep enough, I can at least give <!i>you<!i> a little pleasure")+"...\"\n\nShe thinks for a moment"+(data.springsCatPreggo?", rubbing her pregnant belly thoughtfully.":".")+" \"Welp... it's still gotta be challenging, or else it isn't a boss battle, so... I'll just have to <!i>"+(data.springsBargedThrough?"rape":"fuck")+"<!i> you—\" suddenly she rams three inches of slimy, gel-lubed cock up your traumatized pucker and a couple organs shift inside you—\"so <!i>deep<!i>—\" two more inches, and the inner entrance to your stomach slips open— \"that you feel my <!i>cock<!i> in your <!i>stomach.<!i>\"\n\nShe forces in a half-inch for those two last emphasized words and slumps down with relief, tightly clenched nuts pulsing hard against "+pickByGenitals("your own", "your pussy", "your own")+". "+(data.springsCatPreggo?"Your belly, much like her fat preggo one, now sags against the stone, filled and rounded nicely":"Your belly now bulges fat and shiny, packed full")+" with all that kitty cock.";
			}

			append("\n\nAbout a foot of cock bursts up your ass in two seconds. A pair of furry tits squish against your "+powerup+"\n\nThe throb of her heartbeat through the veins on her cock is almost enough to break you twice every second: <!i>bum-bump<!i>.");
			addChoice(choice, explore.bind("level1bossfight5"));
			addChoice("Puss out.", explore.bind("level1bossquit"));
		}

		if (seg == "level1bossfight5") {
			var powerup1 = "\"Mmmm...\"\n\nYour hole is so loose and abused by now that every time her cock pulls out a portion of your inner buttflesh comes with it, a lil pink ring sliding along her shaft which tingles when exposed to the cool high-altitude air~";
			var powerup2 = "curls three fingers in beside her cock, ruining your pucker even more and securing a tight grip on your asshole";
			var choice = "What's wrong? Speed it up a little, huh?~";

			if (data.springsPowerup == "bonds") {
				powerup1 = (data.springsBargedThrough?"She fingerfucks your throat open, pulling her digits up, down, left, right, gaping your face omnidirectionally, all while railing the fuck out of your butt. \"Don't stop screaming, bitch~!\" she coos, like one might say \"Happy birthday, Timmy~!\" and unplugs her fingers. Their bridges are laced with thick strands of your saliva. Cute droplets of throatgoo even hang from the tips.":"\"Can't understand you. You've got a ring gag on. Ah, but don't worry— I'll clean my cock off in your mouth anyway~!\"");
				powerup2 = "grips your milk-spattered cuffs";
				if (!data.springsBargedThrough) choice = "Mmm... time's running out, huh? Might as well switch to my mouth while you still can.";
			}

			if (data.springsPowerup == "health") {
				powerup1 = (data.springsBargedThrough?"She bounces her cock off your stomach lining over and over and over and over and over, nuts thwapping around, claws still sunken deep in your shoulders. \"It does hurt, doesn't it?\" she muses, pressing on your abused stomach to tighten it up a little for her cock.":"\"You got it, bitch.\"\n\nShe wraps both paws around your throat to yank you back as far as you can possibly go, your assmeat squashed up into her hips. With a few tactful wiggles, her cockhead pops through some inner wall of yours and slips right up the bottom of your esophagus. \"Mmmmfff,\" she groans— purely from the psychological pleasure of having her cock lodged so deeply inside someone's body, since she must still be numb.\n\nShe hisses in your ear: \"I'm in the bottom of your throat, aren't I? You feel me throbbing in there? You like it?\"\n\nShe grins. \"You hate all this dirty talk? You don't? Either way, I win... you hate it and leave, I win. You love it and cum, I win. Personally, I find it really annoying, so I'm in no danger of cumming... fucking dirty slut. Ya little cumguzzling fuckrag. You were born to get fucked this deep, y'know that? Your entire life purpose is to get reverse throatfucked, bitchslut. You're just a walking, talking cuntmuffin deluxe.\"\n\nShe has to stop herself from cracking up. \"Now— pftch— now, uh, wiggle that fat ass back a little futher on my dick, cuntmuffin... that's it... disgusting lil bimbo baggins...\" She grabs you by both hips and yanks your ass back further even though she's already hilted. There's something really hot about getting roughed around like this purely so she can fit a tiny quarter-inch more up your throat~\n\nFinally she backs out, letting her flared cockhead <!i>schpwip<!i> back into your stomach. \"Alright, I do actually want to fuck you though. Ready set go.\"");
				powerup2 = "grabs you by your hair";
				if (!data.springsBargedThrough) choice = "If you're gonna cum, do it up my throat pls~";
			}
			append(powerup1+"\n\nThe futa "+powerup2+"— then, using that as leverage, she goes feral on your ass. Her tits swing wildly, throwing spirals of milk. Her growling maw spills spit over the back of your neck. With all the force she can muster she "+(data.springsBargedThrough?"rapes you so violently into the ground that your knees "+(data.hasBoobs?"and tits":"and chest")+" bruise up":"powerfucks your ass and tummy open so wide that you're sure if you ate a sandwich after this it would just fall right out of your butt")+".\n\nAnd then, er... she uh... she starts easing up.\n\nShe's blushing, panting. Her body flirts with orgasm.\n\nShe's pretending like your ass isn't all that and a bag of potato chips, but really, she's discovered it very much is. Her dick pulses powerfully inside you every time she hits the edge of an orgasm and forces herself to avoid it.");
			addChoice(choice, explore.bind("level1bossfight6"));
			addChoice("Puss out.", explore.bind("level1bossquit2"));
		}

		if (seg == "level1bossquit2") {
			append("\"Oh, oh-ho-ho!\" she boasts, knees wobbling, barely able to contain her cum. \"Another one falls b-before my might!\"");
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1bossfight6") {
			var powerup = "She thrusts in one last time, cockhead running over the smooth lining of your stomach, bulging you out. Your completely destroyed hole twitches around her base, massaging it in a pointless attempt to tighten up. She lets those twitches bring her to orgasm, unmoving.\n\nEight fat ropes of "+(isActive("Mood Ring")?getMood():"")+"cum gush directly into your cockholster of a stomach, quickly overflowing it and shooting out around her shaft, running in fat globs over her nuts and spattering her interior thighs. She shivers and holds still. You can only assume she's being merciful and giving you a bit of a break by not pounding the fuck out of your ass in time with each spurt of cum.\n\n\"HHhhhhhhhaaaaaaahhhhhhhhhhh.........\"";
			var closer = "\"Fuck... couldn't even make it to phase two... you woulda lost if you'd seen my <!b>final form<!b>...\"\n\nThe door to level two swings wide, revealing an ornate staircase carved into the rock";
			if (data.springsCatPreggo) {
				closer = "Her belly, however, is only getting bigger. Her innie becomes a fat, puffy outie.\n\n\"Nnnrhhhh...\" She clutches it. Her asscheeks clench. \"Go on to level— urk— two...\"\n\nThe door swings open and her legs swing closed, thighs grinding together over her slippery, soft cock, as if she's trying to hold in a mean piss";
				addChoice("You should give birth on my face pls.", explore.bind("level1bossfightbirth"), {kinks: ["Baby"]});
			}

			if (data.springsPowerup == "bonds"&& !data.springsBargedThrough) {
				powerup = "She <!i>schpops<!i> out of your ass and takes a knee in front of your ring-gagged mouth.\n\nHer cock stares you in the face, dripping with "+(isActive("Candy Ring")?"delicious cake":"shitstains")+". A little piece even got stuck in her slit, you notice.\n\nAfter a small break (to ensure she has time to fuck your face a bit first, you deduce) she starts jacking off in your face, smearing all that coaglatory mess around, digging out the wet chunks stuck beneath her hood with a pinky finger before wiping it clean on your tongue. \"Just now realized what you said earlier,\" she says. \"An exception, huh? "+(isActive("Candy Ring")?"More like a narcissist. You love the taste of your own cake, don'tcha?":"More like a greedy fuckin toilet")+".\"\n\nShe grabs you by the back of your head and crams her fat head down your throat in a single push. You gag hard, all that bulbous cockmeat crushing your uvula flat, and get to work sucking "+(isActive("Candy Ring")?"confection":"your own filthy assgrease up")+", globs getting caught in your throat or making you cough when they hit the wrong tube. She doesn't care. She just keeps pounding that slurping, slobbery mouth of yours, bouncing your skull against the meteoric ground—\n\nThen, with a piercing mewl, she forces in those last four inches of catcock and hilts in your esophagus. One hand— the one she used to jack off, coated with "+(isActive("Candy Ring")?"cake":"thick waste")+"— that hand holds you by your hair, and the other by your chin, keeping you firmly in place no matter how violently you writhe or gag.\n\n\"<!i>HYRNGH~!<!i>\"\n\nHer cock blasts cum into the pit of your stomach. You feel the whole journey of each rope from the tip of your tongue, down your neck, bulging it, and then that final <!i>splurt<!i> into the sea of jizz currently sloshing around your rearranged insides, mostly somewhere just above your groin.";

			}

			if (data.springsPowerup == "health" && !data.springsBargedThrough) {
				powerup = "She rams her cock back up to the bottom of your esophagus. Once more that actually somewhat comfortable feeling returns, sort of like that tightness in your throat when you eat too much food at once and need a drink~ You can still breathe and all, there's just this hot, throbbing pressure in your throat...\n\nThe first rope of cum violently derails that train of thought. It comes rushing up your throat, spilling out over your tongue, bursting in thick gooey strands from your nostrils. You double over, gagging, as she cranks into a vicious reverse throatfuck, growling with satisfaction and humping in time to each spurt, forcing you to puke up her cum in great tense heaves. Every time you think you'll be able to pull even just a wet, rattling breath through your clogged throat another rope gushes out, forcing it to ripple with contractions all over again.\n\nBy the end of it, both your lungs are spattered with her seed. You hang your head and wheeze out the last few strings. In your daze you reach down and give your throat a curious grope, massaging her head through your flesh— when she does pull back down to your not-very-cum-drenched belly (most of it went out your nose and mouth) it's almost a little sad to feel her bulge disappear beneath your fingertips.";
			}

			append("She folds over in defeat. Her sweaty forehead <!i>paps<!i> against the back of your neck.\n\n\"Fine,\" she tells the little space between your shoulder blades. \"You win.\"\n\n"+powerup+"\n\nShe pulls out, panting, and flops down right onto her fat ass. Her cock hangs half-hard in an arc, shiny, jizz-coated. Over the next ten seconds it shrinks back to a somewhat normal size.\n\n"+closer+".");
			addChoice("Enter level two.", explore.bind("leftlevel2"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1bossfightbirth") {
			append("\"What? Hrn— quit fuckin' with me—\"\n\nYou lay on your back and scoot up til your head cinches between her thighs. Above your wonder-filled eyes her meaty asshole twitches with contractions. A little pink babyjuice <!i>plips<!i> over your forehead.\n\nThe cat can't even glare at you past her constantly growing belly, nor can she reach down far enough to claw at you... Quintuplets, you realize, is quite a fucking lot of tuplets. She has no chance but to let her flaccid cock rest on your cheek, lay back, and let em rip like Beyblades.\n\nThe first Fuckmeat rockets out pussy-first, accelerated by the momentum of the other four crowded behind her. The esteemed level one boss throws a melty, girly squeal to the heavens— pure pleasure, no blood, no pain— and spreads her legs til they're parallel, flaccid cock spewing another, lesser round of "+(isActive("Mood Ring")?"exotically flavored ":"")+"cum over your body. The first baby kitten curls up on your tummy, sucking the amniotic buttfluid from her thumb... then adding two more fingers and deepthroating all of them. Y'know, classic newborn shenanigans.\n\nThe second and third babies gush out in a torrent of womblube, all landing in peculiarly sexy positions— one with her butt stuck up to the sky, the other with his legs spread and his tic-tac dick on full display for you while he gives you bedroom eyes, lashes gunked up with shiny pink goo.\n\nThe futa <!i>HRRRKSS<!i> and buckles forward over her now significantly smaller belly, forcing out a gush of chunky pink fluid over your face in the process. You barely have time to wipe yourself clean before she clutches her throat and gags out the warning:\n\n\"Too many at once,\" she croaks. \"C-Comin... comin out the wrong end...\"");
			addChoice("Like I said: On my face, please.", explore.bind("level1bossfightbirth2"), {kinks: ["Vomit"]});
			addChoice("Oh god. Go up to level two.", explore.bind("leftlevel2"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1bossfightbirth2") {
			append("<!i>HRRRRRRRRRRRKKKKKKGYYYYYURRRRRGHGHRUGHRGHRYGHRYGHRYGYHRHHhhhburp.<!i>\n\nFuck that sound was gross. Onomatopoeia does it no justice.\n\nThe bulge of two little legs begins, toesies wiggling on either side of her adam's apple. It slowly dawns on you that you're watching someone puke-birth a baby.\n\nShe heaves forward, her whole body breaking out in the sweats. The other baby plops from her ruined ass in the background and no one gives a shit. All eyes, yours and the newborns', they're all locked on her slowly bulging esophagus— then the toes appear in the very back of her throat, the little legs... and she can't... quite... continue.\n\nShe taps your shoulder desperately, pointing to your lips, her lips. Her face starts going blue. Nervous, unsure, you pull her jaws open and peek inside... the Fuckmeat's thighs are so thicc they're stuck in her throat, and you can barely make out the kid's massive cock where it's caught on her uvula. Clearly he inherited his mother's size.\n\nYou're gonna have to perform some hardcore midwifery here.");
			addChoice("Suck that baby outta there.", explore.bind("level1bossfightbirth3"));
			addChoice("Uh... just uh... just go on to level two...", explore.bind("level1bossfightbirthleave"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level1bossfightbirth3") {
			append("You slap a grip down on the back of her neck and reposition to a comfortable kneel, although the three babywhores aggressively flaunting their tiny cute assets around your legs constantly makes it more of a process than you thought. By the time you're all steady and ready-"+(data.fun % 10 == 0?"frederick":"freddy")+", the futa's almost passed out.\n\nDespite the fact that you're in a shitty toll booth surrounded by spectators, you start to feel a sorta private, romantic atmosphere between you and this cat's throatbaby. You take the little one's drippy toes past your lips with a slurp, tightening at the heels, tugging a little... oop... nope, that's a bit too tight... okay, instead, you start massaging the futa's throatflesh top-to-bottom, working it sorta like a tube of toothpaste.\n\nSlowly, gently, lovingly, while the futa spews gags longer than a giraffe deepthroating a streetlamp, you suck the baby boy's hips from her throat. His puffy belly and boytits come next. His cock flops out, rock-hard, and thwaps your nose.\n\n\"It's a boy!\" you say, except you don't really say that becuase you have a mouthful of Fuckmeat. Instead you <!i>ptoo<!i> him out with his siblings, who crowd around all happy and start sucking the throatgrease from his crotch.\n\nThe futa hacks up a little pink and thanks you for the caps and the boss fight and the midwifery...\n\n\"Truly,\" she mumbles, passing out: \"Truly the birdbrains were right. You could... you could be no other than the Galaxy Wizard.\"\n\nShe passes out.\n\nThe next challenger (a shy little golden retriever femboi) walks in, takes one look at the pile of five babies, the seemingly dead futa, and you, your mouth and face and "+(data.hasBoobs?"tits":"chest")+" stained seemingly with blood, and he nopes right the fuck out.");
			addChoice("Enter level two.", explore.bind("leftlevel2"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "leftlevel2") {
			setLocation("Level Two");
				if (!data.springsLeftLevelTwo) {
				data.springsLeftLevelTwo = true;
				var powerup = "You feel around your hole with a couple fingers to gauge the damage and dislodge a hot spume of cum in the process.\n\n<!i>Freshening up,<!i> you think to yourself";
				if (data.springsPowerup == "bonds") powerup = "Oh, shit. She didn't give you the key for these cuffs.\n\nYou guess you'll just have to walk around like this..";
				if (data.springsPowerup == "health") powerup = "The numbness is starting to wear off. Feeling returns to your devastated buttocks";
				append("Level two's pools are rarely clear; there are some that bubble red with blood and others nearly opaque with murky yellow piss, but nothing inbetween. Most every pool babbles down curved tunnels, too, lit by floating candles and moonrays peeking in through natural skylights, which gives the whole place a dim, intimate atmosphere.\n\n"+powerup+".");
				addChoice("Explore.", explore.bind("leftlevel2"), {kinks: ["Abuse", "Blood", "Hyper", "Piss", "Raunch"]});
				addChoice("Look around.", explore.bind("main"));
			} else {
				var kemp = "An otter";
				if (data.metKemp > 0) kemp = "Kemp the otter";
				if (data.metKemp > 1) kemp = "Kemp";

				var powerup1 = "you";
				var powerup2 = "on your face and rubs it in with the head of his uncut cock";
				if (data.springsPowerup == "bonds") {
					powerup1 = "your gagged-open mouth";
					powerup2 = "right into your ring-gagged maw, then, after forcing you to your knees, he follows it up by throatfucking you with his uncut cock, all that droopy oily foreskin sliding down the wrong tube a few times and dripping liquid cockmusk into your lungs";
				}

				if (data.springsExplore2.length == 0)
					data.springsExplore2 = ["Someone built a diving board up on level three. They do a quadruple corkscrew overswing slapdash mausficker flip-dive and fall headfirst through a skylight barely the width of their waist, dousing "+powerup1+" with a tidal wave of piss on impact.", "A couple skeevy unwashed rat dudes corner you at a tunnel's dead end.\n\nOne drags his claw slowly over "+pickByGenitals("the underside of your cock", "the lips of your cunt", "the lips of your cunt")+", leaving a film of warm grease in its wake. The other hocks a brown loogie "+powerup2+".", "You come across a twin set of bubbles in the dark yellow waters.\n\nYou wait for a bit.\n\n... Nothing happens.\n\nA little curious, you reach and prod around beneath...\n\nTwo sets of asscheeks jut from the rock, both with vicious vibrators lodged between them, the kind that writhes itself around in a full 360 every second or so and goes all like <!i>BRRR-BRRR-BRRR-BRRRRRRRRRRRR<!i>. You grope down lower, feeling the butts quiver, until your fingers hit stone... the rest of their bodies are probably set up in an underground chamber, slowly getting filled with piss, only for it to leak out of their moaning mouths and noses...\n\nProbably~", "You watch a nine-tailed fox submerge gracefully into a pool of blood and rose petals.", "You slip and tumble into a clear pool, hoping for a brief moment it might be water— but no, from the stink of it you can tell it's hot sweat and saliva. Three chubby panda girls soak at the other end, hands behind their heads, musky pits exposed.", "A hyper dude's grinding up on a nymph girl barely the size of his left nut. She bitches a little about how he always spends too long on foreplay and hastily works her teeny cunt over his slit. He grunts and humps forward, easing her open a little.\n\nStill not good enough. With a pissed-off growl she slams her hips back once, twice, thrice, quarce—\n\nOop. There it goes. The whole head pops inside her at once and busts her little cunt open. She purrs and melts in his arms, iridescent wings a-flutter, pussy trickling blood onto the cave floor. That's more fuckin like it, she says.", kemp+" bobs down the maw of a cave, his sweetgrass cigarette licking the wet walls with orange light.\n\nHe kicks off near the corner, panicked. The walls got a little too tight.", "The boss door looms before you.\n\nThis is gonna be a hard one, you can feel it."];
				var result:String = pickOne(data.springsExplore2);
				data.springsExplore2.remove(result);
				append(result);
				if (result == "The boss door looms before you.\n\nThis is gonna be a hard one, you can feel it.") {
					addChoice("Explore a bit more first.", explore.bind("leftlevel2"));
					if (data.springsLeftLevelThree) addChoice("Head to level three.", explore.bind("leftlevel3"), {kinks: ["Cub", "Vomit", "Scat", "Gore", "Snuff"]})
						else
						addChoice("Tackle the boss.", explore.bind("level2boss"), {kinks: ["Cub"], faCensor: true});
				} else {
					addChoice("Explore.", explore.bind("leftlevel2"));
				}
				addChoice("Look around.", explore.bind("main"));
			}
		}

		if (seg == "level2boss") {
			append("You push open the double-door and face the might of...\n\n... There's nothing here. It's just an empty cave with a couple piss and blood puddles on the floor.");
			addChoice("Examine piss puddles?", function () {
				data.springsBossPiss = true;
				explore("level2boss2");
			}, {kinks: ["Piss"]});
			addChoice("Examine blood puddles?", function () {
				data.springsBossPiss = false;
				explore("level2boss2");
			}, {kinks: ["Blood"]});
			addChoice("Get spooked and leave.", explore.bind("main"));
		}

		if (seg == "level2boss2") {
			append("You prod one of the bigger "+(data.springsBossPiss?"urine":"blood")+" pools with a toe. It's oddly firm, almost like jello.\n\nWait a second.\n\nYou stumble back just as a jet of "+(data.springsBossPiss?"yellow":"red")+" splurts up past your face, "+(data.springsPowerup == "bonds"?"barely able to keep your balance with your arms still cuffed behind your back, ":"")+"whirling confused at the ceiling to see what dropped and made that splash—\n\nOh no, nothing dropped. The jet hangs suspended in the air. It grows stubbly fingers at the end. The palm smacks down onto the ground and hauls the rest of the pool up into a definitive form:\n\nA cute little "+(data.springsBossPiss?"urine":"blood")+" elemental, currently "+(data.springsBossPiss?"smirking sluttily":"glaring")+" at you and wiggling his fat hips into shape. Between them sprouts a massive ten-incher which looks positively ridiculous on his "+(isActive("Pastel Ring")?"five":"ten")+"-year-old body.");
			addChoice((data.springsBossPiss?"Is it okay if I call you Peeboi?":"So are you basically like an incubus?"), explore.bind("level2boss3"));
			addChoice("Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2bossquit") {
			append("\"I-I didn't wanna fuck you anyway!\"\n\nHe melts back into a "+(data.springsBossPiss?"piss":"blood")+" puddle out of sheer embarrassment.");
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "level2boss3") {
			append("\"No,\" he burbles.\n\nYou both just sort of stand there. He realizes his cock is sticking out and hurriedly covers it with a drippy palm, blushing "+(data.springsBossPiss?"murky orange":"dark red with clots")+" and refusing to look at you.");
			addChoice("Well, are you gonna try and make me cum, or like...?", explore.bind("level2boss4"));
			addChoice("This is too hard. Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2boss4") {
			append("By way of response he rushes forward with a splash-sprint and slams a "+(data.springsBossPiss?"golden":"crimson")+" paw "+pickByGenitals("up against your cock, stroking it", "along the crease of your cunt", "along the crease of your cunt")+". \"Of course I am! I'm a boss! I was just... mentally preparing!\"\n\nHis free paw sloopitty slips around to your fucked-open asshole, twiddling the puffy outer ring. A few droplets of cum get absorbed into his curious fingers.\n\nDownstairs, now that both his paws are busy, you spot his gigantic cock standing at full mast, past his belly-button, the underside connected to his tight coin purse by a few "+(data.springsBossPiss?"pee-streams":"coagulated strings of blood")+".\n\nHe stands on his tippy toes for a smooch (you crane down to help him) and when his lips meet yours a "+(data.springsBossPiss?"bitter, musky":"coppery")+" flavor splurts into your mouth. His "+(data.springsBossPiss?"expression":"glare")+" goes lusty and half-lidded at the sight of you so readily tasting him...");
			addChoice("Swallow.", explore.bind("level2boss5"));
			addChoice("Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2boss5") {
			append("You take a huge, deep gulp of "+(data.springsBossPiss?"Peeboi's face":"blood")+".\n\nHe pulls off, gasping, cock twitching and crowned with a bead of "+(data.springsBossPiss?"pee-":"pink ")+"pre. \"A-Ah! Jeez! Don't suck my face up!\"\n\n... And yet he kisses you again, voluntarily pouring a little more of himself down your throat. His already tiny, curvy little body gets a little tighter around the waist as mass leaves it.\n\nIn the meantime his "+pickByGenitals("handjob turns into a fingerfuck", "fingerfuck gets a little more adventurous", "fingerfuck gets a little more adventurous")+". A thin tendril of "+(data.springsBossPiss?"piss":"blood")+" wriggles way "+pickByGenitals("down your urethra. You watch your shaft bulge from top to bottom, slowly gaping you in a hole you so often forget you have. It feels a little alien, so-wrong-its-right— but you start to get the idea that you really <!i>deserve<!i> to get fucked in this special hole of yours...~\n\nSoon his digit reaches the bottom, and then it just keeps pushing and pushing, opening up some hidden pussy deep inside you", "way way up your cunt. He pants as you clench your puss around his digit and suck it up deeper inside yourself, til he's almost prodding at the entrance to your womb", "way way up your cunt while another one tackles both of your urethras. You watch your shaft bulge from top to bottom, slowly gaping you in a hole you so often forget you have. It feels a little alien, so-wrong-its-right— but you start to get the idea that you really <!i>deserve<!i> to get fucked in this special hole of yours...~\n\nSoon his digit reaches the bottom, and then it just keeps pushing and pushing, opening up some hidden pussy deep inside you. He lurches forward with a stifled squeak, causing the other finger to dribble right up to your womb")+".\n\nA few wisps of steam rise from your crotch as he works away. His cock twitches, pitifully neglected.");
			addChoice("Mmm. This is nice and all, but shouldn't you fuck me or something~?", explore.bind("level2boss6sub"));
			if (data.hasCock || data.hasBoth) addChoice("Bend over, "+(data.springsBossPiss?"Peeboi":"incubus")+".", explore.bind("level2boss6dom"));
			addChoice("Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2boss6dom") {
			append("\"Hey! I'm not a"+(data.springsBossPiss?" Peeboi":"n incublush")+"!\"\n\nHe pulls his finger from your cock, streeeetching it out til it finally pops free. Then he turns, shakily, and bends over to present his shiny little ass. A few "+(data.springsBossPiss?"globs of thick pee":"clots")+" roll down between his fat cub cheeks, pausing for a moment in the divot of his pucker.\n\n"+(data.springsPowerup == "bonds"?"You scooch forward, hotdogging him a little first... then you pull back":"You grab him by the hips, fingers sinking partly inside,")+" and ram your entire cock up his ass in one brutal thrust.");
			addChoice("Are you <!i>suuure<!i> you can handle this dick~?", explore.bind("level2boss6cum"));
			addChoice("Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2boss6sub") {
			append("\"Ah... yeah, you're right... I'm the big boss, I can handle that "+pickByGenitals("butt", "hole", "hole")+"...!\"\n\nHe pulls his finger from your slit and replaces it with the head of his massive cubcock. It takes some doing, since he's so squishy and bendy, but eventually the head slips inside your "+pickByGenitals("ruined ass", "puss", "puss")+" and the rest follows soon after with a long, squidgy <!i>smush<!i>. Since he can just morph his dick to fit around any obstacle, he ends up accidentally detouring through to your bladder, filling it to bursting with his hot "+(data.springsBossPiss?"piss":"blood")+". Your gaped urethra sears as "+(data.springsBossPiss?"someone else's pee":"thick red")+" bursts from it, spattering all onto (and into) his smooth flat chest~\n\nHe groans and shivers and nyas and purrs and tries to do almost every generic display of sexual pleasure at once, all while pulling his cock out and slamming it back in, and the result is almost epileptic.\n\nHe rests a paw on your lower tummy to steady his generic shiverings. \"That... that feel good, s-slut?\"");
			addChoice("You tell me, <!i>s-slut<!i>. How many challengers do you fuck on the hour, I wonder?", explore.bind("level2boss6sub2"));
			addChoice("Give up.", explore.bind("level2bossquit"));
		}

		if (seg == "level2boss6sub2") {
			append("\"N-NOT THAT MANY! JEEZ!\"\n\nHe goes for another thrust, barely able to contain his passionate squeaking now. You twitch your "+pickByGenitals("hole", "cunt", "cunt")+" around his base, milking it.");
			addChoice("Really~? You sure you aren't my sexy little cubslut "+(data.springsBossPiss?"Peeboi":"incubus")+"~?", explore.bind("level2boss6cum"));
		}

		if (seg == "level2boss6cum") {
			append("He cums on the spot with a howling, cock-flopping spasm.\n\n... Then he melts right back into a puddle, dripping off your body.\n\nWelp. "+(data.springsPowerup == "bonds"?"He didn't have the key to your cuffs either":"You aren't even close")+".");
			addChoice("Enter level three.", explore.bind("leftlevel3"), {kinks: ["Cub", "Scat", "Gore", "Snuff"]});
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "leftlevel3") {
			setLocation("Level Three");
			if (!data.springsLeftLevelThree) {
				data.springsLeftLevelThree = true;
				append("<!14px>You finally made it.\n\nWind blows harsh and rarefied, punching deep ripples through "+(isActive("Candy Ring")?"liquid bubblegum":"shitty")+" springwater.\n\nThe bouncy castle towers far in the center of the pool. Now you see its title and know its true nature:\n\n<!14px><!24px>V.I.P. BOUNCY FORTRESS<!24px>");
				addChoice("Explore.", explore.bind("leftlevel3"));
			} else {
				var bins = "a raccoon cub";
				if (data.metBins > 0) bins = "Bins the raccoon boi";

				if (data.springsExplore3.length == 0)
					data.springsExplore3 = ["A familiar hyena grandma lines her triplets up in the shallow end of a "+(isActive("Candy Ring")?"pink ":"shit")+"pool.\n\nAll three toddlers have their own special way to keep from drowning: the futa tod holds her breath for a full minute like grammy's natural-born cocksucker before popping up for a quick gasp now and then; the sissyboy flick-wristedly treads water, making a show of almost drowning; and the girl, from what you can tell, has something like a balloon animal rammed up her cunt which keeps her floating serenely.\n\nOne by one Grandma dunks their cute little faces, holding them under the "+(isActive("Candy Ring")?"bubblegum":"chunky")+" ripples for ten seconds, twenty...\n\nShe waits til each starts panicking. Only then she parts their thighs, tucks her cock up behind, and hotdogs their thrashing asses. Then she waits a little more.\n\nAh! The rush of "+(isActive("Candy Ring")?"":"shit")+"bubbles after they go limp! That's the cue to pull em up. She "+(isActive("Candy Ring")?"gives them each a tender pink kiss":"fucks a fat slopload of shit from their tiny assholes")+" while they gasp and gag and regurgitate water, then asks them nicely, sweetly, as if they weren't currently begging for her to stop crushing their lungs with her cock so they can get just one good breath in— she asks them if they want her cock down their throats.\n\nAnd of course they all beg yes, please yes grammy~ <3", "The rush of hot liquid pulls you over with all them sexy trickles; it's a "+(isActive("Candy Ring")?"fuschia":"brown")+" whirlpool drilling down into the meteorite, waters bobbing with adults and teens and cubs, men and women and futas, slender and chubby, "+(isActive("Candy Ring")?"playing and relaxing":"shitting and pissing")+", dead and alive, each chugging "+(isActive("Candy Ring")?"bubblegum":"the shit they swim in")+".", "You spot the silhouette of a woman in a cave. Moonlight plays around the contours of her tits and stomach without touching either. \n\n"+(isActive("Candy Ring")?"She blows a slow, five-minute bubblegum bubble. The outlines of her muscles tighten.\n\nThen it pops, echoing off the rock walls":"From her maw dangles the shadow of a fat, drooping shitlog")+".", "You pass by "+bins+" doing a blissful backstroke"+(isActive("Candy Ring")?"through the bubblegum":", maw held open and slurping up hot mouthfuls of diarrhea")+"~", "A couple carnivore families got together on the shore of the pool. They brought portable BBQ's and moon-tan lotion and big rubber floaties, which are currently bobbing around empty on the water.\n\nThis is because the parents have corraled their kids up on the picnic blanket, gathered around the warm glow of BBQ in the night. Each cub sits naked on their heels, cocklet/pusslet totally exposed so Mommy can slather lotion over it while Daddy grabs the back of their little skulls and force-feeds them greasy, dripping-hot burgers.\n\n\"Open the fuck up, Timmy~\" one father says, gut-punching his fussy son.\n\nTimmy opens the fuck up.", "Your foot strikes something soft and bouyant.\n\nIt's a bouncy bridge to the bouncy fortress.", "Two massive feral dragons fight on the peak of a distant crater, claws flashing through the night, flames licking their muscular haunches, their deep, ancient voices going all like <!i>NYEERRRRHHHHHH!!!<!i>", "Mommy stomps the fuck outta her cub's butthole on the sidelines, opening it up a little more every time the kid clenches bodily and throws out a pathetic squeal.\n\nShe stops for a second, peeks down to check.\n\nNope. Still not gaped enough to fit her three-foot cock. Back at it, then...", "A toddler hummingbird spots you. She was preening herself, so her beek hangs open just above the crease where her inner thigh meets her torso, agawk.\n\nShe flutters up with insectile speed and starts a lapdance without asking.\n\nHer tiny bird puss "+pickByGenitals("pops past your cockhead, which for her size is equivalent to a balls-deep cuntfuck", "smears oil and loose feathers over your own", "pops past your cockhead, which for her size is equivalent to a balls-deep cuntfuck")+", and her tailfeathers <!i>fwip fwip<!i> against your belly.", "A pack of "+(isActive("Pastel Ring")?"two":"six")+"-year-old faglets gasp raggedly on their hike up from summer camp.\n\n\"Almost to the fortress, boys,\" says their leader, a gazelle teen with a backpack full of dumbbells and two more in his hands. \"Let's stop for a little breather and work off some stress, kay fags?\"\n\nThe boys all wheeze and nod, flopping down on their butts.\n\n\"I <!i>said<!i>...\" He slowly curls a bicep. \"... let's work off some <!i>stress<!i>.\"\n\nEven the chubbiest boy, a panda, really isn't in bad shape— none of them are, they're all just a little plump with youth, fish-lipped, girly-hipped. Still, the gazelle picks on him: \"You've been lagging behind all hike, ya fat fuck. Get up and present.\"\n\nThe pandaboi hauls himself up obediently and presents his body for stress relief. The boys must've already gone swimming; a film of "+(isActive("Candy Ring")?"pink":"brown")+" drips from his fur and the tip of his flaccid cubdick. Both paws slide down his thighs.\n\nHe bends over. He whimpers. \n\n\"How old are you, fag?\" asks the gazelle, casually wiggling one end of a 25-pound dumbbell up the dumb boy's bell-end. Blood spurts out and freckles the other cub faces. They quickly lick themselves clean. The panda doesn't even flinch.\n\n\"Hrrrn.... hahh... "+(isActive("Pastel Ring")?"two":"six")+"...\" he chokes, still just trying to catch his breath.\n\n\"Ahhh, that's old enough to survive a couple blows to the head, right?\"\n\n\"N-No...\"\n\n\"No? What, you're telling me you got a soft skull to go with your thighs, your throat, your assmeat, and that soft little clit between your legs?\"\n\nThe panda squeaks the affirmative, automatically pushing his ass back until the opposite bulge of the dumbbell pops inside.\n\n\"Wow,\" the gazelle purrs. He runs a hand through the faglet's pretty, did-up hair, fingers stretching over his skull and squeezing. \"I can almost feel your tiny brain throb inside at the thought of it~! Just <!i>one<!i> good swing, huh? Welp—\"\n\nWithout any further warning he whips another dumbbell from his bag and brings it down on the panda boy's cute little skull, <!i>crack<!i>ing it open first try, sending the kid sprawling with frantic spasms to the pool's edge. The gazelle whistles a sexy jaunting tune and strolls after him. Then he kneels, working his fat uncut cockhead into the wound, slowly and deeply fucking the "+(isActive("Pastel Ring")?"two":"six")+"-year-old's warm brainpussy open. Steaming globs of pink smush out into his pubic hair, dripping in chunks over his nutsack.\n\n\"Thaaat's a good girl,\" he purrs, coaxing the respawned panda out from behind a rock. \"Now come here and clean off my cock... yes, with your mouth... no, I'm not going to stop skullfucking your corpse... yes, I want you to suck up the mess that spilled already... god, you really are brain damaged.\""];

				var result:String = pickOne(data.springsExplore3);
				data.springsExplore3.remove(result);
				append(result);

				if (result == "Your foot strikes something soft and bouyant.\n\nIt's a bouncy bridge to the bouncy fortress.") {
					addChoice("Explore a bit more first.", explore.bind("leftlevel3"));
					addChoice((data.bouncyMareiIntroDone?"Enter":"Examine")+" bouncy fortress.", explore.bind("bouncyintro"));
				} else {
					addChoice("Explore.", explore.bind("leftlevel3"));
				}
			}

			
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "bouncyintro") {
			if (!data.bouncyIntroDone) {
				setLocation("Bouncy Fortress");
				data.bouncyIntroDone = true;
				append("You catch the glint of a Pastel Ring earring disappearing into the fortress.\n\nJust as you start to follow, the door slams shut with a soft <!i>fwump<!i> and locks via card reader.");
				addChoice("Follow.", explore.bind("bouncyhub"), {req: ["VIP Pass", 1]});
			} else if (data.bouncyMareiIntroDone) {
				explore("bouncyhub");
			} else {
				append("You roll up to the bouncy fortress.");
				addChoice("Enter.", explore.bind("bouncyhub"), {req: ["VIP Pass", 1]});
			}
			addChoice("Explore a bit more instead.", explore.bind("leftlevel3"));
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "bouncyhub") {
			append("You swipe your VIP pass and enter the bouncy castle. You mean bouncy fortress.\n\nIt's soft and glimmery in here. White moonlight filters through three storeys of nylon and washes everything dark rainbow. Waist-high nymphlets saunter and lounge, naked bodies aglow, some butlering, others stripping on bouncy stages, a few getting fucked into floppy-tongue lunacy in the middle of the room while everyone watches. There are holes in the ceiling for them and anyone else with wings.\n\n");
			if (!data.bouncyMareiIntroDone) {
				data.bouncyMareiIntroDone = true;
				append("The earring wearer slips into a wall-vagina passageway smeared with sweat and "+(isActive("Candy Ring")?"sugar":"grime")+". It's marked <!i><!b>~BATHROOM~<!b><!i> in big fun letters.\n\n");
				addChoice("Follow.", explore.bind("bouncybath"), {kinks: ["Cub", "Male", "Male", "Male", "Raunch", "Scat"]});
			} else {
				append("There's a vaginal passage marked <!i><!b>~BATHROOM~<!b><!i> in big fun letters.\n\n");
				addChoice("Enter the ~BATHROOM~.", explore.bind("bouncybath"), {kinks: ["Patreon Commission"]});
			}
			addChoice("Look around.", explore.bind("main"));
		}

		if (seg == "bouncybath") {
			append("The \"stalls\" are just more slits in the bouncy walls, except these ones are drenched with "+(isActive("Candy Ring")?"caramel-colored cookie batter":"shit")+". Anybody slipping in or out gets their fur re-colored.\n\nMost don't seem to mind. A few even keep their maws open while they plunge through face-first, like they're catching snowflakes instead of "+(isActive("Candy Ring")?"cookie goop":"coagulated assgrease")+".");

			if (!data.bouncyRatBoyDone) addChoice("Stall 1.", explore.bind("ratboy"), {kinks: ["Cub", "Male", "Male", "Raunch", "Scat"]});
			if (!data.bouncyMareiDone) {
				append("\n\nThe earring-wearer (a cat?) disappears into the farthest stall, which also happens to be the "+(isActive("Candy Ring")?"yummiest":"dirtiest")+". Graffiti above says <!i>TWOFER IN STALL 2!<!i>");
				addChoice("Peek into Stall 2.", explore.bind("bouncymarei"), {kinks: ["Toddler", "Scat", "Abuse", "Gore", "Snuff"]});
			}
			if (!data.bouncyDeadGodDone) addChoice("Stall 3.", explore.bind("deadgod"), {kinks: ["Toddler", "Raunch", "Abuse"]});
			addChoice("Back.", explore.bind("bouncyhub"));
		}

		if (seg == "bouncymarei") {
			data.knownAsPlayer++;
			data.bouncyMareiDone = true;
			unlockJournal("Stall 2");
			append("You peel open the "+(isActive("Candy Ring")?"sweet-slimy":"filth-crusted")+" passageway.\n\n"+(data.metMarei > 0?"It's Marei, stretching his slender feline body":"The cat does a couple squats, sticking out his fat girly ass")+", clearly limbering up for some strenuous work.\n\nA pair of three-year-old wolf boys sit against the wall opposite, each buried up to their little butts in "+(isActive("Candy Ring")?"cookie batter":"shit and gore")+" and piles of their own mutilated corpses. The leftmost winks sluttily at the cat while the other blushes and hides behind a rotting tummy. You realize they're twins, which makes it even cuter when they start jerking each other's cocklets off in perfect sync at the sight of "+(data.metMarei > 0?"Marei":"the toned cat before them")+".\n\n\"What are you gonna do to us, mister~?\" the leftmost toddler asks, his tiny dick throbbing either from imagining the potential answers to that question or just from the babyish way he asked it.\n\n"+(data.metMarei > 0?"Marei":"The cat")+" chuckles, picking him up and cradling him. He cranes down to plant a soft, slobbery little kiss on the cub's mouth, and whispers: \"What do you think I'm gonna do to you, hun~?\"\n\n\"Nnnnn...\" The rightmost is jealous.\n\n"+(data.metMarei > 0?"Marei":"The cat")+" turns and winks at you sideways. \"Maybe the player watching us has some ideas...?\"\n\n");
			addChoice("Slip inside.", explore.bind("bouncymarei2"));
			addChoice("Nope sorry gotta go.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei2") {
			data.metMarei++;
			append("You squeeze through the wall vagina and pop out on the other side with a fine film of "+(isActive("Candy Ring")?"batter":"shit")+" on your body. The twins— Left and Right— go wide-eyed.\n\n");
			if (data.campTripIntro)
				append("\"Hi again.\"")
				else 
				append("\"I'm Marei,\" the cat meows. \"Overjoyed to meet you, of course. But I'm sure you've got introduction fatigue by now, so... let's skip to the fun part.\"");

			addChoice((data.campTripIntro?"Yes, fancy... (Peer at the mess-splattered inflatable architecture.)":"Let's."), function () {
				data.bouncyMareiPlot = false;
				explore("bouncymarei3");
			});

			addChoice("Didn't we go camping together?", function () {
				data.bouncyMareiPlot = true;
				explore("bouncymarei3");
			}, {enabled: data.knownMareiGlitch, kinks: ["Plot"]});

			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei3") {
			append((data.bouncyMareiPlot?"\"We were about to. Then I nonlocalized.\"\n\n":"")+"Marei spits in Left's face. \"I asked you a question, fuckstain.\"\n\n\"A-Ah!\" Left squeaks, grinding his chubby thighs together, eyes locked to Marei's fangs. \"What do I... think you're gonna do to me?\"\n\n\"Mhm.\"\n\n\"R-Rape me?\" he purrs, spreading his legs a little.\n\nMarei slaps him hard enough to knock some saliva from his drooling maw. That Pastel Ring earring jangles. \"Come on. At least try. Do I really seem that vanilla to you?\"\n\n\"Hyaaaa!!! You're— You're gonna hurt me—?\"\n\nMarei gutpunches the little toddlercunt, winding him. \"I asked you what you think I'm <!i>gonna<!i> do, not what I'm <!i>doing<!i>...\"\n\nThe wolf wheezes one last guess, his slapped cheek swelling up red, his well-raped, "+(isActive("Candy Ring")?"batter-smeared":"fear-shitting")+" pucker all a-quiver with the strain. Somehow he manages to force out one whole word: \"MMmm... MMmmmmurrrrr.... durrrr...\"\n\n\"That's right, honey!\" Marei chirps, whipping out a dull knife from nowhere. \"I'm gonna murder you~!\"\n\nThat's the last straw. Over in the corner Right bursts into tears, whining about how he never ever gets murderfucked and it's not fair and he's just as big a slut as his brother and everyone thinks he can't handle it but he can!!!\n\nHis brother couldn't give less of a shit; Left is entirely enraptured in that knife, checking out his own slutty reflection on the flat side.\n\nRight flashes you two teary puppy eyes...");
			addChoice((data.bouncyMareiPlot?"\"Nonlocalized?\" Is that what you call disappearing and then fucking with the truck radio?\n(Stomp that lonely fuckrag's face in. <3)":"Awww... stomp that lonely fuckrag's face in. <3"), explore.bind("bouncymarei4"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei4") {
			var action = "Shit in Right's maw.";
			if (isActive("Candy Ring")) action = "Expel some batter into Right's maw.";

			append((data.bouncyMareiPlot?"\"You can blame the scientific jargon on Lana.\"\n\n":"")+"You waltz over and kick Right in his sobbing maw, popping a couple teeth free and accordionizing his snout. Desperate to prove himself, he throws his legs open and releases a sexy little blood-gargly moan that floats up to the ceiling and evaporates.\n\nMarei turns his attention back to his own squirmy piece of meat. \"Lift your chin. Show me that throat.\"\n\nLeft obeys, shivering as he exposes his jugular. Marei brings the edge of the knife down to rest on the bulge of his esophagus, pricking it just enough to draw a single bead of red from his fur. \"How many dicks has this throat taken?\"\n\n\"Fff... fffifty...\"\n\nMarei drags the knife-tip slowly and gently down, into the soft cup of his collarbone, over his heart, drawing a shallow red line. \"Bullshit.\"\n\nLeft squeaks and panics. \"A-Ah! Okay! Okay! Only fifty <!i>today<!i>... o-overall, I think more like... f-fifty thousand?\"\n\nThe knife slips back up to his throat and at once he calms. You realize he wasn't panicking because of the cut, but because his decapitation seemed less imminent for a moment. \"Still sounds like a low estimate,\" Marei purrs, starting to saw ever-so-gently into his throatflesh, \"But I'll take it.\"\n\nHis barbed catcock surges erect at the splurt of blood and Left's relieved gasp. \"Now... does the little cockslut want me to rape his corpse's decapitated throat?\"\n\nThe reply is just a <!i>hrrrrkkkk<!i> and a pale smile.");
			addChoice((data.bouncyMareiPlot?"Lana? ("+action+")":action), explore.bind("bouncymarei5"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei5") {
			append((data.bouncyMareiPlot?"\"Mhm. I learned it from him. Even after dragging his broken body up the shore through snagweed and bramblesnatches to find where I'd disappeared to, and even after sitting for an hour in the dirt trying to get my blinders off with those gimped paws— and even as his fingers glitched and bled, he forced himself to claw 'NONLOCALIZED' and its definition in the dirt between us. And then he smiled at me. I remember wiping my tear tracks away and hugging the little fucker til I popped back out of existence.\"\n\nMarei sticks his tongue out at Right, who seems really confused about all that and a little impatient for more abuse. \"Anyway,\" he goes on, sawing happily at Left's throat, \"<!i>nonlocalized<!i> might be jargon, but just having that word in the first few hours after the shipwreck, something to describe what was happening to my body and sort of dampen the fear— it meant a lot to me. So I use it.\"\n\n":"")+"You break the trance, turn, and offer Right your adult-sized ass, so big by comparison that your donut (reflected in both of his wide, wonder-filled eyes) seems like it could fit all the way around his face. Merely showing off is enough encouragement; he scrambles to his feet and shoves his broken snout up your ass, squeaking with pain and yet plunging deeper, his teeny tongue "+(isActive("Candy Ring")?"painted bright with blood and batter":"loosening your shit up, pre-lubed with hot blood")+".\n\nYou push.\n\nHe gags so deep and long you can almost feel the sound waves rippling through your clenched assmeat. You reach back and hold his skull in place to keep the deluge from pushing it away, though half his snout still gets unplugged with the sheer force of your anal expulsion. "+(isActive("Candy Ring")?"Ropes of batter pour shiny and sensual over his pudgy toddlerchest":"Disgusting coils of shit-slop fall onto his toesies")+" while he puts up a pathetic effort to swallow the rest of it, his snout far too horizontally stunted to fit a proper mouthful anymore.\n\nThe sawing and the purring to your left was white noise til now: you only realize it was there once it stops.\n\nWith a <!i>crick<!i> Marei snaps Left's hacked-up neck and twists it til the last strings of flesh break too. One paw works his catcock up to max capacity while the other holds the kid's decapitated head up by the hair for his brother to see. Left's face is still frozen in ahegao.\n\nRight can barely make it out. His eyes are too clogged with "+(isActive("Candy Ring")?"cookie gunk":"your shit")+". But when he does, he moans like a little bitch into your asscrack and cums all over himself, squealing \"Me nexth! Me nexth!\"\n\nMarei laughs and ignores him, turning instead to smear his cockhead over Left's sexy, gaped-out neck stump. It even comes lubed with a film of "+(isActive("Candy Ring")?"batter":"shit")+" from all the previous customers. While pushing his cock in slowly and making a big show of how good it feels to rape a dead three-year-old's exposed esophagus, Marei whispers: \"Even your brother's corpse is a bigger slut than you~\" which doesn't make a whole lot of sense but still absolutely devastates Right.\n\nHe can't even pluck up the strength to gobble even one more "+(isActive("Candy Ring")?"glob of batter":"shitchunk")+". He hits the floor with a limp wail in complete destitution— and bounces a few times cutely.");
			addChoice("Brutal.", explore.bind("bouncymarei6"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei6") {
			data.knownCharacterImmortality++;
			append("Left respawns and pops through the door just in time to see Marei humping his corpse's belly fat with "+(isActive("Mood Ring")?"his "+getMood("Marei"):"")+"cum. His fingers jump right to his brand-new asshole and start working it back up to former glory. He starts with four, drawing blood like a good tortureslut, while his brother whines and tantrums like a sub-par tortureslut.\n\nLeft scurries forward, making to suck the gore from Marei's dick... when he spots his brother on the floor, sprawled out and sobbing past a mouthful of "+(isActive("Candy Ring")?"batter":"your putrid shit")+".\n\n\"What's wrong?\" Left asks, kneeling down next to him. \"Or... oops, are you trying to act like Rapemeat~?\"\n\n\"No! I'm... (sniff)... I'm... not even as slutty as your c-corpse...\"\n\n(Marei moans loud-mouthedly and squeezes out the last few "+(isActive("Mood Ring")?getMood("Marei"):"")+"cumsplurts into Left's corpse, grinning.)\n\nLeft shakes his head, caressing his brother's messy cheek. \"Oh, you... of course you're not as big a slut, you just started yesterday. Give it time.\"\n\nRight starts to protest but a "+(isActive("Candy Ring")?"batter-bubble":"shit-log")+" catches in his throat and he starts coughing, gagging, about to puke—\n\nThen his brother straddles him fully, swinging a pudgy leg around his hips, and leans down to lock his whiny little mouth shut with a kiss. Together they frot their tiny wolfcocks up together, knots slipping around in tight circles like two ball magnets, making the cutest gaggy wet noises as they pass mouthfuls of "+(isActive("Candy Ring")?"tasty batter":"buttmud")+" back and forth, forcing it so deeply into each other's maws that it splurts from their heavy-breathing nostrils.\n\nYou hang out with Marei for a bit, chatting, while their fierce incestuous makeout sesh drags on.");
			if (data.bouncyMareiPlot) addChoice("So, about all that shit you just said...", explore.bind("bouncymarei7"), {kinks: ["Plot"]}) else addChoice("How's the weather?", explore.bind("bouncymarei7"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei7") {
			append("\""+(data.bouncyMareiPlot?"Yeah?":"It's nice, you know... eternal night has its perks.")+"\"");
			if (data.bouncyMareiPlot) addChoice("How long ago did that happen?", explore.bind("bouncymarei8")) else addChoice("Nice.", explore.bind("bouncybath"));
		}

		if (seg == "bouncymarei8") {
			append("\"Oh, twenty-some years ago. I can hold my location down pretty well now. Except, like you noticed, I don't do so well with switching areas... well, the boys don't care. They always invite me camping anyway. Sometimes I can resist the abyss and stick around for mallows.\"\n\nHe leans in and whispers: \"To be honest? I think Snagg, Cage, all those beefy bros— they like to keep a femmy guy around. Y'know... evens things out. <3\"\n\nMarei slaps his big girly butt and slips away again, leaving the twins to their romance.");
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboy") {
			data.bouncyRatBoyDone = true;
			unlockJournal("Stall 1");
			append("You walk into a swirling "+(isActive("Candy Ring")?"rainbow typhoon":"shitstorm")+" of a bathroom. Through the "+(isActive("Candy Ring")?"mists":"fumes")+" you sense two figures look up.\n\nYou're interrupting... something. It's a cub and an adult, you think, and they're... well, it takes you a second to parse the situation...\n\nYou start at the bottom, discerning a plump-cheeked "+(isActive("Pastel Ring")?"eight":"ten")+"-year-old rat boy's face from the "+(isActive("Candy Ring")?"multicolor candy fuckmess":"four-inch layer of muck")+" coating him and the floor. He gurgles a clogged little greeting~\n\nThen his face reddens (either from shame or being upside down) as you run your eyes higher, over a belly packed with mysterious bulged lumps... he's on his back, hands tied together, legs tied apart, chub-butt stuck up vertically, which makes it a perfect seat for an adult boar's wide-set ass.\n\nWhat you first thought was a double-ended dildo between their puckers turns out to be "+(isActive("Candy Ring")?"an oversized Cyclone popsicle corkscrewing":"one shit log so wet and compact it looks like lubed brown plastic, gushing violently")+" from the boar's ass to the rat's, filling his already packed cubcolon past capacity.");

			if (isActive("Candy Ring")) {
				var s:MintSprite = addSprite("assets/img/effect/cyclone.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Iceco Ltd.", "Ribbed for your pleasure.");
				s.x = 600;
				s.y = 340;
			}
			addChoice("Watch.", explore.bind("ratboy2"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboy2") {
			append("The first few expired yellow cum-ropes burst from the boar's uncut dicktip and each finds its target in the boy's maw. With a grunt and a pot-belly gurgle he squeezes out "+(isActive("Candy Ring")?"the last few ridges of the popsicle":"one final fist-sized glob")+" and heaves himself off, his pucker now connected only by a few gleaming strands of "+(isActive("Candy Ring")?"melted Cyclone":"anal mucus")+" to the rat boy's horrendously ruined one.\n\nHe cleans his asscrack off on the boy's face, smearing his "+(isActive("Mood Ring")?getMood("Boars"):"")+"cum deep into the ratfur, then peaces out.\n\n... The rat's staring at you. He slowly sucks the "+(isActive("Candy Ring")?"popsicle ":"ass")+"juice from his cute buck teeth, as if getting his butt used as a toilet wasn't enough to get the message across that he's a total "+(isActive("Candy Ring")?"sugar":"shit")+"slut.");
			addChoice("Push on his stomach.", explore.bind("ratboypush"));
			addChoice("Eat him out.", explore.bind("ratboyeat"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboypush") {
			append("You drive the heel of your palm into his chubby belly and "+(isActive("Candy Ring")?"out slides seven glistening inches of popsicle":"behold a veritable geyser of shit, adult logs from multiple species rushing out two at a time, each lubed and softened by his buttery cubshit. By the end of it his little dick is completely coated")+". He squeals somewhere south of your taint and jiggles it around tantilizingly~");
			if (isActive("Candy Ring")) addChoice("Deepthroat the popsicle some random dude shit from his ass into this kid's ass.", explore.bind("ratboydeep")) else addChoice("Suck him clean.", explore.bind("ratboysuck"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboyeat") {
			append("You nuzzle your face into that tiny underaged asscrack, tasting a full range of flavors from "+(isActive("Candy Ring")?"popsicle to cake to skittles to nutella (does that count as candy even, you ask yourself?)":"muddy boar shit to grassy bovine shit to itty bitty rabbit pellets")+". Carefully, without breaking it, you wrap your lips around the "+(isActive("Candy Ring")?"Cyclone's uppermost ridges":"fresh turtlehead")+" and start nursing it, sucking gently.\n\nHe moans from below you, clearly struggling to keep from clenching his upset tummy and filling your mouth. His little paws work at your "+pickByGenitals("nuts", "clit", "nuts")+", his cocklet throbs against your chin... all while you passionately make out with his pucker, which is way too fat and swollen to look natural on a "+(isActive("Pastel Ring")?"eight":"ten")+"-year-old. Your mouth is now "+(isActive("Candy Ring")?"painted like a clown's":"dripping with sewage")+".");
			addChoice("Now make out with him~", explore.bind("ratboyend"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboydeep") {
			append("You grip the exposed 'sicle around the base with both hands like it's a cock. Fuck is it ever big up close.\n\nYou reassure yourself: yes, this is the plan, I am going to deepthroat a popsicle that some random dude shit from his ass into this kid's ass. Who has the right to judge you? This isn't a phase. This is who you are, mom.\n\nYou slam your mouth down on that assicle with renewed self-esteem, making the most disgusting slurpy-slorpy sounds you can muster, gobbling the ratling's asscandy hard enough to shatter it into tasty icebergs which sift afloat on the tide of melted sugarwater gushing from his prepubescent boypussy. Good grief!\n\nHe can barely anchor himself on your thighs. Your tsunami suction nearly dislodges the whole hard-earned candy hoard from his butt— he clenches his hole, what's left of the ribbed Cyclone thrusting back and forth past his ring and making a cute <!i>prrrrb prrrb prrrrrb<!i> noise like a wet sausage whipped across the slats of a picket fence.\n\nMmmm. Sausage. You're getting yourself worked up here.\n\nThe popsicle is pretty much melted by now, and the rat's a little mad at you. He was really enjoying the feeling of frigid fullness up his ass, you guess...\n\nYeah, alright, you sneak away. You end up feeling ashamed of yourself despite the pep talk earlier. Maybe it <!i>was<!i> wrong to suck his buttpop into pieces after he'd worked so hard to get it up there in the first place.");
			if (data.myntNarrative > 0) addChoice("This is who I am, Mynt.", explore.bind("bouncybath"));
			addChoice("What have I become.", explore.bind("bouncybath"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboysuck") {
			append("First order of business is to suck up the fattest shitchunk of them all, which happens to be balanced on the tip of his quivering dick. You chew, savor, swallow. Now the rest of it looks like it's wearing a thick brown sweater... you lollipop that little fucker, peeling off layers with long base-to-tip slobbers... and now, at last: those fat little "+(isActive("Pastel Ring")?"eight":"ten")+"-year-old cubnuts.\n\nThe little crevice between his sack and his taint is clogged with neglected waste, disgusting little fuckchunks, dried cum, diarrhea stains... all festered to perfection.\n\nYou run your tongue slowly around his sack. The fresh waste comes off easily, but you have to spend upwards of five minutes lapping and wriggling your tongue til, finally, the majority of the ancient grease pops off in one massive glob.\n\nChewing it takes just as long... it's just really gummy and crunchy. You look back over your shoulder to see him listening intently, mouth watering...");
			addChoice("Share the piece of utter filth and make out with him~", explore.bind("ratboyend"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "ratboyend") {
			append("You spin around and grab the ratling by the back of his head, bringing your mouth down to his. Then then you force "+(isActive("Candy Ring")?"your colorful tongue":"a mouthful of shit")+" all the way to the back of his throat and hold it there. He takes it well at first, sitting still, politely slurping. Then, bit-by-bit, he starts to lose control... he <!i>glrrrks<!i> and gags... he swings his sexy kiddycunt to (followed shortly by fro)...\n\nThen, with a rapturous ratsqueak, he breaks.\n\nYour tongue becomes a "+(isActive("Candy Ring")?"popsicle much like the one up his ass":"shit-coated cock")+" in his mind. His eyes roll back and his rat-tail whips against the inflatable floor as he grabs the back of <!i>your<!i> head and keeps you in place, viciously schlurp-schlorping every morsel of "+(isActive("Candy Ring")?"candy":"waste")+" he can pull from your mouth, running his tongue over, under, and adjacent to yours, panting "+(isActive("Candy Ring")?"candymuck":"musk fumes")+" into your mouth.\n\nJust as you pull away and break the last strand of "+(isActive("Candy Ring")?"rainbow":"brown")+" saliva, the boar returns with his lover. Their girth leaves no room for you in the bathroom, but, peeking through the door, you watch them both take up position at either end of the rat.\n\n"+(isActive("Candy Ring")?"It's dessert time. >:3":"Clearly, they're about to shit-roast the little toilet senseless."));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgod") {
			if (data.deadGodIntroDone) {
				append("The black cat toiletcub is still perfectly fresh, waiting for his first customer, toying idly with his swollen nuts...");
			} else {
				data.deadGodIntroDone = true;
				unlockJournal("Stall 3");
				append("You squeeze through the wall vagina.\n\nThe nylon in here has been painted a gleaming porcelain white. In place of a toilet kneels a three-year-old kitten, his naked body roped with silver stripes, knees denting the squishy floor, tuft-ended tail swaying right, left, right.\n\nHe's just starting his shift, so his black fur's still fresh and clean. Two guys lock his ankles down with blow-up straps and one more pops a ring gag two sizes too big past his lips— then they all take turns cockslapping the toilet-toddler, tonguefucking his tiny mouth, just generally getting those cute cheeks of his all blushy and flustered so he looks his best for the customers.\n\nThe last guy kicks him in the balls as a farewell on the way out, and the little champ hardly squeaks— even as his babynuts slowly swell to triple their original size.");
			}
			addChoice("Use the bathroom.", explore.bind("deadgod1"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgod1") {
			append("The toiletkitten sniffs the air as you approach, gauging your musk radius.\n\n\"Aaaiii~\" he sings past his ring-gag, probably meaning \"Haaiii~\"");
			addChoice("Piss on his face.", explore.bind("deadgodpiss"), {kinks: ["Piss"]});
			addChoice((isActive("Candy Ring")?"Drop a fat load of cheesecake":"Shit")+" on his face.", explore.bind("deadgodshit"), {kinks: ["Scat"]});
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodpiss") {
			data.bouncyDeadGodDone = true;
			append("You shuffle closer, closer. Your "+pickByGenitals("shaft throbs", "labia twitches", "shaft throbs")+" milimeters from his kittynose. His orange eyes search yours, innocent and curious. Clearly he isn't used to even a smidgeon of foreplay.\n\nYou grab two handfuls of earfur and wrench his face "+pickByGenitals("up against your cock, which is so girthy it almost totally eclipses his little face", "deep between your thighs, feeling the pleasant chill of air from his nose as he huffs your cuntstink", "up against your cock, which is so girthy it almost totally eclipses his little face")+". His tongue shoots out automatically (such a well-trained kit!) and laps over your "+pickByGenitals("hanging nuts", "folds", "hanging nuts")+".\n\nYou sigh, run a hand down the smooth fur on the back of his neck... and grip him by the scruff.\n\nHis eyes go half-lidded and the flush comes roaring back to his cheeks, radiating warmth against your "+pickByGenitals("cock", "cunt", "cock")+".\n\nYou don't <!i>need<!i> to hold him in place, of course... even if his cocklet and every other part of his underaged body <!i>wasn't<!i> trembling with the anticipation of a facial pressure-washing, his ankle bonds still would've done the job for you just as well— but it's clear from the soft whimpers in his throat, the grinding of his thighs over his bruised nutsack, and the sheer volume of pre slopping from his uncut cocktip that he appreciates being held in his proper place and forced to guzzle piss like the worthless three-year-old toilet he is.\n\nYou release a squirt, just enough to tease him. It dribbles into his held-open maw. His lashes twitch, brows arched needfully.");
			addChoice("Close your eyes.", explore.bind("deadgodpissclosed"));
			addChoice("Keep those pretty eyes open for me~", explore.bind("deadgodpissopen"), {kinks: ["Abuse"]});
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodpissopen") {
			append("He stares obediently at "+pickByGenitals("your slit", "your shimmery pink urethra", "your slit")+". You tighten the neck-grip and blast his eyes with hot piss, drawing out a long, high-pitched kitty howl. Still, he keeps them open for you. Piss floods over the mounds of his cockbeaten cheeks, hanging in fat drops above the openings of his nostrils, eventually coating his face and most of his chestfur... all those soft tufts, once clean, now droop matted with your rank urine.\n\nBy the time you're almost empty his eyes flutter, bloodshot, tear ducts overflowing with yellow, and his toddlercock throbs hard against his tummy.");
			addChoice("Finish on his cock.", explore.bind("deadgodpisscock"));
			addChoice("Finish up his nose.", explore.bind("deadgodpissnose"));
		}

		if (seg == "deadgodpissclosed") {
			append("He keeps them open just a crack. You guess he can't stand to look away from your glorious "+pickByGenitals("cock", "cunt", "cock")+"~\n\nYou let the tension in your groin melt. Your "+pickByGenitals("upright cock spews piss like a fountain which falls in foamy globs into the kitten's hair and clings to his ear-tips", "lips slip over his forehead, gushing foamy yellow", "upright cock spews piss like a fountain which falls in foamy globs into the kitten's hair and clings to his ear-tips")+", rivulets dancing over and between his pretty eyelashes.\n\nYou keep it going til you're almost dry, letting the majority of your piss slop down into his gagged-open maw. He gulps it down as fast as he can.");
			addChoice("Finish on his cock.", explore.bind("deadgodpisscock"));
			addChoice("Finish up his nose.", explore.bind("deadgodpissnose"));
		}

		if (seg == "deadgodpisscock") {
			Theme.addUiChoice("dead");
			append("You lower your hips and fit them around his little ones, grinding your leaky "+pickByGenitals("cock", "cunt", "cock")+" up against his "+pickByGenitals("much smaller one", "pre-leaky cock", "much smaller one")+". You use your scruff-hold to pull his soaked face "+(data.hasBoobs?"between your tits":"up against your chest")+", letting his deep purrs mingle with your heartbeat while you squeeze out those last few drops out over his quivering kiddydick~\n\nHe babbles thanks, eyes widening as you step aside to reveal a huge line...");
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodpissnose") {
			Theme.addUiChoice("dead");
			append("You cram "+pickByGenitals("your cockhead up to his tiny nostril", "his little snout up your slit", "your cockhead up to his tiny nostril")+" and squeeze"+pickByGenitals(" from the base of your cock to the tip", "", " from the base of your cock to the tip")+".\n\nHis paws leap up to scrabble pointlessly at your thighs, his sinuses overflow, and a muffled, gentle little trickle down the back of his throat corrupts his frantic moans into cute muffled blurbles~\n\nAfter an extended sigh you finally clench out the last few drops and unplug him. He reels back with a sneeze, spritzing your crotch yellow.\n\nThrough coughs and gags he thanks you for starting his shift off right. The first of a long line behind you slips past your left shoulder and takes his turn with the little fucklet...");
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshit") {
			data.bouncyDeadGodDone = true;
			append("You slam your ass down on the toddler's face, making his pudgy little body fold back at the knees. Under all that weight his head simply sinks into the soft inflatable floor.\n\nHis legs spread automatically, heels digging into his assmeat, and you think he might even be arching his back a little extra to stick that cute belly and cocklet out on full display for you...\n\nYou "+pickByGenitals("grind your cock and nuts over his flat chest", "clench your cheeks a couple times over his little snout", "grind your cock and nuts over his flat chest")+", shift to the left a bit... then... ah, there. Now you're sitting nice and snug on that panting, whimpering little toiletseat. With a grunt you push two "+(isActive("Candy Ring")?"cheesecake globs":"nodules of shit")+" out on the three-year-old's face— after making sure your pucker is directly above his snout, of course— and the resulting "+(isActive("Candy Ring")?"moan":"gag")+" is so strong you can feel it ripple throughout your asscheeks.\n\nHis paws jump up to your thighs. He yanks your hips down hard on his face, begging for more.");
			addChoice("Down his maw.", explore.bind("deadgodshitmaw"));
			addChoice("Up his nose.", explore.bind("deadgodshitnose"), {kinks: ["Abuse"]});
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitmaw") {
			append("You shift your ass down ultra-slow, "+(isActive("Candy Ring")?"cheesecake-y":"shitty")+" pucker peeling off his nose and into his mouth with a <!i>schloooOOOOOoopip~!<!i>\n\nHe finds that noise kinda funny. >w>\n\nYou silence those slutty kiddygiggles quick, clenching both asscheeks on either side of his pinned skull. Your stomach gurgles. A "+(isActive("Candy Ring")?"creamy frosting-fart":"violent splutter of liquid shit")+" coats the inside of his mouth, dampening his gasps and tightening his tiny nutsack right up. As you clench and "+(isActive("Candy Ring")?"drop a load of cheesecake":"force out a log of soft-serve shit several times bigger than his underaged mouth (thank god for that ring gag)")+" it only gets tighter and tighter— soon not even the fiercest gag-spasm can jiggle that tight sack, nor any other part of his admittedly pudgy body. Every curve on the kid save his "+(isActive("Candy Ring")?"cake":"shit")+"-bulged throat is tense and jiggleproof.\n\nAh, he's paralyzed with "+(isActive("Candy Ring")?"savory pleasure":"disgust")+", that's why~\n\nFinally, after a long, drawn-out pinch, you lift your ass off. His upper body springs back up without your girth to keep it folded anymore, flinging "+(isActive("Candy Ring")?"peachy-orange cheesecake morsels":"brown")+" across the bathroom. Your look down over your shoulder to inspect your asscrack: yup, as expected, he did a piss-poor job. It's "+(isActive("Candy Ring")?"coated top-to-bottom with smeared frosting":"utterly filthy, smeared with an inch of shit-sludge— half a log still hangs from your pucker, for fuck's sake")+".\n\nHe's not even trying to lick your ass clean, he's just scooping up the mess from <!i>his<!i> body and scarfing it down... Very poor customer service.");
			addChoice("Use his face as toilet paper.", explore.bind("deadgodshitface"));
			addChoice("Use his entire body as toilet paper.", explore.bind("deadgodshitbody"), {kinks: ["Abuse"]});
			addChoice("Use... toilet paper.", explore.bind("deadgodshitpaper"));
		}

		if (seg == "deadgodshitnose") {
			append("You think he expected you to move off his snout just then, either that or he took a huge snort of "+(isActive("Candy Ring")?"cheesecake":"near-liquid assmusk")+" on purpose. From the brutal, choking coughs, you guess it was the former.\n\nWithout even entertaining the thought of using the toiletbowl so handily gagged open for you two inches south, you let rip a "+(isActive("Candy Ring")?"load of cake fit for a wedding":"gargantuan blast of shit")+" up the little fucker's snout, wiggling a palm beneath his pinned skull and shoving it up, forcing him to muzzlefuck your ass. Over the back of your shoulder you watch his eyes go saucer-sized"+(isActive("Candy Ring")?"":", rivulets of brown diarrhea snaking up into their lashes")+".\n\nYou bounce happily on his little kitten snout, cheeks clapping against the rosy, "+(isActive("Candy Ring")?"frosted":"brown-streaked")+" ones on either side of his face. That's really hard for him to handle... his thighs clench and grind over his cocklet, making him look like a girl. His gags become nasally, gurgling howls. He even starts sneezing "+(isActive("Candy Ring")?"cheesecake":"shit")+" back up your asshole.\n\nYou give one last push and pull off, revealing an adorable blue-cheeked ahegao expression. All the innocence of a dizzy toddler "+(isActive("Candy Ring")?"meshing perfectly":"contrasting poignantly")+" with all the "+(isActive("Candy Ring")?"deliciousity of cheesecake straight from a stranger's ass":"obscenity of two mini shit-logs protruding from his nostrils")+".\n\n... Yeah, your ass is still a mess. Worst "+(isActive("Candy Ring")?"cakehole":"toilet")+" ever.");
			addChoice("Use his face as toilet paper.", explore.bind("deadgodshitface"));
			addChoice("Use his entire body as toilet paper.", explore.bind("deadgodshitbody"), {kinks: ["Abuse"]});
			addChoice("Use... toilet paper.", explore.bind("deadgodshitpaper"), {kinks:["Trash"]});
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitface") {
			Theme.addUiChoice("dead");
			append("You pluck a dainty square of TP (that is, you grab his little skull in one hand) and"+(isActive("Candy Ring")?"start":" rip one last wet fart in his face before")+" flick-wrist wiping with it, bringing the tip of his lil chin to the top of your crease and back down each micro-second. "+(isActive("Candy Ring")?"Cake":"Shit")+" flies off in globs. His purring gets all vibrational. His little maw sucks like a vaccuum head, all metallic and circular around the ring gag, slurping mouthful after mouthful of loose mess from your crack and even a bit more from your pucker, which he latches onto like a pacifier.\n\nYou only stop mopping after your ass is squeaky clean. Strings of saliva come off with his panting face while he spews thank-you after thank-you between deep breaths of fresh air... then he stops with one big breath after you step aside to reveal a huge line.");
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitbody") {
			Theme.addUiChoice("dead");
			append("You start at the top, naturally. First you draw little "+(isActive("Candy Ring")?"cream":"shit")+"-circles on his forehead with your pucker, globs of "+(isActive("Candy Ring")?"cake":"waste")+" running up into his pretty hair. Then you move down, squeezing the last "+(isActive("Candy Ring")?"treats":"bits")+" out over each of his eyes, placing a perfect dollop on the tip of his snout...\n\nOkay, time to get serious. You slam your crack down on his little throat and gyrate, painting it "+(isActive("Candy Ring")?"cakey":"a toxic brown")+". Then you lengthen your stride and start dragging your hips down from his throat to his perky toddlernips, to his belly button, making his skull slap down against the bathroom floor over and over with your fast-shifting weight.\n\nYou grab both his skinny little arms and thread each one up your asscrack. You kiss each individual kitten paw-bean with your ring. You wipe your ass with the soles of his little feet. You wipe your ass with each of his thighs. You wipe your ass with his much smaller ass.\n\nHeck, you lose track of his body parts entirely, once everything is painted the same shade of "+(isActive("Candy Ring")?"tasty orange":"brown")+", and still just keep on wiping~\n\nEventually you have to admit your crack is pretty clean, so you get off and behold the "+(isActive("Candy Ring")?"frosted tod":"disgusting clump of sewage")+" at your feet. You find his head, somehow, and lift it up so he can see the huge line waiting for him at the bathroom entrance.");
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitpaper") {
			append("You grab a fluffy roll of TP and crack off a slice, dragging it down "+pickByGenitals("from the underside of your nutsack, over your taint, your pucker,", "your cunt (giving your clit a good fandanglin' on the way), over your pucker, and up", "from the underside of your nutsack, over your cunt, your pucker,")+" to the tippy-top of your crease. It comes off slathered "+(isActive("Candy Ring")?"with delicious cheesecake":"and dripping with chunky filth")+".\n\nHe's hypnotized with it, licking his"+(isActive("Candy Ring")?"":" shitty")+" lips...");
			addChoice("... Now stuff it down his throat.", explore.bind("deadgodshitthroat"));
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitthroat") {
			append("You give the little three-year-old toilet what he so obviously wants and cram that "+(isActive("Candy Ring")?"frosty":"soaked")+" wad deep down his maw, using three fingers to really pack it down, not even giving him a chance to chew at all. He coughs and gags and splutters "+(isActive("Candy Ring")?"":" soggy paper chunks")+", which is really unimpressive— considering you did all the hard work of cleaning your crack for him, you'd think a toiletcub would try harder than that to force "+(isActive("Candy Ring")?"such a yummy treat":"used toilet paper")+" down their worthless esophagus.");
			addChoice("Wash it down.", explore.bind("deadgodshitwash"), {kinks: ["Piss"]});
			addChoice("Back.", explore.bind("bouncybath"));
		}

		if (seg == "deadgodshitwash") {
			Theme.addUiChoice("dead");
			append("He reaches out with both paws when he realizes what you're about to do, welcoming your "+pickByGenitals("cock", "cunt", "cock")+". The wad's stuck halfway down, a cute little lump visible in his throat. Shaking your head with disbelief that you even have to do this, you "+pickByGenitals("plug your cock right down his throat", "screw your cunt in tight to his ring gag", "plug your cock right down his throat")+" and blast the lump down with hot piss, clearly getting a half-gallon or so down the wrong tube from the sound and feeling of those choked spasms"+pickByGenitals(" around your cock", "", " around your cock")+".\n\nOnce he's finished nearly suffocating on piss you pull away and give his tummy a pet-pat, as if to say \"Good job for "+(isActive("Candy Ring")?"eating your treat":"swallowing that gross shit, trash can")+"!\"\n\nHe pants thanks, purring deeply. You think the toilet paper's starting to digest, deep in his stomach... because he makes the cutest little burp of surprise when you step away to reveal a massive line of people at the bathroom door, all with their own full rolls of TP... some with two.");
			addChoice("Have fun cub~", explore.bind("bouncybath"));
		}

	}
}
