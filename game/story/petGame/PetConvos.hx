package story.petGame;

class PetConvos
{
	public static function requireStat(pet:Pet, stat:Int, amount:Int):ButtonConfig {
		var statString = "";
		if (stat == STAT_TRUST) statString = "Trust";
		if (stat == STAT_STAMINA) statString = "Stamina";
		if (stat == STAT_LUCK) statString = "Luck";
		if (stat == STAT_CHARISMA) statString = "Charisma";
		if (stat == STAT_SENSITIVITY) statString = "Sensitivity";
		if (stat == STAT_PSYCHE) statString = "Psyche";

		var config:ButtonConfig = {};
		config.enabled = pet.stats[stat] >= amount;
		config.toolTip = 'Requires:\n$amount $statString (${pet.name} has ${Math.round(pet.stats[stat])})';

		return config;
	}

	public static function love(pet:Pet, modif:String="start"):Void {
		clear();

		if (modif == "start") {
			append("You poke your head through the door.\n\n... She's folded herself into a gooey little ball on her bed, feet over shoulders. Her face pokes out from between her thighs. \"You have to taste me right now.\"");
			addChoice("Like that specific spot, or...?", love.bind(pet, "love2"));
		}

		if (modif == "love2") {
			append("\"Anywhere,\" she says, breathless. \"I can't believe it took me this long but I finally licked myself to see how I taste and it's the weirdest, sweetest, most delicious thing I've ever dragged my tongue across— here—\"\n\nShe runs up all excited and stuffs a goopy paw past your lips. Her digits are small enough (and malleable enough) that she can push her fist right to the back of your throat without it being uncomfortable for either of you.");
			addChoice("Pull back!?", love.bind(pet, "lovepull"));
			addChoice("... Run my tongue between her fingers.", love.bind(pet, "loverun"));
		}

		if (modif == "lovepull") {
			append("You make a wet, disgruntled <!i>grrlrlghnnhfgh?!<!i> noise and pull off her fist. About half of its goo remains in your mouth, which you awkwardly drool into your palm and then... kinda... rub back onto her paw. It absorbs the goo and goes back to normal.\n\nShe's worried. \"Didn't I taste good?\"");
			addChoice("No, I just... uh... just lemme try licking downstairs~", love.bind(pet, "love3"));
		}

		if (modif == "loverun") {
			append("She stares at you expectantly as you slurp on her fist and consider the flavor. It's... it's...\n\nShe tastes exactly like chocolate-coated watermelon.\n\nShe pops her fist out of your maw and shakes it off, getting goo everywhere. \"See?\"");
			data.gooGoatFlavorKnown = true;
			addChoice("Hmmm. Couldn't quite get a taste there. Might need to try a more flavorful spot.", love.bind(pet, "love3"));
		}

		if (modif == "love3") {
			append("\"Alright, but... it's <!i>really<!i> flavorful. I mean like melted gummy bear smoothie plus half a cup of sugar flavorful.\"\n\nShe sits back on the bed. Her goo ass makes a little <!i>schp<!i> noise against the bedsheets, which are so constantly soaked with her juices— all sorts— that you frequently wonder if it wouldn't be better for her to just sleep in a little plastic doggy bed or something. No, she always says, sheets are just sooo soft.\n\nYou climb onto those bedsheets, hands and knees. She leans against the wall and rests both paws on the inside of her thighs, thumbs teasing her little nuts up and exposing her goatcunt to you.");
			addChoice("Lick.", love.bind(pet, "love4"));
		}

		if (modif == "love4") {
			append("You start at the bottom and work your tongue up. It's tough. You want this lick to be long and sensual, deep, full of hot friction, but her goo is so viscous that you're sore before you even make it halfway to her clit.\n\nYou have to pull off early, with only a thin coat of goo on your tongue. It's not really enough to get the full flavor. You only taste some vague fruity sweetness.");
			addChoice("Gah. Sorry. You're like glue. Let me try that again.", love.bind(pet, "love5"));
		}

		if (modif == "love5") {
			append("... She's blushing, eyes half-closed, maw drooping open, her tongue already starting to flirt with ahegao. \"Th-That's fine,\" she says.\n\nYou try for something a little faster this time: a lick so fierce it parts her lips and sinks halfway inside her stretchy cunthole, a lick that tugs apart all the sinewy bridges of goo hanging between her labia and splays them over your tongue. She bites back a squeal.\n\nOkay, you got a good taste of her that time.");
			if (!data.gooGoatFlavorKnown) append("\n\nShe tastes exactly like chocolate-coated watermelon.");
			addChoice("Hm. Fruity, yet decadent.", love.bind(pet, "love6"));
			addChoice("You have a yummy cunny.", love.bind(pet, "love6"));
		}

		if (modif == "love6") {
			append("\"Oh, stop,\" she says, waving dismissively. \"You're just typing that.\"");
			addChoice("Well yeah, but I can imagine how it tastes from the description.", love.bind(pet, "love7"));
		}

		if (modif == "love7") {
			append("\"... Right.\"\n\nShe sighs and leans against you, slipping a couple fingers into her saliva-soaked puss. \"I'll be honest... I didn't just call you in here to grind my crotch on your mouth. I just... I feel like... as long as I'm in here and you're out there... we're never really gonna be together. I hate that. I want you to know stuff about me. Things you'd know if we were really together. How I taste, what I sound like—\"\n\nBy the way, her voice is a little rough and scrappy, like a cartoon boy's, despite her vocal chords being basically pre-lubed by nature. She has a tendency to pause heavily between her sentences, which is almost always skipped for your convenience.\n\n\"—what I look like... I just mean... you're gonna have to stop playing someday. When that day comes,\" she pauses to wrap you up in a big fat cheery hug, \"I want you to remember me.\"");
			addChoice("That's the trouble with online relationships.", love.bind(pet, "loveonline"));
			addChoice("I'll always remember you.", love.bind(pet, "loveremember"));
			addChoice("I'll always remember you, ya little fuck.", love.bind(pet, "loverememberfuck"));
			addChoice("I could never forget my daughter.", love.bind(pet, "loverememberdaughter"));
		}

		if (modif == "loveonline") {
			append("\"What is?\"");
			addChoice("Stunted intimacy.", love.bind(pet, "loveonline2"));
		}

		if (modif == "loveonline2") {
			append(pet.name+" pounds her cunt open with three fingers, brow furrowed.  \"Ugh. Maybe if we fuck hard enough and often enough, we could be just as intimate as a real-life couple...?\"");
			addChoice("We at least gotta try!!", love.bind(pet, "love8"));
		}

		if (modif == "loveremember") {
			append("She goat-purrs like crazy. \"I'll always remember you, too.\"\n\n"+pet.name+" says that into your mouth. It comes out gurgly and sweet with the flavor of her body.\n\nShe whispers one more thing: \"Let's make some memories.\"");
			addChoice("Aw, more sex? But I was getting into all that romance...", love.bind(pet, "loverememberend"));
		}

		if (modif == "loverememberfuck") {
			append("She bites your lip playfully. Her goo teeths squish painlessly against it. \"I'll always remember you, too, ya big "+(data.gooGoatSwears?"fuck":"frick")+".\"\n\n"+pet.name+" says that into your mouth. It comes out gurgly and sweet with the flavor of her body.\n\nShe whispers one more thing: \"Let's make some memories.\"");
			addChoice("Aw, more sex? But I was getting into all that romance...", love.bind(pet, "loverememberend"));
		}

		if (modif == "loverememberdaughter") {
			append("She looks at you reverently. \"And I couldn't forget my "+data.gooGoatPlayerTitle+".\"\n\n"+pet.name+" says that into your mouth. It comes out gurgly and sweet with the flavor of her body.\n\nShe whispers one more thing: \"Let's make some memories.\"");
			addChoice("Aw, more sex? But I was getting into all that romance...", love.bind(pet, "loverememberend"));
		}

		if (modif == "loverememberend") {
			append("\"Don't ‘aw more sex' me. We haven't fucked in forever! Do you know how I learned to t-taste my own parts like that in the first place? Boredom. Boredom and lots of stretching! Now c'mere...\"\n\nShe sexually harasses you into spreading your legs.");
			addChoice("Aw, more sex? But I was getting into all that romance...", love.bind(pet, "love8"));
		}

		if (modif == "love8") {
			append("\"We haven't tried this yet.\"\n\n"+pet.name+" grabs your cock around the base and tugs you forward til you're kneeling on the bed with her. She's pretty short, so even while you kneel and she stands, her crotch lines up almost perfectly with yours. She takes advantage of this fact to rest her chin on your shoulder and scooch forward. The warmth of her dripping cunt brushes up against your shaft, which she's still gently holding.\n\nShe aims you up and forward, right between her little thighs, and clenches them shut around your shaft. They feel almost identical to a cunt. Fat globs of goo run down over your nuts. Her breath pours like a slow-motion airborne waterfall over your right shoulder blade. \"Try it,\" she purrs. \"I bet it'll feel just like my pussy...\"");
			addChoice("Grab her ass hard and fuck her thighs.", love.bind(pet, "love9"), {kinks: ["Love"]});
		}

		if (modif == "love9") {
			append("You wrap your hands around her little cubby bubblebutt and squeeze <!i>too<!i> hard— your fingers actually sink through her membrane, deep into her ass, brushing up against her g-spot from the inside. Bleat's eyes pop open with the shock of it, and she bites her lip... but she doesn't say anything.\n\n(She's 100% overwhelmed.)");
			addChoice("Oops~! (Grip lighter.)", love.bind(pet, "love10"));
		}

		if (modif == "love10") {
			append("After unplugging and repositioning your grip, you start thrusting. Just a few gentle bucks of your hips. About half of your shaft moves through her legs each time, and your head always pops out cutely on the other side, just below her asscheeks. It's hard to keep your grip soft, though... she's so slippery and small that sometimes you feel your cocktip is in danger of diverting either up inside her, off into her thigh, or all the way down to her wobbly knees, and you get the urge to sink your fingers back down into her perfect, shiny lil cheeks... as a necessary evil, of course, to prevent an even weirder penetration, but—\n\n\"It's okay.\"\n\nShe rolls her thighs backward so the lips of her cunt kiss your cocktip.\n\nYou were wrong. It feels nothing like her thighs. It's much hotter and somehow, despite her entire body being goo, a lot wetter.\n\n\"It's okay,\" she breathes. \"You can penetrate any part of me you want.\"");
			addChoice("Oh really... (Grope around and inside her puss.)", love.bind(pet, "love11"));
		}

		if (modif == "love11") {
			append("You tuck your cock up behind her cunt and casually park it between her buttcheeks. She goes a little ditzy from its fierce, hot throbbing against her pucker.\n\nYou pin her clit beneath a fingertip and push, push, puuuuuush— <!i>pop!<!i>\n\nIt slips inside her. She squeals right in your ear (ow) and drools languid strings of blue saliva over your shoulder. \"Deeper~!\"\n\nYou push your finger two inches deeper, crushing her little pleasure nublet. Eventually the strain is too much; it slips away and pops back up to the surface, beside your knuckle. She inhales through gritted teeth and fixes you with a fiery stare. \"Come on. More. Work that cub cunt like playdough.\"\n\n(She stifles laughter at herself.)");
			addChoice("Tug and grope and finger every part of it, inside and out~!", love.bind(pet, "love12"));
		}

		if (modif == "love12") {
			append("You yank her cuntlips open and cram three fingers from each hand inside— oh no, not in the wide, inviting hole in the center, but deep into the sensitive crevices on either side, the smooth stretches of goo where her mound meets her inner thighs. You link your fingers right down the middle and cup her cunt like a double palmful of warm, azure pondwater.\n\nThen you lean down for a slurp~\n\nShe was already blown away by that technique when you start the next one, which is less of a technique and more just you yanking her pussy around like she asked, like it's sculpting clay, pushing digits in and yanking fat, schlooberly strings of cuntslime out. After ten minutes of this she's barely hanging onto your shoulders— oop, nope, there she goes: she falls onto her back on the bed, moaning like a little bitch, and spreads her legs so wide they're parallel to each other.\n\n\"Okay just fuck me!\" she begs. \"I-It's exciting to be groped in so many new ways b-but— I need familiarity! I need cock! I need you! <3\"");
			addChoice("Cuntfuck!", love.bind(pet, "love13"));
		}

		if (modif == "love13") {
			append("You climb onto her and rest your cheek on her gooey, superflat cub chest so you can listen to her heartbeat quicken in the moment that you feed her every single inch of your cock at once. She grunts, but not like a bear's or a chubby dude's grunt, more like an upset puppy's— just a bubbly little exhale against your head.\n\nThat girly lil grunt was the first of many. She releases one from deep in her stomach after every time you bang against her cervix. Your nuts pap over and over against the top of her asscheeks, denting their membrane temporarily. Your head sinks partially into her chest, and soon, without meaning to, you're listening to her heart race through only a gossamer layer of goo.\n\n\"Cum!!\" she begs you. \"I know I've b-been buh-buh-bossing you around a lot but god"+(data.gooGoatSwears?"damn":"darn")+"it jizz inside me right now!!\"");
			addChoice("Jeez fine!", love.bind(pet, "love14"));
		}

		if (modif == "love14") {
			cumEffect();
			append("Sudden spunk electrifies her ditzy, fuckdrunk body. Her muscles contract and quiver with excitement. She sits up, one paw on the back of your head, and clings to you like a terrified child to its mother. From the outside her lust really does look like it's bordering on terror: her eyes are grimaced shut and she's shaking all over.\n\nYour final thrusts pound into her hot, gooey little snatch so deep that her grunts turn to whimpers turn to one constant high-pitched <!i>squeeeeeee<!i> that warbles up and down depending on whether your cockhead happens to be crushing her g-spot or not at any given moment. You hug her close to your "+(data.hasBoobs?"tits, deep between them,":"chest")+" and throw your hips forward one last time. The <!i>squeee<!i> stops.\n\nYou hold her in near-silence. The only sounds are her soft panting and the deep, muffled gurgling of her tiny goowomb filling, then overfilling, with your "+(isActive("Mood Ring")?getMood("You"):"")+"cum.\n\nThe silence stretches on.\n\nYou both lay down and embrace. Your cock slowly softens inside her.\n\n");
			addChoice("Lay with her. Next x5. Next x8. However long it takes until she's satisfied.", love.bind(pet, "love15"));
		}

		if (modif == "love15") {
			append("After a solid hour of laying there together in the quiet, cozy warmth of the bedroom you built together, on the bedsheets she insisted on using... she breaks the silence with her quiet, scrappy voice:\n\n\"I love you.\"\n\nHer eyes search yours.\n\nShe doesn't look at you like she looks at ferals or islanders. When she looks at one of them, there's always a spark: the mutual magic of knowing that the mind you're making eye contact with lives just behind their pupils. When she looks in your player model's eyes, she knows they aren't really <!i>yours.<!i>\n\nThe spark is missing. She may as well be looking at a brick wall. And yet, despite that, despite the cum dribbling so distractingly down her thighs, despite the drowsiness tugging at her eyelids, she holds her unwavering gaze to yours and searches for it anyway.");
			addChoice("I love you too.", drawHome);
		}

		addChoice("Back.", drawHome);
	}

	public static function bathDrown(pet:Pet, modif:String="start"):Void {
		clear();

		if (modif == "start") {
			append("\"Sure!\" "+pet.name+" chirps and plops her bare butt down on the rim of the bathtub, grinding it back and forth imperceptibly slow.\n\nYou crank the HOT tap up to eleven and fill it with steamy, crystal-clear water.");
			addChoice("Test er out.", bathDrown.bind(pet, "bathe1"));
		}

		

		if (modif == "bathe1") {
			gainStat(pet, STAT_STAMINA, -25);
			append(data.gooGoatName+" dips her pinky toe into the warm water, testing it. \"Mmmm... perfect.\"\n\nShe throws both feet over the side and splashes right in. The water rises up to her chin. As she relaxes her body absorbs some of the hot liquid, densifying, sinking til her lower back presses flat to the bottom of the tub.\n\nThen she siiiiiiiighs~");
			addChoice("Scrub her down~", bathDrown.bind(pet, "bathe2"));
		}

		if (modif == "bathe2") {
			append("You run a soft pink bar of soap first over her chest, her throat, then in tiny circles on both cheeks, smushing them up.\n\nShe pbbtbpbhpths suds from her pouty lips. \"Ptoo! Jeez, go lower, not higher...\"");
			addChoice("Scrub her stomach, then.", bathDrown.bind(pet, "bathe3"));
		}

		if (modif == "bathe3") {

			append("You go a bit lower, dipping the bar's corner into her belly button. \"That's more like it~\"\n\nShe grabs both sides of the tub and lifts her hips a little to make it easier for you, matching your rhythm with slow circular belly gyrations. Her cock bobs to the surface below, displacing a few bubbles.");
			if (getFlag("BathDone") != 1) {
				addChoice("Hey, if you were just spawned out of a couple letters and numbers, why do you have a belly button?", bathDrown.bind(pet, "bathe4"));
			} else {
				append("\n\n\"Hey,\" she whispers, all steamy. \"I want to feel it again... again.\"");
				addChoice("Sure thing.", bathDrown.bind(pet, "bathe9"), {kinks: ["Snuff"]});
				addChoice("Sorry. (End)", bathDrown.bind(pet, "batheskip"));
			}
		}

		if (modif == "bathe4") {
			append("\"Well, the rest of my body had to build off of something, didn't it...?\" she puzzles, as if you asked the obvious. \"Your belly button pops in, then your stomach, then the rest of you folds out from both ends. Didn't you feel that— er, get that described to you when you first came here?\"");
			addChoice("No???", bathDrown.bind(pet, "bathe5"));
			addChoice("I've been cheated.", bathDrown.bind(pet, "bathe5"));
			addChoice("That's weird as fuck.", bathDrown.bind(pet, "bathe5"));
		}

		if (modif == "bathe5") {

			append(data.gooGoatName+" stifles her giggles under the surface, converting them into bubbles.\n\nShe stays there for a little too long, all thoughtful...\n\nWhen she brings her maw up for air the rest of her body follows through in one slippery goopy movement, butt slapping down on the bathtub's back rim and crotch grinding directly against your bar of soap.\n\n\"Hey,\" she whispers, all steamy. \"I want to feel it again.\"");
			addChoice("Hm?", bathDrown.bind(pet, "bathe6"));
		}

		if (modif == "bathe6") {
			append("Water oozes from her pores. She wipes the dribble from her cocktip with a thumb then jabs it in her mouth.\n\n\"I want to feel the folding-out-from-my-belly-button again... you know... the...\"\n\n"+pet.name+"'s eyes flick to you. \"Spawning. I want to spawn again.\"\n\nShe's tense, waiting on your reaction, even with her legs still soaking in the soothing hot bath.");
			addChoice("Oh... you want me to...", bathDrown.bind(pet, "bathe7"), {kinks: ["Snuff"]});
			addChoice("I'm sorry. I can't do that. (End)", bathDrown.bind(pet, "batheskip"));
		}

		if (modif == "batheskip") {
			append(data.gooGoatName+" freezes up. \"Hey. No. It's okay. It's weird. It's too weird. I getcha. I'm not even that into it probably. I was just curious. I'm sorry. It's okay.\"\n\nShe slips back into the water.");
			addChoice("End.", drawHome);
		}

		if (modif == "bathe7") {
			append("Neither of you noticed, but her nuts have almost entirely enveloped the soap bar. She pulls back, popping it out, blushing as her shiny, lathered shaft hardens. \n\n\"... If you're okay with it, I mean...\"");
			addChoice("... Well, I could give it a shot.", bathDrown.bind(pet, "bathe8"));
			addChoice("I'm more than okay with it~", bathDrown.bind(pet, "bathe8"));
			addChoice("Prepare to git drownfucked!!! 3:<", bathDrown.bind(pet, "bathe8murderfuck"));
			addChoice("On second thought... nah. (End)", bathDrown.bind(pet, "batheskip"));
		}

		if (modif == "bathe8murderfuck") {
			append(data.gooGoatName+" cringes between giggle fits. \"Oh God, that's... why'd you have to put it like that...\"");
			addChoice("Next. :3", bathDrown.bind(pet, "bathe9"));
		}

		if (modif == "bathe8") {
			append("She grins, steps out of the tub. \"Thanks. So let's... um... well...\"\n\nShe peers down at the rippling bath. \"There's one very obvious... <!i>escape route<!i> we could take, here...\"");
			addChoice("Next. :3", bathDrown.bind(pet, "bathe9"));
		}

		if (modif == "bathe9") {
			var swears = "";
			if (data.gooGoatSwears) swears = " shit";

			append("She drops to her knees on the tile and leans over with both hands on the rim, steam licking at her face. She glances back over her shoulder, wiggles her butt a little for you.\n\n\"Go ahead and use me while I last,\" she says, her nervous expression rippled on the surface of the water. \"I'll tap your left thigh if I want you to drown me harder and your right for softer, okay?\"\n\nShe smiles and parts her thighs. \"God, I can't believe that"+swears+" just came out of my mouth...\"");
			addChoice("Drownfuck her.", bathDrown.bind(pet, "bathe10"));
			addChoice("... Hey... look... sorry... but... actually... um... (End)", bathDrown.bind(pet, "batheskip"));
		}

		if (modif == "bathe10") {
			var resizeX = 600;
			var moveX = 230;
			var moveY = 170;

			if (data.hasCunt) {
				addMovie("goatTubCuntSoft", 12);
				resizeMovie("goatTubCuntSoft", resizeX);
				moveMovie("goatTubCuntSoft", moveX, moveY);
			} else {
				addMovie("goatTubCockSoft", 12);
				resizeMovie("goatTubCockSoft", resizeX);
				moveMovie("goatTubCockSoft", moveX, moveY);
			}

			append("You wrap your hand nice and gentle over her head and guide it down, down...\n\nThen start pounding away like no tomorrow~\n\nLittle bubble-bursts rise through the water with her first experimental breaths, stomach clenching, grip tightening on the tub's rim... yet, she reaches back and taps your left thigh.");
			addChoice("Harder.", bathDrown.bind(pet, "batheharder"));
			addChoice("Softer.", bathDrown.bind(pet, "bathesofter"));
		}

		if (modif == "batheharder") {
			var cum = "Cum.";
			var resizeX = 600;
			var moveX = 230;
			var moveY = 170;

			if (data.hasCunt) {
				cum = "Press the cum button.";
				addMovie("goatTubCuntHard", 24);
				resizeMovie("goatTubCuntHard", resizeX);
				moveMovie("goatTubCuntHard", moveX, moveY);
			} else {
				addMovie("goatTubCockHard", 24);
				resizeMovie("goatTubCockHard", resizeX);
				moveMovie("goatTubCockHard", moveX, moveY);
			}

			append("You drownfuck the heck outta her~");
			addChoice("Even harder!!!", bathDrown.bind(pet, "batheevenharder"));
			addChoice(cum, bathDrown.bind(pet, "bathecum"));
		}

		if (modif == "batheevenharder") {
			var cum = "Cum.";
			var resizeX = 600;
			var moveX = 230;
			var moveY = 170;

			if (data.hasCunt) {
				cum = "Press the cum button.";
				addMovie("goatTubCuntHard", 50);
				resizeMovie("goatTubCuntHard", resizeX);
				moveMovie("goatTubCuntHard", moveX, moveY);
			} else {
				addMovie("goatTubCockHard", 50);
				resizeMovie("goatTubCockHard", resizeX);
				moveMovie("goatTubCockHard", moveX, moveY);
			}

			append("RRRRRRRRRRRRRRRRRRRRRRAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAARRRRRGGGGGHHH!!!");
			addChoice(cum, bathDrown.bind(pet, "bathecum"));
		}

		if (modif == "bathesofter") {
			var cum = "Cum.";
			var resizeX = 600;
			var moveX = 230;
			var moveY = 170;

			if (data.hasCunt) {
				cum = "Press the cum button.";
				addMovie("goatTubCuntSoft", 8);
				resizeMovie("goatTubCuntSoft", resizeX);
				moveMovie("goatTubCuntSoft", moveX, moveY);
			} else {
				addMovie("goatTubCockHard", 8);
				resizeMovie("goatTubCockHard", resizeX);
				moveMovie("goatTubCockHard", moveX, moveY);
			}

			append("You misinterpret her signal and slow down, drowning her all gentle and loving.\n\nShe taps your left thigh again, angry bubbles rising.");
			addChoice("Okay fine harder.", bathDrown.bind(pet, "batheharder"));
			addChoice(cum, bathDrown.bind(pet, "bathecum"));
		}

		if (modif == "bathecum") {
			cumEffect();
			var resizeX = 600;
			var moveX = 230;
			var moveY = 170;

			if (data.hasCunt) {
				addMovie("goatTubCumCunt", 12);
				resizeMovie("goatTubCumCunt", resizeX);
				moveMovie("goatTubCumCunt", moveX, moveY);
			} else {
				addMovie("goatTubCumCock", 12);
				resizeMovie("goatTubCumCock", resizeX);
				moveMovie("goatTubCumCock", moveX, moveY);
			}
			append("You hold her face deep under and pump spurt after spurt into her trembly little body. From the dribbles of pussgoo you sense she's glad she lasted long enough to feel it gush out inside her~\n\nWith the last few pumps, she weakens...");
			addChoice("Finish her off.", bathDrown.bind(pet, "bathefinish"));
		}

		if (modif == "bathefinish") {
			var dick = "your softening cock";
			if (data.hasCunt) dick = "the dildo";

			append("You wrap your free hand around her throat and push her head all the way under with the other, keeping "+dick+" lodged up her puss til the very last twitch.");
			addChoice("Wind down.", bathDrown.bind(pet, "bathewinddown"));
		}

		if (modif == "bathewinddown") {
			setFlag("BathDone", 1);
			append("From down the hall you hear the distinct <!i>pwip<!i> of a belly button popping into existence, then the <!i>squooosh<!i> of a goobody folding out after it.\n\nA freshly respawned "+pet.name+" steps into the bathroom, grinning shyly. \"Well... I'll be honest. The destination was a little underwhelming, compared to the journey.\"");
			addChoice("End~", drawHome);
		}
	}

	public static function shopIntro(pet:Pet, modif:String="start"):Void {
		clear();

		if (modif == "start") {
			gainStat(pet, STAT_STAMINA, -10);
			setLocation("Bright Forest");
			setFlag("shopIntro", 1);
			append("\"Shopping?\" "+pet.name+" asks, dodging roots and rocks on the forest path with growing skill. \"We aren't going to the City, are we...?\"");
			addChoice("Nah. There's this little mini-Mynt shop thing always floating around. Listen for the meows...", shopIntro.bind(pet, "1"));
		}

		if (modif == "1") {

			append("You both listen hard........\n\nThe X-Files theme plays in your head as a toneless mewl floats toward you from deep in the trees. A fat CRT monitor with a ghostly green imitation of Mynt's catface bobs toward you.\n\n\"WELCOME-TO-THE-CIRCUS-OF-VALUES~!\"\n\n"+pet.name+" looks terrified.");
			addChoice("It just spawns and deletes items. It can't hurt you.", shopIntro.bind(pet, "2"));
		}

		if (modif == "2") {
			append("The AUTO-SHOP zooms directly up to "+pet.name+"'s face and chirps: \"PET-DETECTED! PET-DETECTED!\"\n\n\"AAAUGH WHAT DOES IT WANT?!\" she shrieks, hiding behind your leg.\n\nThe AUTO-SHOP's hardware churns deep and rough. It even starts having some trouble levitating. \"GIFTS-DEPLOYING... GIFTS-DEPLOYING...\"");
			addChoice("Ooooo free shit!", shopIntro.bind(pet, "3"));
		}

		if (modif == "3") {
			petGameData.items.push("Collar");
			petGameData.items.push("Dildo");
			msg("You got a free Collar and Dildo~!");

			append("\"BLUUUUEEEEGGGGHHHHH...\"\n\nThe AUTO-SHOP pukes a Collar and a Dildo into existence. \"THANK-YOU-FOR-PLAYING-PET-MINIGAME—CONSTRUCT... NOT... SUPPORTED... CONSTRUCT... NOT... SUPPORTED...\"\n\nIt wanders away, glitching out.\n\n"+pet.name+" peeks out from behind your leg and sniffs her gifts, checking out the collar. It's got a faceless golden coin dangling from the front.\n\n\"Hmmm...\" she muses, turning now to the thick pink sex toy, giving that an extra-hard sniff. \"We should... um... try these out, shouldn't we...\"");
			addChoice("Absolutely. Here, let me put your collar on...", shopIntro.bind(pet, "4"));
		}

		if (modif == "4") {
			//addSprite("assets/img/effect/gooGoatPose.png");
			append("You slip the collar over her neck and latch it tight.\n\nShe strikes a little pose. \"Do I look cute?\"");
			addChoice("Ultra cute. Now... where should we test the other thing~?", shopIntro.bind(pet, "5"));
		}

		if (modif == "5") {
			append(pet.name+" drops to her knees and stuffs the dildo in her mouth, slobbering thoughtfully over the bulbous pink head. \"Hrrrmmmm...\" she says past a mouthful of plastic cock. \"Mmmmmmmmmmmmmmmmmmmrrhhhhhhhhhmmmmm.........\"\n\nYou tap your foot.\n\n\"Mkay,\" she says, popping the cock from her mouth and flopping onto her back. She nuzzles the drippy tip up between her fat asscheeks, warming herself up, testing the waters. Finally she comes to a firm verdict: \"My butt.\"");
			addChoice("Really~? You wanna get assfucked already?", shopIntro.bind(pet, "6"));
		}

		if (modif == "6") {
			append("\"I trust you,\" she says, narrowing her eyes. \"You gotta wait til I'm ready, of course...\"");
			addChoice("Gotcha.", shopIntro.bind(pet, "7"));
		}

		if (modif == "7") {
			append("She gulps, her cock throbbing violently at the mere sight of the shiny, saliva-soaked toy.\n\n\"Okay yep I'm ready. Please fuck me.\"");
			addChoice("Fuck her.", shopIntro.bind(pet, "8"));
		}

		if (modif == "8") {
			addMovie("goatShop", 12);
			resizeMovie("goatShop", 500);
			moveMovie("goatShop", 275, 75);
			append("She takes it like a champ.\n\n\"Nnnf... you call this an <!i>assfuck?<!i>\"");
			addChoice("Harder.", shopIntro.bind(pet, "harder"));
			addChoice("Softer.", shopIntro.bind(pet, "softer"));
		}

		if (modif == "harder") {
			addMovie("goatShop", 24);
			resizeMovie("goatShop", 500);
			moveMovie("goatShop", 275, 75);
			append("She starts squeaking with each thrust, leaking oil and pre\nall over herself, her little goocunt twitching hard.\n\n\"Hrrrn... fff... okay... okay, I'm done!\"");
			addChoice("Pull out.", shopIntro.bind(pet, "9"));
		}

		if (modif == "softer") {
			addMovie("goatShop", 6);
			resizeMovie("goatShop", 500);
			moveMovie("goatShop", 275, 75);
			append("You slow it down, not rising to her taunt. You <!i>do<!i> call this an\nassfuck. What does she know about assfuckery anyway?\n\nYou drag the toy in and out with slow, deep pushes, occasionally\ntwisting it around to make her squeak. By the end\nshe's coated in her own oils and pre, blushing hard, totally\nunable to fit even one last buttful.\n\nShe taps your wrist, panting. \"Okay! Okay!\"");
			addChoice("Pull out.", shopIntro.bind(pet, "9"));
		}

		if (modif == "9") {
			append("You cuddle with her, slipping a couple fingers up her gaped ass, testing how deep you really fucked her. Her buttmeat lies to you; it's so gooey and flexible that it's pretty much already back the way it was, <!i>churrrrp<!i>ing closed on your fingers even as you wiggle them hard inside her.\n\n\"Thank you,\" she pants, \"But let's head back...\"\n\n"+pet.name+" has to lean on you the whole way.");
			addChoice("Good girl.", drawHome);
		}

	}

	public static function petPet(pet:Pet):Void {
		clear();

		var config30:ButtonConfig = {enabled: pet.stats[STAT_TRUST] >= 30, toolTip: "Requires: "+pet.stats[STAT_TRUST]+"/30 Trust\nAffected by: Sensitivity, Charisma"};

		addChoice("Head.", petPart.bind(pet, "head"));
		addChoice("Belly.", petPart.bind(pet, "belly"));
		addChoice("Butt.", petPart.bind(pet, "butt"), requireStat(pet, STAT_TRUST, 10));
		addChoice("Nuts.", petPart.bind(pet, "nuts"), requireStat(pet, STAT_TRUST, 20));
		addChoice("Maw.", petPart.bind(pet, "maw"), requireStat(pet, STAT_TRUST, 25));
		addChoice("Cock.", petPart.bind(pet, "cock"), config30);
		addChoice("Cunt.", petPart.bind(pet, "cunt"), config30);
		addChoice("Back.", drawHome);

		if (pet.stats[STAT_STAMINA] < 20) {
			clear();
			drawHome();
			append("\n\n"+pet.name+" is too tired for more pets. Come back in a bit!");
		}
	}

	public static function petPart(pet:Pet, part:String):Void {
		clear();

		var highSenHighChar:Bool = pet.stats[STAT_SENSITIVITY] >= 0 && pet.stats[STAT_CHARISMA] >= 0;
		var lowSenHighChar:Bool = pet.stats[STAT_SENSITIVITY] <= 0 && pet.stats[STAT_CHARISMA] >= 0;
		var lowSenLowChar:Bool = pet.stats[STAT_SENSITIVITY] <= 0 && pet.stats[STAT_CHARISMA] <= 0;
		var highSenLowChar:Bool = pet.stats[STAT_SENSITIVITY] >= 0 && pet.stats[STAT_CHARISMA] <= 0;

		//Part checkers		
		if (part == "head") {
			append(pickOne([
					"You lavish her scalp with a couple good pets, mussing her gooey hair. She purrs thanks.",
					"You take some time out of your busy schedule to sit on a rock, nestle "+pet.name+" between your knees, and play with her hair.",
					"With both hands you give her such a fierce head-petting that her gooskull deforms a bit. She drools, loving it.",
					"\"Gimmie a braid,\" she says. You try your best, but her locks are so squishy and amorphous that they just unravel in seconds.",
					"You square up behind her and run some pets hand-over-hand toward your chest, each starting at her forehead and stretching her dreamy expression upward."
			]));
			gainStat(pet, STAT_TRUST, 1);
		}

		if (part == "belly") {
			gainStat(pet, STAT_STAMINA, -20);
			append(pickOne([
					pet.name+" stretches out on the grass for you, lifting her arms high.\n\n\"Go on,\" she says, wiggling her hips and doing a little belly-dance. You run your hands down her chest, over her stomach's slight bulge. She keeps wiggling, doing half the petting for you.",
					pet.name+" doesn't really feel like it right now. Still, albeit while complaining, she exposes her belly for you and lets you pet it while she does something else.",
					"You sneak up on her and tickle her belly.\n\n\"AH~! Heheh~ Quit— Stop that—\" she squirms, scrabbling at your hands. That stops pretty quick once you shift from tickles to slow, massaging pets.\n\nShe still breathes quick, but now instead of scrabbling her hands are guiding yours, lower, lower...",
					"You do a cute drum beat on her belly, jiggling it like jello. She's actually got great acoustics.",
					"Just as you start contemplating a belly-petting sesh you hear \""+data.gooGoatPlayerTitle+"!\" from somewhere out of sight. You turn a corner to find "+pet.name+" spread-eagle on the grass, holding her belly with both hands.\n\nShe smirks. \"My stomach hurts... can you pet it better?\"\n\nYou kneel between her legs, her soft little nuts brushing up against you, and lean forward to give her the petting of a lifetime. By the end of it she's panting and drooling, her gut-goo positively stormy with all the excitement. \"Feels much better now,\" she says."
			]));
			gainStat(pet, STAT_TRUST, 1);
			gainStat(pet, STAT_SENSITIVITY, -1);
		}

		if (part == "butt") {
			gainStat(pet, STAT_STAMINA, -20);
			append(pickOne([
					pet.name+" bends over and spreads her butt for you, revealing a dark-blue goopucker. \"Right on the hole, ple-e-ase...\" she says, a nervous bleat slipping into that last word.\n\nYou drag a couple fingers up down her crack, pushing her inner cheeks aside so you can grind three fingers in rough circles around her puffy ring. A fingertip accidentally slips inside, making her squeak and twitch her hole.",
					"You slap your palms down onto both her buttcheeks by surprise— she squeaks— and promptly start rubbing them in clockwise and counter-clockwise circles, watching her gooey crease peel open and jiggle shut with each movement of your hands.",
					"You casually grope "+pet.name+"'s little ass, squeeze it, yank her cheeks open to get a look at her slightly-open hole. \n\n\"You call this petting?\" she grumbles. She grabs your wrists and drags your hands lower, down to her thighs. \"Start here,\" she says, \"and work your way up <!i>slowly<!i>, with <!i>love<!i>. That's how you're sposed to pet.\"\n\nYou follow instructions and massage her upper thighs, thumbs squishing up below her cheeks. Once she gives the cue you move back up with renewed sensuality, not squeezing nor yanking but truly petting her now, your fingers slipping lightly over the curves of her ass.",
					"You pet her butt gently and lovingly for a bit, then switch styles and start playing them like bongo drums. Her protests sound especially funny when her voice keeps getting caught up in squeaks every time you bring your palms down."
			]));
			gainStat(pet, STAT_TRUST, 1);
			gainStat(pet, STAT_SENSITIVITY, 2);
		}

		if (part == "nuts") {
			gainStat(pet, STAT_STAMINA, -20);
			append(pickOne([
					"She scoots back, thighs closed tight around her junk at first. \"Just don't squeeze em or anything...\" she warns, then parts her thighs, little sack bouncing free.\n\nYou drag two fingers slowly up between her nuts, then wrap the rest around, not quite squeezing but certainly giving them a firm all-around pet.",
					"She refuses to let you pet her nuts unless she's the one in control. As it turns out this means you're holding your palm open while she squats above it and drags her nuts over it. \"Okay... y-yeah, this feels alright... you can use your fingers if you want...\"\n\nImmediately you wiggle them, tickling her nuts. She never forgives you for that.",
					"You hold her close to you and reach around behind to grope her balls, your wrist slipping down between her warm cheeks. \"Mmmf,\" she moans into your chest, spreading her legs a little wider.",
					pet.name+" spreads her legs happily for you, jiggling her nuts enticingly with a finger. \"Come get em.\"\n\nYou wonder what a two-hand petjob would be like on such a tiny sack, so you try it. Pretty crowded, it turns out. Eventually you flatten your palms on either side and roll her nuts around back and forth, quick enough to get her goo all melty with the friction but gentle enough to keep from hurting her.\n\nShe purrs hard. \"God, that's some creative petting...\"\n\nYou thank her modestly.",
					"You lavish her nuts with some heavy petting. Her sack is really warm and squishy and easy to stretch around~"
			]));
			gainStat(pet, STAT_TRUST, 2);
		}

		if (part == "maw") {
			gainStat(pet, STAT_STAMINA, -20);
			append(pickOne([
					"You slip your fingers over her cheeks and pop them firm between her lips. She purrs, sucking a little, tongue wiggling between them...",
					"Petting her maw turns out to be more like fingerfucking it. You take her by the back of her head and pump three digits right down to the back of her throat, wiggling them hard while she gags, her whole body shivering in your arms.",
					"She nuzzles her snout into your palm for a bit. Then her tongue slips out, lapping at the bridges between your fingers...",
					pet.name+" blinks, a little surprised that your hand is wrapped around her face. She gets used to it pretty quick. Her maw opens, steam and saliva pouring out over your fingers, and one by one she starts taking them in and sucking them...",
					"Before you can even start 'petting' her maw she dives forward and takes four past her squishy lips, deepthroating them."
			]));

			if (data.hasCunt == true && hasPetItem("Dildo") == false) addChoice("Hidden scene. (Requires Dildo)", petPart.bind(pet, "maw2"), {enabled: false});

			if (data.hasCock || data.hasBoth || hasPetItem("Dildo")) {
				var cock = "your cock.";
				if (data.hasCunt) cock = "that shiny pink dildo of yours~";
				append("\n\n\"I was wondering,\" she says, muffled... and her eyes flick down to "+cock);
				addChoice("Did I whet your appetite~?", petPart.bind(pet, "maw2"));
			}
			gainStat(pet, STAT_TRUST, 2);
		}

		if (part == "maw2") {
			var cock = "between your thighs, slobbering all over your nuts while your shaft throbs hard, squished up against her cheek";
			if (data.hasCunt) cock = "with the toy, just, y'know, testing how it tastes... then she grabs your hand and wraps it around the base of the dildo";
			append("Even that morsel of teasing is too much. She pulls away from your petting and stuffs her maw "+cock+". All she can muster now is \"Pleath.\"");
			addChoice("Fuck her mouth.", petPart.bind(pet, "maw3"));
		}

		if (part == "maw3") {
			addMovie("goatOral", 27);
			if (data.hasCunt) movieToFrame("goatOral", "dick_mc", 2);
			resizeMovie("goatOral", 300);
			moveMovie("goatOral", 60, 0);

			append("You barely have to thrust. She does all the work for you.\n\nJeez, she's really goin at it...");

			addChoice("Harder.", petPart.bind(pet, "mawharder"));
			addChoice("Softer.", petPart.bind(pet, "mawsofter"));
		}

		if (part == "mawharder") {
			addMovie("goatOral", 35);
			resizeMovie("goatOral", 300);
			moveMovie("goatOral", 60, 0);
			if (data.hasCunt) movieToFrame("goatOral", "dick_mc", 2);

			append("You speed things up. She starts making really cute little\ngaggy squeaks every time you hit the back of her throat.");
			addChoice("Throatfuck.", petPart.bind(pet, "maw4"));
		}

		if (part == "mawsofter") {
			var cock = "your head";

			addMovie("goatOral", 20);
			resizeMovie("goatOral", 300);
			moveMovie("goatOral", 60, 0);
			if (data.hasCunt) {
				cock = "the toy";
				movieToFrame("goatOral", "dick_mc", 2);
			}

			append("She purrs deep and rumbly while you nuzzle\n"+cock+" against the her throat's entrance.");
			addChoice("Throatfuck.", petPart.bind(pet, "maw4"));
		}

		if (part == "maw4") {
			var cock = "cock";

			addMovie("goatOralDeep", 27);
			if (data.hasCunt) {
				cock = "wet plastic";
				movieToFrame("goatOralDeep", "dick_mc", 2);
			}
			resizeMovie("goatOralDeep", 300);
			moveMovie("goatOralDeep", 60, 0);

			append("You place a hand on the back of her head and push her little\nthroat packed with "+cock+".\n\nShe <!i>glrrrkkks<!i> hard on it. <3");
			addChoice("Harder.", petPart.bind(pet, "mawharder2"));
			addChoice("Softer.", petPart.bind(pet, "mawsofter2"));
		}

		if (part == "mawharder2") {
			addMovie("goatOralDeep", 35);
			if (data.hasCunt) movieToFrame("goatOralDeep", "dick_mc", 2);
			resizeMovie("goatOralDeep", 300);
			moveMovie("goatOralDeep", 60, 0);

			append("Her paw leaps up to clutch at your thigh. Her ass quivers.\n\nBut she takes it.");
			addChoice("Even harder!!!", petPart.bind(pet, "mawharder3"));
		}

		if (part == "mawharder3") {
			addMovie("goatOralDeep", 60);
			if (data.hasCunt) movieToFrame("goatOralDeep", "dick_mc", 2);
			resizeMovie("goatOralDeep", 300);
			moveMovie("goatOralDeep", 60, 0);
			append("RRRRRRRRRRRRRRRRRRRRRRAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAARRRRRGGGGGHHH!!!");
			addChoice("Wind down.", petPart.bind(pet, "mawwinddown"));
		}

		if (part == "mawsofter2") {
			var cock = "your dick";

			addMovie("goatOralDeep", 20);
			if (data.hasCunt) {
				cock = "the toy";
				movieToFrame("goatOralDeep", "dick_mc", 2);
			}
			resizeMovie("goatOralDeep", 300);
			moveMovie("goatOralDeep", 60, 0);

			append("You make love to her throat, milking every moment she spends choking on "+cock+"~");
			addChoice("Wind down.", petPart.bind(pet, "mawwinddown"));
		}

		if (part == "mawwinddown") {
			var cock = "your dick";
			if (data.hasCunt) cock = "the dildo";
			append("You pop "+cock+" from her maw, drippy with saliva stains.\n\n\"Hahhhhh... hahhh...\"");
		}

		if (part == "cock") {
			gainStat(pet, STAT_STAMINA, -20);
			if (highSenHighChar) {
				append("\"You want to <!i>pet<!i> my cock?\" She raises an eyebrow. \"Well, alright, but you better pet hard...\"\n\nShe twiddles it back and forth til it starts to chub up. Before you can even ask she spreads her legs and leans back against the wall for you, letting her cock throb lazily over the side of her thigh. You start with a few fingers at her base and let them wander up her shaft's underside til you're stroking just underneath the lip of her head. "+pet.name+" bleats and shivers already, cock twitching up to full mast beneath your fingers just from those few gentle strokes. \n\n\"Jeez,\" she says, breathlessly. \"That's... not even hard at all...\"");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_CHARISMA, -1);
			} else if (lowSenHighChar) {
				append("\"Look,\" she says, wrapping your fingers around her half-hard shaft. \"Forget the petting stuff. Just jack me off.\"\n\nThrough pursed lips she drools a shiny glob of goo saliva onto the tip of her cock, lubing up your first few strokes. Soon she's bucking into your grip, pretty much doing the jacking for you. \"C'mon,\" she says huskily. \"Harder.\"\n\nYou double-down and really start yanking fast on her little cocklet, knocking her nuts against the bottom of your palm, throwing in a fierce twist now and then to make her groan.\n\nAfter a long while she finally tenses up and cums "+(isActive("Mood Ring")?getMood("Bleat")+"goo":"")+"all over your fingers, her goocock throbbing warm and melty. Without hesitation she grabs your wrist and sucks your fingers clean. She bleats muffledly at her own flavor, little tongue vibrating against your skin.");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_CHARISMA, 1);
				gainStat(pet, STAT_SENSITIVITY, -1);
			} else if (lowSenLowChar) {
				append("You grab "+pet.name+" around the hips and pull her forward, palming her cock rough with your free hand. \"Thank you!\" she says meekly, before the bleating takes over and everything else she tries to say comes out unintelligible, her nuts twitching up into a tight little pouch. You hold the bottom of her shaft with one hand and grind your fingers in quick circles over her sensitive, throbbing head with the other while she wraps her arms around you and bucks helplessly into your hand. For all the showy squealing she does, it takes her forever to cum...");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_SENSITIVITY, -2);
			} else if (highSenLowChar) {
				append("You pull her over by her little goat-tail and tell her to sit down and open her legs. With a shivery whimper she obeys.\n\n\"What are you— a-aaammph~!\" You cut her moaning off with a kiss and start furiously tugging at her cock simultaneously. "+pet.name+"'s little hips jerk and squirm as you ignore her faux-pleas for mercy, working your thumb over her sensitive head, not stopping even when her "+(isActive("Mood Ring")?getMood("Bleat"):"")+"cum splurts out beneath it.");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_CHARISMA, -1);
				gainStat(pet, STAT_SENSITIVITY, -1);
			}
		}

		if (part == "cunt") {
			gainStat(pet, STAT_STAMINA, -20);
			if (highSenHighChar) {
				append("Out of nowhere "+pet.name+" demands you pet her cunt. She guides your hand down over the slight bump of her lower stomach, beside her cock and nuts, her grip trembling on your wrist, and despite hardly being able to handle the tingliness she tucks every finger save your thumb tight around her vulva's bulge. You hold her close and press her blushing face to your chest, doing your best to avoid grinding too hard on her clit or slipping a finger inside, as much as you'd like to. Instead you give her just as much as she can handle, working your fingers over and slightly between her lips with easy motions.");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_CHARISMA, -1);
			} else if (lowSenHighChar) {
				append("\"I'm boooored,\" "+pet.name+" complains, grinding her dripping puss over your palm, leaving a little streak of blue oils. Just to get her off your back you cram two fingers as you deep as you can up her little flower— and without a hint of surprise, almost as if expecting this, she falls right into rhythm and starts riding your fingerfuck, throwing her hips back and forth hard.\n\nYou hold your free hand out to help her balance if she needs it. but she snubs you, choosing instead to keep her balance by grabbing your wrist and pumping your fingers in and out at the pace <!i>she<!i> wants, which happens to be about two times faster~");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_SENSITIVITY, -1);
			} else if (pet.stats[STAT_SENSITIVITY] <= 0 && pet.stats[STAT_CHARISMA] <= 0) {
				append("When you offer to pet her pussy she just says \"Weird phrasing,\" and throws her legs open wide. She even lifts her nuts for you, smiling politely.\n\nStill, the moment your fingertips touch the smooth stretch of skin just beside her labia, she recoils. \"I'm okay, I'm okay,\" she says. \"Just ticklish there...\"\n\nYou start over and avoid that spot, sliding two fingers between her lips with enough pressure to push them apart a little. You trap her clit at their bridge and scissor them open and closed with each stroke. Each time you stretch her flexible goopuss a little wider, a little harder— and by the end of it you can peek pretty much right into her deepest, slipperiest folds no problem.\n\nYou look up for the first time in a while. She's drooling and blank-eyed, staring at the ceiling, a few fingers crammed in her mouth and a few more working furiously at her left nipple.\n\nJeez.");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_SENSITIVITY, 2);
			} else if (highSenLowChar) {
				//Underwear logic
				if (hasPetItem("Paw Panties")) {
					temp.a = "a cuntbulge, hugged tight by sopping paw-print panties";
					temp.b = "yank them down to her ankles";
				} else if (hasPetItem("Watermelon Panties")) {
					temp.a = "a cuntbulge hugged tight by sopping watermelon-print panties";
					temp.b = "yank them down to her ankles";
				} else if (hasPetItem("Dirty Panties")) {
					temp.a = "a cuntbulge, hugged tight by sopping, filthy panties";
					temp.b = "yank them down to her ankles";
				} else if (hasPetItem("Thong")) {
					temp.a = "her sopping cunt, thong-string flossing between the lips";
					temp.b = "yank it out and to the side";
				} else {
					temp.a = "her sopping goocunt";
					temp.b = "give it a hearty slap for starters";
				}

				append("She bends over to peer at something in the grass, flashing you with "+temp.a+". You sneak up behind her... then "+temp.b+", making her squeak. You hug her close while she purrs and mumbles subby nothings, grinding your crotch against her plush cheeks and your fingers over her now-exposed pussylips. You take turns paying special attention to each one, tugging her open from the left and right, thumbing her clit furiously hard while she spasms and nearly shrieks with pleasure in your arms.");
				gainStat(pet, STAT_TRUST, 1);
				gainStat(pet, STAT_CHARISMA, 1);
				gainStat(pet, STAT_SENSITIVITY, -1);
			}
		}

		addChoice("Back.", petPet.bind(pet));
	}

	public static function walkPet(pet:Pet):Void {
		clear();

		//Default snippets for when you're about to walk
		var aboutToWalk = [
			"\"Sure, I'm down for a walk!\"",
			"You ask if she wants to head out and explore a little.\n\n\"Sure, where?\"",
			"\"Sounds good!\" she says, limbering up. Her goobody is so flexible... she grabs her foot and pulls it all the way up above her head, stretching her leg out and flashing you with all her bits.",
		];

		//If you have a leash and a collar, add some extra lines to the snippet pool and a var for travel sequences
		if (hasPetItem("Collar")) {
			aboutToWalk.push("You get the leash out. Like a puppy she gets excited just from that.");
			aboutToWalk.push("You get her to stand still for a sec so you can click the leash to her collar.");
			aboutToWalk.push("She's already got her leash on, even before you suggested a walk. Wavelength.");

			temp.leash = "by her leash";		
		} else {
			temp.leash = "by her hand";
		}

		//Execute intro snippet
		append(pickOne(aboutToWalk));

		addChoice("Pick a destination.", depart.bind(pet, 0));
		if (hasPetItem("Pink Collar")) addChoice("Equip Pink Collar first.", depart.bind(pet, 1));
		if (hasPetItem("Glow Collar")) addChoice("Equip Glow Collar first.", depart.bind(pet, 2));

		addChoice("Back.", drawHome);
	}

	public static function depart(pet:Pet, collerNum:Int):Void {
		clear();

		append(pickOne([
				"You slip the collar around her neck. She purrs a little.",
				"You put the collar on."]));
		setFlag("Collar", collerNum);
		//Choice of destination
		if (getPlace("The Floatillery") != null) {
			addChoice("Walk to the Floatillery.", walkDestination.bind(pet, "floatillery"));
		} else {
			addChoice("Walk to the Floatillery.", walkDestination.bind(pet, "floatillery"), {enabled: false});
		}

		addChoice("Back.", drawHome);
	}

	public static function walkDestination(pet:Pet, destination:String):Void {
		clear();
		gainStat(pet, STAT_STAMINA, -25);

		if (destination == "floatillery") {

			//Set default snippets upon arrival and check if you get extra ones
			var arrivalSnippets = [
				"You walk back to the Floatillery.",
				pet.name+" runs out onto the moonlit sand, wiggling her toes in it.",
				"Just before you get onto the sand "+pet.name+" trips on a root and skins half her knee off on a rock, smearing it with goo. She gets right back up, painless, only a little annoyed that now she has to wait five seconds for it to regenerate before she can get on the beach."
			];
			if (!data.neroDone && data.neroRejected) arrivalSnippets.push("As you arrive with "+pet.name+" Nero the rottweiler shoots you a jealous glance.");
			if (data.neroDone) arrivalSnippets.push("Nero waves like crazy to you and "+pet.name+" when you arrive at the Floatillery, sitting on the swinging chair with River and their baby.");
			if (getFlag("swimCounter") >= 1) arrivalSnippets.push("The otter moonbathers sit up and say \"Heyyy "+data.playerName+" and "+pet.name+"!!!\" in perfect sync.");
			if (data.roxVisits == 2) arrivalSnippets.push("\"Who's that nerd lamb waving at us?\" "+pet.name+" asks innocently, pointing to Som. He's got one arm waving to you and the other hauling a cardboard box of tech junk.");

			//Set choices
			function floatilleryChoices():Void {

				//Learn to swim
				//If it's her first time change choice label
				//if (getFlag("swimCounter") == 0) temp.swimchoice = " learn how to" else temp.swimchoice = "";
				//addChoice("Hey "+pet.name+", wanna"+temp.swimchoice+" swim?", floatillerySwim.bind(pet, getFlag("swimCounter")));

				//Moonbathe
				//If it's her first time change choice label
				if (getFlag("moonBathed") == 0) temp.moonchoice = "We should try moonbathing." else temp.moonchoice = "Wanna moonbathe with me again~?";
				if (data.hasCunt) {
					addChoice(temp.moonchoice+" (Dildo x1)", floatilleryMoonbathe.bind(pet), {enabled: pet.stats[STAT_TRUST] >= 30 && hasPetItem("Dildo"), toolTip: "Requires: "+pet.stats[STAT_TRUST]+"/30 Trust\nAffected by: Charisma"});
				} else {
					addChoice(temp.moonchoice, floatilleryMoonbathe.bind(pet), {enabled: pet.stats[STAT_TRUST] >= 30, toolTip: "Requires: "+pet.stats[STAT_TRUST]+"/30 Trust\nAffected by: Charisma"});
				}
				addChoice("Head back.", drawHome);

			}

			//Arrival, check if been here before, if not do intro scene
			if (getFlag("floatilleryVisited") == 0) {
				setFlag("floatilleryVisited", 1);

				//Set first-time arrival text based on charisma
				if (pet.stats[STAT_CHARISMA] > 0) {
					temp.char = ", though once she hears the waves she gets way excited and starts leading <!i>you<!i> by the hand, her little ass bobbing just in front of you";
					temp.char2 = pet.name+" sprints laughing onto the sand, unaware that the loose sand bogs down goofeet and makes her goose-step cutely";
				} else {
					temp.char = ". She's constantly slowing down to inspect a snail or a rock or something, and when she does walk forward with you she keeps her pace slow and methodic, in sync with the distant waves";
					temp.char2 = pet.name+" toes the sand for starters, dismayed when it soaks into her goo. Nevertheless she does her best to walk out onto it with you, though her feet do get a little heavier";
				}

				//First-time arrival scene
				append("You lead "+pet.name+" through the forest "+temp.leash+temp.char+".\n\nYou push out past treeline onto the white sands. "+temp.char2+". She stares with amazement at the Floatillery itself, at the dozens of bridges swaying hypnotic with constant foot traffic.");

				//It's not your first time walking here, pull a snippet from arrival pool
			} else {
				append(pickOne(arrivalSnippets));
			}

			//No matter what, show the choices
			floatilleryChoices();

		}

	}


	//FLOATILLERY SCENES
	public static function floatillerySwim(pet:Pet, swimCounter:Int):Void {
		clear();
		if (swimCounter == 0) {
			append("The two "+(isActive("Pastel Ring")?"seven":"ten")+"-year-old otter boys drop their moonbathing session, rushing up to you and "+pet.name+" the moment they hear the word 'swim.'\n\n\"Hey, haven't seen you before!");
		}
	}

	public static function floatilleryMoonbathe(pet:Pet, modif:String="start"):Void {
		clear();

		if (modif == "start") {
			//Intro

			if (getFlag("moonBathed") == 0) {
				append(pet.name+" peers over at the two "+(isActive("Pastel Ring")?"seven":"ten")+"-year-old otter moonbathers. \"How does it even work? The moon doesn't give off enough light...\"");
				addChoice("I think it's mostly just an excuse to lay around with your friends.", floatilleryMoonbathe.bind(pet, "2"));

				//Already moonbathed once
			} else {
				//Change reaction based on charisma
				if (pet.stats[STAT_CHARISMA] > 0) {
					append("She smirks, hugging you, grinding her crotch against your thigh. \"So you wanna fuck me again, huh~?\"");
					temp.c = "... Yes. Where~?";
				} else {
					append("She sneaks a couple fingers down below her nuts, rubbing slowly and holding tight to your arm. \"Mhm... please...\"");
					temp.c = "Same spot?";
				}
				addChoice(temp.c, floatilleryMoonbathe.bind(pet, "2"));
			}
		}

		//Passage 2
		if (modif == "2") {
			if (getFlag("moonBathed") == 0) {
				append("She guesses so. You search the beach for a good spot and find it in a sandy, secluded little cove far from the torches and the people, a semi-circle of rock worn smooth by the sea. It'd almost be a cave, if it weren't for the jagged slice of moon and sky poking through the top.\n\nYou lay down and pat the sand next to you. She follows.");
				addChoice("Moonbathe.", floatilleryMoonbathe.bind(pet, "private"));

				//Already moonbathed before
			} else {

				append("\"What do you think~?\"");
				addChoice("That last spot was nice...", floatilleryMoonbathe.bind(pet, "private"));
				addChoice(
					"... Let's stay here this time. In front of everybody.",
					floatilleryMoonbathe.bind(pet, "public"),
					{enabled: pet.stats[STAT_CHARISMA] >= 30, toolTip: "Requires: "+pet.stats[STAT_CHARISMA]+"/30 Charisma"}
				);
			}
		}

		if (modif == "public") {
			setFlag("moonbathePrivate", 0);

			append(pet.name+" grins. \"Mmmf... I was sorta hoping you'd say that...\"\n\nHer eyes rove over the bobbing crowds, the otters, the light beach traffic. She claps both hands to her mouth and shouts: \"HEYYYyy! EVERYBODY! COME WATCH ME GET BUTTFUCKED~!\"\n\nYou guess this isn't so far out of the ordinary, so only a few people turn their heads, but those who do are immediately interested. It's not every day one sees a cub goo goat getting fucked in public.");
			addChoice("Mhm?", floatilleryMoonbathe.bind(pet, "fuck"));
		}

		if (modif == "private") {
			setFlag("moonbathePrivate", 1);

			if (getFlag("moonBathed") == 0) temp.a = "" else temp.a = "You head back to your little cove and stretch out with "+pet.name+".\n\n";
			append(temp.a+"You just breathe for a while. Your lungs expand as the waves roll in and empty as they leave. The moonrays beat down.\n\n"+pet.name+" sneaks a hand up over your stomach, your chest, turning on her side to face you. \"Hey,\" she says. \""+data.gooGoatPlayerTitle+"\".");
			addChoice("Mhm?", floatilleryMoonbathe.bind(pet, "private2"));
		}

		if (modif == "private2") {
			if (getFlag("moonBathed") == 0) {
				append("\"I'm ready.\"\n\nShe's fidgeting a little, deciding whether or not to say something.\n\nThen she says it: \"... up my butt, please...\"");
			} else {
				append("\"Let's skip this part...~\"");
			}
			addChoice("Mmm, gotcha...", floatilleryMoonbathe.bind(pet, "fuck"));
		}

		if (modif == "fuck") {
			if (data.hasCock || data.hasBoth) {
				temp.genit = "your big cock over her smaller one, painting a shiny trail of pre down her shaft, her nuts...";

				//Give the option to use dildo
				addChoice("Use a toy instead. (Dildo x1)", function(){
					setFlag("moonbatheDildo", 1);
					floatilleryMoonbathe(pet, "fuck2");
				}, {enabled: hasPetItem("Dildo")});

				//Basic Next
				addChoice("Warm her up.", function(){
					setFlag("moonbatheDildo", 0);
					floatilleryMoonbathe(pet, "fuck2");
				});

			} else if (data.hasCunt) {
				temp.genit = "your cunt over her little cock, dragging the dildo's head down over her nuts...";
				addChoice("Warm her up.", function(){
					setFlag("moonbatheDildo", 1);
					floatilleryMoonbathe(pet, "fuck2");
				});
			}

			append(pet.name+" lays back and exhales, making half a sand-angel as she spreads her legs. You lower your hips onto hers, grinding "+temp.genit);
			if (getFlag("moonbathePrivate") == 0) append("\n\nA few onlookers come closer, getting a good look at her cute little package now that it's spread open for all to see...");
		}

		if (modif == "fuck2") {
			//Dildo logic
			if (getFlag("moonbatheDildo") == 1) {
				temp.dildo = "the toy";
				temp.dildo2 = "the";
			} else {
				temp.dildo = "your head";
				temp.dildo2 = "your";
			}

			append("You work "+temp.dildo+" in little circles around "+pet.name+"'s sticky pucker, pulling her ring open a little more with each gyration. The first gentle pushes make it reflexively twitch closed, but a hand on her lower belly and a few soft words help her relax, and soon enough she's open wide for you. It hardly took two minutes. She really is remarkably stretchy!\n\nWithout further ado you slip half "+temp.dildo2+" head inside, quelling her sharp squeak with a kiss.");
			if (getFlag("moonbathePrivate") == 0) append("\n\n"+pet.name+" grabs the back of your head and moans into the kiss while passerby whistle and stare, a couple even shouting \"Ram it in~!\"");
			addChoice("Ram it in.", floatilleryMoonbathe.bind(pet, "fuck3"));
		}

		if (modif == "fuck3") {
			append("Half "+temp.dildo2+" shaft pops past her ring in one gentle push. "+pet.name+" groans and flexes her buttmuscles, sucking another inch inside with a noisy, wet little <!i>chuurrp<!i>. She wraps her arms around your upper back, her mewls deafening even as your mouth muffles them. As you start cranking through the first few thrusts, "+temp.dildo+" coming out soaked with her inner goojuices, "+pet.name+" breaks from the kiss entirely to throw her head back and release a high-pitched bleat so loud it jiggles the slight bumps of her immature gooboobs.");
			if (getFlag("moonbathePrivate") == 0) append("\n\nWith that whorish siren the few Floatillery regulars who weren't already staring and drooling at her public buttfucking turn to watch now, and the ones that were scoot closer, jacking or rubbing themselves furiously, some muttering \"Little slut...\" and worse under their breath...\n\nShe's loving all the attention. \"I hope... I look cute... everybody~!\" "+pet.name+" squeaks between thrusts, flashing a classic double peace sign. They assure her that she looks extremely fucking cute.");
			addChoice("Hold her down by her maw and go to town.", floatilleryMoonbathe.bind(pet, "fuck4"));
		}

		if (modif == "fuck4") {
			addMovie("gooGoatButtFuck", 23);
			if (getFlag("moonbatheDildo") == 1) movieToFrame("gooGoatButtFuck", "dick_mc", 2);
			if (getFlag("Collar") == 1) movieToFrame("gooGoatButtFuck", "collar", 2);
			if (getFlag("Collar") == 2) movieToFrame("gooGoatButtFuck", "collar", 3);
			resizeMovie("gooGoatButtFuck", 500);
			moveMovie("gooGoatButtFuck", 350, 50);

			append("You cram your thumb past her lips and hold her skull to the sand,\nassfucking her as hard as you can. She makes the most adorable\nlittle whines you've ever heard, squirmy spasms running\nthrough her body every time you pound against\nher little prostate.");
			if (getFlag("moonbathePrivate") == 0) append("\n\nThe crowd cheers, those with cocks stepping forward\nand cumming in her mouth while you have it so\nhandily held-open for them. "+pet.name+" coughs\nand gags on the "+(isActive("Mood Ring")?"rainbow ":"")+"cum cocktail of all these\nstrangers, little tummy heaving, but her peace\nsigns never drop~");
			addChoice("Harder.", floatilleryMoonbathe.bind(pet, "fuck5Harder"));
			addChoice("Softer.", floatilleryMoonbathe.bind(pet, "fuck5Softer"), {toolTip: "Affected by: Sensitivity"});
		}

		if (modif == "fuck5Harder") {
			gainStat(pet, STAT_SENSITIVITY, -5);

			//Anim
			addMovie("gooGoatButtFuck", 23*2);
			if (getFlag("Collar") == 1) movieToFrame("gooGoatButtFuck", "collar", 2);
			if (getFlag("Collar") == 2) movieToFrame("gooGoatButtFuck", "collar", 3);

			if (getFlag("moonbatheDildo") == 1) {
				temp.c = "Press the Cum button.";
				movieToFrame("gooGoatButtFuck", "dick_mc", 2);
			} else {
				temp.c = "Cum.";
			}

			resizeMovie("gooGoatButtFuck", 500);
			moveMovie("gooGoatButtFuck", 350, 50);

			append("There is no other possible way to describe what you're\ndoing to "+pet.name+" besides this:\n\nASS-BLAST OVERDRIVE!!!");
			addChoice("EVEN HARDER!!!", floatilleryMoonbathe.bind(pet, "fuck6EvenHarder"));
			addChoice(temp.c, floatilleryMoonbathe.bind(pet, "fuck6Cum"));
		}

		if (modif == "fuck5Softer") {
			if (pet.stats[STAT_SENSITIVITY] >= 0) temp.sens = "shivers with\nrelief, her sigh washing warm over your hand" else temp.sens = "whines a little,\npulling your hand deeper into her maw, clearly\ndisappointed that you eased up";
			//Anim
			addMovie("gooGoatButtFuck", 23*0.7);
			if (getFlag("Collar") == 1) movieToFrame("gooGoatButtFuck", "collar", 2);
			if (getFlag("Collar") == 2) movieToFrame("gooGoatButtFuck", "collar", 3);

			if (getFlag("moonbatheDildo") == 1) {
				temp.c = "Press the Cum button.";
			} else {
				temp.c = "Cum.";
			}

			resizeMovie("gooGoatButtFuck", 500);
			moveMovie("gooGoatButtFuck", 350, 50);

			append("You slow down a little. "+pet.name+" "+temp.sens+".");
			addChoice(temp.c, floatilleryMoonbathe.bind(pet, "fuck6Cum"));
		}

		if (modif == "fuck6EvenHarder") {
			//Anim
			addMovie("gooGoatButtFuck", 23*6);
			if (getFlag("Collar") == 1) movieToFrame("gooGoatButtFuck", "collar", 2);
			if (getFlag("Collar") == 2) movieToFrame("gooGoatButtFuck", "collar", 3);

			if (getFlag("moonbatheDildo") == 1) {
				temp.c = "Press the Cum button.";
				movieToFrame("gooGoatButtFuck", "dick_mc", 2);
			} else {
				temp.c = "Cum.";
			}
			resizeMovie("gooGoatButtFuck", 500);
			moveMovie("gooGoatButtFuck", 350, 50);

			append("RRRRRRRRRRRRRRRRRRRRRRAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\nAAAAAAAAAAAAAAAAAARRRRRGGGGGHHH!!!");
			addChoice(temp.c, floatilleryMoonbathe.bind(pet, "fuck6Cum"));
		}

		if (modif == "fuck6Cum") {
			cumEffect();
			if (getFlag("moonbatheDildo") == 1) {
				temp.dildocustom = "With a mighty ankle-yank you pull her down so hard on the the pink dildo that the whole thing pops inside, grinding viciously against her little pleasure button. At the thought of buttons you reach inside her little ass and jam your thumb down on the CUM button on the toy's base, pumping her full of a pre-warmed name-brand cumcoction";
			} else {
				temp.dildocustom = "You yank her hips up against your own, her fat goobutt rippling with the impact. You aim specifically for the tiny nub of her prostate as it slips over and partially inside your slit, giving it a merciless blast of hot cocknectar";
			}

			append("You bulldoze "+pet.name+"'s now-ruined butthole with "+temp.dildo+", ramming up against her prostate, one hand gripped on "+temp.dildo2+" base while the other slips from her maw and closes around her little ankle. "+temp.dildocustom+".\n\nYou groan at the sight of her translucent stomach blossoming with swirling cum-clouds, filling her so completely that it almost turns her blue stomach "+(isActive("Mood Ring")?data.moodRingColor:"white")+", some even sneaking halfway up her esophagus as she gags and chokes and thanks you over and over.");
			if (getFlag("moonbathePrivate") == 0) append("\n\nEveryone watches her belly swell with hot cum, some dragging their paws over it, massaging it hard enough to make some splurt out around "+temp.dildo+"~");
			addChoice("Wind down.", floatilleryMoonbathe.bind(pet, "fuck7WindDown"));
		}

		if (modif == "fuck7WindDown") {

			if (getFlag("moonbathePrivate") == 0) {
				temp.pub = " in front of everybody.";
			} else {
				temp.pub = ".";
			}

			if (getFlag("moonbatheDildo") == 1) {
				temp.dildocustom = "\"Ah... ah... it's so deep...\"\n\n"+pet.name+" gets shakily to her feet, reaching inside herself to try and get a grip on the toy... in the end, she has no option but to squat and push it out";
			} else {
				temp.dildocustom = "You lay panting on the sand for a while, still inside her, goohole giving an occasional twitch on your softening cock. \"Thank you,\" she pants for the billionth time, slowly pulling off, your length slipping from her butt with a wet <!i>pop<!i>. She hurriedly slips a hand down her crack, trying to keep your "+(isActive("Mood Ring")?getMood("You"):"")+"cum inside her... but in the end she has no option but to let it leak down her inner thighs";
			}

			append(temp.dildocustom+temp.pub);
			if (data.gooGoatCummies) append("\n\n\"... Th... thanks for the cummies, Daddy...\" she adds last-minute, making a sour face.");
			addChoice("Hahhh... time to head back~?", floatilleryMoonbathe.bind(pet, "fuck8"));
		}

		if (modif == "fuck8") {

			append("\"Mmmmmmmmmh...\"\n\nShe slumps into your arms, her legs all wobbly.\n\nYou carry her back home.\n\n<!b>TRUST: +10\nSENSITIVITY: -10\nCHARISMA: +10<!b>");
			gainStat(pet, STAT_TRUST, 10);
			gainStat(pet, STAT_CHARISMA, 10);
			gainStat(pet, STAT_SENSITIVITY, -10);
			setFlag("moonBathed", 1);
			addChoice("Back.", drawHome);
		}
	}
}
