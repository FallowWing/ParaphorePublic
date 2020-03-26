package story;

class Roxelle
{
	public static function roxExplore():Void {
		saveCheckpoint("Roxelle.roxExplore();");
		var canGain:Bool = !pauseIsGoingPrev();
		clear();

		if (data.roxVisits == 0) {
			append("You stumble upon a happy little farmstead tucked into a grove of bus-sized glowberry trees in bloom with thick cyan petals. An old sheepdog watches you from the front porch, snuffling at the scent of glowberry pie as it wafts from a warm-lit window.");

			addAction("Gather Glowberries", "Scour the forest for glowberries.", "Bright Forest");

			addPlace(
				"Roxelle's Farm",
				"A little farm way deep in the forest. Roxelle grows glowcorn and other crops here, with Bert's help.",
				"Bright Forest"
			);

			addChoice("Knock.", roxFirstVisit.bind("none"), {kinks: ["Art", "Intersex"]});

		} else if (data.roxVisits == 1) {
				var mossman:MintSprite = addSprite("assets/img/effect/mossMan.png");
				mossman.layer = Main.HUB_LAYER;
				mossman.onHover = showToolTipOnCursor.bind("???", "");
				mossman.alpha = 0;
				tween(mossman, {alpha: 1}, 0.2);
				tween(mossman, {x: GAME_WIDTH}, 1, {ease: QUINT_IN, startDelay: 1});

				function scatterItems() {
					for (i in 0...6) {
						var incrementer:Float = i*0.1;
						var flipper:Bool = (Math.random()>0.5);
						var berryleaf:String = (Math.random()>0.5?"Glowberry":"Sweetgrass Leaf");

						var itemSprite:MintSprite = addSprite("assets/img/item/"+berryleaf+".png");
						itemSprite.x = 550+25*i;
						itemSprite.y = 200+rndInt(1, 200);
					
						var hitbox:MintSprite = addRectSprite(itemSprite.width*4, itemSprite.width*4, 0);
						hitbox.x = itemSprite.x-itemSprite.width*2;
						hitbox.y = itemSprite.y-itemSprite.height*2;
						hitbox.onHover = showToolTipOnCursor.bind("<!b>x1<!b> "+berryleaf, (Math.random()>0.95?"<!10px>You wanna get high?<!10px>":""));
						hitbox.onReleaseOnce = function() {
							if (canGain) addToItem(berryleaf, 1);
							itemSprite.destroy();
						}

						itemSprite.alpha = hitbox.alpha = 0;
						
						//Spawn Anim
						tween(itemSprite, {alpha: 1}, 0.2, {startDelay: incrementer+1.35});
						tween(itemSprite, {x: GAME_WIDTH-rndInt(50, 500)}, rndFloat(1, 1.2), {ease: QUAD_OUT, startDelay: incrementer+1.35});
						tween(itemSprite, {y: GAME_HEIGHT}, rndFloat(0.8,1), {ease: QUINT_IN, startDelay: incrementer+1.35, onComplete:
							function(){
								itemSprite.destroy();
							}
						});

						tween(hitbox, {x: hitbox.x-rndInt(100, 300)}, 1, {ease: QUAD_OUT, startDelay: incrementer+1.35});
						tween(hitbox, {y: GAME_HEIGHT}, rndFloat(0.8, 1), {ease: QUINT_IN, startDelay: incrementer+1.35, onComplete:
							function(){
								hitbox.destroy();
							}
						});
					}
				}
				scatterItems();
				data.roxVisits = 2;
				append("Gunshots announce Roxelle's Farm before you see any of the glowcorn, or the red barn, or the warm lights, or the shaggy sheepdog licking his nuts on the porch.\n\nSomething mossy scampers away as soon as you approach. It leaves a trail of flora.");
				addChoice("Head around back.", roxDrinking.bind("around back"));
				addChoice("Pet Bert.", roxDrinking.bind("bert"), {kinks: ["Male", "Feral"]});
		} else if (data.roxVisits == 2) {
			if (getPlace("The Floatillery") == null) {
				append("You pass by Roxelle's, but it seems like she's out for now.\n\nMaybe, if you knew the forest a little better, you could guess where she went?");
			} else {

				addSprite("assets/img/effect/mossMan.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "");

				append("You roll up to Roxelle's again.\n\nThat same mossy something is standing on the roof of her house.\n\nHis eyes are two soulless cyan lights; glo-in-the-dark mosses drip from his feet, over the porch, tucking their roots comfortably into every gnarl and crack of the wood. As you look closer you realize he <!i>is<!i> moss.");
				addChoice("Wave hello, keep my head down, and go inside.", roxSecondVisit.bind());
			}
		} else if (data.roxVisits == 3) {
			data.roxVisits = 4;
			roxCouch("intro");
		} else {
			append("She's passed out downstairs.\n\nBert scratches at the locked door.");
		}

		setLocation("Roxelle's Farm");
		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function roxDrinking(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		setLocation("Roxelle's Farm");
		saveCheckpoint("Roxelle.roxDrinking('"+seg+"');");

		//Dual entry points
		if (seg == "bert") {
			append("You rub Bert's shaggy belly. He flops around like a lunatic and wiggles his hips all suggestively, attempting to coerce you into petting his nuts. They jiggle audaciously at you and pap against his donut on the backswing.");
			addChoice("Pet Bert's nuts for sure.", roxDrinking.bind("bert2"));
			addChoice("Head around back.", roxDrinking.bind("bert2"));
		}

		if (seg == "bert2") {
			append("You curl a loose fist around his tiny sack, squeezing playfully. He starts whining and panting like he's getting bred by an alpha, and doggycum splurts into his fur.");
			addChoice("Good boy.", function() { append("\n\nHe whiiiiines~"); }, {oneTime: true});
			addChoice("Lick it up.", function() { append("\n\nYou press your lips to the soft, much less shaggy fur on his belly, slurping the fresh doggycum. He reacts like any dog would while getting their belly stroked, tongue or no, and blisses right the fuck out."); }, {oneTime: true});
			addChoice("Bad boy.", function() { append("\n\nHe whiiiiiii<!b>iiines~!!<!b>"); }, {oneTime: true});
			addChoice("Head around back.", roxDrinking.bind("around back"));
		}

		if (seg == "around back") {
			append("Rox shoots beer cans off a fence in her backyard. Her stance is wide. Ass out. Her pristine loop-de-loop apron tie has found its way into her buttcrack.\n\nShe's firing a taut little pistol made of reclaimed junk metal. Downrange, the remaining beer cans are peppered with green tranquilizer needles. She fires, and another one pierces aluminum.\n\n\"Don't live 'way out in the boonies' by choice, yuhkno...\" she slurs to you over her shoulder. \"But since I dewww... I better anpicitate the dangerrrs.\"");
			addChoice("Rogue nymphs?", roxDrinking.bind("nymphs"));
			addChoice("The Grassy Ghoul?", roxDrinking.bind("ghoul"));
			addChoice("You're drunk.", roxDrinking.bind("drunk"));
			addChoice("What dangers?", roxDrinking.bind("whatdangers"));
		}

		if (seg == "nymphs") {
			append("\"Nuh, nuh... they're good guise... they fly around and keep the pease...\"");
			addChoice("Really gotta get those peas kept, yup.", roxDrinking.bind("drunk"));
			addChoice("You're drunk.", roxDrinking.bind("drunk"));
		}

		if (seg == "ghoul") {
			append("\"Exagtly.\"");
			addChoice("You're freakin me out a little bit.", roxDrinking.bind("drunk"));
			addChoice("You're drunk.", roxDrinking.bind("drunk"));
		}

		if (seg == "drunk") {
			append("She puts the gun down on its side, barrel pointed away, and flicks on the safety. She looks at you with one eyelid half-closed and her tail swishing bashfully. The little tuft on the end keeps dipping into the mud, but she's way too wasted to notice.\n\n\"Surry. I'm bein irresponsibullll.\"");
			addChoice("You okay? You look a little pale.", roxDrinking.bind("drunk2"));
			addChoice("It's fine. You shouldn't work a firearm while you're drunk, though. What are these dangers?", roxDrinking.bind("whatdangers"));
		}

		if (seg == "drunk2") {
			append("She scratches her ass. \"O ya. I can keep it together after a bottle or three. I'm a perfessional.\"");
			addChoice("I saw something when I rolled up to the farm.", roxDrinking.bind("archie"));
		}

		if (seg == "whatdangers") {
			append("\"Yuh just saw one.\"");
			addChoice("Archbishop?", roxDrinking.bind("archie"));
		}

		if (seg == "archie") {
			append("\"The Moshman. The Grashy Ghoul. Archbishup. He's somethin...\"\n\nShe pauses to burp and sit her fat ass down on the grass. She clearly enjoys the feeling of dewy sweetgrass stalks grinding against her taint.");
			addChoice("How do we know he isn't still around?", roxDrinking.bind("archie2"));
			addChoice("Is that so... Look around.", roxDrinking.bind("archie2"));
		}

		if (seg == "archie2") {
			append("You both peer around the edges of the clearing. Skinny trees lean against each other. Behind them there's a million tiny glowing dots: glowberries. Any two of those could actually be eyes.\n\n\"He lives here. He built this farm for his pet, back when he used to have a light on indoors. I just boughtit cause I was partyin too much to maintain minezz... zzzzzz...\"\n\nShe passes out.");
			addChoice("Jeez.", roxDrinking.bind("archie3"));
			//addChoice("Take the gun.", roxDrinking.bind("archie4"));
		}

		if (seg == "archie3") {
			append("Jeez, you say to yourself, standing alone in the murk of the forest.\n\nYour voice dies among the quiet trees.\n\nIt's probably just a branch bending in the wind, a feral trotting past, or your imagination, but two glowberries are blinking at you from just behind the closest tree.\n\nFor a moment you see a middle-aged, distinctly human player model resurface from underneath the moss.");
			addChoice("Whistle.", roxDrinking.bind("archie3whistle"), {kinks: ["Feral"]});
		}

		if (seg == "archie3whistle") {
			append("Bert comes bounding around the side of the farmhouse and barks at them until they go away. Then he runs into the darkness and chases after it.\n\n(You think he picked up the habit of chasing intimidating things into the forest because he usually pisses off something with a big dick.)");
		}

		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function roxCouch(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		setLocation("Roxelle's Farm");
		saveCheckpoint("Roxelle.roxCouch('"+seg+"');");

		if (seg == "intro") {
			unlockJournal("Rox couch");
			append("A wind rolls down off the meteorite and "+(data.hasBoobs?"makes your tits flap around wildly":pickByGenitals("chills your bone to the bone", "makes your buttcheeks flap around wildly", "chills your bone to the bone"))+". You brace yourself against tree trunk after tree trunk, hobble forward with your head down, and push through the gale. Random shit flies out of the forest and almost knocks you over, including a couple nymphs, but you keep pressing on until you catch sight of a miraculous light in the distance. It winks at you through a mini-tornado of leaves and glowberries.\n\nIt's Roxelle's farm. Her glowcorn stalks are bent flat to the ground in the whipping winds. You bang on her door with a clenched fist and hope she isn't too drunk to answer.");
			addChoice((data.playerName.toUpperCase() == "GALAXY WIZARD"?"LEMME IN I'M THE GALAXY WIZARD OF OZ NOT FUCKIN DOROTHY OVER HERE":"LET ME IN ROX!!"), roxCouch.bind("1"));
		}

		if (seg == "1") {
			append("The door flies open and hits you in the face. Rox shouts an apology over the constant, ear-splitting WOOOOOSH and hauls you in by your "+(data.hasBoobs?"chilly tits":pickByGenitals("dick and balls", "makes your ass", "dick and balls"))+", which just happens to be the best handle on you, from her angle, totally not intentional.\n\nYou flop onto the hardwood floor, panting. You can't feel your nose or your fingers.\n\nBert the sheepdog trots up and sniffs you, concerned. Your face is bright red, and your buttcheeks, and your fingertips... every extremity on your body quivers with the fiery tickle of numb flesh waking up again.\n\nRox takes one of your hands and smushes it between her warm palms and blows on it. Her breath is thick with the scent of wine.\n\nAn almost painful tingling courses through your fingertips, and you pull back involuntarily. Her expression pinches up with worry.\n\n\"Lemme getcha a blanket,\" she mumbles. She throws open a closet and starts digging through random stuff: recruitment pamphlets, empty bottles, old weaponry, pie ingredients, photobooks of debauchery, tranquiilizer pistols.\n\nShe catches the tongue of a buried blanket and yanks it out; five other things fall out with it, but she doesn't give a fuck. She's had a couple drinks. She states that to you so authoritatively that it doesn't even need quotes. It's not just her dialogue, it's just fact. She's had a couple drinks.\n\nRox wraps the blanket around your shoulders and tucks it in nice and deep between your thighs. It smells like her.\n\n\"There now,\" she says softly. \"Don't mind our shitty basic atmosphere engine. Sometimes it'll knock you on your ass just cause it feels like it.\"");
			addChoice("Ahhhh... thank you, this is so warm...", roxCouch.bind("2"));
		}

		if (seg == "2") {
			append("\"My pleasure.\" She squats down in front of you. Her half-hard cock droops down, and almost touches the floor.");
			addChoice("Handjob, yesss. Warm my fingers up.", roxCouch.bind("3"));
		}

		if (seg == "3") {
			append("\"Ah, already...?\"\n\nYou reach out with both hands, which are sleeved cutely in the blankets, and touch all up on her shaft. You give a special poke to her frenulum, then move down to her nuts, squooshi-squishing those, and totally enveloping your fingers in the complete warmth of her tight, coin-purse nutsack.\n\nShe twitches and inhales through her teeth as you work your frigid digits over her, squeezing, playing with her. Her bare glans twitches just below your chin. A single, shining bead of precum forms in the pit of her urethra. Her cock's constant throbbing tightens the passageway, and forces the little pearl out over time. Soon, it's dripping right down in that triangular crevice where the corona is partially replaced by the shaft (the frenulum) and hangs there.\n\n(Aren't you glad it's me narrating, instead of Protocol~?)");
			addChoice("Time for a cock hug!!!!", roxCouch.bind("4"));
		}

		if (seg == "4") {
			append("The blanket, her body, and heat of the roaring fire in the wood stove still aren't enough to warm your "+(data.hasBoobs?"tits":"chest")+". Your heart's still circulating chilly blood. So... you can't help but scoot forward a little and hug her cock.\n\n"+(data.hasBoobs?"It slides up between your boobs":"It smushes up against your solar plexus")+". It throbs. You squuueeeze it close and rest your chin on her nice flat horse-like cockhead. You lay a few licks down over her tip, suckling on the steady flow of precum.\n\nRox looks down at you like a mother at her newborn child. \"You're so fuckin adorable,\" she whispers.");
			addChoice("Kiss it.", roxCouch.bind("5"));
		}

		if (seg == "5") {
			append("You peel your chin off of her head, leaving a trail of goopy cow pre behind.\n\nYou lower your open lips and run them over the little pre fountain. Your tongue wanders out and slobbers over her slit, too.\n\n\"Alright, alright.\" Rox puts a palm on your forehead and stands up, using you for leverage. \"I'm not gonna facefuck you on my doorstep."+(data.choseBooze?" Our first visit just accelerated way too fast.":"")+" Let's head downstairs and drink a little, why don't we?\"");
			addChoice("Nnnnn. Can I keep the blanket on?", roxCouch.bind("6"));
		}

		if (seg == "6") {
			append("Rox looks down at the sight of your naked, still-shivering body, your perky nipples, your "+pickByGenitals("fat cock and heavy nuts", "smooth cuntlips", "fat cock and heavy nuts")+", all of it covered only by a thin layer of cotton fabric that hugs your curves. Not to mention the fact that her blanket is rubbing its scent off on you, and now you smell like her, almost like she indirectly marked you as her property.\n\n\"Yes.\" Her cock throbs. \"Yes, you can keep the blanket on.\"");
			addChoice("Okay. :3", roxCouch.bind("7"));
		}

		if (seg == "7") {
			append("She leads you downstairs.\n\nIt's a spacious den with a couch facing another fireplace. The walls are brick, and the ceiling's fitted with a bunch of friendly orange pot-lights. There's a bit of moss she couldn't quite get out of the carpet, leftover from your last visit.\n\nRox sits her fat ass down on the couch and creates a small gravitational well that sucks all the other couch cushions in. You fix them up a little and sit down opposite her.");
			addChoice("What kinda drinking game are we gonna play?", roxCouch.bind("8"));
		}

		if (seg == "8") {
			append("She pulls out a half-empty bottle of glowberry wine from between the couch cushions and takes a starter swig. A spark of mischief appears in the back of her eyes.\n\n\"The game I wanna play is called 'two truths and a lie.'\"");
			addChoice("Oh, I've played this.", roxCouch.bind("10"));
			addChoice("I haven't played this.", roxCouch.bind("9"));
		}

		if (seg == "9") {
			append("\"We say three statements. Two of them are true, one of them is a lie. The other person's gotta guess the lie.\"");
			addChoice("Ah, that's easy.", roxCouch.bind("10"));
		}

		if (seg == "10") {
			append("\"Right, but it's in drinking game form. Guess which one's the lie, I swig. Guess wrong, you swig. Ready?\"");
			addChoice("Ready!", roxCouch.bind("11"));
		}

		if (seg == "11") {
			append("\"1. I've owned eleven dogs named Bert.\n\n2. Archbishop used to live here.\n\n3. I fought for Septrica in the war.\"");
			addChoice("1 is a lie.", roxCouch.bind("lie1"));
			addChoice("2 is a lie.", roxCouch.bind("lie2"));
			addChoice("3 is a lie.", roxCouch.bind("lie3"));
		}

		if (seg == "lie1") {
			append("\"Wrong,\" she says. \"You go through a lotta dogs in sixty years.\"\n\nShe feeds you a big sloppy slurp of wine. If you were still chilly somewhere down inside, the burning wine chases it right out of you.");
			addChoice("Shit. Alright, my turn.", roxCouch.bind("rejoinlie"));
		}

		if (seg == "lie2") {
			append("\"Wrong,\" she says. \"He did used to live here. Him and Som and Red's little bunny friend used this as their 'base of operations' for some silly cub schemes, although the bunny was only around for a bit at the end. Fuck knows what they were really up to. Probably orgies.\"\n\nShe feeds you a big sloppy slurp of wine. If you were still chilly somewhere down inside, the burning wine chases it right out of you.");
			addChoice("Shit. Alright, my turn.", roxCouch.bind("rejoinlie"));
		}

		if (seg == "lie3") {
			append("\"Right,\" she says, and throws back a happy mouthful of wine. She wipes her mouth with the back of a hand. \"I fought her. And I put up a good fight.\"");
			addChoice("My turn.", roxCouch.bind("rejoinlie"));
		}

		if (seg == "rejoinlie") {
			append("Rox scratches her nuts and waits for your two truths and a lie.");
			addChoice("1. I live in a bomb shelter.\n2. I'm a guy in my twenties.\n3. My mom and dad left me when I was five.", roxCouch.bind("1player"));
		}

		if (seg == "1player") {
			append((data.knownBombShelter>0?"\"2, obviously.\"":"\"1, obviously.\""));
			addChoice((data.knownBombShelter>0?"How'd you know?":"Nope."), roxCouch.bind("1player2"));
		}

		if (seg == "1player2") {
			append((data.knownBombShelter>0?"\"I've just done some math on how old you must be, to be here, playing this game. Let's not talk about it.\"":"\"Wow what the fuck. You live in a bomb shelter? You're just drop that bombshell outta nowhere?\""));

			addChoice((data.knownBombShelter>0?"Let's.":"I had to tell someone sometime."), roxCouch.bind("lie4"));
		}

		if (seg == "lie4") {
			append("\""+(data.knownBombShelter>0?"Right. So. You've been alone for a long very long time, in that bomb shelter. How... how has that been?":"And you chose me. I'm flattered.\"\n\nShe takes another sip. One too many.\n\n\"Urrrgh...")+"\"\n\nShe's only barely holding on to her motor control, but she still manages to pat you gently on your thigh without spilling the wine everywhere. \"You didn't have to wait or hold it in y'know— you can tell me all about it, the good, the bad, the really fuckin shitty. All of it. Don't be shy. You don't gotta be shy around me, alright?\"");

			addChoice("Alright, thanks Rox. It's been...", roxCouch.bind("plot1"));
		}

		if (seg == "plot1") {
			append("\"It's okay,\" she whispers, massaging your "+pickByGenitals("cockhead", "clit", "cockhead")+" with a few thumbs. Her eyes are almost closed, and her head lolls back, leaning against the spine of the couch. \"And... and tell me to fuck off, if I start distracting you, with this... with my hands... I really am interested in your story, yeah? Not just sex... so much sex, lately... too much...\"");

			addChoice("Well, I'll start from the beginning, without dropping too many other bombshells.", roxCouch.bind("plot2"));
		}

		if (seg == "plot2") {
			append("\"Please.\"");

			addChoice("Alright. Well.", roxCouch.bind("plot3"));
		}

		if (seg == "plot3") {
			append("She waits patiently.");

			addChoice("I was born above-ground, I know that. I only have one vague memory of coming down to the shelter.", roxCouch.bind("plot4"));
		}

		if (seg == "plot4") {
			append("She nods nods nods nods, excited.");

			addChoice("We were at church, one moment— then the next, my mom was dragging me back to our apartment by my wrist, and it really hurt, but she just kept saying 'Oh my god, Oh my god.' And I knew it was an emergency.", roxCouch.bind("plot5"));
		}

		if (seg == "plot5") {
			append("Rox leans in, engrossed.");

			addChoice("There was a big gray meteor in the sky, with red and orange blisters around the edges. Craters, I mean.", roxCouch.bind("plot6"));
		}

		if (seg == "plot6") {
			append("\"Like ours.\"");

			addChoice("Yeah. I was screaming and yelling at my mom, at the time, because I knew about this shelter and I wanted to go there, and as we left the church everyone said we had to go there, too. Yet we were headed for our apartment. She said 'I just need one thing.' She got stuck in loops like that for a week after, switching between 'Oh my god' and 'I just need one thing' and 'I hope she's okay.' I thought 'she' meant me.", roxCouch.bind("plot7"));
		}

		if (seg == "plot7") {
			append("\"Oh.\"");

			addChoice("The reason we went back to our apartment first, the one thing mom needed, and the 'she' that mom hoped was okay: that was her computer. Even though I was only five, I remember thinking, wow, my mom loves World of Warcraft more than she loves me.", roxCouch.bind("plot8"));
		}

		if (seg == "plot8") {
			append("\"But that was... aren't we...\"");

			addChoice("Yeah.", roxCouch.bind("plot9"));
		}

		if (seg == "plot9") {
			append("...");

			addChoice("She was saving Mynt.", roxCouch.bind("plot10"));
		}

		if (seg == "plot10") {
			append("(Oh, Wendy... I miss you...)\n\nRox guffaws. \"And don't forget us loveable islanders, Mynt's gross, fetishy underbelly!\"");

			addChoice("Ah yeah. I guess she might've been saving you guys, too.", roxCouch.bind("plot11"));
		}

		if (seg == "plot11") {
			append("Rox settles in to a comfortable "+pickByGenitals("handjob, dragging her fingers luxuriously up and down your shaft", "fingerfuck, gently tucking one or two digits up your cunt and twisting them in a smooth rhythm", "handjob, dragging her fingers luxuriously up and down your shaft")+". \"Mmmmn,\" she hums to herself. \"What happened next? You and this computer both made it down to the shelter, obviously.\"");

			addChoice("Yeah. That first day wasn't so hard. It was exciting, even! I had spent most of my life just in that tiny apartment, with Mom, but now I was in a brand new place, surrounded by adult friends from church. And dad was there, too. I never got to see him, before. Now I was sleeping just across the hall from him!", roxCouch.bind("plot12"));
		}

		if (seg == "plot12") {
			append("Rox makes a motherly grumbling noise. \"I'm not so excited about sleeping just across from your dad's creepy, infected player model.\"\n\nShe casts a sideways glance at the stairs that lead up to the main floor of her farmhouse. Her ears perk up, like she heard a soft, squishy footstep. She stops moving her hands, and your "+pickByGenitals("cock droops to a half-chub between her fingers", "pussy starts to feel a little neglected", "cock droops to a half-chub between her fingers")+".\n\n\"We locked the front door, didn't we?\"");

			addChoice("It's probably just the wind. Anyway, me and my father, it was always kind of a—", roxCouch.bind("plot13"));
		}

		if (seg == "plot13") {
			append("\"Shhh.\"\n\nShe gets up, stumbling drunkenly. \"I think I hear Archie. We locked the front door, didn't we?\"");

			addChoice("I don't remember. I don't think Mynt even described the door shutting.", roxCouch.bind("plot14"));
		}

		if (seg == "plot14") {
			append("You don't hear anything.\n\nBut Rox stands there, cock twitching, nose twitching, and gives the ceiling snake-eyes. She's trying to keep her balance, but every couple seconds she has to catch herself and reposition so she doesn't just fall right over in her drunken state.\n\nThis goes on for almost three straight minutes while she stares from the ceiling to the stairs and back. \"You gotta be really careful about him,\" she tells no one in particular. \"Something about his behaviour... not normal... potentially being controlled... Sep...? No... a third party... a third... narr—\"");

			addChoice("Rox, are you okay? If the mossy man shows up again, we'll just run, like we did last time. Just relax. Sit back down.", roxCouch.bind("plot15"));
		}

		if (seg == "plot15") {
			append("She looks back at you, blinking. \"Wuh? Oh. Yeah. Sorry. What? Right. Drinking game. My turn.\"\n\nShe sits her fat cow ass back down, eyes still on the stairway. Their lighting comes mostly from the kitchen, so if a shadow were to appear at the top of the stairs, she'd see it plastered on the wall.");

			addChoice("Well, we were taking a break from the drinking game so I could tell you what it's been like, living in here.", roxCouch.bind("plot16"));
		}

		if (seg == "plot16") {
			append("\"Oh, duh... sorry... right...\"\n\nShe takes another swig, just to calm her nerves.\n\n\"It's just to calm my nerves,\" she states unnecessarily.");

			addChoice("Here. Listen close, and it'll help you feel better, cause this next part was the best time of my life.", roxCouch.bind("plot17"));
		}

		if (seg == "plot17") {
			append("She's listening.\n\nA reluctant smile bubbles up to the surface of her face, and she forces herself to stop staring at the staircase.");

			addChoice("I felt so safe. It was me, mom, dad, Cade, Mikey J, and a couple other people, all living in this tiny, dingy red hole in the ground. We had food and water rations to last all ten of us for six and a half years, plus a power network and a battery bank that'd last for up to seventy years. Mom even installed a reserve power mode, where almost everything but the oxygen system gets turned off.", roxCouch.bind("plot18"));
		}

		if (seg == "plot18") {
			append("\"Musta been reassuring,\" she purrs, and allows her hand to wander back over your thigh...");

			addChoice("It felt like a little village.", roxCouch.bind("plot19"));
		}

		if (seg == "plot19") {
			append("\"Yeah? The cramped space didn't bug you?\"");

			addChoice("Nah, I grew up in an apartment.", roxCouch.bind("plot20"));
		}

		if (seg == "plot20") {
			append("\"Ahhhh~\" Rox nods knowingly. \"I know exactly what you mean. I spent a lot of years in an Apothecary cell, and now I don't mind ~tight spaces~ in the least. Anyway— you said this was the best time of your life?\"");

			addChoice("Yes. I was perfectly happy down there. I talked with my dad a TON! <3 But just having someone to talk to so often, that was great. I couldn't always talk to my mom, because she was on the computer so much.", roxCouch.bind("plot20a"));
		}

		if (seg == "plot20a") {
			append("\"Moms are the best~\" she purrs, groping her fat tiddies.");

			addChoice("Fuck yeah moms. <3 Noontime on Sundays, when we'd all sit together in the prayer room, and she would put me on her lap and tuck my hair behind my ears and whisper jokes, or tell me little stories... that was great, too. Now I know she was distracting me from what she thought was dad's religious brainwashing. I didn't know or care at the time. It was more attention than I had ever received when we lived together at the apartment, and I loved it", roxCouch.bind("plot21"));
		}
		if (seg == "plot21") {
			append("...");

			addChoice("It wasn't all stories, though. One time she took me up the stairs to see the big metal door that lead to the outside. She told me 'past that door, there's a cycloptic ball of rock that might kill you.' I said she was crazy. I brought up Santa and the easter bunny. But she said no— it's real. It's out there, and it's looking for us, and we don't know why. We had to hide from it, no matter what.", roxCouch.bind("plot22"));
		}

		if (seg == "plot22") {
			append("Rox stifles laughter.\n\n\"That's some heavy shit to lay on your kid all at once.\"");

			addChoice("Oh I was fucking mortified. You don't just tell a five-year-old that there's a giant one-eyed monster looking for them outside their back door.", roxCouch.bind("plot23"));
		}

		if (seg == "plot23") {
			append("She holds back more chuckles, covering her mouth with the same "+pickByGenitals("pre-cummy hand she just stroked your cock with earlier. She accidentally slathers your pre over her lips", "hand she fingered you with earlier. She accidentally wipes a little cuntjuice over her lips", "pre-cummy hand she just stroked your cock with earlier. She accidentally slathers your pre over her lips")+".\n\n\"Well, some mothers in here say similar things to their kids...\"");

			addChoice("What?... Oh, I get it.", roxCouch.bind("plot24"));
		}

		if (seg == "plot24") {
			append("\"Go on. You were mortified.\"");

			addChoice("Yeah. I was clutching mom, crying. She carried me back down the shelter stairs, in her arms. Always kept herself between me and the scary door. Back in our room, she undressed me. Got me suited up in my jammies. And then she hugged me, and kissed me goodnight on my cheek, and pulled me into bed with her. I remember snuggling up super duper tight and asking her if there was any possible way the eyeball meteorite could come inside and get me.", roxCouch.bind("plot25"));
		}

		if (seg == "plot25") {
			append("...");

			addChoice("And she said no.", roxCouch.bind("plot26"));
		}

		if (seg == "plot26") {
			append("...");

			addChoice("There was no possible way.", roxCouch.bind("plot27"));
		}

		if (seg == "plot27") {
			append("...");

			addChoice("As long as I stayed inside, she told me, I would be safe.", roxCouch.bind("plot28"));
		}

		if (seg == "plot28") {
			append("... \""+(data.knownBombShelter>0?"But didn't you... earlier... you said your parents left when you were little.":"Where's your mom now?")+"\"");

			addChoice("Yeah. She had to leave.", roxCouch.bind("plot29"));
		}

		if (seg == "plot29") {
			append("\"Why?\"");

			addChoice("We're getting off-topic again. Let me just finish telling you how I've been doing since then.", roxCouch.bind("plot30"));
		}

		if (seg == "plot30") {
			append("\"Right...\"");

			addChoice("After everyone left, I played with the oxygen system a lot. It made me feel funny. And it was a great way to pass the time. There was also a bit of glue and stuff in mom's toolbox. That was a great way to pass the time, too.", roxCouch.bind("plot31"));
		}

		if (seg == "plot31") {
			append("Rox looks uncomfortable. She sets her wine down on the table.");

			addChoice("Years passed. At some point I tried to quit and focus on learning to read, but then I stopped again. Sleeping was easier.", roxCouch.bind("plot32"));
		}

		if (seg == "plot32") {
			append("\"Inhalants, oxygen deprivation... how... how many years...?\"");

			addChoice("I don't know.", roxCouch.bind("plot33"));
		}

		if (seg == "plot33") {
			append("\"I think this might be a little bit too personal for me. It's not that I don't want to know how you've been, but...\"");

			addChoice("I'll leave out a lot of the darker stuff, maybe?", roxCouch.bind("plot34"));
		}

		if (seg == "plot34") {
			append("\"Nah.\" She wipes your juices off of her hand. \"I'm good.\"");

			addChoice("Alright. Sorry, I didn't mean to upset you.", roxCouch.bind("plot35"));
		}

		if (seg == "plot35") {
			append("She leans forward, smushing her big cow tiddies up against your chest, and plants a wet smooch right on your mouth. Her tongue even slips inside, just for a moment. She pulls back with a small gasp. The chocolate-coated watermelon flavor of glowberry wine still remains on your lips.\n\n\"It's fine. I asked.\"\n\n She wipes your juices off of her hand. \"I'm good, now. Let's get back to the game. My turn?\"");

			addChoice("Yep.", roxCouch.bind("lieStart"));
		}

		if (seg == "lieStart") {
			append("\"Lessee here...\n\n1. My biggest fear is that I'm not real.\n\n2. I love Mynt.\n\n3. I love you.\"");
			addChoice("1 is a lie.", roxCouch.bind("lie5"));
			addChoice("2 is a lie.", roxCouch.bind("lie6"));
			addChoice("3 is a lie.", roxCouch.bind("lie7"));
		}

		if (seg == "lie5") {
			append("\"Righto,\" she chirps, and swig-swig-swig-swiiiigs away...\n\nHer belly's looking a little full, at this point. She catches you looking and runs a hand over it, groping over her smooth belly button... it's so sensual, her cock can't help but straighten up to full hardness in an instant and <!i>thwap<!i> against her stomach, jiggling it.\n\nShe peels the bottle off her lips and exhales. \"Ahhhhhhh. Fuck that's good. Those Floatillery boys really put their sweat and tears into this stuff...\"");
			addChoice("Are you just not even gonna acknowledge what you said.", roxCouch.bind("lie5a"));
		}

		if (seg == "lie5a") {
			append("\"What?\" Rox blinks at you, playing with one of her tits as a thin blue strand of glowberry-stained saliva droops down onto its squishy, soft boobmeat. \"Oh, what? I was just trying to give ya an easy one... course that was the lie. I love you and Mynt, and I don't care if I'm real or not. Who gives a fuck? I sure didn't ask to exist or not-exist or whatever this is. I just woke up here. Not my fault, not my problem.\"");
			addChoice("Mmm. You're pretty tough, Rox.", roxCouch.bind("lie5b"));
		}

		if (seg == "lie5b") {
			append("She blushes and winks at you, stroking her long, powerful cock. \"Thanks. I know.\"");
			addChoice("Okedoke. My turn now.", roxCouch.bind("rejoinlie2"));
		}

		if (seg == "lie6") {
			append("\"Wrong,\" she says. \"More wronger than you ever coulda been. I love that little kitten in the sky with my whole fuckin heart. Every single bit of her. Most people forget that she makes this whole thing pawssible, all this—\" burp— \"magic... because that's what it is, y'know... writing, I guess. Narrating. It's magic! You really get to take a chunk of reality, somethin in your memories, or some obtuse, complex code, and you get to... you get to make it <!i>REAL!<!i> People can <!i>FEEL<!i> it after you're through smashin words together! That shit is so amazing to me!!!\"\n\nShe jams the end of the wine bottle in your mouth, holds you by the back of your skull, and tips it up.\n\nWhat was supposed to be a swig turns into a forced guzzle. \"That's it,\" she murmurs, eyes still shining with excitement. She watches the liquid pour down your throat as you glug... glug... glug... glrk... glug...\n\nThen Rox pulls back, sucks your saliva from the rim of the bottle, and feels your belly up a little bit. \"Howzat? You starting to feel good?\"");
			addChoice("Mmnnnf... yeah... my turn.", roxCouch.bind("rejoinlie2"));
		}

		if (seg == "lie7") {
			append("\"Absolutely right, you self-degrading slut. Mama Rox doesn't love you til you get that tight ass up on her cock.\"\n\nShe jams the end of the wine bottle in your mouth, holds you by the back of your skull, and tips it up. You GLRK with surprise, shooting wine out your nose. You thought you were only supposed to drink when you guessed wrong?!\n\nWhat was supposed to be a swig turns into a forced guzzle, and a partial throatfuck with the neck of the wine bottle. \"Just kidding, of course... you're wrong... I love you...\" she murmurs, eyes half-lidded with affectionate, fuzzy feelings. She watches the liquid pour down your throat as you glug... glug... glug... glrk... glug...\n\nThen Rox pulls back, sucks your saliva from the rim of the bottle, and feels your belly up a little bit. \"Howzat? You starting to feel good?\"");
			addChoice("Mmnnnyeah~! Feelin alright... my turn.", roxCouch.bind("rejoinlie2"));
		}

		if (seg == "rejoinlie2") {
			append("Rox runs a couple fingers down her shaft, squeezes hard on her nuts, and waits for your two truths and a lie.\n\nHer eyes keep flicking over to the bottle... she's keen to win this one.");
			addChoice("1. The shelter power is running out.\n2. I secretly despise you.\n3. I only learned how to read a couple years ago.", roxCouch.bind("1player2Hint"));
		}

		if (seg == "1player2Hint") {
			append("\"Fuck, that's a tough one.\" She inhales through gritted teeth. \"Uhhhhhh... hnnnnmmmm... uhhhhm. Can I get a hint?\"");

			addChoice("No, that's cheating.", roxCouch.bind("1player3"));
		}

		if (seg == "1player3") {
			append("\"Fine. One.\"");

			addChoice("Wrong. It was 2, of course. (Feed her a swig.)", roxCouch.bind("1player4"));
		}

		if (seg == "1player4") {
			append("You force Rox to take a dainty little sip from the wine. She needs it, after you dropped that critical plot info.\n\nYou need a sip too. The world turns a little bit to the side on its axis, and a fuzzy excitement sparkles up from the burn in your belly.\n\nRox shakes her head. \"No fuckin way.\"");

			addChoice("Way.", roxCouch.bind("1player5"));
		}

		if (seg == "1player5") {
			append("\"Forgive me, but I don't really wanna... don't wanna think about that.\"");

			addChoice("I understand. Your turn.", roxCouch.bind("1player6"));
		}

		if (seg == "1player6") {
			append("\"Mmmm...\"\n\nShe distracts herself for a while. Then she gets a glimmery, devious look in her eyes and leans in close.\n\n\"1. I wanna hold your hand.\n2. I wanna kiss you on the cheek.\n3. I wanna snuggle.\"");

			addChoice("...", roxCouch.bind("1player7"));
		}

		if (seg == "1player7") {
			append("\"Go on,\" Rox purrs, leaning back with an arm over the couch, stroking herself. \"Guess.\"");

			addChoice("1 is a lie.", roxCouch.bind("1player8"));
			addChoice("2 is a lie.", roxCouch.bind("1player8"));
			addChoice("3 is a lie.", roxCouch.bind("1player8"));
			addChoice("All of the above.", roxCouch.bind("1player8"));
		}

		if (seg == "1player8") {
			append("\"Right. Wow, you're so good at this game!\"\n\nShe takes hold of your chin, thumb on one of your cheeks, forefinger on the other, and squeezes til your mouth opens like a fish. Then she tilts the wine bottle up and drains the rest of it down your mouth. Some slops over your chest, but at some point during your adventures you lost all your clothing, so you can feel the warm wine trickle over your bare "+(data.hasBoobs?"tits":"skin")+"...\n\nAfter eight steady gulps, she finally lets you breathe. You gasp deeply. You clutch at your searhing throat.\n\nRox's hand wanders closer, over the couch cushions... up your thigh... over to your bulging, wine-filled belly.\n\n\"They were all lies,\" she whispers.");

			addChoice("Cheater...! What was the truth, then??", roxCouch.bind("sexIntro"));
		}

		if (seg == "sexIntro") {
			append("Rox lovingly strokes your belly.\n\n\"The truth is: I wanna get you pregnant.\"");

			addChoice("... Oh fuck yes.", roxCouch.bind("roxIntro"), {kinks: ["Pregnancy"]});
			addChoice("Mmm... you could get Bert to do it.", roxCouch.bind("bertIntro"), {kinks: ["Pregnancy", "Feral"]});
			addChoice("Ah, I'm not really into that...", roxCouch.bind("sexAvoid"));
		}

		if (seg == "bertIntro") {
			append("Bert was curled up in peaceful sleep at the base of the couch, but now, at the sound of the word \"pregnant,\" he perks his head up and looks at you.\n\nRox simply pats your lap. In a blur of shaggy white fur, Bert leaps onto it. His cock is already starting to droop down out of his sheath, and you can see the monumental bulge of his knot struggling to expand beneath its fur.\n\nHe puts his forepaws on your shoulders and starts licking your face wildly. His sloppy doggy tongue slips over your lips and nostrils and leaves a coat of saliva behind~\n\n\"Got a cap?\" Rox asks.");

			addChoice("Sure do...", roxCouch.bind("gotCap"), {cost: ["Capsule", 1]});
			addChoice("Hmmm?", roxCouch.bind("whatsCap"));
		}

		if (seg == "whatsCap") {
			append("\"A capsule. Little pink pills that get you pregnant.\"");

			addChoice("Oh! I have one of those.", roxCouch.bind("gotCap"), {cost: ["Capsule", 1]});
			addChoice("Loan me one?", roxCouch.bind("loanCap"));
		}

		if (seg == "loanCap") {
			append("She digs around in the pockets of her apron and scrounges up a single pink capsule. She holds it out to your lips.\n\n\"Say ‘aaaaa,' breeding bitch.\"");

			addChoice("Aaaaaaaa...", roxCouch.bind("eatCap"));
			addChoice("\"Breeding bitch\"?!", roxCouch.bind("breedingBitch"));
		}

		if (seg == "gotCap") {
			append("\"Good. Lemme just go ahead and—\"\n\nShe shoves her whole hand in your inventory and plucks one of your capsules out. You feel violated.\n\n\"Say ‘aaaaa,' breeding bitch.\"");

			addChoice("Aaaaaaaa...", roxCouch.bind("eatCap"));
			addChoice("\"Breeding bitch\"?!", roxCouch.bind("breedingBitch"));
		}

		if (seg == "breedingBitch") {
			append("\"What?\" She smiles. \"My dog's about to fuck you pregnant. If that doesn't make you a breeding bitch, I don't know what does.\"");

			addChoice("... I guess... aaaaaa.", roxCouch.bind("eatCap"));
		}

		if (seg == "eatCap") {
			data.bertPregAss = true;
			append("The pink bean slips down your throat easily, with a little guidance from Rox's fingers. Bert sniffs at your open mouth and licks the cap residue off your tongue. His doggycock is fully unsheathed now, and it throbs against your belly, drooling hot pre. He's really antsy. He jumps up a little and starts dry humping your "+(data.hasBoobs?"tits, and whenever his dogdick thrusts up between them, they jiggle around annoyingly":"chest")+".\n\n\"Bend over,\" she whispers.");

			if (data.hasCock || data.hasBoth) addChoice("Bend over the back of her couch... show Bert my ass...", function() {
				roxCouch("showBert");
				data.bertPregAss = true;
			});
			if (data.hasCunt || data.hasBoth) addChoice("Bend over the back of her couch... show Bert my cunt...", function() {
				roxCouch("showBert");
				data.bertPregAss = false;
			});
		}

		if (seg == "showBert") {
			append("You turn around and hang your arms off the back of Rox's couch. You dig your fingers into the plush, loose fabric.\n\nBert's excited whines wash warmly over the back of your neck. Rox coos something in one of his floppy ears and helps him line his dick up to your "+(data.bertPregAss?"asscrack":"cuntcrack")+", and you feel that sweaty, warm doggycock sliiiide over your bare skin. Beads of his pre coalesce in your pucker.");

			addChoice("I'm ready.", roxCouch.bind("bertPreg1"));
		}

		if (seg == "bertPreg1") {
			append("You nod over your shoulder at Rox. She slaps Bert on his ass and says \"Fuck, boy!\"\n\nIn one joyous, brutal motion, Bert plunges his cock "+(data.bertPregAss?"up your ass":"right to the core of your pussy")+". The top of his knot bangs up against your entrance, but it can't quite fit in just yet.\n\n\"Good booooy~!\" Rox says, scratching him super good behind the ears. \"Wooow, look at you go! Little more now! Little more!\"\n\nBert's so happy he starts drooling over your neck while he pounds you. Sloppy strings of dog saliva run down between your shoulder blades or around the sides of your neck and over your collarbone. Although you're holding onto her couch as hard as you can, Bert's forceful thrusts keep throwing you off balance.\n\nSo Rox grabs you by the hair and holds you in place while her dog rails the fuck out of your "+(data.bertPregAss?"butt":"cunt")+". \"Come on, breed "+pickByGender("him", "her", "them")+",\" she urges him. His knot slips in a little bit more with every thrust. All you can do is hold onto your slippery little fabric handfuls and moan as Bert's paws dig into your shoulder blades and his fat doggy nuts slap against your "+pickByGenitals("own", "vulva", "own")+" so hard you feel like you're gonna topple off the back of her couch.");

			addChoice("Please! Knot me! <3", roxCouch.bind("bertPreg2"));
		}

		if (seg == "bertPreg2") {
			append("Bert has zero clue what you just said, but he can hear the urgency in your voice. To the degree that a feral can know anything, he knows you want his puppies inside you.\n\nHis whines turn to helpless, passionate growls, and he humps your "+(data.bertPregAss?"butt":"cunt")+" like a furry little jackhammer, but no matter what he tries, he just can't get the knot in.\n\nRox won't stand for this. She slips two fingers up his soft doggy asscrack and fills his hole with them, shoving his hips forward manually via a vicious anal fingerfuck. \"I said <!i>breed<!i> "+pickByGender("him", "her", "them")+",\" she hisses.\n\nWith the added force of her fingerfuck, Bert's knot slips in at last. He howls at the ceiling. His dick throbs against "+(data.bertPregAss?"your prostate":"the entrance to your inner tunnel")+". And, finally, Rox loses her grip on your hair— and Bert humps you right off the couch.");
			addChoice("Oof?!", roxCouch.bind("bertPreg3"));
		}

		if (seg == "bertPreg3") {
			append("You topple onto the floor in a confused blur. Bert's knot drags him right down on top of you, still thrusting. He doesn't even care if you're uncomfortable or if you got hurt in the fall— his simple feral mind only has room for one thing right now.\n\nWith your ass in the air and your arms trapped under your body and your legs tangled up with his tail, Bert rapes your "+(data.bertPregAss?"ass":"cunt")+" into the carpet. You can't raise your head and look back to see how to untangle yourself, or even just to watch the mounds of your asscheeks getting flattened over and over as his crotch bounces against them— because Bert lunges down in all his feral ferocity and closes his maw around the back of your neck. Not hard enough to hurt, but just hard enough to let you know that trying to get away from the impending load of doggycum is not gonna fly with him— even if it was his fault you fell off the couch in the first place.\n\nRox peeks over the back of the couch and cheers him on: \"You can do it, Bert! Knotfuck your little puppymaker!\"");

			addChoice("Oh fuck.", roxCouch.bind("bertPreg4"));
		}

		if (seg == "bertPreg4") {
			append("Bert starts to cum. But he doesn't slow down with relief, no, this rush of pleasure just makes him want to fuck you deeper and harder. He pulls his hips back, making your abused "+(data.bertPregAss?"asshole":"cuntlips")+" yawn open around his knot once again— you bite back a yelp from the intense stretching— and then he slams all the way back in.\n\nHe does this every single thrust. That fat doggycock knots and un-knots you over and over and over, while warm ropes of doggycum splurt out inside you and bloat your "+(data.bertPregAss?"butt":"")+"womb, and neither he nor Rox ever pauses to wonder if you're doing alright.\n\nEventually, the cum-and-wine bulge starts ballooning a little too big... you feel a litter of at least six puppies start to take form inside you, with the help of the capsule's magic.\n\nThey kick and wiggle up against "+(data.bertPregAss?"the walls of your ass, their little pawsies kneading your prostate and their daddy's dick":"your womb's exit, straining to be born already")+".\n\nBert unplugs his deflated dick with a <!i>pop<!i>and sniffs at his mess as it gushes out of your hole and down your inner thighs. Contractions start to ripple through them. He leaps back, startled, as a tiny paw pops out of your "+(data.bertPregAss?"gaped pucker":"pussy")+".");

			addChoice("Oh god, they're coming already!! <3", roxCouch.bind("bertPreg5"));
		}

		if (seg == "bertPreg5") {
			append("\"Time for some hardcore midwifery,\" Rox grunts, and vaults over the back of her couch, dick in hand. She slaps Bert out of the way with it and grabs you by your "+pickByGenitals("cock and nuts", "hips", "cock and nuts")+". With one titanic wrestling move she untangles you from yourself, flips you onto your back, and yanks your legs open wide.\n\n\"PUSH!\"");

			addChoice("PUUUuuuuushhhhh~!!!", roxCouch.bind("bertPreg6"));
		}

		if (seg == "bertPreg6") {
			append("You grit your teeth and clench your whole body up. Your muscles strain under your skin. Doggyjizz splutters out of your "+(data.bertPregAss?"asshole like a melted ice-cream enema":"cunt, thick as melted ice-cream")+". The first puppy starts to crown, but then you have to take a breath and relax for a moment, and your hole slurps it back up like spaghetti.\n\nRox curses under her breath and starts jacking herself off even harder. Her big cow nuts sway in their sack. \"Shit. Get up, we need gravity's help here.\"");

			addChoice("Y-You mean I should get up and squat?!", roxCouch.bind("bertPreg7"));
		}

		if (seg == "bertPreg7") {
			append("\"Obviously! What else are you gonna do? A fuckin handstand?\"");

			addChoice("I don't know!! But I'm so heavy... help me up...!", roxCouch.bind("bertPreg8"));
		}

		if (seg == "bertPreg8") {
			append("You can almost hear the heroic fanfare as Rox kneels down, slides her dick along your asscheeks (right underneath your center of gravity) and lifts you up into a squatting position by merely flexing her monumental erection.\n\n\"HUP! Alright, you steady? And one, two, three...\"\n\nShe slips her cock out from between your legs and peels your soaked "+(data.bertPregAss?"asscheeks":"cuntlips")+" open.\n\n<!b>\"PUSH!\"<!b>");

			addChoice("PPPPPPUUUUUUUUSSSSSSHHHHHHHH!!!!!!!!!!!", roxCouch.bind("bertPreg9"));
		}

		if (seg == "bertPreg9") {
			append("You can feel the pressure of the babies pushing, wriggling against your hole... the feeling is incredible, like a huge cock pushing deeper and deeper all the time, testing your limits, but just from the other direction!\n\nYou puuush... and puuuuuuuush...\n\nAnd finally... finally, you...!\n\nHNNNNNNNNGGGHHHHHHHHHRRRRKKKGGGGRGRGRGRRRGGHGH—\n\n<!i>Pop!<!i>\n\n...\n\n<!i>Pop! Pop! Poppoppo—<!i>\n\nAfter giving birth to the first puppy, the remaining five splutter out of you like anal beads, one after the other sliding out of your swollen "+(data.bertPregAss?"donut":"tunnel")+" in a rush of pleasure. They all topple happily onto Rox's hardwood floor, blind and squeaking, covered completely in their daddy's fresh doggycum. Bert smells himself on them and starts licking them clean right away, the little cumlover.\n\nThrough that whole moment, you just squatted there and let them pour from you with your legs spread wider than a street whore on Friday night— but now, finally, you collapse with exhaustion and flop down on your ass in the cumpuddle, shutting your legs, grinding your thighs together, and reeling in the pleasurable tingle of looseness that glows from your abused "+(data.bertPregAss?"ass":"cunthole")+"...");

			addChoice("Fwahhhh...", roxCouch.bind("bertPreg10"));
		}

		if (seg == "bertPreg10") {
			append("Bert tends to the puppies, who all flock around him like he's their mom.\n\nRox helps you to your feet and wipes off your drippy butt.\n\n\"There now,\" she says, softly. \"You made a great breeding bitch.\"");

			addChoice("Thank you. <3", roxCouch.bind("bertPreg11"));
		}

		if (seg == "bertPreg11") {
			append("She even cleans all the cum that's seeped deep up your asscrack with slow, thorough wipes. \"My pleasure. Seemed like he was a little ruff with you, though. Shall we wind down?\"");

			addChoice("Yeah, but I liked it~ Wind down.", roxCouch.bind("windDown"));
		}

		if (seg == "roxIntro") {
			append("\"Let's get this belly full,\" she teases, drawing circles around your innie. \"Got a cap?\"");

			addChoice("Sure do...", roxCouch.bind("gotCapRox"), {cost: ["Capsule", 1]});
			addChoice("Hmmm?", roxCouch.bind("whatsCapRox"));
		}

		if (seg == "whatsCapRox") {
			append("\"Little pink pills,\" she says, holding her fingertips apart to show the size of one. \"They speed up pregnancy.\"");

			addChoice("Oh! I have one of those.", roxCouch.bind("gotCapRox"), {cost: ["Capsule", 1]});
			addChoice("Loan me one?", roxCouch.bind("loanCapRox"));
		}

		if (seg == "loanCapRox") {
			append("Rox digs one out of her apron pocket and places it in your palm.\n\nShe gives you bedroom eyes. \"You know what to do with it, right?\"");
			if (data.hasCunt || data.hasBoth) addChoice("Swallow it.", roxCouch.bind("roxSwallow"));
			if (data.hasCock || data.hasBoth) addChoice("It's a suppository, isn't it.", roxCouch.bind("roxSuppo"));
		}

		if (seg == "gotCapRox") {
			append("You pull out a cap and hold it in your palm.\n\nRox gives you bedroom eyes. \"You know what to do with it, right?\"");
			if (data.hasCunt || data.hasBoth) addChoice("Swallow it.", roxCouch.bind("roxSwallow"));
			if (data.hasCock || data.hasBoth) addChoice("It's a suppository, isn't it.", roxCouch.bind("roxSuppo"));
			if (data.hasCock || data.hasBoth) addChoice("GIMMIE BUTT BABIES <3", roxCouch.bind("roxSuppoButt"));
		}

		if (seg == "roxSwallow") {
			data.roxSupp = false;
			append("Within minutes of swallowing the cute pink bean, you feel a warm tingle that twists and knots up like a tornado in the pit of your womb. That tingle trickles down to your cunt. It starts oozing juice.\n\nRox slides two soft-hide fingers along the crease between your cuntlips. She lifts you up by your crotch and turns you so you're facing away from her, with your arms over the back of her couch.\n\n\"There now,\" she says softly. \"Let's open that pussy up.\"");

			addChoice("Mmmh~?", roxCouch.bind("roxSwallow2"));
		}

		if (seg == "roxSwallow2") {
			append("She drives two fingers up your sloppy cunt at once. There's so much natural lube pouring out of you, it hardly even feels like one finger.\n\nRox notices the lack of a squeal or a gasp from you and, like a truly professional dom, she cranks up the intensity right away, to compensate.\n\nHer cock slaps down like a wet foam pool noodle on your ass. Double-digit inches of bovine dickmeat slide deeply between your bare cheeks. The two fingers digging around in the core of your cunt become three, four, and soon she's power-fingering you open almost as wide as the width of her cock. You huff and pant, drooling over the back of her couch.\n\nRox pulls her fingers out and admires your sloppy, swollen pussy as it drools sweet oil down your thighs. She lines her cockhead up with it.\n\n\"You ready for me?\"\n\nShe slams forward without waiting for a response.");

			addChoice("Oogh~! Take it!", roxCouch.bind("roxPreg"));
		}

		if (seg == "roxSuppoButt") {
			append("She has to turn away and try not to laugh. \"Oh. Oh I will. Now, if you want butt babies, let's spread those cheeks...\"");

			addChoice("Oh, it's a suppository~?", roxCouch.bind("roxSuppo"));
		}

		if (seg == "roxSuppo") {
			data.roxSupp = true;
			append("\"It can be. Say, why don't you put your arms over the back of the couch and stick your ass out for mama Rox?\"\n\nShe practically does it for you. Her strong, bovine arms slide under your armpits and lift you up like you're just a little kid. She drapes you over the back of her couch and yanks your hips back and up, forcing your asscheeks to spread open and your knees to slide in opposite directions. They slip into the spaces between her couch cushions and lock your legs in place.\n\nShe pops a finger in her mouth and drools on it. Then she takes that warm, wet digit, and starts to pressure your pucker open.\n\n\"Come on, open up...\" she says under her breath. She tugs up, down, left, right... pops just the fingertip in and twists it... then, once your ring is loose enough, she plunges her finger deep inside, right to the base of her knuckle.");

			addChoice("Oh~!", roxCouch.bind("roxSuppo2"));
		}

		if (seg == "roxSuppo2") {
			append("\"Feel good?\"\n\nShe twists her finger inside you so slowly and carefully that you can feel each individual degree of rotation dragging along your inner assmeat, from 0 to 180.");

			addChoice("Yes...!", roxCouch.bind("roxSuppo3"));
		}

		if (seg == "roxSuppo3") {
			append("\"Ready for your medicine?\"\n\nShe pulls her finger out.");

			addChoice("Please, give it to me.", roxCouch.bind("roxSuppo4"));
		}

		if (seg == "roxSuppo4") {
			append("\"Okay,\" she purrs, \"if you're sure...\"\n\nYou look back over your shoulder. Rox is slowly stroking her bovine cock to full length.\n\nIt's massive. And kind of majestic, like a fountain, in the way it pukes pre all over itself and her nuts (which are clenched up into a tight little coinpurse, of course). She places the capsule right in her cockslit, tucking it in deep, and lines her dick up to your hole.\n\n\"One finger should be enough warmup, right?\"\n\nShe slams forward.");

			addChoice("Ooogh~! Take it!!", roxCouch.bind("roxPreg"));
		}

		if (seg == "roxPreg") {
			append("She splits your "+(data.roxSupp?"ass":"cunt")+" open to the core. Your mouth opens in a breathless gasp, and your cock-and-wine-bulged belly slams against the back of the couch. You reach down and clutch your stomach: the outline of her cock throbs powerfully beneath your fingers, through a few thin layers of flesh.\n\nOne of her hands closes in a vice grip on the back of your neck. The other one goes to your belly and interlaces with your fingers. She guides your hand in slow circles, making you stroke her dick through yourself.\n\n\"You feel me in your "+(data.roxSupp?"boywomb":"womb")+"?\"");

			addChoice("Of course I do, you're fucking it open!?", roxCouch.bind("roxPreg1"));
		}

		if (seg == "roxPreg1") {
			append("She growls, pulls back, and rams into you hard enough to make you gag.\n\n\"It was rhetorical. Now shuddup and back your "+(data.roxSupp?"ass":"hips")+" up on my dick.\"");

			addChoice("... Do that~", roxCouch.bind("roxPreg2"));
		}

		if (seg == "roxPreg2") {
			append("You wiggle your hips back as slow and sexy as you can. Your thigh muscles quiver with the intense feeling of feeding your ass more cowcock than you're sure you can handle. Your stomach balloons even more obscenely beneath your fingers, and some wall of flesh inside you strains and strains and strains and... and then begins to slide out of the way, allowing her flat horse-shaped head to ram deeper inside you than you thought any cock could ever go.\n\nFinally, you back up far enough to "+(data.roxSupp?"press your balls to hers":"hit her crotch and throbbing nutsack")+". Every single inch of her surges to full hardness inside you.\n\n\"Good breeding bitch,\" she purrs.\n\nThen the thrusting starts. It's merciful at first, just three inches at a time, but still enough to make you squeak every time she bottoms out. She's very clearly going easy on you, too. You can see it in the way she bites her lip and flicks her tail so sharply. She has to use every iota of concentration in her drunken body just to stop herself from pulling all the way out, til her cockhead kisses your "+(data.roxSupp?"fucked-swollen asshole":"cuntlips")+", and then forcing her dick alllll the way back in.\n\nIf she did that, who knows how well you'd take it...");

			addChoice("Don't hold back, Rox!!", roxCouch.bind("roxPreg3"));
		}

		if (seg == "roxPreg3") {
			append("She pauses. Her grip on the back of your neck goes loose.\n\n\"But I might hurt you,\" she says in a small voice.");

			addChoice("I don't give a fuck!! Rape me preggo~! <333", roxCouch.bind("roxPregHard1"));
			addChoice("Oh... alright, take it slow...", roxCouch.bind("roxPregSlow"));
		}

		if (seg == "roxPregHard1") {
			append("\"Are you—\"");

			addChoice("Yes I'm fucking sure now ruin me!!!!", roxCouch.bind("roxPregHard2"));
		}

		if (seg == "roxPregHard2") {
			append("\"...\"\n\nRox sighs. \"Fine. Just don't yell, alright? Bert's sleeping.\"\n\nShe lets go of your neck and wraps her whole hand around your throat instead. It makes sense; if her hold isn't firm, you're likely to just slide backward when she tries to unplug from you. You can both feel how tightly your insides hug her dick, now that she's forced it in so deep.\n\nSlowly, she starts to pull out. The sensitive inner walls of your "+(data.roxSupp?"ass":"womb")+" strain to go out with it, but her grip keeps you firmly in place.\n\nRox looks down at her cock as it starts to come out. \"Oh, fuck...\"\n\nYou follow her eyes and see it, too, in all its wet-shining glory. Between the mounds of your asscheeks, "+(data.hasBoth?"rubbing along the underside of your fat nuts":"")+", her shaft starts to appear, and it's absolutely coated in your inner juices and her thick bovine precum. The smell of it is even glorious: a musky, raw flavor that penetrates your pheromone receptors and gapes them open into a new plane of arousal.\n\nYou clench your "+(data.roxSupp?"assmuscles":"cervical muscles")+" and force a few more inches out with a quiet <!i>schlick.<!i>\n\nBefore long, she runs a shaking hand all the way from her base to the rim of her cockhead, which is still embedded just behind your overstressed "+(data.roxSupp?"pucker":"cuntlips")+".\n\nYou need that cock back inside you right now. The void it left in your belly is unbearably empty.");

			addChoice("Put it back in!!!", roxCouch.bind("roxPregHard3"));
		}

		if (seg == "roxPregHard3") {
			append("Rox just holds you there by your throat for a moment, moving just the teensiest little inch of her cock in and out.\n\nShe grins. \"You want my babies this bad, huh?\"");
			addChoice("Yess!!!", roxCouch.bind("roxPregHard4"));
		}

		if (seg == "roxPregHard4") {
			append("\"You want me to knock "+(data.roxSupp?"your ass":"you")+" up?\"");

			addChoice("YES!", roxCouch.bind("roxPregHard5"));
		}

		if (seg == "roxPregHard5") {
			append("\"Okay then, breeding bitch. Open up.\"\n\nShe ploughs her whole cock in, right to the top of her swinging nuts, and it knocks the wind out of you. Her hand tightens on your throat, reducing your squeals to cute little squeaks.\n\nWith three more powerful thrusts she cranks into a full-force "+(data.roxSupp?"assfuck":"wombfuck")+" that tears the breath from your lips entirely. You can only gasp in stunned silence. Rox did not interpret the word \"rape\" as hyperbole. She closes her eyes, stops giving a fuck about your comfort, and pounds your "+(data.roxSupp?"ass":"cervix")+" so brutally that pangs of overwhelming pleasure ripple up through your insides and draw tears from your eyes.");

			addChoice("Please cum inside me.", roxCouch.bind("roxPregCum"));
		}

		if (seg == "roxPregSlow") {
			append("She exhales and ramps up to five inches at a time, which is getting close to your limit. The warmth of her body and cock pour over your skin and overheat you inside and out. If you look back over your shoulder, you can see individual beads of sweat rolling over the curves of her hips and nutsack.\n\nShe can't help but speed up now. She pumps about half her dick into your "+(data.roxSupp?"ass":"cunt")+" so fast her tits start to swing in circles. "+(data.hasBoobs?"If your own tits weren't pressed to the couch, you bet they'd be jiggling wildly too~":""));

			addChoice("Please cum inside me.", roxCouch.bind("roxPregCum"));
		}

		if (seg == "roxPregCum") {
			append("Her free hand slides off your hips and latches onto your hair. She yanks you back, slips you into a hug tighter than a chokehold, and pumps a dozen ropes of sloppy, goopy cowcum into your belly.\n\n\"Gonna fuck a baby into you... unh. Unh. UNH!\" she grunts obnoxiously with each spurt. The lust has consumed her, and she apparently can't even tell how cringy her own dialogue is anymore. \"Take that fuckin baby up your "+(data.roxSupp?"ass":"cunt")+"... yeah... yeah, just like that... can't wait to see you force it out...\"\n\nSteamy breath puffs from her snout, and her long, skinny cow tail <!i>whaps<!i> against the couch with every pulse of her nutsack.\n\nYou look down. Your stomach is ballooning to an obscene size. A little hot cum starts to flow up your throat, but you quickly swallow it back down. You're so drunk and fuck-drunk, the room feels like it's thrusting in around you, walls grinding up against your face, floor against your belly... at first you're sure that you're only bulging from cum and wine, and each of Rox's fat cum-splurts makes a visible bump in your belly to reassure you of that fact, but after a moment you aren't so sure... and after two moments, you're definitely doubting that your belly hasn't started to swell with something else, too...");

			addChoice("Oh god, it's growing so fast...", roxCouch.bind("roxPregCum1"));
		}

		if (seg == "roxPregCum1") {
			append("\"Look at this~\" Rox pants next to your ear, holding your belly with both hands and jiggling it as it grows even more. \"Can't all be cum, can it...? No...\"\n\nHer breath melts over your ear. \"No,\" she whispers, \"I feel your baby growing against my cock.\"");

			addChoice("Oh jeez, pull off!", roxCouch.bind("roxPregCum2"));
		}

		if (seg == "roxPregCum2") {
			append("You... well, you're kind of immobilized by your own pregnant belly.\n\nBut Rox helps you off. Unplugging her cock is much easier now that your tunnel has been fucked open and coated with jizz. She sits you down on the couch, legs spread, and places both palms on your inner thighs.\n\n\"Ready~?\"");

			addChoice("Ready...", roxCouch.bind("roxPregCum3"));

		}

		if (seg == "roxPregCum3") {
			append("She tugs your "+(data.roxSupp?"asshole open with four fingers":"cuntlips apart")+".\n\n\"PUSH!\"");

			addChoice("PUSH!", roxCouch.bind("roxPregCum4"));
		}

		if (seg == "roxPregCum4") {
			append("You crunch your teeth together and go HNNNNNNNGHHHHHHH~!!\n\nIt's a lot easier than you were expecting. Her cock hangs flaccid between her legs now, dripping cum, but it twitches halfway back to life just at the sight of how easily the baby slips from your ruined "+(data.roxSupp?"ass":"cunt")+" and onto the couch.\n\nThat uncorks a cascade of hot cowcum that splutters from your "+(data.roxSupp?"butt":"pussy")+" and forms a puddle on the hardwood. Rox laughs and slams both palms down on your still slightly-bulged stomach, just to push the rest of her cum out onto the baby before scooping her up and toweling her off. She's a beautiful, confused little cow with an awful lot of cum still stuck in the tuft of her happily swaying tail.");

			addChoice("Ahh jeez... what are we gonna do with her...?", roxCouch.bind("roxPregCum5"));
		}

		if (seg == "roxPregCum5") {
			append("\"Well, she's just an NPC, of course,\" Rox says, looking at the mindless little thing. \"They're banned in the forest, you know. I'll drop her off at the Floatillery later. They ship them over to the city every Thursday.\"");

			addChoice("Ah...", roxCouch.bind("roxPregCum6"));
		}

		if (seg == "roxPregCum6") {
			append("She sits the baby next to Bert, who doesn't quite wake up, but still sleepily wraps his paws around this wet bundle of warmth leaning against him. The little cow snuggles up into his shaggy belly right away.");

			addChoice("Wind down.", roxCouch.bind("windDown"));
		}

		if (seg == "sexAvoid") {
			append("Rox scratches behind her head, looking at the floor. \"Ahaha, yeah. Sorry. Bit much, yeah.\"");
			addChoice("No sweat, Rox. Wind down.", roxCouch.bind("windDown"));
		}

		if (seg == "windDown") {
			append("The two of you drink some more and talk about nothing. Well, um, actually, you talk a bit about the missing admin password. She doesn't know what it is or where to get it, but she has a feeling that Septrica does.\n\nWhile you talk about this, Rox keeps taking swig after swig. She's pushing the far edge of a black-out, now. Soon she's almost passed out on the couch, babbling about nonsense, drooling, with the bottle just glued to her lips.\n\nGood ol Rox.");
			addChoice("Mmmm. Look around.", roxCouch.bind("windDowna"), {kinks: ["Plot"]});
		}

		if (seg == "windDowna") {
			append("You leave Rox to her drinking and explore the rest of the basement.\n\nShe's got a lot of sex stuff stashed away down here, naturally. You wouldn't expect anything else. But the sheer volume of it is a little unnerving; she's been hoarding stuff, like old doggy porno mags, stacked in towers against the walls. Only a couple of them feature pinups of Bert in lingerie, and those are still in their sleeves, mint-condition, off to the side. The rest are so cumstained half the pages stick together. She hasn't looked at any of them in years, and yet she keeps the ratty things stacked up down here...\n\nYou move on to a small side-room. It's equally packed with towers of smutty stuff. She's carved out walkways through the mess. The fact that she's managed to quarantine her hoarding to the basement is actually kind of impressive.\n\nThere are piles of photo albums, piles of more magazines, and piles of video tapes (plus a little T.V. in the corner and a VHS player).");
			addChoice("Examine photo albums.", roxCouch.bind("examinePhoto"));
			addChoice("Examine magazines.", roxCouch.bind("examineMags"));
			addChoice("Examine video tapes.", roxCouch.bind("examineTapes"));
		}

		if (seg == "windDownHub") {
			append("There are piles of photo albums, piles of more magazines, and piles of video tapes.");
			addChoice("Examine photo albums.", roxCouch.bind("examinePhoto"));
			addChoice("Examine magazines.", roxCouch.bind("examineMags"));
			addChoice("Examine video tapes.", roxCouch.bind("examineTapes"));
			addChoice("Snoop more and harder.", roxCouch.bind("windDownEnd"));
		}

		if (seg == "examinePhoto") {
			append("Two albums stand out to you, one very vanilla, one extremely kinky:\n\n<!i>Weekend With Archie\n\nSexual Experimentation Log<!i>");
			addChoice("Read <!i>Weekend With Archie<!i>.", roxCouch.bind("readArchie"), {kinks: ["Cub", "Male", "Female"]});
			addChoice("Read <!i>Sexual Experimentation Log<!i>.", roxCouch.bind("readLog"));
			addChoice("Back.", roxCouch.bind("windDownHub"));
		}

		if (seg == "readArchie") {
		append("Almost totally empty. Just a few pictures left in this one.\n\nIt's all very wholesome. Archbishop, Red, her bunny friend, and Som, all doing cute arts and crafts together: making their own custom deck of playing cards, fiddling with electric circuits and AUTOMYNTs, knitting little dolls.\n\nThe later pictures don't include Red.");
			addChoice("Back.", roxCouch.bind("examinePhoto"));
		}

		if (seg == "readLog") {
		append("It's pretty plain. Smooth brown binding, tons of room inside. The date says 'First few months of Year 0.'\n\nThe album has been sorted with handy tabs, for records of Roxelle's experimentation with each specific kink.\n\nYou can choose from:\n\n<!img:kink/Cub.png>  Cub\n\n<!img:kink/Baby.png>  Baby\n\n<!img:kink/Scat.png>  Scat\n\n<!img:kink/Abuse.png>  Abuse\n\n<!img:kink/Snuff.png>  Snuff\n\n<!img:kink/Prolapse.png>  Prolapse");
		addChoice("Cub.", roxCouch.bind("expCub"), {kinks: ["Cub", "Male"]});
		addChoice("Baby.", roxCouch.bind("expBaby"), {kinks: ["Baby", "Female"]});
		addChoice("Scat.", roxCouch.bind("expScat"), {kinks: ["Scat", "Female", "Male", "Cub"]});
		addChoice("Abuse.", roxCouch.bind("expAbuse"), {kinks: ["Abuse", "Blood", "Male"]});
		addChoice("Vomit.", roxCouch.bind("expVomit"), {kinks: ["Vomit", "Female", "Intersex", "Cub"]});
		addChoice("Prolapse.", roxCouch.bind("expProlapse"), {kinks: ["Prolapse", "Male"]});
			addChoice("Back.", roxCouch.bind("examinePhoto"));
		}

		if (seg == "expCub") {
		append("This section of the album is packed full of pictures. Probably because she realized she loved cubs basically as soon as she started experimenting with them.\n\nThe very early cub pics are almost all super gentle and tame: maybe the little cuties are hugging her cock, or suckling on one of her big cow tits, or maybe they're just playing naked in the sunshine.\n\nAs the section goes on, though, the pictures get rougher and rougher. Sometimes she's got a spanked-red cub ass squeezed between both her hands, other times she has cub throats speared on her dick, bulged out obscenely. At the very end, there's even a picture of a cub pleading and crying with the camera as Roxelle sinks her massive adult fist up the kid's asscrack, screwing it into his hole. The caption reads: <!i>Kid begged to take my cock, I told him he was gonna have to widen out a little first.<!i>");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "expBaby") {
		append("This section of the album is extremely thin. All the pictures are from the same day. Rox gave the kink one shot, you think, and that's it.\n\nThe background is a hospital, or something clinical. Maybe the Apothecary. An adorable, newborn Fuckmeat girl sits on the squishy white-tile floor, completely naked, while Rox's massive cock shadows her face and body.\n\nRox tried grinding up on the little baby. She tried teabagging her, grinding those fat low-hangers in the cub's overjoyed face... she tried spreading her cheeks and sitting on the little slut, squeezing her warm, tiny body between them... but, in the end, the pictures just go back to solo shots of the little girl or blurry, half-assed shots of Rox's cock, which is clearly softening.");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "expScat") {
		append("A massive section. The first two pages are entirely just shots of Roxelle's fat donut pucker, either gaped with a shitlog or yawning shut, smeared with brown. Either way, it always looks like it's in desperate need of a wipe-down.\n\nSeems she transitioned from admiring her own asshole to forcing others to admire it: the next pages chronicle Som's pinched-up, disgusted face getting shoved deep between Roxelle's asscheeks, that same cute face going wide-eyed, and then going full ahegao as strands of goopy brown sludge pour out over his chest and chin. Rox removes her ass and shows the camera exactly how much she fucked the little lamb up: a full foot of shit hangs from his packed mouth, all in one log, like a half-hard cock rising up out of his tiny throat. Her fist comes down on his face in the next few panels, knuckling all that ass-sludge down into his maw, or up his nose.\n\nThe pages after that are just a total shit-storm. You find things like close-ups of tiny open maws that clearly just finished eating and swallowing Roxelle's shit, with chunks of it stuck to their gums or still hanging in globs from the roof of their mouth. You find things like dogs crouching and taking hot, spluttery diarrhea shits on little cub faces. You find things like Rox herself after a long, long night of shitfuckery, standing next to four girls with massively bloated bellies and shitlogs packed up their cunts, groping her totally flaccid horsecock, and looking like she's about to either pass out or puke on the spot.");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "expAbuse") {
		append("This section is a little thick. Medium, maybe.\n\nThe first pictures are of bruises, that's easy enough to see. Rox collected a nice little collage of cute subs, both boys and girls, smiling up at the camera and showing off their very own purple, splotchy beauty marks on the side of their faces. The caption: \"Told every one of them they would only get my cock if they let me punch them in the face. Worked every time.\"\n\nShe also did a collage based around choking. These pictures either focus on little throats wrapped up in her fingers, or bright blue faces with bloodshot, bulging eyes. Next to each picture, she even wrote the max duration that each of her little choketoys held their breath for: <!i>thirty seconds, two minutes, three minutes... five minutes + passed out.<!i>\n\nIt gets worse. Several pictures focus on Rox assfucking her subs so hard and so deep, they literally can't walk. Then she has follow-up pictures where they put on a cute show of screaming and crying and trying to crawl away from her while she stomps their holes open even wider than her cock already broke them.\n\nBut past that, the pictures thin out a little. Only reparable forms of abuse seem to turn her on: any truly permanent or grotesque damage can't be found in here. Still, near the end, there's a beautiful collection of images that follows a big-tittied, shy-looking girl who gets just absolutely destroyed by Rox; in the end, both her tits are bright purple and swollen, her face is covered in dirt and bruises and cumstains, and her ass hangs wide open between two bright red, whip-marked, bleeding asscheeks.");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "expVomit") {
		append("Rox with her fingers in the back of her mouth.\n\nRox kissing another dickgirl, frotting with her, while she pukes in the other girl's maw.\n\nRox yanking and fondling the tits of some dumb puketard bimbo while the bimbo pukes in a massive yellow-brown fountain towards the ceiling, splattering it all over her own face.\n\nRox throatfucking one sub while the other one pukes on her heavy nutsack.\n\nRox on top, glorious ass humping, with a pukebucket on the bottom, squealing and screaming, as Rox fucks handful after handful of hot panic-puke up her cunt.\n\nRox smiling and waving to the camera, bucket of chunky beige under her left arm. Rox grabbing a cub no older than five and forcing her to wave for the camera, too. Rox bending the cub over, dunking her cute little face in the bucket, and feeding that tiny underaged cunt way more cock than it could ever handle. Rox yanking the cub's arms behind her back. Rox fucking her relentlessly as the bucket slowly starts to drain with her dutiful guzzling. Rox pulling the cub girl out, slapping the pukechunks off her face, and letting her burp and gag for the camera. Rox ramming her cock right down the little slut's throat, still slick with cubcunt oils, letting her taste herself. Rox smearing puke in the little girl's eyelashes like pretty mascara. Rox pulling her cock out to let the girl barf over her own flat chest. Rox grabbing her by the hair and forcing her to go back down on that huge adult cock again, whether she got a breath in or not. Rox faceraping the little cunt over and over and over, until she hurls up every single drop of what used to be in the bucket.\n\nRox filling the bucket back up, starting over again...");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "expProlapse") {
		append("This is a tiny little section of the album right at the very end. But oh gosh, is it ever cute.\n\nSeems like Rox's cock is just too huge for most people; or else, Bert tries to pull his knotted cock out of them too early. Either way, every single cutie in this section is blushing and trying to hide the massive pink socks dangling out between their buttcheeks, hiding just behind their nutsacks or cuntlips~ Sometimes Rox reaches down and tugs on their prolapse for the camera, other times she uses both hands and yanks those sloppy, loose asscunts open even wider.\n\nIn one series of pictures, she has a little cub boy's inside-out asshole crushed gently under her bare foot. She wiggles her toes around, grinding her heel into that cute, squishy tube of assmeat... making sure it gets nice and dirty before she stuffs it back inside him...");
			addChoice("Back.", roxCouch.bind("readLog"));
		}

		if (seg == "examineMags") {
			append("Four magazines catch your eye:\n\n<!i>Shitsluts Weekly\n\nPuppy Torture\n\nPuketards Monthly\n\nLittle Boys<!i>");
			addChoice("Read <!i>Shitsluts Weekly<!i>.", roxCouch.bind("readShit"), {kinks: ["Feral", "Male", "Intersex", "Scat"]});
		addChoice("Read <!i>Puppy Torture<!i>.", roxCouch.bind("readPuppy"), {kinks: ["Feral", "Abuse", "Blood", "Gore"]});
		addChoice("Read <!i>Puketards Monthly<!i>.", roxCouch.bind("readPuke"), {kinks: ["Cub", "Male", "Intersex", "Female", "Abuse", "Vomit"]});
		addChoice("Read <!i>Little Boys<!i>.", roxCouch.bind("readBoys"), {kinks: ["Cub", "Male", "Male", "Male"]});
		addChoice("Back.", roxCouch.bind("windDownHub"));
		}

		if (seg == "readShit") {
		append("It's basically just a weekly collage of scat porn pictures and articles. Bins is in here, showing off his big bloated cub belly with a stain of brown around his mouth. In another picture, four guys stand around laughing and jacking off while their pet puppy chokes down a shitburger with extra cheese. Another picture shows a pregnant woman— well, you think that's just from eating too much, actually— caressing her belly and spreading her legs wide so she can give birth to a shitlog as thick and long as one of her slender thighs.");
			addChoice("Back.", roxCouch.bind("examineMags"));
		}

		if (seg == "readPuppy") {
			//@BOOKMARK
		append("<!i>Puppy Torture...<!i> It's not quite as dark as you thought it might be, with a title like that. Most of the magazine is actually just long, multi-page articles, and the pictures themselves are pretty sparse. This is because, as the disclaimer warns, no actual ferals are harmed in the making of this magazine. Most of the writers and readers just supply elaborate, vicious fantasies, all described through text. For some reason these people can really get off on filthy, violent descriptions of sex...\n\nYou flip around until something shocks you enough. Doesn't take long before you find it: a pitiful image of a small golden retreiver puppy, only a year old, begging the camera with his eyes. The little puppyslut is about to get crushed firmly beneath a muddy boot.\n\n<!i>Don't worry,<!i> the article reads. <!i>It's just a pose for the mag. I'm not stomping with force. But imagine if I was~? The little cunt wouldn't have two seconds to think about it... if I just pressed down hard enough, fast enough... CRUNCH~ <3<!i>\n\nYou flick onward. The pictures remain tame. Mostly they just show off the puppies themselves, perfectly intact, smiling with their tongues out for the camera. But the write-ups go into extensive, extensive detail about what their owners would love to do to them, if they could respawn or consent...");
		addChoice("Read one.", roxCouch.bind("readPuppy2"), {kinks: ["Cub", "Feral", "Snuff"]});
			addChoice("Back.", roxCouch.bind("examineMags"));
		}

		if (seg == "readPuppy2") {
		append("<!i>Hi everybody, this is my two-month-old pitbull, Bert. Stole the name from a friend's pup, haha. Isn't he cute? He's already so aggressive, too! He wants to protect his owner so bad.\n\nToo bad Mommy wouldn't protect him for shit. In fact, she'd probably invite a bunch of men over to spitroast his little ass, wouldn't she~? Like other puppies, he's learned to take a finger or two up his butt by now, but the dumb little cunt really has no idea what mommy would do to him, if she could... well, you know the name of the magazine. We're all just here to perv out about our fantasies... I do it every day, y'know, I sit him in my lap, with his little cocklet pressed right on my cunt, and I think about how much force it would take to shove his whole little body inside and just clennnnnch on him~! I bet I'd feel his little bones crack inside me... or maybe I'd hear a couple yelps, I dunno~ It'd be so cute if I killed my puppy, though, don't you guys think??<!i>");
			addChoice("Back.", roxCouch.bind("examineMags"));
		}

		if (seg == "readPuke") {
		append("These pages chronicle the many unintelligent eaters of half-digested food around the island, lovingly dubbed 'Puketards.' Mostly the pictures and write-ups revolve around degrading them, describing their talents, or listing extensive amounts of personal phone numbers and addresses, such that any rapist can find and abuse one of them at any moment.\n\nThe first is a girl cub, no older than six, with a dumb, vacuous expression on her face and a pair of nosehooks yanked up her tiny snout. The pictures show her in various poses: resting back on her heels with her legs and lips spread open, catching a cascade of creamy-hot vomit from the mouth of a woman with huge, hanging tits; laying flat on her back with a throatful of cock, puke bursting out over her rapist's nuts and legs, and, of couse, her own blue face; and lastly, the best position of all: on her hands and knees, totally naked, with cocks beating her mouth and cunt and ass inside-out, greasy pairs of nuts grinding all over her, and a massive blow-up swimming pool of puke surrounding her chubby little thighs and paws.\n\n<!i>Utter fucking puketard,<!i> the write-up says about her. <!i>No name. Chooses only to be called degrading things, nothing else. Can guzzle two straight gallons of adult puke before it starts coming out her ass or mouth. Loves cock. Can take two in each hole. Address, phone number, usual hangout spots, all in the details below...<!i>");
			addChoice("Back.", roxCouch.bind("examineMags"));
		}

		if (seg == "readBoys") {
		append("For once, it's a mostly vanilla magazine. It's just a collage of pictures and bios, all dedicated to the loveliness of little cub boy bodies.\n\nYou can't turn a single page without getting flashed by smooth, perfectly pudgy tummies, or throbbing cocklets, or tight lil coinpurse nutsacks that look like that could bounce right off the page. Even less erogenous body parts, like soft shoulders, lil ankles, cute smiling faces... when you see them like this, through the glossy pages of this magazine dedicated to sexualizing them, surrounded by cute lettering like 'BOYSLUT' or 'I LOVE TO SHAKE MY TAIL' or 'PLEASE PULL MY EARS AND ASSFUCK ME'... it's impossible for you to look at any non-sexual part of their little bodies without imagining a cock rubbing against it.\n\nOh god. Speaking of nonsexual body parts with cocks rubbing against them: you just ran into a page with tons of pictures of bare, soft-furred little cub armpits... some dry and clean, some sweaty... and some of them have fat adult cockheads grinding up into them.\n\nEven deeper in the magazine, near the back, some of the articles and pictures toe the line out of 'vanilla.' Almost all of the pics now focus solely on little boys getting gangfucked. You haven't seen a tiny cub maw without a cock lodged inside it for like five pages now.\n\nWhat's more, some of these boys are really, really starting to look like girls. The very last pages include tons of little boys around the age of seven or eight, dressed up in miniskirts and tube tops and wedding dresses and evening gowns and even, in one case, a tight little pair of frilly panties with 'RAPE ME' printed on the back. As the pages go on towards the end, all these boys get their girly clothing ripped off and their tiny cocklets exposed to the camera lens while their asscheeks get spread open and packed with up to two cocks at a time.\n\nThen, just like that, you turn the page to find the ending message:\n\n<!i>Hey everybody, thanks for reading. If you enjoyed this edition of the magazine, make sure to grab the nearest willing cub boy near you right now and give his ass a slap for us. Next edition we're only gonna be accepting pictures of boy butts after they've been beaten or slapped, so get those perfect, smooth little globes glowing nice and red for us, okay? <3 A little purple never hurt anyone either... except the sluts themselves, of course~<!i>");
			addChoice("Back.", roxCouch.bind("examineMags"));
		}

		if (seg == "examineTapes") {
			append("There are stacks and stacks and stacks... most of them unlabelled. They all smell kinda musty. You pick out three with intriguing titles:\n\n<!i>Night night w/ Bert\n\nFilling food bowl\n\nSom's visit<!i>");
			addChoice("Watch <!i>Night night w/ Bert<!i>.", roxCouch.bind("watchBert"), {kinks: ["Feral", "Male", "Intersex"]});
		addChoice("Watch <!i>Filling food bowl<!i>.", roxCouch.bind("watchBowl"), {kinks: ["Feral", "Scat", "Vomit"]});
		addChoice("Watch <!i>Som's visit<!i>.", roxCouch.bind("watchSom"), {kinks: ["Cub", "Male", "Intersex", "Abuse", "Raunch"]});
		addChoice("Back.", roxCouch.bind("windDownHub"));
		}

		if (seg == "watchBert") {
			append("The camera shakes a bit. A hand pulls away from the lens.\n\nThe lens clumsily focuses in on a pitiful sight: Bert, with his fluffy ass locked up in tight, unrelenting bondage. A spreader bar rattles between his hind paws, and his tail is tied to the back of his head. He whines and struggles pitifully with his signature pseudorape performance, jerking his little body around with faux fear as Rox's hulking shadow climbs into bed with him and rests her cock between his soft, fluffy asscheeks.\n\n\"G'night,\" she purrs in his ear... and plugs her dick as far as it can go up his ass.\n\nHe howls to the ceiling as she penetrates him so mercilessly. You can only hope she warmed his little ass up off-camera. Rox growls something mean, like \"Come on, fall asleep, Bert, why can't you fall asleep, huh?\" and starts pounding his quivery hips into the mattress, completely ignoring all his pitiful yelps. She even puts a hand on the back of his head and shoves that into the mattress too, muffling the yelps, hiding his panicked expression from the camera.\n\nRox yanks her cock out of him with a wet noise, and shifts the camera over to a view of his ass. It's gaped riduculously wide, drooling puppy assjuices on the bed, all while his fat puppynuts and knotted cock throb against the blankets. \"Not much action at this end,\" she tells the camera.\n\nThen she pans around to his face.\n\nShe's trained him well. Even though he just got his ass split open with no warmup and even though he's still held in an uncomfortably fuckable position by all the bondage gear, he seems utterly at peace. His eyes are closed. His little snout twitches, chasing dreams of musky buttholes to sniff. Even his breathing slows to a believeable level.\n\n\"Not much action here, either...\" she tsks. Clearly she was hoping he'd fuck up. Well... there's hope yet.\n\nRoxelle takes her massive cock in one hand and starts grinding the tip directly over Bert's snout. Her slit yawns and closes as those two big nostrils slides back and forth over it. A tiny bit of puppysnot smears off on her cockhead. \"Mmmm,\" she purrs behind the camera. \"Feels so chilly and good on my cock... come on, Bert, get up... you're missing all the fun...\"\n\n... He doesn't fall for it. His eyebrows peak together for one short moment, then they flop right back down. You start to realize this is the equivalent of training a dog to hold a treat on his nose and wait, even though he could eat it at any moment.\n\nRoxelle rams her treat up over his whole face, making the little puppycunt huff the crease between her fat nuts. She masturbates violently, right in front of him, making fat strands of precum rain over his peaceful expression.\n\nStill... despite all odds... Bert pretends to sleep.\n\n... Rox finally gives up. She wakes him with a whistle and scratches behind his ears while he looks up at her, tongue out, panting happily. \"Good boy, Bert. Now... take your treat...\"\n\nHe gobbles her cock down immediately, gagging on it, making disgusting slobbery puppy noises as she grabs the back of his head and makes him choke. <3");
			addChoice("Back.", roxCouch.bind("examineTapes"));
		}

		if (seg == "watchBowl") {
			append("<!i>Filling food bowl<!i> starts out, surprisingly enough, with a shot of an empty doggy bowl. Rox adjusts the camera a little, making sure its perfectly centered. She's standing just above the bowl, waving at you.\n\n\"Hi,\" she says, sounding a little nervous. \"My name is Roxelle Devaunt, and this is my audition video for the doggy daycare position. You can reach me at... um... well, I forget right now, but I'll include my number with this tape. I live way out in the forest, big farm, you can't miss it. Anyway. This is just a little video to show you how I intend to go above and beyond in my role as your feral nutritionist. I have decades of experience as a pet owner, plus at least a few years of specialized training as a feral dom. Well. I should probably just shut up and show you... this is what I want to do for you guys, if you hire me... this is what I wanna do to all your puppies.\"\n\nRox clears her throat, steps back, and re-centers the camera on the food bowl. You can't see Bert, but you can hear him panting and whining excitedly in the background...\n\nSuddenly, two fat, well-rounded cow asscheeks enter the frame above the bowl. Rox clears her throat again, and shifts her feet. She's squatting above the bowl, and if it wasn't for how hard she was, her huge cock would be hanging down and blocking the whole view. She already has to tuck her low-hangers to the side, just so you can get a good view of her asshole.\n\nShe grunts. \"Ah... Bert, stop...\"\n\nYou still can't see him or what he's doing that she wants him to stop, but something deep in your heart tells you he's trying his absolute hardest to dive in and start licking her exposed butthole.\n\nThe skittery noise of doggy paws scraping at linoleum echoes through the kitchen (and it is a kitchen, you think.) Rox succeeds in holding Bert back, because the camera stays perfectly focused on her fat, winking pucker. She grunts again. You can almost feel how gritted her teeth are. Then... slowly... with a tiny splutter... her ass starts to open up.\n\nShe squeaks adorably and loses her balance for a second as the massive shitlog blasts out from between her cheeks, splattering them both with brown speckles, and splashes down into the doggy bowl. Bert's off-screen whining reaches a fever pitch.\n\n\"Nnngh...\"\n\nShe clenches rhythmically, pinching off a few more wet, brown chunks. Her hole drips caramel kisses.\n\nBert finally enters the frame, just for a moment. He dives for the bowl... and fails, because Rox grabs him by the throat and use his face as toilet paper for her shitty ass. She wipes both of those cute, floppy ears up her asscrack, then rams his snout in nice and deep so he can start licking her clean.\n\n\"Ahhhnn... there ya go... that feels good, hun... oh. Oh, right, so. That's one thing I offer your company. But um... here's another thing, and not many people know this, but dogs don't just eat their own vomit for fun, you know. For some dogs, dogs with slow metabolisms, they can't get all the nutrients out of their food in one shot. They need someone to help them take it out and put it back in, y'know... like this...\"\n\nBert's shit-smeared face fills the camera for a moment while Rox stuffs three fingers down his little throat and fucks it open. His expression is pure bliss. He even pants harder, opening his maw, and allows her to really go knuckle-deep inside him... eventually, once she picks up a brutal rhythm, he starts to gag.\n\n\"That's it,\" Rox purrs, right next to the camera mic. \"Open. Open your throat...\"\n\nWith a tail-shivering GLRK, Bert pukes right in his food bowl: a nasty beige sludge floods from his maw, dripping through the crevices in his sharp feral teeth, hanging in chunks off of his chin-fur. Most of it misses the bowl. But the rest slops down right on top of Rox's shit, forming a beautiful double-layer cake of delicious, nutritious doggyslut food.\n\n\"Please consider me for the position,\" Rox says happily, flashing the camera a peace sign with one hand and ramming Bert's face down into the sludgy mess with the other. He gobbles and gags and forces himself to choke her rank shit down noisily, fluffy ass swaying in the background.");
			addChoice("Back.", roxCouch.bind("examineTapes"));
		}

		if (seg == "watchSom") {
			append("<!i>Som's visit<!i>... this one is different from the others.\n\nIt's a full-length, flashy, well-edited porno clearly intended to be sold to City audiences.\n\nYou just skim through the trailer at the start. The star of the movie is Som, a tiny, cute, pure-white-wool lamb boi with a curvy figure accentuated by a slick leather onesie with the ass, cocklet, belly, and both boitits cut out and fully accessible. He's still got his glasses on, too.\n\nThe trailer starts out with a quick interview:\n\n\"What's your name?\"\n\nHe covers his cocklet with both hands, grinding his little thighs together. \"Som...\"\n\n\"Who are you visiting?\"\n\n\"Rox...\"\n\n\"Why?\"\n\n\"So I can get raped while thousands of people watch...\"\n\nSlam-cut to Som cowering in the corner of the room as Rox and five other girls with dicks surround him, groping every inch of his little body, spitting on his face, yanking his soft lamb ears, twiddling that tiny boydick, or milking thick strands of pre from their cocks at just the right angle, such that it falls on his whimpering face.\n\nThe interview continues, this time with multiple girls asking multiple questions way too fast for him to answer: \"Are you a little slut? Hey, why aren't you looking at the camera? Wanna start with one or two cocks?\"\n\n\"Um— I— I'm not sure, hold on, just let me—\"\n\n\"Why are you still wearing that leather thing?! Tear it off! Get him naked! Look at the camera. Hey Som, why isn't your ass facing us? Come on out of the corner, now, you don't have to be afraid of us...\"\n\nSlam-cut to Som feigning abject terror as a cock the size of his skull comes down on his belly with a vicious slap, winding him. All the dickgirls laugh at him, and a couple more globs of spit bounce off his gasping face. Two girls yank his legs open, two hands on each tiny ankle, pulling, twisting, while another pulls his maw open with three fingers from each hand and yet another, Rox, straddles his smooth little chest and starts feeding him cock.\n\nCut to Som gagging on it, his eyes rolled back into his head, his tiny tongue flicking out to try and lick over Rox's swaying nuts. Cut to the cock unplugging and cumming all over his face. Cut to the cock bouncing off of his face. Cut to Rox's nuts grinding over his grimaced-shut eyes while ropes and ropes of hot girldick jizz coat his body and his slutty cub pornstar clothing.\n\nCut to somewhere near the end of the movie (and the trailer) where Som is totally naked, covered with sweat and cum, both his maw and asshole gaped irreparably wide. All the girls are still laughing at him as he tries crawling to the door in a pitiful escape attempt. On his hands and knees like that, with his ass totally exposed, swaying back and forth... the girls gossip and make fun of him like they've never seen a slut this wrecked before. Just as Som is about to reach for the doorknob, Rox pulls him back across the floor by his tiny cock and invites another girl with a cock the size of the kid's thigh to come on over and double-penetrate his ass so hard he passes out.\n\nCut to the last shot of the trailer, Som's anguished face, and an ending interview:\n\n\"Did you have fun?\"\n\nSom gurgles and burps up hot cum.\n\n\"Would you let these girls gang-rape you and film it again?\"\n\nHe tries to say 'no,' but only a violent gagging noise and more cum comes out.\n\n\"Mmmnn... well, in that case... if you enjoyed this video, viewer, please check out 'Som's Visit 2: Even More Cub Boi Abuse!' Now, on to the video...\"");
			addChoice("Back.", roxCouch.bind("examineTapes"));
		}

		if (seg == "windDownEnd") {
			append("You move on from that side-room and find yourself at the very deepest, darkest corner of her basement: a crawlspace with what looks like a vault door.");
			addChoice("Open it?", roxCouch.bind("vault"));
			addChoice("Back.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "vault") {
			append("It requires a passcode.\n\nThe hint is: \"name of my own personal puppycunt\"");
			addChoice("Bert.", roxCouch.bind("vault2"));
			addChoice("Back.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "vault2") {
			append("It bursts open with a long, near-silent hissssssss of air decompressing.\n\nA few fluorescent lights CLACK on. The atmosphere in there is a lot harsher as a result, under all those dead white lights. The warm orange pot lights in the rest of the basement are much more comfortable.\n\nYou still can't see much inside, here, although you do see some pieces of paper pinned to the wall, and something glinting off the light, in the far corner...");
			addChoice("Examine whole room.", roxCouch.bind("vault3"));
			addChoice("Back.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "vault3") {
			append("It's filled to the brim with military shit.\n\nLike, FILLED. She must be hoarding this stuff just as much as she hoarded all her porno mags and videos.\n\nFirst of all, two whole walls are peg-boarded and dedicated to storing every single different model and brand of tranquilizer pistol that anyone has ever manufactured in the history of the island. Under those, she has two massive horse-sized tanks full to the brim with bright green tranquilizer, one tapped off and the other equipped with an extensive deployment system to make reloading as fast and easy as possible.\n\nYou're not sure if you want to push deeper.");
			addChoice("Examine papers on the wall.", roxCouch.bind("vaultPapers"));
		addChoice("Examine glint in the back corner.", roxCouch.bind("vaultGlint"));
			addChoice("Back.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "vaultPapers") {
			append("They're... maps.\n\nMaps of the island, marked with strings to represent common traffic paths. Each path is color-coded to a name, on the side: John, Marei, Snagg, Septrica, Lana, Som... Septrica doesn't have a line for her traffic; just a single pin, pierced into the middle of the city. She's hiding in her brothel, you guess.\n\nThe other papers are newspaper clippings and L.L.L. documents which recap the war:\n\nFOREST-CITY WAR, SHALLOW RECAP:\nConflict: Portfolk (led by Roxelle, Mary, Lilac, Lily) want to create a legally designated vanilla zone where extreme kinks are not allowed. Forestfolk (led by Sep, Marei, Snagg) want them to be allowed everywhere.\n\nYear 20— a view of the conflict itself would comprise a tiringly complex series of kidnappings and counter-kidnappings involving the use of tranquilizer attacks, ambushes, and mass espionage. The 'end goal' of both sides was to recruit pacifists and submissives. To do this, each side attempted to reduce the number of influential/popular/sexy/fuckable people on the other side— either by kidnapping or converting them—  because those people were so useful as performers or porn stars. Those people would use massive political orgy rallies to recruit more islanders to their respective side. As such, they were powerful soldiers.\n\nIn some cases, these rallies were faked by the opposing side, in order to lure a large number of supporters in one place and then launch a massive tranquilizer bomb called the 'Crystal Prism,' a weapon which can be found hanging in the Snagglebank lobby today.\n\nYears 23-25 were known as the 'Ghost Town Years,' because over 75% of the island's population was tranquilized or held in captivity for one side or the other, leaving pathways and streets barren. The war concluded during years 27-30, very suddenly, after a secret meeting between Roxelle, Som, and Septrica.\n\n\nThis next set of documents offers a completely different recap:\n\nFOREST-CITY WAR, BEHIND THE COVER STORY:\n\nPortfolk (Roxelle, Mary, Lilac, Lily) never wanted to create a safe area, initially. Forestfolk (Sep, Marei, Snagg) actually forced them to support and rally for the idea, after local rallying had failed (Dark Forest was a dark place, at the time.)\n\nThe tranquilizer attacks, ambushes, and mass espionage were all, essentially, one giant LARP, designed to occupy attentions and pass the years, but it turned partially real when Portfolk like Roxelle and Mary were systematically ridiculed or emotionally abused in regards to the false information spread by the Forestfolk, who told everyone they were the main proponents of the legally designated vanilla zone.\n\nNear the end of the war, a few weeks before the secret meeting, an espionage mission carried out by Roxelle \"accidentally\" plumbed into the Forestfolk documents. She went much deeper than the LARP rules allowed her to. There, in those documents, she found that the 'legally designated vanilla zone' would serve an entirely different purpose, besides keeping the innocent happy.\n\nAccording to these documents, that vanilla zone would also double as the petri dish for a 'biomechanical doomsday weapon,' in her words. Before anyone could verify Roxelle's claims, the documents were destroyed.\n\nThe secret meeting that ended the war is still entirely secret. No one knows how or what deal was struck. But, within a few days, the Forestfolk agreed to sacrifice their home, Dark Forest, and rebrand it as Bright Forest— while the Forestfolk themselves moved over into Junkport, economically and sociologically conquered it, and created a new haven for depravity in the form of Junk City.");
		addChoice("Examine glint in the back corner.", roxCouch.bind("vaultGlint"));
			addChoice("Back.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "vaultGlint") {
			append("You probe deep, deep into the back of her military hoard... you pull aside boxes and boxes of weapons, tranq grenades, big shiny crystal prisms... and unearth... oh... oh dear god.\n\nIt's a tranquilizer gatling gun.");
			addChoice("Mmmmmmholyshit let's go check on Rox.", roxCouch.bind("sceneFinale"));
		}

		if (seg == "sceneFinale") {
			append("You go back to the couch and the fireplace, to check on Rox. She's snoring loudly, passed out on the couch, and she's pissed her apron. Bert's head bobs up and down between her thighs, happily lapping his mommy's hot pee right from the slit of her cock.");
			addChoice("Ah. Let her sleep. Move along.", BrightForest.brightForestHub);
		}

		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function roxFirstVisit(seg:String="none"):Void {
		saveCheckpoint("Roxelle.roxFirstVisit('"+seg+"');");
		function binder(bindTo:String):Void->Void {
			return roxFirstVisit.bind(bindTo);
		}

		clear();
		if (seg == "none") {
			data.roxInhaledMusk = data.roxPlayedCool = data.roxChosePuke = data.choseBooze = data.choseTea = data.passedOut = data.bertEntered = data.hurtBert = data.roxSawAlbum = data.knownRoxDogNumber = data.wipeHarder = data.harderPuke = false;
			unlockJournal("Rox first visit");
			append("You knock on the door.\n\nScents of dough, cloves, and cinnamon knock you over as it swings open to reveal a fat-hipped cow futa wearing only an apron. She looks you up and down, then grabs you by the chin with a spotted-hide hand and fixes a spot in the air above your head with one incredulous eye.\n\nShe pulls back. \"Can't believe it. Name's Roxelle. Come right in.\"\n\nYou come right in.");

			addSprite("assets/img/effect/roxelle.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Smuttymutt", "");

			addChoice("Can I have some pie?", binder("can i have some pie"));
			addChoice("Can't believe what?", binder("cant believe"));
		}

		if (seg == "can i have some pie") {
			append("\"Absolutely!\" she laughs, her tits bouncing, puffy nipples straining against the straps of the apron. \"I make 'em just for your kind, y'know. Though I have been known to snack a little, myself...\"");

			addChoice("Next.", binder("cant believe"));
			addChoice("My kind?", binder("how do you know"));
		}

		if (seg == "cant believe") {
			append("Roxelle shakes her head, flabbergasted, and bends over, exposing her ass. The cow's huge, spot-mottled cheeks part slightly as she steadies herself, reaches into her equally huge oven, and pulls out an even more equally huge pie. The glowberry juice (plus sugar, flour, and what smells like half the spice rack) drips glittery from the crimped edges of the golden brown crust and beads off the cracks of the cross on its bulbous top.\n\n\"Way out here in the woods,\" she says, turning to face you.\n\nThen she explodes with laughter. \"I never expected to see a player again, much less at my own fuckin house!\"");

			addChoice("Why's that?", binder("whys that"));

			if (data.knownAsPlayer >= 2) {
				addChoice("Yeah, the others had the same reaction.", binder("other had the same reaction"));
			} else {
				addChoice("How do you know I'm a player?", binder("how do you know"));
			}

			data.knownAsPlayer++;
		}

		if (seg == "how do you know") {
			var genderText:String = pickByGender(
				"guy",
				"gal",
				"guy— uh, gal— uh...\" Roxelle pauses, looking "+(data.hasBoobs?"from your crotch to your chest":"over your body")+"... \"... cutie ");

			append("\"It's in your eyes, hun. They got that look in 'em... like you can do whatever you want. I wasn't born yesterday, y'know. Mrs. Kitty-in-the-sky told me players got that little prompt there, typing in all your actions...\n\nAlso, '"+data.playerName+"' is floating above your head. Hahahah!\"");

			addChoice("Next.", binder("next1"));
		}

		if (seg == "whys that") {
			append("\"Because it's been so long since we've had one,\" she says. \"I lost track a few decades ago. I'm sure the L.L.L. has it recorded down to the minute.\"\n\nShe smooths out her apron, not-so-subtly smoothing it extra hard around her crotch. \"Oh, that's a library-lab thing in the City. Stale types work there. Librarians, scientists, <!i>phi-lo-so-phers...<!i>\"");

			addChoice("Next.", binder("next1"));
		}

		if (seg == "other had the same reaction") {
			append("\"Ohhh, the others, eh? You've been around already, haven'tcha. I wish some kind soul would make the trek out here to <!i>tell me these things...<!i>\"");

			addChoice("Next.", binder("next1"));
		}

		if (seg == "next1") {
			append("Roxelle dips a pinky in the pie's leakage and sucks it clean for a couple ticks of the grandfather clock.\n\n\"Hm.\" She looks thoughtfully to the ceiling. \"Still pipin'. Can I getcha anything to drink while we wait?\"");

			addChoice("Your cum, please.", binder("pick cum"));
			addChoice("Tea would be nice.", binder("pick tea"));
			addChoice("Got any booze?", binder("pick booze"), {kinks: ["Drugs"]});
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "pick tea") {
			data.choseTea = true;
			append("She cocks her head a little and turns to rummage in a corner cabinet, pulling out a floral-pattern kettle and a fistful of colorful little tea packets. \"Not going to take the bait, eh? Hah. I ask every player that question. It's about as close to your garden-variety mindless NPC as I'll get. You can guess some of the responses I've heard...\"\n\nShe puts the kettle on and turns to look at you. \"Course, if fate or physics or whatever dictates our every move, we're all sort of NPCs, aren't we? Reading the lines written for us.\"");

			addChoice("Examine determinism.", binder("determinism"));
			addChoice("Next.", binder("consider"));
		}

		if (seg == "determinism") {
			append("You examine the fact that you cannot know if you are actually in control of your own body or if you just sorta feel that way.\n\nRoxelle holds a serious expression for a moment... then cracks into a grin and pours two mugs full of steaming water. \"I shouldn't have brought it up. Not much to examine about a topic like that. No, it's more like a non-topic. Even if either of us had some valuable stuff to say about determinism, said stuff would still be entirely speculative. Can't know, don't care.\"");

			addChoice("... Alright, well, next.", binder("consider"));
		}

		if (seg == "consider") {
			append("She gets herself comfortable at a spindly dinnertable in a chair made specifically, it seems, for a rear her size, then sets the mugs and the packets down and drops a purple teabag into her own with a plunk.\n\n\"Oh. Just the one chair. Sorry, haven't had company in a while. Goes to show it by how much I'm yammering. Pull up any you like.\"");

			addChoice("Consider the options.", binder("next2"));
		}

		if (seg == "pick cum") {
			var foo = "rubs her foot over your crotch, somehow undoing your zipper and playfully toeing the smooth mound in your panties.";
			if (data.hasCock || data.hasBoth) foo = "toes the bulge in your pants playfully, somehow undoing the zipper.";

			append("She doubles over laughing. \"Oh, I haven't seen the bait taken so quick in... well, in a long-ass time. It feels great. Just like the good ol days.\"\n\nWithout warning she nimbly strides forward and wraps you up in a hug, her cock bulging hard against your stomach through the apron, a mixture of bovine musk and fresh-baked pie flooding your nose.\"Get on your knees,\" she whispers.You don't really feel like you have a choice here, so you just obey. She unties her apron and "+foo+" \"You pick up these tricks, living so long in a world like this...\"");

			addChoice("Next.", binder("roxcock"), {kinks: ["Art"]});
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "roxcock") {
			append("Rox drops her apron, letting eleven full inches of cowcock flop out and nearly smack ya on the nose.");

			addSprite("assets/img/effect/roxelleCock.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "");
			addChoice("Lick it.", binder("lick"));
			addChoice("Play it cool.", binder("cool"));
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "cool") {
			data.roxPlayedCool = true;
			append("Playing it cool at this point means zombie-staring at her cock. Roxelle's fancy footwork loosens your pants enough that they slip to the kitchen tile at your knees, revealing your ");

			append(pickByGender("strained undies.", "wet-spotted panties.", "wet-spotted, strained panties."));

			append("Carefully, lovingly, she takes her cock in a hand and paints your lips with a thin glaze of precum, her slit opening a little as she drags it across your mouth.");

			addChoice("Okay, now lick it.", binder("lick"), {kinks: ["Raunch"]});
			addChoice("Thanks for the lipstick.", binder("lipstick"));
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}


		if (seg == "pick booze") {
			data.choseBooze = true;
			append("The cow folds her arms over her tits and cracks a big fat grin. \"I like you. I like you a lot.\"\n\nShe hurries with determined grace to a wallful of oaken cupboards and slides open the lowest, biggest one, bare ass waggling in the air yet again, and pulls out a bright blue bottle of wine about the size of a fire extinguisher.\n\n\"Got this from my lil friend Som. Aged for fuck knows how long,\" she says, popping the cork and snatching two glasses. She tosses a couple ice cubes in with a merry clatter and fills them both nearly to spilling, then gets herself comfortable at a spindly dinnertable in a chair made specifically, it seems, for a rear her size.\n\nRoxelle destroys half her glass in one gulp and wipes the sky-blue wine from her lips. \"Ahhh.\" She goes for another slurp, then pauses. \"Oh. Just the one chair. Sorry, haven't had company in a while. Go ahead, pull up any you like.\"");

			addChoice("Consider the options.", binder("next2"));
		}

		if (seg == "next2") {
			append("You look around the cozy farmhouse. A chairless living room packed with cushy couches extends past the kitchen. Moving around as you search is making you feel a little cooped-up in your clothes; the oven's still on.\n\nYou spot two. There's a cushioned, velvety chair a ways down the hall and a simple wooden one two feet from the table that you somehow missed.");

			addChoice("Go get the velvet.", binder("get velvet"));
			addChoice("Just take the nearest.", binder("get nearest"));
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "get velvet") {
			append("You head down the hall, hardwood floor creaking under your feet. Along the walls are dozens of photos of Roxelle and her dog, most taken at night, Bert looking strangely different from one to the next.\n\nThe most worn, faded photos chronicle a hike to a forested bay. At the end, Roxelle lies sprawled on sunset shores aglow with bioluminescent plankton...\n\nJust past the velvet chair you spot a photo album with a silken, violet cover laying open on a little table. You can't see the fine details, but you can see an awful lot of bare, black-and-white-splotched cow hide.\n\n");

			if (data.bertEntered) append("Bert pants happily on his chair.");
			addChoice("Check it out.", binder("check it out"), {kinks: ["Feral"]});
			addChoice("Get the chair.", binder("get the chair"));
		}

		if (seg == "check it out") {
			append("You take a good hard sniff at the open photo album and find pretty much exactly what you expected to: pure debauchery.\n\nRoxelle on all fours with her legs spread and her cock pressed upside-down to the floor, grapefruit-sized nuts pushed up, looking over her shoulder and blushing at you... Roxelle with someone's cock jammed between her lips, eyes rolled up, saliva dripping over her chin... Roxelle bent over ");

			if (data.bertEntered)
				append("Bert's favourite chair, taking his knot up her ass.");
			else
				append("the simple wooden chair, taking a feral dog's knot up her ass. It looks like the sheepdog out front, actually...");

			append("\n\nBack down the hall, Roxelle is watching you with a smirk.\n\n\"Don't turn that page,\" she says. \"It gets worse.\"");

			data.roxSawAlbum = true;
			addChoice("Turn that page!!!", binder("turn page"), {kinks: ["Piss"]});
			addChoice("Get the chair.", binder("get the chair"));
		}

		if (seg == "turn page") {
			append("Roxelle with her face shoved into a piss-filled doggy bowl, bubbles forming on her nostrils. Someone out-of-frame has a good grip on her brown, curly hair (shorter than it is now but definitely still a good handle) with a tattoo of a manacle on his dark-furred wrist. Way in the back you can make out a thick knot slipping between the rounded tops of her asscheeks.\n\nShe laughs at your expression and ");
			if (data.choseBooze) append("stops herself from finishing her second glass, a flush already rising to her cheeks.")
				else if (data.choseTea) append("daintily sips her tea.");

			append("\"Come on back. You've got the real thing over here, hun.\"");
			addChoice("Get the chair.", binder("get the chair"));
		}

		if (seg == "get nearest") {
			data.bertEntered = true;
			var foo:String = "nil";
			if (data.choseBooze)
				foo = "hiccups. You look over to see she's already pouring herself a second glass of blue.";
			else
				foo = "blows on her steaming tea, looking a little bored, glancing to a low cupboard on the other side of the kitchen.";

			append("Roxelle's sheepdog lopes in through a doggy-door you hadn't noticed earlier and fixes you with a sad look. \"Hullo, Bert,\" she says, and "+foo+"\n\n\"Oop. Any you like except that one. That's Bert's chair.\"");

			addChoice("Give it to Bert.", binder("give chair"));
			addChoice("Claim it as my own.", binder("claim chair"));
		}

		if (seg == "give chair") {
			append("Bert does a little thank-you tail wag and hops onto the chair.\n\nRoxelle smiles into her ");
			if (data.choseBooze) append("wine glass.") else append("teacup.");

			addChoice("Go get the velvet.", binder("get velvet"));
		}

		if (seg == "claim chair") {
			data.hurtBert = true;
			append("Bert trudges under the table and flops down with his head on his paws. Roxelle rubs behind his ears with a toe and seems a little affronted that you would steal a poor dog's chair without so much as a sorry.");

			addChoice("Next.", binder("get the chair"));
		}

		if (seg == "get the chair") {
			if (data.choseTea) {	
				append("You pull up the chair and find Roxelle already put a teabag in your mug. The packet is a lurid pink, but as the leaves soak they turn the water milky.\n\n\"I pegged you as the girly type,\" she says.");

				if (!data.hurtBert) append("\"You don't mind, right? It's just a tiny hint of sweetgrass. Not enough to get you high. Crowd-pleaser. Extra sugar here, too, if it's still not sweet enough for ya.\"");

				addChoice(
					data.hasBoobs?"The girliest drinks are the tastiest.":"You're the one with tits.",
					binder("chat"),
					{kinks: ["Plot"]}
				);
			} else if (data.choseBooze) {
				append("You pull up the chair and take an experimental sip of blue wine. It tastes exactly like chocolate-coated watermelon. This baffles you.\n\n\"Drink up,\" Roxelle says, polishing her second glass and reaching lazily for the bottle again. \"I'm way wayyy wayyyyyyyy ahead of you.\"");

				addChoice("I can see that.", binder("chat"));
				addChoice("Slam down a hefty slurp.", binder("slam down"));
			}

			if (data.roxSawAlbum == true) {
				addChoice(
					"So, about those pictures in your photo album...",
					binder("about those pictures"),
					{kinks: ["Patreon Commission", "Feral", "Piss", "Scat", "Plot"]});
			}

			addChoice("Accidentally spill some on my pants by accident, accidentally.", binder("spill"));
		}

		if (seg == "about those pictures") {
			append("\"Which ones were those?\" Rox asks, shifting her ample weight a little. \"See, I know I left the album open, but I ain't sure how... ah... <!i>deep<!i> you got...\"");

			addChoice("Reach down, give her a look, and pet Bert.", binder("pet bert"));
		}

		if (seg == "pet bert") {
			append("Her gaze strays. \"That's pretty deep.\"\n\nExcited for pettings, Bert hurries to all fours and pushes his shaggy head into your hand. He's a stereotypical sheepdog, eyes covered by his fluffy bangs, prone to excessive, sloppy panting... A little doggy drool even pitters onto the kitchen tile. You wonder if Rox taught him to slobber like that. Or maybe she picked him up because he was an especially wet puppy?\n\nAs Rox rises from her chair Bert starts licking crazily at your fingers, both their tails (one sleek, one shaggy) flicking around with anticipation.");

			addChoice("Slip two fingers into his maw.", binder("slip 2 fingers"), {kinks: ["Scat"]});
			addChoice("Be courteous. Give him a doggy greeting...", binder("doggy greeting"), {kinks: ["Scat", "Scat", "Scat"]});
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "slip 2 fingers") {
			append("You hold him gently by both big floppy sheepdog ears, easing his head back, opening his maw...\n\nBert whines and gags a little as you plunge two fingers down his throat, but his tail wags twice as hard. He raises one of his paws, misses— raises up— misses— then finally paps it down on your wrist, blocking the hot, rapid flow of his breath along your forearm.");

			addChoice("Twist my fingers.", binder("finger next"));
		}

		if (seg == "finger next") {
			append("\"That means he wants more,\" Rox says, kneeling behind him. \"Bert's my first from the shelter. Every other dog I've had, the sign for ‘please throatfuck me less' is to put a paw on your wrist or your nuts... not Bert. He always acts like a regular old two-dollar doggywhore. In fact, if he's just sitting there <!i>not<!i> whining and pretending he's getting raped... <!i>that's<!i> when you slow down.\"\n\nRox yanks his tail up and buries her face in her doggywhore's ass. As you push deeper, twisting your fingers, feeling his little throat contract on them, she starts sucking loudly on his hole, wide rump a-wiggling in the air, then drives her tongue as deep as it can possibly go inside him (you think so, anyway, from the jerk of her head and the dog's muffled squeal around your fingers), slobbering even harder than he is, soaking his nutfur brown with "+(isActive("Candy Ring")?"slightly candy-pink":"dogshit")+" saliva.");

			addChoice("How many dogs have you owned?", binder("how many dogs"), {kinks: ["Plot"]});
			addChoice("Next.", binder("finger next 2"));
		}

		if (seg == "how many dogs") {
			data.knownRoxDogNumber = true;
			append("\"I wouldn't say <!i>owned.<!i> That sounds mean.\" She counts invisible dogs on the ceiling for a moment.\n\n\"Well... about... no, she was Kemp's... I've had about ten Berts before this one. Never two at once, you know, I like a one-on-one relationship... don't I?\"\n\nShe gives Bert a kiss right on his muzzle, sucking on his long tongue, then pulls off. \"Five of those Berts lived good, full lives. Over a decade each, I'd figure. And the others got themselves offed early.\"\n\nRox smacks Bert right on his fat doggy pucker, which makes him shiver heavily and shuffle his hind legs apart. He gives her puppy eyes over his shoulder, eyebrows cocked, silently begging for more and harder.");

			addChoice("Did you snuff any of those ten?", binder("did snuff"));
			addChoice("Next.", binder("finger next 2"));
		}

		if (seg == "did snuff") {
			append("Rox blinks. \"What? Who would kill a dog? That's some... that's villainous shit.\"\n\nShe scratches behind Bert's ears. \"Ferals may not be as ~complex~ as a fat pie-baking cow, or a little wolf in a cloak, or any given Jim Johnson down the street, but I like to think no one in here would hurt an innocent animal just to feel good. Christ knows we've got enough respawnable snuffsluts going unsatisfied as it is...\"");

			data.knownCharacterImmortality++;
			addChoice("And yet, Fuckmeat...?", binder("yet cubs"), {faCensor: true});
			addChoice("Next.", binder("finger next 2"));
		}

		if (seg == "yet cubs") {
			append("She hunches over with a sigh, working her meat to keep it going while she exhaustedly exposits: \"They're shells. Ferals still have memories, feelings, you know, <!i>things that make them living beings<!i>— at least in our view. But Fuckmeat are literally just the body, basic functions, and a slathering of sluttery wrapped up in a neat little mass-produced package. There isn't even a layer of philosophy about it. Mynt can look directly at their code and see what they consist of.\"");

			data.knownCharacterImmortality++;
			addChoice("So philosophical, Rox.", binder("finger next 2"));
			addChoice("Mmmm.", binder("finger next 2"));
			addChoice("Let's just move on.", binder("finger next 2"));
		}

		if (seg == "finger next 2") {
			append("Rox snaps her fingers and Bert perks up. \"Bert! Lube!\"\n\nHe cocks an ear and stares blankly.\n\nRox huffs. \"Come on, boy... you know this one. Lube!... Lube. Ugh.\"\n\nShe flips him onto his back, pulls his hind legs apart by his paws, gentle, and jabs her index at his exposed pucker. \"Luuuuuube.\"\n\nFinally it clicks, and Bert re-wrangles himself with floppy-eared excitement into a sitting position. His snout snuffles down between his spread legs, clearly taking the traces of your scent— then his tongue shoots out, and he starts lapping deep and slow at his own hole, coating it with thick, viscous "+(isActive("Candy Ring")?"candy":"shit")+"slobber.\n\n\"Good boooyyy~! Someone's getting buttfucked, yes he is...\" Rox coos, giving her cock and his belly a fierce rubbing.");

			addChoice("Next.", binder("finger next 3"));
		}

		if (seg == "finger next 3") {
			append("Rox pulls her cock out and thwaps it down hard between Bert's fluffy buttcheeks, bumping his little body forward. She drags her head from top to bottom, first, making little schlick noises as she paints and re-paints a trail of precum down his crack. Elsewise she cups and jiggles his fat puppynuts with her free hand, which is enough to make Bert's knot throb and pop fully from his sheath.\n\n\"Mmm... there's my boy...\" Rox says, wrapping her fingers around it. Bert looks from her to you incredulously, as if getting ready to take a cock half the size of his entire body while simultaneously getting his weiner touched is the best thing that's ever happened to him. He flips into his favorite position— doggy style— and inches his butt back onto mommy's cock with incessant little scoots, smearing his spit-slick hole over her big flat bovine head.\n\nRox grabs his tail, clearly embarassed at the way it's jiggling her stomach-chub with each wag. \"Say the word...\" she says, running her free hand up his back... and closing it around his scruff.");

			addChoice("Wait.", binder("wait"));
			addChoice("Go.", binder("bert go"));
		}

		if (seg == "wait") {
			append("You listen to Bert's impatient, panting whines.");

			addChoice("Wait.", binder("wait 2"));
			addChoice("Now.", binder("bert go"));
		}

		if (seg == "wait 2") {
			append("Rox shifts her weight a little, glancing at you.");

			addChoice("Wait.", binder("wait 3"));
			addChoice("Okay, now.", binder("bert go"));
		}

		if (seg == "wait 3") {
			append("She spots Bert softening with impatience and grinds her cock underneath him, smearing pre over his fat nuts, his smooth belly... you realize she's testing to see how deep it would go if she hilted it. He hardens back up right away.");

			addChoice("Wait.", binder("wait 4"));
			addChoice("I hereby decree you should fuck this dog.", binder("bert go"));
		}

		if (seg == "wait 4") {
			append("Killing time, she leans over and lifts a floppy ear to whisper: \"Mommy's gonna rape you... mmmmmhm~\"\n\nAt ‘rape' Bert releases an almost pained whine, ferociously licking her hand on the floor, her face, any part of her he can reach.\n\n\"That's right, you love getting raped, don't you? Are you gonna pee when mommy bottoms out in your little tummy~? I bet you are...\"\n\nShe clears her throat and straightens up. \"Okay. Seriously. Sometime today would be nice.\"");

			addChoice("Wait.", binder("wait 5"));
			addChoice("Rape him silly, Rox.", binder("bert go"));
		}

		if (seg == "wait 5") {
			append("...\n\n\"Fine,\" Rox says. \"Bert, <!i>you<!i> give the word.\"\n\nHe just looks at her.\n\n\"Give the word, boy. Bert... Word. Wooord. Give word. Give. Word.\"\n\nIt clicks. Wiggling his butt, Bert gets his chin nice and snug between his front paws, backs up a little more, and finally gives a single firm bark.\n\nRox starts pushing her cock in, redoubling her grip on his scruff. With one good wrangle of the cock she pops in, biting her lower lip as warm "+(isActive("Candy Ring")?"cake":"shit")+" squishes out around her shaft, pattering down over her nuts. \"Mmmf... dumb little doggywhore...\"\n\n");
			addChoice("Next.", binder("bert go"));
		}

		if (seg == "bert go") {
			append("You gawk.\n\nIn three simple thrusts Rox hilts her dog, the bulge of her shaft (and even urethra) straining at his plush tummyfur each time she slams inside and gapes his little ass open anew. Bert's frozen, wide-eyed, tongue out. One thrust, while already hilted, she yanks him back by his scruff and tail to get that much deeper inside him, smushing his fat fluffy buttcheeks up against her hips. \"C'mon, boy...\", she says, \"I know it feels good... but our guest wants to watch your little performance.\"");

			addChoice("Watch.", binder("finger next 4"));
		}

		if (seg == "finger next 4") {
			append("As always it takes Bert a second to understand, but once he does the show begins proper.\n\nAs if rabid he starts pawing helplessly at the tile, extending his hind legs, howling pitifully, doing anything to put distance between his butt and Rox's cock. It saves her the trouble of thrusting; with her grip firm she simply lets him pull off (he always has to pause for a second halfway to get his ring around her oversized flare) before she drags his ass right back down to her base.\n\nHis performance is so convincing that you start thinking she really <!i>is<!i> raping him, until you peek underneath to see his cock pulsing at full mast and his paws scrabbling at a puddle of his own profuse drool.");

			addChoice("Harder.", binder("finger harder"));
			addChoice("Softer.", binder("finger softer"));
		}

		if (seg == "finger harder") {
			append("\"Harder, eh... c'mon Bert, you can take it.\"\n\nRox flops back onto her ample butt, pulling Bert with her. She folds her legs up criss-cross applesauce, toes wiggling, and promptly starts bouncing him on her lap twice as hard, his paws flopping around as he writhes and yelps as cutely as he can. She reaches a hand down to give his nuts a little more attention, yanking and groping them— then she moves up and strokes his cock, bottoming out inside him as he splurts a little piss from his tapered tip.\n\nSoon after soaking himself yellow-furred his eyes roll up and his panting sags. He goes floppy.\n\n\"Ah... there you go... well, that's probably a new record...\"\n\nRox sets him down, carefully dislodging her soaked-"+(isActive("Candy Ring")?"pink":"brown")+" cock. She beckons you over, digging a few fingers in and pulling to show off his absolutely destroyed hole. With an impressed whistle she easily stuffs four fingers inside... not even stretching him.\n\n\"<!i>Definitely<!i> a new record...\"");

			addChoice("Finish up.", binder("rox bert cum"));
		}

		if (seg == "finger softer") {
			append("Rox lets go of his scruff and tail for starters. Bert looks back at her, eyebrows cocked.\n\nShe scoffs. \"What? Suddenly you break character? C'mere you...\"\n\nShe pulls him onto his side then flops down too, hugging him from behind, her cock twisting around inside. She launches into an industrial-strength tummyrub. For half of each slow, loving thrust, she also happens to be stroking her cock through his fur while it bulges out his belly.\n\nNo matter how deep she goes, though, it just isn't intense enough for Bert... he cranes his neck to plant lick after lick on her mouth, in-between sporadic reversions to his little performance. To satisfy him Rox grabs him by the throat, tilts her head, and leans in for a romantic interspecies makeout session. Her tongue runs over his black lips, deep into his panting maw, and immediately Bert reciprocates, shoving his long feral tongue as far as it'll go down her throat. Besides the twitch of an ear, Rox swallows the whole thing without a problem.\n\n\"Mmm...\" She flips over to pull you into a surprise kiss, her "+(isActive("Candy Ring")?"cake":"shit")+"-soaked cock popping out at the same time. You can taste the canine saliva on her tongue. \"Where oh where shall I finish,\" she asks your mouth.");

			addChoice("Give it to Bert, he's earned it.", binder("rox bert cum bert"));
			addChoice("Well, I know he did all the work, but...", binder("bert cum mouth"));
		}

		if (seg == "rox bert cum bert") {
			append("She stands and moulds you, with a few gentle pushes, into a hands-and-knees position. On the way down, you're eye-level with her cock for a moment...");

			if (isActive("Candy Ring")) addSprite("assets/img/effect/roxelleCockCake.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "Edit: Kittery");
			else addSprite("assets/img/effect/roxelleCockScat.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "Edit: Kittery");
			addChoice("Gee whiz!!!", binder("rox bert cum bert 2"));
		}

		if (seg == "rox bert cum bert 2") {
			append("Rox slaps her cock down between your asscheeks, sending a heavy ripple through them. \"Come on Bert,\" she says, wiping his "+(isActive("Candy Ring")?"cake":"shit")+" off on your hole, ");
			append(pickByGenitals(
					"your taint, dragging her head over your nuts... ",
					"your pussy... ",
					"your taint, your nuts, your pussy... "
			));

			append("With a few deft strokes she cums over the smeared "+(isActive("Candy Ring")?"cake":"shit")+", painting your butt with warm, dribbly ropes"+(isActive("Mood Ring")?"of her special "+getMood("Roxelle")+"cum":"")+". \"Nghgnh... Dinnertime~!\"\n\nBert bounds up and steadies himself with a paw on each buttcheek, hungrily slobbering down your crack. It tickles so much~ His tongue works voraciously at your hole, almost pushing inside at times, and his damp doggy breaths make you shiver as they roll over your bare skin every time he takes a little break.\n\nRox relaxes on the sidelines this whole time, riding her afterglow, only pulling him off (and giving him another quick kiss, licking her lips) once your ");
			append(pickByGenitals("taint and nuts ", "pussylips ", "taint, nuts, and pussylips "));
			append("are all squeaky clean. Lord knows he never would have stopped if she didn't.");

			addChoice("Wind down.", binder("rox bert wind down"));
		}

		if (seg == "rox bert cum") {
			append("\"Think I should?\" she says, and pulls you into a surprise kiss, ");
			if (data.hasBoobs) append("her tits pressing to yours. ") else append("her tits smushed up to your chest. ");
			append("You can taste how close she is.\n\n\"But where?\" she asks your mouth.");

			addChoice("Give it to Bert, he's earned it.", binder("rox bert cum bert"), {kinks: ["Art"]});
			addChoice("Well, I know he did all the work, but...", binder("bert cum mouth"), {kinks: ["Art"]});
		}

		if (seg == "bert cum mouth") {
			append("She stands and pushes you to your knees, her cock dripping "+(isActive("Candy Ring")?"pink cake":"dogshit")+" inches from your nose.\n\n\"But~?\"");
			if (isActive("Candy Ring")) addSprite("assets/img/effect/roxelleCockCake.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "Edit: Kittery");
			else addSprite("assets/img/effect/roxelleCockScat.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "Edit: Kittery");
			addChoice("But I want that down my throat.", binder("bert down throat"), {kinks: ["Piss"]});
		}

		if (seg == "bert down throat") {
			append("\"Then take it down your throat,\" she says, and Bert scampers up to watch as she smears her head and his "+(isActive("Candy Ring")?"cake":"shit")+" over your lips before fitting it betwixt em nicely. One hand wraps round the back of your neck. She pulls you down onto her shaft, Bert's "+(isActive("Candy Ring")?"buttcake":"musky assgrease")+" tingling on your tongue, rolling over your chin in fat globs after peeling off around the seal of your tight lips.\n\nThe moment she's driven the entirety of her length down your esophagus she yanks your nose to her crotch and cums directly into your stomach with eight fierce bursts. Bert licks at the periodic bulges in your throat, clearly jealous.\n\nEven though you're desperate for air after chugging her "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum, she sighs and happily follows it up by pumping your belly full of a relaxing afterglow piss, hardly noticing your desperate gags and coughs~");

			addChoice("Wind down.", binder("rox bert wind down"));
		}

		if (seg == "rox bert wind down") {
			append("You all collapse into a cuddle puddle right there on Roxelle's kitchen floor. With a couple (repeated) commands she gets Bert to fetch you both some pillows, hardly caring that his maw leaves them a little cummy.\n\nYou both take turns rubbing Bert's belly, scratching behind his ears, under his chin, pampering the pooch. Rox dives in the cupboard for a moment near the end of the cuddling, and pulls out a fat bag of treats. APRHODOGGY, the packaging says. BIGGER KNOTS! CRUNCHY GOODNESS! NATURAL* APRHODESIAC!\n\nThe brand says Apothecary.\n\n\"I don't let just anyone fuck my butt,\" she says, \"but when this dog gets his treats, hoo boy, there's really no stopping him...\"\n\nYou chat for a while, watching Bert scarf them down. Rox grows more and more awkward as he starts getting heated, humping her thigh, whining...\n\n\"If you don't mind, I... pictures are a little different.\" She absent-mindedly pets Bert. \"I like some privacy when I'm on the bottom.\"");

			addChoice("Ah, I gotcha.", binder("end"), {give: ["Glowberry Pie", 3]});
		}

		if (seg == "doggy greeting") {
			append("You spin Bert around and take a prolonged sniff at his "+(isActive("Candy Ring")?"pink-frosted":"muddy")+" hole, his tail thwapping against your forehead with each wag. Up close you notice he's quite loose, too... as if reading your mind, Rox hooks a thumb inside and yanks it open easily for you, pushing Bert's muzzle to the floor with her free hand.\n\n\"Good doggybitch,\" she coos, scratching behind his floppy ears. He whines hard, a hind paw raising to push her forearm away.\n\n\"Don't worry.\" Rox winks at you. \"That means he wants more...\"");

			addChoice("Rim him hard.", binder("greet next"));
			addChoice("Next.", binder("finger next 2"));
		}

		if (seg == "greet next") {
			append("You explore, pushing deeper, til your tongue spears into a "+(isActive("Candy Ring")?"warm clump of cake":"creamy clump of dogshit")+". Your deep gags make Rox's cock throb where it's pressed to your thigh, which compels her to reach down and start jacking Bert off in the name of fairness, "+(isActive("Candy Ring")?"pink":"brown")+" thumb smearing "+(isActive("Candy Ring")?"cake":"shit")+" over his knot...\n\nNear the end all three of you are panting; at that point she reaches down and grabs you by the cheeks, forcing you to spew what "+(isActive("Candy Ring")?"dessert":"liquid shit")+" you had in your mouth back up into Bert's warm ring as it clenches on the base of your tongue. She hooks her thumb back inside and gapes him for you.\n\nIn your ear she whispers \"Open,\" and gives his belly a firm shove.");

			addChoice("Open.", binder("greet open"));
			addChoice("... Close.", binder("greet close"));
		}

		if (seg == "greet open") {
			append("You lock lips with Bert's rippling donut as a mouthful of thick, "+(isActive("Candy Ring")?"sugar-sprinkled cake":"soft-serve dogshit")+" splutters past it. Rox purrs, keeping your face pressed firm to his ass, one hand on your throat so she can feel it bulge as you gulp the first "+(isActive("Candy Ring")?"few mouthfuls":"goopy log")+" down; after the second and third you start coughing and gagging hard, backed up— but the flow doesn't stop. Bert's claws scrabble at the tile as he tries mercifully to pull away, sensing you're having a tough time, but Rox grabs his tail and has none of that.\n\nTwo final "+(isActive("Candy Ring")?"chunks":"logs")+" force their way past your lips, squirreling your cheeks, overfilling your already packed throat, and splurting in two mini-logs from your nostrils. Then, finally, it ends.\n\nLips smacking, brown drool spilling over your "+(data.hasBoobs?"tits":"chest")+", you chew and swallow the last of his "+(isActive("Candy Ring")?"delicious butt-baking":"shit")+".");

			addChoice("Next.", binder("greet 4")); //TODO: this name
		}

		if (seg == "greet close") {
			append("You close your mouth the instant Bert pushes out a fist-thick "+(isActive("Candy Ring")?"slice of cake":"log")+", feeling it smush warm across your lips. Rox tsks, holding the back of your head with both hands now. \"Don't think you're getting out of this...\"\n\nNow that he's started, the poor pup can't stop. Since you decided to close your mouth Rox goes for the other orifice, pushing your nose up to the near-constant "+(isActive("Candy Ring")?"sugary rush":"shit-splutters")+", driving it halfway up Bert's hole. \"Breathe deep...\"\n\nYou really wish you'd had the foresight to take a big breath... you're already dying for air.");

			addChoice("Snort.", binder("greet snort"));
			addChoice("Sniff.", binder("greet sniff"));
		}

		if (seg == "greet snort") {
			append("You inhale Bert's "+(isActive("Candy Ring")?"cake":"shit")+" directly from the source with a "+(isActive("Candy Ring")?"hungry":"dirty")+" piggish snort, warm "+(isActive("Candy Ring")?"sugargoop":"sludge")+" dripping down the back of your throat and searing your sinuses.\n\nRox blinks, impressed. \"That's pretty deep,\" she says once more, with a grin.\n\nShe pulls your head away from Bert's gushing ass and gives you a sloppy eskimo kiss, hot steam pouring from her snout and melting the chunkier pieces of "+(isActive("Candy Ring")?"cake":"shit")+" where they hang from your "+(isActive("Candy Ring")?"pink-coated":"chocolate")+" nostrils.");

			addChoice("Next.", binder("greet 4"));
		}

		if (seg == "greet sniff") {
			append("You take a slow, long whiff of Bert's distinctively canine assmusk and end up coughing and gagging, barely able to keep your "+(isActive("Candy Ring")?"cake":"shit")+"-coated lips closed, the little gusts of air from your nose blowing bubbles in his "+(isActive("Candy Ring")?"frosting":"near-liquid assmud")+".\n\n\"A little deeper...\" Rox whispers. You happen to gag especially deep as she says that, so with abrupt mercy she adds: \"... if you want...\"");

			addChoice("Snort.", binder("green snort"));
			addChoice("Next.", binder("greet 4"));
		}

		if (seg == "greet 4") {
			var genderPick = pickByGender("boys", "girl... and boy", "girl... and boy");

			append("\"Good "+genderPick+"!\" Rox ruffles your hair and Bert's fur, diving down and slurping up all the spilled "+(isActive("Candy Ring")?"cake":"shit")+", sharing some of it with you through a passionate kiss. She grabs the back of your head and drags her lips all over your face, even sucking the "+(isActive("Candy Ring")?"treat":"shit")+" from your nose. At last she pulls away, a single "+(isActive("Candy Ring")?"pink":"caramel")+" saliva-string breaking between your mouths.\n\n\"You know,\" she begins—\n\nBert leaps up and joins the kiss, slobbering all over both of your faces and in your open mouths. \"Bert! Pbpbphtph!\" Rox wipes it off. \"I was about to launch into exposition, ya dumb dog...\"\n\nShe gives Bert a dark look, which he returns with an happy tongue-out smile. \"I've had some real doggywhores in my life, let me tell you, but <!i>this<!i> one takes the cake..."+(isActive("Candy Ring")?" oh, heh, right. You've got that Candy Ring thing turned on, haven'tcha? Totally intended that pun~":"")+"\"");

			addChoice("How many dogs have you owned?", binder("how many dogs"), {kinks: ["Plot"]});
			addChoice("Next.", binder("finger next 2"));
		}

		if (seg == "slam down") {
			append("You take a big chug and the sweet flavor of the wine burns as it rushes down your throat.\n\n");

			append(pickByGender(
					"\"Atta boy!\"",
					"\"Atta girl!\"",
					"Rox watches you with a proud, motherly look, and reaches forward to tip your glass up a little with a finger. \"Finish it,\" she says. \"Come on... that's it...\""
			));

			addChoice("Get wasted.", binder("get wasted"));
		}

		if (seg == "get wasted") {
			append("You catch up and then take the lead. Around the time you both finish your fourth glass, the pie is entirely forgotten, Bert is feeling a little starved for attention, looking from Rox to you and clearly begging for a pet he'll never get, and you're completely naked on your knees with Roxelle's eleven-inch cowcock practically pressed against your nose.");

			addSprite("assets/img/effect/roxelleCock.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "");
			addChoice("Lick it.", binder("lick"));
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "chat") {
			if (data.choseTea) {
				append(pickByGender(
						"\"Am I?\" Rox pushes her breasts up, soft hide shining a little in the lamplight. \"Hadn't noticed.\"",
						"\"Yes. Yes, you are.\" Rox eyes your chest.",
						"\"Ha. What're those fruity ones you got back home? Mynt told me once. The <!i>mo-hee-toes.<!i>\""
				));
			}

			if (data.choseBooze)
				append("Rox shoots you a crooked look and fills her glass up only halfway. \"Don't you worry. I've got lots of practice.\"");

			append("\n\nYou chit-chat for a while about nothing, at times launching into innuendo contests, and then abruptly she leans forward, eyes glowing, and asks you:\n\n\"So... I get the feeling I'm the only one rude enough to ask this, but I gotta know... we're all secretly dying to know... <!i>what's going on in the real world?<!i> Where did all the players go?\"");

			addChoice("I think I'm the last one left.", binder("last one left"));
			addChoice("Everyone is doing great.", binder("doing great"));
		}

		if (seg == "last one left") {
			append("\"What do you mean?\" she asks, talking too fast. \"You got family, don'tcha?\"");

			addChoice("My parents left the shelter when I was little.", binder("dad left shelter"));
		}

		if (seg == "dad left shelter") {
			data.knownBombShelter++;
			append("\"The... ah... the homeless shelter...?\"");
			addChoice("The bomb shelter.", binder("bomb shelter"));
		}

		if (seg == "bomb shelter") {
			append("\"Let's change the subject,\" she says, rattled. \"I didn't know it was so... well, we knew something was wrong, but games get left idle all the time. Humanity's, uh, situation... I was always hoping you guys were alright.\"\n\nShe fiddles with her frock. \"What I'm fuckin trying to get around to saying is: I'm sorry.\"\n\n");
			addChoice("Don't worry about it.", binder("next3"));
		}

		if (seg == "doing great") {
			append("\"Ah, good,\" she says, and doesn't lean back. \"But then why...\"");
			addChoice("We just don't have time to play much anymore.", binder("no time to play"));
		}

		if (seg == "no time to play") {
			append("That softens her. \"Busy, huh? I getcha. Everybody's got a job.\"");

			if (data.bertEntered && !data.hurtBert) {
				append("She looks at Bert under the table and rubs his butt with her foot. Bert shoots a tongue-out doggy smile at her. \"Well, most of us have a job.\"");
			}

			addChoice("Next.", binder("next3"));
		}

		if (seg == "next3") {
			append("\"Anyway...\"\n\n");

			if (!data.bertEntered) append("The sheepdog you saw out front lopes in through his doggy door, interrupting the moment. He fixes you both with a panting smile and hops up onto a simple wooden chair nearby.\n\n\"That's Bert's chair,\" Roxelle says, shaking her head. \"Worn to heck. It's a good thing he doesn't care for velvet, otherwise your ass'd be sore by now, sitting on that old thing.\"\n\n");

			if (data.hurtBert) append("The wooden chair is making your ass a little sore.\n\n");

			append("She gets up and tests the pie again. \"Well... hotter than a Kentucky summer, from what I've heard. But cooler than it was. Shall we dig in?\"");

			addChoice("Sure.", binder("sure"));
			data.bertEntered = true;
		}

		if (seg == "sure") {
			append("Together you devour the pie, the thick glowberry mix burning the roof of your mouth a little. ");
			if (!data.hurtBert) append("Rox slides a slice onto Bert's chair and he wolfs it down, happy to be part of the fun.")
			else append("Rox slips a slice underneath the table and Bert takes a few morose nibbles at it.");

			append("\n\nIt tastes exactly like chocolate-coated watermelon.\n\n");

			addChoice("End.", binder("end"), {give: ["Glowberry Pie", 3]});
		}

		if (seg == "spill") {
			if (data.choseTea) append("You go for a sip with an over-dainty pinky-cocked gesture and drop the cup to your lap. Milky white splashes all over you.");

			if (data.choseBooze) {
				append("You take another slurp of blue and the delayed buzz from the first sip kicks you directly in your ass. This is potent stuff.\n\nYou begin to wonder how Roxelle put away two of these so fast. Sloppily, doing a horrible acting job, you pretend to lose your grip on the glass and it splashes over your ");

				if (data.hasBoobs) append("top. Your boobs catch most of it, but some still trickles down onto your crotch.") else append(" chest and pools in your lap.");
			}
			append("\n\nRoxelle cocks an eyebrow.\n\n");

			if (!data.hurtBert && !data.bertEntered) {
				append("\"Here,\" she says, getting up, drink rippling a little as her growing cockbulge brushes against the table's edge. She pulls a warm, wet flower-print cloth from nowhere and dabs gently at the mess.");
				addChoice("Better wipe a little harder. It's really soaked in there.", binder("wipe harder"));
			}

			addChoice("Better take these off...", binder("better take off"));
		}

		if (seg == "wipe harder") {
			data.wipeHarder = true;
			append("Rox wraps an arm around you to keep you steady and gives your ");

			append(pickByGender(
					"bulge a vigorous groping, unabashedly stuffing the hot towel down your pants and basically jerking you off with it before reaching down further yet and dragging it over your nuts.",
					"tits a vigorous groping, unabashedly stuffing the hot towel down your shirt and getting deep between them.",
					"bulge a vigorous groping, unabashedly stuffing the hot towel down your pants and basically jerking you off with it. She reaches down further to wipe the wetness beneath, too..."
			));

			append("\"There,\" she says, sitting back down with a drunken flop, smiling about twice as wide as she was. \"All clean?\"");

			addChoice("I'm even wetter now.", binder("better take off"));
		}

		if (seg == "better take off") {
			append("You slip off your soaked shirt and pants, and the warm kitchen air washes over your skin. ");
			if (data.hasBoobs)
				append("You aren't wearing a bra, and there's no chill to blame for the way your nipples stand all puffily erect.\n\n");

			if (data.hasCock || data.hasCunt) append("Rox eyes your undies, soaked with a little more than your drink now.");
			if (data.hasBoth) append("Rox eyes your panties, soaked with a little more than pre now, dripping like a waterfall near the spot where your thighs meet.");

			if (data.wipeHarder) append("\n\n\"You weren't kidding.\"");

			addChoice("Looks like these have to go, too.", binder("these have to go"));
		}

		if (seg == "these have to go") {
			append("You slip your "+(data.genderFemale||data.genderNeutral?"panties":"underwear")+" off and shyly step out of them, Roxelle's eyes glued to your junk. \"Well,\" she says, getting up and stretching ");

			if (data.choseBooze) append("with a little drunken wobble ");

			append("before stepping gingerly towards you, untying her apron and letting it flop to the ground.\n\nAs she approaches her semi-soft cock twitches to life, rising to a staggering eleven inches. She wraps you in a tight hug, the head slobbering pre all over your belly button.\n\n\"Don't know how... uh... <!i>authoritarian<!i> you like your cow ladies, but I— well, I'll just try it out...\"\n\nShe takes a deep breath, steels her expression, drops her eyelids, and whispers: \"Kneel.\"");

			addChoice("Kneel.", binder("kneel"), {kinks: ["Art"]});
		}

		if (seg == "kneel") {
			append("You sink to your knees.\n\nShe inches closer, watching your expression with poorly hidden anxiety, until finally her cockhead is throbbing up against your lips, painting them with thick globs of "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"precum.");

			addSprite("assets/img/effect/roxelleCock.png").onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Lamia", "");
			addChoice("Lick it.", binder("lick"), {kinks: ["Raunch"]});
			addChoice("Get nervous and run away.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "lick") {
			append("You drag your tongue slowly over her drooling slit before working down the shaft, cupping the bulge of her urethra close with your tongue. Along the way she rocks her wide hips, grinding a little too hard, precum leaking down over your forehead and nose in thin, silken strands.\n\nOnce you finally reach the base she works her fingers into your hair and closes them into a fierce fist, pulling your mouth and nose up between her fat nuts, the constant pre-trickle soaking into your hair now.\n\n\"Inhale.\"");

			addChoice("Inhale.", binder("inhale"));
		}

		if (seg == "inhale") {
			data.roxInhaledMusk = true;
			append("Your nostrils burn as you fill your lungs with Roxelle's musk, rivulets of her never-ending pre stream forking on your forehead and coalescing in your eyelashes. She keeps your nose buried deep between her nuts until you've taken five good, deep breaths, then finally pulls off and lines her cock up to your lips.\n\n");

			addChoice("Catch my breath.", binder("lipstick"));
		}

		if (seg == "lipstick") {
			if (data.roxPlayedCool && !data.roxInhaledMusk) append("You get about as far as \"Thank—\"\n\n");
			if (data.roxInhaledMusk) append("You cough and quaff a few precious breaths of fresh air before she takes advantage of your parted lips and crams four thick inches of cowcock into your mouth, the head throbbing and spewing more goopy strings of pre which pool under your tongue and trickle over your soft palate as you involuntarily swallow on her cockhead.\n\n");
			if (data.roxPlayedCool && !data.roxInhaledMusk) append("She grins. \"Thanks yourself.\"\n\n");

			append("Keeping her grip firm but clearly trying to go gentle on you, she coaxes your mouth closer to her crotch and begins to work the head down, basically not-so-dry-humping your uvula.");

			addChoice("Take it.", binder("take it"));

			if (data.choseTea || (!data.choseTea && !data.choseBooze))
				addChoice("Get a little queasy...", binder("queasy"), {kinks: ["Vomit"]});

			if (data.choseBooze)
				addChoice("I think I had too much wine... HRRRK!", binder("queasy"), {kinks: ["Vomit"]});
		}

		if (seg == "take it") {
			append("You open wide and let her ravage your throat, fat white splurts of milk leaking from your nose. Rox drags a grope over your neck and feels herself throb inside you.\n\n\"Look at you.\" Rox shoves her cock down as deep as possible, and then pushes a little further just for the fun of it, her nuts squishing up against your chin. Lovingly she holds your face to her crotch and waits a couple seconds... two more... three more...");

			addChoice("Tongue-bathe her balls.", binder("tongue"));
			addChoice("Tap out.", binder("tap out"));
		}

		if (seg == "tongue") {
			data.roxNutsBathed = true;
			append("Somehow you manage to wiggle your tongue out and work it over her nuts, each about the size of your fist, the flavor of her sweat soaking into your taste buds. Four more seconds. Amused, Rox helps you out a bit and wipes her nuts across your tongue, making sure your tongue collects the beads of perspiration hanging from all those hard-to-reach spots.\n\nSix more seconds. Rox stares at you, amazed, caressing your cute blue cheeks and cinching your nose closed tight with two fingers. Not that you could use it in the first place.\n\nShe looks into your watery eyes. \"Almost a minute now, darling. You must really love the taste of my nuts, huh~?\"");

			addChoice("Pass out.", binder("pass out"));
			addChoice("Tap out.", binder("tap out"));
		}

		if (seg == "pass out") {
			data.passedOut = true;
			append("Your nose throbs a little as Roxelle pinches it shut tight. At light speed she shoves a morsel of cockmeat in and out of your throat, never pulling enough out to let you so much as taste the fresh air.\n\nYour rolled-up eyes flutter closed once, then again, then for good. The last thing you feel before sinking into the crude-oil pond of unconsciousness is Rox pulling eleven saliva-soaked inches of cock slowly from your mouth.");

			var s = addSprite("assets/img/effect/black.png");
			s.alpha = 0;
			tween(s, {alpha: 0.4}, 2);

			addChoice("Next.", binder("next4"));
		}

		if (seg == "tap out") {
			append("You tap her thigh desperately, cheeks turning blue, gagging and coughing a little as her cock pours pre directly into your stomach.\n\n\"Awww. Only "+(!data.roxNutsBathed?"fourteen seconds.":"a little over a minute.")+"Some cityfolk gotcha beat there. I think I've seen a girl choke on cock for a full six minutes before she finally gave out.\n\nRox pulls off and dries her saliva-soaked shaft on your face while you catch your breath.");

			addChoice("Next.", binder("next4"));
		}

		if (seg == "queasy") {
			data.roxChosePuke = true;
			if (data.choseBooze) append("Blue "+(isActive("Candy Ring")?"raspberry candygoop":"bile")+"") else append((isActive("Candy Ring")?"Creamy candygoop":"Creamy bile"));
			append("surges from your stomach and rushes warm against her cock. She mumbles an insincere apology as your eyes roll up and start to water... then shyly pushes her hips forward and slips a couple more inches down your involuntarily constricting throat, watching with morbid curiousity as thick "+(isActive("Candy Ring")?"molten taffy":"puke")+" splutters out from your nostrils, pouring out over her shaft and dripping onto ");

			append(pickByGenitals("the bulge in your undies.","your dripping panties.", "your smooth stomach."));

			addChoice("Softer.", binder("softer puke"));
			addChoice("Harder.", binder("harder puke"));
		}

		if (seg == "softer puke") {
			append("Rox opens the flood gates and ejects her cock with a pop. A "+(isActive("Candy Ring")?"candy ":"puke-")+"torrent pours out over your "+(data.hasBoobs?"soaked breasts":"chest")+", bathing her cockhead a "+(isActive("Candy Ring")?"in bright, saccharine colors":"cute brown-beige")+".\n\nShe leans down with a sigh and kisses you hard on the mouth, sucking the "+(isActive("Candy Ring")?"candy":"filth")+" from your lips~");

			addChoice("Next.", binder("next4"));
		}

		if (seg == "harder puke") {
			data.harderPuke = true;
			append("Roxelle yanks her cock from your throat, coated and dripping. She hesitates for a second— then steels herself into Roxelle The Brutal Dom and slaps you across the face with it, leaving a "+(isActive("Candy Ring")?"sweet":"creamy")+" smear on your cheek.\n\nShe grins, letting you down gently onto your back... then she straddles your face, casually bouncing her dick on your nose.\n\n\"Open.\"");

			addChoice("Open.", binder("open"));
		}

		if (seg == "open") {
			append("Using your "+(isActive("Candy Ring")?"candygoop":"tummysludge")+" as lube, she slips her cock easily back down your throat and after a few practice thrusts picks up a jackhammer rhythm, hips slamming against your face, forcing you to puke"+(isActive("Candy Ring")?" taffy":"")+" again. Even as you gag and coat yourself "+(isActive("Candy Ring")?"shiny with sugar":"with your own filth")+" she doesn't let up for a second, still facefucking you so hard her nuts slap wet against your chin.\n\nAt around the fiftieth bounce of your head against the floor, Rox finally slows it down and pulls her cock out with a wet <!i>pop<!i>, whistling at the sight of your gaped-out mouth. She tests your jaw, tilting it up and down a little.\n\n\"Still in working order, are we? Good.\"\n\nShe goes at it for fifty more.");

			addChoice("Next.", binder("next4"));
		}

		if (seg == "next4") {
			if (data.passedOut) {
				var s = addSprite("assets/img/effect/black.png");
				s.alpha = 0.4;
				tween(s, {alpha: 0.4}, 2);

				append("You wake with sore, swollen lips and a tingliness in your extremities. Rox is looking a lot better in the mouth department. She took the opportunity to head upstairs and put on some lipstick, you think?? Either way, they're both full and red and sexy as heck.\n\nShe checks your pulse with a toe and nods. You can't help but notice her dick is still pointing healthily skyward. \"You were out for a couple minutes there. Really took me like a champ, I gotta say.\"\n\n");
			}

			append("She strokes herself, squeezing a bead of "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"precum from her slit. \"Now... I did hold off, mind you... so: where do you want it?\"");

			addChoice("Down my throat.", binder("down throat"));
			addChoice("On my face.", binder("on face"));
		}

		if (seg == "down throat") {
			if (data.passedOut || data.harderPuke)
				append("\"Really?\" she asks. \"After so much throat abuse, you still want more~?... Well, you asked for it.\"");
			else 
				append("\"Well, you asked for it.\"");

			append("\n\nYour"+(data.roxChosePuke?" puke-lubed":"")+" throat gives way to eleven immediate inches of cowcock which plunge ");

			if (data.passedOut) {
				append("directly down your windpipe. Rox holds your face against her musky crotch and looses a grit-teeth growl of raw pleasure (as much as a cow can growl, anyway), filling both of your lungs with a couple gallons of her milk.");
			} else {
				append("down your esophagus. Rox holds your face directly against her musky crotch and looses a grit-teeth growl of raw pleasure (as much as a cow can growl, anyway), filling your stomach with a couple gallons of her milk, making it bulge out big and round and cute.\n\n\"Ahhhh.\" She pulls off, letting ");

				if (data.roxChosePuke)
					append((isActive("Mood Ring")?getMood("Roxelle"):"")+"cum flow freely from your mouth, over your chest, giggling as it overflows from your nostrils and your ears— even a tiny rivulet dripping from your belly button.");
				else
					append("your mouth gapes open and cum-soaked.\n\n\"Thank you, darling.\"");
			}

			addChoice("Wind down.", binder("wind down"));
		}

		if (seg == "on face") {
			append("Rox straddles your chest and strokes herself into a tizzy, panting and boob-jiggling her way to a fierce orgasm. Her face contorts into an adorable expression of blissful embarassment as one, two, five, eight thick splurts of "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum paint your face, pooling in your mouth, coating your eyelashes.\n\nShe collapses onto you and covers your face with lazy kisses, completely spent, slurping her cum from your lips.\n\n\"Thank you, darling.\"");

			addChoice("Wind down.", binder("wind down"));
		}

		if (seg == "wind down") {
			append("After a little clean-up and a "+(data.hurtBert != true?"friendly ":"")+"chat, Rox checks the glittery pie leakage again.\n\nShe blinks. \"Ah. We must've been at it for longer than I thought. It's... kinda chilly.\"\n\nShe cuts slices for two and sticks them both in the oven for a little while on sturdy ceramic plates. Then, together ");

			if (data.bertEntered) {
				append("with Bert ");
				if (!data.hurtBert) append("panting happily on his chair, ") else append("sulking underneath the table, ");
			}
			append("you finally dig in.\n\nIt tastes exactly like chocolate-coated watermelon.");
			addChoice("End.", binder("end"), {give: ["Glowberry Pie", 3]});
		}

		if (seg == "end") {
			data.roxVisits = 1;
			append("Rox insists you take three glowberry pies she's had kicking around for too long before you leave. As you head back down the porch, along the winding path that slopes away from her farm and back into the bioluminescent undergrowth, she waves goodbye");

			if (!data.hurtBert) append(" with a hand whilst Bert waves goodbye with a tail.") else append(".");

			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}
	}

	public static function roxSecondVisit(seg:String="none"):Void {
		saveCheckpoint("Roxelle.roxSecondVisit('"+seg+"');");
		function binder(bindTo:String):Void->Void {
			return roxSecondVisit.bind(bindTo);
		}

		clear();

		if (seg == "none") {
			unlockJournal("Rox second visit");
			data.roxVisits = 3;
			append("The mossman does not wave back. He drops from the roof with a sudden jerky movement down onto a fat pair of glowing mushrooms the size of his head, then wolfs them down in three bites.\n\n\"Don't eat the flora,\" Rox says, motherly, holding the door open for you. \"You'll end up like Archie.\"");

			addChoice("Archbishop?", binder("archbishop"));
		}

		if (seg == "archbishop") {
			append("\"Yeh. His file got corrupted...\"");
			addChoice("Next.", binder("next"));
		}

		if (seg == "next") {
			append("You lose track of him for a second, then catch him with his cyan eyes on you from the end of a hallway of glowcornstalks. The way the moss twists around his mouth suggests a smile.\n\n\"Come inside,\" she hisses. \"Never know what he's liable to do!\"");

			addChoice("What has he done?!", binder("what done"));
		}

		if (seg == "what done") {
			append("\"All kinds of shit,\" she says, hustling you inside, her boobs squishin all up on your back. \"Seriously. I saw him eat a whole stalk of glowcorn once. <!i>Roots and all.<!i>\"\n\nShe sits you down in "+(!data.hurtBert?"the velvet chair ":"whichever chair ")+" and hurries to the stove.\n\nShe stops. \"Wait.\"");

			addChoice("Wait.", binder("wait"));
		}

		if (seg == "wait") {
			if (!data.roxWaited) {
				append("...");
				addChoice("Keep waiting.", binder("keep waiting"));
			} else {
				append("She reaches into her berry basket and deflates.\n\n\"Goddamnit.\"\n\nOn the counter you notice a thawed pie shell, sprinkled lightly with flour and cinnamon, and a pie top with the rolling pin sitting sunken in soft dough. \"I'm out of glowberries.\"");

				addChoice("Here.", binder("here"), {cost: ["Glowberry", 20]});
				addChoice("Hey, are glowberries safe to eat? Or am I gonna become like moss man?", binder("are they safe"));
				addChoice("Isn't this place surrounded by glowberry trees? Why don't we go pick some?", binder("pick some"));
			}
		}

		if (seg == "keep waiting") {
			append("......");

			addChoice("Wait more.", binder("wait more"));
		}

		if (seg == "wait more") {
			append("........................................................................................................................................................................................................................................................................................");

			addChoice("Continue to wait.", binder("continue wait"));
		}

		if (seg == "continue wait") {
			data.roxWaited = true;
			append("................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................");
			addChoice("What's wrong?", binder("wait"));
		}

		if (seg == "here") {
			append("You and Rox both get distracted by a smudge of flour on her ass at the same time. She licks a thumb and wipes it off, sucks it clean, then turns to you and furrows her brow.\n\n\"No thanks. I don't do charity.\"");

			addChoice("I want more pie though.", binder("i want pie"));
		}

		if (seg == "pick some") {
			append("\"Well yeah, but <!i>he's<!i> out there.\"\n\nShe peels the floral curtains from the kitchen window then leaps back, jiggly bits going everywhere as she reels and stumbles.\n\nMossman has his face pressed to the glass. The light from his unblinking eyes floods the dim-lit kitchen with clinical alien blue light.\n\n\"Lord have mercy upon my soul and deliver me unto heaven, Lord be merciful, Lord please make this moss guy fuck off, O Lord,\" Rox mutters quickly, crossing herself.");

			addChoice("Am I going to end up like that thing if I keep eating glowberries?", binder("are they safe"));
		}

		if (seg == "are they safe") {
			append("\"Yeah probably,\" she says, stroking her chin. \"No one's been mossified in over sixty years, and we drink a <!i>lot<!i> of wine. Heck, I've even seen this little raccoon boy— Bins, you might've met him— he chewed through about a million of them, not even for an eating contest or anything, he's just an inflation fetishist, you know, loves to get all fat and ballooned, moanin and rubbin his big belly— and Bins <!i>still<!i> didn't get mossified, even when all the glowberries started to splurt out of his—\"");

			//if (data.sawAutoMynt) addChoice("I know exactly what you're talking about.", binder("know exactly"));
			//else addChoice("I have no idea what you're talking about.", binder("no idea"));
			addChoice("Are you trying to gross me out? Because it's having the opposite effect. <3", binder("hot"));
			addChoice("You people digust me.", binder("fucked"));
			addChoice("Oh hey I just remembered, I have these. :3", binder("here"), {cost: ["Glowberry", 20]});
		}

		if (seg == "know exactly") {
			append("\"You've been to the basement, then?\" she says, stiffening in posture and crotch. \"How was... that?\"");

			addChoice("It was completely fucked.", binder("fucked"));
			addChoice("It was pretty hot.", binder("hot"));
			addChoice("Do you know a bull named Cage?", binder("bull named cage"));
		}

		if (seg == "fucked") {
			append("\"Sorry to hear that,\" she says. \"I know how you feel. Things can get a little overwhelming in here. Some days you wake up and you're just exhausted with all the sex, sex, sex, sex, sex, sex, sex, sex, sex, sex, se—\"");

			addChoice("I get it.", binder("next 2"));
		}

		if (seg == "hot") {
			append("\"That so~?\" she says, leaning back against the counter, her cock straining the fabric of her tied-tight apron. \"Well, if you can handle that, you can handle anything.\"");

			addChoice("Next.", binder("next 2"));
		}

		if (seg == "bull named cage") {
			append("\"Oh, him, sure. I know about half the island by now, probably. Socialite, unlike a certain lamb I know...\"");

			addChoice("Thoughts?", binder("thoughts"));
		}

		if (seg == "thoughts") {
			append("\"He's a fuckin prick. Can't count the number of times he's come over to hang out and ended up drinking half my booze and hogging all the Fuckmeat.\"\n\n");

			if (!data.cagePhoneNumber) {
				data.cagePhoneNumber = true;
				append("Her eyes pop open and she seems stricken by a bolt of nostalgia. She reaches deep into the left apron pocket, pulling out clumps of recipies, corks, a few coins... then a crumpled slip of paper with a phone number on it. \"Here, call him up if you ever get the chance. Don't read too far into it but I do have his number memorized, so don't worry if you lose this. Tell him he's a prick for ol Rox.\"");

				addChoice("Thanks.", binder("next 2"));
			} else {
				addChoice("Next.", binder("next 2"));
			}
		}

		if (seg == "no idea") {
			append("\"What can I clarify?\"");

			addChoice("Who's Septrica?", binder("who sept"));
			addChoice("What's an AUTO-MYNT?", binder("what auto mynt"));
		}

		if (seg == "who sept") {
			data.rox2Septrica = true;
			append("Rox considers the ceiling, collecting her thoughts. A warm, nostalgic smile melts over her lips.\n\nThen...\n\n\"Sociopathic megalomaniacal gecko bitch. Yeh, I'd say that about sums her up.\"");

			if (!data.rox2AutoMynt) addChoice("Ah. And the AUTO-MYNT?", binder("what auto mynt"));
			else addChoice("Next.", binder("next 2"));
		}

		if (seg == "what auto mynt") {
			data.rox2AutoMynt = true;
			append("\"It's a computer terminal doohick, a mindless little shadow of Mynt. You punch in what you want and it spawns it for you. A couple were repurposed as AUTO-SHOPS— they only spawn things for price. The ones in the basement, though... they're free. Easy to abuse, obviously... so Septrica gives out the passes personally.\"");

			if (!data.rox2Septrica) addChoice("Ah. And Septrica?", binder("who sept"));
			else addChoice("Next.", binder("next 2"));
		}

		if (seg == "i want pie") {
			data.rox2GettinWine = true;
			append("\"Well...\" She considers for a second. \"I'll trade you for it. Let's take a little trip down to the wine cellar, eh? x20 Glowberries for x1 bottle of Glowberry Wine.\"");

			addChoice("Deal.", binder("next 3"));
		}

		if (seg == "next 2") {
			append("\"Anyway,\" she says, casually groping herself through her apron, pouting at the empty berry basket. \"I'm gonna make this pie if it kills me. Might have some extra stores tucked away downstairs. Want a basement tour~?\"");

			addChoice("Sure.", binder("next 3"));
		}

		if (seg == "next 3") {
			if (data.rox2GettinWine) {

				append("She scoops up your double palmful of glowberries and whips the pie into shape, throws the oven door open, flaps a mitt around to disperse the blast of heat, and then frisbees the pie in and kicks the door closed.\n\nShe's a very violent baker.\n\n");
			}

			append("Rox slams a fist on a blank stretch of wall and it whizzes open to reveal an old oak door with a slat instead of a knob. \"Used to use the downstairs for 'illicit activities,' so the entrance had to be secret. Not the fun kind of illicit activities. Long story. Decades ago. Gecko bitch. I'll tell you about it sometime.\"\n\nThe steps are steep and far-spaced. Rox heads down first, giving you a view of her butt. You spot "+(data.rox2GettinWine?"another ":"a ")+"tiny smudge of flour right above her pucker. Well, something white, anyway...");

			addChoice("Slap her ass directly on the hole.", binder("slap"));
			addChoice("Follow her.", binder("follow"));
		}

		if (seg == "slap") {
			append("You bring your open palm down on her exposed hole, her buttmeat quaking with the force of it, the sound of your hearty slap echoing in the depths of her basement.\n\nWith a loud squawk she loses her footing and falls down the stairs.");

			addChoice("Shit! Sorry!", binder("sorry"));
		}

		if (seg == "sorry") {
			append("From the darkness you hear a series of murky muffled curses, then a forced cheeriness: \"Perfectly fine dear! Futa cow ass is very slappable, I've been told! Just come on down here, towards my voice... I won't beat ya too mercilessly...\"\n\n\"Wait,\" she says. \"Do you hear that?\"");

			addChoice("Hear what?", binder("hear what"));
		}

		if (seg == "hear what") {
			append("\"Sounds like...\"\n\nYou listen hard.\n\nIt's wet, rhythmic. Sounds like... sounds like...\n\nChewing.");

			addChoice("Next.", binder("next 4"));
		}

		if (seg == "follow") {
			append("It's dark down here...\n\nShe stops abruptly, your crotch squashed up against her bare butt. \"Shhh!\" she says. \"Hear that...?\"\n\nYou listen hard. There's just the hint of a sound... something kinda wet... kinda rhythmic.\n\nChewing.");

			addChoice("Next.", binder("next 4"));
		}

		if (seg == "next 4") {
			append("All it takes is a glint of two glowing eyes in the darkness to spin Rox around and send her sprinting up the stairs. She hauls you by your crotch mostly, taking the steps two at a time, hurling you into the kitchen, out the front door, until you finally get your own footing and fall into step behind her.\n\n\"HE'S IN THE HOUSE! J"+(data.myntJenga?"ENGA":"ESUS")+" FUCKING CHRIST HE'S IN THE HOUSE!\"");

			addChoice("Where are we going?!", binder("where going"));
		}

		if (seg == "where going") {
			append("The mossman sprints after you with big sloppy steps, his jaw working at empty air, ankles dripping clumps of dank blue.\n\n\"Floatillery!\" Rox pants, diving onto the trail, her size not slowing her down one bit. \"Open water! People! <!i>TORCHES!<!i>\"");

			addChoice("Next!", binder("next 5"));
		}

		if (seg == "next 5") {
			setLocation("The Floatillery");
			append("You run for probably ten minutes along the dark twists of the path before bursting out of the treeline onto open sand. The moonbathing otters glance over, not-so-subtly filling their eyes with the sight of the near-naked sweaty cow doubled over gasping for air.\n\n\"Hi Rox,\" one says. \"Archie chasing you again?\"\n\n\"The bastard (pant) won't (pant) quit...\"\n\n\"You think she'd start to slim up, after the tenth time or so...\" one whispers to the other.\n\n\"I HEARD THAT!\"");

			addChoice("I think we lost him...", binder("lost him"));
		}

		if (seg == "lost him") {
			append("Rox drags herself along the planks of the wharf, still looking over her shoulder, paranoid. \"Probably (pant) right... ");

			if (data.rox2GettinWine) {
				append("Anyway, we <!i>are<!i> at a distillery. (mini pant) I've got a friend who works the phones here. Maybe I can weasel a bottle out of him for ya.\"");
				addChoice("Sure.", binder("distil"));
			} else {
				append(pickByGender("Man", "Girl", data.playerName));
				append("... I gotta take a (WHEEEEZE) breather, but tell you what... (paaaaaaaant)... scrounge me up some glowberries, let's say, oh, x20 or so, and I'll pull some strings and get you x1 bottle of Glowberry Wine from a little lamb who works the phones here. Sound (DEEP INHALE) good?\"");

				addChoice("Sure.", binder("quest accept"));
			}
		}

		if (seg == "quest accept") {
			data.roxQuestAccepted = true;
			append("\"Thanks... I know this is all a bit much at once. Things get pretty fuckin loosey goosey around here. Anyw(HEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEZE)... I'll... be here... catching... breath...\"");

			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "distil") {

			var age:String = "nil";
			if (isActive("Pastel Ring")) age = "six" else age = "twelve";
			if (onFA()) age = "[EIGHTEEN YEARS OF AGE]";

			append("Though she seems like she'd rather get about twenty or thirty more deep breaths, Rox leads the way across rickety bridges, around little floating huts, under strings of hanging torches, and finally comes across a little locked door set into the side of the main building.\n\nShe knocks. Then again. And again... \"Recluse,\" she says.\n\nShe whips a key out from her apron and opens the door to reveal a perfectly tidy room, stacks of books in every corner, convoluted little machines and switchboards and stray tech lined up nicely between toolboxes on a desk with two pink plastic rotary phones.\n\n\"Som!\" she calls. \"Come out from under your rock and meet the new player!\"\n\nA timid little lamb, "+age+", peeks out from his hiding spot in a laundry hamper. His voice comes out muffled through clothes: \"Player...?\"");

			addChoice("Hi there. I'm "+data.playerName+".", binder("name fill"));
		}

		if (seg == "name fill") {
			data.metSom++;
			append("He hides again.\n\n\"Come on, you little...\"\n\nShe digs Som out with both hands and stands him up while he squeaks and blushes, completely nude in front of this stranger. His wool is light, curled, supersoft on his belly, and he nervously covers himself with two hands.\n\nThere's a tattoo of a manacle on his left wrist.\n\nRox grins, reaching down and groping that cute poof tail before spinning him around to show you he's got two sparkle-pattern six-inchers and a fat string of beads jammed up his butt. \"Hope we aren't interrupting anything, Som...\"\n\n\"It wasn't me!\" he squeaks. \"Boss said! Boss said I have to!\"\n\nRox looks at you over the lamb's shoulder and points at the beads, mouthing \"YANK.\"");

			addChoice("Yank em. >:3", binder("yank"));
			addChoice("What's all this machinery stuff?", binder("what machinery"));
			addChoice("So, about that wine...", binder("about that wine"));
		}

		if (seg == "yank") {
			data.rox2Yanked = true;
			append("You come up behind the lamb as Rox holds his quivery butt in place with a palm on each cheek, gently pulling them apart for you. \"Boss said? Boss said you had to stuff your ass full of toys?\"\n\n\"Well... um... just one... you know, company policy. But, I figured— I figured if I wanna make employee of the month I gotta go above and beyoOOOOONN—\"\n\nYou yank the beads from his butt, twenty fat wet orbs plp-plp-plp'ing as they rip past his pucker, drawing out a little bleating moan. On the last bead you slow down and pull gently, watching his butt open wider and wider, hugging the diameter, until... <!i>pop~!<!i>\n\nThe lamb cums and squirms and sighs all at once in an exasperated tizzy.\n\n\"Good boy,\" Rox says, scooping up some goopy "+(isActive("Mood Ring")?getMood("Som")+"jizz":"white")+" from her stomach and wiping it in his hair just because. She reaches down to cram the six-inchers in as far as they can go, and then a little more. Som squeals pitifully and buries his face in her tits, "+(isActive("Mood Ring")?getMood("Som"):"")+"cum running down the nape of his neck. \"Roooox... now I gotta go for a swim...\"");

			if (!data.rox2Machinery) addChoice("What's all this machinery stuff?", binder("what machinery"));
			addChoice("So, about that wine...", binder("about that wine"));
			if (data.hasCock || data.hasBoth) addChoice("Ram my cock in alongside those six-inchers.", binder("ram"));
		}

		if (seg == "ram") {
			var age1:String = "nil";
			var age2:String = "nil";
			var age3:String = "nil";
			if (isActive("Pastel Ring")) age1 = "six-year-old" else age1 = "twelve-year-old";
			age2 = "cubcunt";
			age3 = "underaged";

			if (onFA()) {
				age1 = "[EIGHTEEN YEARS OF AGE]";
				age2 = "[CHARACTER WHO IS EIGHTEEN YEARS OF AGE]";
				age3 = "[OF AGE]";
			}

			append("You slip your cock along his plush lambcrack, smearing pre into the warm wool, pressing your chest to his shoulder blades. He blinks and dislodges his face from Roxelle's tits to fix you with a terrified blink.\n\n\"Wait... first, let me take them out—\"");

			if (isActive("Pastel Ring"))
				append("He takes triple penetration surprisingly well for being such a tiny "+age1+", your cock hilting in his hole's incredible tightness, warm and creamy as butter in the summertime.");
			else
				append("The moment your cockhead pops inside his little "+age1+" hole he tenses in a bleating squeal and starts whining to Rox: \"Noooo, please, please, just take one out~! One! I'm stretching too wide!\"");

			append("Rox pulls him from her tits by his shaggy hair and spits in his face, the glob of saliva landing with a spat directly on his forehead. \"The first player in how long and you're gonna act like a little bitch when they wanna rape you? Come on, Som. Show some hospitality.\"\n\nSom latches automatically to one of her nipples and sucks hard, still squeaking muffledly each time you drive your cock inside him, but mostly glassy-eyed and completely enveloped now in his submission. \"Good "+age2+",\" Rox says affectionately, spreading his bubbly "+age3+" ass for you. \"Keep your legs open. Let the nice guest triple-fuck you... that's it...\"");

			addChoice("Next.", binder("butt rape"));
		}

		if (seg == "butt rape") {
			append("Rox holds him down while you fuck him silly, mostly stroking his hair and telling him he's cute and that he deserves this. After a while she can't help but join in, cramming her cock down his throat and spitroasting him over his bed with you.\n\nAfter a while you all settle down. He has to keep reaching down to push his toys in deeper, since his hole is so wide-open they keep slipping out...");

			addChoice("What's all this machinery stuff?", binder("what machinery"));
		}

		if (seg == "what machinery") {
			data.rox2Machinery = true;
			append("\"He's a nerd,\" Rox explains, lovingly adding two fingers to his hole and gaping it even wider while he shivers. ");

			if (!data.rox2Yanked)
				append("She gestures even more obviously to the beads and makes a yanking motion, mouthing \"DO IT~!\"\"");

			append("His little lamb ears fold back a bit. \"Am not...\"");

			addChoice(
				"Think you could fix this cell phone?",
				binder("fix phone"),
				{cost: ["Broken Cell", 1]}
			);
			if (!data.rox2Yanked) addChoice("Now yank em. >:3", binder("yank"));

			addChoice("So, about that wine...", binder("about that wine"));
		}

		if (seg == "fix phone") {
			append("The lamb peeks out from between Rox's tits and appraises the little piece of junk in about three seconds. \"Well... um... yes. I took four or five of those apart last weekend.\"\n\nRox grins. \"Nerrrd~!\"\n\n\"Shut up!\"");

			addChoice("Next x3.", binder("next 6"));
		}

		if (seg == "next 6") {
			append("You spend some time watching Som tinker with the broken cell, twiddling screws, screwing twiddles, whilst Roxelle covertly steals the toys from his butt and does something with them over in the corner.");

			addChoice("Examine the secretive cow.", binder("examine cow"), {kinks: ["Scat"]});
			addChoice("That looks complicated.", binder("looks complicated"));
		}

		if (seg == "examine cow") {
			append("You sidle up behind Rox. Turns out she's slurping the lamb's "+(isActive("Candy Ring")?"asscandy":"assgrease")+" from the toys, a few drops of "+(isActive("Candy Ring")?"bright cherry":"brown")+" saliva pattering onto her tits as she maniacally gobbles them.\n\n\"Goway,\" she blurts.");

			addChoice("Next.", binder("next 7"), {give: ["Cell Phone", 1]});
		}

		if (seg == "looks complicated") {
			append("\"Done!\"");

			addChoice("Well then.", binder("next 7"), {give: ["Cell Phone", 1]});
		}

		if (seg == "next 7") {
			data.somCellFixed = true;
			addAction("Make some calls.", "Press numbered buttons in specific orders.");

			append("Som hands you the sparkly new cell phone and thumbs the on button. It lights up with a bright-bells twitter.\n\n\"There you go~!\"");
			addChoice("Thank him and head out.", binder("head out"));
		}

		if (seg == "about that wine") {
			append("\"Oh yeah,\" Rox says. \"I was wondering if I could mooch a bottle or two off of you, Som...\"\n\n\"Again?\"\n\nHe wiggles from her grasp and pulls the toys from his butt with two little schlurps, then sets them down on his modest quilted bed and goes to the phones, checking the lines obsessively to make sure he hasn't missed any calls. \"I just gave you three bottles a couple days ago... did you go through them all?\"\n\n\"Well, yeah... but this one's for "+data.playerName+". I owe em. Come on, Som, "+pickByGender("he's", "she's", "they're")+" the first in, what, half a century?\n\nSom pouts. \"You're an alcoholic.\"");

			addChoice("Just one bottle for me is fine. I won't let her at it, promise.", binder("just one"));
		}

		if (seg == "just one") {
			append("Som considers. \"Well... okay. But. Seriously... watch her.\"\n\nHe slides open a secret cabinet in the wall and pulls out a bright blue bottle of Glowberry Wine, little lamb butt sticking up in the air.");

			addChoice("Next.", binder("distil 2"), {give: ["Glowberry Wine", 1]});
		}

		if (seg == "distil 2") {
			append("Rox pinches Som's buttcheek. \"Now I know where your hiding spot is...\"\n\nSom hands you the bottle and sticks his tongue out at her.");

			addChoice("Head out.", binder("head out"));
		}

		if (seg == "head out") {
			append("You say goodbye and leave. Once you're about ten feet down a swaying bridge between two neighbouring float-cabins, you hear a commotion from Som's.\n\nCuriosity overrides volition. You head back and peek through the door just as it swings open.\n\n\"Goddamit!\" says Som, then from behind—\n\nRox, both arms outstretched, half-toppled out the doorway and wasted already. There's an empty bottle near the bed. \"Waiiiit, wait, wait...\" she says, a dumb grin on her face. \"My cock needs more sucking!\"");

			addChoice("J"+(data.myntJenga?"enga":"esus")+" Christ.", binder("go back in"), {kinks: ["Patreon Commission"]});
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "go back in") {
			append("You head back inside Som's.\n\nYou can hardly feel the cabin swaying on the waves, but for Rox even the littlest tilt sends her stumbling halfway across the room. It's only through a series of incredibly lucky trips that she manages to throw herself ass-down onto the bed once more, wine bottles rattling against the headboard.\n\nShe wrangles her apron off and throws it wherever (it lands with a flutter on Som's head) then shoots you bedroom eyes and pulls her legs up, cock squished between her thighs. Between her ankles you spot her nuts slipping through, about the size of your fist... oh, wait, nope, that's just one of them.\n\nShe parts her knees slowly with a hand on each, half-hard length flopping onto the comforter. Underneath it her nuts throb, squished out to either side, clearly desperate for attention.");

			addChoice("Start with her udders and work my way down.", binder("start with udders"));
			addChoice("Start with her nuts and work my way up.", binder("start with nuts"), {kinks: ["Raunch"]});
			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}

		if (seg == "start with udders") {
			append("You plant one of your frenchier kisses on Rox's left nipple for starters, which earns you a warbled moan. Unable to stand the asymmetry, her hand jumps to the other and she drives two fingers up against the hard little nub, fandangling it, yanking it...\n\nPurely to maintain symmetry, of course, you mirror her ferocity and start grinding your tongue against her leftmost, twiddling it, sucking it...\n\nThen your slobbers sink lower, until a cloudy gloss of milk and saliva soaks the underside of both tits (she takes over where you left off with her free hand) and then you trail kisses down her chubby stomach, paying special attention to her belly button, until you can feel the heat of her cock just below your chin.\n\nShe flexes her cockmuscles to make it pap up against your throat, smirking drunkenly.");

			addChoice("Suck it.", binder("cocksuckery"));
		}

		if (seg == "start with nuts") {
			data.rox3NutsSlurped = true;
			append("You push her thighs open with your face, diving between them and burying your nose deep in her sack; it squishes out over your chin, your slightly parted lips, the barest taste of her musky nutflavor tingling your tongue-tip. Her cock is off to the side, warming your left cheek... she picks it up, groping herself from base to tip at the same time, and flops it down with a <!i>pap<!i> onto your face.\n\nShe smiles, pre leaking into your hair. \"Much better.\"\n\nYou huff nostrilful after nostrilful of raw bovine nutmusk, renowned island-wide, you've heard, as the most eye-watering variety of nutmusk. Indeed, your sinuses burn like a fucking volcano.\n\n\"Awww,\" she coos. \"My crotch smells so good that you're crying with happiness!\"\n\nAfter the fifth inhale (or was it the eighty-seventh? Her aroma is warping your perception of time) you finally give in and open your mouth. One nut slips past your lips readily, smearing sweat over your tongue, and you can't help but practice a little for the main show by sucking it like a cock.");

			addChoice("That's enough practice.", binder("cocksuckery"));
		}

		if (seg == "cocksuckery") {
			append("With startling agility for a chubby drunken cow Rox pulls you up by your hair and locks her legs just underneath your butt. \"That was nice. Real nice. But I'm gonna have to go ahead and facefuck you now, 'kay? Stay still for mama Rox...\"\n\nBetween your crossed eyes you notice, for all her talk, she's still only half-hard. She doesn't seem to realize; she just grinds her floppy, sweaty cock over your face, giving a little mini-moan each time her head happens to slip over or partially past your lips. \"Unhh... such a tight throat...\"");

			addChoice("You're not even in my mouth.", binder("not even in"));
		}

		if (seg == "not even in") {
			append("You say that into her half-chub so it comes out pretty muffled.\n\n\"UNNNHHH... THAT'S IT, DOWN TO THE BASE... MMMPH...\"\n\nOver at his desk Som is trying to focus on his tinkering, apron still draped over his head, glaring at her.");

			addChoice("Tap her.", binder("tap"));
		}

		if (seg == "tap") {
			append("You tap her thigh.\n\n\"HNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNGH— oh, shit, sorry hun... you okay?\"\n\nYou hold her cock up to show her it's barely damp and almost flaccid.\n\n\"Oh... buh... but then... goddamn whiskey dick.\"\n\nShe throws herself (and you by extension) off the bed, growling a cow-growl at her own reclusive member. She strokes it furiously, slaps it around a bit... Nothing works.\n\nShe's blushing.");

				addChoice("Maybe if I stimulate something close to it...", binder("simulate"));
		}

		if (seg == "simulate") {
			append("You reach down and take both her "+(data.rox3NutsSlurped?"sweat-and-spit-slick ":"")+"balls in your hand, massaging them, letting them wander around clockwise and counter-clockwise within her sack. You even throw a fierce squeeze in now and again for punctuation.\n\nShe's closed her eyes, leaning on you to deal with cabin's hypnotic swaying. \"Mmmm... little lower, hun...\"");

			addChoice("Lower.", binder("lower"));
		}

		if (seg == "lower") {
			append("You slip your fingers down along her taint; it reminds you of a big chubby button, so instinctively you press it— like a toy Rox squeaks right on cue.\n\nGoing off of that you press harder, treating it rough, your fingers quickly slickened with her thigh-sweat. After a hunt you find the root of her cock, a little nub buried in her squishy hide, and give her a sort of fingerjob through her taintmeat.\n\nHugging you, her chin on your head, she presses her 75% hard cock to your stomach and whispers: \"Um... I don't usually do this, but, if you really wanted, you could... go even lower...\"");

			addChoice("Go even lower.", binder("even lower"));
			addChoice("75% is good enough.", binder("good enough"));
		}

		if (seg == "even lower") {
			append("You pull your hand out and run drippy fingers down the small of her back, stopping just at the top of her buttcrack.\n\nShe's tense. She grabs your hand.\n\n\"Just... be really gentle.\"\n\nSlowly, finger-by-finger, she lets go.");

			addChoice("Next.", binder("finger butt"));
		}

		if (seg == "finger butt") {
			append("With your free hand you reach between her ample cheeks and pull one to the side, slipping two fingers from the other down her crease. The moment they slide over her fat pucker Rox's cock twitches to 120% hardness against you and her warm, fast breaths suddenly stop.\n\nThough her hole is relaxed and practically already open you still take it extra-slow, dipping the tip of your middle finger inside her ring, then half, then down to the knuckle...\n\n\"Okay,\" she whispers, letting out a huge breath. \"Okay, that's good... that's enough...\"\n\nShe looks down at you, about 130% hard now. Being drunk, she's having trouble masking her true emotions; beneath the pleasure and the blush, she's very obviously scared.\n\nThat changes in a moment, as a wicked grin breaks out over her face. \"You, bed. Mouth, open. Now.\"");

			addChoice("Lay on the bed.", binder("lay bed"));
		}

		if (seg == "lay bed") {
			append("You spread out on the bed, tummy-up, mouth open, and Rox mounts your face with a quick alley-oop.\n\n\"Now,\" she says, and raises her hips. \"Before the wine catches up to me again...\"\n\nLike a spear of lightning from heaven she drives her cock down your throat in a singular thrust, nuts bouncing merrily onto your nose and eyelids. Being so close to the ocean, it's only natural you pick this moment to muse: these aren't your swimming goggles.\n\nRox reaches back and lifts her nuts off your face. \"Can't have my blubber blocking the view,\" she says, pulling her cock slowly from your mouth, revealing her shaft, throbbing, connected to your lips by a few strands of saliva. \"I want you to watch me fuck your throat.\"");

			addChoice("Golly!", binder("next 3 2"));
		}

		if (seg == "good enough") {
			append("\"Hm?\" she asks. \"What's this about percents now? Don't tell me Som's been talking cock tech with you...\"\n\n\"Shut up!\"\n\nShe grins. \"You: bed. Mouth: open. Now.\"");

			addChoice("Lay on the bed.", binder("lay bed"));
		}

		if (seg == "next 3 2") {
			append("Obediently you keep your eyes on her cock as it sinks back down into your mouth, slowly this time. Up close you really appreciate every little part of it; the freckles near the base, the fat flare near the middle, the big flattish head usually only found on horsecocks...\n\nYou press your tongue to her frenulum, then cup her urethral bulge, until finally she's pushing at the entrance to your throat. With only a tiny ~glk~ from you she sinks her wide cockhead past the barrier, shoving aside your uvula, then... pulls out a little bit?\n\nAnd shoves it back in. Out, in. You get it now. She's specifically fucking the entrance to your throat, dragging only an inch or two of her cock back and forth; your tiny ~glk~ turns to a ~GLRRK~ turns to gags so deep and heavy they can't even be onomatopoeized, which is exactly what she was hoping for according to her evil drunken chuckles.\n\n\"Okay,\" she says. \"Nuff foolin' around.\"");

			addChoice("Next.", binder("nextforeplay2"));
		}

		if (seg == "nextforeplay2") {
			append("Rox's knees close around your sides, just underneath your armpits, and you're forced to hold onto her jiggly butt for minimal stability while she rails the fuck outta your esophagus. Every time she bottoms out inside you she gives a little blow of hot air from her snout, which washes over your toes and tickles.\n\n\"M'kay, you've seen enough...\"\n\nShe releases her nuts, letting them bounce against your face with each thrust; she has a knack for knowing just how much you can take, always pulling out to grind her sack over your panting maw for a moment or two just when you're about to pass out.\n\nFinally one of those little breathers extends into a full break, and she rolls onto her back beside you, huffing. \"Hng... hff...\"\n\n... she still hasn't cum, though...");

			if (data.hasCunt || data.hasBoth) addChoice("Present my cunt to her.", binder("present cunt"));
			addChoice("Present my ass to her.", binder("present ass"));
			addChoice("Cuddle time. (End)", binder("cuddle"));
			addChoice("Can I top you now, Rox~?", binder("can i top"));
		}

		if (seg == "cuddle") {
			append("Rox clears her throat, cock throbbing. \"Yeah,\" she says. \"Sure.\"\n\nYou sink in a sea of naked nuzzles, thighs interlocking, a tit more often than not smushed up against your face. Rox pinches Som's clover-pattern covers between two deft toes and kicks up. With a flutter they hide your rampant dandling from Som's jealous glances, letting the poor lamb work in peace.");

			addChoice("Move along.", TheFloatillery.theFloatillery.bind("main"));
		}

		if (seg == "can i top") {
			append("\"Mmm,\" she grunts, looking anywhere. \"Like I said, I don't usually do... errrr... let people do that. To me.\"");

			addChoice("Ah, okay. No pressure.", binder("no pressure"));
			addChoice("Come onnnnn.", binder("come onn"));
		}

		if (seg == "no pressure") {
			append("\"Thanks, hun.\"");

			append("She rolls onto her side and flashes you a drunken grin, "+pickByGenitals("giving your ass a squeeze", "giving your pussy a top-to-bottom grope", "giving your ass a squeeze")+". \"... Doesn't mean I only give a shit about my own pleasure.\" She slaps her balmy cock against your thigh.");

			if (data.hasCunt || data.hasBoth) addChoice("Present my cunt to her.", binder("present cunt"));
			addChoice("Present my ass to her.", binder("present ass"));
			addChoice("Cuddle time. (End)", binder("cuddle"));
		}

		if (seg == "come onn") {
append("\"Don't be pushy, now.\"\n\nShe pushes you over; then re-straddles you and lances a playful cockslap across your face. \"I'm over the moon, having a player here again, but every once in a while you'd get one who would treat ya like a tool.\"\n\nShe shakes her head, cow ears a-flopping. \"Not that I minded at the time. I was young. Anyway. You owe me an apology, "+pickByGender("mister.", "miss.", data.playerName+".")+"\"");

			if (data.hasCunt || data.hasBoth) addChoice("Present my cunt to her as apology.", binder("present cunt"));
			addChoice("Present my ass to her.", binder("present ass"));
			addChoice("Cuddle time. (End)", binder("cuddle"));
		}

		if (seg == "present cunt") {
			append("Teasingly slow... you get to your hands and knees... part both of the latter, their caps running little folds in the bedsheets... reach beneath yourself... pull both lips apart... two fingers on each side, chest sunken against mattress... and peek at Rox over your shoulder.\n\nYou don't think she could make eye contact if she tried. She's gawking at your pussy, cowcock pressed to her stomach and a hand over her heart. \"Juh... just fer me?\"");

			addChoice("Yes. For you.", binder("cunt fuck"));
		}

		if (seg == "present ass") {
			append("You shift to hands-and-knees then pull the latter underneath you, butt dropping onto your heels. You reach back and walk each finger except thumbs with tantalizing care into the crease of your ass before yanking your cheeks apart, letting your chest sink to the mattress, and relaxing your pucker such that it puffs out just a tiny bit; presently you smirk at Rox over your shoulder"+pickByGenitals(", nuts resting neatly behind your feet.", ".", ", nuts resting neatly behind your feet.")+"\n\nYou don't think she could make eye contact if she tried. She's gawking at your ass, cowcock pressed to her stomach and a hand over her heart. \"Juh... just fer me?\"");

			addChoice("Yes. For you.", binder("ass fuck"));
		}

		if (seg == "cunt fuck") {
			append("\"Thank you,\" she says simply. She runs a hand between your shoulder blades to grip the nape of your neck, then without much ceremony plugs about an inch of cockmeat inside your spread cunt, her free hand snaking around to rest on your lower stomach. A single finger wanders down "+(data.hasBoth?", following the bulge of your urethra, slipping between your nuts and coming ":"")+"to rest on your clit.\n\n\"Now back onto my cock.\"\n\n<!b>ACTIONS: 4<!b>");

			data.rox3ChoseCunt = true;
			data.rox3ChoseAss = false;
			addChoice("Slam my hips back. (4)", binder("rox3actions4"));
			addChoice("Take all but a morsel. (3)", binder("rox3actions3"));
			addChoice("Swallow a couple inches. (2)", binder("rox3actions2"));
			addChoice("Take it slow... (1)", binder("rox3actions1"));
		}

		if (seg == "ass fuck") {
			append("Her fingers slide over the sides of your neck until she has a sturdy grip on the nape. \"Thank you,\" she says simply, and rams her flat cockhead up to your taint, smearing "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"precum up and down. A finger on her free hand lingers alongside for a moment. Then, she brings it up to your hole and smears little pre circles around your ring, slipping inside a little, tugging you open... lining her cock up.\n\n\"Wow,\" she mouths. She adds a second and third, stretching you easily. \"Someone's hungry...\"\n\n<!b>ACTIONS: 4<!b>");

			data.rox3ChoseCunt = false;
			data.rox3ChoseAss = true;
			addChoice("Slam my hips back. (4)", binder("rox3actions4"));
			addChoice("Take all but a morsel. (3)", binder("rox3actions3"));
			addChoice("Swallow a couple inches. (2)", binder("rox3actions2"));
			addChoice("Take it slow... (1)", binder("rox3actions1"));
		}

		//{{{Complex action branches
		if (seg == "rox3actions4") {
			append("\"Nrgh!\"");

			if (data.rox3ChoseCunt) append("The lips of your cunt slam down against her crotch, a single bead of oil running the seam between her fat nuts.\n\n");
			else append("Your hole twitches fitfully around the thick base of her cowcock, inner walls feeling melty as she radiates heat inside you.\n\n");

			append("\"Not one...\" a sharp inhale \"... for subtlety...\" a sharp exhale \"... are ya.\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Flash her a smile.", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions3") {
			append("Rox reels, her hand slipping from your stomach to grab one of your thighs for support as you slam your full weight back onto her cock, leaving only a few inches of shaft free from the ravenous depths of your "+(data.rox3ChoseCunt?"cunt":"butt")+".\n\nShe licks her lips, watching you... clearly desperate for that last little bit.\n\n<!b>ACTIONS: 1<!b>");

			addChoice("Sluuuurp. (1)", binder("rox3actions3a"));
			addChoice("Pretend like I'm gonna pull off... (0)", binder("rox3actions3b"), {kinks: ["Piss"]});
		}

		if (seg == "rox3actions2") {
			append("You scooch back, stopping with your "+(data.rox3ChoseCunt?"cunt ":"butt ")+"clenched just before her fat flare.\n\nThough she did give you full control, Rox can't help but buck a little until it pops inside...\n\n<!b>ACTIONS: 2<!b>");

			addChoice("Meet her thrust. (2)", binder("rox3actions2a"));
			addChoice("Give a shy little push in return~ (1)", binder("rox3actions2b"));
		}

		if (seg == "rox3actions1") {
			append("\"That's it...\"\n\nYou take one full inch over the course of a minute, savouring each individual millimeter of cock.\n\n<!b>ACTIONS: 3<!b>");

			addChoice("Slam the rest in! (3)", binder("rox3actions1a"));
			addChoice("Speed it up... (2)", binder("rox3actions1b"));
			addChoice("Easy... easy... (1)", binder("rox3actions1c"));
		}

		if (seg == "rox3actions3a") {
			append("\"Mmmmmm...\"\n\nShe practically purrs. \"Always worth it to take your time on the deepest part...\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Next.", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions3b") {
			append("Rox keeps her grip firm on your neck, but she gives a barely audible whimper of dismay when you start to pull off...\n\n\"Something wrong?\" she asks, with real concern. \"You took that all a little fast... slip too far down?\"\n\n<!b>ACTIONS: 1<!b>");

			addChoice("Pop the last bit in with a wink. (1)", binder("rox3actions3baa"));
		}

		if (seg == "rox3actions2a") {
			append("You meet her little buck with a sizeable buck of your own, your butt smacking up against her crotch. The moment she bottoms out you feel her throb mightily, deep in your gut.\n\n\"Not too fast, not too slow... just right.\" She kisses your neck. <3\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Thanks, Goldilocks~", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions2b") {
			append("Rox quivers against you. \"Ah... you're cute.\"\n\nShe works her fingers into your hair, grips, and pulls your head back. \"Take it all.\"\n\n<!b>ACTIONS: 1<!b>");

			addChoice("Obey. (1)", binder("rox3actions2ba"));
		}

		if (seg == "rox3actions1a") {
			append("\"Whoa shit~!\"\n\nRox holds onto your hips for dear life, taken by surprise. She looks a little ruffled, as if woken from a wonderful dream. \"Well,\" she says, \"I can't say I'm bored...\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Nor I~", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions1b") {
			append("You pick up the pace, your "+(data.rox3ChoseCunt?"clit twinging ":"butthole clenching involuntarily ")+ "as you force it over her flare.\n\nRox grits her teeth.\n\n<!b>ACTIONS: 1<!b>");

			addChoice("There now. (1)", binder("rox3actions1ba"));
		}

		if (seg == "rox3actions1c") {
			append("Rox bites her lip, watching your "+(data.rox3ChoseCunt?"lips ":"ring ")+"slip over her flare...\n\n<!b>ACTIONS: 2<!b>");

			addChoice("Let er go. (2)", binder("rox3actions1ca"));
			addChoice("Patience... (1)", binder("rox3actions1cb"));
		}

		if (seg == "rox3actions3baa") {
			append("\"Waugh!\" Rox snorts, caught by surprise, and redoubles her grip... but it's too late. You felt it.\n\n... She let a little spurt of pee go inside you...\n\nShe clears her throat. \"Uh... so... yeah, how's that feel, er, inside you... feel good?\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Stifle laughter in a pillow.", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions2ba") {
			append("You push down all the way, releasing only the tiniest grunt as she hilts. "+(data.rox3ChoseCunt?"Your labia grinds around on her crotch ":"Your nuts grind up against her sweat-slick sack ")+"as she positions and re-positions and re-re-positions, a twist of the hips here, an extra-firm push inward there...\n\n<!b>ACTIONS: 0<!b>");

			addChoice("I think it's in there pretty good...", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions1ba") {
			append("Rox exhales through pursed lips, blowing a cool jet of air over your neck as her cushiony hips meet yours. \"Gnnn... nice...\" she says under her breath, patting your tummy-bulge. \"A well-rounded technique...\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Almost as round as you~... ignore that...", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions1ca") {
			append("The moment you get over her flare, the rest slips in like a piece of spit-lubed cake.\n\nRox leans into you, pushing hard into your "+(data.rox3ChoseCunt?"cunt ":"butt ")+", even though she's already as deep as possible. Her hand works over your stomach. \"I love your technique...\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Mhm~?", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions1cb") {
			append("She's showing some serious restraint to avoid grabbing you by the shoulders and ramming the rest of the way in... now you've made her wait so long, she's got a gleaming vendetta in her eye.\n\n\"Please,\" she says under her breath, clearly terrified you'll slow down even more.\n\n<!b>ACTIONS: 1<!b>");

			addChoice("Cherry on top. (1)", binder("rox3actions1cba"));
			addChoice("Stop. (0)", binder("rox3actions1cbb"));
		}

		if (seg == "rox3actions1cba") {
			append("Rox releases a tinkly, vulnerable little squeak as her last solitary breadth of cock pops inside your "+(data.rox3ChoseCunt?"cunt ":"butt ")+". She claps a hand over her mouth. \"... You never heard that.\"\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Mmmmmmmmmhm~", binder("rox3actionsnext"));
		}

		if (seg == "rox3actions1cbb") {
			append("She loses control, releasing a massive breath you hadn't even noticed she was holding, grabbing both of your hips and slamming that last morsel of cock into your "+(data.rox3ChoseCunt?"cunt ":"butt ")+" with brutal finality. \"Hrnghrghrgrgnrhgnh,\" she \"says\", melting on top of you.\n\n<!b>ACTIONS: 0<!b>");

			addChoice("Awwhhh, come on...", binder("rox3actionsnext"));
		}

		if (seg == "rox3actionsnext") {
			var foo:String = "nil";
			var bar:String = "nil";
			if (data.rox3ChoseCunt) {
				foo = "Rox pulls back, fingertip twiddling frantic circles over your clit, and slams back in with a low cow-grunt";
				bar = "ramming the entrance to your womb";
			} else {
				foo = "Rox squeezes her cock through your bulged stomach, thumbing your belly button";
				bar = "straining against the pit of your belly";
			}

			append("After a moment "+foo+" Som isn't even pretending to focus on his tech now.\n\nThen her thrusts start proper. With the hand on your neck she forces your face to the mattress while the other yanks at each of your thighs, pulling your knees apart, until your hips drop and your entire body lays pratically flat. Now that your stomach can't bulge so much, her cock has nowhere else to go but deeper inside you, "+bar+".\n\n\"How's that feel?\" she growls in your ear.");

			addChoice("It's a little much... (Softer)", binder("rox3actionssofter"));
			addChoice("It's alright I guess. (Harder)", binder("rox3actionsharder"));
			addChoice("... Please treat me like your fucktoy. (Even Harder)", binder("rox3actionsevenharder"));
		}

		if (seg == "rox3actionssofter") {
			append("Rox lets go of your neck entirely. She looks a little guilty. \"Ah... sorry... tipsy. Got carried away... blah blah, excuses, excuses...\"\n\nShe lays against you, tits pressed to your back, and wraps you up in a big hug. \"Let me make it up to you.\"\n\nWith slow, gentle little pushes she feeds your "+(data.rox3ChoseCunt?"sex":"butt")+" only about a third of her cock, both ears perked to your breathing and heartbeat. Her hands run soft over your "+(data.hasBoobs?"breasts":"chest")+", their roughest movement being a playful little tweak of the nipples.\n\nWith one particularly slow and measured push she hilts her cock, hot breath quickening. Cum splurts out warm and goopy inside you, spilling from your "+(data.rox3ChoseCunt?"pussy, over your inner thighs":"ass, over your taint")+"...");

			addChoice("Mmmmrh.", binder("came"));
		}

		if (seg == "rox3actionsharder") {
			var foo:String = "nil";
			var bar:String = "nil";
			if (data.rox3ChoseCunt) {
				foo = "your slick pusslips";
				bar = "cunt";
			} else {
				foo = "the squishy skin beside your pucker";
				bar = "ass";
			}

			append("Rox smirks. \"You <!i>guess<!i>?! Well, I oughta try harder, then...\"\n\nShe two-hands your ass, thumbs yanking "+foo+" apart, keeping you pinned with the ferocity of her thrusts. Her nuts fwap against you on each pounding's rebound. \"Open that "+bar+" for me,\" she growls.\n\nWith that she rams to max depth and fills you with a flood of hot "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum, giving a little mini-thrust with each spurt, her hands running over the small of your back. She melts into you. Her tits press to your shoulder blades, and a little drool runs over your neck...");

			addChoice("Hrnghrh.", binder("came"));
		}

		if (seg == "rox3actionsevenharder") {
			var foo:String = "nil";
			var bar:String = "nil";
			if (data.rox3ChoseCunt) {
				foo = "cunt";
				bar = "pussy";
			} else {
				foo = "ass";
				bar = "little butt";
			}

			append("\"You got it.\"\n\nRox wrangles you into a headlock and starts railing your "+foo+" like she hates you. She crams a couple fingers "+(data.rox3ChoseCunt?"slick with your own juices into ":"in ")+"your mouth and fingerfucks your throat while she's at it, soaking them, then brings her dripping digits back to your "+foo+" and crams a couple in alongside her cock just to gape you that much harder.\n\n\"Take it, fucktoy~\" Rox grunts. You feel a warmth burst inside you and her grip tightens; she's cumming. She matches each splurt with a brutal full-length thrust, raping your "+bar+" mercilessly as it overflows with her seed.");

			addChoice("HRHGMGRH~.", binder("came"));
		}

		//}}}
		if (seg == "came") {
			append("\"Ahhhhhhhhhhhhhhhhhhhh~\"\n\nRox pulls out with a little <!i>schloop,<!i> a couple blurbles of cum slipping out onto Som's bed (\"Hey! I'm not cleaning that!\"—\"We both know you're gonna suck it clean when nobody's looking.\") and with a colossal effort she hauls her exhausted body off the bed and looks down, groaning at her cum-soaked cowcock— or, no, rather, she's looking <!i>past<!i> it... her nuts. They look huge in this light, still throbbing from a fresh orgasm. They're both shiny-slick with "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum and sweat, too...");

			addChoice("Clean them.", binder("nuts clean"), {kinks: ["Raunch"]});
			addChoice("End.", binder("rox 3 end"));
		}

		if (seg == "nuts clean") {
			append("You dive forward and bury your nose in Rox's cumsoaked nuts, taking a huge big fat whiff of her musk, even accidentally taking a little cum up your nostrils. She blinks down at you. \"Brave.\"\n\nShe grabs the back of your head and uses your face to wipe herself off, slip-sliding those fat orbs around your features, giving you "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum lipstick and mascara. \"Open,\" she says, and you don't need to be told twice; she grabs her sack by the base, both nuts bulging out huge past her grip, and crams them into your mouth.\n\nYou go squirrely slurping on her sack, tongue-bathing all that sloppy loose skin, jiggling the boys up against the roof of your mouth... you've long past swallowed all the cum they had on them. By now you just keep going because you're addicted to the sharp tang of her natural nutgrease.\n\nEventually you do pull off, though it nearly takes a crowbar. Rox flops onto the bed, still apparently pretty drunk, because her ass lands directly in the cum puddle and she doesn't even notice.");

			addChoice("End.", binder("rox 3 end"));
		}

		if (seg == "rox 3 end") {
			append("Rox pulls you into the "+(isActive("Mood Ring")?getMood("Roxelle"):"")+"cum puddle with her. She plants a peck on your forehead and drags a couple fingers over the slight bulge in your stomach where the majority of her seed is still sloshing warm. \"Thanks for that,\" she says, and she wiggles her fingers, reaching for a half-finished bottle of wine tucked off the side of the bed.\n\nBefore you head out, she insists upon a snugglesesh.\n\n... Your "+(data.rox3ChoseCunt?"pussy":"ass")+", you notice later, is just a little sore...");

			addChoice("Move along.", gotoHub.bind("Bright Forest"));
		}
	}
}
