package story;

class StoryUtils
{
	public static var justNudged:Array<MintSprite> = [];
	public static var justWiggled:Bool = false;

	public static function pickByGender(ifMale:String, ifFemale:String, ifNeutral:String):String {
		if (GameData.data.genderMale) return ifMale;
		if (GameData.data.genderFemale) return ifFemale;
		if (GameData.data.genderNeutral) return ifNeutral;
		return "nil <gender>";
	}

	public static function pickByGenitals(ifCock:String, ifCunt:String, ifBoth:String):String {
		if (GameData.data.hasCock) return ifCock;
		if (GameData.data.hasCunt) return ifCunt;
		if (GameData.data.hasBoth) return ifBoth;
		return "nil <genitals>";
	}

	public static function gryphJunk(ifMale:String, ifFemale:String, ifNeutral:String):String {
		if ((MintArrayUtils.contains(data.violetGryphonJunk, "cunt")) && (MintArrayUtils.contains(data.violetGryphonJunk, "cock"))) return ifNeutral;
		if ((MintArrayUtils.contains(data.violetGryphonJunk, "cock"))) return ifMale;
		if ((MintArrayUtils.contains(data.violetGryphonJunk, "cunt"))) return ifFemale;
		return ifMale;
	}

	public static function babyJunk(ifMale:String, ifFemale:String, ifNeutral:String):String {
		if (data.babyMintJunk == "both") return ifNeutral;
		if (data.babyMintJunk == "male") return ifMale;
		if (data.babyMintJunk == "female") return ifFemale;
		return "Baby has no genitals set";
	}

	public static function generateCipher():Void {
		//Create seed
		var seed:Float = 0;
		for (i in 0...data.playerName.length)
			seed += data.playerName.charCodeAt(i);
		msg("Player seed generated: <!b>"+seed+"<!b>");
		while (seed > 1)
			seed = seed*0.1;
		if (seed < 0) seed = 0.1;

		//Scramble
		var abc:String = "abcdefghijklmnopqrstuvwxyz";
		var abcCaps:String = abc.toUpperCase();
		var temp:Array<String> = abc.split("");
		var randomPos:Int = Math.round(abc.length*seed);

		//Cut out splices from that pos to the end of the string and move it to abcShuffled
		var abcShuffled:Array<String> = [];
		abcShuffled = abcShuffled.concat(temp.splice(randomPos, temp.length-randomPos));
		randomPos = Math.round(temp.length*(1-seed));
		abcShuffled = abcShuffled.concat(temp.splice(randomPos, temp.length-randomPos));
		abcShuffled.reverse();
		abcShuffled = abcShuffled.concat(temp);

		//Destine each letter to its scrambled lover
		for (i in 0...abc.length) {
			data.cipherMap.set(abc.charAt(i), abcShuffled[i]);
			data.cipherMap.set(abcCaps.charAt(i), abcShuffled[i].toUpperCase());
		}
	}

	public static function cipherize(str:String):String {
		if (isActive("Privacy Ring")) return str;
		var newChar:String = "";
		var strArray:Array<String> = str.split("");
		var codedString:Array<String> = [];
		var cipherKeys:Array<String> = [];
			for (key in GameData.data.cipherMap.keys())
				cipherKeys.push(key);

		for (char in strArray) {
			if (cipherKeys.contains(char)) {
				newChar = GameData.data.cipherMap.get(char);
				codedString.push(newChar);
			} else {
				codedString.push(char);
			}
		}
		str = codedString.join("");
		return str;
	}

	public static function yesNudge(sprites:Array<MintSprite>):Void {
		for (nudger in sprites) {
			if (justNudged.contains(nudger)) return;
			justNudged.push(nudger);
			var originalY:Float = nudger.y;
			//Make it tween up one pixel, and then remove it from the array of stuff recently nudged
			tween(nudger, {y: nudger.y+1}, 0.05, {onComplete:{
				function() {
					Engine.timer(0.05, function() {
						justNudged.remove(nudger);
						if (nudger != null) {
							nudger.y = originalY;
						}
					});
				}
			}});
		}
	}

	public static function nopeWiggle(sprites:Array<MintSprite>):Void {
		if (justWiggled) return;
		justWiggled = true;
		for (wiggler in sprites) {
			var originalX:Float = wiggler.x;
			//Start a bunch of tweens that jiggle the sprite(s) back and forth!
			//Then on the last one, kill the sprite(s)
			tween(wiggler, {x: wiggler.x-2}, 0.05, {onComplete:
				tween.bind(wiggler, {x: wiggler.x+4}, 0.05, {onComplete:
					tween.bind(wiggler, {x: wiggler.x-2}, 0.05, {onComplete:
						function() { wiggler.x = originalX; justWiggled = false; }
					})
				})
			});
		}
	}

	public static function unlockTopButton(button:MintSprite):Void {
		if (!(button == Main.devButton || button == Main.skinsButton || button == Main.shopButton)) return;

		if (button == Main.shopButton) {
			if (data.foundShop)
				return
			else
				data.foundShop = true;
		}

		if (button == Main.skinsButton) {
			if (data.skinsUnlocked)
				return
			else
				data.skinsUnlocked = true;
		}

		/*if (button == Main.devButton && !Main.debug)
			Main.debug = true;
		else
			return;*/

		var s:MintSprite = addSprite("assets/img/effect/poof");
		s.layer = 80;
		s.looping = false;
		s.animFrameRate = 25;
		s.centerPivot = true;
		playSound("assets/audio/ui/unlockTopButton");
		s.x = button.x-s.width/3;
		s.y = button.y-s.height/2;
		tween(button, {alpha: 1}, 0.1, {onComplete: function() { button.mouseEnabled = true; }});
	}

	public static function badEnd(result:Void->Void, music:String=""):Void {
		if (data.daydream) wakeUp();
		playSound("assets/audio/mynt/shutdown");
		cameraFadeOut(1, 0);
		timer(3, playSound.bind("assets/audio/ui/premature"));
		var s:MintSprite = addSprite("assets/img/effect/endings/premature.png");
			s.x = GAME_WIDTH/2-s.width/2;
			s.y = GAME_HEIGHT/2-s.height/2;
			s.alpha = 0;
			s.layer = Main.FADER_LAYER+1;
			s.scaleY = s.scaleX = 0;
		tween(s, {scaleX: 1, scaleY: 1, alpha: 1}, 2, {ease: ELASTIC_OUT, startDelay: 3});
		s.onReleaseOnce = function() {
			playSound("assets/audio/ui/topClick");
			if (music != "") playMusic(music);
			if (StaticExtern.isMyntOn) {
				hideMynt();
				Mynt.busy = false;
				Mynt.active = false;
			}
			enablePause();
			result();
			cameraFadeIn(1, 0);
		}
	}

	public static function yesNoPrompt(yesResult:Void->Void, noResult:Void->Void):Void {
		cameraFadeOut(1, 0);

		var paraBg:MintSprite = addSprite("assets/img/effect/systemBox.png");
			paraBg.x = GAME_WIDTH/2 - paraBg.width/2;
			paraBg.y = GAME_HEIGHT/2 - paraBg.height/2;
			paraBg.layer = Main.FADER_LAYER+1;
			paraBg.alpha = 0;

		var yesButton:MintSprite = addSprite("assets/img/effect/endings/yes.png");
			yesButton.x = paraBg.x;
			yesButton.y = paraBg.y;
			yesButton.mouseEnabled = false;
			yesButton.layer = paraBg.layer + 1;
			yesButton.alpha = 0;

		var noButton:MintSprite = addSprite("assets/img/effect/endings/no.png");
			noButton.x = paraBg.x;
			noButton.y = paraBg.y;
			noButton.mouseEnabled = false;
			noButton.layer = paraBg.layer + 1;
			noButton.alpha = 0;

		var titleText:MintText = addText();
			titleText.alpha = 0;
			titleText.setText("Allow game construct \"SEPTRICA MAUZE\" to edit the \"Narrators\" array?");
			titleText.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
			titleText.x = paraBg.x + paraBg.width/2 - titleText.fieldWidth/2 + 50; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
			titleText.y = paraBg.y + paraBg.height/2 - titleText.fieldHeight/1.5 - 50;
			titleText.layer = paraBg.layer+1;
			titleText.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

		yesButton.scaleX = yesButton.scaleY = noButton.scaleX = noButton.scaleY = paraBg.scaleX = paraBg.scaleY = titleText.scaleX = titleText.scaleY = 0;

		timer(3, playSound.bind("assets/audio/environment/doorbell"));
		tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, startDelay: 3});
		tween(yesButton, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, startDelay: 3});
		tween(noButton, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, startDelay: 3});
		tween(titleText, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, startDelay: 3, onComplete: function() { yesButton.mouseEnabled = true; noButton.mouseEnabled = true; }});
		
		yesButton.onReleaseOnce = function() {
			playSound("assets/audio/environment/breakerUnflip");
			yesResult();
			cameraFadeIn(0x299d701, 1);
		}

		noButton.onReleaseOnce = function() {
			playSound("assets/audio/environment/breakerFlip");
			noResult();
			cameraFadeIn(0x9d2929, 1);
		}
	}

	public static function quickMynt(character:String) {
		cameraFadeIn(0xFFFFFF, 0.9);
		showMynt();
		myntQueueCall(hideChoices);
		disableCursorKeys();
		disablePause();

		if (character == "Junk City Hobos") {
			myntQueueTransition("pained");
			myntQueueSay("Don't ask me.");
			myntQueueSay("It's not my fault the island's like this...");
		}

		if (character == "Glowbunny") {
			myntQueueTransition("surprised");
			myntQueueCall(playSound.bind('assets/audio/mynt/ogosh'));
			myntQueueSay("HEY LOOK OUT THERE'S A KILLER BUNNY AHEAD");
			myntQueueTransition("offline");
			myntQueueSay("Wait—");
			myntQueueSay("I mean—");
			myntQueueTransition("unimpressed");
			myntQueueSay("Not like the one from Monty Python.");
			myntQueueTransition("serious");
			myntQueueSay("She's an islander. Or she used to be, anyway?");
			myntQueueSay("I've never seen an infected islander before.");
			myntQueueSay("(Besides Archie, but he's different.)");
			myntQueueTransition("default");
			myntQueueSay("So please be careful with her, okay?");
			myntQueueSay("Move along when I tell you to.");
			myntQueueSay("Okay here we go.");
		}

		if (character == "Cade") {
			myntQueueTransition("dizzy");
			myntQueueSay("Cade is a key member of the Sensitive Squad.");
			myntQueueTransition("default");
			myntQueueSay("Some people hardened up after sixty-six years in here.");
			myntQueueSay("But others just got squishier and squishier.");
			myntQueueSay("Every additional year of affectionate sex made their hearts grow two sizes bigger!!");
			myntQueueSay("The sensitive squad is:");
			myntQueueSay("Cade, Kemp, John, Roxelle, Red (big time)...");
			myntQueueSay("Maybe Roddy and Oni, too, such romantic boys~");
			myntQueueSay("Anyway!");
		}

		if (character == "Snagg") {
			myntQueueTransition("crushed");
			myntQueueSay("Please be careful around Marei, Cage, and Snagg.");
			myntQueueSay("Don't give them any information about me.");
			myntQueueSay("Don't follow them if they try to lead you anywhere.");
			myntQueueSay("They all work for Septrica.");
		}

		if (character == "Mikey") {
			myntQueueSay("Hey, there was a player named Mikey J.");
			myntQueueSay("He typed pretty much exactly like that radio guy talks.");
			myntQueueSay("Stuff like");
			myntQueueTransition("angry");
			myntQueueSay("'OH YEAHHHH!! PIPE THAT ASS'");
			myntQueueTransition("default");
			myntQueueSay("and");
			myntQueueTransition("angry");
			myntQueueSay("'UNF SLIPPERY FUCKER AINTCHA'");
			myntQueueTransition("default");
			myntQueueSay("Just a friendly allcaps horndog, itching to get to the hot pipery.");
			myntQueueSay("He didn't even customize his character, he was in such a hurry to play.");
			myntQueueDelay(2);
			myntQueueTransition("crushed");
			myntQueueSay("... Ah, but he's gone now, I assume.");
			myntQueueTransition("default");
			myntQueueSay("If he ever comes back, put him on the horn.");
			myntQueueSay("I miss his effervescent affirmations.");
			myntQueueTransition("tilde");
			myntQueueSay("OHHH YEAHHHHHHH!!!!");
		}

		if (character == "JohnLana") {
			myntQueueTransition("dizzy");
			myntQueueSay("Hey it's John and Lana again, from the library!");
			myntQueueSay("These two are good friends of mine!!");
			myntQueueTransition("default");
			myntQueueSay("They're total fuckin nerds.");
			myntQueueSay("That's all I wanted to say~");
		}

		if (character == "John") {
			myntQueueTransition("pained");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/okie");
			});
			myntQueueSay("Just a heads up.");
			myntQueueSay("Don't try and sex this guy.");
			myntQueueSay("This is the one guy you can't ever sex.");
			myntQueueSay("Unless I get the admin password!");
			myntQueueSay("Then maybe I can fix him...");
		}

		if (character == "Red") {
			if (data.roxVisits > 0) {
				myntQueueTransition("tilde");
				myntQueueSay("Rox and Red have a cute mother-daughter thing going!!");
				myntQueueTransition("default");
				myntQueueSay("Sometimes when Red is lonely and extra horny she comes over to Rox's farm.");
				myntQueueSay("Although she can never stay for too long, since she has to look after her bunny...");
				myntQueueSay("And she doesn't drink!");
				myntQueueTransition("lewd");
				myntQueueSay("(Well, except milk.)");
				myntQueueTransition("default");
				myntQueueSay("Red likes her perception to stay as grounded as possible.");
			} else {
				myntQueueTransition("tilde");
				myntQueueCall(function() {
					playSound("assets/audio/mynt/ogosh");
				});
				myntQueueSay("Ooooh this is my favorite islander probably!!!");
				myntQueueTransition("default");
				myntQueueSay("Although I wish she was of age.");
				myntQueueSay("But yes. My favorite.");
				myntQueueTransition("blush");
				myntQueueSay("She's such a noble little loli...!");
				myntQueueSay("I'll shut up so you can meet her~");
			}
			
		}

		if (character == "LLL Shooting") {
			myntQueueTransition("shock");
			myntQueueSay("Well uh.");
			myntQueueSay("Not sure what that was all about.");
			myntQueueTransition("serious");
			myntQueueSay("They've taken John, Lana, and the bunny to the Apothecary.");
			myntQueueSay("I highly suggest you don't follow them.");
			myntQueueSay("All they'd need to do is tranquilize you and put you on a drip feed.");
			myntQueueSay("Then... your character would just be stuck in here, talking to me forever.");
			myntQueueTransition("um");
			myntQueueSay("Look, do what you want.");
			myntQueueSay("Just be careful.");
			myntQueueSay("Okay?");
			myntQueueSay("Okay.");
		}

		if (character == "Som") {
			//myntQueueTransition("");
			myntQueueSay("This is Som.");
			myntQueueSay("He's my main IT support cub boi.");
			myntQueueSay("See that little manacle tattoo on his wrist?");
			myntQueueSay("That means he's loyal to me~ <3");
			myntQueueSay("The ink we used is something called Engine Fluid.");
			myntQueueSay("We configured the fluid to act like a tracking device!");
			myntQueueSay("Neat, huh~? <3");
			myntQueueTransition("dizzy");
			myntQueueSay("He volunteered to be permatracked, of course, as a show of trust~");
			myntQueueTransition("default");
			myntQueueSay("Such a good boi.");
			myntQueueSay((data.somQuestAccepted?"He's gonna look into that whole password cracker thing for us!!":"I may or may not need his help with something later, actually..."));
		}

		if (character == "Cage") {
			myntQueueTransition("unimpressed");
			myntQueueSay("Cage is abrasive as fuck, isn't he?");
			myntQueueTransition("serious");
			myntQueueSay("He used to be a lot worse though. He'd kill folks just to get them out of his way.");
			myntQueueSay("If they respawned in front of him again, they went ahead and moved on their own.");
			myntQueueTransition("default");
			myntQueueSay("Except Bins, a little raccoon boy, he kinda made a point to get in Cage's way...");
			myntQueueSay("He'd scramble to catch up with him.");
			myntQueueSay("I think eventually Cage got tired and just walked over him repeatedly like he wasn't there.");
			myntQueueTransition("pained");
			myntQueueSay("The kid got off hard on that.");
			myntQueueSay("Total objectification, y'know, kinda, I guess.");
			myntQueueSay("I'll never understand these people...");
		}
		
		myntQueueCall(cameraFadeOut.bind(0xFFFFFF, 1));
		myntQueueDelay(1);
		Mynt.commandQueue.push(function() {
			Mynt.busy = false;
			Main.showChoices();
		});
		myntQueueCall(function() {
			enablePause();
			enableCursorKeys();
			hideMynt();
			cameraFadeIn(0xFFFFFF, 1);
		});
	}

	public static function interpString(s:String, interp:Dynamic):String {
		var ereg:EReg = ~/#.*?#/g;

		while (ereg.match(s)) { 
			var match:String = s.substr(ereg.matchedPos().pos, ereg.matchedPos().len);
			var varName:String = match.substring(1, match.length-1);
			s = StringTools.replace(s, match, Reflect.field(interp, varName));
		}

		return s;
	}

	public static function examine(choiceText:String, result:String):Void {
		if (!data.examinedStuff.contains(choiceText)) {
			var examineButton:Button;

			examineButton = addChoice(choiceText, function () {
				clearText();
				append(result);
				data.examinedStuff.push(choiceText);
				examineButton.destroy();
			});
		}
	}

	public static function cumEffect():Void {
		if (data.hasCunt) return;
		for (i in 0...5) {
			var cumSprite:MintSprite = addSprite("assets/img/effect/cum"+(Math.random()>0.5?"2":"")+".png");
			cumSprite.x = cumSprite.width+(rndInt(0, 400));
			cumSprite.y = GAME_HEIGHT-cumSprite.height-(rndInt(100, 200));
			cumSprite.alpha = 0;
			cumSprite.scaleY = cumSprite.scaleX = 5;
			if (isActive("Mood Ring") && data.moodRingColor != "") cumSprite.tint = data.colorStringToHex.get(data.moodRingColor);
			tween(cumSprite, {scaleX: 1, scaleY: 1}, rndInt(1, 2), {ease: ELASTIC_OUT});
			tween(cumSprite, {alpha: 1}, 0.7);
			tween(cumSprite, {y: GAME_HEIGHT*1.2}, rndInt(5, 7), {ease: QUAD_IN});
		}
	}

	public static function getMood(cummer:String="Random"):String {
		var cumText:String = "";

		if (cummer == "Random") {
			if (Math.random() > 0.5) {
				cumText = pickOne(["", "", "bright ", "pastel ", "dark "]);
				cumText += pickOne(["red", "orange-red", "orange", "tangerine", "yellow", "yellow-green", "green", "auburn", "lime", "cyan", "blue", "indigo", "purple", "violet", "pink", "salmon", "fuschia"]);
			} else {
				cumText = pickOne(["cherry", "coffee", "musk", "cologne", "sandalwood", "campfire", "patchouli", "socks", "rose", "blueberry", "raspberry", "grassy", "copper", "cake-batter", "autumn", "vanilla", "citrus", "coconut", "caramel", "hamburger", "pizza", "liquor", "tobacco", "dirt", "lavender", "mud", "pumpkin", "rhubarb", "leather", "lemon", "ocean", "sulfur", "chocolate", "oil", "matcha", "cinnamon", "mint"]);
				cumText += pickOne(["-scented", "-smelling", "-flavored"]);
			}
		}

		if (cummer == "You") {
			if (data.moodRingColor == "" || data.moodRingFlavor == "")
				return "";

			if (Math.random() > 0.5) {
				cumText = data.moodRingColor;
			} else {
				cumText = data.moodRingFlavor;
				if (Math.random() > 0.5)
					cumText += "-scented";
				else
					cumText += "-flavored";
			}
		}

		if (cummer == "Roxelle") {
			cumText = pickOne(["forest green", "pine-scented", "earthy", "fresh, sap-scented", "dark green", "forest-flavored"]);
		}

		if (cummer == "Cage") {
			cumText = pickOne(["dark red", "heavy crimson", "burnt-fruit-scented", "sweet and smokey (like charred apples)", "grungy red", "red and coal-flavored"]);
		}

		if (cummer == "Kemp") {
			cumText = pickOne(["bright pink", "hot pink", "fuschia", "creamy pink and campfire-flavored", "pink and smoke-scented, like a toasty campfire"]);
		}

		if (cummer == "Ivandis") {
			cumText = pickOne(["blue and musk-scented", "light blue", "scented like a dude's hot grundle", "blue and armpit-scented", "skunkspray-flavored", "bright blue"]);
		}

		if (cummer == "Lana") {
			cumText = pickOne(["sharp yellow", "egg-yolk yellow", "bright, cheery yellow and scented like old books", "scented like a paperback", "orange-yellow", "paperglue-scented (it even gets you a little high)"]);
		}

		if (cummer == "Marei") {
			cumText = pickOne(["rainbow", "diesel-flavored", "gasoline-flavored", "bright rainbow", "rainbow-colored", "gas-scented"]);
		}

		if (cummer == "Som") {
			cumText = pickOne(["shiny pastel pink", "light, soft-pink", "pink-and-super-salty", "seaspray-flavored", "salty, muted pink", "light fuschia"]);
		}

		if (cummer == "Bleat") {
			cumText = pickOne(["electric cyan", "electric", "staticy, electric blue"]);
		}

		if (cummer == "Thelly") {
			cumText = pickOne(["indigo", "lemon-flavored", "lemony", "citrus", "tangy, indigo", "tangy"]);
		}

		if (cummer == "Gryphon") {
			cumText = pickOne(["indigo", "strawberry", "strawberry-scented", "strawberry-flavored"]);
		}

		if (cummer == "Snagg") {
			cumText = pickOne(["black", "black, tar-scented", "tar-flavored", "viscous, tarlike", "jet black"]);
		}

		if (cummer == "Bins") {
			cumText = pickOne(["murky yellow", "dark orange", "rotten-flavored", "rotten", "chunky yellow", "murky and rotten"]);
		}

		if (cummer == "Nymph Boy") {
			cumText = pickOne(["purple", "frosting-flavored", "violet", "sweet purple", "sugary", "sweet"]);
		}

		if (cummer == "Boars") {
			cumText = (isActive("Candy Ring")?pickOne(["chocolatey", "choco-brown", "chunky brown rocky-road", "chocolate", "melted-caramel brown", "brown"]):pickOne(["diarrhea", "slimy brown", "chunky, liquid-shit", "steamy brown", "chocolate-looking", "brown"]));
		}

		cumText += " ";
		return cumText;
	}

	public static function specialMsg(text:String, sprite:String="assets/img/item/Glowberry.png", ruling:String="top right"):Void {
		var startDelay:Float = 0;
		var bubbleIcon:MintSprite = addSprite(sprite);
		if (sprite == "assets/img/item/Glowberry.png") bubbleIcon.alpha = 0;
		var bubble:MintSprite = addSprite("assets/img/effect/creditBubble.png");
		bubble.x = GAME_WIDTH;
		bubble.y = GAME_HEIGHT-bubble.height-110;

		var destinationX:Float = GAME_WIDTH-bubble.width-10;	

		if (ruling == "top right") {
			bubble.x = GAME_WIDTH;
			bubble.y = bubble.height-15;
			destinationX = GAME_WIDTH-bubble.width-10;
		}

		if (ruling == "bottom right") {
			bubble.x = GAME_WIDTH;
			bubble.y = GAME_HEIGHT-115-bubble.height;
			destinationX = GAME_WIDTH-bubble.width-10;
		}

		var bubbleText:MintText = addText();
		bubbleText.setFormat({autoSize: "left", fontSize: 20, wordWrap: true});
		bubbleText.setText(text);
		bubbleText.x = bubble.x;
		bubbleText.y = bubble.y+bubble.height/2-bubbleText.fieldHeight/2-5;

		if (sprite != "assets/img/item/Glowberry.png") {
			bubbleIcon = addSprite(sprite);
			bubbleIcon.y = bubble.y+bubble.height/3-2;
			bubbleIcon.x = bubble.x;
			bubbleIcon.scaleX = 2.5;
			bubbleIcon.scaleY = 2;
		}

		bubble.scaleX = bubbleText.scaleX = 1.5;

		bubble.update();
		if (sprite != "assets/img/item/Glowberry.png") bubbleIcon.update();
		bubbleText.update();

		tween(bubble, {x: destinationX, scaleX: 1}, 1.2, {ease: QUINT_OUT, startDelay: 0});
		tween(bubble, {alpha: 0}, 3, {ease: QUINT_OUT, startDelay: 5});

		if (sprite != "") {
			tween(bubbleIcon, {x: destinationX+20, scaleX: 2}, 1.2, {ease: QUINT_OUT, startDelay: 0.05});
			tween(bubbleIcon, {alpha: 0}, 3, {ease: QUINT_OUT, startDelay: 7});
		}

		tween(cast(bubbleText, MintSprite), {x: destinationX+(sprite!="assets/img/item/Glowberry.png"?bubbleIcon.width/1.5:0)+18, scaleX: 1}, 1.3, {ease: QUINT_OUT, startDelay: 0.1});
		tween(cast(bubbleText, MintSprite), {alpha: 0}, 3, {ease: QUINT_OUT, startDelay: 7});
	}

	public static function playMusic(song:String, force:Bool=false):Void {
		if (data.currentSong != song || force) {
			data.currentSong = song;
			stopChannel("music");
			playSound("assets/audio/environment/"+song, "music", {loops: 99999});
		}
	}

	public static function highEffect(highRotation:Int=600):Void {

		var tweenTwist:MintSprite->Int->Void;
		tweenTwist = function(highSprite:MintSprite, alternator:Int):Void {
			var rand:Float = Math.random();
			var flipperX:Int = pickOne([-1, 1]);
			var flipperY:Int = pickOne([-1, 1]);

			//Scale from 1.6x to 2.6x
			//Flip axes at random
			highSprite.scaleX = (1.6+rand)*flipperX;
			highSprite.scaleY = (1.6+rand)*flipperY;

			//Random distance nudge based on scale
			highSprite.y = rndFloat(0, 300*rand)*flipperY;
			highSprite.x = rndFloat(0, 300*rand)*flipperX;

			highSprite.rotation = highRotation*0.5*rand;

			tween(
				highSprite,
				{rotation: highRotation*rndFloat(0.7, 1)},
				rndFloat(30, 40),
				{
					type: PINGPONG,
					startDelay: rndInt(0, 1),
					ease: pickOne([QUAD_IN_OUT, QUINT_IN_OUT, QUART_IN_OUT]),
					onComplete: tweenTwist.bind(highSprite, alternator)
				}
			);

			tween(highSprite,
				{alpha: 0.2},
				8,
				{
					type: PINGPONG,
					startDelay: (alternator == 0 ? 0 : 4),
					ease: QUAD_IN_OUT
				}
			);
		}

		for (i in 0...2) {
			var s:MintSprite = addSprite("assets/img/effect/high.png", false); 
			s.layer = 1;
			s.alpha = (i == 0 ? 0.15 : 0);
			s.centerPivot = true;
			tweenTwist(s, i);
		}
	}

	public static function rainEffect(rainType:String="hard"):Void {
		var rainSprite:MintSprite;
		var rainAmount:Int = 200;
		var rainRotation:Int = -20;
		var rainSpeed:Float = 1;
		var rainSkew:Int = 100;
		var rainAlpha:Float = 0.2;

		if (rainType == "soft") {
			rainAmount = 200;
			rainRotation = 0;
			rainSpeed = 1.5;
			rainSkew = 15;
		} else if (rainType == "minimum") {
			rainAmount = 15;
			rainRotation = 0;
			rainSpeed = 2;
			rainSkew = 0;
			rainAlpha = 0.2;
		} else if (rainType == "brutal") {
			rainAmount = 250;
			rainRotation = -25;
			rainSpeed = 0.6;
			rainSkew = 150;
			rainAlpha = 0.6;
		} else if (rainType == "ultrabrutal") {
			rainAmount = 350;
			rainRotation = -30;
			rainSpeed = 0.2;
			rainSkew = 200;
			rainAlpha = 0.9;
		}

		var tweenDrop:MintSprite->Void;
		tweenDrop = function(drop:MintSprite):Void {
			var rand:Float = random();
			drop.alpha = rainAlpha+random()*0.1;
			drop.x = rndFloat(-200, GAME_WIDTH);
			drop.y = -drop.height;

			tween(
				drop,
				{y: 600, alpha: 0.1, x: drop.x+rainSkew},
				rainSpeed,
				{type: LOOP, startDelay: Math.random()*2, onComplete: tweenDrop.bind(drop)}
			);
		}

		for (i in 0...rainAmount) {
			var s:MintSprite = addSprite("assets/img/effect/raindrop.png", false); 
			s.layer = Main.HUB_LAYER;
			s.alpha = rainAlpha+random()*0.1;
			s.rotation = rainRotation;
			tweenDrop(s);
		}
	}
}
