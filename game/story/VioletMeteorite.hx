package story;

class VioletMeteorite {

	public static function init():Void {
		var snippet = 5;
		var common = 10;
		var rare = 2;
		var megarare = 1;

		addExplorable(82, "Violet Meteorite", violetMeteoriteExplore.bind("rng1"), common, 1);
		addExplorable(83, "Violet Meteorite", violetMeteoriteExplore.bind("rng2"), common, 1);
		addExplorable(84, "Violet Meteorite", violetMeteoriteExplore.bind("rng3"), common, 1);
		addExplorable(85, "Violet Meteorite", violetMeteoriteExplore.bind("rng4"), common, 1);
		addExplorable(86, "Violet Meteorite", violetMeteoriteExplore.bind("rng5"), common, 1);
		addExplorable(87, "Violet Meteorite", violetMeteoriteExplore.bind("rng6"), common, 1);
		addExplorable(88, "Violet Meteorite", violetMeteoriteExplore.bind("rng7"), common, 1);
		addExplorable(89, "Violet Meteorite", violetMeteoriteExplore.bind("rng8"), common, 1);
		addExplorable(89, "Violet Meteorite", violetMeteoriteExplore.bind("rng9"), common, 1);
		addExplorable(89, "Violet Meteorite", violetMeteoriteExplore.bind("rng10"), common, 1);

		addExplorable(91, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreCrack"), common, 1);
		addExplorable(105, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreGryphon"), common, 1);
		/* addExplorable(108, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreCaves"), common, 8); */
		addExplorable(110, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreCaves"), common, 9);
		addExplorable(113, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreHyper"), common, 1);
		addExplorable(119, "Violet Meteorite", violetMeteoriteExplore.bind("ExplorePizza"), common, 1);
		addExplorable(120, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreProlapse"), common, 1);
		addExplorable(149, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreTrashSprings"), common, 1);
		addExplorable(150, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreIndigoHint"), megarare, 1);
		addExplorable(151, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreHippy"), rare, -1);
		addExplorable(154, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreFerretFuckmeat"), megarare, 1);
	}

	public static function violetMeteoriteHub():Void {
		clear();
		var canGain:Bool = !pauseIsGoingPrev();

		//Setup
		playMusic("violetMeteorite");
		setLocation("Violet Meteorite");
		saveCheckpoint("VioletMeteorite.violetMeteoriteHub();");
		
		//Unlock scenes
		if (data.owlGirlSeen && data.myntFakeDone && !getJournalEntries().contains("Missing Page 5")) {
			addExplorable(133, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreMissingPage5"), 1, 1);
			GameData.reInitRefs();
		}

		if (data.myntFakeDone && !getJournalEntries().contains("Missing Page 2")) {
			addExplorable(134, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreMissingPage2"), 10, 1);
			GameData.reInitRefs();
		}

		if (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip") && !getJournalEntries().contains("Kemp Truck")) {
			addExplorable(144, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreKemp"), 10, 1);
			GameData.reInitRefs();
		}

		if (data.johnLanaJCDone && !data.johnLanaVMDone) {
			addExplorable(145, "Violet Meteorite", violetMeteoriteExplore.bind("JohnLanaVM"), 20, 1);
			GameData.reInitRefs();
		}

		if (getJournalEntries().contains("Deerdog femboy") && !getJournalEntries().contains("Deerdog femboy 2")) {
			addExplorable(153, "Violet Meteorite", violetMeteoriteExplore.bind("ExploreDeerDog"), 10, 1);
			GameData.reInitRefs();
		}

		if (!data.vmIntroDone) {
			data.vmIntroDone = true;
			append("You spend "+rndInt(3, 6)+" days climbing to get onto Violet Meteorite.\n\n");

			if (Math.random()>0.5) {
				var s:MintSprite = addRectSprite(800, 200, 0x000000);
				s.layer = 1;
				s.alpha = 0.01;
				s.onReleaseOnce = function () {
					playSound("assets/audio/ui/explore");
					if (canGain) addToItem("Nuts and Screws", 50);
					append("\n\nThank you~");
					s.destroy();
				}
				append("The immense tedium of this task is lost on you because it's been reduced to a short text summary.\n\nOr maybe you won't read this at all, and you'll just click the compass button. Well, if you didn't read this, you won't know to click the top of the screen for an extra <!b>x50<!b> Nuts and Screws.\n\nYou salvaged them from some hiking gear stuck in the jagged purple spacerock. It was hanging near a shitty old backpack labelled PROPERTY OF CADE.");
			} else {
				var rand:Int = pickOne([2, 2, 3, 3, 4, 4, 5, 5, 10]);
				append("Heavenly pastel-pink nymph girls greet you with a complementary dip in their super stylish bathhouse (elites only) up on the hot springs. You're apparently elite now. Tons of people know you that you've never met. Fuck, you're so ritzy, they pay YOU to lounge nude in the bouncy, inflatable lounges imported from the City. <!b>x"+rand+"<!b> Capsules, to be exact.\n\nOn the far side of the pools, a crocodile and a... gecko?... they're talking quietly behind a veil of steam.\n\nThe gecko says \""+(data.campTripIntro?"sacrifice":"planned camping trip with Marei")+".\"\n\nYou're not sure what they're talking about?");
				if (canGain) addToItem("Capsule", rand);
			}
			startHub("Violet Meteorite");
		} else {
			if (data.theme.background != "dawn" && data.theme.background != "enginetic" && data.theme.background != "freak") {
				var s:MintSprite = addSprite("assets/img/effect/violetMeteoriteHub.png");
					var destinationY:Int = 101;
					s.x = 0;
					s.y = destinationY+50;
					s.alpha = 0;
				tween(s, {y: destinationY}, 1.5, {ease: QUINT_OUT});
				tween(s, {alpha: 1}, 1.4, {ease: QUINT_IN});
			}

			startHub("Violet Meteorite");
			append("You're somewhere on/in the Violet Meteorite.");
			if (!data.myntScenesDisabled) MyntScenes.checkScenes();
		}
	}

	public static function violetMeteoriteExplore(which:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		saveCheckpoint("VioletMeteorite.violetMeteoriteExplore('"+which+"');");
		if (which == "rng1") {
			append("A rabbit grandma soaks her wrinkly ass in a hot pool hanging from Violet's side. Her legs dangle crossed over the thousand-foot drop, steam dripping from her toes.\n\n\"Wolf?\" she asks your footsteps. \"I gotta question for you, dearie...\"\n\nSweetdust peppers the side-profile of her unkempt granny mustache. Between her legs two fat vibrators purr, stirring bubbles, hardly doing anything for her anymore.\n\nHer eyes are closed. She isn't upset. But her face twists, a face shattered with wrinkles, and through two lifetimes of gummed-up contempt she drawls a question:\n\n\"Ain't this life a dream?\"");
		} else if (which == "rng2") {
			data.knownAsPlayer++;
			append("You poke your head into a pink-lit cave and accidentally interrupt the orgy inside. Only one swinger notices you (does that term even apply when everyone fucks everyone all the time?), a nymph bimbo— she unplugs from three cocks and rushes out, mouth dripping with questions, grinding her soggy hips against yours.\n\nShe's never seen a player before! What sort of hot springs were you born in? Do you think she might be a player too someday?\n\nShe doesn't seem to understand her own world. You're just a celebrity to her.");
		} else if (which == "rng3") {
			append("Twin wolves enter a spring in perfect synchronization. One pushes off from the rock and crests a wave through hot glass-smooth water with his chest, leading the other by hand. They disappear together behind a crag.");
		} else if (which == "rng4") {
			append("From within cave pools laced with magma comes the sound of rhythmic splashing and moans thick as honey.\n\nSex always finds a way.");
		} else if (which == "rng5") {
			append("A goblin shakes his plump little butt at you, cackling impudently and challenging you to battle. Man, if this game had a combat system, you'd be all over that shit.\n\nToo bad it doesn't. He just scurries off along the tunnel ceiling, unpunished.");
		} else if (which == "rng6") {
			append("Two cyan-skin nymph ladies try to fit into the same tiny chimera burrow, boobs squishing up and thighs interlocking. One looks over at you and blushes.");
		} else if (which == "rng7") {
			append("A body tumbles off the side of the meteorite.\n\nYou rush to the edge. Whoever they are, they throw their wings out with a mighty <!i>FWOOMP<!i> at the last second, pull the throttle up hard, and soon they're doing barrel rolls between City skyscrapers no problem.");
		} else if (which == "rng8") {
			append("You take a wrong turn and accidentally end up walking down a tunnel so wide and tall it seems like you wander pitch-black stone plains for hours before you finally catch the hint of a wall or a ceiling again.");
		} else if (which == "rng9") {
			append("Three charred cell phones fall from the rim of a crater and land at your feet.\n\nYou climb up and peek over. Noxious smog rises from a lava flume overpacked with textbooks, memoirs, novels, cell phones, CD roms, VHS tapes— and, at the very bottom, a smashed-up AUTO-MYNT still trying to mewl cheerily as they melt.");
			if (canGain) addToItem("Broken Cell", 3);
		} else if (which == "rng10") {
			append("Someone leans over your shoulder and kisses you on the cheek.\n\nYou spin around and catch only a few white feathers.\n\nThey left you a nymph egg!");
			var s:MintSprite = addSprite("assets/img/effect/nymphEgg.png");
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.y = GAME_HEIGHT*0.5-s.height*0.5;
		}

		if (which == "ExploreHippy") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/genderlessBear.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");

			if (data.hippyBearFortuneIndicies.length != 0) {
				append("A chill, genderless bear sits with his back up against the piping-hot stone of a hot spring's wall. If they had a cock, it would be perfectly flaccid. They seem too enraptured in memories for sex.\n\n\"Got anything romantic?\" they asks you. \"I'm in a very romantic mood. Make me feel like a bride or a silly young girl in love, will you? I'll gossip, if you do. I know so much about everyone.\"");
				addChoice(
					"",
					violetMeteoriteExplore.bind("hippyget"),
					{cost: ["Sweetgrass Bouquet", 1]}
				);
				addChoice("Avoid "+(rndInt(1,4) == 4? "her" : "them")+".", function () {
					disableExplorable(151);
					violetMeteoriteHub();
				});
				addChoice("Move along.", violetMeteoriteHub);
			} else {
				disableExplorable(151);
				if (canGain) {
					addToItem("Glowberry Wine", 1);
					addToItem("Glowberry Pie", 2);
					addToItem("Capsule", 82);
					addToItem("Nuts and Screws", 69);
					addToItem("Garbage Bag", 1);
					addToItem("Piss Balloon", 3);
					addToItem("Broken Cell", 1);
				}
				append("The genderless bear clutches their heart and takes a deep whiff of all their bouquets.\n\n\"Yes! Just like Kemp makes them! Oh, my, oh, oh!\"\n\nHe passes out from the sheer romance of it.\n\n... You don't have the heart to steal your bouquets back, but he has several things poking out of his backpack which he may or may not miss...\n\nYou don't really want to choose yes or no or whatever. You deserve a win. It's fine. You probably would have said 'yes, steal the stuff outta his backpack' anyway. So. Yeah. Let's just do it.\n\nOh, awesome! Holy shit! You find two Glowberry Pies, and some other stuff. How bout that~");
				addChoice("Oh. Huh. Um.", violetMeteoriteHub);
				addChoice("Move along.", violetMeteoriteHub);
			}
		}

		if (which == "hippyend") {
			append("Just as you're about to leave you realize she slipped a piece of taffy into your pocket when she handed you all those capsules.\n\n... You go to thank her, but she's already snoring, and some dude already snuggled up and started sleepfucking her...");
			Theme.addUiChoice("taffy");
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "hippyget") {
			halfWidthText();
			var index:Int = pickOne(data.hippyBearFortuneIndicies);
			data.hippyBearFortuneIndicies.remove(index);

			var element = GameData.hippyBearFortunes[index];

			append("\""+element+"\"");
			var s:MintSprite = addSprite("assets/img/effect/genderlessBear.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "");
			addChoice(
				"Another one.",
				violetMeteoriteExplore.bind("hippyget"),
				{cost: ["Sweetgrass Bouquet", 1], enabled: data.hippyBearFortuneIndicies.length > 0}
			);
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "ExploreIndigoHint") {
			append("A maudlin "+(isActive("Pastel Ring")?"five-year-old cubslut with two fingers up her cunt":"nymph girl")+" chats loudly on her cell phone. Half the meteorite can hear her, because the mined-out spacerock tunnels echo with her whiny, drunken voice.\n\n\"Allei, about Indigo Pond— Ohhhh my god he did <!i>not<!i> take his thong off and pee on her again. Oh my god he did <!i>not.<!i> Why. Why. My mouth is a urinal. Tell him to call me next time. He does that thing where he wears thongs with super skinny strings and then he threads the tiny string up along his cockhead, right along the slit, and it makes his pee go like a hose on the 'mist' setting? That's the same guy? Oh my GOD Allei. YES. I KNOW. Just like forty years ago. Shut up. Did falling off the map give you tranquilizer withdrawals? Amnesiac Allei now, huh?\"\n\nShe lounges back on a smooth piece of spacerock, her hips enveloped just far enough inside a hot-spring that you can only see the upper bulge of her cunt, just before the labia.\n\nShe reaches down into the calm spring water with a massive splash and starts pounding three fingers up her cunt. \"Fuck off. HOW much pee? And he really was there til six? I got off work at three. I should have gone, just to catch some cock. I know I should've gone out to Indigo Pond, I <!i>know<!i> I should've... but darling, the otter is <!i>always<!i> there. I simply cannot <!i>stand<!i> the reek of his smoke... yeah I'll slow up on the italics... sorry, I know you're drunk... yeah... no, it's okay, girl!\"\n\nShe squishes her thighs together with cheeriness.\n\n\"I can't read well when I'm drunk, either! I can't believe the DRUGS they have down here! Oh, exactly, keep it a secret. Best not to BLOW THEIR MIIINDS haha I'm so weird and funky. Yes I am. Get the cocks out of your mouth. No. Well, I can't understand you, to be frank. Oh my god you gag so cutely. Listen to yourself. Wow. Okay stop. Oh my god you WHORE. Holy fuck. Take him to the base. You feel those nuts on your chin? Unf. Bitch. You should have me on commission for this phone sex. Two caps a minute. Fuck. Ah, but yes. Okay you good? Cough it up, slut, then swallow it again. Yes. No, you still sound like a frog. Go AHEM, AHEM. Clear the cum out your throat... ewwwww.... yeah, anyway, not going to Indigo when Kemp's there.... not to mention his musk... yes... well, if I had anything to say about it, he'd be ejected from the Pond in a heartbeat! Oh, YES! Believe it! Nymphs <!i>only<!i>! These \"islanders\" just won't ever understand what it's like to be a mythological beauty from the stars, like us.\"\n\nShe gropes her own fat tits, thumbs pinching at the nubs of her nips. Her fish-like nymph skin stretches and shines in the moonlight as her bare thighs sqoosh together and the curve of her labia becomes a tight w while it gushes one drop of mythical, cosmic cuntjuice.\n\n\"No, they won't ever be mythological. They're bound to their narrators. But maybe... maybe maybe maybe.... if they try really hard to tell their own stories— to exposit— they might become narrators themselves. That's what I hear among the ones who really run things, yeah. Som, Septrica, Mario, whoever else. Mynt was accidentally developed when we arrived, and the computer had a chunk of meteorite in it. And, of course, down here, these disgusting, fucked-up, abhorrently cute \"islanders\" have built their OWN computers— the AUTO-MYNTs— they've constructed them with chunks of meteorite. Basically they're all just carbon copies of the default Narrator game construct— Protocol. But that's the key. Because they can access code one layer up— the AUTO-MYNTs can also access— Indigo Pond is hidden for a <!i>reason<!i>, you know! Just as the stars are hidden from these poor layer-trapped folk! Look at them! Pitiable things! You couldn't hope to start a loving relationship with any of them. You'll encounter them a few times, fuck or hang out, and they'll make some of their backstories apparent— as <!i>narrators<!i>. You've heard of the game construct, darling, have't you? You haven't? My. Yes. My. Oh yes yes yes YES! Mynt, Mint, Protocol, each of them are functional Narrators!\"");
		}

		if (which == "floodHub") {
			disablePause();
			setLocation("Moist Meteorite");
			append("There's not much to save here. Strawberry's cavern is bleeding over with glowjuice like a sore on the meteorite's side. Craters fill and spill over with eye-searing cyan. Nymphs and birdboys swarm the skies. Most of them crash in mid-air.\n\nSuddenly, they start dropping, one by one. You look to the peek of Hyper Land and spot the glint of a tranquilizer sniper rifle aiming and carefully firing at anyone who can still fly.\n\nThe shooter doesn't miss. Except when it comes to Strawberry; they don't even try to shoot at Strawberry.");
			addChoice("The Crack.", violetMeteoriteExplore.bind("floodCrack"));
			addChoice("Hyper Land.", violetMeteoriteExplore.bind("floodHyper"));
			addChoice("World Map.", function() {
				WorldMap.map();
			});
		}

		if (which == "floodCrack") {
			append("The Crack has been filled.\n\nNymphore overflows as every mythical creature struggles to return to their origin, diving deep into the pond and attempting to immerse themselves in the lava at its pit. Soon the flood overtakes that too, and the waters of the pond infect anyone who tries to swim through them.\n\nTaro's little stand flies off the side of the meteorite, completely decimated. Taro himself desperately tries to cure any part of his body coated with glowjuice by repeatedly hacking his own limbs off with a big chef's cleaver. It only works until a wave comes down from above and washes him off the side of the meteorite entirely.\n\nThe cat futa who works the ticket booth for the Challenge Springs has been coated on every inch of her body except her face. She tries to shield it with her tits, running around blind. She trips and falls right into Nymphore.");
			addChoice("Move along!", violetMeteoriteExplore.bind("floodHub"));
		}

		if (which == "floodHyper") {
			append("Hyper Land has been swept off the ground entirely. It bobs and floats on a colossal wave. The screams of the patrons inside echo out over the meteorite as they hold on for dear life and rattle around inside the giant inflatable dick. The shaft bends and curls sideways with air resistance as the whole structure slides off the side of the meteorite and lands in the ocean with a mighty splash, perfectly intact.\n\nSeveral barges filled with fancy cars detach from Junk City's harbor and drop some people off at Hyper Land, where it's still safe. Pieces of the Floatillery follow suit.");
			addChoice("If it's safe, fly down there?!", violetMeteoriteExplore.bind("floodHyper2"));
			addChoice("What is going on...", violetMeteoriteExplore.bind("floodHub"));
		}

		if (which == "floodHyper2") {
			append("Strawberry turns "+gryphJunk("his", "her", "their")+" head and eyes you.\n\n<!i>My talons might pop it if we land there.<!i>");
			addChoice("Right, fuck... move along...", violetMeteoriteExplore.bind("floodHub"));
		}

		if (which == "ExploreFerretFuckmeat") {
			append("A 19-year-old femme ferretboi huddles over something in the back of an alcove. That something is so small... he's nuzzling his snout against it... you think you might peek in, just for a moment, and then run off~");
			addChoice("Peek!", violetMeteoriteExplore.bind("ExploreFerretFuckmeat2"), {kinks: ["Male", "Male", "Baby", "Love"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "ExploreFerretFuckmeat2") {
			append("You approach from behind.\n\nThe ferret has his ass in the air and his thighs clenched together tightly over his cock. One of his nuts is squished between them, too, but the other one hangs free. It kinda creates a cute lopsided effect, which only adds to his whole goofy, long-body ferret aesthetic.\n\nYou peer around the side and get a look at what he's nuzzling: it's a little Fuckmeat girl. She giggles and paps her paws on the ferret's snout. He plays along with her, snuffling eagerly at her little pawpads. The lil baby is fully clothed in a soft cotton onesie; her adoptive dad is clearly keeping her dry and clean and happy, here.\n\n\"You're a little chimera, aren't you?\" he asks her. She nods dumbly, drooling all over her own chest~\n\nThe ferret dabs a tissue on her drool-spotted onesie and scoops her up. You have to dash backwards to avoid being seen as he carries her out of the alcove, into the moonlight.\n\nHis eyes well up a bit. He cradles her in the crook of his soft, furry elbow. \"It fucks me up,\" he mumbles to himself, \"thinking what might've happened, if I hadn't found you first... come on, baby... shhhh...\"\n\nHe rocks her gently until she starts to get drowsy. Then he sets off at a slow, relaxing pace, eyes on the spotlit silhouette of Septrica's brothel in the distance, which juts like a rope of twisty green licorice from the distant skyline of Junk City.\n\n\"Come on, baby,\" he whispers to her. \"Let's get you somewhere safe.\"");
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "ExploreDeerDog") {
			unlockJournal("Deerdog femboy 2");
			append("A familiar set of antlers poke out above a sloped crag ahead. They swoop from right to left and back, all paranoid.");
			addChoice("Approach.", violetMeteoriteExplore.bind("deerdog1"), {kinks: ["Cub", "Male", "Watersports"]});
		}

		if (which == "deerdog1") {
			append("You go prone and crawl up the slope. You curl your fingers around the edge and peek down into a quiet, secluded little pocket of hot springs.\n\nIt's that same teenaged deer/dog hybrid from the forest. Like last time, he's just trying to pee in private for once; his fly and zipper are undone, and his cock (pretty huge for a teen) hangs out lazily over the front of his bright pink undies. The waistband of his jeans has slipped down over his ass by now, although it is still tight enough to muffin his ample buttmeat a little.\n\nThe antlers turn again.\n\nYou have to duck down just as he casts a razor-thin fishing wire of paranoia in your direction. His eyes narrow at the fingerprints you left on the edge of the dusty, meteoric rock.\n\n\"It's you again, isn't it? I can see "+data.playerName+" floating above the edge there, y'know.\"");
			addChoice("Stay hidden.", violetMeteoriteExplore.bind("deerdogHidden"));
			addChoice("Cum clean~", violetMeteoriteExplore.bind("deerdogClean"));
		}

		if (which == "deerdogHidden") {
			append("You scoot down a little bit and hide your name.\n\n... Silence. You don't hear him running away, muttering about how much of a dirty perverb you are under his breath, or even squeaking cutely and releasing a soft pitter of piss on the ground.\n\n...");
			addChoice("Okay... peek?", violetMeteoriteExplore.bind("deerdogHidden2"));
		}

		if (which == "deerdogHidden2") {
			append("He's smirking at you.\n\nHis pants are back on again, although you can still see the outline of his cock clearly defined through them-- one big, long, half-hard bulge, and two chubbier round ones beneath it, half-swallowed in the chasm of his thighs-- but you can also see a few tiny dark dots on their fabric.\n\n\"Oh, you wanted to watch?\" he teases you. \"I just went off the cliff. Impeccable stealth, eh?\"");
			addChoice("Noooo fuck!!!"+(rndInt(1, 20) == 20?" METAL GEAR!!!!":""), violetMeteoriteExplore.bind("deerdogFailed"));
		}

		if (which == "deerdogFailed") {
			append("He scurries off.\n\n\"Better luck next time, perverb!\"");
			addChoice("Move along... 3:<", violetMeteoriteHub);
		}

		if (which == "deerdogClean") {
			append("You take your hands off your "+pickByGenitals("cock", "cooter", "cock")+" and put them where he can see them. Slowly, so as not to startle his gentle deer half nor infringe on the territory of his dog half, you scoot forward only far enough to show him your bare crotch. You know, so he knows you have no weapons.\n\nHe sighs. \"What are you doing here? Trying to give me another heart attack?\"");
			addChoice("I merely offer my services as a urinal.", violetMeteoriteExplore.bind("deerdogClean2"));
			addChoice("Yes. You're just so cute when you panic pee.", violetMeteoriteExplore.bind("deerdogPanic"));
		}

		if (which == "deerdogPanic") {
			append("He lifts his chin with haughty teenaged contempt, tucks his dick back in his pants, and strolls away with as much dignity as he can muster while half his concentration is getting stolen by a full bladder.\n\n\"I'm not cute,\" he huffs.");
			addChoice("No... wait... D:", violetMeteoriteHub);
		}

		if (which == "deerdogClean2") {
			append("He eyes you up and down.\n\n"+(data.hasBoobs?"They completely gloss over your juicy, voluptuous tiddies":"They linger on your perky nips for quite a while")+". They widen and see great visions of inflation at the sight of your flat, smooth belly. And they "+pickByGenitals("sparkle with wonder at the sight of your cock", "unfocus with boredom at the sight of your cunt", "sparkle with wonder at the sight of your cock")+".\n\nBut then they snap back to yours.\n\n\"Mmmmmmmmmmmmmmmm-- turn around,\" he says, pulling a grope up from the base of his cock to the tip of his cute foreskin.");
			addChoice("Turn around, bend over, and spread my ass for him.", violetMeteoriteExplore.bind("deerdogClean3"));
		}

		if (which == "deerdogClean3") {
			append("Well, you're about to, but then you lose your footing and tumble backwards down the crag. It's only about a four foot drop, but even your jiggly asscheeks aren't enough cushion. You suck air in through gritted teeth and rub the bright red spot on your left cheek, which got the worst of it.\n\nHe hauls you to your feet, politely resisting the schadenfreude, and spreads your ass for you out of pure compassion.\n\nHis soft paws knead their way inside your crack. They peel it open in opposite directions. You can feel his breath on your hole.");
			addChoice("W-Well? Will it do?", violetMeteoriteExplore.bind("deerdogClean4"));
		}

		if (which == "deerdogClean4") {
			append("\"Hmmmm...\"\n\nHe spits on your pucker and grinds it in with a thumb. He squints and tilts his head, appraising your ass like an artist would appraise a painting.");
			addChoice("Will it???", violetMeteoriteExplore.bind("deerdogClean5"));
		}

		if (which == "deerdogClean5") {
			append("\"HMMMMmmmmmmmmMMMmmMMMMMMMmmmmm...\"\n\nHe drooools a hot little glob of doggy slobber and gracefully thumbs that up your hole... to see how well it retains liquids, I guess??... or maybe just to lube you up, if he's already made his decision.");
			addChoice("Will it??!?!?!?!!??", violetMeteoriteExplore.bind("deerdogClean6"));
		}

		if (which == "deerdogClean6") {
			append("\"It'll do.\"\n\nWith zero warning he straightens up and slips his cockhead inside you, all in one graceful deerish motion. His extra-goopy puppy saliva makes for wonderful lube; you could hardly even feel it when his cock first pushed inside you, and it wasn't until five full seconds later that you started to realize something didn't quite feel right between your buttcheeks.\n\nHis hands wander over your urinal of a belly, still flat for now, and up over your "+(data.hasBoobs?"tits":"bare chest")+". He holds you against his chest and slowly feeds your ass the rest of his cock, until you feel it bumping against the nub of your "+pickByGenitals("prostate", "g-spot", "prostate")+".");
			addChoice("O-Oh... good...!", violetMeteoriteExplore.bind("deerdogClean7"));
		}

		if (which == "deerdogClean7") {
			append("\"I hate you,\" he whispers. \"I'm on rehab for pee stuff, you know. That's why I'm always trying to get some privacy... but it's impossible...! Especially with little piss sluts like you hounding me!! And no, that's not a dog pun!!!\"\n\nAt the crest of his frustration (and you guess some of that is frustration with his own lack of self-control) he slams his dick as far as it'll go up your butt and holds it there for ten seconds with his teeth gritted mercilessly tight.");
			addChoice("What are you waiting for? Relapse inside me! <3", violetMeteoriteExplore.bind("deerdogClean8"));
		}

		if (which == "deerdogClean8") {
			append("\"I'm waiting for my dick to soften up,\" he hisses. \"You can't pee past a boner. Your prostate swells up and it's kinda like a valve that shuts off the route to your bladder. Talk about something not sexy if you want this process to go faster.\"");
			addChoice("Next x3.", violetMeteoriteExplore.bind("deerdogPee"));
			addChoice("Oh. Okay. Hey, you know a lot about anatomy, huh?", violetMeteoriteExplore.bind("deerdogClean9"));
		}

		if (which == "deerdogClean9") {
			append("\"When it comes to cocks and pissing, yes. Thelly taught me most of it.\"");
			addChoice("Next x2.", violetMeteoriteExplore.bind("deerdogPee"));
			addChoice("Ohhh... yeah... so, you two pretty close, or?", violetMeteoriteExplore.bind("deerdogClean10"));
		}

		if (which == "deerdogClean10") {
			append("He shifts his weight a little, shifting his cock around inside you. It feels wonderful.\n\n\"We used to be co-workers, yeah. But I kinda got tired of sucking dick in a public bathroom all day, y'know? It's hot for a while, and the caps are nice, but... it's a job. Yuck. Fuck jobs, am I right?\"");
			addChoice("Next.", violetMeteoriteExplore.bind("deerdogPee"));
			addChoice("Haha, yeah, haha. Jobs suck. So like. You got a half-chub yet?", violetMeteoriteExplore.bind("deerdogClean11"));
		}

		if (which == "deerdogClean11") {
			append("His antlers brush gently against your neck (he must use beak softener on them) as he looks down and checks his erectitude.\n\n\"Nnnn... I'm pushing, but nothin's coming out... ugh, why dooooOOOOOoooh my god there it goes--!\"");
			addChoice("Next!!", violetMeteoriteExplore.bind("deerdogPee"));
		}

		if (which == "deerdogPee") {
			append("You shiver from the very tip of your "+pickByGenitals("cock", "clit", "cock")+" to the soles of your unsteady feet as roughly five steaming cups of teenaged boy piss blasts up into the deepest crevices of your ass. Hot, steaming golden liquid bursts out around his cock, cascading in rippled layers over his furry nuts, gushing like fucking niagra over his perfect boithighs.\n\nHis eyes roll up into his head. The first wave of relief yanks a shaky breath out of his lungs and over the smooth space between your shoulder blades. His hips begin to sway hypnotically, dragging a couple inches of dogcock in and out of you. Each minute movement dislodges a quiet gurgle of piss, which tickles a little as its droplets roll down "+pickByGenitals("over your bare taint", "into the crease of your pussy", "over your cuntlips and onto the seam of your bare nutsack")+"...");
			addChoice("Fwaaaaa...", violetMeteoriteExplore.bind("deerdogPee2"));
		}

		if (which == "deerdogPee2") {
			append("Just as his shaft twitches with the last few spurts of hot piss... something else starts to come out.\n\nHis breath catches in his throat. He falls forward on his weak knees and pins you to the hot rock wall by his cock, which is definitely not just half-hard anymore.\n\nHe starts humping into your piss-packed ass with zero concern for how much of his piss sprays out of your hole as a consequence. All the yellow that soaks your thighs is soon overtaken by a flood of bright, viscous white doggycum. Your belly swells up a little and jiggles around adorably with the force of his thrusts (which are so deep you feel like they're almost penetrating up into it) and soon your piss tank of a stomach is strained to the absolute max around this deer-dog's yellow-white banana-cream cock-smoothie.\n\nYou both collapse under the weight of it. You land front-down, of course, and your precious smoothie splutters out of your hole around the base of his throbbing shaft.\n\nYou both just lay there for a while, panting in the puddle.");
			addChoice("Thank... you... hahhh... hahhhhh~", violetMeteoriteExplore.bind("deerdogPee4"));
		}
		if (which == "deerdogPee4") {
			append("\"No... hahhh... problem... hahhhh... back to square... hahhhhhhh... one, for me...\"");
			addChoice("Good luck... hahhhh... with your... hahhh... pee rehab!", violetMeteoriteExplore.bind("deerdogPee5"));
		}

		if (which == "deerdogPee5") {
			append("He unplugs, loosing a little fountain of stained cum from your gaped ass, and rolls his eyes. \"Yeah... hahhhhhhhhhhhhhhh... I'll need it...\"");
			addChoice("Move... hahhhhh... along~", violetMeteoriteHub);
		}


		if (which == "ExploreTrashSprings") {
			unlockJournal("Bins Spring");
			append("You push through a wall of brown steam. Glittering beads of condensation drag over your face aerodynamically, from the tip of your nose, up the contours of your cheekbones, until they recede down your chin and into your hairline.\n\nYour face pops out the other side of the steam bank.\n\nYou pull in a breath of humid air. You're at the crest of a big sloppy pile of hot springs, all flowing into and around each other. They've all been filled with "+(isActive("Candy Ring")?"melted chocolate":"sewage and pollution— this place must double as a landfill")+". The pools that aren't bubbling happily against the chests and bellies of piggy dudes (or haughty seagull birdboys) are either empty, exposing the "+(isActive("Candy Ring")?"tasty choco chunks":"crusty trash, rotten food, and used condoms")+" that coat their bottom, or overfull, spilling over to at least five other pools and drenching the relaxed furs below.");
			addChoice("Loot.", violetMeteoriteExplore.bind("trash1"), {kinks: ["Cub", "Male", "Raunch", "Trash", "Scat", "Feral"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash1") {
			var age = "n eight";
			if (isActive("Pastel Ring")) age = " six";

			var bins = "A"+age+"-year-old raccoon boi";
			if (data.metBins > 0) bins = "Bins the raccoon boi";

			if (canGain) {
				addToItem("Glowberry", 20);
				addToItem("Nuts and Screws", 50);
				addToItem("Broken Cell", 1);
			}

			data.metBins++;

			append("You start digging through random shit.\n\nYou find a puddle of half-eaten Glowberries, pry a few Nuts and Screws from the muck, and even manage to fish out a Broken Cell.\n\nSuddenly, a boy's voice interrupts you.\n\n\"You seek an audience with Bins, the "+(isActive("Candy Ring")?"Sweet":"Rotten")+" King?\"\n\n"+bins+" sits on a tiny throne of "+(isActive("Candy Ring")?"dark chocolate":"twisted sewage pipes")+".\n\nIt's the highest point on the whole garbo hot springs, right at the crest. You're standing directly next to it.\n\nThe king surveys you loftly. He's wearing only some shorts and a cute little banana peel crown. None of the birds or the pigs dare to come up here and contest that inviolable symbol of power.\n\nHe shifts his little raccoon legs up and open, so that one of them lays languidly up over the armrest of his throne. His cocklet relaxes, slumped over his thigh, half-hard. Just below that, where his nuts and buttcheeks grind against the throne's seat, coagulations of "+(isActive("Candy Ring")?"chocolate":"shit")+" have formed.\n\nThey wink and glitter at you. Every inch of his body and his throne has been coated with a fine dew of "+(isActive("Candy Ring")?"sweet brown":"slime")+". He runs a paw down his flat chest, over his belly, and gives his dick an authoritative <!i>tug.<!i>\n\n\"Come, pet... we have a guest...\"\n\nSomething lopes out from the shadows behind his throne: a feral monkey. It's about the same size as him, thick around the hips, and obviously well-fed. There's something extra sexy about the way its hairy thighs are so slick and smoothed-over with "+(isActive("Candy Ring")?"melted chocolate":"hot, steamy garbosludge")+", the way they glimmer at you as it rests on its knuckles and sniffs your crotch before hurrying back to Bins for a scratch on its fat, shiny, hairless monkeybutt.");
			addChoice("My liege... forgive me, I did not mean to forage from your estate. I will return the items I have looted.", violetMeteoriteExplore.bind("trash2"));
			addChoice("I don't want to LARP with you, kid.", violetMeteoriteExplore.bind("trashSkip"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash2") {
			append("Bins waves an imperial paw, dismissing the matter. "+(isActive("Candy Ring")?"Chocolate":"Shit")+" flies off in an arc from his fingertips and splatters your face.\n\n\"No matter,\" he says. \"Keep the things you have stolen. They mean nothing to me.\"\n\nThe "+(isActive("Candy Ring")?"Sweet":"Rotten")+" King's pet monkey drags his tongue slowly over your "+pickByGenitals("cock", "cunt", "nuts")+", cleaning the tasty brown beads of condensation from you as a matter of courtesy. He's very skilled with his tongue... more skilled than any feral you've seen so far. His cock, like his owner's, hangs down lazily against his thigh. As he really starts to suck in your flavor, it hardens, and his foreskin pulls back naturally to reveal "+(isActive("Candy Ring")?"a yummy hidden choco surprise":"oodles of hidden smegslime")+".");
			addChoice("No... my King! You are too generous. Please, for the honor of my family, ask a tithe of me, and I shall deliver it forthwith.", violetMeteoriteExplore.bind("trash3"));
			addChoice("Can we just skip this silly shit?", violetMeteoriteExplore.bind("trashSkip"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash3") {
			append("\"A teet, you say?\"");
			addChoice("A tithe. Like, a tax.", violetMeteoriteExplore.bind("trash4"));
			addChoice("Just... nevermind, let's have sex or something.", violetMeteoriteExplore.bind("trashSkip"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash4") {
			append("\"Ahhhhhh!\" Bins scoops a nodule of "+(isActive("Candy Ring")?"white chocolate":"shit")+" off the burbling surface of the brown hot springs and drops it into his lazy, open maw, like a single grape.\n\n\"Yesh,\" he mumbles, chewing. \"A taxsh... ah, it makes me sho proud to rule thish kingdom of "+(isActive("Candy Ring")?"candy":"shit")+" when such loyal subjectsh inhabit it...!\"\n\nThe monkey is basically gobbling your whole "+pickByGenitals("nutsack", "cooter", "nutsack")+" at this point. He hears the magnanimous crescendo in his king's voice and knows, instinctively, that someone is about to get filthfucked.\n\nBins sucks the remaining brown from each of his tiny fingers and wipes them off on his cute little raccoon eye mask. He must have a habit of that, you realize, because the fur there is much darker than it should be.\n\nHe has but one request of you: \"You owe your king some abuse.\"");
			addChoice("Yes, my lord. Anything you wish, my lord.", violetMeteoriteExplore.bind("trash5"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashSkip") {
			append("\"Aw,\" he pouts. \"I was having fun with that... no one ever plays along except Lana... well, fine. Just come rape me or something, then.\"\n\nHis pet monkey backs off and bows, giving you full unimpeded access to his king.");
			addChoice("Yes, my lord. Anything you wish, my lord.", violetMeteoriteExplore.bind("trash5"));
			addChoice("Okay~!", violetMeteoriteExplore.bind("trash5"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash5") {
			var s:MintSprite = addSprite("assets/img/effect/rottenKing");
			s.x = GAME_WIDTH-s.width*1.2;
			s.y = GAME_HEIGHT;
			s.scaleX = 0.6;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Aogami", "");
			tween(s, {y: -s.height*1.2}, 2, {ease: QUINT_OUT, onComplete: function() {
				tween(s, {y: 55, scaleX: 1}, 1.5, {ease: BOUNCE_OUT});
			}});
			append("Bins leaps off his throne and belly-flops\ninto the thick, chunky waters of the spring.\n\nHis shorts slide right off~");
			addChoice("Woah jeez.", violetMeteoriteExplore.bind("trash5a"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash5a") {
			append("Only his snout and eyes, with their cute mask, protrude above the surface.\n\nYou slip in too. Creamy waves of "+(isActive("Candy Ring")?"hot chocolate":"rancid sewage")+" lap against your "+pickByGenitals("cock", "cuntlips", "cock")+" and kiss the curves of your waist.\n\n\"C'mere,\" he says underwater, and it turns into bubbles. His little body slips through the murky brown and brushes against you. It's hard to feel him distinctly, when the space between your regular-sized belly and his cute cub belly is padded by "+(isActive("Candy Ring")?"so much thick choco choco yummy yummy hot n steamy fun time goodness":"rotten logs of shit and old snotty tissues")+". You can only reach out and hope to rub around the general form of his crotch, his asscheeks, his armpits.\n\n\"I said <!i>c'mere.<!i>\"\n\nHe grabs your arm and wraps it around his shoulders. \"Take charge. Dom me. C'mon. I can take whatever, so go wild, okay?\"\n\n"+(isActive("Candy Ring")?"White-chocolate truffles":"Old rotten globs of food")+" float by. The wind tickles your face. His pet monkey sits on the edge of the pool, legs splayed, "+(isActive("Candy Ring")?"chocolate-coated cock":"the smooth, musky, thin-furred parts of his inner thighs")+" glistening.");
			addChoice("How do I get your pet to help me rape you~? You got a whistle or a command for that?", violetMeteoriteExplore.bind("trash6Monkey"));
			addChoice("Stuff his little throat with "+(isActive("Candy Ring")?"the truffles":"rotted food")+".", violetMeteoriteExplore.bind("trash6Throat"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Monkey") {
			append("\"A whistle? He's a monkey, not a dog.\"\n\nWithout a second of hesitation, Bins simply says: \"Rape time! <3\"\n\nHis pet pushes off with an excited little primate hoot and splashes into the \"water\" to join you. First thing, he grabs Bins by the skull with one of his gangly mitts and dunks the little raccoon's face under the surface, just to establish dominance with some breath control. He blinks and makes a couple ooo-ooo noises at you, grinding the cub's face against your "+pickByGenitals("cock", "cunt", "cock")+" underwater, as if to say 'help me.'\n\nYou thrust forward automatically, smushing "+(isActive("Candy Ring")?"choco-chunks":"huge logs of shit")+" over his face with your "+pickByGenitals("throbbing dick", "hips ", "throbbing dick")+". He gasps for breath against your bare skin, barfing sluggish bubbles up the underside of your belly, but no matter how much he gasps, he can only get "+(isActive("Candy Ring")?"sweet candy":"filthy brown liquid")+" into his needy lungs.");
			addChoice("Mmnn... alright, let him up.", violetMeteoriteExplore.bind("trash6Monkey2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Monkey2") {
			append("The monkey doesn't know that command.\n\nThrough the brown murk, you see Bins's desperate, ass-jiggling thrashings. His pet doesn't care. He just closes one eye, sticks his long tongue out, and lines his hairy cock up with the boy's crack. The head pushes "+(isActive("Candy Ring")?"chocolate gunk":"wads of soaked, used toilet paper")+" out of the way as it hotdogs through the crevice.\n\nHe rams forward, just as Bins goes limp. His monkeycock pierces the "+(isActive("Candy Ring")?"yumminess":"soggy paper")+" and sinks deep inside that little raccoon ass. Before long, the thrashing starts up again.");
			addChoice("Pull him up.", violetMeteoriteExplore.bind("trash6Monkey3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Monkey3") {
			append("You pull Bins up out of the water. He gasps hard, a deep, gurgly gasp, and loose globs of "+(isActive("Candy Ring")?"chocolate":"some stranger's shit")+" splutter out over his chin, down her perfectly flat boychest, then come to rest right at the crest of his belly bulge.\n\nThat bulge swells and shrinks with each feral thrust the monkey feeds his little ass. Bins can barely get a breath through his "+(isActive("Candy Ring")?"choco":"shit")+"-clogged lungs before his pet grabs him by the throat and starts screeching like a chimp in a territorial dispute and raping him so hard it creates waves in the spring which wash over the sides and shower other people over their heads with "+(isActive("Candy Ring")?"delicious treats":"slimy, rotten sewer water")+".");
			addChoice("Cum.", violetMeteoriteExplore.bind("trash7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Throat") {
			cumEffect();
			append("You scoop up "+(isActive("Candy Ring")?"some tiny white truffles":"a rotten slab of steak and two mouldy potatoes")+" and shove the whole fistful in his mouth at once. He <!i>grlrrrrkkks<!i> and stumbles back, feetpaws slipping on the "+(isActive("Candy Ring")?"choco-coated":"mucky")+" bottom of the spring. Luckily, his pet monkey dives in and grabs him by the head just before he falls underwater, which provides a nice anchor for your unrelenting force-feeding.\n\n"+(isActive("Candy Ring")?"Even as Bins groans and struggles to chew the truffles you already forced in his mouth, you pop a couple more past his lips":"The steak is too hard for him to chew, so he just ends up trying to swallow it whole, his throat bulging out obscenely as strands of slimy, rotten meat slop down his front")+". He starts coughing and choking, eyes watering, and his boner pops out from underneath the surface. It's got a"+(isActive("Candy Ring")?"nother truffle":" shitchunk")+" nuzzled into its tip. Almost looks like its own cute crown.");
			addChoice("What's wrong? Too much?", violetMeteoriteExplore.bind("trash6Throat2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Throat2") {
			if (isActive("Candy Ring")) {
				append("You peer at the truffles in your palm. Despite bobbing around for so long in the hot water, they're remarkably intact. Their shells are smooth, shiny white chocolate, and the insides are milk chocolate— as far as you can tell, from the tiny beads that leak from the particularly soft and warm bits of each shell.\n\nLovingly, and with some gratitude for the sturdiness of the monkey's grip on his little skull, you slip three more inside. He pleads silently with his eyes for more, moaning and gumming the sweet glob of white and brown in his mouth. Every attempt at swallowing just brings up a gag and forces more of the creamy mess back to the front of his mouth, where he can only barely keep it contained by shutting his girly lips closed tight and letting his cheeks bulge out adorably.\n\nYou pry his lips open and force three more inside anyway.");
			} else {
				append("You take a look at the potatoes in your hand. Both of them are basically just mush on the inside, loosely held together by a skin riddled by fuzzy, discolored spots. Even just the smell makes your nose shrivel up. You think he'll love them.\n\nWithout even glancing over to see if the steak is still stuck halfway down his throat, you pop both 'tatoes in his maw. His eyes go wide. His little ass and raccoon tail quiver against the monkeydick behind him. You can see the soul-withering flavor of them worm up through his expression; his lil button boysnout crinkles, brown saliva leaks from the corners of his maw, his eyebrows peak together, and his forehead looks like a wifi signal.\n\nSlowly... painfully... he starts to chew them. Most of the steak is in his belly now, but he still gags up a chunk or two in-between bites, sometimes. You can smell the rot from here. As he struggles to swallow, his muscles contract, and meatjuice or tatoslime gushes from his nostrils.");
			}

			addChoice("Make out with him.", violetMeteoriteExplore.bind("trash6Throat3"));
			addChoice("Cum.", violetMeteoriteExplore.bind("trash7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash6Throat3") {
			if (isActive("Candy Ring")) {
				append("Just as he's about to overflow and spew confectionery everywhere you slam your lips to his maw and catch it. The taste is amazing; it's like if you put a dozen chocolate bars in a blender, melted that down, then mixed in some marshmallows and drank it like hot chocolate.\n\nBut you don't want to hog it all to yourself. The monkey doesn't want you to either, he's gesturing wildly at Bins's un-bulged throat.\n\nSo you hold the raccoon boy by the nape of his neck and tonguefuck the mess back into his mouth, forcing him to gulp it down before it starts to come out his nose.");
			} else {
				append("It takes every square iota of willpower in your autonomy department to bring your lips to his. Once you've got them there, you have to scrounge up five additional iotas to cram your tongue past them and into the rancid mess of shit and rotten food coagulating inside. As he gags and gurgles disgustingly against it, you wiggle your big adult tongue deep down his tiny cub boi throat, tonguefucking the rest of the steak and (now mashed) potatoes into his belly.");
			}
			
			append("\n\nYou pull off and suck in a breath of fresh air, except even the air here is humid and thick with flavor. A few brown strands still connect your bottom lip to his upper one (were they really that misaligned? You guess you lost track) but, somehow, Bins just barely manages to swallow whatever else is left in his maw and start breathing again.");

			addChoice("Cum.", violetMeteoriteExplore.bind("trash7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash7") {
			append(pickByGenitals("You yank your cock out from underneath the springwater and blast six quick ropes over his cute lil bod, making sure to aim for his face. The first three splatter over his eyelashes, his nose, his panting maw, but the latter three aren't quite powerful enough to make it, and they end up dribbling over his collarbone, cute perky nips, and his obscenely bloated tummy.", "You yank his face down almost to the surface of the springwater and grind your pussy all over it. You make sure he keeps his eyes and mouth open while you let your feminine juices gush all over his eyelashes, his nostrils. His cute raccoon mask markings get soaked with shining, off-white cuntslime, and some of it even dribbles down to pool in his collarbone.", "You yank your cock out from underneath the springwater and blast six quick ropes over his cute lil bod, making sure to aim for his face. The first three splatter over his eyelashes, his nose, his panting maw, but the latter three aren't quite powerful enough to make it, and they end up dribbling over his collarbone, cute perky nips, and his obscenely bloated tummy."));
			addChoice("Phwaaa. Wind down.", violetMeteoriteExplore.bind("trash8"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash8") {
			append("You doggy-paddle to the edge of the pool and throw your arms over it.\n\nBins and his monkey pal follow you.\n\nFor a while, all three of you just sit there, using the heated rock edge as a backrest.\n\nYou let your lower bodies relax. They float up to the surface of the spring and bob around lazily. Occasionally, a "+pickByGenitals("cock or nutsack will bump against another", "cunt will bump into a cock", "cock or nutsack will bump against another")+", but, otherwise, no one tries to molest anyone else while you're all still catching your breath.\n\nYou just lay your head back and watch the steam clouds curl.");
			addChoice("Phhhwaaaaaa... sooo... where'd you get that monkey?", violetMeteoriteExplore.bind("trash9"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash9") {
			append("\"I saved him. They're endangered as fuck,\" Bins says. The monkey grunts with affirmation.\n\n\"There was a craze back in the 20's, you know, when it first really started sinking in that we might never see a player again, and their population got decimated by lonely people. Everybody started taking them as pets, painting them grey like the default player model, dressing them up with the floating nametag above the head and everything. Of course,\" he purrs, groping that fat, hairy monkeycock with one paw and squeezing its butt with the other, \"they're also just one of the sexiest, raunchiest, and most intelligent kinda ferals out there, so... a lot of them got, uh, over-used.\"");
			addChoice("Oh... oh jeez...", violetMeteoriteExplore.bind("trash10"), {kinks: ["Snuff"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash10") {
			append("\"It was a shitshow, yeah. I try and keep to the forest and the meteorite as often as I can, now, because they've become no-kill zones for ferals. The city... well, they're working on it. A couple restaurants have closed. I don't know. Maybe they'll get there in a decade.\"");
			addChoice("It's still okay to fuck respawnable creatures to death, though, right? Like cub raccoons?", violetMeteoriteExplore.bind("trash11"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash11") {
			append("It takes a second for him to register what you just said, but when he does, he shivers so violently that little ripples surround his body. "+(isActive("Candy Ring")?"":"A few bubbles even appear between his legs.")+"\n\nHe fidgets with a "+(isActive("Candy Ring")?"truffle":"shitlog")+" that happens to float by.\n\n\"You... you wanna... do that to me?\"");
			addChoice("Of course~! Look at yourself!", violetMeteoriteExplore.bind("trash13"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash13") {
			append("He peers down at his body. It's a pretty basic cub boi bod, bit chubby in the right spots, but it's coated with a gorgeous "+(isActive("Candy Ring")?"chocolate":"slimy")+" sheen that adds an extra kind of allure to it. It's like a big puddle of flat, untouched ice. The more perfectly smooth and intact it looks, the stronger the urge is to stomp on it.\n\nHe runs a paw over his big belly. The monkey slaps it lightly and makes an excited little noise as it jiggles back at him.\n\nBins watches his excitement. \"I guess I am pretty snuffable, aren't I?\"");
			addChoice("Supremely snuffable. Now, how should I do it?", violetMeteoriteExplore.bind("trash14"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash14") {
			append("\"You're premeditating it?\" he pouts. \"It's much more exciting as a spur-of-the-moment thing, isn't it...?\"");
			addChoice("But I wanna make sure you're happy.", violetMeteoriteExplore.bind("trash15"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trash15") {
			append("\"What!?\"\n\nBins stands up in the shallow water and puts his hands on his hips with a <!i>splash.<!i>\n\n\"Who cares if I'm happy?! Me? Big whoop! Make me miserable, gross me out, <!i>murder<!i> me!\"\n\nHe turns around with a huff and sticks his butt out at you. Now that you get a good look at it, you realize his hole is beyond destroyed from some earlier adventure, and it's also packed to overflowing with "+(isActive("Candy Ring")?"cum and chocolate":"shit and rotted trash")+". He reaches back and yanks his cheeks open to punctuate that fact.\n\n\"It's basically all I'm good for,\" he says huskily. \"Raccoons are kinda like pests, y'know? So my role in life is a stress ball "+(isActive("Candy Ring")?"candyhole":"toilet garbage bin")+" murdertoy. I'm not here to be pleased, I'm here to be raped and ruined <!i>forever!!!<!i>\"\n\n...\n\n\"Well, until my next respawn, anyway...\"");
			addChoice("Alright alright I'll just do whatever I want to you, jeez. Never met a cub so picky about foreplay. ("+(isActive("Candy Ring")?"Drown him in the yummy chocolate":"Blow my nose in his mouth")+".)", violetMeteoriteExplore.bind((isActive("Candy Ring")?"trashDrown":"trashSnot")));
			addChoice("Fine, jeez. (Drown him.)", violetMeteoriteExplore.bind("trashDrown"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashSnot") {
			append("You shove that little ass out the way and grab his skull with both hands to hold him in place while you plug your nose in his mouth and blow hard. Green and yellow snotchunks splutter out over his tongue.\n\nBins tenses up and enters heaven for a couple brief seconds. He savours the intense taste of your hot, fresh nose gunk. You feel him smack it around inside his mouth; thick goopy strands form between his tongue and the roof. Then you feel an intense suction as he starts to slurp more snot out, actively digging for it with his tongue, coaxing more and more chunky boogers down his throat. With every gulp, his esophagus gets stickier, and his gags get louder and more violent...\n\nHe gurgles into your nostrils around his gummed-up uvula: \"Kill me.\"");
			addChoice("Pull off and drown the little snuffslut.", violetMeteoriteExplore.bind("trashDrown"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown") {
			append("You slam his face underwater with a colossal SPLOOOOSH.\n\nThe monkey sits on the rim of the pool now, casually jacking off, swinging his feet in the water. His long tail snakes around and yanks Bins's feet out from underneath him. His little body flops down into the water. Now he can't even push back to the surface if he wants to.\n\nThe first ten seconds are calm. He stays still, allowing you to line up your "+pickByGenitals("cockhead", "fist", "cockhead")+" with his "+(isActive("Candy Ring")?"":"shit-smeared")+" hole. But as time goes on, he starts to squirm a little... through the murky water, bubbles rise. You run a soft, loving caress over his tiny throat, and you can feel its muscles working to stay closed. If you run your hand even lower, over his collarbone, between his slightly pudgy boitits, you can feel his heart starting to race beneath your palm.");
			addChoice("Drownfuck.", violetMeteoriteExplore.bind("trashDrown2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown2") {
			append("You work your "+pickByGenitals("comparatively massive cock up his ass, right down to the nuts", "fist about halfway into that gaped cub ass", "comparatively massive cock up his ass, right down to the nuts")+". He breaks concentration and starts squealing underwater. It's such a quiet, pathetic noise, since it's muffled through so many layers of "+(isActive("Candy Ring")?"chocolate":"hot sewage")+", but as long as you don't thrust too hard and splash around, you can hear it.\n\nAfter another ten seconds of that, he breaks down completely and starts thrashing in a real panic.\n\nYou knew this would happen. Thankfully, you're ready to grab his throat and hold him under, so you don't even have to break the rhythm of your "+pickByGenitals("rape", "punchfuck", "rape")+" for a second.");
			addChoice("Trash talk him.", violetMeteoriteExplore.bind("trashDrown3Talk"));
			addChoice("Finish him.", violetMeteoriteExplore.bind("trashDrown3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown3Talk") {
			append("You lean down and put your mouth as close as you can to the surface of the spring. Hopefully he can hear you above his cute, gurgling, gagging screams.");
			addChoice((isActive("Candy Ring")?"Eat that fuckin chocolate river, Gloop. Wonka ain't here to save you now":"Awww, you want some air, huh? Maybe you can try sucking the bubbles from some greasy beer cans..."), violetMeteoriteExplore.bind("trashDrown3TalkMore"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown3TalkMore") {
			append((isActive("Candy Ring")?"You could have sworn he just giggled underwater. Well, maybe it was just a weird gag...":"He thrashes and starts to inhale the filthy water, swallowing food scraps, slimeglobs, and whole shitlogs in his panic."));
			addChoice((isActive("Candy Ring")?"Sing it with me now, CHOCOLATE RAAAIIIIN~!":"That's it... take all that sewage into your lungs... I bet you love breathing shit, don't you, cub~?"), violetMeteoriteExplore.bind("trashDrown3TalkEvenMore"));
			addChoice("Finish him.", violetMeteoriteExplore.bind("trashDrown3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown3TalkEvenMore") {
			append((isActive("Candy Ring")?"He... well, he tries his best.\n\n\"CHNNNRGHLT RYYYYGH!!\" he sings. A gaggle of gags rushes up his throat near the end and cuts him off.":"Bins splutters something underwater which might have been \"uh huh.\" You're astounded to see that he still has the strength to reach out and collect more fat, greasy shitlogs before stuffing them down his throat and straight into his little lungs. He's trying to make his corpse as cute and bloated as possible before he dies, you think."));
			addChoice("Finish him.", violetMeteoriteExplore.bind("trashDrown3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown3") {
			append("You wrap both hands around his throat and squeeeeeze.\n\nFirst he stops thrashing. Then, he stops twitching. And, finally, he stops cumming.\n\nNow you really start to "+pickByGenitals("rail the fuck out of his tiny ass", "fistfuck him", "rail the fuck out of his tiny ass")+". He respawns somewhere out of your field of vision and splashes over excitedly to watch you rape his corpse. It floats to the surface, pale, with "+(isActive("Candy Ring")?"chocolate":"shit")+" leaking from its slack maw.\n\nYou don't really pay him much attention, since you're so busy with a much cuter version of him already, but out of the corner of your eye you see him throw his arms around the monkey and kiss those big ape-ish lips all hot and sloppy. His boycock grinds up against the monkey's hairy thighs. In about four seconds they're absolutely coated with raccoon pre.\n\nYou finish up (just from the sight of his corpse flopping around so cutely, bobbing and dipping in the springwater...) and now you're not busy anymore.");
			addChoice("Nnnfuck, go grab him and kill him again.", violetMeteoriteExplore.bind("trashDrown4"), {kinks: ["Abuse", "Gore"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown4") {
			append("You rip him away from his feral lover and punch him in the throat, lovingly. He drops to his knees, neck-deep in the water, and looks up at you like you're God.\n\nYou can't NOT punch him in his cute face over and over and over until his nose breaks and he's gasping for breath past the bloodflow. You can't NOT grind your "+pickByGenitals("hard cock", "cunt", "hard cock")+" over his wound and smear your nuts around the dent in his face.\n\nAnd you absolutely positively definitely 100% CANNOT avoid bashing the back of his skull off the rocks that make up the spring's edge and splitting it open so that his brains slop out in with the rest of the equally worthless "+(isActive("Candy Ring")?"junk (food)":"waste")+" floating around in this spring.\n\n... He respawns and sprints back over now, tongue out, panting, cumming. \"Again!\" he squeaks adorably, cocklet thwapping up against his belly with each stride.");
			addChoice("Again again again. Like a dozen more times.", violetMeteoriteExplore.bind("trashDrown5"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown5") {
			append("You choke him out.\n\nYou break a greasy bottle on the rocks and twist it into his perfectly smooth, freshly respawned belly before he's even had the chance to pack it with "+(isActive("Candy Ring")?"truffles":"shitlogs")+" again.\n\nYou get the monkey to help you hold him still while you suffocate his thrashing face between your asscheeks and "+(isActive("Candy Ring")?"grind your hole back and forth over his nose and mouth":"squeeze out a barrage of sloppy, soft shitchunks over his little nose and mouth")+".\n\nAfter the sixteenth death, you can't even really tell Bins apart from the massive, floating pile of little boy corpses anymore. He's either laying still with a lusty expression while you murderfuckrapetorture him, or a dead version of him is doing the same.\n\nThings just keep getting more and more intense; the steam of the springs seems to thicken, and all the other people who used to be relaxing just ten feet away move along into the fog to give you your own private snuff session. You guess the constant cub screams were kind of getting in the way of their relaxation...");
			addChoice("MOREMORE MOREMORE MOREmoremore. Get him fucking pregnant", violetMeteoriteExplore.bind("trashDrown6"), {kinks: ["Baby", "Pregnancy"], cost: ["Capsule", 5]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown6") {
			append("Things are getting seriously out of control.\n\nFirst you mistakenly feed two capsules to two separate corpses, then, by the time you do find a Bins with a heartbeat, he's too horny to recognize you or form a coherent \"Yes, preg me\" or \"Man I think I'm done for now.\" The only thing he can do is squirm around in the ecstacy of chain-respawn orgasms and babble about how much of a worthless snufftard he is.\n\nFinally, you manage to stop Bins from trash-talking himself long enough to force the three remaining capsules down his throat. There's so much cum floating around on the surface of the spring at this point you don't even need to worry about where you'll find some to preg him with, you can just scoop up a bunch of water and splash it up his ass.\n\nSo many of his bodies have bloated bellies, but this belly is the bloatedest. Triplet Fuckmeats quickly grow to full size inside his tiny cub body, stretching him cartoonishly and forcing him to snap out of his lustful stupor.\n\n\"I'm puh... puh... puh...\"");
			addChoice("Yes. Pregnant.", violetMeteoriteExplore.bind("trashDrown7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown7") {
			append("He tries to reach up and hug you but he can't even get his arms out past his stomach bulge.\n\n\"Unnnnffuuuuuuccckkk~!\" he moans. \"Moremoremoremoremoremoremoremoremoremoremoremoremoremore!\"");
			addChoice("More what?", violetMeteoriteExplore.bind("trashDrown8"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown8") {
			append("He squirms with neediness. Internal pressure is mounting. Underwater, his little asshole starts to stretch open...\n\n\"More depravity!!! Ruin me more!! Everything, do everything!!!\"");
			addChoice("Mmmm, so I assume you want me to...", violetMeteoriteExplore.bind("trashDrown9"), {kinks: ["Baby", "Snuff"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown9") {
			append("He cannot stand to watch you act so passive now, just looking down at him with your "+pickByGenitals("cock jutting out above the water, with the water lapping so tantilizingly at your nuts", "cunt dripping onto the perfectly still surface of the water", "cock jutting out above the water, with the water lapping so tantilizingly  at your nuts")+".\n\nHe begs you:\n\n\"Everything.\"");
			addChoice("Next.", violetMeteoriteExplore.bind("trashDrown10"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown10") {
			append("With a howl of mirth, Bins gives birth.\n\nThe triplets are born drowning by default, thrust into a world of "+(isActive("Candy Ring")?"sweet, yummy, melted chocolate":"garbage and shit")+" before they know anything about anything. Not that their dumb NPC brains would be able to comprehend it, anyway. Each of the cute little raccoon babies bobs to the surface gagging and spluttering with happy confusion— even in a situation like this, their Fuckmeat instincts ensure that a "+(isActive("Candy Ring")?"chocolate":"shitchunk")+" clog-up in their lungs is the best thing that's ever happened to them.\n\nBins is busy fingerfucking the gaped-out entrance to his ass. Slobber runs over his chin as he curls his toes and throws his head back with pleasure spasms, desperate to feel the intense stretching he'd felt in labour just five seconds ago.");
			addChoice("Grab a random baby and "+pickByGenitals("rape", "fistfuck", "rape")+" it in front of his face.", violetMeteoriteExplore.bind("trashDrown11"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown11") {
			append("You grab a Fuckmeat by its ankle— boy or girl, you don't know and don't care— and drag it through the floating "+(isActive("Candy Ring")?"confectionery":"trash")+", up to its daddy's face. You shove its head down and force it to make out with daddy (he's currently just slobbering and licking anything he can get his hands on, so it works out) while you feed "+pickByGenitals("every single inch of your cock", "a whole fist", "every single inch of your cock")+" up that impossibly tiny baby asscrack.\n\nBins cums again for the eighty-seventh time, harder than ever, and plasters the cunt's face with cubcum as you split it open from inside with your "+pickByGenitals("dick", "fist", "dick")+". You twist "+pickByGenitals("the shaft", "your knuckles", "the shaft")+" around slowly, screwing in deeper, until you feel the baby's tiny, underdeveloped ribcage <!i>crack.<!i>\n\nIts life lasted three minutes in total, and it died with daddy's tongue down its throat and a stranger's "+pickByGenitals("cock", "knuckles", "cock")+" bulging its esophagus.");
			addChoice("Twice more.", violetMeteoriteExplore.bind("trashDrown12"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown12") {
			append("You kill the second Fuckmeat in the same way; it goes out with a happy little squeak, and a gush of natural lube that coats the raccoon's entire body. It's too dense and sticky to wash off in the spring water, so you guess Bins's girly hips are just gonna be permanently shiny and lubed-up for a while.\n\nAs you reach for the last one, any part of it— you could wrap your fingers halfway around a maw and a nostril and treat that like a perfectly normal handle, for all you care— your fingers close around nothing.\n\nYou turn around. You look left, right. But... there's only a bunch of raccoon corpses everywhere.");
			addChoice("No come on go find it!! I'm so close!!!", violetMeteoriteExplore.bind("trashDrown13"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown13") {
			append("... Ah.\n\nThere it is.\n\nYou look way on the other side of the pool. A figure twists and howls in the steam. The figure's limbs are sorta gangly, but also powerful, in the way they tense and stretch so flexibly. What you initially thought was the blur of moonlight filtered through mist turns out to be a fine coat of "+(isActive("Candy Ring")?"":"greasy ")+"fur.\n\nBins's pet monkey snatched the last Fuckmeat. It stands on the edge of the pool now, both footpaws clasped to the rocks, and it's thrusting brutally deep down the little NPC's throat. It screeches and screams with pleasure. It bucks forward, struggling to go nuts-deep and feed the baby the entirety of its "+(isActive("Candy Ring")?"choco-coated":"shit-stained")+" cock, even if it dies as a result.\n\nYou're reminded of your own distant ancestors, the majority of human history: the blind brutality of territorial primates; the millions of rapes during pillagings or tribal take-overs; and, most of all, you're reminded of the pointless, inane child sacrifices carried out to secure the health of the crops for <!i>you<!i>, the child of their children, through the graces of gods that they made up so they could feel that they were a little more special than the other dumb, violent monkeys.\n\nYeah, that. That's what this fake baby rape reminds you of.");
			addChoice("Wtf Mynt, that's my specie [Backspace x26]", violetMeteoriteExplore.bind("trashDrown15"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown15") {
			append("...");
			addChoice("Go help him cum.", violetMeteoriteExplore.bind("trashDrown16"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashDrown16") {
			append("You wade through the spring and grab the fucktot by its plump asscheeks before forcing it to swallow every single inch of that hot monkeycock. It gags and shudders violently as its esophagus rips open and both those full, jiggling nuts pap against its face. The monkey eeek's happily and holds the back of the baby's skull down hard.\n\nHe cums deep inside its belly. He smears the "+(isActive("Candy Ring")?"chocolate off its":"sweat and shitstains of its hairy")+" nuts and onto the poor, dying snuffslut's excited little expression. The very head of his cock <!i>pops<!i> out that tight little asshole, all the way through~\n\nYou pull it off and try to kiss the wound better, but the poor thing has been so violently raped, it basically just falls apart into babymeat in your hands and <!i>plunks<!i> down into the water.");
			addChoice("Okay it's time to wind down now.", violetMeteoriteExplore.bind("trashWindDown"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashWindDown") {
			append("You lay on your back, totally exhausted.\n\nThe gently flowing waters carry you away.");
			addChoice("Mmmnn... where am I going...?", violetMeteoriteExplore.bind("trashWindDown2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashWindDown2") {
			append("Well, you're mostly just going in circles. This isn't a river, it's a circular pool.\n\nOccasionally you'll bump into a Bins corpse or the monkey's tail or a piece of dead baby, but otherwise, everything is perfectly still and silent and formless. As you look up into the sluggish steam-clouds, you kind of get the feeling that you could be floating on the island's still ocean right now, and you wouldn't be able to tell the difference.");
			addChoice("Ahhh... where's alive Bins...?", violetMeteoriteExplore.bind("trashWindDown3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashWindDown3") {
			append("You call for him.\n\nHe murmurs something back, and swims up next to you. His arms wrap around your chest. A sweaty raccoon paw "+(data.hasBoobs?"gropes your boob":"tweaks your nipple")+" by way of greeting.\n\n\"I'm here,\" he says. \"And my title has been claimed by a successor. You are the new "+(isActive("Candy Ring")?"Sweet":"Rotten")+" "+pickByGender("King", "Queen", "Monarch")+" now. Your duties include... sitting up here sometimes... LARPing... looking cute... oh, and you have to keep up a diet of "+(isActive("Candy Ring")?"chocolate":"raw, semi-soft shitlogs")+" and nothing else for four days.... zzzz... four days out of the... zzzzzzz.... week...\"");
			addChoice("Are we gonna drown if we... zzzz... fall asleep here?", violetMeteoriteExplore.bind("trashWindDown4"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashWindDown4") {
			append("\"Yuh... zzzzzzzzzzzzzz... definitely... good thing... zzzz.... there aren't any caves... zzzzz... beneath us...\"");
			addChoice("That's so... zzzzzzzzzzzzzzzzzzzzz... hawt... zzzzzzzzzzzzzzzzzzzzzzzzzzzz...", violetMeteoriteExplore.bind("trashWindDown5"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "trashWindDown5") {
			append("You fall asleep.\n\nSo does he.\n\nSo does the monkey, although you aren't sure where he is. You just hear his cute, distinctive monkey snores.");
			addChoice("Move along.", violetMeteoriteHub);
		}


		if (which == "ExploreCrack") {
			TheCrack.explore("explore");
		}

		if (which == "ExploreHyper") {
			HyperLand.explore("explore");
		}

		if (which == "ExploreSpicy") {
			setLocation("Spicy Swamp");
			bindKey(F, msg.bind("Paid respects."));
			append("You walk the perimeter of Violet Meteorite's crater.\n\nAlong the City battlements everything has been trampled by traffic. Along the Apothecary scaffolds, everything has been scavenged by the staff or eroded by the sea.\n\nBut along the forest, far under the hanging goblin villages and far above the mined-out caves, you do find something: miles of sloped marsh, loose and withering vegetation from a different biome, huge weeping trees with half-obliterated roots that still cling to life in a climate they weren't designed for.\n\nThese are the last frail traces of Spicy Swamp. It was the heart of the island, the capital of filth and extreme depravity, and countless sluts would have drowned and frolicked happily in its mud had the meteorite not crushed it five seconds after the game started.");
			addChoice("Pay respects.", function() {
				clear();
				append("\n\nYou tuck a Sweetgrass Bouquet inside the fragments of a half-buried treehouse, frought with rotten vines and graffiti. The words <!i>Cage Statt's Cozy Home<!i> are still barely legible. They've been carved into a cute little plaque on some splinters that used to be a door.");
				addChoice("Back to World Map.", function() {
					WorldMap.map();
				});
			}, {cost: ["Sweetgrass Bouquet", 1]});
			if (isActive("Candy Ring") == false)
				addChoice("Pay respects from my belly.", function() { clearText(); append("\n\nYou lean over the destroyed husk of a toy— not a sex toy, but a little rubik's cube with a faded sticker on it that says <!i>Property of Septrica<!i>. Sick with grief, you cram your fingers down your throat and tease out a couple somber splashes of hot vomit for all the cute pukebowl subs that once called this place home. As half-digested stomachsludge washes away all the broken cubelets, and as your heart warms with the fitting sight of all that disgusting, chunky mush soaking down to join the rest of the mud and filth in this sacred expanse, you're overcome with relief and satisfaction— now that you threw up all over a rubik's cube, you feel the spirit of Spicy Swamp may finally be put to rest."); }, {kinks: ["Vomit"]});
			addChoice("Pay respects from my butt.", function() { clearText(); append("\n\nYou squat over a tattered strip of cloth that used to be a collar (the tag says <!i>Marei, owner: Septrica<!i>) and "+(isActive("Candy Ring")?"push out":"rip a positively fetid wet fart that eventually splutters itself into")+" "+(isActive("Candy Ring")?"a nice little piece of white memorial butter tarts":"shit")+". As the flow trickles out to just a few chunks, you yank your asscheeks apart and roll back and forth a bit on your heels, pucker winking, just to squeeze out the last "+(isActive("Candy Ring")?"dollops of whipped cream":"drops of shitjuice")+" in memory of all the swampfolk who lost weeks or months of their sanity to solitary confinement when the meteorite landed on them and they were all forced to respawn alone inside its closed cave systems."); }, {kinks: ["Raunch", "Scat"]});
			addChoice("Back to World Map.", function() {
				WorldMap.map();
			});
		}

		if (which == "GryphonFly") {
			append("Seems you've coaxed "+(data.violetGryphonStrawberry?"Strawberry Crotch":"your gryphon pal")+" out of reclusion. "+gryphJunk("He's", "She's", "They're")+" perched on a crag up ahead, squinting at the moon.");
			addChoice((getJournalEntries().contains("Cade2")?"Did you enjoy the party"+(data.violetGryphonStrawberry?", Strawberry":"")+"?":"Oh. Hi again."), violetMeteoriteExplore.bind("fly2"));
		}

		if (which == "fly2") {
			append(gryphJunk("He peers", "She peers", "They peer")+" down at you comfortably from "+gryphJunk("his", "her", "their")+" perch.\n\nYou're treated to "+(getJournalEntries().contains("Cade2")?"the mental image of a big gryphon belly, filled to the absolute max with cake":"a highlight reel of visual memories from your first meeting. Most of them are pretty steamy")+".");
			addChoice((getJournalEntries().contains("Cade2")?"I'll take that as a yes. <3":"Oho my... what are you doing out here?"), violetMeteoriteExplore.bind("fly3"));
		}

		if (which == "fly3") {
			append(gryphJunk("He swoops", "She swoops", "They swoop")+" off the crag, circle"+gryphJunk("s", "s", "")+" back, and land"+gryphJunk("s", "s", "")+" at your feet with a soft rush of feathers.\n\n... Then... that fierce beak slips along your cheek. The feathers below it rub over you, warm and soft. "+gryphJunk("He starts", "She starts", "They start")+" to nuzzle you.\n\n<!i>I owe you.<!i>");
			addChoice("For what?", violetMeteoriteExplore.bind("fly4"));
		}

		if (which == "fly4") {
			append(gryphJunk("He pulls", "She pulls", "They pull")+" back and lick your lips. "+gryphJunk("His", "Her", "Their")+" tongue tastes like "+(getJournalEntries().contains("Cade2")?"cake":"strawberries")+".\n\n<!i>"+(getJournalEntries().contains("Cade2")?"For letting me come to the party":"That was the best sex I'd ever had. And I live in a porn game")+".<!i>");
			addChoice("Oh, that was nothing...~", violetMeteoriteExplore.bind("fly5"));
		}

		if (which == "fly5") {
			append("<!i>Please, let me pay you back. What could a gryphon do for you?<!i>");
			addChoice("... You could fly me to the moon, maybe? :3", violetMeteoriteExplore.bind("fly6"));
		}

		if (which == "fly6") {
			append(gryphJunk("He nudges his beak", "She nudges her beak", "They nudge their beak")+" between your thighs, up against your "+pickByGenitals("nuts", "cunt", "cunt and nuts")+".\n\n<!i>... For you. Only for you. I don't let just anyone ride me like a pack animal, you know, but for you... climb on.<!i>");
			addChoice("Climb on!", violetMeteoriteExplore.bind("fly7"));
		}

		if (which == "fly7") {
			disablePause();
			playSound("assets/audio/music/flyMeToTheMoon");
			append(gryphJunk("He flies", "She flies", "They fly")+" you to the moon and "+gryphJunk("drops", "drops", "drop")+" you off without landing~!");
			cameraFadeOut(0, 10);
			timer(12, BrightForest.brightForestExplore.bind("falseMoon"));
		}

		if (which == "JohnLanaVM") {
			data.johnLanaVMDone = true;
			var s:MintSprite = addSprite("assets/img/effect/johnAndLana.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
				s.x = GAME_WIDTH-s.width*1.05;
				s.y = GAME_HEIGHT-s.height-55;
			append("You bump into John and Lana.\n\nJohn's scanning the skies with binoculars.\n\nLana's polishing his rifle.");
			addChoice("Whatcha lookin for, John?", violetMeteoriteExplore.bind("nerdsJohn"));
			addChoice("Oh hell yeah let's do some gunplay Lan Lan~! <3", violetMeteoriteExplore.bind("nerdsLana"), {kinks: ["Cub", "Male", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "nerdsJohn") {
			append("\""+(data.owlGirlSeen?"Owls":"A certain gryphon I've heard about. Now, this is just hearsay, but apparently they don't have any genitals at all. I'd love to meet a friend like that")+".\"");
			addChoice((data.owlGirlSeen?"Wouldn't happen to be a glitched one, would it?":data.metGryphon>0?"Oh, I've met them. Don't get your hopes up. They definitely have a libido and junk to go with it, it just looks flat at first...":"Are you lonely?"), violetMeteoriteExplore.bind("nerdsJohn2"));
		}

		if (which == "nerdsJohn2") {
			append("\""+(
				data.owlGirlSeen?
					"You've seen her?":
				data.metGryphon>0?
					"... Oh.":
					"What kind of question is that..."
				)+"\"");
			addChoice((
				data.owlGirlSeen?
					"Yeah, she flew into a blue cloud or some shit.":
				data.metGryphon>0?
					"Sorry. :x":
					"Are you?"
				), violetMeteoriteExplore.bind("nerdsJohn3"));
		}

		if (which == "nerdsJohn3") {
			append("\""+(
				data.owlGirlSeen?
					"A coastal cloud, eh... evaporated, infected fluid... perhaps I can calibrate these little bastards to give me a clearer view of the air down over the Floatillery...":
				data.metGryphon>0?
					"Don't apologize. I'm... I wouldn't exactly be first in line to write a report on the specific mechanisms by which gryphon penises enter or exit existence, but if science calls on me, I <!i>will<!i> answer her.":
					"Of course I am? You should've picked that up when I got all sappy on you earlier."
				)+"\"\n\n...\n\nHe puts his binoculars away. \"Welp, my eyes are sore.\"");
			addChoice("The moonlight is blinding up here.", violetMeteoriteExplore.bind("nerdsJohn4Moon"));
			addChoice("Can I kiss em better~? Does eyeball smooching count as a fetish?", violetMeteoriteExplore.bind("nerdsJohn4Kiss"));
		}

		if (which == "nerdsJohn4Kiss") {
			append("John recoils, raises his binoculars back up halfway out of reflex, and furrows his brow so hard it looks like a wifi signal.\n\n\"No and probably.\"");
			addChoice("Awww, why not~?", violetMeteoriteExplore.bind("nerdsJohn4Kiss2"));
		}

		if (which == "nerdsJohn4Kiss2") {
			append("He inches away from you.\n\n\"You're making me uncomfortable. I already told you I wanted this relationship to be platonic. I don't need a reason beyond that to say you can't kiss my corneas.\"");
			addChoice("I'm just joking, man.", violetMeteoriteExplore.bind("nerdsJohn4Kiss3"));
		}

		if (which == "nerdsJohn4Kiss3") {
			append("He shrugs and opens his mouth, but only awkward half-words come out.\n\n\"Moon's nice tonight,\" he eventually croaks, and throws a floppy gesture at it.");
			addChoice("Yeah.", function() {
				violetMeteoriteExplore("nerdsJohn4Moon");
				append("\n\nHe's eager to change the subject away from eye kisses.");
			});
		}

		if (which == "nerdsJohn4Moon") {
			append("He nods and sticks his paws in his pockets. You look at the moon together for a moment.\n\n\"It's fake, you know.\"");
			addChoice((data.moonUnlocked?"I know.":"It is?!"), violetMeteoriteExplore.bind("nerdsJohn4Moon2"));
		}

		if (which == "nerdsJohn4Moon2") {
			append("\"You'll hear a lot of complaining around here about the day/night cycle being broken, but everybody tends to skip over the fact that it wasn't just paused— it was removed entirely. <!i>Some<!i>body shifted the Y offset of our sun and moon up so high that they <!i>floated out of the game<!i> and into some other abandoned construct. Not gonna name any names... starts with an A... yelled at me when I offered him a blowjob, way back in Year 0... last player before you... cough cough.\"\n\nLana's finished polishing his rifle. He slings it over his back and trots up to listen in on your conversation. John smiles at him. \"At least we built a big brand new shiny inflatable moon, right Lana?\"\n\nLana kicks him in the shin.\n\n\"Ow! <!i>They,<!i> I meant <!i>they<!i>... I know you hate it when I talk like I'm still with the Apothecary...\"");
			addChoice("Hmmm... I really need to study up on the lore...", violetMeteoriteExplore.bind("nerdsJohn4Moon3"));
			addChoice("Archbishop, inflatable moon, Apothecary? Come on guys, this is old news.", violetMeteoriteExplore.bind("nerdsJohn4Moon3"));
		}

		if (which == "nerdsJohn4Moon3") {
			append("\"Well—\"\n\nJohn's cell starts vibrating in his pocket. A couple pens rattle out, and he scrambles to answer.\n\n\"Hello? Yeah. Who's this? ... What? Really? Well alright, if you want. I certainly can't tell who you are just by voice. Have you got a report to make, or are you just calling about penis showings? I don't just whip it out for any anonymous caller, you know, you'll have to schedule an appointment. Yeah, five caps a peek, no touching. Right. So you <!i>do<!i> have a report to make. Oh— Bright Forest, okay, but what exactly did you see—?\"\n\nThe phone says something very slow and deliberate. John's eyes go wide.\n\n\"You're sure it's her?\"\n\nThe phone insists.\n\n\"No breasts, right? Just a vagina?\"\n\nThe phone <!i>insists.<!i>\n\n\"R-Right— I knew it wasn't just Kemp getting high and seeing shit— can you keep an eye on her and tell us if she moves? Hello? Hello?\"\n\nThey hung up.\n\nJohn hangs up.\n\nHe grabs lana by a sleeve of his turtleneck and pulls him back over to the van.\n\n\"We got a sighting of a glowvirus host in the forest!\" John says. His voice is thick with a lust for knowledge, all husky, like a slut might sound when they tell their slut friends they got a booty call. \"Rabbit, older, kinda female, so our usual suspect— some anonymous boy just called it in— it's got a good chance to be legit! This might be the key to the mystery!!!\"\n\nHe waves goodbye and practically throws Lana into the passenger seat. Lana sulks. Only half of his's face can be seen above the passenger-side window, but you can tell just from his eyes that he's about to cry.\n\nThe van pulls away in a puff of purple spacedust.");
			addChoice("Oh jeez shit seeya!!... Move along.", violetMeteoriteHub);
		}

		if (which == "nerdsLana") {
			append("You scurry up to Lana, all excited. He holds the rifle protectively against his chest.\n\nYour pet name made him exquisitely nauseous.");
			addChoice("Please? :3 Lemme suck the barrel...", violetMeteoriteExplore.bind("nerdsLana2"));
		}

		if (which == "nerdsLana2") {
			append("His cubcock hardens up, but he doesn't stop clutching the rifle.\n\n\"The saliva might damage it,\" John chimes in, making a point to keep his eyes on the sky. \"Or maybe he wants a little foreplay first? That's my theory, anyway. I don't understand you people...\"");
			addChoice("Touch his cocklet.", violetMeteoriteExplore.bind("nerdsLana3"));
		}

		if (which == "nerdsLana3") {
			append("... He doesn't object. He leans back on his rocky seat of spacerock and spreads his thighs a bit. His nuts plop down onto the rock, and his shaft throbs to life beneath your slowly stroking fingers.\n\nHe points to your mouth, then points to his head.");
			addChoice("Slurp.", violetMeteoriteExplore.bind("nerdsLana4"));
		}

		if (which == "nerdsLana4") {
			append("You lean down and kiss his cockslit, working your tongue around the head. He bucks his girly little hips up and pops the whole thing in your mouth. If you want his rifle down your throat, you're gonna have to open it up with something else first...\n\nLana grabs the back of your skull with both freakish paws and suh-<!i>lams<!i> your face to the base of his crotch so hard you feel your nose twinge with pain. His dick spears your throat open and throbs against your uvula while you gag and swallow in a rush of panic.");
			addChoice("Mmnmnn...", violetMeteoriteExplore.bind("nerdsLana5"));
		}

		if (which == "nerdsLana5") {
			append("His glitchy fingers skitter over your scalp, even though his palms are steady. They feel like dozens of metal marbles rolling around, magnetized to your brain. After a few brutally deep thrusts, and after twisting his hips around to screw his dick down your throat extra deep, he finally pulls off and replaces his cock with the rifle's dark barrel.\n\nYou take it obediently between your lips and suck off all that sweet, grassy tranquilizer residue.");
			addChoice("Mmmph~! (Deepthroat it! Point to the trigger and do a little pow-pow finger motion!)", violetMeteoriteExplore.bind("nerdsLana6"));
		}

		if (which == "nerdsLana6") {
			append("You don't have to deepthroat it. He does that part for you.\n\nLana shoves the rifle forward and buries that girthy barrel down your throat. It digs awkwardly into your flesh, but you don't care, you just slobber all over it like it's just another cock. The sadistic little foxboi looks down at you with an expression of pure contempt, and he spares your eager finger gestures only a glance before moving his own finger down to the trigger and focusing all his effort on fighting the glitch and keeping it perfectly still.\n\nYou watch it carefully, for that first telling twitch, for the moment when it closes down and your slutty mouth gets shot open... but it's so hard to see what it's really doing through the glitches. Every other second his fingertip flickers and looks like it might be a nanometer away from tugging on that tiny plastic tooth. The suspense twists in your gut.");
			addChoice("Pleasepleaseplease!", violetMeteoriteExplore.bind("nerdsLana7"));
		}

		if (which == "nerdsLana7") {
			append("Those pleas come out all gaggy and pathetic. Lana grinds his cock over your thigh, still wet with warm saliva, and works the barrel in and out with slow, deliberate movements. You've never seen his paws this steady. It's a marvel he hasn't pulled the trigger accidentally yet.\n\nJohn's still got his binoculars plastered to his face. His glasses are digging into him. \"Can you two hurry up?\"\n\nLana sticks his tongue out at him and... after dragging his dick over your chest one last time, nice and slow and soft...");
			addChoice("<3!!!!", violetMeteoriteExplore.bind("nerdsLana8"));
		}

		if (which == "nerdsLana8") {
			playSound("assets/audio/environment/tranq");
			append("<!i>Piff!<!i>\n\nHe pulls the trigger and lodges a dart in the back of your throat. You gurgle and gag adorably, sinking down to your knees and letting his cubcock smear precum over your face in the process. Hot numb tingles flicker down to your belly, and up through your mouth, right to the tip of your nose... shivers and tranquilizer race up your brain stem and settle into your skull.\n\nYou pass out. The last thing you see is Lana straddling your face. His perfect, perky little boicock slips back into your numb mouth, extra-hard at the prospect of a sloppy somno-facefuck. If it wasn't for the way he was so clearly twitching with happiness, you wouldn't even know he was cumming.");
			addChoice("Wake up~", violetMeteoriteExplore.bind("nerdsLana9"));
		}

		if (which == "nerdsLana9") {
			unlockUi("trickster", "all");
			append("You wake up hours later with only a slight prickle of pain where the dart used to be. Sweet globules of "+(isActive("Mood Ring")?getMood("Lana"):"sticky fox")+"cum still dribble down the back of your throat.\n\nJohn and Lana are piling into the van and ready to leave.\n\n\"We got a sighting of a glowvirus host in the forest!\" John says. His voice is thick with a lust for knowledge, all husky, like a slut might sound when they tell their slut friends they got a booty call. \"Rabbit, older, kinda female, so our usual suspect— and it wasn't even Kemp that called it in, just some anonymous boy— it's got a good chance to be legit! This might be the one!!!\"\n\nHe waves goodbye and races off. Only half of Lana's face can be seen above the passenger-side window, but you can tell just from his eyes that he's about to cry.");
			addChoice("Seeya!!... Move along.", violetMeteoriteHub);
		}

		if (which == "ExploreGryphon") {
			rainEffect();
			unlockJournal("Gryphon Cavern");
			addPlace("Gryphon Cavern", "A secret, feather-strewn cavern tucked away behind a waterfall.", "Violet Meteorite");
			append("It starts raining.\n\nA cloud busted its belly open on the peaks above and spilled monsoon intestines. You only notice now that they're rushing down the side of the meteorite towards you.\n\nEach exposed butt gets a dozen vicious little rain-slaps, their owners shrieking and pulling back, sticking them out farther, or even spreading their cheeks with both hands and letting droplets the size of golf balls pelt their buttholes.\n\nYou scramble for higher ground. Furs on foot scurry into caves too small for you or curl themselves up under the lips of little craters. Feral nymphs struggle to fly up through the gale, too dumb to figure out why they keep getting washed back down every time they stop to roost.\n\nYour legs slide out over the edge of a cliff. You can't see the bottom through the mist.\n\nYou're losing your grip!");
			addChoice("Hold on.", violetMeteoriteExplore.bind("gryphon1"), {give: ["Glowberry Wine", 1]});
			addChoice("Let go.", violetMeteoriteExplore.bind("gryphonfall"), {toolTip: "This will lock you out of story content."});
			addChoice("Move along.", violetMeteoriteHub, {toolTip: "This will lock you out of story content."});
		}

		if (which == "gryphon1") {
			rainEffect();
			append("You dig your nails into the porous spacerock and claw back to flat ground.\n\nUnluckier folks wash right off the meteorite, scrabbling at nothing, shouting either <!i>WOOOooooo<!i> or <!i>AAAAHHHHH FUUuck<!i>, spilling dildos with them, thongs, wine (you snag a bottle!), panties, inner tubes, and so many anal beads you start to wonder if you're getting battered with raindrops or not sometimes.\n\nYou push uphill through the storm, shielding both eyes with a forearm and keeping your knees bent in case you slip again.");
			addChoice("Find shelter.", violetMeteoriteExplore.bind("gryphon3"), {kinks: ["Patreon Commission", "Feral"]});
			addChoice("Hold out my tongue and catch raindrops.", violetMeteoriteExplore.bind("gryphoncatch"));
			addChoice("Wait it out.", violetMeteoriteExplore.bind("gryphonwait"));
		}

		if (which == "gryphoncatch") {
			rainEffect();
			append("You tilt your head back and take a fat load of water all over your face and mouth, guzzling hard.");
			addChoice("Okay now go find shelter.", violetMeteoriteExplore.bind("gryphon3"), {kinks: ["Feral"]});
			addChoice("Wait it out.", violetMeteoriteExplore.bind("gryphonwait"));
		}

		if (which == "gryphonwait") {
			rainEffect("minimum");
			append("You hunker down and hug a little boulder for like an hour.\n\nThe first moonray to pierce the clouds lights your hunched body up like a renaissance painting. The fog goes away, coiling off down the meteorite, and you're left in a world of shimmering puddles.");
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonfall") {
			var area:String = "on the City battlements";
			var choice:Void->Void = JunkCity.junkCityHub;
			setLocation("Junk City");

			if (data.exploreFinaleJCDone) {
				area = "in the Forest mud";
				setLocation("Bright Forest");
				choice = BrightForest.brightForestHub;
			}
			append("You fall and eat shit on jagged rock for five painful minutes, tumbling and tossing and bouncing ass-over-teakettle until finally you faceplant "+area+" sporting twenty broken bones and a fuckload of chunky purple pebbles embedded in your face.");
			addChoice("Cringe at the text on the screen.", choice);
		}

		if (which == "gryphon3") {
			rainEffect();
			append("You try crowding into an upturned nest with a couple naked, soaked birdgirls, but there's no room. You try to scoot into an inflatable bouncy castle set up by some jackals from the City, but the door's locked"+(getItem("VIP Pass").amount>0?" and the VIP Pass scanner's been pulled inside so the rain doesn't short it out":"")+". Those feral nymphs from earlier stole someone's umbrella and now all three are huddled up under it; you try to steal it from them in turn, but they gnash their sparkly little teeth and chase you away, opening and closing the umbrella at you like it's a weapon.\n\nHurry! The rain is picking up and you're still on a slope!");
			addChoice("Find shelter faster then?!", violetMeteoriteExplore.bind("gryphon4"));
		}

		if (which == "gryphon4") {
			rainEffect("brutal");
			append("<!14px>WAAAUGH FUUCK YOU DON'T KNOW WHERE YOU'RE GOING\n\nEVERYTHING'S SOAKED!!! <!14px><!10px>ESPECIALLY YOUR ASSCRACK<!10px><!16px>\n\nYOU'RE SLIPPING!!!!<!16px>");
			addChoice("<!20px>JUST GRAB SOMETHING<!20px>", violetMeteoriteExplore.bind("gryphon5"));
		}

		if (which == "gryphon5") {
			rainEffect("ultrabrutal");
			append("AAAAAAAAAAAAAAAAHHHHHH DON'T YELL AT ME");
			addChoice("<!24px>YOU STARTED IT<!24px>", violetMeteoriteExplore.bind("gryphon6"));
			addChoice("<!14px>Oop sorry.<!14px>", violetMeteoriteExplore.bind("gryphon6"));
		}

		if (which == "gryphon6") {
			rainEffect("ultrabrutal");
			append("Okay you wade into an overflowing spring but the current is pulling you back, there's a waterfall at the other end, there's nothing else around, all the walls are steep and running over with rain, if you start moving back you'll gain too much momentum too quick and then you'll be washed off the meteorite for sure!?");
			addChoice("Examine waterfall. There's always a cave behind the waterfall.", violetMeteoriteExplore.bind("gryphon7"));
		}

		if (which == "gryphon7") {
			rainEffect("ultrabrutal");
			append("You slam your chest down into the hot springs and breaststroke as hard as you can, slicing through the water, feet <!i>plunkaplunkaplunk<!i>ing— the waterfall pounds down on your face and shoulders and forces you underwater but you kick off of the springbed and reach up behind it and your hand closes around—\n\nThe mouth of a cave!!!");
			addChoice("I fucking knew it.", violetMeteoriteExplore.bind("gryphon8"));
		}

		if (which == "gryphonHub") {
			if (!data.gryphonStarted) {
				violetMeteoriteExplore("gryphon8");
			}/* else if (!getJournalEntries().contains("Cade2") && !data.cyanWeddingStarted) {
				append("The cave is empty...\n\nThe gryphon left a note:\n\n<!i>Out for a party in Junk City.<!i>");
				addChoice("Move along.", violetMeteoriteHub);
			}*/ else if (data.sepBrokeIn && !data.cyanWeddingStarted) {
				violetMeteoriteExplore("ExploreCyanWedding");
			} else if (!data.sepBrokeIn && !data.cyanWeddingStarted) {
				append("The cave is empty...\n\nThe gryphon left a note:\n\n<!i>Wedding will be hosted just outside the cavern soon. Get an invitation from the gecko.<!i>");
				addChoice("Move along.", violetMeteoriteHub);
			} else if (!getJournalEntries().contains("Cade2")) {
				append("The cave is empty...\n\nThe gryphon left a note:\n\n<!i>Out for a party in Junk City.<!i>");
				addChoice("Move along.", violetMeteoriteHub);
			} else {
				append("The cave is empty...");
				addChoice("Move along.", violetMeteoriteHub);
			}
		}

		if (which == "gryphon8") {
			rainEffect("minimum");
			if (data.gryphonStarted && !data.daydream) violetMeteoriteExplore("gryphonHub");
			append("You haul yourself up through the falls and flop onto the cave floor, exhausted.\n\nIt's drippy in here. There's a little box to your left with a torch and some matches that you never thought to mention before, even though you saw one in almost every cave. This one is worth mentioning: it has a messily-written message on it, clearly carved by an unpracticed talon.\n\n<!i>For wanderers,<!i> says the engraving. <!i>Don't get lost or stuck. Always tell someone where you're going.<!i>");

			function onCollect(tile:Int):Bool {
				if (tile == Caves.TRIGGER) {
					playSound('assets/audio/environment/coo', 'coo', {loops: 999});

					var tiles:Array<Int> = [];
						for (i in Caves.GRYPHON_1...Caves.GRYPHON_25+1)
						    tiles.push(i);

						for (y in 3...7+1)
						    for (x in 6...10+1)
						        Caves.setTile(x, y, tiles.shift());
				} else if (tile == Caves.GRYPHON_21 || tile == Caves.GRYPHON_22 || tile == Caves.GRYPHON_23 || tile == Caves.GRYPHON_24 || tile == Caves.GRYPHON_25) {
					enablePause();
					Caves.destroyCaves();
					stopChannel('coo');
					VioletMeteorite.violetMeteoriteExplore("gryphon9");
				}
				if (tile == Caves.SPAWN) return false else return true;
			}

			function onDeath():Void {
				Caves.destroyCaves();
				VioletMeteorite.violetMeteoriteHub();
			}

			addChoice("Examine cave.", function () {
				disablePause();
				playSound("assets/audio/environment/caveDoor", "caveEnter");
				Caves.caveGame("Gryphon Cavern.tmx", onCollect, onDeath);
				Caves.power = 99999;
			});
		}

		if (which == "gryphon9") {
			stopChannel('coo');
			data.metGryphon++;
			data.violetGryphonJunk = [];

			append("A gryphon blocks the entrance.\n\nThey're sitting on their hind legs, lion tail swaying in and out of the moonlit waterfall behind. The feathers on their upper body are soaked and sleek. Same with the fur on their lower half.\n\nTheir eyes swivel, making sure you're the only one here. One wicked talon fiddles shyly with a pebble, crushing it into smaller and smaller chunks...");
			addChoice("Easy, boy...", function () {
				data.violetGryphonJunk.push("cock");
				violetMeteoriteExplore("gryphonsex");
			});
			if (!data.hasCunt) addChoice("Easy, girl...", function () {
				data.violetGryphonJunk.push("cunt");
				violetMeteoriteExplore("gryphonsex");
			});
			addChoice("Ha. You may think you're blocking my way, but I can do <!i>this<!i>: Move along!", violetMeteoriteHub);
		}

		if (which == "gryphonsex") {
			data.gryphonStarted = true;
			addExplorable(147, "Violet Meteorite", violetMeteoriteExplore.bind("GryphonFly"), 20, 1);
			GameData.reInitRefs();
			
			append("The gryphon snakes their head down and fixes you with one huge yellow eye.\n\nSuddenly, images flood your mind: "+((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))?"big jiggly cocks and nuts":"voluptuous cunts and tits")+", raised eyebrows, interrogative glances.\n\nIn this tele-pictoral Gryphon language, they're repeating what you just said back to you:\n\n<!i>"+((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))?"Boy":"Girl")+"?<!i>");
			addChoice("U-Um...", violetMeteoriteExplore.bind("gryphonsex1"));
		}

		if (which == "gryphonsex1") {
			//halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/gryphPresenting.png");
			s.x = GAME_WIDTH - s.width;
			s.y = GAME_HEIGHT - s.height;
			s.layer = 69;
			s.scaleX = 0.9;
			s.scaleY = 0.9;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Leveretry", "");

			append("They lift out their fluffy hind leg and show you the empty stretch of fur where their junk should be.");

			addChoice("O-Ohhhh gosh you're                        covering my screen                          so big", violetMeteoriteExplore.bind("gryphonsex1a"));
		}

		if (which == "gryphonsex1a") {
			var kinkDefault:String = "Male";
			var kinkSwitch:String = "Female";
			if (MintArrayUtils.contains(data.violetGryphonJunk, "cunt")) {
				kinkDefault = "Female";
				kinkSwitch = "Male";
			}

			append("Another image: you sitting at your monitor, typing \"cock\" or \"cunt\" into a prompt on the screen.\n\n<!i>You choose.<!i>");
			//Give two options: stay with the sex you chose, or add the other one in too
			addChoice("Oh! Yes, just a "+data.violetGryphonJunk[0]+" is fine.", violetMeteoriteExplore.bind("gryphonsex2"), {kinks: [kinkDefault]});
			if (!data.hasCunt) addChoice("If I get to pick... "+((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))?"cunt":"cock")+".", function () {
				if ((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))) {
					data.violetGryphonJunk.remove("cock");
					data.violetGryphonJunk.push("cunt");
				} else {
					data.violetGryphonJunk.remove("cunt");
					data.violetGryphonJunk.push("cock");
				}
				violetMeteoriteExplore("gryphonsex2");
			}, {kinks: [kinkSwitch]});
			addChoice("Um... could you have both~?", function () {
				if ((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))) {
					data.violetGryphonJunk.push("cunt");
				} else {
					data.violetGryphonJunk.push("cock");
				}
				violetMeteoriteExplore("gryphonsex2");
			}, {kinks: ["Intersex"]});
		}

		if (which == "gryphonsex2") {
			if (data.cadeAccepted && !data.cadePartyDone) addExplorable(109, "Junk City", JunkCity.junkCityExplore.bind("ExploreCadeParty"), 1, 1);
			GameData.reInitRefs();
			append(gryphJunk("He buckles", "She buckles", "They buckle")+" over, feathered chest flattening to the cave floor with a <!i>THWUMP<!i> so mighty the shockwave knocks raindrops from your hair. "+gryphJunk("His", "Her", "Their")+" hind paws dig into the rock, legs taut and extended, curvy gryphon rump quivering inches from the cave's ceiling. "+gryphJunk("He screws his", "She screws her", "They screw their")+" eyes and beak shut. "+gryphJunk("His", "Her", "Their")+" crotchfur stands on end, electrified.\n\nThen, ass wiggling like a cat in heat, "+gryphJunk("he discharges", "she discharges", "they discharge")+" a bubbly little coo from the pit of "+gryphJunk("his", "her", "their")+" stomach and "+gryphJunk("slams his", "slams her", "slam their")+" hips down to the floor, forcing a "+gryphJunk("floppy eight-inch lioncock and a set of nuts", "tender, puffy cunt", "floppy eight-inch lioncock and an already-dripping cunt")+" into existence between "+gryphJunk("his", "her", "their")+" haunches apparently through concentrated power of will alone.\n\n"+gryphJunk("He has", "She has", "They have")+" only one explanation for you, sent telepathically through a series of tired diagrams: <!i>Gryphon physiology.<!i>");
			addChoice("Thank you for growing a "+gryphJunk("dick", "puss", "cock and puss")+" for me psychic lionbird.", violetMeteoriteExplore.bind("gryphon10"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphon10") {
			var cryptic:Bool = false;
			if (data.playerName == "Cryptic" || data.playerName == "cryptic") cryptic = true;

			append(gryphJunk("He bows", "She bows", "They bow")+" shakily, folding "+gryphJunk("his", "her", "their")+" forepaws. <!i>"+(cryptic?"What a strange name, by the way... I take it you're not from around here~?<!i>":"You're welcome, monkey from the upper universe.<!i>\n\nIt took a while to translate that one. "+gryphJunk("He pictures", "She pictures", "They picture")+" you as some kinda hairy glowing galaxy wizard at a keyboard.")+"\n\n"+gryphJunk("He picks himself", "She picks herself", "They pick themselves")+" up and scoot"+gryphJunk("s", "s", "")+" closer, that brand new cat-"+gryphJunk("cock trailing pre", "cunt trailing little dots of juice", "cock trailing pre")+".\n\n<!i>Word of you came up from the city, "+(cryptic?"stranger":"wizard")+". They're even throwing a party. Can I come?<!i>");
			addChoice("Sure you can! ... when I find the party, that is.", violetMeteoriteExplore.bind("gryphon11"));
			addChoice("I'd... uh... I'd ask the host first, maybe...", violetMeteoriteExplore.bind("gryphon11"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphon11") {
			append(gryphJunk("He nods", "She nods", "They nod")+".\n\nThe rain whispers outside.\n\nYou uh... you both just sit there for a moment, soaked and dripping on each other. But you aren't cold, because heat pours from "+gryphJunk("his", "her", "their")+" feathered chest. It feels really nice. You think you could even go for a snugg—\n\nSuddenly "+gryphJunk("he advances", "she advances", "they advance")+" on you and slam"+gryphJunk("s his", "s her", " their")+" forepaws down around your hips, squishing your ass tight between them. "+gryphJunk("His", "Her", "Their")+" shimmer-sharp beaktip hovers directly above your heart.\n\nThe image: "+gryphJunk("a butt, gaped and drooling "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cum.", "her cunt, gaped and drooling translucent pussy slobber.", "a butt, gaped and drooling "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cum. (Or maybe that's a pussy? Hard to say, they just see it as an all-purpose fuckhole.)")+"\n\nThe meaning: <!i>Enough foreplay.<!i>");
			//If Gryphon has cock, offer sub assfuck scene
			if ((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))) {
				addChoice("Are you gonna fuck me~?", violetMeteoriteExplore.bind("gryphonsub"));
				//If you have cock, offer dom assfuck scene
				if (data.hasBoth || data.hasCock) addChoice("That's your ass in my mind, isn't it.", function () {
					data.violetGryphonCunt = false;
					violetMeteoriteExplore("gryphondom");
				});
			}
			//If Gryphon has cunt, offer dom cuntfuck (can't give gryphon a cunt if you have one)
			if ((MintArrayUtils.contains(data.violetGryphonJunk, "cunt"))) addChoice(gryphJunk("How'd you get this choice to show up?!", "Not very subtle, are you? :P", "I assume that's your puss. Not very subtle, are you? :P"), function () {
				data.violetGryphonCunt = true;
				violetMeteoriteExplore("gryphondom");
			});
			
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub") {
			append(gryphJunk("He sends", "She sends", "They send")+" you an image of a bear shitting in the woods and a question mark.\n\n"+gryphJunk("His", "Her", "Their")+" beak twitches into a smirk.\n\nTalons interlace at the small of your back, tips dragging just hard enough to tickle. "+gryphJunk("He scoops", "She scoops", "They scoop")+" you up with both paws and "+gryphJunk("cradles", "cradles", "cradle")+" you for a moment, a single golden iris on the side of "+gryphJunk("his", "her", "their")+" cocked head roving over your body saccadically, inspecting your "+(data.hasBoobs?"tits":"smooth chest")+", your stomach, your bare "+pickByGenitals("dick", "cunt", "cunt (though "+gryphJunk("he has", "she has", "they have")+" to lift your cock and nuts out of the way first)")+"... then "+gryphJunk("he tosses", "she tosses", "they toss")+" you carelessly to your feet.\n\n"+gryphJunk("He sits", "She sits", "They sit")+" back on "+gryphJunk("his", "her", "their")+" haunches, cock flopping up half-hard to leak pre over "+gryphJunk("his", "her", "their")+" feather-fur tummy.\n\n<!i>Present yourself,<!i> "+gryphJunk("he purrs", "she purrs", "they purr")+", using the image of a tight-wrapped and oddly curvy little christmas present.\n\n"+gryphJunk("He strokes himself", "She strokes herself", "They stroke themselves")+" with the back of a paw, languid and aristocratic about it, like drinking pinky-up. Really you think "+gryphJunk("he's", "she's", "they're")+" just trying to avoid potential dick nicks with those claws.");
			addChoice("Put one hand on the wall and spread my ass for "+gryphJunk("him", "her", "them")+".", function () {
				data.violetGryphonCunt = false;
				violetMeteoriteExplore("gryphonsub2");
			});
			if (data.hasCunt || data.hasBoth) addChoice("Put one hand on the wall and spread my cunt for "+gryphJunk("him", "her", "them")+".", function () {
				data.violetGryphonCunt = true;
				violetMeteoriteExplore("gryphonsub2");
			});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub2") {
			append("You turn your back on the gryphon, first, which is the hardest part... but no eight-inch dick comes thundering down on your unprepared ass just yet. Only the cool cave air touches you, licking "+pickByGenitals("over the smooth stretch of your taint", "over the radiant-hot lips of your cunt", "between your thighs, over your nutsack")+", chilled and slightly misted by the sideways wind blowing through the waterfall.\n\nYou place one palm on the wall— and almost have to yank it back. It's hot. There must be magma just behind it. Still, you keep it pressed firm, and even lean forward to rest your "+(data.hasBoobs?"tits":"chest")+" there too. All that stifled heat courses through you and tickles your nips.\n\nThe gryphon stalks up behind you. "+gryphJunk("His", "Her", "Their")+" intermittent coos have softened and ganged up with each other to produce one low, rumbly birdpurr, and "+gryphJunk("his", "her", "their")+" cock has reached a startling 85% hardness, now almost nine inches and straining to fill itself out even fatter, drooling purple-speckled pre blobs thick as ice cubes.\n\nYou snake one hand back and yank open "+(data.violetGryphonCunt?"the crease of your cunt, fingers slibbling and sloobling to get a grip on your soaked labia":"your left asscheek. Cool air rushes over your pucker")+".\n\nThe gryphon plants a paw on the wall, talons curling easily into the rock and dislodging tiny spumes of lava. "+gryphJunk("He doesn't", "She doesn't", "They don't")+" seem to mind the heat.\n\n"+gryphJunk("He asks", "She asks", "They ask")+" you three self-important questions, cock throbbing with "+gryphJunk("his", "her", "their")+" ego:\n\n<!i>Do you know why mythical ferals speak this way?\n\nDo you know why we are so powerful?\n\nDo you know why we are so different?<!i>");
			addChoice("Why?", violetMeteoriteExplore.bind("gryphonsub3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub3") {
			append("<!i>Because we were not programmed in; because we come from the Meteorite.<!i>\n\nYes, "+gryphJunk("he", "she", "they")+" even sent you an image of a semicolon. 'Meteorite' was capitalized in a way, too— in "+gryphJunk("his", "her", "their")+" mind, the island is merely a pedestal beneath Violet's immense, important girth. Someone doesn't leave the cave often.\n\nTen inches of 100% erect gryphondick slap down between "+(data.violetGryphonCunt?"the lips of your cunt":"your asscheeks")+" so hard that you're 100% sure if you hadn't pressed your "+(data.hasBoobs?"tits":"chest")+" to the wall you'd be faceplanted on the rock right now. "+gryphJunk("His", "Her", "Their")+" cock feels weirdly smooth as it hotdogs you<!b>;<!b> besides "+gryphJunk("his", "her", "their")+" urethra, the only other penile terrain that catches a little on your "+(data.violetGryphonCunt?"labia":"pucker")+" is the occasional pulse of a vein or the ridge of "+gryphJunk("his", "her", "their")+" head on the downswing. The rest is hot velvet.\n\nAh, you realize what's missing: barbs!\n\nYou throw the gryphon a smile over your shoulder and yank your "+(data.violetGryphonCunt?"cunt":"buttcheeks")+" open even wider as thanks for growing such an easily rideable cock. "+gryphJunk("He purrs acknowledgement, but doesn't", "She purrs acknowledgement, but doesn't", "They purr acknowledgement, but don't")+" really care for your help— those fat baseball nuts bully your hand away every time "+gryphJunk("he rams his", "she rams her", "they ram their")+" dick up to the apex and grind"+gryphJunk("s his", "s her", " their")+" pre-spewing slit between your shoulder blades.");
			addChoice("So... what happened to 'Enough foreplay'?", function () {
				data.violetGryphonSay = 2;
				violetMeteoriteExplore("gryphonsub4");
			});
			addChoice("The meteorite landed after the game was already made?", function () {
				data.violetGryphonSay = 1;
				violetMeteoriteExplore("gryphonsub4");
			}, {kinks: ["Plot"]});
			addChoice("Oh my god ram your dick up my "+(data.violetGryphonCunt?"cunt":"ass")+" already.", function () {
				data.violetGryphonSay = 0;
				violetMeteoriteExplore("gryphonsub4");
			});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub4") {
			if (data.violetGryphonSay == 1) {
				append("A checkmark and some childhood memories: no parents, no sky, no players— just this cave.\n\n<!i>Yes. Sixty-six years ago.<!i>\n\nWell, isn't someone old and wise.");
			} else if (data.violetGryphonSay == 2) {
				append("You're treated to an image of your own body dwarfed beneath "+gryphJunk("his", "her", "their")+" cock, curves emphasized and kissed with the dim orange light of your sputtering torch.\n\n<!i>You're too beautiful,<!i> "+gryphJunk("he", "she", "they")+" purrs... <!i>I had to savor you.<!i>");
			} else {
				append(gryphJunk("He growls", "She growls", "They growl")+" amusedly. <!i>You are a whore, "+data.playerName+".<!i>");
			}
			append("\n\n"+gryphJunk("He pulls", "She pulls", "They pull")+" back. "+gryphJunk("His", "Her", "Their")+" tip sinks neatly into the folds of your "+(data.violetGryphonCunt?"puss":"pucker")+", and the expulsive force of "+gryphJunk("his", "her", "their")+" "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"precum alone is enough to open you up and lube a sizeable stretch of your insides. You run a hand over your flat (for now) belly, "+pickByGenitals("over your cock and nuts", "over the tiny nub of your clit", "over your cock and nuts, over the tiny nub of your clit")+", wrap your fingers around the flare of "+gryphJunk("his", "her", "their")+" head... and line it up perfectly.\n\n"+gryphJunk("He feeds", "She feeds", "They feed")+" your "+(data.violetGryphonCunt?"cunt":"ass")+" five inches all at once. Your cheeks ripple with rebound as "+gryphJunk("his", "her", "their")+" head and more pops inside. All that meat crammed into such a tight little spot naturally displaces all the pre "+gryphJunk("he", "she", "they")+" pumped inside you earlier, which trickles down in strings between the bridges of your groping fingers.\n\n"+gryphJunk("His", "Her", "Their")+" beak rests on your shoulder. The first thrusts start, squishing your "+(data.hasBoobs?"boobs":"chest")+" up even harder against the toasty cavern wall. Slowly, and with surprising care for "+gryphJunk("his", "her", "their")+" size, "+gryphJunk("he drags", "she drags", "they drag")+" those five inches in and out in such a way that you feel almost like you were designed to get fucked with them, like there's a little empty space inside your body shaped exactly like a fat feral gryphon cock that's been waiting to be filled for as long as you can remember~\n\nTwo images: your face in bliss and an x-ray of your inner "+(data.violetGryphonCunt?"cunt":"ass")+"flesh hugging "+gryphJunk("his", "her", "their")+" cock. <!i>Does it feel good inside you?<!i>\n\nTwo more: your face twisted up in ahegao and your belly bulged out so fat with cockmeat that it almost touches the wall. <!i>Do you want <!i><!b>all<!b><!i> of me?<!i>");
			addChoice("Yes and yes.", violetMeteoriteExplore.bind("gryphonsub5"));
			addChoice("No and no.", violetMeteoriteExplore.bind("gryphonquit"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonquit") {
			append("You untangle yourselves from each other.\n\nThe gryphon goes back to shyly crushing pebbles, sending you a few haughty images: "+gryphJunk("himself", "herself", "themselves")+" curling back up in a hidden corner, "+gryphJunk("cock softening", "cunt no longer gushing", "cock softening, cunt no longer gushing")+".\n\n<!i>Ah. Then I'd like to be alone.<!i>");
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub5") {
			append("<!i>You asked for this.<!i>\n\n"+gryphJunk("His", "Her", "Their")+" beak slips from your shoulder and rests instead on the crown of your skull, keeping your body locked vertically in place. Both forepaws dislodge from the wall and come down to pin your wrists against it instead, which takes care of the horizontal too.\n\nElectric tension ripples through your "+(data.violetGryphonCunt?"pussy":"anal ring")+". Your anticipation clenches hard just below the gryphon's head. You feel "+gryphJunk("his", "her", "their")+" warm breath on your scalp, "+gryphJunk("his", "her", "their")+" feathers at your back, "+gryphJunk("his", "her", "their")+" fur on your asscheeks— then, none of those things: your attention is yanked completely to the slow pressure of "+gryphJunk("his", "her", "their")+" cock straining against the entrance to your "+(data.violetGryphonCunt?"womb":"lower stomach")+".\n\n"+gryphJunk("He starts", "She starts", "They start")+" pounding six inches against it, over and over, purrs stopping completely. You guess "+gryphJunk("he's", "she's", "they're")+" feeling so good "+gryphJunk("his", "her", "their")+" body can't do anything but breathe and thrust.\n\nWith every "+(data.violetGryphonCunt?"cunt":"ass")+"ful of meat comes another quarter inch, til you're taking seven like a champ and your belly's bouncing and "+gryphJunk("he's", "she's", "they're")+" blasting your mind with incoherent white chaos.\n\nThe message barely gets through:\n\n<!i>I'm about to hilt you. This is your last chance to speak with me before I go primal.<!i>");
			addChoice("We already spoke, and I said I wanted <!i>all<!i> of it. <3", violetMeteoriteExplore.bind("gryphonsub6"), {kinks: ["Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonsub6") {
			append("Just under a foot of cock bursts into the pit of your "+(data.violetGryphonCunt?"womb":"stomach")+", stretching you obscenely and filling you with so much inner pressure you almost have to gag. Ten inches (you feel each individually in the lucid shock after that first thrust) all slide back with those powerful feline hips and then forward again, splitting you down to the most intimate corners of your body— what you thought was almost a gag turns out to be a moan that ricochets deep into the cave and slashes bright pink across the constant stream of white bliss-pictures pouring from "+gryphJunk("his", "her", "their")+" mind.\n\nAnother thrust, another, a rush of hot breath down your neck... after that, any attempt to translate is rendered pointless by the sheer volume and abstraction of "+gryphJunk("his", "her", "their")+" thoughts. By now they're all disjointed into a lustful collage:\n\n<!i>Tight love harder "+(data.violetGryphonCunt?"womb":"ass")+" "+data.playerName+" yes more deeper asked "+pickByGender("he", "she", "they")+" asked "+pickByGender("he", "she", "they")+" deserve cock more harder cum harder harder HARDER~<!i>\n\n"+gryphJunk("He slams his", "She slams her", "They slam their")+" cock as deep as it can possibly go and then a little deeper, grinding "+gryphJunk("his", "her", "their")+" throbbing nuts against your"+(data.hasCunt?" inner thighs":"s")+" and pumping you so full of "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cum that your "+(data.violetGryphonCunt?"womb":"belly")+" bulges to the size of a basketball and squishes up against the wall, your flesh trapped between the heat of "+gryphJunk("his", "her", "their")+" cock and the heat of the hidden magma flow. Cum sprays out in sideways torrents thicker than the rain outside"+(data.violetGryphonCunt?", overfilling your womb and doubling":"— almost up to bottom of your throat!— then it doubles")+" back to gush over the sweaty, clenched-tight fur of "+gryphJunk("his", "her", "their")+" nutsack.\n\nYou pant. You hold in a few gurgling moans. You close your eyes and lay against the wall. You stop paying attention to everything.\n\nYou see only what "+gryphJunk("he shows", "she shows", "they show")+" you— pure white, stretching infinite in all directions.");
			addChoice("Wind down.", violetMeteoriteExplore.bind("gryphonwinddownsub"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddownsub") {
			append("You slide down the wall, utterly relaxed, and let your "+(data.hasBoobs?"tiddies soften the landing":"chest lay flush with the ground")+".\n\n"+gryphJunk("He keeps his cock", "She keeps her cock", "They keep their cock")+" inside you while it twitches and softens and drools out those last few viscous "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cumglobs.\n\n... Every time you try to get your wits together and unplug, "+gryphJunk("he presses his", "she presses her", "they press their")+" beak down on your shoulder gently, sending you a few blurry images of your own cum-heavy "+(data.violetGryphonCunt?"womb":"stomach")+", your body as "+gryphJunk("he sees", "she sees", "they see")+" it all soft and cute and cuddle-able.\n\n<!i>Let me hold you.<!i>");
			addChoice("Mmmmm... thank you for that...", violetMeteoriteExplore.bind("gryphonwinddownsub2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddownsub2") {
			append("<!i>You deserved it.<!i>\n\n"+pickByGender("He holds his", "She holds her", "They hold their")+" beak aloft and throws an imperious wink down at you.");
			addChoice("Yes, I did, I deserved it so much. <3", violetMeteoriteExplore.bind("gryphonwinddownsub3"));
			addChoice("Unplug.", violetMeteoriteExplore.bind("gryphonwinddownsub3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddownsub3") {
			append("<!i>Okay. Cuddle time is over now.<!i>\n\nYou get to your unsteady feet, pulling your "+(data.violetGryphonCunt?"cunt":"ass")+" off "+gryphJunk("his", "her", "their")+" squishy-soft cock. "+gryphJunk("He curls his", "She curls her", "They curl their")+" head down between "+gryphJunk("his legs and licks", "her legs and licks", "their legs and lick")+" it clean with big slow slurps of the tongue, working it into every cum-clogged crevice~\n\n"+gryphJunk("He shoots", "She shoots", "They shoot")+" you a look.\n\n<!i>The rain's stopped.<!i>");
			addChoice("Thanks for letting me stay!", violetMeteoriteHub);
		}

		if (which == "gryphondom") {
			append((data.violetGryphonCunt?gryphJunk("His", "Her", "Their")+" tail whips a gouge in the floor, beak imperiously uptilted.\n\n<!i>Subtlety is for simpler organisms. My body has many intricate, overlapping hormone cycles.":gryphJunk("He immediately sends", "She immediately sends", "They immediately send")+" you a more modest image: that "+gryphJunk("ass", "ass", "fuckhole")+" again, no longer ravaged but tight, clean, its pucker bured deep between two bubbly cheeks.\n\n<!i>It is mine,<!i> "+gryphJunk("he admits", "she admits", "they admit")+". <!i>Of course, I showed you how I'd like it to be— not as it is.")+"<!i>\n\nWhile talking "+gryphJunk("he slid his", "she slid her", "they slid their")+" paws off your hips and let "+gryphJunk("his", "her", "their")+" yellow eyes droop half-shut. You get the feeling that "+gryphJunk("he's", "she's", "they're")+" blushing, but you're not sure if gryphons can blush?");
			addChoice((data.violetGryphonCunt?"So you're in heat, basically.":"Well, if you're offering, I'd love to ruin your ass. <3"), violetMeteoriteExplore.bind("gryphondom2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom2") {
			append((data.violetGryphonCunt?"<!i>Oh yes, almost always—<!i> "+gryphJunk("he pauses", "she pauses", "they pause")+", blinking, and hurries to add— <!i>but I am not a slut. We ferals do not respawn; bearing children is our duty to the species.":"A shiver dances off the peaks of "+gryphJunk("his", "her", "their")+" asscheeks, visible just behind the arch of "+gryphJunk("his", "her", "their")+" lower back.\n\n<!i>Mmmh... you say 'ruin,' but I see it as a wonderful improvement.")+"<!i>");
			addChoice((data.violetGryphonCunt?"Ah yes, your duty, of course<!b>;<!b> now show me that cunt for posterity.":"O, if only God had designed us all with perma-gaped cum-drooling butts!"), violetMeteoriteExplore.bind("gryphondom3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom3") {
			append("<!i>"+(data.violetGryphonCunt?"I warn you... my intricate, overlapping hormone cycles make it drippy this time of year.":"You send images better than I do.")+"<!i>\n\nOnly when "+gryphJunk("he turns", "she turns", "they turn")+" around do you realize how <!i>long<!i> "+gryphJunk("his", "her", "their")+" body is. Fur and feathers snake past your face for a full ten seconds, at times brushing gently against your cheek with the protrusive curves of "+gryphJunk("his", "her", "their")+" shoulder, belly, flank, and finally those perfect fluffy asscheeks. "+gryphJunk("He flops onto his", "She flops onto her", "They flop onto their")+" side like a cat, forepaws crossed, and peel"+gryphJunk("s", "s", "")+" one hind leg off the other.\n\nA sweet, almost biting musk tickles your nose, but it doesn't smell like you imagine a "+gryphJunk("big fat gryphon dick", "sopping gryphon cunt", "set of heavy gryphon nuts")+" would smell... if you close your eyes, you'd think "+gryphJunk("he", "she", "they")+" had a bunch of almost-ripe strawberries spilling out from between "+gryphJunk("his", "her", "their")+" thighs.\n\n<!i>What are you thinking about?<!i>\n\n"+gryphJunk("He puts", "She puts", "They put")+" a paw to "+gryphJunk("his", "her", "their")+" chin all like :3c.");

			var action:String = "("+(data.violetGryphonCunt?"Grind all up on "+gryphJunk("his", "her", "their")+" cunt":"Hotdog "+gryphJunk("his", "her", "their")+" ass")+".)";
			addChoice("Um. Nothing.", function () {
				data.violetGryphonStrawberry = false;
				violetMeteoriteExplore("gryphondom4");
				append("<!i>You seemed a little concerned about my "+gryphJunk("cock", "pussy", "nuts")+" for a moment.<!i>");
				addChoice("I was just thinking about how much I want to do this. "+action, violetMeteoriteExplore.bind("gryphondom5"));
			});
			addChoice("Just smelling your "+gryphJunk("cock", "cunt", "nutsack")+" is all.", function () {
				data.violetGryphonStrawberry = false;
				violetMeteoriteExplore("gryphondom4");
				append(gryphJunk("He stifles", "She stifles", "They stifle")+" a weird, deep-chested gryphon giggle.\n\n<!i>Does it smell good?<!i>");
				addChoice("Yes. "+action, violetMeteoriteExplore.bind("gryphondom5"));
				addChoice("It's... exotic. "+action, violetMeteoriteExplore.bind("gryphondom5"));
			});
			addChoice("I'm going to call you strawberry crotch from now on. Don't question it.", function () {
				violetMeteoriteExplore("gryphondom4");
				data.violetGryphonStrawberry = true;
				append(gryphJunk("He actually seems", "She actually seems", "They actually seem")+" legitimately upset. It's like you flicked "+gryphJunk("his", "her", "their")+" pride right in its face.\n\n"+gryphJunk("He huffs", "She huffs", "They huff")+".\n\n<!i>If that's the price I have to pay for you to finally mount me... so be it.<!i>");
				addChoice("Be patient, strawberry crotch. <3 "+action, violetMeteoriteExplore.bind("gryphondom5"));
			});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom5") {
			append("You wiggle yourself up between those thick haunches. "+gryphJunk("He doesn't", "She doesn't", "They don't")+" spread them any wider to help you, no, "+gryphJunk("he just sits back and lets", "she just sits back and lets", "they just sit back and let")+" you worm your body all over "+gryphJunk("his", "her", "their")+" inner thighs.\n\nOnce you're comfortably snug you do a big slow yawn and stretch, running your hands over "+gryphJunk("his", "her", "their")+" silky belly, higher and higher, til fur turns to feathers between your fingers. Your nuts drag along the base of "+gryphJunk("his", "her", "their")+" tail, each nudged to either side, and your shaft wanders "+(data.violetGryphonCunt?"up over "+gryphJunk("his", "her", "their")+" pucker, pulling it open slightly along the way, stopping only once it's nestled between the lips of "+gryphJunk("his", "her", "their")+" cunt.":"down between "+gryphJunk("his", "her", "their")+" buttcheeks, tucking up against the throbbing warmth of "+gryphJunk("his", "her", "their")+" pucker.")+"\n\nYou reposition a little. Your cock sliding even half an inch across "+gryphJunk("his", "her", "their")+" special spot is enough to draw out a lusty, rolling chirp from that beak~\n\nKnowing how sensitive "+gryphJunk("he is", "she is", "they are")+" makes you want to tease "+gryphJunk("him", "her", "em")+" even harder. "+gryphJunk("His", "Her", "Their")+" "+(data.violetGryphonCunt?"cuntslobber has already soaked the underside of your shaft, and now a few beads are rolling down over your nuts":"pucker relaxes. That little donut of inner flesh expands against the underside of your shaft, feeling almost like a soft, suckling kiss")+"... but still, you don't give in. You just lay there and sooooaaaakkkk it up~\n\nOkay, "+gryphJunk("he's", "she's", "they're")+" looking at you murderously.\n\nYou grab two fistfuls of "+gryphJunk("his", "her", "their")+" fur and start throwing your hips back and forth superquick, bouncing your nuts against "+gryphJunk("his", "her", "their")+" buttcheeks, working your "+(data.violetGryphonCunt?"frenulum over that swollen gryphonclit":"shaft deeper and deeper between em til it's buried so deep "+gryphJunk("his", "her", "their")+" cheeks close up over it— now the only bit you can see is your head popping out between them at the top now and then to kiss "+gryphJunk("his nuts", "her cunt", "their cunt"))+". It feels pretty good to you, almost like humping into a hole— but it catapults "+(data.violetGryphonStrawberry?"Strawberry Crotch":gryphJunk("him", "her", "them"))+" into orbit. "+gryphJunk("His", "Her", "Their")+" slitted yellow eyes enlarge like a cat's in the dark and roll up into the back of "+gryphJunk("his", "her", "their")+" head. "+gryphJunk("His", "Her", "Their")+" talons knead crumbling furrows into the ground. The purring is a solid 6 on the richter scale, so violent it ripples all the way down to "+gryphJunk("his", "her", "their")+" crotch. It's almost like grinding your dick between two fluffy Hitachis.");
			addChoice("So, bit of a weird question, maybe left field, but d'you think you might like having my cock rammed up your "+(data.violetGryphonCunt?"pussy":"ass")+"?", violetMeteoriteExplore.bind("gryphondom6"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom6") {
			append(gryphJunk("He throws his", "She throws her", "They throw their")+" head back and keens to the ceiling, barraging you with images of "+gryphJunk("himself", "herself", "themselves")+" getting mercilessly pounded.\n\n<!i>Yes! Fuck me!<!i>");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Wait, let me make sure I've got this straight: you want <!i>my<!i> dick buried as deep as I can bury it inside <!i>your<!i> "+(data.violetGryphonCunt?"pussy":"ass")+"?", violetMeteoriteExplore.bind("gryphondom7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom7") {
			append("A clawed foot slams down inches from your face, and "+gryphJunk("his", "her", "their")+" legs spread wide and start to quiver with neediness.\n\n<!i>I said yes! That's what I want!<!i>");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Are you sure?", violetMeteoriteExplore.bind("gryphondom8"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom8") {
			append("<!i>Of course I'm sure! Please! Please...! I can feel it throbbing, it's so close, it's right there...!<!i>");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Where is it?", violetMeteoriteExplore.bind("gryphondom9"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom9") {
			append("<!i>You're the one who— alright fine— it's grinding between my "+(data.violetGryphonCunt?"lips":"cheeks")+".<!i>\n\n"+gryphJunk("He clamps", "She clamps", "They clamp")+" them down on your cock as punctuation, shooting you a pained, incredulous look.\n\n<!i>That's enough, right? You'll fuck me now?<!i>");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Thinking about it. So that's where it is, but where do you want it again?", violetMeteoriteExplore.bind("gryphondom10"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom10") {
			append("<!i>IN MY "+(data.violetGryphonCunt?"CUNT":"ASS")+"!<!i>");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("How deep tho?", violetMeteoriteExplore.bind("gryphondom11"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom11") {
			append(gryphJunk("He's", "She's", "They're")+" falling apart, spewing images into your mind all run-on. "+gryphJunk("His", "Her", "Their")+" beak twists into a pent-up grimace.\n\n<!i>Please just put it in oh god please I can't take it much longer no more please no more just stop this and fuck my "+(data.violetGryphonCunt?"cunt":"ass")+" PLEASE!<!i>\n\n"+gryphJunk("He throws his", "She throws her legs", "They throw their legs")+" open til they're almost parallel, bucking pointlessly up along the length of your cock.");
			addChoice("Fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Answer the question, "+(data.violetGryphonStrawberry?"Strawberry Crotch":"hun")+".", violetMeteoriteExplore.bind("gryphondom12"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom12") {
			append(gryphJunk("He", "She", "They")+" can't do it.\n\n"+gryphJunk("His", "Her", "Their")+" images are swallowed up in a white fog. "+gryphJunk("He's", "She's", "They've")+" been reduced to a drooling, squirming, instinct-driven animal incapable of intelligent conversation. The only thing "+gryphJunk("he", "she", "they")+" can do is flex "+gryphJunk("his", "her", "their")+" "+(data.violetGryphonCunt?"cunt":"butt")+"muscles and scoot "+gryphJunk("his", "her", "their")+" hips closer to you, nudging up underneath your nuts.");
			addChoice("Okay, now fuck "+gryphJunk("him", "her", "them")+".", violetMeteoriteExplore.bind("gryphondom13"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom13") {
			append("You plunge your entire cock inside "+gryphJunk("him", "her", "them")+" in one thrust.\n\nRelief pierces "+gryphJunk("his", "her", "their")+" expression like a waterbed and relaxation leaks through "+gryphJunk("his", "her", "their")+" muscles from the neck down. "+gryphJunk("His", "Her", "Their")+" "+(data.violetGryphonCunt?"pussy":"anal ring")+" is way too tight at first, acting almost like a cock ring the way it clenches around your base, but once those muscles turn to jelly like the rest of them you find you've never fucked a smoother hole~\n\nYou start thrusting. You don't waste time with that slow and gentle warm-up shit. Right away you slam "+gryphJunk("his", "her", "their")+" "+(data.violetGryphonCunt?"cunt":"ass")+" hard enough to redden "+gryphJunk("his", "her", "their")+" jiggling cheeks and "+gryphJunk("bounce his fat furry nuts around", "make all her feral nips throb", "bounce their fat furry nuts around")+".\n\n"+gryphJunk("He's", "She's", "They're")+" coming back into reality a little bit after that initial blastoff, panting, "+gryphJunk("his", "her", "their")+" beak resting on the floor. Instinctually "+gryphJunk("he tenses his", "she tenses her", "they tense their")+" inner "+(data.violetGryphonCunt?"pussy":"ass")+" every time you bottom out, which feels a lot like someone swallowing hard on your dick during a throatfuck.\n\nSo here we are, after all that build-up, and "+gryphJunk("he's", "she's", "they're")+" just laying there all blissed-out. "+gryphJunk("He doesn't", "She doesn't", "They don't")+" even moan or coo or squeal as you fuck "+gryphJunk("him", "her", "them")+" so brutally. "+gryphJunk("He only shows", "She only shows", "They only show")+" signs of life when you stop thrusting for a second to catch your breath— and only to lift "+gryphJunk("his", "her", "their")+" head and fix you with one tired eye, speaking lazily through body language: <!i>Hey. Why'd you stop.<!i>");
			addChoice("Maybe "+gryphJunk("he'll", "she'll", "they'll")+" react a little more if I cum inside "+gryphJunk("him", "her", "them")+". >:3", violetMeteoriteExplore.bind("gryphondom14"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphondom14") {
			cumEffect();
			append("You hug "+(data.violetGryphonStrawberry?"Strawberry":"the gryphon")+" around the middle and launch into a flurry of humps, slowing down only when "+gryphJunk("he tenses", "she tenses", "they tense")+" up and nears orgasm. After a few awkward, start-and-stop thrusts, you finally line it up juuust right and—!\n\nYou cum inside "+gryphJunk("him", "her", "them")+" just as "+gryphJunk("he cums", "she cums", "they cum")+" too. You bury your face in "+gryphJunk("his", "her", "their")+" soft lower belly, sighing soft from the bottom of your throat.\n\nYour bodies twitch and quiver against each other. "+gryphJunk("His", "Her", "Their")+" "+(data.violetGryphonCunt?"pussy gushes over with "+(isActive("Mood Ring")?getMood("You"):"")+"cum and natural lube, soaking your nuts and inner thighs":gryphJunk("prostate throbs against your head, his tight sack bounces with your final thrusts, his own "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cum splattering his belly", "pussy gushes over with "+(isActive("Mood Ring")?getMood("You"):"")+"cum and natural lube, soaking your nuts and inner thighs", "prostate throbs against your head his tight sack bounces with your final thrusts, their own "+(isActive("Mood Ring")?getMood("Gryphon"):"")+"cum splattering his belly"))+". <3\n\n"+gryphJunk("He sends", "She sends", "They send")+" you a few images of molten white bliss, beak chittering weakly against the floor as the last dregs of cum spill out and soak into "+gryphJunk("his", "her", "their")+" fur.\n\n<!i>Thank... you...<!i>");
			addChoice("Wind down.", violetMeteoriteExplore.bind("gryphonwinddowndom"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddowndom") {
			append("You unplug. White spatters over the floor, but neither of you really hear it. You're just listening to the sound of each other's breathing. The rain stops, leaving only the hum of the falls.\n\n<!i>Well,<!i> "+gryphJunk("he says", "she says", "they say")+", for the sake of saying something. (It's literally an image of a well.)\n\nA subterranean zephyr drags its fingers through "+gryphJunk("his", "her", "their")+" soaked crotchfur and whisks "+gryphJunk("his cute flaccid cock", "her swollen, tender cunt", "their junk")+" back into non-existence.\n\nThey lay a paw over their bloated belly, cradling all your precious "+(isActive("Mood Ring")?getMood("You"):"")+"cum.");
			addChoice("Cuddle time.", violetMeteoriteExplore.bind("gryphonwinddowndom2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddowndom2") {
			append("They send you an image of themselves heading back into their burrow and licking their cummy fur clean.\n\n<!i>I'm in my refractory period,<!i> they explain. Lots of diagrams. <!i>I need to retreat. We cuddled while you penetrated me.<!i>");
			addChoice("That's not cuddling, that's fucking. Now cuddle me damn it.", violetMeteoriteExplore.bind("gryphonwinddowndom3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "gryphonwinddowndom3") {
			append("You launch yourself at them, pressing your floppy dingus to the smooth, round little stretch of fur where their junk used to be and grinding it very, very platonically. <3\n\nThey roll their eyes and curl a paw around your back, patting you awkwardly.\n\n<!i>Yes, well. Thank you again for the sex. I'm glad I could give you some shelter in return.<!i>");
			addChoice("You're welcome. (Move along.)", violetMeteoriteHub);
			addChoice("You're welcum~ (Move along.)", violetMeteoriteHub);
		}

		if (which == "ExploreKemp") {
			unlockJournal("Kemp Truck");
			append("Two plumes of smoke rise from the crater at the bottom of the meteorite.\n\nOne is dark and frighteningly persistent. The other is a merry blue-pink, but it only rises in occasional puffs.");
			addChoice("Examine dual plumes.", violetMeteoriteExplore.bind("kemp1"), {kinks: ["Male", "Drugs"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "kemp1") {
			append("Kemp crashed his truck.\n\nHe sits against it, bare ass smushed flat on the gravel road, legs splayed, otter tail stuck out between them. His bong rests on his tail's wide base, nuzzled deep against the slick fur of his nutsack. The bong's bowl is packed with fresh sweetgrass.\n\nHe stares at you blankly for a moment as you approach. The white noise of rushing water comes from somewhere beneath the rock.\n\nHe's so out of it you don't think he even recognizes who you are.");
			addChoice("Hey, you okay??", violetMeteoriteExplore.bind("kemp1b"));
		}

		if (which == "kemp1b") {
			append("Now he recognizes you. You know he does, because his fretted, sad little expression breaks out into a super wide :]-shaped otter grin.\n\n\"Was lookin fer you,\" he says. \"But I forget why.\"\n\nAs he says that, some tendrils of blue-pink smoke escape from his maw and hang upside-down off his upper lip. They're kind of viscous and goopy. It takes them five full seconds to snap off and sway faggily upward into the rest of the plume.\n\nMeanwhile, the black smoke twists up into the air dead straight. It's coming from the hood of his crashed truck. The hood's wrapped halfway around a boulder, stained with smog. On it, Kemp's sick-as-fuck fire decals peel in the heat.");
			addChoice("What did you do now you fuckin stoner?", violetMeteoriteExplore.bind("kemp1donow"));
			addChoice("What happened, man?", violetMeteoriteExplore.bind("kemp1a"));
		}

		if (which == "kemp1donow") {
			append("\"Be nice,\" he snaps. He rests his head back against his truck, eyes closed, riding the high and the last dregs of adrenaline.\n\nHe reluctantly offers the bong to you, maybe just out of politeness, and that bares his half-hard cock. It's laying up against his lower stomach, just a hair short of his belly button. A single tiny bead of pre might close the distance.");
			addChoice("Alright I'm sorry. I meant it in a joking way. What happened?", violetMeteoriteExplore.bind("kemp1bitmean"));
			addChoice("Your truck is about to explode.", violetMeteoriteExplore.bind("kempexplode"));
		}

		if (which == "kemp1bitmean") {
			append("\"S'alright. I just took a wrong turn.\"\n\nThere are at least six distinct swerve marks left on the gravel behind his crashed truck.");
			addChoice("Your truck is about to explode.", violetMeteoriteExplore.bind("kempexplode"));
			addChoice("Looks more like six wrong turns in a row.", violetMeteoriteExplore.bind("kempwrong"));
		}

		if (which == "kemp1a") {
			append("\"Took a wrong turn.\"\n\nHe smiles and offers the bong to you, baring his half-hard cock. It's laying up against his lower stomach, just a hair short of his belly button. A single tiny bead of pre might close the distance.\n\nThere are at least six distinct left-right swerve marks left on the gravel behind his crashed truck.");
			addChoice("Your truck is about to explode.", violetMeteoriteExplore.bind("kempexplode"));
			addChoice("Looks more like six wrong turns in a row.", violetMeteoriteExplore.bind("kempwrong"));
		}

		if (which == "kempexplode") {
			data.kempTruckExplodePredicted = true;
			append("\"You play too many games, bud,\" Kemp says, scratching his nuts. They bounce around happily in their sack. \"Just cause a truck's smokin doesn't mean she's gonna <!i>explode<!i>. Come take this hit, my arm's gettin sore.\"\n\nHe's still holding the bong out for you.");
			addChoice("Sit down with him and have a toke.", violetMeteoriteExplore.bind("kemp2"), {kinks: ["Raunch"]});
			addChoice("Nah, I gotta go.", violetMeteoriteExplore.bind("kempearlyleave"));
		}

		if (which == "kempwrong") {
			append("He wiggles a few digits beneath his beanie and scratches the back of his head. \"Welll-l-l, yeh, it may've been a couple or two...\"");
			addChoice("Or six.", violetMeteoriteExplore.bind("kempwrong2"));
		}

		if (which == "kempwrong2") {
			append("\"Okay, yah. I didn't just get lost. I panicked.\"");
			addChoice("Why?", violetMeteoriteExplore.bind("kempwrong3"));
		}

		if (which == "kempwrong3") {
			append("\"Reasons.\"\n\nHe's still holding the bong out for you. \"Come sit down.\"");
			addChoice("Sit down with him and have a toke.", violetMeteoriteExplore.bind("kemp2"), {kinks: ["Raunch"]});
			addChoice("Nah, I gotta go.", violetMeteoriteExplore.bind("kempearlyleave"));
		}

		if (which == "kemp2") {
			append("You nestle up next to him. The otter fur on his left thigh feels all smooth and warm and greasy against your bare skin, like the indent left over on a suede couch after a sweaty otter's been sitting there mowing down BBQ potato chips for three hours, spilling them all over himself, sucking his fingers clean and drooli—\n\n\"I remember what I came up here to show ya!\" he says, interrupting your train of thought. His voice is low and his cock is hard. \"Here now...\"\n\nHe tucks the bong between your legs and twists it til it's niiiice and snug. The cool glass of its base kissses your "+pickByGenitals("nuts", "cuntlips", "nuts")+".\n\n\"Now here,\" he says, \"yah, sure, you could just type 'smoke the sweetgrass,' and be done with this shit in two seconds— but there's a whole meditative <!i>procedure<!i> you're missin if you do that, y'know? And er— well, I'd like to walk you through it. I wanna show you my way.\"\n\nHe fixes you with a goofy dudesmirk. \"Then, uh... if you ever get the chance to rip a bong up there in the Real World, maybe you remember my way of doin it— some piece of me gets up there into your Upper Realm, and before ya fuckin know it, some Yiffy Stoner in a Text-Based Ero Game has an effect on the universe one layer, two layers up...\"");
			addChoice("Smoke the sweetgrass.", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("Show me the procedure.", violetMeteoriteExplore.bind("kemp2show"), {kinks: ["Cub", "Art"]});
			addChoice("Layers?", violetMeteoriteExplore.bind("kemp2layers"));
			addChoice("Why are you title-casing everything.", violetMeteoriteExplore.bind("kemp2title"));
			addChoice("I know how to use a bong.", violetMeteoriteExplore.bind("kemp2know"));
		}

		if (which == "kemp2title") {
			append("He holds back some self-conscious laughter. He adjusts and re-adjusts and re-re-adjusts his beanie, then fiddles awkwardly with his nutsack.\n\n\"I dunno, fuck. Just tickles me how many abstractions we gotta make to communicate clearly, I guess, and how uh... how I can't like... fuck, whaddamItrynasay... how I can't escape what I am. Feel like, since you're all regular, and I'm all... an anthro creature being who smokes green leaves what gets me high... I gotta draw attention to that. I gotta <!i>own<!i> it and be all self-aware, so you'll like me better, or at least understand me better, and I guess that really just reflects my psycholo—\"");
			addChoice("Okay I think you're reading a little too deep into yourself.", violetMeteoriteExplore.bind("kemp2titledeep"));
			addChoice("Oh I totally get what you're saying, if I were talking to an alien from an Upper Layer I would constantly say Humans and Culture and Earth too. It's cool.", violetMeteoriteExplore.bind("kemp2titlecool"));
		}

		if (which == "kemp2titledeep") {
			append("\"May be, may be...\"\n\nHe's still holding the bong out to you. He jiggles it a bit.\n\n\"Now you gonna smoke this and get deep with me or what?\"");
			addChoice("Smoke the sweetgrass.", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("Show me the procedure.", violetMeteoriteExplore.bind("kemp2show"), {kinks: ["Cub", "Art"]});
		}

		if (which == "kemp2titlecool") {
			append("His fidgety paw slides off his nutsack, onto his thigh, perfectly relaxed.\n\n\"Ah yeah?\" he says with a big smile. \"Cool~\"\n\nHe's still holding the bong out to you. He jiggles it a bit.\n\n\"Now you gonna smoke this and get a Described High with me or what?\"");
			addChoice("Smoke the sweetgrass.", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("Show me the procedure.", violetMeteoriteExplore.bind("kemp2show"), {kinks: ["Cub", "Art"]});
		}

		if (which == "kemp2know") {
			append("You expect him to playfully snip back at you with something like \"Well I'm very fuckin proud of ya\" but he doesn't. He just shuts up and nods.\n\nYou think you might've actually hurt his feelings. Even if you did, though, you didn't put a dent in his permanent stoner smile. You guess it's fine.");
			addChoice("Sorry. (Smoke the sweetgrass.)", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("Not from experience, though. I just read about it. (Smoke the sweetgrass.)", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("... I guess I could use a refresher!", violetMeteoriteExplore.bind("kemp2show"), {kinks: ["Cub", "Art"]});
		}

		if (which == "kemp2layers") {
			append("He jerks his chin at the sky.\n\n\"You know. You're up there on that layer, I'm down here on this one, that kinda shit. <!i>Layers of reality,<!i> Som and John and Lana say. It's like them dolls with the big tiddies.\"");
			addChoice("Ah... then, yeah, an effect on the universe one layer up.", violetMeteoriteExplore.bind("kemp2layers2"));
			addChoice("Matryoshka dolls.", violetMeteoriteExplore.bind("kemp2layers2a"));
		}

		if (which == "kemp2layers2a") {
			append("\"Yeah, machoshkuh dolls.\"");
			addChoice("So I'm one doll above you.", violetMeteoriteExplore.bind("kemp2layers2"));
		}

		if (which == "kemp2layers2") {
			append("\"Yeah, one or two.\"");
			addChoice("Two...?", violetMeteoriteExplore.bind("kemp2layers2b"));
		}

		if (which == "kemp2layers2b") {
			append("\"Yer doll might be in another doll, is all.\"");
			addChoice("I'm not in a videogame.", violetMeteoriteExplore.bind("kemp2layers3"));
		}

		if (which == "kemp2layers3") {
			append("He pulls back, wiping the smirk off his face. \"Course. Yeah. I mean, you never know. But yeah, nah. Course you're not.\"");
			addChoice("I don't feel like I am.", violetMeteoriteExplore.bind("kemp2layers4"));
		}

		if (which == "kemp2layers4") {
			append("\"How do you feel?\"");
			addChoice("Real.", violetMeteoriteExplore.bind("kemp2layers5"));
			addChoice("Alive.", violetMeteoriteExplore.bind("kemp2layers5"));
			addChoice("Sentient.", violetMeteoriteExplore.bind("kemp2layers5"));
			addChoice("Horny.", violetMeteoriteExplore.bind("kemp2layers5"));
		}

		if (which == "kemp2layers5") {
			append("\"Hey woah shit waddayaknow,\" he says, grinning. \"Me too!\"");
			addChoice("Just smoke the sweetgrass.", violetMeteoriteExplore.bind("kemp2smokeearly"));
			addChoice("Alright, show me your procedure already.", violetMeteoriteExplore.bind("kemp2show"), {kinks: ["Cub", "Art"]});
		}

		if (which == "kemp2smokeearly") {
			data.kempSmokedEarly = true;
			highEffect();
			append("\"Ah— hey, sure, that's fine... I was just uh... yeah...\"\n\nYou pull in two lungfuls of pink and spew out two lungfuls of blue, and your lips trail a magnificent mixture of both colours. You cough a little.\n\n\"You've got a cute cough,\" Kemp says, one paw sliding up and down his cock as he watches you. \"Sounds like a chipmunk chokin on some nuts.\"\n\n(He says that like it's supposed to be arousing? You guess it is kinda cute to picture, if you're into   <!img:kink/Feral.png>   .)\n\nThe skin on his shaft is really loose, you notice, as your vision starts to sparkle and tunnel in on Kemp's crotch. His paw pulls it up and down easily, shifting fat veins and making his nutsack sway a little.");
			addChoice("Mmnnn... take another toke.", violetMeteoriteExplore.bind("kemp3"));
		}

		if (which == "kemp2show") {
			data.kempSmokedEarly = false;
			append("\"Right!!!\" he says, clearly fucking ecstatic to teach you his ~way.~\n\nHe scooches closer. His cock flops over his thigh and onto yours, leaking pre.\n\n\"First we'll light it— but don'tcha worry, I'll handle that part. You just focus on what I tell you next.\"");
			addChoice("You got a lighter?", violetMeteoriteExplore.bind("kemp2showa"));
		}

		if (which == "kemp2showa") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/kempLighter.png");
				s.x = GAME_WIDTH-s.width*1.5;
				s.y = GAME_HEIGHT*0.5-s.height*0.5;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Upper-Upper-Layer Artist: Cubber\n\n<!img:kink/Art.png>  Current Layer Artist: Somner Lamblea", "");
			append("Oh fuck yeah he does. A custom one, too. It has some cute boy with a tiny dick painted onto it, worn from decades of use.");
			addChoice("Who drew that?", violetMeteoriteExplore.bind("kemp2show2"));
		}

		if (which == "kemp2show2") {
			append("\"Oh,\" Kemp says, shifting his fingers to cover the art. \"Som.\"\n\n\"Anyway, listen: I'm gonna spark the fucker up and then you gotta inhale— hard. Make it go all bubbly. That fills up the chambers in there with gay smoke. Then I'm gonna pull out the bowl— that'll clear this airway here, see...\"\n\nHe unplugs the little glass bowl and points to the hole it was resting in. It looks like someone jizzed in it earlier, but he slips the piece back down before you can say anything.\n\n\"So go ahead and get your mouth lined up on the rim there... the way I do it is lips-out... and, when I tell ya, suck.\"");
			addChoice("Put my lips on the inside of the rim.", violetMeteoriteExplore.bind("kemp2inside"));
			addChoice("Put my lips around the outside of the rim.", violetMeteoriteExplore.bind("kemp2outside"));
		}

		if (which == "kemp2inside") {
			append("\"Sure, that way's fine too... not as raunchy, but fine...\"");
			addChoice("I'm ready.", violetMeteoriteExplore.bind("kemp2presmoke"));
		}

		if (which == "kemp2outside") {
			append("\"Oh fuck yeah,\" Kemp groans, looking sheepishly downward. His cock surges to full hardness in seconds. \"Sorry, the boys... lot of em aren't down for the raunchy kinda stuff, and they always keep their lips on the inside— sure, that's fine— but there's nothin quite like suckin smoke from a piece that some dude's just been slobbering <!i>all<!i> the fuck over. "+pickByGender("", "Or chick, in this case. ", "")+"Not that I'm tryna pressure you to slobber on my bong...\"");
			addChoice("Slobber on his bong.", violetMeteoriteExplore.bind("kemp2slobber"), {kinks: ["Raunch"]});
			addChoice("I'm not pressured.", violetMeteoriteExplore.bind("kemp2presmoke"));
		}

		if (which == "kemp2slobber") {
			append("Your salivary glands prickle and gush. You lock eyes with Kemp, lower your lips over the fat glass lip, and make a big, disgusting <!i>schkcschklurrrrrp<!i> noise, your tongue wandering around it in circles. Beads of hot drool trickle down the cylinder.\n\nAt first he just blinks at you. His pink eyes follow your tongue in slow circles.\n\nThen his cock starts to quiver pathetically, and his round otter eyebrows peak together in the middle— and before he can even say \"Unnnnhhhh nyaaa~!\" a goopy load of "+(isActive("Mood Ring")?getMood("Kemp"):"")+"ottercum beans him right in his face.\n\nHe doesn't care. He just opens his maw to catch a few ropes, still staring dumbfoundedly at you.\n\n\"Yer gross,\" he mutters. He scoops a couple fingerfuls of cum up absent-mindedly and sucks them clean with an exhausted shake of his head.");
			addChoice("(Pop my mouth off the rim.) Mkay, I got the technique down. So can I smoke this now? :3", violetMeteoriteExplore.bind("kemp2presmoke2"));
		}

		if (which == "kemp2presmoke") {
			append("\"Oh, good, good,\" he says, throbbing. \"Alright... ready... one, two, three—\"");
			addChoice("Suck.", violetMeteoriteExplore.bind("kemp2smoke"));
		}

		if (which == "kemp2presmoke2") {
			append("\"What? Oh— right... time to get some tokes in ya...\" he says, already back up to full hardness. \"Alright... ready... one, two, three—\"");
			addChoice("Suck.", violetMeteoriteExplore.bind("kemp2smoke"));
		}

		if (which == "kemp2smoke") {
			append("You suck.\n\nKemp's grip closes tight around the chest and tummy of the little boi on his lighter. His thumb skids over the sparkwheel.\n\nYou stare down the barrel of the bong, into its cherried bowl. Hot orange embers stare back. You can't even see your "+pickByGenitals("cock", "cunt", "cock")+" past the opaque smokeswirls gathering just below the glass, but still you still sucksucksuck. Your lungs reach max capacity and start to strain inside you. You can almost hear them keen for air.\n\nFinally, Kemp   <!img:kink/Snuff.png>  's the lighter and pulls the bowl out. Fresh air rushes in and starts to clear all the smoke.\n\n\"Keep sucking,\" he says, rapt. He's almost getting off just on the sight of your blue cheeks and puffed-out chest.");
			addChoice("Keep sucking?!", violetMeteoriteExplore.bind("kemp2smoke2"));
		}

		if (which == "kemp2smoke2") {
			append("(You pull off for a second to say that incredulously, and to exhale quickly, covering the bong with a palm in the meantime. Yes, he tells you, keep sucking.)");
			addChoice("Keep sucking.", violetMeteoriteExplore.bind("kemp3"));
		}

		if (which == "kemp3") {
			highEffect(1200);
			append("<!i>SCHHHHLLLLORRRRRRRRRRRRRRPPPPPPPP<!i>\n\nYou haul up a double lungful of sweetsmoke. It sears your airways and makes your tongue a little itchy on the way in. You can't feel anything on the way out; your insides are numb.\n\nOkay you cough and hack and sweetsmoke splurts from your nostrils. Something is happening??\n\nIt's very hard to describe. Everything is a little swirlier for sure, you can pin that one down. Common objects like the wheels on Kemp's truck seem extra sexy. Their rubber is all shiny and tight.");
			addChoice("Duuuuuude~", violetMeteoriteExplore.bind("kemp3a"));
		}

		if (which == "kemp3a") {
			highEffect(3000);
			append("You slump over.\n\nMore smoke leaks from your face and obscures your vision. You imagine what your insides must look like. They almost <!i>feel<!i> blue and pink.\n\nSuddenly Kemp's concerned face appears in front of you like the movie just got slam-cut to a new scene.\n\nHis fingers wave in front of your unblinking, slowly pinkening eyes.\n\n\"You okay?\" he asks, and his breath rushes over you like wind down a tunnel. \"Yer lookin pale... ah, fuck... I overdid it...\"");
			addChoice("Haha damn my screen's all swirly! Round two round two!", violetMeteoriteExplore.bind("kemp3more"));
			addChoice("Help me, Kemp, I don't know if I'm gonna make it...", violetMeteoriteExplore.bind("kemp3dunno"));
		}

		if (which == "kemp3more") {
			highEffect(5000);
			disablePause();
			append("\"Easy enough for you to type that,\" he echoes from the other end of the tunnel. \"Your player character is slumped over here with forty BPM, fuck, drool comin out everywhere— round two my ass, you're gonna O.D...\"\n\nHe trails off. Either that, or your ears give out.\n\nHis face disappears in a sea of hot swirls.\n\nYou go unconscious.");
			addChoice("Shake it off and wake up for round two.", violetMeteoriteExplore.bind("kemp5"));
			addChoice("Oops?", violetMeteoriteExplore.bind("kemp4"));
		}

		if (which == "kemp3dunno") {
			highEffect(5000);
			disablePause();
			append("\"Stop talkin like that,\" he echoes from the other end of the tunnel. \"Even if you fuckin O.D. you'll just respawn... still, better to avoid it... dangerous to die on the meteorite...\"\n\nHe trails off.\n\nHis face disappears in a sea of swirling pink and blue.\n\nYou pass out.");
			addChoice("Oops?", violetMeteoriteExplore.bind("kemp4"));
		}

		if (which == "kemp4") {
			highEffect(400);
			append("You can't make any noise. You're sedated.");
			addChoice("Wake up.", violetMeteoriteExplore.bind("kemp5"));
		}

		if (which == "kemp5") {
			highEffect(9000);
			append("You come halfway back to reality forty-five minutes later.\n\nKemp's lips are wrapped around yours. His breath used to be slow and windy when it came down the tunnel of your come-up, but now it's right in your face, gushing down your throat and filling your slack lungs.\n\n\"Don'tdiedon'tdiedon'tdie,\" he pleads.\n\nYour eyes crack open a sliver.\n\nHis are clenched shut.\n\nEvery meager muscle in his husky stoner's body strains.\n\nTwo tense otter palms beat down on your heart. It flutters pathetically.");
			addChoice("Won't I just respawn? (Also don't die.)", violetMeteoriteExplore.bind("kemp5a"));
		}

		if (which == "kemp5a") {
			highEffect(3000);
			append("You can't speak.\n\nYour diaphragm is perfectly, immovably relaxed.");
			addChoice("Okay just breathe with him.", violetMeteoriteExplore.bind("kemp6"));
		}

		if (which == "kemp6") {
			highEffect(3000);
			append("You inhale the exhales he gives you.\n\nThis goes on for another ten minutes. He's not giving up.");
			addChoice("Fuck what can I do?", violetMeteoriteExplore.bind("kemp7"));
		}

		if (which == "kemp7") {
			highEffect(3000);
			append("Wait and see if the sedation wears off.");
			addChoice("How long will it take?", violetMeteoriteExplore.bind("kemp8"));
		}

		if (which == "kemp8") {
			highEffect(3000);
			append("Hours.\n\nIt may not wear off.\n\nThere's a second wave coming.\n\nYou think Kemp knows this. He slaps you and yells at you and begs you to wake up.\n\nYour eyelids shut again.");
			if (data.myntWriterDone) addChoice("Mynt just tell Kemp it's gonna be okay.", violetMeteoriteExplore.bind("kemp8tell"));
			addChoice("Fuck. Move along move along move along.", violetMeteoriteExplore.bind("kemp8move"));
		}

		if (which == "kemp8tell") {
			highEffect(3000);
			append("He doesn't have his phone on him.");
			addChoice("Well fuck then just timeskip until I'm okay again.", violetMeteoriteExplore.bind("kemp9"));
		}

		if (which == "kemp8move") {
			highEffect(5000);
			append("Your legs are splayed against the gravel. They won't even twitch.");
			addChoice("Just timeskip until I'm okay again.", violetMeteoriteExplore.bind("kemp9"));
		}

		if (which == "kemp9") {
			append("The second wave drags you back under by your smoke-seared throat.\n\nYou resurface six hours later. Kemp was right here with you the whole time.\n\nHe looks tortured. There are bags under his staring eyes. \"You back?\" he croaks. You can tell he's already asked that question several times.");
			addChoice("Yes!", violetMeteoriteExplore.bind("kemp10"));
		}

		if (which == "kemp10") {
			enablePause();
			append("All the strain leaks from his face. He hides it in your chest and just breathes. \"Thank fuck. Thought you went downstairs fer sure.\"");
			addChoice("Why were you so worried for me?", violetMeteoriteExplore.bind("kemp11"));
		}

		if (which == "kemp11") {
			append("He pulls himself off of you and tries to stand. His legs go jello, though, so he has to slump against his truck.\n\n\"I'm a little too fuckin flustered for exposition,\" he says. \"Just don't die on the meteorite. Don't ever fuckin die on the meteorite. You got that?\"");
			addChoice("Yeah.", violetMeteoriteExplore.bind("kemp12"));
		}

		if (which == "kemp12") {
			append("\"Good,\" he says, and snuggles up with his bong again, although he doesn't pack a fresh bowl. He just clings to it for something to cling to. \"It ain't fun.\"");
			addChoice("I'm, uh... I'm here, if you need something to cuddle.", violetMeteoriteExplore.bind("kemp13"));
		}

		if (which == "kemp13") {
			append("\"Come the fuck over, then.\"\n\nKemp pulls you into a big sweaty otterhug, squeezing you so tight you fart a little. He doesn't care or comment on it. His cock brushes against your stomach, floppy and soft, and the smooth fabric of his beanie rubs against your left ear.\n\n\"I'm sorry,\" he whispers. \"This's supposed to be some sexy fun stoner time or some shit... you can move along if ya want...\"");
			addChoice("Hey it's alright, I'm still just sitting here reading. No harm done.", violetMeteoriteExplore.bind("kemp14"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "kemp14") {
			append("\"Still..."+(data.kempSmokedEarly?"":" it was my fault...")+"\"");
			addChoice("No, not still. "+(data.kempSmokedEarly?"It was my fault":"It was an accident")+".", violetMeteoriteExplore.bind("kemp15"));
		}

		if (which == "kemp15") {
			append("\"I guess.\"\n\nYou cuddle there for a while, with the thin high-altitude winds pushing at your back, threading between your buttcheeks...");
			addChoice("Rub his cock.", violetMeteoriteExplore.bind("kemp16"));
			addChoice("Well, I should get going...", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kemp16") {
			append("You let your fingers wander over his smooth belly, down into the little divot of his innie, and finally onto the soft, squishy fur of his flaccid shaft. You pick it up gingerly from its damp underside, peeling it off the sweaty fur of his nutsack, and then you start to twist it around, tugging and tickling at every crevice of his cock with one circular motion.\n\nHe looks at you shrewdly as his ottercock stirs and hardens to a semi in your grasp. \"That feels good,\" he croaks. His throat is dry.");
			addChoice("Let's move past this. No need to be sad about it.", violetMeteoriteExplore.bind("kemp17"));
		}

		if (which == "kemp17") {
			append("\"I'm not quite sad about <!i>it<!i>,\" he admits. \"But uh... somethin else.\"\n\nYou rub him particularly good, just above his nuts. They twitch and tighten up in their sack. He bites his fuzzy lower lip and clutches his bong a little closer, like a cub might clutch their teddy bear. You don't have to say 'Go on' for him to understand you're here, ready to read whatever he wants to say.\n\n\"What's wrong is... I still wanna smoke more. Been sober for three hours outta six, and that's not usually this hard on me. I still wanna smoke more. Even though I almost killed ya with the stuff. That should turn me off, shouldn't it? I feel greasy. I feel like a greasy addict. And I <!i>still<!i> wanna smoke more.\"");
			addChoice("Well, let's just try something softer. Maybe a joint.", violetMeteoriteExplore.bind("kemp18"));
		}

		if (which == "kemp18") {
			append("\"Thassagoodplan,\" he exhales. Relief washes through his tense muscles and shivers up from the base of his cock to the tip. It's clear he expected you to start a pep talk about resisting cravings or something.\n\nHe finally peels the bong off of his side and screws it down firmly into the gravel. He hauls himself up the side of his truck, legs still wobbly, and he pulls out some cum-flavored rolling papers and a little baggie of granular green.\n\nIn this process, your hand slips from his cock, but the moment he flops back down he takes it (gently, tentatively) and pulls your palm back onto his warm nuts.\n\n\"Keep going,\" he says, eyes on you, watching for discomfort. He picks a pickled paper out of the pack and licks the glue strip all slow and seductively. He isn't trying to seduce you, necessarily. You were already giving him a casual handjob. You think, more than anything, acting seductively is familiar and safe and relaxing for him. You also think maybe you should stop reading into his actions so much... but it's hard not to! He does everything so slow and deliberate, maybe because he's used to fucking things up all the time, and his face is always so expressive, maybe because he really does want you to get to know the real him... and you... alright, you better stop...\n\n\"First I crash,\" he laughs, \"then I halfway kill ya... yeah, I shouldn't feel bad about another lil toke... if ever there was a time for it...\"");
			addChoice("Awww Kemp. <3333", violetMeteoriteExplore.bind("kemp19b"));
			addChoice("Got a ~procedure~ for joints too? (Grope his nuts.)", violetMeteoriteExplore.bind("kemp19"));
		}

		if (which == "kemp19b") {
			append("\"Awww what? Is Mynt narrating some gay shit about me again? Told her to go easy on that...\"");
			addChoice("Oh! Nope, not at all... say, do you have a ~procedure~ for joints too? (Grope his nuts.)", violetMeteoriteExplore.bind("kemp19"));
		}

		if (which == "kemp19") {
			append("You squeeze and play with them, rolling the soft, squishy orbs around together. \"Just a little one,\" he says. \"You uh. You know what canoeing is?\"");
			addChoice("When you row a little boat around...?", violetMeteoriteExplore.bind("kemp20"));
			addChoice("When a joint burns unevenly?", violetMeteoriteExplore.bind("kemp19a"));
		}

		if (which == "kemp19a") {
			append("He rolls the joint up perfectly.\n\n\"Bingo,\" he says, and his cock throbs with affection for you. \"Well, I got a handy, sexy solution for that.\"");
			addChoice("Mhm?", violetMeteoriteExplore.bind("kemp22"));
		}

		if (which == "kemp20") {
			append("Before you've tugged his testes twice, he's rolled the joint up perfectly and stuck it in his maw. He holds his lighter to the end, thumbs the wheel, and, when a single paw turns out to be too shaky to keep the flame in one spot, he holds his cute lighter steady in both paws, leans forward, narrows his eyes, and practically wills the flame into a steady existence on one specific side of the joint only.\n\nSoon the flame overtakes that side, while the other stays pure white and untouched.\n\n\"That,\" he says, and the word disappears in a puff of smoke, \"that's a canoe. It's when yer joint's all hollowed out on one side, and that side burns down too fast for the other one to keep up.\"");
			addChoice("Oh. Cool?", violetMeteoriteExplore.bind("kemp21"));
		}

		if (which == "kemp21") {
			append("\"Not cool, shitty. If one side's burnin too fast, half the thing goes to waste, and joints already got the poorest grass-to-high ratio. Lotsa smoke goes to waste that'd otherwise get caught in the chamber of a bong. So what to do? Well, you use the ol smooch strat... a ~procedure~ that flips yer canoe back upright. Here...\"\n\nHe holds the burning side of the joint out in front of your face.\n\n\"Kiss it.\"");
			addChoice("I'm sorry?", violetMeteoriteExplore.bind("kemp22"));
		}

		if (which == "kemp22") {
			append("\"The unburnt part! The unburnt part. This ain't a dom thing. Give'er a lil kiss on there. Make sure it's sloppy, too.\"");
			addChoice("...", violetMeteoriteExplore.bind("kemp23"));
		}

		if (which == "kemp23") {
			append("He's starting to feel awkward.\n\n\"Or, y'know—\"");
			addChoice("Run my tongue over my lips, get them nice and wet, and kiss it.", violetMeteoriteExplore.bind("kemp24"));
		}

		if (which == "kemp24") {
			append("You eye the spot you're aiming for: a little stretch of unburnt paper between the burning end of the joint and the end you put your mouth on.\n\nYou hold eye contact with him and squeeze his nuts extra vigorously. You wrap your lips around that spot, and your saliva soaks in and darkens it. The vague taste of synthetic cum clings to your lips when you pull off and lick them again.\n\n\"Fuck yeah,\" he purrs, admiring your handiwork. His toes twitch a little, either from your ongoing nut massage, or from the extreme cuteness of your kiss.");
			addChoice("Did I do a good job?", violetMeteoriteExplore.bind("kemp25"));
		}

		if (which == "kemp25") {
			append("\"Suck'n see...\"\n\nHe holds the filter-end to your lips. You suck quick and gently.\n\nThe long, burning hollow side creeps down the paper... but then it hits your saliva and stops completely. This buys some time for the other side of the joint to catch up, and soon the whole thing crumbles off in ashes and it's burning evenly again.\n\nBy now your saliva dries out. The cherry sinks languidly down on both sides, as a perfect little orange ring.\n\n\"That,\" Kemp says, \"is how ya flip a canoe. It's good practice for when ya gotta kiss boys, ya know...\"");
			addChoice("Ahahah. Good strat.", violetMeteoriteExplore.bind("kemp27"));
		}

		if (which == "kemp27") {
			append("\"Thanks!\" he smiles, and pulls the rest of the joint down in one colossal rip.\n\nHe starts coughing and hacking disgustingly, and a blush seeps up over his face. His cock goes flaccid despite your continued attention. He leans over, away from you, clears his throat, and spits.\n\n\"Ptwaaaa... fuhhhh... hrk. Flavored paper burns rough... fuck, I gotta get organic cum papes next time, they sprinkled some sugar in this shit...\"");
			addChoice("You good now? Cravings gone?", violetMeteoriteExplore.bind("kemp28"));
		}

		if (which == "kemp28") {
			append("Kemp rights himself and turns slowly to face you. His eyes are bright pink and his smile is goofy and invincible.\n\n\"Ya. I'm good.\"");
			addChoice("Good. :3", violetMeteoriteExplore.bind("kemp29"));
		}

		if (which == "kemp29") {
			append("He tilts his head back and looks at the stars and exhales.\n\nHe flicks the roach away.");
			addChoice("Kiss his neck.", violetMeteoriteExplore.bind("kemp30"));
		}

		if (which == "kemp30") {
			append("You drag your hand up his nuts, over his cock, over his smooth belly, his chest, and around the side of his neck that faces away from you. With your hand leveraged just above his collarbone, you can now pull yourself up and rest your cheek on his other shoulder. His neckfur bristles and goosebumps as your breath washes over it— but that's nothing compared to the seismic shiver that wracks him the moment you let your tongue slide out over his bare neck for the very first time.\n\n\"Oh...\"\n\nYou suck and kiss and lick, all in slow transitionary movements, and you feel the vibration of happy whimpers against your tongue whenever they leak up his windpipe.\n\n\"Yer... yer tickling me...\"");
			addChoice("Mmmnnn... good...", violetMeteoriteExplore.bind("kemp31"));
		}

		if (which == "kemp31") {
			append("You lather his gulping throat up with a particularly vicious lick, and he legitimately goes \"Eep!\"\n\nHe doesn't seem to know what to do with his paws. They wander over your bare shoulderblades, rubbing idly, and sometimes he's brave enough to reach down and give your "+(data.hasBoobs?"tits a gentle squeeze":"nips a tweak or two")+"... but that's all...");
			addChoice("Touch me.", violetMeteoriteExplore.bind("kemp32"));
		}

		if (which == "kemp32") {
			append("\"... 'Touch me'... perfume... the wind in the leaves...\" he sings under his breath.");
			addChoice("Hmmmm?", violetMeteoriteExplore.bind("kemp33"));
			addChoice("You listen to Mr. Bungle too~?", violetMeteoriteExplore.bind("kemp33bungle"));
		}

		if (which == "kemp33bungle") {
			append("\"Nah. But I've read those lyrics.\"\n\nHe peels your slurping mouth off his neck for a moment. \"You trying to give me a hickey or something...?\"");
			addChoice("Maybe. :3", violetMeteoriteExplore.bind("kemp34"));
		}

		if (which == "kemp33") {
			append("\"Dunworryaboutit... I get all lyrical when I'm... when I'm... oh, fuck... stop it for two seconds...!\"\n\nHe peels your slurping mouth off his neck for a moment. \"Hey, alright, ease off. You trying to give me a hickey or something...?\"");
			addChoice("Maybe.", violetMeteoriteExplore.bind("kemp34"));
		}

		if (which == "kemp34") {
			append("\"I hate hickeys,\" he grumbles. \"Som always tried to give em to me. They're so... territorial.\"");
			addChoice((data.metSom > 0?"Mmm... how do you two know each other, again?":"Who's Som?")+" (Hickey him even harder.)", violetMeteoriteExplore.bind("kemp35"));
		}

		if (which == "kemp35") {
			append("He squirms and complains, but... in the end... he lifts his chin and lets you back at him. His brow furrows and his cock stiffens past maximum stiffness into the kind of raging boner you can only get when someone rapes your neck with their mouth.\n\n\"He's my son,\" Kemp admits, after a long pause. \"Adoptive, of course... but I don't really wanna talk about that...\"");
			addChoice("Why not?", violetMeteoriteExplore.bind("kemp36"));
		}

		if (which == "kemp36") {
			append("\"What'd I just say?\"");
			addChoice("Come onnnnn. I'll suck your cock if you tell me.", violetMeteoriteExplore.bind("kemp37"));
		}

		if (which == "kemp37") {
			append("... It twitches hard. You move your mouth down to his chest and drag your tongue in slow circles around his left nip, twiddling the nublet with its tip. All you need to do is move down a bit, like that, to tease at the idea of moving down a lot further...");
			addChoice("Deal~?", violetMeteoriteExplore.bind("kemp38"));
		}

		if (which == "kemp38") {
			append("\"No,\" he says, and pushes his boner down between his legs so you can't get at it.");
			addChoice("Not even if I deepthroat it and gag really hard on your head?", violetMeteoriteExplore.bind("kemp39"), {kinks: ["Plot"]});
			addChoice("Fine whatever, let's just fuck.", violetMeteoriteExplore.bind("kemp79"));
		}

		if (which == "kemp39") {
			append("\"I said no! I don't wanna talk about Som! We keep our relationship to ourselves, alright?\"");
			addChoice("Not even if I promise with all my heart to keep it a secret, then?", violetMeteoriteExplore.bind("kemp40"));
			addChoice("Fiiine. :< Let's fuck?", violetMeteoriteExplore.bind("kemp79"));
		}

		if (which == "kemp40") {
			append("He's trying to act pissed, but he can't hold back a smile, and his voice still quivers with pleasure from your vigorous nip-licks.\n\n\"Man, fuck you. That's the bare minimum I'd ask.\"");
			addChoice("So you won't tell me... even if I rim your ass as deeply and as noisily as I can while you exposit~?", violetMeteoriteExplore.bind("kemp41"), {kinks: ["Plot", "Raunch"]});
			addChoice("Alright jeez nevermind let's just fuck already!!", violetMeteoriteExplore.bind("kemp79"));
		}

		if (which == "kemp41") {
			append("He says nothing.\n\nHis eyes go wide, and his tail twitches.\n\n\"Yer merciless!\"");
			addChoice("We got a deal or what? :3", violetMeteoriteExplore.bind("kemp42"));
		}

		if (which == "kemp42") {
			append("...\n\nHe gets to his feet, unplugs his nipple from your lips, and brushes off some purple gravel that was stuck to his ass.\n\n\"... Fine, sure. I'll try and get it out without blubbering like a sensitive little faggot. But you share fuckall about this with Som, yeah? What happened between us was complex, and we each have our own take on it, and I don't want him to know my take, or else it'll just make things even worse than they already are between us. You writing this down, stoner?\"");
			addChoice("I understand.", violetMeteoriteExplore.bind("kemp43"));
		}

		if (which == "kemp43") {
			//append("The otter bartender asks you what you'd like.\n\nYou look at the chalk-drawn menu...\n\nCUM (FREE)\nPISS (FREE)\nFORTIFIED 100% PURE FREE RANGE BOVINE ASSCRACK SWEAT (1C)\nFLOATILLERY RESERVE CRAFT BEER (5C)\nEVERCLEAR (1C)\nBLEACH (1C)\n\nAnd in cursive: Girly drinks~\nSPASTIC ACID CORKSCREW (1C)\nTHE FAGGOT BLASTER (2C)\nRAPE ON THE BEACH (1C)\nBLACK AND BLUE RASPBERRY DAQUIRI (3C)\n\n");
			append("The sweetgrass coursing through his veins makes him languid and confident. He moves fluidly, like he's drunk, as he hauls his flabby ass up into the flatbed of his truck. Up front, the hood has stopped leaking smoke.\n\nHe pulls you up the side and into the flatbed with a helping paw~\n\nSeems like he just got done with some serious renovations before he crashed: the back is decked out with cushions and blankets and even a body pillow featuring your sexy gray player model (when did these go into production?!). He's also got two fat coolers fully, and you mean <!b>fully<!b> stocked: Floatillery craft beers and glowberry wine, bottled cum and piss, caution-yellow flasks of bleach and Everclear, decorative bottled Faggot Blasters, and even a tiny sample of fortified 100% pure free range bovine asscrack sweat.\n\nThe asscrack sweat has a cute, flowery note attached to it: <!i>From Rox. Chug hard. Mostly collected after rape sessions with Bert. Yes, I have a dick. Hard to see past the apron, huh? You're cute. Alcohol < Sweetgrass. Come help me switch dependencies. Sorry about what happened to the swamp. I heard it was rough on you. Come over sometime, and let mama Rox work all that stress outta your ass. <3<!i>\n\nKemp points to one of the cushiest piles of blankets. \"Lay down. Mouth open. Then I'll spill all the beans I can handle spilling. And just so you know, I don't even like rimjobs that much... I only agreed to this cause it means you'll have to keep your mouth full and ya won't be able to give me any pity talk.\"");
			addChoice("Assume the position of his toilet seat. :3", violetMeteoriteExplore.bind("kemp44"));
		}

		if (which == "kemp44") {
			append("You slide your shoulder blades snugly among the blankets. They're a little chilly, but flowery-smelling... freshly washed and completely unused, you think.\n\nHis giant chubby otter ass obscures the stars above you. He spreads his legs and stands over your face. His nuts hang and sway in the moonlight, shiny with sweat, and he looks down at you over his shoulder. \"Look at all this shit,\" he says, gesturing at the built-in coolers and cushions. \"Hours of work gone to shit because I can't get over my issues and drive like a normal person to come see ya when I hear you're up here...\"\n\nKemp squats down. His sack plops "+(data.hasBoobs?"between your boobs":"onto your chest")+". His gloriously deep crevice hovers inches above your nose, and you can... you can already smell it...\n\n\"Ah well... we'll rip this shit out and put it in my new truck, if I can ever hold a job long enough to afford one. I figured I might do something like that deer hippy in the city. You ever meet her? She basically sells bullshit quips for a living. And she <!i>lives,<!i> too. Fuck, I could do that. I could do that better than her. I'd get my guests a comfy chair, set up a bigass sign... <!i>Kemp's Stonerisms: convert your useless caps into goofy, quotable, and equally useless one-liners...!<!i>\"\n\nHe reaches back and peels his left cheek open, revealing a perfectly puffy little otter pucker that drips with liquid assmusk. A single drop of it falls into your open mouth, onto the back of your tongue, and the salty taste slides down your throat.\n\n\"Anyway... gettin on with my personal shit... so what happened was... once upon a time, ya see...\"\n\nHe's stalling.");
			addChoice("Next x3.", violetMeteoriteExplore.bind("kemp45"));
		}

		if (which == "kemp45") {
			append("You skip a lot of rambling and warming-up and false starts.\n\nAbout when you check back in, he slams his ass down onto your face, muffling every one of your senses but tactile (you feel his sweaty, warm cheeks sliding over your nose and lips) and auditory (you hear him start his story, after a calming rush of breath.)\n\n\"<!i>When...<!i> that was a false start, there. Gotta pay attention and read all those real close fer suuure. Alright. Here we go. For real...\"\n\n... Annnnnd... alright, he follows through this time:\n\n\"Som and I, our relationship started when the game first booted up,\" he says. \"But that's not really when it 'turned on,' you know, when the meteorite landed. There was a time before that: init. That's our earliest memories. What Wendy did was, she set up our basic selves, our default personalities and hopes and fears, then she set a couple arbitrary groupings to make families— two horse sisters named Lilac and Lily, an interspecies brother and sister named Marei and Septrica, a hyena family in the sewers, a huge fuckmess of bunnies in the forest: grandma, older sis, two girlcubs, two b-boys...\"\n\nKemp starts to rock back and forth compulsively on your face. He isn't putting in much downward pressure, just enough to kiss your lips with his taint and pap his nuts against your chin. Like a good seat, you start to lick at that juicy otter grundle. You coax off tonguefuls of hot, coagulated assgrease, working each patch of fur til it's shiny-clean.\n\n\"So... uh... alright, not starting over, not starting over... so we had single people, and we had 'defined' families, and we spawned in like that. That's when we started the init. We all just woke up here. There was hardly anything then— no buildings, no trees, no meteorite, just empty rolling hills, and daylight, and each other. Mynt spoke to us from the sky and she was all bubbly and cute like usual, stoked on all of us, and the atmosphere was so open and pure— no one even shook hands or exchanged names right away, although we had it built into the back of our minds that you were supposed to do that when you met someone new, no, for that first week, all we did was touch each other, smell each other, experiment sexually. We laughed and played and wrestled, we pestered Mynt with whats and wheres and whys. In that little eden before the real game started, that was where I met Som, and when we... when he...\"");
			addChoice("Next.", violetMeteoriteExplore.bind("kemp46"));
		}

		if (which == "kemp46") {
			append("Suddenly, he grabs the back of your head and yanks your face as deep as it can possibly go between his buttcheeks. You squeak against his hole as it twitches on your nose. You have no choice but to directly inhale the scent of his ass, and it sears your nostrils deeply.\n\n\"Suck,\" he commands. \"Distract me.\"");
			addChoice("Suck his ass.", violetMeteoriteExplore.bind("kemp47"));
		}

		if (which == "kemp47") {
			append("You wrap your lips around his hole, vaccuum-tight, and start to slurp. Both his cheeks clench down on either side of your face and hold you firmly in place. \"Harder,\" he grunts. He yanks furiously at his cock, nuts slapping against your spit-soaked chin.\n\nHe tries to start again and his voice dies: \"<!i>The...<!i> see, well... um...\"\n\nYou suck as hard as you can. Your tongue pushes up and through his ring, and your obscene, gurgly slurps echo off the surrounding crags of the meteorite. For stability, you clutch his buttcheeks, and for pleasure, you pull them down and bury your tongue even deeper inside him.\n\nKemp takes a breath. He works through a joyless orgasm that splatters hot cum all over your "+pickByGenitals("bare cock and nuts", "bare cunt", "bare cock and nuts, and some of it dribbles down the crevice of your cunt, too")+".\n\nThen, riding the courage of his throbbing cock, he finally chokes it out:\n\n\"Som abused me.\"");
			addChoice("But... don't you guys do that for fu—", violetMeteoriteExplore.bind("kemp48a"));
		}

		if (which == "kemp48a") {
			append("That's muffled in his ass, thankfully. You're not sure he would have been able to force himself to pick the momentum back up afterward.\n\n\"<!i>Prompt...<!i> I mean... not sexually. Not in a cute cub-dom way. Gaslighting. Psychological torture. Abuse, real abuse, fuck, how do I even— the kind that convinces you it's not actually abuse— I don't know— look, I can't spell this shit out, you understand that, right? I'm just going to leave it there. Imagine the worst and you'll be close. All I'm gonna say is that... that was when he made me adopt him. He made his happiness my responsibility.\"");
			addChoice("Ah.", violetMeteoriteExplore.bind("kemp48"));
		}

		if (which == "kemp48") {
			append("\"Then it ended.\"\n\nThe night air flows down his wet asscrack and sends a chill up his spinal column.\n\n\"One day, Mynt congratulated all of us. She said our init was finished and as far as she could tell we'd all adjusted well. We knew each other, we knew our kinks, we knew our place in reality. The memories and the friendships we'd made were baked into us as a default. The game was ready to start. It was the same system she used for Mynt: first, you gotta give your A.I. a childhood, some ground to stand on, y'know, a good first date with existence. From there you can restart them as many times as you like and they'll never quite go back to square zero. They'll always have those early memories, and the bearings they got with em.\n\nSo init ended and Paraphore started. I woke up in the swamp, and... for the first time, literally, in my life, Som wasn't with me. I looked in the trees and underwater and everywhere, in the time I had before impact, and he was gone. I was alone, standing halfway submerged in the muck, and it felt cool and good on my private parts— he made me call them that— and I remember thinking... I remember breaking down right there, crying, wailing like a faggot, thinking about how badly I was going to be punished for every minute I spent separated from him.\"");
			addChoice("Next...", violetMeteoriteExplore.bind("kemp48b"));
		}

		if (which == "kemp48b") {
			append("\"<!i>Appears...<!i> well, the meteorite came down onto the swamp and it crushed me to death, and I respawned in a cave hyperventilating and I— and all I had was my childhood, you have to understand, at that point, all I had was the walls and the darkness and what he had done to me and what he was going to do to me when they finally got me out of the caves.\"\n\nKemp reaches down and yanks both cheeks apart, wide, so wide his hole pooches out between your lips, and furiously grinds his ass back and forth over your gagging mouth like it's a quarter, your face is a scratch-off lotto card, and he's saddled with more debt than he can endure psychologically.\n\n\"He was part of me,\" he whimpers. \"He was part of me.\"");
			addChoice("Why can't anyone's backstory ever just be happy and good.", violetMeteoriteExplore.bind("kemp49"));
		}

		if (which == "kemp49") {
			append("Also muffled.\n\nBut he hears you talking in a complain-ish tone and assumes the worst. \"<!i>Choose...<!i>\" he mutters, and the rest of the sentence dies in his throat. He peels his buttcheeks off of your face. You pull in a gasp of fresh, high-altitude air, just involuntarily, and he clearly takes that as a gasp of relief.\n\n\"I'll stop.\"");
			addChoice("No. It's okay. Sit down. Keep going. Please.", violetMeteoriteExplore.bind("kemp50"));
			addChoice("Wind down.", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kemp50") {
			append("He's hunched over, face hidden, paws glued his buttcheeks. Droplets of your own still-warm saliva <!i>pit... pat... pit...<!i> onto your chest.\n\n\"I'll stop. I want to stop.\"");
			addChoice("Nononono, please. Use me. Do whatever you want to me as long as it'll help you vent.", violetMeteoriteExplore.bind("kemp51"));
			addChoice("Wind down.", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kemp51") {
			append("He says nothing.\n\nThen he turns to you, and, still, his face is hidden in the moonlight's ashen underside. You can't see them, but you think his eyes are staring into yours. \"I don't want to use you to vent. I don't want to vent at all. I'm fine keeping this inside. It's better this way. Let's just smoke a little more and forget all this sappy gay shit, alright?\"");
			addChoice("That's called repression, Kemp.", violetMeteoriteExplore.bind("kemp52"));
			addChoice("Alright. Wind down.", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kemp52") {
			append("\"<!i>Yes—<!i> what are you, a fuckin therapist now? Take that shit to the Apo and leave me out of it.\"");
			addChoice("I'm your friend. Now sit that cute otter ass back down and finish your story.", violetMeteoriteExplore.bind("kemp53"));
			addChoice("Well, I mean, I... alright just wind down.", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kemp53") {
			append("...");
			addChoice("Please.", violetMeteoriteExplore.bind("kemp54"));
		}

		if (which == "kemp54") {
			append("......");
			addChoice("Please?", violetMeteoriteExplore.bind("kemp55"));
		}

		if (which == "kemp55") {
			append("He sits down, but not on your face; on your stomach, facing you. Now the moonlight illuminates his screwed-up, tear-streaked face. It's getting worse. He pulls his beanie down to hide it and shudders with a sob:\n\n\"He used to... he used to... he made me... he made me...\"");
			addChoice("Kemp, you don't have to tell me any of the specifcs. Just tell me how you got out of the caves and away from Som, how you got to where you are now. I need a happy ending here.", violetMeteoriteExplore.bind("kemp56"));
		}

		if (which == "kemp56") {
			append("It's getting much worse.\n\nHe folds over like a wet leaf and clings to your chest. He's shivering and sobbing so hard it feels like a seizure.\n\n\"E-Even after d-decade— h-he— still he— mining— he searched— he mined out— caves—\"\n\nHis voice splinters under the strain of old panic.\n\n\"HE F-FOUND— ME— HE F-FOUND— ME—\"");
			addChoice("It's okay. Keep going.", violetMeteoriteExplore.bind("kemp57"));
		}

		if (which == "kemp57") {
			append("\"I tried— I r-ran— deeper in— kill— myself— t-tried t-to respawn— different cave— g-get out, tried to get out— of p-pun— I was— almo—almost d-dead but— sorry— sorry, I keep— stut-t-t—\"\n\nHis claws dig into your arms. He has to scream, but he keeps it restrained, so it comes out as a low wail.");
			addChoice("I'm here.", violetMeteoriteExplore.bind("kemp58"));
		}

		if (which == "kemp58") {
			append("\"H-HE HUGGED...! H-HE HUGGED... ME...!\"");
			addChoice("Keep... keep going.", violetMeteoriteExplore.bind("kemp59"));
		}

		if (which == "kemp59") {
			append("\"H-He— s-sorry— he was— sorry—\"");
			addChoice("Keep going.", violetMeteoriteExplore.bind("kemp60"));
		}

		if (which == "kemp60") {
			append("He can't.");
			addChoice("Stay with him. Next x5.", violetMeteoriteExplore.bind("kemp61"));
		}

		if (which == "kemp61") {
			append("You hold him and let him hold you. Your arms are bleeding on the blankets.");
			addChoice("Next x5, or I don't know. Next x[However long it takes for him to be okay again.]", violetMeteoriteExplore.bind("kemp62"));
		}

		if (which == "kemp62") {
			append("He stopped crying and he is coherent, but he hasn't let go of your arms. Is that good enough?");
			addChoice("Sure.", violetMeteoriteExplore.bind("kemp63"));
		}

		if (which == "kemp63") {
			append("He's here.");
			addChoice("Kemp?", violetMeteoriteExplore.bind("kemp64"));
		}

		if (which == "kemp64") {
			append("He nods against your chest.");
			addChoice("Hey.", violetMeteoriteExplore.bind("kemp65"));
		}

		if (which == "kemp65") {
			append("\"Hi,\" he croaks. He chokes out a laugh despite himself. His voice was already rough from the six hours of CPR and an entire joint before this. Now it's barely even audible anymore.\n\n\"Why,\" he croaks again. \"Why'd you. Make me do that.\"");
			addChoice("Well, do you feel better?", violetMeteoriteExplore.bind("kemp66"));
		}

		if (which == "kemp66") {
			append("\"I don't. I don't know. Well I. Well. Yes,\" he admits. The taut muscles in his paws quiver and attempt to un-freeze. They can't.");
			addChoice("Well, there's your answer.", violetMeteoriteExplore.bind("kemp67"));
		}

		if (which == "kemp67") {
			append("His eyes jerk around in a circuit between three fixed points: the moon, the back of his skull, and the spot where the claws on his left paw have torn open your arm and lodged themselves inside.\n\n\"But. I hurt you.\"");
			addChoice("I'm sitting here reading with perfectly intact arms. At best you've mildly disturbed me, and not even really that.", violetMeteoriteExplore.bind("kemp68"));
		}

		if (which == "kemp68") {
			append("\"Right,\" he croaks. \"I keep. Forgetting that. You're up there. And I'm. In here.\"\n\nTime passes.\n\n\"You can skip. I mean. Please skip. I'll get myself fixed. Up. And get your arms fixed. Up. Okay.\"");
			addChoice("Okay.", violetMeteoriteExplore.bind("kemp69"));
		}

		if (which == "kemp69") {
			append("Over the course of an hour, Kemp pulls his fingers free and opens them, and closes them, and opens them again, until they can move freely enough to spark a bowl. He smears your blood all over his bong and doesn't care. After getting almost too high to move and waiting ten minutes for the rush to ease off, he digs a little first-aid kit labelled <!i>Ivandis<!i> out from one of the coolers, and a flask of Everclear from another.\n\nHe washes out your wounds with the Everclear and wraps them up in cute pink gauze that says <!i>I'M A PAINSLUT <3<!i> on the sides. He apologizes under his breath because he doesn't have any other gauze on him, and he can't just kill you so you respawn with a new body because, as he finally explains: dying on the meteorite means you might respawn in a closed cave system underground, like he did.\n\nHe cleans the blood off his hands with half-melted ice from the cooler. He folds the dirty blankets and tosses them off the side of the meteorite. He climbs back in the flatbed and wipes the assgrease off your face and says:\n\n\"Thank you.\"");
			addChoice("Hey no prob man. This is what friends are for.", violetMeteoriteExplore.bind("kemp70"));
		}

		if (which == "kemp70") {
			append("He lights a joint and pulls on it, nice and slow and theapeutic.\n\n\"What a fuck.\"");
			addChoice("Yeah that was a bit of a fuck.", violetMeteoriteExplore.bind("kemp71"));
		}

		if (which == "kemp71") {
			append("\"Yeah.\"\n\nHe offers you a puff.");
			addChoice("Suck the whole thing down.", violetMeteoriteExplore.bind("kemp72yes"));
			addChoice("I'm good.", violetMeteoriteExplore.bind("kemp72no"));
		}

		if (which == "kemp72yes") {
			highEffect();
			append("You finish his joint off. He doesn't complain, he just pulls another one out from under his beanie and joins you.");
			addChoice("Next.", violetMeteoriteExplore.bind("kemp73"));
		}

		if (which == "kemp72no") {
			append("He nods and motions to take another toke, but his lips never get there.\n\nInstead, he throws the rest of it away.\n\n\"I'm good too.\"");
			addChoice("Next. c:", violetMeteoriteExplore.bind("kemp73"));
		}

		if (which == "kemp73") {
			append("\"I guess you... I guess <!i>ya<!i> still have questions, huh.\"");
			addChoice("I do, but maybe we should just move on.", violetMeteoriteExplore.bind("kemp74"));
		}

		if (which == "kemp74") {
			append("\"Ask one. I can handle one.\"");
			addChoice("Alright.", violetMeteoriteExplore.bind("kemp75"));
		}

		if (which == "kemp75") {
			makeSmallButtons();
			append("...");
			addChoice("You said Som rescued you and apologized for the abuse. Why would he suddenly do that?", violetMeteoriteExplore.bind("kemp76why"));
			addChoice("You said when init finished up, Mynt thought everyone adjusted well. What about you?", violetMeteoriteExplore.bind("kemp76what"));
			addChoice("You said you can't spell this out, but... how exactly did Som torture you?", violetMeteoriteExplore.bind("kemp76how"));
			addChoice("What happened next?", violetMeteoriteExplore.bind("kemp76next"));
		}

		if (which == "kemp76why") {
			append("\"I don't know. He tried to explain it but I didn't get it. Lana tried to explain it and I didn't get it. Something about a patch. I don't know.\"");
			addChoice("Alright.", violetMeteoriteExplore.bind("kemp77"));
		}

		if (which == "kemp76what") {
			append("\"She can't read minds. I told her I was okay because he made me. That was it.\"");
			addChoice("Ah. Alright.", violetMeteoriteExplore.bind("kemp77"));
		}

		if (which == "kemp76how") {
			append("...");
			addChoice("It's okay if you don't want to tell me.", violetMeteoriteExplore.bind("kemp76how2"));
		}

		if (which == "kemp76how2") {
			append("\"We were both guys. And he's a cub. And I... he made me feel like...\"");
			addChoice("Did he... well, were you... were you attracted to him?", violetMeteoriteExplore.bind("kemp76how3"));
		}

		if (which == "kemp76how3") {
			append("His eyes lower.\n\n\"I wished I wasn't, but I was— and he was the first person I ever talked to— I didn't know if it was okay to like boys or not, I didn't know what other boys were like— and I said h-hey, l-little lamb, I, I feel this way a-about you, and he told me— he said when— when you— when you— when you feel that way— feel that way about a cub that means you're—\"\n\nHe's shaking again.");
			addChoice("Stop, stop. That's enough. I understand.", violetMeteoriteExplore.bind("kemp76how4"));
		}

		if (which == "kemp76how4") {
			append("He purses his lips and exhales the stress with a slow, silent whistle. His cheeks puff out all fat. He closes his eyes and focuses on nothing until the muscle tension dissipates.\n\n\"It's okay. I'm okay. I know better now. It's like that for you, up there, but it's not like that for me. I can love whoever I want to as long as they love me back and that's okay.\"");
			addChoice("That's right.", violetMeteoriteExplore.bind("kemp77"));
		}

		if (which == "kemp76next") {
			append("He can't help but smile.\n\n\"Aha. Hahah. Next?? Fuck, man, next... next was three years of Apothecary therapy, which did jack shit, but I guess it gave me some time to cool down and get used to bigger and bigger spaces, and get used to eating and drinking again... and they gave me a script and a plan for free sweetgrass, that sure fuckin helped.\n\nAnd then we tried to make it work. I thought it was the right thing to do. For the first year, I was convinced he wasn't really sorry. I thought he was just tricking me into letting my guard down again. But it turned out okay, you know, we tried to start our own farm, our own hippy cavern commune— to— well, you know, to get me over my cave issues, which didn't work. He cared so much he even tried to get me off the grass three times! Heh. I almost made it a week, the third time. Those days were alright.\"");
			addChoice("Where do you live now?", violetMeteoriteExplore.bind("kemp76next2"));
		}

		if (which == "kemp76next2") {
			append("\"Well, nowhere, cause... the farm was too much responsibility, and I hate caves, and... well... really, I just don't ever want him to know where I live.\"");
			addChoice("Ah... so you still can't...", violetMeteoriteExplore.bind("kemp76next3"));
		}

		if (which == "kemp76next3") {
			append("His smile goes rotten.\n\n\"Ya. Well. He can apologize til the cows come home and assfuck him, he can work two phone lines to buy me farms or therapy or lifetime scripts for sweetgrass, but no. I can't forgive him.\"");
			addChoice("I see.", violetMeteoriteExplore.bind("kemp77"));
		}

		if (which == "kemp77") {
			append("You cuddle together in the flatbed of his truck for a while.\n\nA draft whips up from beneath the forest canopy and carries any further conversation into the sky with it. You nuzzle into Kemp for warmth, and he wraps some clean blankets around you. Between the sheets, you feel his cock pulsing against your thigh. Above the sheets, you feel his half-lidded eyes intently focused on you.\n\n\""+StoryUtils.cipherize("Alright, here we go... if you can read this, type... fuck I don't know, type... 'listen closer.'")+"\"\n\nYou're not sure what he actually just said? The wind made it sound like gibberish...");
			addTextChoice(function(str) {
				if (str.toUpperCase() == "LISTEN CLOSER" || str.toUpperCase() == "LISTEN CLOSER.")
					violetMeteoriteExplore("kempCipher1")
				else
					playSound("assets/audio/ui/nope");
			});
			addChoice("What are you talking about?", violetMeteoriteExplore.bind("kemp78"));
		}

		if (which == "kempCipher1") {
			append("You listen closer, but it's still just windy nonsense?\n\n\""+StoryUtils.cipherize("Fuck yeah. Alright. As if I actually forgot why I came up here hunting for ya. My memory's shitty, but she's not THAT shitty. I have a message for you.\n\nEach false start during my story was a word of the message. Some of em were italicized. Smart eh?? Even if Mynt cracks this cipher, only you can read that journal, so, with any luck... my message will get through safely on your second go round.\n\nGood luck and pray good. Wait. What's the fuckin catchphrase...? Right... pray for a cuter future, haha. What a fuckin gay catchphrase.")+"\"\n\nWow you really have no idea at this point. He might be stroking out or something.");
			addChoice("Oh, yeah, I don't know... let the wind die down.", violetMeteoriteExplore.bind("kemp78"));
		}

		if (which == "kemp78") {
			append("You wait until the wind dies down and ask him what he was talking about.\n\n\"Nothing,\" he says, face in his pillow. He humps your leg absent-mindedly, and he can barely keep his eyes open.");
			if (data.hasCunt)
				addChoice("You going to sleep?", violetMeteoriteExplore.bind("kempEnd"))
				else
			addChoice("Shall we finish this scene off with a bang~?", violetMeteoriteExplore.bind("kemp79"));
		}

		if (which == "kemp79") {
			append("His eyes pop back open, full of energy.\n\n\"Sure,\" he purrs, and pulls you deep into the sea of blankets in his truck's flatbed, til you're basically in a warm cocoon with him. The moonlight filters through multicolored fabric and makes his happy, tear-stained face glow rainbow. \"You mind topping?\"");
			addChoice("Not one bit.", violetMeteoriteExplore.bind("kempTop"));
			addChoice("Ah, nevermind. I'm a sub.", violetMeteoriteExplore.bind("kempSorry"));
		}

		if (which == "kempSorry") {
			append("\"Sorry I can't fuck your ass,\" he says, still lazily grinding on you. \"I'm past exhausted.\"");
			addChoice("It's all good. :3", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kempTop") {
			append("He rolls away from you, onto his belly, and sticks his jiggly otter ass up in the air. He reaches back and tugs his tail out of the way, too, so you can see right down his shiny-slick buttcrack. A whiff of musk circulates around the blanket cocoon.\n\nYou wiggle your way through the soft cotton, until your hips line up with his. You drag your cockhead over the smooth underside of his tail and mark it with your pre in the process. Then you peel his asscheeks open with a thumb from each hand and behold the crowded, sweaty curves of his taint, his pushed-back nutsack, his upside-down ottercock, and, most importantly, the squishy, winking little nugget of a pucker that you so desperately want to fuck open.");
			addChoice("Spit on that hole and grind my dick over it.", violetMeteoriteExplore.bind("kempTop2"));
		}

		if (which == "kempTop2") {
			data.kempPiss = false;
			data.kempPedo = false;
			append("You keep your hands on either cheek. The crevice between them is just wide enough to fit the girth of your cock. Kemp pulls his tail around, closer to his chest, and clutches it for comfort. He must think you're going in dry.\n\nCertainly not. You hock a phat wad of spit from the back of your throat and <!i>ptoo<!i> it onto his butthole.\n\nHe flinches with pleasant surprise. \"Ah, fuck...\" he mumbles huskily. \"Yer slobber feels... feels good... you gonna rub i—\"\n\nYou force him to interrupt himself with a moan as you start viciously hotdogging his ass, ramming your cock up and down over his ring, schlickening it up with hot saliva and tugging it halfway open every time you thrust particularly hard.");
			addChoice("Ya feel how hard I am, broski? <3", violetMeteoriteExplore.bind("kempDudeTalk"));
			addChoice("What do you want me to do to you?", violetMeteoriteExplore.bind("kempTop2a"));
		}

		if (which == "kempDudeTalk") {
			append("It takes every ounce of energy he has left in his tuckered otter bod for him to stop laughing and reply.\n\n\"Oh fuck yeah I do bud,\" he says, \"yer wang is fuckin throbbing on my hole... can't wait to take that shit to the base up my dudehole...\"");
			addChoice("Ya bro? You sure you can take all of it?", violetMeteoriteExplore.bind("kempDudeTalk2"));
			addChoice("What else do you want me to do to you?", violetMeteoriteExplore.bind("kempTop2a"));
		}

		if (which == "kempDudeTalk2") {
			append("His laughter turns into nervous, self-conscious giggling, and he looks back at you with bedroom eyes and an unsure smile, gyrating his ass in rhythm with your grinding. \"Ah... I want it bad... so bad... man... I...\"\n\nHe swallows.\n\n\"I want it so bad that... even if I can't take all of it, I want ya to rape that whole brocock up into me anywhey.\"");
			addChoice("Awwww!!! <3 Why'd it take you so long to tell me you were such a fuckin rapefag, brotendo!?", violetMeteoriteExplore.bind("kempDudeTalk3"));
			addChoice("Alright this is getting ridiculous. What else do you want me to do to you?", violetMeteoriteExplore.bind("kempTop2a"));
		}

		if (which == "kempDudeTalk3") {
			append("\"Oh fuck—\"\n\nKemp has to stifle a laugh attack in his pillow. When he's ready, he pinches off the few chuckles and turns back to face you once again. There's no self-consciousness in his expression anymore, just a barely restrained grin and the hint of real admiration for your prowess with goofy dirty talk a-twinkling in his eyes. He tries being serious for a second: \"Okay... okay stop or I'm gonna piss myself.\"");
			addChoice("But what if I want you to piss yourself?", violetMeteoriteExplore.bind("kempDudeTalk4"), {kinks: ["Piss"]});
			addChoice("Fine. :3 What do you want me to do to you?", violetMeteoriteExplore.bind("kempTop2a"));
		}

		if (which == "kempDudeTalk4") {
			append("\"... Then keep calling me ridiculous degrading things.\"");
			addChoice("Okay dudeslut. :3", violetMeteoriteExplore.bind("kempDudeTalk5"));
		}

		if (which == "kempDudeTalk5") {
			append("He only titters at that one.\n\n\"Alright, nevermind, the moment is over.\"");
			addChoice("Dangit. I guess I'll just have to fuck you so hard you piss yourself.", violetMeteoriteExplore.bind("kempDudeTalk6"));
		}

		if (which == "kempDudeTalk6") {
			data.kempPiss = true;
			append("Kemp smirks and clenches his cheeks hard on your cock to increase the friction of your hotdogging.\n\n\"Guess so~\"");
			addChoice("What should I do to you besides that, though?", violetMeteoriteExplore.bind("kempTop2a"));
		}

		if (which == "kempTop2a") {
			append("\"Ah... well. There is one thing that really gets me going, but uh... it's a little weird.\"");
			addChoice("Go on, I'll just say no if I'm not comfortable with it.", violetMeteoriteExplore.bind("kempTop2a2"));
		}

		if (which == "kempTop2a2") {
			append("\"Well... it's two things. And they're kind of a pretendy roleplay thing, if that's not too gay for you.\"");
			addChoice("List em.", violetMeteoriteExplore.bind("kempTop2b"));
		}

		if (which == "kempTop2b") {
			append("He fiddles with the end of his tail.\n\n\"First... and this is only if you want to... could you pretend you're a cub? And— if you're comfortable being a little mean and rough— could you... shame me for... for liking you?\"");
			addChoice("Oh. Yeah. Nah. I'd just prefer vanilla anal.", function() {
				data.kempPedo = false;
				violetMeteoriteExplore("kempTop3");
			});
			addChoice("What, you want me to call you a pedo? <3", function() {
				data.kempPedo = true;
				violetMeteoriteExplore("kempTop3Pedo");
			}, {kinks: ["Abuse"]});
		}

		if (which == "kempTop3Pedo") {
			append("For the first time since you found him crashed here, he blushes. His cheeks fill up from the bottom like pitchers of cherry kool-aid.\n\n\"Yaaaaaaa that'd be nice,\" he mumbles. \"If it's not too weird for you.\"");
			addChoice("Get started.", violetMeteoriteExplore.bind("kempTop4"));
		}

		if (which == "kempTop3") {
			append("\"Ah— yah— nah— that's alright. No prob.\"\n\nKemp hides his face in a pillow and sticks his ass out a bit further. \"Just go on and take me.\"");
			addChoice("Get started.", violetMeteoriteExplore.bind("kempTop4"));
		}

		if (which == "kempTop4") {
			append("You line up, tongue out with concentration, and slowly slide your cocktip into that tight otter ass. His slimy pucker relaxes to let it in at first, then, once you've reached the point of thickest circumfrence, he tenses up and constricts his asshole instantly on your dick. You can feel the every contour of his hole hug you as you force in inch after inch. Kemp never stops moaning throughout all of it.\n\n\""+(data.kempPedo?"I'm... so fucked up":"Hold... my hips")+"...\" he gasps, and you can feel the ellipses as palpable tension around your head. \""+(data.kempPedo?"For loving... your cubcock..":"Make me feel like a girl, bro")+".\"\n\nYou don't have a choice: the paw that isn't holding onto his tail snakes back and grabs your hands, one after the other, dragging them down to rest at the top of his curvy otterbutt. You play along for the fuck of it and squeeze on his love handles as you feed a few more inches of cock up his gently twitching "+(data.kempPedo?"pedopucker":"boypucci")+".");
			addChoice((data.kempPedo?"You like getting assraped by little "+pickByGender("boys", "girls", "cubs")+", huh? <3":"Who's a good girl? <3"), violetMeteoriteExplore.bind("kempTop5"));
		}

		if (which == "kempTop5") {
			append("\"Ooooh, fuck~!\" he squeaks, and both syllables throb through his cock. \""+(data.kempPedo?"I do...":"I am...")+"\"\n\nYou take that as the go-ahead to start humping faster. With your hip-grip steady, you start pulling his chubby otter ass back up along your cockmeat with each thrust. He's sticking that cute ass out so far, you just can't help but give him the ass-slap he's so clearly begging for.\n\nHe's starting to get really steamed up now that you're swiftly punching half your cock in and out of him twice a second. The hand that isn't smacking his jiggly ass wanders over to the other cheek of its own accord and gropes it like a stress ball. You slide your thumb down its inner slope, prod the tip deep into his cunt (beside your still-humping shaft) and yank it open to the side so you can throw your hips forward and pack him full of all but one last inch of throbbing dickmeat with minimal resistance.\n\n"+(data.kempPedo?"\"Fuck— harder— rape me—\"\n\n":"")+"He can hardly take it. The prostate overstimulation seems to border on a kind of itchiness of the soul that makes him moan and wiggle with helpless neediness. He's almost gnawing on the end of his tail, and his nuts twitch in their sack, coated shiny with pre and sweat.\n\nHe reaches back to run his paw over the cheek you just slapped. His pawpads leave faint white lines where they dig into his the raw, red assmeat.");
			addChoice((data.kempPedo?"Feel like a disgusting kiddyfucker yet~?":"Feel like a girl yet?"), violetMeteoriteExplore.bind("kempTopRougher"));
			addChoice((data.kempPiss?"Hmmm. I'm raping you so hard, but you haven't pissed yourself yet. Maybe you need some warmth...":data.kempPedo?"Hmmmm... mind helping me with my potty training, mister? (Pee inside him.)":"Ah, s'cuse me girl, just gotta use your cunt as a urinal for a sec..."), violetMeteoriteExplore.bind("kempTopPiss"), {kinks: ["Piss"]});
		}

		if (which == "kempTopRougher") {
			append("\"N-No,\" he admits. \"You'll need to be a lil rougher for that...\"");
			addChoice("Shove his face down into the blankets and rail him.", violetMeteoriteExplore.bind("kempTop7"));
		}

		if (which == "kempTopPiss") {
			append("You know what this slut really needs up his ass, and it's much more degrading than a cock. You hold him against your crotch by his fat, girly hips, so he can't get away, and release a torrent of hot piss inside him.\n\n\""+(data.kempPiss?"Ohfuckohfuck,\" he stammers, and his own hot pisstrickle bursts out between his thighs and soaks the blankets deeply. \"I lost it... fuck... so warm...":data.kempPedo?"You're amazing,\" he says, his voice low and reverent. It's clear he never expected you to get this into it. \"I feel all that... cub pee, overflowing my ass... my ass is y-yer... yer fuckin potty...":"My u-urinal cunt... is fuckin overflowing, bro...")+"\"\n\nHis voice deteriorates into dumb subby babbling, then into a droning moan. You plant a palm on the back of his beanie and stifle the noise by forcing his face into one of the blankets.\n\n\"Pleash,\" he warbles, all muffled and cute. He sticks his urinal up higher, and as it swallows more of your cock, a spluttery splurt of piss gets forced out and dribbles over his bare taint. He shivers as the warmth trickles down his crevices, even riding the seam of his swaying nutsack. Steamy yellow droplets ride along the grooves on either side of his urethra bulge and come to a tenuous, wobbling stop in the dip of his cockslit.");
			addChoice("Please what?", violetMeteoriteExplore.bind("kempTop6"));
		}

		if (which == "kempTop6") {
			append("\"Pleash don't shtop... humping...!\"");
			addChoice("Shove his face down into the blankets and rail him.", violetMeteoriteExplore.bind("kempTop7"));
		}

		if (which == "kempTop7") {
			append("Kemp moans into the blankets as you fuck his ass raw, one hand on the back of his head and the other on his fucked-raw ass. You rail him so hard the truck starts to creak back and forth, and half-damaged shit falls off the front bumper. You pull all the way out, yank his head back by his beanie so he can catch a glimpse of the fevered lust in your eyes, then, with enough force to make the coolers flop open and a few pillows fly overboard, you slam in as deep as you can and—");
			addChoice("Cum.", violetMeteoriteExplore.bind("kempTop8"));
		}

		if (which == "kempTop8") {
			cumEffect();
			append("Kemp squeals pathetically"+(data.kempPiss?", squirms on your dick, and pisses himself harder than ever.\n\n\"EEeeEeeyyhhhhffffuuuuuckkkbrooooo~!!! <3\"":data.kempPedo?" and bites down on his tail hard enough to hurt. You half-expect him to babble some more goony stuff past a mouthful of ottertail, some stuff about how bad he wants your cubcum, or how he's such a disgusting piece of shit kiddyfucker and he deserves to be molested like this, but instead all he says is \"Fank you, man. Sherioushly.\"":", his voice high-pitched and warbling and girly: \"Oooohhhh fuuuck my cunny fuck my cunny fuuuuuck man I can feel your cum gushin all up in my fuckin dudewomb~!!! <3\"")+"\n\nYou wrap your arms around his chest, bite down on the back of his beanie, and rape a fat, gurgling load of "+(isActive("Mood Ring")?getMood("You"):"")+"jizz right up that "+(data.kempPedo?"despicable pedopucker":"girly little ottercunny.")+". His legs spread as wide as they can, knees slamming against either side of his flatbed's walls, and with clumsy, primal, ape-like passion he slams his hips down on your cock over and over and over in time with each spurt. Your nuts throb and bang against his own. On the tenth and most voluminous rope of cum, you ram all the way in and hold it there.\n\nThe truck slips a little on the gravel and gives you both a mini heart attack. Smoke starts pouring from the engine again.");
			for (s in ["Fwahhhh...", "Pwahhhh...", "Gwahhhh...", "Nyahhhh..."])
				addChoice(s, function() {
					violetMeteoriteExplore("kempTop9");
					append("\""+s+" is fuckin right...\" he murmurs, already half-asleep. Cum leaks down his once-quivering thighs, which are now totally relaxed and looking extra squishy. \"Haven't been topped like that since the last time I slept over at Cage's house and he kept me in his basement for like a fuckin week...\"");
				});
		}

		if (which == "kempTop9") {
			addChoice("You feelin sleepy?", violetMeteoriteExplore.bind("kempEnd"));
		}

		if (which == "kempEnd") {
			append("He rolls over onto his back, pulls you on top of him (otter bellies are so warm and comfy) and he kisses you hard on the mouth. Tastes like stale sweetgrass.\n\n\""+(data.kempPedo?"Honestly, thanks. For doing that. Even if ya only did it out of morbid curiousity, it's hard enough to just reclaim that shit in the first place, let alone finding someone to be my fuckin psyche masseuse... I feel so completely and totally... at peas...":data.kempPiss?"I don't mind sleeping in wet blankets if you don't...":"Mmmn, I'm gonna pass out...")+"\"\n\nHis lips part from yours. He slumps back onto the pillow.\n\nWithin seconds, he's snoring like a diesel bulldozer.");
			addChoice("Sleep.", violetMeteoriteExplore.bind("kempEnd2"));
		}

		if (which == "kempEnd2") {
			disablePause();
			append("ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz.......zzzzzzzzzz........zzzzzzzzzz....................zzzzzz............................................................................................................zzzz.....................z....................................\n\nWait.");

			cameraFadeOut(0x000000, 4, violetMeteoriteExplore.bind("kempEnd3"));
		}

		if (which == "kempEnd3") {
			playSound("assets/audio/environment/truckExplosion");
			timer(4, cameraFadeIn.bind(0x000000, 1));
			data.kempTruckExploded = true;
			append("You respawn?\n\nWait. You respawn!!\n\nThe truck exploded and killed you!!");
			addChoice("Oh no. Find Kemp.", violetMeteoriteExplore.bind("kempEnd4"));
		}

		if (which == "kempEnd4") {
			append("You climb over rocks and stub your toe and scrape your palms. The remains of the truck are scattered everywhere. You trip on a charred pair of fuzzy pink dice with pawprints for pips. Glass and warped black metal dig into your feet. What remains of your old bodies are wrapped in flaming blankets. The coolers spill boiling icewater.\n\nYou can't find him anywhere. He must have respawned and left??");
			addChoice("He wouldn't just fuck off like that. He'd look for me. What if he respawned underground??", violetMeteoriteExplore.bind("kempEnd5"));
		}

		if (which == "kempEnd5") {
			append("Um I don't know!! What if he did?!");
			addChoice("Well fuck sakes Mynt, where's the nearest cave entrance??", violetMeteoriteExplore.bind("kempEnd6"));
		}

		if (which == "kempEnd6") {
			append("How should I know!? I'm not—");
			addChoice("Wait. Follow his swerve marks from the crash.", violetMeteoriteExplore.bind("kempEnd7"));
		}

		if (which == "kempEnd7") {
			append("You run back to where his truck came from, okay, it took a sharp left turn drift here, this is the first swerve he took, okay wait no, this part isn't really a road— he drove <!i>off<!i> the road here— he was avoiding someth—\n\nOh...\n\nThe... the road he was on goes right into a cave. The first swerve he made was a swerve away from the cave entrance.");

			function onCollect(tile:Int):Bool {
				if (tile == Caves.KEMP_1 || tile == Caves.KEMP_2) {
					Caves.destroyCaves();
					stopChannel('cough');
					VioletMeteorite.violetMeteoriteExplore("kempEnd8");
				}

				if (tile == Caves.SPAWN) return false else return true;
			}

			function onDeath():Void {
				Caves.destroyCaves();
				VioletMeteorite.violetMeteoriteHub();
			}

			addChoice("Spelunk that shit right this instant.", function () {
				playSound("assets/audio/environment/caveDoor", "caveEnter");
				Caves.caveGame("Kemp Cavern.tmx", onCollect, onDeath);
				Main.msg("Entered Kemp Cavern");
				playSound('assets/audio/environment/kempCough', 'cough', {loops: 999});
				setChannelVolume("cough", 0.6);
				Caves.setTile(21, 14, Caves.KEMP_1);
				Caves.setTile(22, 14, Caves.KEMP_2);
				Caves.power = 99999;
			});
		}

		if (which == "kempEnd8") {
			enablePause();
			var s:MintSprite = addSprite("assets/img/effect/kempFetal.png");
				s.x = GAME_WIDTH/2-s.width/2;
				s.y = GAME_HEIGHT-s.height;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
			tween(s, {x: s.x+3}, 0.03, {ease: BOUNCE_OUT, type: PINGPONG});
			append("\"Oh hey... how are ya... I'm good... please carry me out...\"");
			addChoice("Oh you poor little fuck.", violetMeteoriteExplore.bind("kempEnd9"));
		}

		if (which == "kempEnd9") {
			append("\""+(data.kempTruckExplodePredicted?"Fuckin hate video games... cars always fuckin exploding for no reason...":"Weeeeeeeeee...")+"\"\n\nYou haul his fat otter ass back outside, into the moonlight.\n\nWithin seconds of breathing in the fresh wind, he's able to shake off the PTSD and pry himself out of the fetal position. He leans on you for support only once.\n\nThe truck's explosion blew a hole in the meteorite uphill. Cool water gushes from it, and runs over your toes.");
			addChoice((data.kempTruckExplodePredicted?"Man I told you that was going to happen.":"You alright man?"), violetMeteoriteExplore.bind("kempEnd10"));
		}

		if (which == "kempEnd10") {
			append("\""+(data.kempTruckExplodePredicted?"Ya... well... I'm very fuckin proud of ya":"Tip fuckin top")+",\" he mumbles. He still hasn't taken the four joints out of his mouth. They're all about halfway done.\n\nHe wiggles his toes in the running water... and prods them against the ruts of his tire tracks as they wash away.\n\n\"All my shit destroyed,\" he says, \"because I got scared of a fuckin cave.\"");
			addChoice("I didn't look too close at the wreckage. We could go salvage something, maybe? Was there anything especially important to you in your truck?", violetMeteoriteExplore.bind("kempEnd11"));
		}

		if (which == "kempEnd11") {
			append("\"Well, one thing, but it's guaranteed to be poked fulla ho—oooOOOOH MY GOD!\"\n\nDown the thickening stream floats something small, shiny, and purple. Something that looks weirdly arousing, the way the light plays off its curves.\n\nIt's Kemp's purple inner tube— coated with soot, but miraculously un-popped.\n\n\"Bert!\" he shouts, and goose-steps up the river to slam his ass right down into it. \"Buddy!! Yer alright!\"");
			addChoice("Oh, <!i>sniffle snoofle<!i>... maybe the world isn't such a cold place after all...!", violetMeteoriteExplore.bind("kempEnd12"));
		}

		if (which == "kempEnd12") {
			append("Kemp inhales sharply and grimaces as a gush of freezing cold water flows down to join the rest of the stream and glaciates his ass through the bottom of the tube.\n\n\"No,\" he says through his teeth. \"It definitely is...\"");
			addChoice("Yikes... step out of the stream.", violetMeteoriteExplore.bind("kempEnd13"));
		}

		if (which == "kempEnd13") {
			append("You hop out so your toes don't get frozen off. Several more gushes follow that first one, and soon the stream becomes a river. Uphill, the smoke from his truck turns from black, to navy, to a vibrant blue-pink. The flames musta got into his massive sweetgrass hoard.\n\nBy now he's down to one joint, stoned as fuck, and he's got enough momentum to ride this dope waterslide all the way down the meteorite.\n\nHe doesn't care. He probably has enough to last him stashed beneath his beanie, anywhey.");
			addChoice("You heading out?", violetMeteoriteExplore.bind("kempEnd14"));
		}

		if (which == "kempEnd14") {
			if (getItem("Kemp's Seed").amount <= 0) addToItem("Kemp's Seed", 1);
			addSprite("assets/img/effect/kemp.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");
			append("Kemp rips past you on the water, impenetrably content, and offers a flaccid \"Guesso.\"\n\n... But then he cranes his neck back and offers an incredibly erect shout:\n\n\"HEY THANKS! I FUCKIN LOVE YOU!\"");
			addChoice("LOVE YOU TOO!", violetMeteoriteHub);
			addChoice("Bye stoner!", violetMeteoriteHub);
			addChoice("Seeya!", violetMeteoriteHub);
			addChoice("Thank god that fuckin weirdo's gone. Can't stand him...", violetMeteoriteHub);
		}


		/*

		if (which == "kemp16") {
			append("He grabs his bong, a couple sex toys, his phone, and his fuzzy dice from the mirror, then starts heading down the gravel road at a frankly unflattering speed-jog that makes his chubby otter ass jiggle.\n\n\""+(data.kempTruckExplodePredicted?"You can say I-told-you-so after we get outta blast radius":"Extremely. C'mon")+".\"");
			addChoice("Follow.", violetMeteoriteExplore.bind("kemp17"));
		}

		if (which == "kemp17") {
			append("He picks a new spot and settles right back down, breathing heavily");
			addChoice((data.kempTruckExplodePredicted?"Oh, suddenly you <!i>are<!i> worried that it'll explode?":"You're worried it'll explode?"), violetMeteoriteExplore.bind("kemp16"));
		}



		data.kempTruckMoments = 6;
			data.kempTruckActions = [];
			append("Both his legs were destroyed in the blast. What's left of his truck's engine still pukes gasoline; it trickles through the gravel, creeping closer to where you both lay.\n\n\"Second wave,\" he says, and something crackle-croaks in his throat.\n\nHe clutches it. Nothing else comes out.\n\nYou have roughly six moments to figure out what to do before the rest of the gas catches fire and you both die and potentially respawn underground in a closed cave system with no way out besides a dice roll death which may respawn you even deeper instead of putting you back on the surface.\n\nIf you don't escape, you may not be able to play this game anymore.\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Oh shit. Test my legs!!!", violetMeteoriteExplore.bind("kemp12testlegs"));
			addChoice("Why is it possible to respawn underground?! This is bad game design?!", violetMeteoriteExplore.bind("kemp12respawn"));
		}

		if (which == "kemp12testlegs") {
			data.kempTruckMoments--;
			append("You check your legs. Both work.\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Examine escape routes.", violetMeteoriteExplore.bind("kemp12routes"));
			addChoice("Grab Kemp!", violetMeteoriteExplore.bind("kemp12grab"));
			addChoice("Move along.", violetMeteoriteExplore.bind("kemp12movealong"));
		}

		if (which == "kemp12routes") {
			data.kempTruckMoments --;
			append("Rock There is no clear way out.\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Grab Kemp!", violetMeteoriteExplore.bind("kemp12grab"));
		}

		if (which == "kemp12routes") {
			data.kempTruckMoments --;
			append("The gravel road bends around this tree. There are some rocks on the opposite side you could hide behind.\n\nBesides that, there's only a cliff.\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Head for the rocks.", violetMeteoriteExplore.bind("kemp12rocks"));
			addChoice("Head for the cliff.", violetMeteoriteExplore.bind("kemp12cliff"));
			addChoice("Grab Kemp!", violetMeteoriteExplore.bind("kemp12grab"));
		}

		if (which == "kemp12respawn") {
			data.kempTruckMoments--;
			append("There were no closed cave systems programmed into the island. They came with the meteorite. This shouldn't have even been a problem.\n\nPlease hurry.\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Alright test my legs!!!", violetMeteoriteExplore.bind("kemp12testlegs"));
		}

		if (which == "kemp12movealong") {
			data.kempTruckMoments--;
			append("But you might still have time to—\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Do it.", violetMeteoriteExplore.bind("kemp12movealong2"));
		}

		if (which == "kemp12movealong2") {
			data.kempTruckMoments--;
			append("But he—\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("Just go. I'm sorry. I need to keep playing this game.", violetMeteoriteExplore.bind("kemp12movealong3"));
		}

		if (which == "kemp12movealong3") {
			data.kempTruckMoments--;
			append("—saved you, you can't just—\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			if (data.kempTruckMoments <= 1)
				addChoice("MOVE ALONG.", violetMeteoriteExplore.bind("kemp12movealong5"));
			else
				addChoice("Move along.", violetMeteoriteExplore.bind("kemp12movealong4"));
		}

		if (which == "kemp12movealong4") {
			data.kempTruckMoments--;
			append("<!i>Please<!i> don't!\n\n<!b>ACTIONS: "+data.kempTruckMoments+"<!b>");
			addChoice("MOVE ALONG.", violetMeteoriteExplore.bind("kemp12movealong5"));
		}

		if (which == "kemp12movealong5") {
			if (data.theme.background != "dawn") {
				var s:MintSprite = addSprite("assets/img/effect/violetMeteoriteHub.png");
					s.x = 0;
					s.y = 101;
			}
			playMusic("violetMeteorite");
			setLocation("Violet Meteorite");
			append("... You're somewhere on/in the Violet Meteorite.");
			addChoice("... On or in, Mynt?", violetMeteoriteExplore.bind("kemp12movealong6"));
		}

		if (which == "kemp12movealong5") {
			if (data.theme.background != "dawn") {
				var s:MintSprite = addSprite("assets/img/effect/violetMeteoriteHub.png");
					s.x = 0;
					s.y = 101;
			}
			append("...");
			addChoice("I swear to fucking god Mynt am I stuck in the cave system or not?", violetMeteoriteExplore.bind("kemp12movealong6"));
		}

		if (which == "kemp12movealong6") {
			append("... I couldn't move you along in time.");
			addChoice("So I died.", violetMeteoriteExplore.bind("kemp12movealong7"));
		}

		if (which == "kemp12movealong7") {
			append("Yes.\n\nI'm sorry for lying.");
			addChoice("Where is Kemp.", violetMeteoriteExplore.bind("kemp12movealong8"));
		}

		if (which == "kemp12movealong8") {
			append("He respawned on the surface.");
			addChoice("So you kept me there for nothing.", violetMeteoriteExplore.bind("kemp12movealong9"));
		}

		if (which == "kemp12movealong9") {
			append("He got lucky. I don't know what you want me to say.");
			addChoice("Just nevermind.", violetMeteoriteExplore.bind("kemp12movealong10"));
		}

		if (which == "kemp12movealong10") {
			append("I'm sorry.");
			addChoice("How long will it take to get out of here and back to the islanders?", violetMeteoriteExplore.bind("kemp12movealong11"));
		}

		if (which == "kemp12movealong11") {
			append("I don't know.");
			addChoice("Timeskip.", violetMeteoriteExplore.bind("kemp12movealong12"));
		}

		if (which == "kemp12movealong12") {
			append("You spend two days exploring and die three times.\n\nYou respawn in a deeper cavern twice.");
			addChoice("So I'm further from escape now.", violetMeteoriteExplore.bind("kemp12movealong13"));
		}

		if (which == "kemp12movealong13") {
			append("Yes.");
			addChoice("...", violetMeteoriteExplore.bind("kemp12movealong14"));
		}

		if (which == "kemp12movealong14") {
			append("I'm sorry.");
			addChoice("...", violetMeteoriteExplore.bind("kemp12movealong15"));
		}

		if (which == "kemp12movealong15") {
			append("I can spend a couple more days exploring if you like.");
			addChoice("... No, I don't want to put you through that.", violetMeteoriteExplore.bind("kemp12movealong16"));
		}

		if (which == "kemp12movealong16") {
			append("Thank you.\n\nI'm sorry.");
			addChoice("I forgive you.", violetMeteoriteExplore.bind("kemp12movealong17forgive"));
			addChoice("What do we do now?", violetMeteoriteExplore.bind("kemp12movealong17do"));
		}

		if (which == "kemp12movealong17forgive") {
			append("That's nice of you, but I'm still sorry.\n\nI've been thinking a lot these past few days. As soon as you chose to start in the "+(data.startedInBrightForest?"Forest I asked the locals about the safest path up the side of the meteorite":"City I studied the street plans and found a way to get up to the meteorite")+". It's so big and mysterious and intriguing, y'know, so I really wanted to show it to you. I wanted you to be able to explore it.\n\nI knew the respawn system wasn't perfect. I knew it was dangerous for you to be up here");
			addChoice("I forgive you.", violetMeteoriteExplore.bind("kemp12movealong17"));
		}

		if (which == "kemp12movealong17do") {
			append("Thank you.\n\nI'm sorry.");
			addChoice("I forgive you.", violetMeteoriteExplore.bind("kemp12movealong17"));
		}

		/*if (which == "kemp9") {
			append("The second wave drags you back under.\n\nYou resurface six hours later. Kemp was right here with you the whole time. He knocked over his bong and broke it on the rocks. Water and glass sparkle in the gravel, but you don't see it. Your eyes won't open.\n\nThrough the numbness you feel the ticklish prickle of sweat beads falling from his face onto yours.\n\nHalfway through the sixth hour, CPR stops working.\n\nYou die in his arms.");
			addChoice("... Respawn.", violetMeteoriteExplore.bind("kemp10"));
		}

		if (which == "kemp10") {
			append("You respawn underground.\n\nKemp calls for you through the ceiling. His frantic, stumbling footsteps force beads of clouded water from some hotspring to drip off the stalactites above you.\n\n\""+data.playerName+"— fuck— if you can hear me, DO NOT die again— you might respawn even deeper— look, stay hydrated, suck the water from the ceiling if you get thirsty, stay put— I—\"\n\nHe goes quiet.");
			addChoice("Everything's gonna be okay! (Shout that as loud as I can.)", violetMeteoriteExplore.bind("kemp11"));
		}

		if (which == "kemp11") {
			append("He's still quiet.\n\n\"I'm...\"");
			addChoice("Don't apologize, just stay right there. Keep talking and stomping around. I'll use you as a landmark.", violetMeteoriteExplore.bind("kemp12noapology"));
			if (!data.kempSmokedEarly) addChoice("You're...?", violetMeteoriteExplore.bind("kemp12apology"));
		}

		if (which == "kemp12noapology") {
			append("\"No— I'm— I gotta—\"\n\nYou can't really hear it through the rock, but you think he pauses to draw in a single, deep breath.\n\n\"I'm gonna save you.\"");
			addChoice("No.", violetMeteoriteExplore.bind("kemp13"));
			addChoice("How?", violetMeteoriteExplore.bind("kemp13"));
		}

		if (which == "kemp12apology") {
			append("\"I'm sorry.\"");
			addChoice("It's okay, man. You didn't mean to O.D. me.", violetMeteoriteExplore.bind("kemp12apology2"));
		}

		if (which == "kemp12apology2") {
			append("\"I gotta do something.\"");
			addChoice("No, you don't. Just relax. I can find my way out.", violetMeteoriteExplore.bind("kemp12apology3"));
		}

		if (which == "kemp12apology3") {
			append("\"What if you can't? What if you trip and crack your head?\"");
			addChoice("I can.", violetMeteoriteExplore.bind("kemp12apology4"));
		}

		if (which == "kemp12apology4") {
			append("\"If you can't, you could be stuck down there for—\"");
			addChoice("I can. Even if it does take a while, I can just type 'Next' a bunch.", violetMeteoriteExplore.bind("kemp12apology5a"));
		}

		if (which == "kemp12apology5a") {
			append("\"You could lose decades.\"");
			addChoice("I'll be fine.", violetMeteoriteExplore.bind("kemp12apology6"));
		}

		if (which == "kemp12apology5") {
			append("\"You don't know what it's like to be alone for that long.\"");
			addChoice("Yes I do.", violetMeteoriteExplore.bind("kemp12apology6"));
		}

		if (which == "kemp12apology6") {
			append("\"No—\"");
			addChoice("Believe me.", violetMeteoriteExplore.bind("kemp12apology7"));
		}

		if (which == "kemp12apology7") {
			append("He's quiet.");
			addChoice("I'm gonna look for a way out.", violetMeteoriteExplore.bind("kemp12apology8"));
		}

		if (which == "kemp12apology8") {
			append("He paces frantically over the ceiling.");
			addChoice("Stay right there.", violetMeteoriteExplore.bind("kemp12apology9"));
		}

		if (which == "kemp12apology9") {
			append("\"No— fuck that— I can't just sweep up the fuckin bong shards and twiddle my dick up here while you starve to death— respawn even deeper— I gotta do something—\"");
			addChoice("I said <!i>stay there.<!i>", violetMeteoriteExplore.bind("kemp12apology9"));
		}

		if (which == "kemp13") {
			append("\"This might be the same cave— that's why I crashed: the road, it went straight down a tunnel— I was scared— I swerved away— I'm coming down— not alone— don't want you stuck down there alone—\"\n\nHe keeps talking in fragments as he runs. You stumble across the uneven cave floor, straining to hear through the cold rock, following his footsteps along the ceiling... until they slip past a wall.");
			addChoice("Kemp?", violetMeteoriteExplore.bind("kemp14"));
		}

		if (which == "kemp14") {
			append("You're alone.");
			addChoice("Examine cave.", violetMeteoriteExplore.bind("kemp15cave"));
		}

		if (which == "kemp15cave") {
			//Scripted cave sequence
			addChoice("Examine cave.", violetMeteoriteExplore.bind("kemp15cave"));
		}

		if (which == "kemp15") {
			append("Kemp's in the fetal position, just a quivering ball of brown otter in the corner. Exhaustion and paranoia seize his features.\n\nHe made it four steps into the cave before this happened.");
			addChoice("Hey man, it's okay.", violetMeteoriteExplore.bind("kemp16"));
		}

		if (which == "kemp16") {
			append("He looks at your feet over his shoulder, and his eyes rove up, but they aren't focused on you. He's looking at the cave wall opposite the exit, the one just behind you, bathed sparkly with moonlight.\n\nWhat you took to be quivering when you first approached turns out to be a slew of small, distinct tics: one paw scratches furrows into the floor, the other tap-tap-taps his knee; the toes on his left foot curl and uncurl, the heel of his right rolls around on a pebble...\n\nThe worst compulsion of all, though, is his snout. He'll turn it towards the entrance, pull in the fresh outdoor air, get hopeful for a moment— and then he'll twist his neck unnaturally to stuff both nostrils against his chestfur, muffling the scent.\n\n\"Not real not real not real,\" he convinces himself, inching away from the entrance.");
			addChoice("What's wrong?", violetMeteoriteExplore.bind("kemp17"));
		}

		if (which == "kemp17") {
			append("\"Help,\" he croaks to no one. \"Somebody help me my name is Kemp Lamblea father to Som Lamblea I work on a farm in the Swamp. Somebody help me my dog needs her food bowl and her water bowl filled up and she doesn't know where I went. Somebody help me get out I need to get out.\"");
			addChoice("Fuck... alright, haul him out.", violetMeteoriteExplore.bind("kemp18"));
		}
		

		if (which == "kemp18") {
			append("Moving all this otter isn't easy. He pulls away a couple times to go back to his corner, always when you're just about to cross the threshold of the cave's maw. Whenever he sees the night sky, and the clouds, and the winding gravel road chipped out of the side of the meteorite, he panics: \"Not real not real not real.\"\n\nFinally you manage to pry his fingers off the lip of the entrance and half-carry half-drag him back to his truck.");
			addChoice("It's okay now. We're both okay. No one's stuck down there.", violetMeteoriteExplore.bind("kemp19"));
		}

		if (which == "kemp19") {
			append("\"My dog doesn't know where I went,\" he says again. \"I need to go home.\"");
			addChoice("Talk to me man. What's her name?", violetMeteoriteExplore.bind("kemp20"));
		}

		if (which == "kemp20") {
			append("\"Bert,\" he says, and his tics begin to slow. \"I need to go home.\"");
			addChoice("Where's home?", violetMeteoriteExplore.bind("kemp21"));
		}

		if (which == "kemp21") {
			append("\"Squashed.\"");
			addChoice("... Well, that's a start. Are you lucid?", violetMeteoriteExplore.bind("kemp22"));
		}

		if (which == "kemp22") {
			append("\"No,\" he says. His voice is raspy-soft, but it isn't weak. His eyes slowly slide in and out of focus on your face. \"Almost.\"");
			addChoice("Just hug him.", violetMeteoriteExplore.bind("kemp23"));
		}

		if (which == "kemp23") {
			append("The smell of stale panic slips up your nose as you embrace him. His overworked muscles twitch against yours.\n\n\"Not real,\" he says one more time, soft and petulant.");
			addChoice("Yes real.", violetMeteoriteExplore.bind("kemp24"));
		}

		if (which == "kemp24") {
			append("He blinks. Wind ripples his whiskers.\n\n\"I can feel you.\"");
			addChoice("That's because I'm real, and the island is real, and you're not stuck down there anymore.", violetMeteoriteExplore.bind("kemp25"));
		}

		if (which == "kemp25") {
			append("\"I'm not down there anymore,\" he repeats, trying the idea on.");
			addChoice("Good. Yes, that's right.", violetMeteoriteExplore.bind("kemp26"));
		}

		if (which == "kemp26") {
			append("\"I'm not down there anymore.\"");
			addChoice("Yep.", violetMeteoriteExplore.bind("kemp27"));
		}

		if (which == "kemp27") {
			append("His eyes roll over the bong shards. \"I knocked that over with my elbow.\"\n\nThe old panic trickles slowly out from his expression, leaving him motionless on the ground in the moonlight. \"I'm not down there anymore. I'm up here. I'm free. I'm sorry.\"");
			addChoice("It's fine. Just take your time and come back to reality. I'm here for you.", violetMeteoriteExplore.bind("kemp28"));
		}

		if (which == "kemp28") {
			append("\"I'm back. It's hard to talk. My throat hurts.\"");
			addChoice("Do you need some time alone?", violetMeteoriteExplore.bind("kemp29"));
		}

		if (which == "kemp29") {
			append("\"No!\" he says, passionately. Some life comes back to his eyes. \"Stay with me.\"");
			addChoice("I'm right here.", violetMeteoriteExplore.bind("kemp30"));
		}

		if (which == "kemp30") {
			append("He fumbles numbly with a case in the back of his truck. He pulls out two baggies of sweetgrass and a small pipe. His fingers are so unsteady they practically vibrate in their sockets. \"I'm sorry. I went to a bad place.\"");
			addChoice("You shouldn't come up here if it triggers such awful memories.", violetMeteoriteExplore.bind("kemp31"));
		}

		if (which == "kemp31") {
			append("\"I didn't used to. But now the trees in the forest and the buildings in the city push in on me.\"\n\nHe takes one long hit. \"This is the only place—\" exhale— \"I can still wander.\"");
			addChoice(".", violetMeteoriteExplore.bind("kemp31"));
		}*/

		if (which == "kempearlyleave") {
			append("He nods, looks down. His cock softens. \"Yeh. Yer busy. Gohead, I got the situation under control here.\"\n\n... Long after you've walked away, the shockwave from a distant explosion ripples through your asscheeks.");
			addChoice("... Keep walking.", violetMeteoriteHub);
		}

		if (which == "ExploreCyanWedding") {
			disablePause();
			data.cyanWeddingStarted = true;
			unlockJournal("Cyan Wedding");
			append("A gorgeous glowrose wreath flutters down from somewhere higher on the meteorite and lands perfectly around your neck.");
			addChoice("Head upward and find the source.", violetMeteoriteExplore.bind("wedding"));
		}

		if (which == "wedding") {
			append("You trudge uphill for half an hour or so. Finally, sweaty from head to toe, you pull yourself up over the crest of a cliff and tumble ass-up into a crowd of nineteen people.\n\nIt's a wedding held on a rocky plateau, next to a hot spring and a waterfall. Its mist shines rainbow in the moonlight. There's fold-out pews, a beautifully carpented archway, tables with bowls of glowberry punch, and a little AUTO-MYNT at the end of the aisle, ready for some serious roboclergy. Nineteen people...\n\nHoly shit. You think you might've seen every single one of them before, on your adventures. They're all wearing cute glowrose wreaths. Several wave to you— you're not sure if you remember everyone's name, so I'll just throw them out there: Kemp, Cage, John, Lana, a hyena family, Bins, Cade, Strawberry the gryphon, Ivandis, Thelly, Marei, Lilac, Lily, "+(getJournalEntries().contains("Seagull girl")?"that goof-off gullgirl from the landfill":data.bankAccountOpened?"the seagull teller from the Snagglebank":"a cute gullgirl")+", and the bluebird receptionist from Septrica's.");
			addChoice("Wow. Hi everyone!", violetMeteoriteExplore.bind("wedding2"));
		}

		if (which == "wedding2") {
			append("Kemp wanders up and shakes your hand. Glowrose petals are stuck all over his paw, but he's too high to notice. \"Hey welcome. Bride and groom... I mean... groom and groom... er... whatever gender that gryphon is... Cade and him/her are the happy couple!! Pair of cuties, huh?\"\n\nLana greets you with a serious, barely perceptible jerk of his chin.\n\nBins runs up and gushes all over you about how excited he is because this is his first wedding in fifty-two years and he LOVES weddings because there's always so much good stuff to eat afterward because everybody is too drunk or cumdrunk to clean up after themselves!!!!\n\nEventually, everyone starts to feel a little rude for giving you all the attention while Cade and Strawberry sit politely at the back of the crowd. They break off into clumps and do their own thing. Here's what we got:\n\n• Kemp & Cage\n• John & Ivandis\n• Lana & Marei\n• Lilac & Lily\n• Bins & the hyena family\n• Thelly & the bird girls\n\nAnd, of course, Cade & Strawberry. Who do you want to hang out with?");
			for (character in ["Kemp & Cage", "John & Ivandis", "Lana & Marei", "Lilac & Lily", "Bins & the hyena family", "Thelly & the bird girls"]) {
				addChoice(character+".", function() {
					clearText();
					if (character == "Kemp & Cage") append("These two are the source of the glowrose wreaths. Kemp sits on his inner tube just past the shore of the hot springs, warming his ass and sticking his tongue out for concentration while he twists away at the wreaths.\n\nCage is trying his best. He really is. But his big bull fingers are just too calloused and bumbly. He can't thread the wreaths together even half as fast as Kemp, and two out of three fall apart entirely.\n\nOnce in a while he'll bite back his frustration, give up on a wreath, and fling it over the edge of the cliff.");

					if (character == "John & Ivandis") append("John and Ivandis sit together at a little picnic table, sipping glowberry punch from two fancy glasses.\n\n\"But don't you miss it?\" Ivandis asks him, dragging a little digit around his rim. You mean the rim of his glass.\n\n\"I miss everything around it,\" John admits. \"The ritual, you know, the build-up and the wind-down. Foreplay. Courting. Blushes. Afterglow. All that stuff is still pretty rosy in my memory. Of course, there's also Lana, who I have a strictly professional relationship with— I still cherish the memories of his little...\"\n\n... Ivandis tunes out. He keeps glancing over longingly at Cage.");

					if (character == "Lana & Marei") append("Lana scratches behind his fluffy fox ears (and almost slices one with a glitched claw). He glances around, paranoid. He doesn't see you.\n\nMarei slinks up behind him and whispers in one of those sensitive ears: \"So we've confirmed that infection is irreversible, right? And it always, always, always happens after full submersion?\"\n\nLana nods.\n\n\"Good,\" Marei purrs, digging his claws into Lana's shoulders. \"Nothing should go wrong.\"\n\nLana shakes his head.\n\nThe both notice you and wander off.");

					if (character == "Lilac & Lily") append("The horse sisters are acting suspiciously interested in the punchbowl. They laugh and chat breathlessly with each other, hovering around the table. Both their faces are a little blue and drippy...");

					if (character == "Bins & the hyena family") append("\"Please adopt me!\" Bins begs the Mom and Grandma hyenas. He drops to his little raccoon knees on the rock. \"I beg you!!!\"\n\nThe toddlers are curious about this loudmouthed big kid in front of them, but Mom and Grandma cross their arms beneath their tits and look at each other. \"Too old,\" they both agree.\n\nBins is devastated.");

					if (character == "Thelly & the bird girls") append("The bluebird and the seagull are pampering Thelly. They stroke his cocklet and tell him what a pretty girl he is in their crystalline, sing-song bird voices. Thelly blushes and wags his tail, pleased yet furiously embarrassed. \"I'm... I'm...\"\n\n\"What's wrong?\" the seagull asks, sliding down, dragging her tits over his flat chest and belly and nuzzling his cock with her soft beak.\n\nThelly pulls off and runs away. \"I'm sorry! Thank you! Really, thank you! But I'm gay!\"\n\nThe bird girls look at each other disappointedly.\n\n\"And he was so cute, too...\"");
				}, {oneTime: true});
			}

			addChoice("Cade & Strawberry. (Next.)", violetMeteoriteExplore.bind("wedding3"));
		}

		if (which == "wedding3") {
			append("Cade waves hello and pulls you over by your hips for a full-body-contact kiss on the mouth.\n\n\"Mwah,\" he onomatopoeizes. \"Welcome! You came before I even sent the invitation, huh??\"");
			addChoice("A wreath fell on my head~", violetMeteoriteExplore.bind("wedding4"));
			addChoice("Someone beat you to it.", violetMeteoriteExplore.bind("wedding4a"));
		}

		if (which == "wedding4") {
			append("\"Oh,\" Cade giggles. On the other side of the crowd, Cage throws his last wreath off the cliff and starts macho-walking through the party, swinging his shoulders and his hips, looking for some stress relief. \"Yes... he's been trying his best, but it's just not as artful as the otter's work. Cage, right? He built the archway here for us. One letter off from my name. So confusing! He came with Marei... and Marei came with Thelly. Crazy how parties fill out exponentially, huh? Yeah?\"\n\nCade says all that very fast.");
			addChoice("You nervous?", violetMeteoriteExplore.bind("wedding5"));
		}

		if (which == "wedding4a") {
			append("\"Oh?\" Cade giggles. \"Must've been Marei. No. Septrica? One of those two... they love the importance of it. If it weren't my wedding, I'm sure they'd somehow wiggle their way into being the host. But that's just like them, isn't it? Oh wait no, you wouldn't know— I forgot you haven't met Septrica yet. Gosh. My bad. Sorry.\"\n\nCade says all that very fast.");
			addChoice("You nervous?", violetMeteoriteExplore.bind("wedding5"));
		}

		if (which == "wedding5") {
			append("\"Um—\"\n\nStrawberry drapes "+gryphJunk("his", "her", "their")+" beak over Cade's shoulder and pushes down. That forces Cade to take a seat. "+gryphJunk("His", "Her", "Their")+" big, fluffy forepaws curl around Cade's hips and hold him firmly in place while radiant images of still forest pools, slow wisps of steam, hot meals, cool rainfall, and perfect serene whiteness flow through Cade's mind and your own.\n\n<!i>He is nervous,<!i> Strawberry purrs. <!i>But not for long.<!i>");
			addChoice("It's a big day for you two~!", violetMeteoriteExplore.bind("wedding6"));
		}

		if (which == "wedding6") {
			append("<!i>It is.<!i>\n\n\"Eheh! Yeah, it is, well, you know... it's gonna be pretty big for all of us...\"");
			addChoice("When's the ceremony starting?", violetMeteoriteExplore.bind("wedding7"));
		}

		if (which == "wedding7") {
			append("Strawberry nuzzles "+gryphJunk("his", "her", "their")+" fiance. <!i>Soon. I better go get changed. Right, puppy?<!i>\n\nCade goes bright red. \"H-Hey... don't call me that in front of "+data.playerName+"...\"\n\nSomeone taps you on the shoulder.");
			addChoice("Hm?", violetMeteoriteExplore.bind("wedding8"));
		}

		if (which == "wedding8") {
			append("It's Marei.\n\n\"Not interrupting, am I?\"\n\nWithout waiting for an answer, he goes ahead and interrupts:\n\n\"I just wanted to apologize in advance, if I disappear. It definitely won't be on purpose. Wonderful reception you two have set up— and right after your City party. You must be so tired.\"\n\nStrawberry and Cade smile and nod politely.\n\nMarei turns to you. \"Didn't find the password, I suppose?\"");
			addChoice("No... still haven't.", violetMeteoriteExplore.bind("wedding9"));
		}

		if (which == "wedding9") {
			append("\"Well,\" he murmurs. \"Let's stop worrying about it for a while. We should enjoy ourselves while we can, right? There's no sense trying to outwit my sister until we have more information.\"");
			addChoice("Mm. Next.", violetMeteoriteExplore.bind("wedding10"));
		}

		if (which == "wedding10") {
			append("\"Everyone please have a seat,\" Cade announces. \"The ceremony is about to begin! Oh, Strawberry, go get changed...\"\n\nEveryone reluctantly unplugs the cocks from their butts and sits down in the pews. Some of the cubs hang their arms over the backs of the seats and chat happily with the people behind them.\n\nLilac and Lily are passed out behind the punch bowl. Cage grabs Ivandis roughly by the wrist for staring at his cock too much and disappears into a little alcove with him. The others pair up like this:\n\n• Kemp & John\n• Bins & the bluebird girl\n• Lana & the hyena toddlers\n• Marei & the gullgirl\n\nAnd, at the very end of a middle pew, surrounded by people chatting with everyone but him, Thelly sits alone.");
			for (character in ["Kemp & John", "Bins & the bluebird girl", "Lana & the hyena toddlers", "Marei & the gullgirl", "Thelly"]) {
				addChoice(character+".", function() {
					clearText();
					if (character == "Kemp & John") append("Kemp looks supremely uncomfortable. His flabby otter ass is used to hanging freely in the water below his inner tube, or nuzzling deep into the firm cushion of the driver seat or the posh lounge couches at Septrica's basement bar. His butt isn't used to the plastic seats of these hard, fold-out pews.\n\nJohn wanders over, navigating the minefield of sex and sex talk. He doesn't seem to know what to do with himself, and Kemp isn't doing anything sexual, so he claps a hand on Kemp's shoulder and tries to cheer him up.\n\n\"You alright?\"\n\nKemp's thankful for the company. His posture unstiffens. \"Yeah. Just not used to staying in one place this long.\"\n\n\"Ah, yeah. I heard about your accident. Awful stuff.\"\n\n\"Heard about yours, too, of course.\"\n\nJohn nods. The guys sit in silence for a moment. Kemp glances over. John's arm is still around his shoulders.\n\nLike it's the most normal thing in the world, Kemp leans in and takes a huge whiff of John's armpit, packed with sleek, heavy, musky golden retriever fur. \"Mmmf,\" Kemp grins. \"Yer fuckin ripe down there, you know that?\"\n\nJohn is supremely unsettled. \"Sorry, I uh... I gotta go ask Lana about uh... some samples...\"\n\n... Kemp is left alone again.\n\nHe blinks to himself and realizes his error. He smacks his forehead with the heel of his palm. \"Fuck.\"");

					if (character == "Bins & the bluebird girl") append("She tucks a soft, feathered finger between the little raccoon's thighs and drags it up, up, over his fupa and then plugs it right into that tiny cub belly button. His bellyfat jiggles a bit.\n\n\"You're a little chubby, aren't you?\" she twitters in his ear. Her feathery tits press down over Bins's eyes as she leans so deeply forward.\n\nBins giggles. All you can see is his smile peeking out from below her bosom. \"Yeh,\" he murmurs. \"I eat a lot of junk, is all...\"\n\nHe wraps his little paws around her hips and pulls himself forward, grinding his cocklet against the lips of her cunt. Right there, in the pews, surrounded by uncaring people, they start banging.");

					if (character == "Lana & the hyena toddlers") append("Lana sneaks up behind the hyena toddlers and hands them a note. Mom eyes him warily, since Grandma is already napping in her pew.\n\n... At first the toddlers pretend they can't read. But then they quickly realize why Lana isn't speaking, and they drop their roleplay personas out of courtesy.\n\n\"Meet... me... later... for... a... beating?\" the girl reads, still trying to sound like she's bad at reading purely for the cuteness factor.\n\nAll three pairs of wonderstruck yeen eyes light right up. They scramble to ask Mom if they can go with the cute fox boy for a beating later.\n\n\"Mmmmn...\" Mom pretends like she has to consider it. She tugs her left nipple thoughtfully. A paw wanders down and casually fingerfucks her son's maw open. \"MmmmmMMMMMMMM... I guess you do all deserve one, don't you?\"\n\nThey all nod excitedly. When the boy nods, his mouth slips a little deeper on Mom's fingers.\n\n\"Alright,\" she says at last. \"You can go with the nice fox boy after the wedding and the flood is over.\"\n\nAll three of them cheer and crowd Lana out, hugging him from his ass, his crotch, the sides of his hips~ Their maws only come up to crotch-level, but Lana doesn't mind. He simply runs his glitchy paws through their hair and pulls them closer with an evil little smile, not worrying about the chance that gentle petting or pulling might suddenly multiply into a punch or a yank at any moment...");

					if (character == "Marei & the gullgirl") append("The gullgirl walks up to Marei like he isn't the C.E.O. of the island's biggest organization and asks \"Yo, you suck dick?\"\n\nMarei blinks and smiles, refreshed. He gestures with a languid paw, legs crossed. \"Oh, not regularly. I need to do it more often.\"\n\n\"Listen,\" she says, and plops her feathered butt down right next to him on the pews. \"See that player over there? The only player? The one staring at us? Yeah, that one. "+pickByGender("He'll", "She'll", "They'll")+" fuck your throat raw if you let "+pickByGender("him", "her", "them")+". Had me gagging on "+pickByGender("his", "her", "their")+" cock, nuts bouncing off my beak. <!i>Me.<!i> Gagging. Can you believe that shit?\"\n\nMarei shoots an amused smile at you. \"Hardly~\"");

					if (character == "Thelly") append("You sit down next to Thelly in the back row.\n\nHe smiles and rubs your thigh with a paw. \"My plan worked. I was trying to look all lonesome, so you'd sit as far away from that little AUTO-MYNT as possible... you uh... you don't know what's about to happen, do you? This wedding is special. It's the first monogamous wedding since Year 23. Very special. But more than that, there's something else planned... it's... well. I don't know if I'm allowed to say it outright. Maybe I shouldn't. I'll shut up...\"\n\nHe takes his paw off your thigh and starts hurriedly talking to someone else before you can respond.");
				}, {oneTime: true});
			}

			addChoice("Next.", violetMeteoriteExplore.bind("wedding11"));
		}

		if (which == "wedding11") {
			append("The ceremony begins.\n\nGlowrose petals flutter from the paws of the flower boys (Bins, Lana, and the hyena toddler boy trailing behind) and the flower girls (Just the seagull and the bluebird and the hyena toddler girl, since Lily and Lilac passed out). The AUTO-PRIEST plays a little bridal chorus loop. Everyone who isn't gone, passed out, or having sex scooches forward to the edge of their pew and breathlessly awaits Strawberry.\n\nThere...\n\nOn the other side of the lake, Strawberry slinks out around the waterfall in an adorable bridal gown, careful not to get "+gryphJunk("himself", "herself", "themselves")+" too wet. "+gryphJunk("He flies", "She flies", "They fly")+" across the lake with powerful wingbeats that send out ripples in a wake behind "+gryphJunk("him", "her", "them")+".\n\n"+gryphJunk("His", "Her", "Their")+" talons come down on the aisle. If there had been a carpet there, it'd be shreds now.");
			addChoice("Next!!", violetMeteoriteExplore.bind("wedding12"));
		}

		if (which == "wedding12") {
			//@TODO: Add gryphon art
			append("<!i>What are you all staring at,<!i> Strawberry asks the crowd, throwing imperious, interrogative mind-images in all directions.\n\nCade whispers to "+gryphJunk("him", "her", "them")+", standing up near the AUTO-PRIEST. \"They're supposed to be staring! You're my bride!\"\n\n<!i>Right.<!i>");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding13"));
		}

		if (which == "wedding13") {
			halfWidthText();
			var s:MintSprite = addSprite("assets/img/effect/gryphWedding.png");
			s.x = GAME_WIDTH - s.width;
			s.y = GAME_HEIGHT - s.height;
			s.layer = 69;
			s.scaleX = 0.9;
			s.scaleY = 0.9;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Leveretry", "");

			append("Strawberry awkwardly climbs up onto the dais and plops down on "+gryphJunk("his", "her", "their")+" haunches.");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding14"));
		}

		if (which == "wedding14") {
			append("\"FIRST,\" the AUTO-PRIEST announces, \"A FEW WORDS FROM OUR BEST MAN...\"");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding15"));
		}

		if (which == "wedding15") {
			append("Marei gets up, smooths out his suit pants, and strolls to the dais.\n\nThe AUTO-PRIEST continues: \"... AND OUR BEST WOMAN.\"\n\nThelly hops off the pew next to you and hurries up too, blushing, tail tucked deeply between his legs.");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding16"));
		}

		if (which == "wedding16") {
			append("Marei starts. He brings his maw to the mic, almost kissing it. Cade sits just a few feet away, paws death-gripped on his knees to stop them from wobbling. Marei smiles down at him.\n\n\"When I first met this little chimera,\" he begins, \"he had just been checked into the Apothecary's rehabilitation program. Following a great loss, he had thrown himself into his work as part of the anti-rape squads... but then he had thrown his savings at our tranquilizer wholesaler, and locked himself in his apartment to nod out for six months at a time. Finally, he decided that he needed help, and he came to us. Within two days the cravings had stopped. Within six, he was enrolled in therapy for delusions of worthlessness, self-hatred, and a whole mess of neuroses connected to that great loss. He's been clean now for forty-five years. Hasn't come back to the Apothecary a single time— except to bring me cookies. Next month, he'll hold the island-wide record for longest time spent sober, just above Cage. That shit doesn't happen on accident, so everyone, please, give this cute little alien tiger a round of applause!\"\n\nThe pews erupt with clapping. Even Cage peeks out from his alcove and throws out a gruff cheer and a fist-pump.");
			addChoice("Applaud!!", violetMeteoriteExplore.bind("wedding17"));
		}

		if (which == "wedding17") {
			append("Thelly takes the stand next.\n\nHe's too afraid to look at Cade or Strawberry. Or anyone at all, for that matter. He stares at his feet and uncrumples a tattered piece of paper from his panties.\n\n\"Ahem,\" he false-starts. The mic whines with feedback. \"Ahemmm. So. Um. One second. Sorry.\"\n\nLana's got a shit-eating grin on his face. He unfolds and raises a pre-made sign that says <!i>YOU CAN DO IT, PUPPYFAG!<!i> in Marei's handwriting.\n\nThelly goes white. His eyes widen with a burst of submissive tingles that you can feel from way over here in the back row.\n\nLana flips the sign over.\n\n<!i>JUST PRETEND YOU'RE GETTING DOMMED INTO THIS!<!i>");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding18"));
		}

		if (which == "wedding18") {
			append("Thelly bites his lip. Behind the podium, his cocklet surges to life.\n\n\"Ahem— um— sorry, right. Sorry, master.\"\n\nHe squints at his crumpled paper.\n\n\"I um... I crushed on Strawberry p-pretty hard, some years ago. He was very terse— at least when he used to always be a he— and he um... he kept me in his cave for a very, very long time...\"\n\nKemp fidgets, shifts, gets up, and leaves with a mumbled apology.");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding19"));
		}

		if (which == "wedding19") {
			append("Thelly goes on bravely as half the audience gets distracted and watches Kemp leave. If he wants to recapture their attention, he has to do it boldly and he has to do it now.\n\n\"He ruined me!\" he squeaks.\n\nThe audience turns back to face him, instantly captivated. Some paws disappear between some thighs.\n\n\"I was absolutely pitiful for three months or more. I barely spoke except to ask for more cock. It was the highest point of my entire life. I. Well. In that cave, he taught me more about myself than I could have ever learned through gentle self-exploration. He pushed me to my limits and a little bit past them. He taught me the pleasure and the necessity of being a good submissive on an island filled with lazy ones. And... um. Most importantly of all... he taught me how to deal with the quiet. How to sit in a cave for hours with no cock and no affection. How to be comfortable when I'm alone with my own thoughts. And, if my thoughts ever strayed to places I thought they should never go, he... Strawberry... Strawberry taught me that it's okay to feel like a girl sometimes.\"\n\nThelly takes a huge breath and hurries off the stage. He practically knocks your pew over when he jumps back into it and curls up into a shy, quivery ball. The audience applauds him and whistles and cheers, and the front-most ones swing all the way around in their seats just to be sure that they can direct their affection right towards him.");
			addChoice("Applaud!!!!!", violetMeteoriteExplore.bind("wedding20"));
		}

		if (which == "wedding20") {
			append("\"Thanks, you two,\" Cade says, tail wagging like crazy.\n\nStrawberry telepathically broadcasts images of warm gratitude and loyalty: a son hugging his mother, a dog curled up in his owner's lap, a frazzled grandma receiving altogether too many presents for her 100th birthday.\n\nTwo of those images don't really line up to island life; there are no real mothers and children, and there is only one communal birthday to celebrate and very few grandmas around to celebrate it, if they even did. The hyena grandma appreciates it, though.\n\nAnd Strawberry's sharp yellow gryphon eyes focus on you, too. "+gryphJunk("He smiles", "She smiles", "They smile")+".\n\nYou interpret those images to mean this:\n\n<!i>Thank you, friends. All of you. Even our brand-new ones.<!i>");
			addChoice("Next. <3", violetMeteoriteExplore.bind("wedding21"));
		}

		if (which == "wedding21") {
			data.currentSong = "";
			stopChannel("music");
			playSound("assets/audio/music/bridalChorus", "music", {loops: 99999});
			append("The AUTO-PRIEST speaks up again:\n\n\"PLEASE PRESENT THE RING, RINGBEARER.\"\n\nMarei stands up.");
			addChoice("Next?", violetMeteoriteExplore.bind("wedding22"));
		}

		if (which == "wedding22") {
			append("He twists his Pastel Ring earring out and cleans it with a sterile cloth. It shimmers with beautiful pastel greens, reds, blues.\n\n\"May you stay forever youthful and healthy,\" he recites. He places the ring in the crook of Strawberry's sharp beak. Warm gryphon breath washes over it.\n\nCade gulps.");
			addChoice("Next...", violetMeteoriteExplore.bind("wedding23"));
		}

		if (which == "wedding23") {
			append("The AUTO-PRIEST beeps ceremoniously.\n\n\"DO YOU, STRAWBERRY THE GRYPHON, TAKE THIS MAN, CADE THE CHIMERA, FOR YOUR LAWFUL HUSBAND, TO HAVE AND TO HOLD FROM THIS DAY FORWARD, FOR BETTER, FOR WORSE, FOR RICHER, FOR POORER, IN SICKNESS AND IN HEALTH, UNTIL GLITCHES OR PSYCHOLOGICAL DAMAGE DO YOU PART?\"\n\nStrawberry throws out images of absolute certainty and precision: a hammer on a nail, a surgical cut, a montage of slow signatures under fourteen different dotted lines.\n\n<!i>I do.<!i>");
			addChoice("Next...!", violetMeteoriteExplore.bind("wedding24"));
		}

		if (which == "wedding24") {
			append("Cade looks mysteriously depressed. He's staring at the ring.\n\n\"AND DO YOU, CADE THE CHIMERA, TAKE THIS MYTHOLOGICAL CREATURE, STRAWBERRY THE GRYPHON, FOR YOUR LAWFUL "+gryphJunk("HUSBAND", "BRIDE", "SPOUSE")+", TO HAVE AND TO HOLD FROM THIS DAY FORWARD, FOR BETTER, FOR WORSE, FOR RICHER, FOR POORER, IN SICKNESS AND IN HEALTH, UNTIL GLITCHES OR PSYCHOLOGICAL DAMAGE DO YOU PART?\"\n\nHe tears his eyes from the ring.\n\n\"I...\"");
			addChoice("Next...!!!", violetMeteoriteExplore.bind("wedding25"));
		}

		if (which == "wedding25") {
			if (getItem("Cade's Seed").amount <= 0) addToItem("Cade's Seed", 1);
			append("\"I do.\"\n\nMarei smiles.");
			addChoice("Next...?", violetMeteoriteExplore.bind("wedding26"));
		}

		if (which == "wedding26") {
			append("Strawberry cranes "+gryphJunk("his", "her", "their")+" neck gracefully forward.\n\nThe ring slides onto Cade's outstretched finger.");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding27"));
		}

		if (which == "wedding27") {
			append("\"YOU MAY KISS THE "+gryphJunk("GROOM", "BRIDE", "BIRD")+".\"");
			addChoice("Next.", violetMeteoriteExplore.bind("wedding28"));
		}

		if (which == "wedding28") {
			append("Cade glances at you apologetically.");
			addChoice("Hm?", violetMeteoriteExplore.bind("wedding29"));
		}

		if (which == "wedding29") {
			append("He reaches over behind the AUTO-PRIEST.");
			addChoice("Next?", violetMeteoriteExplore.bind("wedding30"));
		}

		if (which == "wedding30") {
			append("He slides his finger up the back port.");
			addChoice("Next?? o.o", violetMeteoriteExplore.bind("wedding31"));
		}

		if (which == "wedding31") {
			append("Marei's ring clicks into place.");
			addChoice("     ", violetMeteoriteExplore.bind("wedding32"));
		}

		if (which == "wedding32") {
			append("Cade leans forward and kisses Strawberry on the beak.\n\n\"Go,\" he whispers.\n\nStrawberry takes flight in a rush of air. "+gryphJunk("He soars", "She soars", "They soar")+" over the pews and land"+gryphJunk("s", "s", "")+" next to you.\n\n<!i>Climb on.<!i>");
			addChoice("Look at Thelly???", violetMeteoriteExplore.bind("wedding33"));
		}

		if (which == "wedding33") {
			append("The AUTO-PRIEST speaks: \"CONTACTING SEPTRICA FOR FURTHER INSTRUCTIONS.\"\n\nAll of Thelly's shyness has disappeared. Pale, calm resolve has taken its place.");
			addChoice("     ", violetMeteoriteExplore.bind("wedding34"));
		}

		if (which == "wedding34") {
			append("\"INSTRUCTIONS RECEIVED. PREPARING SYSTEMS FOR MASS SPAWNING...\"\n\nMarei glitches out and teleports all the way up to Hyper Land.\n\nThelly leans in, solemnly, and whispers in your ear:\n\n\"Leave. Now.\"");
			addChoice("What is...", violetMeteoriteExplore.bind("wedding35"));
		}

		if (which == "wedding35") {
			disablePause();
			playSound("audio/mynt/intro");
			var auto:MintSprite = addSprite("img/effect/autoShop");
			auto.x = GAME_WIDTH/2 - auto.width/2;
			auto.y = GAME_HEIGHT/2 - auto.height/2;

			var mintFace:MintSprite = addSprite("img/effect/mintAutoShop");
			mintFace.x = auto.x;
			mintFace.y = auto.y;
			mintFace.tint = 0xFFFFFFFF;
			mintFace.alpha = 0;

			var auto1:MintSprite = addSprite("img/effect/autoShop");
			auto1.alpha = 0;
			auto1.x = auto.x;
			auto1.y = auto.y;
			auto1.scaleX = 0;
			auto1.scaleY = 0;

			var auto2:MintSprite = addSprite("img/effect/autoShop");
			auto2.alpha = 0;
			auto2.x = GAME_WIDTH - auto2.width - 10;
			auto2.y = auto.y;
			auto2.scaleX = 0;
			auto2.scaleY = 0;

			var auto3:MintSprite = addSprite("img/effect/autoShop");
			auto3.alpha = 0;
			auto3.x = 10;
			auto3.y = auto.y;
			auto3.scaleX = 0;
			auto3.scaleY = 0;

			var canvas:MintSprite = new MintSprite();
			prepareSprite(canvas);
			canvas.setupCanvas("img/effect/autoShop", GAME_WIDTH, GAME_HEIGHT);

			var e:Emitter = emitterCreate("spritesheet/berryParticles");
			e.sprite.layer = Main.ADD_SPRITE_LAYER+1;
			e.position.minX = -30;
			e.position.minY = -30;
			e.position.maxX = GAME_WIDTH+30;
			e.position.maxY = GAME_HEIGHT+30;
			e.speed.min = 15;
			e.speed.max = 20;
			e.angle.min = 0;
			e.angle.max = 360;
			e.lifeSpan.min = 1;
			e.lifeSpan.max = 1;

			var emitterPos:Point = new Point(400, 300);
			//tween(e.position, {minX: e.position.minX+rndInt(-50, 50), maxX: e.position.minX+rndInt(-50, 50)}, 1, {type: PINGPONG});
			//tween(e.position, {minY: GAME_HEIGHT-50, maxY: GAME_HEIGHT-100}, 3, {type: PINGPONG});

			var goCrazyTimer:Int = 0;
			var emitTimer:Int = 0;
			var emitTimer2:Int = 0;
			var emitTimer3:Int = 0;

			function goCrazy():Void {
				if (getItem("AUTO-MYNT").amount >= 777777) {
					timerCancel(goCrazyTimer);
					clearChoices();

					timer(5, function() {
						playSound("assets/audio/environment/despairSting");
						addChoice("WHAT IN THE FUCK", violetMeteoriteExplore.bind("postWedding"));

						for (i in 0...3) {
							var emitTimer:Int = timer(0.01, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);

							var emitTimer2:Int = timer(0.02, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);

							var emitTimer2:Int = timer(0.02, function() {
								emitterEmit(e, e.sprite.frameNames[0]);
							}, 9999999);
						}
					});
					return;
				}
				for (i in 0...8) {
					if (Math.random() < 0.2 && getItem("AUTO-MYNT").amount < 776778) addToItem("AUTO-MYNT", rndInt(999, 1200));
					if (getItem("AUTO-MYNT").amount < 777777 && getItem("AUTO-MYNT").amount >= 776778) addToItem("AUTO-MYNT", 777777 - getItem("AUTO-MYNT").amount);
					canvas.copyPixels(0, 0, 342, 311, Math.round(rndFloat(-auto.width/2, GAME_WIDTH)), Math.round(rndFloat(-auto.height/2, GAME_HEIGHT)));
				}
			}

			tween(auto, {y: auto.y + 2}, 0.05, {type: PINGPONG});
			tween(mintFace, {y: auto.y + 2}, 0.05, {type: PINGPONG});
			tween(mintFace, {alpha: 1}, 6.5, {onComplete: function() {
				mintFace.tint = 0x00000000;
				stopChannel("music");
				playSound("audio/environment/autoshop");
				playSound("audio/environment/mintAppears");
				auto.cancelTweens();
				mintFace.cancelTweens();
			}});

			timer(9, function() {
				playSound("audio/environment/autoshop");
				tween(auto, {x: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(mintFace, {x: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto1, {scaleX: 1, scaleY: 1, x: GAME_WIDTH - auto1.width - 10, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				addToItem("AUTO-MYNT", 1);
			});

			timer(12, function() {
				playSound("audio/environment/autoshop");
				timer(0.2, playSound.bind("audio/environment/autoshop"));
				tween(auto, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(mintFace, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto1, {y: 10}, 0.4, {ease: ELASTIC_OUT});
				tween(auto2, {scaleX: 1, scaleY: 1, y: GAME_HEIGHT - 10 - auto2.height, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				tween(auto3, {scaleX: 1, scaleY: 1, y: GAME_HEIGHT - 10 - auto3.height, alpha: 1}, 0.4, {ease: ELASTIC_OUT});
				addToItem("AUTO-MYNT", 1);
				addToItem("AUTO-MYNT", 1);
			});

			timer(16, function() {
				playMusic("autoSpam");
				goCrazyTimer = timer(0.05, function() {
					goCrazy();
				}, 99999);
			});

			hookClear(function() {
				emitterDestroy(e);
				Engine.hideFps();
				timerCancel(emitTimer);
				timerCancel(emitTimer2);
				timerCancel(emitTimer3);
			});
		}

		if (which == "postWedding") {
			data.floodMode = true;
			append("THE AUTO-MYNTS ARE RISING UP AND SPAWNING COPIES OF THEMSELVES AND THEN THOSE COPIES ARE ALL SPAWNING GLOWBERRIES TOGETHER AND IT'S FLOODING THE WHOLE FUCKING ISLAND OUT\n\nSTRAWBERRY'S GOT YOU WE'LL TAKE IT FROM THERE STAY SAFE");
			addChoice("OH NO oh jeez I gotta help people !!", function() {
				WorldMap.map();
			});
			addChoice("Move along!!", violetMeteoriteExplore.bind("floodHub"));
		}

		if (which == "ExplorePizza") {
			data.kempPizzaDone = true;
			unlockJournal("Kemp Pizza");
			append("You come across a part of the springs that seems obscured in the dense mists of the steamy pools. As you travel further ahead, though, the mist becomes thinner, revealing an alcove packed with a group of bros, the obvious slouch types. They've hogged the hot spring pool all to themselves. Among them, wet with the condensation of aerial steam, you notice a familiar face.\n\nKemp is here, arguing with his friend: a larger, chubby crocodile sitting across from him, his arms leaning back on the edge of the pool as he lets his body stretch out. His long, scaly tail floats aimlessly in the bubbles. You can see his flaccid cock hanging to the side as he raises his hand from where his elbow rests.\n\nThey're bickering over pepperoni.");
			addChoice("Eavesdrop.", violetMeteoriteExplore.bind("pizza1"), {kinks: ["Guest Writer", "Male", "Male", "Male", "Raunch", "Foodplay"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza1") {
			msg("<!img:kink/Guest Writer.png> Guest Writer: Srsly", true);
			append("\"I just think you're making too big a deal out this,\" the crocodile says, and Kemp responds in a frown. A crinkling of a bag of chips announces the large bull sitting between them, glancing back and forth in anticipation, like he was into some thick soap opera, chomping on his food while the crumbs trickle over his exposed chest, caking them with grease made soggy in the hot spring's vapor.\n\n\"I dunno why the fuck I just stood there and watched... poor fuckin thing did nothin to you, Snagg. And ya kilt it. Just so you could have peps on yer precious pizza,\" Kemp protests. He tosses a bleary, sorrowful glance over to a huge pepperoni pizza sitting at the shore of the spring in an open box, slowly beginning to glisten with moisture on top of the small pools of grease which had already formed.");
			addChoice("Oooh... guys, can I have some of that?", violetMeteoriteExplore.bind("pizza2"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza2") {
			append("If you had planned to say something, those plans were surely ruined now by their bickering. Kemp lights an ever-present sweetgrass blunt and sucks the whole thing straight to his dome in one perfect pull out of pure frustration.\n\nAs he breathes the smoke out, it mingles with the steam in the air, becoming impossible to separate among the dank sauna. He calms a little and opens his mouth.\n\n\"Look, I'm sor—\"\n\n\"Well if you weren't such a pussy,\" Snagg retorts— clearly feeling chafed about his eating habits, since he's giving his fat gut a couple freudian rubs— \"then maybe you'd have stopped me.\"");
			addChoice("...", violetMeteoriteExplore.bind("pizza3"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza3") {
			append("Kemp freezes, hurt.\n\nThen... slowly... a shit-eating grin spreads across his plastered face. It becomes apparent that these three have been drinking, as the bull slurps loudly on a can— below him, pieces of scattered, crushed aluminum litter the shore. And Kemp, far more gone than the rest, stands up in the water, his big, soft cock lolling gingerly over his nuts, dripping with its recent soak.\n\n\"If it's gonna be like that...\"\n\nKemp glances at the pizza and drags a paw over his hardening dick.");
			addChoice("Uh oh.", violetMeteoriteExplore.bind("pizza4"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza4") {
			append("\"No— I take it back, you're not a pussy— don't—\" Snagg tries, but it's too late.\n\nKemp's mind has been made up. He bolts over to the pizza, already stroking his member hungrily. As he nears it, Snagg scrambles frantically out of his relaxed position on the other side of the pool. The pizza emits a silent groan of anticipation as the plastered otter looms over it, snickering to himself, pumping his cock faster, and faster...\n\nBut with the approaching threat of Snagg catching up to him, and his orgasm still awhile in the making, he stops stroking for a moment and instead scampers out of the water with otterlike scampitude and pushes the box further away from its edge. Snagg thrashes at the shore, his smaller arms unable to allow him a reach. The fat reptile kinda reminds you of a T-Rex.\n\n\"This is what I think of your fuckin' peps, bro!\" Kemp shouts.\n\nHe squats over the box and lowers his sack to dip into the melted cheese, parting his own buttcheeks as a taunt and swirling them around, the stringy mess coating the fur of his balls as he smears it about and teabags the fuck outta Snagg's pizza.");
			addChoice("Shield my eyes from this horrible rape scene.", violetMeteoriteExplore.bind("pizza5"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza5") {
			append("At this point neither you nor the bull can look away. It's like a train wreck.");
			addChoice("In that case, spectate extra vigorously.", violetMeteoriteExplore.bind("pizza6"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza6") {
			append("Kemp lowers his hands, sliding them under the crust, and slowly begins to roll his hips up against the pizza's surface.\n\n\"Yeah, some real good fuckin' meat you got here...\" he slurs, and pleasure contorts his expression as the soft, thick mess spreads around his crotch. You can almost feel Snagg's heart break from here as he watches Kemp defile his precious, pure little pizza.\n\nHe leaps from the pool and over to the box, grasping the other side of it.\n\n\"At least leave a little! That part! Leave that part!\" he growls, digging his claws into an unmolested slice.\n\n\"You mean thiiiiis~?\" Kemp teases, and snatches that slice in a fist before bringing it down behind him, dragging it along the small of his back, and then finally wiping his asscrack with it, coating his butthole in sauce as he pleases himself with the pizza of another man. Snagg tries to yank the doughy pie away, but it stretches, making more of a mess as some of it slops back into the box. Kemp gathers it back up with his hands, pulling it away from Snagg, but by now the gooey mess has formed a sexy, fuckable clump. Kemp sinks his dick into the warmth of the cheesy, greasy pile and thrusts into its tight little pizzawomb. His tongue hangs out as he grins provocatively at Snagg.\n\nAt this point, you hear an audible gag coming from the bull, who seems to have stopped munching on his chips, and has taken to trying to wipe them off of his broad chest, but only succeeds in furthering his own problems, smearing them over his nipples, hard as they were without his consent.");
			addChoice("... Next.", violetMeteoriteExplore.bind("pizza7"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza7") {
			append("You watch as Kemp really goes to town on the pizza, and the longer he works, the more Snagg seems to accept what's happening, his own cock slowly hardening from the display of pure unadulturated lust.\n\nSnagg cannot resist himself. He's stopped fighting and now he's slowly moving closer, his stained wifebeater leaving nothing to imagination in the dampness of the air. You can see his chubby belly's surface through the thin fabric, almost taste the sweat from here as he begins to rub at his own body. The moment his cocktip touches the pile of steaming meat, and crust, and cheese, he pushes it all the way in, moaning loudly as he reaches for Kemp. He grasps the otter around the back of the head and tugs him against his ample chest, burying Kemp's lusty face in those gorgeous, chubby pecs. \n\nKemp's noises grow increasingly full of his desire as he nears his orgasm.\n\n\"Hnnnrk... and to think I was actually gonna eat this little slut...\" Snagg says, pounding loudly at the sloppy mess, the wet noises spreading through the whole of the cavern as the bull tries to ignore what is happening.\n\nThe grease dripping from Kemp's nuts begins to pool underneath them, and together the two slam dicks together inside of their pizza. In their lust, their cocks surely must have been bumping and grinding together hard inside that goopy mess, you're sure of it, and it isn't long before their display seems to be coming to an end. The drunken pair are reduced to grunts and groans, and their tongues have long since invaded each other's mouths. They make out as they plow the pizza, devolving into a mass of grease and cheese and sauce and saliva and...!");
			addChoice("And~?", violetMeteoriteExplore.bind("pizza8"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza8") {
			append("Kemp grits his teeth and forces his hips all the way against their luscious food-fuck, his balls convulsing as they pour his hot seed into the mess, cumming hard into the warm, porous crust— as if things weren't wet and sloppy enough already. He reaches one hand down to gather some of the cheesy goodness, and returns to rubbing it over his ass, prolonging his orgasm. But Snagg isn't quite done, and as he nears his own orgasm, he grabs Kemp's smaller body and squeezes it in a bear hug, using him to pin the slop between them so he can finish. His big, round ass weighs both of their hips down as he pushes Kemp to the rock and buries him beneath his larger body, hips jackhammering with extreme lust.\n\nHis mouth is hanging open, the zig-zag of his sharp teeth broken only by that lolling tongue as his eyes roll upward... he's about to cum, too.\n\nYou can hear Kemp trying to say something, but it is too muffled under the bigger body to make out. Snagg cums hard and jams himself up against the otter twice as his juices join the rest, hot "+(isActive("Mood Ring")?getMood("Snagg")+"cum":"white")+" gushing into the gooey cheese. He finishes, rolls off, and lays there, panting, his crotch covered in his own sins as he stares up at the roof of the cavern.\n\nKemp stumbles drunkenly to his feet and looks around.");
			addChoice("Over here~! (Wave.)", violetMeteoriteExplore.bind("pizza9"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza9") {
			append("He finally notices you, tossing a grin and a sheepish wave. A little cheesy cum bridges between his fingers.");
			addChoice("Step into the water.", violetMeteoriteExplore.bind("pizza10"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza10") {
			data.kempPizzaCock = false;

			append("The water's warm and clear when you step into it, and you can feel the bubbles swarming about your flesh, tickling your legs.\n\n\"I thought that was you, hah,\" the stoned otter chimes, and he reaches under the box to pull out a fresh, unfucked slice of pizza.\n\n\"Hey! You hid—\" Snagg starts, but Kemp cuts him off:\n\n\"I just saved "+data.playerName+" a slice, brah. Could never leave "+pickByGender("him", "her", "em")+" hangin after a show like that.\"\n\nHe approaches you with the slice in hand, taking a second to make a disgusted face as he plucks the one remaining pepperoni from it and flings it over to Snagg, where it plops lightly against his cheek, sticking there. His tongue snakes out, licking it from himself, as he licks his lips as well.\n\n\"I'm hungry,\" he rumbles.\n\nKemp shrugs. \"Then go eat your pizza.\"");
			addChoice("Awww. Thanks Kemp.", function() {
				if (data.hasBoth) {
					violetMeteoriteExplore("pizzaCockChoose");
				} else {
					if (data.hasCock) data.kempPizzaCock = true;
					if (data.hasCunt) data.kempPizzaCock = false;
					violetMeteoriteExplore("pizza11");
				}
			});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizzaCockChoose") {
			append("\"No prob.\" He toys with the slice, licking it, dragging it over your inner thighs. \"Where you want this~?\"");
			addChoice("Up my cunt, of course.", function(){
				data.kempPizzaCock = false;
				violetMeteoriteExplore("pizza11");
			});
			addChoice("On my cock. Now.", function(){
				data.kempPizzaCock = true;
				violetMeteoriteExplore("pizza11");
			});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza11") {
			append("\"You got it.\"\n\nHe begins teasing your "+(data.kempPizzaCock?"cock":"cunt")+" with one hand while he looks up at you with that same shit-eating grin from before. He seems ready to have some fun with you, too, even after his recent pizzafuck cavalcade; his cock's already straining against its refractory period, dripping sauce from its half-hard length. Once he knows you're good and ready, he takes the triangular slice and slips it underneath your engorged "+(data.kempPizzaCock?"cock, pressing the cheesy surface against you, letting it sink around your balls and the underside of your shaft, creating a dick-shaped divot in the slice.":"cuntlips, the cheese oozes immediately between your folds and the warmth of the sauce penetrates to the very core of your needy pussy. He rubs at you with two fingers, spreading the greasy mess along the insides of your lips."));
			addChoice("Unf... that's warm...", violetMeteoriteExplore.bind("pizza12"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza12") {
			append("\"Oh you don't gotta tell me...\"\n\nThe heat begins to seep into your body. The pizza is hotter than the springs, even, and it sinks into the center of your "+(data.kempPizzaCock?"sack, warming your very seed itself as he begins to slide it back and forth. His snout nears your head. He gives you a little kiss, then slowly wraps his lips about the tip of your cock, sucking on it hard. As he does so, he slurps some of the cheese from underneath the slice, using it as lube as he rolls his tongue around your head. The saucy, gooey goodness is indescribably slippery, better than astroglide. He begins to work everything back and forth, curling his hand and the pizza around your thick shaft, pumping it against your cock as he jerks you with the food.\n\nHe seems to get really into it, fondling his own balls as he begins to slurp at you harder, his squeezing cock sleeve of a throat wrapping about your shaft. He goes down further. You can feel the soft crust pushing up between your cheeks as he rubs one finger through your crack, pressing warm bread to your hole, the distinct mixture of rough and slippery playing with your senses.\n\nAfter awhile of jerking you off with a slice of pizza whilst sucking your head, he lifts the slice up, and lets the toppings dribble off onto your cocktip, where he proceeds to slam his otter muzzle all the way over you, devouring your greasy dick in one fell swoop, until you can feel his whiskers brushing your abdomen. He repeats this, pulling all the way back, then ramming you down his throat again.\n\nHis throat convulses around you, milking you of your seed. He swallows greedily at your thick, delicious spunk. Pulling back, he lets it keep coming, filling first his throat, and then his mouth, as it pools up and he tilts his head back to let it show, lightly pointed otterteeths framing the lake of semen on his tongue before he closes his mouth and swallows hard.":"cunt. His fingers curl into you, spreading your waiting cunt to receive its gift of the saucy, liquid mess from the toppings, and he holds up the slice, letting it all slide off into your waiting hole. He lowers the remains of the slice into his mouth slowly, munching the crust greedily as he fingers you.\n\nWhen he's done with his snack, he licks his lips hungrily and looks over your messy pussy. He clamps his muzzle square over it and begins to devour your pizza pussy with vigor. His tongue rolls all along your lips, lapping up the cheese and the sauce. Eventually, he pushes it inside of you, and you can feel the warm, thick mess joining his tongue within your confines as he prods the tip of his tongue up against your inner walls. His eyes are half lidded when he looks up at you, hands on each of your thighs, parting you for his work as his whiskers brush all along your flesh.\n\nHe's good. Oh, he's good. His tongue pumps in and out of you with extreme skill, lapping you like a pool of water, spreading that warmth and grease within you. The hot breath from his nose is rolling right along your clit when his pace speeds up and he starts tongue-fucking you hard enough to dislodge oopy goopy cheesebubbles, the rough surface of his tongue sliding all along the top of your pussy as he seeks to torture your clit and the inside of your hole at the same time.\n\nBy the time you break, cumming "+(isActive("Mood Ring")?getMood("You")+"jizz ":"")+"into his mouth, he's all too eager to lick it up with the same drunken enthusiasm as before, uncaring as you pull his head closer, stuffing your pussy greedily into his awaiting maw. He swallows all of your prime lady-juices in one gulp like an exquisite beverage."));
			addChoice("Ahh... wind down.", violetMeteoriteExplore.bind("pizza13"));
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "pizza13") {
			append("\"Aaahhh,\" he breathes, soft and satisfied. He slumps back on the rock and rides out the spins of his high, transported to a little world in his head made of dripping, cheesy bliss.\n\nFrom behind Kemp, you can see Snagg as he waits, poised over the fucked-to-death pile of lumpy pizza toppings and destroyed crust, licking his lips with a conflicted expression of both extreme greed and extreme disgust.\n\n\"It's just cum,\" he mutters to himself, and as he slowly begins to dig into the piled mess, his face seems every bit as lustful as it was when he was actually making the mess. He strokes his cock for his own round two as he digs in, eating up the cheese and "+(isActive("Mood Ring")?getMood("Kemp"):"")+"cum together, bathing his long tongue in the salty goodness.\n\nThe bull is nowhere to be found.");
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "ExploreProlapse") {
			append("Oh shit! There's a big dirty picnic up ahead!!\n\n... Oh wait... no... it's <!i>really<!i> dirty...");
			addChoice("Investigate.", violetMeteoriteExplore.bind("prolapse1"), {kinks: ["Art", "Toddler", "Scat"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse1") {
			append("Are you really sure? It's nasty. And kinda cute.\n\nBut mostly nasty.");
			addChoice("Sounds perfect.", violetMeteoriteExplore.bind("prolapse2"), {kinks: ["Art", "Toddler", "Scat"]});
			addChoice("I'll move along if I'm uncomfy. Lemme see.", violetMeteoriteExplore.bind("prolapse2"), {kinks: ["Art", "Toddler", "Scat"]});
			addChoice("Alright, nevermind. Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse2") {
			data.yeenButtholeFuck = false;
			data.yeenCuntFuck = false;
			data.yeenBJ = false;
			var s:MintSprite = addSprite("assets/img/effect/violetPool.png");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "");
			append("There's some hyena toddler\ntriplets playing in a kiddy pool.\n\nIt's not water.");
			//Choose butt, cunt, or cock
			//Then choose boy, girl, or herm
			//addChoice("Investigate their buttholes.", violetMeteoriteExplore.bind("prolapse3butts"), {kinks: ["Female", "Intersex", "Male"]});
			//addChoice("Investigate their cunts.", violetMeteoriteExplore.bind("prolapse3cunts"), {kinks: ["Female", "Intersex"]});
			//addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse3butts") {
			data.yeenButtholeFuck = true;
			append("\"Hey! Give it back, yeenslut!\"\n\nThe herm stole her sister's vibrator, put it in her maw, and started swimming around as fast as possible, her arms and legs throwing out centripetal-force shitwads as she circles the pool. She's making such professional-sounding motorboat noises that you're certain she's practiced on her mother's tits before.\n\nThe boy stands near the edge, so you get a look at his butt first. It's petite and porcelain, coated with sunny fur, and there's a slimy undercarriage of shit to it. A grundle, if you will, hanging in soupy chunks just below the pucker.\n\nHe looks over his shoulder, blushes at you, and peels his shitty asscheeks apart.");
			addChoice("Prolapse him.", violetMeteoriteExplore.bind("prolapseBoy"));
			addChoice("Next.", violetMeteoriteExplore.bind("prolapse4"));
			addChoice("Alright, nevermind. Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse3cunts") {
			data.yeenCuntFuck = true;
			append("You stroll up to the side of the pool and coax the toddlergirl into standing with her legs spread, leaning back slightly, and yanking her shit-clogged cunt open for you to inspect; which is to say you do absolutely no coaxing at all, because the second you look even slightly interested in her pussy, she's already flaunting it.");
			addChoice("Prolapse her.", violetMeteoriteExplore.bind("prolapseGirl"));
			addChoice("Next.", violetMeteoriteExplore.bind("prolapse4"));
			addChoice("Alright, nevermind. Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse4") {
			if (data.yeenButtholeFuck) {
				append("The girl catches her sister and pins her down, grinding a mushy layer of shit between her tummy and the herm's lower back, her gaped puss slobbering oil all over those fat yeentestes.\n\nShe jams three brown fingers deep into the herm's mouth. \"Got it.\"\n\n... After a <!i>very<!i> long pause, she unplugs her vibrator and slips it right back up her cunt.\n\n\"The other one's free,\" she says sweetly, tugging her loose little donut open with two fingers to show you how easily it could be molested if you had the notion.");
				addChoice("Prolapse her.", violetMeteoriteExplore.bind("prolapseGirl"));
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			}

			if (data.yeenCuntFuck) {
				append("You ignore the little girl so desperately showing off her pussy and sniff out the secret pussy instead: the one hiding just below a fat hermcock, nestled deep between two toddler thighs.\n\nThe herm is about 10% less slutty. She doesn't spread her cunt for you, but she does cram three shit-slick fingers inside it and whisper \"Ever fuck a toddler so hard her cuntflesh falls out~?\"");
				addChoice("Prolapse her.", violetMeteoriteExplore.bind("prolapseHerm"));
			}
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse5") {
			append("The herm pouts by the edge of the pool. \"So close... I was just about to swallow it, too...\"\n\nShe leans back over the squishy blue kiddy pool's edge, exposing the entire front of her little body as it drips with shit and piss, nodules running down the crooks where her thighs meet her torso and <!i>plopping<!i> down onto the divot of her fucked-open pucker.");
			addChoice("Prolapse her.", violetMeteoriteExplore.bind("prolapseHerm"));
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapseBoy") {
			append("You let his sisters bicker in the background. You have eyes only for his tiny ass.\n\nFirst you "+pickByGenitals("dunk your dick in the pool, one two three, til it's nice and lubed with warm shit. Then you bring it down to his ass, hotdogging him (to smear some of it over that sexy todgrundle of course) and lining up the tip...", "scoop up a handful of warm, squishy shit and make him smell it. He inhales right to the tippy top of his lungs, snout nearly buried in the pile. Then you bring it down, letting some dribble along his spine and the small of his back, until your shitty knuckles are pressed firm between his cheeks.", "dunk your dick in the pool, one two three, til it's nice and lubed with warm shit. Then you bring it down to his ass, hotdogging him (to smear some of it over that sexy todgrundle of course) and lining up the tip...")+"\n\nHis sisters stop bickering and look on jealously now. The herm strolls up with a vindictive look in her eyes. Her paws make intimidating little shit-splashes. She looks her brother in the face. She turns around. She bends, lowers her hips. And... plugs his snout right up between her pudgy asscheeks.\n\nYou ram inside in one push. He screams into his sister's ass just as she grunts and looses a stream of chunky diarrhea up his nose, blasting the little fucker so deep he starts coughing up hermshit in-between the adorable squeaks caused by your "+pickByGenitals("dick", "fist", "dick")+" as it beats against his prostate.");
			addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapseGirl") {
			if (data.yeenButtholeFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			} else if (data.yeenCuntFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			}
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapseHerm") {
			if (data.yeenButtholeFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			} else if (data.yeenCuntFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			}
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse6") {
			if (data.yeenButtholeFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			} else if (data.yeenCuntFuck) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			} else if (data.yeenBJ) {
				append("");
				addChoice("Next.", violetMeteoriteExplore.bind("prolapse5"));
			}
			addChoice("Next x5.", violetMeteoriteExplore.bind("prolapse6"), {kinks: ["Intersex", "Female", "Abuse"]});
			addChoice("Move along.", violetMeteoriteHub);
		}

		if (which == "prolapse6") {
			addChoice("WIP - Restart", Test.test.bind("devteleportnewscenes"));
		}

		if (which == "ExploreCaves") {
			var pool:Array<String> = ["Ringed Cavern", "Chimerical Cavern", "Layered Cavern"];
			for (it in data.cavesVisited) 
				if (data.cavesVisited.count(it) >= 3 && !data.cavesFinished.contains("Violet Meteorite"))
					pool.remove(it);
			if (pool.length == 0) {
				pool = ["Ringed Cavern", "Chimerical Cavern", "Layered Cavern"];
				data.cavesFinished.push("Violet Meteorite");
				disableExplorable(110);
			}

			var caveName:String = pickOne(pool);
			data.cavesVisited.push(caveName);
			addAction("Spelunk Violet", "The meteorite is wrought with layered, vertical cave systems. The vast majority of them do not have an entrance or exit. The Apothecary does not allow L.L.L. scientists up here.", "Violet Meteorite");
			StaticCallbacks.goCaves(caveName, violetMeteoriteHub);
		}

		if (which == "ExploreMissingPage2") {
			append("Some nymph kids made a paper boat out of a missing page from the Daydream Journal. Two of them push it around the hot spring, laughing and splashing, while the third rolls his eyes and puts his nose back in his novel.\n\nThe page doesn't appear to be damaged by the water at all.");
			unlockJournal("Missing Page 2");
			msg("Found Missing Page #2", true);
			playSound('assets/audio/environment/journalPage');
		}

		if (which == "ExploreMissingPage5") {
			disablePause();
			data.owlGirlEscaped = false;
			var s:MintSprite = addSprite("assets/img/effect/white.png");
			s.alpha = 0;
			unlockJournal("Missing Page 5");
			msg("Found Missing Page #5", true);
			playSound('assets/audio/environment/journalPage');

			append("You bend down for a moment to snatch up a missing page from the Daydream Journal.\n\n");
			addChoice("...", violetMeteoriteExplore.bind("missingpagedown"), {enabled: false});

			timer(3, append.bind("It's a bunch of unreadable code. You can tell that it's heavily nested, but that's about it.\n\n"));
			timer(6, append.bind("Wait.\n\n"));
			timer(8, append.bind("Something's coming down from the sky.\n\n"));
			timer(9, function() {
				append("It's moving really fast...\n\n");
				s.setupAnimated("assets/img/effect/owlGirl.png");
				s.x = GAME_WIDTH;
				s.y = 50;
				s.rotation = -120;
				tween(s, {alpha: 1}, 0.1);
				tween(s, {x: -s.width}, 0.14, {startDelay: 2});
				playSound('assets/audio/environment/owlScream', 'owlScream');
			});
			timer(10, function(){
				append("OH SHIT GET DOWN\n\n");
				clearChoices();
				addChoice("Get down!!", function(){
					violetMeteoriteExplore("missingpagedown");
				});
			});
			timer(11, function() {
				if (data.owlGirlEscaped) return;
				append("AHHHH FUCK HURRY\n\n");
				clearChoices();
				addChoice("Get down!!", violetMeteoriteExplore.bind("missingpagedown"), {enabled: false});
			});
			timer(11.8, function(){
				if (data.owlGirlEscaped) return;
				clearText();
				playSound("assets/audio/environment/birdfly", "birdfly");
				append("OOOOOOHHHHHHHHHHH SHIT\n\n");
			});
			timer(12, function(){
				if (data.owlGirlEscaped) return;
				append("FUCK\n\n");
			});
			timer(12.3, function(){
				if (data.owlGirlEscaped) return;
				append("J"+(data.myntJenga?"ENGA":"ESUS")+"\n\n");
			});
			timer(13, function(){
				if (data.owlGirlEscaped) return;
				append("god DAMN\n\n");
			});
			timer(15, function(){
				if (data.owlGirlEscaped) return;
				append("... You uh... you got destroyed.\n\n");
			});
			timer(18, function(){
				if (data.owlGirlEscaped) return;
				append("<!10px>... That was sick...\n\n<!10px>");
			});
			timer(20, function() {
				if (data.owlGirlEscaped) return;
				violetMeteoriteExplore("missingpagehit");
			});
		}

		if (which == "missingpagehit") {
			var destination:String = "Bright Forest";
			if (Math.random() > 0.5) destination = "Junk City";
			append("... Alright. Okay. You're okay.\n\nWhatever that was just took your face off with its talons. Your body cartwheeled through the air, over the side of the meteorite, and faceplanted in "+destination+".\n\nYou respawn with your face back on, extremely frazzled.");
			addChoice("Fuck...", gotoHub.bind(destination));
		}

		if (which == "missingpagedown") {
			data.owlGirlEscaped = true;
			append("The glitched owlgirl swoops down screaming and tries to take your face off. Her talons just barely graze it.\n\n... She left a few feathers encrusted with glowmoss on the ground here.");
			addChoice("Fuck...", violetMeteoriteHub);
		}
	}
}
