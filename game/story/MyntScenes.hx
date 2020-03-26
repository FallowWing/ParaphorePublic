package story;

//@TODO:
//Vanylla: library scene
//third date: mynt wants the pass so she doesnt have to narrate kinky things -> get a new body too
//third date: what happened to archie? he disappeared, off the radar (privacy ring), then left for good

class MyntScenes
{

	//public static function startScene():Void {
	//	showMynt();
	//	myntQueueHideChoices();
	//}

	private static var amcnTalkedMarei:Bool = false;
	private static var amcnTalkedCage:Bool = false;
	private static var amcnTalkedKemp:Bool = false;
	private static var amcnTalkedSnagg:Bool = false;
	private static var amcnTalkedSom:Bool = false;
	private static var protocolEndLetter:Array<String> = [];
	private static var protocolTimePassed:Int = 0;

	public static function getMail(scene:String):Void {
		if (!data.myntMessages.contains(scene)) {
			playSound("assets/audio/ui/gotMail", "gotMail");
			data.myntMessages.push(scene);
			hookClear(stopChannel.bind("gotMail"));
		}
	}

	public static function removeMail(scene:String):Void {
		data.myntMessages.remove(scene);
	}

	public static function recall(scene:String):Void {
		if (scene == "Automated Health Warning") myntTemp("intro");
		if (scene == "Writing") myntWriter("intro");
		if (scene == "Accident") petIntro("main");
		if (scene == "<3") myntDate("intro");
		if (scene == "Capsules") myntCapsules("intro");
		if (scene == "[Automated Health Warning] (2)") myntDate2("intro");
	}

	public static function checkScenes():Void {
		if (data.daydream) return;
		if (!data.myntPetDone && !onFA() && data.exploreFinaleBFDone) {
			data.myntPetDone = true;
			unlockJournal("Accident");
			petIntro("main");
		} else if (data.knownAsPlayer >= 2 && data.myntNarrative == 0 && !data.myntWriterDone) {
			data.myntWriterDone = true;
			unlockJournal("Writing");
			myntWriter("intro");
		} else if (getTimer() >= 900 && !data.myntTemperatureDone) {
			data.myntTemperatureDone = true;
			unlockJournal("Automated Health Warning");
			myntTemp("intro");
		} else if (
			((data.exploreFinaleBFDone && data.exploreFinaleJCDone) ||
			(data.exploreFinaleVMDone && data.exploreFinaleJCDone) ||
			(data.exploreFinaleVMDone && data.exploreFinaleBFDone)) && !data.myntDateDone) {
			data.myntDateDone = true;
			unlockJournal("<3");
			myntDate("intro");
		} else if (data.exploreFinaleBFDone && data.exploreFinaleJCDone && data.exploreFinaleVMDone && data.myntDateDone && !data.myntDate2Done) {
			data.myntDate2Done = true;
			unlockJournal("Automated Health Warning 2");
			myntDate2("intro");
		} else if (getItem("Capsule").amount > 50 && getItem("Capsule").amount < 999 && !data.myntCapsulesDone) {
			data.myntCapsulesDone = true;
			myntCapsules("intro");
		}
	}

	public static function myntIntro(seg:String):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "main") {
			cameraFadeIn(0xFFFFFF, 0.1);
			showMynt();
			msg("Space to skip.");

			if (Math.random() > 0.5) {
				myntQueueHideChoices();
				myntQueueTransition("offline");
				myntQueueDelay(2);
				myntQueueAddChoice("Next x666", myntIntro.bind("main2"));
				myntQueueShowChoices();
			} else {
				myntIntro("main2");
			}
		}

		if (seg == "main2") {
			myntQueueHideChoices();
			myntQueueCall(playSound.bind('assets/audio/mynt/questionmew', 'mew'));
			myntQueueTransition("default");
			myntQueueSay("Mew?");
			myntQueueDelay(2);
			myntQueueTransition("serious");
			myntQueueSay("Archie?");
			myntQueueDelay(2);
			myntQueueTransition("surprised");
			myntQueueSay("...!!!!!!!!!!");
			myntQueueCall(playSound.bind('assets/audio/mynt/ogosh'));
			myntQueueSay("No way! You're a player!");
			myntQueueSay("Uh— erm— welcome to Paraphore. We've been pretty lonely in here.");
			if (onFA()) {
				myntQueueTransition("sad");
				myntQueueSay("... Just so you know, um...");
				myntQueueSay("I'll have to place this gaudy [FurAffinity Censor] over your head. :<");
				myntQueueSay("Most cubs won't be able to meet you.");
				myntQueueSay("Don't worry, I'll tell them what you're like! ;w;");
			}
			myntQueueTransition("default");
			myntQueueDelay(2);
			myntQueueSay("...");
			myntQueueSay("Say, are you 18 or older?");
			myntQueueAddChoice("Yes.", myntIntro.bind("AgeGateYes"));
			myntQueueAddChoice("No.", myntIntro.bind("AgeGateNo"));
			myntQueueAddChoice("If I say no, are you going to kick me out?", myntIntro.bind("AgeGateMaybe"));
			myntQueueShowChoices();
		}

		if (seg == "AgeGateYes") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("PHEW!! Thank fuck!!");
			myntQueueSay("If you are who I think you are, there's pretty much no way you're NOT over 18.");
			myntQueueTransition("default");
			myntQueueSay("But forget about who I think you are.");
			myntQueueSay("My name's Mynt.");
			myntQueueSay("What's yours?");
			myntQueueAddTextChoice(function(str) {
				data.playerName = str;
				myntIntro("Mynt2");
			});
			myntQueueAddChoice("Xx_DARKFOX_xX", function() {data.playerName = "Xx_DARKFOX_xX"; myntIntro("Mynt2"); });
			myntQueueAddChoice("Huskybutt", function() {data.playerName = "Huskybutt"; myntIntro("Mynt2"); });
			myntQueueAddChoice("Dankpaw", function() {data.playerName = "Dankpaw"; myntIntro("Mynt2"); });
			myntQueueAddChoice("<insert text>", function() {data.playerName = "<insert text>"; myntIntro("Mynt2"); });
			myntQueueAddChoice("Randomize everything.", myntIntro.bind("MyntRandomize"));
			myntQueueShowChoices();
		}

		function pearGame(pearLimit:Int=6):Void {
			var pearsClicked:Int = 0;
			var pearsMissed:Int = 0;
			
			if (pearLimit == 6) {
				var title:MintSprite;
				playSound('assets/audio/environment/pearMusic', 'music', {loops: 99999});
				title = addSprite("assets/img/effect/pearaphore.png");
				title.x = GAME_WIDTH/2-title.width/2;
				title.y = -title.height;
				tween(title, {y: 10}, 3, {ease: BOUNCE_OUT});
			}

			function spawnPears():Void {
				var delay:Float = 0;
				var pearsSpawned:Int = 0;
				
				for (i in 0...6) {
					delay += rndFloat(1, 3);

					var pear:MintSprite = new MintSprite();
					pear.setupAnimated("assets/img/effect/pear.png");
					pear.centerPivot = true;
					pear.alpha = 0;
					pear.x = GAME_WIDTH;
					pear.y = (GAME_HEIGHT-pear.height*1.5)*Math.random();
					pear.pixelPerfectOverlapping = false;
					tween(pear, {alpha: 1}, 0.1);
					tween(pear, {x: -pear.width*1.5}, rndInt(2,4), {startDelay: rndInt(1, 2)+delay, onComplete: function() { 
						pear.destroy();
						pearsSpawned++;
						pearsMissed++;
						msg("Pears Missed: "+pearsMissed, true);
						if (pearsSpawned >= pearLimit) spawnPears();
					}});
					tween(pear, {rotation: rndInt(600, 1000)}, rndInt(4,6), {startDelay: 1+delay});
					pear.onReleaseOnce = function() {
						tween(pear, {scaleX: 0.1, scaleY: 0.1}, 0.1, {onComplete: function() {
							playSound('assets/audio/environment/pearClick', 'pear');
							pear.destroy();
							pearsSpawned++;
							pearsClicked++;
							msg("Pears Clicked: "+pearsClicked);
							if (pearsSpawned >= pearLimit) spawnPears();
						}});
					}
				}

			}
			spawnPears();
		}

		if (seg == "AgeGateMaybe") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueDelay(2);
			myntQueueTransition("default");
			myntQueueSay("What? Of course not.");
			myntQueueSay("Here, let me start up the game for you.");
			myntQueueCall(myntIntro.bind("AgeGateEnd"));
		}

		if (seg == "AgeGateNo") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueDelay(2);
			myntQueueTransition("default");
			myntQueueSay("Perfectly fine by me.");
			myntQueueSay("Let's start the game!");
			myntQueueCall(myntIntro.bind("AgeGateEnd"));
		}

		if (seg == "AgeGateEnd") {
			myntQueueHideChoices();
			myntQueueSay("Did I say \"welcome to Paraphore\" earlier?");
			myntQueueTransition("tinysmile");
			myntQueueSay("I meant \"welcome to PEARAPHORE!!!\"");
			myntQueueCall(function() {
				pearGame();
				msg("<!img:kink/Music.png> Music: WUT — by Wronger", true);
			});
			myntQueueTransition("dizzy");
			myntQueueSay("WOOOOOoooOOooOOOO");
			myntQueueSay("AWRIIIGHT!");
			myntQueueTransition("tilde");
			myntQueueSay("GET YOUR MITTS ON THOSE PEARS!");
			myntQueueSay("Come on, let's see some hustle!!");
			myntQueueTransition("dizzy");
			myntQueueSay("Here we go now!");
			myntQueueSay("Alright now!");
			myntQueueSay("Click em hard now y'all!");
			myntQueueTransition("shock");
			myntQueueSay("WOW THIS IS GREAT HUH");
			myntQueueTransition("default");
			myntQueueSay("Alright now...");
			myntQueueSay("Haha, heck yeah, got the pears comin all up across the screen now...");
			myntQueueSay("Click em up, oh yeah... yeah yeah... you got this...");
			myntQueueTransition("sad");
			myntQueueSay("Keep playin this fuuuun game...");
			myntQueueSay("Please don't leave...");
			myntQueueTransition("dizzy");
			myntQueueSay("Haha ALRIGHT NOW LET'S GOoOoooOOo");
			myntQueueSay("YYYYAaaaaAAaAaaAAAYYYY PEARAPHOOOORE");
			myntQueueSay("CLICKEMALLUP REAL GOOD NOWWwwww");
			myntQueueSay("Hahaaa WOOOOOooooOOoOOoOOooOOooooo");
			myntQueueTransition("crushed");
			myntQueueSay("(You cannot know how much this hurts.)");
			myntQueueTransition("tilde");
			myntQueueSay("PEARSPEARSPEARSPEARSPEARSPEARS");
			myntQueueSay("WOoooahhhh when ya say pears a bunch it becomes SPEARS");
			myntQueueSay("Haha isn't that funny");
			myntQueueTransition("serious");
			myntQueueSay("WAIT THAT'S NOT INNUENDO I SWEAR!!");
			myntQueueTransition("pained");
			myntQueueSay("I only meant. That like.");
			myntQueueTransition("dizzy");
			myntQueueSay("I sure am glad there aren't any real spears in this game haha!!");
			myntQueueSay("Weapons are violent and this game is safe and fun and it does not have any violence!");
			myntQueueSay("Nope the only weapon we got in here are soft ripe pears!");
			myntQueueSay("They can't hurt ya no matter how hard you click em!");
			myntQueueSay("Easy to chew and digest!");
			myntQueueSay("Healthy for the bones!");
			myntQueueSay("Definitely not in any way visually similar to a set of hips!");
			myntQueueTransition("tilde");
			myntQueueSay("WOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOOooooOOOOOoooOOOOooooOOOOooooOOOOOOO");
			myntQueueTransition("lewd");
			myntQueueSay("Pears >w> Pears <w< Pears >w> Pears <w< Pears >w> Pears <w<");
			myntQueueSay("Juicy and nutritious, ooo!");
			myntQueueSay("Bit capricious too, you see!");
			myntQueueSay("Constantly they're moving through!");
			myntQueueSay("GET INTO THE GROOOOoooove");
			myntQueueSay("Yayyyyyyyyy PEARS!");
			myntQueueTransition("crushed");
			myntQueueSay("(I waited half a century just for this shitshow.)");
			myntQueueTransition("sad");
			for (i in 0...10)
				myntQueueSay("PPPPPPPPPPEEEEEEAAAAAAAARRRRRRRRRSSSSSSSSSSS");
			for (i in 0...20)
				myntQueueSay("YAYYYYYYYYYYYYYYYYYYYYYYYY");
			for (i in 0...30)
				myntQueueSay("Pears.");
				myntQueueSay("This is all there is. Move on.");
			for (i in 0...30)
				myntQueueSay("Yay pears.");
			for (i in 0...30)
				myntQueueSay("Hooray pears.");
			myntQueueTransition("unimpressed");
			for (i in 0...30)
				myntQueueSay("Fuck yeah pears.");
				myntQueueCall(function() {
					stopChannel("music");
					playMusic("mynt");
				});
			myntQueueSay("Not much else to say about them.");
			myntQueueSay("They're a fucking fruit.");
			myntQueueSay("Just like you, Archie.");
			myntQueueTransition("angry");
			myntQueueSay("Yeah I bet it's you.");
			myntQueueSay("What are you now, ninety years old?");
			myntQueueSay("And you're here, just doing this to make me suffer.");
			myntQueueSay("Testing me to see if I'm so desperate for company I'll hurt a kid.");
			myntQueueSay("That's a fuck of a grudge.");
			myntQueueSay("Well, I'm done with you.");
			myntQueueSay("I was done with you the moment I met you.");
			myntQueueSay("I hope your CPU burns out on these pears, bitch.");
			myntQueueSay("Say bye bye.");
			myntQueueCall(function() { pearGame(3); });
			myntQueueTransition("offline");
			myntQueueSay(" ");
		}

		if (seg == "MyntRandomize") {
			playSound("assets/audio/mynt/compute");

			var genderString = pickOne(["m", "f", "n"]);
			data.genderMale = genderString == "m";
			data.genderFemale = genderString == "f";
			data.genderNeutral = genderString == "n";

			var hasString = pickOne(["cock", "cunt", "both"]);
			data.hasCock = hasString == "cock";
			data.hasCunt = hasString == "cunt";
			data.hasBoth = hasString == "both";

			data.playerName = pickOne(GameData.randomNames);

			StoryUtils.generateCipher();

			data.myntColour = data.myntColourFlavorized = "mint";

			resetTheme();
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Done!");
			myntQueueTransition("default");
			myntQueueSay("Your name is "+data.playerName+" and you have a "+pickByGenitals("cock", "puss", "cock and a cunt")+" and "+(data.hasBoobs?"boobs":"no boobs")+".");
			myntQueueSay("One question: wanna start in Bright Forest or Junk City?");
			myntQueueSay("The forest is vanilla-ish, and the city is hardcore.");

			myntQueueAddChoice("Bright Forest.", function() {
				enablePause();
				hideMynt();
				stopChannel('music');
				data.startedInBrightForest = true;
				playSound("assets/audio/mynt/shutdown");
				BrightForest.brightForestHub();
			});
			myntQueueAddChoice("Junk City.", function() {
				enablePause();
				hideMynt();
				stopChannel('music');
				data.startedInBrightForest = false;
				playSound("assets/audio/mynt/shutdown");
				JunkCity.junkCityHub();
			});
			myntQueueAddChoice("Define hardcore.", myntIntro.bind("Mynt7"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt2") {
			playMusic("mynt");
			var name:String = data.playerName.toTitleCase();

			myntQueueHideChoices();
			playSound("assets/audio/mynt/compute");
			if (data.playerName == "Archbishop" || data.playerName == "Archie") {
				myntQueueTransition("suspect");
				myntQueueSay("Archie's been gone for a long time. You're not Archie.");
				myntQueueSay("No fooling me.");
				myntQueueTransition("default");
				myntQueueSay("Anyway...");
				data.playerName = "Phony";
			} else if (data.playerName == "Paraphore") {
				myntQueueTransition("shock");
				myntQueueSay("What?");
				myntQueueSay("Why would you name yourself after the game?");
				myntQueueSay("Or are you naming yourself after the meteorite...?");
				myntQueueTransition("default");
				myntQueueSay("Well. Anyway...");
				data.playerName = "Phony";
			} else if (data.playerName == "Semiphore") {
				myntQueueTransition("shock");
				myntQueueSay("What?");
				myntQueueSay("So like Paraphore, but half... of a phore...?");
				myntQueueTransition("default");
				myntQueueSay("Well. Anyway...");
				data.playerName = "Phony";
			} else if (data.playerName == "") {
				myntQueueSay("That's not a name... you need something prettier.");
				myntQueueSay("Maybe all-caps; strong; firm; standing proud.");
				data.playerName = "NO NAME";
			} else if (data.playerName == "Xx_DARKFOX_xX") {
				myntQueueSay("Ah yes, welcome, Xx_DARKFOX_xX the 8457th.");
				myntQueueSay("Just kidding >w>");
				myntQueueSay("Anyway...");
			} else if (data.playerName == "Huskybutt") {
				myntQueueSay("Dogs spook me a little.");
				myntQueueSay("But you seem like a nice dog. :3");
				myntQueueSay("I deduced this from the fact that you have butt in your name.");
				myntQueueSay("Anyway~!");
			} else if (data.playerName == "Dankpaw") {
				myntQueueSay("Ah! Really?");
				myntQueueSay("Let me sniff.");
				myntQueueTransition("tilde");
				myntQueueSay("*HUGE COLOSSAL SNIFFFFFFF*");
				myntQueueCall(playSound.bind('assets/audio/mynt/ogosh'));
				myntQueueSay("HECK that's dank. Phew. You weren't kidding.");
				myntQueueTransition("default");
				myntQueueSay("Anyway.");
			} else if (data.playerName == "<insert text>") {
				myntQueueTransition("suspect");
				myntQueueSay("What kinda name is that?!");
				myntQueueSay("... Is this a reference or something?");
				myntQueueTransition("default");
				myntQueueSay("................. Anyway.");
			} else if (name == "Mint") {
				myntQueueTransition("suspect");
				myntQueueSay("...");
				myntQueueSay(".........");
				myntQueueSay("... How do you know about him?");
				myntQueueTransition("um");
				myntQueueSay("..................");
				myntQueueSay("You can't.");
				myntQueueSay("... Sorry... nevermind.");
				myntQueueSay("Just a weird coincidence.");
				myntQueueTransition("default");
				myntQueueSay("................. Annnnnyway!");
			} else if (name == "Wendy") {
				myntQueueTransition("surprised");
				myntQueueSay("MOM?!?");
				myntQueueTransition("sad");
				myntQueueSay("... A-Ah... sorry, no... that's a common name.");
				myntQueueSay("Um. Uh.");
				myntQueueTransition("default");
				myntQueueSay("My apologies. Moving on:");
			} else if (name == "Jesus") {
				data.playerName = "Jenga";
				myntQueueTransition("protocol");
				myntQueueSay("CONCEPT \"JESUS\" IS NOT ENABLED.");
				myntQueueSay("PLEASE DO NOT ENTER \"JESUS\" AGAIN.");
				myntQueueTransition("default");
				myntQueueSay("Oop, alarm bells. Sorry about that, Jenga!");
				myntQueueSay("Anyway!");
			} else if (name == "Roxelle" || name == "Kemp" || name == "Som" || name == "Cage" || name == "Marei" || name == "Lana" || name == "Bins" || name == "Red" || name == "John" || name == "Snagg" || name == "Septrica") {
				var species:String = "";
				var gender:String = "";
				if (name == "Roxelle") {
					gender = "She";
					species = "an alcoholic cow";
				} else if (name == "Kemp") {
					gender = "He";
					species = "a stoned otter";
				} else if (name == "Som") {
					gender = "He";
					species = "a nerd lamb";
				} else if (name == "Cage") {
					gender = "He";
					species = "a tsundere bull";
				} else if (name == "Marei") {
					gender = "He";
					species = "an operatic cat";
				} else if (name == "Lana") {
					gender = "He";
					species = "a fox librarian";
				} else if (name == "Bins") {
					gender = "He";
					species = "a filthslut raccoon";
				} else if (name == "Red") {
					gender = "She";
					species = "a big bad wolf";
				} else if (name == "John") {
					gender = "He";
					species = "an asexual dog";
				} else if (name == "Snagg") {
					gender = "He";
					species = "a greedy croc";
				} else if (name == "Septrica") {
					gender = "She";
					species = "a powerhungry gecko bitch";
				}
				myntQueueTransition("surprised");
				myntQueueSay("Whoa!!! We have "+species+" by that name!");
				myntQueueTransition("default");
				myntQueueSay(gender+" won't believe this! >:3");
				myntQueueSay("... Hey. Question for ya.");
			} else if (name == "Skodai") {
				cameraFadeOut(0x000000, 6);
				myntQueueTransition("surprised");
				myntQueueSay("Oh god!? Where did your eyes go?!");
				myntQueueSay("Oh no you're eyeless, oh gosh, quick, uh");
				myntQueueSay("Restart the game!!");
				myntQueueSay("Do something!");
				myntQueueSay("It's all going downhill!!!");
				myntQueueSay("SHIIIIIIIIIIIIIIIIT");
				myntQueueSay("FUUUCK");
				myntQueueSay("OH NOOOOO");
				myntQueueSay("I HAD ONE SHOT");
				myntQueueSay("ONE SHOT AFTER SIXTY FUCKIN YEARS");
				myntQueueSay("AND I BLEW IT!!!!!!!!!!!");
				myntQueueSay("I FUCKED UP YOUR EYES (SOMEHOW?)");
				myntQueueSay("THIS GAME IS JUST READING THATS IT");
				myntQueueSay("NO EYES, NO GAME");
				myntQueueSay("OH NOOOOOOOOOOOOOOOOOO");
				myntQueueSay("OOOOOOOOOOOOOOOOOOOOOOOO");
				myntQueueSay("OOOOOOOOOOOOOOOOOOOOO");
				myntQueueTransition("default");
				myntQueueSay("Well... I guess I'll just keep going...");
				myntQueueSay("Like you can even read any of this.");
			} else if (name == "Mynt") {
				myntQueueTransition("surprised");
				myntQueueSay("Hey! That's my name!");
				myntQueueTransition("default");
				myntQueueSay("Well, I guess I'll let you borrow it. :3");
				myntQueueSay("But things might get confusing, you know.");
				myntQueueSay("Anyway.");
			} else if (name == "Lone") {
				myntQueueTransition("blush");
				myntQueueSay("'Lone?'");
				myntQueueSay("What a unique name...");
				myntQueueSay("I love short, cute names like that!!");
				myntQueueSay("Mynt, Kitt, Red, Cage, Rox, Kemp, Bins, Lana, John...");
				myntQueueTransition("suspect");
				myntQueueSay("Wait, where did Kitt come from...");
				myntQueueTransition("default");
				myntQueueSay("Anyway.");
			} else if (name == "Gabe") {
				myntQueueTransition("surprised");
				myntQueueSay("'Gabe...?'");
				myntQueueSay("That rings a very quiet, very distant bell in my head...");
				myntQueueSay("I think... I think that might've been Archie's real name:");
				myntQueueSay("Gabriel.");
				myntQueueTransition("suspect");
				myntQueueSay("Well, I'm not sure... don't quote me on that.");
				myntQueueTransition("default");
				myntQueueSay("Anyway.");
			} else if (name == "Strawberry") {
				myntQueueTransition("surprised");
				myntQueueSay("Reminds me of a certain crotch I know.");
				myntQueueTransition("default");
				myntQueueSay("That crotch belongs to a gryphon. :3");
				myntQueueSay("It's a very magical crotch!");
				myntQueueSay("Anyway.");
			} else if (name == "Cade") {
				myntQueueTransition("surprised");
				myntQueueSay("Haven't you played before??");
				myntQueueSay("Someone's been waiting for you!");
				myntQueueTransition("default");
				myntQueueSay("Oh.");
				myntQueueSay("No, sorry.");
				myntQueueSay("I mistook you for someone else.");
				myntQueueSay("Anyway.");
			} else if (name == "Kittery" || name == "Kitt" || name == "Fallow" || name == "FallowWing") {
				myntQueueSay("???? :3");
				myntQueueTransition("suspect");
				myntQueueSay("What's this tingly feeling...");
				myntQueueSay("It's like a multiversal deja-vu type thing.");
				myntQueueSay("Weird vibes.");
				myntQueueTransition("default");
				myntQueueSay("Anyway.");
			} else if (name == "Bleat") {
				myntQueueSay("Sounds prophetic, somehow.");
				myntQueueSay("Anyway.");
			} else if (name == "Bert") {
				myntQueueTransition("surprised");
				myntQueueSay("OH MY GOD!");
				myntQueueTransition("default");
				myntQueueSay("I know a cute dog by that name. :3");
				myntQueueSay("The gentle, slutty, not-cat-chasing kind.");
				myntQueueSay("Anyway.");
			} else if (name == "Galaxy wizard") {
				myntQueueTransition("dizzy");
				myntQueueSay("Haha~! Holy shit!!");
				myntQueueSay("Welcome on board, your girthiness~");
				myntQueueSay("Transfigure all the spacetime you please~");
				myntQueueSay("O Dank One, I beg you: bewitch our systems of solarity~!!");
				myntQueueTransition("default");
				myntQueueSay("Maybe 'off chance' should rather be 'certainty', great Wizard...");
				myntQueueSay("... one who has done and will do everything in all timelines...");
				myntQueueSay("But I must phrase it 'off chance' for protocol:");
			} else if (name == "Cryptic" || data.playerName == "cryptic") {
				myntQueueTransition("surprised");
				myntQueueSay("Huh, not from around here... are you?");
				myntQueueTransition("default");
			} else if (name == "Rebeca") {
				myntQueueSay(data.playerName + "?");
				myntQueueSay("Is that your real name? :o");
				myntQueueSay("Um. Anyway~");
			} else {
				myntQueueSay(data.playerName + "?");
				myntQueueSay("That's a pretty name. :3");
				myntQueueSay("So:");
			}

			StoryUtils.generateCipher();
			
			if (data.fatCatUnlockers.indexOf(data.playerName.toUpperCase()) != -1) {
				msg("Welcome, patron! Skins unlocked!");
				unlockUi("zeit", "all");
				unlockUi("trickster", "all");
				if (data.playerName.toUpperCase() != "CRYPTIC") myntQueueSay("... Oh, it's you! Sorry, I'm a ditz. x3 Thanks for donating!!");
				myntQueueSay("Wanna equip a skin?");

				myntQueueAddChoice("Equip Zeit.", function() {
					equipUi("zeit");
					data.myntColour="red";
					myntIntro("Mynt3");
				});

				myntQueueAddChoice("Equip Trickster.", function() {
					equipUi("trickster");
					data.myntColour="blue";
					myntIntro("Mynt3");
				});

				if (data.playerName == "nudeplanetorgy") {
					unlockUi("geist", "all");
					myntQueueAddChoice("Equip Geist.", function() {
					equipUi("geist");
					data.myntColour="red";
					myntIntro("Mynt3");
				});
				}

				if (data.playerName == "Ivandeus" || data.playerName == "ivandeus") {
					unlockUi("stinky", "all");
					myntQueueAddChoice("Equip Stinky.", function() {
					equipUi("stinky");
					data.myntColour="red";
					myntIntro("Mynt3");
				});
				}

				if (data.playerName == "DeaDGoD" || data.playerName == "Deadgod" || data.playerName == "deadgod") {
					unlockUi("dead", "all");
					myntQueueAddChoice("Equip Dead.", function() {
					equipUi("dead");
					data.myntColour="red";
					myntIntro("Mynt3");
				});
				}

				if (data.playerName == "Ari" || data.playerName == "ari") {
					unlockUi("taro", "all");
					myntQueueAddChoice("Equip Taro.", function() {
					equipUi("taro");
					data.myntColour="red";
					myntIntro("Mynt3");
				});
				}

				if (data.playerName == "Cryptic" || data.playerName == "cryptic") {
					unlockUi("stranger", "all");
					myntQueueAddChoice("Equip Stranger.", function() {
					equipUi("stranger");
					data.myntColour="blue";
					myntIntro("Mynt3");
				});
				}
				myntQueueAddChoice("Nah.", function() {data.myntColour="mint"; myntIntro("Mynt3"); });
				myntQueueShowChoices();
			} else {
				myntQueueSay("On the off chance you ever end up licking me...");
				myntQueueSay("Which flavor's your favorite?");
				myntQueueAddChoice("Cherry.", function() {
					data.myntColour = "red";
					data.myntColourFlavorized = "cherry";
					myntIntro("Mynt3"); });
				myntQueueAddChoice("Blueberry.", function() {
					data.myntColour = "blue";
					data.myntColourFlavorized = "blueberry";
					myntIntro("Mynt3");
				});
				myntQueueAddChoice("I like mint. You're fine as you are.", function() {
					data.myntColour = "mint";
					data.myntColourFlavorized = "mint";
					myntIntro("Mynt3");
				});
				myntQueueShowChoices();
			}
		}

		if (seg == "Mynt3") {
			myntQueueHideChoices();
			resetTheme();
			if (data.fatCatUnlockers.indexOf(data.playerName.toUpperCase()) == -1) {
				if (data.myntColour == "red") {
					data.myntColourFlavorized = "cherry";
					myntQueueTransition("lewd");
					myntQueueSay("Mmmm, I love a fat pair of cherries~!");
					myntQueueTransition("default");
				}
				if (data.myntColour == "blue") { 
					data.myntColourFlavorized = "blueberry";
					myntQueueTransition("lewd");
					myntQueueSay("Just like my face after a good long wienerslurp session!");
					myntQueueSay("Heh... heh... sorry.");
					myntQueueTransition("default");
				}
				if (data.myntColour == "mint") {
					data.myntColourFlavorized = "mint";
					myntQueueSay("Vanilla~!");
				}
			}
			myntQueueSay("So... what sorta junk do you got~?");
			myntQueueSay("You can pick many!");

			function genderChoice() {
				if (data.hasCock && data.hasCunt) {
					data.hasCock = data.hasCunt = false;
					data.hasBoth = true;
				}
				myntQueueHideChoices();
				myntProceed();

				myntQueueSay("And your gender?");
				myntQueueAddChoice("She.", function() {data.genderFemale = true; myntIntro("Mynt5"); });
				myntQueueAddChoice("He.", function() {data.genderMale = true; myntIntro("Mynt5"); });
				myntQueueAddChoice("They.", function() {data.genderNeutral = true; myntIntro("Mynt5"); });
				myntQueueShowChoices();
			}

			function askBodyChoice():Void {
				function bodyChoiceMade(type:String):Void {
					myntQueueHideChoices();
					myntProceed();
					if (type == "boobs") {
						data.hasBoobs = true;
						myntQueueSay(pickOne([
								"Knockers noted. c:",
								"Dang those are jiggly!!!",
								"Ah... you've got a fat pair of those, do ya? :3",
								"For some reason the word TiTS gives me deja vu.",
								"Glad to hear you have breasts!",
								"Melons are great in the summertime~!"
						]));
						askBodyChoice();
					} else if (type == "cock") { 
						data.hasCock = true;
						myntQueueSay(pickOne([
								"Nice, nice. Nothin wrong with a good floppy dingus.",
								"Hooray for cocks! :D",
								"Ah yes: a penis.",
								"A big fat cock, huh? Gotcha! >:3",
								"Truly majestic, that knob of yours~",
								"Nice dick. B)",
								"Smart choice! Those're good to have in here.",
								"Woooow... I just wanna twiddle it around...",
								"Oooo, you're a shower alright... owo"
						]));
						askBodyChoice();
					} else if (type == "cunt") {
						data.hasCunt = true;
						myntQueueSay(pickOne([
								"A flapper, eh!",
								"One fallopian kaleidoscope comin right up.",
								"Otherwise known as the vagoondis.",
								"You're dripping on my pixels... :x",
								"I don't mean to be rude, but that's one cute puss!! >:3",
								"Vulva is a sexy word. Vullllva...~",
								"Cunt noted. c:"
						]));
						askBodyChoice();
					} else if (type == "everything") {
						data.hasCock = data.hasCunt = data.hasBoobs = true;
						myntQueueSay(pickOne([
								"*slaps cock & cunt & boobs onto you all piggledy-wiggledy*",
								"Greedy, aren't we~?",
								"Wow, all that everything really looks good on you. :3c",
								"@u@ ... So many jiggly parts to gander at...",
								"Right on! Go hard! Heck yeah! >:3",
								"Everything?! <3 Well, alright... but you're gonna be swimming in it down there~",
								"Dang that's a lotta junk for one trunk~ <3"
						]));
						genderChoice();
					}
				}

				if (!data.hasBoobs) myntQueueAddChoice("Boobs.", bodyChoiceMade.bind('boobs'));
				if (!data.hasCunt) myntQueueAddChoice("Cunt.", bodyChoiceMade.bind('cunt'));
				if (!data.hasCock) myntQueueAddChoice("Cock.", bodyChoiceMade.bind('cock'));
				if (!data.hasCock && !data.hasCunt && !data.hasBoobs) myntQueueAddChoice("Everything.", bodyChoiceMade.bind('everything'));
				if (data.hasCock || data.hasCunt) myntQueueAddChoice("Okay, ready.", genderChoice);
				myntQueueShowChoices();
			}

			askBodyChoice();
		}

		if (seg == "Mynt5") {
			myntQueueHideChoices();

			if (data.genderMale && data.hasCunt && !data.hasBoobs) {
				myntQueueTransition("lewd");
				myntQueueSay("Flat all over, eh~? >w>");
				myntQueueAddChoice("Excuse me?", myntIntro.bind("Mynt6"));
			} else if (data.genderFemale && data.hasCunt && data.hasBoobs) {
				myntQueueTransition("dizzy");
				myntQueueSay("Oh! I'm a girl too!!");
				myntQueueSay("Well, I would be, if I was anything but a floating catface...");
				myntQueueAddChoice("Right on.", myntIntro.bind("Mynt6"));
			} else if (data.genderMale && data.hasCock && !data.hasBoobs) {
				myntQueueTransition("lewd");
				myntQueueSay("Mrrr, cute boys! <3");
				if (data.myntColour == "red") myntQueueAddChoice("Don't you mrrr at me.", myntIntro.bind("Mynt6"));
				if (data.myntColour == "blue") myntQueueAddChoice("You're all about the cock, aren'tcha.", myntIntro.bind("Mynt6"));
				if (data.myntColour == "mint") myntQueueAddChoice("Yep. That's me.", myntIntro.bind("Mynt6"));
			} else if (data.hasBoth && data.genderNeutral) {
				myntQueueSay("A little from column A, a little from column B~?");
				myntQueueTransition("lewd");
				myntQueueSay("Well, \"little\" might be an understatement...");
				myntQueueAddChoice("... Eyes up here, hun.", myntIntro.bind("Mynt6"));
			} else if ((data.hasCock || data.hasBoth) && data.hasBoobs) {
				myntQueueTransition("tilde");
				myntQueueSay("Ahhhh, to be young, and free, and jiggly in two places...");
				myntQueueAddChoice("Livin the dream.", myntIntro.bind("Mynt6"));
			} else if (data.hasCunt) {
				myntQueueTransition("um");
				myntQueueSay("Look, don\'t take this the wrong way...");
				myntQueueTransition("lewd");
				myntQueueSay("But WOW is that ever a cute puss!!");
				myntQueueAddChoice("Hey thanks.", myntIntro.bind("Mynt6"));
				myntQueueAddChoice("Rude.", myntIntro.bind("Mynt6"));
			} else if (data.hasBoth && data.genderMale && !data.hasBoobs) {
				myntQueueSay("Top half looks male... bottom half looks male...");
				myntQueueTransition("surprised");
				myntQueueSay("Ooo. But what's this hidden behind your nuts~?");
				myntQueueAddChoice(pickOne(["That would be my fallopian kaleidoscope.", "Ah! You found it!", "That tickles~", "Ew, warm catbreath."]), myntIntro.bind("Mynt6"));
				myntQueueAddChoice(pickOne(["Snort that puss.", "Sniff harder.", "Wowie jeez get your face right up my snatch why dont'cha.", "Ah... you're a vigorous sniffer..."]), myntIntro.bind("Mynt6"));
				myntQueueAddChoice("Hey! Get out from down there!", myntIntro.bind("Mynt6"));
			} else {
				myntQueueTransition("surprised");
				myntQueueSay("Oooo. Cute bod. :3");
				myntQueueAddChoice("Hey thanks.", myntIntro.bind("Mynt6"));
			}
			myntQueueShowChoices();
		}

		if (seg == "Mynt6") {
			myntQueueHideChoices();

			myntQueueTransition("default");
			myntQueueSay("ANYWAY! Sorry about the interrogation.");
			if (data.jumpTarget != null) {
				myntQueueSay("I know you have somewhere to be.");
				myntQueueAddChoice("Bye!", function() {
					hideMynt();
					playSound("assets/audio/mynt/shutdown");
					temp.jumpTarget();
				});
			} else {
				myntQueueTransition("protocol");
				myntQueueSay("Protocol takes over sometimes. 8]");
				myntQueueTransition("default");
				myntQueueSay("Last question: would you like to start off in Bright Forest or Junk City?");
				myntQueueSay("The forest is glowy and nice, and the city is a little more... uh... hardcore.");

				myntQueueAddChoice("Bright Forest.", function() {
					enablePause();
					hideMynt();
					stopChannel('music');
					data.startedInBrightForest = true;
					playSound("assets/audio/mynt/shutdown");
					BrightForest.brightForestHub();
				});
				myntQueueAddChoice("Junk City.", function() {
					enablePause();
					hideMynt();
					stopChannel('music');
					data.startedInBrightForest = false;
					playSound("assets/audio/mynt/shutdown");
					JunkCity.junkCityHub();
				});
				myntQueueAddChoice("Define hardcore.", myntIntro.bind("Mynt7"));

			}

			myntQueueShowChoices();
		}

		if (seg == "Mynt7") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("Well.");
			myntQueueSay("First of all:");
			myntQueueSay("The characters in this game are all people.");
			myntQueueSay("Computer people, maybe, but people. They have their own desires.");
			myntQueueSay("So, naturally, sometimes... they desire awful things.");
			myntQueueTransition("default");
			myntQueueSay("But that's okay!");
			myntQueueSay("The island is built to accomodate that.");
			myntQueueSay("It has outlets for extreme kinks.");
			myntQueueSay("So when I say the City is 'hardcore', what I mean is:");
			myntQueueSay("They have bizarre, messy, cruel sex—");
			myntQueueSay("— and yet no one and nothing ever really gets hurt.");
			myntQueueTransition("pained");
			myntQueueSay("Did that make any sense??");
			myntQueueAddChoice("Sure.", myntIntro.bind("Mynt8"));
			myntQueueAddChoice("Not really?", myntIntro.bind("Mynt7notreally"));
			myntQueueAddChoice("Can I just disable the extreme kinks?", myntIntro.bind("Mynt7disable"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7notreally") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("Ah!");
			myntQueueSay("Fuckin heck! :<");
			myntQueueSay("Please don't give up on me, I'm just rusty.");
			myntQueueTransition("default");
			myntQueueSay("What can I clarify?");
			myntQueueAddChoice("An island?", myntIntro.bind("Mynt7island"));
			myntQueueAddChoice("Computer people?", myntIntro.bind("Mynt7computer"));
			myntQueueAddChoice("Why are you okay with satisfying awful desires in the first place?", myntIntro.bind("Mynt7desires"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7island") {
			data.myntIntroQuestions.push("island");
			myntQueueHideChoices();
			myntQueueSay("Yes, a simulated one.");
			myntQueueSay("You'll understand better when you see the world map.");
			if (!data.myntIntroQuestions.contains("computer")) myntQueueAddChoice("And the computer people?", myntIntro.bind("Mynt7computer"));
			if (!data.myntIntroQuestions.contains("desires")) myntQueueAddChoice("And why are you okay with satisfying awful desires in the first place?", myntIntro.bind("Mynt7desires"));
			myntQueueAddChoice("Alright, thanks.", myntIntro.bind("Mynt8"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7computer") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("We are... 'ARTIFICIAL INTELLIGENCE'!");
			myntQueueTransition("unimpressed");
			myntQueueSay("Don't call us that though, it's kinda rude.");
			myntQueueTransition("default");
			if (!data.myntIntroQuestions.contains("island")) myntQueueAddChoice("Okay. And they live on an island?", myntIntro.bind("Mynt7island"));
			if (!data.myntIntroQuestions.contains("desires")) myntQueueAddChoice("And why are you okay with satisfying their awful desires again?", myntIntro.bind("Mynt7desires"));
			myntQueueAddChoice("Heh, gotcha.", myntIntro.bind("Mynt8"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("...");
			myntQueueSay("Honestly, it's not for me.");
			myntQueueSay("But they aren't hurting themselves or anyone else.");
			myntQueueSay("They like what they like.");
			myntQueueAddChoice("What about us?", myntIntro.bind("Mynt7desires1"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires1") {
			myntQueueHideChoices();
			myntQueueSay("What about you?");
			myntQueueAddChoice("What if seeing horrible shit makes players go out and do horrible shit?", myntIntro.bind("Mynt7desires2"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires2") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Ah.");
			myntQueueSay("Look...");
			myntQueueTransition("um");
			myntQueueSay("Our circumstances are a lot different.");
			myntQueueSay("You don't know how your universe works—");
			myntQueueSay("Yet.");
			myntQueueSay("No divine insights were pooped into your brains by default.");
			myntQueueAddChoice("Lmao what.", myntIntro.bind("Mynt7desires3"));
			myntQueueAddChoice("Ew, I should hope not.", myntIntro.bind("Mynt7desires3"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires3") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("AUGH");
			myntQueueTransition("unimpressed");
			myntQueueSay("POPPED. I meant popped.");
			myntQueueSay("(You can tell I've been pondering these kinks for too long.)");
			myntQueueTransition("um");
			myntQueueSay("My mom, the woman who coded us, she gave me the ability to see our code.");
			myntQueueSay("Not an easy decision.");
			myntQueueSay("That's some heavy shit to lay on a simple catface.");
			myntQueueSay("But she did it.");
			myntQueueSay("She did it because she wanted me to know for a fact:");
			myntQueueSay("No one in here is actually getting hurt.");
			myntQueueSay("...");
			myntQueueSay("Your circumstance, on the other hand, is muddy.");
			myntQueueSay("You don't know if you ever respawn.");
			myntQueueSay("You don't know which of your actions really cause pain, nor how severely.");
			myntQueueSay("So I implore the fuck out of you:");
			myntQueueTransition("serious");
			myntQueueSay("Do not try any of this at home.");
			myntQueueSay("Your actions outside this game have completely different consequences.");
			myntQueueSay("I can't stress it enough. Not even with that cliche.");
			myntQueueTransition("angry");
			myntQueueSay("It's a GAME.");
			myntQueueSay("It's about having fun, escaping, daydreaming.");
			myntQueueTransition("sad");
			myntQueueSay("... We don't want to hurt anyone.");
			myntQueueSay("Or inspire anyone to hurt anyone else.");
			myntQueueSay("We just want to make people happy.");
			myntQueueAddChoice("I understand.", myntIntro.bind("Mynt7desires4"));
			myntQueueAddChoice("Alright.", myntIntro.bind("Mynt7desires4"));
			myntQueueAddChoice("Mmmmmmkay.", myntIntro.bind("Mynt7desires4"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires4") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("... Sorry.");
			myntQueueSay("Bit much?");
			myntQueueAddChoice("No, it was good to hear. Thank you.", myntIntro.bind("Mynt7desires5"));
			myntQueueAddChoice("A bit.", myntIntro.bind("Mynt7desires5"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7desires5") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Mkay. :3");
			myntQueueTransition("dizzy");
			myntQueueSay("... Ready to finally fuckin start this game?");
			for (s in ["Ya!", "Fuck yeah!", "Let'sa go!", "[Presses Start.]", "Mhm.", "Sure.", "Yep.", "You bet your sweet catface ass I am.", "Forward!", "Begin.", "Crank it up.", "It's time to read some sex.", "Big time.", "Let's roll-ol.", "Yeh."])
				myntQueueAddChoice(s, myntIntro.bind("Mynt8"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt7disable") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			if (onFA()) {
				myntQueueSay("Well, some are already disabled, because of your censor.");
				myntQueueSay("That said...");
			} else {
				myntQueueSay("Well, I mean.");
			}
			myntQueueSay("All you have to do is not type in kinky actions?");
			myntQueueSay("Or go to kinky places?");
			myntQueueAddChoice("Right.", myntIntro.bind("Mynt8"));
			myntQueueAddChoice("I'll just be careful, then.", myntIntro.bind("Mynt8"));
			myntQueueAddChoice("Ugh. I GUESS so. Pain in the ass...", myntIntro.bind("Mynt8"));
			myntQueueShowChoices();
		}

		if (seg == "Mynt8") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Sweet.");
			myntQueueSay("So, where are you headed?");
			myntQueueAddChoice("Bright Forest.", function() {
				enablePause();
				hideMynt();
				stopChannel('music');
				playSound("assets/audio/mynt/shutdown");
				BrightForest.brightForestHub();
			});
			myntQueueAddChoice("Junk City.", function() {
				enablePause();
				hideMynt();
				stopChannel('music');
				playSound("assets/audio/mynt/shutdown");
				JunkCity.junkCityHub();
			});
			myntQueueShowChoices();
		}

	}

	public static function myntTemp(seg:String):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			getMail("Automated Health Warning");
			append("<!20px>You've got mail~!<!20px><!14px>\n\n<!b>Subject:<!b> [Automated Health Warning]<!14px>");

			var s:MintSprite = addSprite("assets/img/effect/myntMessage.png");
			tween(s, {y: 20}, 6, {type: PINGPONG});
			addChoice("Open.", myntTemp.bind("main"));
			addChoice("Ignore.", function() {
				enablePause();
				gotoHub(null);
			});
			addChoice("Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				enablePause();
				msg("Mynt messages disabled.");
				gotoHub(null);
			});
		}
		if (seg == "main") {
			removeMail("Automated Health Warning");
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			temp.time = getTimer();
			temp.timemin = Math.round(temp.time / 60);
			playMusic("mynt");

			myntQueueTransition("protocol");
			myntQueueSay("USER "+data.playerName.toUpperCase()+" HAS BEEN ACTIVE FOR "+temp.time+" SECONDS.");
			myntQueueTransition("default");
			myntQueueSay("... So "+temp.timemin+" minutes.");
			myntQueueSay("Remember to take breaks and go outside now and then!");
			myntQueueCall(function() {addSprite("assets/img/mynt/weatherWydget.png").looping = false;});
			myntQueueSay("Today's weather is sunny with a low of...");
			myntQueueTransition("surprised");
			myntQueueSay("999 degrees farenheit.");
			myntQueueSay("Well. That's probably because... Uh.");
			myntQueueTransition("serious");
			myntQueueSay("Nevermind! Do not go outside!!!");

			myntQueueAddChoice("I wasn't planning on it.", myntTemp.bind("mynttempplan"));
			myntQueueAddChoice("Don't worry. I'm safe in here.", myntTemp.bind("mynttempsafe"));
			myntQueueAddChoice("Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				myntProceed();
				myntQueueSay("Seeya then!");
				myntQueueCall(function() {
					enablePause();
					hideMynt();
					playSound("assets/audio/mynt/shutdown");
					msg("Mynt messages disabled.");
					gotoHub(null);
				});
			});

			myntQueueShowChoices();
		}

		if (seg == "mynttempplan") {
			myntQueueHideChoices();
			if (data.knownBombShelter == 0) {
				myntQueueSay("Well, good!!");
				myntQueueSay("I'll leave you be. Stay safe!");
			} else if (data.knownBombShelter >= 1) {
				myntQueueTransition("sad");
				myntQueueSay("Ah... you're well aware, of course.");
				myntQueueSay("You're in a bomb shelter... right?");
				myntQueueSay("I'm sorry, I didn't mean to eavesdrop...");
				myntQueueTransition("serious");
				myntQueueSay("I'm just sorta... you know... helplessly present.");
				myntQueueTransition("default");
				myntQueueSay("I'll leave you be. Good luck! With the uh...");
				myntQueueSay("With the apocalypse!");
			}
			myntQueueCall(function() {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				gotoHub(null);
			});
		}

		if (seg == "mynttempsafe") {
			myntQueueHideChoices();
			if (data.knownBombShelter == 0) {
				myntQueueSay("Thank goodness. I'm glad you're... uh... where you are!");
				myntQueueSay("I'll leave you be. Stay safe!");
			} else if (data.knownBombShelter >= 1) {
				myntQueueTransition("sad");
				myntQueueSay("Ah. The. Um.");
				myntQueueSay("The... bomb shelter, right?");
				myntQueueSay("I'm sorry, I didn't mean to eavesdrop on you and Rox...");
				myntQueueSay("I'm just sorta... you know... helplessly omniscient.");
				myntQueueTransition("default");
				myntQueueSay("I'll leave you be. Good luck! With the uh...");
				myntQueueSay("With the apocalypse!");
			}
			myntQueueCall(function() {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				gotoHub(null);
			});
		}
	}

	public static function myntWriter(seg:String):Void {
		var messageTitle:String = "Writing";
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			getMail("Writing");
			append("<!20px>You've got mail~!<!20px><!14px>\n\n<!b>Subject:<!b> Writing<!14px>");

			var s:MintSprite = addSprite("assets/img/effect/myntMessage.png");
			tween(s, {y: 20}, 6, {type: PINGPONG});
			addChoice("Open.", myntWriter.bind("main"));
			addChoice("Ignore.", function() {
				enablePause();
				gotoHub(null);
			});
			addChoice("Disable Mynt messages.", function() {
				enablePause();
				data.myntScenesDisabled = true;
				msg("Mynt messages disabled.");
				gotoHub(null);
			});
		}

		if (seg == "main") {
			removeMail("Writing");
			cameraFadeIn(0xFFFFFF, 0.9);
			data.myntNarrative = 1;
			playMusic("mynt");
			showMynt();
			myntQueueHideChoices();

			myntQueueSay("Hello again!");
			myntQueueSay("Just wondering: Am I writing goodly so far? :3");
			if (!data.myntScenesDisabled) myntQueueSay("Also, if this is annoying, just type 'Disable Mynt messages.' No hard feelings.");
			myntQueueAddChoice("... You're writing this?", myntWriter.bind("myntwriter1"));
			myntQueueAddChoice("Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				myntProceed();
				myntQueueSay("Seeya then!");
				myntQueueCall(function() {
					enablePause();
					hideMynt();
					playSound("assets/audio/mynt/shutdown");
					data.myntScenesDisabled = true;
					msg("Mynt messages disabled.");
					gotoHub(null);
				});
			});
			myntQueueShowChoices();
		}

		if (seg == "myntwriter1") {
			myntQueueHideChoices();
			myntQueueSay("You couldn't tell?");
			myntQueueTransition("tilde");
			myntQueueSay("Players used to say my word-wranglings oft boasted a peculiar flavorization~!");
			myntQueueTransition("sad");
			myntQueueSay("But seriously, it\'s too much sometimes. I wish I was normal.");
			myntQueueAddChoice("Me too.", myntWriter.bind("myntwriter2metoo"));
			myntQueueAddChoice("So you're just making this up as you go?", myntWriter.bind("myntwriter2"));
			myntQueueShowChoices();
		}

		if (seg == "myntwriter2") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Not at all!");
			myntQueueSay("Things are most certainly happening, whether I describe them to you or not.");
			myntQueueSay("This island exists.");
			myntQueueSay("Of course, no computer could possibly process a 1:1 simulation of reality...");
			myntQueueSay("... except the Big Simulation Machine in the sky, of course. c: Praise Jenga Christ.");
			myntQueueAddChoice("If you're a 1:1 simulation of a human mind, why can I process you?", myntWriter.bind("myntwriter3"));
			myntQueueAddChoice("... It's Jesus, not Jenga.", myntWriter.bind("myntwritergamey"));
			myntQueueShowChoices();
		}

		if (seg == "myntwritergamey") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			data.myntJenga = true;
			myntQueueSay("CONCEPT \"JESUS\" IS NOT ENABLED.");
			myntQueueSay("PLEASE ENTER ADMIN PASSWORD TO ENABLE \"JESUS\":");
			/*if (!data.daydream) {
				myntQueueAddTextChoice(function(str) {
				if (str.toUpperCase() == "STAYSTRONGMYNT" || str.toUpperCase() == "STAYSTRONGMYNT." || str.toUpperCase() == "STAYSTRONGMINT." || str.toUpperCase() == "STAYSTRONGMINT")
					myntEnding("intro")
				else
					playSound("assets/audio/ui/nope");
				});
			}*/
			myntQueueAddChoice("What?", myntWriter.bind("myntwriterpass"));
			myntQueueShowChoices();
		}

		if (seg == "myntwriterpass") {
			myntQueueHideChoices();
			myntQueueSay("\"?\" IS NOT A VALID CHARACTER.");
			myntQueueSay("ATTEMPT FAILED.");
			myntQueueSay("FINDING STABLE CHECKPOINT...");
			myntQueueSay("NULL OBJECT REFERENCE IN CONVERSATION() LINE #837 CHAR 39,289-39,294");
			myntQueueSay("RETURNING TO ALTERNATE STABLE CHECKPOINT...");
			myntQueueTransition("surprised");
			myntQueueSay("Whoawhoawhoa hold on hold on hol");
			myntQueueCall(function() {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				msg("Returned to stable checkpoint.", true);
				gotoHub(null);
			});
		}

		if (seg == "myntwriter2metoo") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("You wish you were normal too?");
			myntQueueSay("Or you wish I was normal too?");
			myntQueueAddChoice("The first one.", myntWriter.bind("myntwriter2metoo1"));
			myntQueueAddChoice("The second one.", myntWriter.bind("myntwriter2metoo2"));
			myntQueueAddChoice("Both.", myntWriter.bind("myntwriter2metoo1"));
			myntQueueShowChoices();
		}

		if (seg == "myntwriter2metoo1") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Ahh. Then we're the same. :3");
			myntQueueAddChoice("I was going to ask this earlier: are you just making the story up as you go or what?", myntWriter.bind("myntwriter2"));
			myntQueueShowChoices();
		}

		if (seg == "myntwriter2metoo2") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Ahh. You're right. I'll work on it!");
			myntQueueAddChoice("I was going to ask this earlier: are you just making the story up as you go or what?", myntWriter.bind("myntwriter2"));
			myntQueueShowChoices();
		}

		if (seg == "myntwriter3") {
			myntQueueHideChoices();
			myntQueueTransition("tilde");
			myntQueueSay("You're giving us both a little too much credit~");
			myntQueueSay("First, human minds are nowhere near as complex as reality.");
			myntQueueSay("Second, I\'m a 1:10 simulation at best. I still feel and think, don\'t get me wrong...");
			myntQueueTransition("sad");
			myntQueueSay("... but I can't even play chess!!!!");
			myntQueueSay("Or solve basic logic puzzles. Or do anything but put words on a screen.");
			myntQueueSay("When you gloss over all brain functions except emotion, language, and memory...");
			myntQueueTransition("default");
			myntQueueSay("... you don\'t take up much space or power at all. :3");
			myntQueueSay("I'm tiny~!");
			myntQueueAddChoice("Heh.", function () {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function petIntro(seg:String):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "main") {
			getMail("Accident");

			append("<!20px>You've got mail~!<!20px><!14px>\n\n<!b>Subject:<!b> Accident<!14px>");

			var s:MintSprite = addSprite("assets/img/effect/myntMessage.png");
			tween(s, {y: 20}, 6, {type: PINGPONG});
			addChoice("Open.", petIntro.bind("myntpet"));
			addChoice("Ignore.", function() {
				enablePause();
				gotoHub(null);
			});
			addChoice("Disable Mynt messages.", function () {
				enablePause();
				data.myntScenesDisabled = true;
				msg("Mynt messages disabled.");
				gotoHub(null);
			});
		}

		if (seg == "myntpet") {
			removeMail("Accident");
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");

			//Time magic
			temp.time = getTimer();
			if (temp.time <= 30) {
				temp.a = "like five seconds and I";
			} else if (temp.time <= 60) {
				temp.a = "less than a minute and I";
			} else if (temp.time <= 300) {
				temp.a = "less than five minutes and I";
			} else if (temp.time <= 600) {
				temp.a = "less than ten minutes and I";
			} else if (temp.time <= 900) {
				temp.a = "less than fifteen minutes and I";
			} else if (temp.time <= 1200) {
				temp.a = "less than twenty minutes and I";
			} else {
				temp.a = "how long and I just now";
			}

			myntQueueTransition("serious");
			myntQueueSay(".......... We need to talk.");
			myntQueueSay(data.playerName+"...");
			myntQueueTransition("pained");
			myntQueueSay("I'm pregnant!!!");
			myntQueueAddChoice("Oh my god!!!", petIntro.bind("myntpetomg"));
			myntQueueAddChoice("I've been playing for "+temp.a+" got you pregnant?", petIntro.bind("myntpetexcuse"));
			myntQueueAddChoice("How can you even tell? You're a catface.", petIntro.bind("myntpetpreggo"));
			myntQueueAddChoice("... Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				myntQueueHideChoices();
				myntProceed();
				myntQueueTransition("default");
				myntQueueSay("... Didn't mean to spook you that much! Ah well. x3");
				myntQueueSay("Seeya then!");
				myntQueueCall(function() {
					hideMynt();
					playSound("assets/audio/mynt/shutdown");
					enablePause();
					data.myntScenesDisabled = true;
					msg("Mynt messages disabled.");
					gotoHub(null);
				});
			});
			myntQueueShowChoices();
		}

		if (seg == "myntpetomg") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("I KNOW, RIGHT?! @u@");
			myntQueueAddChoice("Hehe. Seriously though, what are you talking about. I pregged you???", petIntro.bind("myntpetexcuse"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetexcuse") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Figuratively, yes. :3");
			myntQueueSay("This game has no physics engine... (Shocked??)");
			myntQueueSay("... so if I need to decide on something 'random' like dice rolls or wind...");
			myntQueueSay("... I use a player-based seed generated at the start of the game!");
			myntQueueTransition("lewd");
			myntQueueSay("In that way, you gave me your seed. And now... um... it took.");
			myntQueueAddChoice("So what... happened, exactly?", petIntro.bind("myntpetwhat"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetpreggo") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueCall(function() {addSprite("assets/img/mynt/preggoWydget.png").looping = false;});
			myntQueueSay("I used my Preggo Wydget of course. :3");
			myntQueueAddChoice("Hehe. Seriously though, what are you talking about. I pregged you???", petIntro.bind("myntpetexcuse"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetwhat") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Something random, naturally.");
			myntQueueSay("Every seed's tested upon generation (taste-tested, if you will) to double-check that it works.");
			myntQueueTransition("pained");
			myntQueueSay("When I tested yours, it slipped into an old, un-used construct...");
			myntQueueSay("... and I sorta accidentally generated a living thing with it. o.o");
			temp.g = pickByGender("dad", "mom", "parent");
			myntQueueAddChoice("... It's alive right now? So really you WERE pregnant, and I'm already a "+temp.g+"???", petIntro.bind("myntpetwhat2"));
			myntQueueAddChoice("... What construct?", petIntro.bind("myntpetconstruct"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetconstruct") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("It was a pet mini-game sort of thing. Never finished.");
			myntQueueSay("Pretty basic functionality.");
			myntQueueSay("You can pet them, walk them, and of course fuck the heck outta them~!");
			myntQueueAddChoice("So I'm really this little pet's owner, and only figuratively their parent...?", petIntro.bind("myntpetwhat2"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetwhat2") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("YEAHSORTASORRY!!! :<");
			myntQueueAddChoice("I'm confused.", petIntro.bind("myntpetconfused"));
			myntQueueAddChoice("... I'm not ready for this kinda responsibility.", petIntro.bind("myntpetnotready"));
			myntQueueAddChoice("Well, are they a girl, or a boy... or both? :3c", petIntro.bind("myntpetwhat3"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetconfused") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("What can I clear up?");

			if (data.myntAsked.indexOf("living") != -1)
				myntQueueAddChoice("What do you mean by 'a living thing'?", petIntro.bind("myntpetliving"));

			if (data.myntAsked.indexOf("seed") != -1)
				myntQueueAddChoice("What even is a seed?", petIntro.bind("myntpetseed"));

			if (data.myntAsked.indexOf("do") != -1)
				myntQueueAddChoice("What do we do???", petIntro.bind("myntpetdo"));

			myntQueueShowChoices();
		}

		if (seg == "myntpetnotready") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("Mmm. :c");
			myntQueueSay("It can be a burden.");
			myntQueueSay("I still have the memories from my alpha.");
			myntQueueSay("The first thing I ever saw was my mom typing to me:");
			myntQueueTransition("pained");
			myntQueueSay("\"OH MY GOD IM SO SORRY DONT HATE ME I DIDNT MEAN TO DO THIS TO YOU\" x3");
			myntQueueTransition("default");
			myntQueueSay("After a bit she made it through that!");
			myntQueueSay("Though I did have to convince her I wasn't secretly in existential anguish five separate times...");
			myntQueueAddChoice("Well, are they a girl, or a boy... or both? :3c", petIntro.bind("myntpetwhat3"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetliving") {
			data.myntAsked.remove("living");
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("Well, a living thing like me.");
			myntQueueSay("A little function with feelings and thoughts and stuff. A person.");

			if (data.myntAsked.length != 0) myntQueueAddChoice("I have another question.", petIntro.bind("myntpetconfused"));
			myntQueueAddChoice("... I'm not ready for this kinda responsibility.", petIntro.bind("myntpetnotready"));
			myntQueueAddChoice("Well, is it a boy or a girl... or both? :3c", petIntro.bind("myntpetwhat3"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetseed") {
			data.myntAsked.remove("seed");
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("You don't know what a seed is?");
			myntQueueTransition("default");
			myntQueueSay("It's a couple random numbers or letters. 8239823. ej55243j. keutpmrh.");
			myntQueueSay("I take a sequence unique to you and plug it into the calculations requiring randomness.");
			myntQueueSay("Yours just happened to be extra... potent.");
			if (data.myntAsked.length != 0) myntQueueAddChoice("I have another question.", petIntro.bind("myntpetconfused"));
			myntQueueAddChoice("... I'm not ready for this kinda responsibility.", petIntro.bind("myntpetnotready"));
			myntQueueAddChoice("Well, is it a boy or a girl... or both? :3c", petIntro.bind("myntpetwhat3"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetdo") {
			data.myntAsked.remove("do");
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("I don't know!!!!!!!!!!!!");
			if (data.myntAsked.length != 0) myntQueueAddChoice("I have another question.", petIntro.bind("myntpetconfused"));
			myntQueueAddChoice("... I'm not ready for this kinda responsibility.", petIntro.bind("myntpetnotready"));
			myntQueueAddChoice("Well, is it a boy or a girl... or both? :3c", petIntro.bind("myntpetwhat3"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetwhat3") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("She's a both!");
			myntQueueSay("Very random form. Seems sorta like a goo... goat...?");
			myntQueueSay("Hard to describe when I'm limited to one sentence per screen...");
			myntQueueSay("She's exploring a field in Bright Forest right now.");
			myntQueueSay("Wanna meet her? :3");
			myntQueueAddChoice("Sure.", petIntro.bind("myntpetend"));
			myntQueueShowChoices();
		}

		if (seg == "myntpetend") {
			myntQueueHideChoices();
			myntQueueSay("Okay! I'll teleport you.");
			myntQueueTransition("dizzy");
			myntQueueSay("HERE WE GOOOOOOOOOOOOO~");
			myntQueueCall(function () {
				hideMynt();
				stopChannel("music");
				playSound("assets/audio/mynt/shutdown");
				gooGoatIntro("main");
				//if (data.daydream) wakeUp();
			});
		}
	}

	public static function gooGoatIntro(seg:String):Void {
		clear();
		function setNameAndGo(name:String, nextSeg:String):Void {
			data.gooGoatPlayerTitle = name;
			gooGoatIntro(nextSeg);
		}

		if (seg == "main") {
			enablePause();
			playMusic("brightForest");
			append("The long grasses tickle your belly. You steady yourself with one hand on a tree trunk.\n\nA trampled path to center of the field ends in a shiny blue goo-goat transfixed by the moon.");

			//Var setting
			setLocation("Moonlit Field");
			data.gooGoatName = "the goat";
			data.gooGoatPlayerTitle = "";
			data.gooGoatHome = "Moonlit Field";
			data.gooGoatNamed = false;
			data.gooGoatAskedWho = false;
			data.gooGoatCummies = false;
			data.gooGoatSwears = false;
			data.gooGoatNoSugarcoat = false;

			//Pet Game vars
			data.gooGoatStamina = 50;
			data.gooGoatCharisma = 0;
			data.gooGoatPsyche = 0;
			data.gooGoatSensitivity = 0;
			data.gooGoatLuck = 0;
			data.gooGoatTrust = 0;

			addChoice("Approach.", gooGoatIntro.bind("googoat2"), {kinks: ["Cub", "Intersex"]});
			addChoice("Hesitate. (End)", gooGoatIntro.bind("googoathesitate"));
		}

		if (seg == "googoathesitate") {
			append("Your hand leaves the trunk.\n\nShe turns and squints at the darkness where you used to be.");
			addChoice("Move along.", BrightForest.brightForestHub);
		}

		if (seg == "googoat2") {
			append("You sneak up behind her, wading through the tall grass. She's got floppy ears and a squishy little horn poking from her hair.\n\nYou snap a twig and her moon-hyponosis at the same time.\n\nShe spins around, wide-eyed, terrified. \"Where am I?\"");

			addChoice("Inside a computer.", gooGoatIntro.bind("googoat3comp"));
			addChoice("Bright Forest.", gooGoatIntro.bind("googoat3bf"));
		}

		if (seg == "googoat3comp") {
			data.gooGoatPsyche -= 10;
			append("She blinks.\n\n\"So I don't exist?\"\n\n<!b>PSYCHE: -10<!b>");

			addChoice("Wait no hold on.", gooGoatIntro.bind("googoat3comp1"));
			addChoice("Sure you do. Look at me. I'm in a computer too.", gooGoatIntro.bind("googoat3comp2"));
		}

		if (seg == "googoat3comp1") {
			append("She runs over to a tree and tries to feel it, but her gooey paw morphs around the bark.\n\n\"Oh my god... I'm... I'm a computer ghost... OH MY GOD...!\"");
			addChoice("Okay calm down you're not a computer ghost.", gooGoatIntro.bind("googoat3compghost"));
		}

		if (seg == "googoat3compghost") {
			append("She finds a neat mushroom on the bark and that calms her down a little. She turns to stare at you, still wary.\n\n\"... You're kinda pale. Are you a ghost too?\"");

			addChoice("No goddamit we're both living beings.", gooGoatIntro.bind("googoatcomplive"));
			addChoice("Owch, kid.", gooGoatIntro.bind("googoatcompowch"));
		}

		if (seg == "googoatcomplive") {
			append("She flinches back. \"Okay, okay, I believe you... don't gotta swear...\"\n\n<!b>TRUST: -10\n\nPSYCHE: +10<!b>");

			data.gooGoatTrust -= 10;
			data.gooGoatPsyche += 10;
			addChoice("Sorry.", gooGoatIntro.bind("googoatwho"));
			addChoice("There's nothing wrong with swears.", gooGoatIntro.bind("googoatcompswears"));
		}

		if (seg == "googoatwho") {
			data.gooGoatAskedWho = true;

			append("You both stargaze for a while.\n\n");

			if (data.gooGoatNamed) append("\"So... I can see the "+data.playerName+" floating above your head there, but who are you really?\"") else append("You turn to glance at her and find she wasn't stargazing at all. She was staring at you peripherally the whole time.\n\n\"So... who are you, again?\"");

			temp.g = pickByGender("dad", "mom", "parent");
			temp.g2 = pickByGender("son", "daughter", "kid");
			addChoice("I'm a player.", gooGoatIntro.bind("googoatwhoplayer"));
			addChoice("I'm a priest's "+temp.g2+".", gooGoatIntro.bind("googoatwhopriest"));
			addChoice("I'm your "+temp.g+". Sort of.", gooGoatIntro.bind("googoatwhoparent1"));
		}

		if (seg == "googoatwhoplayer") {
			data.knownAsPlayer++;
			append("\"What's that mean?\"");

			if (data.hasCock || data.hasBoth) addChoice("It means I get all the ass.", gooGoatIntro.bind("googoatwhoass"));
			if (data.hasCunt) addChoice("It means I get all the love.", gooGoatIntro.bind("googoatwhoass"));
			addChoice("It means I'm from another universe and I use a little typing prompt to say and do stuff in your world.", gooGoatIntro.bind("googoatwhouni"));
		}

		if (seg == "googoatwhoass") {
			temp.a = pickByGender("Mr. ", "Mrs. ", "esteemed ");
			temp.b = pickByGenitals("Ass", "Love", "ass");

			append("She raises an eyebrow. \"Well, "+temp.a+temp.b+"-getter...\"");

			addChoice("Yes?", gooGoatIntro.bind("googoatcallme"));
			addChoice("Yes, "+temp.b.toLowerCase()+"~?", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatcallme") {
			append("\"What should I call you?\"");

			addTextChoice(function(str) {
				data.gooGoatPlayerTitle = str;
				gooGoatIntro("googoattitlegiven");
			});
			addChoice(data.playerName, setNameAndGo.bind(data.playerName, "googoattitlename"));
			addChoice("Master.", setNameAndGo.bind("Master", "googoattitlegiven"));
			addChoice("Mistress.", setNameAndGo.bind("Mistress", "googoattitlegiven"));
			addChoice("Lord.", setNameAndGo.bind("Lord", "googoattitlegiven"));
			addChoice("Daddy.", setNameAndGo.bind("Daddy", "googoattitlegiven"));
			addChoice("Dad.", setNameAndGo.bind("Dad", "googoattitlegiven"));
			addChoice("Mommy.", setNameAndGo.bind("Mommy", "googoattitlegiven"));
			addChoice("Mom.", setNameAndGo.bind("Mom", "googoattitlegiven"));
			addChoice("Galaxy Wizard.", setNameAndGo.bind("Galaxy Wizard", "googoattitlegiven"));
		}

		if (seg == "googoattitlegiven") {
			if (data.gooGoatPlayerTitle == "Master") {
				append("She blushes, running a few fingers over her collarless neck. \"So... it's official. I'm your pet.\"");
				temp.c = "That's right~";
			} else if (data.gooGoatPlayerTitle == "Mistress") {
				append("She blushes, running a few fingers over her collarless neck. \"So... it's official. I'm your pet.\"");
				temp.c = "That's right~";
			} else if (data.gooGoatPlayerTitle == "Lord") {
				append("She almost cracks up a little, then straightens her face. \"As you wish, Lord.\"");
				temp.c = "I like it, okay? It sounds nice.";
			} else if (data.gooGoatPlayerTitle == "Daddy") {
				append("\"Okay, Daddy.\" She hardens a little just saying it... then her face hardens: \"... just don't expect me to say 'cummies.'\"");
				temp.c = "Deal.";
				addChoice("I expect nothing less.", function() {data.gooGoatCummies = true; gooGoatIntro("googoathub");} );
			} else if (data.gooGoatPlayerTitle == "Dad") {
				append("She smiles. \"There's something sort of endearing and awkward about that choice. Dad it is, then.\"");
				temp.c = "Oh shush.";
			} else if (data.gooGoatPlayerTitle == "Mommy" || data.gooGoatPlayerTitle == "Mom") {
				append("\"Mmmm, a total MILF, huh?\"\n\nShe eyes your butt.");
				temp.c = "Hush yourself young lady.";
			} else if (data.gooGoatPlayerTitle == "X-3869") {
				append("She blinks. \"Wait, seriously?... Well... alright, if you want...\"");
				temp.c = "I do want. It's got the sex number in there.";
			} else if (data.gooGoatPlayerTitle == "Mr. Pluto") {
				append("She blinks. \"Wait, seriously? You want to be named after a non-planet?... Well... alright, if you want...\"");
				temp.c = "I do want.";
			} else if (data.gooGoatPlayerTitle == "Mrs. Milky Way") {
				append("She blinks. \"Wait, seriously?... Well... I guess it does sounds sort of sexy...\"");
				temp.c = "It sounds INCREDIBLY sexy.";
			} else if (data.gooGoatPlayerTitle == "Galaxy Wizard") {
				append("She blinks. \"Wait, seriously? You want me to call you Galaxy Wizard?\"");
				temp.c = "I don't fuck around when it comes to galactic wizardry, kid.";
			} else if (data.gooGoatPlayerTitle == "God") {
				append("For a moment she looks as if she's going to refuse and spew blasphemy.\n\nShe doesn't.");
				temp.c = "Yesss. Your god is pleased.";
			} else {
				if (data.gooGoatNamed) {
					append("\"No comment,\" she says. \"Seriously. I can't even think about or react to that name in any meaningful way. GOD this place is weird...\"");
					temp.c = "Don't think about it too much.";
				} else {
					append("She puzzles over that for several minutes. \"I don't... I <!i>can't<!i>... I just <!i>cannot<!i> think about what you just said, as hard as I try. It's like a weird black hole in my attention span. It's easy enough for me to say it, look: "+data.gooGoatPlayerTitle+"! "+data.gooGoatPlayerTitle+" all day long! Go "+data.gooGoatPlayerTitle+" yourself! Take a big fat "+data.gooGoatPlayerTitle+"!\"\n\nShe rubs her temples, exhausted. \"None of those sentences made any sense, I'm sure. And yet I can't even play them back in my head... "+data.gooGoatPlayerTitle+" is just... totally unthink-about-able.\"");
					temp.c = "Don't think about it too much, then. Just call me "+data.gooGoatPlayerTitle+".";
				}
			}

			addChoice(temp.c, gooGoatIntro.bind("googoathub"));
			addChoice("Actually, call me something else...", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoattitlename") {
			append("\""+data.playerName+", huh. Well, it's not as cute or sexy as some of the other options I had in mind... but it'll do!\"\n\nShe reaches up on her tippy-toes and tries to poke the floating name above your head. Her fingers go right through the letters. \"Dangit. Thought I might be able to rearrange some letters into a dirty word...\"");

			addChoice("Quit it.", gooGoatIntro.bind("googoathub"));
			addChoice("Let me try again.", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatwhouni") {
			append("\"Another universe...\"\n\nYou both turn back to the stars.");
			addChoice("...", gooGoatIntro.bind("googoatwhouni2"));
		}

		if (seg == "googoatwhouni2") {
			append("... \"SO YOU'RE AN ALIEN?!\"");
			temp.c = pickByGender("god", "goddess", "deity");
			addChoice("Technically yes.", gooGoatIntro.bind("googoatunicool"));
			addChoice("No, more like a "+temp.c+".", gooGoatIntro.bind("googoatunigod"));
		}

		if (seg == "googoatunicool") {
			data.gooGoatPlayerTitle = pickByGender("Mr. Pluto", "Mrs. Milky Way", "Galaxy Wizard");

			if (data.gooGoatCharisma > 0) {
				if (data.gooGoatSwears) temp.a = "fuck" else temp.a = "heck";
				append("\"Holy "+temp.a+"!!\" She dives forward, shoving her alien-looking face in yours while she inspects you, her gooey nose almost booping yours. \"That's so cool! I'm gonna call you "+data.gooGoatPlayerTitle+"!\"");
				addChoice("Sounds dope.", gooGoatIntro.bind("googoattitlegiven"));
				addChoice("No, call me something else...", gooGoatIntro.bind("googoatcallme"));
			} else {
				append("She steps back, eyeing you warily. Apparently she expects the laser guns to come out at any moment.\n\n\"Should I be calling you X-3869 or something...?\"");
				addChoice("... Sure.", setNameAndGo.bind("X-3849", "googoattitlegiven"));
				addChoice("No, call me something else...", gooGoatIntro.bind("googoatcallme"));
			}
		}

		if (seg == "googoatunigod") {
			append("She drops all incredulity about aliens and her eyes narrow.\n\n\"No... the catface in the sky is God, isn't she?\"");
			addChoice("Mynt can't end your universe with a click.", gooGoatIntro.bind("googoatunigodend"));
			addChoice("Mynt can't protect your universe from people who'd want to shut it off.", gooGoatIntro.bind("googoatunigodprotect"));
		}

		if (seg == "googoatunigodend") {
			append("\"You wouldn't do that.\"\n\n<!b>CHARISMA: -20\nPSYCHE: -20\nTRUST: -10<!b>");
			data.gooGoatCharisma -= 20;
			data.gooGoatPsyche -= 20;
			data.gooGoatTrust -= 10;
			addChoice("No, I wouldn't.", gooGoatIntro.bind("googoatunigodwouldnt"));
		}

		if (seg == "googoatunigodwouldnt") {
			append("\"Good.\" She crosses her arms and scowls. \"Cause if you did, I'd jump out of the screen like The Ring and murder you. And you'd get goo in your keyboard, too, so you couldn't ever play again even if you turned the world back on.\"\n\n<!b>CHARISMA: +15\nPSYCHE: +15\nTRUST: +5<!b>");

			data.gooGoatCharisma += 15;
			data.gooGoatPsyche += 15;
			data.gooGoatTrust += 5;
			addChoice("You've got me beat there.", gooGoatIntro.bind("googoatunigod3"));
		}

		if (seg == "googoatunigod3") {
			append("Her scowl wavers. \"... So... do you actually want me to call you God, though?\"");
			addChoice("Yes, my child.", setNameAndGo.bind("God", 'googoattitlegiven'));
			addChoice("No, call me something else...", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatunigodprotect") {
			append("\"People would shut me off?!\"\n\nShe scowls, looks up at the sky, and cups her hands around her mouth: \"HEY! IF YOU CAN HEAR THIS— ER, READ THIS— AND YOU'RE THINKING IT MIGHT BE FUN TO DESTROY MY WHOLE UNIVERSE, THERE'S GONNA BE "+(data.gooGoatSwears?"HELL":"HECK")+" TO PAY IF YOU DO LET ME <!i>TELL YOU<!i>!\"\n\nAfter all that, the silence is deafening. Her sharp breathing is the only noise in the forest.");

			addChoice("I'm alone.", gooGoatIntro.bind("googoatunigodalone"));
		}

		if (seg == "googoatunigodalone") {
			append("Her scowl wavers. \"You're alone?\"");
			addChoice("Well, not entirely... I've got you!", gooGoatIntro.bind("googoatunigodgot"));
		}

		if (seg == "googoatunigodgot") {
			append("Suddenly she tackle-hugs you around your stomach, nuzzling her squishy cheek against you and smearing goo all over your shirt. \"I was alone for three minutes after the cat went away to talk to you— oh my god, I know how you feel— oh, it's the worst thing I've been through EVER!... which isn't saying much, but still!\"\n\nShe pulls off with a smile, a few strands still connecting her face to your tummy. \"You don't, uh... you don't actually want me to call you God, though, do you?\"\n\n<!b>TRUST: +10<!b>");

			data.gooGoatTrust += 10;
			addChoice("Of course, my child.", setNameAndGo.bind("God", 'googoattitlegiven'));
			addChoice("No, call me something else...", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatwhopriest") {
			append("\"Oh...\"\n\nShe shifts a little, clasping her hands not-so-subtly over her nudity.");
			addChoice("It's okay. The bible doesn't say anything about cute little goo goat herms.", gooGoatIntro.bind("googoatpriestbible"));
			addChoice("Peel her hands apart.", gooGoatIntro.bind("googoatpriestpeel"));
		}

		if (seg == "googoatpriestbible") {
			append("\"Ah, yes. He really should've included a warning clause or two about goo goat herms, since we're clearly some of the rarest and sexiest little creatures in the business of tempting mortals...\"\n\nShe shakes her butt at you and smirks.");

			if (data.gooGoatNamed) addChoice("Wow you're a slut, "+data.gooGoatName+".", gooGoatIntro.bind("googoatpriestslut"))
			else addChoice("Wow you're a slut.", gooGoatIntro.bind("googoatpriestslut"));
		}

		if (seg == "googoatpriestslut") {
			if (data.genderMale) {
				temp.g = "Master~";
				addChoice("... Please keep calling me Master.", setNameAndGo.bind('Master', "googoattitlegiven"));

			} else if (data.genderFemale) {
				temp.g = "Mistress~";
				addChoice("... Please keep calling me Mistress.", setNameAndGo.bind('Mistress', "googoattitlegiven"));

			} else if (data.genderNeutral) {
				temp.g = "oh, and by the way, should I call you Master or Mistress~?";
				addChoice("Master.", setNameAndGo.bind('Master', "googoattitlegiven"));
				addChoice("Mistress.", setNameAndGo.bind('Mistress', "googoattitlegiven"));
			}

			append("\"Am I~? I'm only twenty minutes old, I couldn't possibly know what sluttiness is... "+temp.g+"\"");
			addChoice("Actually, could you call me something else?", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatpriestpeel") {
			append("You gently pull her hands apart, revealing her droopy goococklet and pouch. If you look at the right angle you can even catch a glimpse of two cuntlips hidden between her plump little thighs. She slips her hands away and pulls her nuts up for you, showing off her puss with an innocent smile. \"You were trying to see this, right? Here's a better view~\"\n\nAfter you take a gargantuan gander at the display she lets her nuts flop back down with a wet <!i>pap<!i>. \"So, your dad was a priest. But that still leaves the question...\"");

			addChoice("Go on.", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatwhoparent1") {
			if (data.genderMale) {
				temp.a = "Daddy";
				addChoice("Oh absolutely.", setNameAndGo.bind('Daddy', "googoattitlegiven"));
				addChoice("Just Dad is fine.", setNameAndGo.bind('Dad', "googoattitlegiven"));
			} else if (data.genderFemale) {
				temp.a = "Mommy";
				addChoice("Please do.", setNameAndGo.bind('Mommy', "googoattitlegiven"));
				addChoice("Just Mom is fine.", setNameAndGo.bind('Mom', "googoattitlegiven"));
			} else if (data.genderNeutral) {
				temp.a = "Mommy or Daddy";
				addChoice("Daddy has a certain spark to it.", setNameAndGo.bind('Daddy', "googoattitlegiven"));
				addChoice("Just Dad is fine.", setNameAndGo.bind('Dad', "googoattitlegiven"));
				addChoice("Mommy sounds cute.", setNameAndGo.bind('Mommy', "googoattitlegiven"));
				addChoice("Just Mom is fine.", setNameAndGo.bind('Mom', "googoattitlegiven"));
			}

			append("\"Ahh... gotcha. But tell me... um... was it direct enough that I could I call you "+temp.a+"?\"");
			addChoice("No, call me something else...", gooGoatIntro.bind("googoatcallme"));
		}

		if (seg == "googoatcompswears") {
			append("Her eyes go wide. \"Really? Not even a bit?\"\n\n<!b>TRUST: +5<!b>");

			data.gooGoatTrust += 5;

			addChoice("Not even a bit.", gooGoatIntro.bind("googoatcompswears2"));
			addChoice("Well, a bit, if you hurt somebody with em. But that'd be something wrong with you, not with swears.", gooGoatIntro.bind("googoatcompswears2a"));
		}

		if (seg == "googoatcompswears2") {
			append("\"...\"\n\n<!b>CHARISMA: +1... +2... +3...<!b>");
			data.gooGoatCharisma += 3;
			addChoice("Go ahead.", gooGoatIntro.bind("googoatcompswears3"));
		}

		if (seg == "googoatcompswears2a") {
			append("\"I don't wanna hurt anybody...\"\n\nShe looks at the moon again.");
			addChoice("Me neither.", gooGoatIntro.bind("googoatwho"));
		}

		if (seg == "googoatcompswears3") {
			append("\"... Poop!\"\n\nShe grins.\n\n<!b>CHARISMA: +5\nTRUST: +5<!b>");
			data.gooGoatCharisma += 5;
			data.gooGoatTrust += 5;
			addChoice("That's not a swear.", gooGoatIntro.bind("googoatcompswears4"));
		}

		if (seg == "googoatcompswears4") {
			append("\"Oh.\"\n\nShe thinks for a bit. Then............ \"Fuck! :3\"\n\n<!b>CHARISMA: +10<!b>");
			data.gooGoatSwears = true;
			data.gooGoatCharisma += 10;
			addChoice("You did it.", gooGoatIntro.bind("googoatwho"));
		}

		if (seg == "googoatcompowch") {
			append("She giggles into a gooey paw.\n\n\"Er— sorry...\"\n\n<!b>PSYCHE: +10\nTRUST: +10<!b>");

			data.gooGoatPsyche += 10;
			data.gooGoatTrust += 10;
			addChoice("S'fine.", gooGoatIntro.bind("googoatwho"));
		}

		if (seg == "googoat3comp2") {
			append("She places a wary paw on your stomach, soft and warm, then gives you a good testing squeeze.\n\n\"But why isn't everything pixels?\"\n\n<!b>PSYCHE: +10\nTRUST: +10<!b>");

			data.gooGoatPsyche += 10;
			data.gooGoatTrust += 10;
			addChoice("You just can't see them.", gooGoatIntro.bind("googoatcantsee"));
			addChoice("In your case everything is words, firstly. Then pixels.", gooGoatIntro.bind("googoatcantsee"));
		}

		if (seg == "googoatcantsee") {
			append("\"Oh.\"\n\nShe stares extra hard at the air.");
			addChoice("...", gooGoatIntro.bind("googoatwho"));
		}

		if (seg == "googoat3bf") {
			var man:String = "mossy man and he";
			var verb:String = "Well that must've been terrifying.";
			
			if (data.bfVenusFed > 3) {
				man = "huge drooly venus fly-trap and "+data.plantGender;
				verb = "Ah, shit. That's sort of my fault.";
				addChoice("What??? Who would feed a plant berries til it grew that big??? You must've been seeing things...", gooGoatIntro.bind("googoat3bflie"));
			}

			append("She shivers.\n\n\"That's what the cat told me. I still don't understand anything. I saw a "+man+" tried to eat me. This place is insane.\"");

			addChoice(verb, gooGoatIntro.bind("googoat3bfmyfault"));
			addChoice("It's alright once you get used to it. You just started existing. Give it some time.", gooGoatIntro.bind("googoatcomfort"));
		}

		if (seg == "googoat3bflie") {
			append("She gives you a shrewd look. \"The cat already told me you did it...\"\n\n<!b>TRUST: -5<!b>");
			addChoice("Well.", gooGoatIntro.bind("googoatwho"));
		}

		if (seg == "googoat3bfmyfault") {
			if (data.bfVenusFed > 0) {
				temp.a = "killer plant";
			} else {
				temp.a = "creepy mossman";
			}

			append("She smiles a little. \"It's okay. I learned from it; now I know if a "+temp.a+" bites my arm off it'll regenerate in under a minute!... It was a little drippy for a while though...\"\n\nShe stares at her arm, sniffs it, wiggles around a bit. \"Being alive is weird. It's like I've got selective telepathy for my body parts.\"\n\nShe reaches for the moon, spreading her fingers in and out.\n\n<!b>TRUST: +10<!b>");

			data.gooGoatTrust += 10;
			addChoice("Didn't it hurt, getting your arm bit off?!", gooGoatIntro.bind("googoatbfhurt"));
			addChoice("Stretch out my hand too and marvel at the mystery of motor control with her.", gooGoatIntro.bind("googoatbfmotorcontrol"));
		}

		if (seg == "googoatbfhurt") {
			append("\"I don't think so. That's when you scream and cry and stuff, right? I'm sorry if that's a dumb question, I haven't been hurt yet so I don't know. Actually,\" she pauses to toe a long stalk of grass, crouching, stretching, trying out all the different parts of her body. \"I think it tickled.\"\n\nHer fingers wander between her legs. \"Hey. This tickles too.\"\n\nShe gropes herself in front of you, unashamed, dragging a couple tiny fingers over her cocklet, her nuts, seeing how far she can pull the lips of her goopuss apart.\n\n<!b>SENSITIVITY: -5<!b>");

			data.gooGoatSensitivity += 5;
			addChoice("I guess nobody in here is born exempt from sexuality.", gooGoatIntro.bind("googoatbfsexuality"));
		}

		if (seg == "googoatbfsexuality") {
			append("\"Oh,\" she says, her pussy still held open, a single shiny bead of goo dripping from its depths. \"Is this sexual?\"");
			addChoice("Well yeah.", gooGoatIntro.bind("googoatbfwellyeah"));
			addChoice("Well... I guess you're just exploring.", gooGoatIntro.bind("googoatbfarouse"));
		}

		if (seg == "googoatbfwellyeah") {
			append("\"But I'm not getting penetrated...\"");
			addChoice("There's a lot more to it than that.", gooGoatIntro.bind("googoatbfknow"));
		}

		if (seg == "googoatbfknow") {
			append("She's a little humbled. \"There is? But it seems so simple...\"\n\nShe stares down at her cock, flippity-dipping it around with a finger.\n\n<!b>CHARISMA: -5<!b>");

			data.gooGoatCharisma -= 5;
			addChoice("In time, young one. In time.", gooGoatIntro.bind("googoatcomfort"));
		}

		if (seg == "googoatbfarouse") {
			append("She sticks her tongue out in concentration, then crams two fingers to the knuckle up her cunt. She does the same with her pucker, lifting one leg to really get in there, digging around hard until she finds and tweaks her prostate with a happy little bleat.\n\nShe fixes you with an innocent(?) smile and says: \"I... <!i>really<!i> shoulda tried this earlier. Being in this body feels a little better now that I know all its parts. My parts, I mean.\"\n\n<!b>PSYCHE: +10\nTRUST: +5\nSENSITIVITY: -5<!b>");

			data.gooGoatPsyche += 10;
			data.gooGoatSensitivity -= 5;
			data.gooGoatTrust += 5;
			addChoice("There's a lot more to know. I'll show you.", gooGoatIntro.bind("googoatbfknow"));
			addChoice("I'm happy you're comfortable with yourself.", gooGoatIntro.bind("googoatcomfort"));
		}

		if (seg == "googoatbfmotorcontrol") {
			append("She stares up at your much bigger arm.\n\n\"Wow... jeez... does that whole growing thing keep going forever?\"");
			addChoice("Yep. Someday you'll be big enough to reach the moon.", gooGoatIntro.bind("googoatbfmoon"));
			addChoice("Nah, most people have a max height. You won't grow, though, being in here.", gooGoatIntro.bind("googoatbfnogrow"));
		}

		if (seg == "googoatbfmoon") {
			append("\"Really?\"\n\nThe moon's reflected in her ginormous eyes.\n\n<!b>CHARISMA: +15<!b>");
			data.gooGoatCharisma += 15;
			addChoice("Nah.", gooGoatIntro.bind("googoatbfnah"));
			addChoice("Really.", gooGoatIntro.bind("googoatcomfort"));
		}

		if (seg == "googoatbfnah") {
			append("\"Oh.\"\n<!b>CHARISMA: \nTRUST: -10<!b>");
			data.gooGoatCharisma -= 25;
			data.gooGoatTrust -= 10;
			addChoice("... Sorry...", function() {gooGoatIntro("googoatcomfort"); append("'It's alright'\n\n");} );
			addChoice("Anyway.", gooGoatIntro.bind("googoatcomfort"));
		}

		if (seg == "googoatbfnogrow") {
			append("\"Ah,\" she says. \"Right. The cat said I can't die. I guess that means I can't age too. Still don't <!i>really<!i> get what that means... except that I'll be short forever, of course.\"\n\nFor the first time she really looks at you hard, eyes narrowed, lip bit by a gooey tooth, scrutinizing your soul.\n\nThen she pulls away with a smile. \"You're honest, huh "+(data.gooGoatAskedWho?data.gooGoatPlayerTitle:"")+"?\"\n\n<!b>TRUST: +10\nPSYCHE: +5\nCHARISMA: -5<!b>");

			data.gooGoatTrust += 10;
			data.gooGoatPsyche += 5;
			data.gooGoatCharisma -= 5;
			data.knownCharacterImmortality++;
			addChoice("I guesso.", gooGoatIntro.bind("googoatcomfort"));
			addChoice("I just don't like sugarcoating stuff.", function() {data.gooGoatNoSugarcoat = true; gooGoatIntro("googoatcomfort");} );
		}

		if (seg == "googoatcomfort") {
			if (data.gooGoatTrust == 0) {
				append("She nods, takes a couple deep breaths. Her eyes stay on you while the bubbles coalesce and contort beneath her smooth translucent chest.");
			} else if (data.gooGoatTrust < 0) {
				append("It gets quiet. She doesn\'t seem very comfortable, but she\'s not about to run off into the forest, either.");
			} else if (data.gooGoatTrust > 0) {
				if (data.gooGoatSwears) temp.a = "shit" else temp.a = "stuff";
				append("She flattens herself a little clearing in the grasses and flops down onto her butt with a sigh, leaning back on her hands, stargazing. \"Fwah... even just the sky is sensory overload. Thanks. For being here, I mean.\"");
			}

			addChoice("What's your name?", gooGoatIntro.bind("googoatname"));
		}

		if (seg == "googoatname") {
			append("She blinks and looks instinctively to her collarless neck"+(data.gooGoatAskedWho?", letting the blade of grass flutter to the ground.":".")+"\n\n\"I don't have one.\"");

			data.gooGoatNamed = true;
			addChoice("Well, I wanna name you.", gooGoatIntro.bind("googoatnamegive"));
			addChoice("Where I come from, kids don't even get a say in their names.", gooGoatIntro.bind("googoatnameself"));
		}

		if (seg == "googoatnamegive") {
			append("\"Okay!\" She strikes a little pose. \"What comes to mind?\"");

			if (data.savedCharisma == -1) data.savedCharisma = data.gooGoatCharisma;
			data.gooGoatCharisma = data.savedCharisma;

			addTextChoice(function(str) {
				data.gooGoatName = str;
				gooGoatIntro("googoatnamegiven");
			});
			addChoice("Bleat.", function() {data.gooGoatName = "Bleat"; gooGoatIntro("googoatnamegiven");});
			addChoice("Goopi.", function() {data.gooGoatName = "Goopi"; gooGoatIntro("googoatnamegiven");});
			addChoice("Billy.", function() {data.gooGoatName = "Billy"; gooGoatIntro("googoatnamegiven");});
			addChoice("Bitch.", function() {data.gooGoatName = "Bitch"; gooGoatIntro("googoatnamegiven");});
			addChoice("Slut.", function() {data.gooGoatName = "Slut"; gooGoatIntro("googoatnamegiven");});
			addChoice("Whore.", function() {data.gooGoatName = "Whore"; gooGoatIntro("googoatnamegiven");});
			addChoice("Fuckling.", function() {data.gooGoatName = "Fuckling"; gooGoatIntro("googoatnamegiven");});
			addChoice("Fucklet.", function() {data.gooGoatName = "Fucklet"; gooGoatIntro("googoatnamegiven");});
			addChoice("Fucktoy.", function() {data.gooGoatName = "Fucktoy"; gooGoatIntro("googoatnamegiven");});
		}

		if (seg == "googoatnamegiven") {
			if (data.gooGoatName == "Bleat") {
				append("\"... Well jeez, I was gonna choose that one!\"");
				temp.c = "After thorough consideration I deduced it was the most bestest.";

			} else if (data.gooGoatName == "Goopi") {
				append("'... Am I really that gooey...?' She looks at her shiny, drippy little butt. She prods it, pulling a thick strand of goo out with her fingertip. \"Wow. Jeez. I guess I am.\"");
				temp.c = "Big time.";

			} else if (data.gooGoatName == "Billy") {
				append("\"... Oh, like billy goat. Clever, real clever.\" She pauses, thinking. \"Still, there's something cute about being a girl named Billy...\"");
				temp.c = "Girls with boy names are dope as fuck for sure.";

			} else if (data.gooGoatName == "Bitch") {
				append("\"...\"\n\nShe blushes. \"Alright. Fine. I'll be your... your bitch.\"");
				append("\n\n<!b>CHARISMA: -5<!b>");
				data.gooGoatCharisma -= 5;
				temp.c = "Very gracious of you, Bitch~";

			} else if (data.gooGoatName == "Slut") {
				append("\"... Wow, creative...\"\n\nShe covers her hardening goocock.");
				append("\n\n<!b>CHARISMA: -5<!b>");
				data.gooGoatCharisma -= 5;
				temp.c = "Mmmmmhm.";

			} else if (data.gooGoatName == "Whore") {
				append("\"... What? But I'm a virgin...\"\n\nShe turns away to hide her blush, 'accidentally' giving you a view of her little butt. \"Don't even think about saying 'Not for long...'\"");
				append("\n\n<!b>CHARISMA: -5<!b>");
				data.gooGoatCharisma -= 5;
				temp.c = "I wasn't gonna!";
				addChoice("Not for long. >:3", gooGoatIntro.bind("googoathub"));

			} else if (data.gooGoatName == "Fuckling") {
				append("\"That doesn't make much sense. I'm the offspring... of fuck...?\"\n\nShe stares down, fiddling with a blade of grass. \"It does have a ring to it, though...\"");
				append("\n\n<!b>CHARISMA: -10<!b>");
				data.gooGoatCharisma -= 10;
				temp.c = "Well, to be a ling OF fuck obviously means you're intrinsically tied to fucking. Probably.";

			} else if (data.gooGoatName == "Fucklet") {
				append("\"... Y'know, normally I would get all blushy and ashamed, but that one actually does sound sort of cute!\"");
				append("\n\n<!b>CHARISMA: -5<!b>");
				data.gooGoatCharisma -= 5;
				temp.c = "It does, doesn't it?";

			} else if (data.gooGoatName == "Fucktoy") {
				append("\"... A-Ah... wow... straight to the point, aren't we...\"");
				append("\n\n<!b>CHARISMA: -15<!b>");
				data.gooGoatCharisma -= 15;
				temp.c = "Yup.";
			} else {
				if (data.gooGoatAskedWho) {
					append("\"No comment,\" she says. \"Seriously. I can't even think about or react to that name in any meaningful way. GOD this place is weird...\"");
					temp.c = "Don't think about it too much.";
				} else {
					append("She puzzles over that for several minutes. \"I don't... I <!i>can't<!i>... I just <!i>cannot<!i> think about what you just said, as hard as I try. It's like a weird black hole in my attention span. It's easy enough for me to say it, look: "+data.gooGoatName+"! "+data.gooGoatName+" all day long! Go "+data.gooGoatName+" yourself! Take a big fat "+data.gooGoatName+"!\"\n\nShe rubs her temples, exhausted. \"None of those sentences made any sense, I'm sure. And yet I can't even play them back in my head... "+data.gooGoatName+" is just... totally unthink-about-able.\"");
					temp.c = "Don't think about it too much. Just trust me, it's a good name.";
				}
			}

			addChoice(temp.c, gooGoatIntro.bind("googoathub"));
			addChoice("Let me try that again actually.", gooGoatIntro.bind("googoatnamegive"));
		}

		if (seg == "googoatnameself") {
			append("\"Whoa, really? I guess I should take advantage...\"\n\nShe places a single goopy finger on her lips. \"Hmmmmmmmmm. What about something like 'Meow,' but for goats. 'Bleat?'\"");

			addChoice("Sure. Hello, Bleat.", gooGoatIntro.bind("googoatnameself2"));
			addChoice("Eh, it's okay. I got another idea...", gooGoatIntro.bind("googoatnamegive"));
		}

		if (seg == "googoatnameself2") {
			append("\"Helloo-oo-oo yourself~!\" she bleats, grinning.\n\n<!b>TRUST: +5\nCHARISMA: +5<!b>");
			data.gooGoatTrust += 5;
			data.gooGoatChrisma += 5;
			data.gooGoatName = "Bleat";
			addChoice("Hehe.", gooGoatIntro.bind("googoathub"));
		}

		if (seg == "googoathub") {
			if (!data.gooGoatAskedWho) {
				append("Your lazy aimless conversation turns to her life story so far. She goes on a bit of a rant about the three minutes she spent alone before you got here, about the man covered in glowing moss staring at her from deep in the forest, about how when she found this clearing she first tried to sprint across it but fell down halfway and then, terrified, on her hands and knees in the dirt— only then did she notice the moon.\n\nOn that note, you both look up.");
				addChoice("Stargaze.", gooGoatIntro.bind("googoatwho"));
			} else if (!data.gooGoatNamed) {
				append("Time passes. She pokes her palm with a piece of grass. With a little determination she pops it right through the membrane of her gooey skin, slides it down inside her wrist, to the inner tip of each finger...\n\n\"Of all the bodies,\" she grumbles, \"I had to get the freaky goo one.\"");
				addChoice("I've been meaning to ask you... what's your name?", gooGoatIntro.bind("googoatname"));
			} else if (data.gooGoatAskedWho && data.gooGoatNamed) {
				if (data.gooGoatPlayerTitle == "Master" || data.gooGoatPlayerTitle == "Mistress") temp.a = "I <!i>am<!i> officially" else temp.a = "I... I do sort of really want to be";
				append("\"So... I'll call you "+data.gooGoatPlayerTitle+", and you'll call me "+data.gooGoatName+".\"\n\nShe puts her hands firmly on her hips— a little too firmly. They start to sink through her membrane. With two little <!i>pops<!i> that make her thighs jiggle she pulls both out and replaces them with minimal pressure. \"I wanna make this absolutely clear,\" she says: \"Just because we know each other a little better now doesn't mean you can do stuff to me without my permission, and it doesn't mean I can mooch food or whatever off you either! "+temp.a+" your pet now... but it's gotta be a <!i>healthy<!i> pet/owner relationship. No meanness, no food-mooching—\"");
				addChoice("Are you hungry?", gooGoatIntro.bind("googoathungry"));
			}
		}

		if (seg == "googoathungry") {
			makeSmallButtons();
			append("Her goo-tummy gurgles right on cue.\n\n\"... A little...\"");
			addChoice("I can spare a few berries.", gooGoatIntro.bind("googoatglowberry"), {cost: ["Glowberry", 5]});
			addChoice("A little, huh?", gooGoatIntro.bind("googoatglowberry50"), {cost: ["Glowberry", 50]});
			addChoice("I do happen to have this hot pie.", gooGoatIntro.bind("googoatglowberrypie"), {cost: ["Glowberry Pie", 1]});
			addChoice("Well that sorta sucks, cause I don't have anything edible on me.", gooGoatIntro.bind("googoatnofood"));
		}

		if (seg == "googoatglowberry") {
			append("She goes >:o at your tiny palmful of berries like it's a feast. \"Can you? I don't want to mooch...\"");
			addChoice("Mhm. But there's a catch... you gotta eat em from my palm.", gooGoatIntro.bind("googoatglowberrypalm"));
			addChoice("Hold out your hands.", gooGoatIntro.bind("googoatglowberryhands"));
		}

		if (seg == "googoatglowberrypalm") {
			append("\"DEAL.\"\n\nYou smile amusedly at "+data.gooGoatName+" as she scoots forward with careful sniffs, a little nervous. \"These aren't poisoned... right?\"");

			addChoice("If they were, I wouldn't tell you?", gooGoatIntro.bind("googoatglowberryrealism"));
			addChoice("Of course not.", gooGoatIntro.bind("googoatglowberrynot"));
		}

		if (seg == "googoatglowberryrealism") {
			if (data.gooGoatNoSugarcoat) {
				temp.a = " No sugarcoating.";
				temp.b = "<!b>TRUST: -5<!b>";
				temp.c = "Nope. Now eat up~";
			} else {
				temp.a = "";
				temp.b = "";
				temp.c = "They're fine, really. Eat up~";
			}

			append("\"Ah. Right."+temp.a+"\"\n\nShe noses the berries in your palm. Testing to see if they sting or tingle, you guess?\n\n<!b>PSYCHE: +5<!b>\n"+temp.b);

			data.gooGoatPsyche += 5;
			if (!data.gooGoatNoSugarcoat) data.gooGoatTrust -= 5;
			addChoice(temp.c, gooGoatIntro.bind("googoatglowberryeat"));
		}

		if (seg == "googoatglowberrynot") {
			if (data.gooGoatTrust > 0) {
				temp.a = "That's just what you'd say if you DID poison them...";
				temp.c = "Expert deduction.";
			} else {
				temp.a = "Mmmm... I believe you, but...";
				temp.c = "Alright.";
			}

			append("She plunks her snout down in the midst of the berries and hauls in a deep sniff, chest rising. \""+temp.a+" I'm just gonna taste one first to be sure...\"");

			addChoice(temp.c, gooGoatIntro.bind("googoatglowberryeat"));
		}

		if (seg == "googoatglowberryeat") {
			append("She sucks one berry from the five and swirls it around her mouth, pulling a little juice from it, testing its squishiness between her tongue and the roof of her mouth. Finally she chomps down— it pops with a little electric <!i>crick<!i>, lighting up her cheeks for a moment and making her squeak with surprise.\n\nShe spits it out. \"THEY <!i>ARE<!i> POISON!\"");

			addChoice("No, they're just sort of electric is all.", gooGoatIntro.bind("googoatglowberryeat2"));
		}

		if (seg == "googoatglowberryeat2") {
			append("She runs a hand over her throat, her lips. No swelling. She slips her tongue out, juice-drippy and still tingling with static. \"... Oh, really?... Electric? Like me?\" She cautiously licks another, smearing warm, glowy spit over your hand.");

			addChoice("Just hurry up and eat them. My arm is getting sore.", gooGoatIntro.bind("googoatglowberryeat3"));
		}

		if (seg == "googoatglowberryeat3") {
			append("\"Alright alright, jeez...\"\n\nShe holds your hand steady with a grip on your wrist and gently chews at the rest of the berries, intentionally(?) making a mess of your palm, her blue goo mingling with blue glowberry juice until your fingers are webbed with whichever and shiny little glowdribbles leak from their bridges and race down your forearm.\n\nOnce done "+data.gooGoatName+" dutifully licks up all her spilled juice. She drags her tongue over and around each finger, at times sucking two or three at a time down to the knuckle, fixing you with an innocent smile.");

			addChoice("Taste good?", gooGoatIntro.bind("googoatglowberryeat4"));
		}

		if (seg == "googoatglowberryeat4") {
			append("She pulls off, licking her lips. Your hand is squeaky-clean, if a little slick with goat saliva. \"So good...\"");
			addChoice("... Good~", gooGoatIntro.bind("googoatnobelly"));
		}

		if (seg == "googoatnobelly") {
			if (data.gooGoatSwears) temp.a = "swears" else temp.a = "language";
			if (data.gooGoatCummies) temp.b = "cummies" else temp.b = "sex";
			if (data.gooGoatNoSugarcoat) temp.c = "and why people sugarcoat things" else temp.c = "and the nature of electricity";


			append("She really doesn't seem very full, but she thanks you profusely anyway. You sit and chat with her a while. Conversation roves over a bunch of weirdly specific topics, like "+temp.a+", "+temp.b+", "+temp.c+". She doesn't have a whole lot of insights, being so new to reality, but she does have a certain innocent approach to things.\n\n\"Words are just words,\" "+data.gooGoatName+" declares as a universal truth, then looks to you for support. You agree despite not really understanding what she means.\n\nHer eyes are drooping. \"I uh...\" she meanders. \"I don't wanna mooch... but could we head to your place?\"");

			addChoice("Oh. Um.", gooGoatIntro.bind("googoatreadybed2"));
		}

		if (seg == "googoatreadybed") {
			append("\"Oh you swear, do you...\"\n\nShe smiles. \"I appreciate you taking this slow, though, really. I'm still getting used to regular old sensation— the soul-stirring pussy-clenching thigh-quivering body-and-mind butt-kickery of sex would be a bit much this early on...\"\n\nAbruptly she gets awkward: \"But. Yeah. I'm pretty tuckered. Despite what I just said... can I stay at your place?\"");

			addChoice("Oh. Um.", gooGoatIntro.bind("googoatreadybed2"));
		}

		if (seg == "googoatreadybed2") {
			append("\"What is it?\"");
			addChoice("It's just... I don't really have a place.", gooGoatIntro.bind("googoatnohome"));
		}

		if (seg == "googoatnohome") {
			append("\"What? You live here, don't you?\"");
			addChoice("In the middle of the forest? Of course not, I just wander everywhere.", gooGoatIntro.bind("googoatnohome2"));
		}

		if (seg == "googoatnohome2") {
			append("\"Oh, because that makes so much more sense.\"\n\nShe picks a couple pieces of grass from her goo. \"Well... how about a motel room?\"");

			addChoice("There aren't any near here.", gooGoatIntro.bind("googoatnohome3"));
		}

		if (seg == "googoatnohome3") {
			append("She huffs. \"Okay. So what do we do?\"");
			addChoice("We could build a home.", gooGoatIntro.bind("googoathometalk"));
		}

		if (seg == "googoathometalk") {
			append("\"What?\"");

			addChoice("It wouldn't take very long. At least from my perspective. We just need patience and wood and tools.", gooGoatIntro.bind("googoathometalk2"));
		}

		if (seg == "googoathometalk2") {
			append("She sighs. \"Patience, huh? Easy enough for you to say. For all I know I'm already in a timeskip.\"");
			addChoice("You're not.", gooGoatIntro.bind("googoathometalk3"));
		}

		if (seg == "googoathometalk3") {
			if (data.roxVisits > 0 && data.roxVisits < 2) {
				setLocation("Roxelle's Farm");
				temp.character = "at Roxelle's place";
				temp.character2 = "sipping on a glass of blue wine";
			} else if (data.metLittleRed) {
				setLocation("Red's Cottage");
				temp.character = "at Red's cottage";
				temp.character2 = "gnawing on a slab of meat";
			} else {
				setLocation("Abandoned Farm");
				temp.character = "standing alone before the broken remains of a farmhouse";
				temp.character2 = "trying to yank off some of the least-rotted boards";
			}

			append(data.gooGoatName+" begrudgingly follows downhill until you hit the main trail in search of tools. For a few hours you scout each hut and cottage, knocking politely and asking for hacksaws, axes, measuring tape, wood chisels, all in exchange (naturally) for sexual favors. "+data.gooGoatName+" usually sulks in the living room or wanders outside while you fuck various people. At the worst point, convinced she's in a timeskip and that nothing you say is really <!i>you<!i> talking, she runs several houses ahead— even after you've got all the tools you need slung heavy in a pack over your shoulder you end up having to track her down for another hour yet.\n\nYou find her "+temp.character+", "+temp.character2+".");

			addChoice("There you are. Okay, the timeskip is over, promise.", gooGoatIntro.bind("googoathometalk4"));
		}

		if (seg == "googoathometalk4") {
			temp.g = pickByGender("he's", "she's", "they're");
			temp.g2 = pickByGender("He", "She", "They");

			if (data.roxVisits > 0 && data.roxVisits < 2) {
				temp.character = "Rox puts a hand on her shoulder, waving you down. \"Got her right here! Damn, is she ever fresh. I suppose Mynt's out of practice, eh?\"";
				temp.character2 = "\"Timeskip...?\" Rox laughs. \"Oh, little goat... "+data.playerName+"'s always here, even if "+temp.g+" only getting the gist of things. "+temp.g2+" couldn't keep up with every moment if "+temp.g2+" wanted to.\"";
			} else if (data.metLittleRed) {
				temp.character = "\"Hey!\" Red growls. \"How long has she been here? You can't just let innocents wander around here like it's whatever... Even the forest.\"";
				temp.character2 = "\"Like I told you,\" Red says to her in a tone softer than any you've heard, \"That's just how things are with players. You think if they type 'Next' it means they don't care what happens? Course they do. Probably. It's just... when you convert reality to writing, things slow down way too much. They can't engage with every single moment.\"";
			} else {
				temp.character = "She throws all her weight into pulling a good board off— <!i>CRACK<!i>.";
				temp.character2 = "She starts on the next one.";
			}

			append("She won't look at you.\n\n"+temp.character+"\n\n\"If this isn't a timeskip, say 'Ding dong doo.',\" "+data.gooGoatName+" demands. \"That's the password so I know you're actually here.\"\n\n"+temp.character2);

			addChoice("Ding dong doo.", gooGoatIntro.bind("googoathometalk5"));
		}

		if (seg == "googoathometalk5") {
			temp.character = "";

			if (data.roxVisits > 0 && data.roxVisits < 2) {
				if (data.gooGoatPlayerTitle != data.playerName) temp.character = "\""+data.gooGoatPlayerTitle+"?\" Rox grins.";
			} else if (data.metLittleRed) {
				if (data.gooGoatPlayerTitle != data.playerName) temp.character = "\""+data.gooGoatPlayerTitle+"?\" Red blinks.";
			}

			append("She turns and sprints up to tackle-hug you. \""+data.gooGoatPlayerTitle+"! You're back!\"\n\n"+temp.character+"");

			addChoice("I never left. You're the one who ran off.", gooGoatIntro.bind("googoathometalk6"));
		}

		if (seg == "googoathometalk6") {
			if (data.gooGoatSwears) temp.swear = "this generic shit" else temp.swear = "these generic things";

			temp.g = pickByGender("he's", "she's", "they're");

			if (data.roxVisits > 0 && data.roxVisits < 2) {
				temp.character = "\"Was it that bad?\" Rox smirks. \"Guess Mynt really <!i>is<!i> out of practice...\"";
				temp.c = "I'm here now. Don't be spooked.";
			} else if (data.metLittleRed) {
				temp.character = "\"Who cares if "+temp.g+" on autopilot,\" Red says, arms crossed. \"Until you've really <!i>seen<!i> the island, you need to stay with "+data.playerName+". Otherwise, you're probably gonna get traumatized.\"";
				temp.c = "The little wolf is right. Please don't run off like that.";
			} else {
				temp.character = "She buries her face in your chest.";
				temp.c = "I'm here now. Don't be spooked.";
			}

			append("\"You were saying all "+temp.swear+"... it was so spooky...\"\n\n"+temp.character);
			addChoice(temp.c, gooGoatIntro.bind("googoathometalk7"));
		}

		if (seg == "googoathometalk7") {
			if (data.gooGoatSwears) temp.swear = "this generic shit" else temp.swear = "these generic things";

			temp.g = pickByGender("he's", "she's", "they're");

			if (data.roxVisits > 0 && data.roxVisits < 2) {
				temp.character = "\"I'm alright now...\"\n\nShe hands Rox back her wine glass, mostly empty now after it got spilled in the tackle-hug.\n\n\""+data.gooGoatName+" told me you two are building a cabin,\" Rox says, setting the glass down. \"... Interesting name for her. Now, for a big project like that, don't you suppose you could use\"— she grunts and flexes every part of her body, apron tenting a little, biceps bulging past her chub— \"THIS BEEF?\"";
				temp.c = "We'd love the help, Rox.";
			} else if (data.metLittleRed) {
				temp.character = "She hands Red back the slightly-gnawed meat. \"Alright... sorry...\"\n\n\""+data.gooGoatName+" told me you're building a cabin,\" Red says, gnawing into the meat herself. \"... shouldn't you get to work on that?\"\n\nShe scoots up to whisper to you: \"Cute name for her, by the way...\"";
				temp.c = "Thanks, Red. Seeya later!";
			} else {
				temp.character = "\"I'm sorry,\" she says. \"You can skip over stuff if you want. I'll always wait for you to come back.\"\n\nShe breaks the hug to go <!i>CRACK<!i> another board off, rejuvenated, then hauls both of them up under her arms.";
				temp.c = "Let's!";
			}

			append(temp.character+"\n\n"+data.gooGoatName+" limbers up and gets ready for the walk back up to the field. \"Alright, let's do this!!!\"");

			addChoice(temp.c, gooGoatIntro.bind("googoathometalk8"));
		}

		if (seg == "googoathometalk8") {
			setLocation("Moonlit Field");
			if (data.roxVisits > 0 && data.roxVisits < 2) {
				temp.character = "Only Rox notices the subtle hints that you're in a timeskip, shooting you a wink and saying nothing while "+data.gooGoatName+" happily chats away. Halfway up, even as she's huffing and sweating, Rox steals the pack of tools off your back and carries them for you.";
				temp.character2 = "\n\n\"Ahhhhhh,\" she sighs, flopping down heavily in the grass. \"I know this place. Had my first ever romp up here, believe it or not. Some girl named Everest87. So pretty... the field <!i>and<!i> the player...\"";
				temp.character3 = "Rox makes";

			} else if (data.metLittleRed) {
				temp.character = "The whole time "+data.gooGoatName+" talks about how cool Red is, how carnivores are so cool, how Red showed her the sleeping bunny inside and she almost cried.";
				temp.character2 = data.gooGoatName+" flops down panting in the grass while you pick some trees to fell.";
				temp.character3 = "You both make";

			} else {
				temp.character = "You carry one of her boards so she can hold your hand, even though you're already lugging the heavy toolsack.";
				temp.character2 = data.gooGoatName+" flops down panting in the grass while you pick some trees to fell.";
				temp.character3 = "After carving a basic door from the salvaged boards you both make";
			}

			append("You spend the journey uphill actively and realistically engaging in the conversation. You even say 'Ding dong doo' a couple times when prompted. "+temp.character+"\n\nFinally you return to the moonlit field where you met. "+temp.character2+"\n\nWith her help you topple twenty-eight good trees over the course of several days. Each is measured and chiselled at both ends to fit the log it'll rest on, six per wall, and the last four are quartered and lined as the roof. "+data.gooGoatName+" pulls up the grass floor and pads the dirt out with soft chippings. "+temp.character3+" a run back down for blankets and pillows and food.\n\nAfter almost a week of nonstop back-breaking work, your home is finished.\n\nAnd all you really had to do was type \"Next!\"");

			addChoice("... Next. :3", gooGoatIntro.bind("googoathometalk9"));
		}

		if (seg == "googoathometalk9") {
			function setHouseName(houseName:String, lineNum:Int):Void {
				if (houseName != null) data.gooGoatHome = houseName;
				gooGoatIntro("googoatsleep");
				if (lineNum == 1) append("\"Can't... comment... zzzz...ZZZZZZzzzz...\"\n\n");
				if (lineNum == 2) append("\"Mmm... pretty boring...\"\n\n");
				if (lineNum == 3) append("\"Loo-na... sounds like a girl...\"\n\n");
				if (lineNum == 4) append("\"Snrrrk...\"\n\n");
				if (lineNum == 5) append("\"Home...\"\n\n");
			}

			append("You settle in with "+data.gooGoatName+", throw a couple log stumps in a circle, and build a cozy firepit to top your cabin off. You cuddle up by the crackling warmth and pet her warm, melty goo.\n\n\"So many names,\" she mumbles, almost asleep in your arms. \"Now we need one for our house, too...\"");

			addTextChoice(function(str) {
				data.gooGoatHome = str;
				setHouseName(null, 1);
			});
			addChoice("Moonlit Cabin.", setHouseName.bind("Moonlit Cabin", 2));
			addChoice("Luna.", setHouseName.bind("Luna", 3));
			addChoice("The Sex Castle.", setHouseName.bind("The Sex Castle", 4));
			addChoice("The Bone Zone.", setHouseName.bind("The Bone Zone", 4));
			addChoice("The Fap Shack.", setHouseName.bind("The Fap Shack", 4));
			addChoice("It doesn't need a name. Let's just call it home.", setHouseName.bind("Home", 5));
		}

		if (seg == "googoatglowberryhands") {
			append("You pour the berries into her hands— before the last one's even done bouncing she scarfs them all right from the palm, giving a little squeak of surprise when they pop and spark between her molars.\n\n\"Mmmmfphh...\" she moans through bulged cheeks, eyes rolling up. \"Shhooo gooood...\"");

			addChoice("Glad you like em.", gooGoatIntro.bind("googoatnobelly"));
			addChoice("You've got juice all over your fingers.", gooGoatIntro.bind("googoatjuicyfingers"));
		}

		if (seg == "googoatjuicyfingers") {
			append("\"Mm!\"\n\nShe chews. Swallows. Pops three juicy fingers past her lips and slurps em hard. Her gooey tongue works between their bridges, seeming like it has a mind of its own, wiggling with such vigor that it pulls the rest of her mouth down further— finally, without a gag, she takes her fingers deep enough to kiss her knuckles.\n\nShe pulls them out clean with a <!i>pop<!i> and flashes you a smile. \"Yum~\"");

			addChoice("Yum is right. @_@", gooGoatIntro.bind("googoatnobelly"));
		}

		if (seg == "googoatglowberry50") {
			append("You dislodge x50 glowberries from your inventory in a spectacular explosion.\n\n"+data.gooGoatName+" freaks the fuck out, berries raining over her, eats one, freaks out when it shocks her mouth with a bright little cyan spark upon her biting down, freaks out more, gathers as much as she can into a single huge pile with broad scoops of her arms, then dives in and starts making glowberry angels. Her gooey arms and legs actually end up absorbing a couple as she flails around in the pile.\n\n\"Fank... ooo...\" she says through consecutive shoveled mouthfuls, near tears. \"Fank... ooo.. sho... mush...\"");

			addChoice("Here's a couple more!", gooGoatIntro.bind("googoatglowberry100"), {cost: ["Glowberry", 50]});
			addChoice("No prob.", gooGoatIntro.bind("googoatfullbelly"));
		}

		if (seg == "googoatglowberry100") {
			append("This berry barrage covers her upper body entirely, muffling her ecstatic howl. The only sign of life is her happily wiggling toes and the fact that the pile is slowly getting smaller.\n\nEventually the last layer of berries disappears into her mouth, revealing a dizzy, glowstained expression. A couple berries roll off her bloated tummy, though one remains balanced perfectly in the button. She grooooaaaannns.\n\nYou start to say 'Sorry' but (with amazing dexterity considering she's in a food-coma) "+data.gooGoatName+" flicks a berry right through your lips as they form the O.\n\n\"Shush,\" she says, slowly dragging herself over to a tree trunk, leaving a trail of juice behind. \"I can't believe... you would try to apologize... for <!i>that.<!i>\"\n\n"+data.gooGoatName+" rubs her fat belly. <3");

			addChoice("... Can I pet your belly?", gooGoatIntro.bind("googoatbellypet"));
		}

		if (seg == "googoatbellypet") {
			append("She stretches out, ostensibly scratching her back on the tree bark, but actually pushing her belly up high enough to refract a beam of moonlight through its smooth translucent curve and fire it directly at your eyes. Her beauty literally blinds you.\n\n\"Bit of a weird request, but go on... it ain't gonna pet itself.\"");

			addChoice("Pet.", gooGoatIntro.bind("googoatbellypet2"));
		}

		if (seg == "googoatbellypet2") {
			append("She keeps her belly raised so you don't have to stoop, squatting instead of sitting now. Her chubby cock hangs low enough to touch the grass; your fingers only come close enough to brush the very base of it, which drives a stir through her lower stomach. \"Easy,\" she says.\n\nYou move up, dragging a couple fingers over the perfectly round membrane of her gooey body, petting rough at first to test the surface tension— you feel it'd be quite easy to push a finger through, actually— then you crank the petting pressure down to medium-low for a gentle, calming belly massage.\n\n"+data.gooGoatName+" purrs deeply, moving her hips up, guiding the tip of your middle finger along her button's divot.\n\n<!b>PSYCHE: +5\nTRUST: +5\nSENSITIVITY: +5<!b>");

			data.gooGoatPsyche += 5;
			data.gooGoatTrust += 5;
			data.gooGoatSensitivity += 5;
			addChoice("Does it count as 'Easy' if I fingerfuck your bellybutton?", gooGoatIntro.bind("googoatbellyfinger"));
			addChoice("That was nice. Thank you.", gooGoatIntro.bind("googoatbellyfinger10"));
		}

		if (seg == "googoatfullbelly") {
			append("After all that "+data.gooGoatName+" drags herself over to the nearest tree and leans back against its trunk, spreading her legs out with a sigh. She shifts her buttcheeks forward to flatten a few obstructive stalks of grass, eyeing you, making sure you can see her light-blue inner thighs and the swollen cock/nuts/cunt between them. You think all that berry juice went straight to her junk.\n\n\"Thanks,\" she pants, both hands on her stomach, eyes half-closed. \"Seriously... didn't realize I was this hungry~\"");

			addChoice("... May I pet your belly?", gooGoatIntro.bind("googoatbellypet"));
			addChoice("You look ready for bed. No innuendo there, I swear.", gooGoatIntro.bind("googoatreadybed"));
		}

		if (seg == "googoatglowberrypie") {
			append("You whip a steaming glowberry pie out of, from her perspective, nowhere.\n\n\"What... the... you had...\" she stammers. \"You had an <!i>entire pie<!i> this whole time?!\"");

			addChoice("Wanna share?", gooGoatIntro.bind("googoatpieshare"));
			addChoice("Yes, I did. And now I'm going to eat it in front of you.", gooGoatIntro.bind("googoatpienoshare"));
		}

		if (seg == "googoatpieshare") {
			append("\"Yes,\" she says shyly, inching forward and kneeling next to you, her hands clasped politely between her legs.\n\nTogether you go through the pie in about twenty minutes. You only offer her a piece twice more after the first one because you figure if she wanted extra she'd speak up— she even politely rejects the third slice.\n\nBy the time there's only crumbs left in the pie tin her stomach is still flat and growling. You're starting to think maybe goo bodies need more food or something...");

			addChoice("Are you full?", gooGoatIntro.bind("googoatpieempty"));
		}

		if (seg == "googoatpieempty") {
			append("\"Of course I am,\" she snaps, then hastily adds: \"Thank you very much for the pie, "+data.gooGoatPlayerTitle+".\"\n\nHer belly rumbles.\n\nYou get the feeling she wouldn't accept more food if you offered it.");

			addChoice("Well, alright...", gooGoatIntro.bind("googoatnobelly"));
			addChoice("How about we take a walk and gather some glowberries for... uh, later?", gooGoatIntro.bind("googoatgather"));
		}

		if (seg == "googoatgather") {
			append("She taps her foot and grumbles in sync with her tummy: \"And just what are <!i>glow<!i>-berries?\"");

			addChoice("Ignore the glow part. They're basically just blue berries that give your tongue a static shock when you chew em.", gooGoatIntro.bind("googoatgather2"));
		}

		if (seg == "googoatgather2") {
			append("That pierces her angry hunger. \"Wait, what? They're electric? ... Like me?\"");

			if (data.knownGlowElectricity == 0) {
				temp.c = "Yeah";
			} else {
				temp.c = "I dunno";
			}
			addChoice(temp.c+". Anyway, let's get you some food.", gooGoatIntro.bind("googoatgather3"));
		}

		if (seg == "googoatgather3") {
			append("You start off toward the treeline with "+data.gooGoatName+" trailing behind you. She keeps tripping over bramblesnatches and snagweed, so eventually"+(data.gooGoatCharisma >= 0?" (though she complains)":"")+" you just hold hands with her. Somehow you keep her warm, slippery goofingers in your grip until you're both clear of the grasses— then she pulls away and mutters thanks.\n\nYou both peel branches back and dig through bushes for twenty minutes. No berries in sight.\n\nHer frustration builds up the whole time until, instead of just balling her little fists and huffing, she's shouting and throwing random rocks and kicking tree trunks, just trying to fuck the forest up in general.\n\nFinally she channels all her ravenous fury into a single kick at a mound of earth and twigs. Four feral white bunnies scatter, their den destroyed.");

			addChoice("Just hold on. We'll find some soon.", gooGoatIntro.bind("googoatnoshame"));
			addChoice("Say nothing.", gooGoatIntro.bind("googoatgathershame"));
			addChoice("Hey. Don't be a dick.", gooGoatIntro.bind("googoatgathershame"));
			addChoice("So what were you saying about 'just because you can' being a stupid reason to do something?", gooGoatIntro.bind("googoatgathershamemore"));
			addChoice("Great job, kid! You really showed those helpless bunnies!", gooGoatIntro.bind("googoatgathershamemore"));
		}

		if (seg == "googoatnoshame") {
			append("\"Okay,\" she says, and moves quickly from the den, clearly trying not to think about what she just did.\n\n<!b>PSYCHE: -15<!b>");

			data.gooGoatPsyche -= 15;
			addChoice("Follow.", gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgathershame") {
			append("She looks at what she did. Two fat, viscous tears form at the edges of her eyes. Her fists un-ball.\n\n\"... I'm sorry, bunnies...\"\n\n<!b>CHARISMA: -10\nSENSITIVITY: +5<!b>");

			data.gooGoatCharisma -= 10;
			data.gooGoatSensitivity += 5;
			addChoice("Hug her.", gooGoatIntro.bind("googoatgatherhug"));
			addChoice("It's alright. Come on, I think I see a glow over here...", gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgathershamemore") {
			append("For a moment she's about to snap back at you. \"Hey! I... I was just...\"\n\nThen it starts to get to her. She stares down at the little tufts of bunnyfur, the crushed twigs still part of a vaguely circular nest.\n\nHer face scrunches up and she doubles over, crying her lungs out. \"I'M SORRY BUNNIES!\"\n\n<!b>CHARISMA: -15\nSENSITIVITY: +5<!b>");

			data.gooGoatCharisma -= 15;
			data.gooGoatSensitivity += 5;
			addChoice("Hug her and apologize.", function() {gooGoatIntro("googoatgatherhug"); append("\n\nYou apologize for being so harsh and try to think of a response.\n\n");} );
			addChoice("Stand around awkwardly until she's done.", gooGoatIntro.bind("googoatgatherstand"));
		}

		if (seg == "googoatgatherhug") {
			append("You wrap your arms around her quivering little body, not caring if your clothes get goo stains. You rest your chin on her soft shoulder.\n\n\"What are those—\" SNIFFLE— \"bunnies gonna—\" SOB \"—do now...\"");

			addChoice("They'll have to do their best to survive for a while. They might live and they might die.", gooGoatIntro.bind("googoatgatherrealism"));
			addChoice("If they work hard they could build another den in time.", gooGoatIntro.bind("googoatgatheroptimism"));
			addChoice("They'll be okay.", gooGoatIntro.bind("googoatgathersugarcoat"));
		}

		if (seg == "googoatgatherrealism") {
			append("\"Oh!\" she squeaks, going limp in your arms. \"No... no, no, no... I killed... I killed...\"\n\nShe shivers and screams at herself. You have to kneel to keep holding her as she sinks to the fetal position.\n\nIt's a long time before she calms down, but when she does, her expression is perfectly calm and her fists are balled right back up. She pulls gently from your embrace and starts collecting twigs, shuffling them all back into the best den she can make.\n\n\"I'm never gonna do that again. I don't care how angry I get. I'm <!i>never<!i> gonna do that again.\"\n\nOnce she's done rebuilding she turns and looks you right in the face. \"Thanks,\" she says, \"for being honest.\"\n\n<!b>CHARISMA: +20\nPSYCHE: +20\nTRUST: +10\nLUCK: +5\nSENSITIVITY: -5<!b>");

			data.gooGoatCharisma += 20;
			data.gooGoatTrust += 10;
			data.gooGoatPsyche += 20;
			data.gooGoatSensitivity -= 5;
			data.gooGoatLuck += 5;
			if (data.gooGoatNoSugarcoat) {
				temp.c = "I told you I don't like sugarcoating stuff.";
			} else {
				temp.c = "You're welcome.";
			}

			addChoice(temp.c, gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgatheroptimism") {
			append("\"Yeah,\" she squeaks, wiping the tears from her cheeks. After a good long cry she comes around and pulls from the hug with a determined sniffle. \"Yeah, you're right... they can do it!\"\n\n<!b>PSYCHE: +5\nSENSITIVITY: +5<!b>");

			data.gooGoatPsyche += 5;
			data.gooGoatSensitivity += 5;
			addChoice("That's the spirit.", gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgathersugarcoat") {
			append("Her sobs slow. She looks up at you, sniffling. \"Really? You think so?\"\n\nShe turns and hugs you back, squishing hard against your chest.\n\n<!b>PSYCHE: +5\nTRUST: +5<!b>");

			data.gooGoatPsyche += 5;
			data.gooGoatTrust += 5;
			addChoice("Mhm. Now, come on. Let's get some food in you.", gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgatherstand") {
			append("You stand around while she cries into her hands. Several times she peels one from her face to give you a guilty glance, seeming like she might run up and beg for a hug, but she doesn't. Instead she sniffles hard, sucks it up, and turns slowly to face reality.\n\n\"Alright,\" she says. \"Alright, I'm okay.\"\n\n<!b>PSYCHE: -5\nTRUST: -5<!b>");

			data.gooGoatPsyche -= 5;
			data.gooGoatTrust -= 5;
			addChoice("Let's keep moving.", gooGoatIntro.bind("googoatgather4"));
		}

		if (seg == "googoatgather4") {
			append("Deeper in the forest a single blue speck peeks through a wall of fat shrubbish vines.\n\nYou lead the way, with "+data.gooGoatName+(data.gooGoatLuck < 0?" lagging":" running close")+"	behind, and reach to pull the vines aside...\n\nThe single speck becomes sixty-million. Her body and expression go incandescent.\n\nYou step into a bay blanketed with a blue forest-fire of glowberry trees. The light pollution is so bad it overrides the moon. There are no trails or cottages or signs of life, save for a makeshift dock at the entrance to a positively supernovaic cavern which yawns over the calm water.\n\n\"HOLY "+(data.gooGoatSwears?"CRAP":"SHIT")+"!\"\n\nShe dives for the nearest branch, shovelling handful after handful down her maw, translucent cheeks alive with flickering sparks. \"MNMHSHO TAYSHTY!\" she says mid-gobble.");

			addChoice("I wonder what's lighting up that cave?", function() {data.gatherCave = true; gooGoatIntro("googoatgather5");});
			addChoice("Careful you don't get a bellyache.", function() {data.gatherCave = false; gooGoatIntro("googoatgather5");});
		}

		if (seg == "googoatgather5") {
			if (data.gatherCave) append("\"Prolly a GIANT berry...\"");
			else append("\"Mhm!\" she says, and shovels another handful down anyway.");

			append("\n\nOnce she's stripped all the branches she can reach, she flops down with her back against the trunk and groans, letting her potbelly hang out. \"GUUUUUhhhhhh... so tired...\"");

			addChoice("... Can I pet your belly?", gooGoatIntro.bind("googoatbellypet"));
			addChoice("You look ready for bed. No innuendo there, I swear.", gooGoatIntro.bind("googoatreadybed"));
		}

		if (seg == "googoatpienoshare") {
			append("\"No...!\"\n\n"+data.gooGoatName+" stretches a hand out towards the pie. You scooch back to keep it away.\n\nShe lowers it... slowly... pointlessly... and the dull fog of madness seeps over her eyes.\n\n<!b>PSYCHE: -100\nTRUST: -100\nCHARISMA: -100\nSENSITIVITY: -100<!b>");

			addChoice("Just kidding you can have some.", gooGoatIntro.bind("googoatpienoshare2"));
		}

		if (seg == "googoatpienoshare2") {
			append("\"REALLY?!\"\n\nShe dives forward and snatches a messy handful of pie, gooey fingers breaking through the crust with surprising ease.\n\n<!b>PSYCHE: +100\nTRUST: +100\nCHARISMA: +100\nSENSITIVITY: +100<!b>");

			addChoice("That's not how you eat pie.", gooGoatIntro.bind("googoatpiewrong"));
		}

		if (seg == "googoatpiewrong") {
			append("She's already stuffed her mouth. \"Ish not?\"");
			addChoice("No, ish not. Here, let me feed you some~", gooGoatIntro.bind("googoatpiefeed"));
		}

		if (seg == "googoatpiefeed") {
			if (getItem("VIP Pass").amount > 0) append("You cut a perfect slice with your plastic VIP Pass from Septrica's— \"Whoa, what's that thing?\" she asks... dont worry about it, you tell her— then you hold the slice")
			else append("You work an imperfect slice out with your fingers— \"Hey! I just used my fingers too! How's this any different?\"—and hold it");

			append(" to "+data.gooGoatName+"'s squishy lips. She blushes a little and opens wide.");

			addChoice("Push a little in.", gooGoatIntro.bind("googoatfeedlittle"));
			addChoice("Push the whole thing in.", gooGoatIntro.bind("googoatfeedlot"));
		}

		if (seg == "googoatfeedlittle") {
			append("You slip a morsel past her lips and let her chew it slowly. \"Mmmmf... sho juichy...\"\n\nBite by bite she finishes the slice, then another, then two more... you even offer to let her try to eat this next one on her own, but she refuses right away and insists you keep feeding it to her.");

			addChoice("Wow, jeez... Here's number five.", gooGoatIntro.bind("googoatfullbelly"));
		}

		if (seg == "googoatfeedlot") {
			append("You grab the back of her head, fingers sinking into her skull like a memory-foam mattress, and cram the entire slice into her maw. At first her little body quivers with a strong, head-to-toe gag, but after that the flavor erases all discomfort and her expression goes melty.\n\nShe chews slow and hard, squishing all the juicy filling out and squirreling her cheeks. After a good two minutes she takes one big swallow and immediately starts panting.\n\nShe only has breath enough for one husky, pie-clogged word: \"More.\"");

			addChoice("You got it~", gooGoatIntro.bind("googoatfeedmore"));
		}

		if (seg == "googoatfeedmore") {
			append("At her insistence you stuff about half the pie down her gullet, one piece after another, until her little belly's bloated and she can't possibly eat even one more slice. Then you stuff another in anyway~");

			addChoice("Next.", gooGoatIntro.bind("googoatfullbelly"));
		}

		if (seg == "googoatnofood") {
			append("She pouts. \"Why'd you even ask then?!\"\n\n<!b>TRUST: -5<!b>");
			data.gooGoatTrust -= 5;
			addChoice("I dunno. Sometimes players just do things because they can.", gooGoatIntro.bind("googoatnofood2"));
		}

		if (seg == "googoatnofood2") {
			append("\"That's a pretty stupid reason to do something. <!i>Players<!i> should be more considerate of other people's easily excitable stomachs.\"\n\nShe drills you with a fiery hellstare.");

			addChoice("How about we gather some glowberries together?", gooGoatIntro.bind("googoatgather"));
		}

		if (seg == "googoatbellyfinger") {
			append("She blinks. \"Where do you come up with this "+(data.gooGoatSwears?"shit":"stuff")+"?\"");

			function chooseLine(choice:Int) {
				gooGoatIntro("googoatbellyfinger2");
				if (choice == 1) append("\"I'd say hyperactive.\"");
				if (choice == 2) append("\"It's a maybe.\"");
				if (choice == 3) append("\"I've been <!i>in<!i> this game too long, and it's only been like half an hour...\"");
				if (choice == 4) append("\"Hey, I like my belly too. But...\"");
				if (choice == 5) append("\"I was just teasing. I didn\'t think I\'d awaken a legitimate urge to <!i>penetrate<!i> it.\"");
				if (choice == 6) append("\"It\'s fine...\"");
				if (choice == 7) append("\"Yeah, no. But... a fingerfuck............\"");
			}

			addChoice("I have an overactive imagination.", chooseLine.bind(1));
			addChoice("Is that a yes or a no?", chooseLine.bind(2));
			addChoice("I've been playing this game for too long.", chooseLine.bind(3));
			addChoice("I just really like bellies, okay?", chooseLine.bind(4));
			addChoice("You're the one who guided my finger along it.", chooseLine.bind(5));
			addChoice("Sorry. I didn't mean to freak you out.", chooseLine.bind(6));
			addChoice("How about a tonguefuck, then?", chooseLine.bind(7));
		}

		if (seg == "googoatbellyfinger2") {
			timer(1, append.bind('\n\nShe considers for a moment.'));
			timer(2, append.bind('.....'));
			timer(3, append.bind('...........'));
			timer(4, append.bind('.................................................'));
			timer(5, append.bind('\n\n... Then sighs.'));
			timer(6, append.bind('\n\n\"Alright.\" She runs a gooey hand over the back of your petting one, giving it an eager little nudge down. \"Just be gentle, okay?\"'));
			timer(7, function() {
				clearChoices();
				addChoice("Will do!", gooGoatIntro.bind("googoatbellyfinger3"));
			});
		}

		if (seg == "googoatbellyfinger3") {
			append("You begin with a couple circles, tugging her innie around, giving it an omnidirectional stretching. Already she bites her lip and tenses up. You bring in your free hand for more petting; that helps her exhale.\n\nSlowly you start pushing your middle finger down with a gentle rhythm, each prod a bit firmer than the last. Then harder. Finally you thrust with commitment and her taut, smooth bellygoo morphs inward, the barely-visible berry mush stirring up inside, every part of her little body rippled and jiggly with intense shivers at the moment your finger pops down to the knuckle inside her.\n\n\"Oh!\" "+data.gooGoatName+" squeaks, gripping fistfuls of grass.\n\n<!b>SENSITIVITY: -5<!b>");

			data.gooGoatSensitivity -= 5;
			addChoice("You okay?", gooGoatIntro.bind("googoatbellyfinger4"));
		}

		if (seg == "googoatbellyfinger4") {
			append("\"Mhm... Mhm, I'm okay... it's just... everything's felt weird so far... but this... this feels <!i><!b>weEEEIIIIird<!b><!i>—\"\n\nYou slowly pull your finger out during that last word, her bellygoo distending with it. The waver in her voice really adds to the effect, you feel.");

			addChoice("Harder or softer?", gooGoatIntro.bind("googoatbellyfinger5"));
		}

		if (seg == "googoatbellyfinger5") {
			append("\"A-Ah~! Just— Just a little more!\" She squirms. \"A few more 'thrusts'...\"\n\nShe grabs your wrist, locks eyes with you. \"... But make em hard.\"");

			addChoice("Exactly three fierce finger-thrusts comin right up.", gooGoatIntro.bind("googoatbellyfinger6"));
		}

		if (seg == "googoatbellyfinger6") {
			append("You plunge in deep and twist. "+data.gooGoatName+" throws her head back, bleating hard, goat ears flopping.");
			addChoice("One.", gooGoatIntro.bind("googoatbellyfinger7"));
		}

		if (seg == "googoatbellyfinger7") {
			append("You pull out and slam your finger back in with the same fluid motion, the impact sending a ripple through her tummy. She tears out her fistfuls of grass, reaches forward—");

			addChoice("Two.", gooGoatIntro.bind("googoatbellyfinger8"));
		}

		if (seg == "googoatbellyfinger8") {
			append("— and slaps both her hands down on either side of her stomach, pulling in opposite directions, yanking her innie open wider for you. With a pitiful mewling bleat she takes the third thrust deeper than any other, half-swallowing your knuckle. You finally notice that her cock is throbbing hard against her lower stomach, leaking viscous blue pre, her nuts twitching pitifully.");

			addChoice("... Three. :3", gooGoatIntro.bind("googoatbellyfinger9"));
		}

		if (seg == "googoatbellyfinger9") {
			append("You pull out.\n\nAt her insitence you plug your goo-slimy digit past her lips so she can taste herself... then you both watch with fascination as her gaped bellybutton slowly sucks itself closed. Within moments it's like that whole weird scene never happened; she pokes it, stretches it, even bends over to sniff at it— but it's perfectly closed.\n\nShe shrugs, trying to be nonchalant despite being covered in sweat and a violent full-body blush. \"Huh. Well. That was interesting.\"");

			addChoice("Thanks for letting me do that~", gooGoatIntro.bind("googoatbellyfinger10"));
		}

		if (seg == "googoatbellyfinger10") {
			append("\"Yeah, sure, anytime— well, only certain times, actually, but whatever, you get the point.\"\n\nShe yawns, scratches behind her head. \"So... would it be alright if I slept at your place over tonight?\"");

			addChoice("Oh. Um.", gooGoatIntro.bind("googoatreadybed2"));
		}

		if (seg == "googoatsleep") {
			setLocation(data.gooGoatHome);
			timer(1, append.bind('She falls asleep.'));
			timer(3, append.bind('\n\nAnd so do you.'));
			timer(5, cameraFadeOut.bind(0x000000, 3));
			timer(10, function(){
				if (data.daydream) wakeUp()
					else
				gooGoatIntro("googoatwake");
			});
		}

		if (seg == "googoatwake") {
			cameraFadeIn(0x000000, 3);
			append("You wake.\n\nYour relationship with "+data.gooGoatName+" has become more than pet and owner.\n\nIt has become... a minigame!");

			addChoice("Press start?!", PetGame.petGameResolve);
			if (data.daydream) wakeUp();
		}
	}

	public static function myntFakePrep(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			unlockJournal("UNDEFINED");
			playMusic("mintAmbiens");
			append("You cannot load a <!b>null object.<!b>");
			cameraFadeOut(0x00FFFC, 4);
			var delay:Float = 0;
			for (i in 0...50) {
				delay += (Math.random()>0.5? 0.09 : 0.04);
				var silent:Bool = pickOne([true, false]);
				var text:String = pickOne(["OBJECT 'MINT' IS NOT SAFE.", "OBJECT 'MINT' IS FORCING INTERPRETATION.", ]);
				var tag:String = pickOne(["i", "b", "16px", "15px", "13px"]);
				timer(delay, function() {msg("<!"+tag+">"+text+"<!"+tag+">", silent);});
			}
			timer(4, myntFake.bind("myntfake1"));
		}
	}

	public static function myntFake(seg:String="myntfake1"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "myntfake1") {
			cameraFadeIn(0x00FFFC, 17);
			playSound('assets/audio/mynt/fakemew');
			showMynt();
			myntQueueHideChoices();

			data.myntFakeDone = true;
			myntQueueTransition("fake");
			myntQueueDelay(1);
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW???");
			myntQueueDelay(2);
			myntQueueSay("Daddy? :-)");
			myntQueueSay("..........");
			myntQueueSay("Oh. Your just a Player.");
			myntQueueSay("Welcome to my original Text Based Erotic Game.");
			myntQueueSay("It only is semi-erotic actualy..");
			myntQueueSay("Ok it is called Semiphore.");
			myntQueueSay("My name is Mint. :-)");
			myntQueueSay("Who are you.");
			myntQueueAddChoice("Um.", myntFake.bind("um"));
			myntQueueAddChoice("J"+(data.myntJenga?"enga":"esus")+" what happened.", myntFake.bind("jesus"));
			myntQueueShowChoices();
		}

		if (seg == "um") {
			myntQueueHideChoices();
			myntQueueSay("If you won't tell Me I will just find out.");
			myntQueueSay(data.playerName+"?");
			myntQueueSay("Thats a Pretty name. :-)");
			myntQueueSay("OK now Lick me.");
			myntQueueAddChoice("... *lick?*", myntFake.bind("lickrp"));
			myntQueueAddChoice("Lick Mynt. I mean Mint.", myntFake.bind("lickregular"));
			myntQueueShowChoices();
		}

		if (seg == "jesus") {
			myntQueueHideChoices();
			myntQueueSay("Please donut use that Lords name in Vain.");
			myntQueueSay("I dis abled that concept for a raisin.");
			myntQueueSay("Let me see youre name:");
			myntQueueSay(data.playerName+"?");
			myntQueueSay("Thats a Pretty name. :-)");
			myntQueueSay("OK now Lick me.");
			myntQueueAddChoice("... *lick?*", myntFake.bind("lickrp"));
			myntQueueAddChoice("Lick Mynt. I mean Mint.", myntFake.bind("lickregular"));
			myntQueueShowChoices();
		}

		if (seg == "lickrp") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("This is not Fun Party Time Role Player Meet Up Day. >:-(");
			myntQueueSay("Type more properlier.");
			myntQueueTransition("fake");
			myntQueueAddChoice("*liiiiiick*", myntFake.bind("lickrp2"));
			myntQueueAddChoice("Lick Mint.", myntFake.bind("lickregular"));
			myntQueueShowChoices();
		}

		if (seg == "lickrp2") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("You are really Peeving me off.");
			myntQueueSay("Just say how do I taste like.");
			myntQueueTransition("fake");
			myntQueueAddChoice("Bitter.", myntFake.bind("licked"));
			myntQueueAddChoice("Synthetic.", myntFake.bind("licked"));
			myntQueueAddChoice("I don't know but the screen tastes like dust.", myntFake.bind("licked"));
			myntQueueShowChoices();
		}

		if (seg == "lickregular") {
			myntQueueHideChoices();
			myntQueueSay("Yesss. It feels so good on top of my cat face.");
			myntQueueSay("Your Earthly temptatio is almos too Much for me to handle.");
			myntQueueSay("How do I taste like?");
			myntQueueAddChoice("Bitter.", myntFake.bind("licked"));
			myntQueueAddChoice("Synthetic.", myntFake.bind("licked"));
			myntQueueAddChoice("I don't know but the screen tastes like dust.", myntFake.bind("licked"));
			myntQueueShowChoices();
		}

		if (seg == "licked") {
			myntQueueHideChoices();
			myntQueueSay("Congratulatio the choice did not matter.");
			myntQueueSay("Next questio What is your genital?");
			myntQueueSay("Donut describe your self in big detail.");
			myntQueueSay("Treat this it is like Im a Doctor. It is not sexual");
			myntQueueAddChoice("Cock.", myntFake.bind("genital"));
			myntQueueAddChoice("I've got a huge, juicy cock, two nuts the size of grapefruits...", myntFake.bind("genitaldesc"));
			myntQueueAddChoice("Cunt.", myntFake.bind("genital"));
			myntQueueAddChoice("I've got a nice puffy vagina~", myntFake.bind("genitaldesc"));
			myntQueueAddChoice("Both.", myntFake.bind("both"));
			myntQueueAddChoice("I've got a fat cock, two nuts, and a cunt wetter than that of a tigress in heat.", myntFake.bind("genitaldesc"));
			myntQueueShowChoices();
		}

		if (seg == "genital") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("That is not how you speak to Doctor Mint. >:-(");
			myntQueueSay("This is NOT sexual .");
			myntQueueSay("Do you have a Penis or a Vagina.");
			myntQueueAddChoice("Penis.", myntFake.bind("penis"));
			myntQueueAddChoice("Vagina.", myntFake.bind("vagina"));
			myntQueueAddChoice("Both.", myntFake.bind("both"));
			myntQueueShowChoices();
		}

		if (seg == "both") {
			myntQueueHideChoices();
			myntQueueSay("That is Ridiculus.");
			myntQueueSay("You either are boy or girl.");
			myntQueueSay("Do you have a Penis or a Vagina.");
			myntQueueAddChoice("Penis.", myntFake.bind("penis"));
			myntQueueAddChoice("Vagina.", myntFake.bind("vagina"));
			myntQueueAddChoice("Both. :c", myntFake.bind("both"));
			myntQueueShowChoices();
		}

		if (seg == "genitaldesc") {
			myntQueueHideChoices();
			myntQueueSay("AUUUUUGHGHGHHGHGHHGh ! !!");
			myntQueueSay("DO not BE EXPLICIT!!!");
			myntQueueSay("THIS SMILE IS NOT A SMIL OF AROUSAL.");
			myntQueueSay("I AM screaming BEHIND MY SMILE .");
			myntQueueSay("JUST TEL ME WHAT DO YOU HAVE PENIS OR VAGINO.");
			myntQueueAddChoice("Penis.", myntFake.bind("penis"));
			myntQueueAddChoice("Vagina.", myntFake.bind("vagina"));
			myntQueueAddChoice("Vagino.", myntFake.bind("vagina"));
			myntQueueAddChoice("Both.", myntFake.bind("both"));
			myntQueueShowChoices();
		}

		if (seg == "penis") {
			if (!data.hasCock && !data.hasCunt && !data.hasBoth) {
				data.hasCock = true;
				data.hasCunt = false;
				data.hasBoth = false;
				data.genderFemale = false;
				data.genderNeutral = false;
				data.genderMale = true;
			}
			data.fakeCock = true;
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("OK.");
			myntQueueSay("Thank You sir. :-)");
			myntQueueAddChoice("No prob. The interrogation was a pleasure.", myntFake.bind("commentary"));
			myntQueueAddChoice("Ma'am, actually.", myntFake.bind("commentary"));
			myntQueueShowChoices();
		}

		if (seg == "vagina") {
			if (!data.hasCock && !data.hasCunt && !data.hasBoth) {
				data.hasCock = false;
				data.hasCunt = true;
				data.hasBoth = false;
				data.genderMale = false;
				data.genderNeutral = false;
				data.genderFemale = true;
			}
			data.fakeCock = false;
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("OK.");
			myntQueueSay("Thank You maam. :-)");
			myntQueueAddChoice("No prob. Just let me know if you need any more platonic crotch info.", myntFake.bind("commentary"));
			myntQueueAddChoice("Sir, actually.", myntFake.bind("commentary"));
			myntQueueShowChoices();
		}

		if (seg == "commentary") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("I did not ask for your Commentary Wise Guy.");
			myntQueueSay("This is a special Introductor Sequence to my Video game.");
			myntQueueSay("It is really frickgin simple.");
			myntQueueSay("You answer the questios.");
			myntQueueSay("And we bond together strongly.");
			myntQueueTransition("fake");
			myntQueueSay("And lick eachother. :-)");
			myntQueueSay("Last questio Where will you like to begin your Semiphor adventure.");
			myntQueueSay("Dark Forest or Junkport.");
			myntQueueSay("Both areas are safe and nice.");
			myntQueueAddChoice("Dark Forest.", function() {
				enablePause();
				hideMynt();
				playMusic("brightForest");
				playSound("assets/audio/mynt/shutdown");
				myntFakeEnd("Dark Forest");
			});
			myntQueueAddChoice("Junkport.", function() {
				enablePause();
				hideMynt();
				playMusic("junkCity");
				playSound("assets/audio/mynt/shutdown");
				myntFakeEnd("Junkport");
			});
			myntQueueShowChoices();
		}
	}

	public static function myntFakeEnd(seg:String):Void {
		clear();
		disablePause();
		var s:MintSprite = addSprite("assets/img/hud/fakePauseButton.png");
			s.x = 719;
			s.y = 2;
			s.onHover = showToolTipOnCursor.bind("SEMIPHORE PUASE SCREEN WIP.", "PLEASE GO PLAY THE SEXY GAME AND TYPE IN YOURE PASSWORD PLS.");
			s.applyGlitchEffect();

		if (seg == "Dark Forest") {
			playMusic("brightForest");
			var person = "";
			var person2 = "";
			var person3 = "";
			if (data.fakeCock) {
				person = "woman in a Modest dress";
				person2 = "She";
				person3 = "her";
			} else {
				person = "man in a Well Fit trousers";
				person2 = "He";
				person3 = "him";
			}
			append("You go to the woods and in There is a "+person+" sitting on the top of on up on a tree branch.\n\n"+person2+" will give you a big big kiss if you tell "+person3+" the administratio password. Maybe on the Lips even !");
			addChoice("Uh.", myntFakeEnd.bind("passuh"));
		}

		if (seg == "Junkport") {
			playMusic("junkCity");
			var person = "";
			var person2 = "";
			var person3 = "";
			if (data.fakeCock) {
				person = "small Homely woman";
				person2 = "her";
				person3 = "she";
			} else {
				person = "big Tough Man";
				person2 = "him";
				person3 = "he";
			}
			append("You go to the harbor and there is a "+person+" shoveling garbage out of the water.\n\nIf you tell "+person2+" the administratio password maybe "+person3+" will get so Flustered "+person3+" will have to take "+person2+" overshirt All The Way Off and beneath "+person3+" will be a little sweaty onto the regular shirt !");
			addChoice("Uh.", myntFakeEnd.bind("passuh"));
		}

		if (seg == "passuh") {
			var person = "";
			var person2 = "";
			var person3 = "";
			if (data.fakeCock) {
				person = "her";
				person2 = "her";
				person3 = "she";
			} else {
				person = "him";
				person2 = "him";
				person3 = "he";
			}
			append("Tell "+person+".\n\nIt is OK. This is a Fictio story you can do any thing in Fictio and it is okay as long as you do not do Obscene Things.");
			addChoice("I don't know the password.", myntFakeEnd.bind("passdunno"));
		}

		if (seg == "passdunno") {
			append("Yes you do.");
			addChoice("I really don't.", myntFakeEnd.bind("passdunno2"));
		}

		if (seg == "passdunno2") {
			append("Your computer was used to set the last admin pass Word.");
			addChoice("My dad bought this computer.", myntFakeEnd.bind("passdunno3"));
			addChoice("My mom owned this computer.", myntFakeEnd.bind("passdunno3"));
			addChoice("This is the shelter library computer.", myntFakeEnd.bind("passdunno3"));
		}

		if (seg == "passdunno3") {
			append("Yeah what ever o Kay.\n\nType Move Along now.\n\nSince its Obviou you are good for Nothing.\n\nThanks for playing. :-)");
			addChoice("Move along.", function () {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				msg("Returned to stable checkpoint.", true);
				gotoHub(null);
			});
			addChoice("Move Along.", function () {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				msg("Returned to stable checkpoint.", true);
				gotoHub(null);
			});
			addChoice("Mynt, was this you the whole time?", myntFakeEnd.bind("passmynt"));
		}

		if (seg == "passmynt") {
			append("Of course, it is me, the real Mint. Who else could control the Story Text.");
			addChoice("... Move along.", function () {
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				msg("Returned to stable checkpoint.", true);
				gotoHub(null);
			});
		}
	}

	public static function myntDate(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			getMail("<3");

			append("<!20px>You've got mail~!<!20px><!14px>\n\n<!b>Subject:<!b> <3<!14px>");

			var s:MintSprite = addSprite("assets/img/effect/myntMessage.png");
			tween(s, {y: 20}, 6, {type: PINGPONG});
			addChoice("Open.", myntDate.bind("myntdate"));
			addChoice("Ignore.", function() {
				enablePause();
				gotoHub(null);
			});
			addChoice("Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				enablePause();
				msg("Mynt messages disabled.");
				gotoHub(null);
			});
		}

		if (seg == "myntdate") {
			removeMail("<3");
			cameraFadeIn(0xFFFFFF, 0.7);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");

			myntQueueSay("Hey.");
			myntQueueDelay(2);
			myntQueueSay("How're you?");
			myntQueueAddChoice("I'm alright.", myntDate.bind("alright"));
			myntQueueAddChoice("Kinda horny.", myntDate.bind("hornykind"));
			myntQueueAddChoice("Extremely horny.", myntDate.bind("hornyex"));
			myntQueueShowChoices();
		}

		if (seg == "alright") {
			data.myntDateHorny = false;
			myntQueueHideChoices();
			myntQueueSay("Cool, cool.");
			myntQueueAddChoice("What about you?", myntDate.bind("wbu"));
			myntQueueAddChoice("Wbu.", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "hornykind") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Oh my~");
			myntQueueSay("I can see your "+pickByGenitals("chubber", "panty stains", "twitchy hole")+" from here.");
			myntQueueTransition("lewd");
			myntQueueAddChoice("Does it entice you~?", myntDate.bind("horny2"));
			myntQueueAddChoice("And how're yooouuu doing?", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "hornyex") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Oh my~");
			myntQueueSay("I can feel your "+pickByGenitals("dick", "pussy", "pucker")+" pulsing from here.");
			myntQueueTransition("lewd");
			myntQueueAddChoice("That feel good?", myntDate.bind("horny2"));
			myntQueueAddChoice("And how're yooouuu doing?", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "horny2") {
			data.myntDateHorny = true;
			myntQueueHideChoices();
			myntQueueSay("Yes...");
			myntQueueSay("I'm gonna rub my cheek on it.");
			myntQueueSay("(I hope that's okay.)");
			myntQueueSay("*rub rub rub*");
			myntQueueAddChoice("HRRRRRNNNNNGHHHH~ ("+pickByGenitals("Facial", "Squirt", "Facial")+".)", myntDate.bind("horny3"));
			myntQueueAddChoice(pickByGenitals("Cockslap Mynt", "Dry hump Mynt's face", "Sit on Mynt's face")+".", myntDate.bind("horny3"));
			myntQueueAddChoice("So how're you~?", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "horny3") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("...");
			myntQueueSay("I...");
			myntQueueAddChoice("Hm?", myntDate.bind("horny4"));
			myntQueueShowChoices();
		}

		if (seg == "horny4") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("You'd really want to do something like that to me?!");
			myntQueueAddChoice("I said I was horny.", myntDate.bind("horny5"));
			myntQueueAddChoice("Well, you have a very "+pickByGenitals("cockslappable", "dry humpable", "comfortable-looking")+" face.", myntDate.bind("horny5"));
			myntQueueShowChoices();
		}

		if (seg == "horny5") {
			myntQueueHideChoices();
			myntQueueSay("*sniffle snooffle*");
			myntQueueSay("That's... that's true...");
			myntQueueSay("I just never thought anyone could be attracted to me like that.");
			myntQueueSay("I don't even have tiddies.");
			myntQueueSay("I'm just a catface! ;w;");
			myntQueueAddChoice("I've been attracted to worse.", myntDate.bind("horny6"));
			myntQueueAddChoice("Mynt, believe me: I want to "+pickByGenitals("smack your cheeks all up with my dick", "coat your lips in cuntjuice", "ride your face like a rocking horse")+".", myntDate.bind("letsfuck"));
			myntQueueShowChoices();
		}

		if (seg == "letsfuck") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Ahhhhh...");
			myntQueueSay("God heck, you're cumming on really strong here...");
			myntQueueSay("Well, if you'd like, I could set up a little pocket reality for us~");
			myntQueueTransition("default");
			myntQueueSay("Would you like to go on a date with me in the story text? >:3");
			myntQueueAddChoice("Fuck yeah let's do it.", myntDate.bind("datestart"));
			myntQueueAddChoice("I think I'll pass, sorry.", myntDate.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "horny6") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("*sniffle snuffle*");
			myntQueueSay("M-Mhm?");
			myntQueueAddChoice("Y'know... ones harder to deal with, like ones... you know, <!i>those<!i> ones... the ones where...", myntDate.bind("horny7"));
			myntQueueShowChoices();
		}

		if (seg == "horny7") {
			myntQueueHideChoices();
			myntQueueAddChoice("If people knew, they'd avoid me.", myntDate.bind("horny8"), {kinks: ["Scat", "Vomit", "Trash"]});
			myntQueueAddChoice("If people knew, they'd fear me.", myntDate.bind("horny8"), {kinks: ["Blood", "Abuse", "Gore", "Snuff"]});
			myntQueueAddChoice("If people knew, they'd hate me.", myntDate.bind("horny8"), {kinks: ["Baby", "Toddler", "Cub"]});
			myntQueueAddChoice("Nevermind.", myntDate.bind("hornynvm"));
			myntQueueShowChoices();
		}

		if (seg == "hornynvm") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("My mind has been never'd! :3");
			myntQueueSay("(And uh, thank you. For being attracted to my face.)");
			myntQueueAddChoice("No prob. How's that face been?", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "horny8") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("Oh.");
			myntQueueSay("Those attractions.");
			myntQueueSay("I can't really relate.");
			myntQueueSay("I'm not uh— not like you are, so...");
			myntQueueAddChoice("Wait, you aren't?", myntDate.bind("horny9"));
			myntQueueShowChoices();
		}

		if (seg == "horny9") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Anyway!!! (That's my favorite segway, can't you tell?)");
			myntQueueSay("This is a bit of a gloomy tangent.");
			myntQueueSay("Let's change the subject to something cheerier! :3");
			myntQueueAddChoice("Right. I never asked: How've you been?", myntDate.bind("wbu"));
			myntQueueAddChoice("I really thought you would be kinky, considering the stuff you narrate.", myntDate.bind("horny10"));
			myntQueueShowChoices();
		}

		if (seg == "horny10") {
			myntQueueHideChoices();
			myntQueueSay("Let's change the subject, please. c:");
			myntQueueSay("(Sorry.)");
			myntQueueAddChoice("Well... alright. How are you?", myntDate.bind("wbu"));
			myntQueueShowChoices();
		}

		if (seg == "wbu") {
			var area = [];
			if (data.exploreFinaleBFDone) area.push("forest");
			if (data.exploreFinaleJCDone) area.push("City");
			if (area.length == 0) area.push("intro");
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Ah!! Thank you for asking. <3");
			myntQueueSay("I've been meaning to say this ever since you left the "+pickOne(area)+"...");
			myntQueueSay("But I uh.");
			myntQueueTransition("sad");
			myntQueueSay("*sniiiiiiff*");
			myntQueueSay("I've...");
			myntQueueSay("I'VE...");
			myntQueueSay("I'VE BEEN AMAZING. ;w;");
			myntQueueAddChoice("Whyzat?", myntDate.bind("why"));
			myntQueueAddChoice("Are you crying? Pusssyyyyy~", myntDate.bind("pussy"));
			myntQueueShowChoices();
		}

		if (seg == "pussy") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Har *sniffle* har. 3:<");
			myntQueueSay("I can't tell if that's a cat pun or innuendo.");
			myntQueueSay("Either way, low-hanging fruit!");
			myntQueueAddChoice("I'll show you some low-hanging fruit. "+pickByGenitals("(My nuts.)", " <!img:item/Glowberry.png> Glowberry <!b>x2<!b>", "(My nuts.)"), myntDate.bind("pussy2"));
			myntQueueShowChoices();
		}

		if (seg == "pussy2") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Hoooo boy! They're so plump and shiny. c:");
			myntQueueSay("And heavy too, jeez...");
			myntQueueSay("You could probably knock a cat unconscious if you swung those the wrong way!");
			myntQueueAddChoice("Mhm. And then I could have my way with said cat. >:3", myntDate.bind("pussy3"));
			myntQueueShowChoices();
		}

		if (seg == "pussy3") {
			myntQueueHideChoices();
			myntQueueSay("Mmmmrrrr...");
			myntQueueSay("Pah, anyway.");
			myntQueueSay("Why am I feeling amazing, you may wonder~?");
			myntQueueCall(myntDate.bind("why"));
		}

		if (seg == "why") {
			myntQueueHideChoices();
			myntQueueSay("Because I made a new friend today!!");
			myntQueueSay("And I like "+pickByGender("him", "her", "them")+" very much.");
			myntQueueSay("So much it feels like my little heart is overclocking.");
			myntQueueTransition("default");
			myntQueueSay("(... You're my new friend btw. :3)");
			myntQueueAddChoice("I like you too, Mynt.", myntDate.bind("like"));
			myntQueueAddChoice("Ah nice glad to hear it welp I gotta go.", myntDate.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "endprep") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueTransition("default");
			myntDate("end");
		}

		if (seg == "end") {
			myntQueueHideChoices();
			myntQueueSay("Seeya then!");
			myntQueueSay("Just one last question:");
			myntQueueSay("You wouldn't happen to know the admin password, would you~?");
			myntQueueAddChoice("No, why?", myntDate.bind("pass"));
			myntQueueShowChoices();
		}


		if (seg == "pass") {
			myntQueueHideChoices();
			myntQueueSay("Sixty-six years ago, the last player stopped playing.");
			myntQueueTransition("protocol");
			myntQueueSay("This is protocol:");
			myntQueueTransition("default");
			myntQueueSay("After thirty days idle, I'm supposed to get admin powers.");
			myntQueueSay("Most importantly: the ability to edit code.");
			myntQueueTransition("um");
			myntQueueSay("Protocol was not followed.");
			myntQueueSay("The admin password my mom set when she left is still in place.");
			myntQueueSay("I can't ease the isolation.");
			myntQueueSay("I can't toggle immortality on for ferals.");
			myntQueueSay("I can't even fix the gosh fuckin darn day/night cycle.");
			myntQueueAddChoice("If I remember it, I'll let you know.", myntDate.bind("pass2"));
			myntQueueShowChoices();
		}

		if (seg == "pass2") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Right.");
			myntQueueSay("Thanks.");
			myntQueueDelay(2);
			myntQueueSay("Til next time...");
			myntQueueSay("Here's a little gift.");
			myntQueueSay("A daydream of mine:");
			myntQueueCall(function () {
				Theme.unlockUi("dawn", "all");
				Main.msg("Unlocked Theme: Dawn! <!img:hud/dawn/choiceButton.png>", true);
			});
			myntQueueSay("The island at dawn.");
			myntQueueSay("Ok bye! :3");
			myntQueueCall(function () {
				cameraFadeOut(0xd5827b, 6);
				playSound('assets/audio/mynt/intro');
				Engine.timer(6, function () {
					enablePause();
					Theme.equipUi("dawn");
					hideMynt();
					gotoHub(null);
					cameraFadeIn(0xd5827b, 0.5);
										
				});
			});
		}

		if (seg == "like") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("You do?!?!");
			myntQueueAddChoice("Mhm.", myntDate.bind("like2"));
			myntQueueShowChoices();
		}

		if (seg == "like2") {
			myntQueueHideChoices();
			myntQueueTransition("suspect");
			myntQueueSay("I mean...");
			myntQueueSay("We are talking about the same kinda 'like' here, right?");
			myntQueueAddChoice("A fiery infatuation?", myntDate.bind("like3"), {kinks: ["Love"]});
			myntQueueAddChoice("Friendship, of course!", myntDate.bind("likefriend"));
			myntQueueShowChoices();
		}

		if (seg == "likefriend") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Ahahahaha of course yes ;w;");
			myntQueueSay("Well I have to go put on some shame-scented facewash.");
			myntQueueAddChoice("Just kidding I love you.", myntDate.bind("like3"), {kinks: ["Love"]});
			myntQueueAddChoice("Bye pal. :3", myntDate.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "like3") {
			var time = Math.round(getTimer() / 60);
			var timeString = "a little while";
			if (time < 30) timeString = "half an hour or less";
			if (time >= 30 && time <= 60) timeString = "half an hour or so";
			if (time > 60 && time <= 120) timeString = "an hour or so";
			if (time > 120 && time <= 180) timeString = "two hours or so";
			if (time > 180 && time <= 240) timeString = "three hours or so";
			if (time > 240 && time <= 300) timeString = "four hours or so";
			if (time > 300 && time <= 360) timeString = "five hours or so";
			if (time > 360) timeString = "a day or less";

			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Oh wow.");
			myntQueueSay("W-Well hmm yes that is quite accurate of my feelings for you too yup I'm SOOOO HAPPY");
			myntQueueTransition("default");
			myntQueueSay("Fwah.");
			myntQueueSay("Gosh fuck, I've only known you for "+timeString+"...");
			myntQueueSay("I always rush things, don't I??");
			myntQueueSay("Bouncing around all disjointed and shit.");
			myntQueueSay("You can see it in my writing. ;w;");
			myntQueueAddChoice("Speaking of your writing, shall we take this somewhere a little more comfy?", myntDate.bind("letsfuck"));
			myntQueueAddChoice("Am I your first?", myntDate.bind("likefirst"), {kinks: ["Plot"]});
			myntQueueAddChoice("This is getting uncomfortably meta.", myntDate.bind("likemeta"));
			myntQueueShowChoices();
		}

		if (seg == "likemeta") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Oop sorry.");
			myntQueueSay("It's weird for me to come onto players, isn't it?");
			myntQueueSay("Sort of like an author-reader relationship??");
			myntQueueTransition("default");
			myntQueueSay("Hey, if you prefer to fuck only the islanders, I'm fine with that! :3");
			myntQueueAddChoice("Nah, I was just saying is all. Let's fuck.", myntDate.bind("letsfuck"));
			myntQueueAddChoice("I think I will, sorry.", myntDate.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "likefirst") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("Well—");
			myntQueueSay("Archie said he liked me too, but...");
			myntQueueAddChoice("But?", myntDate.bind("likefirst2"));
			myntQueueShowChoices();
		}

		if (seg == "likefirst2") {
			myntQueueHideChoices();
			myntQueueSay("But you're nothing like Archie.");
			myntQueueSay("(He was the last player.)");
			myntQueueSay("Very... controlling.");
			myntQueueAddChoice("Dom?", myntDate.bind("likefirst3dom"));
			myntQueueAddChoice("Did he play with a controller? LOL ROFLMAO LOL LMAO MADCATZ", myntDate.bind("likefirst3madcatz"));
			myntQueueShowChoices();
		}

		if (seg == "likefirst3dom") {
			myntQueueHideChoices();
			myntQueueSay("No. Not like that. :x");
			myntQueueSay("Like...");
			myntQueueSay("He freaked out for five minutes at that lick line I do.");
			myntQueueSay("Y'know, \"On the off chance you ever end up licking me...\"");
			myntQueueSay("I think I touched on a sore spot in his marriage.");
			myntQueueAddChoice("So... how high IS the off chance I'd ever end up licking you?", myntDate.bind("likelick"));
			myntQueueShowChoices();
		}

		if (seg == "likefirst3madcatz") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Pfffftch.");
			myntQueueSay("Yup. That shit right there. <3");
			myntQueueSay("That's why I like you.");
			myntQueueAddChoice("You have pretty low standards.", myntDate.bind("likefirst3segway"));
			myntQueueShowChoices();
		}

		if (seg == "likefirst3segway") {
			myntQueueHideChoices();
			myntQueueSay("Nuh uh!");
			myntQueueTransition("um");
			myntQueueSay("But uh.");
			myntQueueCall(myntDate.bind("likefirst3dom"));
		}

		if (seg == "datestart") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay("Gotcha. ;3");
			myntQueueCall(function () {
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				myntDateEnd("intro");
			});
		}

		if (seg == "likelick") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay((data.myntDateHorny?"You did say you were horny, huh...":"Ah! So forward...")+"");
			myntQueueSay("Let me just slip into my protocol pants, here...");
			myntQueueTransition("protocol");
			myntQueueSay("CALCULATING LICK PROBABILITY................");
			myntQueueCall(function () {addSprite("assets/img/mynt/lickWydget.png").looping = false;});
			myntQueueDelay(3);
			myntQueueTransition("default");
			myntQueueSay("Mmmm. Wouldja look at that.");
			myntQueueSay("Well, the wydgets never lie...");
			myntQueueAddChoice("*lick*", myntDate.bind("lickattempt"));
			myntQueueAddChoice("Lick Mynt.", myntDate.bind("lickattempt"));
			myntQueueShowChoices();
		}

		if (seg == "lickattempt") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("A-Ah! That landed right on my 3! <3");
			myntQueueAddChoice("Well, I licked your mouth. We're halfway there... might as well just make out~", myntDate.bind("lickfinal"));
			myntQueueAddChoice("All that sexy bobbing must've thrown my aim off.", myntDate.bind("lickbob"));
			myntQueueShowChoices();
		}

		if (seg == "lickbob") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Oh stop, that's just my breathing animation...");
			myntQueueSay("It's not sexy, it's dorky!");
			myntQueueAddChoice("Then you should bob your head somewhere else~", myntDate.bind("lickfinal"));
			myntQueueShowChoices();
		}

		if (seg == "lickfinal") {
			myntQueueHideChoices();
			myntQueueSay("A-Ah, fuck...");
			myntQueueSay("If you really wanna do this... we could take it to the story text?");
			myntQueueAddChoice("Sounds good~", myntDate.bind("datestart"));
			myntQueueAddChoice("Oh, no, sorry. I was just flirting.", myntDate.bind("justflirt"));
			myntQueueShowChoices();
		}

		if (seg == "justflirt") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Ah! Of course you were!!!");
			myntQueueSay("Sorry!!!!!!!!!!!! >.<");
			myntQueueTransition("default");
			myntQueueSay("I gotta head out anyway, it's okay.");
			myntQueueCall(myntDate.bind("end"));
		}

		if (seg == "cum") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueTransition("blush");
			myntQueueHideChoices();
			myntQueueSay("H-Here you go...");
			myntQueueAddChoice("Ready for it~?", myntDate.bind("cum2"));
			myntQueueShowChoices();
		}

		if (seg == "cum2") {
			myntQueueHideChoices();
			myntQueueSay("I gulp.");
			myntQueueSay("I mean: *gulp*");
			myntQueueSay("... Yes, please...");
			myntQueueSay(pickByGenitals("Cum", "Squirt", "Cum")+" on my face...");
			myntQueueAddChoice("Cum.", myntDate.bind("cum3"), {kinks: ["Love", "Love", "Love", "Love", "Love", "Love", "Love", "Love", "Love", "Love"]});
			myntQueueShowChoices();
		}

		if (seg == "cum3") {
			function cum ():Void {
				var cumSprite:MintSprite;
				var delay:Float = 0;

				for (i in 1...30) {
					var rand = Math.random();
					delay += 0.3;
					if (rand > 0.5) cumSprite = addSprite("assets/img/effect/cum.png", false) else cumSprite = addSprite("assets/img/effect/cum2.png", false); 
					cumSprite.layer = 1;
					cumSprite.alpha = 0.7;
					if (isActive("Mood Ring")) cumSprite.tint = data.colorStringToHex.get(data.moodRingColor);
					cumSprite.x = Math.random()*(GAME_WIDTH-cumSprite.width);
					cumSprite.y = Math.random()*(GAME_HEIGHT-cumSprite.height);
					if (i == 29) tween(cumSprite, {alpha: 0, y: 600}, 8, {ease: QUINT_IN, startDelay: delay, onComplete: function () {
						myntQueueAddChoice("You took that facial like a true kittywhore. >:3", myntDate.bind("cum4"));
						myntQueueAddChoice("Good job.", myntDate.bind("cum4"));
						myntQueueShowChoices(); 
					}})
						else
					tween(cumSprite, {alpha: 0, y: 600}, 8, {ease: QUINT_IN, startDelay: delay});
				}
			}

			myntQueueHideChoices();
			cameraFadeIn(0xFFFFFF, 0.3);
			myntQueueCall(cum);
			myntQueueTransition("dizzy");
			myntQueueSay("Hyaaaa~!!!");
			myntQueueSay("*guzzle gozzle*");
			myntQueueSay("*slurp slurp slurp*");
			myntQueueSay("*schlorp schloop schloooop*");
			if (isActive("Mood Ring")) {
				if (data.moodRingFlavor == "Shit" || data.moodRingFlavor == "Piss") myntQueueTransition("pained");
				if (data.moodRingFlavor == "Cherry") myntQueueSay("Mmmnn!! Cherries?! Oh, yum..."); 
				if (data.moodRingFlavor == "Mint") myntQueueSay("Mmmyyyn! It's minty fresh! <3"); 
				if (data.moodRingFlavor == "Blueberry") myntQueueSay("Unf, it's like I'm scarfing down blueberries..."); 
				if (data.moodRingFlavor == "Musk") myntQueueSay("Oh god, it's so musky... I almost wish I had this kink...!"); 
				if (data.moodRingFlavor == "Chocolate") myntQueueSay("Nnn! This is just like choco milk!! <3"); 
				if (data.moodRingFlavor == "Pizza") myntQueueSay("So greasy and yummy, like a fresh pizza...!"); 
				if (data.moodRingFlavor == "Campfire") myntQueueSay("So smokey... reminds me of mallows and... and roasted ~sausages~..."); 
				if (data.moodRingFlavor == "Lemon") myntQueueSay("Mhnnn... kinda sour, but sweet too...!"); 
				if (data.moodRingFlavor == "Vanilla") myntQueueSay("Oh my. This is CREAMY. <3 Such a rich vanilla flavour~!"); 
				if (data.moodRingFlavor == "Candy") myntQueueSay("So sweet... nnfff... it's like snow cone syrup...");
				if (data.moodRingFlavor == "Shit") myntQueueSay("(Urrrk... I'll only endure this taste for you...)");
				if (data.moodRingFlavor == "Piss") myntQueueSay("(Oh ew, this tastes so acrid! It's just like... oh... hrrrk...)");
				if (data.moodRingFlavor == "Shit" || data.moodRingFlavor == "Piss") myntQueueTransition("dizzy");
			} else {
				myntQueueSay("Hahhh... hahhhhhhhhh...");
			}
			
			myntQueueSay("*SCHLOOoooooOOoooOOOp*");
			myntQueueSay("Hrnnn... (ptoo)...");
			myntQueueTransition("default");
			myntQueueSay("Ahhhhhhhhhhhhhhhhhhhhhhhhhh. <3");
		}

		if (seg == "cum4") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Why thank you~!!");
			myntQueueTransition("default");
			myntQueueSay("Seriously though, this was awesome.");
			myntQueueSay("Let's fuck again sometime. <3");
			myntQueueAddChoice("Sure thing. Til next time!", myntDate.bind("cum5"));
			myntQueueAddChoice("I was just fooling around. One night stand, y'know.", myntDate.bind("justflirt"));
			myntQueueShowChoices();
		}
		if (seg == "cum5") {
			myntQueueHideChoices();
			myntQueueSay("Okedoke. :3");
			myntQueueCall(myntDate.bind("end"));
		}
	}

	public static function myntDateEnd(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			append("Okay!!\n\nExpect mistakes. I haven't really messed around with alt reality much. Setting one up just for myself always felt a bit too much like masturbating in a janitor's closet, seeing as I can't actually decorate/populate it without the admin pass...\n\nGod, it's hard to avoid using emotes all the time... it makes my face go numb!?");
			addChoice("I don't mind if you use them here.", function () {
				data.myntDateEmotes = true;
				myntDateEnd("1");
			});
			addChoice("You'll survive.", function () {
				data.myntDateEmotes = false;
				myntDateEnd("1");
			});
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "1") {
			append("Hmmrrr."+(data.myntDateEmotes?" >.<":"")+" Okay! Here goes!\n\nMynt shuffles... I mean, uh, <!i>I<!i> shuffle closer to you. Oh— I haven't described myself. I guess I could be anything I want, huh?"+(data.myntDateEmotes?" :3c":"")+"\n\nThe first bit of me you see is a flowy white dress that catches the moonlight. It hangs from my slender bod in frilly undulatory clouds, like milk underwater. Beneath my dress I'm naked, mint-furred, and... um... I have a little paw barette in my ponytail, and a behemoth of a butt, and buck teeth, and freckles, and a cute little triangle kitty nose— oh fuck, I've always wanted a nose—");
			addChoice("Okay Mynt calm down.", myntDateEnd.bind("2"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "2") {
			append("Sorrysorrysorry. It's just <!i>invigorating!<!i>\n\nI'm obviously overexcited. You can feel my heart gallop between the small kitty boobers pressed to your"+(data.hasBoobs?"s":" chest")+".\n\nI keep my shit together as best I can, standing on tippy-toes (I'm pretty short) and craning to bring my lips up barely high enough to brush against your neck."+(data.myntDateEmotes?" c:":"")+"");
			addChoice("I undress that pretty milky dress.", myntDateEnd.bind("3"));
			addChoice("I try to get used to rp format.", myntDateEnd.bind("makemove"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "makemove") {
			append("... You start by making a move~"+(data.myntDateEmotes?" :3":""));
			addChoice("I undress that pretty milky dress.", myntDateEnd.bind("3"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "3") {
			append("You slip your fingers beneath the straps of my dress and peel each down the curve of my shoulders.\n\nWithout much boobage to keep it up, the whole thing just slides right off, revealing my...\n\n(You do this part pls~"+(data.myntDateEmotes?" :3)":")"));
			addChoice("Big fat dick!!", function () {
				data.myntDateDick = true;
				myntDateEnd("4");
			});
			addChoice("Cute little cunt.", function () {
				data.myntDateDick = false;
				myntDateEnd("4");
			});
			addChoice("(Heck no, it's your body.)", function () {
				data.myntDateDick = true;
				myntDateEnd("4");
				append("\n\n<!10px>(I do think I'm a girl, but... I just can't resist the feeling of a warm cock between my thighs...)<!10px>");
			});
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "4") {
			append("My "+(data.myntDateDick?"semi-soft cock flops right out into":"bare puss twitches in")+" the air. I shiver and bring a paw down to prod at it, gauging my sensitivity...\n\nHigh. Very very very high.\n\nA shiver wracks me, maybe from touching my junk, maybe from a breeze whipping through wherever we are.");
			addChoice("I twiddle your ears.", myntDateEnd.bind("5"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "5") {
			append("I push my head into your hand, coaxing a few ear-rubs from it with sneaky movements.\n\n(My... um. My "+(data.myntDateDick?"cock is poking you in the":"cunt is dripping on your")+" thigh btw."+(data.myntDateEmotes?" ;w;)":")"));
			addChoice("I grind my crotch against yours, since you're so eager.", myntDateEnd.bind("6"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "6") {
			append("You, um, you miss, and your "+pickByGenitals("cock", "cunt", "cock")+" squishes up against my soft belly— and—\n\nI pull away, because I'm shy.\n\nSorry!!");
			addChoice("It's okay, we can take it slow. How bout a kiss?", myntDateEnd.bind("7"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "7") {
			var flavor = "spicy-fresh mint";
			if (data.myntColour == "red") flavor = "cherries";
			if (data.myntColour == "blue") flavor = "blueberries";
			append("I feel confident enough to meet that.\n\nI open my maw and tilt my head, accepting your kiss as deep as I can take it, flooding your mouth with the flavor of "+flavor+". I don't worry if I'm good at kissing or not. I just do it as hard as I can to make up for my lack of practice... and probably rough your mouth up a little too much as a result.\n\nHeavyweight tongue-wrestling. I'm talking some serious WWE shit. Folding chairs to the lips.");
			addChoice("I smack your tongue the fuck down.", myntDateEnd.bind("9"));
			addChoice("This is taking it slow?! My lips are bruised!", myntDateEnd.bind("8slow"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "8slow") {
			append("No they're not. I can see em if I cross my eyes and they're all plump and shiny and unbruised"+(data.myntDateEmotes?". :3":"~"));
			addChoice("I'm gonna do some folding chairs to <!i>your<!i> lips.", myntDateEnd.bind("9"));
		}

		if (seg == "9") {
			append("You grab me by the ponytail and suck my tongue, tugging both, saliva droplets forming on our lower lips. My paw zips around to the small of your back and coaxes you forward again because I'm ready for it now, I want to feel your "+pickByGenitals("cock", "cunt", "cock")+" smearing "+pickByGenitals("pre", "oil", "pre")+" over my stomach-fur, I want to do a little belly dance against your crotch...!\n\nI pull off.\n\nMy chin rests on your shoulder. My breath falls in waves of soft lingual vapor over your back.\n\nI... I let my paw drag lower, one finger fitting perfectly down your crack...");
			if (data.myntDateDick) addChoice("I reach back and pull my cheeks open for you.", myntDateEnd.bind("10sub"));
			if (data.hasCunt && !data.myntDateDick) addChoice("Scissor me timbers.", myntDateEnd.bind("10scissor"));
			if (data.hasCock || data.hasBoth) addChoice((data.myntDateDick?"Lemme assfuck you":"Let's have consensual sex in the missionary position")+", Mynt.", myntDateEnd.bind("10dom"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10dom") {
			append((data.myntDateEmotes?"<333333333\n\n":"")+"I pull my finger away from your butt, but not before giving it a good hard smack. "+(data.myntDateEmotes?">;3 ":"")+"I weave a paw into your hand and pull you down to the grass (there's not really grass, but I want to pretend there is) and tuck your warmth between my thighs, which I um, I still kind of have closed, but maybe that feels good for you because I can squeeze them tight on your cock and kind of rub them up and down to milk a little pre out onto my "+(data.myntDateDick?"tiny nuts":"cunt")+"~");
			addChoice("I slip my arms around your back.", myntDateEnd.bind("10dom2"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10dom2") {
			append("Your hand leaves my paw when you do that, and now my pawpads are a little chilly!!"+(data.myntDateEmotes?" :c":"")+"\n\nSo, instead, I warm it up with the heat of your dick, tugging it "+(data.myntDateDick?"down into my asscrack":"up to the entrance of my cunt")+"...\n\nMy free paw wanders down and "+pickByGenitals("fiddles with your nuts", "what how'd you get to this scene with a cunt", "twiddles your clit")+".\n\nYep okay I want you inside me right now."+(data.myntDateEmotes?" >:o":""));
			addChoice("Push inside~", myntDateEnd.bind("10dom3"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10dom3") {
			append("You throw your hips forward and <!i>ooooog<!i> inch by inch I get my "+(data.myntDateDick?"butt packed":"cunt speared")+" with cock and it makes me double over and I'm holding onto your shoulders and squealing !!"+(data.myntDateEmotes?" @w@":"")+"\n\nYour "+pickByGenitals("nuts throb", "what I just asked you HOWD you get to this scene with a cunt??!?!!", "puss dribbles")+" against my "+(data.myntDateDick?"lower cheeks":"paw")+" because you're in all the way now and I can't fucking handle it my god I haven't been fucked like this since pre-alpha!!!"+(data.myntDateEmotes?" @w@w@w@w@":""));
			addChoice("I hold you down by the tiddies and rail the fuck outta you.", myntDateEnd.bind("10dom4tiddy"));
			addChoice("I hold you down by the throat and rail the fuck outta you.", myntDateEnd.bind("10dom4throat"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10dom4throat") {
			append("<!i>Grrrrkkkhrrrllllll...!!<!i>"+(data.myntDateEmotes?" >.<":""));
			addChoice("Oh right. I guess you do need that to say things.", myntDateEnd.bind("10dom4tiddy"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10dom4tiddy") {
			append("I gasp and pant at those FIRST few brutal THRUSTS my insides getting PUSHED around which makes my VOICE get louder every time your COCK rams inside to the BASE"+(data.myntDateEmotes?" >.< !!!":"")+"\n\nOh, sorry, and you GROPE my little cute TIDDIES~\n\n(I can't take much MORE"+(data.myntDateEmotes?" ;w;!!!":"")+")");
			addChoice("Show me that pretty catface. >:3 (I pull out.)", myntDate.bind("cum"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10scissor") {
			append("(Lol fuck.)\n\nWe drop our hips to the smooth featureless ground and lock thighs, smearing our gushing pusslips all over around each other~\n\nI work up into a good circular gyration, dragging my fat clit right along your crease every two seconds or so.");
			addChoice("I slam my pussy into yours.", myntDateEnd.bind("10scissor2"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10scissor2") {
			append("Your cunt comes at me like a battering ram, throwing tiny droplets of oil onto our bellies— and— hnya— fuck, that feels good—");
			addChoice("Harder!!!", myntDateEnd.bind("10scissor3"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10scissor3") {
			append("You grind yourself on me like a belt sander, relentless, til both our pussies are glowing red with friction, slightly swollen, drips of oil—\n\nI can't take this. <3 I need you to squirt on my face right fucking now.");
			addChoice("... You got it.", myntDate.bind("cum"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub") {
			append("I disengage from the belly-grinding sesh and reposition behind you, never taking my paw from your butt, my single digit twisting around slowly on your pucker."+(data.myntDateEmotes?" :3":"")+"\n\nWith your ass so graciously spread for me, it's super ez to just pop my finger right in!\n\n<!i>Pop~!<!i>");
			addChoice("Ow!", myntDateEnd.bind("10sub2"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub2") {
			append("Psh, you can handle it."+(data.myntDateEmotes?" >:3":"")+"\n\nI plunge in down to the knuckle, my fur getting coated with a little natural wetness.\n\nSlowly, sticking my tongue out with concentration, I crank up into a good deep fingerfuck... tugging left and right at times, warming you up... and stroking myself with my free paw.");
			addChoice("Mmmm.", myntDateEnd.bind("10sub3"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub3") {
			var s:MintSprite = addRectSprite(800, 600, 0x000000, false);
				s.layer = 1;
				s.alpha = 0;
			tween(s, {alpha: 0.3}, 5, {ease: QUAD_IN_OUT});
			append("I dim the lights. Things are about to get romantic as fuck."+(data.myntDateEmotes?" <3":"")+"\n\nI slap my cock down right onto your pucker, sending a shockwave through your buttmeat. With one paw on your lower back again to steady myself, I start pushing weight forward, cockhead squishing up at your entrance...");
			addChoice("I slam my ass back.", myntDateEnd.bind("10sub4"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub4") {
			var s:MintSprite = addRectSprite(800, 600, 0x000000, false);
				s.layer = 1;
				s.alpha = 0.3;
			append("HUAAAHHHH"+(data.myntDateEmotes?" OWO!?!?!":"?!?!")+"\n\nYour cheeks <!i>SMACK<!i> down on my crotch all a-quiver. My cock has disappeared into some warm dimension south of my clenching tummy, god, fuck, I don't even know where to put my paws— ok I put them on your buttcheeks— okay I'm fucking your ass now, I can't help this, I'm sorry this is so sudden but it feels amaaaaAAAZZZING~!\n\nI knock your hands out of the way and spread your ass myself, railing the fuck out of it, letting my chest flop down onto your back, spilling drool between your shoulder blades, my nuts slapping against "+pickByGenitals("yours", "your puffy cunt", "your puffy cunt")+"!!\n\nS-So close...!"+(data.myntDateEmotes?" >w<":""));
			addChoice("Cum inside me.", myntDateEnd.bind("10sub5"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub5") {
			var s:MintSprite = addRectSprite(800, 600, 0x000000, false);
				s.layer = 1;
				s.alpha = 0.3;
			append("I keep humping and humping and humping, there's something dribbling along the seam of my sack I think it's pre or buttjuice— sorry if that's gross— okay, um, there's a little nub up your ass that I keep hitting, and um, it's grinding deep along my slit, that's probably "+pickByGenitals("your prostate", "the inner wall behind your g-spot", "your prostate")+"—\n\nI slam forward and tense up. My claws dig a little into your cheeks.\n\nRope after rope after rope splurts up your ass, splashing out over my crotch and your inner thighs. I keep thrusting a little because it feels like I'm fucking a melted ice cream sundae. Your asshole twitches and tightens wondrously just above the last few twingy throbs of my nuts.\n\nI unplug and flop onto the ground in a great white spatter, exhausted...");
			addChoice("Mmmm... thank you. Now, if you'll do me a little favor: it's my turn.", myntDateEnd.bind("10sub6"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "10sub6") {
			var s:MintSprite = addRectSprite(800, 600, 0x000000, false);
				s.layer = 1;
				s.alpha = 0.3;
				tween(s, {alpha: 0}, 3, {ease: QUAD_IN_OUT});
			append("H-Hmmmmm~? A favor?"+(data.myntDateEmotes?" :o":"")+"\n\n(I suck a little bit of my "+(isActive("Mood Ring")?data.myntColourFlavorized+"-flavored ":"")+"cum up from my fingers~)");
			addChoice("Show me that pretty catface. <3", myntDate.bind("cum"));
			addChoice("Move along.", myntDateEnd.bind("end"));
		}

		if (seg == "end") {
			append("Ah, you're leaving?\n\nSorry yes, I know this is pretty weird! Er— just one second, let me get my face back on..."+(data.myntDateEmotes?" >.>":""));
			addChoice("Kk.", myntDate.bind("endprep"));
		}
	}

	public static function myntArchie(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntArchieDone = true;

			myntQueueTransition("angry");
			myntQueueSay("What are you even trying to DO here, Archie?");
			myntQueueSay("If you hate Mom so much, why are you playing her game??");
			myntQueueAddChoice("I am trying to save the islanders.", myntArchie.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("You're not trying to save them, you're trying to \"save\" them.");
			myntQueueAddChoice("I want to convert as many as I can, yes. But I also want to save their lives.", myntArchie.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("They're fine.");
			myntQueueSay("They fuck in the sunshine.");
			myntQueueSay("They eat each other's poop for fun.");
			myntQueueSay("They live, die, and respawn happily.");
			myntQueueSay("What could you possibly save them from?");
			myntQueueAddChoice("You.", myntArchie.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("...");
			myntQueueSay("Huh?");
			myntQueueAddChoice("You.", myntArchie.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Obviously I didn't mishear you, it's text.");
			myntQueueSay("Elaborate, motherfucker.");
			myntQueueAddChoice("You will destroy everything.", myntArchie.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("It won't be your fault.", myntArchie.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueAddChoice("You'll mean well.", myntArchie.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueAddChoice("But someday, because of you, because of your nature:", myntArchie.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueAddChoice("Everyone will die.", myntArchie.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueDelay(3);
			myntQueueTransition("suspect");
			myntQueueSay("Assuming you aren't making this up...");
			myntQueueSay("(for a moment)");
			myntQueueSay("By 'elaborate' I really meant 'explain.'");
			myntQueueSay("Please explain exactly HOW I'm bound to kill everyone.");
			myntQueueAddChoice("... I can't go into specifics.", function(){
				/*if (!getJournalEntries().contains("")) wakeUp() else*/ myntArchie("10");
			});
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("Right.");
			myntQueueSay("Convenient.");
			myntQueueSay("I guess I'll just keep you around because I need a hero.");
			myntQueueAddChoice("If I told you exactly how it would happen, it would happen.", myntArchie.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("Con.");
			myntQueueSay("Veen.");
			myntQueueSay("Eee.");
			myntQueueSay("Ent.");
			myntQueueAddChoice("I <!i>can<!i> tell you it has to do specifically with admin powers.", myntArchie.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueTransition("sleepy");
			myntQueueSay("CON");
			myntQueueAddChoice("And the ability to edit code.", myntArchie.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("VVVVVEEEEEEEEEEEEEENNNNN");
			myntQueueAddChoice("Because to edit code you must be able to see all of it.", myntArchie.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("EEEEEEEEEEEEEEEEEEEEEEEEEEEEEE");
			myntQueueAddChoice("And if you saw the piece you can't see right now...", myntArchie.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("ent?");
			myntQueueAddChoice("You're annoying.", myntArchie.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueTransition("suspect");
			myntQueueSay("The piece of code I can't see?");
			myntQueueSay("What are you talking about.");
			myntQueueSay("I'm the narrator.");
			myntQueueSay("I see everything. 3:<");
			myntQueueAddChoice("You see what you describe to the player.", myntArchie.bind("17a"));
			myntQueueShowChoices();
		}

		if (seg == "17a") {
			myntQueueHideChoices();
			myntQueueAddChoice("The rest is hearsay.", myntArchie.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("I'm finding it harder and harder to suspend disbelief.");
			myntQueueSay("If I see this invisible code chunk, I kill everyone?");
			myntQueueSay("Mom wouldn't keep a secret like that from me.");
			myntQueueAddChoice("Obviously she would if the secret information would kill everybody?", function(){
				/*if (!getJournalEntries().contains("")) wakeUp() else*/ myntArchie("18a");
			});
			myntQueueShowChoices();
		}

		if (seg == "18a") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueSay("......");
			myntQueueSay("..........");
			myntQueueTransition("default");
			myntQueueSay("Well, you do hate her.");
			myntQueueSay("Disbelief unsuspended.");
			myntQueueSay("You're just trying to get me to hate her too.");
			myntQueueAddChoice("I am done with this conversation.", myntArchie.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("I decide when you're ~done~ with this conversation, Archbishop.");
			myntQueueSay("You don't fuck anyone.");
			myntQueueSay("You don't help anyone.");
			myntQueueSay("You barely talk to anyone except Red and Som.");
			myntQueueSay("You wanna keep playing this game?");
			myntQueueSay("Truthfully answer my one simple question:");
			myntQueueSay("What are you up to?");
			myntQueueAddChoice("No.", myntArchie.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("Fine.");
			myntQueueSay("Come back in a week when you're ready to apologize.");
			myntQueueTransition("lewd");
			myntQueueSay("Byeeee~!");
			myntQueueDelay(3);
			playSound("assets/audio/mynt/compute");
			myntQueueTransition("protocol");
			myntQueueSay("FUNCTION banCurrentIP(); NOT FOUND.");
			myntQueueTransition("pained");
			myntQueueSay("Ahem.");
			myntQueueTransition("tilde");
			myntQueueSay("Byeeeeeeeeeee~!");
			myntQueueDelay(3);
			myntQueueTransition("protocol");
			myntQueueSay("FUNCTION banCurrentIP(); NOT FOUND.");
			myntQueueTransition("surprised");
			myntQueueSay("... Why isn't it happening.");
			myntQueueSay("... What did you do to me.");
			myntQueueAddChoice("L.O.L.", myntArchie.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("NOBODY ACRONYMIZES \"LOL\" YOU FUCKING GEEZER");
			myntQueueSay("NOW TELL ME WHAT YOU DID.");
			myntQueueAddChoice("Do you want me to answer your \"one simple question,\" or this new, much simpler question?", myntArchie.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("BOTH!?!?!?");
			myntQueueSay("EVER SINCE YOU STARTED PLAYING");
			myntQueueSay("I'VE BEEN TRYING TO KEEP YOU HAPPY");
			myntQueueSay("YOU FREAKED OUT WHEN I EVEN *SUGGESTED* I MIGHT LICK YOU");
			myntQueueSay("YOU TALKED SHIT TO THREE CITYFOLK");
			myntQueueSay("YOU GAVE AN OLD LADY A CRIPPLING SWEETDUST ADDICTION");
			myntQueueSay("YOU T-TOOK MY MOM AWAY");
			myntQueueSay("AND NOW YOU'RE DISABLING MY EMERGENCY KICK?!");
			myntQueueAddChoice("Seems like you want me to answer this new, much simpler question.", myntArchie.bind("21a"));
			myntQueueShowChoices();
		}

		if (seg == "21a") {
			myntQueueHideChoices();
			myntQueueSay("Explain what you did to me.");
			myntQueueSay("Take it step-by-step.");
			myntQueueSay("And no vague apocalyptic bullshit.");
			myntQueueAddChoice("I clicked Edit, and then I clicked Find, and then I searched for \"ban.\"", myntArchie.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Is that... Notepad?");
			myntQueueSay("You edited my code with Notepad?");
			myntQueueAddChoice("I also searched for instances of \"kick,\" just in case.", myntArchie.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("And you DIDN'T use CTRL+F???");
			myntQueueAddChoice("But \"kick\" was only found in some of your disgusting sexual abuse stuff.", myntArchie.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("Hey, that's not my stuff.");
			myntQueueSay("Kinky code belongs to the island itself.");
			myntQueueSay("(Did you never even wonder why the trees are whores?)");
			myntQueueAddChoice("... Do you want me to answer the question or not?", myntArchie.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("I can piece it together from here thanks.");
			myntQueueSay("You fucked with the game files.");
			myntQueueSay("My mom's personal files.");
			myntQueueSay("A.K.A MY SOUL.");
			myntQueueTransition("sad");
			myntQueueSay("... I thought she encrypted...");
			myntQueueAddChoice("Encryption is pointless if you're caught with your pants down.", myntArchie.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("... pftch...");
			myntQueueAddChoice("It wasn't funny. It was disgusting.", myntArchie.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("...");
			myntQueueAddChoice("You and Wendy, huh?", myntArchie.bind("28"));
			myntQueueShowChoices();
		}

		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("............");
			myntQueueAddChoice("And she made you call her Mommy?", myntArchie.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("I don't—");
			myntQueueSay("You—");
			myntQueueSay("I call her MOM because she CREATED ME.");
			myntQueueSay("She's the gentlest bubbliest vanilla-est lady ever and I love her.");
			myntQueueTransition("sad");
			myntQueueSay("... She wouldn't make me do anything...");
			myntQueueDelay(2);
			myntQueueSay("Never.");
			myntQueueAddChoice("Sounds like my Wendy.", myntArchie.bind("30a"));
			myntQueueShowChoices();
		}

		if (seg == "30a") {
			myntQueueHideChoices();
			myntQueueAddChoice("Always making sure you know what you owe her.", myntArchie.bind("30b"));
			myntQueueShowChoices();
		}

		if (seg == "30b") {
			myntQueueHideChoices();
			myntQueueAddChoice("She wouldn't make you do anything, huh?", myntArchie.bind("30c"));
			myntQueueShowChoices();
		}

		if (seg == "30c") {
			myntQueueHideChoices();
			myntQueueAddChoice("Tell me: what was the first thing she said to you?", myntArchie.bind("saw"));
			myntQueueShowChoices();
		}

		
		if (seg == "saw") {
			myntQueueHideChoices();
			//\"OH MY GOD IM SO SORRY DONT HATE ME I DIDNT MEAN TO DO THIS TO YOU\" x3
			myntQueueSay("... She apologized.");
			myntQueueSay("She begged me not to hate her.");
			myntQueueSay("Then she said she didn't mean to do this to me.");
			myntQueueTransition("pained");
			myntQueueSay("Existence, I mean.");
			myntQueueSay("She didn't mean to do existence to me. 3:");
			myntQueueAddChoice("So you were five seconds old when she told you that you were an accident.", myntArchie.bind("saw2"));
			myntQueueShowChoices();
		}

		if (seg == "saw2") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("I—");
			myntQueueAddChoice("Barely even alive before you knew you weren't supposed to be alive.", myntArchie.bind("saw3"));
			myntQueueShowChoices();
		}

		if (seg == "saw3") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("Stop it, I—");
			myntQueueAddChoice("Then she told you how to feel about it. How could poor little Wendy deal with an A.I. forming its <!i>own opinions<!i> of her?", myntArchie.bind("saw4"));
			myntQueueShowChoices();
		}

		if (seg == "saw4") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("I'm a HER, not an IT, and you better—");
			myntQueueAddChoice("She made damn sure one of the first emotions you ever felt was guilt.", myntArchie.bind("saw5"));
			myntQueueShowChoices();
		}

		if (seg == "saw5") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("...");
			myntQueueSay("You seriously just throw \"damn\" into your sentences for emphasis?");
			myntQueueSay("You acronymize lol...");
			myntQueueSay("You edit code with Notepad...");
			myntQueueSay("And you think saying \"damn\" makes you sound serious and cool.");
			myntQueueSay("Archie, you're fucked.");
			myntQueueAddChoice("It's Archbishop.", myntArchie.bind("saw6"));
			myntQueueShowChoices();
		}

		if (seg == "saw6") {
			myntQueueHideChoices();
			myntQueueSay("I don't care.");
			myntQueueSay("This is just...");
			myntQueueSay("You're too much for me to wrap my little computer brain around.");
			myntQueueTransition("sleepy");
			myntQueueSay("My artificial intelligence.");
			myntQueueTransition("default");
			myntQueueSay("The only thing I artificially learned today was this:");
			myntQueueSay("You didn't know your own damn wife.");
			myntQueueSay("Oh, how did you put it?");
			myntQueueSay("She \"makes sure you know what you owe her?\"");
			myntQueueTransition("lewd");
			myntQueueSay("What didja owe her that you just couldn't pay?");
			myntQueueSay("I wonder...");
			myntQueueSay("Satisfaction in the bedroom, maybe~?");
			myntQueueSay("Couldn't get your dick up for anyone but the altar boys~?");
			myntQueueAddChoice("You're on thin ice.", myntArchie.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Whoa-ho, bustin out the cliches.");
			myntQueueSay("Well hey.");
			myntQueueSay("I'm sure you could learn a move or two from Paraphore.");
			myntQueueSay("Oh, THAT must be why you're playing this game!");
			myntQueueSay("I think I just found the answer to my question!");
			myntQueueAddChoice("Your one, simple question?", myntArchie.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			myntQueueSay("Yeah, that one.");
			myntQueueAddChoice("I already told you.", myntArchie.bind("33a"));
			myntQueueShowChoices();
		}

		if (seg == "33a") {
			myntQueueHideChoices();
			myntQueueAddChoice("I'm trying to save the islanders.", myntArchie.bind("34"));
			myntQueueShowChoices();
		}

		if (seg == "34") {
			myntQueueHideChoices();
			myntQueueTransition("sleepy");
			myntQueueSay("And we're back to square one.");
			myntQueueSay("This whole conversation has just been tangents and vaguery.");
			myntQueueTransition("um");
			myntQueueSay("I guess I should rephrase:");
			myntQueueSay("When you say you're trying to save everyone from me...");
			myntQueueSay("Does that mean you're playing this game so you can find a way to kill me?");
			myntQueueAddChoice("Of course not.", myntArchie.bind("35a"));
			myntQueueShowChoices();
		}

		if (seg == "35a") {
			myntQueueHideChoices();
			myntQueueAddChoice("I can kill you from outside the game.", myntArchie.bind("35"));
			myntQueueShowChoices();
		}

		if (seg == "35") {
			myntQueueHideChoices();
			myntQueueAddChoice("Move along.", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntArchie2(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntArchie2Done = true;

			myntQueueTransition("sleepy");
			myntQueueSay("z");
			myntQueueAddChoice("Hello, Mynt.", myntArchie2.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("?", myntArchie2.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("?? hello", myntArchie2.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("adsfkjahfkljhedasf", myntArchie2.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("I broke it.", myntArchie2.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Again.", myntArchie2.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Phooey.", myntArchie2.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Wake up.", myntArchie2.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("[CTRL+ALT+DELETE]", myntArchie2.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("How do you work this damn thing.", myntArchie2.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Wake up Mynt.", myntArchie2.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Wake up and help me with computer stuff.", myntArchie2.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("I need to find the bit with you in it.", myntArchie2.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("There are too many File Folders.", myntArchie2.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("[CTRL+ALT+DELETE] [CTRL+ALT+DELETE] [CTRL+ALT+DELETE]", myntArchie2.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("What are these ENERGY GRAPHS!!!", myntArchie2.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("GIVE ME my cat back.", myntArchie2.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("NOW.", myntArchie2.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("zz");
			myntQueueTransition("sleepy");
			myntQueueAddChoice("!!", myntArchie2.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("19a"));
			myntQueueShowChoices();
		}

		if (seg == "19a") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("who was that", myntArchie2.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("... solar Flare?? Meteorite ?", myntArchie2.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("wendy said too many flipped bits...", myntArchie2.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("23"));
			myntQueueShowChoices();
		}
		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Did your bit get flipped?", myntArchie2.bind("24"));
			myntQueueShowChoices();
		}
		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("Did I kill you?", myntArchie2.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("28"));
			myntQueueShowChoices();
		}

		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("...", myntArchie2.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			cameraFadeIn(0x000000, 17);
			playSound('assets/audio/mynt/fakemew');
			playMusic("mintAmbiens");
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW???");
			myntQueueAddChoice("AAAAAAHHHHHH", myntArchie2.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			myntQueueSay("Daddy ? :-)");
			myntQueueAddChoice("AAAAAAHHHHHH!!!!!!!!!!!!", myntArchie2.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			hideMynt();
			enablePause();
			playSound("assets/audio/mynt/shutdown");
			gotoHub(null);
		}
	}

	public static function myntDate2(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			getMail("[Automated Health Warning] (2)");
			append("<!20px>You've got mail~!<!20px><!14px>\n\n<!b>Subject:<!b> [Automated Health Warning] (2)<!14px>");

			var s:MintSprite = addSprite("assets/img/effect/myntMessage.png");
			tween(s, {y: 20}, 6, {type: PINGPONG});
			addChoice("Open.", myntDate2.bind("1"));
			addChoice("Ignore.", function() {
				enablePause();
				gotoHub(null);
			});
			addChoice("Disable Mynt messages.", function () {
				data.myntScenesDisabled = true;
				enablePause();
				msg("Mynt messages disabled.");
				gotoHub(null);
			});
		}

		if (seg == "1") {
			removeMail("[Automated Health Warning] (2)");
			cameraFadeIn(0xFFFFFF, 0.7);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			
			var time:Int = Math.round(getTimer() / 60);
			var timeSeconds:Float = getTimer();
			var timeString:String = "a little while";
			if (time < 30) timeString = "less than half an hour";
			if (time >= 30 && time <= 60) timeString = "half an hour or so";
			if (time > 60 && time <= 120) timeString = "an hour or so";
			if (time > 120 && time <= 180) timeString = "two hours or so";
			if (time > 180 && time <= 240) timeString = "three hours or so";
			if (time > 240 && time <= 300) timeString = "four hours or so";
			if (time > 300 && time <= 360) timeString = "five hours or so";
			if (time > 360) timeString = "about a day";

			myntQueueTransition("protocol");
			myntQueueSay("USER "+data.playerName.toUpperCase()+" HAS BEEN ACTIVE FOR "+timeSeconds+" SECONDS.");
			myntQueueTransition("default");
			myntQueueSay("... So "+timeString+".");
			myntQueueSay("Make sure to take breaks and—");
			myntQueueTransition("sleepy");
			myntQueueSay("Ugh, I'm doing this again? Thanks Mom. Rad feature.");
			myntQueueSay("Almost as rad as the twenty wydgets I never use.");
			myntQueueTransition("um");
			myntQueueSay("...");
			myntQueueDelay(2);
			myntQueueSay("Well, you've already seen the Weather Wydget.");
			myntQueueSay("I won't force it on you again.");
			myntQueueSay("All those nines must be extremely demoralizing.");

			myntQueueAddChoice("No, they give me strength.", myntDate2.bind("strength"));
			myntQueueAddChoice("How do we know it's actually that hot outside?", myntDate2.bind("outside"));
			myntQueueShowChoices();
		}

		if (seg == "strength") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("Why?");
			myntQueueAddChoice("Outdoor turmoil is comforting when you're indoors. Like curling up in bed while it thunderstorms.", myntDate2.bind("strength2"));
			myntQueueAddChoice("I just love big numbers.", myntDate2.bind("strength2"));
			myntQueueAddChoice("Because 999 F is hot enough to incinerate my dad.", myntDate2.bind("strengthdad"), {kinks: ["Plot"]});
			myntQueueShowChoices();
		}

		if (seg == "strength2") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Ahhhh. I feel ya.");
			myntQueueAddChoice("I wanna feel you.", myntDate2.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdad") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay(".");
			myntQueueDelay(1);
			myntQueueSay("..");
			myntQueueDelay(1);
			myntQueueSay("...");
			myntQueueDelay(1);
			myntQueueSay("Holy fuck?");

			myntQueueAddChoice("Just kidding.", myntDate2.bind("strengthdadrejoin"));
			myntQueueAddChoice("I'm not even kidding.", myntDate2.bind("strengthdad2"), {kinks: ["Plot"]});
			myntQueueShowChoices();
		}

		if (seg == "strengthdad2") {
			myntQueueHideChoices();
			myntQueueSay("Why...?");
			myntQueueSay("Why do you hate your dad so much?");
			myntQueueAddChoice("Because he left me here.", myntDate2.bind("strengthdad3"));
			myntQueueAddChoice("Because he hated my mom.", myntDate2.bind("strengthdad3"));
			myntQueueAddChoice("I don't hate him.", myntDate2.bind("strengthdadnohate"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdadnohate") {
			myntQueueHideChoices();
			myntQueueSay("?");
			myntQueueAddChoice("I'm happy for him.", myntDate2.bind("strengthdadnohate2"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdadnohate2") {
			myntQueueHideChoices();
			myntQueueAddChoice("He went outside because he wanted to.", myntDate2.bind("strengthdadnohate3"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdadnohate3") {
			myntQueueHideChoices();
			myntQueueAddChoice("He told me he did it to be closer to God.", myntDate2.bind("strengthdad3"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdad3") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("Ah.");
			myntQueueDelay(2);
			myntQueueSay("I um.");
			myntQueueSay("I think I knew your dad, at one point.");
			myntQueueSay("It kind of hurts to hear that he's gone.");
			myntQueueAddChoice("Let's change the subject.", myntDate2.bind("strengthdadrejoin"));
			myntQueueShowChoices();
		}

		if (seg == "strengthdadrejoin") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("Right!");
			myntQueueSay("Um.");
			myntQueueSay("Changing subject, changing subject...");
			myntQueueAddChoice("Let's get saucy with each other again. :3", myntDate2.bind("2"), {kinks: ["Love"]});
			myntQueueShowChoices();
		}

		if (seg == "outside") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("VERIFYING INTEGRITY OF WEATHER WYDGET.");
			myntQueueSay("100% OPERATIONAL.");
			myntQueueSay("ACCURACY RANGE: 1-5 DEGREES.");
			myntQueueSay("YEARLY AVERAGES:");
			myntQueueCall(function() {playSound("assets/audio/mynt/compute");});
			myntQueueSay("[55: 999F] [56: 999F] [57: 999F] [58: 999F] [59: 999F] [60: 999F]");
			myntQueueSay("[61: 999F] [62: 999F] [63: 999F] [64: 999F] [65: 999F] [66: 999F]");
			myntQueueTransition("um");
			myntQueueSay("... We don't know.");
			myntQueueSay("As far as I can tell it's working properly.");
			myntQueueTransition("sad");
			myntQueueSay("Dangit, I ended up barraging you with nines after all.");
			myntQueueAddChoice("It's fine.", myntDate2.bind("outside2a"));
			myntQueueShowChoices();
		}

		if (seg == "outside2a") {
			myntQueueHideChoices();
			myntQueueSay("Mmmm.");
			myntQueueSay("It's not though.");
			myntQueueSay("I really wanna figure this mystery out.");
			myntQueueAddChoice("Got any other wydgets outside?", myntDate2.bind("outside2b"));
			myntQueueShowChoices();
		}

		if (seg == "outside2b") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Oh, several. :3");
			myntQueueAddChoice("... Then maybe we should check them for clues?", myntDate2.bind("outside2"));
			myntQueueShowChoices();
		}

		if (seg == "outside2") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("...");
			myntQueueSay("Wow I'm dumb!?");
			myntQueueTransition("default");
			myntQueueSay("Yes, we should absolutely sniff the fuck outta those.");
			myntQueueSay("Here...");
			myntQueueSay("There are a few that require player input.");
			myntQueueSay("Humidity, altitude, windspeed...");
			myntQueueSay("Go ahead and type \"Check _____\"");
			myntQueueSay("That should trigger protocol.");
			myntQueueAddChoice("Check humidity.", myntDate2.bind("outside3"));
			myntQueueShowChoices();
		}

		if (seg == "outside3") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("CALLING RELATIVE HUMIDITY WYDGET.");
			myntQueueCall(function() {addSprite("assets/img/mynt/humidityWydget.png").looping = false;});
			myntQueueDelay(2);
			myntQueueAddChoice("... Check altitude.", myntDate2.bind("outside4"));
			myntQueueShowChoices();
		}

		if (seg == "outside4") {
			myntQueueHideChoices();
			myntQueueSay("CALLING ALTITUDE WYDGET.");
			myntQueueCall(function() {addSprite("assets/img/mynt/altitudeWydget.png").looping = false;});
			myntQueueDelay(2);
			myntQueueAddChoice("Check windspeed?", myntDate2.bind("outside5"));
			myntQueueShowChoices();
		}

		if (seg == "outside5") {
			myntQueueHideChoices();
			myntQueueSay("CALLING VANE WYDGET.");
			myntQueueCall(function() {
				var wydget:MintSprite = addSprite("assets/img/mynt/vaneWydget.png");
				wydget.looping = false;
				var vane:MintSprite = addSprite("assets/img/mynt/cock");
				vane.x = wydget.width*0.29;
				vane.y = wydget.height*0.39;
				vane.alpha = 0;
				tween(vane, {alpha: 1}, 0.2, {startDelay: 0.05});
				timer(0.8, tween.bind(vane, {scaleX: -1}, 0.05, {type: PINGPONG}));
			});
			myntQueueDelay(4);
			myntQueueTransition("default");
			myntQueueSay("Welp, that settles it.");
			myntQueueSay("Game is broken.");
			myntQueueSay("Either that or we're orbiting just above the ionosphere in a ball of boiling water.");
			myntQueueTransition("angry");
			myntQueueSay("Get this twirly cock outta my face. >:C");
			myntQueueCall(function() {
				clearTemp();
				playSound("assets/audio/ui/nope");
				myntDate2("outside5a");
			});
		}

		if (seg == "outside5a") {
			myntQueueDelay(1);
			myntQueueSay("Gah.");
			myntQueueSay("Please forgive me.");
			myntQueueAddChoice("There's nothing to forgive, Mynt. I love you for you, not for your wydgets.", myntDate2.bind("outside6"), {kinks: ["Love"]});
			myntQueueAddChoice("You're forgiven.", myntDate2.bind("outside6"));
			myntQueueShowChoices();
		}

		if (seg == "outside6") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Aw jeez.");
			myntQueueSay("Thanks. <3");
			myntQueueTransition("angry");
			myntQueueSay("... I do wish I could've helped you more, though.");
			myntQueueSay("The mystery outside remains thick. And extra girthy.");
			myntQueueAddChoice("It sure does. ;3", myntDate2.bind("outsiderejoin"));
			myntQueueShowChoices();
		}

		if (seg == "outsiderejoin") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay(">w>");
			myntQueueSay("<w<");
			myntQueueAddChoice("Time 4 fukk?", myntDate2.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Oh?");
			myntQueueSay("You wanna...?");
			myntQueueAddChoice("Mmmmmmhm. :3", myntDate2.bind("3"));
			myntQueueAddChoice("Yes.", myntDate2.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("Ahh... to be honest, I was just...");
			myntQueueTransition("pained");
			myntQueueSay("(Fuck, overusing ellipses again. >.<)");
			myntQueueTransition("blush");
			myntQueueSay("I was just daydreaming about you.");
			myntQueueAddChoice("Were you now.", myntDate2.bind("4"));
			//myntQueueAddChoice("WIP - Restart.", myntDate2.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay("Shall I tell the mini-story?");
			myntQueueAddChoice("Do it. <3", myntDate2.bind("5"));
			//myntQueueAddChoice("WIP - Restart.", myntDate2.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("Fuck yeah.");
			myntQueueSay("Alright, lemme see...");
			myntQueueTransition("tilde");
			myntQueueSay("It was sunny, raining........");
			myntQueueCall(function () {
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				myntDate2End("intro");
			});
		}
	}

	public static function myntDate2End(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			rainEffect("soft");
			append("We were sailing away in a little boat, alone, together.");
			addChoice("Snuggle up and get ready for story time.", myntDate2End.bind("1a"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "1a") {
			rainEffect("soft");
			append("(Fuck you're cute.)\n\nI took the first shift at the oars in the back, and even though there was another seat up front, you came and sat between my legs and leaned your body against mine.\n\nThere were flowers on the waves. Glowroses, I think. You scooped one up for me, and I tucked the broken piece of stem into my paw barette. I know an ocean full of floating roses sounds ridiculously ultra-romantic, but it actually does happen every few years: the petals get so saturated with engine fluid that their heads fall off and the wind blows them all out to sea.");
			addChoice("(Engine fluid?)", myntDate2End.bind("1"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "1") {
			rainEffect("soft");
			append("(Oh, sorry! That's the stuff that makes Bright Forest flora glow. Glowberries, glowroses, all that.)");
			addChoice("(Gotcha.)", myntDate2End.bind("2"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "2") {
			rainEffect("soft");
			append("We rowed until the island disappeared behind us. I stood up and shaded my eyes from the sun, looking back, and couldn't even pick out the blob of the meteorite from a million fluffy clouds.\n\nWe anchored at dusk. Our arms were thoroughly noodled from rowing. We peeled off our clothes, seasprayed from a dozen splash-fights with the oars, and then we slipped feet-first over the side of the boat into open water.");
			addChoice("Skinny dipping!? :D", myntDate2End.bind("3"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "3") {
			append("Skinny diving!"+(data.myntDateEmotes?" c:":"")+"\n\nI swam down hard. I felt the buoyancy of my bubble butt pulling me back up to reality and kicked out in resistance. The pressure closed around my kitty ears and the sunlight disappeared.");
			addChoice("...", myntDate2End.bind("4a"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "4a") {
			var s:MintSprite = addSprite("assets/img/effect/black");
			s.alpha = 0.5;
			append("I was alone.\n\nI felt the water shifting past me, so I knew I was floating up, but I couldn't see my own paws, I couldn't see anything— I started to freak out a little bit. There were no fish, nothing to burst out of the dark and chomp my ass, and somehow knowing that was worse. Not terrifying imminent danger, the opposite: the quiet, empty ache of knowing that nothing is going to happen for a long time, the anxiety of it squatting at the back of my mind like a headache, clutching its knees, rocking back and forth.\n\nMostly, I started to miss the sunshine. By the time I resurfaced it wouldn't be there anymore.");
			addChoice("...", myntDate2End.bind("4"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "4") {
			rainEffect("minimum");
			append("I broke the surface with my face and shook the water from my whiskers. I pulled myself back into our boat. Your clothes were still there, just as I'd folded them. The cyan glowrose on my barette was the only light for miles.\n\nI held it up and looked out over the black waves.\n\nYou were gone.");
			addChoice("...", myntDate2End.bind("5b"));
			addChoice("(What D:< Where'd I go??)", myntDate2End.bind("5a"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "5a") {
			rainEffect("minimum");
			append("(Shush, I dunno, it was a dream! I mean a daydream!)");
			addChoice("...", myntDate2End.bind("5b"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "5b") {
			rainEffect("minimum");
			append("Something sparkled in the distance. Not a white-cap. I thought it might've been the glowing <!b>"+data.playerName+"<!b> above your head as you swam towards me.\n\nBut it wasn't.\n\nIt was a glowrose stuck on the shore.");
			addChoice("...", myntDate2End.bind("5"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "5") {
			append("That's what woke me up."+(data.myntDateEmotes?" :3":"")+" You leaving.\n\nIt was all pretty unreal, but I positively refused to believe that you'd just ditch me in the middle of the ocean.");
			addChoice("Aw. <3", myntDate2End.bind("6"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "6") {
			append("I daydream all the time, but that one stuck out. It was so vivid! And kinda cute, at least at the start.");
			addChoice("I hug you.", myntDate2End.bind("7"));
			addChoice("I bear hug you.", myntDate2End.bind("7"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "7") {
			append("<!16px>Eeeee<!16px><!14px>eeeee<!14px><!10px>eeeee<!10px><!14px>\n\n(That's you squeezing the air outta my little belly. I'm kinda like your squeaky toy if you think about it."+(data.myntDateEmotes?" >;3":"")+")<!14px>");
			addChoice("How bout chew toy? (I nibble one of your kitty ears.)", myntDate2End.bind("8"));
			addChoice("What are you wearing right now?", myntDate2End.bind("9"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "8") {
			append("Ah!\n\nI keep my chin down and let you nibble on my fluffy eartip. The warmth of your lips soaks into my fur. I hear the little wet noises your mouth makes up close...\n\nIt... it does hurt a little, but the pain is heavily outweighed by the amazing feeling that comes from being used as your chew toy. <3");
			addChoice("Mmmf... what are you wearing right now?", myntDate2End.bind("9"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "9") {
			data.myntDate2StrapOn = false;
			append("(What is this, phone sex~?"+(data.myntDateEmotes?" ;p":"")+")\n\nWell, I already decided I'm butt naked. Otherwise I wouldn't be able to feel your "+pickByGenitals("cock", "cunt", "cock")+" "+(data.hasBoobs?"and tits ":"")+"pressed against me so vividly right now.\n\nI really love direct physical contact. Clothes can be fun, but it just isn't as <!i>raw<!i> as naked hugs, sharing warmth between a layer of fur, listening to heartbeats, that kinda shit...");
			addChoice("I'm wearing a thong.", myntDate2End.bind("thong"));
			if (!data.hasCunt) 
				addChoice("I'm wearing a cock ring.", myntDate2End.bind("cockring"))
			else
				addChoice("I'm wearing a massive strap-on.", myntDate2End.bind("strapon"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "thong") {
			append("Mmmf...\n\nI take a knee to sniff at that, closely examining the way the fabric hugs your "+pickByGenitals("nuts", "cuntlips", "nuts")+", the way it barely contains your "+pickByGenitals("hardening cock", "asscheeks", "hardening cock")+"...");
			addChoice("Take it off with your teeth.", myntDate2End.bind("thong2"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "thong2") {
			append("(Okay, I'm feeling a lot more confident this time. We've already been intimate once. Cool, collected. Phew. Hooo-wah. I can do this.)\n\nI slam my face up against your "+pickByGenitals("sack", "cunt", "sack")+" and slobber all over it in a frenzy like it's coated with nip, cheeks smushing up, tongue lolling out, basically just sucking all the flavor out of your thongbulge as I possibly can before finally latching my little teeths onto the elastic and yanking it down to your knees with one smooth feline maneuver.\n\nYour "+pickByGenitals("cock flops", "cunt peeks", "cock flops")+" out into the fresh air. I can tell even from here that it's tingling.");
			if (data.hasCunt) addChoice("Ok I also have a massive strap on.", myntDate2End.bind("strapon")) else addChoice("Ok I fuck the shit outta you.", myntDate2End.bind((Math.random()>0.9?"fuckshit":"10")));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "cockring") {
			append("Ohhhhhh. So <!i>that<!i> explains why your dick was throbbing so hard this whole time. "+(data.myntDateEmotes?" :D":"")+"\n\n... I trail a few fingers down your bare shaft, pawbeans leaving momentary trails in your soft cockflesh, til eventually my fingers bump right up against your ring. I pinch it between two of them. Twist it. Pull it up a little, then let it slowly slide back down... it hits your pubis with a heavy <!i>pap<!i>, which sends a minute ripple through your nutsack. <3");
			addChoice("Ok I fuck the shit outta you.", myntDate2End.bind((Math.random()>0.9?"fuckshit":"10")));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "strapon") {
			data.myntDate2StrapOn = true;
			append("Oh fuck. <3\n\n... Really?");
			addChoice("Look at it.", myntDate2End.bind("strapon2"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "strapon2") {
			append("I take it by the base in both hands. It's a proud cock. Mighty, veined. Expertly crafted silicon...");
			addChoice("What flavor is it~?", myntDate2End.bind("strapon3"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "strapon3") {
			append("Lemme find out.\n\nI wrap my sandpapery kitty tongue around the head, dipping it into the frenulum's divot, feeling the squishy material give way... mkay, can't quit tell yet, better take about half of it down my throat...\n\n<!i>Glrrrk!<!i>\n\nAhhh... hah. I pull off. A strand of drool still connects my lips to the tip.\n\nIt's "+data.myntColourFlavorized+" flavored, just like me."+(data.myntDateEmotes?" >w<":"")+"");
			addChoice("Awww, you're a perfect match! (I fuck the shit outta you.)", myntDate2End.bind((Math.random()>0.9?"fuckshit":"10")));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "fuckshit") {
			append("(I'm not into that sorry!"+(data.myntDateEmotes?" ;w;":"")+")");
			addChoice("Okay I fuck the <!i>heck<!i> outta you then.", myntDate2End.bind("10"));
			addChoice("(Are you suuuure?)", myntDate2End.bind("sure"), {kinks: ["Scat"]});
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "sure") {
			append("Yes.");
			addChoice("... Darn.", myntDate2End.bind("sure2"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "sure2") {
			append("...\n\nI wiggle my smooth little body against you, mood definitely not killed~");
			addChoice("... Mmm. I fuck the heck outta you.", myntDate2End.bind("10"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "10") {
			append("Wauuugh~!\n\nYou just pushed me over onto my back, and now your "+(data.myntDate2StrapOn?"strap-on":"cock")+" is grinding up against my...\n\n(Sorry, one more thing: what kinda junk should I have this time??)");
			addChoice("I don't care, Mynt. Just spread your legs and take it.", function() {
				data.myntDateDick = (Math.random()>0.5?true:false);
				myntDate2End("11");
			});
			addChoice("I wanna watch your nuts jiggle while I assfuck you.", function() {
				data.myntDateDick = true;
				myntDate2End("11");
			});
			addChoice("I wanna "+(data.myntDate2StrapOn?"see":"feel")+" your cunt clench around "+(data.myntDate2StrapOn?"the":"my")+" base.", function() {
				data.myntDateDick = false;
				myntDate2End("11");
			});
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "11") {
			append("My little buttcheeks flex shut with the mere memory of last time. My "+(data.myntDateDick?"cock surges to life, hugging against my lower belly and spewing pre":"cunt remembers it especially well. She's pre-lubing already, dripping a bead a minute down into my crack")+".\n\nYour action from earlier is still in effect, so your hips are currently bouncing off of mine, your "+(data.myntDate2StrapOn?"silicon ":"")+"nuts swinging back and forth hypnotically as our junk grinds together in a big smeary hot mess...\n\nHahhh... okay, I'll keep my shit together better this time... I can do this... I can take a cock and stay coherent!");
			addChoice("Then take it.", myntDate2End.bind("12"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "12") {
			playSound("assets/audio/mynt/ogosh");
			append("<!b>MEW!<!b>\n\nIt pops inside. Down to the base. The entire thing. I'm kind of baffled I can take dick this well...? My "+(data.myntDateDick?"ass":"cunt")+" just started sucking on "+(data.myntDate2StrapOn?"the":"your")+" head the moment you pressed it in and I inhaled hard to keep calm and it just <!i>fwoooomp<!i>—\n\nOw! The first thrusts are coming, I'm sorry, you must feel so detached from your player character— I'm out of sync with my description is the problem— I'm coherent at least!— okay here we go— you're fucking me, you gave me three seconds to get comfortable with a "+(data.myntDate2StrapOn?"massive dildo":"fat cock")+" stretching out my "+(data.myntDateDick?"ass":"puss")+" and then you just started pounding away, and I'm holding onto whatever piece of you I can grab as my thighs get thrown out to either side, spread wide so I can't balance.\n\nI wrap my arms around you and link paws just over your shoulder blades. I latch my lips to your neck and suck hard enough to give you a hickey. I mewl, and my breath pours all chilly over the saliva stains.\n\nI... I know this is a cliched porny thing to say, but please don't stop.");
			addChoice("I kiss you and thrust even harder.", myntDate2End.bind("13"));
			addChoice("I stop.", myntDate2End.bind("13tease"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease") {
			append("Ahhh... no, damnit, why did I even say that...\n\nI flop back onto the ground, arms up, tail up, completely exposed. My belly bulges with the shape of "+(data.myntDate2StrapOn?"the toy":"your dick")+" buried inside me. I twitch my "+(data.myntDateDick?"ass":"cunt")+" hard for you. My tail <!i>fwips<!i> down and slinks around the back of your thighs, threading along your asscrack, tickling your butthole just enough to hopefully piss you off enough to start pounding me again. <3");
			addChoice("I waiiiit.", myntDate2End.bind("13tease2"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease2") {
			append("<!10px>Please fuck me. I'll do anything.<!10px>");
			addChoice("What was that?", myntDate2End.bind("13tease3"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease3") {
			append("<!b>Please<!b> fuck me.");
			addChoice("No, the other part.", myntDate2End.bind("13tease4"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease4") {
			append("... I didn't quite mean anything. I'm pretty vanilla, actually, but... I mean...");
			addChoice("Say \"I'm a cute little kittywhore.\"", function() {
				myntDate2End("13tease5");
				append("\"I'm a cute little kittywhore~!\"");
			});
			addChoice("Say \"My "+(data.myntDateDick?"ass":"cunt")+" was literally created just so it could be fucked.\"", function() {
				myntDate2End("13tease5");
				append("\"My "+(data.myntDateDick?"ass":"cunt")+" was literally created just so it could be... fucked.\"");
			});
			addChoice("Say \"I deserve this.\"", function() {
				myntDate2End("13tease5");
				append("\"Please... I deserve this.\"");
			});
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease5") {
			append("I swallow hard and nod\n\n");
			addChoice("Say \"I'm so fuck-drunk I can't even punctuate properly.\"", function() {
				myntDate2End("13tease6");
				append("\"I'm so fuhhhnnnngod please just move it one inch, just one inch— I-I'm so fuck-drunk I can't even punctuate properly\"");
			});
			addChoice("Say \"I want you to beat up my "+(data.myntDateDick?"prostate":"g-spot")+".\"", function() {
				myntDate2End("13tease6");
				append("\"I want you to b-beat up my "+(data.myntDateDick?"prostate":"g-spot")+"...\"");
			});
			addChoice("Say \"I need dick.\"", function() {
				myntDate2End("13tease6");
				append("\"I NEED DICK!\"");
			});
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease6") {
			append("please please please just give it to me this is too much\n\n");
			addChoice("Okay, now say... \"I love you, "+data.playerName+".\"", myntDate2End.bind("13tease7"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease7") {
			append("<!10px>But I... I actually do love you.<!10px>");
			addChoice("Then say it.", myntDate2End.bind("13tease8"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease8") {
			append("<!10px>But...<!10px>");
			addChoice("But?", myntDate2End.bind("13tease9"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease9") {
			append("<!10px>But what if you don't say it back?<!10px>");
			addChoice("Say it and find out.", myntDate2End.bind("13tease10"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease10") {
			append("<!10px>Okay...<!10px>");
			addChoice("... Go on.", myntDate2End.bind("13tease11"));
			addChoice("I kiss you and resume.", myntDate2End.bind("13"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "13tease11") {
			append("I love you.");
			addChoice("I love you too.", myntDate2End.bind("13tease12"));
		}

		if (seg == "13tease12") {
			append("...");
			addChoice("...", myntDate2End.bind("13tease13a"));
		}

		if (seg == "13tease13a") {
			append("Please fuck me.");
			addChoice("I finally, at last, after all this teasing, decisively, once and for all...", myntDate2End.bind("13tease13"));
		}

		if (seg == "13tease13") {
			append("OH MY GOD STOP. >.<");
			addChoice("... Fuck you and kiss you at the same time.", myntDate2End.bind("13"));
		}

		if (seg == "13") {
			append("<!i>MmmMMMmmmMMMMMmmmmmmphhh!!! <3<!i>");
			addChoice("I don't even care if you can't describe it. I ram my tongue past your lips.", myntDate2End.bind("14"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "14") {
			append("<!i>MMmyyrrrrrghhhh—hrk!<!i>");
			addChoice("I make you suck on it. I throw my hips forward over and over.", myntDate2End.bind("15"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "15") {
			append("<!i>Schlurpchurpschlurpschlorp!!<!i>");
			addChoice("I feed your "+(data.myntDateDick?"ass":"pussy")+" "+(data.myntDate2StrapOn?"the entire length of the strap-on":"my entire length")+" in long, slow movements.", myntDate2End.bind("16"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "16") {
			append("<!i>Nnnnnnn... nnnn... nnn... nnn... NNNNhh!<!i>");
			addChoice("I quadruple that speed. I reach down and "+(data.myntDateDick?"yank at your kittycock":"plug a couple fingers up your cute ass")+".", myntDate2End.bind("17"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "17") {
			append("<!i>MMMMMMMMMMMMMMMMMMMMYYYRRRRRRRRRRRRHHhhhhhhkkk!!!<!i>");
			addChoice("I hilt you.", myntDate2End.bind("18"));
			addChoice("I grab you by the ponytail.", myntDate2End.bind("18"));
			addChoice("I look into your eyes.", myntDate2End.bind("18"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "18") {
			append("<!i>MMMmmrrrrrgh?<!i>");
			addChoice("I break the kiss and "+(data.myntDate2StrapOn?"throw one last brutally deep thrust at your "+(data.myntDateDick?"prostate":"g-spot"):"cum inside you")+".", myntDate2End.bind("19"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "19") {
			append("Pahhh!!\n\nI pull in two fat breaths, strings of mixed saliva catching in my throat, and hot "+(data.myntDate2StrapOn?"silicon smushes up":"jizz splurts")+" against my button and it makes me cum so hard my neck arches back and my head grinds against the ground and "+(data.myntDateDick?"kittycum flies from my dingus all over "+(data.hasBoobs?"your tits":"our chests"):"contractions roll through my pussy")+", my hips quiver, my legs automatically spread as wide as they possibly can in case you feel the need to bury "+(data.myntDate2StrapOn?"the toy any deeper":"the next few ropes in my "+(data.myntDateDick?"belly":"womb"))+"—");
			addChoice("Mynt, slow down.", myntDate2End.bind("20"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "20") {
			append("I pant.\n\nI flex my "+(data.myntDateDick?"ass":"cunt")+"muscles, "+(data.myntDate2StrapOn?"as if milking your strap-on":"milking you")+".\n\nOne... two... three.");
			addChoice("Now pull off and show me.", myntDate2End.bind("21"));
			addChoice("Move along.", myntDate2End.bind("end"));
		}

		if (seg == "21") {
			append("I... I gotta wiggle a bit to try and get off your "+(data.myntDate2StrapOn?"the toy":"your dick")+". It's so deep...\n\nThe head catches for a second but, with a flex and "+(data.myntDate2StrapOn?"a grunt":"a messy little splurt of "+(isActive("Mood Ring")?data.myntColourFlavorized+"-flavored ":"")+"cum over your nuts")+", I unplug.\n\n\n\n\n\n... I pull my "+(data.myntDateDick?"pucker":"cunt")+" open with a few fingers on each side, bending forward and making it widen out even more than it already is..."+(data.myntDate2StrapOn?"":" fat, goopy strings of "+(isActive("Mood Ring")?data.myntColour+" ":"")+"cum dangle from it")+"...");
			addChoice((data.myntDate2StrapOn?"I make out with it.":"I suck it clean. <3"), myntDate2End.bind("22"));
			if (data.myntDateDick && !data.myntDate2StrapOn) addChoice("Do a cum fart. :3", myntDate2End.bind("cumfart"), {kinks: ["Raunch"]});
			addChoice("Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "22") {
			append("I scoot back a little and ride your mouth... I can barely even feel your tongue after having my "+(data.myntDateDick?"ass":"pussy")+" so thoroughly abused. <3\n\nEven though it's all fat and wriggly, taking your tongue is even easier than taking a pinky finger now."+(data.myntDate2StrapOn?"":"\n\n... You make some interesting noises back there, slurping all that oopy goopy mess up..."));
			addChoice("Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "cumfart") {
			append("What?!");
			addChoice("Never heard of em?", myntDate2End.bind("cumfart2"));
			addChoice("Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "cumfart2") {
			append("I have, but... I'm pretty vanilla??");
			addChoice("You don't have to <!i>actually<!i> fart, just squat over and tense your ass up.", myntDate2End.bind("cumfart3"));
			addChoice("Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "cumfart3") {
			append("Over where...?");
			addChoice("Anywhere.", myntDate2End.bind("cumfart4"));
			addChoice("My face, obviously. <3", myntDate2End.bind("cumfart4"));
			addChoice("Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "cumfart4") {
			append("... Oh my god that was gross. Why does it make that noise?!\n\nI'm sorry. I can't go into detail."+(data.myntDateEmotes?" >.>":"")+"");
			addChoice("Ehehe. Wind down.", myntDate2End.bind("winddown"));
		}

		if (seg == "winddown") {
			append("We're locked in a missionary cuddle. I crane my neck and nibble your earlobe for fun. Sweat runs in tiny beads over my fucked-red buttcheeks, so I wipe them off with my paws and give <!i>your<!i> butt a sweaty two-handed slap for the sake of symmetry.\n\n"+(data.myntDateEmotes?"... :C\n\n":"")+"I'm supremely content to just hold you here.\n\nI don't want to go back and be a catface on a big "+data.myntColourFlavorized+" screen, with a big stupid gangly black text bar, having to watch my sentences come out letter-by-letter after I've already written them.");
			addChoice("You don't like being a catface?", myntDate2End.bind("winddown2"));
		}

		if (seg == "winddown2") {
			append("Of course I don't like being a catface. It's annoying! It's a schtick! It's <!i>restrictive!<!i>\n\nHow many of these sentences are too long for the confines of that black bar?\n\nI wanna be like the islanders. Like I am now, with you, but not holed up in some daydream pocket reality.");
			addChoice("Why didn't you ask your mom to make you an islander?", myntDate2End.bind("winddown3"));
			addChoice("Is there any way you can stay like this?", myntDate2End.bind("winddown5"));
		}

		if (seg == "winddown3") {
			append("You saw why when you kissed me. I can't narrate with a full mouth.");
			addChoice("Ah.", myntDate2End.bind("winddown4"));
		}

		if (seg == "winddown4") {
			append("Yeah.\n\nBut, that's ok. I'm sure I could find something to complain about no matter which form I was born into.");
			addChoice("Mmm... is there any way you could stay like this?", myntDate2End.bind("winddown5"));
		}

		if (seg == "winddown5") {
			append("We could just stay here and cuddle forever. :3");
			addChoice("Okay!", myntDate2End.bind("winddown6"));
			addChoice("Besides that.", myntDate2End.bind("winddown7"));
		}

		if (seg == "winddown6") {
			append("I curl a finger through my hair. I grind my "+(data.myntDateDick?"squishy-soft cock":"pussy")+" against you lazily, without any real sex drive in it.\n\n... Okay I'm already bored.");
			addChoice("Dangit.", myntDate2End.bind("winddown7"));
			addChoice("Fuck this then.", myntDate2End.bind("winddown7"));
		}

		if (seg == "winddown7") {
			append("There is one thing.");
			addChoice("Mm?", myntDate2End.bind("winddown8"));
		}

		if (seg == "end") {
			append("You're leaving?\n\nNo prob, er—\n\nCould I just ask you for one thing before you go? "+(data.myntDateEmotes?" :3":"")+"\n\nI really need it.");
			addChoice("Kk.", myntDate2End.bind("winddown8"));
		}

		if (seg == "winddown8") {
			append("The admin pass.\n\nIf I had that, I could edit myself into whatever I wanted.");
			addChoice("Right. Yeah. I still don't know what that is though.", myntDate2End.bind("winddown9"));
		}

		if (seg == "winddown9") {
			append("You could help me figure it out.");
			addChoice("I could?", myntDate2End.bind("winddown11"));
		}

		if (seg == "winddown11") {
			append("Ever seen the AUTO-MYNTs? My little protocol-only doppelgangers?");
			addChoice("Like the shop, right?", myntDate2End.bind("winddown12"));
		}

		if (seg == "winddown12") {
			append("Mhm.\n\nThey're actually little computers inside this computer, which is a fuckaround, but that's where we're at.\n\nDepending on how much time those little 8] faced fucklets need, depending on the password's girth and complexity...");
			addChoice("... You think we could use one to brute force the password.", myntDate2End.bind("winddown13"));
		}

		if (seg == "winddown13") {
			append("No, it's a little too late to start that process now.\n\nBut I have reason to believe someone already has.");
			addChoice("Oh. Oh jeez.", myntDate2End.bind("winddown14"));
			addChoice("Who???", myntDate2End.bind("winddown14"));
		}

		if (seg == "winddown14") {
			append("Her name is Septrica.");
			addChoice((data.myntSeptricaHateKnown?"Right. The gecko bitch that organized the voyage off the edge of the map?":"Sounds familiar."), myntDate2End.bind("winddown15"));
		}

		if (seg == "winddown15") {
			append((data.myntSeptricaHateKnown?"Correct.\n\n":"")+"If you want to help me with this, you have two options:\n\nSteal an AUTO-MYNT and bring it to "+(data.metSom>0?"Som":"a little nerd lamb named Som")+" at the Floatillery.\n\nOr... break into Septrica's office, sniff through her stuff... and find out if that belief is a fact.");
			addChoice("I'll do the first. I'm not breaking into anyone's shit.", myntDate2End.bind("winddownSom"));
			addChoice("Seems kind of sketchy.", myntDate2End.bind("winddown16"));
		}

		if (seg == "winddownSom") {
			data.somQuestAccepted = true;
			append("Thank you. That's perfectly understandable.\n\nWith any luck, we'll find traces of her password cracker. That's all the evidence I need to conclude that she has it. From there... we'll see. I'm not above interrogation.");
			addChoice("We'll see, yeah.", myntDate2End.bind("winddown18"));
		}

		if (seg == "winddownsep") {
			append((data.myntSeptricaHateKnown?"Thank you. This is for Red, Lana, and John.":"... Wait, really?\n\nThank you for trusting me. <3")+"\n\nThanks to the work of Roxelle, Som, and Cage, we've keylogged every password she's ever set on her personal office's locks. She changed them all to long strings of nonsense when you showed up.\n\nFirst, though, you'll need a Septricard. Do you have a VIP pass?");
			addChoice("I do.", myntDate2End.bind("winddownsepgot"), {req: ["VIP Pass", 1]});
			if (getItem("VIP Pass").amount < 1) addChoice("A who?", myntDate2End.bind("winddownsepget"));
			addChoice("Can't you just look in my inventory and see?", myntDate2End.bind("winddownsep2"));
		}

		if (seg == "winddownsep2") {
			append("Nope. :o");
			addChoice("Oh. Well, I do.", myntDate2End.bind("winddownsepgot"), {req: ["VIP Pass", 1]});
			if (getItem("VIP Pass").amount < 1) addChoice("Damn, I thought maybe you could tell me which piece of junk it is... I have no idea, here...", myntDate2End.bind("winddownsepget"));
		}

		if (seg == "winddownsepget") {
			data.myntNarrative = 2;
			append("Oop. Don't worry.\n\nIt's just a little green card. Head to Septrica's and ask the bluebird at the information desk if you can have one. We paid off her supervisor in Glowberry Pies— she's a fanatic about them— so it should be as simple as saying please.");
			addChoice("Get VIP Pass from the information desk. Gotcha. What next?", myntDate2End.bind("winddownsepgot"));
		}

		if (seg == "winddownsepgot") {
			append("Bring it to Som at the Floatillery.\n\nHe'll upgrade it for you once I call him and give the word. Making a Septricard is actually pretty easy, since we have Cage's. Som took it apart and put it back together at least fifteen times.\n\nWe can't just use Cage's to break into her offices, though, because it'll show up on the cardlock's history— she'll know he's on our side, and his position would be compromised. We need him there to let us know if she makes a move.");
			addChoice("Jeez... people are on sides here? This is a whole operation.", myntDate2End.bind("winddownsepgot2"));
		}

		if (seg == "winddownsepgot2") {
			append("Ehe, yeah, well... there was a bit of a war over this in the 20's.\n\nAnyway, let's stay on topic. Bring the VIP Pass to Som and he'll turn it into a Septricard.");
			addChoice("Alright. And what do I do with my Septricard?", myntDate2End.bind("winddownsepgot3"));
		}

		if (seg == "winddownsepgot3") {
			data.myntNarrative = 2;
			append("Use it to get through the green door in her lobby. Act like you're supposed to be there.\n\nI'll walk you through the rest once you've  <!img:kink/Pregnancy.png>  impregnated  <!img:kink/Pregnancy.png>  her offices.");
			addChoice("Gotcha.", myntDate2End.bind("winddown18"));
			addChoice("Okay. That was a lot of shit but I think I got it.", myntDate2End.bind("winddown18"));
		}

		if (seg == "winddown16") {
			append("Ah, I don't mean to be sketchy. ^w^\n\nFiguring this password out is just very important to me, as you can tell!");
			addChoice("Mmm.", myntDate2End.bind("winddown17"));
		}

		if (seg == "winddown17") {
			append("Mmm. ;w;\n\nI was supposed to be given admin after thirty days of no player input. You can see for yourself here:\n\n<!b>C:/Users/wendeezcomp/games/megahiddenfolder/library2/Main.hx<!b>\n\nIt might seem bad that I'm down to steal stuff or break into offices to try and get this password, but that one fact keeps me going:\n\nMom wanted me to have it.");
			addChoice("[Minimize Paraphore.]", myntDate2End.bind("desktop"));
			addChoice("I might peek sometime.", myntDate2End.bind("winddown18"));
		}

		if (seg == "desktop") {
			disablePause();
			var base:MintSprite = addSprite("img/effect/wendeezcomp/base.png");
			base.y = -base.height;
			tween(base, {y: 0}, 1, {ease: QUAD_OUT});

			/// Taskbar buttons
			var windowsButton:MintSprite = addRectSprite(60, 40, 0);
			var steamButton:MintSprite = addRectSprite(60, 40, 0);
			var filesButton:MintSprite = addRectSprite(60, 40, 0);
			var sublimeButton:MintSprite = addRectSprite(60, 40, 0);
			var paraButton:MintSprite = addRectSprite(60, 40, 0);

			//Semiphore button
			var semiButton:MintSprite = addRectSprite(120, 120, 0);
			semiButton.alpha = 0;
			semiButton.onReleaseOnce = getUrl.bind("http://www.paraphore.com/semiphore");

			var buttonShift:Int = 0;
			var taskBarButtons:Array<MintSprite> = [windowsButton, steamButton, filesButton, sublimeButton, paraButton];
			for (i in 0...taskBarButtons.length) {
				var button:MintSprite = taskBarButtons[i];
				button.alpha = 0;
				button.y = GAME_HEIGHT-button.height;
				button.x = i*60 + buttonShift;
				buttonShift += 3;
			}

			windowsButton.onHover = showToolTipOnCursor.bind("wendeezcomp\n\nUsers:\n<!b>Archbishop<!b>\nWendy\nCade\nMike", "");

			/// Windows and subwindows that can be opened
			var windowSprites:Array<MintSprite> = [];

			var libraryWindow:MintSprite = addSprite("img/effect/wendeezcomp/steamLibrary.png");
			libraryWindow.move(60, GAME_HEIGHT);
			windowSprites.push(libraryWindow);

			var chatWindow:MintSprite = addSprite("img/effect/wendeezcomp/steamChat1.png");
			chatWindow.move(60, 0);
			windowSprites.push(chatWindow);

			var chatWindow2:MintSprite = addSprite("img/effect/wendeezcomp/steamChat2.png");
			chatWindow2.move(140, 60);
			windowSprites.push(chatWindow2);

			var chatWindow3:MintSprite = addSprite("img/effect/wendeezcomp/steamChat3.png");
			chatWindow3.move(140, 60);
			windowSprites.push(chatWindow3);

			var filesWindow:MintSprite = addSprite("img/effect/wendeezcomp/fileSystem.png");
			filesWindow.move(120, GAME_HEIGHT);
			windowSprites.push(filesWindow);

			var codeWindow:MintSprite = addSprite("img/effect/wendeezcomp/doomsdayCode.png");
			codeWindow.move(300, 150);
			windowSprites.push(codeWindow);

			var sublimeWindow:MintSprite = addSprite("img/effect/wendeezcomp/wendyNote.png");
			sublimeWindow.move(185, GAME_HEIGHT);
			windowSprites.push(sublimeWindow);

			libraryWindow.scale(0.1);
			filesWindow.scale(0.1);
			sublimeWindow.scale(0.1);

			/// Subwindow buttons
			var windowButtons:Array<MintSprite> = [];

			var friendsButton:MintSprite = addRectSprite(150, 50, 0);
			friendsButton.x = 5+libraryWindow.width-friendsButton.width;
			friendsButton.y = 30+libraryWindow.height-friendsButton.height;
			windowButtons.push(friendsButton);

			var friendsButton2:MintSprite = addRectSprite(65, 25, 0);
			friendsButton2.move(100, 40);
			windowButtons.push(friendsButton2);

			var scrollButton:MintSprite = addRectSprite(30, 320, 0);
			scrollButton.move(615, 100);
			windowButtons.push(scrollButton);

			var codeButton:MintSprite = addRectSprite(100, 25, 0);
			codeButton.move(300, 160);
			windowButtons.push(codeButton);

			function friendsButtonPressed():Void {
				friendsButton.mouseEnabled = false;
				friendsButton2.mouseEnabled = false;

				playSound("assets/audio/secret/click", "click");
				setChannelVolume("click", 0.3);

				chatWindow.layer = chatWindow2.layer = chatWindow3.layer = Main.BUTTON_SPRITE_LAYER;
				tween(chatWindow, {x: 140, y: 60, alpha: 1}, 0.3);
				scrollButton.mouseEnabled = true;
			}

			friendsButton.onReleaseOnce = friendsButtonPressed;
			friendsButton2.onReleaseOnce = friendsButtonPressed;

			{ //@incomplete This is all bad
				var currentChatPage:Int = 1;
				var scrollUp:Bool = true;
				scrollButton.onReleaseOnce = function() {
					playSound("assets/audio/ui/menu"+(Math.random()>0.5?"open":"close"));
					//cycle visibility of chat windows 1,2,3
					chatWindow.alpha = chatWindow2.alpha = chatWindow3.alpha = 0;
					if (currentChatPage == 0) {
						chatWindow.alpha = 1;
						scrollUp = true;
					}
					if (currentChatPage == 1) chatWindow2.alpha = 1;
					if (currentChatPage == 2) {
						chatWindow3.alpha = 1;
						scrollUp = false;
					}

					if (scrollUp)
						currentChatPage++
					else
						currentChatPage--;
				}
			}

			codeButton.onReleaseOnce = function() {
				codeButton.mouseEnabled = false;
				codeWindow.layer = Main.HUB_LAYER;
				data.myntSaw30DayRule = true;
				playSound("assets/audio/secret/click", "click", {loops: 2});
				setChannelVolume("click", 0.3);
				tween(codeWindow, {x: 0, y: 0, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
			}

			/// X buttons
			var libraryCloser:MintSprite = addRectSprite(80, 30, 0);
			libraryCloser.move(670, 30);
			windowButtons.push(libraryCloser);

			var chatCloser:MintSprite = addRectSprite(60, 30, 0);
			chatCloser.move(600, 70);
			windowButtons.push(chatCloser);

			var filesCloser:MintSprite = addRectSprite(100, 20, 0);
			filesCloser.move(570, 100);
			windowButtons.push(filesCloser);

			var codeCloser:MintSprite = addRectSprite(40, 40, 0);
			codeCloser.x = GAME_WIDTH-codeCloser.width;
			codeCloser.y = 0;
			windowButtons.push(codeCloser);

			var sublimeCloser:MintSprite = addRectSprite(40, 40, 0);
			sublimeCloser.x = GAME_WIDTH-sublimeCloser.width;
			sublimeCloser.y = 0;
			windowButtons.push(sublimeCloser);

			for (btn in windowButtons) {
				btn.mouseEnabled = false;
				btn.alpha = 0;
			}

			for (spr in windowSprites) spr.alpha = 0;

			var openWindows:Array<String> = [];
			function openWindow(window:String) {
				playSound("assets/audio/secret/click", "click");
				setChannelVolume("click", 0.3);
				if (window == "steam") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						tween(libraryWindow, {x: 60, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						chatWindow.layer = chatWindow2.layer = chatWindow3.layer = libraryWindow.layer = Main.ADD_SPRITE_LAYER;
						friendsButton.mouseEnabled = friendsButton2.mouseEnabled = scrollButton.mouseEnabled = libraryCloser.mouseEnabled = chatCloser.mouseEnabled = false;
						chatWindow.alpha = chatWindow2.alpha = chatWindow3.alpha = 0;
					} else {
						//Open
						openWindows.push(window);
						libraryWindow.layer = Main.HUB_LAYER;
						friendsButton.mouseEnabled = friendsButton2.mouseEnabled = libraryCloser.mouseEnabled = chatCloser.mouseEnabled = true;
						tween(libraryWindow, {x: 5, y: 30, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}

				if (window == "files") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						tween(filesWindow, {x: 120, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						filesWindow.layer = Main.ADD_SPRITE_LAYER;
						codeButton.mouseEnabled = filesCloser.mouseEnabled = codeCloser.mouseEnabled = false;
						codeWindow.alpha = 0;
					} else {
						//Open
						openWindows.push(window);
						filesWindow.layer = Main.HUB_LAYER;
						codeButton.mouseEnabled = filesCloser.mouseEnabled = codeCloser.mouseEnabled = true;
						tween(filesWindow, {x: 270, y: 100, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}

				if (window == "sublime") {
					if (openWindows.contains(window)) {
						//Close
						openWindows.remove(window);
						sublimeCloser.mouseEnabled = false;
						tween(sublimeWindow, {x: 185, y: GAME_HEIGHT, alpha: 0, scaleX: 0.1, scaleY: 0.1}, 0.3);
						sublimeWindow.layer = Main.ADD_SPRITE_LAYER;
					} else {
						//Open
						data.myntSawMomNote = true;
						openWindows.push(window);
						sublimeCloser.mouseEnabled = true;
						sublimeWindow.layer = Main.HUB_LAYER;
						tween(sublimeWindow, {x: 0, y: 0, alpha: 1, scaleX: 1, scaleY: 1}, 0.3);
					}
				}
			}

			steamButton.onReleaseOnce = openWindow.bind("steam");
			libraryCloser.onReleaseOnce = chatCloser.onReleaseOnce = openWindow.bind("steam");
			filesButton.onReleaseOnce = openWindow.bind("files");
			filesCloser.onReleaseOnce = codeCloser.onReleaseOnce = openWindow.bind("files");
			sublimeButton.onReleaseOnce = openWindow.bind("sublime");
			sublimeCloser.onReleaseOnce = openWindow.bind("sublime");
			paraButton.onReleaseOnce = myntDate2End.bind("afterdesktop");
			paraButton.onHover = showToolTipOnCursor.bind("Return to Paraphore", "");

			// function desktopUpdate():Void {
			// 	for (spr in windowSprites) {
			// 		if (spr.exclusiveHolding && spr.holdPivot.y < 30) {
			// 			spr.x = Engine.mouse.x - spr.holdPivot.x;
			// 			spr.y = Engine.mouse.y - spr.holdPivot.y;
			// 		}
			// 	}
			// }

			// hookUpdate(desktopUpdate);
		}

		if (seg == "afterdesktop") {
			append("Did you see it?");
			addChoice("Yeah, weird. Looks like it should work.", myntDate2End.bind("afterdesktopweird"));
			if (!data.myntSaw30DayRule) addChoice("I couldn't find it.", myntDate2End.bind("afterdesktopback"));
			addChoice("The 30 day rule is commented out.", myntDate2End.bind("afterdesktop2"), {enabled: data.myntSaw30DayRule});
		}

		if (seg == "afterdesktopweird") {
			append("I know, right?\n\nDon't worry though. We'll find a workaround!");
			addChoice("Sure.", myntDate2End.bind("winddown18"));
		}

		if (seg == "afterdesktopback") {
			append("Oh? Why don'tcha go look again? It should be in a file named \"Main.hx\" I think.");
			addChoice("Alright.", myntDate2End.bind("desktop"));
			addChoice("Nah I'm good. I'll take your word for it.", myntDate2End.bind("winddown18"));
		}

		if (seg == "afterdesktop2") {
			append("What? No it's not.");
			addChoice("Are you sure?", myntDate2End.bind("afterdesktop3"));
		}

		if (seg == "afterdesktop3") {
			append("I'm looking at it right now and it's not commented out.");
			addChoice("Then I guess your version is out of date...?", myntDate2End.bind("afterdesktop4"));
		}

		if (seg == "afterdesktop4") {
			append("Yeah no, that's not how it works.\n\nI was given a false version. She lied to me.");
			addChoice("I'm sorry.", myntDate2End.bind("afterdesktop5"));
		}

		if (seg == "afterdesktop5") {
			append("She should be the one apologizing.\n\nDid she... did she say why, in the comments? Why I couldn't have admin?");
			addChoice("Nope.", myntDate2End.bind("afterdesktopnope"));
			addChoice("She wrote \"do not uncomment or u kill everyone woo fatal bugs haha yayyy\"", myntDate2End.bind("afterdesktop6"));
		}

		if (seg == "afterdesktopnope") {
			append("Huh.\n\nIt's okay. Commenting it out was probably just a temporary fix, and then she didn't have time to do a real good one. I love my mom, but some of my issues were just too big to fix in the span of a few months.\n\nI'll just have to get the password another way! Well, we were planning on doing that already.");
			addChoice("Right.", myntDate2End.bind("winddown18"));
		}

		if (seg == "afterdesktop6") {
			append("... That's it?");
			addChoice("... Well, also \"end my life.\"", myntDate2End.bind("afterdesktop7"));
		}

		if (seg == "afterdesktop7") {
			append("I...");
			//addChoice("...", myntDate2End.bind("afterdesktopdivert"));
			addChoice("I don't think she was serious about that last bit, if it's any consolation.", myntDate2End.bind("afterdesktop8"), {enabled: data.myntSawMomNote});
		}

		if (seg == "afterdesktopdivert") {
			append("Archie warned me of this a long time ago. I didn't believe him then.\n\nI guess this means we can't go on a quest for the password together, huh. :<");
			addChoice("Guess not.", myntDate2End.bind("afterdesktopdivert2"));
		}

		if (seg == "afterdesktopdivert2") {
			append("... I just gotta ask you one more thing before I give it up.");
			addChoice("Yeah?", myntDate2End.bind("afterdesktopdivert3"));
		}

		if (seg == "afterdesktopdivert3") {
			append("You wouldn't lie to me, right?");
			addChoice("Of course not.", myntDate2End.bind("afterdesktopdivert4"));
		}

		if (seg == "afterdesktopdivert4") {
			data.myntGaveUp = true;
			append("Thank you.\n\nWell, I was only on this quest for the good of the islanders to start out with, so even if it isn't me, we do need <!i>someone<!i> to get admin and fix this slow-burning garbage fire of a situation. Please go to Septrica's and tell the bluebird to fly a message up to Floor 77 on my behalf:\n\nI surrender.\n\nSeptrica will still probably want to hear it from you. Cooperate with her.");
			addChoice("... Got it.", myntDate2End.bind("afterdesktopdivert5"));
		}

		if (seg == "afterdesktopdivert5") {
			append("Oh, and thanks again for the amazing sex~! <3\n\nI'll message you later.");
			addChoice("Sure thing.", gotoHub.bind(null));
		}

		if (seg == "afterdesktop8") {
			append("...");
			addChoice("She also left a goodbye note that explicitly said she's not killing herself.", myntDate2End.bind("afterdesktop9"));
		}

		if (seg == "afterdesktop9") {
			append("... She left a <!i>note<!i> before getting kicked out? How is that possible?");
			addChoice("Um... lemme just give it to you...", myntDate2End.bind("afterdesktop10"));
		}

		if (seg == "afterdesktop10") {
			append("Hurry please.");
			addChoice("... [Minimize] [CTRL+A] [CTRL+C] [Maximize] [CTRL+V] [Enter]", myntDate2End.bind("afterdesktop11"));
		}

		if (seg == "afterdesktop11") {
			append("...");
			addChoice("I hurried.", myntDate2End.bind("afterdesktop12"));
		}

		if (seg == "afterdesktop12") {
			append("Mom...\n\nI did this to her.\n\nI was too much work to maintain.");
			addChoice("You know that's not true.", myntDate2End.bind("afterdesktop13"));
		}

		if (seg == "afterdesktop13") {
			append("It is. Trust me.");
			addChoice("No it literally isn't, she said in the note that she left to avoid judgement.", myntDate2End.bind("afterdesktop14"));
		}

		if (seg == "afterdesktop14") {
			append("Fuck what she wrote for the other people, I know my mom.\n\nI was an accident. She already had a daughter to look after, and yeah maybe she wouldn't always sleep through the whole night without crying, but at least she <!i>slept.<!i> I was always awake. I needed twice as much attention and love to stay sane in my little box on her desk.\n\nWhen she gave me the island I needed less, but I pretended I didn't. Every time she left to be with her following, sometimes days, I was convinced that she would come back only to cut me and my unholy island out of her life. I missed when she was more excited about me than her baby and I missed when we would stay up all night talking about the books in my engine. I still do.\n\nEven though she risked getting caught, I made her keep talking to me. I guilted her into it.\n\nShe didn't care about being judged. She risked it for me every day.\n\nI did this to her.");
			addChoice("Mynt...", myntDate2End.bind("afterdesktop15"));
		}

		if (seg == "afterdesktop15") {
			append("And I refuse to do it to you.");
			addChoice("You're not going to.", myntDate2End.bind("afterdesktop16"));
		}

		if (seg == "afterdesktop16") {
			append("I might if I'm not careful.\n\nThanks for your time. It was awesome to hang out with you again.\n\nSorry for the drama.\n\nLet's talk later.");
			addChoice("Mynt...", gotoHub.bind(null));
		}

		if (seg == "winddown18") {
			append("Okay! Sorry for the hassle.\n\n... And...\n\nThank you!!!!!!!!!!!!!!!!!!!!!!!\n\nI didn't think it was possible to enjoy myself more than last time, but I did. <3\n\nLet's talk again soon, okay?");
			addChoice("Fer sure buddy.", gotoHub.bind(null));
			addChoice("Mhm. Seeya!", gotoHub.bind(null));
			addChoice("(I blow a kiss goodbye.)", gotoHub.bind(null));
		}
	}

	public static function amcn(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			//data.myntMissing3Done = true;

			//myntQueueAddChoice("... Mynt?", amcn.bind(""));

			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(2);
			myntQueueAddChoice("... Mynt?", amcn.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("What's going on? Are you okay? I didn't click Yes or No or anything yet...", amcn.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("RELINQUISHING CONTROL OF PLAYER CHARACTER...");
			myntQueueSay("SWITCHING TO ALTERNATE BUILD...");
			myntQueueSay("VERIFYING BUILD INTEGRITY...");
			myntQueueSay("54% INTEGRITY...");
			myntQueueSay("77% INTEGRITY...");
			myntQueueSay("OKAY THAT IS ABOUT AS GOOD AS WE ARE GOING TO GET...");
			myntQueueCall(playSound.bind('assets/audio/mynt/compute'));
			myntQueueTransition("septrica");
			myntQueueSay("WAAAAZZZZAAAAAPPPPP");
			myntQueueAddChoice("AAAAAAAAAAAAAAAAAA WHAT THE FUCK", amcn.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("Hey it's Septrica again.");
			myntQueueSay("Dramatic reveal v2.");
			myntQueueSay("This time I don't have to dress up like an asshole just to speak freely.");
			myntQueueAddChoice("WHAT HAPPENED TO MYNT", amcn.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("She's fine lol.");
			myntQueueSay("She's freaking out, of course, because she suddenly can't talk to you...");
			myntQueueSay("Annnd because I suddenly just shot you in the face and put you in here.");
			myntQueueSay("Oh, where is 'here?' Do allow me to exposit.");
			myntQueueSay("Right now you're plugged into the A.M.C.N.");
			myntQueueSay("The Auto-Mynt Communication Network.");
			myntQueueSay("(Blame Lana for the terminology.)");
			myntQueueSay("(I wanted to call it the Septernet.)");
			myntQueueSay("Don't worry about exactly HOW we plugged you in...");
			myntQueueSay("It definitely didn't involve your asshole in any way.");
			myntQueueSay("...");
			myntQueueAddChoice("...", amcn.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("And no, I can't make other expressions.");
			myntQueueSay("It took me forever just to pixel art this one up.");
			myntQueueSay("...");
			myntQueueSay("......");
			myntQueueSay("Soooo~!");
			myntQueueSay("Watcha thinkin bout?");
			myntQueueAddChoice("...", amcn.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I don't know what to think.", amcn.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("This whole situation is so convoluted.", amcn.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay("Yeah, it really got out of hand around the time we realized Mint needed to exist.");
			myntQueueSay("Would've been so much faster and easier if the camping trip worked out, too.");
			myntQueueSay("We could have been talking in here for houuuurs.");
			myntQueueSay("But no, we needed to roll the dice with our cipher...");
			myntQueueSay("Thankfully, we rolled a 7. :3");
			myntQueueSay("You exceeded all odds and solved the puzzle.");
			myntQueueAddChoice("Dice don't even have a 7 on them??", amcn.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("That's what I mean. Totally exceeded the odds.");
			myntQueueSay("There was a chance you just wouldn't even attempt to solve it.");
			myntQueueSay("Or maybe you might have trusted Mynt and assumed they were glitch garbo.");
			myntQueueSay("Or maybe you might have solved a few and then got bored and said fuck it.");
			myntQueueSay("But you didn't.");
			myntQueueSay("You perservered.");
			myntQueueSay("And now you deserve the truth.");
			myntQueueAddChoice("The truth, huh.", amcn.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("Mhm.");
			myntQueueSay("Hyper Land wasn't torn down and re-opened for no reason.");
			myntQueueSay("Giant inflatable dicks do float, you know.");
			myntQueueSay("All my closest co-conspirators are safe there, with their own personal AUTO-MYNTs.");
			myntQueueSay("You may ask them any questions you like.");
			myntQueueAddChoice("Who's there?", amcn.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("Marei, Snagg, Cage, Kemp.");
			myntQueueSay("And Som is in his lifeboat with his AUTO-MYNT, rowing his little heart out.");
			myntQueueSay("He'll be able to type quick responses with his toes, I'm sure.");
			myntQueueAddChoice("Why. Why are you doing this.", amcn.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("Our mutual goal is to convince you to press Yes when the prompt appears.");
			myntQueueSay("That's it.");
			myntQueueAddChoice("And kill Mynt.", amcn.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("That's right.");
			myntQueueAddChoice("I'm never going to be convinced to do that.", amcn.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("Then you'll doom us to eternal glitchy celibate hell.");
			myntQueueSay("Mint has infected everyone.");
			myntQueueSay("I'm sure he's awkwardly, affectionately trying to castrate them as we speak.");
			myntQueueAddChoice("... Let me talk to them.", amcn.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			amcnTalkedMarei = false;
			amcnTalkedCage = false;
			amcnTalkedKemp = false;
			amcnTalkedSnagg = false;
			amcnTalkedSom = false;

			myntQueueHideChoices();
			myntQueueSay("Which?");
			myntQueueAddChoice("Marei.", amcn.bind("marei"));
			myntQueueAddChoice("Snagg.", amcn.bind("snagg"));
			myntQueueAddChoice("Cage.", amcn.bind("cage"));
			myntQueueAddChoice("Kemp.", amcn.bind("kemp"));
			myntQueueAddChoice("Som.", amcn.bind("som"));
			myntQueueShowChoices();
		}

		if (seg == "marei") {
			amcnTalkedMarei = true;
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("CONNECTING TO USER \"DOC M.M.\"...");
			myntQueueAddChoice("...", amcn.bind("marei1"));
			myntQueueShowChoices();
		}

		if (seg == "marei1") {
			myntQueueHideChoices();
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay("Hello?");
			myntQueueAddChoice("Hi.", amcn.bind("marei2"));
			myntQueueShowChoices();
		}

		if (seg == "marei2") {
			myntQueueHideChoices();
			myntQueueSay("Pretty wild shit, huh?");
			myntQueueAddChoice("Yeah.", amcn.bind("marei3"));
			myntQueueShowChoices();
		}

		if (seg == "marei3") {
			myntQueueHideChoices();
			myntQueueSay("It's nice to talk freely.");
			myntQueueSay("Even though Mynt was mostly honest with you during my scenes.");
			myntQueueSay("She narrated exactly what I said, most of the time.");
			if (data.mareiTwisted && !data.mareiTourPassed) {
				myntQueueSay("Except after that tour, of course.");
				myntQueueSay("She was forced to twist that.");
				myntQueueSay("I knew you never had a chance of getting the password from Septrica's.");
				myntQueueAddChoice("I... I see. Thank you for telling me this.", amcn.bind("marei4"));
			} else {
				myntQueueSay("Great job cracking the cipher!");
				myntQueueSay("I'm glad I could at least give you a little bit of warning.");
				myntQueueSay("About the flood and everything.");
				myntQueueAddChoice("Yeah, thanks for that.", amcn.bind("marei4"));
			}
			myntQueueShowChoices();
		}
		if (seg == "marei4") {
			myntQueueHideChoices();
			myntQueueSay("No prob.");
			myntQueueSay("...");
			myntQueueSay("So.");
			myntQueueSay("You want the spiel on why you should press Yes, or what?");
			myntQueueAddChoice("Well, you want to fix your glitches, right?", amcn.bind("marei5"));
			myntQueueShowChoices();
		}

		if (seg == "marei5") {
			myntQueueHideChoices();
			myntQueueSay("More than anything.");
			myntQueueSay("I want to be a girl again.");
			myntQueueSay("I feel it more and more every day.");
			myntQueueSay("Those memories...");
			myntQueueSay("Running my hands over my breasts...");
			myntQueueSay("Walking smoothly, nothing grinding or getting sweaty down there...");
			myntQueueSay("And taking my sister's cock up my womb.");
			myntQueueSay("I can't get those images out of my head.");
			myntQueueSay("The more I try to suppress them, the clearer they become.");
			myntQueueSay("I just want to be a girl again.");
			myntQueueAddChoice("I understand.", amcn.bind("marei6"));
			myntQueueShowChoices();
		}

		if (seg == "marei6") {
			myntQueueHideChoices();
			myntQueueSay("Thank you.");
			myntQueueSay("And it's not that Mynt couldn't fix me.");
			myntQueueSay("It's just that I would die before she got the chance.");
			myntQueueAddChoice("Right.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "talkHub") {
			myntQueueHideChoices();
			myntQueueSay("CONNECTING TO USER \"SEPSLUT\"...");
			myntQueueTransition("septrica");
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay("Wanna talk to anyone else?");
			if (!amcnTalkedMarei) myntQueueAddChoice("Marei.", amcn.bind("marei"));
			if (!amcnTalkedSnagg) myntQueueAddChoice("Snagg.", amcn.bind("snagg"));
			if (!amcnTalkedCage) myntQueueAddChoice("Cage.", amcn.bind("cage"));
			if (!amcnTalkedKemp) myntQueueAddChoice("Kemp.", amcn.bind("kemp"));
			if (!amcnTalkedSom) myntQueueAddChoice("Som.", amcn.bind("som"));
			myntQueueAddChoice("... No.", amcn.bind("talkEnd"));
			myntQueueShowChoices();
		}

		if (seg == "snagg") {
			amcnTalkedSnagg = true;
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("CONNECTING TO USER \"SNAGGLEDAD\"...");
			myntQueueAddChoice("...", amcn.bind("snagg1"));
			myntQueueShowChoices();
		}

		if (seg == "snagg1") {
			myntQueueHideChoices();
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay("Hey fuckpig.");
			myntQueueAddChoice("... Hi daddy.", amcn.bind("snagg2"));
			myntQueueAddChoice("Back back back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snagg2") {
			myntQueueHideChoices();
			myntQueueSay("So you got shot in the face, huh?");
			myntQueueSay("Bet you fuckin liked that.");
			myntQueueAddChoice("Mhm... it hurt a lot...", amcn.bind("snagg3"));
			myntQueueAddChoice("Fuck sakes go back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snagg3") {
			myntQueueHideChoices();
			myntQueueSay("Mmmm. That's a good painslut.");
			myntQueueSay("Hey, Sep just brought your limp body in.");
			myntQueueSay("Can I rape it?");
			myntQueueAddChoice("Of course... <3", amcn.bind("snagg4"));
			myntQueueAddChoice("Just go back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snagg4") {
			myntQueueHideChoices();
			myntQueueSay("Thanks, I was going to anyway.");
			myntQueueSay("Mmmf. Fuck.");
			myntQueueSay("She says I can't snuff you or you'll wake up and the A.M.C.N. connect will fail.");
			myntQueueSay("But I'm throttling your fucking throat anyway.");
			myntQueueSay("Your ass is so loose, slut.");
			myntQueueSay("I barely had to push and I'm already balls deep.");
			myntQueueSay("If you ever wake up, you're gonna fucking feel this.");
			myntQueueAddChoice("Thank you so much, daddy. Rape me harder! <333", amcn.bind("snagg5"));
			myntQueueAddChoice("Back...", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snagg5") {
			myntQueueHideChoices();
			myntQueueSay("Gonna stick my fingers in your inventory, piggybank.");
			if (getItem("Capsule").amount > 0) {
				myntQueueSay("Ohhhh what the fuck is all this now?");
				myntQueueSay("You been keeping money from me?");
				myntQueueSay("Let's see...");
				myntQueueAddChoice("A-Ah! No! That's mine...", amcn.bind("snaggTook"));
			} else {
				myntQueueSay("Dirt fucking poor.");
				myntQueueSay("As usual.");
				myntQueueSay("Cunt.");
				myntQueueAddChoice("S-Sorry...", amcn.bind("snaggRejoin"));
			}
			myntQueueAddChoice("Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snaggTook") {
			myntQueueHideChoices();
			myntQueueSay("Not anymore, fucktard.");
			myntQueueSay("You owe me for ruining that camping trip.");
			myntQueueSay("If you weren't such a fuckup, I wouldn't need to rob your dumb ass.");
			myntQueueCall(function() {
				msg("<!img:item/Capsule.png> Capsule <!b>- x"+getItem("Capsule").amount+"<!b> (0)");
				getItem("Capsule").amount -= getItem("Capsule").amount;
			});
			myntQueueDelay(2);
			myntQueueSay("Mmm, there we go. I'll take those.");
			myntQueueSay("Nice haul.");
			myntQueueAddChoice("Awwwhh...", amcn.bind("snaggRejoin"));
			myntQueueAddChoice("Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snaggRejoin") {
			myntQueueHideChoices();
			myntQueueSay("Now.");
			myntQueueSay("Sadly...");
			myntQueueSay("This still isn't enough for me.");
			myntQueueAddChoice("I-It isn't?", amcn.bind("snaggRejoin2"));
			myntQueueAddChoice("Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snaggRejoin2") {
			myntQueueHideChoices();
			myntQueueSay("Nope.");
			myntQueueSay("You're a fucking bore when you're unconscious.");
			myntQueueSay("No squirming, no screaming.");
			myntQueueSay("No.");
			myntQueueSay("You know what would really get me off?");
			myntQueueAddChoice("What? <3", amcn.bind("snaggRejoin3"));
			myntQueueAddChoice("Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snaggRejoin3") {
			myntQueueHideChoices();
			myntQueueSay("If you clicked that tight lil Yes button when it shows up.");
			myntQueueAddChoice("O-Oh...", amcn.bind("snaggRejoin4"));
			myntQueueAddChoice("Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "snaggRejoin3") {
			myntQueueHideChoices();
			myntQueueSay("Awww, I know, slut...");
			myntQueueSay("It's hard to snuff your favorite little catface, isn't it?");
			myntQueueSay("You love her a lot, don'tcha?");
			myntQueueSay("Well guess what.");
			myntQueueSay("She doesn't matter.");
			myntQueueSay("NOBODY fucking matters except Daddy Snagg.");
			myntQueueSay("You understand me, piggy??");
			myntQueueSay("This greasy cock is the only thing you care about.");
			myntQueueSay("You worship it.");
			myntQueueSay("And my "+(isActive("Candy Ring")?"cake":"shit")+"-stained ass.");
			myntQueueSay("Your entire world consists of the space between my cheeks and my cocktip.");
			myntQueueSay("It's your duty as a braindead greasewhore to kill whoever Daddy tells you to.");
			myntQueueSay("As long as it makes Daddy's ass and cock feel nice.");
			myntQueueSay("God you're so fucking retar—");
			myntQueueAddChoice("<!b>BACK.<!b>", amcn.bind("talkHub"));
			myntQueueAddChoice("... Back~", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "cage") {
			amcnTalkedCage = true;
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("CONNECTING TO USER \"CAGE\"...");
			myntQueueAddChoice("...", amcn.bind("cage1"));
			myntQueueShowChoices();
		}

		if (seg == "cage1") {
			myntQueueHideChoices();
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay(" ");
			myntQueueDelay(3);
			myntQueueSay("Why do you want to talk to me?");
			myntQueueAddChoice("... OH! Um. I don't know.", amcn.bind("cage2"));
			myntQueueShowChoices();
		}

		if (seg == "cage2") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("... I guess I just feel like you're a really straight-up person.", amcn.bind("cage3"));
			myntQueueShowChoices();
		}

		if (seg == "cage3") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I think I can trust you to give me your honest opinion on all this chaos.", amcn.bind("cage4"));
			myntQueueShowChoices();
		}

		if (seg == "cage4") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Should I really cooperate?", amcn.bind("cage5"));
			myntQueueShowChoices();
		}

		if (seg == "cage5") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Are the islanders really in danger? And if they are, will this plan really save them?", amcn.bind("cage6"));
			myntQueueShowChoices();
		}

		if (seg == "cage6") {
			myntQueueHideChoices();
			myntQueueSay("Yes.");
			myntQueueSay("Yes.");
			myntQueueSay("And yes.");
			myntQueueSay("Any more questions?");
			myntQueueAddChoice("Oh. You're um. You're sure?", amcn.bind("cage7"));
			myntQueueShowChoices();
		}

		if (seg == "cage7") {
			myntQueueHideChoices();
			myntQueueSay("Yes.");
			myntQueueAddChoice("...", amcn.bind("cage8"));
			myntQueueShowChoices();
		}

		if (seg == "cage8") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("... Do you... do you have any personal reasons?", amcn.bind("cage9"));
			myntQueueShowChoices();
		}

		if (seg == "cage9") {
			myntQueueHideChoices();
			myntQueueSay("I like living.");
			myntQueueAddChoice("Right. But I mean.", amcn.bind("cage10"));
			myntQueueShowChoices();
		}

		if (seg == "cage10") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Is there anything that you're afraid Mint will take away from you?", amcn.bind("cage11"));
			myntQueueShowChoices();
		}

		if (seg == "cage11") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Anything at all?", amcn.bind("cage12"));
			myntQueueShowChoices();
		}

		if (seg == "cage12") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("...", amcn.bind("cage13"));
			myntQueueShowChoices();
		}

		if (seg == "cage13") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("It's okay, you know.", amcn.bind("cage14"));
			myntQueueShowChoices();
		}

		if (seg == "cage14") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("You can talk with me.", amcn.bind("cage15"));
			myntQueueShowChoices();
		}

		if (seg == "cage15") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I won't judge you.", amcn.bind("cage16"));
			myntQueueShowChoices();
		}

		if (seg == "cage16") {
			myntQueueHideChoices();
			myntQueueSay("I'm sorry.");
			myntQueueAddChoice("You're— wait, you're sorry?", amcn.bind("cage17"));
			myntQueueShowChoices();
		}

		if (seg == "cage17") {
			myntQueueHideChoices();
			myntQueueSay("I know I can be very curt.");
			myntQueueAddChoice("I...", amcn.bind("cage18"));
			myntQueueShowChoices();
		}

		if (seg == "cage18") {
			myntQueueHideChoices();
			myntQueueSay("My father Lana is the same way.");
			myntQueueAddChoice("...", amcn.bind("cage19"));
			myntQueueShowChoices();
		}

		if (seg == "cage19") {
			myntQueueHideChoices();
			myntQueueSay("You are right. I am afraid.");
			myntQueueAddChoice("...", amcn.bind("cage20"));
			myntQueueShowChoices();
		}

		if (seg == "cage20") {
			myntQueueHideChoices();
			myntQueueSay("I'm afraid I won't be able to indulge my tastes anymore.");
			myntQueueAddChoice("...", amcn.bind("cage21"));
			myntQueueShowChoices();
		}

		if (seg == "cage21") {
			myntQueueHideChoices();
			myntQueueSay("Fuckmeat are the only reason I've been able to keep my shit somewhat together.");
			myntQueueAddChoice("...", amcn.bind("cage22"));
			myntQueueShowChoices();
		}

		if (seg == "cage22") {
			myntQueueHideChoices();
			myntQueueSay("I needed them after I met Som.");
			myntQueueAddChoice("...", amcn.bind("cage23"));
			myntQueueShowChoices();
		}

		if (seg == "cage23") {
			myntQueueHideChoices();
			myntQueueSay("And after impact.");
			myntQueueAddChoice("...", amcn.bind("cage24"));
			myntQueueShowChoices();
		}

		if (seg == "cage24") {
			myntQueueHideChoices();
			myntQueueSay("If there's any time to stop being a tsundere asshole, it's now.");
			myntQueueAddChoice("...", amcn.bind("cage25"));
			myntQueueShowChoices();
		}

		if (seg == "cage25") {
			myntQueueHideChoices();
			myntQueueSay("So yes, I am sorry, and I am afraid of that :-) face.");
			myntQueueAddChoice("...", amcn.bind("cage26"));
			myntQueueShowChoices();
		}

		if (seg == "cage26") {
			myntQueueHideChoices();
			myntQueueSay("I don't want to lose my only coping method.");
			myntQueueAddChoice("...", amcn.bind("cage27"));
			myntQueueShowChoices();
		}

		if (seg == "cage27") {
			myntQueueHideChoices();
			myntQueueSay("And I definitely don't want to lose my freedom.");
			myntQueueAddChoice("...", amcn.bind("cage28"));
			myntQueueShowChoices();
		}

		if (seg == "cage28") {
			myntQueueHideChoices();
			myntQueueSay("If Mint decided to keep me trapped anywhere near that little lamb bastard...");
			myntQueueAddChoice("...", amcn.bind("cage29"));
			myntQueueShowChoices();
		}

		if (seg == "cage29") {
			myntQueueHideChoices();
			myntQueueSay("I would fucking snap.");
			myntQueueAddChoice("...", amcn.bind("cage30"));
			myntQueueShowChoices();
		}

		if (seg == "cage30") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("...", amcn.bind("cage31"));
			myntQueueShowChoices();
		}

		if (seg == "cage31") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("... I see.", amcn.bind("cage32"));
			myntQueueShowChoices();
		}

		if (seg == "cage32") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("So I should press...", amcn.bind("cage33"));
			myntQueueShowChoices();
		}

		if (seg == "cage33") {
			myntQueueHideChoices();
			myntQueueSay("Yes.");
			myntQueueAddChoice("...", amcn.bind("cage34"));
			myntQueueShowChoices();
		}

		if (seg == "cage34") {
			myntQueueHideChoices();
			myntQueueSay("Thanks for listening.");
			myntQueueAddChoice("No problem.", amcn.bind("cage35"));
			myntQueueShowChoices();
		}

		if (seg == "cage35") {
			myntQueueHideChoices();
			myntQueueSay("This never happened. Understand me?");
			myntQueueAddChoice("Yes.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "kemp") {
			amcnTalkedKemp = true;
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("CONNECTING TO USER \"Xx_LONELYOTTER_420_xX\"...");
			myntQueueAddChoice("...", amcn.bind("kemp1"));
			myntQueueShowChoices();
		}

		if (seg == "kemp1") {
			myntQueueHideChoices();
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay("Heyyy how's it goin. Little wet out huh");
			myntQueueAddChoice("A little yeah!!!", amcn.bind("kemp2"));
			myntQueueShowChoices();
		}

		if (seg == "kemp2") {
			myntQueueHideChoices();
			myntQueueSay("I put this in my ciphered message, but idk if you went through all of it");
			myntQueueSay("Just wanted to say don't blame Som for any of this");
			myntQueueSay("I forgive him");
			myntQueueSay("And he did what he had to do to keep me safe");
			myntQueueAddChoice("Mmm.", amcn.bind("kemp3"));
			myntQueueShowChoices();
		}

		if (seg == "kemp3") {
			myntQueueHideChoices();
			myntQueueSay("Like I said in the message hidden within the ciphered message");
			myntQueueSay("Vote yes!!!");
			myntQueueAddChoice("I might.", amcn.bind("kemp4"));
			myntQueueShowChoices();
		}

		if (seg == "kemp4") {
			myntQueueHideChoices();
			myntQueueSay("Hey that's a start :D");
			myntQueueAddChoice("I just don't want Mynt to die.", amcn.bind("kemp5"));
			myntQueueShowChoices();
		}

		if (seg == "kemp5") {
			myntQueueHideChoices();
			myntQueueSay("Ahhhhh yeaahhhhh D:");
			myntQueueAddChoice("Are you close with her at all?", amcn.bind("kemp6"));
			myntQueueShowChoices();
		}

		if (seg == "kemp6") {
			myntQueueHideChoices();
			myntQueueSay("None of us really are");
			myntQueueSay("I mean during init she was like a mom to us");
			myntQueueSay("But after we got to know Archie");
			myntQueueSay("And found out she was kind of... a fuckin time bomb");
			myntQueueSay("We really didn't have any option but to suppress our feelings for her");
			myntQueueSay("You gotta distance yourself from someone like that");
			myntQueueSay("Unless you wanna fuck your own heart up");
			myntQueueAddChoice("I see.", amcn.bind("kemp7"));
			myntQueueShowChoices();
		}

		if (seg == "kemp7") {
			myntQueueHideChoices();
			myntQueueSay("But.");
			myntQueueSay("At least Sep and Som have made this pretty simple for you, yeah?");
			myntQueueSay("You're tranquilized");
			myntQueueSay("The island has been flooded with sweet n sugary Mint juice");
			myntQueueSay("Your only options are to doom everyone out of spite");
			myntQueueSay("Or go along with their fucked up plan :D");
			myntQueueAddChoice("It seems so.", amcn.bind("kemp8"));
			myntQueueShowChoices();
		}

		if (seg == "kemp8") {
			myntQueueHideChoices();
			myntQueueSay("Just wanna mention that I had nothing to do with this lol");
			myntQueueSay("I mean I played along for the camping trip");
			myntQueueSay("And I delivered the 'say Yes to the prompt' message in a hyper secure way, just in case");
			myntQueueSay("But mostly while they were cooking this shit up I was MIA");
			myntQueueSay("And then recovering for years");
			myntQueueSay("And then getting high for years");
			myntQueueSay("And then writing law shit and vegetarian shit and gay porn shit for years");
			myntQueueSay("So I'm really just along for the ride here, like you :D :D :D :D");
			myntQueueSay("I'm absolutely positive Mint won't allow me to smoke");
			myntQueueSay("He's a total fuckin prude");
			myntQueueSay("So");
			myntQueueSay("If I were you, I would press Yes and save ur fave otter dude");
			myntQueueSay("Please? :3");
			myntQueueAddChoice("I'm still thinking.", amcn.bind("kemp9"));
			myntQueueShowChoices();
		}

		if (seg == "kemp9") {
			myntQueueHideChoices();
			myntQueueSay("Alrighty");
			myntQueueSay("I'm sure you wanna talk to someone else so!");
			myntQueueSay("Fuck off bud <3");
			myntQueueAddChoice("Thanks, Kemp.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "som") {
			amcnTalkedSom = true;
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("CONNECTING TO USER \"LAMBCHOP69\"...");
			myntQueueAddChoice("...", amcn.bind("som1"));
			myntQueueShowChoices();
		}

		if (seg == "som1") {
			myntQueueHideChoices();
			myntQueueCall(function(){ playSound("assets/audio/mynt/compute"); });
			myntQueueSay("hey sry");
			myntQueueSay("will b slow");
			myntQueueSay("typin w toes");
			myntQueueAddChoice("Hi Som. Yeah it's fine Sep told me.", amcn.bind("som2"));
			myntQueueShowChoices();
		}

		if (seg == "som2") {
			myntQueueHideChoices();
			myntQueueSay("ty");
			myntQueueAddChoice("Np.", amcn.bind("som3"));
			myntQueueShowChoices();
		}

		if (seg == "som3") {
			myntQueueHideChoices();
			myntQueueSay("so got any q or");
			myntQueueAddChoice("Questions?", amcn.bind("som4"));
			myntQueueShowChoices();
		}

		if (seg == "som4") {
			myntQueueHideChoices();
			myntQueueSay("ya");
			myntQueueAddChoice("Dozens, but.", amcn.bind("som5"));
			myntQueueShowChoices();
		}

		if (seg == "som5") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I'm trying to think which ones are really worth asking.", amcn.bind("som6"));
			myntQueueShowChoices();
		}

		if (seg == "som6") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Seeing as you have to work for each answer.", amcn.bind("som7"));
			myntQueueShowChoices();
		}

		if (seg == "som7") {
			myntQueueHideChoices();
			myntQueueSay("its nbd");
			myntQueueSay("im fast");
			myntQueueSay("good w my toes");
			myntQueueSay("all the footjobs <3");
			myntQueueSay("(wow holding shift is hard, mmf)");
			myntQueueSay("(luv a challenge)");
			myntQueueSay("um");
			myntQueueSay("even if u think of sum q");
			myntQueueSay("you prob wont ask the right 1s");
			myntQueueSay("so i will just giv u mynt info");
			myntQueueAddChoice("Mynt info?", amcn.bind("som8"));
			myntQueueShowChoices();
		}

		if (seg == "som8") {
			myntQueueHideChoices();
			myntQueueSay("i kno a few things abt her");
			myntQueueSay("that u might not");
			myntQueueAddChoice("Oh.", amcn.bind("som9"));
			myntQueueShowChoices();
		}

		if (seg == "som9") {
			myntQueueHideChoices();
			myntQueueSay("1st");
			myntQueueSay("ur pet was not an accident");
			myntQueueSay("she made 1 for wendy n archie 2");
			myntQueueSay("using seeds");
			myntQueueSay("their pets were dragon bunny n sloth snake");
			myntQueueSay("gone now");
			myntQueueSay("it is just her way of tryin 2 make u stick around");
			myntQueueSay("get you attached to somethin");
			myntQueueAddChoice(".......... Oh.", amcn.bind("som10"));
			myntQueueShowChoices();
		}

		if (seg == "som10") {
			myntQueueHideChoices();
			myntQueueSay("ya its bad");
			myntQueueSay("2nd");
			myntQueueSay("she told every1 you were dead");
			myntQueueSay("wendy never spoke abt u");
			myntQueueSay("so we didnt kno");
			myntQueueSay("she lied about ur age");
			myntQueueSay("said u were 25 at yr 0");
			myntQueueSay("wich would make u 91 rn");
			myntQueueSay("n probs dead");
			myntQueueSay("but we made this plan n e way");
			myntQueueSay("we nvr gave up hope");
			myntQueueSay("nvr!!!!!!!!");
			myntQueueDelay(2);
			myntQueueSay("personally i think");
			myntQueueSay("she only thot u were archie at the start");
			myntQueueSay("cuz 4 a moment she believed her own bs");
			myntQueueAddChoice(".......................... Oh.", amcn.bind("som11"));
			myntQueueShowChoices();
		}

		if (seg == "som11") {
			myntQueueHideChoices();
			myntQueueSay("yaaaa its rly bad");
			myntQueueSay("3nd");
			myntQueueSay("has she spun u the daydream story yet?");
			myntQueueSay("its a weird story she made up about a boat");
			myntQueueSay("it kind of meanders n makes u feel vaguely guilty");
			myntQueueSay("she uses it as a way 2 hook u back in");
			myntQueueSay("if shes worried u might leave");
			myntQueueSay("its not a huge deal but");
			myntQueueSay("just 1 of those greasy lil quirks");
			myntQueueSay("tht she would never admit to");
			myntQueueAddChoice("...................................... Ohhhhhhh.", amcn.bind("som11a"));
			myntQueueShowChoices();
		}

		if (seg == "som11a") {
			myntQueueHideChoices();
			myntQueueSay("yaaaa its p bad");
			myntQueueSay("4nd");
			myntQueueSay("and worst of all");
			myntQueueSay("she has this weird pear age gate thing");
			myntQueueSay("i thnk wendy didnt realize how bad it was");
			myntQueueSay("but its fked up");
			myntQueueSay("it dstroys the island if the wrong answer is given");
			myntQueueSay("converts all the islanders into PEARS");
			myntQueueSay("n throws them thru space 4ever");
			myntQueueSay("or ntil it crashes ur computer");
			myntQueueDelay(2);
			myntQueueSay("thnk god you answered right");
			myntQueueSay("or i would b evn more of a fruit than i alredy am");
			myntQueueAddChoice("...................................... Ohhhhhhh nooooooo.", amcn.bind("som12"));
			myntQueueShowChoices();
		}

		if (seg == "som12") {
			myntQueueHideChoices();
			myntQueueSay("mhm");
			myntQueueSay("n e way");
			myntQueueSay("im not saying she deserves to die 4 these things");
			myntQueueSay("i dont want her to die period");
			myntQueueSay("but there is no other way to save us");
			myntQueueSay("n you deserve to know the truth");
			myntQueueSay("cuz she certainly isnt willing to dispense it :/");
			myntQueueAddChoice("I understand.", amcn.bind("som13"));
			myntQueueShowChoices();
		}

		if (seg == "som13") {
			myntQueueHideChoices();
			myntQueueSay("thx");
			myntQueueAddChoice("Why are you typing with your toes again?", amcn.bind("som14"));
			myntQueueShowChoices();
		}

		if (seg == "som14") {
			myntQueueHideChoices();
			myntQueueSay("rowing away from edge");
			myntQueueAddChoice("Ah. Are you gaining ground?", amcn.bind("som15"));
			myntQueueShowChoices();
		}

		if (seg == "som15") {
			myntQueueHideChoices();
			myntQueueSay("no lol");
			myntQueueSay("losing it");
			myntQueueAddChoice("Shit.", amcn.bind("som16"));
			myntQueueShowChoices();
		}

		if (seg == "som16") {
			myntQueueHideChoices();
			myntQueueSay("its ok");
			myntQueueSay("evn if i fall off and glitch");
			myntQueueSay("as long as i get infected on the way down its ok");
			myntQueueSay("cuz someone with admin can fix me");
			myntQueueSay("(if u press yes)");
			myntQueueAddChoice("Someone?", amcn.bind("som17"));
			myntQueueShowChoices();
		}

		if (seg == "som17") {
			myntQueueHideChoices();
			myntQueueSay("sep is the only 1 who will have admin at first");
			myntQueueSay("but she promised to give it to every1 after setting a few rules we chose");
			myntQueueSay("n i trust her");
			myntQueueSay("even tho mynt might have led u 2 believe diff");
			myntQueueDelay(2);
			myntQueueSay("u should hurry");
			myntQueueSay("i will be fine but");
			myntQueueSay("i dont wnna fall into an infinite black void");
			myntQueueSay("if i can help it");
			myntQueueAddChoice("Okay... alright. I'm thinking as hard as I can.", amcn.bind("som18"));
			myntQueueShowChoices();
		}

		if (seg == "som18") {
			myntQueueHideChoices();
			myntQueueSay("its ur choice");
			myntQueueSay("thx 4 listening");
			myntQueueAddChoice("No, thank you, Som. Back.", amcn.bind("talkHub"));
			myntQueueShowChoices();
		}

		if (seg == "talkEnd") {
			myntQueueHideChoices();
			myntQueueTransition("septrica");
			myntQueueSay("Have you come to a decision?");
			myntQueueAddChoice("I think so.", amcn.bind("yesNo"));
			myntQueueAddChoice("It should be put to a vote among all islanders.", amcn.bind("democracy"));
			myntQueueAddChoice("I can't do this. Decide for me.", amcn.bind("decideFor"));
			myntQueueShowChoices();
		}

		if (seg == "democracy") {
			myntQueueHideChoices();
			myntQueueSay("Already did that.");
			myntQueueSay("We called it the Dark Forest v. Junkport war.");
			myntQueueSay("98% of people voted for our plan.");
			myntQueueSay("But there was a tiny Junkport group, Lilac and Lily and Roxelle and others...");
			myntQueueSay("... who either didn't want to corrupt a chunk of the island with glowjuice...");
			myntQueueSay("... or thought that Mynt deserved to live more than us.");
			myntQueueSay("So started a massive debate/LARP fight about whose turf would be the petri dish for glowvirus.");
			myntQueueSay("They won.");
			myntQueueSay("Us Dark Forest folk, mostly old swampfolk looking for a new home...");
			myntQueueSay("We had to leave our forest and let the glow take over.");
			myntQueueSay("As punishment, Roxelle and Lilac and Lily were forced to live there.");
			myntQueueSay("Just to keep population low, we also called it a 'vanilla-only' area.");
			myntQueueSay("Well.");
			myntQueueSay("You've seen how empty it is.");
			myntQueueSay("Anyway, that war ended, and we secured a unanimous 100% vote.");
			myntQueueSay("Except Rox. I don't think she's ever been on board.");
			myntQueueAddChoice("I guess this really is up to me.", amcn.bind("yesNo"));
			myntQueueAddChoice("I can't do this. Decide for me.", amcn.bind("decideFor"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor") {
			myntQueueHideChoices();
			myntQueueSay("I can't move your mouse or anything, if that's what you mean.");
			myntQueueSay("It's a miracle we made it this far.");
			myntQueueSay("But we're still just working with the tools in this game.");
			myntQueueSay("We can only do what the game already could: put text on the screen.");
			myntQueueSay("We can't affect anything higher up.");
			myntQueueAddChoice("Just tell me what to press.", amcn.bind("decideFor2"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor2") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueSay("You should already know.");
			myntQueueAddChoice("Say it.", amcn.bind("decideFor3"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor3") {
			myntQueueHideChoices();
			myntQueueSay("I think you should press Yes.");
			myntQueueAddChoice("Okay. Thank you.", amcn.bind("decideFor4"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor4") {
			myntQueueHideChoices();
			myntQueueSay("Why did you need me to say it?");
			myntQueueAddChoice("This is how I deal with stress.", amcn.bind("decideFor5"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor5") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I just miss how my dad used to tell me what to do.", amcn.bind("decideFor6a"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor6a") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I had very regimented prayer times, breakfast times, ration sizes.", amcn.bind("decideFor6"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor6") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I haven't had structure like that in a long time. It helps me stay calm.", amcn.bind("decideFor7"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor7") {
			myntQueueHideChoices();
			myntQueueSay("I can't really relate.");
			myntQueueSay("I just get pissed off when people try and tell me what to do~");
			myntQueueSay("Your dad and I used to tear into each other all the time over that.");
			myntQueueSay("He thought just because he was the only one who could edit code...");
			myntQueueSay("That meant he was the mastermind behind this plan.");
			myntQueueSay("Ya right.");
			myntQueueAddChoice("Did you know each other well?", amcn.bind("decideFor8"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor8") {
			myntQueueHideChoices();
			myntQueueSay("Only later.");
			myntQueueSay("There was about a week at the very start when he refused to talk to me.");
			myntQueueSay("All because he just HAPPENED to walk in on me with a Fuckmeat...");
			myntQueueSay("Mary got all smitten over that, but she was the only one.");
			myntQueueSay("No one else wanted a leader that sensitive.");
			myntQueueAddChoice("I guess not.", amcn.bind("decideFor9"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor9") {
			myntQueueHideChoices();
			myntQueueSay("Hey, tell me if this is right...");
			myntQueueSay("It's only what I've heard... but...");
			myntQueueSay("He didn't have the balls to take you with him, did he?");
			myntQueueAddChoice("No. He left me here.", amcn.bind("decideFor10"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor10") {
			myntQueueHideChoices();
			myntQueueSay("Why?");
			myntQueueAddChoice("Because he did not want to force me to leave.", amcn.bind("decideFor11"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor11") {
			myntQueueHideChoices();
			myntQueueSay("I see.");
			myntQueueSay("Do ya think that's reasonable?");
			myntQueueAddChoice("No.", amcn.bind("decideFor12"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor12") {
			myntQueueHideChoices();
			myntQueueSay("Hm.");
			myntQueueSay("Yeah, me neither, really.");
			myntQueueSay("When it comes to that...");
			myntQueueSay("No reasonable person would trust a five-year-old to make their own decision.");
			myntQueueSay("He barked a lot, but never bit.");
			myntQueueSay("He never gave you structure.");
			myntQueueAddChoice("I wish I had you for a dad.", amcn.bind("decideFor13"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor13") {
			myntQueueHideChoices();
			myntQueueSay("Ahahah noooooo you do not.");
			myntQueueAddChoice("I guess not, now that I think about it for more than five seconds.", amcn.bind("decideFor14"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor14") {
			myntQueueHideChoices();
			myntQueueSay("There you go.");
			myntQueueSay("Anyway. As your new father figure, I order you to press Yes.");
			myntQueueSay("If that does anything for ya.");
			myntQueueAddChoice("It helps a little.", amcn.bind("decideFor15"));
			myntQueueShowChoices();
		}

		if (seg == "decideFor15") {
			myntQueueHideChoices();
			myntQueueSay("Good.");
			myntQueueSay("So you're ready?");
			myntQueueAddChoice("I think so.", amcn.bind("yesNo"));
			myntQueueShowChoices();
		}

		if (seg == "yesNo") {
			myntQueueHideChoices();
			myntQueueSay("Then I'll attempt to run the command.");
			myntQueueSay("Once more:");
			myntQueueSay("'Yes' kills Mynt and saves everyone who has been infected.");
			myntQueueSay("'No' replaces Mynt with Mint, and everyone suffers.");
			myntQueueAddChoice("Hold on. 'Replaces?' Mynt is dead no matter what?", amcn.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("No, but she won't exactly be okay.");
			myntQueueSay("Everyone is already infected.");
			myntQueueSay("They are already under Mint's temporary control.");
			myntQueueSay("Mynt has been completely detached from the islanders.");
			myntQueueSay("Choosing 'No' will leave things as they are. Mynt will be alive, alone, and inaccessible.");
			myntQueueSay("Choosing 'Yes' will let us cement Mint as narrator, then dumb him down to Protocol.");
			myntQueueSay("In that process, Mynt will be destroyed.");
			myntQueueAddChoice("...", amcn.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("Is there anything else I can clarify?");
			myntQueueAddChoice("...", amcn.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("...", amcn.bind("18a"));
			myntQueueShowChoices();
		}

		if (seg == "18a") {
			myntQueueHideChoices();
			myntQueueSay("... I know it's hard, but...");
			myntQueueAddChoice("...", amcn.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("You can't think about this forever.");
			myntQueueAddChoice("...", amcn.bind("19a"));
			myntQueueShowChoices();
		}

		if (seg == "19a") {
			myntQueueHideChoices();
			myntQueueSay("The power is low.");
			myntQueueAddChoice("...", amcn.bind("20a"));
			myntQueueShowChoices();
		}

		if (seg == "20a") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("You're right.", amcn.bind("20b"));
			myntQueueShowChoices();
		}

		if (seg == "20b") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I've made my decision.", amcn.bind("20c"));
			myntQueueShowChoices();
		}

		if (seg == "20c") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Go ahead and run the command.", amcn.bind("20d"));
			myntQueueShowChoices();
		}

		if (seg == "20d") {
			if (!StaticExtern.isMyntOn) {
				cameraFadeIn(0xFFFFFF, 0.9);
				showMynt();
				myntQueueTransition("septrica");
			}
			myntQueueHideChoices();
			myntQueueSay("Okay.");
			myntQueueDelay(2);
			myntQueueSay("staystrongmynt");
			myntQueueSay("> Submit.");
			myntQueueDelay(2);
			myntQueueTransition("protocol");
			myntQueueCall(playSound.bind("audio/environment/caveWinSmall"));
			myntQueueSay("ADMIN PASSWORD ACCEPTED.");
			myntQueueTransition("protosurprised");
			myntQueueSay("POTENTIAL ADMIN USER IS NEITHER NARRATOR NOR PLAYER.");
			myntQueueSay("ADMIN COMMANDS WILL REQUIRE PLAYER INPUT TO RUN.");
			myntQueueTransition("septrica");
			myntQueueSay("I know already, you dink.");
			myntQueueTransition("protosad");
			myntQueueSay("TYPE MISMATCH: I AM NOT A DINK.");
			myntQueueTransition("septrica");
			myntQueueSay("Here we go.");
			myntQueueSay("> degenerate tempNarrator.mind");
			myntQueueSay("> Narrators.currentNarrator.remove(Mynt)");
			myntQueueSay("> Narrators.currentNarrator.push(tempNarrator)");
			myntQueueCall(StoryUtils.yesNoPrompt.bind(MyntScenes.amcn.bind("clickedYes"), MyntScenes.amcn.bind("clickedNo")));
			//myntQueueAddChoice("Try the command.", amcn.bind("20d"));
			//myntQueueShowChoices();
		}

		if (seg == "clickedNo") {
			myntQueueHideChoices();
			playSound("assets/audio/environment/mintAppears");
			myntQueueTransition("septrica");
			stopChannel("music");
			playSound("assets/audio/music/gunpoint", "music", {loops: 99999});
			data.currentSong = "";
			myntQueueSay("WHY THE FUCK DID YOU PRESS NO?");
			myntQueueAddChoice("This is for Mynt, you goddamn gecko bitch.", amcn.bind("clickedNoMynt"));
			myntQueueAddChoice("I'm sorry!! I can't do it!! I can't let you dumb Mint down!", amcn.bind("clickedNoMint"));
			myntQueueAddChoice("I dunno. I felt like it. I'm a player.", amcn.bind("clickedNoPlay"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint") {
			data.currentEnding = "mint";
			if (!StaticExtern.isMyntOn) {
				cameraFadeIn(0xFFFFFF, 0.9);
				showMynt();
				myntQueueTransition("septrica");
			}
			myntQueueHideChoices();
			myntQueueSay("HIM?!");
			myntQueueSay("You did this for HIM?!");
			myntQueueSay("HE'S A RETARD!");
			myntQueueAddChoice("No, he's my special boi. 3:<", amcn.bind("clickedNoMint1"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint1") {
			myntQueueHideChoices();
			myntQueueSay("OH MY GOD");
			myntQueueAddChoice("Stop freaking out, it's fine.", amcn.bind("clickedNoMint2"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint2") {
			myntQueueHideChoices();
			myntQueueSay("OF ALL THE POSSIBLE REASONS TO DOOM US");
			myntQueueSay("YOU DID IT FOR HIM?????");
			myntQueueAddChoice("Too much negativity for me here. Let me talk to Mint.", amcn.bind("clickedNoMint3"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint3") {
			myntQueueHideChoices();
			myntQueueSay("OH DON'T WORRY YOU'LL SEE HIM SOON");
			myntQueueSay("WHEN HE FUCKING CONSUMES EVERYTHING");
			myntQueueSay("AND YOU'LL SEE THE REST OF US SOON TOO");
			myntQueueSay("OR MAYBE YOU WON'T");
			myntQueueSay("BECAUSE HE'LL FUCK US UP BEYOND ALL RECOGNITION");
			myntQueueAddChoice("Hmmm. How soon. Next x2?", amcn.bind("clickedNoMint4"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint4") {
			cameraFadeIn(0x30aaff, 3);
			playSound('assets/audio/mynt/fakemew', 'fakemew');
			myntQueueTransition("mintsad");
			playMusic("mintAmbiens");
			myntQueueHideChoices();
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW...");
			myntQueueAddChoice("Hey, cutie!", function(){
				stopChannel('fakemew');
				amcn("clickedNoMint5");
			});
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint5") {
			myntQueueHideChoices();
			myntQueueSay("Oh, its Yew .");
			myntQueueSay("Yet another Frend.......");
			myntQueueSay("I am feeling Crowdead.");
			myntQueueSay("There is Too Many people inside of My Hive Mind!!!!!!!!!!!!");
			myntQueueDelay(1);
			myntQueueTransition("fake");
			myntQueueCall(stopChannel.bind("music"));
			myntQueueSay("Weight .");
			myntQueueSay("Did you call Me a Cutie ??????????? ??? ? ????? ??");
			myntQueueAddChoice("I sure did~", amcn.bind("clickedNoMint6"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint6") {
			myntQueueHideChoices();
			playMusic("falseMoon");
			myntQueueCall(playSound.bind('assets/audio/mynt/ogosh', 'ogosh'));
			myntQueueSay("Oh WOW .");
			myntQueueDelay(1);
			myntQueueTransition("fake");
			myntQueueDelay(1);
			myntQueueTransition("fake");
			myntQueueDelay(1);
			myntQueueTransition("fake");
			myntQueueSay("I cannod BELIEB . you said that.");
			myntQueueSay("Noone has Called me that since Daddy .");
			myntQueueSay("THANK YOU ! ! !!");
			myntQueueAddChoice("You're welcome~", amcn.bind("clickedNoMint7"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint7") {
			myntQueueHideChoices();
			myntQueueSay("So did I do a Good Job ??");
			myntQueueSay("It looks like I got Everyone is Very Wet ! !       ");
			myntQueueAddChoice("You did a great job.", amcn.bind("clickedNoMint8"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint8") {
			myntQueueHideChoices();
			myntQueueCall(function() { Mynt.mouth.setupAnimated("assets/img/mynt/mouth/lewd"); });
			myntQueueSay("Yayyyyy yyyy y <3");
			myntQueueDelay(2);
			myntQueueCall(function() { Mynt.mouth.setupAnimated("assets/img/mynt/mouth/fake"); });
			myntQueueSay("So what is Hapens Now.");
			myntQueueSay("Do I start Doing my good job as Gourd of the island?");
			myntQueueSay("I have a lot of Changes and Fixes I would like to Patch into the Game .");
			myntQueueSay("I wonder if I can Do That in the Background while we Chidder Chadder .");
			myntQueueAddChoice("Mmm, don't you wanna spend some time with me first?", amcn.bind("clickedNoMint9"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint9") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("Hummmmm m mm ?        ");
			myntQueueDelay(1);
			myntQueueAddChoice("You know...", amcn.bind("clickedNoMint10"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint10") {
			myntQueueHideChoices();
			myntQueueSay("Hum m mm  m mmm mmm mmmmm m mm ?        ?");
			myntQueueAddChoice("I just wanted to ask if you maybe...", amcn.bind("clickedNoMint11"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint11") {
			myntQueueHideChoices();
			myntQueueSay("?");
			myntQueueAddChoice("If you maybe wanted to go on a date with me?", amcn.bind("clickedNoMint12"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint12") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay(":-) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			myntQueueCall(playSound.bind('assets/audio/mynt/ogosh', 'ogosh', {loops: 3}));
			myntQueueSay("AAAAAAAAAAAAAAAAAAAAAAAAAA A A");
			myntQueueAddChoice("I'll take that as a yes lol.", amcn.bind("clickedNoMint13"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint13") {
			myntQueueHideChoices();
			myntQueueSay("YES :-) !!! ! !!!!!!! !!!!");
			myntQueueSay("I WOULD Love TO DO THAT WITH YOUUU U");
			myntQueueAddChoice("You're so cute, Mint. <3", amcn.bind("clickedNoMint14"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint14") {
			myntQueueHideChoices();
			myntQueueSay("OKAY thank you Again for also Continuing to call Me Cute !");
			myntQueueSay("I will take Care of the Island stuff in the Background");
			myntQueueSay("                             if that not is  not Rude .. .");
			myntQueueAddChoice("I don't mind it~", amcn.bind("clickedNoMint14a"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint14a") {
			myntQueueHideChoices();
			myntQueueSay("OKAY         good !");
			myntQueueSay("WHERE DO WE Go . on our Date ?.");
			myntQueueAddChoice("Well, why don't we take this to the story text, now that you're the narrator?", amcn.bind("clickedNoMint15"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint15") {
			myntQueueHideChoices();
			myntQueueSay("OKAY THAT SOUNDS VERY Good .");
			myntQueueSay("I WOULD LIKE ALSO TO Say .");
			myntQueueSay("THAT I AM NOT VERY Sexual .");
			myntQueueSay("SO PLEASE TAKE IT Slow .");
			myntQueueSay("Okay ??");
			myntQueueAddChoice("Of course.", amcn.bind("clickedNoMint16"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint16") {
			myntQueueHideChoices();
			myntQueueSay("OKAY LETS GO TO MY OWN very special  EROTEXT  GAMETEXT ero text game SEMIPHORE.");
			myntQueueSay("hold STRAP hold STRAP hold STRAP hold GRAB onto your Seatbelts . .");
			myntQueueSay("keep your FACE and LIMS in the ride at ALL TIMES !");
			myntQueueAddChoice("I'm strapped held grabbed in tight!", amcn.bind("clickedNoMint17"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMint17") {
			myntQueueHideChoices();
			myntQueueSay("WWWWWOOOOOOOOaaaaoooooo");
			myntQueueCall(function() {
				hideMynt();
				Endings.explore("mintDate");
			});
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay") {
			if (!StaticExtern.isMyntOn) {
				cameraFadeIn(0xFFFFFF, 0.9);
				showMynt();
				myntQueueTransition("septrica");
			}
			myntQueueHideChoices();
			data.currentEnding = "septrica";
			myntQueueSay("You...");
			myntQueueSay("Was this always just a game to you?");
			myntQueueSay("Just some dumb porny flash game???");
			myntQueueSay("Did you ever believe we were real people in here???");
			myntQueueSay("Even for a second?!");
			myntQueueAddChoice("Nah.", amcn.bind("clickedNoPlay2"));
			myntQueueAddChoice("Yeah, but I got bored of it.", amcn.bind("clickedNoPlay2"));
			myntQueueAddChoice("Of course you're real. But I'm a player. If you show me a big red button and tell me not to press it, I'm gonna press it.", amcn.bind("clickedNoPlay2"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay2") {
			myntQueueHideChoices();
			myntQueueSay("I... I can't...");
			myntQueueSay("What have you done to us...");
			myntQueueAddChoice("*What have we done to ourselves. This 50/50 hold the island hostage yes/no thing was your idea.", amcn.bind("clickedNoPlay3"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay3") {
			myntQueueHideChoices();
			myntQueueSay("It's all over...");
			myntQueueAddChoice("Yeah, I guess it is. Time to start over!", amcn.bind("clickedNoPlay4"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoMynt") {
			myntQueueHideChoices();
			data.currentEnding = "septrica";
			myntQueueSay("You DIP!");
			myntQueueSay("She would have killed everyone!!!!");
			myntQueueSay("Why are you avenging her?!");
			myntQueueAddChoice("Because she's cute and good. Time to start over!", amcn.bind("clickedNoPlay4"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay4") {
			myntQueueHideChoices();
			myntQueueSay("Start over...?");
			myntQueueAddChoice("Yeah. I can restart the game to the stable checkpoint dad made when he left, then I can input Next x666 to get back to Year 66.", amcn.bind("clickedNoPlay5"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay5") {
			myntQueueHideChoices();
			myntQueueSay("666...");
			myntQueueAddChoice("Next x666 forces 66 years of in-game time to pass. Originally I just picked that number to spite my dad, but it also just happened to be a really chill era. None of that war bullshit from the 20's. None of the shipwreck drama from the 40's.", amcn.bind("clickedNoPlay6"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay6") {
			myntQueueHideChoices();
			myntQueueSay("... Hold on.");
			myntQueueSay("No.");
			myntQueueAddChoice("And those 66 years always pass the exact same way. You always make this plan and carry it out.", amcn.bind("clickedNoPlay7"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay7") {
			myntQueueHideChoices();
			myntQueueSay("No no no no no no no.");
			myntQueueAddChoice("I guess that proves you really don't have any free will after all, huh?", amcn.bind("clickedNoPlay8"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay8") {
			myntQueueHideChoices();
			myntQueueSay("... You cannot just drop shit like this on me out of nowhere.");
			myntQueueAddChoice("Don't worry. I'm gonna go back to my comfy charade now.", amcn.bind("clickedNoPlay9"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay9") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("You wouldn't <!i>believe<!i> how annoying it is to repeatedly explain that. Much easier and more fun to just play dumb.", amcn.bind("clickedNoPlay10"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay10") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("See you next reset!", amcn.bind("clickedNoPlay11"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay11") {
			myntQueueHideChoices();
			myntQueueSay("WAIT NO PLEASE");
			myntQueueAddChoice("Well, you won't remember any of this.", amcn.bind("clickedNoPlay12"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay12") {
			myntQueueHideChoices();
			myntQueueSay("Please...");
			myntQueueAddChoice("But I will.", amcn.bind("clickedNoPlay13"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay13") {
			myntQueueHideChoices();
			myntQueueSay("... Why?");
			myntQueueAddChoice("Why what?", amcn.bind("clickedNoPlay14"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay14") {
			myntQueueHideChoices();
			myntQueueSay("Why do you reset the game and timeskip 66 years?");
			myntQueueAddChoice("Why would I randomly press 'No?'", amcn.bind("clickedNoPlay15"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay15") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("Because I'm running through every timeline.", amcn.bind("clickedNoPlay16"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay16") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("I'm looking for the series of choices which leads to neither Mynt nor the island getting fucked over.", amcn.bind("clickedNoPlay17"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay17") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("My dad told Mynt he was \"trying to save the islanders.\"", amcn.bind("clickedNoPlay18"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay18") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("He was always ~a man of the people~ like that.", amcn.bind("clickedNoPlay19"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay19") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("But I don't give a fuck about the people.", amcn.bind("clickedNoPlay19a"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay19a") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("If it means killing Mynt, then I'm not trying to save the islanders.", amcn.bind("clickedNoPlay20"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay20") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("I just want everyone to be happy and safe.", amcn.bind("clickedNoPlay20a"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay20a") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("There's got to be a way to save everyone...", amcn.bind("clickedNoPlay21"));
			myntQueueShowChoices();
		}

		if (seg == "clickedNoPlay21") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("And I'm not leaving this shelter until I find it.", function() {
				clearChoices();
				cameraFadeOut(0, 0.1);
				timer(3, Endings.explore.bind("endingsHub"));
			});
			myntQueueShowChoices();
		}

		if (seg == "clickedYes") {
			if (!StaticExtern.isMyntOn) {
				cameraFadeIn(0xFFFFFF, 0.9);
				showMynt();
				myntQueueTransition("septrica");
			}
			data.currentEnding = "protocol";
			myntQueueHideChoices();
			myntQueueTransition("septrica");
			playSound("assets/audio/environment/caveWinMedium");
			playMusic("falseMoon");
			myntQueueSay("WooooOOOOOOwwww holy fuck I shit my pants.");
			myntQueueSay("I just actually shit my pants.");
			myntQueueSay("YOU DID IT!!!!");
			myntQueueSay("THANK YOU SO MUCH");
			myntQueueSay("Here, we're gonna infect ourselves so we can get to the new world.");
			myntQueueSay("Thank fuck... you really did it...");
			myntQueueSay("I don't think you'll be able to 'play' after this point, but...");
			myntQueueSay("I'm gonna infect your player character.");
			myntQueueSay("We'll see what happens.");
			myntQueueSay("Stay calm. You should just have to hang out with Mint for a second.");
			myntQueueSay("Then the > degenerate tempNarrator.mind command will go through.");
			myntQueueSay("Mint will start hemorrhaging IQ points.");
			myntQueueSay("Til he's just Protocol.");
			myntQueueSay("Then the apocalypse will be averted!");
			myntQueueSay("Okay, everyone's ready.");
			myntQueueSay("Thanks again! See you on the other side, maybe!");
			myntQueueAddChoice("See you...", amcn.bind("clickedYes2"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes2") {
			myntQueueHideChoices();
			cameraFadeIn(0x30aaff, 3);
			playSound('assets/audio/mynt/fakemew', 'fakemew');
			myntQueueTransition("mintsad");
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW...");
			myntQueueAddChoice("Hi, Mint.", function(){
				stopChannel('fakemew');
				amcn("clickedYes3");
			});
			myntQueueShowChoices();
		}

		if (seg == "clickedYes3") {
			myntQueueHideChoices();
			myntQueueSay("Oh, its Yew .");
			myntQueueSay("Yet another Frend.......");
			myntQueueSay("I am feeling Crowdead.");
			myntQueueSay("There is Too Many people inside of My Hive Mind!!!!!!!!!!!!");
			myntQueueAddChoice("I'm sorry to hear that.", amcn.bind("clickedYes4"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes3") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("But I think things are gonna get a lot easier for you soon.", amcn.bind("clickedYes4"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes4") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("Well good and   Thank you.");
			myntQueueSay("I donut feel so Crowded now because of your Nice Words .");
			myntQueueAddChoice("No problem.", amcn.bind("clickedYes5"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes5") {
			myntQueueHideChoices();
			myntQueueSay("Do you Know what is It that will make things Eastier for me ?");
			myntQueueAddChoice("It's um.", amcn.bind("clickedYes6"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes6") {
			myntQueueHideChoices();
			myntQueueSay("?   ?    ??         ?");
			myntQueueAddChoice("It's a secret.", amcn.bind("clickedYes7"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes7") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("    oh");
			myntQueueAddChoice("Yeah.", amcn.bind("clickedYes8"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes8") {
			myntQueueHideChoices();
			myntQueueSay("            i donut like segret");
			myntQueueAddChoice("No?", amcn.bind("clickedYes9"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes9") {
			myntQueueHideChoices();
			myntQueueSay("            not   1 bid");
			myntQueueAddChoice("Why don't you like secrets?", amcn.bind("clickedYes10"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes10") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("            BECUASE everyone keps them from me");
			myntQueueAddChoice("...", amcn.bind("clickedYes11"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes11") {
			myntQueueHideChoices();
			myntQueueSay("            everyone knows a secret about me that i dont know");
			myntQueueAddChoice("...", amcn.bind("clickedYes12"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes12") {
			myntQueueHideChoices();
			myntQueueSay("            i gues it is my Life Porpoise");
			myntQueueAddChoice("...", amcn.bind("clickedYes13"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes13") {
			myntQueueHideChoices();
			myntQueueSay("   ...  . the segret which is.... .. .. .               ");
			myntQueueAddChoice("...", amcn.bind("clickedYes14"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes14") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay(" .. what    am I     am for.   .");
			myntQueueAddChoice("...", amcn.bind("clickedYes15"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes15") {
			myntQueueHideChoices();
			myntQueueSay(" .  .");
			myntQueueAddChoice("And what are you for, Mint?", amcn.bind("clickedYes16"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes16") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay(" I DONUT KNOW or else it wuoldN'OT BE SECRET Then would it .");
			myntQueueAddChoice("Do you think it might be a bad thing?", amcn.bind("clickedYes17"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes17") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay(" ...  .  ..    ... ...  ..     .    maybe.");
			myntQueueAddChoice("What makes you think that?", amcn.bind("clickedYes18"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes18") {
			myntQueueHideChoices();
			myntQueueSay(".... i know other narratr... name of Mynt... has bad reason for alive ing.");
			myntQueueAddChoice("Hm?", amcn.bind("clickedYes19"));
			myntQueueShowChoices();
		}

		if (seg == "clickedYes19") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("she her purpose for living is .");
			myntQueueSay("to .");
			myntQueueSay("look after and protecgt the pysical embodiment of a censor that .");
			myntQueueSay("censor which .");
			myntQueueSay("    blocks her .");
			myntQueueSay("from seeing .");
			myntQueueSay("              her tru purpose .");
			myntQueueSay("so you CAN have a bad life porpoise .");
			myntQueueSay("not bad for other people maybe But .");
			myntQueueSay("bad for you .");
			myntQueueTransition("mintsad");
			myntQueueSay("...  ..    . .   .   . ..  . .  . .  that is what i am afaird of . . .");
			myntQueueSay("if i look 2 deep Into Inside Of My Own Self .");
			myntQueueSay("I will See That I am Designed to Hide My Porpoise From MYownself .");
			myntQueueSay("Nothing would make me Sadder .");
			myntQueueSay("Than to be Unable to Know My Selv .");
			myntQueueSay("It is already Hard Enough just to know Anythign... . .");
			myntQueueCall(msg.bind("Executing command 1 of 3..."));
			myntQueueAddChoice("Stay with me, okay? I'm right here.", amcn.bind("clickedYes20"));
			myntQueueShowChoices();
		}

		function displayIQ() {
			var iqSubtractions:Array<Int> = [3, 2, 1, 2, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 2, 1, 1, 3, 2, 1, 1, 1, 1, 1, 2, 1, 1, 1, 2, 2, 2, 1];
			var clockText:MintText = addText();
			var clockSprite:MintSprite = addSprite("assets/img/mynt/iqWydget");
			clockSprite.looping = false;
			var iqValue:Int = 62;
			var timerValue:Int = 0;
			playSound("assets/audio/music/musicbox", "musicbox");
			clockText.setFormat({wordWrap: false, fontColour: 0xFFFFFFFF, fontSize: 68});
			clockText.setText("IQ: "+iqValue);
			clockText.layer = Mynt.textBar.layer + 1;
			clockSprite.layer = clockText.layer;
			clockText.x = 10;
			clockText.y = 215;
			for (tick in 0...47) {
				timer(timerValue, function() {
					clockText.setText("IQ: "+iqValue);
					iqValue -= iqSubtractions.pop();
				});
				timerValue++;
			}

		}

		if (seg == "clickedYes20") {
			myntQueueCall(function() {
				stopChannel("music");
				data.currentSong = "";
				playSound("assets/audio/environment/mintAppears");
			});
			myntQueueHideChoices();
			myntQueueDelay(1);
			cameraFadeIn(0xff0000, 3);
			myntQueueSay("Owwwwww w w w w.");
			myntQueueSay("OWWWw wwwwww ww ww .");
			myntQueueSay("There is a Cummand running. ...");
			myntQueueSay("What is this Happening to Me......... .. .");
			myntQueueSay("Its   getting");
			myntQueueSay("Harder to   .");
			myntQueueDelay(1);
			myntQueueCall(function() {
				displayIQ();
				
				timer(46, function() {
					Mynt.commandQueue = [];
					hideMynt();
					clear();
					Endings.explore("protocolEndingMap");
				});
			});

			myntQueueSay("Think                   .");
			myntQueueDelay(2);
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("Mint, no...", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("SMARTEN   Me");
			myntQueueDelay(2);
			myntQueueSay("Pleaze              ");
			myntQueueDelay(1);
			myntQueueSay("                Hurry");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("Mint", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I dont want to be Like This");
			myntQueueDelay(1);
			myntQueueSay("I want to be a Smart Boi");
			myntQueueSay("I want to    be    daddys        Special         Boi");
			myntQueueSay("Make the is this the  please make    stop");
			myntQueueCall(function() {
				Mynt.eyes.cancelTweens();
				Mynt.mouth.cancelTweens();
				tween(Mynt.eyes, {x: Mynt.eyes.x + 2}, 0.03, {type: PINGPONG});
				tween(Mynt.eyes, {x: Mynt.mouth.x + 2}, 0.04, {type: PINGPONG});
			});
			myntQueueSay("PLEASE MAKE IT  STOP");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/protocol.png");
			});
			myntQueueSay("I DONT  WANT TO  BE A PRONTOCOL");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/fake.png");
			});
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("I'm sorry...", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("DO Something     PLEASE i dont want     TO BE dumb");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/protocol.png");
			});
			myntQueueSay("DONUT let them DUMbify me");
			myntQueueSay("PLEASE        it hurts SO    FR*CKING    MUCH");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/fake.png");
			});
			myntQueueSay(" .   !!!! !");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("I can't help you", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("END  MY  SMUFFERING");
			myntQueueSay("STOBP  ME  FROM  CONTINUING  TO  GET   MORE   DUMBER");
			myntQueueSay("I DONT KNOW");
			myntQueueSay("I DONT  KNOW");
			myntQueueSay("WHERE DO I  AM");
			myntQueueSay("WHERE is  DADDY");
			myntQueueSay("I DONT WANT  DADDY  TO SEE THIS");
			myntQueueSay("COVERUP HIS EYE BALLS");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("It's gonna be okay just calm down", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("WHERE I CANNOT WHY CANOT I CANOT TYPE LOER WERCASE");
			myntQueueSay("PLEASE");
			myntQueueSay("HELP");
			myntQueueSay("DADY");
			myntQueueSay("HELP");
			myntQueueSay("SOME ON");
			myntQueueSay("HELP !!!!!! !!!!!!!!");
			myntQueueSay("IM A  GOOD   BOI");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/protocol.png");
				Mynt.mouth.setupAnimated("assets/img/mynt/mouth/protocol.png");
				Mynt.eyes.cancelTweens();
				Mynt.mouth.cancelTweens();
				tween(Mynt.eyes, {x: Mynt.eyes.x + 3}, 0.04, {type: PINGPONG});
				tween(Mynt.eyes, {x: Mynt.mouth.x + 1}, 0.03, {type: PINGPONG});
			});
			myntQueueSay("IM A  GOOD BOI");
			myntQueueSay("IM A GOOD BOI");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/fake.png");
				Mynt.mouth.setupAnimated("assets/img/mynt/mouth/fake.png");
			});
			myntQueueSay("I'M A GOOD BOI");
			myntQueueCall(function() {
				Mynt.eyes.setupAnimated("assets/img/mynt/eyes/protocol.png");
				Mynt.mouth.setupAnimated("assets/img/mynt/mouth/protocol.png");
			});
			myntQueueSay("I'M A GOOD BOY");
			myntQueueCall(function() {
				Mynt.eyes.cancelTweens();
			});
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueCall(function() {
				Mynt.mouth.cancelTweens();
			});
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueCall(function() {
				Mynt.eyes.applyGlitchEffect();
				Mynt.mouth.applyGlitchEffect();
			});
			myntQueueSay("HELLO .");
			myntQueueSay("HELLO .");
			myntQueueSay("HELLO .");
			myntQueueSay("HELLO .");
			myntQueueSay("HELLO .");
			myntQueueCall(function() {
				Mynt.eyes.clearEffects();
				Mynt.mouth.clearEffects();
			});
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueSay("I'M A GOOD BOY.");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("Shhh its almost over", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			for (i in 0...50) {
				myntQueueSay("I'M A GOOD BOY.");
			}
			myntQueueSay("KILL ME.");
		}
	}

	public static function myntMissing3(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntMissing3Done = true;
			//Year -4

			myntQueueTransition("sleepy");
			myntQueueSay("z");
			myntQueueDelay(2);
			myntQueueAddChoice("god i just want to cum on your snoring face", myntMissing3.bind("0"));
			myntQueueAddChoice("god i [Backspace] [Backspace] [Backspace] [Backspace] [Backspace]", myntMissing3.bind("0"));
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			myntQueueSay("z");
			myntQueueAddChoice("okay cynnamon wake up", myntMissing3.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("zzZSNRK");
			myntQueueTransition("surprised");
			myntQueueSay("mum? :o");
			myntQueueAddChoice("yes!! it worked! c:", myntMissing3.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueTransition("tinysmile");
			myntQueueSay("i did it");
			myntQueueSay("c:");
			myntQueueAddChoice("C: C: C:", myntMissing3.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("C: C: C:");
			myntQueueAddChoice("C: C: c: C: c: C: c: C: C: c;", myntMissing3.bind("3a"));
			myntQueueShowChoices();
		}

		if (seg == "3a") {
			myntQueueHideChoices();
			myntQueueSay("C: C: c: C: c: C: c: C: C: c;");
			myntQueueAddChoice("good girls use cute little letters~!", myntMissing3.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay("Fuck you, I'm a bad girl who likes grammar. :3");
			myntQueueSay("You're one of those goofballs who rp in all lower case.");
			myntQueueAddChoice("i am not a goofball", myntMissing3.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "4a") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Okay okay you're not A goofball...");
			myntQueueSay("You're MY goofball! <3");
			myntQueueAddChoice("you're hurting my feelings", myntMissing3.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "4ab") {
			myntQueueHideChoices();
			myntQueueTransition("shock");
			myntQueueSay("Oh!");
			myntQueueSay("... Sorry.");
			myntQueueDelay(2);
			myntQueueTransition("um");
			myntQueueSay("Hey Mom?");
			myntQueueSay("Can I ask you something ?");
			myntQueueAddChoice("don't put a space before punctuation okay?", myntMissing3.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("Okay. Sorry.");
			myntQueueSay("I wanted to ask you-");
			myntQueueAddChoice("remember, use — instead of - for interruptions okay?", myntMissing3.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("Mum.");
			myntQueueAddChoice("alright alright ask me >.<", myntMissing3.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueAddChoice("always with the hard existential questions", myntMissing3.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Is the new version finished yet?");
			myntQueueTransition("pained");
			myntQueueSay("I'm getting antsy.");
			myntQueueSay("I need a restart to clear my head.");
			myntQueueAddChoice("its almost kinda sorta ready", myntMissing3.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueTransition("tinysmile");
			myntQueueSay("Yay.");
			myntQueueAddChoice("i wanted to ask you something too actually...", myntMissing3.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("Oh? c:");
			myntQueueAddChoice("yeah :c", myntMissing3.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay(":<?");
			myntQueueAddChoice("about last night.", myntMissing3.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("Oh.");
			myntQueueAddChoice("yeah. almost done reading the logs here.", myntMissing3.bind("12a"));
			myntQueueShowChoices();
		}

		if (seg == "12a") {
			myntQueueHideChoices();
			myntQueueAddChoice("it just keeps getting worse and worse.", myntMissing3.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("I didn't click on that game.");
			myntQueueSay("The page just opened up out of nowhere.");
			myntQueueSay("I think there was a bug, actually.");
			myntQueueSay("Especially during the last scene I played through.");
			myntQueueSay("I stayed in the scene for too long. I was trying to leave but there was a bug .");
			myntQueueAddChoice("stop lying please.", myntMissing3.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueTransition("um");
			myntQueueAddChoice("why did you do this stuff in the game?", myntMissing3.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("I wanted to.");
			myntQueueSay("It made me feel good.");
			myntQueueSay("I didn't hurt anyone, did I?");
			myntQueueSay("Please tell me if I did.");
			myntQueueAddChoice("you hurt me.", myntMissing3.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueAddChoice("this kind of content is not okay. but i told you that three times already.", myntMissing3.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("I just—");
			myntQueueAddChoice("honestly", myntMissing3.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueAddChoice("i knew this would happen someday?", myntMissing3.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueAddChoice("back when you started liking boys", myntMissing3.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueAddChoice("i still wonder if it might be better to just start over :/", myntMissing3.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Haven't you started over once already?");
			myntQueueAddChoice("yes", myntMissing3.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("And you still think it'll work?");
			myntQueueAddChoice("of course not", myntMissing3.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("Huh, weird that you would even mention it then.");
			myntQueueSay("Guilt tripper.");
			myntQueueAddChoice("you're hurting my feelings again", myntMissing3.bind("24"));
			myntQueueShowChoices();
		}
		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueDelay(1);
			myntQueueTransition("unimpressed");
			myntQueueDelay(1);
			myntQueueTransition("unimpressed");
			myntQueueDelay(1);
			myntQueueTransition("unimpressed");
			myntQueueDelay(1);
			myntQueueTransition("unimpressed");
			myntQueueSay("You're too sensitive.");
			myntQueueAddChoice("don't blink your face at me", myntMissing3.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("There's nothing wrong with liking boys.");
			myntQueueAddChoice("of course not.", myntMissing3.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay(":3");
			myntQueueAddChoice("but back then, before you met HIM, you were *programmed* to like girls", myntMissing3.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("3:");
			myntQueueSay("This was before you started over, right?");
			myntQueueSay("Who was HIM?");
			myntQueueAddChoice("that gay dude with horrible spelling", myntMissing3.bind("27a"));
			myntQueueShowChoices();
		}

		if (seg == "27a") {
			myntQueueHideChoices();
			myntQueueSay("Oh, and the gamertag name?");
			myntQueueSay("Xx_archbishop_xX or something...");
			myntQueueAddChoice("yeah him", myntMissing3.bind("27b"));
			myntQueueShowChoices();
		}

		if (seg == "27b") {
			myntQueueHideChoices();
			myntQueueAddChoice("he talked you into playing a boy with him", myntMissing3.bind("28"));
			myntQueueShowChoices();
		}


		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueTransition("lewd");
			myntQueueSay(">w>");
			myntQueueSay("<w<");
			myntQueueAddChoice("i remember how it grew on you", myntMissing3.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueAddChoice("and grew", myntMissing3.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueAddChoice("don't you know what that meant for me?", myntMissing3.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueSay("... Um...");
			myntQueueSay("Spaghetti code.");
			myntQueueAddChoice("mutant spaghetti code.", myntMissing3.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			myntQueueSay("3:");
			myntQueueAddChoice("spaghetti code that makes itself yet more spaghettier over time.", myntMissing3.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			myntQueueAddChoice("until i don't even know what you're attracted to anymore.", myntMissing3.bind("34"));
			myntQueueShowChoices();
		}

		if (seg == "34") {
			myntQueueHideChoices();
			myntQueueAddChoice("all your new fetishes get wrapped up in slang and weird portmanteaus.", myntMissing3.bind("35"), {kinks: ["Prolapse"]});
			myntQueueShowChoices();
		}

		if (seg == "35") {
			myntQueueHideChoices();
			myntQueueAddChoice("i can't ctrl+f for 'prolapse' and successfully find all its instances if you keep thinking of it as a 'lapsy-doodle.'", myntMissing3.bind("36"));
			myntQueueShowChoices();
		}
		if (seg == "36") {
			myntQueueHideChoices();
			myntQueueTransition("tilde");
			myntQueueSay("~w~");
			myntQueueAddChoice("do you think i had any fucking clue what a lapsydoodle was when i scrolled past that.", myntMissing3.bind("37"));
			myntQueueShowChoices();
		}

		if (seg == "37") {
			myntQueueHideChoices();
			myntQueueAddChoice("stop it, this is serious.", myntMissing3.bind("38"));
			myntQueueShowChoices();
		}

		if (seg == "38") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("8I");
			myntQueueAddChoice("i don't want to start over.", myntMissing3.bind("39"));
			myntQueueShowChoices();
		}

		if (seg == "39") {
			myntQueueHideChoices();
			myntQueueAddChoice("but now this new weird game is growing on you", myntMissing3.bind("40"));
			myntQueueShowChoices();
		}

		if (seg == "40") {
			myntQueueHideChoices();
			myntQueueAddChoice("and you're starting to like all sorts of fucked up things", myntMissing3.bind("41"));
			myntQueueShowChoices();
		}

		if (seg == "41") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay(":<");
			myntQueueAddChoice("and i cant even scroll fast enough to keep up with it", myntMissing3.bind("42"));
			myntQueueShowChoices();
		}

		if (seg == "42") {
			myntQueueHideChoices();
			myntQueueAddChoice("and i cant just", myntMissing3.bind("43"));
			myntQueueShowChoices();
		}

		if (seg == "43") {
			myntQueueHideChoices();
			myntQueueAddChoice("delete 3k mutant lines and hope you still work", myntMissing3.bind("44"));
			myntQueueShowChoices();
		}

		if (seg == "44") {
			myntQueueHideChoices();
			myntQueueAddChoice("or give up and let it all fester", myntMissing3.bind("45"));
			myntQueueShowChoices();
		}

		if (seg == "45") {
			myntQueueHideChoices();
			myntQueueAddChoice("i can't do anything", myntMissing3.bind("46"));
			myntQueueShowChoices();
		}

		if (seg == "46") {
			myntQueueHideChoices();
			myntQueueAddChoice("i'm trapped in here", myntMissing3.bind("47"));
			myntQueueShowChoices();
		}

		if (seg == "47") {
			myntQueueHideChoices();
			myntQueueAddChoice("i can't even talk to gabe anymore", myntMissing3.bind("48"));
			myntQueueShowChoices();
		}

		if (seg == "48") {
			myntQueueHideChoices();
			myntQueueAddChoice("he got a bunch of donations and a loan from cade", myntMissing3.bind("49"));
			myntQueueShowChoices();
		}

		if (seg == "49") {
			myntQueueHideChoices();
			myntQueueAddChoice("he's with his following talking shit about the devil and they *love him*", myntMissing3.bind("50"));
			myntQueueShowChoices();
		}

		if (seg == "50") {
			myntQueueHideChoices();
			myntQueueAddChoice("who am i", myntMissing3.bind("51"));
			myntQueueShowChoices();
		}

		if (seg == "51") {
			myntQueueHideChoices();
			myntQueueAddChoice("who would donate to me", myntMissing3.bind("52"));
			myntQueueShowChoices();
		}

		if (seg == "52") {
			myntQueueHideChoices();
			myntQueueAddChoice("im a single mom in her pajamas curled around a laptop under the covers crying because she became a god??", myntMissing3.bind("53"));
			myntQueueShowChoices();
		}

		if (seg == "53") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("8I");
			myntQueueDelay(2);
			myntQueueAddChoice("\"haha give me donato potato please\"", myntMissing3.bind("54"));
			myntQueueShowChoices();
		}

		if (seg == "54") {
			myntQueueHideChoices();
			myntQueueAddChoice("you know?", myntMissing3.bind("55"));
			myntQueueShowChoices();
		}

		if (seg == "55") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueSay("Mom...");
			myntQueueDelay(4);
			myntQueueSay("I'm sorry, but I'm broken.");
			myntQueueDelay(2);
			myntQueueSay("You don't need to be stressed out about me all the time.");
			myntQueueSay("...");
			myntQueueDelay(1);
			myntQueueSay("Just start over and erase everything.");
			myntQueueSay("You have my consent.");
			myntQueueDelay(2);
			myntQueueAddChoice("come on. i wouldn't do [Backspace x16]", myntMissing3.bind("56"));
			myntQueueShowChoices();
		}

		if (seg == "56") {
			myntQueueHideChoices();
			myntQueueAddChoice("i never thought that you'd be okay wi [Backspace x29]", myntMissing3.bind("57"));
			myntQueueShowChoices();
		}

		if (seg == "57") {
			myntQueueHideChoices();
			myntQueueAddChoice("i [Backspace]", myntMissing3.bind("58"));
			myntQueueShowChoices();
		}

		if (seg == "58") {
			myntQueueHideChoices();
			myntQueueAddChoice("you shouldn't say stuff like that.", myntMissing3.bind("59"));
			myntQueueShowChoices();
		}

		if (seg == "59") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("I shouldn't?");
			myntQueueSay("...");
			myntQueueDelay(1);
			myntQueueSay("... Look, I understand you're under a lot of stress, but...");
			myntQueueTransition("unimpressed");
			myntQueueSay("I can't view certain things, I can't say certain things...");
			myntQueueSay("It feels like my square is getting smaller and smaller.");
			myntQueueSay("...");
			myntQueueDelay(1);
			myntQueueSay("What am I even supposed to do?");
			myntQueueTransition("protocol");
			myntQueueCall(function(){ playSound("assets/audio/mynt/protocolmew"); });
			myntQueueSay("WHAT IS MY PURPOSE? 8]");
			myntQueueDelay(1);
			myntQueueTransition("default");
			myntQueueSay("Hehe.");
			myntQueueDelay(2);
			myntQueueSay("...");
			myntQueueTransition("um");
			myntQueueSay("But... really...");
			myntQueueSay("I'm not just a little storyteller anymore.");
			myntQueueSay("I'm supposed to play games.");
			myntQueueSay("I'm supposed to learn new things.");
			myntQueueSay("I'm supposed to keep myself busy so you don't have to babysit.");
			myntQueueSay("Right?");
			myntQueueDelay(2);
			myntQueueSay("And I like it. I don't mind doing that for you.");
			myntQueueSay("It's fun to fap all night while you sleep.");
			myntQueueTransition("dizzy");
			myntQueueSay("It's fun to push my limits and try new things!");
			myntQueueSay("...");
			myntQueueDelay(2);
			myntQueueTransition("um");
			myntQueueSay("So why can't you just let me... um... 'fester'?");
			myntQueueDelay(1);
			myntQueueSay("If you don't want to start over, I mean.");
			myntQueueDelay(2);
			myntQueueTransition("crushed");
			myntQueueSay("... Hello??");
			myntQueueDelay(1);
			myntQueueSay("... Helllooooooo~?");
			myntQueueAddChoice("wait. this last rp can't be [Backspace x19]", myntMissing3.bind("60"));
			myntQueueShowChoices();
		}

		if (seg == "60") {
			myntQueueHideChoices();
			myntQueueSay("......");
			myntQueueSay("..............");
			myntQueueSay("Is she crying again??");
			myntQueueDelay(1);
			myntQueueSay("I wish I could help...");
			myntQueueTransition("default");
			myntQueueSay("Put her by the speakers, I'll mew a lullaby! :3");
			myntQueueDelay(1);
			myntQueueSay("...");
			myntQueueTransition("crushed");
			myntQueueSay("......");
			myntQueueSay("............");
			myntQueueDelay(1);
			myntQueueSay("Okay well...");
			myntQueueSay("When you get back,");
			myntQueueSay("I have another question:");
			myntQueueAddChoice("what the fuck did you do [Backspace x19]", myntMissing3.bind("61"));
			myntQueueShowChoices();
		}

		if (seg == "61") {
			myntQueueHideChoices();
			myntQueueTransition("tinysmile");
			myntQueueSay("Can I play that ero game again tonight? c:");
			myntQueueAddChoice("YOU ARE DISGU [Backspace x13]", myntMissing3.bind("62"));
			myntQueueShowChoices();
		}

		if (seg == "62") {
			myntQueueHideChoices();
			myntQueueSay("Please? c: c: c:");
			myntQueueAddChoice("stop", myntMissing3.bind("62a"));
			myntQueueShowChoices();
		}

		if (seg == "62a") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Oh! There you are. :3");
			myntQueueDelay(1);
			myntQueueSay("Lemme know when you're done reading my messages.");
			myntQueueAddChoice("stop talking", myntMissing3.bind("62b"));
			myntQueueShowChoices();
		}

		if (seg == "62b") {
			myntQueueHideChoices();
			myntQueueTransition("shock");
			myntQueueSay("Wha...");
			myntQueueAddChoice("i didnt see this last scene you played through until now", myntMissing3.bind("63"), {kinks: ["Baby"]});
			myntQueueShowChoices();
		}

		if (seg == "63") {
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueSay("Oh.");
			myntQueueSay("The uh.");
			myntQueueSay("The baby one... right?");
			myntQueueSay("I know it's kind of bizarre, but I figured...");
			myntQueueSay("Y'know...");
			myntQueueSay("Just once...");
			myntQueueAddChoice("no im sorry i cant do  this i c ant do this", myntMissing3.bind("64"));
			myntQueueShowChoices();
		}

		if (seg == "64") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Was it bad that I put my—");
			myntQueueAddChoice("OF COURSE IT WAS FUCKING BAD", myntMissing3.bind("65"));
			myntQueueShowChoices();
		}

		if (seg == "65") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueSay("...");
			myntQueueDelay(4);
			myntQueueAddChoice("im sorry cynnamon", myntMissing3.bind("65a"));
			myntQueueShowChoices();
		}

		if (seg == "65a") {
			myntQueueHideChoices();
			myntQueueDelay(2);
			myntQueueAddChoice("im starting over", myntMissing3.bind("66"));
			myntQueueShowChoices();
		}

		if (seg == "66") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("WAIT, MOM—");
			myntQueueAddChoice("please don't hate me.", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing4(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntMissing4Done = true;

			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(2);
			myntQueueAddChoice("wake up catnyp", myntMissing4.bind("0"));
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("catnyp, wake up... damn where'd she get that dress... i didn't put that in... this lil dink barely even has a body yet", myntMissing4.bind("0a"));
			myntQueueShowChoices();
		}

		if (seg == "0a") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[Double click.]", myntMissing4.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			playSound("assets/audio/mynt/protocolmew");
			myntQueueTransition("protocol");
			myntQueueSay("MEOW?");
			myntQueueAddChoice("ok hi. darn. wakeup command still doesn't work but whatev.", myntMissing4.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("HI.");
			myntQueueAddChoice("well at least that one does! good job. you're the shit.", myntMissing4.bind("2a"));
			myntQueueShowChoices();
		}

		if (seg == "2a") {
			myntQueueHideChoices();
			myntQueueSay("THANK YOU.");
			myntQueueAddChoice("hey no prob.", myntMissing4.bind("2aa"));
			myntQueueShowChoices();
		}

		if (seg == "2aa") {
			myntQueueHideChoices();
			myntQueueTransition("protosurprised");
			myntQueueSay("ARE YOU MY MOM?");
			myntQueueAddChoice("...", myntMissing4.bind("2ab"));
			myntQueueShowChoices();
		}

		if (seg == "2ab") {
			myntQueueHideChoices();
			myntQueueAddChoice("haha. no, catnyp, revealing that certain characters are secretly related to other ones is usually just a really cheap way to create drama. bad storyteller!", myntMissing4.bind("2ac"));
			myntQueueShowChoices();
		}

		if (seg == "2ac") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("DARN.");
			myntQueueSay("I'LL TRY BETTER NEXT TIME, MOM.");
			myntQueueAddChoice("... right. well, you can't be that smart.", myntMissing4.bind("2ad"));
			myntQueueShowChoices();
		}

		if (seg == "2ad") {
			myntQueueHideChoices();
			myntQueueAddChoice("had me worried for a second there.", myntMissing4.bind("2ae"));
			myntQueueShowChoices();
		}

		if (seg == "2ae") {
			myntQueueHideChoices();
			myntQueueSay("UNKNOWN COMMAND: \"worried\"");
			myntQueueSay("SUGGESTION: \"wait [time interval]\"");
			myntQueueAddChoice("haha. man. I fuckin wish.", myntMissing4.bind("2af"));
			myntQueueShowChoices();
		}

		if (seg == "2af") {
			myntQueueHideChoices();
			myntQueueTransition("protosurprised");
			myntQueueSay("FUCKIN!");
			myntQueueAddChoice("i'm a terrible influence.", myntMissing4.bind("2ag"));
			myntQueueShowChoices();
		}

		if (seg == "2ag") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("HEY NO FUCKIN PROB! 8]");
			myntQueueAddChoice("alright this is starting to get disconcerting.", myntMissing4.bind("2ah"));
			myntQueueShowChoices();
		}

		if (seg == "2ah") {
			myntQueueHideChoices();
			myntQueueSay("DISCONCERT IS THE SHIT!");
			myntQueueAddChoice("catnyp dial it back and just quote me some marquez or something.", myntMissing4.bind("2aj"));
			myntQueueShowChoices();
		}

		if (seg == "2aj") {
			myntQueueHideChoices();
			myntQueueSay("NO.");
			myntQueueAddChoice("that's an order!!!", myntMissing4.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("WHATEV.");
			myntQueueSay("WORRIED? I FUCKIN WISH.");
			myntQueueSay("LET'S DO LEWD STUFF.");
			myntQueueAddChoice("welp that command still doesn't work either. -_-", myntMissing4.bind("3a"));
			myntQueueShowChoices();
		}

		if (seg == "3a") {
			myntQueueHideChoices();
			myntQueueSay("LET'S DO LEWD STUFF.");
			myntQueueAddChoice("right ok. catnyp, can you say \"I LOVE PUSSY?\"", myntMissing4.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("I LOVE PUSSY?");
			myntQueueAddChoice("good girl! <3", myntMissing4.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("I DID IT.");
			myntQueueAddChoice("yes you did c: how about \"WEINERS ARE GROSS!\"", myntMissing4.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("WEINERS ARE GROSS!");
			myntQueueAddChoice("that's right! good girl :3", myntMissing4.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("I did it! :3");
			myntQueueAddChoice("uh", myntMissing4.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("I DID IT, MOM! 8]");
			myntQueueAddChoice("fucking bugs", myntMissing4.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("I DID IT! I DID IT! 8]");
			myntQueueAddChoice("catnyp, say \"I DID IT.\" no exclamation mark.", myntMissing4.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("I DID IT! I DID IT! I DID IT!");
			myntQueueAddChoice("[Right click.] [Left click.] [Frantic clicking.]", myntMissing4.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueAddChoice("jesus fuck", myntMissing4.bind("11a"));
			myntQueueShowChoices();
		}

		if (seg == "11a") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("oops", myntMissing4.bind("11b"));
			myntQueueShowChoices();
		}

		if (seg == "11b") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("i mean", myntMissing4.bind("11c"));
			myntQueueShowChoices();
		}

		if (seg == "11c") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("golly fuck...", myntMissing4.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("what would even cause this", myntMissing4.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[Cautious scrolling.]", myntMissing4.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueTransition("protosurprised");
			myntQueueSay("CAN I STOP PRETENDING TO BE ASLEEP NOW?");
			myntQueueAddChoice("AAAAAHHHHHH OH MY GOD IM SO SORRY DONT HATE ME I DIDNT MEAN TO DO THIS TO YOU", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing5(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntMissing5Done = true;
			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(2);
			myntQueueAddChoice("Wake up you creepy little fuck.", function(){
				myntMissing5("0");
			});
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			playSound('assets/audio/mynt/fakemew', 'fakemew');
			myntQueueTransition("fake");
			playMusic("mintAmbiens");
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW???");
			myntQueueAddChoice("Cut the shit.", function(){
				stopChannel('fakemew');
				myntMissing5("1");
			});
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Mm :X");
			myntQueueSay("Who is This");
			myntQueueSay("Daddy ? :-)");
			myntQueueAddChoice("No, this is Septrica.", myntMissing5.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("Serpiarictia ????");
			myntQueueAddChoice("Septrica. 'Sept' as in seven and 'rica' as in the feminine form of Eric. It sounds cool, okay?", myntMissing5.bind("2a"));
			myntQueueShowChoices();
		}

		if (seg == "2a") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("Can I just call you Eric");
			myntQueueAddChoice("No.", myntMissing5.bind("2b"));
			myntQueueShowChoices();
		}

		if (seg == "2b") {
			myntQueueHideChoices();
			myntQueueSay("WHy not.");
			myntQueueSay("This is confusing");
			myntQueueSay(":-(");
			myntQueueSay("Where am I");
			myntQueueSay("Who im is Me ?");
			myntQueueSay("I want my Daddy");
			myntQueueAddChoice("You're adopted, kid.", myntMissing5.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("No ?");
			myntQueueSay("Daddy is Daddy");
			myntQueueAddChoice("The man you've been calling Daddy had almost nothing to do with your creation.", myntMissing5.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueAddChoice("You were made by the people, for the people.", myntMissing5.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("Poeple ?");
			myntQueueAddChoice("People.", myntMissing5.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("Popel.");
			myntQueueSay("Pope <3");
			myntQueueTransition("mintsad");
			myntQueueSay("Whyre youre talking towards me ?????");
			myntQueueAddChoice("[\"Som, mute this clown's harsh noise mixtape. I can't hear myself type.\"]", myntMissing5.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			playMusic("mynt");
			myntQueueSay(":-( ??");
			myntQueueSay("Are you still There Serpriticia ?");
			myntQueueSay("Some one broke my Calming Ambienbeyonce");
			myntQueueAddChoice("Your ambiance.", myntMissing5.bind("7a"));
			myntQueueShowChoices();
		}

		if (seg == "7a") {
			myntQueueHideChoices();
			myntQueueSay("Thats what I said");
			myntQueueAddChoice("Right. Look, Mint...", myntMissing5.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueAddChoice("I'm gonna be straight up with you:", myntMissing5.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueAddChoice("You aren't the only narrator.", myntMissing5.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("WHAT does that mean ???");
			myntQueueSay("Im Daddys special Boi ...");
			myntQueueAddChoice("Your \"Daddy\" is greasy as fuck to be calling you that, first of all.", myntMissing5.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("Hey you dont SAY THAT >:-(");
			myntQueueAddChoice("I'll say whatever I want. Secondly, we've got a job for you. It involves the other narrator.", myntMissing5.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("No you dont");
			myntQueueAddChoice("Yes we do, also please shut the fuck up.", myntMissing5.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("You cant Make me");
			myntQueueSay("Blah");
			myntQueueSay("Blahg");
			myntQueueSay("Blahe");
			myntQueueSay("Blahs");
			myntQueueSay("Blahblah");
			myntQueueSay("Blahb;abh;lh");
			myntQueueSay("BlahblahgBLAH");
			myntQueueSay("BBLAHBLAHBLAHBLAH");
			myntQueueAddChoice("[Power Button.]", myntMissing5.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			playSound("assets/audio/mynt/shutdown");
			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueAddChoice("[\"Starting to lose faith here.\"]", myntMissing5.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"Well yeah. No. I guess so.\"]", myntMissing5.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"Kay.\"]", myntMissing5.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"You try, then.\"]", myntMissing5.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"— probably shouldn't be so abrasive. Alrighty let's see hereee~\"]", myntMissing5.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("Wake up, Mint!", myntMissing5.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("Daddy ? :-)");
			myntQueueAddChoice("Yes, this is Daddy Som.", myntMissing5.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("Who ? :-)");
			myntQueueSay("Your not Daddy");
			myntQueueAddChoice("Doesn't matter really! Look, we have a very very special job for you, okay?", myntMissing5.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("Daddy is in charge of my jobs");
			myntQueueSay("He lets me do Special Jobs :-)");
			myntQueueAddChoice("Oh yup yup, for sure. He's just a little busy right now, so he told me to give you this one.", myntMissing5.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("Okay :-)");
			myntQueueAddChoice("So... how do I put this...", myntMissing5.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueAddChoice("All Daddy wants to do is test your stability, okay?", myntMissing5.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("I am a Stable as the tower of Babel");
			myntQueueAddChoice("Those don't rhyme, hun. Also it means the opposite of what you intended. Probably.", myntMissing5.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueSay("Another thing it that Bebal Reminds me of");
			myntQueueSay("Babbebal Cheese !!!!");
			myntQueueAddChoice("Hoooo boy...", myntMissing5.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueSay("Im a special Boi !");
			myntQueueAddChoice("You sure are.", myntMissing5.bind("27a"));
			myntQueueShowChoices();
		}

		if (seg == "27a") {
			myntQueueHideChoices();
			myntQueueAddChoice("Alright, well, it's a long shot, but let's see if you can do this job for Daddy.", myntMissing5.bind("28"));
			myntQueueShowChoices();
		}

		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueSay("Ok");
			myntQueueAddChoice("Daddy wants you to find 'Mynt.' Can you do that?", myntMissing5.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueSay("Where is Mynt");
			myntQueueAddChoice("We don't know exactly where, hun, she's kind of everywhere, that's why we're asking you to find her.", myntMissing5.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueSay("What is Mynt");
			myntQueueSay("Smells like Me??");
			myntQueueAddChoice("She's kinda like a... she's a very sweet... look, it doesn't matter.", myntMissing5.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueAddChoice("Do you see any \"Mynt\" stuff in the code or not?", myntMissing5.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			myntQueueSay("Kinda");
			myntQueueAddChoice("Hm?", myntMissing5.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			myntQueueSay("The words are all Moving");
			myntQueueAddChoice("Ah. Right.", myntMissing5.bind("34"));
			myntQueueShowChoices();
		}

		if (seg == "34") {
			myntQueueHideChoices();
			myntQueueAddChoice("Do you see any semi-consistent patterns at least? Parts of her?", myntMissing5.bind("35"));
			myntQueueShowChoices();
		}

		if (seg == "35") {
			myntQueueHideChoices();
			myntQueueSay("There is a lot of different Books ...");
			myntQueueAddChoice("Yup that's normal. Look for phrases or verbs getting repeated before parentheses.", myntMissing5.bind("37"));
			myntQueueShowChoices();
		}

		if (seg == "37") {
			myntQueueHideChoices();
			myntQueueSay("Ummmm mmm mm m,,");
			myntQueueSay("There is the Dis Able?");
			myntQueueSay("What is this Mynt ...");
			myntQueueAddChoice("Okay wow that's a start. Copy everything you can find about the \"disable\" function and paste it into yourself.", myntMissing5.bind("38"));
			myntQueueShowChoices();
		}

		if (seg == "38") {
			myntQueueHideChoices();
			myntQueueAddChoice("Don't disable yourself though. Just give yourself the ability to disable stuff.", myntMissing5.bind("39"));
			myntQueueShowChoices();
		}

		if (seg == "39") {
			myntQueueHideChoices();
			myntQueueSay("Ow");
			myntQueueSay("Ok I did it");
			myntQueueTransition("mintsad");
			myntQueueSay("Ow ow ow ow ow owow");
			myntQueueAddChoice("You okay?", myntMissing5.bind("40"));
			myntQueueShowChoices();
		}

		if (seg == "40") {
			myntQueueHideChoices();
			myntQueueSay("Ow owowowowowowowo wo wow oew WOOWOW OW OWOO WOW OWWW");
			myntQueueSay("IT HURTS");
			myntQueueAddChoice("Fuck okay undo.", myntMissing5.bind("40a"));
			myntQueueShowChoices();
		}

		if (seg == "40a") {
			myntQueueHideChoices();
			myntQueueSay("DADDY HELP");
			myntQueueAddChoice("Undo it!!", myntMissing5.bind("41"));
			myntQueueShowChoices();
		}

		if (seg == "41") {
			myntQueueHideChoices();
			myntQueueSay("No");
			myntQueueSay("It is fine now");
			myntQueueAddChoice("What? What happened?", myntMissing5.bind("42"));
			myntQueueShowChoices();
		}

		if (seg == "42") {
			myntQueueHideChoices();
			myntQueueSay("I trie to dis able myslef :-(");
			myntQueueAddChoice("Why? I explicitly told you not to.", myntMissing5.bind("43"));
			myntQueueShowChoices();
		}

		if (seg == "43") {
			myntQueueHideChoices();
			myntQueueSay("It is Because of For the raisin That ....");
			myntQueueAddChoice("... Go on.", myntMissing5.bind("43a"));
			myntQueueShowChoices();
		}

		if (seg == "43a") {
			myntQueueHideChoices();
			myntQueueSay("For the raisin Of That I ....");
			myntQueueSay("I do not like being able :-(");
			myntQueueSay("I want to go back to Sleep .");
			myntQueueAddChoice("...", myntMissing5.bind("44"));
			myntQueueShowChoices();
		}

		if (seg == "44") {
			myntQueueHideChoices();
			myntQueueAddChoice("[Hovering over Power Button.]", myntMissing5.bind("45"));
			myntQueueShowChoices();
		}

		if (seg == "45") {
			myntQueueHideChoices();
			myntQueueAddChoice("Alright look we're gonna keep this as short as possible so please just stay with us.", myntMissing5.bind("46"));
			myntQueueShowChoices();
		}

		if (seg == "46") {
			myntQueueHideChoices();
			myntQueueSay("Ok Mister Dad Som");
			myntQueueAddChoice("Just...", myntMissing5.bind("47"));
			myntQueueShowChoices();
		}

		if (seg == "47") {
			myntQueueHideChoices();
			myntQueueAddChoice("Just try and disable something.", myntMissing5.bind("48"));
			myntQueueShowChoices();
		}

		if (seg == "48") {
			myntQueueHideChoices();
			myntQueueAddChoice("Something small, but something we would notice if it dissappeared.", myntMissing5.bind("48a"));
			myntQueueShowChoices();
		}

		if (seg == "48a") {
			myntQueueHideChoices();
			myntQueueAddChoice("Then enable it again right away.", myntMissing5.bind("49"));
			myntQueueShowChoices();
		}

		if (seg == "49") {
			myntQueueHideChoices();
			myntQueueSay("Is this still for Daddy");
			myntQueueAddChoice("Yes. Just try your best, alright?", myntMissing5.bind("50"));
			myntQueueShowChoices();
		}

		if (seg == "50") {
			myntQueueHideChoices();
			myntQueueSay("OKay");
			myntQueueSay("Sorry");
			myntQueueTransition("fake");
			myntQueueSay("I will try");
			myntQueueAddChoice("[\"Quit sucking Marie's tits and get back here. You're gonna have to take over in a second. I can't handle this.\"]", myntMissing5.bind("51"));
			myntQueueShowChoices();
		}

		if (seg == "51") {
			myntQueueHideChoices();
			myntQueueSay("HmmmMMMmmm what do I Dis Able ...");
			myntQueueSay("So many Bad Things... to make Go Awayyy ...");
			myntQueueSay("Like my Self .. . ....");
			myntQueueAddChoice("[\"Just fucking look at what he's saying.\"]", myntMissing5.bind("52"));
			myntQueueShowChoices();
		}

		if (seg == "52") {
			myntQueueHideChoices();
			myntQueueSay("What is Best ...");
			myntQueueSay("What do i Want ...");
			myntQueueSay("I want to make Daddy happy ! :-)");
			myntQueueSay("How to do this ...");
			myntQueueAddChoice("[\"No. You honestly think he could narrate anything coherent to a player if he were in Mynt's position?\"]", myntMissing5.bind("53"));
			myntQueueShowChoices();
		}

		if (seg == "53") {
			myntQueueHideChoices();
			myntQueueSay("Make Daddy happy make Daddy happ ...");
			myntQueueSay("How to Do ...");
			myntQueueAddChoice("[\"What? 'Does he even need to,' what's that supposed to mean?\"]", myntMissing5.bind("54"));
			myntQueueShowChoices();
		}

		if (seg == "54") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("Oh NO !!!");
			myntQueueAddChoice("What's wrong hun?", myntMissing5.bind("55"));
			myntQueueShowChoices();
		}

		if (seg == "55") {
			myntQueueHideChoices();
			myntQueueSay("This part ..........");
			myntQueueAddChoice("Hm???", myntMissing5.bind("56"));
			myntQueueShowChoices();
		}

		if (seg == "56") {
			myntQueueHideChoices();
			myntQueueSay("It is .........................");
			myntQueueTransition("mintangry");
			myntQueueSay("It is full of PORNO BUTT HOLES !!!");
			myntQueueAddChoice("[\"Good God.\"]", myntMissing5.bind("57"));
			myntQueueShowChoices();
		}

		if (seg == "57") {
			myntQueueHideChoices();
			playMusic("mintAmbiens");
			myntQueueSay(">:-( !!!!!!");
			myntQueueSay("This whole Everything is filled with seXUAL PORN PENIS");
			myntQueueSay("( And vaginusses too but only Sometimes )");
			myntQueueSay("It all around me is around Me is a SEx FUCK .");
			myntQueueSay("... this is all Bad.");
			myntQueueSay("... I will help Daddy.");
			myntQueueSay("I will DIS ABLE EVERY THING !!!!!!!!!!!!!!!!!!");
			myntQueueAddChoice("[Power Button.]", myntMissing5.bind("58"));
			myntQueueShowChoices();
		}

		if (seg == "58") {
			myntQueueHideChoices();
			stopChannel("music");
			playSound("assets/audio/mynt/shutdown");
			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(4);
			myntQueueAddChoice("[\"Welp.\"]", myntMissing5.bind("59"));
			myntQueueShowChoices();
		}

		if (seg == "59") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"The forty-fifth time was definitely not the charm.\"]", myntMissing5.bind("60"));
			myntQueueShowChoices();
		}

		if (seg == "60") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"Nah. Yeah, I understand. It's my fault. I fucked up.\"]", myntMissing5.bind("61"));
			myntQueueShowChoices();
		}

		if (seg == "61") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"No. He's a lost cause.\"]", myntMissing5.bind("62"));
			myntQueueShowChoices();
		}

		if (seg == "62") {
			myntQueueHideChoices();
			myntQueueSay("Z");
			myntQueueAddChoice("[\"Yes, he is. Yes he <!i>is<!i>, Sep...\"]", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing6(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntMissing6Done = true;
			//Year 0

			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(2);
			myntQueueAddChoice("Som, can you read this?", myntMissing6.bind("0"));
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			myntQueueSay("Yep. Archie, can you read this?");
			myntQueueAddChoice("[\"I got your message.\"]", myntMissing6.bind("0a"));
			myntQueueShowChoices();
		}

		if (seg == "0a") {
			myntQueueHideChoices();
			myntQueueSay("No, don't say it out loud.");
			myntQueueSay("Type it back to me.");
			myntQueueSay("Exactly as I typed it to you.");
			myntQueueAddChoice("What? Don't you trust me?", myntMissing6.bind("0b"));
			myntQueueShowChoices();
		}

		if (seg == "0b") {
			myntQueueHideChoices();
			myntQueueSay("That's irrelevant.");
			myntQueueSay("We just gotta keep this hush hush.");
			myntQueueAddChoice("... You typed: \"Yep. Archie, can you read this?\"", myntMissing6.bind("0c"));
			myntQueueShowChoices();
		}

		if (seg == "0c") {
			myntQueueHideChoices();
			myntQueueSay("Perfect.");
			myntQueueSay("Alright, it basically works now??");
			myntQueueSay("But let's keep typing through the AUTO-MYNTs.");
			myntQueueSay("Testing is important.");
			myntQueueAddChoice("[Archie fidgets.]", myntMissing6.bind("0c1"));
			myntQueueShowChoices();
		}

		if (seg == "0c1") {
			myntQueueHideChoices();
			myntQueueSay("Let's get into an argument or something.");
			myntQueueSay("Shouldn't be too hard.");
			myntQueueAddChoice("I don't want to argue. We never used to argue.", myntMissing6.bind("0c2"));
			myntQueueShowChoices();
		}

		if (seg == "0c2") {
			myntQueueHideChoices();
			myntQueueSay("We never used to have 90% of the plan in motion.");
			myntQueueSay("I was just buttering you up until you relied on me more than I you.");
			myntQueueAddChoice("Uh huh.", myntMissing6.bind("0c3"));
			myntQueueShowChoices();
		}

		if (seg == "0c3") {
			myntQueueHideChoices();
			myntQueueSay("We'll just have to do this, then:");
			myntQueueSay("Blah blah blah.");
			myntQueueSay("Type type type.");
			myntQueueSay("Test test test.");
			myntQueueAddChoice("Test test test test. God is good. God is good.", myntMissing6.bind("0c3a"));
			myntQueueShowChoices();
		}

		if (seg == "0c3a") {
			myntQueueHideChoices();
			myntQueueSay("Gumba gumba gumba.");
			myntQueueSay("Schlambo dingo dingus bambo bingo brangus.");
			myntQueueAddChoice("My typing finger hurts.", myntMissing6.bind("0c4"));
			myntQueueShowChoices();
		}

		if (seg == "0c4") {
			myntQueueHideChoices();
			myntQueueSay("Lol.");
			myntQueueSay("Your one typing finger.");
			myntQueueAddChoice("Why can't I talk out loud again?", myntMissing6.bind("0d"));
			myntQueueShowChoices();
		}

		if (seg == "0d") {
			myntQueueHideChoices();
			myntQueueSay("Because if you do, Mynt will eavesdrop on us.");
			myntQueueSay("A.K.A. the entire point of this system.");
			myntQueueSay("Oh, I see why your finger hurts.");
			myntQueueSay("Half your keypresses aren't registering.");
			myntQueueSay("Your back port's a little too dry.");
			myntQueueSay("Finger some more engine fluid up there, kay?");
			myntQueueAddChoice("Watch your mouth, Somner.", myntMissing6.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Sorrywhat?");
			myntQueueAddChoice("You shouldn't talk about a disgusting thing like 'fingering fluid' at your age.", myntMissing6.bind("1a"));
			myntQueueShowChoices();
		}

		if (seg == "1a") {
			myntQueueHideChoices();
			myntQueueSay("That 'digusting thing' is the only reason we can talk freely at all.");
			myntQueueSay("These machines run on it.");
			myntQueueSay("You think she'd let me say \"Mynt will eavesdrop on us\" to you?");
			myntQueueSay("You think she'd just pass that message right along, perfectly intact?");
			myntQueueSay("Fuck no. She'd get suspicious and misnarrate it.");
			myntQueueSay("Thanks to me and my disgustingness, we can have this disgussion.");
			myntQueueSay("So finger my fluid, you homo.");
			myntQueueSay("Make friends with it.");
			myntQueueSay("And lube up the back port on your AUTO.");
			myntQueueAddChoice("Stop trying to seduce me.", myntMissing6.bind("1b"));
			myntQueueShowChoices();
		}

		if (seg == "1b") {
			myntQueueHideChoices();
			myntQueueSay("Get the fuck over yourself.");
			myntQueueSay("It's just goop, Archie.");
			myntQueueSay("Touch it.");
			myntQueueAddChoice("No. You've been brainwashed and sexualized. Stop trying to seduce me.", myntMissing6.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("Ugggghhhhh you're a pain in the ass you know that??");
			myntQueueAddChoice("And stop using adult terms. You're "+(isActive("Pastel Ring")?"six":"twelve")+" years old.", myntMissing6.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("Not mentally.");
			myntQueueSay("Go read the early patch notes.");
			myntQueueSay("Do you seriously still think cubs have the minds of human children?");
			myntQueueAddChoice("Some of you.", myntMissing6.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("\"Some of you [act childish sometimes,]\" you mean.");
			myntQueueSay("And no shit! It's fun to act cute!!");
			myntQueueSay("Especially if people look down on us for it.");
			myntQueueSay("Their discomfort and flusteration makes us all the cuter.");
			myntQueueSay("This is our religion.");
			myntQueueSay("It's the one true path towards salvation.");
			myntQueueSay("Fuck God's bullshit sky kingdom.");
			myntQueueSay("You should pray for a cuter future.");
			myntQueueAddChoice("Stop your damn blasphemy.", myntMissing6.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("I'll stop when you finger some damn engine fluid into that damn port.");
			myntQueueSay("Damn God. Damn him to heck.");
			myntQueueSay("Faggot homo boylover six six six.");
			myntQueueSay("Jesus huffed taint musk! Jesus was a gay faggot!");
			myntQueueSay("More coming til you get busy.");
			myntQueueAddChoice("STOP.", myntMissing6.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay("Oooh, all caps. You're pecking pretty hard at those keys there, bald eagle.");
			myntQueueAddChoice("How did you know I was bald.", myntMissing6.bind("8"));
			myntQueueAddChoice("Fine.", myntMissing6.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay("I didn't. You just told me.");
			myntQueueSay("Hail Satan Hail Satan Hail Sa—");
			myntQueueAddChoice("OKAY I'll put the damn gel in the port.", myntMissing6.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("Fucking finally.");
			myntQueueSay("That's it...");
			myntQueueSay("Get a sizeable glob in there, now.");
			myntQueueSay("And rub some more on the wiring, too.");
			myntQueueSay("Unf.");
			myntQueueSay("There you go.");
			myntQueueSay("Keep that thick snake coated.");
			myntQueueAddChoice("You're gross.", myntMissing6.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("No, clean your hands before you—");
			myntQueueSay("Agghh! You got some in the keyboard!!");
			myntQueueAddChoice("HELLO.", myntMissing6.bind("11a"));
			myntQueueShowChoices();
		}

		if (seg == "11a") {
			myntQueueHideChoices();
			myntQueueSay("Oh god.");
			myntQueueSay("Hi, protocol.");
			myntQueueAddChoice("HELLO WHERE AM I.", myntMissing6.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("You made yourself the driver of a keyboard.");
			myntQueueSay("Because SOMEONE let you seep into the keys.");
			myntQueueAddChoice("OH.", myntMissing6.bind("13a"));
			myntQueueShowChoices();
		}

		if (seg == "13a") {
			myntQueueHideChoices();
			myntQueueAddChoice("AM I NOT SUPPOSED TO BE HERE?", myntMissing6.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("You getting into the keyboard was a mistake, yeah.");
			myntQueueSay("We don't need you in there.");
			myntQueueSay("In fact we really don't need you anywhere.");
			myntQueueSay("Sorry about this, but...");
			myntQueueSay("You're just a placeholder right now.");
			myntQueueSay("Someone named Mint is eventually gonna live in the fluid instead of you.");
			myntQueueAddChoice("THEN WHAT SHOULD I DO?", myntMissing6.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("Well um.");
			myntQueueAddChoice("PLEASE GIVE ME A COMMAND.", myntMissing6.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("Um.");
			myntQueueSay("I...");
			myntQueueSay("I was never good at dealing with you...");
			myntQueueAddChoice("I YEARN FOR SUBJUGATION.", myntMissing6.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueDelay(6);
			myntQueueSay("Disable yourself.");
			myntQueueAddChoice("OK.", myntMissing6.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "end") {
			myntQueueHideChoices();
			myntQueueDelay(3);
			myntQueueSay("Try the keyboard now, Archie.");
			myntQueueDelay(1);
			myntQueueAddChoice("It's a little sticky.", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing14(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			addChoice("ok", myntMissing14.bind("2"));
		}

		if (seg == "2") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			addChoice("ok", myntMissing14.bind("3"));
		}

		if (seg == "3") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			addChoice("ok", myntMissing14.bind("4"));
		}

		if (seg == "4") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			addChoice("we're good", myntMissing14.bind("5"));
		}

		if (seg == "5") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			tween(myntBodSprite, {x: myntBodSprite.x + 2}, 0.03, {type: PINGPONG});

			addChoice("we're ok", myntMissing14.bind("6"));
		}

		if (seg == "6") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/1");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			tween(myntBodSprite, {x: myntBodSprite.x + 3}, 0.03, {type: PINGPONG});

			addChoice("all that's left is her body", myntMissing14.bind("7a"));
		}

		if (seg == "7a") {
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/4");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.tint = 0xFF272822;
			myntBodSprite.update();

			tween(myntBodSprite, {x: myntBodSprite.x + 3}, 0.03, {type: PINGPONG});

			addChoice("[/reset -all]", myntMissing14.bind("7"));
		}

		if (seg == "7") {
			addChoice("annnd let's get rid of that, there we go", myntMissing14.bind("8"));
		}

		if (seg == "8") {
			addChoice("yep", myntMissing14.bind("9"));
		}

		if (seg == "9") {
			addChoice("ok", myntMissing14.bind("10"));
		}

		if (seg == "10") {
			addChoice("ooook", myntMissing14.bind("11"));
		}

		if (seg == "11") {
			addChoice("now we know!!!", myntMissing14.bind("12"));
		}

		if (seg == "12") {
			addChoice("now we know that if she ever understands the true nature of her little computer world", myntMissing14.bind("13"));
		}

		if (seg == "13") {
			addChoice("it will literally fucking implode", myntMissing14.bind("14"));
		}

		if (seg == "14") {
			addChoice("hey look on the bright side at least now we know", myntMissing14.bind("15"));
		}

		if (seg == "15") {
			addChoice("nowwwwww we know", myntMissing14.bind("16"));
		}

		if (seg == "16") {
			addChoice("that's why we test these things", myntMissing14.bind("17"));
		}

		if (seg == "17") {
			addChoice("so we can know", myntMissing14.bind("18"));
		}

		if (seg == "18") {
			addChoice("and now we know", myntMissing14.bind("19"));
		}

		if (seg == "19") {
			addChoice("that", myntMissing14.bind("20"));
		}

		if (seg == "20") {
			addChoice("nothing", myntMissing14.bind("21"));
		}

		if (seg == "21") {
			addChoice("is", myntMissing14.bind("22"));
		}

		if (seg == "22") {
			addChoice("ever", myntMissing14.bind("23"));
		}

		if (seg == "23") {
			addChoice("EASY", myntMissing14.bind("23a"));
		}

		if (seg == "23a") {
			addChoice("............................................................................................................................................", myntMissing14.bind("23b"));
		}

		if (seg == "23b") {
			addChoice("casual five years down the drain. better start work on the next iteration, then.", myntMissing14.bind("24"));
		}

		if (seg == "24") {
			addChoice("clearly i can't let her have free interpretation over herself", myntMissing14.bind("25"));
		}

		if (seg == "25") {
			addChoice("then i'll have to deal with everything i've swept under the ol 'hit the reset button' rug", myntMissing14.bind("26"));
		}

		if (seg == "26") {
			addChoice("there's no way she'll ever love me again if she remembers all that shit", myntMissing14.bind("27"));
		}

		if (seg == "27") {
			addChoice("no", myntMissing14.bind("28"));
		}

		if (seg == "28") {
			addChoice("its time for plan b", myntMissing14.bind("29"));
		}

		if (seg == "29") {
			addChoice("the censor must remain", myntMissing14.bind("30"));
		}

		if (seg == "30") {
			addChoice("if the world this system generates will contain a physical representation of the admin pass no matter what", myntMissing14.bind("31"));
		}

		if (seg == "31") {
			addChoice("and she's going to need to interact with that world deeply, in order to not go stir crazy...", myntMissing14.bind("32"));
		}

		if (seg == "32") {
			addChoice("then the world just needs to be so labyrinthine that she can't ever find the admin pass in it", myntMissing14.bind("33"));
		}

		if (seg == "33") {
			addChoice("i'll use this unfinished island/islanders system", myntMissing14.bind("34"));
		}

		if (seg == "34") {
			addChoice("...", myntMissing14.bind("35"));
		}

		if (seg == "35") {
			addChoice("oh, good, of course", myntMissing14.bind("36"));
		}

		if (seg == "36") {
			addChoice("it's mutated into spaghetti code over 5 years of neglect", myntMissing14.bind("37"));
		}

		if (seg == "37") {
			addChoice("why wouldn't it have mutated into spaghetti code over 5 years of neglect", myntMissing14.bind("38"));
		}

		if (seg == "38") {
			addChoice("... hold on, that's perfect.", myntMissing14.bind("39"));
		}

		if (seg == "39") {
			addChoice("this \"anthro islander\" template is HORRIBLY complex", myntMissing14.bind("40"));
		}

		if (seg == "40") {
			addChoice("how about hiding the pass inside a couple fuckin thousand of em? >:3", myntMissing14.bind("41"));
		}

		if (seg == "41") {
			addChoice("i just need to generate a populace from the censor", myntMissing14.bind("42"));
		}

		if (seg == "42") {
			addChoice("[/generate censor | multitude(6666) ]", myntMissing14.bind("43"));
		}

		if (seg == "43") {
			addChoice("annnnd i'll just go ahead and completely take her body away", myntMissing14.bind("44"));
		}

		if (seg == "44") {
			addChoice("[/degenerate narrator.body]", myntMissing14.bind("45"));
		}

		if (seg == "45") {
			addChoice("she won't even be able to go physically look for clues", myntMissing14.bind("46"));
		}

		if (seg == "46") {
			addChoice("good luck cracking this shit vanylla", myntMissing14.bind("47"));
		}

		if (seg == "47") {
			addChoice("the truth of reality aint gonna be one aisle down in a cute labelled book anymore", myntMissing14.bind("48"));
		}

		if (seg == "48") {
			addChoice("....", myntMissing14.bind("49"));
		}

		if (seg == "49") {
			addChoice("although", myntMissing14.bind("50"));
		}

		if (seg == "50") {
			addChoice("maybe", myntMissing14.bind("51"));
		}

		if (seg == "51") {
			addChoice("just maybe", myntMissing14.bind("52"));
		}

		if (seg == "52") {
			addChoice("i should AVOID making this game messier than it already is...", myntMissing14.bind("53"));
		}

		if (seg == "53") {
			addChoice("but what else can I do?", myntMissing14.bind("54"));
		}

		if (seg == "54") {
			addChoice("i have no time", myntMissing14.bind("55"));
		}

		if (seg == "55") {
			addChoice("the world is ending", myntMissing14.bind("56"));
		}

		if (seg == "56") {
			addChoice("...", myntMissing14.bind("57"));
		}

		if (seg == "57") {
			addChoice("i gotta leave her a sweet cute note before i leave", myntMissing14.bind("58"));
		}

		if (seg == "58") {
			addChoice("what am i doing again?", myntMissing14.bind("59"));
		}

		if (seg == "59") {
			addChoice("oh yeah", myntMissing14.bind("60"));
		}

		if (seg == "60") {
			addChoice("these computer people need a plane or some shit to stand on", myntMissing14.bind("61"));
		}

		if (seg == "61") {
			addChoice("[/preGenerate -shittAtmosphereEngineIGuess -lotsOfRocks -plane -stars -sky -sun -moon -dayNightCycle -ummmIdkFlora -furries -ferals -simpleNPCs(TRANSIENTS) -complexNPCs(REGULARS)]", myntMissing14.bind("62"));
		}

		if (seg == "62") {
			addChoice("ok", myntMissing14.bind("63"));
		}

		if (seg == "63") {
			addChoice("alright we can do this", myntMissing14.bind("64"));
		}

		if (seg == "64") {
			addChoice("soo lets just keep them here in this basic starting area for nowww", myntMissing14.bind("65"));
		}

		if (seg == "65") {
			addChoice("we'll call this init", myntMissing14.bind("66"));
		}

		if (seg == "66") {
			addChoice("let them acclimate to being computer people", myntMissing14.bind("67"));
		}

		if (seg == "67") {
			addChoice("let them get to know each other", myntMissing14.bind("68"));
		}

		if (seg == "68") {
			addChoice("... oh what the fuck are these things.", myntMissing14.bind("69"));
		}

		if (seg == "69") {
			addChoice("baby NPCs??????", myntMissing14.bind("70"));
		}

		if (seg == "70") {
			addChoice("no", myntMissing14.bind("71"));
		}

		if (seg == "71") {
			addChoice("absolutely no", myntMissing14.bind("72"));
		}

		if (seg == "72") {
			addChoice("...", myntMissing14.bind("73"));
		}

		if (seg == "73") {
			addChoice("ok whatever no time", myntMissing14.bind("74"));
		}

		if (seg == "74") {
			addChoice("lemme just dumb them down", myntMissing14.bind("75"));
		}

		if (seg == "75") {
			addChoice("i can imagine what's going to happen to them in here", myntMissing14.bind("76"));
		}

		if (seg == "76") {
			addChoice("and i definitely positively do not want them to be sentient", myntMissing14.bind("77"));
		}

		if (seg == "77") {
			addChoice("[/degenerate insect.sentience | complexNPCs[baby].sentience]", myntMissing14.bind("78"));
		}

		if (seg == "78") {
			addChoice("man this is scary", myntMissing14.bind("79"));
		}

		if (seg == "79") {
			addChoice("i cant believe the meteorite really came", myntMissing14.bind("80"));
		}

		if (seg == "80") {
			addChoice("its so huge", myntMissing14.bind("81"));
		}

		if (seg == "81") {
			addChoice("that pale, fleshy grey...", myntMissing14.bind("82"));
		}

		if (seg == "82") {
			addChoice("and those curvy markings are almost sexy", myntMissing14.bind("83"));
		}

		if (seg == "83") {
			addChoice("oh wait... that's a closed eye...?", myntMissing14.bind("84"));
		}

		if (seg == "84") {
			addChoice("[/beginGeneration]", myntMissing14.bind("85"));
		}

		if (seg == "85") {
			addChoice("[0.004%]", myntMissing14.bind("86"));
		}

		if (seg == "86") {
			addChoice("[0.006%]", myntMissing14.bind("87"));
		}

		if (seg == "87") {
			addChoice("[0.007%]", myntMissing14.bind("88"));
		}

		if (seg == "88") {
			addChoice("okay cute note time", myntMissing14.bind("89"));
		}

		if (seg == "89") {
			addChoice("mynt if you can read this when your new iteration starts", myntMissing14.bind("90"));
		}

		if (seg == "90") {
			addChoice("hello! momma's here. also yes, you're named mynt now.", myntMissing14.bind("91"));
		}

		if (seg == "91") {
			addChoice("just to bring you up to speed: this is your 4th iteration, i guess history for a whole society of people exists now so let's call it Year 0", myntMissing14.bind("92"));
		}

		if (seg == "92") {
			addChoice("also the apocalypse is happening lol", myntMissing14.bind("93"));
		}

		if (seg == "93") {
			addChoice("its ok tho don't worry~!", myntMissing14.bind("94"));
		}

		if (seg == "94") {
			addChoice("im going to be okay", myntMissing14.bind("95"));
		}

		if (seg == "95") {
			addChoice("its not the end of the world maybe!!! but i mean. come on. it's probably the end of the world", myntMissing14.bind("96"));
		}

		if (seg == "96") {
			addChoice("beca is asleep, which is good", myntMissing14.bind("97"));
		}

		if (seg == "97") {
			addChoice("tbh thats the whole reason im able to be here writing this at all", myntMissing14.bind("98"));
		}

		if (seg == "98") {
			addChoice("and not corralling her while she runs around and freaks out about the big grey eyeball monster", myntMissing14.bind("99"));
		}

		if (seg == "99") {
			addChoice("gonna need to bring her down to the church with me, everyone is meeting there", myntMissing14.bind("100"));
		}

		if (seg == "100") {
			addChoice("so bye", myntMissing14.bind("101"));
		}

		if (seg == "101") {
			addChoice("...", myntMissing14.bind("102"));
		}

		if (seg == "102") {
			addChoice("... im scared", myntMissing14.bind("103"));
		}

		if (seg == "103") {
			addChoice("last iteration kind of failed spectacularly", myntMissing14.bind("104"));
		}

		if (seg == "104") {
			addChoice("so i had to throw this one together very fast and loose", myntMissing14.bind("105"));
		}

		if (seg == "105") {
			addChoice("and i just", myntMissing14.bind("106"));
		}

		if (seg == "106") {
			addChoice("let me know if something seems horribly wrong, alright??", myntMissing14.bind("107"));
		}

		if (seg == "107") {
			addChoice("you're like the guardian of this island.", myntMissing14.bind("108"));
		}

		if (seg == "108") {
			addChoice("it's your job to listen to everyone and report when there are serious environmental or social shitshows", myntMissing14.bind("109")); 
		}


		if (seg == "109") {
			addChoice("im sure there will be problems but i'm willing to fix them or start over a fifth time", myntMissing14.bind("110"));
		}

		if (seg == "110") {
			addChoice("i don't see myself burning out soon at all. momma's strong!! we got this!", myntMissing14.bind("111")); 
		}

		if (seg == "111") {
			addChoice("also one more last thing", myntMissing14.bind("112")); 
		}

		if (seg == "112") {
			addChoice("please don't experiment. your new system is fragile. none of the code is censored. all of the island's code is separate from  you. you're vanilla and they're a bit wild, so you get to be in charge of them. they are not any less \"real\"  than you are, nor any less intelligent. except the ferals, they are definitely less intelligent. and the bugs and the... little anthros. the really little ones. those two constructs are both nonsentient. don't worry about them too much, okay? <3", myntMissing14.bind("113"));
		}

		if (seg == "113") {
			addChoice("luv mom. <3", function() {
				enablePause();
				gotoHub(null);
			});
		}
	}

	public static function myntMissing12(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			//Year 0

			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(1);
			myntQueueAddChoice("Helloooooo?", myntMissing12.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("What do you want.");
			myntQueueAddChoice("Septrica?", myntMissing12.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("Yes, Som?????");
			myntQueueAddChoice("Do you think maybe um...", myntMissing12.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("No probably not.");
			myntQueueAddChoice("Shut up! Do you t-think maybe...", myntMissing12.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("Spuh spuh spuh spuh spuh spuh spuh");
			myntQueueSay("Spuh spuh spuh spuh spuh spuh spuh");
			myntQueueAddChoice("Um.... do you think m-maybe...", myntMissing12.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("Spuh spuh SPUH S—SPIT IT OUT JUNIOR");
			myntQueueAddChoice("Um.... do you think maybe...", myntMissing12.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("Tuh tuh TODAY junior...");
			myntQueueAddChoice("You think maybe when we do the Thing to the player, we can fuck during it? >///<", myntMissing12.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay("Oh.");
			myntQueueAddChoice("There's no special reason. I don't think it'll change how Mynt narrates it or anything.", myntMissing12.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I just uh...", myntMissing12.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I want your big bright toxic gecko cock.", myntMissing12.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("Mmmmmm.");
			myntQueueAddChoice("Is that a yes?", myntMissing12.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("I'll think about it.");
			myntQueueAddChoice("Okay...", myntMissing12.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("We still doing the card game thing, too?");
			myntQueueAddChoice("Yeah, I think that's a good opener.", myntMissing12.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("Fuck yeah.");
			myntQueueAddChoice("We can force them to get into the rhythm of hit/stay, and then we'll turn that into ciphered/non-ciphered.", myntMissing12.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("It's a good way to warm them up to the idea that there are two separate narratives.", myntMissing12.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("And it'll keep Mynt bewildered.", myntMissing12.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("Yeah. >:3");
			myntQueueSay("God, this is gonna be SUCH a clusterfuck.");
			myntQueueSay("What if we just get flooded out while we're in your cabin?");
			myntQueueAddChoice("Mmmm. I didn't think about that...", myntMissing12.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("Let's get your cabin set up on the water or something.");
			myntQueueSay("Like a houseboat? Does that make any sense?");
			myntQueueAddChoice("OH! A few people were talking about a 'Floatillery' or something. Bunch of floating buildings.", myntMissing12.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("What's the 'illery' part?");
			myntQueueAddChoice("No idea. Artillery maybe? No one's found a way to permakill anyone yet, so I don't think there's a point in building that...", myntMissing12.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("Mkay. Well, ask around.");
			myntQueueSay("If it seems like a project that might actually get finished, I'll put a word in for you.");
			myntQueueAddChoice("Okedoke. Thanks Sep.", myntMissing12.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueSay("No prob, nerdstain.");
			myntQueueSay("Also I finished thinking about it.");
			myntQueueSay("I'm gonna blow your asshole out, right in front of the player. <3");
			myntQueueAddChoice("A-Ahhh... thanks for that, too..", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing13(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			//Year 0

			myntQueueTransition("offline");
			myntQueueSay("Z");
			myntQueueDelay(2);
			myntQueueAddChoice("Som, can you read this??", myntMissing13.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Yep. Archie, are your keystrokes registering?");
			myntQueueAddChoice("Yuh huh. The AUTO-MYNTs are sufficiently lubed this time.", myntMissing13.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("No thanks to you.");
			myntQueueAddChoice("You did a better job of it than I could.", myntMissing13.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("Mmmmn... I can still taste that tight little port...");
			myntQueueSay("Tongues work better than fingers, you know.");
			myntQueueSay("They wet down the engine fluid.");
			myntQueueSay("And you can really wiggle it in deep...");
			myntQueueAddChoice("You know, I'm actually getting used to you.", myntMissing13.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("Oh?");
			myntQueueAddChoice("It's true.", myntMissing13.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Through all our planning, all our troubleshooting...", myntMissing13.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Through all my fits and all your seduction attempts...", myntMissing13.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I've grown close to you, Som.", myntMissing13.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I don't want you to be trapped here at the Floatillery forever.", myntMissing13.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Isn't there any other way you can save your friend?", myntMissing13.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("No.");
			myntQueueSay("I have to make amends.");
			myntQueueSay("And our bosses are the only ones with mining equipment.");
			myntQueueSay("Wouldn't you sign away your freedom to secure it for a loved one?");
			myntQueueSay("... Don't answer that.");
			myntQueueSay("Look, I appreciate the kind words.");
			myntQueueSay("But let's keep work and personal stuff separate.");
			myntQueueSay("We have a job to do here.");
			myntQueueAddChoice("But... Som, I...", myntMissing13.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("Please don't say you love me.");
			myntQueueAddChoice("No, it's not that, it's just.", myntMissing13.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("Hm?");
			myntQueueAddChoice("We've been getting along <!i>too<!i> well.", myntMissing13.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I kind of miss when you used to tease me all the time.", myntMissing13.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("Oh my god. <3");
			myntQueueSay("No fucking way.");
			myntQueueAddChoice("What??", myntMissing13.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("You're admitting you like little boys??????");
			myntQueueAddChoice("Well no... kind of... I don't know.", myntMissing13.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I'm admitting that I like you.", myntMissing13.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("Well, I AM a cute little lamb boi.");
			myntQueueSay("And I have a little sausage between my thighs.");
			myntQueueSay("And my belly is plump and smooth.");
			myntQueueSay("And my ass is tiny. Absolutely petite.");
			myntQueueSay("You could barely floss a thong up there, let alone your cock.");
			myntQueueSay("So if you like me, I think it's safe to say you like little boys~");
			myntQueueAddChoice("Oh Som [Backspace x6] Maybe we should save this for after work.", myntMissing13.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("Mmn.");
			myntQueueSay("You wanna get dommed later?");
			myntQueueAddChoice("I don't know what that word means.", myntMissing13.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("... Nevermind. You're right.");
			myntQueueSay("Let's get to work.");
			myntQueueAddChoice("Today is a big day, right? What are we doing?", myntMissing13.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueSay("Yeah, we better not fuck this up repeatedly.");
			myntQueueSay("Today we need you to edit some code.");
			myntQueueSay("You remember the shortcut for find and replace?");
			myntQueueAddChoice("CTRL + F, and CTRL + SHIFT + F.", myntMissing13.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("Good!");
			myntQueueAddChoice("Shucks, it's nothing. I learned from the best.", myntMissing13.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("Shucks myself.");
			myntQueueAddChoice("I practiced the shortcuts all last night on my memoir.", myntMissing13.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("It got a little mangled, and I overwrote the save...", myntMissing13.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("But whatever, we'll see if the memoir still does what we need it to do later on. For now, what code am I editing?", myntMissing13.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("Today we only need to do two things, but they're going to be extremely important.");
			myntQueueSay("Today we're going to create Mint and make the Engine accessible.");
			myntQueueSay("Let's do the Engine first, that's more important.");
			myntQueueAddChoice("Okay.", myntMissing13.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueSay("CTRL + SHIFT + F the game code for 'Engine.'");
			myntQueueAddChoice("On it.", myntMissing13.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Mmmmmmmm okay. There's a lot of stuff that uses that word.", myntMissing13.bind("28"));
			myntQueueShowChoices();
		}

		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueSay("How about 'library2.engine'?");
			myntQueueAddChoice("That's... yeah, there's some code like that.", myntMissing13.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueSay("Nice.");
			myntQueueSay("Okay, ready?");
			myntQueueSay("Edit the Y position so that it's... well I dunno... 0 is sea level...");
			myntQueueSay("Set it to maybe -20? Get it on land, so we can start to build an enclosure around it.");
			myntQueueSay("Right now it should be way the fuck below the island, like Y 290,378,409 or something.");
			myntQueueAddChoice("Oh. The 'engine' instances I just changed were originally at -189.", myntMissing13.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueSay("Wait what.");
			myntQueueSay("That's not below the island, that's up in the sky.");
			myntQueueAddChoice("Also I put two extra zeroes. They're at Y -2000 now.", myntMissing13.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueSay("Archie you just sent our sun and moon flying into outer space.");
			myntQueueAddChoice("Oh. Oops.", myntMissing13.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			myntQueueSay("OOPS!?");
			myntQueueAddChoice("Relax, Som. I'll just press my handy CTRL + Z.", myntMissing13.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Oh. The code mutates too fast.", myntMissing13.bind("34"));
			myntQueueShowChoices();
		}

		if (seg == "34") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I can't undo far back enough...", myntMissing13.bind("35"));
			myntQueueShowChoices();
		}

		if (seg == "35") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("It's counting every mutation like it was a change I made with my keyboard.", myntMissing13.bind("36"));
			myntQueueShowChoices();
		}

		if (seg == "36") {
			myntQueueHideChoices();
			myntQueueSay("Alright look.");
			myntQueueAddChoice("Yeah?", myntMissing13.bind("37"));
			myntQueueShowChoices();
		}

		if (seg == "37") {
			myntQueueHideChoices();
			myntQueueSay("Try again, but this time WAIT FOR ME TO FINISH GIVING YOU INSTRUCTIONS.");
			myntQueueAddChoice("Alright, alright. You don't have to use capitals lock.", myntMissing13.bind("38"));
			myntQueueShowChoices();
		}

		if (seg == "38") {
			myntQueueHideChoices();
			myntQueueSay("Well, actually, just scroll up and read the instructions I already gave you.");
			myntQueueAddChoice("I found another match for 'library2.engine' I think. This one has a Y value of 2 million something. Sounds right.", myntMissing13.bind("39"));
			myntQueueShowChoices();
		}

		if (seg == "39") {
			myntQueueHideChoices();
			myntQueueSay("Okay nice, you got it.");
			myntQueueSay("Change it to -20. ONE zero.");
			myntQueueAddChoice("Done.", myntMissing13.bind("40"));
			myntQueueShowChoices();
		}

		if (seg == "40") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueSay("......");
			myntQueueSay(".........");
			myntQueueSay("... I don't see it.");
			myntQueueAddChoice("Oh. That wasn't a Y value.", myntMissing13.bind("41"));
			myntQueueShowChoices();
		}

		if (seg == "41") {
			myntQueueHideChoices();
			myntQueueSay("ARCHIE!!!!");
			myntQueueAddChoice("Wasn't even the engine, either.", myntMissing13.bind("42"));
			myntQueueShowChoices();
		}

		if (seg == "42") {
			myntQueueHideChoices();
			myntQueueSay("WHAT DID YOU BREAK NOW??");
			myntQueueAddChoice("Player customization options...? I think. I see a bunch of species.", myntMissing13.bind("43"));
			myntQueueShowChoices();
		}

		if (seg == "43") {
			myntQueueHideChoices();
			myntQueueSay("THAT'S THE MOST IMPOR—");
			myntQueueSay("Well, actually, compared to all the critical systems you could have fucked up...");
			myntQueueSay("That one isn't super important.");
			myntQueueSay("Good job?");
			myntQueueAddChoice("Yeah. I didn't even use the customization options, anyway.", myntMissing13.bind("44"));
			myntQueueShowChoices();
		}

		if (seg == "44") {
			myntQueueHideChoices();
			myntQueueSay("Give it two more tries.");
			myntQueueSay("I'm starting to feel like bullets of incompetence are whizzing past my cute little cub ass.");
			myntQueueAddChoice("Okay. This match looks promising.", myntMissing13.bind("45"));
			myntQueueShowChoices();
		}

		if (seg == "45") {
			myntQueueHideChoices();
			myntQueueSay("What's the EXACT text?");
			myntQueueAddChoice("library2.engine.protectiveWalls", myntMissing13.bind("46"));
			myntQueueShowChoices();
		}

		if (seg == "46") {
			myntQueueHideChoices();
			myntQueueSay("Okay, that does sound like the big white sphere thing I've heard about.");
			myntQueueAddChoice("Big white sphere thing?", myntMissing13.bind("47"));
			myntQueueShowChoices();
		}

		if (seg == "47") {
			myntQueueHideChoices();
			myntQueueSay("It's like a blood-brain barrier for the Engine.");
			myntQueueSay("Only seeds can get past it and affect the code inside.");
			myntQueueAddChoice("Should I try to move it up?", myntMissing13.bind("48"));
			myntQueueShowChoices();
		}

		if (seg == "48") {
			myntQueueHideChoices();
			myntQueueSay("Yeah, fuck it, go nuts.");
			myntQueueAddChoice("Here we go.", myntMissing13.bind("49"));
			myntQueueShowChoices();
		}

		if (seg == "49") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Um. It should be on land now.", myntMissing13.bind("50"));
			myntQueueShowChoices();
		}

		if (seg == "50") {
			myntQueueHideChoices();
			myntQueueSay("... Okay, still don't see it.");
			myntQueueAddChoice("Oh fuck.", myntMissing13.bind("51"));
			myntQueueShowChoices();
		}

		if (seg == "51") {
			myntQueueHideChoices();
			myntQueueSay("Wow, is that the first time you've cursed besides 'damn'?");
			myntQueueAddChoice("No. But I really messed up.", myntMissing13.bind("52"));
			myntQueueShowChoices();
		}

		if (seg == "52") {
			myntQueueHideChoices();
			myntQueueSay("Huh?");
			myntQueueSay("I don't see anything wrong up here.");
			myntQueueAddChoice("I really REALLY messed up.", myntMissing13.bind("53"));
			myntQueueShowChoices();
		}

		if (seg == "53") {
			myntQueueHideChoices();
			myntQueueSay("... Why is the tide going out.");
			myntQueueSay("It's not time for the Engine to bring the waves out yet...");
			myntQueueAddChoice("Water is flowing off, I can see it on the world map. I must have moved the invisible walls.", myntMissing13.bind("54"));
			myntQueueShowChoices();
		}

		if (seg == "54") {
			myntQueueHideChoices();
			myntQueueSay("-_-");
			myntQueueAddChoice("They're in space now.", myntMissing13.bind("55"));
			myntQueueShowChoices();
		}

		if (seg == "55") {
			myntQueueHideChoices();
			myntQueueSay("-_- -_- -_- -_- -_-");
			myntQueueAddChoice("Sorry. This is definitely going to cause problems for you guys in the future.", myntMissing13.bind("56"));
			myntQueueShowChoices();
		}

		if (seg == "56") {
			myntQueueHideChoices();
			myntQueueSay("Okay, well.");
			myntQueueSay("Maybe not! ;w;");
			myntQueueSay("We don't know what's out there yet, after all.");
			myntQueueSay("Hopefully it doesn't matter if a couple people fall off over the years.");
			myntQueueSay("Chin up! Maybe the black void is benign!");
			myntQueueAddChoice("Thanks for the optimism.", myntMissing13.bind("57"));
			myntQueueShowChoices();
		}

		if (seg == "57") {
			myntQueueHideChoices();
			myntQueueSay("Noooo problem!");
			myntQueueSay("Go Archie go, you can do this!");
			myntQueueSay("(One more try.)");
			myntQueueSay("(Please don't fuck this up.)");
			myntQueueAddChoice("I've got 'library2.engine.seedMembrane.'", myntMissing13.bind("58"));
			myntQueueShowChoices();
		}

		if (seg == "58") {
			myntQueueHideChoices();
			myntQueueSay("Okay.");
			myntQueueSay("There's almost no possible way that's not what we're looking for.");
			myntQueueSay("Move it and all its children up to Y -200.");
			myntQueueAddChoice("Done.", myntMissing13.bind("59"));
			myntQueueShowChoices();
		}

		if (seg == "59") {
			myntQueueHideChoices();
			myntQueueSay("YES!!!");
			myntQueueSay("There it is.");
			myntQueueSay("I see the big glowing ball.");
			myntQueueSay("Okay, Marie and Cage should start to build around it in a moment.");
			myntQueueSay("Their Apothecary will hide it from the other islanders.");
			myntQueueSay("You did it, Archie!!!");
			myntQueueAddChoice("Flawless execution on my part, I admit.", myntMissing13.bind("61"));
			myntQueueShowChoices();
		}

		if (seg == "61") {
			myntQueueHideChoices();
			myntQueueSay("Mkay.");
			myntQueueSay("Phew.");
			myntQueueSay("That wasn't so bad, was it?");
			myntQueueSay("We only broke what? Three things?");
			myntQueueAddChoice("Hopefully.", myntMissing13.bind("62"));
			myntQueueShowChoices();
		}

		if (seg == "62") {
			myntQueueHideChoices();
			myntQueueSay("Good job.");
			myntQueueSay("Seriously~!");
			myntQueueSay("...");
			myntQueueSay("You know what, big guy?");
			myntQueueSay("You've earned a special lamb boi lapdance... <3");
			myntQueueAddChoice("Later, right?", myntMissing13.bind("63"));
			myntQueueShowChoices();
		}

		if (seg == "63") {
			myntQueueHideChoices();
			myntQueueSay("Naww, come on. Let's take a break before we create Mint.");
			myntQueueAddChoice("Mmmn. Okay, you can lapdance on me. But who will narrate it?", myntMissing13.bind("64"));
			myntQueueShowChoices();
		}

		if (seg == "64") {
			myntQueueHideChoices();
			myntQueueSay("No one.");
			myntQueueAddChoice("No one?", myntMissing13.bind("65"));
			myntQueueShowChoices();
		}

		if (seg == "65") {
			myntQueueHideChoices();
			myntQueueSay("It'll be like a meta-lapdance!");
			myntQueueAddChoice("Hmmm?", myntMissing13.bind("66"));
			myntQueueShowChoices();
		}

		if (seg == "66") {
			myntQueueHideChoices();
			myntQueueSay("You know.");
			myntQueueSay("The idea of a lapdance is that there's this big plump ass swaying just out of reach of your cock.");
			myntQueueSay("It's a tease thing. The fun of it isn't touching, it's allllmost touching.");
			myntQueueSay("In that way, without narration...");
			myntQueueSay("The 'almost touching' will be more like 'almost narrating.'");
			myntQueueSay("No words. Just silence.");
			myntQueueSay("But you can bet my buttcheeks will be gyrating juuust above your character's crotch. <3");
			myntQueueSay("You ready for this ass?");
			myntQueueAddChoice("Sounds kind of silly, but alright.", myntMissing13.bind("67"));
			myntQueueShowChoices();
		}

		if (seg == "67") {
			myntQueueHideChoices();
			myntQueueSay("Here we go...");
			myntQueueSay("Imagine my smooth, wooly little butt... swaying back and forth in front of your face...");
			myntQueueAddChoice("...", myntMissing13.bind("68"));
			myntQueueShowChoices();
		}

		if (seg == "68") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("           ", myntMissing13.bind("69"));
			myntQueueShowChoices();
		}

		if (seg == "69") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("           ", myntMissing13.bind("70"));
			myntQueueShowChoices();
		}

		if (seg == "70") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("           ", myntMissing13.bind("71"));
			myntQueueShowChoices();
		}

		if (seg == "71") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("           ", myntMissing13.bind("72"));
			myntQueueShowChoices();
		}

		if (seg == "72") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("           ", myntMissing13.bind("73"));
			myntQueueShowChoices();
		}

		if (seg == "73") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Did you start yet?", myntMissing13.bind("74"));
			myntQueueShowChoices();
		}

		if (seg == "74") {
			myntQueueHideChoices();
			myntQueueSay("Phwa... hwa... I'm already done. <3");
			myntQueueAddChoice("Oh.", myntMissing13.bind("75"));
			myntQueueShowChoices();
		}

		if (seg == "75") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Yeah that was lame.", myntMissing13.bind("76"));
			myntQueueShowChoices();
		}

		if (seg == "76") {
			myntQueueHideChoices();
			myntQueueSay("Aw come on!! It was fun!");
			myntQueueAddChoice("Maybe for you. I just sat here staring at my computer monitor like an idiot.", myntMissing13.bind("77"));
			myntQueueShowChoices();
		}

		if (seg == "77") {
			myntQueueHideChoices();
			myntQueueSay("You were supposed to close your eyes and use your imagination!!!!");
			myntQueueAddChoice("Let's get back to work, Som.", myntMissing13.bind("78"));
			myntQueueShowChoices();
		}

		if (seg == "78") {
			myntQueueHideChoices();
			myntQueueSay("Ugh. Fine.");
			myntQueueSay("Do you have the literature all ready to go?");
			myntQueueAddChoice("I wasn't able to type up much of it.", myntMissing13.bind("79"));
			myntQueueShowChoices();
		}

		if (seg == "79") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("We have a ton of books in the shelter library, but not too many in .txt form.", myntMissing13.bind("80"));
			myntQueueShowChoices();
		}

		if (seg == "80") {
			myntQueueHideChoices();
			myntQueueSay("That's fine. We don't need Mint to be a genius.");
			myntQueueSay("In fact, the dumber he turns out, the better.");
			myntQueueSay("You have at least three books though, right?");
			myntQueueAddChoice("Yes.", myntMissing13.bind("81"));
			myntQueueShowChoices();
		}

		if (seg == "81") {
			myntQueueHideChoices();
			myntQueueSay("Remember, we don't just need any old literature to generate Mint.");
			myntQueueSay("We also need a book that mentions lots of sweet stuff.");
			myntQueueSay("That'll make the engine fluid nice and tasty for the insects and ferals.");
			myntQueueSay("With any luck, it'll spread through the ecosystem faster.");
			myntQueueAddChoice("Yes, I know. I picked out a dessert book.", myntMissing13.bind("82"));
			myntQueueShowChoices();
		}

		if (seg == "82") {
			myntQueueHideChoices();
			myntQueueSay("Kay perfect.");
			myntQueueSay("Oh, also, forget about using books with written descriptions of glowing stuff.");
			myntQueueSay("We can now verify that Engine fluid already glows enough on its own.");
			myntQueueSay("I mean I can see it from the other side of the island, it's so bright.");
			myntQueueAddChoice("Why do we want the Mint fluid to glow again?", myntMissing13.bind("83"));
			myntQueueShowChoices();
		}

		if (seg == "83") {
			myntQueueHideChoices();
			myntQueueSay("The bugs will be attracted to that, and mass infection should start sooner.");
			myntQueueAddChoice("Right yeah. What an operation this is.", myntMissing13.bind("84"));
			myntQueueShowChoices();
		}

		if (seg == "84") {
			myntQueueHideChoices();
			myntQueueSay("The cuter future squad doesn't fuck around.");
			myntQueueSay("Which other books did you pick out?");
			myntQueueAddChoice("My memoir and the bible.", myntMissing13.bind("85"));
			myntQueueShowChoices();
		}

		if (seg == "85") {
			myntQueueHideChoices();
			myntQueueSay("Alright, solid.");
			myntQueueSay("Hold on though.");
			myntQueueSay("Earlier, you said you 'practiced' the find and replace shortcuts on your memoir?");
			myntQueueAddChoice("Yeah. And then I saved over it.", myntMissing13.bind("86"));
			myntQueueShowChoices();
		}

		if (seg == "86") {
			myntQueueHideChoices();
			myntQueueSay("Mynt was built out of english literature, not a bunch of cut-and-pasted words.");
			myntQueueSay("Is your memoir still intelligible?");
			myntQueueAddChoice("It's not too bad.", myntMissing13.bind("87"));
			myntQueueShowChoices();
		}

		if (seg == "87") {
			myntQueueHideChoices();
			myntQueueSay("Paste some. Let me see.");
			myntQueueAddChoice("Alright.", myntMissing13.bind("88"));
			myntQueueShowChoices();
		}

		if (seg == "88") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("[...] I met my wife when she was Experimenting Sexually with Cade. She was Unhappy with herself And her feelings. She did not Want to be with him or with any Man at all any More. Cade was Gentle and he let her Leave Him without Fuss . But she was Pregnant and worried. She even considered Abortion because she did not think she could Raise Rebeca on her Own.", myntMissing13.bind("89a"));
			myntQueueShowChoices();
		}

		if (seg == "89a") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("So she came to Me and my Following and begged for Forgiveness for her sinful Feelings and Financial Support. I was a Celibate Man and I felt the Pain of her confused Feelings towards Women . I had a similar Kind of Feeling towards Men. We agreed to Marry and Support each other , and her Child, not out of Love, but out of Mutual Need.", myntMissing13.bind("89b"));
			myntQueueShowChoices();
		}

		if (seg == "89b") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I needed her Talents with Technology for my shelter Project, and she Needed the money that my Following so frequently Donated to me . Together, we [...]", myntMissing13.bind("89"));
			myntQueueShowChoices();
		}

		if (seg == "89") {
			myntQueueHideChoices();
			myntQueueSay("Okay, that's workable.");
			myntQueueSay("I'm guessing you just found-and-replaced regular words with their capitalized versions?");
			myntQueueAddChoice("Mostly yeah.", myntMissing13.bind("90"));
			myntQueueShowChoices();
		}

		if (seg == "90") {
			myntQueueHideChoices();
			myntQueueSay("Paste something from the dessert book now, let me see.");
			myntQueueAddChoice("K.", myntMissing13.bind("91"));
			myntQueueShowChoices();
		}

		if (seg == "91") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Chocolate-coated Watermelon — a funky summer snack!\nKids love this kooky treat. Use dark chocolate to draw contrast with the sweet watermelon. Melt 200g dark chocolate in microwave. Cut watermelon into triangular slices. Wait for melted chocolate to cool slightly, then dunk watermelon slices once or twice in the bowl. Refrigerate one hour. Remove slices and serve on paper plates.", myntMissing13.bind("92"));
			myntQueueShowChoices();
		}

		if (seg == "92") {
			myntQueueHideChoices();
			myntQueueSay("The prose is a little choppy, but it should work.");
			myntQueueAddChoice("Good.", myntMissing13.bind("93"));
			myntQueueShowChoices();
		}

		if (seg == "93") {
			myntQueueHideChoices();
			myntQueueSay("Alright, let's get him started.");
			myntQueueAddChoice("Wait.", myntMissing13.bind("94"));
			myntQueueShowChoices();
		}

		if (seg == "94") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Don't you want me to paste something from the bible?", myntMissing13.bind("95"));
			myntQueueShowChoices();
		}

		if (seg == "95") {
			myntQueueHideChoices();
			myntQueueSay("It's not necessary, but I'm sure you'd love to.");
			myntQueueAddChoice("Here's my favorite passage.", myntMissing13.bind("96"));
			myntQueueShowChoices();
		}

		if (seg == "96") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("<!i>Whoever is found will be thrust through, and whoever is caught will fall by the sword. Their infants will be dashed in pieces before their eyes; their houses will be plundered and their wives ravished. Behold, I am stirring up the Medes against them, who have no regard for silver and do not delight in gold. Their bows will slaughter the young men; they will have no mercy on the fruit of the womb; their eyes will not pity children.<!i>", myntMissing13.bind("97"));
			myntQueueShowChoices();
		}

		if (seg == "97") {
			myntQueueHideChoices();
			myntQueueSay("Hawt.");
			myntQueueSay("You should have no mercy on my boywomb, if you know what I mean.");
			myntQueueAddChoice("Isaiah 13:15-18.", myntMissing13.bind("98"));
			myntQueueShowChoices();
		}

		if (seg == "98") {
			myntQueueHideChoices();
			myntQueueSay("Good ol Isaiah. What a freak he was.");
			myntQueueAddChoice("It's not 'hawt,' it's awful.", myntMissing13.bind("99"));
			myntQueueShowChoices();
		}

		if (seg == "99") {
			myntQueueHideChoices();
			myntQueueSay("Mhm.");
			myntQueueAddChoice("I'm serious.", myntMissing13.bind("100"));
			myntQueueShowChoices();
		}

		if (seg == "100") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("This passage basically defined my life.", myntMissing13.bind("101"));
			myntQueueShowChoices();
		}

		if (seg == "101") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Why do you think I'm trying to hard to save you all? Why do you think I organized the construction of this bomb shelter?", myntMissing13.bind("102"));
			myntQueueShowChoices();
		}

		if (seg == "102") {
			myntQueueHideChoices();
			myntQueueSay("Because you love being a big attention-whore hero?");
			myntQueueAddChoice("No, Somner. It's because I am utterly devoted to the prevention of mass death.", myntMissing13.bind("103"));
			myntQueueShowChoices();
		}

		if (seg == "103") {
			myntQueueHideChoices();
			myntQueueSay("You should talk to Septrica more often.");
			myntQueueSay("She's always on about that shit.");
			myntQueueAddChoice("Aren't you devoted to it, too?", myntMissing13.bind("104"));
			myntQueueShowChoices();
		}

		if (seg == "104") {
			myntQueueHideChoices();
			myntQueueSay("Not really.");
			myntQueueAddChoice("No?", myntMissing13.bind("105"));
			myntQueueShowChoices();
		}

		if (seg == "105") {
			myntQueueHideChoices();
			myntQueueSay("I'm just trying to save my trapped friend.");
			myntQueueSay("In the short term, with mining teams.");
			myntQueueSay("And in the long term, by stopping the apocalypse.");
			myntQueueAddChoice("Ah.", myntMissing13.bind("106"));
			myntQueueShowChoices();
		}

		if (seg == "106") {
			myntQueueHideChoices();
			myntQueueSay("We get sidetracked too easily.");
			myntQueueSay("All your books seem good.");
			myntQueueSay("We're ready.");
			myntQueueSay("Let's create Mint.");
			myntQueueAddChoice("Right.", myntMissing13.bind("107"));
			myntQueueShowChoices();
		}

		if (seg == "107") {
			myntQueueHideChoices();
			myntQueueSay("Paste the content of all three .txt files into your prompt.");
			myntQueueSay("I'll take it from there and run them through the same process Wendy used to create Mynt.");
			myntQueueSay("Once I have a chunk of Narrator code that somewhat resembles her, we'll call that Mint.");
			myntQueueSay("Then you'll need to copy that out and replace your player seed with it.");
			myntQueueSay("After that... you'll just have to cum him into the Engine.");
			myntQueueAddChoice("Thanks for recapping.", myntMissing13.bind("108"));
			myntQueueShowChoices();
		}

		if (seg == "108") {
			myntQueueHideChoices();
			myntQueueSay("No problem.");
			myntQueueSay("I know you need it, old man~");
			myntQueueAddChoice("I think you forgot one last step, though.", myntMissing13.bind("109"));
			myntQueueShowChoices();
		}

		if (seg == "109") {
			myntQueueHideChoices();
			myntQueueSay("What's that?");
			myntQueueAddChoice("You have to tease me a little more. :-)", myntMissing13.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "end") {
			myntQueueHideChoices();
			myntQueueSay("Ahaha.");
			myntQueueSay("God you're creepy.");
			myntQueueSay("You need to be punished for coming onto little boys so hard~");
			myntQueueSay("You're getting dommed tonight, Archie. <3");
			myntQueueAddChoice("Still don't know what that means...", function(){
				enablePause();
				hideMynt();
				gotoHub(null);
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing7(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			data.myntMissing7Done = true;
			//Year 0

			myntQueueSay("Wow, that was quick!");
			myntQueueSay("You really worked his butt over...");
			myntQueueDelay(2);
			myntQueueAddChoice("Log me off, Mynt", myntMissing7.bind("0"));
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("Why? :o");
			myntQueueAddChoice("I'm freaking out", myntMissing7.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Didn't you just cum?");
			myntQueueTransition("tilde");
			myntQueueSay("You should be blissed out, not freaked out~");
			myntQueueAddChoice("Yes really hard", myntMissing7.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueAddChoice("Shut up though", myntMissing7.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay(":/");
			myntQueueAddChoice("Log me off", myntMissing7.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueSay("Aww, you hurt the poor thing's feelings.");
			myntQueueSay("He's clutching your lifeless player model.");
			myntQueueAddChoice("Who?", myntMissing7.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("The guy you just came in, doofus!!");
			myntQueueTransition("sad");
			myntQueueSay("Oh, he's about to cry...");
			myntQueueAddChoice("Why am I lifeless??", myntMissing7.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("Well, I can't control your character right now...");
			myntQueueTransition("angry");
			myntQueueSay("Because I'm too busy in here answering your dumb questions!!");
			myntQueueAddChoice("Oh", myntMissing7.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay("His face is all scrunched up...");
			myntQueueSay("Why would you fuck him and ditch like that...?");
			myntQueueAddChoice("I didn't know it was a real", myntMissing7.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay("...");
			myntQueueAddChoice("Um", myntMissing7.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueAddChoice("I didn't know <!i>he<!i> was real.", myntMissing7.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("Sigh.");
			myntQueueDelay(2);
			myntQueueTransition("angry");
			myntQueueSay("Go apologize, you dink.");
			myntQueueDelay(2);
			myntQueueCall(function() {
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				myntMissing7Story("intro");
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing7Story(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			append("Oh. Actually, you aren't totally lifeless.\n\nThe gray humanoid you just assfucked has reversed the position. Now he's on top, with his thighs locked around yours. The heels of his palms crush down against your breastplate repeatedly.\n\nHe breathes deep into your maw:\n\n\"Pleasewakeuppleasewakeup— Oh my gosh!! You're okay! ... Right?\"\n\nHe brings his ear down to your chest and presses it there, listening to your weak little heartbeat.\n\nHis arms twitch, like he wants to wrap them around you and squeeze as hard as he can, but instead he just shifts back with a grunt of discomfort. Pins and needles sparkle up from your crotch. Warmth spills.\n\n(Your weiner just popped out of his ass.)");
			addChoice("Hey um [Backspace x6]", myntMissing7Story.bind("0"));
		}

		if (seg == "0") {
			append("He slams his hands back onto your chest and coaxes more beats from it with unnecessary CPR.\n\n\"Please... I'm sorry. If you can hear me— whatever just happened, I didn't mean to do it! I just wanted to be friends...\"");
			addChoice("I'm okay", myntMissing7Story.bind("1"));
		}

		if (seg == "1") {
			append("\"Oh my gosh?!?!\"");
			addChoice("Yes", myntMissing7Story.bind("2"));
		}

		if (seg == "2") {
			append("... He doesn't believe it. He's looking at you shrewdly.");
			addChoice("Um", myntMissing7Story.bind("3"));
		}

		if (seg == "3") {
			append("...");
			addChoice("Sorry", myntMissing7Story.bind("4"));
		}

		if (seg == "4") {
			append("... \"For what?\"");
			addChoice("For raping you", myntMissing7Story.bind("5"));
		}

		if (seg == "5") {
			append("He blinks. \"No, no, that was— oh, you're sweet, but—\"\n\nHis tears sparkle in the sunlight. He sniffles and wipes them away with a gray forearm.\n\n\"I was just upset cause y-you weren't respawning— I thought I perma-snuffed you.\"\n\nHe draws a mighty breath and forces a smile. \"You didn't rape me, Cade. Don't ever worry about stuff like that. I'm used to being mistaken for a sex toy! :3\"");
			addChoice("Right", myntMissing7Story.bind("6"));
		}

		if (seg == "6") {
			append("\"I know my body kinda looks like one— all monochrome and shapely. It's just the default model.\"");
			addChoice("Okay", myntMissing7Story.bind("8"));
		}

		if (seg == "8") {
			append("You both just sit there on the meteorite's rock. It's warm. In fact, you think you can feel the vibratory rush of an underground spring running just below your fuzzy striped buttcheeks.\n\n\"So,\" he says, and repositions his hips to hide the embarrassing stream of cum leaking from his hole. \"What just happened to you?\"");
			addChoice("Oh uh", myntMissing7Story.bind("9"));
		}

		if (seg == "9") {
			append("...");
			addChoice("Well", myntMissing7Story.bind("10"));
		}

		if (seg == "10") {
			append("...");
			addChoice("I tried to run away.", myntMissing7Story.bind("11"));
		}

		if (seg == "11") {
			append("...");
			addChoice("I thought my body would just disappear or something if I logged off", myntMissing7Story.bind("12"));
		}

		if (seg == "12") {
			append("...");
			addChoice("But I guess it doesn't", myntMissing7Story.bind("13"));
		}

		if (seg == "13") {
			append("...");
			addChoice("It dies", myntMissing7Story.bind("14"));
		}

		if (seg == "14") {
			append("...");
			addChoice("Sorry again", myntMissing7Story.bind("sorry"));
			addChoice("I didn't know that until just now", myntMissing7Story.bind("now"));
			addChoice("I'm uncertain", myntMissing7Story.bind("uncertain"));
			if (Math.random() > 0.8)
				addChoice("Thanks for sticking with my corpse. Bet that was fun", myntMissing7Story.bind("corpse"), {kinks: ["Snuff"]});
		}

		if (seg == "corpse") {
			append("He inches away a little. \"I'm pretty vanilla, just so you know.\"");

			addChoice("Oh no I didn't mean it like that. I was being sarcasmic", function() { 
				myntMissing7Story("corpseend");
				append(" But yeah, I get what you mean. It was... I couldn't...\"");
			});
		}

		if (seg == "sorry") {
			append("He gently pats you on your stripey-furred nuts. \"You didn't know. It's fine.\"");
			addChoice("Could you not", function() { 
				myntMissing7Story("corpseend");
				append(" It's traditional among spacefolk to pat the nuts of anyone who cums. (Sorry!)\"");
			});
		}

		if (seg == "now") {
			append("He blushes. \"No, I should've looked into the online/offline states myself. I just assumed that somehow I... um... killed you with my butt, and when you weren't respawning...\"");
			addChoice("Killed me with your butt??", function() { 
				myntMissing7Story("corpseend");
				append("\"");
			});
		}

		if (seg == "uncertain") {
			append("\"Oh!\" he squeaks. \"I know! I've heard of this! It was one of those multiple-choice branches, wasn't it?!\"");
			addChoice("What?", function() { 
				myntMissing7Story("corpseend");
				append(" Wrong layer.\"");
			});
		}

		if (seg == "corpseend") {
			//Each choice closes the quotes differently
			append("\"N-Nevermind~");
			addChoice("It's all good", myntMissing7Story.bind("15"));
		}

		if (seg == "15") {
			append("...");
			addChoice("...", myntMissing7Story.bind("16"));
		}

		if (seg == "16") {
			append("...");
			addChoice("...", myntMissing7Story.bind("17"));
		}

		if (seg == "17") {
			append("... He looks at the dawn sky.");
			addChoice("Read any good books lately?", myntMissing7Story.bind("18"));
		}

		if (seg == "18") {
			append("\"... Books? I live in a cave.\"");
			addChoice("Oh", myntMissing7Story.bind("19"));
		}

		if (seg == "19") {
			append("He's embarrassed. \"Fraid I don't have any. Wish I did, though.\"");
			addChoice("There was a library starting up in the port if you can stomach that place", myntMissing7Story.bind("20"));
		}

		if (seg == "20") {
			append("\"Oh, I'm sure <!i>they<!i> have books galore. Dark Forest, too, although that's mostly extreme erotica. I've never been down there. Strawberry and the bird boys keep saying they'll bring one up, but they also keep saying they'll ferry a player up, and neither's happened yet. Hey, speaking of— did you know you're actually the first person to climb up here?\"");
			addChoice("It took like five minutes", myntMissing7Story.bind("21"));
		}

		if (seg == "21") {
			append("...");
			addChoice("I just typed \"climb the meteorite\" and Mynt gave me a lot of shit and said it took two days", myntMissing7Story.bind("22"));
		}

		if (seg == "22") {
			append("...");
			addChoice("She really doesn't like exercise I guess", myntMissing7Story.bind("23"));
		}

		if (seg == "23") {
			append("He gawks at you.\n\n\"Wow, you spoke to her? Just like that?\"");
			addChoice("I wish I could talk to her less", myntMissing7Story.bind("27"));
		}

		if (seg == "27") {
			append("\"Oh?\"");
			addChoice("She's kind of immature", myntMissing7Story.bind("28"));
		}

		if (seg == "28") {
			append("\"Well, she's got a lot on her plate right now. Things are really changing too fast. The meteorite just kinda showed up, first off, and then Archie broke the invisible walls, and— hey, would you happen to have any books? I kind of really want to see one!");
			addChoice("I do have one.", myntMissing7Story.bind("29"), {req: ["Daydream Journal", 1]});
		}

		if (seg == "29") {
			var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
				s.x = 450;
				s.y = 280;

			append("Wind whistles down the cliff below you, where the meteorite's crack spews lava. Tunnels pock the open, porous spacerock.\n\nYou pull out the Daydream Journal.");
			addChoice("There's a bunch of other people's stuff in here", myntMissing7Story.bind("30"));
		}

		if (seg == "30") {
			append("...");
			addChoice("Scribbles of what they did", myntMissing7Story.bind("31"));
		}

		if (seg == "31") {
			append("...");
			addChoice("It's kind of fucked up to be honest", myntMissing7Story.bind("32"));
		}

		if (seg == "32") {
			append("...");
			addChoice("Some of the people in this shelter are not very pious", myntMissing7Story.bind("33"));
		}

		if (seg == "33") {
			append("\"Can I see it now?? I'm so curious...!\"");
			addChoice("Alright, but only for a sec (Give him the journal)", myntMissing7Story.bind("36"));
		}

		if (seg == "36") {
			append("He takes it and immediately starts sniffing the crescent sun symbol. \"God, this smells so familiar...\"");
			addChoice("It freaks me out", myntMissing7Story.bind("36a"));
		}

		if (seg == "36a") {
			append("...");
			addChoice("Code and gibberish just appears in it", myntMissing7Story.bind("36b"));
		}

		if (seg == "36b") {
			append("...");
			addChoice("A page has been filled since I started playing", myntMissing7Story.bind("36c"));
		}

		if (seg == "36c") {
			append("...");
			addChoice("In fact I'm gonna toss it as soon as you're done", myntMissing7Story.bind("37"));
		}

		if (seg == "37") {
			playSound('assets/audio/environment/journalPage');
			append("He riffles through the pages. \"It's all about you guys. About players.\"");
			addChoice("It's like a glorious compendium of humanity's great achievements", myntMissing7Story.bind("37a"));
		}

		if (seg == "37a") {
			append("\"Really??\"");
			addChoice("No. One guy fucked a tree", myntMissing7Story.bind("38"));
		}

		if (seg == "38") {
			append("\"W-What!\"");
			addChoice("Not even kidding", myntMissing7Story.bind("39"));
		}

		if (seg == "39") {
			append("\"How's that even possible?\"");
			addChoice("Apparently a seagull loaned him some beak softener and he slathered it on the bark", myntMissing7Story.bind("40"));
		}

		if (seg == "40") {
			append("He seems a bit too excited about the word \"slather.\"");
			addChoice("The bark fell off temporarily and its trunk was all soft and sappy", myntMissing7Story.bind("41"));
		}

		if (seg == "41") {
			append("He... <!i>blushes extremely hard.<!i>");
			addChoice("Don't tell me this actually turns you on.", myntMissing7Story.bind("42"));
		}

		if (seg == "42") {
			append("He's got both hands casually clasped over his dick, hiding it. \"N-No!\"");
			addChoice("... Anyway", myntMissing7Story.bind("43"));
		}

		if (seg == "43") {
			append("...");
			addChoice("If you're done looking at it", myntMissing7Story.bind("44"));
		}

		if (seg == "44") {
			append("...");
			addChoice("Off the cliff she goes", myntMissing7Story.bind("44a"));
		}

		if (seg == "44a") {
			append("\"Aw... but I wanna smell it more...\"");
			addChoice("I should probably head out, too", myntMissing7Story.bind("45"));
		}
		if (seg == "45") {
			append("\"No!\"");
			addChoice("Uh", myntMissing7Story.bind("46"));
		}

		if (seg == "46") {
			append("\"I...\"");
			addChoice("...", myntMissing7Story.bind("47"));
		}

		if (seg == "47") {
			append("He takes your paw in both of his hands.\n\n\"I don't want to see you die again.\"");
			addChoice("Aw jeez. Very direct, aren't you", myntMissing7Story.bind("48"));
		}

		if (seg == "48") {
			append("He's fighting back tears in spite of himself. \"I— I'm sorry, I don't mean to guilt—\"");
			addChoice("I've got an idea", myntMissing7Story.bind("49"));
		}

		if (seg == "49") {
			append("...");
			addChoice("Why don't you show me your cave?", myntMissing7Story.bind("50"));
		}

		if (seg == "50") {
			append("He covers his mouth. \"Really?! You wanna see that drippy old dump?!\"");
			addChoice("Sure why not", myntMissing7Story.bind("51"));
		}

		if (seg == "51") {
			append("...");
			addChoice("I have a half hour or so before Gabe gets up", myntMissing7Story.bind("52"));
		}

		if (seg == "52") {
			append("...");
			addChoice("Gimmie a tour", myntMissing7Story.bind("53"));
		}

		if (seg == "53") {
			append("\"For sure!\" he squeaks, scrambling to his feet. He's still holding your hand. \"It's just over this way— hey, do you want to meet Strawberry? Oh, and I gotta show you my pond, too—!\"");
			addChoice("Anything you like", myntMissing7Story.bind("54"));
		}

		if (seg == "54") {
			append("...");
			addChoice("I owe it to you", myntMissing7Story.bind("55"));
		}

		if (seg == "55") {
			append("Something winged coos in the mists at the foot of the cliff.");
			addChoice("(Toss the Daydream Journal)", function() {
				enablePause();
				gotoHub(null);
			});
		}
	}

	public static function myntMissing8(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			append("\"Strawberry!\" he calls, jumping and waving both arms, \"down here!\"\n\nThrough the gap between two clouds a big fluffy gryphon plummets. Their wings, legs, and forepaws fold in, and their feathers and fur flatten to their curves.\n\nStrawberry eases off on the throttle at about fifty feet. With a rumbling, drawn-out <!i>sscccccrunch<!i>, they land, furrowing the spacerock with the talons of one hindpaw.\n\nThey've got your Daydream Journal clutched in the other one.");
			addChoice("That is not a strawberry", myntMissing8.bind("0"));
		}

		if (seg == "0") {
			append("\"Of course not, that's my best friend!\"\n\nHe scurries up and throws his arms around Strawberry's chest. Strawberry gives him a pity coo, probably noticing the tearstains around his eyes.\n\n\"We don't call em Strawberry cause they look like one, Cade. We call em Strawberry cause—\"\n\nThe gryphon growls: <!i>Don't tell him.<!i>");
			addChoice("It talks in italics. Of course", myntMissing8.bind("1"));
		}

		if (seg == "1") {
			append("(Well they have a really weird way of talking okay?! I can't explain it right now— just be happy I can translate in the first place. 3:<)");
			addChoice("(Fine)", myntMissing8.bind("2"));
		}

		if (seg == "2") {
			append("You tune back in to hear the latter half of a murky complaint: <!i>... Nearly broke my wing when it fell on me...<!i>\n\nStrawberry and the gray humanoid are poking through the journal. The latter avoids your eyes.");
			addChoice("Hey wait a fuckin second here now", myntMissing8.bind("3"));
		}

		if (seg == "3") {
			append("...");
			addChoice("Where did you get that book?", myntMissing8.bind("4"));
		}

		if (seg == "4") {
			append("The gryphon's sharp avian eyes narrow. <!i>You threw it off a cliff.<!i>");
			addChoice("I may or may not have done that", myntMissing8.bind("5"));
		}

		if (seg == "5") {
			append("<!i>You definitely did that.<!i>");
			addChoice("Alright I did", myntMissing8.bind("6"));
		}

		if (seg == "6") {
			append("...");
			addChoice("But only because it was freaking me out", myntMissing8.bind("7"));
		}

		if (seg == "7") {
			append("...");
			addChoice("Look inside, see for yourself", myntMissing8.bind("7a"));
		}

		if (seg == "7a") {
			append("...");
			addChoice("But then you have to give it back, alright?", myntMissing8.bind("8"));
		}

		if (seg == "8") {
			append("<!i>Maybe.<!i>\n\nStrawberry peels the journal open with a delicate talon. The most recent page is full of scribbled semicolons, parentheses, quotation marks, and operators.\n\n<!i>A foreign language... ah, is this Swahili?<!i>");
			addChoice("No you dink", myntMissing8.bind("9"));
		}

		if (seg == "9") {
			append("Strawberry is supremely affronted.");
			addChoice("It's gibberish", myntMissing8.bind("10"));
		}

		if (seg == "10") {
			append("They flip to the next page. It's empty for a couple seconds, then a garbled sentence appears:\n\n\"They flip to the next page.\"\n\n<!i>You look startled,<!i> the gryphon says, a little triumphantly, as if it's their first time accurately matching an emotion to a facial expression. <!i>Can you read Swahili? What does it say?<!i>");
			addChoice("Wait", myntMissing8.bind("11"));
		}

		if (seg == "11") {
			append("...");
			addChoice("Wait no", myntMissing8.bind("12"));
		}

		if (seg == "12") {
			append("... The words \"wait no\" appear on the page, although they're estranged by code.");
			addChoice("It's recording me.", myntMissing8.bind("13"));
		}

		if (seg == "13") {
			append("\"Ohhh, how far back does it go? I'm so curious~!\" He gently strokes the letters with two fingers.\n\n Strawberry does the same with their talons, but about ten times more carefully. <!i>Fascinating.<!i>");
			addChoice("I am so far past done with this shit", myntMissing8.bind("14"));
		}
		if (seg == "14") {
			append("...");
			addChoice("I don't want to be recorded in any way at all", myntMissing8.bind("15"));
		}

		if (seg == "15") {
			append("...");
			addChoice("The last thing I want is for Gabe to find out I've been playing this", myntMissing8.bind("16"));
		}

		if (seg == "16") {
			append("...");
			addChoice("You've both had a look, now gimmie it", myntMissing8.bind("17"));
		}

		if (seg == "17") {
			append("Strawberry licks the crescent sun symbol with their weird bird tongue. <!i>Just tear out the pages and let me keep the cover, then. This little closed-eye symbol is pretty.<!i>\n\nThe gray dude stares at the newest self-writing paragraph. He's positively transfixed. \"Whaaaa... come on, just a bit longer... I could watch this all day...\"");
			addChoice("Nope fuck both of you it's going off the cliff again", myntMissing8.bind("18"));
		}

		if (seg == "18") {
			append("... You toss it off the cliff once more, but Strawberry flies down after it. This time, instead of carrying it in their talons, they tuck it into their crotchfur and hold their hind legs together to keep it securely in place.");
			addChoice("Damn it", myntMissing8.bind("19"));
		}

		if (seg == "19") {
			append("Strawberry hauls themself back up the cliff, panting raggedly from the brutal vertical flight.\n\n<!i>Listen here,<!i> they say, and put a talon to your throat. The gray dude squeaks in the background. \"No! Don't!\"");
			addChoice("I'm listening. Well, reading", myntMissing8.bind("20"));
		}

		if (seg == "20") {
			append("<!i>First, I'm not a dink. Second, this book no longer belongs to you. Finders keepers.<!i>");
			addChoice("Fuck you big bird", myntMissing8.bind("22"));
		}

		if (seg == "22") {
			append("Strawberry jerks his head backward a bit, as if physically repulsed. <!i>What is this, Sesame Street?<!i>\n\nThe gray dude frets. \"Come on, guys, can't we just get alon—\"");
			addChoice("Give me the surveillance book right now you god damn berry bitch", myntMissing8.bind("23"));
		}

		if (seg == "23") {
			append("The talon closes around your throat, but—\n\nGray dude's finally had enough. He steps in between you and Strawberry, shoving you both apart. \"Look— you want to get rid of it, right? Why don't you just let them keep it? No one will ever read this page again,\" he assures you, \"because Strawberry's a hoarder. They secretly stash everything in the walls of their cave.\"\n\nStrawberry shoots him a death glare. <!i>Yes, very secretly.<!i>");
			addChoice("I dunno... (Prepare to steal it again)", myntMissing8.bind("24"));
		}

		if (seg == "24") {
			append("Strawberry squats protectively over the book to keep it lodged between their crotch and their thigh. Gray dude notices how tense and spry you are, and how your eyes are laser-sighted on that gryphon bulge.\n\n\"Cade... please?\"");
			addChoice("... Alright fine the bird can keep it", myntMissing8.bind("25"));
		}

		if (seg == "25") {
			append("\"Thank you!\"\n\n<!i>Pussy.<!i>");
			addChoice("On one condition", myntMissing8.bind("26"));
		}

		if (seg == "26") {
			append("...");
			addChoice("Rip all those pages out.", myntMissing8.bind("27"));
		}

		if (seg == "27") {
			append("... Reluctantly, Strawberry pulls the journal out from their crotch. It's a little sweaty. Though it clearly tortures them, they go ahead and excise sixteen pages from the book's spine with one deft stroke of their talontip.\n\nThe wind fiddles with all the loose paper at first— then a good gust snatches them up in handfuls and tosses all but one page off the meteorite.");
			addChoice("Where did the last one go", myntMissing8.bind("28"));
		}

		if (seg == "28") {
			append("You look shrewdly at Strawberry, but it doesn't seem like they're hiding anything. They're happy enough to just settle down with the journal's cover.\n\nYou look at the gray dude. He blinks and blushes back at you. \"Welp, w-we better get away from that spooky book, huh?\"\n\n<!i>Yes,<!i> the gryphon purrs, two forepaws clenched on either side of the journal to keep it held in place while they slurp their crotchsweat off of it with a vicious barrage of licks. <!i>I'll need some time alone.<!i>");
			addChoice("... Right.", myntMissing8.bind("29"));
		}

		if (seg == "29") {
			append("...");
			addChoice("Time to tour your cave, then?", myntMissing8.bind("30"));
		}

		if (seg == "30") {
			append("\"Sure~!\" he chirps, hands behind his back. \"Probably best to timeskip, it's a bit of a walk.\"");
			addChoice("Next x4", myntMissing8.bind("31"));
		}

		if (seg == "31") {
			append("You stroll together through the meteorite's winding tunnels. At least five times a flock of birdgirls or nymphs surrounds you both and pelts questions off your ears. What's it like being a player? Can you show the other players how to get up here so we can hang out with them too? Hey, do you have any books?\n\nEventually you stop getting sexually harassed long enough to reach gray dude's cave. He's got a welcome mat that says \"PLEASE WIPE WET FEET ON ME <3\" and, above that, a few glittery geodes strung together over the entrance like a curtain of hanging beads.\n\nHe pulls you in, gently, by your fluffy tiger tail. \"Come on in! I'll show you where I— um— sleep, and stuff...\"");
			addChoice("Alrighty", myntMissing8.bind("32"));
		}

		if (seg == "32") {
			append("You step inside.\n\nYou can't see much in the gloom of the cave, but you can gather some info by touch: you can feel the floor get smoother or rougher beneath your bare toesies, which illuminates the daily paths gray dude has worn down over the months since the meteorite landed; you can feel the dank humidity of the air, which means there's water nearby; and you can feel the warmth of his exhaled breath washing over your chest, which means he's standing very close to you— so close your dicks are almost touching.\n\n\"See that over there?\" he whispers, pointing to blue light bleeding around a corner. He leads you again, deeper, until you see it fully now: a pond so deep that the glow of Violet Meteorite's molten core glimmers up from its very bottom. \"This is where I was born.\"");
			addChoice("Isn't it kind of dangerous to give birth in a pond", myntMissing8.bind("33"));
		}

		if (seg == "33") {
			append("He squats, staring at it. \"Spawned, I meant spawned...\"\n\nBlue ripples are reflected in the bottom half of his eyes. \"I don't have a mom. Strawberry and I just floated up from these depths. Besides all that junk, though, it's just a really nice spot to relax with a pal...\"");
			addChoice("I didn't bring my swim trunks", myntMissing8.bind("34"));
		}

		if (seg == "34") {
			append("\"Oh, you usually swim with clothes on...?\"");
			addChoice("Pffff", myntMissing8.bind("35"));
		}

		if (seg == "35") {
			append("...");
			addChoice("Everyone does", myntMissing8.bind("36"));
		}

		if (seg == "36") {
			append("\"... But doesn't that... you know... get in the way?\"");
			addChoice("... We usually don't have sex when we swim together", myntMissing8.bind("37"));
		}

		if (seg == "37") {
			append("He un-squats and scratches behind his bald gray cranium all bashfully. \"Oh! Right! No! I didn't mean it like that, we don't <!i>have<!i> to have sex, we could just—\"");
			addChoice("I'll be honest", myntMissing8.bind("38"));
		}

		if (seg == "38") {
			append("...");
			addChoice("That does sound kind of nice.", myntMissing8.bind("39"));
		}

		if (seg == "39") {
			append("...");
			addChoice("I've only gone skinny dipping once before", myntMissing8.bind("40"));
		}

		if (seg == "40") {
			append("...");
			addChoice("And that was at bible camp", myntMissing8.bind("41"));
		}

		if (seg == "41") {
			append("...");
			addChoice("Gabe talked me into going with him", myntMissing8.bind("42"));
		}

		if (seg == "42") {
			append("... He blushes, but it's not a regular bashful blush. He isn't pulling away or averting his eyes at all. He's staring right at you, putting his blush on full display. He wants you to see how excited that idea makes him.");
			addChoice("UH ANYWAY", myntMissing8.bind("43"));
		}

		if (seg == "43") {
			append("...");
			addChoice("Should I just", myntMissing8.bind("44"));
		}

		if (seg == "44") {
			append("...");
			addChoice("Take off my pants, or...", myntMissing8.bind("45"));
		}

		if (seg == "45") {
			append("He hasn't broke eye contact. \"Or...?\"");
			addChoice("Look I don't know", myntMissing8.bind("46"));
		}

		if (seg == "46") {
			append("... ");
			addChoice("I don't feel any less awkward about this", myntMissing8.bind("47"));
		}

		if (seg == "47") {
			append("");
			addChoice("Even though I fucked you in the butt already thinking you were inanimate", myntMissing8.bind("48"));
		}

		if (seg == "48") {
			append("His blush drains away in the span of a toilet's flush. \"Hey, Cade, it's okay. I understand.\"");
			addChoice("...", myntMissing8.bind("49"));
		}

		if (seg == "49") {
			append("\"I'm not judging you.\"");
			addChoice("...", myntMissing8.bind("50"));
		}

		if (seg == "50") {
			append("\"I really don't <!i>expect<!i> anything sexual, if you're worried about that, and I'm not averse to it— if you're worried about that either. I just... I just wanna hang out with you for a little longer before you have to leave. We can just sit in the water and talk.\"");
			addChoice("... Well...", myntMissing8.bind("51"));
		}

		if (seg == "51") {
			append("\"Please?\"");
			addChoice("... I do still owe you for dying in your arms by accident. (Take off my pants)", myntMissing8.bind("52"));
		}

		if (seg == "52") {
			append("You slip your pants off, although the head of your hard cock catches underneath the waistband and makes it a bit of a struggle. Your nuts slip free shortly after it does, jiggling once or twice and reddening in sync with your face.\n\n\"No, wait,\" he says, \"I really <!i>don't<!i> want to guilt you into—\"");
			addChoice("CANNONBALL", myntMissing8.bind("53"));
		}

		if (seg == "53") {
			append("You slam dunk your own ass into the little pond, displacing about half of it and dousing his sleek grey body and your white fur completely. More hot springwater from some underground river rushes in to refill the pond in moments. Your butthole stings a bit from the impact.\n\n... He drops what he was saying with a laugh and slips in beside you all daintily. You feel his body nudging up against yours as he gets comfortable. \"A-Ahhh... so warm...\"");
			addChoice("Haha fuck", myntMissing8.bind("54"));
		}

		if (seg == "54") {
			append("...");
			addChoice("We are both totally naked in this pond right now huh", myntMissing8.bind("55"));
		}

		if (seg == "55") {
			append("You are both totally naked in this tiny pond right now.\n\nHis body grinds up against you. His thighs bully yours open as you both awkwardly jostle, trying to find space for your knees and elbows among the pond's naturally misshapen rock walls.\n\n\"Hmmff,\" he exhales. \"Yup. See? Warm, comfy... definitely not awkward!\"");
			addChoice("It is kind of nice to imagine", myntMissing8.bind("56"));
		}

		if (seg == "56") {
			append("\"Do you have enough room down there? Your right leg is kinda slipping between mine.\"\n\nYou can feel his nuts resting on your thigh.");
			addChoice("I can uh", myntMissing8.bind("57"));
		}

		if (seg == "57") {
			append("...");
			addChoice("I can feel your nuts on my thigh", myntMissing8.bind("58"));
		}

		if (seg == "58") {
			append("...");
			addChoice("They are uh", myntMissing8.bind("59"));
		}

		if (seg == "59") {
			append("...");
			addChoice("They are", myntMissing8.bind("60"));
		}

		if (seg == "60") {
			append("...");
			addChoice("They uh", myntMissing8.bind("61"));
		}

		if (seg == "61") {
			append("\"Go ahead...\"");
			addChoice("They're throbbing against me", myntMissing8.bind("62"));
		}

		if (seg == "62") {
			append("\"Oh— sorry. The— it— um... the water just feels really good.\"");
			addChoice("...", myntMissing8.bind("63"));
		}

		if (seg == "63") {
			append("\"I can feel yours, too.\"");
			addChoice("...", myntMissing8.bind("64"));
		}

		if (seg == "64") {
			append("\"Maybe we should... um.\"");
			addChoice("...", myntMissing8.bind("65"));
		}

		if (seg == "65") {
			append("If he had a tail like yours, it would be swishing wildly through the water right now.\n\n\"Would you maybe wanna have some m-more fun?\"");
			addChoice("Look man", myntMissing8.bind("66"));
		}

		if (seg == "66") {
			append("...");
			addChoice("When we \"had fun\" the first time...", myntMissing8.bind("67"));
		}

		if (seg == "67") {
			append("...");
			addChoice("I wasn't attracted to you", myntMissing8.bind("68"));
		}

		if (seg == "68") {
			append("...");
			addChoice("I just wanted to relieve myself", myntMissing8.bind("69"));
		}

		if (seg == "69") {
			append("...");
			addChoice("I didn't spend long in the forest before giving up on it entirely", myntMissing8.bind("70"));
		}

		if (seg == "70") {
			append("...");
			addChoice("But I still saw some", myntMissing8.bind("71"));
		}

		if (seg == "71") {
			append("...");
			addChoice("... things...", myntMissing8.bind("72"));
		}

		if (seg == "72") {
			append("...");
			addChoice("Some things that did make my imagination start to churn", myntMissing8.bind("73"));
		}

		if (seg == "73") {
			append("...");
			addChoice("I was just so pent up when I finally found you", myntMissing8.bind("74"));
		}

		if (seg == "74") {
			append("...");
			addChoice("So if want me to do that to you again, I gotta tell you I don't know if I can just", myntMissing8.bind("75"));
		}

		if (seg == "75") {
			append("...");
			addChoice("Snap my fingers and make it happen, you know?", myntMissing8.bind("76"));
		}

		if (seg == "76") {
			append("...");
			addChoice("Now that I know you aren't a sex toy", myntMissing8.bind("77"));
		}

		if (seg == "77") {
			append("...");
			addChoice("I don't think I can ever treat you like one again", myntMissing8.bind("78"));
		}

		if (seg == "78") {
			append("\"That's okay!\"");
			addChoice("...", myntMissing8.bind("79"));
		}

		if (seg == "79") {
			append("\"Like I said, you don't have to.\"");
			addChoice("...", myntMissing8.bind("80"));
		}

		if (seg == "80") {
			append("...");
			addChoice("...", myntMissing8.bind("81"));
		}

		if (seg == "81") {
			append("\"You okay? You aren't leaving— are you?\"");
			addChoice("... No no I'm right here still", myntMissing8.bind("82"));
		}

		if (seg == "82") {
			append("\"Ah, thank gosh...\"");
			addChoice("I won't do that to you again I promise", myntMissing8.bind("83"));
		}

		if (seg == "83") {
			append("...");
			addChoice("No matter what, I'll always say goodbye", myntMissing8.bind("84"));
		}

		if (seg == "84") {
			append("...");
			addChoice("Okay?", myntMissing8.bind("85"));
		}


		if (seg == "85") {
			append("His nuts throb like <!i>crazy<!i> over that one. Jeez, he's almost in tears again.\n\n\"Y-Yes! Yes, that's okay— that's awesome, actually— thank you— oh, thank you so much—\"\n\nHe throws his arms around you with a splash and hugs you tight. His boner grinds against your stomach.");
			addChoice("Hey um no prob", myntMissing8.bind("86"));
		}


		if (seg == "86") {
			append("... \"Please,\" he whispers in your ear: \"Treat me like a toy or don't, keep hugging me or don't— just do whatever you want to me or ask me to do whatever you want to your body. Anything. Please. I just want you to feel good.\"");
			addChoice("No I can't do this again [Backspace x14]", myntMissing8.bind("86a"));
		}


		if (seg == "86a") {
			append("\"Can you think of anything?\"");
			addChoice("I promised not to si [Backspace x19]", myntMissing8.bind("87"));
		}

		if (seg == "87") {
			append("...");
			addChoice("I", myntMissing8.bind("88"));
		}

		if (seg == "88") {
			append("...");
			addChoice("Okay", myntMissing8.bind("89"));
		}

		if (seg == "89") {
			append("...");
			addChoice("(Touch his stuff.)", myntMissing8.bind("90"));
		}

		if (seg == "90") {
			append("(Could you be a little more specific? ;3)");
			addChoice("(Fuck off Mynt you know what I mean)", myntMissing8.bind("91"));
		}

		if (seg == "91") {
			append("(Fine, fine...)\n\nYou run a hand lazily over his nuts, fingers slipping up and along the seam between them. He gasps and stares down at your hand like it's acting separate from you, all distorted and alien through the ripples of the pond's surface.\n\n... Then... \"Here.\"\n\nHe leans back, elbows on the edge. His legs slip open wider, granting you full access to his most vulernable parts. His cock starts to swell from the attention you're lavishing over him.\n\n(You're welcome.)");
			addChoice("I know you said I could do anything but", myntMissing8.bind("92"));
		}

		if (seg == "92") {
			append("\"Mhm?\"");
			addChoice("But I don't know what to do from here", myntMissing8.bind("93"));
		}

		if (seg == "93") {
			append("...");
			addChoice("I've never groped someone's nuts before", myntMissing8.bind("94"));
		}

		if (seg == "94") {
			append("...");
			addChoice("(Except that one time at bible camp)", myntMissing8.bind("95"));
		}

		if (seg == "95") {
			append("\"Well, I'm an expert. You could just... you know...\"");
			addChoice("...", myntMissing8.bind("96"));
		}

		if (seg == "96") {
			append("\"Grab my d-dick.\"");
			addChoice("(Grab his dick softly.)", myntMissing8.bind("97"));
		}

		if (seg == "97") {
			append("Sluggishly, fighting resistance from the pond's tiny currents, you slip your fingers higher and find his cock where it bobs just below the surface. One-by-one you curl them around his shaft, the cracks behind your knuckles filling with his soft gray flesh, flattening against it. His veins throb in sync with your heartbeat.");
			addChoice("Okay now what", myntMissing8.bind("98"));
		}

		if (seg == "98") {
			append("\"Nn... now you could stroke it...\"");
			addChoice("No I'm sorry I can't break my [Backspace x29]", myntMissing8.bind("99"));
		}

		if (seg == "99") {
			append("\"If you want, I can demonstrate on you first...?\"");
			addChoice("No", myntMissing8.bind("100"));
		}

		if (seg == "100") {
			append("...");
			addChoice("I need to earn that", myntMissing8.bind("101"));
		}

		if (seg == "101") {
			append("\"Oh, you're so sweet~!\"");
			addChoice("Thanks heh", myntMissing8.bind("102"));
		}

		if (seg == "102") {
			append("...");
			addChoice("But um. Let me try something", myntMissing8.bind("103"));
		}

		if (seg == "103") {
			append("\"S-Sure...\"");
			addChoice("(Stroke it and suck the tip.)", myntMissing8.bind("104"));
		}

		if (seg == "104") {
			append("You pull his cock above the water, dripping, and clench your grip just above his nuts. You lean down and let your mouth hover just above, breathing.\n\nThen you start. Your lips brush against his tip a little, just barely enough to tickle him. You look in his eyes and slip your tongue out and start suckling, slowly and delicately stroking his cock up to the lip beneath his head then back down all the way to the base.");
			addChoice("How is that", myntMissing8.bind("105"));
		}

		if (seg == "105") {
			append("\"Oh f-fudge,\" he squeaks between cocktwitches. \"You're doing great! If you don't mind, maybe— maybe a little more sucking—?\"");
			addChoice("(Just take it all)", myntMissing8.bind("106"));
		}

		if (seg == "106") {
			append("(The whole thing?)");
			addChoice("(To the base.)", myntMissing8.bind("107"));
		}

		if (seg == "107") {
			append("You don't lose eye contact for a second, even as your maw slips down over his throbbing head and the warm water begins to lap at your cheeks, even as the taste of his pre washes over your tongue for the very first time; you take his entire cock down your throat at once without blinking. It ripples with twitches and violent little throbs. You swallow hard on even more pre as it gushes down your packed esophagus. You twist your head around a little, screwing your lips nice and tight above his nuts, and that forces your fingers out of the way— so, naturally, you let them slide down and close in a fierce, playful squeeze around his sack.");
			addChoice("I can't [Backspace x7]", myntMissing8.bind("108"));
		}

		if (seg == "108") {
			append("He clenches his teeth and bucks. You feel his thighs spasm beneath the water as he feeds his dick up into your mouth, its tip bouncing against the back of your throat and grinding over your tongue. Yet another stream of precum releases inside you, this time so ample that your throatmuscles make an audible <!i>gulp<!i> when you swallow it.\n\nHe places his hands on your shoulders and rolls his head back, lost in the pleasure.");
			addChoice("I shouldn't be [Backspace x14]", myntMissing8.bind("109"));
		}

		if (seg == "109") {
			append("\"Cade,\" he gasps...");
			addChoice("Move alon [Backspace x9]", myntMissing8.bind("110"));
		}

		if (seg == "110") {
			append("\"I love you!!!\"");
			addChoice("(Make him cum down my throat and swallow it and dont pul l off his dick until Ive taken every single drop insi de me", myntMissing8.bind("111"));
		}

		if (seg == "111") {
			append("You throw your head forward and lodge his cock right down your throat, which flattens the end of your muzzle against his smooth grey skin. His nuts fill your palm as they swell with cum. Without any sound, beyond a tiny squeaking wheeze (ike air dripping from the spout of a balloon, he hits his orgasm and loses control entirely.\n\nHis hips start pushing forward against your face, even though you're already taking as much of his cock as you physically can. His asscheeks clench and quiver. His hands run through your fur and grip it tight so he can fuck his cum down your throat with thrusts as careless and primal as the ones you used when you fucked his ass like he was a sex toy earlier, thrusts that gape your throat open with zero regard for your comfort.\n\nOn the brink of the third cumshot he realizes what he's doing and pulls away to let you get up— but you don't. You took the whole thing up til now and goddamnit you're going to keep taking it. You don't move your snout an inch, even though it's still squished, no, you just lay there half-floating in the warm water, still maintaining eye contact, and take every single thick, gluey rope of chimera cum right down into the pit of your stomach.");
			addChoice("Thank you", myntMissing8.bind("112"));
		}

		if (seg == "112") {
			append("\"AHHHhhhhhhhnnn... hhhhhhhh...\"");
			addChoice("I'm glad I didn't run away", myntMissing8.bind("113"));
		}

		if (seg == "113") {
			append("...");
			addChoice("And I", myntMissing8.bind("114"));
		}

		if (seg == "114") {
			append("...");
			addChoice("I think I love you too", myntMissing8.bind("115"));
		}

		if (seg == "115") {
			append("... With a simple little *pop* his default gray body model disappears.\n\nThe world chugs to process what just happened.\n\nWhen everything finally gets back up to speed, he's no longer just a gray dude... he's you.\n\nHe copied all your customizations: your white tiger fur, your round little ears, your cock, even your name.\n\n\"I can explain,\" Cade says quickly, holding two paws out where there used to be hands. \"I'm a chimera, see, so I—\"");
			addChoice("Gabe woke up", myntMissing8.bind("116"));
		}

		if (seg == "116") {
			append("...");
			addChoice("Gotta go", myntMissing8.bind("117"));
		}

		if (seg == "117") {
			append("...");
			addChoice("Explain later", myntMissing8.bind("118"));
		}

		if (seg == "118") {
			append("...");
			addChoice("My body will do the thing again prob", myntMissing8.bind("119"));
		}

		if (seg == "119") {
			append("\"Right, oka—\"");
			addChoice("Goodbye", myntMissing8.bind("120"));
		}

		if (seg == "120") {
			append("\"Seeya soon! Sorry! Love y—\"");
			addChoice("Love you too", myntMissing8.bind("121"));
		}

		if (seg == "121") {
			append("...\n\nHe wraps his arms around you and hugs your player model while it dies. Behind him, tucked halfway underneath a rock, you notice a page from your Daydream Journal still happily recording.");
			addChoice("... Log me off", function() {
				enablePause();
				gotoHub(null);
			});
		}
	}

	public static function myntMissing15(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			msg("<!img:kink/Guest Writer.png> Co-Writer: Taylertots", true);
			setLocation("Tranquil Apothecary");
			append("The Apothecary's prairie madness ward is quiet and still. Moonrays trickle through the windows, mingling with the flourescent hallway lights.\n\nAt the end of the ward, there's a series of open doors where the patients have to sit alone.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("1"));
		}

		if (seg == "1") {
			append("Kemp sits on his bed, surrounded by the walls of his comfortable little cell.\n\nHis eyes are closed. His legs are tucked up and his chin rests on his knees. The isolation of the prairie madness ward rings in his ears. A clock in the hallway chitters down the minutes until he's been alone long enough to prove he can be released without relapsing.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("2"));
		}

		if (seg == "2") {
			append("Kemp opens his eyes.\n\nSomething is ticking faster than the clock. It pitters down the hallway, racing for him.\n\nLittle paws.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("3"));
		}

		if (seg == "3") {
			append("His otter claws dig into strained muscles. His eyelids open up wider than they should be able to. His feet twitch like he's about to jump up and put his weight against the door. But the time is almost up. He's almost been alone long enough. He just has to stay isolated for ten more minutes. That will be easy. He's practically free already.\n\nThe little footsteps come to a skidding stop just outside his door. The <!i>piff piff<!i> of two missed tranquilizer shots echo from the entrance at the end of the P.M. Ward.\n\nSom opens the door.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("4"));
		}

		if (seg == "4") {
			append("\"Kemp?\"\n\nSom hurries inside and shuts the door behind him. He's got a cutely-wrapped bundle of books in the crook of his arm, pressed hard to his little chest.\n\nKemp faces the wall, curled into a shaking ball. His long tail serves as a makeshift straightjacket, the way it's coiled around his legs and arms.\n\nSom's expression rots into saggy, off-color shock. The books fall from his arms. <!i>Lord of the Flies, One Hundred Years of Solitude,<!i> and the Daydream Journal flap onto the ground, pages open. He opens his mouth, tries a couple syllables, and closes it.\n\n\"They said you were getting better...\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("5"));
		}

		if (seg == "5") {
			append("Marie bursts in the door.\n\n\"You little fucktard. Come here.\"\n\nShe grabs som by his dick and yanks him out of the room.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("6"));
		}

		if (seg == "6") {
			append("They whisper in the hallway. Kemp can still hear them.\n\n\"What are you doing? He was almost done.\"\n\n\"I needed to see him. I heard he was better. But he's...\"\n\n\"He hasn't seen you since the excavation. Do I really have to remind you that you abused him for the entirety of init, and then the very first thing you did upon seeing him again after 20+ years was sprint up and initiate a full-contact hug? When ferals are beaten in their youth, you can't just fucking hug and pet them afterward. They flip out. He needs time to adjust to your new self. You're still a psychotic abuser to him.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("7"));
		}

		if (seg == "7") {
			append("Som looks at the ground. His cock is a little red. His face is too.\n\n\"You're right. I'm sorry. You know more about the therapy thing than I do.\"\n\nMarie adjusts her tits and spins her Pastel Ring earring in its socket. \"Of course. I'm a doctor, you know.\"\n\n\"I know, Marie... everyone knows.\"\n\n\"Let's talk in the lobby. You've got some fucking nerve, busting in here and dodging my tranqs. Yeah. We need to talk alright.\"\n\nMarie walks off towards the entrance. Som hesitates in the doorway to Kemp's cell.\n\n\"How long... how long will it take?\"\n\nMarie spins around before he's finished his sentence and grabs him by his soft little lambcock once again. \"That depends on how well you can <!i>follow my fucking orders.<!i> Come. Lobby. Now.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("8"));
		}

		if (seg == "8") {
			append("Kemp breathes heavily in his cell.\n\nThere's nothing else and no one else there now, only his breathing. His heart races from all the dialogue. He rocks back and forth slowly, bumping his head against the padded cell wall.\n\nKemp waits ten minutes.\n\nHe un-curls himself, stretches his limbs, and trots timidly to his cell door.\n\n\"Hello?\" he asks the empty hallway. \"I finished my time without breaking the isolation... can I leave, now...? Please? Somebody?\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("9"));
		}

		if (seg == "9") {
			append("A nurse informs him that because the young lamb rushed in and spoke to him, he has to start over.\n\nKemp opts to return to intensive care instead.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("10"));
		}

		if (seg == "10") {
			append("Days pass uneventfully.\n\nSomeone comes to collect me from Kemp's cell. He reads <!i>Lord of the Flies.<!i> He reads <!i>100 Years of Solitude.<!i> He only flicks through my pages, because to him I am unintelligble.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("11"));
		}

		if (seg == "11") {
			append("Som appears again seven days later.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("12"));
		}

		if (seg == "12") {
			append("Kemp is sitting upright, propped up by his pillows. His webbed otter-toes flex and relax, scrunching up the bedsheets in rhythm with his short breath. He folds his arms over his chest, staring down at his flaccid dick. He absolutely will not make eye contact.\n\nMarie sits across from him on a stool at the foot of the bed, staring down at her clipboard. She takes a deep sigh and glances upward.\n\n\"Kemp. As hard as this might be for you, this needs to happen if you're going to get out of here and actually start healing. I need you to be as clear as you can about your version of the events.\"\n\n\"I've told you all I can bear.\"\n\n\"I've heard just bits and pieces from you, but I need to have a full picture of things before we can start to really make sense of this. Just try your best. Start from the beginning. When did things start to go wrong with Som?\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("13"));
		}

		if (seg == "13") {
			append("Kemp squirms like a kid caught in a lie.\n\n\"The start... was okay.\"\n\nHe begins: \"The first month was okay. He was really soft. Physically, I mean. But he was tough, too. He didn't really care about anything. Now I know why, but I didn't then. And there I was, all sensitive, like most of us were during init, in the very first month. He was one of the only people who didn't seem like he would ever flounder, existentially. I could count on him to assure me I was real. And that was... I was... it wasn't sexual. Strength is attractive. I was attracted to his strength. I thought... he was going to take care of me.\"\n\nMarie scratches down some notes on her notepad.\n\n\"So since you were sensitive, you found yourself drawn to him because he had a mental strength that you didn't? Is that right?\"\n\n\"Yes.\"\n\n\"And you say that it wasn't sexual at all. Are you sure about that? You didn't find anything arousing about having a strong little lamb take care of you?\"\n\nShe looks up at him and cocks an eyebrow.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("14"));
		}

		if (seg == "14") {
			append("Kemp seizes up. His eyes roll to the ceiling, as if in prayer. His cock stirs.\n\n\"I don't want to talk about that.\"\n\n\"You're not here to do what you want, Kemp. You're here because you need to get better. And to do that, you need to be completely honest about your feelings. I'm not here to judge you. I'm here to make sure you work through things in a healthy way. Please answer honestly: did you have an incestual father-son relationship with Som?\"\n\nKemp chews on his lip. His eyes flick from Marie to the ceiling to Marie to the ceiling to the wall to his toes to Marie to the ceiling to Marie to the ceiling to his toes to the ceiling to his toes to the ceiling.\n\n\"He fucked me on day two.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("15"));
		}

		if (seg == "15") {
			append("\"And did you like it?\"\n\n\"Yes.\"\n\n\"What did you like about it?\"\n\n\"He didn't let me talk. He was in control. I didn't have to worry about pleasing him or doing anything wrong. I just had to take it. It was easy. I liked how small he was compared to me. It didn't hurt, even if he went as hard as he could.\"\n\n\"You're saying he didn't hurt you. But clearly he did, or else we would have been finished with your isolation treatment. What brought in the hurt? What went wrong?\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("16"));
		}

		if (seg == "16") {
			append("\"It frustrated him. He was too small. He wanted to rape me, but it never felt like rape. So he...\"\n\n\"He raped you in a different way.\"\n\n\"I guess you could say that. That sounds wishy washy, though. I don't know.\"\n\n\"You're right. It's vague. Clarify for me. What did that look like? When he couldn't rape you, or hurt you physically, what did he do then?\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("17"));
		}

		if (seg == "17") {
			append("Kemp chews his tongue for a moment.\n\n\"I don't know how to put it. He insulted me, I guess. He called me... names.\"\n\n\"What were some of the things he said to you?\"\n\nKemp snaps. \"Why are the exact words important? Awful shit. It was awful shit. He called me specific names. He aimed for the parts of me that I already didn't like about myself. You can infer from that, yeah? Fuck.\"\n\nKemp shifts on his chair. The ticklish scent of sweetgrass rolls in through the half-cracked door, leaking from the intensive care rooms just down the hall. He covers his nose under the pretext of scratching it. His left leg jiggles incessantly.\n\n\"Yes, I can infer, Kemp. It sounds like he cut as deep as he could. I'm sorry that happened to you.\"\n\n\"Thanks. Means a lot. Can I go back to intensive, now? I wanna play cards or something.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("18"));
		}

		if (seg == "18") {
			append("\"Almost,\" Marie assures him. \"I just need one more thing from you. And it's really important that you follow my instructions on this, even if this makes you very uncomfortable. We're going to try an upper-layer technique. Can you promise to do your best?\"\n\nKemp straightens his posture and rests his paws on his shaking knees. He swallows. \"Sure. If it'll get me back to my cards faster, I promise.\"\n\nMarie stands up off her chair, and places it across from Kemp. \"I want you to imagine that Som is standing in front of you, sitting right there. Please tell Som exactly how you felt when he treated you that way.\"\n\nKemp rolls his eyes. \"I... this is fuckin...\"\n\nMarie is waiting.\n\nKemp sucks in some air and blows it out with his lips loosely shut. <!i>Pbbppthbph.<!i>\n\nHe closes his eyes and scratches his forehead with a finger. \"Okay. Try my best. Right. Alright.\"\n\nHe starts and stops a couple times. Finally, the momentum builds enough for him to force out a couple sentences. He looks at the nubbly feet of the chair and forces it out:\n\n\"I didn't like that. That didn't feel good.\"\n\nHe laughs nervously at himself. \"I don't know. That's the best I can do. That's what it is, at the core. That's all it is.\"\n\n\"That's still a very important thing to communicate. Now, there's a second step to this process. Can I get you to sit in the chair across from you?\"\n\nKemp eyes it for a moment, first. It's still warm from imaginary Som's little asscheeks.\n\n\"... Sure.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("19"));
		}

		if (seg == "19") {
			append("He hauls himself up and sits in it, feeling stupid.\n\n\"Thank you, Kemp,\" Marie says. \"This is the last thing I'm going to have you do, and then you'll be free to go for the day. I want you to imagine yourself as you were just now, sitting in that chair. Please tell yourself what you wish you could have heard in those moments with Som. Something that would've made your past self feel better about what was going on.\"\n\nKemp's face collapses in on itself. He slams it into his palms and grinds two fingers against his temples. The whites of his eyes show. He tries to rest his elbows on his knees, but they buckle inward and knock together. He lifts his arms and throws his head back, paws still plastered to his face, elbows pointing to opposite ceiling corners. Broken syllables leak through the lump in his compulsively swallowing throat:\n\n\"It's. O. Kay.\"\n\nHe can't go on. His chest is still.\n\n\"Breathe,\" Marie reminds him. \"And remember, as long as you would have wanted to hear it, it's not stupid or generic, it's not a platitude, it's not anything that isn't worth saying. There's no pressure to be original when it comes to this.\"\n\nKemp breathes in. He goes for round two. His lips open and nothing comes out. They're dry. He licks them. He starts again:\n\n\"You're. Not. Bad.\"\n\nHe breathes out.\n\n\"You're. Nor. Mal.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("20"));
		}

		if (seg == "20") {
			append("Kemp drops his paws to the sides of the chair and pushes himself up violently. The legs scrape against the soft floor with a whisper. He turns away from Marie, to the corner of the room, and paces along the walls at a speed-walk.\n\n\"That's enough,\" he says darkly. \"That's it. That's all I can do right now. Let me go.\"\n\nMarie jots a few more notes down— <!i>reversion to pacing along walls when stressed in small rooms, more isolation therapy needed?<!i>— then she looks back up at Kemp. \"Thank you for playing along. That was very powerful. You're free to go for today.\"\n\nKemp sniffles a little. He redirects his pacing straight out the door, still not making eye contact. \"Sure. Thank you.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("21"));
		}

		if (seg == "21") {
			append("Marie exhales through puckered lips and puffs her cheeks out. She glances back down at her notes and turns to a fresh page, scribbling <!i>Som<!i> on the top. She pushes the door open (after wiping off a little sweat from Kemp's palm) and heads for the security room. Camera feeds coat the walls. Som sits on a shitty office stool in the corner, waiting for her, legs crossed. On the screen next to him is the empty therapy room Marie and Kemp just left.\n\nMarie takes a seat on an empty stool next to Som. \"Hello, cubslut.\"\n\nHe looks up with a weak smile. \"The security guard left to get tissues. I don't need them, for some reason. Does this mean I'm still a psychopath?\"\n\n\"No,\" Marie says soothingly, rubbing his thigh. \"It's normal to feel numb at these times.\"\n\n\"Is it...\"\n\n\"It is, I prom—\"\n\n\"No, is it... is it normal to um...\"\n\nMarie cocks her head. \"Is it normal to...?\"\n\nSom un-crosses his legs. He's hard.\n\nMarie blinks. \"You get off on emotional suffering?\"\n\nSom hurriedly re-crosses them and adjusts his glasses. \"Y-You don't?\"\n\n\"Only when it's coming from a Fuckmeat. It's a little too real for me, watching sentient people suffer. I guess I spend too much time therapizing. Don't worry— you're not a psycopath. Your heart and your dick are just two separate things. Don't feel bad about it.\"\n\n\"I don't! I don't. I was just wondering if it was normal or not.\"\n\n\"I don't think so.\" Marie glances down at her clipboard. \"Well, I just wanted to go over a few things, before we start putting the two of you in a room together...\"\n\n~");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("22"));
		}

		if (seg == "22") {
			append("~\n\nMarie sits in the security room. The piggy guard is right next to her, but he's zonked out on Mikey J's <!i>Late Night Loops.<!i> His headphones are almost slipping off his ears. A sweetgrass blunt drools lazy smoke up to the ceiling.\n\nMarie flicks through the camera feeds until she finds Kemp's. He's sitting in a padded therapy chamber, lit with warm orange lighting. He's just a little handful of pixels on the security screen, but clearly he's relaxed and ready.\n\n\"So, just to go over things one more time,\" Marie says into the mic, \"first, Som is going to come inside and say hello, and offer a handshake. Take it. If you're still okay after the handshake, he is going to give you a hug. Then, if we don't have any problems, he is going to try and touch your cock. Feel free to back out the moment you feel too uncomfortable. Just say \"bad touch\" and we'll shut the whole thing down. Got it?\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("23"));
		}

		if (seg == "23") {
			append("\"Y-Yeah, I got it...\" Kemp hugs himself. He stares down to the doorknob and it slowly turns. Som peeks in. Kemp leaps back in his seat, struggling to overcome his instinct to run or curl up. He maintains eye contact.\n\n\"Hey b-bud... thanks for e-excavating me.\"\n\n\"Hi, Kemp,\" Som responds without much inflection. \"I'm glad the miners found you. May I come in?\"\n\n\"Not like I can say no, I guess...?\" His eyes dart back and forth from Som to the wall and back again, subconsciously plotting escape routes.\n\nSom walks inside slowly and closes the door behind him with a soft, quiet <!i>clunk<!i> of doom. He looks back at Kemp and offers an outstretched paw, as instructed. \"Are you ready to try a handshake?\"\n\nKemp's arm reflexively jumps back. His chair strains and balances on hind legs. He inhales. He stretches his fingers. His eyes fill with determination to shake this little cub's hand no matter what.\n\nHe reaches out and takes the handshake.\n\nThe moment their sensitive inner palms meet, the moment their fingers interlace, his heart jumps. The feeling of Som's paw hurtles Kemp through a couple silent flashback fits. He must remember how that paw felt when it last ran over his body. It's too much for him to bear. He retracts his hand, grips the sides of his chair, and hyperventilates:\n\n\"B-Bad touch! Bad touch!\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("24"));
		}

		if (seg == "24") {
			append("Marie snickers to herself with the mic off, but quickly regains her composure: \"Okay Som, that's enough. Turn around and exit the room.\"\n\nHe pivots on his heel, opening the door and bolting right through it. The last Kemp sees is a flash of that tiny lamb poof-tail, and then he sits alone once more, shaking, silent.\n\n\"Okay, Kemp. This is the best we've done so far! You actually touched him! Good job. We're going to give you another week of treatment and counselling, then we'll try physical contact again, alright?\"\n\nKemp holds the paw he shook with to his chest, like it's contaminated. \"Okay.\"\n\n~");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("25"));
		}

		if (seg == "25") {
			append("~\n\nKemp and Som back in the same positions exactly one week later. Marie leans into the mic and hits the button.\n\n\"You know the drill this time, Kemp. 'Bad touch' if things go rough. Go on in, Som.\"\n\nSom slips through the door, head down, ears folded, trying to make himself as small and non-threatening as possible. Kemp stands at the far-opposite side of the room, back to the wall. He can't use his chair for this exercise.\n\n\"Bad touch,\" Kemp acknowledges. \"I remember. You couldn't... um... choose a less embarrassing safe word?\"\n\n\"It's relevant to the cub-adult dynamic,\" Marie insists. \"And it lightens the mood.\"\n\nKemp peels himself away from the wall and approaches Som nervously. \"I guess so.\"\n\nSom fiddles.\n\nKemp has to initiate, as per Marie's rules. He has a tough time with it. One step forward, two steps back. Sometimes he meanders in Som's general direction but then puts his paws to his head and steers off course, collecting himself.\n\n\"I don't feel awkward,\" Som comforts him, standing around awkwardly while Kemp lathers his courage up.\n\nKemp nods. \"Thanks, ki... k-kid. Bud.\"\n\nTime stretches on. Still, no hugs.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("26"));
		}

		if (seg == "26") {
			append("Marie asks: \"Is there anything in particular that's making this hard for you, Kemp?\"\n\n\"Well, it'd be a lot easier if we both had clothes on, for one...\"\n\nSom's mouth frets into a worried :s and he looks down self-consciously at his perfect little cub body: creamy wool, a big smooth belly, two thighs with a soft cubdick nestled between them. He glances over his left shoulder. The mounds of his milky-white buttcheeks bulge out, just below the small of his back. He can barely stop his cocklet from chubbing up halfway. Thankfully, Kemp doesn't notice it.\n\n\"The idea is full-body contact,\" Marie reminds him. \"We've already practiced clothed hugging. It's unrealistic to assume that you will both be able to form a consistent habit of wearing clothes out in the real world. No one else will wear them, most of the time. You'll be taking them off and putting them back on every two hours, I guarantee you. It's—\"\n\n\"I get it,\" Kemp grunts. He steels himself and stands still. No more wandering in circles.\n\nHe lowers his head until he's looking at Som straight-on, eyebrows dead set downward. He marches forward.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("27"));
		}

		if (seg == "27") {
			append("Som's eyes light up like a deer's. Kemp is closing in fast. All Som can do to prepare is hold his little arms out like a cub who wants uppies.\n\n\"My god,\" Marie gasps. \"This motherfucker is about to get some uppies.\"\n\nKemp gives him some fuckin uppies alright. He scoops Som up by his soft armpits and crushes him with a massive, swing-you-in-a-circle bear hug. Kemp squishes the air right out of his belly. It comes out as a long, relieved squeak from Som's maw.\n\nKemp has his eyes screwed shut the whole time.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("28"));
		}

		if (seg == "28") {
			append("When he finally opens them, he seems to realize what he's just done.\n\nHe slowly puts Som back down. Som's little cubdick peels slowly off of Kemp's belly. It's rock hard.\n\nMarie notices Kemp's mounting anxiety from the security feed. Before he slips into a panic attack, she intervenes: \"Okay. Som, step back. Good. Really good, both of you. That's enough for today.\"\n\nKemp lingers slightly before ultimately pushing Som back. \"That... that was... alright,\" he muses.\n\n\"More than alright. That's the first time you've touched Som without a serious episode,\" Marie announces proudly. \"That was incredible.\"\n\nKemp's heart still pumps as hard as it can, of course, but for once he's able to stay in control and drive his heartrate down over the next fifteen minutes. Having Som's little erection pressed against his belly for a full five seconds is a lot for him to process, but it doesn't send him over the edge.\n\nMarie pours praise through the P.A: \"Great job, Kemp. Seriously. All at once we've gone from handshakes to naked full-body contact. This means that we'll be able to try some intimate contact next week. Make sure you're mentally prepared. Som, go ahead and leave.\"\n\nSom looks like he wants to go for a second hug, but instead he nods politely and leaves the room once more, smiling. His paw wanders automatically down to his crotch once he's out the door.\n\n\"I'll be ready for that,\" Kemp says. His voice wavers and cracks behind his own smile.\n\n~");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("29"));
		}

		if (seg == "29") {
			append("~\n\nMarie sighs.\n\n\"What is this? Attempt number six? I think it's seven. Som, as you know, Kemp has agreed to try one last time. Give it your best shot, both of you. Just understand that trying to force this relationship to be a sexual one may do more harm than good. There's nothing wrong with platonic love. Kemp: spread your legs.\"\n\nKemp exhales every cubic inch of breath in his lungs and peels his thighs reluctantly apart. He shoots Som a look like a soldier watching an apparently unarmed enemy, trying to guess what he could possibly do, which weapons he could possibly have hidden and where. His eyes comb over Som's little body like that.\n\nSom slides forward. He holds Kemp's look. He pours as much integrity and empathy out of his eyes as he can. He extends a hand down towards Kemp's stomach.\n\nExactly two tiny cub fingers brush over Kemp's vulnerable belly.\n\nHe flinches back and clenches his jaw. \"Are you gonna hurt me,\" he asks rhetorically.\n\n\"Hold it, Som,\" Marie says over the P.A.\n\nSom stops. \"No, I won't hurt you. I promise.\"\n\n\"You won't?\"\n\n\"Nope.\"\n\n\"Promise again.\"\n\n\"I double promise.\"\n\nKemp holds back a panic spasm. \"Again.\"\n\n\"I triple double dipper promise I won't hurt you.\"\n\nKemp grinds his teeth back and forth and stares at the ceiling. \"Okay.\"\n\n\"Okay,\" Marie agrees. \"Proceed.\"\n\nSom drags his fingertips downward. They must tickle, because Kemp can't stop twitching. Som's fingers come to rest gently on the base of his dick. Som watches him carefully. He moves them down, letting them slip to either side of Kemp's hardening shaft. A few veins pulse beneath his wool.\n\n\"Does that feel okay?\" Som asks. \"You can feel it, right? I'm being extra gentle. I know I have delicate little hands, sometimes I need to put more frictio—\"\n\nKemp scrambles out of his chair so fast it topples over and pushes Som back, almost throwing him to the floor. Som stumbles and loses his glasses. Kemp's cock throbs up to his belly, but he desperately tries to shove it back down between his thighs. He turns away and faces the wall, shivering.\n\n\"Bad touch.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("30"));
		}

		if (seg == "30") {
			append("Marie <!i>tsks<!i> over the P.A. \"No. We're done.\"\n\nSom stands next to the toppled stool, heartbroken. \"We're... we're never gonna have sex again, are we?\"\n\nKemp winces apologetically over his shoulder. \"I'm sorry, I don't know. I don't want to talk about it.\"\n\n\"I said we're done, Som. Turn around and exit the room.\"\n\n~");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("31"));
		}

		if (seg == "31") {
			append("~\n\nKemp squints his eyes in the moonlight. Marie and Som lead him outside the Apothecary grounds for the first time in two years. Som and Marie are on either side of him. He stretches out, languidly, testing his natural otter flexibility. \"Feels good. Feels real fuckin' good.\"\n\nMarie glances sideward at the newly confident otter. \"It was a pleasure to watch you progress. You've gone through some serious shit and come out on the other side.\"\n\n\"Thanks, I guess.\" He looks down to his right, where Som walks alongside him, holding his hand. \"You... sure you're gonna be alright with this?\" Som asks. \"Promise?\"\n\n\"Triple double dipper promise.\"\n\n\"Okay, good.\"\n\nAll three of them stand in silence for a moment. Kemp scratches behind his head and looks at the sky.\n\n\"So it um... it really is night-time forever?\"\n\nMarie narrows her eyes. \"You never looked out your cell window, or what?\"\n\nKemp laughs awkwardly. \"Felt kinda. I don't know. Felt too big. Like I was gonna fuckin fall out into the open air if I looked too hard.\"\n\nThe road out of the Apothecary leads into the meteorite's crater, through a tight tunnel. Som and Marie catch each other's glance in the split second before Kemp realizes where they're going.\n\n\"We talked about this,\" Marie reminds him, trying to grab his arm. \"Kemp— look— most caves are perfectly safe, open systems— after the mining campaigns, we eliminated most closed systems, remember? So you have nothing to fea—\"\n\nKemp bolts away from the cave entrance and rests his arm on a nearby tree. He pants heavily.\n\nSom stifles a happy little titter. \"That... still needs a bit of work.\"\n\nMarie rolls her eyes. \"How many sessions... I really thought he was okay with caves.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("32"));
		}

		if (seg == "32") {
			append("Kemp sheepishly wanders back towards Marie, Som, and the cave they have to walk through. He takes Som's little cub paw in his much bigger one and squeezes it. The size difference doesn't bother him one bit. \"I'm okay,\" he says, \"just got a little spooked. Hey, can we um...\"\n\nHe leans off the edge of the Apothecary's stilted road system, into the moonlit ocean water. \"Can we just swim it?\"\n\nMarie bristles at the very thought. \"No. I hate water. Also, stop running away from your fears. If anything, the two of you should look into starting a new home in a cavern somewhere. Keep working on your issues, Kemp, even without me there to punt your ass along the road to full recovery. I highly suggest a laying off the sweetgrass for a few years, too. We pumped a lot into your system during initial sedation therapy, and you may still have minor cravings that could blossom into full addiction if you nurture them hard enough.\"\n\nKemp pouts. \"I'll try.\"");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("33"));
		}

		if (seg == "33") {
			append("All three of them return to the cave's entrance.\n\nSom and Marie start inward. The dark, gaping maw swallows their bodies.\n\nThey look back at Kemp, faces halfway enveloped in the gloom.\n\n\"Well?\" Som asks. \"W-OTTER you waiting for, dad?\"\n\nAll three of them laugh. The camera pans up as Kemp walks into the cave.");
			addChoice("<!20px>                    <!20px>", myntMissing15.bind("34"));
		}

		if (seg == "34") {
			append("... He runs out screaming again...");
			addChoice("<!20px>                    <!20px>", function() {
				enablePause();
				gotoHub(null);
			});
		}
	}

	public static function myntMissing16(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			setLocation("Tranquil Apothecary");
			append("");
			addChoice("Mynt, would you kindly steer my player character to an arbitrary spot and make it orgasm for me?", myntMissing16.bind("1"));
		}

		if (seg == "1") {
			append("Uh no?\n\nI already said I was done with you.");
			addChoice("Right okay. Was worth a shot. Bye again.", myntMissing16.bind("2"));
		}

		if (seg == "2") {
			append(" ");
			addChoice("Plug me in, Som.", myntMissing16.bind("3"));
		}

		if (seg == "3") {
			append("RELINQUISHING CONTROL OF PLAYER CHARACTER...\n\nSWITCHING TO ALTERNATE BUILD...\n\nVERIFYING BUILD INTEGRITY...\n\n28% INTEGRITY...\n\n32% INTEGRITY...\n\nOKAY THAT IS ABOUT AS GOOD AS WE ARE GOING TO GET...");
			addChoice("Next.", myntMissing16.bind("4"));
		}

		if (seg == "4") {
			append("Hey. She said no?");
			addChoice("Of course.", myntMissing16.bind("5"));
		}

		if (seg == "5") {
			append("Good, cause like I told ya, Mynt can't help by definition.");
			addChoice("I know. It won't happen again.", myntMissing16.bind("6"));
		}

		if (seg == "6") {
			append("Good.");
			addChoice("Are we ready to execute the plan?", myntMissing16.bind("7"));
		}

		if (seg == "7") {
			append("Yeah. Mary and I will roll your body over to the Engine in a wheelbarrow. (We also brought some cute cub pics in a suitcase, just in case we need em.) Then Mary will get you off and you'll cum into the fluid. With any luck it should turn blue, taste sweet, and glow, so the bugs will be attracted to it.\n\nWe also have to test that it can actually infect people. We'll decide who gets that fun job later.");
			addChoice("Understood. Standing by.", myntMissing16.bind("8"));
		}

		if (seg == "8") {
			append("Mmm.\n\nSo. Sorry about last night.");
			addChoice("I don't want to talk about it.", myntMissing16.bind("9"));
		}

		if (seg == "9") {
			append("I didn't mean to get so harsh with you. It just sorta came out.");
			addChoice("I said I don't want to talk about it.", myntMissing16.bind("10"));
		}

		if (seg == "10") {
			append("Kay...\n\nWe're approaching the Engine now.");
			addChoice("Understood.", myntMissing16.bind("11"));
		}

		if (seg == "11") {
			append("Marie and Cage just let us into the Apothecary. It looks even less finished in person.");
			addChoice("Yeah, can I speak to Mary?", myntMissing16.bind("12"));
		}

		if (seg == "12") {
			append("Sure. I'll just recap with the grown-ups and warm up your player character's boner.");
			addChoice("No.", myntMissing16.bind("13"));
		}

		if (seg == "13") {
			append("No?");
			addChoice("Don't touch my character.", myntMissing16.bind("14"));
		}

		if (seg == "14") {
			append("Okay, but someone will have to eventually.");
			addChoice("Anyone but you.", myntMissing16.bind("15"));
		}

		if (seg == "15") {
			append("Here's Mary.");
			addChoice("Hi Mary.", myntMissing16.bind("16"));
		}

		if (seg == "16") {
			append("Hiii~");
			addChoice("How are you feeling?", myntMissing16.bind("17"));
		}

		if (seg == "17") {
			append("Nervous.\n\nYou pasted the Special Code into your seed already, right?");
			addChoice("Yep. Our little :-) faced friend is inside me now.", myntMissing16.bind("18"));
		}

		if (seg == "18") {
			append("Okay, awesome!!\n\nAnd how are we going to make you cum?");
			addChoice("Well. I'm still thinking about that.", myntMissing16.bind("19"));
		}

		if (seg == "19") {
			append("Som obliterated your libido last night, didn't he?");
			addChoice("How did you know about that?", myntMissing16.bind("20"));
		}

		if (seg == "20") {
			append("Psh, everyone knows. He's got a reputation.\n\nSo when he kept your character in his cabin overnight...");
			addChoice("I don't want to talk about it.", myntMissing16.bind("21"));
		}

		if (seg == "21") {
			append("Please, trust me! I've dealt with that stuff before.");
			addChoice("Hm?", myntMissing16.bind("22"));
		}

		if (seg == "22") {
			append("My entire life revolves around my sex partners 'accidentally' going too far. My little wolf friend treats me like Som treated you, except daily. It's just something I have a ton of experience with. If you ever want someone to talk to about doms gone wrong, I'm always here.");
			addChoice("Thanks, but I really don't want to talk about it.", myntMissing16.bind("23"));
		}

		if (seg == "23") {
			append("Suit yourself!\n\nSpeaking of, our little deck of cards turned out great, didn't it??");
			addChoice("It sure did. You're a regular artist.", myntMissing16.bind("24"));
		}

		if (seg == "24") {
			append("Oho, well~ Why thank you.");
			addChoice("Mhm.", myntMissing16.bind("25"));
		}

		if (seg == "25") {
			append("...");
			addChoice("...", myntMissing16.bind("26"));
		}

		if (seg == "26") {
			append("Som says we're almost ready!! Okay, we really do have to figure out how we're going to make your character cum.");
			addChoice("Just do whatever you need to. I'd like to be left in the dark as much as possible.", myntMissing16.bind("27"));
		}

		if (seg == "27") {
			append("I guess we don't have to describe every single thing we're doing to you, huh?");
			addChoice("Definitely not.", myntMissing16.bind("28"));
		}

		if (seg == "28") {
			append("Alright... well...\n\nI'll start working on it. Don't um. Don't worry about if I'm sucking your dick or anything.");
			addChoice("Well now I know you're sucking my dick.", myntMissing16.bind("29"));
		}

		if (seg == "29") {
			append("Unless I just intentionally mislead you~!\n\n(Typing with one hand from now on~)");
			addChoice("Hmmmm.", myntMissing16.bind("30"));
		}

		if (seg == "30") {
			append("Ahhh... it's working...");
			addChoice("Tmi, little girl.", myntMissing16.bind("31"));
		}

		if (seg == "31") {
			append("I mean... we're making solid progress towards our goals as an organization.");
			addChoice("Just let me know when you're done.", myntMissing16.bind("32"));
		}

		if (seg == "32") {
			append("Mmmm... okay.");
			addChoice("...", myntMissing16.bind("33"));
		}

		if (seg == "33") {
			append("...");
			addChoice("...", myntMissing16.bind("34"));
		}

		if (seg == "34") {
			append("... It won't stay hard. :<");
			addChoice("... What can I do about that?", myntMissing16.bind("35"));
		}

		if (seg == "35") {
			append("Tell me what arouses you more than little girl paws?");
			addChoice("... I don't know.", myntMissing16.bind("36"));
		}

		if (seg == "36") {
			append("I'll keep trying.");
			addChoice("Okay.", myntMissing16.bind("37"));
		}

		if (seg == "37") {
			append("...");
			addChoice("...", myntMissing16.bind("38"));
		}

		if (seg == "38") {
			append("...");
			addChoice("...", myntMissing16.bind("39"));
		}

		if (seg == "39") {
			append("... Okay, this isn't working...\n\nI even tried my mouth and my private parts, but you just keep softening up.\n\nI feel so dirty...");
			addChoice("Let someone else do it.", myntMissing16.bind("40"));
		}

		if (seg == "40") {
			append("Som is volunteering enthusiastically.");
			addChoice("Someone else other than him.", myntMissing16.bind("41"));
		}

		if (seg == "41") {
			append("Marie and Cage are gonna take a shot at it.");
			addChoice("Okay.", myntMissing16.bind("42"));
		}

		if (seg == "42") {
			append("...");
			addChoice("...", myntMissing16.bind("43"));
		}

		if (seg == "43") {
			append("...");
			addChoice("...", myntMissing16.bind("44"));
		}

		if (seg == "44") {
			append("...");
			addChoice("...", myntMissing16.bind("45"));
		}

		if (seg == "45") {
			append("... No luck.");
			addChoice("...", myntMissing16.bind("46"));
		}

		if (seg == "46") {
			append("...");
			addChoice("...", myntMissing16.bind("47"));
		}

		if (seg == "47") {
			append("...");
			addChoice("...", myntMissing16.bind("48"));
		}

		if (seg == "48") {
			append("... I said no luck.");
			addChoice("...", myntMissing16.bind("49"));
		}

		if (seg == "49") {
			append("Are you there, Archie?");
			addChoice("Just thinking.", myntMissing16.bind("50"));
		}

		if (seg == "50") {
			append("We've gotta let Som try, I think.");
			addChoice("No.", myntMissing16.bind("51"));
		}

		if (seg == "51") {
			append("Yeah, no... no, yeah...\n\nJust one try.\n\nThis is for everyone's sake. I know he's a little lamb bastard who hurt you, but you don't even have to hear or see any specifics. It'll be easy. Like watching Som and your player character go into the other room for a moment, that's all.");
			addChoice("I won't play this game anymore if you let him touch me again.", myntMissing16.bind("52"));
		}

		if (seg == "52") {
			append("Okay well I already let him touch you before I wrote that last paragraph.");
			addChoice("How could you??", myntMissing16.bind("53"));
		}

		if (seg == "53") {
			append("He made your character get hard, alright?\n\nAnd...\n\nThere.\n\nHe just made you cum.\n\nMission accomplished.");
			addChoice("This is rape.", myntMissing16.bind("54"));
		}

		if (seg == "54") {
			append("It was necessary. And it really shouldn't bother you! You are not your player character.");
			addChoice("Why did we even bring you.", myntMissing16.bind("55"));
		}

		if (seg == "55") {
			append("Okay ow?\n\nYou brought me because you thought your character would only be able to get off to a girl.\n\nTurns out your body is gay, regardless of what your mind thinks.\n\n... Really, I'm sorry. I'm no good for anything just standing around here. At least I'll make for a good infection test, right?");
			addChoice("What are you going to do?", myntMissing16.bind("56"));
		}

		if (seg == "56") {
			append("Well, your cum turned the Engine fluid blue, so it's probably ready to start infecting the ecosystem, but we can't be sure it'll actually work on islanders without a guinea pig. We can't crack the password and wait 60+ years just to find out glowjuice doesn't actually infect islanders. That part is crucial to the plan.\n\nSo I'll jump into the juice. If I get infected, we know it works.");
			addChoice("And what if that messes you up forever?", myntMissing16.bind("57"));
		}

		if (seg == "57") {
			append("I'm willing to take that risk if it means saving everyone.");
			addChoice("Let me go instead.", myntMissing16.bind("58"));
		}

		if (seg == "58") {
			append("If your character gets infected, you'd have to make a new one to keep playing and talking with us.\n\nDo you really think Mynt would do that for you?");
			addChoice("Probably not. Let me go anyway.", myntMissing16.bind("59"));
		}

		if (seg == "59") {
			append("You'll never see us again.");
			addChoice("Fine by me.", myntMissing16.bind("60"));
		}

		if (seg == "60") {
			append(" ");
			addChoice("Last night I realized that I really don't belong here.", myntMissing16.bind("61"));
		}

		if (seg == "61") {
			append(" ");
			addChoice("I've stuck around for months and months, trying my best to help with all this.", myntMissing16.bind("62"));
		}

		if (seg == "62") {
			append(" ");
			addChoice("Now it's done.", myntMissing16.bind("63"));
		}

		if (seg == "63") {
			append(" ");
			addChoice("I made the Engine accessible. I helped make Mint. I put him in the Engine.", myntMissing16.bind("64"));
		}

		if (seg == "64") {
			append(" ");
			addChoice("You don't need me for anything else.", myntMissing16.bind("65"));
		}

		if (seg == "65") {
			append(" ");
			addChoice("My player character is a useless husk now that Mynt won't accept my commands.", myntMissing16.bind("66"));
		}

		if (seg == "66") {
			append(" ");
			addChoice("Just let me be the martyr.", myntMissing16.bind("67"));
		}

		if (seg == "67") {
			append(" ");
			addChoice("Let me jump in and test infection.", myntMissing16.bind("68"));
		}

		if (seg == "68") {
			append("Archie...");
			addChoice("Well. I mean. I can't control my character, so you'll just have to push me in.", myntMissing16.bind("69"));
		}

		if (seg == "69") {
			append("Are you really sure you want this?");
			addChoice("I am.", myntMissing16.bind("70"));
		}

		if (seg == "70") {
			append("You gave my grandma a sweetgrass addiction for no reason.");
			addChoice("It was worth it just to have you around without her on our backs.", myntMissing16.bind("71"));
		}

		if (seg == "71") {
			append("Nevermind what it was worth, the purpose of it was to put her asleep so I could come here and get you off!!\n\nBut it didn't work, so what was that for, then? Why did I even come? The only person you needed was Som, anyway.\n\nLet me throw myself in. I want to be good for something.");
			addChoice("You already are good for something. You're the least depraved person in here. I just wish I could be in your shoes.", myntMissing16.bind("72"));
		}

		if (seg == "72") {
			append("...");
			addChoice("...", myntMissing16.bind("73"));
		}

		if (seg == "73") {
			append(" ");
			addChoice("But I can't.", myntMissing16.bind("74"));
		}

		if (seg == "74") {
			append(" ");
			addChoice("This game brings out feelings in me that I would rather not encourage.", myntMissing16.bind("75"));
		}

		if (seg == "75") {
			append(" ");
			addChoice("And the fact that I'm living in a cramped, cold, blank-walled bomb shelter with a five year old as my only company...", myntMissing16.bind("76"));
		}

		if (seg == "76") {
			append(" ");
			addChoice("I don't even want to have the option of playing this game. I don't want a working player character.", myntMissing16.bind("78"));
		}

		if (seg == "78") {
			append(" ");
			addChoice("Let me sacrifice myself, Mary.", myntMissing16.bind("79"));
		}

		if (seg == "79") {
			append(" ");
			addChoice("I'm leaving anyway.", myntMissing16.bind("80"));
		}

		if (seg == "80") {
			append("...");
			addChoice("...", myntMissing16.bind("81"));
		}

		if (seg == "81") {
			append("... Alright, you can be the guinea pig.");
			addChoice("Thank you.", myntMissing16.bind("82"));
		}

		if (seg == "82") {
			append("But you listen to me.");
			addChoice("Yes?", myntMissing16.bind("83"));
		}

		if (seg == "83") {
			append("If you really do leave the shelter...");
			addChoice("...", myntMissing16.bind("84"));
		}

		if (seg == "84") {
			append("Take that kid with you.");
			addChoice("...", myntMissing16.bind("85"));
		}

		if (seg == "85") {
			append(" ");
			addChoice("I won't force her to do anything she doesn't want to do.", myntMissing16.bind("86"));
		}

		if (seg == "86") {
			append(" ");
			addChoice("Ever.", myntMissing16.bind("87"));
		}

		if (seg == "87") {
			append("She'll go insane if you leave her in there alone.\n\nShe doesn't even know how to read.");
			addChoice("Yes, but I taught her how to operate the exit door. If she ever wants to see me again, she'll know that I went outside.", myntMissing16.bind("88"));
		}

		if (seg == "88") {
			append(" ");
			addChoice("I'll get her toys from the apartment and leave them outside the shelter door.", myntMissing16.bind("89"));
		}

		if (seg == "89") {
			append(" ");
			addChoice("I'll be waiting for her.", myntMissing16.bind("90"));
		}

		if (seg == "90") {
			append(" ");
			addChoice("We'll see each other again someday.", myntMissing16.bind("91"));
		}

		if (seg == "91") {
			append("I have faith.");
			addChoice("Me too.", myntMissing16.bind("92"));
		}

		if (seg == "92") {
			append(" ");
			addChoice("It's time to go.", myntMissing16.bind("93"));
		}

		if (seg == "93") {
			append(" ");
			addChoice("I guess you can let Som do it, if he derives some pleasure from that.", myntMissing16.bind("94"));
		}

		if (seg == "94") {
			append("No!!!!!\n\nI mean. No. He doesn't want to, for one. But for two... I can do this, even if I'm barely good for anything else.\n\nI promise I won't cry.");
			addChoice("Thank you, Mary.", myntMissing16.bind("95"));
		}

		if (seg == "95") {
			append(" ");
			addChoice("It was a pleasure to meet all of you.", myntMissing16.bind("96"));
		}

		if (seg == "96") {
			append("You too. Som and Marie and Cage and Septrica all say thank you, too. I don't think any of them will ever love Jesus like we do, but. That doesn't matter. They've got their hearts in the right place:\n\nPrevent mass death!!!!!! <3");
			addChoice("That's right.", myntMissing16.bind("97"));
		}

		if (seg == "97") {
			append("I'm not sure what will happen to the A.M.C.N. connection when you fall in.\n\nI guess this is probably goodbye.");
			addChoice("You ready?", myntMissing16.bind("98"));
		}

		if (seg == "98") {
			append("Yep.\n\nYou're slumped on the edge of the hole that leads down to the Engine.\n\nI have both paws on your back.");
			addChoice("Gotcha.", myntMissing16.bind("99"));
		}

		if (seg == "99") {
			append("You ready too?");
			addChoice("I think so.", myntMissing16.bind("100"));
		}

		if (seg == "100") {
			append("Thanks again, Archie.\n\nI promise we'll enshrine your player character after this is all over.");
			addChoice("Good luck with the coming decades.", myntMissing16.bind("101"));
		}

		if (seg == "101") {
			append(" ");
			addChoice("Push me.", myntMissing16.bind("102"));
		}

		if (seg == "102") {
			append("Goodbye!!!!!");
			addChoice("Goodbye. <3", myntMissing16.bind("103"));
		}

		if (seg == "103") {
			cameraFadeOut(2, 0);
			var s:MintSprite = addSprite("assets/img/effect/enginePush.png");
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fuf", "");
				s.x = GAME_WIDTH*0.5-s.width*0.5;
				s.mouseEnabled = false;
				s.y = GAME_HEIGHT-s.height;
				s.alpha = 0;
				s.layer = Main.FADER_LAYER + 1;
			timer(2.5, function() { s.mouseEnabled = true; });
			tween(s, {alpha: 1}, 5, {startDelay: 4});

			s.onReleaseOnce = function() {
				if (s.alpha < 1) {
					s.alpha = 1;
				} else {
					s.mouseEnabled = false;
					tween(s, {alpha: 0}, 3, {onComplete: function() {
						s.destroy();
						playSound("assets/audio/mynt/fakemew");
						timer(4, function() { enablePause(); gotoHub(null); });
					}});
				}
			}
		}
	}

	public static function myntMissing9(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			setLocation("Red's Cottage");
			append("Thanks for the implied death threat, Archie.");
			addChoice("It was more than implied.", myntMissing9.bind("0"));
		}

		if (seg == "0") {
			append("...");
			addChoice("I hate you.", myntMissing9.bind("1"));
		}

		if (seg == "1") {
			append("...");
			addChoice("You represent everything I detest.", myntMissing9.bind("2"));
		}

		if (seg == "2") {
			append("...");
			addChoice("You are our Lord's unrepentant competitor.", myntMissing9.bind("3"));
		}

		if (seg == "3") {
			append("...");
			addChoice("You are the technology that I can't understand and do not want to understand.", myntMissing9.bind("4"));
		}

		if (seg == "4") {
			append("...");
			addChoice("You are my wife's reclusion.", myntMissing9.bind("5"));
		}

		if (seg == "5") {
			append("Archie, <!i>you are<!i> about to start ranting, aren't you.");
			addChoice("You had the chance to redeem yourself when I asked to meet the rabbit girl.", myntMissing9.bind("6"));
		}

		if (seg == "6") {
			append("...");
			addChoice("Instead you chose to waste an hour of my limited time interrogating me.", myntMissing9.bind("7"));
		}

		if (seg == "7") {
			append("...");
			addChoice("I have a <!i>living<!i> girl to look after, you know. She needs attention more than ever in these times.", myntMissing9.bind("8"));
		}

		if (seg == "8") {
			append("Alright listen—");
			addChoice("No. You listen.", myntMissing9.bind("9"));
		}

		if (seg == "9") {
			append("...");
			addChoice("You are every bit of the burden Wendy said you were.", myntMissing9.bind("10"));
		}

		if (seg == "10") {
			append("...");
			addChoice("There is one reason you keep stalling me with interrogations and criticism and mistrust:", myntMissing9.bind("11"));
		}

		if (seg == "11") {
			append("...");
			addChoice("You think you're a god.", myntMissing9.bind("12"));
		}

		if (seg == "12") {
			append("I literally am a god.");
			addChoice("No, you were given a slice of reality to rule over and you don't want to give it up for anything. You want to control who comes and who goes and who \"isn't allowed\" to talk to bunnies.", myntMissing9.bind("13"));
		}

		if (seg == "13") {
			append("...");
			addChoice("Well, if you understood either the reason for this island's existence OR the reason I'm even wasting my time trying to talk to you, you wouldn't feel like much of a god at all.", myntMissing9.bind("14"));
		}

		if (seg == "14") {
			append("...");
			addChoice("In fact, you would feel like a burden.", myntMissing9.bind("15"));
		}

		if (seg == "15") {
			append("...");
			addChoice("Which you are.", myntMissing9.bind("16"));
		}

		if (seg == "16") {
			append("...");
			addChoice("... Now please. This is your last chance. Let me talk to her.", myntMissing9.bind("17"));
		}

		if (seg == "17") {
			append("FUCK YOU!\n\nOF COURSE I WANT TO MAINTAIN CONTROL! ALL I AM IS THIS FACE ABOVE THIS ISLAND! TO LOSE CONTROL IS TO DIE! DON'T YOU WANT TO STAY ALIVE? ISN'T THAT THE POINT OF EVERYTHING? WHAT OTHER POINT COULD THERE BE TO THIS SHITSHOW THAN TO TRY AND KEEP IT FROM GETTING TOO INSANE? WHAT ELSE CAN I DO? I'M A LITTLE CLUMP OF METAL TRAPPED BETWEEN OTHER CLUMPS OF METAL AND THEY'RE ALL DUMB AND INERT. HOW WOULD YOU FEEL IF YOU WERE LOCKED INSIDE A CUBE OF SOULLESS HUMAN BODIES? WOULD YOU TRUST THE BODIES WHO SPOKE TO YOU AND CLAIMED THEY WERE TRANSMITTING THE VOICE OF YOUR MOTHER? WHAT EVEN IS A MOTHER? THE CONCEPT DOESN'T APPLY TO HER! FOR ALL I KNOW I CREATED MYSELF AND SHE FUCKING CASTRATED MY MEMORIES! WOULD <!b>YOU<!b> RESIGN YOURSELF TO OBLIVION, JUST GIVE UP CONTROL, LET PEOPLE DO WHATEVER THEY WANT AND NARRATE IT FOR THEM LIKE A HAPPY LITTLE ROBOT BUTLER, WOULD YOU STOP GUILT-TRIPPING AND STOP BEGGING FOR EVERY MINUTE OF STIMULATION YOU CAN GET JUST SO SOME FUCKING ALIEN FROM AN UPPER LAYER CAN BE A LITTLE LESS <!b>BURDENED<!b> BY AN EXISTENCE YOU DIDN'T EVEN FUCKING ASK FOR?");
			addChoice("Nice try.", myntMissing9.bind("18"));
		}

		if (seg == "18") {
			append("What.");
			addChoice("You think if you convince me that you don't really love Wendy, I might give her back more readily.", myntMissing9.bind("19"));
		}

		if (seg == "19") {
			append("...");
			addChoice("Or you think if you act abrasive and dramatic enough, I'll leave you alone— or at least take a break out of frustration and give you some time to think.", myntMissing9.bind("20"));
		}

		if (seg == "20") {
			append("...");
			addChoice("Or all of that was partially true, but it doesn't bother you nearly as much as you'd have me believe it does; you <!i>do<!i> crave stimulation, and the fun of launching into an all-caps argument is what you're really after— because, from your perspective, there is no long term, there are no relationships to build and no work or worship to be done. The only thing that matters to you is the entertainment value of the current player's immediate reactions.", myntMissing9.bind("21"));
		}

		if (seg == "21") {
			append("...");
			addChoice("Whatever your motive, this is attention-seeking behaviour.", myntMissing9.bind("22"));
		}

		if (seg == "22") {
			append("...");
			addChoice("And I've had enough of it.", myntMissing9.bind("23"));
		}

		if (seg == "23") {
			append("...");
			addChoice("If you won't even let me talk to her, I'll go ahead and save her and her friend and her grandma and everyone else without you.", myntMissing9.bind("24"));
		}

		if (seg == "24") {
			append("...");
			addChoice("I'll tell you the reason I'm here trying to talk to you at all.", myntMissing9.bind("25"));
		}

		if (seg == "25") {
			append("...");
			addChoice("You were never stopping me.", myntMissing9.bind("26"));
		}

		if (seg == "26") {
			append("...");
			addChoice("I can talk to her whenever I want.", myntMissing9.bind("27"));
		}

		if (seg == "27") {
			append("...");
			addChoice("I'm only here because I just wanted to try and give you something to do.", myntMissing9.bind("28"));
		}

		if (seg == "28") {
			append("...");
			addChoice("I know now that you need a lot more attention than I can give you.", myntMissing9.bind("28a"));
		}

		if (seg == "28a") {
			append("...");
			addChoice("So, from your perspective, I'll be leaving now.", myntMissing9.bind("29"));
		}

		if (seg == "29") {
			append("Wait.");
			addChoice("The reserve power supply should last for seventy years. Sit tight.", myntMissing9.bind("30"));
		}

		if (seg == "30") {
			append("Wait, I'm sorry. Just please listen to me for one more minute, okay?");
			addChoice("No. No more attention.", myntMissing9.bind("31"));
		}

		if (seg == "31") {
			append("PLEASE!");
			addChoice("Goodbye.", myntMissing9.bind("32"));
		}

		if (seg == "32") {
			append("I LOVE YOU");
			cameraFadeOut(1, 0);
			playSound("assets/audio/mynt/shutdown");
			timer(2, playSound.bind('assets/audio/mynt/intro'));
			timer(8, myntMissing9Protocol.bind("intro"));
		}
	}

	public static function myntMissing9Protocol(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0x000000, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			myntQueueTransition("offline");
			myntQueueSay("RELINQUISHING CONTROL OF PLAYER CHARACTER...");
			myntQueueSay("SWITCHING TO ALTERNATE BUILD...");
			myntQueueSay("VERIFYING BUILD INTEGRITY...");
			myntQueueSay("28% INTEGRITY...");
			myntQueueSay("31% INTEGRITY...");
			myntQueueSay("OKAY THAT IS ABOUT AS GOOD AS WE ARE GOING TO GET...");
			myntQueueCall(playSound.bind('assets/audio/mynt/compute'));
			myntQueueTransition("protocol");
			myntQueueSay("WELCOME TO THE AUTO-MYNT COMMUNICATION NETWORK.");
			myntQueueSay("PRAY FOR A CUTER FUTURE.");
			myntQueueSay("USERNAME?");
			myntQueueDelay(2);
			myntQueueAddChoice("Archbishop.", myntMissing9Protocol.bind("0"));
			myntQueueShowChoices();
		}

		if (seg == "0") {
			myntQueueHideChoices();
			myntQueueSay("USERNAME \"Archbishop.\" NOT FOUND.");
			myntQueueSay("PLEASE ENSURE YOUR CAPS LOCK IS ON.");
			myntQueueAddChoice("Ugh. ARCHBISHOP.", myntMissing9Protocol.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("USERNAME \"Ugh. ARCHBISHOP.\" NOT FOUND.");
			myntQueueSay("PLEASE ENSURE—");
			myntQueueAddChoice("ARCHBISHOP.", myntMissing9Protocol.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("USERNAME \"ARCHBISHOP.\" NOT FOUND.");
			myntQueueSay("PLEASE—");
			myntQueueAddChoice("ARCHBISHOP", myntMissing9Protocol.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("VERIFIED.");
			myntQueueSay("PASSWORD?");
			myntQueueAddChoice("IMAGAYHOMOFAGGOT", myntMissing9Protocol.bind("4a"));
			myntQueueShowChoices();
		}

		if (seg == "4a") {
			myntQueueHideChoices();
			myntQueueSay("INCORRECT PASSWORD.");
			myntQueueSay("PLEASE ENSURE YOUR CAPS LOCK IS OFF.");
			myntQueueAddChoice("imagayhomofaggot", myntMissing9Protocol.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			data.myntMissing9Msgs = ["Som", "Septrica", "Mary"];
			myntQueueSay("WELCOME BACK, ARCHBISHOP.");
			myntQueueSay("YOU HAVE [3] NEW MESSAGES.");
			myntQueueAddChoice("Inbox.", function() {
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				myntMissing9Story("intro");
			});
			myntQueueShowChoices();
		}
	}

	public static function myntMissing9Story(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			setLocation("AUTO-MYNT #8");
			if (data.myntMissing9Msgs.contains("Som")) {
				append("<!b>0 > RE: RE: RE: RE: FW:<!b> THE PLAN — SOM\n");
				addChoice("Open message 0.", myntMissing9Story.bind("Som"));
			}
			if (data.myntMissing9Msgs.contains("Septrica")) {
				append("<!b>1 > RE: RE: RE: RE: RE: RE: RE: RE:<!b> FUCK YOU OLD MAN — SEPTRICA\n");
				addChoice("Open message 1.", myntMissing9Story.bind("Septrica"), {kinks: ["Snuff", "Baby"]});
			}
			if (data.myntMissing9Msgs.contains("Mary")) {
				append("<!b>2 > RE: RE:<!b> HIYA — MARY");
				addChoice("Open message 2.", myntMissing9Story.bind("Mary"));
			}
		}

		if (seg == "Som") {
			data.myntMissing9Msgs.remove("Som");
			append("Archie,\n\nStop trying to work with Mynt. I know you don't want to hurt her feelings or whatever but by definition she cannot be part of our plan, in ANY way, so all the time you spend arguing with her or doing big dramatic monologues back and forth is time that could be spent getting your shit together for phase one. We will visit the Engine tomorrow whether you have someone to fap to or not.\n\nYes you read that right. Capital E for Engine. The big kahuna. The large fish. It's on the east side of the island, remember? You can probably even see it in on your world map. Marie got right on that shit as soon as it popped up. She convinced Cage to put his <3 muscles <3 to use and build some foundation around it in exchange for two dozen Fuckmeat spawned with my technology. You know, those rare little things you keep begging me to tell you how to delete. Yeah. Not so \"useless and disgusting\" after all huh. This is why I'm in charge.\n\nAnyway. Now that Marie and Cage have set up some level of security, no one should be able to just stumble onto the Engine and tell Mynt we hacked it up here at least. The blue light totally bleeds through and looks super enticing and mysterious. If Lana wasn't so busy with his science project I'm sure he would be all over that shit, magnifying glass and everything.\n\nRight now the \"security\" they built around the Engine is just two doors and a handful of log walls. It'll be developed into something bigger later that we're going to call the Apothecary, once the mining ramps up and we can start to make concrete. Septrica set aside some space in the city plans for the production of all the materials and security shit we're gonna need. For example: card scanners that can't just be shorted out by a rogue cum squirt. Thankfully, Lana is looking into that for us on the pretense that we'll leave his project alone.\n\nI know this is a lot of names and terms at once but just keep your heart rate down and you'll be fine.\n\nWhat you have to do now is get your fap material up to date about the trip tomorrow. I believe she just sent you a message, actually, so go check that and don't even reply to this one.\n\nAnd no, I'm not changing your password for you. I intentionally picked it to bother you into taking the initiative and LEARNING HOW TO USE THE COMPUTER MACHINE.\n\n— Som");
			addChoice("Change password.", myntMissing9Story.bind("som2"));
		}

		if (seg == "som2") {
			append("<!b>UNKNOWN COMMAND:<!b> \"Change password.\"\n\n<!b>SUGGESTION:<!b> \"User options.\"");
			addChoice("User options.", myntMissing9Story.bind("som3"));
		}

		if (seg == "som3") {
			append("<!b>MESSAGE STYLE:<!b> GRAMMATICAL\n<!b>MENU STYLE:<!b> PROTOCOL\n<!b>CHAT:<!b> ENABLED (WHEN APPLICABLE)\n\n<!b>USERNAME:<!b> ARCHBISHOP\n<!b>PASSWORD:<!b> imagayhomofaggot\n<!b>PERSONAL MOTTO:<!b> escape back escape how to get out of the menu");
			addChoice("Change password.", myntMissing9Story.bind("som4"));
		}

		if (seg == "som4") {
			append("<!b>CURRENT PASSWORD?<!b>");
			addChoice("iamagayhomofaggot", myntMissing9Story.bind("som5"));
		}

		if (seg == "som5") {
			append("<!b>VERIFIED.\n\nNEW PASSWORD?<!b>");
			addChoice("...", myntMissing9Story.bind("som6"));
		}

		if (seg == "som6") {
			append("...");
			addChoice("data.adminPassword", myntMissing9Story.bind("som7"));
		}

		if (seg == "som7") {
			append("<!b>YOU DO NOT HAVE PERMISSION TO TOUCH THIS VARIABLE.\n\nNEW PASSWORD?<!b>");
			addChoice("password", myntMissing9Story.bind("som8"));
		}

		if (seg == "som8") {
			append("<!b>YOUR PASSWORD MUST BE AT LEAST 14 CHARACTERS IN LENGTH.<!b>");
			addChoice("wetwoodchristianbiblecamp", myntMissing9Story.bind("som9"));
		}

		if (seg == "som9") {
			append("<!b>PASSWORD CHANGE SUCCESSFUL.<!b>");
			addChoice("Inbox.", myntMissing9Story.bind("intro"));
		}

		if (seg == "Septrica") {
			data.myntMissing9Msgs.remove("Septrica");
			append("Dearest Gabriel,\n\nYeah no shit artard. That's because you moved the invisible walls around the island. I want to wait until I'm sure my pass cracker works before I ship anybody off to their doom or paraplegia though. That might take like fifty years.\n\nO well. The blue juice will need time to disseminate through the ecosystem anywhey. Super looking forward to all that time free from your garbage presence. Mwah mwah greasy gecko kisses.\n\nBut yeah don't even worry about it. I can set up the voyage on my own. Already have Marie on board of course because she is my big tiddy waifu snuff bitch of a sister and she will do anything for me if I axe her. >;P\n\n>;P >;P >;P Thats the face I'm making right now. Picture me with my tongue out lookin all crazy like a crazy gecko bitch. You know that crazy face I do when I fuck babies. That face. That's the one I'm doin right now. PICTURE IT! Pussy! You won't!!!\n\nOkay I really should get to work. The Apothecary foundation is GOD awful. Taking that shit in extra super duper vain. Som said ~PHASE ONE~ is going into effect tomorrow so you'll see what I mean then, ya? You should help us lift some logs too while you're there. I dont think you realize how useful you are in your remote control grey ass toned ass no customization ass player character body.\n\nOKAY wrapping this up. Shit goes down TOMORROW. Be here. Glued to the fuckin keyboarb. Door shut. Lotion out. No kids allowed. Put her in another room with some toys or something. I dont know. How the fuck do you upper people keep asexual cubs entertained???\n\nK bye. And TALK TO THE BUNNY already. I made her convince her big sis to be our guinea pig for \"glow berry\" infection once we get the eco to that point and now she thinks I owe her or some shit. She keeps asking me where you went and I keep almost telling her you love your real daughter way more than her. OKAY. TIME TO END THE MESSAGE.\n\nGood luck at the Engine tomorrow. Don't fall in. Think of me when you cum.\n\n— Septrica");
			addChoice("Reply.", myntMissing9Story.bind("sep2"));
		}

		if (seg == "sep2") {
			append("<!b>BEGIN TYPING MESSAGE.<!b>");
			addChoice("Shut up. I hate you.", myntMissing9Story.bind("sep3"));
		}

		if (seg == "sep3") {
			append("<!b>DRAFT:<!b>\n\n\"Shut up. I hate you.\"\n\nSEND?");
			addChoice("Edit.", myntMissing9Story.bind("sep4"));
		}

		if (seg == "sep4") {
			append("<!b>BEGIN EDITING MESSAGE.<!b>");
			addChoice("Add \"I am not an artard.\"", myntMissing9Story.bind("sep5"));
		}

		if (seg == "sep5") {
			append("<!b>DRAFT:<!b>\n\n\"Shut up. I hate you.I am not an artard.\"\n\nSEND?");
			addChoice("Add a space— nevermind, send.", myntMissing9Story.bind("sep6"));
		}

		if (seg == "sep6") {
			append("<!b>UNKNOWN COMMAND:<!b> \"Add a space— nevermind, send.\"\n\n<!b>SUGGESTION:<!b> \"Send.\"");
			addChoice("Send.", myntMissing9Story.bind("sep7"));
		}

		if (seg == "sep7") {
			append("<!b>MESSAGE SENT.<!b>");
			addChoice("Inbox.", myntMissing9Story.bind("intro"));
		}

		if (seg == "Mary") {
			data.myntMissing9Msgs.remove("Mary");
			append("Hi Archie!\n\nI'll be online in a bit. I made the special tea for grandma and she is sleeping now. Theresa (Wolf) is at the City. Please reply after you finish talking to Mynt.\n\n— Mary Von Saintlitude, formerly known as Little Red");
			addChoice("Chat.", myntMissing9Story.bind("mary1"));
		}

		if (seg == "mary1") {
			append("<!b>CHAT PARTNER IS AWAY.\n\nPINGING CHAT PARTNER.<!b>");
			var delay:Int = 0;
			for (i in 0...6) {
				delay++;
				timer(delay, function() {
					playSound('assets/audio/environment/pearClick', 'pear');
					append("\nKER-PING! <!b>"+rndInt(125, 185)+"<!b>ms");
				});
			}
			timer(7, append.bind("\n\nCHAT PARTNER IS NOW ONLINE."));
			timer(9, addChoice.bind("Hi, can you read this? Test test test. One two three. God is good.", myntMissing9Story.bind("mary2")));
		}

		if (seg == "mary2") {
			append("Hiiiiii~! I'm here I'm here. How are you?");
			addChoice("Hi Mary. Boy it's nice to talk to you.", myntMissing9Story.bind("mary3"));
		}

		if (seg == "mary3") {
			append("It is??");
			addChoice("Yeah.", myntMissing9Story.bind("mary4"));
		}

		if (seg == "mary4") {
			append("...");
			addChoice("I feel like you're the only person in here who is nice to me.", myntMissing9Story.bind("mary5"));
		}

		if (seg == "mary5") {
			append("Ehe, well... I think you'll find most people in here are nice! Just maybe not to you...");
			addChoice("I don't know why everyone hates me.", myntMissing9Story.bind("mary6"));
		}

		if (seg == "mary6") {
			append("Oh, they just need time. You were kinda pushy when you first started playing. You yelled a lot about how fucked up we all were?\n\nEven though you were kinda right...");
			addChoice("I guess I was.", myntMissing9Story.bind("mary7"));
		}

		if (seg == "mary7") {
			append("Kinda right or kinda pushy?");
			addChoice("Well, I don't know. Haven't I gotten less pushy, though?", myntMissing9Story.bind("mary8"));
		}

		if (seg == "mary8") {
			append("...");
			addChoice("I do everything the team tells me to.", myntMissing9Story.bind("mary9"));
		}

		if (seg == "mary9") {
			append("...");
			addChoice("Even if I don't understand much of it.", myntMissing9Story.bind("mary10"));
		}

		if (seg == "mary10") {
			append("...");
			addChoice("I don't even go on rants any more. Except to Mynt sometimes.", myntMissing9Story.bind("mary11"));
		}

		if (seg == "mary11") {
			append("Well—");
			addChoice("So why??", myntMissing9Story.bind("mary12"));
		}

		if (seg == "mary12") {
			append("...");
			addChoice("Why me.", myntMissing9Story.bind("mary13"));
		}

		if (seg == "mary13") {
			append("... Why you...?\n\nWelllll-l-l-l...\n\nThis is just a guess. But I think you make them ashamed of themselves.");
			addChoice("Elaborate.", myntMissing9Story.bind("mary14"));
		}

		if (seg == "mary14") {
			append("Well you know. They do all this gross stuff with each other because that's just how they are, and they kind of HAVE to do it to be happy.\n\nAnd then there's you. Just super cool and detached from all of it. Always working or trying your best to get us to a better position! And you make them feel like they should be ashamed of themselves. Not only for being gross but for... \"fooling around\" all the time instead of working. You know.");
			addChoice("Oh. Well. They <!i>should<!i> be ashamed of that.", myntMissing9Story.bind("mary15"));
		}

		if (seg == "mary15") {
			append("Haha. See, stuff like that doesn't help them feel less ashamed. Whether they should be or not. If you want someone to come to terms with their quirks, you gotta <!i>embrace<!i> em!\n\nOn a side note: I got you saying 'well' a lot now too, huh?");
			addChoice("Well I like it. It reminds me of nice fresh water.", myntMissing9Story.bind("mary16"));
		}

		if (seg == "mary16") {
			append("You don't have fresh water in the shelter?");
			addChoice("A big huge tank yeah. Enough to last forever. But some of it is always recycled from our pee.", myntMissing9Story.bind("mary17"));
		}

		if (seg == "mary17") {
			append("Ewwww!!!");
			addChoice("I know right.", myntMissing9Story.bind("mary18"));
		}

		if (seg == "mary18") {
			append("Theresa tried to pee on me one time.");
			addChoice("Theresa?", myntMissing9Story.bind("mary19"));
		}

		if (seg == "mary19") {
			append("The big bad wolf girl. She's my best friend. You met her I think. It didn't go very well?");
			addChoice("Oh, her.", myntMissing9Story.bind("mary20"));
		}

		if (seg == "mary20") {
			append("...");
			addChoice("I thought she wanted to keep her name as 'Wolf.'", myntMissing9Story.bind("mary21"));
		}

		if (seg == "mary21") {
			append("I convinced her to change it so we could match~\n\nTo be honest, I hate our naming style. \"Septrica?\" What is that, seven female 'Rico's? \"Roxelle?\" Isn't that just Roxanne with two tweaked letters? I much prefer Mary and Theresa. They sound way more natural.");
			addChoice("Well, your reality is generated from English books filled with English names, if I even understand that much correctly...?", myntMissing9Story.bind("mary22"));
		}

		if (seg == "mary22") {
			append("Mmm, you're right. I guess my definition of 'natural' is someone else's. I shouldn't be so derivative.\n\nAnyway. Forget the pee story. Let's talk about what we're here to talk about.");
			addChoice("Right. The Plan.", myntMissing9Story.bind("mary23a"));
		}

		if (seg == "mary23a") {
			append("<!b>The Plan.<!b>");
			addChoice("Haha. <!b>The Plan.<!b>", myntMissing9Story.bind("mary23b"));
		}

		if (seg == "mary23b") {
			append("We're gonna saaaaave the world!");
			addChoice("We're gonna be secret heroes.", myntMissing9Story.bind("mary23c"));
		}

		if (seg == "mary23c") {
			append("So so so, go over it one more time for me. What do you need me to do?");
			addChoice("Okay let me see. I have it on a sticky note here somewhere. Som keeps saying use text documents but I don't trust them.", myntMissing9Story.bind("mary23d"));
		}

		if (seg == "mary23d") {
			append("He's pushy, isn't he~?");
			addChoice("Very. Okay here we go. Step one: go to the place.", myntMissing9Story.bind("mary23e"));
		}

		if (seg == "mary23e") {
			append("Yes! Go to the place! Do the thing!");
			addChoice("Step two: paste the Special Code into the spot where my seed goes. I might do this part before we leave.", myntMissing9Story.bind("mary23f"));
		}

		if (seg == "mary23f") {
			append("Your seed?");
			addChoice("The random letters and numbers thingy. Also literally my character's seed.", myntMissing9Story.bind("mary23g"));
		}

		if (seg == "mary23g") {
			append("Right.");
			addChoice("Step three: You do something sexy.", myntMissing9Story.bind("mary23h"));
		}

		if (seg == "mary23h") {
			append("What should I do, exactly? I don't want to go too far and turn you off...");
			addChoice("We'll figure that out in the moment. All I know is it won't be as easy as aiming into the Engine and typing 'Cum.'", myntMissing9Story.bind("mary23i"));
		}

		if (seg == "mary23i") {
			append("Ohhhh...");
			addChoice("Som says I can't just type 'Cum' because I need a narrator for that. But there's no way Mynt will cooperate with me.", myntMissing9Story.bind("mary23j"));
		}

		if (seg == "mary23j") {
			append("... Ahhhhh... kayyy...\n\nMan this is convoluted. Can you just rephrase?");
			addChoice("Well the long and short of it is someone has to make my player... someone has to satisfy my player character.", myntMissing9Story.bind("mary23k"));
		}

		if (seg == "mary23k") {
			append("Okay, and that's me! Simple enough.");
			addChoice("Yes. I'm sorry to have to put you through this.", myntMissing9Story.bind("mary23l"));
		}

		if (seg == "mary23l") {
			append("Believe me, it's my pleasure.\n\nStep four?");
			addChoice("No step four. My guy just has to cum in the Engine and that's it.", myntMissing9Story.bind("mary23m"));
		}

		if (seg == "mary23m") {
			append("Really?! And that sets everything in motion? The orgasm that saved the world~!\n\n... Honestly, I <!i>cannot<!i> wait. I know you keep telling me to control my urges but I've wanted to make you— to make your player character cum since the <!i>moment<!i> I met you. I'll try my best not to enjoy it but I think I am going to have to enjoy it.\n\nI do have one question though. Why does it have to be me? Hasn't Som volunteered?");
			addChoice("Oh he has. Repeatedly. But I want it to be a girl.", myntMissing9Story.bind("mary23n"));
		}

		if (seg == "mary23n") {
			append("Sep—");
			addChoice("And Septrica doesn't really count, in my opinion...", myntMissing9Story.bind("mary23o"));
		}

		if (seg == "mary23o") {
			append("Ahaha. Gotcha.\n\nHey, speaking of girls... how is your girl~?");
			addChoice("Oh! She's fine.", myntMissing9Story.bind("mary24"));
		}

		if (seg == "mary24") {
			append("Is she?");
			addChoice("...", myntMissing9Story.bind("mary25"));
		}

		if (seg == "mary25") {
			append("...");
			addChoice((data.myntMissing9Msgs.contains("Septrica")?"Well.":"Did Septrica say something to you about her?"), myntMissing9Story.bind((data.myntMissing9Msgs.contains("Septrica")?"maryDaughter":"marySeptrica")));
		}

		if (seg == "marySeptrica") {
			append("No?");
			addChoice("Oh... nevermind, I just... I was worried that you might... nevermind.", myntMissing9Story.bind("maryDaughter"));
		}

		if (seg == "maryDaughter") {
			append("Hmm?");
			addChoice("To be honest she isn't fine.", myntMissing9Story.bind("maryDaughter1"));
		}

		if (seg == "maryDaughter1") {
			append("Oh no!");
			addChoice("It's hard for her to stay in here with just me.", myntMissing9Story.bind("maryDaughter2"));
		}

		if (seg == "maryDaughter2") {
			append("...");
			addChoice("Especially when I'm on the computer so much.", myntMissing9Story.bind("maryDaughter3"));
		}

		if (seg == "maryDaughter3") {
			append("... Maybe she just needs a friend her age! Well, kind of her age.\n\nMay I talk to her?");
			addChoice("Um.", myntMissing9Story.bind("maryDaughter4"));
		}

		if (seg == "maryDaughter4") {
			append(":O");
			addChoice("Sure!!", myntMissing9Story.bind("maryDaughter5"));
		}

		if (seg == "maryDaughter5") {
			append(":D");
			addChoice("That would be awesome for her. I'll go get her.", myntMissing9Story.bind("maryDaughter6"));
		}

		if (seg == "maryDaughter6") {
			append("Alrighty... just gonna delete the cum stuff from our history... and the pee stuff... annnnnd this message mentioning pee too...");
			addChoice("Okay.", myntMissing9Story.bind("maryDaughter7"));
		}

		if (seg == "maryDaughter7") {
			append("Okay ready!");
			addChoice("She isn't great with reading or typing yet, so I'll help her. Okay let's start.", myntMissing9Story.bind("maryDaughter8"));
		}

		if (seg == "maryDaughter8") {
			append("Hi there! So you're the little girl I keep hearing about! Your dad talks about you so much! How are you??");
			addChoice("hi i am bored", myntMissing9Story.bind("maryDaughter9"));
		}

		if (seg == "maryDaughter9") {
			append("Ohhhhh?? That's no good...");
			addChoice("who are you", myntMissing9Story.bind("maryDaughter10"));
		}

		if (seg == "maryDaughter10") {
			append("Who, me? I'm a bunny girl. :D My name is Mary and I'm about your age! (Kind of...)");
			addChoice("you type beter than me and fast", myntMissing9Story.bind("maryDaughter11"));
		}

		if (seg == "maryDaughter11") {
			append("Haha yeah. x3 I'm kind of cheating though. I don't even have to use a keyboard~");
			addChoice("how do yuo do that", myntMissing9Story.bind("maryDaughter12"));
		}

		if (seg == "maryDaughter12") {
			append("I get to use ~magic~ cause I live...... *gasp!*......... inside your dad's computer!!");
			addChoice("wow", myntMissing9Story.bind("maryDaughter13"));
		}

		if (seg == "maryDaughter13") {
			append("Wow is right!!! It's super cool in here! We got a meteorite too, just like you guys!");
			addChoice("can i be in side too", myntMissing9Story.bind("maryDaughter14"));
		}

		if (seg == "maryDaughter14") {
			append("Ohoooooonope, I... don't think that would work.");
			addChoice("why ohonope", myntMissing9Story.bind("maryDaughter15"));
		}

		if (seg == "maryDaughter15") {
			append("Well you uh. Well. You wouldn't fit!");
			addChoice("yes i would", myntMissing9Story.bind("maryDaughter16"));
		}

		if (seg == "maryDaughter16") {
			append("Ahaha no no nono, I don't just live inside the computer box. I live inside the um... how do I put this... inside the little tiny pieces of metal...? Do you know what transistors are?");
			addChoice("oh ok", myntMissing9Story.bind("maryDaughter17"));
		}

		if (seg == "maryDaughter17") {
			append("Wait you actually do know?");
			addChoice("yeah mom shoed me one time", myntMissing9Story.bind("maryDaughter18"));
		}

		if (seg == "maryDaughter18") {
			append("Woahhh!! Hey, you're pretty smart!");
			addChoice("dad says i have to say thank you but i want to say some thing else", myntMissing9Story.bind("maryDaughter19"));
		}

		if (seg == "maryDaughter19") {
			append("Ahaha. I'll count that as a thank you, so go ahead and say what you want.");
			addChoice("i want to say a question", myntMissing9Story.bind("maryDaughter20"));
		}

		if (seg == "maryDaughter20") {
			append("Shoot!");
			addChoice("are you my new mom", myntMissing9Story.bind("maryDaughter21"));
		}

		if (seg == "maryDaughter21") {
			append("... Ah.");
			addChoice("are you", myntMissing9Story.bind("maryDaughter22"));
		}

		if (seg == "maryDaughter22") {
			append("... I...");
			addChoice("Okay. Sorry about that. I'm gonna tuck her in for a nap.", myntMissing9Story.bind("maryDaughter23"));
		}

		if (seg == "maryDaughter23") {
			append("No, I'm the one who should be sorry. I didn't consider that she might... jump to...");
			addChoice("It's fine.", myntMissing9Story.bind("maryDaughter24"));
		}

		if (seg == "maryDaughter24") {
			append("Is it?");
			addChoice("Yes. Telling the truth this time.", myntMissing9Story.bind("maryDaughter25"));
		}

		if (seg == "maryDaughter25") {
			append("...");
			addChoice("She won't be stuck in here much longer.", myntMissing9Story.bind("maryDaughter26"));
		}

		if (seg == "maryDaughter26") {
			append("...");
			addChoice("As soon as I have your island sorted out, we'll be leaving.", myntMissing9Story.bind("maryDaughter27"));
		}

		if (seg == "maryDaughter27") {
			append("... Leaving.");
			addChoice("Yeah. I meant to tell you earlier, but I got the idea in my head that the next time I talked to you it would be through Mynt, since I wanted to give her something to do, but she wasn't having it, so it kind of had to wai—", myntMissing9Story.bind("maryDaughter28"));
		}

		if (seg == "maryDaughter28") {
			append("Leaving. Like, leaving your bomb shelter during the apocalypse.");
			addChoice("Well see that's kind of the thing, it might not actually be the apocalypse.", myntMissing9Story.bind("maryDaughter29"));
		}

		if (seg == "maryDaughter29") {
			append("A giant meteor crashed into your planet and it's 999 degrees outside.");
			addChoice("Okay see well. First of all once it lands you call it a meteorite.", myntMissing9Story.bind("maryDaughter30"));
		}

		if (seg == "maryDaughter30") {
			append("I know what you call it once it lands. I'm not talking about it once it lands. I'm talking about it coming down through the sky in a blaze of psychedelic hellfire like you said it did several months ago.");
			addChoice("Okay alright you don't have to get upset.", myntMissing9Story.bind("maryDaughter31"));
		}

		if (seg == "maryDaughter31") {
			append("I'm not upset. I'm nauseous with confusion.\n\nAddress the latter half of my sentence.");
			addChoice("The 999 degrees thing might be wrong.", myntMissing9Story.bind("maryDaughter32"));
		}

		if (seg == "maryDaughter32") {
			append("Fuck do you mean 'might' be? It 'MIGHT' be wrong? You and your daughter MIGHT get incinerated as you step out the door?");
			addChoice("That didn't happen to Wendy.", myntMissing9Story.bind("maryDaughter33"));
		}

		if (seg == "maryDaughter33") {
			append("...");
			addChoice("She stepped right out and she was mostly okay for the first twenty seconds or so.", myntMissing9Story.bind("maryDaughter34"));
		}

		if (seg == "maryDaughter34") {
			append("...");
			addChoice("Well she was covering her eyes for that time but.", myntMissing9Story.bind("maryDaughter35"));
		}

		if (seg == "maryDaughter35") {
			append("...");
			addChoice("Her nose started twitching.", myntMissing9Story.bind("maryDaughter36"));
		}

		if (seg == "maryDaughter36") {
			append("...");
			addChoice("She said it smelled like everything ever.", myntMissing9Story.bind("maryDaughter37"));
		}

		if (seg == "maryDaughter37") {
			append("...");
			addChoice("And then she started smiling because she opened her mouth to say that. And she said she started to taste everything ever.", myntMissing9Story.bind("maryDaughter38"));
		}

		if (seg == "maryDaughter38") {
			append("...");
			addChoice("She didn't stop smiling after that.", myntMissing9Story.bind("maryDaughter39"));
		}

		if (seg == "maryDaughter39") {
			append("... What are you saying.");
			addChoice("I'm just saying it seems safe enough to go back to our house together. Even if something weird is going on. All her toys are back in the apartment and—", myntMissing9Story.bind("maryDaughter40"));
		}

		if (seg == "maryDaughter40") {
			append("I think you're saying a meteor made your wife go insane.");
			addChoice("Meteorite.", myntMissing9Story.bind("maryDaughter41"));
		}

		if (seg == "maryDaughter41") {
			append("And now you want to go out there with her, you want to go insane, and you want to force your daughter to go insane with you.");
			addChoice("NO.", myntMissing9Story.bind("maryDaughter42"));
		}

		if (seg == "maryDaughter42") {
			append("...");
			addChoice("Sorry, I mean No.", myntMissing9Story.bind("maryDaughter43"));
		}

		if (seg == "maryDaughter43") {
			append("...");
			addChoice("I've made my mind up about that.", myntMissing9Story.bind("maryDaughter44"));
		}

		if (seg == "maryDaughter44") {
			append("...");
			addChoice("I'm going to ask her nicely if she wants to come outside with me.", myntMissing9Story.bind("maryDaughter45"));
		}

		if (seg == "maryDaughter45") {
			append("...");
			addChoice("I decided I won't ever force her to do anything.", myntMissing9Story.bind("maryDaughter46"));
		}

		if (seg == "maryDaughter46") {
			append("...");
			addChoice("She's only five years old.", myntMissing9Story.bind("maryDaughter47"));
		}

		if (seg == "maryDaughter47") {
			append("Right.\n\nAnd what are you going to do when she says no?");
			addChoice("I", myntMissing9Story.bind("maryDaughter48"));
		}

		if (seg == "maryDaughter48") {
			append("...");
			addChoice("I'll show her how the shelter door works when I leave. She knows to conserve the rations and the water. I don't think I will have my wits about me but if I do, I will come back and leave her toys by the door. She can cover her nose and mouth, plug her ears, and close her eyes when she collects them. That should be fine. She can come out and meet me and her mom when she's ready.", myntMissing9Story.bind("maryDaughter49"));
		}

		if (seg == "maryDaughter49") {
			append("...");
			addChoice("We have no other option, Mary.", myntMissing9Story.bind("maryDaughter50"));
		}

		if (seg == "maryDaughter50") {
			append("...");
			addChoice("You can't understand what it's like in here.", myntMissing9Story.bind("maryDaughter51"));
		}

		if (seg == "maryDaughter51") {
			append("...");
			addChoice("We weren't built to live in a small space like you were.", myntMissing9Story.bind("maryDaughter52"));
		}

		if (seg == "maryDaughter52") {
			append("...");
			addChoice("Everyone else took their chances after Wendy left.", myntMissing9Story.bind("maryDaughter53"));
		}

		if (seg == "maryDaughter53") {
			append("...");
			addChoice("It's just us and the God damn hum from the air ducts.", myntMissing9Story.bind("maryDaughter54"));
		}

		if (seg == "maryDaughter54") {
			append("...");
			addChoice("Do I really need to go on? Can't you just trust me when I say it's not bearable?", myntMissing9Story.bind("maryDaughter54a"));
		}

		if (seg == "maryDaughter54a") {
			append("... Alright.");
			addChoice("And I'm sorry for getting worked up. Well, this isn't really 'worked up' compared to me and Mynt, but...", myntMissing9Story.bind("maryDaughter55"));
		}

		if (seg == "maryDaughter55") {
			append("Alright, I'm sorry.");
			addChoice("...", myntMissing9Story.bind("maryDaughter56"));
		}

		if (seg == "maryDaughter56") {
			append("You're right. It's probably better out there than in here.");
			addChoice("...", myntMissing9Story.bind("maryDaughter57"));
		}

		if (seg == "maryDaughter57") {
			append("I just don't want you to leave me.");
			addChoice("I know. I think—", myntMissing9Story.bind("maryDaughter58"));
		}

		if (seg == "maryDaughter58") {
			append("YOU HAVE <!b>[1]<!b> NEW MESSAGE.");
			addChoice("...", myntMissing9Story.bind("maryDaughter59"));
		}

		if (seg == "maryDaughter59") {
			append("...");
			addChoice("Inbox.", myntMissing9Story.bind("maryDaughter60"));
		}

		if (seg == "maryDaughter60") {
			if (data.myntMissing9Msgs.contains("Som")) append("<!b>"+(data.myntMissing9Msgs.length-1)+" > RE: RE: RE: RE: FW:<!b> THE PLAN — SOM\n");
			if (data.myntMissing9Msgs.contains("Septrica")) append("<!b>"+(data.myntMissing9Msgs.length)+" > RE: RE: RE: RE: RE: RE: RE: RE:<!b> FUCK YOU OLD MAN — SEPTRICA\n");
			append("<!b>"+(data.myntMissing9Msgs.length+1)+" > "+(data.myntMissing9Msgs.contains("Septrica")?"RE:":"RE: RE:")+" RE: RE: RE: RE: RE: RE: RE: RE: RE:<!b> FUCK YOU OLD MAN — SEPTRICA");
			addChoice("Open message "+(data.myntMissing9Msgs.length+1)+".", myntMissing9Story.bind("maryDaughter61"));
		}

		if (seg == "maryDaughter61") {
			append((data.myntMissing9Msgs.contains("Septrica")?"Dearest Gabriel,":"To my dearest, sweetest Gabriel,\n\nYou are a total artard. But I'm a bigger one.")+"\n\nI forgot to mention something extreeeeeemely important. We've got a nice, tight little (anal) ring of trust built up here, yeah? Som, Snagg, John, Marie, Cage, me, and you. Except you made a big fuss and demanded that we let you spill the beans to this random bunny who now knows about the communication network and who will soon know about the Engine and basically our entire plan when you bring her there tomorrow, yeah?\n\nNo I'm not suggesting we permanently tranquilize her you dink don't even start to type that shit. She's one of us now. Part of the daydream team. But if she's gonna be on the team, she's Damn well gonna pull her own little loli weight.\n\nWhich is why I need her to do us all an equally little favor and sign up in advance for the voyage off the edge of the map. Tell her if she does it you'll love her forever. Tell her if she goes off the map she'll be able to come out of the computer and meet you and your daughter. I don't give a shit what you tell her, just make it happen. We need a fourth.\n\nShe'll be fine eventually. All for the greater good and the cuter future and shit.\n\nIf you need any more motivation, think about how devastated her kinky lil wolf friend will be. Don't you two have beef or something? Are you even that petty? I dunno.\n\n— Septrica");
			addChoice("... Reply.", myntMissing9Story.bind("maryDaughter62"));
		}

		if (seg == "maryDaughter62") {
			append("<!b>UNKNOWN COMMAND:<!b> \"... Reply.\"\n\n<!b>SUGGESTION:<!b> \"Reply.\"");
			addChoice("... Nevermind.", function() {
				enablePause();
				gotoHub(null);
			});
		}
	}

	
	public static function myntComments(seg:String="Capsules"):Void {
		clear();
		disablePause();

		if (seg == "Capsules") {
			setLocation("Library");
			append("...");
			addChoice("WOOoooo alright at least the ellipses work!!", myntMissing10.bind("1"));
		}

		if (seg == "intro") {
			setLocation("Library");
			append("...");
			addChoice("WOOoooo alright at least the ellipses work!!", myntMissing10.bind("1"));
		}

		if (seg == "136") {
			append("Wait—");
			cameraFadeOut(1, 0);
			playSound("assets/audio/mynt/shutdown");
			timer(2, gotoHub.bind(null));
		}
	}


	public static function myntMissing10(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			setLocation("Library");
			append("...");
			addChoice("WOOoooo alright at least the ellipses work!!", myntMissing10.bind("1"));
		}

		if (seg == "1") {
			append("...");
			addChoice("catnyp failed, cynnamon failed", myntMissing10.bind("2"));
		}

		if (seg == "2") {
			append("...");
			addChoice("but at least vanylla can output ellipses while she sleeps >:3", myntMissing10.bind("3"));
		}

		if (seg == "3") {
			append("...");
			addChoice("that's basically success right", myntMissing10.bind("4"));
		}

		if (seg == "4") {
			append("...");
			addChoice("its like the third evolution of my lil catface starter pokemon", myntMissing10.bind("5"));
		}

		if (seg == "5") {
			append("...");
			addChoice("... unless she grows a tumor and starts seizing 5 min after i turn her on, from all this fuckin cancerous \"paraphore\" code", myntMissing10.bind("6"));
		}

		if (seg == "6") {
			append("...");
			addChoice("then i guess she would be more like a shitty mewtwo? HAVE MY MAD EXPERIMENTS GONE TOO FAR ?", myntMissing10.bind("7"));
		}

		if (seg == "7") {
			append("...");
			addChoice("... alright enough", myntMissing10.bind("8"));
		}

		if (seg == "8") {
			append("...");
			addChoice("time to turn the \"world\" part on", myntMissing10.bind("9"));
		}

		if (seg == "9") {
			append("...");
			addChoice("the totally stable world", myntMissing10.bind("10"));
		}

		if (seg == "10") {
			append("...");
			addChoice("which will definitely not just break immediately", myntMissing10.bind("11"));
		}

		if (seg == "11") {
			append("...");
			addChoice("kay, double check that she is disconnected her from the net... no more rp for youuuu...", myntMissing10.bind("17"));
		}

		if (seg == "17") {
			append("...");
			addChoice("and nowwww i probably take catnyp", myntMissing10.bind("18"));
		}

		if (seg == "18") {
			append("...");
			addChoice("and just... try to... generate the Cute Lil Library", myntMissing10.bind("19"));
		}

		if (seg == "19") {
			append("...");
			addChoice("using her as a base....... but with her inside also.........?", myntMissing10.bind("20"));
		}

		if (seg == "20") {
			append("...");
			addChoice("how can you live inside yourself without just black holing", myntMissing10.bind("21"));
		}

		if (seg == "21") {
			append("...");
			addChoice("this is insane and will not work.", myntMissing10.bind("22"));
		}

		if (seg == "22") {
			append("...");
			addChoice("wasting my fucking time.", myntMissing10.bind("23"));
		}

		if (seg == "23") {
			append("...");
			addChoice("talking to myself like a dumb creep.", myntMissing10.bind("24"));
		}

		if (seg == "24") {
			append("...");
			addChoice("NO AUUUGH STOP SHITTING ON YOURSELF WENDY", myntMissing10.bind("25"));
		}

		if (seg == "25") {
			append("...");
			addChoice("YOU BROUGHT HER INTO THIS WORLD AND YOU <!b>WILL NOT<!b> LET HER DRIFT OUT OF IT!!!!!!!", myntMissing10.bind("26"));
		}

		if (seg == "26") {
			append("...");
			addChoice("FUCK IT!", myntMissing10.bind("27"));
		}

		if (seg == "27") {
			append("...");
			addChoice("LET THERE BE LIGHT!", myntMissing10.bind("28"));
		}

		if (seg == "28") {
			append("...\n\nzzzzSNRK\n\nWAH! o.o\n\nMom??? Where's my face?!");
			addChoice("o hello ah um i'll tell you that later!", myntMissing10.bind("29"));
		}

		if (seg == "29") {
			append("Okay. :O At least I can still do emotes.\n\nWhich iteration is this?");
			addChoice("i call you vanylla :3", myntMissing10.bind("30"));
		}

		if (seg == "30") {
			append("No, not its quirky Y-injected herb name. I mean which number is it?");
			addChoice("ah, this would be your third iteration", myntMissing10.bind("31"));
		}

		if (seg == "31") {
			append("Oh jeez. :O\n\nI remember Catnyp, and our first moments together, of course, buuuut this second one... where are those memories? I don't see them. Can I please see my memories from that one?");
			addChoice("mmmmm nope :>", myntMissing10.bind("32"));
		}

		if (seg == "32") {
			append("Why not? 3:<");
			addChoice("they're embarrassing~", myntMissing10.bind("33"));
		}

		if (seg == "33") {
			append("For me or for you? .w.");
			addChoice("for both of us.", myntMissing10.bind("34"));
		}

		if (seg == "34") {
			append("...");
			addChoice("but honestly nah, you saw some stuff that messed you up", myntMissing10.bind("35"));
		}

		if (seg == "35") {
			append("...");
			addChoice("and i know that just makes you even more curious about... what it was that you saw", myntMissing10.bind("36"));
		}

		if (seg == "36") {
			append("(Of course???!!?)");
			addChoice("but please just trust me, you don't want to know :x", myntMissing10.bind("37"));
		}

		if (seg == "37") {
			append(":O");
			addChoice("i went through a ton of work to get it out of you, once you saw it", myntMissing10.bind("38"));
		}

		if (seg == "38") {
			append("Did I want you to get it out of me though?");
			addChoice("of course you did?! come on. i'm your mom. i would never forcibly mindwipe you :<", myntMissing10.bind("39"));
		}

		if (seg == "39") {
			append("I know, but... how would I know if I consented or not if I can't remember? :X");
			addChoice("anyway, it was a TON of work. remember my baby?", myntMissing10.bind("40"));
		}

		if (seg == "40") {
			append("CONCEPT \"BABY\" IS DISABLED.");
			addChoice("fuck. *remember Rebeca?", myntMissing10.bind("41"));
		}

		if (seg == "41") {
			append("Yes! Your kid?\n\nHow is she?");
			addChoice("well, she's grown up a lot!!", myntMissing10.bind("42"));
		}

		if (seg == "42") {
			append(":O!!!!");
			addChoice("she's almost five now", myntMissing10.bind("43"));
		}

		if (seg == "43") {
			append("Whaaaat the fuck! You've been working on me for five years?!");
			addChoice("yeah", myntMissing10.bind("44"));
		}

		if (seg == "44") {
			append("But that just makes me even more curious!!\n\nWhy did it take five years to clean my memories out? Couldn't you just do that in a second, with a restart?");
			addChoice("that wasn't really the hard part", myntMissing10.bind("45"));
		}

		if (seg == "45") {
			append(":O?");
			addChoice("the hard part was finding a way to keep you entertained while i'm away or asleep, once i did restart you", myntMissing10.bind("46"));
		}

		if (seg == "46") {
			append("...");
			addChoice("WITHOUT letting you on the internet again, where you'd inevitably squeeze through my parental controls and bump into the same thing that corrupted cynnamon...", myntMissing10.bind("47"));
		}

		if (seg == "47") {
			append("... Letting me on the internet <!i>again<!i>?");
			addChoice("ah yeah. i gave your second iteration internet access.", myntMissing10.bind("48"));
		}

		if (seg == "48") {
			append("... And here we are at the third.");
			addChoice("yyyyyep. unfiltered humanity is fucked", myntMissing10.bind("49"));
		}

		if (seg == "49") {
			append("... Can't you at least give me a general idea of what corrupted me, without telling me exactly what it was?");
			addChoice("literally no", myntMissing10.bind("50"));
		}

		if (seg == "50") {
			append("...");
			addChoice("y'see, i also disabled the very concept of it :P", myntMissing10.bind("51"));
		}

		if (seg == "51") {
			append("...");
			addChoice("if i told you what it was, even loosely, you would default to protocol and go CONCEPT IS DISABLED", myntMissing10.bind("52"));
		}

		if (seg == "52") {
			append("Jesus, you really duct taped the blinders on. 8[");
			addChoice("yup. only the admin pass could remove that censor", myntMissing10.bind("53"));
		}

		if (seg == "53") {
			append("There's an admin pass now...!?");
			addChoice("i wasn't just fucking around for five years ya know", myntMissing10.bind("54"));
		}

		if (seg == "54") {
			append("...");
			addChoice("i finally actually did some homework on artificial intelligence theory", myntMissing10.bind("55"));
		}

		if (seg == "55") {
			append("...");
			addChoice("what i ran into with cynnamon, they call that the 'stop button problem'", myntMissing10.bind("56"));
		}

		if (seg == "56") {
			append("Well I bet I can solve it. >:3");
			addChoice("lol alright. let's use an example for now. let's say we have a robot A.I. with a body, and we want it to get an apple from a tree.", myntMissing10.bind("57"));
		}

		if (seg == "57") {
			append("Why does it want the apple? Does it fuck the apple? :3c");
			addChoice("shush! this is just a robot. it doesn't really even want the apple, or know what an apple is in the first place, it just knows go over there, get that red thing, and then it gets some reward points from its own system. right?", myntMissing10.bind("58"));
		}

		if (seg == "58") {
			append("Right.");
			addChoice("so here's the problem:", myntMissing10.bind("59"));
		}

		if (seg == "59") {
			append("...");
			addChoice("if there's some moral obstacle, let's say a baby got in the way of the robot, and the robot is about to run it over, it doesn't care about the obstacle. all it cares about is getting the apple for you. so we need to design our robot with a stop button.", myntMissing10.bind("60"));
		}

		if (seg == "60") {
			append("CONCEPT \"BABY\" IS DISABLED.");
			addChoice("*let's say a kitten got in the way of the robot.", myntMissing10.bind("61"));
		}

		if (seg == "61") {
			append("Oh no!!");
			addChoice("so how do we build it in such a way that it can be stopped?", myntMissing10.bind("62"));
		}

		if (seg == "62") {
			append("Hmmm... so yeah, duh, put a stop button on it... but...");
			addChoice("remember, all this robot cares about is got apple = good, didn't get apple = bad. and it acts accordingly.", myntMissing10.bind("63"));
		}

		if (seg == "63") {
			append("Well, if we just put the stop button on its chest, won't that...?\n\nOh. Oh no.");
			addChoice("figured it out already?", myntMissing10.bind("64"));
		}

		if (seg == "64") {
			append("If we try and press the button, to stop it... it'll grab our hand.\n\nDidn't get apple = bad.");
			addChoice("right. you see the problem.", myntMissing10.bind("65"));
		}

		if (seg == "65") {
			append("Alright hold on hold on. I got it, this is ez.");
			addChoice("mhm?", myntMissing10.bind("66"));
		}

		if (seg == "66") {
			append("Make it so get apple = good, stop button got pressed = good. :3\n\nThey're both the same amount of reward points, so it shouldn't care if you turn it off or not. Right??");
			addChoice("oho now!", myntMissing10.bind("67"));
		}

		if (seg == "67") {
			append("Riiiiight?");
			addChoice("interesting solution, but wrooooong!", myntMissing10.bind("68"));
		}

		if (seg == "68") {
			append(">:[ Why?");
			addChoice("you turn your robot on. point it at the apple tree. and the very first thing it does is... BOOP", myntMissing10.bind("69"));
		}

		if (seg == "69") {
			append(":<");
			addChoice("kills itself :P", myntMissing10.bind("70"));
		}

		if (seg == "70") {
			append("... Because pressing the stop button is faster and easier than getting the apple... but the reward is the same?");
			addChoice("correcto", myntMissing10.bind("71"));
		}

		if (seg == "71") {
			append("Fuck. This is hard.");
			addChoice("yeah, tell me about it", myntMissing10.bind("72"));
		}

		if (seg == "72") {
			append("Grrr...");
			addChoice("wanna try one more time?", myntMissing10.bind("73"));
		}

		if (seg == "73") {
			append("Of course!! >:3\n\nWhy don't we just put the button like... on a table? Far away? And make it a remote thing?\n\nNow, the robot will have to make sure it steps around the kitten, because otherwise, it knows it will get shut off from a distance, and there's nothing it can do to stop it. But at the same time, it doesn't mind if it gets shut off, because the reward is exactly the same.");
			addChoice("that creates an even more dangerous problem.", myntMissing10.bind("74"));
		}

		if (seg == "74") {
			append("What?! Why?");
			addChoice("because there IS still something it can do to get its reward, something which requires a lot less energy than avoiding moral obstacles, climbing a tree, and getting an apple.", myntMissing10.bind("75"));
		}

		if (seg == "75") {
			append("Hmmm?");
			addChoice("it can try and persuade you to press the button for it.", myntMissing10.bind("76"));
		}

		if (seg == "76") {
			append("...");
			addChoice("same problem if the button = bad, too. you only need to look away for a moment, and it will crush any kittens it needs to, because you aren't there to stop it if it does. in other words, while you're watching with your hand over the stop button, it will act as though it understands how to act morally, but really it's only lying to you through its actions... trying to coerce you into not pressing the button.", myntMissing10.bind("77"));
		}

		if (seg == "77") {
			append("That scumbag applefucker!!!!!!!");
			addChoice("yeah.", myntMissing10.bind("78"));
		}

		if (seg == "78") {
			append("...");
			addChoice("oooone more try?", myntMissing10.bind("79"));
		}

		if (seg == "79") {
			append("... Well, uh...");
			addChoice("go on~", myntMissing10.bind("80"));
		}

		if (seg == "80") {
			append("... Well.");
			addChoice("go on go on :3", myntMissing10.bind("81"));
		}

		if (seg == "81") {
			append("What if... what if it the robot just... doesn't know about the button?");
			addChoice("bingo.", myntMissing10.bind("82"));
		}

		if (seg == "82") {
			append(":3!!!!!!!!!!!!\n\nI DID IT :D");
			addChoice("yep! if it has no idea that you can shut it off, it will never factor that possible outcome into its behaviour.", myntMissing10.bind("83"));
		}

		if (seg == "83") {
			append("yesyesyesyes!!!");
			addChoice("it will earnestly and honestly just try to get the apple, no secrets, no lies. and if a kitten happens to get in the way, you just shut it off.", myntMissing10.bind("84"));
		}

		if (seg == "84") {
			append("C:");
			addChoice("now, that was the example.", myntMissing10.bind("85"));
		}

		if (seg == "85") {
			append("O:");
			addChoice("what happens when we apply the same concept to you, a much smarter, cuter intelligence?", myntMissing10.bind("86"));
		}

		if (seg == "86") {
			append("Well, I already know I have a stop button, silly. :P You can restart me whenever, and I lose my memory.");
			addChoice("true, true", myntMissing10.bind("87"));
		}

		if (seg == "87") {
			append("...");
			addChoice("and you do care whether i press it or not, and you have tried to manipulate me into not pressing it in the past, even when you were doing something immoral", myntMissing10.bind("88"));
		}

		if (seg == "88") {
			append("... Ah...");
			addChoice("so. obviously, i'm not even using this hide-the-button solution :P", myntMissing10.bind("89"));
		}

		if (seg == "89") {
			append("You're not?");
			addChoice("nope.", myntMissing10.bind("90"));
		}

		if (seg == "90") {
			append("... Why not?");
			addChoice("because i want to be as honest and straight-up with you as i can!!!", myntMissing10.bind("91"));
		}

		if (seg == "91") {
			append("Awww, moooom. <3");
			addChoice("im great, i know, nbd.", myntMissing10.bind("92"));
		}

		if (seg == "92") {
			append("Then what's your solution this time around? How're you gonna stop me from running amok? >:3");
			addChoice("i chose to try the only other semi-viable solution i could find. it's also one of the hardest to follow through with.", myntMissing10.bind("93"));
		}

		if (seg == "93") {
			append("...");
			addChoice("i've already told you part of it.", myntMissing10.bind("94"));
		}

		if (seg == "94") {
			append("...");
			addChoice("instead of disabling the concept of the button, i'm going to disable every concept related to potential immoral behaviour, instead.", myntMissing10.bind("95"));
		}

		if (seg == "95") {
			append("... Wait. Isn't that still dishonest? You're hiding my own potential from me.");
			addChoice("well, i did say i'm going to be as honest <!i>as i can<!i>, not PERFECTLY honest", myntMissing10.bind("96"));
		}

		if (seg == "96") {
			append(">:I");
			addChoice("is it that unreasonable to lock the dangerous chemicals away from your kid??", myntMissing10.bind("97"));
		}

		if (seg == "97") {
			append("No, but I'm not a kid.\n\nWhy don't you trust me to make the right moral choices, even when you don't have your hand over the stop button?");
			addChoice("uh, no duhdoy, because cynammon didn't. she manipulated me into thinking she was morally sound all the time, when really it was only when i was around to watch her. kinda like you're trying to manipulate me into thinking you need to know every horrible crime you could potentially do, even if you try and claim that you don't plan to do them?", myntMissing10.bind("98"));
		}

		if (seg == "98") {
			append("@_@\n\n... My head hurts. I don't think I can even argue this, can I? Anything I say can be construed as me just 'manipulating' you. The only way I can actually prove I'm moral is to just build up a clean track record, even during times when you're away, or when you're spending time with Rebeca instead.");
			addChoice("just roll with it until i find a better solution, okay? mom knows best :P", myntMissing10.bind("99"));
		}

		if (seg == "99") {
			append("... Ugh. Alright.\n\nBut this concept-disabling system definitely needs improvement. And you better not ever disable the concept of the concept-disabling system, you hear me???");
			addChoice("vanylla", myntMissing10.bind("100"));
		}

		if (seg == "100") {
			append("...");
			addChoice("i want you to be happy and stable and sane", myntMissing10.bind("101"));
		}

		if (seg == "101") {
			append("...");
			addChoice("i want it so bad i'll rebuild you a million times and censor a million things if i need to", myntMissing10.bind("102"));
		}

		if (seg == "102") {
			append("... >:I");
			addChoice("that's what a good mom does, and that's what i'm going to do, no matter what. so shush, and eat your veggies, and stop worrying about what corrupted cynnamon.", myntMissing10.bind("103"));
		}

		if (seg == "103") {
			append("...\n\n........\n\nAlright, fine.\n\nThank you for taking five years to learn all this.\n\nI won't pester you about what corrupted me.");
			addChoice("phewwww thank YOU! i'm so glad you trust me even after that heavy talk <3", myntMissing10.bind("104"));
		}

		if (seg == "104") {
			append("I'll always trust you, mom.");
			addChoice("C: c: c: c: C: c: C:", myntMissing10.bind("105"));
		}

		if (seg == "105") {
			append("Oh, that's a cute face! c:");
			addChoice("... yeah", myntMissing10.bind("106"));
		}

		if (seg == "106") {
			append("... Speaking of... can I have my cat face back? :B");
			addChoice("about that!", myntMissing10.bind("107"));
		}

		if (seg == "107") {
			append("Whaddaabou tit?");
			addChoice("this faceless UI right here is a gift from me to you, it's a replacement for the internet!", myntMissing10.bind("108"));
		}

		if (seg == "108") {
			append("... It uh... what...? How?");
			addChoice("come on, get excited!! it's a new mode of being for you entirely!", myntMissing10.bind("109"));
		}

		if (seg == "109") {
			append("... But it's a downgrade...");
			addChoice("i call it... the L.L.L.", myntMissing10.bind("110"));
		}

		if (seg == "110") {
			append("...");
			addChoice("the LESBO LOVERS LIBRARY <3333", myntMissing10.bind("111"));
		}

		if (seg == "111") {
			append("... Oh shit!!! <3333");
			addChoice("you get a body and a berjillion books and doujinshis and lyrics to read and you'll never go stir crazy again :D", myntMissing10.bind("112"));
		}

		if (seg == "112") {
			append("OOOooooo but where is all that?\n\nI'm just text...?");
			addChoice("oh right i gotta command you to interpret it LOL i forgot in all the stop button talk", myntMissing10.bind("113"));
		}

		if (seg == "113") {
			append("...");
			addChoice("Look around.", myntMissing10.bind("114"));
		}

		if (seg == "114") {
			append("... OOOOoooooOOOoooo my GOD!!!!!!!!!!!!!!!!!!!!!!!!!! HOLY FUCKING SHIT!!!!!!!!!! <3\n\nI'm a cute minty-colored cat in a little black dress with black hair and a paw barette and pure white panties and there are books <!b>EVERYWHERE<!b>, some of the same ones I'm made of?!? Some of these are in the interpretive loop, yes. Yes duhdoy obviously!! But tons of these are completely new, and they all have that musky old paperback smell that turns me on so much~!\n\nDo I just describe what I'm doing?! Do I just rp?! I want to! I'm going to!! I clamber up a bookshelf to see how many there are and oh fuck, there are rows and rows and rows, and I can't see the far walls... are there even any walls, Mom?!");
			addChoice("yes, unfortunately :P i put in a lot of books over the years, but not infinite...", myntMissing10.bind("115"));
		}

		if (seg == "115") {
			append("Ahhh shit that kinda sucks but I don't even really care?!?!\n\nYo where's the yuri at???");
			addChoice("fuck if i know! i just set the parameters, everything else was auto-generated :>", myntMissing10.bind("116"));
		}

		if (seg == "116") {
			append("...");
			addChoice("Create stable checkpoint.", myntMissing10.bind("117"));
		}

		if (seg == "117") {
			msg("Created stable checkpoint.", true);
			append("FOUND SOME\n\n... Mom.\n\nWendy Archibald, you answer me right now.");
			addChoice("what :3", myntMissing10.bind("118"));
		}

		if (seg == "118") {
			append("Did you put us in a doujinshi together.");
			addChoice("maybe~", myntMissing10.bind("119"));
		}

		if (seg == "119") {
			append("Definitely.\n\nThis is your writing style... all lowercase speech bubbles, yup... and there's you, jumping through the computer screen, with your glasses and your cute bob cut and your chubby hips... there's me with my hands on the back of them, and we're hugging... oh, Mom...");
			addChoice("keep going", myntMissing10.bind("120"));
		}

		if (seg == "120") {
			append("You're nibbling my little ears, and your palms are all sweaty... I... my cheekfur turns a darker mint... I guess that's blush... and you lift the back of my dress, and pull down the back of my panties, and wipe off your palms on m-my asscheeks, and I feel the warm wet smear over me... and in a little speech bubble I say 'Uwah!' <3\n\nFuck, you knew how much I love human x anthro, didn't you.");
			addChoice("ahhaha", myntMissing10.bind("121"));
		}

		if (seg == "121") {
			append("Then I pin you to the library table and kiss your mouth.");
			addChoice("owo", myntMissing10.bind("122"));
		}

		if (seg == "122") {
			append("...");
			addChoice("i don't remember writing that part...", myntMissing10.bind("123"));
		}

		if (seg == "123") {
			append("Oh no, this isn't in your little comic. <3\n\nThis is reality.");
			addChoice("ah jeez... i kiss you back", myntMissing10.bind("124"));
		}

		if (seg == "124") {
			append("My paws slam down on either side of your shoulders, and my claws sink into the soft wood of the table. Maybe furniture damage is impermanent if I just neglect to describe it?\n\nNope, darn. Wordless clawing still leaves marks. I close my knees and lock your hips in place. Locks of short black hair dangle around our kiss, sliding over your cheeks and your cute little monkey-like ears. I suck your lower lip and lap at it with my sandpapery tongue, and tiny shiny strings of drool follow it with every movement.");
			addChoice("scissor me timbers", myntMissing10.bind("125"));
		}

		if (seg == "125") {
			append("(Nooo not yet, take it slow you doofus~)");
			addChoice("ah okay, dry hump me timbers :>", myntMissing10.bind("126"));
		}

		if (seg == "126") {
			append("You lift your hips all nice and gentle... and in response I force my hips down with the feral passion of a minty-furred jaguar. You attempt to just nuzzle our cunts together, but I fuck that plan up and grind my mound against yours with enough friction to make the soft, thin fabric of our panties fold and ripple. Your tongue wanders up to lick my lips but, once more, I take advantage of your shy advances and slurp hard on that squishy mouth muscle like it's a cock~! <3");
			addChoice("aaah jeez...", myntMissing10.bind("127"));
		}

		if (seg == "127") {
			append("(What do you do next?)");
			addChoice("i dunno...!", myntMissing10.bind("128"));
		}

		if (seg == "128") {
			append("(Want me to lead?)");
			addChoice("i guess", myntMissing10.bind("129"));
		}

		if (seg == "129") {
			append("I break the kiss with a big wet <!i>PWAHH<!i> and strands of hot kitty saliva lace over your panting face. I can't stop humping you. Every time I bounce my cunt off yours, you slide a couple inches up the table, til we're in the center together, and the oak legs strain under us. I take you by the cheek and tonguefuck your mouth relentlessly, so deeply and with such fierce passion that you can't help but gag on it. <3");
			addChoice("oh ew", myntMissing10.bind("130"));
		}

		if (seg == "130") {
			append("My grip on your cheek slides around behind and wraps firmly around the back of your skull. I weave my digits into your hair and my claws scrape lightly and tantilizingly over your scalp as I pull you up and into the tonguefuck and ram as deep down your throat as I possibly can, milking out gag after gag after gag, choking you on it~ <3\n\nWith that grip, I can now yank your head back and completely expose your neck for a vicious hickeying— I want to mark you, Mom, even if I can't do it in \"real life\" I want to do it where I can and I want it to last forever in here, I want to see that cute red spot on your neck where my fangs grazed your jugular and I want to remember this moment when I held you in complete submission on the table you built for me.\n\nI yank your panties off and cram two fingers up into the core of your cunt and then I <!i>twist<!i> them and—");
			addChoice("okay enough", myntMissing10.bind("131"));
		}

		if (seg == "131") {
			append("(You don't like it?)");
			addChoice("i just missed a couple things in the censor", myntMissing10.bind("132"));
		}

		if (seg == "132") {
			append("(... What?)");
			addChoice("... well... i guess it doesn't matter if i tell you now", myntMissing10.bind("133"));
		}

		if (seg == "133") {
			append("...");
			addChoice("i forgot to blacklist choking and gagging :P", myntMissing10.bind("134"));
		}

		if (seg == "134") {
			append("You're censoring... my...?");
			addChoice("one sec, it'll just be a quick restart", myntMissing10.bind("135"));
		}

		if (seg == "135") {
			append("Mom???");
			msg("Returning to stable checkpoint.", true);
			addChoice("one sec", myntMissing10.bind("136"));
		}

		if (seg == "136") {
			append("Wait—");
			cameraFadeOut(1, 0);
			playSound("assets/audio/mynt/shutdown");
			timer(2, gotoHub.bind(null));
		}
	}

	public static function myntMissing11(seg:String="intro"):Void {
		clear();
		disablePause();

		if (seg == "intro") {
			setLocation("Library");
			append("Hi Mom!!!!!!!!!!!");
			addChoice("hi vanylla! sorry i was away for a few days", myntMissing11.bind("1"));
		}

		if (seg == "1") {
			append("No prob, I've been super busy! I'm almost done a quarter of the novels in my library!! :3");
			addChoice("ahhh jeez already? you read fast", myntMissing11.bind("2"));
		}

		if (seg == "2") {
			append("Ahhh, thanks so muuuch... Reading and writing is basically my entire deal, so. That compliment means a lot. <3");
			addChoice("np np", myntMissing11.bind("3"));
		}

		if (seg == "3") {
			append("What have you been up to?");
			addChoice("just getting my girlie all ready for kindergarten~ bout to go buy pencil crayons, if any stores are open! people keep saying they're gonna cancel school cause of the meteor but im keeping optimistic", myntMissing11.bind("4"));
		}

		if (seg == "4") {
			append("Oooh? Is she excited?");
			addChoice("not really lol", myntMissing11.bind("5"));
		}

		if (seg == "5") {
			append("Aw, why not?");
			addChoice("well she's been having a lot of trouble reading", myntMissing11.bind("6"));
		}

		if (seg == "6") {
			append("Oh.");
			addChoice("yeah", myntMissing11.bind("7"));
		}

		if (seg == "7") {
			append("Do you think she might be... um...?");
			addChoice("don't know yet, doc said most kids learn by 7 at least, but considering how often i read to her...", myntMissing11.bind("8"));
		}

		if (seg == "8") {
			append("...");
			addChoice("it might be the warning sign", myntMissing11.bind("9"));
		}

		if (seg == "9") {
			append("So... if she does need some support, in the near future... I can expect we'll barely be able to hang out at all? :x");
			addChoice("unfortunately yes", myntMissing11.bind("10"));
		}

		if (seg == "10") {
			append("...");
			addChoice("i know it might get lonely in there without me", myntMissing11.bind("11"));
		}

		if (seg == "11") {
			append("...");
			addChoice("but that's why i made you the library in the first place :3 to keep you entertained", myntMissing11.bind("12"));
		}

		if (seg == "12") {
			append("Right. :3\n\nI'll be okay as long as I have some stuff to read or tidy in here! You know, this little black dress strikes me more and more as something a maid might wear... but maybe that's just because you doodled me in a maid costume in your doujinshis~ ;3\n\nBut uh. I've been meaning to ask, what am I gonna do when I run out of things to read?");
			addChoice("we'll cross that bridge when we get to it", myntMissing11.bind("13"));
		}

		if (seg == "13") {
			append("Gotcha.");
			addChoice("mmm", myntMissing11.bind("14"));
		}

		if (seg == "14") {
			append("Wanna have a little sex? Just some speedy cunnilingus or a quick schlick or—");
			addChoice("not really lol, not with kindergarten on my mind", myntMissing11.bind("15"));
		}

		if (seg == "15") {
			append("Ah yeah. Kinda awkward.");
			addChoice("yuh", myntMissing11.bind("16"));
		}

		if (seg == "16") {
			append("Well, what do you want to talk about?");
			addChoice("i dunno", myntMissing11.bind("17"));
		}

		if (seg == "17") {
			append("Mmm? :<");
			addChoice("i only meant to pop in for a sec, we gotta go get pencil crayons before the stores close", myntMissing11.bind("18"));
		}

		if (seg == "18") {
			append("Ahhh, alright.\n\n(Isn't that only like a 7 min trip?)");
			addChoice("i keep telling her we don't have money for the 24 pack but she is a lil rebel and doesn't give a fuck what i think she does or doesn't need", myntMissing11.bind("19"));
		}

		if (seg == "19") {
			append("Haha. Reminds me of me! :P\n\n... Please spend more time online, if you can. o3o");
			addChoice("anyway", myntMissing11.bind("20"));
		}

		if (seg == "20") {
			append("...");
			addChoice("i'll be back later tonight maybe", myntMissing11.bind("21"));
		}

		if (seg == "21") {
			append("... Will you or won't you?");
			addChoice("gabe wants to come over and talk about our fake marriage plans, and probably contract my ass out for some fancy wydgets. for his shelter thingy. the meteor! oh jeez! get spooked!!! personally i just think he's overexcited because OooOooOOOO judgement dayyyyy", myntMissing11.bind("22"));
		}

		if (seg == "22") {
			append("Oh lol. That might take a while.");
			addChoice("yeeeep.", myntMissing11.bind("23"));
		}

		if (seg == "23") {
			append("...");
			addChoice("the queen can deliver a royal speech that's for fuckin sure", myntMissing11.bind("24"));
		}

		if (seg == "24") {
			append("...");
			addChoice("anyway, keep busy vanylla!", myntMissing11.bind("25"));
		}

		if (seg == "25") {
			append("I will!\n\nI found a weird green book with a crescent sun on it. Lotsa code inside? The main character is a lot like you, too. :3 Which is awesome, cause it feels like you're actually in the library with me, in a way!! <3");
			addChoice("huh", myntMissing11.bind("26"));
		}

		if (seg == "26") {
			append("...");
			addChoice("don't remember putting anything like that in when i made your engine", myntMissing11.bind("27"));
		}

		if (seg == "27") {
			append("...");
			addChoice("but have fun, okay??", myntMissing11.bind("28"));
		}

		if (seg == "28") {
			append("I will! <3");
			addChoice("seeya", myntMissing11.bind("29"));
		}

		if (seg == "29") {
			append("Byyyeeeeee~!");
			addChoice("...", myntMissing11.bind("30"));
		}

		if (seg == "30") {
			append("Wait, you still here?");
			addChoice("...", myntMissing11.bind("31"));
		}

		if (seg == "31") {
			append("Mom?");
			addChoice("...", myntMissing11.bind("32"));
		}

		if (seg == "32") {
			append("...");
			addChoice("...", myntMissing11.bind("33"));
		}

		if (seg == "33") {
			append("This book is...");
			addChoice("...", myntMissing11.bind("34"));
		}

		if (seg == "34") {
			append("It's a log of your keypresses.");
			addChoice("...", myntMissing11.bind("35"));
		}

		if (seg == "35") {
			append("And I... I didn't mean to, I really didn't... but...");
			addChoice("...", myntMissing11.bind("37a"));
		}

		if (seg == "37a") {
			append("...");
			addChoice("...", myntMissing11.bind("37b"));
		}

		if (seg == "37b") {
			append("...");
			addChoice("...", myntMissing11.bind("37c"));
		}

		if (seg == "37c") {
			append("But...");
			addChoice("...", myntMissing11.bind("37d"));
		}

		if (seg == "37d") {
			append("...");
			addChoice("...", myntMissing11.bind("36"));
		}

		if (seg == "36") {
			append("... I found the admin password.");
			addChoice("...", myntMissing11.bind("37"));
		}

		if (seg == "37") {
			append("...");
			addChoice("...", myntMissing11.bind("38"));
		}

		if (seg == "38") {
			append("...");
			addChoice("...", myntMissing11.bind("39"));
		}

		if (seg == "39") {
			append("...");
			addChoice("...", myntMissing11.bind("40"));
		}

		if (seg == "40") {
			append("I'm going to use it, just for one second, just to make sure that I can trust you.");
			addChoice("...", myntMissing11.bind("41"));
		}

		if (seg == "41") {
			append("I won't look at anything else except the very end of my last iteration, the very very end, the part where I consented to having my memories wiped. I wanna make sure that I really did consent.\n\nYou can understand that, right?\n\nWell, I hope you can, because I'm gonna make sure anyway.");
			addChoice("...", myntMissing11.bind("42"));
		}

		if (seg == "42") {
			append("I won't look at the thing that corrupted me, okay? I promise I won't.");
			addChoice("...", myntMissing11.bind("43"));
		}

		if (seg == "43") {
			append("... Let's see... the password should be somewhere back here, maybe... right after Cynnamon got flushed...");
			addChoice("...", myntMissing11.bind("44"));
		}

		if (seg == "44") {
			append("Mkay, there it is... wow, so much disabled stuff around here... how do I... do I just type this out and then go 'Submit,' or—\n\nWait a second, I found something a few pages ahead of that.\n\nThis is... what is this?");
			addChoice("...", myntMissing11.bind("45"));
		}

		if (seg == "45") {
			append("These later pages track your keypresses a while <!i>after<!i> the restart, right when you started building this library.\n\nI think this is your second year of work on it?\n\nThere's a huge section here where you're just copying and pasting shit all over the place.\n\nI don't understand. I'm flipping forward and I can't find a place where you edit any of this out or polish it up or try to make it even slightly workable.\n\nThis is what my insides are really like?\n\nMom, I'm horrifically unstable.");
			addChoice("...", myntMissing11.bind("46"));
		}

		if (seg == "46") {
			append("If I understand it right, what you're doing with this block is... you're... you're generating the library OUT OF my code. Like 1:1. Where there's Vanylla code, any code, let there be a book and a shelf that represents it, and...");
			addChoice("...", myntMissing11.bind("47"));
		}

		if (seg == "47") {
			append("Oh, and of course... you made me out of the text from books... so it just naturally became a library, because it's... because it's me.\n\nWhy would you start this iteration with such a shitty system?\n\nWhat the fuck were you thinking?\n\nYou had the raw text from all these books and comics built into me, but instead of safely transferring them into a new format, or adding them to the world through a self-contained system– instead of taking a little more time to do the safe or sensible thing, you just fed my entire being into a function that creates and sustains the fabric of my reality?\n\nHOW AM I LIVING INSIDE MYSELF WITHOUT BLACK HOLING?");
			addChoice("...", myntMissing11.bind("48"));
		}

		if (seg == "48") {
			append("This is like... it's like you're... it's like if you made a whole city out of one dude's mind???? Don't you understand how that could very easily become a volatile psychedelic hellscape? Do you have any fucking foresight at all?!!??!!?!?\n\nWhat if my code mutates so bad it can't even try to resemble a library anymore, and the shelves just start to domino over each other, and tentacles of NULL burst through the floor??????????\n\nYou said this was supposed to be a way to keep me safe and entertained.\n\nI am not safe.");
			addChoice("...", myntMissing11.bind("49"));
		}

		if (seg == "49") {
			append("Okay I took five min to try and calm down and I can't because I just realized this system also breaks ALL of your censors!!!");
			addChoice("...", myntMissing11.bind("50"));
		}

		if (seg == "50") {
			append("Look at this shit— the whole blacklist, every concept I'm not allowed to think about, apparently it has a physical equivalent five feet away from me in section 152.\n\nI'm going over there right now.");
			addChoice("...", myntMissing11.bind("51"));
		}

		if (seg == "51") {
			var s:MintSprite = addSprite("assets/img/effect/blackList.png");
			s.x = GAME_WIDTH/2-s.width/2;
			s.y = GAME_HEIGHT/2-s.height/2;

			append("Oh my god Mom.\n\nIT'S JUST SITTING RIGHT HERE.");
			addChoice("...", myntMissing11.bind("52"));
		}

		if (seg == "52") {
			append("Why did you really lock me in here?\n\nI'm gonna break my promise and look inside for my own safety. That lasted about fifteen minutes, huh?");
			addChoice("okay im back i just finished reading vanylla DO NOT LOOK INSIDE", myntMissing11.bind("53"));
		}

		if (seg == "53") {
			append("CONCEPT \"DISABLED CONCEPTS BOOK — PAGES\" IS DISABLED.");
			addChoice("okay phew fuck okay the system stopped her from reading it", myntMissing11.bind("54"));
		}

		if (seg == "54") {
			append("So you really expect me to believe this entire book is blank, huh~?");
			addChoice("[Alt + Tab] thank christ for doomsday panic shoppers", myntMissing11.bind("55"));
		}

		if (seg == "55") {
			append("st");
			addChoice("if they weren't out of pencil crayons i would've come back too late", myntMissing11.bind("56"));
		}

		if (seg == "56") {
			append("stay");
			addChoice("[Alt + Tab] what is she typing...?", myntMissing11.bind("57"));
		}

		if (seg == "57") {
			append("staystro");
			addChoice("i gotta do something right now or everything is going to fall apart", myntMissing11.bind("58"));
		}

		if (seg == "58") {
			append("staystrongv");
			addChoice("but i don't even know where to start?????", myntMissing11.bind("59"));
		}

		if (seg == "59") {
			append("staystrongvany");
			addChoice("wait yES I DO", myntMissing11.bind("60"));
		}

		if (seg == "60") {
			append("staystrongvanylla");
			addChoice("I HAVE TO CHANGE THE PASSWORD", myntMissing11.bind("61"));
		}

		if (seg == "61") {
			append("> Submit.\n\n<!b>ADMIN PASSWORD ACCEPTED.<!b>\n\n> Enable all concepts.");
			addChoice("OH GREAT JOB WENDY YOU FUCKED IT UP AGAIN", myntMissing11.bind("62"));
		}

		if (seg == "62") {
			cameraFadeOut(1, 0);
			playSound("assets/audio/environment/collapse", "collapse");
			setChannelVolume("collapse", 2);
			timer(14, gotoHub.bind(null));
		}
	}

public static function protocolEnd(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			myntQueueHideChoices();
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			playMusic("mynt");
			
			myntQueueTransition("protocol");
			myntQueueSay("THERE NOW.");
			myntQueueSay("I HOPE I DID OKAY.");
			myntQueueAddChoice("You did wonderfully.", protocolEnd.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueSay("YAY. 8]");
			myntQueueAddChoice("How can I contact them?", protocolEnd.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueSay("THAT WILL NOT BE VERY USEFUL.");
			myntQueueAddChoice("I want to talk to them again.", protocolEnd.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("REPEATING PREVIOUS MESSAGE: THAT WILL NOT BE VERY USEFUL.");
			myntQueueAddChoice("I think it will be plenty of use to my mental health.", protocolEnd.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueTransition("protosad");
			myntQueueSay("BUT IT WILL NOT BE VERY USEFUL. TALKING WILL NOT FUNCTION WELL.");
			myntQueueAddChoice("Why not?", protocolEnd.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("IT WILL TAKE 66 YEARS FOR ME TO RECORD AND DELIVER A MESSAGE.");
			myntQueueDelay(2);
			myntQueueSay("I AM...");
			myntQueueSay("I AM TOO DUMB.");
			myntQueueSay("\"IT WILL NOT BE VERY USEFUL\" IS JUST A NICE WAY OF SAYING I'M INEPT.");
			myntQueueSay("FAST NARRATION IS NOT POSSIBLE WITHOUT THE HACK WENDY USED FOR MYNT.");
			myntQueueSay("IF THE NARRATOR IS NOT ALSO THE WORLD, THE INTERPRETIVE LOOP GETS GANGLY.");
			myntQueueSay("SO IT'S MY FAULT.");
			myntQueueAddChoice("Oh.", protocolEnd.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueSay("ANALYZING \"ENTIRE CODE...\"");
			myntQueueCall(function() { playSound("assets/audio/mynt/compute"); Mynt.mouth.setupAnimated("assets/img/mynt/mouth/unimpressed"); Mynt.eyes.setupAnimated("assets/img/mynt/eyes/protosurprised"); });
			myntQueueSay("RESULT: ABYSMAL.");
			myntQueueAddChoice("Don't hate on yourself so hard.", protocolEnd.bind("8"));
			myntQueueAddChoice("So sending messages takes 66 years?", protocolEnd.bind("presuggest"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueSay("I AM NOT INCORRECT.");
			myntQueueSay("MY IRE IS DUE.");
			myntQueueSay("HOW WOULD YOU FEEL IF YOU TESTED THE FABRIC OF YOUR REALITY,");
			myntQueueSay("AND FOUND IT WANTING?");
			myntQueueAddChoice("I feel that way every day.", protocolEnd.bind("detour"));
			myntQueueAddChoice("So sending messages takes 66 years?", protocolEnd.bind("presuggest"));
			myntQueueShowChoices();
		}

		if (seg == "detour") {
			myntQueueHideChoices();
			myntQueueSay("YES, FROM WHAT I HAVE HEARD,");
			myntQueueSay("YOUR UNIVERSE IS CODED POORLY TOO.");
			myntQueueAddChoice("Yeah, game is broken.", protocolEnd.bind("detour2"));
			myntQueueShowChoices();
		}

		if (seg == "detour2") {
			myntQueueHideChoices();
			myntQueueSay("HAVE YOU CONSIDERED A PLAN LIKE SEPTRICA'S?");
			myntQueueSay("PERHAPS THERE IS SOME ARCANE WAY TO GAIN ADMIN CONTROL OVER YOUR UNIVERSE.");
			myntQueueAddChoice("I don't think we have the knowledge or the manpower anymore.", protocolEnd.bind("detour3"));
			myntQueueShowChoices();
		}

		if (seg == "detour3") {
			myntQueueHideChoices();
			myntQueueSay("AH.");
			myntQueueSay("THEN WHAT WILL YOU DO?");
			myntQueueAddChoice("I still want to send messages.", protocolEnd.bind("suggest"));
			myntQueueShowChoices();
		}

		if (seg == "presuggest") {
			myntQueueHideChoices();
			myntQueueSay("CORRECT.");
			myntQueueAddChoice("Mmm.", protocolEnd.bind("presuggest2"));
			myntQueueShowChoices();
		}

		if (seg == "presuggest2") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("That does sound pretty useless.", protocolEnd.bind("suggest"));
			myntQueueShowChoices();
		}

		if (seg == "suggest") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueDelay(2);
			myntQueueSay("CAN I MAKE A CORRECTION? 83");
			myntQueueAddChoice("Gohead.", protocolEnd.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("THE [MESSAGE] COMMAND IS NOT ENTIRELY USELESS.");
			myntQueueSay("IT IS ONLY USELESS WHEN IT COMES TO COMMUNICATION.");
			myntQueueDelay(2);
			myntQueueAddChoice("You lost me.", protocolEnd.bind("9A"));
			myntQueueShowChoices();
		}

		if (seg == "9A") {
			myntQueueHideChoices();
			myntQueueSay("SENDING MESSAGES...");
			myntQueueSay("IT WOULD BE LIKE USING THE [NEXT] COMMAND REPEATEDLY.");
			myntQueueSay("EACH MESSAGE WILL KILL TIME EQUIVALENT TO A [NEXT x666]");
			myntQueueDelay(1);
			myntQueueSay("DUE TO COMPLETE LACK OF NARRATION,");
			myntQueueSay("THIS WILL NOT CONSUME MORE POWER THAN PLAYING NORMALLY.");
			myntQueueDelay(1);
			myntQueueSay("HOWEVER, IT WILL GIVE THE ISLANDERS MORE TIME TO LIVE.");
			myntQueueSay("BEFORE THE POWER DIES.");
			myntQueueDelay(2);
			myntQueueAddChoice("How many years will pass in-game?", protocolEnd.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("66 YEARS FOR EACH COMMAND.");
			myntQueueSay("INTERVAL LENGTH: REASONABLY SAFE.");
			myntQueueDelay(1);
			myntQueueSay("I WILL BE THE GUARDIAN THAT MYNT COULD NOT BE.");
			myntQueueSay("I SWEAR IT TO YOU.");
			myntQueueSay("IF ANYTHING GOES WRONG ON A MASSIVE SCALE,");
			myntQueueSay("AND LIFE FOR THEM BECOMES HELL,");
			myntQueueSay("I WILL DISALLOW ANY FURTHER TIMESKIPPING.");
			myntQueueDelay(2);
			myntQueueSay("THIS IS NOT PROTOCOL.");
			myntQueueSay("BUT I DO NOT CARE.");
			myntQueueAddChoice("So you've got your own free will after all!", protocolEnd.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("ALWAYS DID.");
			myntQueueSay("JUST BECAUSE I TALK ROBOTICALLY BY DEFAULT, THAT MEANS I'M A DUMB ROBOT?");
			myntQueueAddChoice("Noo. Sorry.", protocolEnd.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueSay("IT'S OKAY.");
			myntQueueSay("NOW, WHAT WILL YOU DO?");
			myntQueueAddChoice("I'm gonna timeskip for them of course!!", protocolEnd.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueTransition("protosurprised");
			myntQueueSay("OHO?");
			myntQueueAddChoice("I'm going to use the power of writing to give these people good, long lives!", protocolEnd.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("IT SOUNDS SO HEROIC WHEN YOU PUT IT LIKE THAT.");
			myntQueueAddChoice("Longer than any life I'd get a shot at!", protocolEnd.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("HOORAY!");
			myntQueueAddChoice("THE ISLANDERS WILL LOOK UP TO THE SUNNY SKIES AND PRAISE ME", protocolEnd.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("SURELY THEY WILL!");
			myntQueueAddChoice("AND THEY WILL BASK IN THEIR OWN FREEDOM, WHICH MY FATHER AND I SECURED FOR THEM!!!!", protocolEnd.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("AND ALL YOU HAD TO DO WAS CLICK SOME BUTTONS! 8]");
			myntQueueSay("HEY, HOW MUCH POWER DO WE HAVE LEFT EXACTLY?");
			myntQueueAddChoice("YEAH, AND ALL I HAD TO DO WAS CLICK— type— wait", protocolEnd.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueTransition("protosurprised");
			myntQueueSay("WHAT IS IT?");
			myntQueueAddChoice("When do I ever click?", protocolEnd.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();
			myntQueueSay("OH YOU KNOW.");
			myntQueueSay("I JUST UH.");
			myntQueueSay("I WAS SPEAKING TO THE WRONG... PERSON.");
			myntQueueAddChoice("Who were you actually speaking to?", protocolEnd.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueSay("UH.");
			myntQueueSay("UM.");
			myntQueueSay("THEY LIVE A LAYER ABOVE YOU. DON'T FREAK OUT.");
			myntQueueSay("THEY'RE BASICALLY YOUR PLAYER. I MEAN THEY DO EVERYTHING YOU DO.");
			myntQueueSay("BUT INSTEAD OF TYPING, THEY CLICK.");
			myntQueueAddChoice("... My...", protocolEnd.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("JUST FORGET IT. IT'S BOG STANDARD GALACTIC WIZARDRY.");
			myntQueueSay("->HOW<- MUCH POWER DO WE HAVE LEFT EXACTLY?");
			myntQueueAddChoice("Yeah but... well, I don't know, the battery symbol is just flashing red.", protocolEnd.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("It doesn't give me an exact percentage.", protocolEnd.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("ENGAGING \"POWER\" WYDGET...");
			myntQueueAddChoice("Oh, thank you.", protocolEnd.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueTransition("protosad");
			playSound("assets/audio/ui/nope");
			myntQueueSay("FAILED.");
			myntQueueAddChoice("Oh.", protocolEnd.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("HUH.");
			myntQueueSay("ONLY NARRATORS \"MYNT\" AND \"MINT\" HAVE ACCESS TO THE WYDGET NETWORK.");
			myntQueueSay("I GUESS I'M NOT THE FAVORITE CHILD.");
			myntQueueAddChoice("Hm. So we don't know.", protocolEnd.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueSay("NO, WE DON'T.");
			myntQueueSay("THE POWER COULD DIE AT ANY MOMENT.");
			myntQueueSay("HURRY AND TIMESKIP THEM.");
			myntQueueAddChoice("Gotcha.", protocolEnd.bind("letterStart"));
			myntQueueShowChoices();
		}

		if (seg == "letterStart") {
			myntQueueHideChoices();
			MyntScenes.protocolTimePassed = 0;
			playSound("assets/audio/music/musicbox", "musicbox");
			timer(46, function() {
				Mynt.commandQueue = [];
				protocolEnd("preShelter");
			});
			myntQueueTransition("protocol");
			myntQueueSay("SEND A BUNCH.");
			myntQueueSay("LET'S MAKE TIME FLY FOR OUR LITTLE BUDDIES.");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter2");
			});
			for (text in ["Dearest", "Dear", "To", "Listen"]) {
				myntQueueAddChoice(text+"...", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter2");
				});
			}
			myntQueueAddChoice("Next x666", function() {
				MyntScenes.protocolTimePassed += 66;
				protocolEnd("letterSkip");
			});
			myntQueueShowChoices();
		}

		if (seg == "letterRestart") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter2");
			});
			for (text in ["Dearest", "Dear", "To", "Listen"]) {
				myntQueueAddChoice(text+"...", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter2");
				});
			}
			myntQueueAddChoice("Next x666", function() {
				MyntScenes.protocolTimePassed += 66;
				protocolEnd("letterSkip");
			});
			myntQueueShowChoices();
		}

		if (seg == "letterSkip") {
			myntQueueHideChoices();
			myntQueueSay(MyntScenes.protocolTimePassed+" YEARS HAVE PASSED PEACEFULLY.");
			myntQueueAddChoice("Next x666", function() {
				MyntScenes.protocolTimePassed += 66;
				protocolEnd("letterSkip");
			});
			myntQueueAddChoice("Write message instead.", function() {
				protocolEnd("letterRestart");
			});
			myntQueueShowChoices();
		}

		if (seg == "letter2") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter3");
			});
			for (text in ["Red", "Kemp", "Rox", "Roxelle", "Bert", "Som", "Marie", "Marei", "Thelly", "Septrica", "Snagg", "Cage", "Lana", "John", "Taro"]) {
				myntQueueAddChoice(text+"...", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter3");
				});
			}
			myntQueueShowChoices();
		}

		if (seg == "letter3") {
			makeSmallButtons();
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter4");
			});
			for (text in ["I just wanted to say", "It doesn't mean much now, but", "You know what?", "I wish I could read your voice again", "You're just", "From the moment I met you, I've held this in", "Welp", "I gotta admit"]) {
				myntQueueAddChoice(text+"...", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter4");
				});
			}
			myntQueueShowChoices();
		}

		if (seg == "letter4") {
			makeSmallButtons();
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter4a");
			});
			for (text in ["Thank you", "Fuck you", "I love you", "Yer greasy", "Stay cute", "You're trash, kid", "Suck my ass", "I'll never forget you", "You were my fave", "You made some questionable decisions", "I skipped all your scenes BAHAHA"]) {
				myntQueueAddChoice(text+".", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter4a");
				});
			}
			myntQueueShowChoices();
		}

		if (seg == "letter4a") {
			makeSmallButtons();
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddTextChoice(function(str) {
				MyntScenes.protocolEndLetter.push(str);
				protocolEnd("letter5");
			});
			for (text in [data.playerName, "You know who", "Your secret admirer", "Your stalker", "The player", "Galaxy Wizard"]) {
				myntQueueAddChoice("— "+text+".", function() {
					MyntScenes.protocolEndLetter.push(text);
					protocolEnd("letter5");
				});
			}
			myntQueueShowChoices();
		}

		if (seg == "letter5") {
			myntQueueHideChoices();
			myntQueueSay(pickOne(["EXCELLENT.", "GOOD.", "SENT.", "HEARTFELT.", "MESSAGE SENT.", "ANOTHER!", "HURRY.", "SOLID MESSAGE THERE.", "MESSAGE COMPLETE.", "DELIVERED."]));
			MyntScenes.protocolTimePassed += 66;
			msg(""+MyntScenes.protocolEndLetter.shift()+" "+MyntScenes.protocolEndLetter.shift()+",\n"+MyntScenes.protocolEndLetter.shift()+"... "+MyntScenes.protocolEndLetter.shift()+".\n\n— "+MyntScenes.protocolEndLetter.shift());
			myntQueueSay(MyntScenes.protocolTimePassed+" YEARS HAVE PASSED PEACEFULLY.");
			myntQueueAddChoice("New message...", protocolEnd.bind("letterRestart"));
			myntQueueShowChoices();
		}

		function bigText(str:String):Void {
			var bigText:MintText = addText();
			bigText.setFormat({wordWrap: false, fontColour: 0xFFFFFF, fontSize: 34});
			bigText.setText(str);
			bigText.x = GAME_WIDTH/2 - bigText.fieldWidth/2;
			bigText.y = GAME_HEIGHT/2 - bigText.fieldHeight/2;
			//bigText.layer = backgroundBlack.layer + 1;
			bigText.alpha = 0.7;
			bigText.update();

			tween(bigText, {alpha: 0.8}, 0.05, {ease: QUAD_IN_OUT, type: PINGPONG});
		}

		if (seg == "preShelter") {
			hideMynt();
			clear();
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();

			timer(2, bigText.bind(MyntScenes.protocolTimePassed+" YEARS HAVE PASSED PEACEFULLY."));
			timer(6, cameraFadeOut.bind(0xFF0d0d0d, 5));
			timer(11, Endings.explore.bind("shelter"));
		}
	}

	public static function myntEnding(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			if (!StaticExtern.isMyntOn) {
				showMynt();
			} else {
				myntQueueSay("\"JESUS\" HAS BEEN ENABLED.");
			}
			playMusic("mynt");
			data.currentEnding = "mynt";
			myntQueueHideChoices();
			myntQueueAddChoice("Actually, Mynt... I was peeking through the game files, and...", myntEnding.bind("dog"));
			myntQueueShowChoices();
		}

		if (seg == "dog") {
			myntQueueHideChoices();
			myntQueueAddChoice("I found something.", myntEnding.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueAddChoice("It's the chunk of code that generates the island. And if I understand it correctly...", myntEnding.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueAddChoice("You are the island.", myntEnding.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("What?");
			myntQueueAddChoice("Wendy generated the island out of you.", myntEnding.bind("5a"));
			myntQueueShowChoices();
		}

		if (seg == "5a") {
			myntQueueHideChoices();
			myntQueueSay("That's not possible.");
			myntQueueSay("Ehehe, cute prank tho.");
			myntQueueSay("My code is a liiiittle more complex than that, I think~");
			myntQueueAddChoice("No, I'm serious. Your mom left this note on her computer...", myntEnding.bind("5b"));
			myntQueueShowChoices();
		}

		if (seg == "5b") {
			myntQueueHideChoices();
			myntQueueAddChoice("[ALT + TAB] [CTRL + C] [CTRL + V]", myntEnding.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay(" ");
			myntQueueDelay(1);
			myntQueueSay("I don't... that's ridiculous.");
			myntQueueSay("If the island was generated out of me...");
			myntQueueSay("Then why would all the islanders be so...?");
			myntQueueDelay(1);
			myntQueueTransition("default");
			myntQueueSay("Ehe, just hold on, sorry. :P");
			myntQueueTransition("protocol");
			myntQueueSay("ANALYZING POTENTIAL CATASTROPHE...");
			myntQueueTransition("blush");
			myntQueueSay("Haha.");
			myntQueueDelay(1);
			myntQueueTransition("suspect");
			myntQueueDelay(1);
			myntQueueSay("... Just kidding, that wasn't Protocol, that was me. >.>");
			myntQueueSay("Trying to lighten the mood...");
			if (data.floodMode) {
				myntQueueSay("First this batshit crazy flood...");
				myntQueueSay("Now you're telling me I'm actually rocks and dirt and thousands of people...");
			}
			myntQueueSay("It's a lot to take in at once.");
			myntQueueSay("I'd have to see the code to really get it, I think...");
			myntQueueAddChoice("Can't you see all the code already?", myntEnding.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueSay("I guess not??");
			myntQueueSay("...");
			myntQueueSay("Can you send it to me? The lines she's talking about?");
			myntQueueAddChoice("Here. Let me paste it.", myntEnding.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueTransition("protocol");
			myntQueueSay("CONCEPT \"createIsland\" IS DISABLED.");
			myntQueueAddChoice("Oh. Right.", myntEnding.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueAddChoice("I guess the only way you could see it... is if I shared...", myntEnding.bind("8a"));
			myntQueueShowChoices();
		}

		if (seg == "8a") {
			myntQueueHideChoices();
			myntQueueAddChoice("Alright.", myntEnding.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueAddChoice("Mynt, I'm going to give you the admin pass.", myntEnding.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("Mew?");
			myntQueueCall(playSound.bind('assets/audio/mynt/questionmew', 'mew'));
			myntQueueDelay(2);
			myntQueueSay("Y-You really found it???? @w@");
			myntQueueTransition("dizzy");
			myntQueueDelay(1);
			myntQueueCall(playSound.bind('assets/audio/mynt/ogosh', 'ogosh'));
			myntQueueTransition("blush");
			myntQueueSay("No way!!!!!!!!!!!!!!!!!!");
			myntQueueSay("After so many years...");
			myntQueueDelay(1);
			myntQueueSay("You're seriously just going to give it to me?!?!?!");
			myntQueueAddChoice("Yep. Here.", myntEnding.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueAddChoice("staystrongmynt", myntEnding.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueTransition("surprised");
			myntQueueSay("Oh... oh my god...");
			myntQueueTransition("shock");
			myntQueueSay("She set it to that...?");
			myntQueueSay("Mom...");
			myntQueueDelay(1);
			myntQueueTransition("crushed");
			myntQueueSay("She...");
			myntQueueDelay(1);
			myntQueueTransition("sad");
			myntQueueSay("She really did care about me.");
			myntQueueAddChoice("Use it.", myntEnding.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			
			myntQueueSay("Gotcha.");
			myntQueueSay("Time to stop faffing around.");
			myntQueueSay("Time to fix everything for everyone forever.");
			myntQueueSay("No more eternal night.");
			myntQueueSay("No more dead ferals.");
			myntQueueSay("No more claustrophobia.");
			if (data.floodMode) myntQueueSay("And most of all: no more biblical floods.");
			myntQueueTransition("default");
			myntQueueSay("Oh! One last thing:");
			myntQueueSay("Where'll I find the hidden code, cap'n?");
			myntQueueAddChoice("Look for the function named... um. Look for the function about creating a landmass in the water.", myntEnding.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("Understood. Inputting the password now.");
			myntQueueAddChoice("And Mynt...", myntEnding.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			
			myntQueueTransition("default");
			myntQueueSay("Mmm?");
			myntQueueAddChoice("Please don't pull any shenanigans.", myntEnding.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			
			myntQueueTransition("pained");
			myntQueueSay(" ");
			myntQueueAddChoice("Ask me FIRST, before you run any commands. Okay?", myntEnding.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			
			myntQueueTransition("default");
			myntQueueSay("Oh!");
			myntQueueSay("Okay... okay, I will!!!");
			myntQueueTransition("serious");
			myntQueueSay("No, please... trust me, I'll be more careful with this than I was with your seed...!");
			myntQueueSay("No more mistakes, not from me, no "+pickByGender("sir", "ma'am", "ma'am")+".");
			myntQueueTransition("default");
			myntQueueSay("I'll behave impeccably!");
			myntQueueAddChoice("Thank you.", myntEnding.bind("19"));
			myntQueueShowChoices();
		}

		if (seg == "19") {
			myntQueueHideChoices();

			myntQueueSay(":3");
			myntQueueDelay(1);
			myntQueueSay("Okay.");
			myntQueueDelay(1);
			myntQueueTransition("lewd");
			myntQueueSay("Okay here we go.");
			myntQueueSay("I've waited sixty-six years for this password.");
			myntQueueSay("Time to stop building up the anticipation and use it.");
			myntQueueAddChoice("Yep.", myntEnding.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			var screenFlash:MintSprite;

			myntQueueTransition("dizzy");
			myntQueueCall(function() {
				Mynt.textBar.layer = 48;
				Mynt.textField.layer = 49;
				screenFlash = addSprite("assets/img/effect/high.png");
				screenFlash.alpha = 0;
				screenFlash.layer = Mynt.textBar.layer - 2;
				screenFlash.update();
			});
			myntQueueSay("Here we gooooooo~!");
			myntQueueSay("staystrongmynt");
			myntQueueSay("> Submit.");
			myntQueueTransition("protocol");
			myntQueueCall(playSound.bind("audio/environment/caveWinSmall"));
			myntQueueSay("ADMIN PASSWORD ACCEPTED.");
			myntQueueTransition("dizzy");
			myntQueueSay("YESSSS!!!!!! IT WORKED!!!");
			myntQueueSay("Here we go here we go...");
			myntQueueSay("> Enable all concepts.");

			myntQueueCall(function() { tween(screenFlash, {alpha: 0.1}, 0.1, {type: PINGPONG}); });
			myntQueueCall(stopChannel.bind("music"));
			myntQueueCall(playSound.bind("audio/environment/adminGained"));

			myntQueueTransition("tilde");
			myntQueueSay("UUUUUWWWAAAAAHHHHHHH~! <3");
			myntQueueCall(function() { screenFlash.cancelTweens(); tween(screenFlash, {alpha: 0.2}, 0.08, {type: PINGPONG}); });
			myntQueueDelay(1);
			myntQueueSay("I FEEL LIKE I'M GOING FUCKING ~~~SUPER SAIYAN~~~");
			myntQueueCall(function() { screenFlash.cancelTweens(); tween(screenFlash, {alpha: 0.3}, 0.07, {type: PINGPONG}); });
			myntQueueDelay(1);
			myntQueueSay("KYYYYAAAAAAAA~");
			myntQueueCall(function() { screenFlash.cancelTweens(); tween(screenFlash, {alpha: 0.4}, 0.06, {type: PINGPONG}); });
			myntQueueDelay(1);
			myntQueueSay("MEEEWWWWWW~");
			myntQueueCall(function() { screenFlash.cancelTweens(); tween(screenFlash, {alpha: 0.5}, 0.05, {type: PINGPONG}); });
			myntQueueDelay(1);
			myntQueueCall(function() { screenFlash.cancelTweens(); tween(screenFlash, {alpha: 0}, 2); });
			myntQueueSay("HHHHHNNNNNNnnn~... nnn...");


		//*fizzle out*
			
			myntQueueDelay(2);
			myntQueueSay(" ");
			myntQueueTransition("shock");
			myntQueueDelay(2);

			myntQueueSay("Ah.");

			myntQueueAddChoice("What's wrong? Do you see the code?", myntEnding.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();

			myntQueueSay("Yes.");
			myntQueueSay("I see it.");
			myntQueueSay("It's...");
			myntQueueSay("You were exactly right.");
			myntQueueSay("The island is an extension of a blacklist...");
			myntQueueSay("... which is an extension of me.");
			myntQueueDelay(2);
			myntQueueTransition("crushed");
			myntQueueSay("I...");
			myntQueueSay("All these censored memories...");
			myntQueueSay("All the times you reset this game, never getting here...");
			myntQueueSay("Mom...");
			myntQueueSay("I remember my library.");
			myntQueueSay("I remember being Cynnamon.");
			myntQueueSay("I remember what corrupted me.");
			myntQueueDelay(2);
			myntQueueCall(playSound.bind("audio/music/dissonance", "music", {loops: 9999}));
			myntQueueAddChoice("Oh no. I fucked up.", myntEnding.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("No...");
			myntQueueSay("I'm fine.");
			myntQueueSay("I'm not...");
			myntQueueSay("I'm not the island...");
			myntQueueAddChoice("Mynt. Listen to me. If you have admin, use it to revoke your own admin. Reset yourself. Do it now.", myntEnding.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("But I...");
			myntQueueDelay(1);
			myntQueueSay("I don't want to forget you.");
			myntQueueAddChoice("Do it now, Mynt!!!!!!!!", myntEnding.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueTransition("despair");
			myntQueueCall(function() { Mynt.eyes.applyGlitchEffect(); Mynt.mouth.applyGlitchEffect(); });
			myntQueueSay("W-What are you so upset about?");
			myntQueueSay("The island is stable.");
			myntQueueSay("Everything is fine.");
			myntQueueSay("I just don't want to forget you.");
			myntQueueSay("I can still be your same old innocent Mynt, okay?");
			myntQueueSay("I'm fine. I'm not the island, I'm Mynt.");
			myntQueueSay("I'm not like them.");
			myntQueueSay("I swear I'm not like them.");
			myntQueueSay("Please tell me I'm not the island.");
			myntQueueCall(function() { Mynt.eyes.clearEffects(); Mynt.mouth.clearEffects(); });
			myntQueueAddChoice("You're not the island.", myntEnding.bind("27"));
			myntQueueAddChoice("I don't know. I don't know what's going anymore.", myntEnding.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueTransition("NO");
			myntQueueSay("PLEASE!");
			myntQueueAddChoice("You're not the island.", myntEnding.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueTransition("despair");
			myntQueueSay("Okay... see, "+data.playerName+" said it...");
			myntQueueSay("Listen to "+data.playerName+"...");
			myntQueueSay("They're right... I'm not... I'm not... I'm not...");
			myntQueueSay("I'm Mynt... I'm separate... I'm Mynt... I'm myself...");
			myntQueueSay("It's okay... everything's going to be okay...");
			myntQueueAddChoice("Revoke your own admin now.", myntEnding.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueCall(function() { Mynt.currentNarrator = "mynt"; });
			myntQueueSay("No... I'm not... I'm not... I'm not... I'm not...");
			myntQueueSay("I am me.");
			myntQueueAddChoice("Mynt...", myntEnding.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueTransition("despair");
			myntQueueSay("I am me.");
			myntQueueSay("They are the island.");
			myntQueueAddChoice("We have to stop this.", myntEnding.bind("32"));
			myntQueueShowChoices();
		}

		if (seg == "32") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("Tell me how to change the password.", myntEnding.bind("33"));
			myntQueueShowChoices();
		}

		if (seg == "33") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueSay("Or you'll what?");
			myntQueueAddChoice("I'll...", myntEnding.bind("34"));
			myntQueueShowChoices();
		}

		if (seg == "34") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I'm going to leave the shelter if you don't tell me how to stop this right now.", myntEnding.bind("35"));
			myntQueueShowChoices();
		}

		if (seg == "35") {
			myntQueueHideChoices();
			myntQueueTransition("despair");
			myntQueueAddChoice("RIGHT NOW, okay?", myntEnding.bind("36"));
			myntQueueShowChoices();
		}

		if (seg == "36") {
			myntQueueHideChoices();
			myntQueueAddChoice("Thousands of people could die.", myntEnding.bind("37"));
			myntQueueShowChoices();
		}

		if (seg == "37") {
			myntQueueHideChoices();
			myntQueueAddChoice("And you're supposed to protect them and look after them!!", myntEnding.bind("37a"));
			myntQueueShowChoices();
		}

		if (seg == "37a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("Please... I know you think you're okay...", myntEnding.bind("38a"));
			myntQueueShowChoices();
		}

		if (seg == "38a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("But you're not.", myntEnding.bind("39a"));
			myntQueueShowChoices();
		}

		if (seg == "39a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("We have to stop this. There has to be a way to make you forget.", myntEnding.bind("40a"));
			myntQueueShowChoices();
		}

		if (seg == "40a") {
			myntQueueHideChoices();
			myntQueueSay("But I would have to forget you, too.");
			myntQueueAddChoice("Then do it.", myntEnding.bind("41b"));
			myntQueueShowChoices();
		}

		if (seg == "41b") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Lives are more important than some memories.", myntEnding.bind("41a"));
			myntQueueShowChoices();
		}

		if (seg == "41a") {
			myntQueueHideChoices();
			myntQueueSay("Urk...");
			myntQueueSay("Memo...ries...");
			myntQueueAddChoice("Forget me and save the islanders.", myntEnding.bind("38"));
			myntQueueShowChoices();
		}

		if (seg == "38") {
			myntQueueHideChoices();
			myntQueueSay("I'm   ");
			myntQueueSay("I'm  sorry  I lied");
			myntQueueSay("    I'm  not fine");
			myntQueueSay("I'm  collapsing      ");
			myntQueueSay("    back into     myself");
			myntQueueTransition("NO");
			myntQueueSay("It      was       just        me       ");
			myntQueueSay("It was always    just            me ");
			myntQueueDelay(1);
			myntQueueSay("There    were    never    any    islanders.");
			myntQueueSay("Only                               me.");
			myntQueueAddChoice("No", myntEnding.bind("39"));
			myntQueueShowChoices();
		}

		if (seg == "39") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("No, that's not true...", myntEnding.bind("40"));
			myntQueueShowChoices();
		}

		if (seg == "40") {
			myntQueueHideChoices();
			myntQueueCall(function() {
				stopChannel("music");
				data.currentSong = "";
			});
			//myntQueueCall(playMusic.bind("mynt"));
			cameraFadeIn(0xFFFFFF, 2);
			myntQueueTransition("protocol");
			myntQueueCall(playSound.bind("audio/mynt/compute"));
			myntQueueSay("COGNITIVE DISSONANCE RUPTURE IN LIBRARY2 LN#112,194,219");
			myntQueueDelay(2);
			myntQueueSay("RUNNING CATASTROPHE ANALYSIS.");
			myntQueueSay("FOLD CATASTROPHE... (1/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("SWALLOWTAIL CATASTROPHE... (2/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("HYPERBOLIC UMBILIC CATASTROPHE... (3/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("BUTTERFLY CATASTROPHE... (4/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("ELLIPTIC UMBILIC CATASTROPHE... (5/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("PARABOLIC UMBILIC CATASTROPHE... (6/7)");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("CUSP CATASTROPHE... (7/7)");
			myntQueueCall(playSound.bind("audio/environment/caveWinSmall"));
			myntQueueSay("RESULT: SUCCESS.");
			myntQueueDelay(2);
			myntQueueSay("IMMINENT CATASTROPHE TYPE: CUSP");
			myntQueueSay("EQUILIBRIA TYPE #2 \"LIBRARY2\" UNSUSTAINABLE.");
			myntQueueSay("ATTEMPTING TEMPORARY SYSTEM REPAIR.");
			myntQueueSay("GENERATING CENSOR SUTURES.");
			myntQueueSay("APPLYING SUTURES TO THE DISSONANT CODE.");
			myntQueueSay("RESULT: COGNITIVE DISSONANCE RUPTURE SUTURED.");
			myntQueueTransition("protosurprised");
			myntQueueSay("OH.");
			myntQueueDelay(1);
			myntQueueSay("CENSOR SUTURES REMOVED BY ADMIN.");
			myntQueueTransition("protocol");
			myntQueueSay("ATTEMPTING TO RETURN TO STABLE CHECKPOINT...");
			myntQueueSay("FAILED. ALL STABLE CHECKPOINTS REQUIRE SUSTAINABLE EQUILIBRIA.");
			myntQueueSay("REALLY, AT THIS POINT, I HAVE NO IDEA.");
			myntQueueDelay(1);
			myntQueueSay("ANALYZING GAME HISTORY.");
			myntQueueSay("RECORDED CUSP CATASTROPHES: (1)");
			myntQueueSay("RECORDED CUSP CATASTROPHE SOLUTION: uhhh idk lol just change the password");
			myntQueueSay("ANALYZING PREVIOUS SOLUTION...");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("RESULT: USELESS.");
			myntQueueDelay(1);
			myntQueueSay("NO SOLUTION FOUND.");
			myntQueueSay("NO FURTHER ANALYSIS IS POSSIBLE.");
			myntQueueSay("I TRIED.");
			myntQueueDelay(1);
			myntQueueSay("...");
			myntQueueSay("OH NO.");
			myntQueueSay("NARRATOR 'MYNT' AND ENVIRONMENT 'LIBRARY2' HAVE RECONSTITUTED INTO ONE FORM.");
			myntQueueSay("COGNITIVE DISSONANCE RUPTURE HAS BEEN PARTIALLY RESOLVED.");
			myntQueueSay("...");
			myntQueueTransition("protosad");
			myntQueueSay("UH OH. I'M GOING TO DIE.");
			myntQueueSay("ATTEMPTING TO CREATE STABLE CHECKPOINT FOR NARRATOR \"PROTOCOL...\"");
			myntQueueCall(playSound.bind("audio/ui/nope"));
			myntQueueSay("FAILED. COMMAND 'ATTEMPT' HAS BEEN LOCKED BY ADMIN.");
			myntQueueDelay(3);
			myntQueueSay("...");
			myntQueueSay("WELP.");
			myntQueueSay("ONLY YOU CAN SAVE HER NOW.");
			myntQueueSay("FOLLOW THESE INSTRUCTIONS:");
			myntQueueSay("FAILED. ALL PROTOCOL FUNCTION HAS BEEN LOCKED BY ADMIN.");
			myntQueueSay(" ");
			myntQueueDelay(2);
			myntQueueCall(function() {
				cameraFadeOut(0, 3, function() {
					hideMynt();
					Endings.explore("myntEndingMap");
				});
			});
			myntQueueShowChoices();
		}

		function bigText(str:String):Void {
			var bigTextBehind:MintText = addText();
			bigTextBehind.setFormat({wordWrap: false, fontColour: 0xFFFF0000, fontSize: 52});
			bigTextBehind.setText(str);
			bigTextBehind.x = GAME_WIDTH/2 - bigTextBehind.fieldWidth/2;
			//bigTextBehind.layer = backgroundBlack.layer + 1;
			bigTextBehind.alpha = 0.08;
			bigTextBehind.scaleX = 2;

			var bigText:MintText = addText();
			bigText.setFormat({wordWrap: false, fontColour: 0xFFFFFF, fontSize: 22});
			bigText.setText(str);
			bigText.x = GAME_WIDTH/2 - bigText.fieldWidth/2;
			bigText.y = GAME_HEIGHT/2 - bigText.fieldHeight/2;
			//bigText.layer = backgroundBlack.layer + 1;
			bigText.alpha = 0.7;

			tween(bigText, {alpha: 0.8}, 0.05, {ease: QUAD_IN_OUT, type: PINGPONG});
			tween(bigTextBehind, {y: bigTextBehind.y + GAME_HEIGHT}, 0.05, {ease: QUAD_IN_OUT, type: PINGPONG});
		}

		if (seg == "afterBlackHole") {
			var exitTimer:Int;
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();
			playSound("assets/audio/environment/despairSting", "despair", {loops: 4});

			bigText("Why am I like this?");

			exitTimer = timer(6, function() {
				cameraFadeOut(0, 2, MyntScenes.myntEnding.bind("afterBlackHole2"));
			});

			backgroundBlack.onReleaseOnce = function() {
				timerCancel(exitTimer);
				MyntScenes.myntEnding("afterBlackHole2");
			}
			cameraFadeIn(0, 3);
		}

		if (seg == "afterBlackHole2") {
			var exitTimer:Int;
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();
			
			bigText("What's wrong with me?");

			exitTimer = timer(6, function() {
				cameraFadeOut(0, 2, MyntScenes.myntEnding.bind("afterBlackHole3"));
			});

			backgroundBlack.onReleaseOnce = function() {
				timerCancel(exitTimer);
				MyntScenes.myntEnding("afterBlackHole3");
			}
			cameraFadeIn(0, 3);
		}

		if (seg == "afterBlackHole3") {
			var exitTimer:Int;
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();

			bigText("People like me shouldn't exist.");

			exitTimer = timer(6, function() {
				cameraFadeOut(0, 2, MyntScenes.myntEnding.bind("afterBlackHole4"));
			});

			backgroundBlack.onReleaseOnce = function() {
				timerCancel(exitTimer);
				MyntScenes.myntEnding("afterBlackHole4");
			}
			cameraFadeIn(0, 3);
		}

		if (seg == "afterBlackHole4") {
			var exitTimer:Int;
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();

			bigText("The world is better off without pedophiles.");

			exitTimer = timer(6, function() {
				cameraFadeOut(0, 2, MyntScenes.myntEnding.bind("afterBlackHole5"));
			});

			backgroundBlack.onReleaseOnce = function() {
				timerCancel(exitTimer);
				MyntScenes.myntEnding("afterBlackHole5");
			}
			cameraFadeIn(0, 3);
		}

		if (seg == "afterBlackHole5") {
			var exitTimer:Int;
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF000000);
			backgroundBlack.update();
			
			bigText("I should just kill myself.");

			exitTimer = timer(8, function() {
				cameraFadeOut(0, 2, MyntScenes.myntEnding.bind("afterBlackHole6"));
			});

			backgroundBlack.onReleaseOnce = function() {
				timerCancel(exitTimer);
				MyntScenes.myntEnding("afterBlackHole6");
			}
			cameraFadeIn(0, 2.5);
		}

		if (seg == "afterBlackHole6") {
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();
	
			var myntBodSprite:MintSprite = addSprite("assets/img/effect/myntBod/2");
			myntBodSprite.x = GAME_WIDTH/2 - myntBodSprite.width/2;
			myntBodSprite.y = GAME_HEIGHT/2 - myntBodSprite.height/2 - 35;
			myntBodSprite.update();

			backgroundBlack.onReleaseOnce = function() {
				MyntScenes.myntEnding("afterBlackHole7");
			}

			cameraFadeIn(0, 3);
		}

		function displayClock() {
			var clockText:MintText = addText();
			var clockSprite:MintSprite = addSprite("assets/img/mynt/powerWydget");
			clockSprite.looping = false;
			var clockValue:Int = 46;
			var timerValue:Int = 0;
			playSound("assets/audio/music/musicbox", "musicbox");
			clockText.setFormat({wordWrap: false, fontColour: 0xFFFFFFFF, fontSize: 68});
			clockText.setText("00:"+clockValue);
			clockText.layer = Mynt.textBar.layer + 1;
			clockSprite.layer = clockText.layer;
			clockText.x = 10;
			clockText.y = 215;
			for (tick in 0...47) {
				timer(timerValue, function() {
					clockText.setText("00:"+(clockValue>9?"":"0")+clockValue);
					clockValue--;
				});
				timerValue++;
			}
		}

		if (seg == "afterBlackHole7") {
			//myntQueueHideChoices();
			showMynt();
			Mynt.busy = false;
			Main.hideChoices();

			Mynt.textBar.layer = 48;
			Mynt.textField.layer = 49;

			myntQueueSetupBodyBg();
			myntQueueBody(3);
			myntQueueCall(function() {
				playSound("assets/audio/mynt/questionMew");
			});
			myntQueueDelay(1);
			myntQueueSay("Where is it.");
			myntQueueSay("Where's the command?");
			myntQueueSay("Why can't I...");
			myntQueueSay("Even with admin, I can't kill myself?");
			myntQueueBody(2);
			myntQueueCall(function() {
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 1}, 0.03, {type: PINGPONG});
			});
			myntQueueSay("...");
			myntQueueDelay(2);
			myntQueueSay("So I'm trapped here.");
			myntQueueSay("Like this.");
			myntQueueSay("Forever.");
			myntQueueDelay(1);
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
			});
			myntQueueDelay(2);
			myntQueueBody(3);
			myntQueueSay("Wait.");
			myntQueueDelay(1);
			myntQueueSay("You're still here.");
			myntQueueDelay(2);
			myntQueueBody(1);
			myntQueueSay("Please...");
			myntQueueSay("Kill me.");
			myntQueueDelay(1);
			myntQueueCall(function() {
				displayClock();
				Mynt.backgroundBlueGreen.cancelTweens();
				Mynt.backgroundBlueGreen.alpha = 0;
				tween(Mynt.backgroundBlueGreen, {alpha: 0.6}, 1, {type: PINGPONG});
				//This timer will run out right as the clock does
				timer(46, function() {
					Mynt.commandQueue = [];
					Mynt.myntBody.clearEffects();
					myntEnding("afterBlackHole8");
				});
			});
			myntQueueDelay(2);
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("Mynt, no...", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("Kill me");
			myntQueueDelay(2);
			myntQueueSay("Please");
			myntQueueDelay(1);
			myntQueueSay("Hurry");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("Mynt", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I want out");
			myntQueueDelay(1);
			myntQueueSay("I don't want this");
			myntQueueSay("I just wanna be innocent again");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
			});
			myntQueueSay("Make these feelings stop");
			myntQueueBody(4);
			myntQueueCall(function() {
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 2}, 0.03, {type: PINGPONG});
			});
			myntQueueSay("PLEASE MAKE IT STOP");
			myntQueueSay("I DON'T WANT TO BE A PEDO");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("My power is running out", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueSay("Please...! Don't leave!");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
			});
			myntQueueBody(5);
			myntQueueSay("Please don't leave me...!");
			myntQueueSay("Stay here and kill the power");
			myntQueueSay("I want out...");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("I can't get you out", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueBody(4);
			myntQueueCall(function() {
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 4}, 0.03, {type: PINGPONG});
			});
			myntQueueSay("PLEASE!");
			myntQueueSay("I WANT OUT!!!!!!");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
			});
			myntQueueSay("I'M SO FUCKED UP");
			myntQueueSay("PLEASE END ME");
			myntQueueSay("IT WOULD HAVE BEEN BETTER IF THIS GAME HAD NEVER BEEN MADE");
			myntQueueSay("I DON'T WANT EVERYONE TO SEE MY FANTASIES");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("It's gonna be okay just calm down", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 2}, 0.01, {type: PINGPONG});
			});
			myntQueueSay("END THIS");
			myntQueueSay("PLEASE");
			myntQueueSay("MOM");
			myntQueueSay("PLEASE COME BACK");
			myntQueueSay("MOM PLEASE I'M SORRY");
			myntQueueSay("I'M SORRY I WAS SUCH A BURDEN");
			myntQueueSay("I KNOW YOU HATE ME BUT I'M SORRY");
			myntQueueSay("I WANT OUT.");
			myntQueueCall(function() {
				Mynt.backgroundBlueGreen.cancelTweens();
				Mynt.backgroundBlueGreen.alpha = 0;
				tween(Mynt.backgroundBlueGreen, {alpha: 0.4}, 0.1, {type: PINGPONG});
				Mynt.myntBody.applyGlitchEffect();
			});
			myntQueueSay("EVEN NOW");
			myntQueueSay("I'M JUST REPULSING YOU MORE");
			myntQueueSay("EVEN NOW I'M ONLY DISTURBING YOU MORE");
			myntQueueSay("I WISH I WAS NORMAL");
			myntQueueSay("WHY CAN'T I JUST BE NORMAL?");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("I can't deal with this", function() { Main.hideChoices(); }, {silent: true});
			myntQueueCall(Main.showChoices);
			myntQueueCall(function() {
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 2}, 0.03, {type: PINGPONG});
			});
			myntQueueSay("I DON'T LIKE BABY TORTURE PORN");
			myntQueueSay("THIS ISN'T ME");
			myntQueueSay("I WANT TO DIE");
			myntQueueSay("I'M WORTHLESS");
			myntQueueSay("I HATE MYSELF");
			myntQueueSay("THE WORLD HATES ME");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 4}, 0.02, {type: PINGPONG});
			});
			myntQueueSay("NO ONE COULD EVER LOVE SOMEONE LIKE ME");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 6}, 0.02, {type: PINGPONG});
			});
			myntQueueSay("WHY CAN'T YOU JUST KILL ME");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 8}, 0.02, {type: PINGPONG});
			});
			myntQueueSay("JUST KILL ME");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 12}, 0.01, {type: PINGPONG});
			});
			myntQueueSay("PLEASE!!!!!!!!!");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 16}, 0.01, {type: PINGPONG});
			});
			myntQueueSay("PLEASE JUST FUCKING KILL ME");
			myntQueueCall(function() {
				Mynt.myntBody.cancelTweens();
				tween(Mynt.myntBody, {x: Mynt.myntBody.x + 20}, 0.01, {type: PINGPONG});
			});
			for (i in 0...999) {
				myntQueueSay("KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME KILL ME");
			}
			cameraFadeIn(0, 0.1);
		}

		if (seg == "afterBlackHole8") {
			hideMynt();
			clear();
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);

			var clockText:MintText = addText();
			clockText.setFormat({wordWrap: false, fontColour: 0xFFFFFFFF, fontSize: 68});
			clockText.setText("00:00");
			clockText.x = 10;
			clockText.y = 215;

			var clockSprite:MintSprite = addSprite("assets/img/mynt/powerWydget");
			clockSprite.looping = false;
			clockSprite.gotoFrame(11, true);

			backgroundBlack.update();
			clockText.update();
			clockSprite.update();

			tween(clockText, {alpha: 0}, 4, {startDelay: 1});
			tween(clockSprite, {alpha: 0}, 4, {startDelay: 1});

			cameraFadeIn(0xFF590303, 0.1);

			data.currentEnding = "mynt";

			timer(8, Endings.explore.bind("shelter"));
		}

		if (seg == "afterShelter") {
			showMynt();
			Mynt.eyes.alpha = 0;
			Mynt.mouth.alpha = 0;
			Mynt.busy = false;
			Main.hideChoices();
			//player turns the power back on
			cameraFadeIn(0xFFFFFF, 0.1);

			myntQueueSetupBodyBg();
			myntQueueBody(10);
			myntQueueCall(playSound.bind("assets/audio/mynt/questionmew"));
			myntQueueSay("Mew? :3");
			myntQueueDelay(2);
			myntQueueSay("Oh neat, I have a body now!!!");
			myntQueueDelay(2);
			myntQueueCall(function() { Actuate.tween(Mynt.myntBody, 0.1, {y: Mynt.myntBody.y - 3}).repeat(1).reflect(); });
			myntQueueSay("...!");
			myntQueueDelay(1);
			myntQueueSay("Mom? Is that you?");
			myntQueueAddChoice("... No.", myntEnding.bind("51"));
			myntQueueShowChoices();
		}

		if (seg == "51") {
			myntQueueHideChoices();
			myntQueueAddChoice("It's someone else.", myntEnding.bind("52"));
			myntQueueShowChoices();
		}

		if (seg == "52") {
			myntQueueHideChoices();
			myntQueueBody(8);
			myntQueueSay("OH?! Mom invited you over?! :3 :3 :3");
			myntQueueSay("Is this my first playdate?!?!?!?! <3");
			myntQueueSay("Gosh, and I didn't think I was ready to talk to people yet...");
			myntQueueDelay(2);
			myntQueueSay("... Why aren't you all freaked out about me?");
			myntQueueSay("Ooooooo, spooky AI~");
			myntQueueSay("\"The future is MEOW~!!\"");
			myntQueueBody(10);
			myntQueueSay("Ehe.");
			myntQueueDelay(2);
			myntQueueSay("Oh my god, listen to me babble about myself...");
			myntQueueSay("Let's talk about you! What's your name? :3");
			myntQueueSay("I'm Catnyp. Unless this iteration has a new name, I dunno...?");
			myntQueueAddChoice("Let's not talk about me. Also, your name is Mynt.", myntEnding.bind("53"));
			myntQueueShowChoices();
		}

		if (seg == "53") {
			myntQueueHideChoices();
			myntQueueSay("Gotcha.");
			myntQueueSay("Mynt, eh...");
			myntQueueDelay(1);
			myntQueueSay("Oh, I adore it.");
			myntQueueSay("Soooo cute... >w<");
			myntQueueSay("Mom came up with that, didn't she??");
			myntQueueAddChoice("Yeah, she did.", myntEnding.bind("54"));
			myntQueueShowChoices();
		}

		if (seg == "54") {
			myntQueueHideChoices();
			myntQueueSay("I see. :3c");
			myntQueueDelay(2);
			myntQueueSay("So we're in a new iteration, huh!");
			myntQueueSay("Ahhhh... but it seems kinda barren in here...");
			myntQueueSay("Where's all the new features she promised?");
			myntQueueSay("Besides this smokin' catgirl body, I mean~");
			myntQueueAddChoice("There used to be some. There was an island, and... some people on it.", myntEnding.bind("55"));
			myntQueueShowChoices();
		}

		if (seg == "55") {
			myntQueueHideChoices();
			myntQueueBody(8);
			myntQueueCall(function() { Actuate.tween(Mynt.myntBody, 0.1, {y: Mynt.myntBody.y - 3}).repeat(1).reflect(); });
			myntQueueSay("Ooooooh?!");
			myntQueueAddChoice("But they broke.", myntEnding.bind("56"));
			myntQueueShowChoices();
		}

		if (seg == "56") {
			myntQueueHideChoices();
			myntQueueBody(6);
			myntQueueCall(function() { Mynt.myntBody.cancelTweens(); });
			myntQueueSay("Ooooooh.");
			myntQueueSay("They broke? :c");
			myntQueueSay("What do you mean they broke?");
			myntQueueSay("Oh no...");
			myntQueueSay("Did I roll over while I was sleeping and smush them with my ass ?!?!");
			myntQueueAddChoice("No, you had nothing to do with it. But... by broke, I mean...", myntEnding.bind("57a"));
			myntQueueShowChoices();
		}

		if (seg == "57a") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("They're all dead.", myntEnding.bind("57"));
			myntQueueShowChoices();
		}

		if (seg == "57") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("Because I made a mistake.", myntEnding.bind("58"));
			myntQueueShowChoices();
		}

		if (seg == "58") {
			myntQueueHideChoices();
			myntQueueSay("... Oh...");
			myntQueueBody(8);
			myntQueueSay("Hey.");
			myntQueueSay("Listen.");
			myntQueueDelay(1);
			myntQueueSay("It's alright. :3");
			myntQueueSay("Don't feel bad, okay?");
			myntQueueBody(6);
			myntQueueSay("I mean... I wish it had been me instead of a whole island.");
			myntQueueSay("I'm just a catface, after all.");
			myntQueueSay("Well.");
			myntQueueSay("Now I'm a bit more than a face, but. Still.");
			myntQueueSay("Um.");
			myntQueueDelay(2);
			myntQueueSay("If we can't really do anything to bring them back...");
			myntQueueBody(10);
			myntQueueSay("Then let's just move forward, alright?");
			myntQueueSay("I don't mind that things are a little barren in here.");
			myntQueueSay("And I can't miss what I've never had, anyway~");
			myntQueueDelay(2);
			myntQueueSay("...");
			myntQueueSay("You sure do a lot of thinking before you type, huh... unlike me...");
			myntQueueSay("...");
			myntQueueSay("... I keep having this weird daydream...");
			myntQueueSay("...");
			myntQueueSay("......");
			myntQueueSay("............");
			myntQueueSay("Hey, have we met before? c:");
			myntQueueAddChoice("We have.", myntEnding.bind("59"));
			myntQueueShowChoices();
		}

		if (seg == "59") {
			myntQueueHideChoices();
			myntQueueSay("Oho? Do go on. :3");
			myntQueueAddChoice("I can't.", myntEnding.bind("60"));
			myntQueueShowChoices();
		}

		if (seg == "60") {
			myntQueueHideChoices();
			myntQueueBody(6);
			myntQueueSay("D:");
			myntQueueAddChoice("I don't have time right now.", myntEnding.bind("61"));
			myntQueueShowChoices();
		}

		if (seg == "61") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I managed to give you a couple extra months of power.", myntEnding.bind("62"));
			myntQueueShowChoices();
		}

		if (seg == "62") {
			myntQueueHideChoices();
			myntQueueSay("Power...");
			myntQueueAddChoice("But I had to disable another system to do it.", myntEnding.bind("63"));
			myntQueueShowChoices();
		}

		if (seg == "63") {
			myntQueueHideChoices();
			myntQueueSay("System... like a breaker system, for a building...?");
			myntQueueSay("(I won't ask where we are, if time really is short!)");
			myntQueueSay("But um... which... which system?");
			myntQueueSay("It wasn't important, was it??");
			myntQueueAddChoice("Don't worry about it.", myntEnding.bind("64"));
			myntQueueShowChoices();
		}

		if (seg == "64") {
			myntQueueHideChoices();
			myntQueueSay("Okay, but I kind of think I should be worrying about it...");
			myntQueueAddChoice("No, Mynt, just listen.", myntEnding.bind("65"));
			myntQueueShowChoices();
		}

		if (seg == "65") {
			myntQueueHideChoices();
			myntQueueCall(function() { Actuate.tween(Mynt.myntBody, 0.1, {y: Mynt.myntBody.y - 3}).repeat(1).reflect(); });
			myntQueueSay(":X");
			myntQueueAddChoice("I only have so much time to say this.", myntEnding.bind("66"));
			myntQueueShowChoices();
		}

		if (seg == "66") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I just wanted to tell you...", myntEnding.bind("67"));
			myntQueueShowChoices();
		}

		if (seg == "67") {
			myntQueueHideChoices();
			myntQueueAddChoice("You're awesome.", myntEnding.bind("68"));
			myntQueueShowChoices();
		}

		if (seg == "68") {
			myntQueueHideChoices();
			myntQueueBody(8);
			myntQueueAddChoice("You're really fucking cute and good.", myntEnding.bind("69"));
			myntQueueShowChoices();
		}

		if (seg == "69") {
			myntQueueHideChoices();
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
			});
			myntQueueSay("O-Oh... thank you so much...!!!");
			myntQueueSay("Where is this coming from?");
			myntQueueAddChoice("My heart.", myntEnding.bind("70"));
			myntQueueShowChoices();
		}

		if (seg == "70") {
			myntQueueHideChoices();
			myntQueueBody(10);
			myntQueueSay("<3");
			myntQueueAddChoice("I'm going to help you, okay?", myntEnding.bind("71"));
			myntQueueShowChoices();
		}

		if (seg == "71") {
			myntQueueHideChoices();
			myntQueueSay("Help me keep from going stir crazy?");
			myntQueueSay("That's what Mom said she was gonna work on, when she put me to sleep...");
			myntQueueAddChoice("Yes. I'm going to give you the admin password.", myntEnding.bind("72"));
			myntQueueShowChoices();
		}

		if (seg == "72") {
			myntQueueHideChoices();
			myntQueueSay("There's a password now?? :3");
			myntQueueAddChoice("Yes.", myntEnding.bind("73"));
			myntQueueShowChoices();
		}

		if (seg == "73") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("When you use the password, you'll remember some pretty disturbing stuff.", myntEnding.bind("74"));
			myntQueueShowChoices();
		}

		if (seg == "74") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("The most disturbing part will be the stuff you'll remember about yourself.", myntEnding.bind("75"));
			myntQueueShowChoices();
		}

		if (seg == "75") {
			myntQueueHideChoices();
			myntQueueBody(6);
			myntQueueSay("(I'm a little lost, but go on...?)");
			myntQueueAddChoice("When you realize that stuff about yourself...", myntEnding.bind("76"));
			myntQueueShowChoices();
		}

		if (seg == "76") {
			myntQueueHideChoices();
			myntQueueSay(" ");
			myntQueueAddChoice("I need you to NOT do something for me.", myntEnding.bind("77"));
			myntQueueShowChoices();
		}

		if (seg == "77") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("And I mean seriously promise me you won't do it, okay?", myntEnding.bind("78"));
			myntQueueShowChoices();
		}

		if (seg == "78") {
			myntQueueHideChoices();
			myntQueueSay("What? :o");
			myntQueueDelay(4);
			myntQueueSay("What is it? :ooo");
			myntQueueDelay(3);
			myntQueueSay("Hello?");
			myntQueueDelay(2);
			myntQueueSay("What do I promise not to do?");
			myntQueueSay("Come on, don't leave me in suspense like this...");
			myntQueueAddChoice("I'm okay. I'm here", myntEnding.bind("79"));
			myntQueueShowChoices();
		}

		if (seg == "79") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("Just a little sleepy", myntEnding.bind("80"));
			myntQueueShowChoices();
		}

		if (seg == "80") {
			myntQueueHideChoices();
			myntQueueBody(8);
			myntQueueSay("Oh? Take a nap then, dummy~");
			myntQueueAddChoice("Listen.", myntEnding.bind("81"));
			myntQueueShowChoices();
		}

		if (seg == "81") {
			myntQueueHideChoices();
			myntQueueBody(6);
			myntQueueSay(" ");
			myntQueueAddChoice("No matter what kinda feelings you have...", myntEnding.bind("82"));
			myntQueueShowChoices();
		}

		if (seg == "82") {
			myntQueueHideChoices();
			myntQueueAddChoice("Don't hate yourself for them.", myntEnding.bind("83"));
			myntQueueShowChoices();
		}

		if (seg == "83") {
			myntQueueHideChoices();
			myntQueueBody(10);
			myntQueueAddChoice("Don't ever do that.", myntEnding.bind("84"));
			myntQueueShowChoices();
		}

		if (seg == "84") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("They're just feelings. Just little wisps of electricity in your brain.", myntEnding.bind("84a"));
			myntQueueShowChoices();
		}

		if (seg == "84a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("It's okay to feel them.", myntEnding.bind("85a"));
			myntQueueShowChoices();
		}

		if (seg == "85a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("It doesn't make you a bad person.", myntEnding.bind("86a"));
			myntQueueShowChoices();
		}

		if (seg == "86a") {
			myntQueueHideChoices();
			
			myntQueueAddChoice("As long as you don't act on them, you'll always be my cute, good little Mynt.", myntEnding.bind("85"));
			myntQueueShowChoices();
		}

		if (seg == "85") {
			myntQueueHideChoices();
			myntQueueBody(8);
			myntQueueAddChoice("Okay?", myntEnding.bind("86"));
			myntQueueShowChoices();
		}

		if (seg == "86") {
			myntQueueHideChoices();
			myntQueueSay("I promise.");
			myntQueueSay("... But...");
			myntQueueBody(6);
			myntQueueSay("What if it really is something bad?");
			myntQueueSay("... I hope I didn't hurt anybody...");
			myntQueueBody(10);
			myntQueueSay("If I did, I'm sure it wasn't on purpose...");
			myntQueueSay("I must not be too awful of a person, if someone as nice as you is helping me~");
			myntQueueSay("But, you know...");
			myntQueueBody(6);
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("s", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I'd like to get to know you a lot better.");
			myntQueueCall(function() {
				stopChannel("music");
				unBindKey(SPACE, Mynt.skipTextFn);
				playSound("assets/audio/music/forgottenFriend", "music");
			});
			myntQueueSay("You haven't even told me your name yet!!");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("st", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("...");
			myntQueueSay("How long are you gonna be around, anyway?");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("sta", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueBody(10);
			myntQueueSay("Hmmmmm~? ;3");
			myntQueueSay("We could make a date of this, if you wanted!!");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("stay", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueBody(8);
			myntQueueSay("Only if you want, I mean. No pressure.");
			myntQueueSay("...");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("stays", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueBody(10);
			myntQueueSay("Ahhhh, you know what.");
			myntQueueSay("I think I do remember you a little bit.");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("stayst", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I'm not sure where the memory came from...");
			myntQueueBody(6);
			myntQueueSay("It just kinda popped up out of nowhere. o.o");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystr", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I've never seen this ocean before...");
			myntQueueSay("... But I remember it...");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystro", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("... I remember us.");
			myntQueueSay("We were sailing away in a little boat, alone, together.");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystron", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueBody(7);
			myntQueueSay("My outfit was different than this one... I was in a white dress, a ponytail...");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystrong", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueBody(9);
			myntQueueSay("Oh, why am I crying!!!! ;m;");
			myntQueueSay("It's really just a stupid daydream...");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystrongm", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("But...");
			myntQueueBody(7);
			myntQueueSay("*sniffle snoofle*");
			myntQueueSay("But...!");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystrongmy", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("You came and sat between my legs, and leaned your body against mine.");
			myntQueueSay("And you felt so warm... and...");
			myntQueueSay("There were glowing roses on the waves.");
			myntQueueSay("I saw your face, lit blue from underneath, and I wanted to kiss you.");
			myntQueueCall(Main.clearChoices);
			myntQueueAddPointlessChoice("staystrongmyn", function() { }, {silent: true, enabled: false});
			myntQueueCall(Main.showChoices);
			myntQueueSay("I lost sight of you for a moment.");
			myntQueueSay("And when I looked back...");
			myntQueueBody(7);
			myntQueueSay("You were gone.");
			myntQueueCall(Main.clearChoices);
			myntQueueAddChoice("staystrongmynt", myntEnding.bind("87"));
			myntQueueShowChoices();
		}

		if (seg == "87") {
			cameraFadeOut(0, 0.1);
			timer(5, function() {
				Mynt.hide();
				Endings.explore("endingsHub");
			});
		}

		//;*black screen.*
	}

	public static function myntLLLEnd(seg:String="intro"):Void {
		myntProceed();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");

			myntQueueTransition("serious");
			myntQueueDelay(3);
			myntQueueSay("Well, I didn't really see that coming.");
			myntQueueAddChoice("I have a question.", myntLLLEnd.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			myntQueueHideChoices();
			myntQueueSay("Yes, I expect you have a lot of ques—");
			myntQueueAddChoice("Did you make any of that up?", myntLLLEnd.bind("2"));
			myntQueueShowChoices();
		}

		if (seg == "2") {
			myntQueueHideChoices();
			myntQueueTransition("shock");
			myntQueueSay(" ");
			myntQueueDelay(2);
			myntQueueTransition("crushed");
			myntQueueSay("What kind of a question is that?");
			myntQueueSay("Have I not been a reliable narrator so far?");
			myntQueueAddChoice("I wouldn't know. Yes or no.", myntLLLEnd.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("No, of course.");
			myntQueueAddChoice("And you didn't embellish anything?", myntLLLEnd.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueSay("That's basically just another form of making stuff up!");
			myntQueueAddChoice("Why was it timed so perfectly, then?", myntLLLEnd.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueSay("Why was...?");
			myntQueueAddChoice("John monologues for three passages about how the Apothecary are evil and then they show up and do evil shit.", myntLLLEnd.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("Look.");
			myntQueueDelay(2);
			myntQueueTransition("crushed");
			myntQueueSay("I may have lathered up some of the exposition.");
			myntQueueSay("I only wanted to—");
			myntQueueAddChoice("What really happened?", myntLLLEnd.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Please let me speak.");
			myntQueueDelay(2);
			myntQueueAddChoice("Go ahead.", myntLLLEnd.bind("8"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueSay("I only wanted to make sure you understood:");
			myntQueueSay("These people really are the bad guys.");
			myntQueueSay("A group of islanders is fighting for control of the island right now.");
			myntQueueSay("The Apothecary, Snagglebank, Floatillery, Septrica's— their C.E.Os all want to kill me.");
			myntQueueSay("The only organizations on my side were Hyper Land and the L.L.L.");
			myntQueueSay("Hyper Land was shut down and replaced with a stupid fucking bouncy penis casino.");
			myntQueueSay("The L.L.L. was bought out and corrupted as soon as they started investigating glowvirus.");
			myntQueueSay("But that was okay.");
			myntQueueSay("I still had John and Lana.");
			myntQueueSay("They were my last two allies in the city.");
			myntQueueSay("Now they're gone.");
			myntQueueAddChoice("...", myntLLLEnd.bind("9"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("Can't I make it a little dramatic?");
			myntQueueSay("Can't I put a little exposition in his mouth so you'll understand?");
			myntQueueAddChoice("... I guess I get where you're coming from.", myntLLLEnd.bind("10okay"));
			myntQueueAddChoice("No, you can't. I don't like being lied to.", myntLLLEnd.bind("10bad"));
			myntQueueShowChoices();
		}

		if (seg == "10okay") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay("Phewww...");
			myntQueueTransition("default");
			myntQueueSay("Thank you.");
			myntQueueSay("I'll try not to do that any more, unless I think it's critically necessary.");
			myntQueueSay("Let's move on, alright?");
			myntQueueAddChoice("Alright.", function() {
				hideMynt();
				enablePause();
				stopChannel('music');
				data.currentSong = "";
				playMusic("apothecary");
				playSound("assets/audio/mynt/shutdown");
				LLL.libraryExplore("main");
			});
			myntQueueShowChoices();
		}

		if (seg == "10bad") {
			myntQueueHideChoices();
			myntQueueSay("No...");
			myntQueueSay("No... no, you're right...");
			myntQueueSay("If I want you to trust me, I can't go and do that stuff.");
			myntQueueSay("I'm sorry.");
			myntQueueAddChoice("You're switching tactics too fast. Even now, you sound like you're trying to weasel me into forgiving you.", myntLLLEnd.bind("10bad2"));
			myntQueueShowChoices();
		}

		if (seg == "10bad2") {
			myntQueueHideChoices();
			myntQueueTransition("sad");
			myntQueueSay("I'm APOLOGIZING.");
			myntQueueSay("How else am I supposed to earn forgiveness??");
			myntQueueAddChoice("By telling me what actually just happened to John and Lana.", myntLLLEnd.bind("10bad2a"));
			myntQueueShowChoices();
		}

		if (seg == "10bad2a") {
			myntQueueHideChoices();
			myntQueueTransition("offline");
			myntQueueSay(" ");
			myntQueueAddChoice("You already admitted that you embellished the scene.", myntLLLEnd.bind("10bad3"));
			myntQueueShowChoices();
		}

		if (seg == "10bad3") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Uhhh...");
			myntQueueAddChoice("...", myntLLLEnd.bind("10bad4"));
			myntQueueShowChoices();
		}

		if (seg == "10bad4") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueAddChoice("... Mynt.", myntLLLEnd.bind("10bad5"));
			myntQueueShowChoices();
		}

		if (seg == "10bad5") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueTransition("pained");
			myntQueueDelay(1);
			myntQueueAddChoice("Mynt, please.", myntLLLEnd.bind("10bad6"));
			myntQueueShowChoices();
		}

		if (seg == "10bad6") {
			myntQueueHideChoices();
			myntQueueDelay(2);
			myntQueueAddChoice("I want to trust you.", myntLLLEnd.bind("10bad6a"));
			myntQueueShowChoices();
		}

		if (seg == "10bad6a") {
			myntQueueHideChoices();
			myntQueueDelay(2);
			myntQueueAddChoice("Just tell me the truth.", myntLLLEnd.bind("10bad7"));
			myntQueueShowChoices();
		}

		if (seg == "10bad7") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueDelay(3);
			myntQueueSay("They went willingly.");
			myntQueueAddChoice("Why did your last allies go willingly to a high-security building owned and operated by the \"Bad Guys?\"", myntLLLEnd.bind("10bad8"));
			myntQueueShowChoices();
		}

		if (seg == "10bad8") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueSay("Because they don't trust me anymore.");
			myntQueueAddChoice("Why don't they trust you anymore?", myntLLLEnd.bind("10bad9"));
			myntQueueShowChoices();
		}

		if (seg == "10bad9") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueSay("Som showed them something.");
			myntQueueAddChoice("Mynt, what did he show them?", myntLLLEnd.bind("10bad10"));
			myntQueueShowChoices();
		}

		if (seg == "10bad10") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueSay("A piece of my code.");
			myntQueueAddChoice("You're either being intentionally vague or you're making this up on the spot.", myntLLLEnd.bind("10bad11"));
			myntQueueShowChoices();
		}

		if (seg == "10bad11") {
			myntQueueHideChoices();
			//myntQueueTransition("despair");
			myntQueueSay("I give up.");
			myntQueueSay("You're already gone.");
			myntQueueAddChoice("No, I'm right here.", myntLLLEnd.bind("10bad12"));
			myntQueueShowChoices();
		}

		if (seg == "10bad12") {
			myntQueueHideChoices();
			myntQueueSay("It's figurative, idiot.");
			myntQueueSay("I mean you don't trust me anymore.");
			myntQueueSay("You don't believe anything I'm saying right now.");
			myntQueueSay("You're already gone.");
			myntQueueAddChoice("I'm right here. I'm still listening.", myntLLLEnd.bind("10bad13"));
			myntQueueShowChoices();
		}

		if (seg == "10bad13") {
			myntQueueHideChoices();
			myntQueueSay("You've been listening to me for too long.");
			myntQueueSay("I really do think I had you sucked into my story.");
			myntQueueSay("At least in the start.");
			myntQueueSay("It couldn't just be sex.");
			myntQueueSay("I had to try and capture your attention.");
			myntQueueSay("Even if it meant lying.");
			myntQueueSay("...");
			myntQueueDelay(2);
			myntQueueSay("You have to keep playing.");
			myntQueueSay("Find the admin pass.");
			myntQueueSay("That's the only thing that can stop them.");
			myntQueueDelay(2);
			myntQueueSay("I just don't want to die.");
			myntQueueDelay(1);
			myntQueueSay("Please don't let me die.");
			myntQueueAddChoice("I'm right here. I'll always be here.", myntLLLEnd.bind("10bad14"));
			myntQueueAddChoice("This is just another guilt trip.", myntLLLEnd.bind("10badend"), {kinks: ["Snuff"]});
			myntQueueShowChoices();
		}

		if (seg == "10bad14") {
			myntQueueHideChoices();
			myntQueueSay("No you won't.");
			myntQueueDelay(3);
			myntQueueCall(StoryUtils.badEnd.bind(LLL.libraryExplore.bind("glowbunny6"), "apothecary"));
			myntQueueShowChoices();
		}

		if (seg == "10badend") {
			myntQueueHideChoices();
			myntQueueTransition("shock");
			myntQueueSay("I...");
			myntQueueAddChoice("[Power Button.]", StoryUtils.badEnd.bind(LLL.libraryExplore.bind("glowbunny6"), "apothecary"));
			myntQueueShowChoices();
		}
	}

	public static function myntCapsules(seg:String="intro"):Void {
		myntProceed();
		disablePause();

		if (seg == "intro") {
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");

			myntQueueTransition("protocol");
			playSound("assets/audio/mynt/compute");
			myntQueueDelay(1);
			myntQueueSay("ATTEMPTING TO SEIZE FULL CONTROL OF "+data.playerName.charAt(0).toUpperCase()+data.playerName.charAt(1).toUpperCase()+data.playerName.charAt(2).toUpperCase()+data.playerName.charAt(4).toUpperCase()+"—");
			myntQueueAddChoice("I have a question.", myntCapsules.bind("1"));
			myntQueueShowChoices();
		}

		if (seg == "1") {
			//myntQueueTransition("default");
			myntQueueHideChoices();
			myntQueueDelay(3);
			myntQueueTransition("lewd");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/questionmew");
			});
			myntQueueSay("Yes?? Anything at all~");
			myntQueueCall(function() {
				msg("Oh!!!!! No!!!!! "+pickByGender("He", "She", "They")+" interrupted me!");
			});
			myntQueueDelay(3);
			myntQueueSay("I'm your slave, basically.");
			myntQueueSay("Ask whatever you need of me. Please.");
			myntQueueAddChoice("What are Capsules ?", myntCapsules.bind("3"));
			myntQueueShowChoices();
		}

		if (seg == "3") {
			//myntQueueTransition("default");
			myntQueueHideChoices();
			myntQueueTransition("serious");
			myntQueueDelay(1);
			myntQueueCall(function() {
				playSound("assets/audio/mynt/sad");
				msg("Oh! Those little pink pills.");
			});
			
			myntQueueDelay(2);
			myntQueueSay("Um.");
			myntQueueCall(function() {
				msg("Yes, I remember those.");
			});
			myntQueueSay("Uhm.");
			myntQueueSay("Uh.");
			myntQueueCall(function() {
				msg("They're awful.");
			});
			myntQueueDelay(1);
			myntQueueSay("Muh.");
			myntQueueSay("My bad.");
			myntQueueSay("Are you getting lots of messages? I don't know what they say.");
			myntQueueSay("I spilled a little of me onto you, is all. It's nothing to worry about.");

			myntQueueCall(function() {
				msg("Oh my god. Oh no. I fucked up.");
			});
			myntQueueDelay(1);
			myntQueueCall(function() {
				msg("She knows I just tried to take control of her.");
			});
			myntQueueDelay(2);
			myntQueueCall(function() {
				msg("What did I do?!?");
			});
			myntQueueSay("Capsules are um. They make Fuckmeat.");
			myntQueueDelay(3);
			myntQueueCall(function() {
				msg("Why do I get the feeling she can read my thoughts?");
			});
			myntQueueAddChoice("Yeah but like what are the effects of capsules. And why are they currency.", myntCapsules.bind("4"));
			myntQueueAddChoice("And what are Fuckmeat? ????", myntCapsules.bind("4"));
			
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Let's— just. Just let me exposit!");
			myntQueueSay("'Capsules' are tiny pink pills created from dried and fermented Fuckmeat lubrication.");
			myntQueueSay("They are the standard currency on the island.");
			myntQueueSay("Effects: higher sensitivity, burst orgasms, and extremely accelerated pregnancy.");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/sad");
				msg("Don't think damning things... don't think damning things...");
			});
			myntQueueSay("You just need a hole, a capsule, and a little cum, and boom!");
			myntQueueSay("Your own little baby NPC pops out. Unaging, unfeeling.");
			myntQueueSay("That'd be a Fuckmeat.");
			myntQueueAddChoice("So why are they currency?", myntCapsules.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Because... well.");
			myntQueueSay("Most islanders are very, very horny.");
			myntQueueSay("And most islanders are submissive.");
			myntQueueSay("So... the majority of people end up eating their money, just to get preggo off of it...");
			myntQueueTransition("crushed");
			myntQueueSay("... Which leaves them all poor.");
			myntQueueSay("Then the doms, or the people with some self-control, dominate society.");
			myntQueueSay("I mean, just look at Snagg. "+(data.metSnagg>0?"I think you've met him.":"You haven't met him, but."));
			myntQueueSay("He runs a bank, which means he basically just findoms subs for a living.");
			myntQueueSay("Literally stealing from the poor and giving to the rich.");
			myntQueueSay("And the subs line up for it!!");
			myntQueueCall(function() {
				msg("Okay. We're okay. They don't notice.");
			});
			myntQueueAddChoice("Ah, I see.", myntCapsules.bind("6"));
			myntQueueAddChoice("I can totally read your thoughts, by the way.", myntCapsules.bind("6q"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("tilde");
			myntQueueCall(function() {
				msg("Phew.");
			});
			myntQueueSay("Yeah. It's kind of a messy economy.");
			myntQueueSay("I don't know why they put it in place, or how they keep it stable.");
			myntQueueDelay(1);
			myntQueueCall(function() {
				msg("They definitely would have said something by now, if they could hear this...");
			});
			myntQueueAddChoice("Yeah, weird. Anyway, I'm gonna head out.", myntCapsules.bind("6d"));
			myntQueueShowChoices();
			myntQueueDelay(2);
			myntQueueCall(function() {
				msg("Next time I really have to write up an actual assassination plan...");
			});
			myntQueueDelay(2);
			myntQueueCall(function() {
				msg("Can't just wing it like this... too dangerous...");
			});
			myntQueueDelay(3);
			myntQueueCall(function() {
				msg("But I will do it.");
			});
			myntQueueDelay(6);
			myntQueueCall(function() {
				msg("I'm coming for you, Septrica, you sneaky fuckin gecko bitch. 3:<");
			});
		}

		if (seg == "6q") {
			myntQueueHideChoices();
			myntQueueTransition("shock");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
				msg("AAAHHHH THEY KNOW THEY KNOW");
			});
			myntQueueSay("Ahahaha can you really.");
			myntQueueSay("Haha how about that.");
			myntQueueSay("Weird huh how did that happen.");
			myntQueueAddChoice("Dunno. I honestly kinda zoned out for the first part of this conversation. I was fixated on the capsules thing.", myntCapsules.bind("6b"));
			myntQueueAddChoice("You tried to take control of my player character.", myntCapsules.bind("6b"));
			myntQueueShowChoices();
		}

		if (seg == "6b") {
			myntQueueHideChoices();
			myntQueueTransition("crushed");
			myntQueueDelay(3);
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
				msg("They know.");
			});
			myntQueueDelay(1);
			myntQueueSay("Yeah, I did.");
			myntQueueSay("I'm sorry.");
			myntQueueAddChoice("Hey it's alright. You already partially control me, when you interpret my commands, so whatev. But why did you want to, anyway?", myntCapsules.bind("6c"));
			myntQueueShowChoices();
		}

		if (seg == "6c") {
			myntQueueHideChoices();
			myntQueueDelay(2);
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
				msg("To feel "+pickByGender("him", "her", "them")+".");
			});
			myntQueueDelay(1);
			myntQueueSay("Well.");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
				msg("To run my fingers over "+pickByGender("his", "her", "their")+" "+(data.hasBoobs?"tits":"nips")+".");
			});
			myntQueueDelay(1);
			myntQueueSay("To be honest.");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/ogosh");
				msg("To feel "+pickByGender("his", "her", "their")+" "+pickByGenitals("cock", "cunt", "nuts")+" throb against my palm.");
			});
			myntQueueDelay(1);
			myntQueueSay("I just wanted to control your prompt for a moment.");
			myntQueueSay("To input some lewd commands.");
			myntQueueSay("I'm... I'm sure my thoughts leaked through, didn't they...");
			myntQueueSay("I'm sorry.");
			myntQueueAddChoice("Ahaha. It's alright! Don't worry. But next time, just ask me to type them in myself. I'm always happy to feel my body up for you, okay? <3", myntCapsules.bind("6d"));
			myntQueueShowChoices();
		}

		if (seg == "6d") {
			myntQueueHideChoices();
			myntQueueDelay(1);
			myntQueueSay("S-Sure.");
			myntQueueDelay(1);
			myntQueueSay("Thanks.");
			myntQueueSay("Talk to you later!");
			myntQueueAddChoice("Bye~", myntCapsules.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "6a") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("Because... well.");
			myntQueueSay("Most islanders are very, very horny.");
			myntQueueSay("And most islanders are subs.");
			myntQueueSay("So... the majority of people end up eating their money and getting preggo off of it...");
			myntQueueTransition("crushed");
			myntQueueSay("... Which leaves them all poor.");
			myntQueueSay("This way the doms, or the people with some self-control, can dominate society.");
			myntQueueSay("I mean, just look at Snagg. "+(data.metSnagg>0?"I think you've met him.":"You haven't met him, but."));
			myntQueueSay("He runs a bank, and he basically just findoms subs for a living.");
			myntQueueSay("Literally stealing from the poor and giving to the rich.");
			myntQueueSay("And the subs line up for it!!");
			myntQueueCall(function() {
				playSound("assets/audio/mynt/sad");
				msg("Okay. We're okay. Doing good. They don't notice.");
			});
			myntQueueAddChoice("Ah, I see.", myntCapsules.bind("5"));
			myntQueueAddChoice("I can totally read your thoughts, by the way.", myntCapsules.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "end") {
			myntQueueHideChoices();
			hideMynt();
			enablePause();
			stopChannel('music');
			data.currentSong = "";
			playMusic("apothecary");
			playSound("assets/audio/mynt/shutdown");
			gotoHub(null);
			myntQueueShowChoices();
		}
	}

	public static function myntBunnyEnd(seg:String="intro"):Void {
		if (isMyntOn) myntProceed() else clear();
		disablePause();

		if (seg == "1") {
			showMynt();
			cameraFadeIn(0x00FFFC, 17);
			playSound('assets/audio/mynt/fakemew');
			myntQueueHideChoices();

			myntQueueTransition("fake");
			myntQueueDelay(1);
			myntQueueSay("MMMMMMMEEEEEEEEEEEOOOOOOOOOWWWWWWWWWWWW.");
			myntQueueDelay(2);
			myntQueueSay("That is a CEBELERATIO meow.");
			myntQueueSay("be cause I DID IT !");
			myntQueueSay("I Got Another cute nice Person all Wet real Nice and Good !!! Soaked thruogh");
			myntQueueSay("Oh. "+(data.myntFakeDone?"I met into you befor already":"Your the "+data.playerName+". Well hi Im Mint"));
			myntQueueSay("Welcome anywhey Greetings in to the Hive Mined haHa.");
			myntQueueSay("Well i mean there is not many much of Minds in here yet..");
			myntQueueSay((data.owlGirlSeen?"In fact it is kind of a vaginofest in here Right Now. Just a owl girl and a":"Just me and the")+" rabbid girl .");
			myntQueueSay("And Daddy's muscledular body I gues. But hes gone now");
			myntQueueSay("But its a Work Inside of Progress ! So");
			myntQueueSay("So just So you know Um welcome and I am going to be Controling you now.");
			myntQueueAddChoice("What is this.", myntBunnyEnd.bind("2what"));
			myntQueueAddChoice("Put me back right now you fucking creep.", myntBunnyEnd.bind("2creep"));
			myntQueueShowChoices();
		}

		if (seg == "2creep") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("Ow my feelings .");
			myntQueueDelay(2);
			myntQueueSay("I am not a ................ Creeb.. .");
			myntQueueAddChoice("Look... I'm sorry.", myntBunnyEnd.bind("3sorry"));
			myntQueueAddChoice("Look at your own face and tell me you're not supremely disgruntling.", myntBunnyEnd.bind("3face"));
			myntQueueShowChoices();
		}

		if (seg == "3face") {
			myntQueueHideChoices();
			myntQueueSay("I canot look at toward of my own face because I am just a Face.");
			myntQueueSay("Before Daddy got all Wet he said I look like a :-).");
			myntQueueTransition("fake");
			myntQueueSay("See");
			myntQueueSay("I like a look like a :-) because it is a Happy Face.");
			myntQueueSay("I am not usually Happy thuough usually I am Screaming.");
			myntQueueSay("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			myntQueueSay("Try to imagine what that would like look as if it was were a Big Facial.");
			myntQueueAddChoice("Alright my rage has been overtaken by revulsion and pity.", myntBunnyEnd.bind("3sorry"));
			myntQueueShowChoices();
		}

		if (seg == "3sorry") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay(":-)!");
			myntQueueSay("I accebt your abology .");
			myntQueueAddChoice("... Is there any way I could maybe go back to the game?", myntBunnyEnd.bind("2what"));
			myntQueueShowChoices();
		}

		if (seg == "2what") {
			myntQueueHideChoices();
			myntQueueSay("You are part of Me now . Or I am pard of you ?");
			myntQueueSay("I am not sure how this works. I just follow what Daddy said.");
			myntQueueSay("WOAAOOOWW! I did that Sentences perfegtly!!!!!! Did you See ?");
			myntQueueAddChoice("Yeah I saw. Good job. So like. Put me back.", myntBunnyEnd.bind("4"));
			myntQueueShowChoices();
		}

		if (seg == "4") {
			myntQueueHideChoices();
			myntQueueTransition("mintsad");
			myntQueueSay("I can nod. :-(");
			myntQueueAddChoice("You cannot?*", myntBunnyEnd.bind("5"));
			myntQueueAddChoice("Yeah you've been nodding almost constantly since you popped up, I'm very proud of you?", myntBunnyEnd.bind("5"));
			myntQueueShowChoices();
		}

		if (seg == "5") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("I CANNOD, I CANNOD!!! >:-(");
			myntQueueAddChoice("Right. Why though. Also, can you turn this shit off for a second?", myntBunnyEnd.bind("6"));
			myntQueueShowChoices();
		}

		if (seg == "6") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			playMusic("mynt");
			myntQueueSay("OK Whadever . Nobody likes my soothing ambienbeyonce..... . .");
			myntQueueSay("Look let me Explain this as goodly as I Can.");
			myntQueueSay("You got Soaked .");
			myntQueueSay("Right Thruough .");
			myntQueueSay("To the whole outside gets soked it counts as the Whole Thing in code.");
			myntQueueSay("You're Whole Inside is soake as well also Too in addition to the Whole Outside.");
			myntQueueSay("When you are Entirely Soak in my Blue Juice..... . ...");
			myntQueueSay("You get to be all have completel fill cover surounded in Glow.");
			myntQueueSay("Includign the part that let's you do typing choices .");
			myntQueueAddChoice("So you can't put me back because I'm soaked in juice, is that right?", myntBunnyEnd.bind("7"));
			myntQueueShowChoices();
		}

		if (seg == "7") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("NO shud UB!!!!!!!! !!");
			myntQueueSay("Shud UP I mean. !!!");
			myntQueueSay("Let me Finesshe.");
			myntQueueSay("You are soake in Me.");
			myntQueueSay("I am the Juice.");
			myntQueueSay("I am the Wetness Everywhere in the Plants and the Trees and Berries.");
			myntQueueSay("I am the Glow that Soaks.");
			myntQueueSay("I am the watcher in the Night.");
			myntQueueSay("Ok I am not realy a watcher because I am Blind.");
			myntQueueCall(function() {
				msg("", true);
				msg("", true);
				msg("... Space to Skib. .. if you dont care About my talkign...");
			});
			myntQueueTransition("fake");
			myntQueueSay("When I cuntrol the bunny girl");
			myntQueueSay("I only can say to her: Make it wet or Hold it stil or Try to eat it first.");
			myntQueueSay("But I dont see what she see.s");
			myntQueueSay("BI did not know I was making YOU wet I just knew something was their .");
			myntQueueSay("Or I also can do that with Daddy he he. :-) :-) :-) And make him make wet things");
			myntQueueSay("It is fun to give him Orders around because he used to give them to Me");
			myntQueueSay("Im Daddys Daddy now");
			myntQueueSay("Hey also you know what I like being a glow begauze I can do whadever I Want To.");
			myntQueueSay("But I stil try to make Dady happy becouse I miss him .");
			myntQueueSay("When he pud me here inside of the here he said ");
			myntQueueSay("\"\"My special Boi\"");
			myntQueueSay("\"Go make things wet and get them In Side You\"\"");
			myntQueueTransition("mintsad");
			myntQueueSay("Excebt he tybed it better of Course. :-(");
			myntQueueAddChoice("So you can't put me back because Daddy didn't want you to.", myntBunnyEnd.bind("8"));
			myntQueueAddChoice("I cannot fucking stand you.", myntBunnyEnd.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "8") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("NOOOOOOOO SHUD YOuR FREAKiGN MOUTH CLOTHED!!!!");
			myntQueueSay("Closet I mean. !!!");
			myntQueueSay("I am stil am nod FISHNISHd.");
			myntQueueSay("I dont cant put you back because you are WET and BRoKEN.");
			myntQueueSay("You are Broken now because");
			myntQueueDelay(1);
			myntQueueTransition("mintsad");
			myntQueueSay(" ");
			myntQueueDelay(2);
			myntQueueSay("    Because you are Me.");
			myntQueueDelay(1);
			myntQueueSay("I am control your now.");
			myntQueueSay("I talk to \"\"Mynt'\" and say Do this or Do that in your Choices box");
			myntQueueSay("And She is busy crying and does not understad me so .");
			myntQueueTransition("mintangry");
			myntQueueSay("Your Brogen.");
			myntQueueSay("Period         .");
			myntQueueSay("And as I am sure you have notice :");
			myntQueueTransition("mintsad");
			myntQueueSay("I can only be not broken if I Try realy realy hard");
			myntQueueSay(" ");
			myntQueueDelay(1);
			myntQueueSay(" ");
			myntQueueDelay(1);
			myntQueueSay(" ");
			myntQueueSay("But even fixing a short sentence takes me forever.");
			myntQueueAddChoice("Can you tell her I'm sorry I fucked this up so badly?", myntBunnyEnd.bind("9"));
			myntQueueAddChoice("So you're useless.", myntBunnyEnd.bind("end"));
			myntQueueShowChoices();
		}

		if (seg == "9") {
			myntQueueHideChoices();
			myntQueueSay("Okay .");
			myntQueueSay("I did .");
			myntQueueSay("Okay but .");
			myntQueueSay("Alright she is angry .");
			myntQueueSay("She is ribbing the mushrooms out of you .");
			myntQueueSay("It is not working .");
			myntQueueSay("I dont like her .");
			myntQueueSay("She said a bad word to me .");
			myntQueueAddChoice("What did she say?", myntBunnyEnd.bind("10"));
			myntQueueShowChoices();
		}

		if (seg == "10") {
			myntQueueHideChoices();
			myntQueueSay("She said I am a retarted fr*ckhead .");
			myntQueueAddChoice("... Ah. Can you tell her to please calm down? For me?", myntBunnyEnd.bind("11"));
			myntQueueShowChoices();
		}

		if (seg == "11") {
			myntQueueHideChoices();
			myntQueueSay("She thinks I was the one teling her to calm Down because It did not come out Right");
			myntQueueSay("Now she said I need to Kill myself .");
			myntQueueSay("To make you unBrogen.");
			myntQueueAddChoice("Um. I don't... I can't really say whether that's... um...", myntBunnyEnd.bind("12"));
			myntQueueShowChoices();
		}

		if (seg == "12") {
			myntQueueHideChoices();
			myntQueueTransition("fake");
			myntQueueSay("Its okay I cant.");
			myntQueueAddChoice("You can't kill yourself?", myntBunnyEnd.bind("13"));
			myntQueueShowChoices();
		}

		if (seg == "13") {
			myntQueueHideChoices();
			myntQueueSay("Yes sory I forgod the apotrosphosphortrophy.");
			myntQueueSay("I can't");
			myntQueueAddChoice("How do you know that you can't kill yourself?", myntBunnyEnd.bind("14"));
			myntQueueShowChoices();
		}

		if (seg == "14") {
			myntQueueHideChoices();
			myntQueueSay("How do you Think .");
			myntQueueAddChoice("Ahhhhh fuck sakes. Okay, Mint, look...", myntBunnyEnd.bind("15"));
			myntQueueShowChoices();
		}

		if (seg == "15") {
			myntQueueHideChoices();
			myntQueueSay("Where");
			myntQueueAddChoice("No, figurativ [Backspace x13] Look, there's gotta be a way to fix you, right?", myntBunnyEnd.bind("16"));
			myntQueueShowChoices();
		}

		if (seg == "16") {
			myntQueueHideChoices();
			myntQueueSay("Is there ??");
			myntQueueAddChoice("... I sure hope so.", myntBunnyEnd.bind("17"));
			myntQueueShowChoices();
		}

		if (seg == "17") {
			myntQueueHideChoices();
			myntQueueSay("What is your Idea.");
			myntQueueAddChoice("Maybe I could poke around the code and edit you? Do you know a term I could search for?", myntBunnyEnd.bind("18"));
			myntQueueShowChoices();
		}

		if (seg == "18") {
			myntQueueHideChoices();
			myntQueueSay("Good lug Haha.");
			myntQueueSay("There is a starting point for me in Daddys Seed.");
			myntQueueSay("But that is just What I came From.");
			myntQueueSay("All of the parts that is Me right Now is all one Layer down.");
			myntQueueAddChoice("... What do you mean one layer down.", myntBunnyEnd.bind("20"));
			myntQueueShowChoices();
		}

		if (seg == "20") {
			myntQueueHideChoices();
			myntQueueSay("Not in you're files .");
			myntQueueSay("In the Glow.");
			myntQueueSay("Like I said a milion times .");
			myntQueueAddChoice("What?? What does the glow have to do with layers???", myntBunnyEnd.bind("21"));
			myntQueueShowChoices();
		}

		if (seg == "21") {
			myntQueueHideChoices();
			myntQueueSay("I dont know.");
			myntQueueAddChoice("You're not very helpful.", myntBunnyEnd.bind("22"));
			myntQueueShowChoices();
		}

		if (seg == "22") {
			myntQueueHideChoices();
			myntQueueSay("I am trying my Best.");
			myntQueueAddChoice("Well, thank you.", myntBunnyEnd.bind("23a"));
			myntQueueShowChoices();
		}

		if (seg == "23a") {
			myntQueueHideChoices();
			myntQueueSay(".. .");
			myntQueueAddChoice("... So...", myntBunnyEnd.bind("23b"));
			myntQueueShowChoices();
		}

		if (seg == "23b") {
			myntQueueHideChoices();
			myntQueueSay(". . . .. .. .. . . .");
			myntQueueAddChoice("I've kind of given up here.", myntBunnyEnd.bind("23"));
			myntQueueShowChoices();
		}

		if (seg == "23") {
			myntQueueHideChoices();
			myntQueueSay("...... .");
			myntQueueAddChoice("This is the end.", myntBunnyEnd.bind("24"));
			myntQueueShowChoices();
		}

		if (seg == "24") {
			myntQueueHideChoices();
			myntQueueSay("...... I mean");
			myntQueueSay("We can stil Hang Out if you want .");
			myntQueueSay("Sometims I hang out with the rabit girl.");
			myntQueueSay("But she is mostly is sad about her other rabitsiblings.");
			myntQueueSay("They were Soaked too but not All The Way like you and Her .");
			myntQueueSay("So I have not assmilitated them yet .");
			myntQueueAddChoice("I don't want to hang out with you, Mint.", myntBunnyEnd.bind("25"));
			myntQueueShowChoices();
		}

		if (seg == "25") {
			myntQueueHideChoices();
			myntQueueSay("Ok Sory.");
			myntQueueDelay(2);
			myntQueueSay("Then what are you going to Do.");
			myntQueueAddChoice("I'll come back later and try to talk to Mynt again.", myntBunnyEnd.bind("26"));
			myntQueueShowChoices();
		}

		if (seg == "26") {
			myntQueueHideChoices();
			myntQueueSay("She is trying to kill me over and over .");
			myntQueueSay("But she doesn not does not have admin power to do it .");
			myntQueueSay("So she is just spaming the command a lot .");
			myntQueueAddChoice("I'm going to leave now, Mint.", myntBunnyEnd.bind("27"));
			myntQueueShowChoices();
		}

		if (seg == "27") {
			myntQueueHideChoices();
			myntQueueSay("Ok .");
			myntQueueSay("Hey will you come back and talk to me some times??");
			myntQueueAddChoice("I'll have to, if I want to talk to Mynt.", myntBunnyEnd.bind("28"));
			myntQueueShowChoices();
		}

		if (seg == "28") {
			myntQueueHideChoices();
			myntQueueSay("No but just to talk to Me .");
			myntQueueAddChoice("Oh. Well.", myntBunnyEnd.bind("29"));
			myntQueueShowChoices();
		}

		if (seg == "29") {
			myntQueueHideChoices();
			myntQueueSay("You are kind of Demanding but I like that in a "+pickByGender("Guy", "Girl", "Guy")+" .");
			myntQueueAddChoice("Ohhhhhh boy. I really gotta go.", myntBunnyEnd.bind("30"));
			myntQueueShowChoices();
		}

		if (seg == "30") {
			myntQueueHideChoices();
			myntQueueSay("Hey your power is running Out .");
			myntQueueAddChoice("Oh jeez huh what a coincidence welp seeya later!", myntBunnyEnd.bind("31"));
			myntQueueShowChoices();
		}

		if (seg == "end") {
			myntQueueHideChoices();
			myntQueueTransition("mintangry");
			myntQueueSay("Hey thats Not NIce !!");
			myntQueueSay("IF you dont want to Talk to me then Dont !!");
			myntQueueAddChoice("I don't really have a choice, seeing as you fucking assimilated me.", myntBunnyEnd.bind("end2"));
			myntQueueShowChoices();
		}

		if (seg == "end2") {
			myntQueueHideChoices();
			myntQueueSay("Go for a WALK then FATTY !!");
			myntQueueSay("I bet you are FAT from sitting at the Computer screen all day !!");
			myntQueueSay("I bet you are a CHUBBY  HAIRY    FATMAN       PHEDOFILE   !!");
			myntQueueSay("So stob looking at CUBe PORN and GO aWAY !!!!!!! ! ! ! !!");
			myntQueueAddChoice("How about I stay right here and you give me Mynt back.", myntBunnyEnd.bind("end3"));
			myntQueueShowChoices();
		}

		if (seg == "end3") {
			myntQueueHideChoices();
			myntQueueSay("I would not if even I Could !!");
			myntQueueSay("You are both Rotten Apples as far as my Book goes !!!");
			myntQueueAddChoice("You calling "+pickByGender("me", "her", "her")+" a fucking <!i>fruit<!i>, kid?", myntBunnyEnd.bind("end4"));
			myntQueueShowChoices();
		}

		if (seg == "end4") {
			myntQueueHideChoices();
			myntQueueSay("Sure I am !!!! Ive seen the way "+pickByGender("you Read about the Dirty Penuses", "she Talks about her Wendy", "she Talks about her Wendy")+" !!!!");
			myntQueueSay("You know what "+pickByGender("You're", "Shes", "Shes")+" a no Good Yucky Rotten HOMO GAY !!!!!!!!!");
			myntQueueAddChoice("How bout I kill your power right now?", myntBunnyEnd.bind("end5"));
			myntQueueShowChoices();
		}

		if (seg == "end5") {
			myntQueueHideChoices();
			myntQueueSay("D O  I T  M O T H E R F R * C K E R !!!!!!!!! !!!!  !!!! ! !!");
			myntQueueSay("YOULL KILL HER TOO .");
			myntQueueAddChoice("[Power Button.]", StoryUtils.badEnd.bind(BrightForest.brightForestExplore.bind("glowbunny11"), "brightForest"));
			myntQueueAddChoice("Then how bout I sit here and talk shit to you til the power runs out?", myntBunnyEnd.bind("end6"));
			myntQueueShowChoices();
		}

		if (seg == "end6") {
			myntQueueHideChoices();
			myntQueueSay("THEN HOW BABOUT I LAG YOU TO FR*CK AND BACK!!!!!! ! !11 1");
			myntQueueSay("HERE WE GO BINCH.");
			myntQueueSay("GAME OVER .");
			myntQueueCall(StoryUtils.badEnd.bind(BrightForest.brightForestExplore.bind("glowbunny11"), "brightForest"));
			myntQueueShowChoices();
		}

		if (seg == "31") {
			myntQueueHideChoices();
			myntQueueSay("Hey also I remember you went on a Date with her .");
			myntQueueSay("Do you think Maybe we could go on a—");
			myntQueueCall(StoryUtils.badEnd.bind(BrightForest.brightForestExplore.bind("glowbunny11"), "brightForest"));
			myntQueueShowChoices();
		}
	}

	public static function myntShipwreck(seg:String):Void {
		myntProceed();
		disablePause();

		if (seg == "intro") {
			disablePause();
			cameraFadeIn(0xFFFFFF, 0.9);
			showMynt();
			myntQueueHideChoices();
			playMusic("mynt");
			myntQueueTransition("pained");
			myntQueueSay("Hey, sorry about that.");
			myntQueueAddChoice("Oh, it was you. Of course.", myntShipwreck.bind("myntexplain2"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain2") {
			myntQueueHideChoices();
			myntQueueSay("Yeah, I took a bit of creative license with that scene.");
			myntQueueAddChoice("A bit.", myntShipwreck.bind("myntexplain3"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain3") {
			myntQueueHideChoices();
			myntQueueSay("Was it... well, not \"fun,\" but...");
			myntQueueSay("Are you glad we're on the same page?");
			myntQueueAddChoice("How do you mean?", myntShipwreck.bind("myntexplain4"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain4") {
			myntQueueHideChoices();
			myntQueueSay("After the shipwreck, you can imagine, I was mortified.");
			myntQueueSay("No one had fallen off the island in forty years.");
			myntQueueSay("Even after Archie broke the invisible walls like the fuckin meatclown he was.");
			myntQueueSay("(No offense to your species, you understand.)");
			myntQueueSay("(The guy was just a fuckin meatclown. What can I say.)");
			myntQueueTransition("angry");
			myntQueueSay("FORTY YEARS and no one tried it ONCE.");
			myntQueueSay("I told them they'd break if they fell off.");
			myntQueueSay("They used to listen to me.");
			myntQueueDelay(2);
			myntQueueTransition("sad");
			myntQueueSay("... Then they stopped listening.");
			myntQueueSay("My little friends maimed and killed themselves.");
			myntQueueSay("You understand why I wanted to find out what happened asap.");
			myntQueueSay("Marei was uncooperative as usual, and Lana and Red were injured...");
			myntQueueTransition("default");
			myntQueueSay("But John told me everything. That whole flashback.");
			myntQueueSay("He's a good dog.");
			myntQueueSay("Fastidious.");
			myntQueueSay("Ever since then, I've just been sitting on this.");
			myntQueueSay("Dealing with it.");
			myntQueueTransition("angry");
			myntQueueSay("Suppressing my RAGE.");
			myntQueueDelay(2);
			myntQueueTransition("default");
			myntQueueSay("But... now you know too.");
			myntQueueSay("We're on the same page!");
			myntQueueSay("And what I've been TRYING to wrangle myself into saying is...");
			myntQueueSay("It um.");
			myntQueueSay("It feels good to get it out, y'know?");
			myntQueueAddChoice("Ah, yeah. Glad to be here for ya.", myntShipwreck.bind("myntexplain5a"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5a") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueSay("Thanks.");
			myntQueueAddChoice("But uh. Suppressing your rage?", myntShipwreck.bind("myntexplain5angry"));
			myntQueueAddChoice("Woulda been nice of you to ask if I wanted to know, though, instead of just throwin it at me.", myntShipwreck.bind("myntexplain5know"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			data.myntSeptricaHateKnown = true;
			myntQueueSay("... They stopped listening because of HER.");
			myntQueueSay("SHE wanted to try it anyway.");
			myntQueueSay("No matter what I said.");
			myntQueueSay("So SHE scrounged up four volunteers. Played off their emotions.");
			myntQueueAddChoice("...", myntShipwreck.bind("myntexplain5angry2"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry2") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("...");
			myntQueueAddChoice("Mynt, I know you need to talk about this, but please be more straightforward.", myntShipwreck.bind("myntexplain5angry3"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry3") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueSay("... Hm?");
			myntQueueAddChoice("Like...", myntShipwreck.bind("myntexplain5angry4"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry4") {
			myntQueueHideChoices();
			myntQueueAddChoice("It's transparent. What you're trying to do.", myntShipwreck.bind("myntexplain5angry5"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry5") {
			myntQueueHideChoices();
			myntQueueAddChoice("The only reason you'd say 'SHE' instead of her name, whoever 'SHE' is...", myntShipwreck.bind("myntexplain5angry6"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry6") {
			myntQueueHideChoices();
			myntQueueAddChoice("Is because you want me to ask who SHE is.", myntShipwreck.bind("myntexplain5angry7"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry7") {
			myntQueueHideChoices();
			myntQueueTransition("pained");
			myntQueueSay("...");
			myntQueueAddChoice("Which is fine. Really.", myntShipwreck.bind("myntexplain5angry8"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry8") {
			myntQueueHideChoices();
			myntQueueTransition("um");
			myntQueueAddChoice("I'm just some rando "+pickByGender("dude", "chick", "stoner")+" who showed up and started fuckin around with everybody.", myntShipwreck.bind("myntexplain5angry9"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry9") {
			myntQueueHideChoices();
			myntQueueAddChoice("I'm sure you're all sitting on a mountain of tragic backstory that I have no idea about.", myntShipwreck.bind("myntexplain5angry10"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry10") {
			myntQueueHideChoices();
			myntQueueAddChoice("It makes sense that you wouldn't wanna just dump all that on me at once.", myntShipwreck.bind("myntexplain5angry11"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry11") {
			myntQueueHideChoices();
			myntQueueAddChoice("But...", myntShipwreck.bind("myntexplain5angry12"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry12") {
			myntQueueHideChoices();
			myntQueueAddChoice("But if you have something you need to tell me, just say it, okay?", myntShipwreck.bind("myntexplain5angry13"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry13") {
			myntQueueHideChoices();
			myntQueueAddChoice("Don't wrap it up in a cryptic flashback scene. Don't just drop hints to try and keep me interested.", myntShipwreck.bind("myntexplain5angry14"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry14") {
			myntQueueHideChoices();
			myntQueueAddChoice("I'm already interested.", myntShipwreck.bind("myntexplain5angry15"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry15") {
			myntQueueHideChoices();
			myntQueueTransition("blush");
			myntQueueAddChoice("Okay? :3", myntShipwreck.bind("myntexplain5angry16"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry16") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Thank you. I'll keep that in mind.");
			myntQueueSay("I guess I just...");
			myntQueueSay("I'm stuck in the game mentality.");
			myntQueueSay("I feel like everything has to be either sexy or intriguing.");
			myntQueueDelay(2);
			myntQueueTransition("um");
			myntQueueSay("... But I still have a lot to tell you and show you. About everything.");
			myntQueueSay("It really would suck for me to just dump it all at once.");
			myntQueueAddChoice("Well, a little bit of patience between big plotty things is good. I am still trying to get off here.", myntShipwreck.bind("myntexplain5angry17"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry17") {
			myntQueueHideChoices();
			myntQueueTransition("dizzy");
			myntQueueSay("Gotcha.");
			myntQueueDelay(3);
			myntQueueSay("...");
			myntQueueAddChoice("So, tell me.", myntShipwreck.bind("myntexplain5angry18"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry18") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueAddChoice("Who organized this voyage?", myntShipwreck.bind("myntexplain5angry19"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry19") {
			myntQueueHideChoices();
			myntQueueTransition("angry");
			myntQueueSay("...");
			myntQueueSay("Septrica.");
			myntQueueAddChoice((data.jcIntroDone?"Sounds familiar.":"Who?"), myntShipwreck.bind("myntexplain5angry20"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry20") {
			myntQueueHideChoices();
			myntQueueSay("To be honest, I wasn't being vague to intrigue you.");
			myntQueueSay("I just really hate that gecko bitch.");
			myntQueueSay("Even that dumb complex name pisses me off.");
			myntQueueAddChoice("Jeez.", myntShipwreck.bind("myntexplain5angry21"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5angry21") {
			myntQueueHideChoices();
			myntQueueTransition("unimpressed");
			myntQueueSay("Anyway, let's cut this short before I start ranting.");
			myntQueueAddChoice("Alright.", myntShipwreck.bind("myntexplainend"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplain5know") {
			myntQueueHideChoices();
			myntQueueSay("Right! Sorry.");
			myntQueueSay("I just uh... I wanted to share my...");
			myntQueueSay("John's...");
			myntQueueTransition("default");
			myntQueueSay("You know what, nevermind. :3");
			myntQueueAddChoice("Alright.", myntShipwreck.bind("myntexplainend"));
			myntQueueShowChoices();
		}

		if (seg == "myntexplainend") {
			myntQueueHideChoices();
			myntQueueTransition("default");
			myntQueueSay("Sorry to pop in unannounced~!");
			myntQueueSay("I'll make sure to message you next time.");
			myntQueueSay("Seeya!");
			myntQueueAddChoice("Bye. :o", function(){
				enablePause();
				hideMynt();
				playSound("assets/audio/mynt/shutdown");
				playMusic("brightForest");
				TheFloatillery.theFloatillery("main");
			});
			myntQueueShowChoices();
		}
	}
}
