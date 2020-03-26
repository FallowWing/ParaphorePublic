package story;

class HyperLand
{

	public static function explore(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		setLocation("Hyper Land");
		saveCheckpoint("HyperLand.explore('"+seg+"');");

		if (seg == "explore") {
			halfWidthText();
			data.dpgFoundCombos = [];
			var s:MintSprite = addSprite("assets/img/effect/hyperLandIntro");
			s.onHover = showToolTipOnCursor.bind("Font: Canted FX.", "");
			s.x = GAME_WIDTH*0.6-s.width*0.5;
			s.scaleY = 0.5;
			s.alpha = 0;
			tween(s, {alpha: 1}, 0.7);
			tween(s, {scaleY: 1}, 1.5, {ease: BOUNCE_OUT});
			addPlace("Hyper Land", "An inflatable amusement park/casino.", "Violet Meteorite");
			append((data.hyperLandIntro?"You're back at Hyper Land.":"You discover the biggest cock on the island.\n\nUpon asking the crowds, and pondering a couple inflatable info signs, you learn that Hyper Land is an amusement park/casino loosely themed around gigantic cocks, tits, and butts. And, as many folks squealed excitedly in your ear mid-orgasm, it's the grand re-opening!"));
			addChoice((data.hyperLandSeasonPass?"Head inside.":"Buy a ticket."), explore.bind((data.hyperLandSeasonPass?"hub":"main")), {kinks: ["Hyper"]});
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "main") {
			if (!data.hyperLandIntro) {
				data.hyperLandIntro = true;
				append("You head for the ticket booth. No one gives a fuck about forming a line, so you just have to slide yourself between butts and conversations to get up there.\n\n\"Why'd they move it up here from the City?\"\n\n\"Construction permit problems, I heard... it's well above regulation girth.\"\n\n"+(data.springsLeftIntroDone?"That neckerchiefed cat futa from The Crack":"A neckerchiefed cat futa")+" sits all smug and self-important behind her counter, accepting little handfuls of caps and stamping wrists with a big inky cock stamp. \n\nA father and son let you budge in front of them. They gesture you forward politely.");
				addChoice("Thanks.", explore.bind("buyticket"));
				addChoice("No, go ahead, I insist.", explore.bind("introdad"), {kinks: ["Male", "Male", (isActive("Pastel Ring")?"Toddler":"Cub")], faCensor: true});
				addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
			} else if (!data.hyperLandSeasonPass) {
				explore("buyticket");
			} else {
				explore("hub");
			}
		}

		if (seg == "introdad") {
			append("\"Thank you!\" the boy chirps, flashing his little "+(isActive("Pastel Ring")?"four-year-old toddler":"")+"butt at you as a reward. He winks his pucker. The back of two gigantic nuts peek out just below his taint.\n\nDad plops that bare ass down on the ticket booth counter and reaches between his son's thighs, yanking them open. His fat ten-inch cock <!i>thwaps<!i> onto the counter, almost half as big as his entire body, complete with two grapefruit nuts and a rosy sheen which betrays just how often daddy yanks it.\n\nHe presents himself to this total stranger working the ticket booth and a mess of caps spills from his crevices. A few were even tucked under his armpits.\n\n\"Season passes for one adult and one cub, please,\" Dad says. He scoops all two-hundred caps into a big sweaty pile.\n\n\"He'll blend right in with the staff,\" the futa purrs, greedily shovelling the caps into her big collection bucket. She leans forward, grabs the cub's girly hairdo in a fist, and gives him a cock stamp right on the forehead. He goes cross-eyed trying to look at it and spins around to show his dad. \"OoooOOooOOo I got a stamp Daddy! Lookit!\"\n\n\"Mmmmmhm. You'll be getting facials every time you turn around now. Don't let the torrents of cum wash it off, okay?\"\n\n\"Kay! D'you like it though? Is it pretty?\"\n\nHe pulls a few locks of mussed-up hair out of his son's eyes and kisses the fresh-ink stamp. \"It's not only pretty, it's practical. Now anyone who looks you in your face immediately knows what you want it stuffed with. It's like you're begging for cock everywhere you go!\"\n\n\"Yayyyyy!\"\n\nDad scoops him up and brings him through the gate.\n\nThe futa says \"Next.\"");
			addChoice("Next.", explore.bind("buyticket"));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "buyticket") {
			append("You roll up to the ticket booth.\n\nThe cat futa "+pickOne(["inspects her claws", "twiddles her dingus", "plays with her fat nuts", "tweaks a tiddy", "tells some greasy beaver to fuck off unless he's got caps", "peers over a paperback titled <!i>Face Down Ass Up, vol. 6, How to Lift Hyper Asses<!i>"])+".\n\n\"Five caps for a ticket, one hundo for a season pass. Tickets are good til you leave the park. "+pickOne(["We don't have a seasonal weather system, so the season pass never expires, really", "Season pass is good forever"])+". Enter the secret code for a free one.\"");
			addChoice("Buy a ticket.", explore.bind("hub"), {cost: ["Capsule", 5]});
			addChoice("Buy a season pass.", explore.bind("buyseasonpass"), {cost: ["Capsule", 100]});
			addChoice("Try the secret code.", function() {
				clearChoices();
				if (!data.hyperLandSeasonPass) addTextChoice(function(str) {
					if (str.toUpperCase() != data.playerName.toUpperCase()) {
						clearText();
						append(pickOne(["The futa scratches an asscheek. \"Nope.\"", "\"Incorrect.\"", "\"Nooope.\"", "She scoffs. \"A wonderful try, but nope.\""]));
					} else {
						explore("freeseasonpass");
					}
				});
				addChoice("Buy a ticket.", explore.bind("hub"), {cost: ["Capsule", 5]});
				addChoice("Buy a season pass.", explore.bind("buyseasonpass"), {cost: ["Capsule", 100]});
				addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
			});
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "buyseasonpass") {
			data.hyperLandSeasonPass = true;
			append("\"Ohoooooo,\" she purrs. \"Big spender.\"\n\nShe stamps your asscheek as you pass through.");
			addChoice("Head inside.", explore.bind("hub"));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "freeseasonpass") {
			data.hyperLandSeasonPass = true;
			append("The futa rolls her eyes and slides you a free season pass.\n\n\"Pretty unimaginative of Patch to make your name the code word, huh?\"");
			addChoice("Yup~!", explore.bind("hub"));
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "hub") {
			var bottomFloor:MintSprite = addSprite("assets/img/effect/hyperLandMap1");
			var middleFloor:MintSprite = addSprite("assets/img/effect/hyperLandMap2");
			var topFloor:MintSprite = addSprite("assets/img/effect/hyperLandMap3");

			var map:Map<String, MintSprite> = [
				"Card Tables" => bottomFloor,
				"Slots" => middleFloor,
				"Rides" => topFloor,
			];

			for (key in map.keys()) {
				var s:MintSprite = map.get(key);
				s.x = GAME_WIDTH*0.6-s.width*0.5;

				s.onReleaseOnce = function() {
					playSound("assets/audio/ui/explore");
					explore(key);
				}

				s.onHover = function() {
					Tooltip.showOnCursor(key);
				}

				s.onHoverOnce = function() {
					if (key == "Card Tables") s.tint = 0xBF61D366;
					if (key == "Slots") s.tint = 0xBF7BB9FF;
					if (key == "Rides") s.tint = 0xBFDB86FF;
				}

				s.onUnHoverOnce = function() {
					s.tint = 0x00000000;
				}
			}

			halfWidthText();
			append(pickOne(["Inflatable elevators zip up and down the shaft.", "Moonlight looks like sunlight filtered through the cock's orange walls.", "Distant jingles float down from the Slots floor.", "The rides on the top floor sure are squeaky~", "You wander through Hyper Land, eyes full of oversized stars.", "Some dude bumps you with his 20-incher and smears pre over your buttcheeks.", "Staff cram into inflatable elevators, their hyper junk all squished up against everyone else's.", "Some lady got her hyper tits stuck in one of the elevators. Three sets of paws and a barrel of lube eventually get her out.", "A sexy fawn whistles at you, lounging on top of his giant nutsack~", "A determined, chubby panda girl forgoes the inflatable elevators for inflatable stairs."])+"\n\n<!u>Floors:<!u>\n\n<!b>1<!b> — Card Tables\n<!b>2<!b> — Slots\n<!b>3<!b> — Rides");
			addChoice("Move along.", VioletMeteorite.violetMeteoriteHub);
		}

		if (seg == "Card Tables") {
			if (!data.hyperLandCardsIntro) {
				data.hyperLandCardsIntro = true;
				append("You walk into the giant double-domed nutsack.\n\n<!b>STOP!<!b> says a cute bouncy sign that really wants to be taken seriously.\n\n<!b>We're playing strip blackjack for opening night. Part of the fun is not having someone's bare tits and ass jiggling in your face every two seconds. Please take sex to another floor and PLEASE WEAR CLOTHES!<!b>");
				addChoice("Head inside.", explore.bind("cardhub"));
				addChoice("I don't think I own any clothes? Head inside anyway.", explore.bind("cardhub"));
				addChoice("Back.", explore.bind("hub"));
			} else {
				explore("cardhub");
			}
		}

		if (seg == "cardhub") {
			var opponents:Array<String> = ["Kemp", "Roxelle", "Red", "Som"];
			var opponentActions:Array<String> = [];
			if (data.metKemp <= 0) opponents.remove("Kemp");
			if (data.roxVisits <= 0) opponents.remove("Roxelle");
			if (data.redVisits <= 0 && !onFA()) opponents.remove("Red");
			if (data.roxVisits <= 1 && !onFA()) opponents.remove("Som");
			
			function met(opponent:String):Bool {
				return opponents.contains(opponent);
			}

			if (met("Kemp") && met("Roxelle"))
				opponentActions.push("Kemp and Roxelle just finished up a game. It was close, but Kemp's five pairs of swimming trunks took her by surprise.");
			if (met("Kemp") && met("Som"))
				opponentActions.push("Kemp and Som are avoiding each other.");
			if (met("Kemp"))
				opponentActions.push("Kemp smokes all by his lonesome near the back. Some big-dicked staff member comes and takes his sweetgrass cig away, grunting something about fire hazards.\n\n(He just pulls another out of his trunks.)");

			if (met("Roxelle") && met("Red"))
				opponentActions.push("Roxelle and Red are just finishing an argument in the back. The word \"him\" came up a lot.");
			if (met("Roxelle") && met("Som"))
				opponentActions.push("Roxelle and Som are putting their clothes back on after a game. Rox keeps teasing him and yanking pieces off that he just got back on~");
			if (met("Roxelle"))
				opponentActions.push("Rox sits by herself near the back, taking secret swigs of glowberry wine under the table.");

			if (met("Red") && met("Som"))
				opponentActions.push("Red and Som discuss consciousness near the back, not even playing. Som thinks consciousness comes from code. Red mutters that it has to come from somewhere else entirely.");
			if (met("Red") && met("Kemp"))
				opponentActions.push("Red and Kemp are chatting politely. She's very wet, and keeps trying to bring him up to the <!i>Rides<!i> floor, but he's totally flaccid...");
			if (met("Red"))
				opponentActions.push("Red sits by herself near the back, chair halfway pulled out from the table, footpaw tapping on the bouncy floor.");

			if (met("Som") && met("Roxelle") && met("Red"))
				opponentActions.push("Som and Red are double-teaming Rox, each hugging one of her bare hips and fighting over who gets to suck her cock next. A staff member comes over and tells them to head up to the <!b>Rides<!b> floor if they wanna fuck— this floor is for stripteasing, not big loud messy threesomes.");
			if (met("Som"))
				opponentActions.push("Som sits by himself near the back, tinkering with a little gadget and sticking his tongue out for concentration.");


			append(pickOne(["A steady flow of stripped folks stream into the elevators, heading up to the <!b>Rides<!b> floor to make use of their nudity.", "A frustrated bluebird plays over in the corner with her seagull girlfriend. The gull is a big poofy mess of clothes. Eight layers at least.", "You look around awkwardly. A dozen people gesture you over excitedly, but you haven't met any of them.", "Chit-chat, zippers, shuffled cards <!i>fwip<!i>-ing around, cloth sliding against cloth..."])+"\n\n"+(opponents.length == 0 ? "Can't see any familiar faces... better explore a bit more first." : opponents.length == 1 ? "You spot one familiar face." : opponents.length == 2 ? "You spot two familiar faces." : opponents.length == 3 ? "You spot three familiar faces!" : "You spot a whole mess of familiar faces!!")+"\n\n"+(opponents.length > 0 ? pickOne(opponentActions)+"\n\n" : "")+"Who would you like to play with?");
			
			addChoice("Kemp.", explore.bind("cardkemp"), {kinks: ["Male"], enabled: met("Kemp")});
			addChoice("Roxelle.", explore.bind("cardrox"), {kinks: ["Intersex"], enabled: met("Roxelle")});
			addChoice("Red.", explore.bind("cardred"), {kinks: ["Cub", "Female"], enabled: met("Red"), faCensor: true});
			addChoice("Som.", explore.bind("cardsom"), {kinks: ["Cub", "Male"], enabled: met("Som"), faCensor: true});
			if (data.bertBJDone) addChoice("Bert.", explore.bind("cardbert"), {kinks: ["Feral"]});
			if (debugMode) addChoice("Meet everyone.", function() {
				data.redVisits = 1;
				data.metKemp = 2;
				data.roxVisits = 2;
				data.metSom = 2;
				explore("cardhub");
			});
			addChoice("Back.", explore.bind("hub"));
		}

		if (seg == "cardbert") {
			data.bertBJDone = false;
			append("Bert is a dog and "+pickOne(["does not know how to play cards", "dogs cannot play cards. Except sometimes in paintings"])+".");
			var s:MintSprite = addSprite("assets/img/effect/bertBJ");
			s.x = 400;
			s.y = GAME_HEIGHT-90-s.height;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Kittery", "Pshhh. Can't even figure out how to play blackjack. Dumb little doggywhore~");
			addChoice("Back.", explore.bind("cardhub"));
		}

		if (seg == "cardkemp") {
			Blackjack.startGame(KEMP, explore.bind("cardkempwin"), explore.bind("cardkemplose"));
			halfWidthText();
			append("Kemp throws you a brotherly jerk of the chin. "+pickOne(["He's got his feet up on the table.", "His fat otter tail pokes out through the back of his fold-out chair.", "One paw slips down the back of his trunks and scratches his ass."])+"\n\n\""+pickOne(["Down fer a couple rounds?", "Fight me bruh.", "Yo!"])+"\"");
			addChoice("Let's play!", function() { Blackjack.startRound(); }, {cost: ["Sweetgrass Leaf", 1]});
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardkempwin") {
			halfWidthText();
			append("\"Oop. One round too many.\"\n\n... You won!!!\n\n"+pickOne(["Kemp flops back on his bare ass, thoroughly defeated. His boner <!i>thwaps<!i> up against his stomach.\n\n\"You fuckin devastated my trunks.\"", "Kemp looks at his cig.\n\n\"Shit. This isn't even lit.\"", "Kemp sheepishly plucks up all his trunks and starts wiggling back into them, one by one.\n\n\"The multi-trunk strat woulda worked this time, too... fuckin players gotta be all good at games and shit...\""]));
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardkemplose") {
			halfWidthText();
			append("You lost.\n\n"+pickOne(["Kemp collects your bet and reaches down to scratch his nuts— then he does a double-take when his fingers run up against fabric instead of fur. \"Ah, right, fuck. I'm clothed.\"\n\n... You look at him.\n\nHe clears his throat. \"Not, uh. Not to rub it in.\"", "Kemp narrows his baked eyes. \"It'll take more than that to defeat these trunks.\"", "Kemp blinks slowly. \"Wait, what happened? You ran outta rounds? Shit... I thought my dick was already out... what is this feeling in my nuts, man. All sensitive. Felt like the air was tickling up my nut crack.\"\n\nHe's still got his shorts on.\n\n\"You know, the part in the middle where my nuts squish together? Kinda looks like a butt crack? Well, fuck. If you keep em sqooshed together long enough, that'll get sweaty. And when you got a sweaty, sensitive nut crack, a good kiss 'o fabric along it will feel a like a thousand muscular kings descending from Heaven to put us all into eternal servitude as their bitch boys. Grand. Holy. Unstoppable. Like a gush of wind, y'know. That's the EXACT same feeling you get when fabric grinds on your nut crack. So yeah. So I thought my zipper was down already. Like. I thought my junk was all the way out, all the way, and I reached down to put my dick away so the musk woudn't bug you, yeah so, so, yeah, so, but, somehow I got it flipped around in my head and, you know, instead of DOING THE ZIPPER UP, wellyouknowforlike, for the zephyrs I imagined were motorboating my hot sweaty nuts, I thought to myself like COME ON, do your ZIPPER UP I thought to myself, and I reached down to do it up to protect my cock from the 1000 Kings that were coming down from Heaven to make me their bitch boy. I don't wanna be a bitch boy. I wanna dom. At least, I wanna power bottom. I've come into my own sense of power and self, now, like. You weren't here, but there was a big longass stretch of time where I was a bitch boy, and my master was my own fuckin silly brain. No more of that. From now on, I'm thinking clearly. I'm gonna get off the grass and stop rambling about absolute fucking nonsense. 1000 Kings? What was coming out of my mouth just now? Man, I was just trying to explain that I'm so stupified with arousal and doped up right now that I thought my pants zipper was down because my dick was cold, then I attempted to pull the zipper up, but for some reason I had a brainshart and pulled it DOWN instead. And now my cock's out. And you can see it past my designer underpants. Yes I'm gay. I'm out of the closet. Deal with it. Yeah I hang out at Indigo Pond. Yeah I've been kissing nymph boys. Fuck's good? Fuck's good? And I really feel the air brushing over my nut crack now for real now, too. It's really sweaty, so it feels nice to get some air on it. Basically what I've been trying to say this entire time is that I wish I wasn't so retarded. It's embarrassing.\"\n\nHe grinds his fat floppy otterdick up along your stomach. Your belly button slips right in the divot where his nuts meet the base of his shaft. His nuts squish up around the base of your crotch.\n\n\"Yer so naked,\" he extols.\n\n\"Yer so fuckin... bare... naked...\" he soliloquizes.\n\nHis bouts of soliloquy turn into a kind of thought loop. He's so baked, he can't help but just keep talking and talking about how naked you are, bare, fuckin, and how fuckin BARE naked your body is."]));
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardrox") {
			Blackjack.startGame(ROXELLE, explore.bind("cardroxwin"), explore.bind("cardroxlose"));
			halfWidthText();
			var roxAction:String = pickOne(["Oho, hello again!", "Ugh,\" she replies, fat butt squirming in her chair. \"I figured it was proper to dress up for the big event... but I'd wear my apron over this garbage any day. Do you have any idea how restrictive it feels to keep tits like these <!i>clothed<!i>?", "Hello yourself.\"\n\nShe fiddles innocently with her necklace, smiling, acting as if it isn't bouncing off of her gargantuan cleavo. \"Hey— you wouldn't know the architect behind this place, do you? I wanna put him to work on some renovations for the farm~"]);
			if (Math.random() > 0.90 && !data.bertBJDone) {
				data.bertBJDone = true;
				roxAction = "Ahhh hey again! Keep your eyes open, Bert's scurrying around here someplace. I set him up with a pair of panties so he wouldn't break the rules, but he wiggled right out of them and took off. Rebellious little doggywhore...";
			}

			append("You scoot over to Rox and say hello.\n\n\""+roxAction+"\"");
			addChoice("Let's play!", function() { Blackjack.startRound(); }, {cost: ["Glowberry", 1]});
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardroxwin") {
			halfWidthText();
			append("You won!\n\n"+pickOne(["Rox chuckles, all her junk bouncing around, and pulls you into a big fat hug. Her tits smush up on either side of your face, and her cock fits neatly between your thighs, chubbing up and pressing against your "+pickByGenitals("nuts and taint", "cunt", "nuts and cunt")+".\n\n\"How dare you defeat me. I'd assfuck you right here if it weren't for all these pesky rules... I'm practically naked no matter what I wear, anyway. There's no containing these curves...\"", "\"Mmmm,\" she says, tweaking one of her tits thoughtfully. She takes her cock by the base and pulls it up against her stomach, airing out the sweaty underside...\n\n\"Thanks. This feels amazing.\"", "She stands around for a moment, casually showing off the bare curves of her drooping, half-hard cock, her heavy nuts, one hand wandering up between her tits to slip the glowrose barette back into her hair. Then she turns around, giving you a frankly overwhelming view of her cheeks and, between them, her lil donut pucker.\n\n\"Mmm... that was fun.\"\n\nShe steps back into her panties and yanks them up, up...\n\nThe only part of them you can still see is a thin pink line flossing her asscrack."]));
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardroxlose") {
			halfWidthText();
			append("You lost.\n\n"+pickOne(["\"Uuuugh.\"\n\nShe starts putting her clothes back on, morose. \"We <!i>both<!i> lose, really. My pucker needs some air pretty quick here... wayyyy too sweaty for comfort...\"", "She tosses you a wink and a kiss. \"Better luck next time, champ.\"", "<!14px>Rox shakes her head. \"A solid attempt, but I'm just too skilled for you.\"\n\n... She tries to shuffle the deck all fancy and ends up splashing herself with cards.\n\n<!14px><!10px>\"Goddamnit...\"<!10px>"]));
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardred") {
			halfWidthText();
			Blackjack.startGame(RED, explore.bind("cardredwin"), explore.bind("cardredlose"));
			append("You tap Red on the shoulder.\n\n"+pickOne(["She spins around. She's wearing some random shirt and shorts you feel like she just threw on to have something under her cloak.\n\n\"Cade's watching her for me,\" she says, answering the question on your face. \"He's a little too innocent, the way he absolutely never tries anything lewd with her... fuckin gay tiger... and I don't think he's got much free time, with all his bird boi friends... I can't ask him to babysit this often... but I have to take <!i>some<!i> time off...\"", "She turns around.\n\n\"You again!? Are you following me?\"", "She doesn't notice at first. She's transfixed by the crowd, watching every angle except directly behind her.\n\nYou tap a little harder.\n\nShe jumps. \"AH! Fuck you. Don't do that. I'm on edge.\"\n\n... She pulls her cloak around herself. \"This crowd is uncomfortably huge.\""]));
			addChoice("Let's play!", function() { Blackjack.startRound(); }, {cost: ["Glowberry", 1]});
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardredwin") {
			halfWidthText();
			append("You won!\n\n"+pickOne(["Red nibbles on the corner of a Jack. \"Mrrrgh. I'm hungry. You should thank me for trekking all the way up here just so I could slowly get naked for you.\"", "\"Mmmmm... are they pumping this place full of air to keep it inflated? I can feel a breeze against my lips...\"\n\nA citygoer whistles at her exposed cunt from the next table over, twirling his cock in circles. \"Hey, Big Bad! Remember me?\"\n\nRed pulls her cloak back on as fast as she can. \"Fuck no I don't.\"", "Red tucks two fingers into the fold of her puss and pushes in easily. \"Congratulations, you stripped a poor defenseless wolf loli down to her bare tiddies.\"\n\nHer free hand wanders up to one of her nips. Two fingers pincer around her bubbly little left nub, rolling it back and forth. She unplugs her fingers and brings them to her maw so she can suck the gossamer webs of cuntjuice from between them.\n\n\"Mmmn... kinda glad I losht to you...\""]));
			addChoice("Back.", function() {
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardredlose") {
			halfWidthText();
			append("You lost.\n\nShe's actually upset. \""+pickOne(["Wait, what? So I don't get to strip anymore. This game is stupid.", "Oh. Oops. I didn't hurt your feelings or some shit, did I...?", "Aw. C'mon, play better. Get me outta these panties. I wanna feel the breeze against my bare cunt again."])+"\"");
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardsom") {
			halfWidthText();
			Blackjack.startGame(SOM, explore.bind("cardsomwin"), explore.bind("cardsomlose"));
			append("You sit down opposite Som.\n\n"+pickOne(["His little poof-tail wiggles against the back of his chair with excitement. His fancy shuffle gets even faster and fancier, nimble fingers darting around between cards.\n\n\"I was hoping you'd stop by for a game,\" he says. \"We haven't really had a chance to get familiar yet!\"", "He sucks one of his fingers. \"Papercut,\" he says. \"These cards are sharp...\"\n\n... He starts sucking it a little too hard, taking almost half of it into his maw. Before it turns into a self-throatfuck he <!i>pop<!i>s his wet digit out and dries it on the wool of his thigh.", "\"Heyyy! Isn't this wild? I went outside for once!\"\n\nHe wiggles his butt with the thrill of the outdoors. Despite being a shut-in he doesn't really seem uncomfortable with the crowd... in fact, he's eagerly staring at every barely-clothed ass and cockbulge he can, throwing winks and blowing kisses to whichever strangers ogle him.\n\nHis own bulge tents up underneath the thin fabric of his skinny jeans.\n\n\"Wanna play~?\""]));
			addChoice("Let's play!", function() { Blackjack.startRound(); }, {cost: ["Broken Cell", 1]});
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardsomwin") {
			halfWidthText();
			append("You won!\n\n"+pickOne(["Now that he's actually nude, Som's a little shy. He grinds his thighs together over his bare lambcock, nuts squished between them. Upstairs, his nips perk up to the size of tic-tacs, throbbing, sensitive, and he blushes so hard some of the red glow even creeps down over his collarbone~\n\n\"Ah... everyone's staring...\"", "\"Hnnhh... good job...!\"\n\nSom's about to cum just from being stripped naked in front of everybody. His cock quivers in slow waves, base to tip, and his nuts twinge up into a little coinpurse. If you were behind him right now you'd probably see his smooth, wooly buttcheeks unclenched and naturally parted to reveal a furiously winking boypucker~", "Som tucks his arms between his legs and moves to sit down on his fold-out chair in an attempt to hide his cute little ass and cocklet from the crowd.\n\n"+(data.roxVisits > 0 ? "Roxelle":"A big-hipped futa cow")+" sneaks up behind him and pulls the chair out just in time, sending him sprawling onto his butt, legs spread wide, tiny cock throbbing against his stomach, the extra-squishy bottom part of his asscheeks peeking out from just beneath his nuts and taint for the whole world to see~\n\n\"Ah! Rox, you dick!\"\n\n\"Oops,\" she purrs, gently toeing his sack."]));
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "cardsomlose") {
			halfWidthText();
			append("You lost.\n\nSom shrugs. \""+pickOne(["I play too many games.", "Guess my butt will stay hidden til another time.", "Ah. That's chance-based games for ya."])+"\"");
			addChoice("Back.", function(){
				Blackjack.endGame();
				explore("cardhub");
			});
		}

		if (seg == "Slots") {
			if (!data.hyperLandSlotsIntro) {
				data.hyperLandSlotsIntro = true;
				append("You mosey down around the base of the shaft.\n\nSlot machines (and loose, oversexualized variations on slot machines) stretch out in dazzling rows. Some of them have ball-end levers designed to be lodged up the cunts and butts of gamblers and \"pulled\" with long, deep gyrations. These are the most popular and most obnoxious, because every time someone scores a big win the lever starts pistoning viciously in and out, drawing out a vibrational squeal to mix with the victory jingle.\n\nThere's a few <!b>Degrading Portmanteau Generator<!b> machines free, whatever those are.");
				addChoice("Take a peek.", explore.bind("slotsdegrade"));
				addChoice("Back.", explore.bind("hub"));
			} else {
				explore("slotsdegrade");
			}
		}

		if (seg == "slotsdegrade") {
			var generateDegrade:Void->Void;
			var kinkList:Array<String> = ["Cub", "Baby", "Gore", "Piss", "Raunch", "Scat", "Vomit", "Trash", "Snuff"];
			var enabledKinks:Array<String> = data.dpgEnabledKinks;

			var prefixList:Array<String> = ["cock", "fuck", "slut", "cum", "dick", "whore", "slut", "booty"];
			var suffixList:Array<String> = ["meat", "slut", "whore", "toy", "bitch", "skank", "cunt", "slave", "rag", "hole", "kitten", "thing", "muffin", "puppet", "sock"];

			var prefixMap:Map<String, Array<String>> = [
				"shit" => ["Scat"],
				"poopy" => ["Scat"],
				"puke" => ["Vomit"],
				"vomit" => ["Vomit"],
				"piss" => ["Piss"],
				"urinal" => ["Piss"],
				"stank" => ["Raunch"],
				"stinky" => ["Raunch"],
				"smeg" => ["Raunch"],
				"musk" => ["Raunch"],
				"trash" => ["Trash"],
				"garbo" => ["Trash"],
				"dumpster" => ["Trash"],
				"toilet" => ["Scat", "Piss"],
				"filth" => ["Scat", "Vomit", "Piss", "Raunch"],
				"baby" => ["Baby"],
				"toddler" => ["Baby"],
				"cub" => ["Cub"],
				"kiddy" => ["Cub"],
				"snuff" => ["Snuff"],
				"murder" => ["Snuff"],
				"torture" => ["Gore"],
				"meat" => ["Gore"],
				];

			var suffixMap:Map<String, Array<String>> = [
				"dumpster" => ["Trash"],
				"toilet" => ["Scat", "Piss"],
				"mop" => ["Scat", "Vomit", "Piss", "Raunch"],
				"stain" => ["Scat", "Vomit", "Piss", "Raunch"],
				"pig" => ["Scat", "Vomit", "Raunch"],
				"piggy" => ["Scat", "Vomit", "Raunch"],
				"baby" => ["Baby"],
				"toddler" => ["Baby"],
				"babe" => ["Baby"],
				"tod" => ["Baby"],
				"cub" => ["Cub"],
				"meat" => ["Gore"],
			];

			var updateKinks:Void->Void;

			function updateKinks() {
				prefixList = ["cock", "fuck", "slut", "cum", "dick", "whore", "slut", "booty"];
				suffixList = ["meat", "slut", "whore", "toy", "bitch", "skank", "cunt", "slave", "rag", "hole", "kitten", "thing", "muffin", "puppet", "sock"];

				for (key in prefixMap.keys())
					for (kinkType in prefixMap.get(key))
						if (enabledKinks.contains(kinkType))
							if (!prefixList.contains(key))
								prefixList.push(key);

				for (key in suffixMap.keys())
					for (kinkType in suffixMap.get(key))
						if (enabledKinks.contains(kinkType))
							if (!suffixList.contains(key))
								suffixList.push(key);
			}

			updateKinks();

			var dpgTerminal:MintSprite = addSprite("assets/img/effect/dpg");
			dpgTerminal.x = GAME_WIDTH/2-dpgTerminal.width/2;
			dpgTerminal.y = GAME_HEIGHT/2-dpgTerminal.height/2;
			dpgTerminal.alpha = 0;
			tween(dpgTerminal, {alpha: 1}, 0.8, {ease: QUINT_OUT});

			var chosenPrefix:MintText = addText();
			var chosenSuffix:MintText = addText();

			var kinkSpriteX:Float = 0;
			var delay:Float = 0;

			for (kinkString in kinkList) {
				delay += 0.05;
				var kinkSprite = addSprite("assets/img/kink/"+kinkString+".png");
				kinkSpriteX += kinkSprite.width*1.3;
				kinkSprite.x = dpgTerminal.x+kinkSpriteX-10;
				kinkSprite.y = dpgTerminal.y*1.3;
				kinkSprite.alpha = 0;
				if (enabledKinks.contains(kinkString)) kinkSprite.applyGlowEffect(0x448328) else kinkSprite.tint = 0xCC000000;

				tween(kinkSprite, {x: dpgTerminal.x+kinkSpriteX, alpha: 1}, 0.6, {ease: QUINT_IN, startDelay: delay});

				kinkSprite.onHover = function() {
					Tooltip.showOnCursor(kinkString+" Combos");
				}

				kinkSprite.onReleaseOnceAnywhere = function () {
					if (enabledKinks.contains(kinkString)) {
						enabledKinks.remove(kinkString);
						kinkSprite.clearEffects();
						kinkSprite.tint = 0xCC000000;
						playSound("assets/audio/ui/tak");
					} else {
						enabledKinks.push(kinkString);
						kinkSprite.tint = 0x00000000;
						kinkSprite.applyGlowEffect(0x448328);
						playSound(Theme.getSound("toggle"));
					}

					tween(kinkSprite, {y: kinkSprite.y+1}, 0.1, {type: REVERSE});
					updateKinks();
				}
			}

			var timesPressed:Int = 0;

			var dpgButton:MintSprite = new MintSprite();
			dpgButton.layer = Main.ADD_SPRITE_LAYER;
			dpgButton.setupCanvas("effect/buttons", 189, 47);
			dpgButton.copyTile("anotherOne1", 0, 0);
			dpgButton.mouseEnabled = true;
			dpgButton.alpha = 0;
			dpgButton.x = dpgTerminal.x+dpgTerminal.width/2-dpgButton.width/2;
			dpgButton.y = dpgTerminal.y+dpgTerminal.height/1.5;
			dpgButton.onReleaseOnceAnywhere = function() {
				if (timesPressed < 50) timesPressed++;
				playSound("assets/audio/ui/explore");
				dpgButton.fillPixels(0, 0, Math.round(dpgButton.width), Math.round(dpgButton.height), 0x00000000);
				dpgButton.copyTile("anotherOne2", 0, 0);
				dpgButton.mouseEnabled = false;
				generateDegrade();
			}
			prepareSprite(dpgButton);
			tween(dpgButton, {alpha: 1}, 1, {ease: QUINT_OUT});

			var buttonLube:String = pickOne(["Glowberry Wine", "Cum Balloon", "Piss Balloon"]);

			function refreshChoices():Void {
				clearChoices();

				for (i in [2, 3, 5])
					addChoice("x"+i+" Bonus", function () {
						data.dpgMultiplierTimer = i*5;
						data.dpgMultiplier = i;
						append("<!b>x"+data.dpgMultiplier+"<!b> Rolls Left: "+data.dpgMultiplierTimer);
						refreshChoices();
					}, {cost: ["Capsule", (i == 2 ? 2 : i == 3 ? 5 : i == 5 ? 10 : 2)], enabled: data.dpgMultiplierTimer <= 0});

				if (Math.random() > 99)
					addChoice("SUPER MEGA RARE <!b>x50<!b> BONER BONUS", function () {
						data.dpgMultiplierTimer = 5;
						data.dpgMultiplier = 50;
						append("SUPER MEGA RARE <!b>x"+data.dpgMultiplier+"<!b> BONER BONUS ROLLS LEFT: "+data.dpgMultiplierTimer);
						refreshChoices();
					}, {cost: ["Capsule", 50], enabled: data.dpgMultiplierTimer <= 0});

				if (timesPressed < 50) buttonLube = pickOne(["Glowberry Wine", "Cum Balloon", "Piss Balloon"]);

				addChoice("Lube the button!", function () {
					timesPressed = (buttonLube == "Glowberry Wine" ? 65 : buttonLube == "Piss Balloon" ? 60 : buttonLube == "Cum Balloon" ? 50 : 50);
					refreshChoices();
				}, {cost: [buttonLube, 1], enabled: timesPressed < 50});
				addChoice("Back.", explore.bind("hub"));
			}

			function checkRewards():Void {
				var chosen:String = chosenPrefix.getText()+chosenSuffix.getText();

				if (data.dpgMultiplierTimer > 0) clearText();

				if (GameData.dpgRewardsMap.exists(chosen) && !data.dpgFoundCombos.contains(chosen)) {
					clearText();
					data.dpgFoundCombos.push(chosen);
					var rarity:String = GameData.dpgRewardsMap.get(chosen)[0];
					var itemName:String = GameData.dpgRewardsMap.get(chosen)[2];
					var itemAmount:Int = 1*data.dpgMultiplier;

					if (rarity == "Rare") {
						itemAmount = Math.round(Math.random()*2+1)*data.dpgMultiplier;
					}

					if (rarity == "Mythical") {
						itemAmount = Math.round(Math.random()*3+1)*data.dpgMultiplier;
					}

					playSound("assets/audio/environment/caveWinSmall", "reward");
					append(rarity+" Combo: <!b>"+chosen.toTitleCase()+"<!b>\n<!i>"+GameData.dpgRewardsMap.get(chosen)[1]+"<!i>\n\n");
					addToItem(itemName, itemAmount);
					if (data.dpgMultiplier != 1) msg("<!b>x"+data.dpgMultiplier+" BONUS!<!b>", true);
				}

				if (data.dpgMultiplierTimer > 1) {
					data.dpgMultiplierTimer--;
					append("<!b>x"+data.dpgMultiplier+"<!b> Rolls Left: "+data.dpgMultiplierTimer);
				} else if (data.dpgMultiplierTimer == 1) {
					data.dpgMultiplierTimer--;
					data.dpgMultiplier = 1;
					refreshChoices();
				}
				dpgButton.y = dpgTerminal.y+dpgTerminal.height/1.5;
			}

			generateDegrade = function() {
				var iterationTime:Float = Math.random()*0.03+0.1-timesPressed*0.001;
				var currentFlip:Int = 0;
				var preFlip:Int = Math.round(Math.random()*4+2);
				while (preFlip % 2 != 0) preFlip = Math.round(Math.random()*4+2);
				var sufFlip:Int = Math.round(Math.random()*2+6);
				while (sufFlip % 2 != 0) sufFlip = Math.round(Math.random()*2+6);

				tween(dpgButton, {y: dpgButton.y+1}, 0.1, {type: REVERSE});

				chosenPrefix.setFormat({wordWrap: false, fontColour: 0xCECECE, fontSize: 22});
				chosenSuffix.setFormat({wordWrap: false, fontColour: 0xCECECE, fontSize: 22});

				chosenPrefix.setText(prefixList.pickOne());
				chosenSuffix.setText(suffixList.pickOne([chosenPrefix.getText()]));
				chosenPrefix.y = chosenSuffix.y = dpgTerminal.y+dpgTerminal.height*0.42;
				chosenPrefix.scaleY = chosenSuffix.scaleY = 0;
				chosenPrefix.centerPivot = chosenSuffix.centerPivot = true;

				var iter1:Int = 0;
				var iter2:Int = 0;

				function resetX() {
					chosenPrefix.x = dpgTerminal.x+dpgTerminal.width/2-chosenPrefix.fieldWidth-5;
					chosenSuffix.x = dpgTerminal.x+dpgTerminal.width/2+2;
				}

				function flip(chosen:MintText):Void {
					if (chosen == chosenPrefix) {
						iter1++;
						if ((iter1+1) % 2 == 0) {
							return;
						}
						chosen.setText(prefixList.pickOne());
						resetX();
					}

					if (chosen == chosenSuffix) {
						currentFlip++;
						iter2++;
						if ((iter2+1) % 2 == 0) {
							return;
						}

						chosen.setText(suffixList.pickOne([chosenPrefix.getText()]));

						if (currentFlip < sufFlip) {
							playSound("assets/audio/ui/menuOpen", "rolling");
						} else {
							dpgButton.copyTile("anotherOne1", 0, 0);
							dpgButton.mouseEnabled = true;
							tween(dpgButton, {y: dpgButton.y-1}, 0.1, {type: REVERSE});
							playSound("assets/audio/ui/menuClose", "rolling");
							checkRewards();
						}
						resetX();
					}
				}
				resetX();

				Actuate.tween(chosenPrefix, iterationTime, {scaleY: 1})
					.repeat(preFlip).reflect().ease(Quad.easeOut)
					.onRepeat(flip, [chosenPrefix]);

				Actuate.tween(chosenSuffix, iterationTime, {scaleY: 1})
					.repeat(sufFlip).reflect().ease(Quad.easeOut)
					.onRepeat(flip, [chosenSuffix]);
			}

			setChannelVolume("reward", 0.5);

			for (i in [2, 3, 5])
				addChoice("x"+i+" Bonus", function () {
					data.dpgMultiplierTimer = i*5;
					data.dpgMultiplier = i;
					append("<!b>x"+data.dpgMultiplier+"<!b> Rolls Left: "+data.dpgMultiplierTimer);
					refreshChoices();
				}, {cost: ["Capsule", (i == 2 ? 2 : i == 3 ? 5 : i == 5 ? 10 : 2)], enabled: data.dpgMultiplierTimer <= 0});

			addChoice("Lube the button!", function () {
				timesPressed = (buttonLube == "Glowberry Wine" ? 65 : buttonLube == "Piss Balloon" ? 60 : buttonLube == "Cum Balloon" ? 50 : 50);
				refreshChoices();
			}, {cost: [buttonLube, 1], enabled: timesPressed < 50});
			addChoice("Back.", explore.bind("hub"));
		}

		if (seg == "Rides") {
			if (!getJournalEntries().contains("Missing Page 14")) {
				unlockJournal("Missing Page 14");
				msg("Found Missing Page #14", true);
				playSound('assets/audio/environment/journalPage');
			}

			append("There are a few actual amusement park rides up here: spinning teacups with dildos attached to the seats, a little roller coaster with dildos on the seats, even a few arcade cabinets with dildos on the seats, but most people are riding other things."+(data.hyperSharkDone?"":"\n\nThere's a hyper-cocked shark futa with a sign around her neck that says <!i>Drain my piss, win five caps!<!i>\n\n")+"");
			if (!data.hyperSharkDone) addChoice("Approach the shark girl.", explore.bind("shark1"), {kinks: ["Guest Writer", "Intersex", "Piss"]});
			addChoice("Back.", explore.bind("hub"));
		}

		if (seg == "shark1") {
			unlockJournal("Hyper Shark Girl");
			msg("<!img:kink/Guest Writer.png> Guest Writer: Gray", true);
			append("You kneel in front of the shark amidst the crowd. Her glutinous, fat orbs seem that much larger up close.\n\nYou can see every pulsing vein in her sack, each orb the overwhelming size of trashbags filled to bursting, each one twitching and seizing violently with the threat of release. Her near-agonized groaning snaps you out of your fascinated silence, and as she spreads both of her long, luscious legs to give herself some breathing room, she whimpers a desperate plea:\n\n\"P-Please... hurry, it's been so fucking long...\"");
			addChoice("Tongue her cockhole.", explore.bind("shark2"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark2") {
			append("You finally grant her some relief, wrapping your forearms around her fuckstick, delighting in the way her hole dilates as if to greet you. Quickly finding yourself unable to quite fit her cockhead into your jaw, you instead settle on opening wide and pressing your lips firmly against her tip, slipping your hot, silky tongue inside her pisshole to coax her to release in your maw.");
			addChoice("Coax it hard~", explore.bind("shark3"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark3") {
			append("She needs no coaxing.\n\nIn a flash that racing, wide stream detonates over your tongue and rapidly fills your mouth with hot, fresh relief. The taste sinks into your tongue before you know what's happening, acrid and bitter as a lash, and for a moment you nearly forget what you're supposed to do with it all.\n\nThankfully, the shark reminds you amidst her bubbling squeaks of relief:\n\n\"Drink... drink it, you little... oh, good god, yes, yes, YES...! Fffuck, I needed to go...\"");
			addChoice("Guzzle.", explore.bind("shark4"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark4") {
			append("Her words ring sharply in your ears as your sweet little mouth rapidly fills with her relief. Piss pools in frothy puddles, flowing readily over your tongue in thin, constant rivers and streams, until you feel the bitter gold begin to strain against your cheeks and lips.\n\nIt takes a herculean effort, but you manage to force it down your throat with a deep, lecherous <!i>GULP<!i>.\n\nThat mouthful was the first of many, and only a couple of seconds have passed since the shark started forcefully relieving every ounce of tension in her overfilled bladder inside you, leaving her rich, unmistakable taint upon your senses...");
			addChoice("Keeep guzzling.", explore.bind("shark5"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark5") {
			append("The first pint goes down alright. The second is easier, perhaps because you've acclimated to the overwhelming taste of urine— but the third is a struggle.\n\nOn the few occasions you stop to breathe you're rewarded with a rapid overflow, small torrents of liquid gold spilling freely from your lower lip. The heat of the shark's piss makes you pine for something cooler and clearer to drink, especially as its scent begins to mingle with that of the musky sweat dribbling down the inside of her thighs.\n\nYou do your very best to choke down as much of her relief as strictly possible— even as you began to feel just a tad bloated down below.");
			addChoice("... Okay, pull off a little.", explore.bind("shark6"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark6") {
			append("You keep guzzling and guzzling, but there simply feels like there's no end, and, with tears of strain in your eyes, you finally began to draw off of the relentlessly spraying, trembling dick...\n\nBut you can't.");
			addChoice("???", explore.bind("shark7"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark7") {
			append("With a jolt her palm presses firmly against the back of your head and each one of her fingers knits tightly into your hair.\n\nShe meets your vexed gaze with one of smug satisfaction and triumph, completely dropping the desperate-and-quivering act, holding you in place and reaching down to forcibly massage your throat til your gag reflex goes flaccid and you're forced to gulp down more and more of her acrid piss.\n\nYou struggle in vain against her iron grip— in fact, you can't even phase her unyielding musculature. She ignores your noises of protest, drowning them out with her own vicious, delighted crooning. There's nothing to do, you find, but to settle in and bear the rapidly building discomfort as she empties her ripened bladder over your tongue and esophagus.\n\nYou're held there on your knees before her for several more long, unbearable moments, each second ticking by more slowly than the last. The heat of her crotch bears down on you. You're both steadily dripping sweat, and the steady gush of fresh, hot piss only compounds the issue. Your throat throbs alight with the red-hot burn of urine being forced down its convulsing tract, and your gut protests in the only way a rapidly, painfully stretching muscle could: by contracting, and thus sending up nasty gags and gurgling noises for her listening pleasure.\n\nThe heat is swallowing you up. Your vision darkens as you began to succumb...");
			addChoice("Oh god!", explore.bind("shark8"));
			addChoice("Back.", explore.bind("Rides"));
		}

		if (seg == "shark8") {
			if (canGain) addToItem("Capsule", 5);
			data.hyperSharkDone = true;
			append("Then, finally, the jet of hot gold turns to a gentler trickle... and gradually slows to a crawl.\n\nHer grip loosens.\n\nYou shoot backwards several inches, all that piss-soaked sharkmeat slipping past your lips, panting and sputtering helplessly. She still has to relieve herself a little, letting steadily slower spurts and squirts fall in hot droplets down over the crown of your head, a satisfied coo slipping free from between her teeth...\n\nAnd then it's done, and there's nothing left but the overwhelmingly bitter aftertaste in your mouth.\n\nWith an all too wide, razor-toothed smile, the shark lifts a single leg and presses the underside of her piss-slicked foot against your nose in obvious mockery, quite literally rubbing it in your face.\n\nShe tosses the five caps reward down to your feet.\n\n\"Breathe deep, you little bitch...\"");
			addChoice("Mmmmf... thank you...", explore.bind("Rides"));
			addChoice("Back.", explore.bind("Rides"));
		}
	}
}
