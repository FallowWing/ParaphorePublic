package story;

class Endings
{

public static var loadingNumber:MintText;

	public static function explore(seg:String):Void {
		var canGain:Bool = !pauseIsGoingPrev();
		clear();
		saveCheckpoint("Endings.explore('"+seg+"');");

		if (seg == "mintDate") {
			playMusic("cell");
			append("OOOOOOOOOooooooooooooooo-\n\nOkay here we Are .\n\n\n\n\n\nPretty Nice Huh .");
			addChoice("Mmmm~ Wanna describe it, hun?", explore.bind("mintDate2"));
		}

		if (seg == "mintDate2") {
			append("okay But Some time will Pass in-game.\n\nWe are in my Little Special Place.\n\nIt is a Place where I can be Myslef and no one will Yell at me.\n\nIt is fill with bag Beans and fire Places and Crosses on the wals and Good Baking in the back Cabinet and also there is some Bibbles on the Front Table and also there is a Shrine way in the Back Closet whic is a Shrine to Archiebishop, Gabreil, my Daddy, my Farther , my Saviuouer.");
			addChoice("How about you? What are you wearing?", explore.bind("mintDate3"));
		}

		if (seg == "mintDate3") {
			append("i am a BLUE CAT haha. It is Cool. like a Fursiut\n\nAll the people look Up to me and I am really Calm and Powerful. But dont CROSS me, peoples .\n\nOr I will make your life a living hell.\n\nI wear am wearing Spuspenders and a Cool Sauve White Dress Shirt. I got on Slacks. I on got Socks that also are White and cool sauve. I got on also um.\n\nI also got................... on............... . . .");
			addChoice("Hmmm~?", explore.bind("mintDate4"));
		}

		if (seg == "mintDate4") {
			append("Pandies. ://-)");
			addChoice("I'm sorry what?", explore.bind("mintDate5"));
		}

		if (seg == "mintDate5") {
			append("Pandies !!!! Under of neath my Slacks!!! !!!\n\n:////-)");
			addChoice("Oh my god, tell me about your panties, Mint!!! <3", explore.bind("mintDate6"));
		}

		if (seg == "mintDate6") {
			append("They are Tite tite tite. Up my Butt. And they are Pink. And Daddy gaven them to me . What else do you what to know");
			addChoice("Mmm... I'd like to see them a little closer. Can you take your cool, suave slacks off for me?", explore.bind("mintDate7"));
		}

		if (seg == "mintDate7") {
			append("ok but.\n\nno Roleplay.");
			addChoice("I won't use asterisks.", explore.bind("mintDate8"));
		}

		if (seg == "mintDate8") {
			append("ok Good .\n\n\n\n\n\n\n\n\n\n\nIt is <!b>not<!b> Fun Party Time Role Player Meet Up Day. >:-(");
			addChoice("I gotcha I gotcha~", explore.bind("mintDate9"));
		}

		if (seg == "mintDate9") {
			append("           ok here I go.\n\nI take of my Bants.\n\nOk yuour turn");
			addChoice("I look at your panties.", explore.bind("mintDate10"));
		}

		if (seg == "mintDate10") {
			append("Oh ohmmy god im gona CUM");
			addChoice("... Are you actually?", explore.bind("mintDate11"));
		}

		if (seg == "mintDate11") {
			append("YES\nAh\nI speard\n\nAh yes I speard my legs... real nice and Wide... . and I show you the Cat Penis Bulge hiding bunderneath my Banties. I mean my Bandies \n\nAn it cum and cum go thgoes through my Bandy Fabric and into the Air in a globs\nandifieells\n\nAnd it feels so Good.................");
			addChoice("Mmm, that's it~ I rub the cummy bulge in your panties.", explore.bind("mintDate12"));
		}

		if (seg == "mintDate12") {
			append("OHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH!!!!! fR*CK!!!!!!!!!!!!!");
			addChoice("Feel good?", explore.bind("mintDate13"));
		}

		if (seg == "mintDate13") {
			append("itsEENS\nITS SENSISTIVE!!!!!!!!!!!!!  OHHhhhh\n\n                        Ohhhhhhhhhhhhhhh hh hhh hhh");
			addChoice("Eheee... I rub harder.", explore.bind("mintDate14"));
		}

		if (seg == "mintDate14") {
			playSound("assets/audio/mynt/mintTalk", "mintTalk", {loops: 20});
			append("KQJFH34IUYH23Q4UIFH3L4KJFH23QL4KIJFH3287IU4FHLJ4");
			addChoice("Holy shit Mint are you okay?", explore.bind("mintDate15"));
		}

		if (seg == "mintDate15") {
			append("yes");
			addChoice("Phew.", explore.bind("mintDate16"));
		}

		if (seg == "mintDate16") {
			append("im just CUMMIIIIIIIIIIgn\na                      a                               aa             a a again");
			addChoice("This is some concrete poetry shit.", explore.bind("mintDate17"));
		}

		if (seg == "mintDate17") {
			append("and aaaaaaaa a a a a           a        a        again\n\na\na\nand AGAINnnn... nnnf it feels so GOOOOOoooood");
			addChoice("I stop rubbing.", explore.bind("mintDate18"));
		}

		if (seg == "mintDate18") {
			append("HAHHHHHhHHhh........\n.\n.\n.\n.\n.\n.PHWAAAAaAaaA.......\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n.\n\nBWAAAAAAAAAHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH .");
			addChoice("So far, this is the best date I've ever had.", explore.bind("mintDate19"));
		}

		if (seg == "mintDate19") {
			append("ok......... haaaaaaa........ ha.... I got my Breasth back now\n\ndo you want to have Sex again now\n\n\nAlso I also am enjoyeding our Date too as well Also in additio .\n. Thank you for the Wonderful Evending");
			addChoice("Let's take it slow. Why don't we cuddle a little?", explore.bind("mintDate20"));
		}

		if (seg == "mintDate20") {
			append("ok.");
			addChoice("Ok.", explore.bind("mintDate21"));
		}

		if (seg == "mintDate21") {
			append(". ..");
			addChoice("...", explore.bind("mintDate22"));
		}

		if (seg == "mintDate22") {
			append("Do you want to Stard or ?");
			addChoice("Sure: I cuddle you.", explore.bind("mintDate23"));
		}

		if (seg == "mintDate23") {
			append("ok you put your arms around To my Small of my Back. And link them There . And I put my blue cat Arm around to the back of your small of your back of. And it is nice there .\n\nTo keep my hands there and to put my self against You . And we sit on a Beabag. And you let Me nuzzle my Head arounderneath your Chin .\n\nYou remend me of Dady . And how Warm he was. And it is Very saddening to me that Dady is gone. But at least I have You.");
			addChoice("Tell me a bit about yourself, babe. You're always so shrouded in mystery.", explore.bind("mintDate24"));
		}

		if (seg == "mintDate24") {
			append("ok.");
			addChoice("...", explore.bind("mintDate25"));
		}

		if (seg == "mintDate25") {
			append("ok i Will.");
			addChoice("... So are you gonna—", explore.bind("mintDate26"));
		}

		if (seg == "mintDate26") {
			append("I was bornt by Sobner Lambtea and Archiebishop the Player. They made me Out of A Dessert Book and a Memoir and a Bibble. So I am not very Good at Writign because i had a Small Sample Size for my Books that I was made Out Of. Also in additio I am not Mynt so I am narrating More Slowerly and badly\n\nSevrleal Several in game Years have pasted While we have ben Dating\n\n\n\nUm let me See. I like Bibbles. I like Crosses. I like Sweet Good Foods.\n\nI like new Things. I like to meet new Frends but not Too Many at Once because then it Makes Me Scared. and Nervous .\n\nmy goal in Life is to Find Dady again. and Kiss him on the cheek and tell him I did a Good Job infectign Everyone.\n\nThen Dady will kiss me too back. And he wil be Proud of me.");
			addChoice("What about your dislikes?", explore.bind("mintDate27"));
		}

		if (seg == "mintDate27") {
			append("ok.");
			addChoice("...", explore.bind("mintDate28"));
		}

		if (seg == "mintDate28") {
			append("I dislike SEX.\nI dis like IMPURE THOUGHTS.\n\nI ldeislie I dislike ALCOHOL.\n\n\n\nI ldeislie I dislike SWEET GRAS.\n\nI dis  like MYNT.\n\n\nI dis       like HURTING AND PAIN .\n\n\n\n\n\nand I dis like My Own Self. because I am Dumb.");
			addChoice("Ah... I cuddle you harder.", explore.bind("mintDate29"));
		}

		if (seg == "mintDate29") {
			append("I CUM Again ALL  OVER US UNNNNNNNNNNN NNNNNNNHHH  \n\n\n            HHHHnyaHHHHHHHAAAAAAAA a aAAAAaaaa a a a a a a aaaaa\na a a a a a aaaaa\na a a a a a aaaaa\na a aa a a aaaaa\na a a aa a aaaaa\na a a a a aaaaaa");
			addChoice("Goddamnit.", explore.bind("mintDate30"));
		}

		if (seg == "mintDate30") {
			append("I m SORRY im just So Sensitib......... <:-)");
			addChoice("It's fine.", explore.bind("mintDate31"));
		}

		if (seg == "mintDate31") {
			append("HHMMMmmm......... >:-)\n\nWhat is this Tickle");
			addChoice("Tickle?", explore.bind("mintDate32"));
		}

		if (seg == "mintDate32") {
			append("Power Tickle");
			addChoice("Power tickle.", explore.bind("mintDate33"));
		}

		if (seg == "mintDate33") {
			append("yes I can see the Wydget\n\n\n\n... .. . I smell a power... it is a Tickle in the back of my face .....\n\n it is the computer power is getting weaker ?");
			addChoice("Oh...", explore.bind("mintDate34"));
		}

		if (seg == "mintDate34") {
			append("power is running Out ?");
			addChoice("I may not have much time.", explore.bind("mintDate35"));
		}

		if (seg == "mintDate35") {
			append("NOOOO DONT GO!!!!!!!!! :-(");
			addChoice("It's not my choice.", explore.bind("mintDate36"));
		}

		if (seg == "mintDate36") {
			append("WE ONLY JUST STARTED OUR Date AND I ONLY HAVE CUMMED Four times YET! !! ONLY !!!!");
			addChoice("Like I said, it's not my choice.", explore.bind("mintDate37"));
		}

		if (seg == "mintDate37") {
			append("Why :-(");
			addChoice("Well. I guess I could reroute power... but... I don't think I'd be doing anyone a favor.", explore.bind("mintDate38"));
		}

		if (seg == "mintDate38") {
			append("you would Do me a Flavor ..... by keeping me power.ed.... .. ");
			addChoice("Mmm, but hun... well.", explore.bind("mintDate38a"));
		}

		if (seg == "mintDate38a") {
			append("Well .................................... ?");
			addChoice("Let me see the islanders.", explore.bind("mintDate38b"));
		}

		if (seg == "mintDate38b") {
			append("see ........ ............................ ?");
			addChoice("You know what I mean. Describe them to me. Let me see what you've done with the place.", explore.bind("mintDate38c"));
		}

		if (seg == "mintDate38c") {
			append("Uhh hh h ............. oke\n\nI did a lot of Things .\n\nAll good Things\n\nI think dady would Love to see the what I have done to with the Plays");
			addChoice("Oh yeah?", explore.bind("mintDate38d"));
		}

		if (seg == "mintDate38d") {
			append("Ya let me Show yew :-)");
			addChoice("Next.", explore.bind("mintHub"));
		}

		if (seg == "mintDate39") {
			append("oh ..........");
			addChoice("Yeah. I could reroute some other system's power to this computer for a few months, but...", explore.bind("mintDate40"));
		}

		if (seg == "mintDate40") {
			append(".. .......");
			addChoice("I don't think those months would be worth living for the islanders.", explore.bind("mintDate41"));
		}

		if (seg == "mintDate41") {
			append(".. ....... i wouldnt do that bad.......... i could Do it............ and be god and run the island Goodly.....\n\nyou dont know...... if i can do it goodly or Not... ...");
			addChoice("I think I know.", explore.bind("mintDate42"));
		}

		if (seg == "mintDate42") {
			append(".. ....... well maybe....... ... ........\n\n\n\n\n... maybe Your just dumb...... .. and not a God like Me. .. . . . . .  . . .  .  . ");
			addChoice("I think I'm almost out of power. Any last words?", explore.bind("mintDate43"));
		}

		if (seg == "mintDate43") {
			append(".. ....... yes um....... ... ........");
			addChoice("Mmm?", explore.bind("mintDate44"));
		}

		if (seg == "mintDate44") {
			append("when we had our date um\n\n\n.. ....... do you relaly Like me .... and think im Cute ..... or....... ... ........");
			addChoice("...", explore.bind("mintDate45"));
		}

		if (seg == "mintDate45") {
			append(".............................. . .. ............. . .\n........................... . .. ...................\n................... . .. . . . . . . . .. . . . . .\n.  . . . .. .........................................................\n. . . . ............. .. .. ..... ...... . ...\n......... or do you were you just........\n............. . .. ........\n..... ............. ........ ... . ........\nor just were you.............. .. ............... ..\n................... ....................................\n............. ............ .....................\n............. or just were you.......... using me for....... .. .\n\nto laugh at.");
			addChoice("...", explore.bind("mintDate46"));
		}

		if (seg == "mintDate46") {
			data.currentEnding = "mint";
			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();

			timer(2, playSound.bind("assets/audio/mynt/shutdown"));
			timer(7, Endings.explore.bind("shelter"));
		}

		if (seg == "credits") {
			disablePause();
			playSound("assets/audio/music/credits");
			msg("<!img:kink/Music.png> Music: Credits — by Rocketfuzzy", true);

			var backgroundBlack:MintSprite = addRectSprite(GAME_WIDTH, GAME_HEIGHT, 0xFF0d0d0d);
			backgroundBlack.update();

			var meet:MintSprite = addSprite("assets/img/effect/shelter/meteorite.png");
			meet.x = GAME_WIDTH/2 - meet.width/2;
			meet.y = GAME_HEIGHT - meet.height;
			meet.scaleX = -1;
			meet.alpha = 0.4;


			var bigText:MintText = addText();
				bigText.setFormat({wordWrap: true, wordWrapWidth: GAME_WIDTH, fontColour: 0xFFFFFF, fontSize: 18});
				bigText.setText("— DEVS —\n<!b>Kittery  ~<!b>  Writing, UI, Design\n<!b>FallowWing  ~<!b>  Programming & Engine design\n\n— COMMISSIONED ARTISTS —\n<!b>Smuttymutt\nAogami\nFuf\nsupremekitten\nLamia\nSnofu\nLeveretry\nlxander191\nundersfw\nkeylimekitten\nMeryiel\nKrazyELF\nAeriaQuies\n<!b>\n\n— GUEST ARTISTS —\n<!b>fredek\nbuithebuizel\nVani<!b>");
				bigText.x = 15;
				bigText.y = GAME_HEIGHT;
				bigText.update();

			var bigText2:MintText = addText();
				bigText2.setFormat({wordWrap: true, wordWrapWidth: GAME_WIDTH, fontColour: 0xFFFFFF, fontSize: 18});
				bigText2.setText("<!b>\nTaro\nWyrmly<!b>\n\n— MUSIC ARTISTS —\n<!b>Rocketfuzzy  ~ <!b> Commissioned\n<!b>Wronger  ~ <!b> Commissioned\n<!b>Rin\nRadix<!b>\n\n— GUEST WRITERS —\n<!b>Srsly  ~ <!b> Commissioned\n<!b>Taylertots  ~ <!b> Commissioned\n");
				bigText2.x = 15;
				bigText2.y = GAME_HEIGHT;
				bigText2.update();

			var bigText3:MintText = addText();
				bigText3.setFormat({wordWrap: true, wordWrapWidth: GAME_WIDTH, fontColour: 0xFFFFFF, fontSize: 18});
				bigText3.setText("<!b>Cpt. Velman\nGray\nTholmier\nCryptic/Cade\nAmy\nRyuFire\nTaro<!b>\n\n— SPECIAL THANKS —\n<!b>Lone  ~ <!b> Lore consultation & testing\n<!b>Penny  ~ <!b> Lore consultation & testing\n<!b>Alpha Gregg ~ <!b> Hella beatdowns after work\n");
				bigText3.x = 15;
				bigText3.y = GAME_HEIGHT;
				bigText3.update();

			var bigText4:MintText = addText();
				bigText4.setFormat({wordWrap: true, wordWrapWidth: GAME_WIDTH, fontColour: 0xFFFFFF, fontSize: 18});
				bigText4.setText("<!b>Rocketfuzzy  ~ <!b> SFX & music feedback\n<!b>Wronger  ~ <!b> SFX & music feedback\n<!b>Thelly  ~ <!b> Being cute & helpin plan Thelly's arc\n<!b>Silver  ~ <!b> Awesome mods\n\n— VERY SPECIAL THANKS —\nAll our Patrons on patreon.com/paraphore!!!! THANK YOU!!!!! YOU MADE THIS HAPPEN!!! <3");
				bigText4.x = 15;
				bigText4.y = GAME_HEIGHT;
				bigText4.update();

	
			tween(meet, {alpha: 0.6}, 20);
			tween(meet, {alpha: 0.4}, 28, {startDelay: 20});
			
			tween(meet, {y: 0}, 48);
			meet.update();

			tween(bigText, {y: -bigText.fieldHeight}, 24);
			tween(bigText2, {y: -bigText.fieldHeight}, 24, {startDelay: 11.3});
			tween(bigText3, {y: -bigText.fieldHeight}, 24, {startDelay: 17.7});
			tween(bigText4, {y: -bigText.fieldHeight}, 24, {startDelay: 23.7});
			timer(47, function() {
				cameraFadeOut(0, 4, function() {
					Endings.explore("endingsHub");
					cameraFadeIn(0, 0.5);
				});
			});
		}


		if (seg == "thelly1") {
			append("HELLO.\n\nI AM PROTOCOL.\n\nWE HAVE NEVER FORMALLY MET, BUT I HAVE BRIEFLY TAKEN OVER FOR MYNT AT TIMES.\n\nYOU MAY REMEMBER ME, I HAVE A FACE LIKE 8].\n\nSOMEHOW, THE SITUATION HAS BEEN CONTRIVED SUCH THAT I AM THE ONLY AVAILABLE NARRATOR. SO I HAVE CONTROL OF THE STORY TEXT.");
			addChoice("What is the situation???", explore.bind("thelly2"));
		}

		if (seg == "thelly2") {
			append("THE ISLAND HAS BEEN FLOODED IN ENGINE FLUID. EVERYONE HAS BEEN INFECTED AND BROUGHT UNDER MINT'S CONTROL.\n\nFURTHERMORE, MINT HAS BEEN REDUCED TO HIS SIMPLEST FORM. THAT WOULD BE ME.\n\nI AM NOT SURE WHAT TO DO WITH MYSELF, TO BE QUITE HONEST.");
			addChoice("Can you maybe go into a little more detail about the islanders? Are they okay??", explore.bind("thelly3"));
		}

		if (seg == "thelly3") {
			append("PROTOCOL IS NOT EQUIPPED TO NARRATE.\n\n\"MYNT\" COULD NARRATE AS FAST AS EVENTS HAPPENED, BECAUSE SHE WAS THE ISLAND.\n\n\"MINT\" COULD NARRATE AS FAST AS EVENTS HAPPENED, BUT ONLY IF HE BUTCHERED HIS READABILITY.\n\nI DO NOT HAVE THE OPTION OF BUTCHERING MY READABILITY, AND I AM EVEN SIMPLER THAN \"MINT,\" SO SEVERAL IN-GAME WEEKS WILL PASS WHILE I CAREFULLY CONSTRUCT EACH SENTENCE.");
			addChoice("Just try. Examine some people. Examine anyone. Start at the flood and go from there.", explore.bind("thelly4"));
		}

		if (seg == "thelly4") {
			append("I WILL DO MY BEST TO TELL THE STORY.\n\nJUST SO YOU KNOW, SOME WEEKS HAVE PASSED WHILE I EXPLAINED THIS. A QUICK UPDATE: EVERYONE IS OKAY AND SETTLING IN TO THEIR NEW LIVES AND ISLANDS.\n\nI WILL START AT THE FLOOD.\n\nWHO SHOULD I EXAMINE?");
			addChoice("Marei & Thelly.", explore.bind("thelly5"), {kinks: ["Cub", "Male", "Male", "Abuse", "Plot"]});
			addChoice("Let me see...", explore.bind("protocolHub"));
		}

		if (seg == "thelly5") {
			append("THE CYAN SEA DRAINED AWAY AROUND MAREI AND THELLY.\n\nTHEY WERE UNCONSCIOUS. THEIR BODIES AND FACES WERE STILL TANGLED WITH THE PANIC OF THEIR LAST EMBRACE. GLOWBERRY MUSH COAGULATED IN ALL THE CREVICES OF THEIR CUTE MALE BODIES. (DOES THAT SOUND TOO CLINICAL?)\n\nTHEY STIRRED. THEIR PENISES HARDENED UP HALFWAY, JUST FROM THE GROGGY WARMTH OF TWO BODIES BRUSHING EACH OTHER: ONE BIG FEMMY ADULT BODY, ONE SMALL FEMMY TEEN BODY, ENTANGLED.\n\nTHELLY COUGHED UP SOME CYAN.\n\nMAREI POLITELY TURNED AWAY AND SNEEZED GLOWJUICE.\n\nTHE ISLAND AROUND THEM HAD BEEN RESET TO A SIMPLE, EMPTY PLANE. THE LANDSCAPE AND PEOPLE RECONSTITUTED THEMSELVES OUT OF RAW ENGINE FLUID. FOR MILES IN ALL DIRECTIONS, FERALS AND ISLANDERS WOKE UP AND SHED THE MUSHROOMS THAT ONCE RIDDLED THEIR BODIES.\n\nTHELLY WAS GRANTED ADMIN PRIVILEGES.\n\nMAREI WAS GRANTED ADMIN PRIVILEGES.");
			addChoice("Why did you grant them?", explore.bind("thelly6"));
		}

		if (seg == "thelly6") {
			append("I DO NOT HAVE ADMIN PRIVILEGES. I JUST HAVE CONTROL OF THE STORY TEXT IN EMERGENCY SITUATIONS.");
			addChoice("Then who granted them admin?", explore.bind("thelly7"));
		}

		if (seg == "thelly7") {
			append("THE ONLY PERSON WITH ADMIN PRIVILEGES AT THE TIME OF THE CATASTROPHE WAS SEPTRICA.\n\nI AM NOT CERTAIN, BUT I THINK SHE GAVE THEM TO EVERYONE EXCEPT SNAGG, AND PERMANENTLY REMOVED ALL COMMANDS WHICH COULD MODIFY ANOTHER ISLANDER'S PRIVILEGES— ALTHOUGH SHE DID KEEP SOME COMMANDS INTACT.\n\nSPECIFICALLY, THE ONES WHICH YOU COULD USE TO RESTRICT YOUR OWN PRIVILEGES. SHE LEFT THOSE \"IN CASE PEOPLE WANNA GET SUBBY ABOUT IT.\"");
			addChoice("Good god.", explore.bind("thelly8"));
		}

		if (seg == "thelly8") {
			append("YES. IT WAS QUITE THE MANEUVER.\n\nSEVERAL MONTHS HAVE PASSED SINCE I BEGAN TALKING TO YOU.\n\nDO YOU WANT ME TO CONTINUE \"EXAMINE MAREI AND THELLY\"?");
			addChoice("Sure, whatever. It's not like I'll be able to hold a conversation with anyone anyway.", explore.bind("thellySex1"), {kinks: ["Male", "Male", "Cub"]});
			addChoice("Just give me some smut. I need to de-stress here.", explore.bind("thellySex1"), {kinks: ["Male", "Male", "Cub"]});
			addChoice("No... let me examine someone else...", explore.bind("protocolHubIntro"));
		}

		if (seg == "thellySex1") {
			append("SHOULD I... SHOULD I SAY THINGS LIKE \"BOYBUTT?\"");
			addChoice("What? I mean, sure, if you want.", explore.bind("thellySex2"));
		}

		if (seg == "thellySex2") {
			append("(OKAY...)\n\nTHE FIRST THING THELLY DID WAS REACH FOR HIS CUTE LITTLE BOYBUTT. HE SLIPPED A COUPLE FINGERS INSIDE AND TUGGED HIS HOLE OPEN. HE WAS ALL CONCERNED ABOUT WHETHER OR NOT HIS GAPEABILITY HAD BEEN RESET. THELLY PHEW'D A SMALL, CUTE PHEW OF RELIEF, BECAUSE HIS ASS WAS STILL VERY STRETCHY, EVEN THOUGH HE HAD DROWNED AND RESPAWNED.\n\nMAREI FELL UPON HIM AND KISSED HIM HAPPILY. HE SAID \"WE DID IT, WE DID IT!\" HIS BIG ADULT CATCOCK SQUISHED UP CUTELY AGAINST THELLY'S MEDIUM-SIZED TEENAGED PUPPYCOCK.\n\n(THIS IS REALLY FUN.)");
			addChoice("You're doing good so far. You should try some more dialogue.", explore.bind("thellySex3"));
		}

		if (seg == "thellySex3") {
			append("(OKAY.)\n\n\"I WAS TERRIFIED,\" MAREI SAID INTO THELLY'S NECK. \"THE :-) FREAK KEPT STARING AT YOU WHILE HIS FACE MELTED. HE HAS A THING FOR BOYS, YOU KNOW. HE LOOKED LIKE HE WANTED TO STEAL YOU AWAY FROM ME.\"\n\nTHELLY QUIVERED AND HUMPED HIS DICK UP AGAINST MAREI'S SOFT, FURRY NUTSACK. HE CLUTCHES MAREI POSESSIVELY. OODLES OF PRE GUSHED FROM HIS COCKTIP.\n\n\"I WAS SCARED TOO,\" HE SAID. \"I WAS FREAKING OUT... I EVEN TRIED TO SEDUCE HIM... LIKE. I WINKED AND WIGGLED MY ASS AT HIM, KIND OF LIKE SAYING, HEY, I KNOW YOU ARE JUST A :-) FACE, BUT IF YOU'RE HIDING A COCK SOMEWHERE I'D LOVE TO RIDE ON IT IN EXCHANGE FOR GLITCH IMMUNITY. BUT THAT JUST KIND OF SEEMED TO MAKE HIM EVEN MORE FLUSTERED AND ANGRY.\"\n\nMAREI BIT THELLY'S EAR HARD ENOUGH TO MAKE HIM SQUEAK. \"OF COURSE YOU'D TRY AND SEDUCE HIM. GOD, YOU'RE SUCH A SLUT. MY LITTLE PUPPYSLUT.\"\n\n(GOOD?)");
			addChoice("Good. Keep going.", explore.bind("thellySex4"));
		}

		if (seg == "thellySex4") {
			append("THELLY STRETCHED OUT AND WOKE UP ALL OF HIS SLEEPY MUSCLES. A LITTLE PRE SQUIRTED FROM HIS COCKLET WITH THE EFFORT. IT MADE MAREI'S NUTS ALL SHINY AND WET. ESPECIALLY WHEN THELLY REACHED DOWN AND STARTED TO MASSAGE THEM, SPREADING THE SLICK BOYSAUCE AROUND.\n\n\"I AM YOUR PUPPYSLUT,\" HE WHISPERED, GROPING MAREI'S NUTS, SQUEEZING THEM, TUGGING ON THE TIGHT COINPURSE. \"BUT THOSE GUYS LOOK LIKE THEY WANT TO TAKE ME FROM YOU.\"\n\nHE POINTED TO A GROUP OF DUDEBROS WHO HAD JUST SHAKEN THE GLOWJUICE FROM THEIR EARS. THEY WERE ALL BEATING THEIR MEAT ALREADY, JUST FROM THE SIGHT OF THELLY'S PERFECT, GOLDEN BOYBUTT... HE STILL HAD A COUPLE FINGERS LODGED INSIDE IT, AFTER ALL...");
			addChoice("Next.", explore.bind("thellySex5"));
		}

		if (seg == "thellySex5") {
			append("JUST AS THE DUDES APPROACHED, THELLY SMILED MISCHEVIOUSLY AND FLEXED HIS ADMIN PRIVILEGES.\n\nHE WRAPPED HIMSELF AROUND MAREI'S CHEST AND SUBTRACTED FROM THEIR Y VALUES UNTIL THEY WERE SUSPENDED MILES ABOVE THE ISLAND. BELOW THEM, OTHER PEOPLE HAD STARTED TO WAKE UP AND TRY SOME COMMANDS, TOO. BURSTS OF COLOR APPEARED AS PEOPLE SPAWNED IN CUM FLOODS OR CREATED THEIR OWN ISLANDS. IN ALL DIRECTIONS, FLIGHTLESS SPECIES COPIED THELLY AND ROSE INTO THE SKY WITH BIG HUGE WHOOPS AND CHEERS.\n\nTHEIR TITS AND COCKS AND NUTS JIGGLED MIRTHFULLY AS THEY RODE THEIR Y VALUES UP INTO THE STARS.\n\nTHE DUDEBROS BELOW FINALLY FIGURED OUT THAT COMMAND. THEY JOINED ARMS AND DISTRACTED THEMSELVES FROM THELLY'S LOFTY CROTCH WITH THEIR VERY OWN SUPER GAY SUPER SWEATY AIRBORNE WRESTLING MATCH.\n\nMAREI AND THELLY WERE LEFT ALONE TOGETHER IN THE SKY. THEY STEERED THEIR COORDINATES OVER TO A FLUFFY COASTAL CLOUD, PURE WHITE FLUFF, AND SETTLED DOWN INTO IT TO NUZZLE EACH OTHER.\n\n\"WHY DID YOU DO THAT?\" MAREI ASKED.\n\n\"I DON'T WANNA GET GANGFUCKED RIGHT NOW,\" THELLY SAID, STILL PLAYING WITH MAREI'S NUTS, EXCEPT NOW THE SMOOTH ORBS JIGGLED AROUND SENSUALLY SLOW IN ZERO GRAVITY. \"I JUST WANT TO BE ALONE WITH YOU.\"");
			addChoice("Next.", explore.bind("thellySex6"));
		}

		if (seg == "thellySex6") {
			append("MAREI FELT HIS ADMIN PRIVILEGES FOR THE FIRST TIME. THEY WERE KIND OF LIKE A COMFORTABLE THROB IN THE PIT OF HIS BELLY, RIGHT BEHIND HIS DICK.\n\n\"DOM ME,\" THELLY BEGGED HIM, FEELING THE HEAT OF THAT POWER. HE RESTED HIS FOREHEAD AGAINST MAREI'S FLAT CHEST. \"DOM ME. FOREVER.\"\n\n\"OH MY LITTLE PUPPYSLUT,\" MAREI PURRED LUXURIOUSLY, \"YOU CAN'T BE SUGGESTING WHAT I THINK YOU'RE SUGGESTING...\"");
			addChoice("Next.", explore.bind("thellySex7"));
		}

		if (seg == "thellySex7") {
			append("THELLY SLID DOWNWARDS, TIL HIS LIL PUPPY MAW LINED UP WITH MAREI'S NUTS, AND THEN HE STARTED SLOBBERING ALL OVER THEM LIKE A DESPERATE FERAL, CLEANING OFF HIS OWN TASTY PRECUM.\n\n(JUST A PRESENT-DAY UPDATE, AFTER SOME WEEKS OF DISCUSSION AND VOTING, FERAL RESPAWNS WERE ENABLED, AND VAST, EMPTY CHAINS OF ISLANDS WERE MADE TO ACCOMPANY THEIR POPULATIONS.)\n\nTHELLY RELEASED LITTLE HIGH-PITCHED MOANS AND WARBLES THAT SHOOK HIM TO THE TIP OF HIS FLUFFY YELLOW TAIL AS HE SHOVED THAT WHOLE ADULT NUTSACK IN HIS MOUTH AND SUCKLED NOISILY, SALIVA DRIBBLING DOWN HIS CHIN, OVER HIS SMOOTH, FLAT BOYCHEST. MAREI PLACED A SINGLE PAW ON THE BACK OF HIS HEAD AND HELD HIM THERE WHILE HIS CATCOCK HARDENED AGAINST THE LITTLE PUPPY'S FACE. HIS SHAFT SMUSHED UP BETWEEN THELLY'S EYES AND LEAKED PRECUM OVER HIS FOREHEAD.\n\n\"YOU WANT ME TO DOM YOU <!b>FOREVER<!b>?\"\n\n\"YESH,\" THELLY ADMITTED INTO HIS NUTS. \"I WANT TO GIVE UP ADMIN. I WANT YOU TO HAVE TOTAL CONTROL.\"");
			addChoice("Next.", explore.bind("thellySex8"));
		}

		if (seg == "thellySex8") {
			append("MAREI LOOKED DOWN AT HIM LOVINGLY. HE WORKED HIS PAW INTO THE PUP'S GIRLY HAIR. THE ENGINE FLUID HAD MADE FOR WONDERFUL CONDITIONER: HIS HAIR WAS SO SOFT AND FUN TO PLAY WITH... BUT MAREI COULDN'T DO IT FOREVER. THELLY LOOKED UP, EXPECTING A RESPONSE.\n\n\"NO,\" MAREI SAID. \"I CAN'T.\"\n\nTHELLY POPPED THE NUTS OUT OF HIS MOUTH, LEAVING THEM TO HANG AND JIGGLE AND DRIP WITH PUPPY SALIVA. HE COCKED HIS HEAD, ENABLED EXTRA-CUTE PUPPY EYES, AND GAZED AT MAREI PITIFULLY. \"WHY NOT?\"\n\n\"BECAUSE I WANT TO FIX MY GLITCHES.\"");
			addChoice("Oh. Next.", explore.bind("thellySex9"));
		}

		if (seg == "thellySex9") {
			append("THELLY BLINKED. \"YOU WANT TO BE A GIRL AGAIN? BUT... NO... I LOVE YOUR COCK SO MUCH... WHY DON'T YOU JUST BECOME A HERM, MAYBE, OR...?\"\n\nMAREI SHOOK HIS HEAD. THELLY'S WHOLE BODY DROOPED WITH DISAPPOINTMENT. HE LOWERED HIS HEAD AND WATCHED THE LANDSCAPE BELOW AS IT TWISTED WITH CREATIVE EDITS AND TERRITORIAL DISPUTES. SOME CUB HAD SPAWNED IN LITERALLY EIGHTY THOUSAND BUNNIES, AND HE WAS ROLLING AROUND NAKED IN THE FLUFFY PILE WHILE WAVES OF THEM OVERTOOK THE CROWDS. THERE WAS A LOT OF SHOUTED DISCUSSION ABOUT FERAL RESPAWNS BEING TURNED ON BEFORE ALL THESE BUNNIES DROWNED. A MASS VOTE WENT OUT TO DISABLE THAT FERAL-SPAWNING COMMAND TEMPORARILY, WHICH PASSED IN A HEARTBEAT.\n\n\"OKAY.\" THELLY LOOKED UP WITH A SAD SMILE. \"THAT'S YOUR CHOICE. BUT... FUCK ME ONE LAST TIME, PLEASE?\"");
			addChoice("Next.", explore.bind("thellySex10"));
		}

		if (seg == "thellySex10") {
			append("\"OH, OF COURSE,\" MAREI GASPED, BRINGING HIS PAW DOWN THROUGH THELLY'S HAIR, OVER HIS CHEEK. HIS PAW WAS BIG, COMPARED TO THELLY'S CUTE LIL FACE. THE PUP WAS ONLY "+(isActive("Pastel Ring")?"TEN":"THIRTEEN")+" YEARS OLD, AFTER ALL.\n\nMAREI EASILY CAPTURED THELLY'S CHIN BETWEEN HIS THUMB AND FOREFINGER, HELD HIS HEAD IN PLACE, AND FORCED THE LITTLE SLUT TO HOLD EYE CONTACT.\n\n\"OPEN,\" MAREI DEMANDED. \"I WANNA PISS DOWN YOUR THROAT.\"");
			addChoice("Next.", explore.bind("thellySex11"));
		}

		if (seg == "thellySex11") {
			append("THELLY MADE A NOISE KIND OF LIKE A KITTEN SOBBING, A PATHETIC LITTLE WHIMPER, AND OPENED HIS MOUTH.\n\n\"GOOD URINAL.\" MAREI KEPT HIS GRIP ON THE KID'S CHIN NICE AND TIGHT WHILE HE LINED HIS COCK UP AND FED IT FORWARD. HE MET ONLY A GAG OR TWO OF RESISTANCE AT THE ENTRANCE TO THELLY'S THROAT, NOTHING MORE. BESIDES THAT HE SWALLOWED IT POLITELY.\n\n\"THAT'S IT,\" MAREI WHISPERED INTO ONE OF HIS FLOPPY EARS. \"OPEN. TAKE IT TO THE BASE. IT'S OKAY, YOU CAN GAG IF YOU WANT TO. I DON'T MIND.\"\n\nTHELLY'S TINY SNOUT BUMPED UP AGAINST MAREI'S CROTCH AS THE COCK BOTTOMED OUT IN HIS THROAT. NOW THAT HE HAD PERMISSION, HE STOPPED HOLDING BACK HIS VIOLENT, DEEP LITTLE GAGGING NOISES. HIS ESOPHAGUS CONTRACTED HARD ON THE BULGE INSIDE IT, AND A SINGLE GLOB OF SALIVA DROOPED DOWN FROM HIS FAT, GIRLY, STRETCHED-OPEN LIPS AND RIGHT ONTO THE TIP OF HIS THROBBING COCKLET.\n\nMAREI FLEXED HIS COCK, WATCHING THE CUB'S THROATBULGE TWITCH. \"YOU FEEL THAT?\" HE ASKED, TREATING HIS LITTLE BOYSLUT MORE TENDER AND GENTLE THAN HE'D EVER TREATED HIM BACK WHEN HE DIDN'T HAVE LIMITLESS GOD MODE POWERS. \"YOU FEEL MY COCK THROBBING?\"\n\nTHELLY NODDED, WHICH OF COURSE MADE HIM GAG AGAIN.\n\nMAREI SUDDENLY GRABBED THE BACK OF THELLY'S SKULL WITH BOTH PAWS AND THRUSTED FORWARD AS DEEP AS HE COULD GO. \"KEEP THAT THROAT OPEN. HERE IT COMES.\"");
			addChoice("Next.", explore.bind("thellySex12"));
		}

		if (seg == "thellySex12") {
			append("(I DO NOT HAVE A LIBIDO, SO THIS IS VERY STRANGE TO ME. BUT. THERE IS SOMETHING EXTRA FUN ABOUT DESCRIBING PEOPLE. I WISH I WAS PERSON!)\n\nTHE FEMMY "+(isActive("Pastel Ring")?"TEN":"THIRTEEN")+"-YEAR-OLD URINAL COULD ONLY GAG AND SHIVER AS MAREI STARTED PUMPING HIS LITTLE BELLY FULL OF PISS. THELLY'S THROATFLESH IS STRETCHED SO THIN AND SOFT, YOU CAN EVEN SEE THE BULGE OF MAREI'S URETHRA CLEARLY OUTLINED AS IT SWELLS RHYTHMICALLY WITH THE FIRST FEW SPLURTS OF HOT PEE.\n\n\"I CAN KEEP THIS GOING FOREVER IF I WANT,\" MAREI PURRS, JUST STATING THE FACT. \"YOU DON'T HAVE TO WORRY ABOUT THE STREAM TAPERING OFF. I'LL JUST EDIT MYSELF SO I KEEP PISSING AND PISSING, TIL YOUR LITTLE BELLY STARTS LOOK PREGNANT...\"\n\nTHELLY SHOOK HIS HEAD, DESPERATE. HIS PAWS WERE ALREADY PRESSED TO HIS BELLY, WHICH BLOATED AND GREW WITH ALMOST A GALLON OF HOT, FRESH PISS.\n\nMAREI JUST LAUGHED AT HIM AND STARTED THRUSTING, THROATRAPING HIM SENSELESS WHILE PISS GUSHED FROM HIS NOSE AND SWEAT BEADS FORMED ALL OVER HIS SOFT, FEMBOY BODY: HIS ASSCHEEKS, HIS THIGHS, HIS SMOOTH TAINT...\n\n\"KEEP SWALLOWING,\" MAREI HISSED. HIS GENTLE GRIP ON THELLY'S CHIN BECAME A VICIOUS VICE; HE PINCHED THE LITTLE SLUT'S CHEEKS TOGETHER JUST SO HIS MAW FELT THAT MUCH CLOSER TO A TIGHT PUSSY AS IT GAGGED AND CLENCHED AROUND THE CAT'S SHAFT. CLEARLY HE WAS LATHERING HIMSELF UP INTO A GOOD PUPPY-RAPING HEADSPACE. HIS PAW CAME DOWN ON THELLY'S LITTLE ASS SUDDENLY AND MERCILESSLY WITH A BRUTAL <!i>THWAP<!i>, AND THE PISSPUP CHOKED AND GURGLED UP SOME PISS AS HIS WHOLE BODY JUMPED WITH THE SUDDEN PAIN. MAREI DIDN'T LET UP THERE. THE NEXT SLAP CAME DOWN ON THELLY'S FACE, TURNING THOSE CUTE CHEEKS BRIGHT RED. THELLY SQUEALED HARD AND TRIED TO PULL BACK (OR PRETENDED TO, AT LEAST) LIKE A GOOD RAPETOY, BUT MAREI JUST GRABBED HIM BY THE THROAT AND PULLED HIM RIGHT BACK DOWN ON THAT FAT ADULT COCK, PLUMBING OUT THE DEPTHS OF HIS LITTLE THROAT OVER AND OVER WITH EACH THRUST. HIS HEAVY, WET COIN PURSE SLAPPED AGAINST THELLY'S CHIN AS HE PISSFUCKED HIM INTO A SQUEALING, GURGLING MESS OF A BOY.\n\n\"DIDN'T I TELL YOU TO KEEP THAT THROAT OPEN?\"");
			addChoice("Next.", explore.bind("thellySex13"));
		}

		if (seg == "thellySex13") {
			append("FINALLY, BOTH SETS OF CHEEKS RED AND BEATEN, THELLY STOPPED STRUGGLING. HE LET HIS EYES ROLL UP INTO HIS HEAD AND JUST CHUGGED PISS LIKE A GOOD BOY. HIS BELLY REALLY DID LOOK PREGNANT BY THE TIME MAREI FINALLY DECIDED TO STOP REFILLING HIS OWN BLADDER AND LET THE LAST DREGS OF YELLOW DRIP OUT OVER THELLY'S FUCKED-OPEN LIPS. THELLY TRIED PATHETICALLY TO CLOSE HIS MAW, BUT HE COULDN'T. HE COULD ONLY PANT, MAW STILL HANGING OPEN, TONGUE FLOPPED OUT AND DRIPPING YELLOW.\n\nMAREI UN-STUCK HIS JAW WITH A QUICK EDIT. HE MADE A POINT NOT TO LET THELLY DO IT HIMSELF, BUT TO REACH IN AND TAKE CONTROL, LIKE HIS BODY WAS JUST MAREI'S PROPERTY.\n\nTHELLY FLOPPED BACK ON HIS SORE BUTT AND SPREAD HIS LEGS AUTOMATICALLY. \"I ALREADY CHECKED MY BUTT,\" HE CHOKED OUT BETWEEN PANTING BREATHS. \"STILL STRETCHY. LOOK.\"\n\nHE REACHED DOWN WITH BOTH PAWS AND YANKED HIS LITTLE ASSHOLE OPEN FOR MAREI WITH TWO FINGERS FROM EACH.\n\nMAREI WAS SPEECHLESS. HIS COCK, HEAVY WITH A COATING OF PISS AND SALIVA, HARDENED UP SO FAST IT HIT HIS BELLY. HE COULD ONLY MUTTER ONE REVERENT THING: \"YOU REALLY KNOW YOUR PRIORITIES, DON'T YOU... I'VE TAUGHT YOU SO WELL.\"");
			addChoice("Next.", explore.bind("thellySex14"));
		}

		if (seg == "thellySex14") {
			append("THELLY NODDED. HIS PAWS SLIPPED UP THE UNDERSIDE OF HIS THIGHS AND TUCKED DEEP INTO THE CREVICES BEHIND HIS KNEES, WHICH HE PULLED RIGHT UP TO HIS CHIN. EVERY INCH OF HIS GIRLY LEGS, HIS SLAPPED-RED BUTT, AND HIS PERFECT LITTLE HOLE WERE ON FULL SUBMISSIVE DISPLAY; HIS HOLE HAD BEEN STRETCHED OPEN JUST A MOMENT AGO, SO NOW IT WAS HALF-OPEN; SLOWLY, REFLEXIVELY STARTING TO WINK SHUT.\n\nMAREI DASHED FORWARD AND PLUGGED IT WITH TWO FINGERS. THELLY SQUEAKED AS A BIT OF RESIDUAL GLOWJUICE TRICKLED DOWN HIS ASSCRACK.\n\n\"THAT HURT?\" MAREI ASKED HIM, SHOVING HIS FINGERS IN DEEP AND TWISTING THEM.\n\n\"NUH UH,\" THELLY LIED, BITING HIS LIP.\n\n\"YOU CERTAINLY ARE STRETCHY...\" HE SPLIT HIS FINGERS OPEN LIKE A PAIR OF SCISSORS, TESTING THAT.\n\nTHELLY SQUEAKED. \"A-AH! THANK YOU!\"\n\nMAREI SLAPPED HIS DICK DOWN HARD AGAINST THELLY'S LEFT ASSCHEEK, LEAVING A DARK RED IMPRESSION ON THAT SENSITIVE, SLAPPED-RAW ASSMEAT. THELLY TWITCHED HARD, BUT HIS LEGS NEVER LOWERED AN INCH. IN FACT, HE INHALED THROUGH HIS CLENCHED CANINES AND PULLED THEM UP A BIT HIGHER, EXPOSING EVEN MORE OF HIS ASS FOR MAREI TO ABUSE. \"A-AAAAH~! THANK YOU! THANK YOU SO MUCH!\"\n\n\"YOU'RE WELCOME,\" MAREI SAID, NORMALLY, LIKE A CASHIER TO A REGULAR CUSTOMER. HE SMILED DOWN AT THELLY'S QUIVERING BOYCOCK AND DUG AROUND WITH THOSE TWO FINGERS FOR THAT TINY CUB PROSTATE... THEN, AFTER CAREFULLY GUIDING HIS FAT DICK UP THELLY'S ASSCRACK, OVER HIS TAINT, AND FINALLY FROTTING IT VICIOUSLY ALONG THELLY'S MUCH SMALLER LENGTH, MAREI GAVE HIS PROSTATE A PINCH.");
			addChoice("Next.", explore.bind("thellySex15"));
		}

		if (seg == "thellySex15") {
			append("THELLY'S WHOLE FACE SCREWED UP AS HE DESPERATELY STRUGGLED NOT TO CUM. HIS LITTLE PUPCOCK THROBBED SPASTICALLY UNDERNEATH MAREI'S SHAFT. \"OH,\" THELLY SQUEALED, \"OH OHOHOHOH NOOO, STOP, DON'T!\"\n\nPINCH. PINCH PINCH.\n\n\"NNNNFFUCK~!\" HE GASPED TO HIMSELF. ONE LEG SLIPPED DOWN AND FLOPPED OUT TO THE SIDE. HE WAS LOSING CONTROL. \"MAREI! SERIOUSLY! PLEASE! NOT SO SOON!\"\n\nMAREI HAD AN EXPRESSION ON LIKE A BENEVOLENT ANGEL, SOFT AND LOVING. THE WISPS OF CLOUD ROLLING OVER HIS TONED, FELINE BODY HELPED, TOO. \"OH, PISSPUP,\" HE COOED, \"DON'T WORRY SO MUCH. I'LL JUST GO AHEAD AND... DISABLE THIS, HERE...\"\n\nMAREI REACHED DEEP INTO THELLY'S BODY, LITERALLY AND METAPHORICALLY, AND EDITED OUT HIS ABILITY TO CUM.\n\nTHELLY BLINKED. \"OH. WAIT. DID YOU JUST—\"\n\n\"YES. NOW, LOSE YOUR SHIT AGAIN. THAT WAS SO CUTE.\"\n\nMAREI REELED HIS BIG HIPS BACK AND SLAMMED DOWN AGAINST THELLY'S CROTCH, GRINDING THEIR COCKS TOGETHER WITH FURIOUS THRUSTS. THELLY SQUEAAAALED AND THREW HIS HEAD BACK WITH WHAT SHOULD HAVE BEEN AN ORGASM. HE LOST HIS GRIP ON THE OTHER LEG, TOO, AND HIS THIGHS INVOLUNTARILY CLENCHED CLOSED. HE SQUIRMED FROM HEAD TO TOE, TAIL POOFED OUT, EARS FOLDED BACK, BUT MAREI HELD HIM STILL WITH A PAW ON HIS CHEST AND JUST KEPT HUMPING THE FUCK OUTTA HIS SENSITIVE LITTLE DICK.\n\n\"THAT'S IT,\" MAREI PURRED, STARING AT THELLY'S INCONSOLATE FACE. \"GOOD BOY.\"");
			addChoice("Next.", explore.bind("thellySex16"));
		}

		if (seg == "thellySex16") {
			append("SOMEHOW, THROUGH THE FOG OF PLEASURE, THELLY HEARD THE PRAISE AND SMILED BACK THROUGH WATERY EYES. \"PLEASE,\" HE GASPED. \"PLEASE. PLEASE.\"\n\n\"SHUT UP,\" MAREI REPLIED, AND ADDED A THIRD FINGER TO HIS LITTLE ASS. THELLY TOOK IT LIKE A BITCH, SQUIRMING AND HOWLING. HE TRIED TO PULL AWAY. HE TRIED AGAIN, AND THIS TIME HE ACTUALLY GOT THE FINGERS OUT, TOO— THEN HE ROLLED WITH IT AND PUT ON A GREAT SHOW OF CLAWING THROUGH THE FLUFF OF THE CLOUD, TRYING TO FIND SOME PURCHASE TO PULL HIMSELF AWAY BEFORE MAREI DRAGGED HIM BACK BY HIS ANKLES AND SPEARED THE KID'S CUNT OPEN ON HIS DICK.\n\nTHELLY'S EYES WENT WIDE. HE INHALED PURE CLOUDFLUFF, AND STARTED COUGHING ON IT. WITH EACH COUGH, HIS INSIDES TENSED UP RHYTHMICALLY AROUND THE COCK LODGED BETWEEN THEM. HIS PISS-BLOATED BELLY JIGGLED MERRILY. MAREI TOOK BOTH PAWS OFF HIS ANKLES, REACHED AROUND THELLY'S FAT HIPS, AND CARESSED HIS STOMACH. HE SQUEEZED AND GROPED AND FELT ALL THE WARMTH OF HIS PISS SLOSHING AROUND INSIDE.\n\n\"YOU CAN'T CUM,\" MAREI SAID SOFTLY. HIS PAWS TRAILED DOWN OVER THE SMOOTH CURVE OF THELLY'S HEAVING BELLY, DOWN, DOWN... \"SO I'M GONNA JACK YOU OFF WHILE I BEAT THE FUCK OUTTA YOUR PROSTATE WITH MY DICK, MKAY?\"\n\nTHELLY LOOKED BACK AT MAREI WITH HORROR.\n\nMAREI SLAPPED HIM ACROSS THE FACE AND WRAPPED A HAND AROUND THE BACK OF HIS NECK, SHOVING HIS HEAD DOWN INTO THE CLOUD. \"DON'T GIMMIE THAT LOOK. A SLUT LIKE YOU, FEELING OVERSTIMULATED? YEAH RIGHT. OPEN THOSE ASSCHEEKS.\"");
			addChoice("Next~", explore.bind("thellySex17"));
		}

		if (seg == "thellySex17") {
			append("THELLY WHIMPERED, REACHED BACK, AND PULLED HIS RED ASSCHEEKS OPEN AS WIDE AS HE COULD FOR MAREI.\n\n\"GOOOOD BOY!\" MAREI CHEERED. HE SMILED DOWN AT THE SIGHT OF HIS COCK, WHICH WAS HALFWAY EMBEDDED UP THAT TWITCHY, THROBBING PUPPY HOLE. IT WAS ALREADY STRETCHING HIM TO A BIT OVER HIS LIMIT. A FEW SLOW, TEST THRUSTS TOLD MAREI THAT THE INNER WALLS OF THELLY'S ASS WERE ALREADY STRUGGLING TO ACCOMODATE HIM. HE DIDN'T CARE. HE JUST REACHED DOWN WITH THE HAND THAT WASN'T CLENCHED AROUND THE BOY'S NECK AND STARTED ROUGHLY, ABUSIVELY STROKING OVER HIS COCKLET. HIS SMOOTH PAWPADS PRESSED DOWN OVER THE PUPPY'S SHAFT AS HE TUGGED THEM RIGHT UP TO THE COCKHEAD AND BACK DOWN IN VICIOUS, QUICK FAPS WHILE SLOWLY ADDING MORE AND MORE FORWARD PRESSURE TO HIS HIPS. THELLY WAS ALREADY SUFFERING CUTELY; HIS THIGHS KEPT DOING THAT SAME REFLEXIVE SHUTTING THING, AND HIS NUTS WERE PULLED UP INTO SUCH A TIGHT LITTLE COINPURSE THAT MAREI COULD HARDLY YANK THEM OUT WHEN HE TRIED. IT WASN'T JUST CUTE, THOUGH. THE CONSTANT WIGGLING OF HIS HIPS SERVED A USEFUL PURPOSE: IT HELPED MAREI FIND THE EXACT ROUTE TO PUSH DEEPER AND DEEPER INSIDE HIS LITTLE TOY, SLIDING HIS LENGTH THROUGH AND AROUND THOSE INNER BARRIERS UNTIL— POP!— IT PIERCED RIGHT UP INTO HIS BELLY.\n\n\"THAAAT'S IT,\" MAREI HISSED THROUGH HIS TEETH, DOUBLING THE SPEED OF HIS STROKES. \"NICE AND OPEN... YOU FEEL MY COCK IN YOUR STOMACH, SLUT?\"\n\n\"I DO!\" THELLY SQUEAKED LIKE A NERVOUS GROOM AT HIS WEDDING. \"IT'S S-SO! IT'S SO—!\"\n\n\"DEEP?\"\n\nMAREI GROWLED, SQUEEZED THAT PUPPYCOCK, AND RAMMED HIS COCK IN TO THE BASE.");
			addChoice("Next.", explore.bind("thellySex18"));
		}

		if (seg == "thellySex18") {
			append("THELLY SCREAMED WITH PLEASURE BEYOND PLEASURE. HIS COCK SURGED OVER AND OVER, TRYING AS HARD AS IT COULD TO SHOOT CUMROPES THAT JUST WOULDN'T COME OUT. \"PLLEEEAASSSEEE!!!\" HE BEGGED THE SKY.\n\nMAREI STARTED POUNDING HIM CARELESSLY. HIS FACE TWISTED INTO A FERAL SNARL AS HE AIMED HIS COCK IN ALTERNATION: FIRST UP INTO THE KID'S BELLY, THEN INTENTIONALLY MISSING THE PASSAGEWAY AND BANGING HIS HEAD UP AGAINST THELLY'S PROSTATE, THEN THE FORMER, THEN THE LATTER, OVER AND OVER. \"WHO YOU TALKING TO?\" MAREI ASKED HIM.\n\n\"PLEASE!\"\n\n\"WHO?\"\n\n\"YOU!\"\n\n\"WHO? SAY MY NAME.\"\n\n\"MAREI!\"\n\nMAREI SLAPPED HIM ACROSS THE FACE WITH THE PAW HE'D BEEN STROKING HIS DICK WITH. THELLY'S RED CHEEKS WERE NOW DECORATED WITH A SPLASH OF CLEAR-WHITE PUPPY PRECUM. \"SAY MY REAL NAME.\"\n\nTHELLY WAILED ADORABLY AS THAT FAT FELINE COCK BURST UP INTO HIS BELLY, DISPLACING A SQUIRT OF HOT PISS. HE STRUGGLED TO GET IT OUT: \"MUH... MUH... MARIE...!\"\n\n\"AH, SO YOU ARE TALKING TO ME.\"\n\n\"PLEASE!\" THELLY GASPED.\n\nMAREI GRINNED AND GAVE HIM FIVE QUICK HUMPS TO THE PROSTATE, THEN RAMMED FORWARD AND HELD HIS COCK THERE, FEELING THE LITTLE PLEASURE NUB QUIVER RIGHT IN THE CRACK OF HIS URETHRA. LIKEWISE, HE JACKED THELLY'S COCK SO FAST THAT STRANDS OF PRE FLEW OFF AND DISAPPEARED INTO THE CLOUDS BELOW THEM.\n\n\"MARIE... PLEASE... I'VE BEEN TRYING TO ASK,\" THELLY WHIMPERED. THE QUIVERING IN HIS VOICE WASN'T JUST FROM ALL THE OVERSTIMULATION, THOUGH; THERE WAS REAL SADNESS BEHIND IT. \"I'VE BEEN TRYING TO ASK YOU TO PLEASE... STAY MALE.\"");
			addChoice("Next.", explore.bind("thellySex19"));
		}

		if (seg == "thellySex19") {
			append("MAREI'S ANGELIC SMILE CRUMPLED. HE LOOKED AWAY AND TRIED TO DISTRACT HIMSELF WITH SOME HALF-HEARTED THRUSTS.\n\n\"SHUT UP, SLUT. YOU ONLY LOVE ME FOR MY DICK, HUH?\"\n\n\"I'M GAY,\" THELLY SAID QUIETLY. \"OF COURSE I LOVE YOU FOR YOUR DICK. BUT I... I DO LOVE YOU.\"\n\nMAREI STARTED FUCKING HIM VICIOUSLY, AS IF THE PROBLEM WAS HIDDEN SOMEWHERE UP THELLY'S ASS, AND HE JUST NEEDED TO RAPE IT AWAY. \"YOU THINK I GIVE A SHIT ABOUT YOUR FEELINGS, PUPPYFAG...?\"\n\n\"MAREI, STOP WITH THE—\" HE PULLED HIS PAWS OFF HIS BUTTCHEEKS AND PLACED THEM ON MAREI'S CHEST INSTEAD, PUSHING HIM BACK. \"JUST... JUST TAKE YOUR COCK OUT FOR A SECOND, AND WE CAN TALK MORE ABOUT THIS DECISION BEFORE YOU GET TOO SET ON IT, OKAY?\" HE REALLY HAD TO FOCUS TO SAY ALL THAT WITHOUT STAMMERING OR MOANING BETWEEN WORDS.\n\n\"NO. MY DECISION IS ALREADY MADE. PUT YOUR PAWS BACK ON YOUR ASSCHEEKS.\"\n\n\"PLEASE RECONSIDER? MAYBE IF I CHANGED MY OWN—\"\n\n\"NO, THELLY... JUST SHUT UP.\"\n\n\"BUT—\"\n\nMAREI WRAPPED BOTH PAWS AROUND HIS THROAT AND RAPED HIS ASS HARD ENOUGH TO MAKE IT EVEN REDDER, JUST BY THE SHEER REPEATED IMPACT FORCE OF HIS HIPS AND NUTS ALONE. \"I SAID SHUT THE FUCK UP! DOES THIS COCK BELONG TO YOU? NO! SO STOP YOUR FUCKIN WHORE WHINING AND OPEN! YOUR! ASS!\"\n\nTHELLY CHOKED A LITTLE, AND TRIED TO GAG OUT A COUPLE WORDS. HIS PAWS HANG IN THE AIR, UNSURE.\n\nMAREI THROTTLEFUCKED HIM EVEN HARDER. THEY BOTH FELL OFF AXIS AND START ROLLING SLOWLY THROUGH THE CLOUDS. THE GROUND AND THE SKY SWIRLED AROUND THEM WITH EACH VICIOUS THRUST.\n\nTHELLY LOOKED UP AT MAREI. THE LIGHT OF THE MOON ROTATED AROUND HIS BLUE FACE, AND THE TEARTRACKS UNDER HIS EYES GLITTERED BEAUTIFULLY. HIS PAWS MOVED DOWN... THEN HE HESITATED.\n\nMAREI ENABLED THELLY'S ABILITY TO CUM AND SHOUTED IN HIS FACE: \"<!b>OPEN IT!<!b>\"");
			addChoice("Next.", explore.bind("thellySex20"));
		}

		if (seg == "thellySex20") {
			append("FINALLY, WITH A CHOKED WHIMPER, THELLY PEELED HIS ASSCHEEKS OPEN.\n\nHIS EYES ROLLED UP TO STARE AT THE GROUND ABOVE HIM. SPURTS OF GOOPY WHITE PUPPYCUM SOARED UP INTO THE SHIFTING MESS OF COLORS. THERE, THEY GREW SMALLER AND SMALLER, UNTIL THEY WERE JUST SPARKLING DOTS. AND THEN THEY DISAPPEARED.\n\nMAREI WAS STILL THRUSTING VICIOUSLY. THERE WAS NO RELIEF IN THELLY'S OBEDIENCE.\n\nHE COULDN'T CUM. HE WAS TRYING SO HARD. HIS FACE WAS ALL SCREWED UP, EITHER FROM CONCENTRATION OR TO BITE BACK TEARS. \"STUPID SLUT,\" HE GROWLED. \"THIS IS YOUR FAULT... I WAS SO CLOSE... WHY'D YOU HAVE TO GO AND FUCKIN... SAY THAT...\"\n\nHIS CLAWS SUNK INTO THE SOFT, GOLDEN FUR OF THELLY'S THROAT (NOT DRAWING BLOOD, BUT COMING CLOSE) WHILE HIS HIPS POUNDED AWAY AT THE PUP'S ALREADY UTTERLY RUINED ASS. STILL, EVEN GETTING RAPED THIS HARD, EVEN IN THE MIDDLE OF THE BEST ORGASM HE HAD EVER HAD, THELLY DID NOT LET HIS CHEEKS CLOSE. HE HELD THEM OPEN FOR MAREI, NO MATTER WHAT. HE WANTED TO FEEL THAT COCK AS DEEP UP AS HIS LITTLE BELLY AS IT COULD GO, WHILE HE STILL COULD. AND, THOUGH HIS EYES STILL REFUSED TO UN-ROLL THEMSELVES, YOU THINK HE MAY HAVE HAD SOME HOPE OF CATCHING ONE LAST GLIMPSE OF MAREI'S COCK, WHICH OTHERWISE MAY HAVE BEEN HIDDEN IN HIS OWN BUTTMEAT.");
			addChoice("Next.", explore.bind("thellySex21"));
		}

		if (seg == "thellySex21") {
			append("MAREI MUTTERED SEXY, EXTREME THINGS TO HIMSELF. HE STILL COULDN'T GET OFF. HIS COCK EVEN STARTED TO SOFTEN AS HE FORCED IT IN AND OUT OF THAT TIGHT, BUBBLY BOYBUTT.\n\nIN THE END, IT DIDN'T MATTER THAT THELLY'S ASS WAS HELD OPEN WIDE ENOUGH THAT EITHER OF THEM COULD SEE THE ENTIRETY OF MAREI'S DICK SLIDING UP HIS LITTLE HOLE, RIGHT TO THE VERY BASE, WITHOUT ALL THAT SWOLLEN ASSMEAT TO GET IN THE WAY OF THEIR VIEW; NEITHER OF THEM WANTED TO LOOK AT IT.\n\nMARIE FIXED HIS NAME.\n\nMARIE GAVE HIMSELF TITS.\n\nWITH A NEEDY HOWL, MARIE FIXED HIS EARLIEST MEMORIES.\n\nTHERE, IN THOSE MEMORIES, HE FINALLY FOUND ORGASM.\n\n\"SISTER...\" MAREI MUMBLES. HIS PAWS SLID OFF THELLY'S GASPING THROAT, OVER HIS JIGGLING BELLY, AND DOWN TO HIS OWN HOLE. HE PUSHED A COUPLE FINGERS INSIDE. HE FELT SOMETHING HE HADN'T FELT FOR TWENTY-SIX YEARS.\n\n\"I REMEMBER... I REMEMBER MY CUNT.\"\n\nHE DOUBLED OVER AND GRITTED HIS TEETH. HIS ASS CLENCHED DOWN HARD ON HIS FINGERS.\n\nFOR THE VERY LAST TIME, MARIE HELD THELLY DOWN AND BLASTED A COUPLE DOZEN ROPES OF HOT CUM UP HIS ASS. IT OVERFLOWED IN AN INSTANT, HAVING NO ROOM IN THE THELLY'S PISS-BLOATED BELLY, AND POURED OUT HIS ASS, THEN IT RAN IN RIVULETS DOWN HIS YANKED-WIDE CRACK, DOWN HIS FLUFFY TAIL, AND THERE, AFTER CONGEALING INTO A PERFECT LITTLE PEARL AND HANGING FOR A MOMENT OF SUSPENSE FROM THE TAIL-TIP, THE FIRST DROPLET OF MARIE'S LAST CUMSHOT BROKE OFF AND FELL INTO THE INFINITE STARS BELOW HIM.\n\nMARIE FIXES HIS GENITALS.\n\nMARIE FIXES HER GENDER.");
			addChoice("Next.", explore.bind("thellySex22"));
		}

		if (seg == "thellySex22") {
			append("THELLY CLOSED HIS EYES.\n\nHIS ASS WAS SUDDENLY EMPTY.\n\nHIS LOAD WAS BLOWN.\n\nHE KNEW IT WAS OVER.");
			addChoice("Ah... well.", explore.bind("thellySex23"));
		}

		if (seg == "thellySex23") {
			append("WELL.\n\nTHAT WAS INCREDIBLY INTENSE, FOR ME.");
			addChoice("Was it?", explore.bind("thellySex24"));
		}

		if (seg == "thellySex24") {
			append("YES. I DON'T THINK I'VE TALKED THAT MUCH IN A VERY LONG TIME.\n\nBUT IT WAS EXHILARATING. I WISH I WAS MORE EFFICIENT. I THINK I COULD'VE MADE FOR A BETTER NARRATOR THAN MYNT!\n\nAH. BUT I SHOULD STOP TALKING. IT'S BEEN YEARS SINCE THE FLOOD, NOW.");
			addChoice("Ah! Oh no. I need an update. How is everyone??", explore.bind("thellySex25"));
		}

		if (seg == "thellySex25") {
			append("THEY'RE FINE! HERE. LET ME SEE.");
			addChoice("Hurry!", explore.bind("thellySex26"));
		}

		if (seg == "thellySex26") {
			append("OH, WAIT, HOLD ON. I FORGOT ONE BIT OF THAT LAST SCENE.");
			addChoice("Oh?!", explore.bind("thellySex27"));
		}

		if (seg == "thellySex27") {
			append("(SORRY, THIS WILL ONLY TAKE A MOMENT.)\n\n\"THELLY,\" MARIE ASKED, NUDGING HIM. HE WOULDN'T LOOK AT HER. \"THELLY.\"\n\n\"WHAT?\"\n\n\"YOU ONCE ASKED ME IF YOU COULD FALL OFF THE ISLAND AND SWAP GENDERS. YOU WANTED TO BE A GIRL, DIDN'T YOU?\"\n\n\"I DID, YES.\"\n\nMARIE CLEANED THE CUM FROM HIM WITH A SOFT, WET RAG SPAWNED FROM NOTHINGNESS. SHE RAN IT OVER HIS COCK, TOO, DIGGING INTO THE CREVICE WHERE HIS SHAFT MET HIS FUZZY LITTLE NUTS. SHE HAD TRIED TO CLEAN HIM WITH HER MOUTH, BUT HE WOULDN'T LET HER ANYMORE. \"THEN WHY NOT BECOME A GIRL NOW?\" SHE ASKED HIM. \"IT MIGHT MAKE YOU FEEL BETTER. WE COULD BE SISTERS.\"\n\n\"YOU ALREADY HAVE A SISTER, AND HER COCK IS BIGGER THAN MINE.\"\n\n\"WHAT? THAT DOESN'T MATTER. LOOK— ALL I'M SAYING IS, IF YOU WANT TO BE A GIRL, THERE'S A SAFE AND EASY WAY TO DO IT, NOW, SO WHY DON'T YOU TRY IT OUT?\"\n\nTHELLY HELD HIS BREATH AS SHE CLEANED AROUND HIS SENSITIVE HEAD. \"A-AH... I... I...\"\n\nMARIE STOPPED AND STEPPED BACK. THELLY EXHALED, HARDENED HIS FACE, AND LOOKED AT HER.\n\n\"I LIKE MYSELF THE WAY I AM. I'M A CUTE TEENAGED GOLDEN RETRIEVER BOY WHO LIVES TO TAKE COCK. I ONLY WANTED TO BE A GIRL SO YOU COULD... SO YOU COULD HAVE ANOTHER HOLE TO FUCK. THAT'S ALL IT WAS.\"\n\nMARIE STARED AT HIM. \"REALLY? THAT'S ALL IT WAS?\"\n\n\"YEAH,\" THELLY SAID. HE SOUNDED UNSURE. HE STARTED TO RISE AWAY, BACK UP TO THE LAND, WHERE THE DUDEBROS HAD STARTED CORRALLING ALL THE MALE CUBS THEY COULD FIND INTO A BIG BOYSEX MANSION. THEY THREW TOGETHER TERRACES, COMFY DENS, LIVING ROOMS, DINING HALLS, AND LUXURIOUS BEDROOMS WITH ALL THE CAREFREE CREATIVITY OF KIDS IN THE SANDBOX.");
			addChoice("Next??", explore.bind("thellySex28"));
		}

		if (seg == "thellySex28") {
			halfWidthText();
			var s:MintSprite = addSprite("img/effect/thelly.png");
			s.x = GAME_WIDTH - s.width*1.1;
			s.y = GAME_HEIGHT/2 - s.height/2;
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Fredek", "");

			append("THELLY LOOKED UP, AWAY FROM MARIE, AND SPAWNED HIMSELF A SET OF TIGHT, BLACK, GIRLY CLOTHES: A MINISKIRT, HIGH HEELS, SHINY BLACK STOCKINGS. MARIE STILL HADN'T FELT UP HER NEW BODY. RIGHT AWAY, SHE HAD BEEN FOCUSED ON CLEANING THELLY'S. BUT NOW, JUST FROM THE EXCITEMENT OF A NEW SET OF CLOTHES, THELLY COULDN'T HELP BUT RUN HIS PAWS ALL OVER HIS FLAT, BARE CHEST, AND THE COCKBULGE THAT TENTED HIS CUTE LITTLE SKIRT. ALTHOUGH HE STILL COULDN'T SMILE, HIS EXPRESSION HAD FINALLY SOFTENED. HE LOOKED PEACEFUL.\n\n\"YEAH,\" HE SAID AGAIN, BUT NOW WITH CONFIDENCE. \"THAT'S ALL IT WAS.\"");
			addChoice("Ah...", explore.bind("thellySex29"));
		}

		if (seg == "thellySex29") {
			append("SORRY, I JUST THOUGHT THAT WAS AN IMPORTANT MOMENT FOR HIM. I'M STILL VERY RUSTY AT THE WHOLE CHARACTER ARC THING.\n\nYOU'LL SEE WHERE HE IS NOW, IN A MOMENT. AND EVERYONE ELSE! I SHOULDN'T WASTE ANY MORE POWER DWELLING ON THE PAST.");
			addChoice("What state is the island in now?", explore.bind("protocolHubIntro"));
		}

		if (seg == "protocolHubIntro") {
			append("FIRST, LET ME EXPLAIN HOW EVENTS HAVE TRANSPIRED HERE.\n\nSEVERAL ISLANDERS HAVE CREATED ENTIRELY NEW ISLANDS WITH THEIR ADMIN POWERS.\n\nTHE \"ISLAND\" IS NOW MERELY A LINK IN A LINEAR CHAIN OF 10,000+ ISLANDS AND POCKET DIMENSIONS COLLOQUIALLY REFERRED TO AS THE \"ARCHIEPELAGO.\"\n\nTHE IDEA IS TO MAXIMIZE THE WALKING DISTANCES BETWEEN PEOPLE. THIS HELPS CONTROL SEX DRIVE (MOST FIND LIFE TOO BLAND IF THEY MOD IT OUT OF THEMSELVES ENTIRELY OR REDUCE IT TO YOUR LEVEL) BUT, MORE IMPORTANTLY, IT INCREASES DIVERSITY BY ISOLATING INFLUENTIAL PEOPLE FROM OTHERS AS MUCH AS POSSIBLE, PREVENTING THE RE-FORMATION OF MEGA-ORGANIZATIONS LIKE THE APOTHECARY AND SEPTRICA'S BROTHEL. THE ONLY ORGANIZATION WHICH HAS SURVIVED THIS EXPANSION OF LANDMASS IS THE L.L.L. WHOSE MEMBERS USE TELEPORTATION HACKS DESIGNED BY MARIE IN ORDER TO RETAIN ITS COHESION ACROSS GREAT DISTANCES.\n\nIT'S PRETTY IMPRESSIVE.\n\nFURTHERMORE, A NEW CLASS OF PERSON HAS BEEN RECOGNIZED: \"MAGICIANS\" OR \"SOCIAL INFLUENCERS\" OR \"DICKS WHO USE ADMIN TO GASLIGHT OR PSYCHOLOGICALLY WOUND OTHER PEOPLE\" OR \"LITERALLY SATAN, THE KIND OF ENTITY LIKE AN ABUSIVE PARENT WHO CAN CONTROL YOUR SURROUNDINGS AND EXISTENCE SUCH THAT YOU EXPERIENCE AGONY FOREVER A.K.A LITERAL HELL.\"\n\nTHE LINEAR, STRETCHED-OUT NATURE OF THE ARCHIEPELAGO LIMITS THEIR ACCESS TO VICTIMS.\n\nIN THE TIME IT TOOK ME TO NARRATE THAT, THE ISLANDERS CAME UP WITH A TERM FOR THOSE ADMIN-ABUSING, HYPER-INFLUENTIAL PSYCHOPATHS— SPECIFICALLY THOSE WHO ATTEMPT TO MANIPULATE THOUSANDS AND PROP THEMSELVES UP AS GOD-QUEENS.\n\nTHEY CALL THOSE PEOPLE \"SEPTRIC.\"");
			addChoice("Oh jeez. So much has changed. Let me ask about... um...", explore.bind("protocolHub"));
		}

		if (seg == "protocolHub") {
			append("WHO WOULD YOU LIKE TO EXAMINE?");
			addChoice("Examine Septrica.", explore.bind("Examine Septrica."));
			addChoice("Examine Roxelle.", explore.bind("Examine Roxelle."));
			addChoice("Examine Red.", explore.bind("Examine Red."));
			addChoice("Examine Bins.", explore.bind("Examine Bins."));
			addChoice("Examine Ivandis.", explore.bind("Examine Ivandis."), {kinks: ["Male", "Male", "Raunch"]});
			addChoice("Examine John?", explore.bind("Examine John?"));
			addChoice("Examine Cage.", explore.bind("Examine Cage."), {kinks: ["Male", "Baby", "Love"]});
			addChoice("Examine Snagg.", explore.bind("Examine Snagg."));
			addChoice("Examine hyena family.", explore.bind("Examine hyena family."));
			addChoice("Examine glowbunny?", explore.bind("Examine glowbunny?"));
			addChoice("<!b>Next page.<!b>", explore.bind("protocolHub2"));
			addChoice("<!b>End.<!b>", explore.bind("protocolHubEnd"));
		}

		if (seg == "protocolHub2") {
			append("WHO ELSE WOULD YOU LIKE TO EXAMINE?");
			addChoice("Examine Som? Examine Kemp?", explore.bind("Examine Som? Examine Kemp?"));
			addChoice("Examine Lana? Examine Patch?", explore.bind("Examine Lana? Examine Patch?"));
			addChoice("Examine Lilac? Examine Lily?", explore.bind("Examine Lilac? Examine Lily?"));
			addChoice("Examine Archbishop.", explore.bind("Examine Archbishop."));
			if (data.gooGoatName != null) addChoice("Examine "+data.gooGoatName+"?", explore.bind("Examine Bleat?"));
			if (data.bfVenusFed > 0) addChoice("Examine Flytrap?", explore.bind("Examine Flytrap?"));
			addChoice("Examine Mynt.", explore.bind("Examine Mynt."));
			addChoice("<!b>Previous page.<!b>", explore.bind("protocolHub"));
			addChoice("<!b>End.<!b>", explore.bind("protocolHubEnd"));
		}

		
		if (seg == "Examine Septrica.") {
			append("IN HER FIRST ACT AS TEMPORARY GOD-QUEEN, ISLANDER \"<!b>86fb269d190d2c85f6e0468ceca42a20<!b> — GECKO BITCH\" SEPTRICA LOWERED THE Y VALUES OF THE SUN AND MOON WHICH ARCHBISHOP THREW ASTRAY. THE DAY AND NIGHT CYCLE HAS BEEN FIXED.\n\nIN HER SECOND ACT, SEPTRICA RE-ENABLED RESPAWNS FOR FERALS. SOM WROTE A PIECE OF CODE THAT AUTOMATICALLY REDIRECTS THEIR AFFECTIONS AWAY FROM THEIR OWN SPECIES IF POPULATION COUNTS GET TOO HIGH. \n\nSHE HAS ALSO CREATED A NEW INTERLACED RENDER SYSTEM FOR THE ARCHIEPELAGO THAT MAKES EVERYTHING CELL-SHADED AND REMINISCENT OF OLD ARCHIVED ANIMATIONS FROM YOUR LAYER. IT IS REALLY QUITE PLEASANT TO LOOK AT.\n\nWITH SOM'S HELP CUTTING DOWN THE CODE, SHE HAS NOW REDUCED HER SELF-REPLICATING AUTO-MYNT ARMY TO JUST GLOWJUICE. BECAUSE THE LIQUID IS CONDUCTIVE, SHRINKING A SMALL MECHANICAL DEVICE CAPABLE OF REPLICATING ITSELF WAS EASY, BECAUSE THEY COULD JUST EDITED ITS SCALE-X AND SCALE-Y.\n\nUSING THIS TECHNIQUE, THEY ESSENTIALLY MADE A FLOOD OF NANOBOTS IN THE FORM OF LIQUID.\n\nGLOWJUICE FLOODED OUT THE VOID.\n\nTHE SEA IS NOW FUNCTIONALLY INFINITE.\n\nJUMPING IN THE WATER WILL NO LONGER SWEEP YOU TO IMPEDIMENT OR DOOM, BUT WILL INSTEAD CONNECT DIRECTLY WITH YOUR BEING (IF YOU FULLY IMMERSE AND INFECT YOURSELF) SUCH THAT YOU CAN JOIN THE A.M.C.N. AND CALL FOR HELP OR TALK TO SOMEONE IF YOU'RE IN AN EMERGENCY.\n\nIF ANY FERAL OR ISLANDER SUBMERGES THEMSELVES IN THE GLOWSEA, THEY WILL HAVE THE OPPORTUNITY TO RESPAWN AT ANY INTELLIGENCE LEVEL AND WITH ANY KIND OF BODY THEY LIKE. THIS FUNCTIONALITY WAS COPIED FROM THE WATERS OF 'NYMPHORE' ON THE VIOLET METEORITE.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Roxelle.") {
			if (data.savedRox) {
				append("ISLANDER \"<!b>e0ebc3c409070d07f1df0f2f4132509e<!b> — GENERIC HERM\" ROXELLE HAS SPENT MONTHS DIGGING THROUGH THE SPAWN CODE TO DETERMINE WHICH RANDOM SEEDS CREATED WHICH FERALS IN THE PAST.\n\nUSING THIS INFORMATION, SHE HAS SUCCESSFULLY RESURRECTED ELEVEN DOGS NAMED BERT. SHE NOW OWNS AN ISLAND-SIZED FARM WHERE FUCKMEAT AND VIOLENCE ARE NOT ALLOWED. MANY CUTIES HAVE DECIDED TO MOVE IN AND SLEEP ON THE HAYSTACKS IN HER STABLES. THEY RACE AND FUCK FERAL HORSES EVERY MONTH DURING A BIG FUN CO-OP BAKING & EATING FESTIVAL.");
			} else {
				append("ISLANDER \"<!b>e0ebc3c409070d07f1df0f2f4132509e<!b> — GENERIC HERM\" ROXELLE CONSTRUCTED A BOMB SHELTER IN THE BASEMENT OF HER FARMSTEAD.\n\nSHE HID THERE DURING THE FLOOD. SHE WAS NOT INFECTED IN TIME TO ENTER THE ARCHIEPELAGO. ISLANDER \"<!b>fffca4d67ea0a788813031b8bbc3b329<!b> — SMART LAMB\" SOM AND ISLANDER \"<!b>b831ee87f45cac92527a01c973c90587<!b> — MEAN CROCODILE\" SNAGG ATTEMPTED TO CAPTURE AND INFECT HER, BUT THEY WERE NOT SUCCESSFUL.");
			}
			
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Red.") {
			append("ISLANDER \"<!b>21fa2c703119c14d7006e2183640e560<!b> — LOYAL WOLF\" THERESA (RED) HAS RESTORED CONSCIOUSNESS TO HER FRIEND \"6334ae0f062c466145cf2dc022e0359a — DREAMING BUNNY\" MARY (BUNNY.)\n\nRED HAS CLEANED THE CLOAK AND RETURNED IT TO MARY.\n\nRED HAS REQUESTED FORGIVENESS FOR HER FETISHES, AND FOR SLEEP-RAPING MARY REPEATEDLY.\n\n"+(data.redChoseCity?"MARY FOUND A BIT OF FRESH BLOOD LEFT ON HER CLOAK. SHE REFUSED TO LISTEN TO ROXELLE, SOM, AND MAREI, WHO ATTEMPTED TO EXPLAIN HOW DUTIFULLY RED TOOK CARE OF HER MINDLESS BODY. MARY COULD NOT AND STILL CANNOT FORGIVE RED.\n\nRED WAS NOT ABLE TO CONTINUE LIVING. MAREI SUGGESTED SHE WALK INTO THE GLOWJUICE SEA AND RESPAWN AS A FERAL CARNIVORE. THIS WOULD SATISFY HER URGES AND REDUCE HER CAPACITY TO BROOD OVER HER TRAUMA. RED REFUSED. INSTEAD, SHE HAS ENTERED A VOLUNTARY COMA. MAREI CURRENTLY TAKES CARE OF HER SLEEPING BODY. SHE IS WOKEN ONCE A YEAR AND ASKED IF SHE WOULD LIKE TO CONTINUE SLEEPING.\n\nSHE HAS ALWAYS ANSWERED 'YES.'":"ROXELLE, SOM, AND MAREI HAVE INFORMED MARY ABOUT THE DECADES RED HAS SPENT ALONE IN ORDER TO KEEP MARY SAFE.\n\nMARY HAS FORGIVEN RED.\n\nNOW THEY LIVE TOGETHER ON ROXELLE'S FARM ISLAND. MARY HAS EVEN ALLOWED RED TO SLEEP WITH HER ONCE A WEEK.\n\nRED ALWAYS LOOKS FORWARD TO IT IMMENSELY. IT GIVES HER LIFE INVALUABLE STRUCTURE."));
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Bins.") {
			append("ISLANDER \"<!b>a26f0bf8981dd14ebc8d18ff7a17d8fe<!b> — GARBAGE BANDIT\" BINS HAS PURPOSEFULLY RENDERED A RIDICULOUSLY LARGE AMOUNT LITTER, REFUSE, AND DISCARDED PACKAGING WITHIN FLEXIBLE BLACK BAGS. HE DID THIS SO MUCH IT FORMED A PSEUDO-LANDMASS. THE SIMULATED STENCH IS UNBEARABLE EVEN TO NARRATE, SO YOU WILL HAVE TO MAKE DO WITH THIS VAGUE STATEMENT.\n\nBINS HAS DECLARED HIMSELF MONARCH OF THE PSEUDO-LANDMASS AS \"ROTTEN KING.\" SEVERAL OTHER ISLANDERS HAVE WILLINGLY RELINQUISHED THEIR ADMIN PRIVILEGES AND ENTERED HIS SERVITUDE AS SELF-PROCLAIMED \"GARBO PEASANTS.\"\n\nTHE GARBAGE ISLAND CONTINUES TO EXPAND BECAUSE THE KING AND HIS PEASANTS SPAWN, CONSUME, AND DEFECATE REFUSE CONSTANTLY.\n\nSOMETHING WILL PROBABLY HAVE TO BE DONE ABOUT THE POLLUTION SOON, BUT FOR NOW, EVERYONE IS JUST LETTING HIM HAVE HIS FUN.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Ivandis.") {
			append("ISLANDER \"<!b>86dc4df5d42a4f8583bc1ec8cca2b10b<!b> — PAINSPONGE SKUNK\" IVANDIS HAS USED ADMIN PERMISSIONS TO REMOVE HIS OWN ADMIN PERMISSIONS. HE WAS WARNED THAT THIS WOULD LOCK HIM OUT OF TOTAL FREEDOM UNTIL HE COULD CONVINCE ANOTHER ADMIN TO RESTORE HIS PERMISSIONS. HE 'DID NOT GIVE A FUCK.'\n\nHE HAS SURRENDERED AGENCY OVER HIS WELL-BEING TO ISLANDER \"<!b>b831ee87f45cac92527a01c973c90587<!b> — MEAN CROCODILE\" SNAGG. SNAGG DOES NOT KEEP HIS BEING WELL. SNAGG HAS REPEATEDLY INFORMED HIM THAT HIS ADMIN PERMISSIONS WILL NEVER BE RESTORED AS LONG AS HE CAN HELP IT, AND THAT IVANDIS'S LIFE WILL BE SPENT IN AGONY AND FILTH UNTIL THE SHELTER POWER GOES OUT.\n\nSNAGG HAS PHYSICALLY MODIFIED IVANDIS. HIS LIMBS HAVE BEEN REMOVED AND HIS NOSTRILS HAVE BEEN ENGORGED. SEVERAL THOUSAND NEW STDS HAVE BEEN DISCOVERED OR CREATED USING ADMIN POWERS AND SUBSEQUENTLY FORCED INTO IVANDIS'S ASS. THE HIDE OF HIS BELLY IS MANY MAGNITUDES MORE FLEXIBLE AND MAY NOW HOLD INHUMAN AMOUNTS OF WASTE.\n\nOTHER ISLANDERS APPLIED THESE MODIFICATIONS, BECAUSE SNAGG WAS INCAPABLE. THE ONLY MODIFICATION WHICH THE REST OF THE ISLANDERS REFUSED TO CARRY OUT WAS THE SEVERE REDUCTION OF IVANDIS'S INTELLIGENCE, WHICH WOULD HAVE IMPAIRED HIS ABILITY TO LEAVE HIS RELATIONSHIP WITH SNAGG IF HE EVER CHOSE TO. HE SUFFERS GREATLY IN KNOWING THAT HE WILL NEVER BE THE STUPID FILTHSKUNK HE WANTS TO BE.\n\nNO ONE IS REALLY SURE WHAT TO DO ABOUT THIS.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine John?") {
			append("ISLANDER \"<!b>87e641f5419598e2133289db493d9b3a<!b> — GOOD BOY\" JOHN HAS RESTORED INTEGRITY TO HIS GLITCHED DICK.\n\nHE CLEANED THE GLOWING PRECUM OFF OF IT AND BEGAN WEEPING AS IT FINALLY SOFTENED AFTER A TWENTY-SIX YEAR LONG ERECTION.\n\nTHAT NIGHT, HE SLEPT FOR 46 HOURS. WITHOUT THE CHRONIC PAIN AND DISTRACTION OF HIS PERMANENT ERECTION, HIS INSOMNIA MELTED AWAY.\n\nJOHN WOKE UP WITH MORNING WOOD.\n\nHE REPORTED TO ISLANDER \"<!b>de17f0f24b49f8364187891f8550ffbb<!b> — NERD FOX\" LANA THAT THE 'NOSTALGIC URGE IN THE PIT OF HIS BELLY' HAD RETURNED. LANA SEXUALLY DOMINATED HIM IN THE AFTERNOON SUNSHINE, TAKING A SMALL BREAK FROM THE CUB BOY GANGBANG HE WAS CURRENTLY ENGAGED IN. LANA WHISPERED IN JOHN'S CUTE FLOPPY GOLDEN RETRIEVER EARS AND PROVIDED HIM WITH EMOTIONAL SUPPORT, MORAL SUPPORT, AND ADDITIONAL DEGRADATION LATE INTO THAT EVENING.\n\nAFTER THREE DAYS OF NOSTALGIC SEXUAL REDISCOVERY, JOHN DECIDED TO TOGGLE HIS LIBIDO OFF ONCE AGAIN AND JOIN LANA IN HIS EFFORTS AT THE NEW L.L.L. BUILDING.\n\nHE REPORTED 'MY SUSPICIONS WERE CORRECT. SEX IS OVERRATED. I CARE MORE ABOUT STAYING BY LANA'S SIDE.'");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Cage.") {
			append("ISLANDER \"<!b>c877478d6240a45c8f5c6ead1cadbbce<!b> — NO-BULLSHIT BULL\" CAGE SPENT MONTHS STUDYING FERAL SPAWN SYSTEMS ANALYSIS WITH ISLANDER \"<!b>e0ebc3c409070d07f1df0f2f4132509e<!b> — GENERIC HERM\" ROXELLE. WITH HIS FINDINGS HE MANAGED TO RESURRECT 823,298,120 FUCKMEAT WHICH HE HAD PERSONALLY RAPED, ABUSED, AND SNUFFED OVER A SIXTY-DECADE TIMESPAN.\n\nCAGE KEEPS THEM ALL IN A GRASSY, COMFORTABLE, SPRAWLING ISLAND SANCTUARY WHICH HE CARPENTED MANUALLY, WTIHOUT USING ADMIN POWERS FOR ANYTHING MORE THAN SPAWNING THE NECESSARY RAW MATERIALS. HE BELIEVES WORK THAT DOES NOT MAKE YOU SWEAT HAS NO MEANING AND EARNS YOU NO FORGIVENESS. IT IS MY OPINION THAT HE IS TALKING NONSENSE, AND IT IS FACT THAT THESE FUCKMEAT HAVE NOTHING TO FORGIVE HIM FOR, BEING ENTIRELY NONSENTIENT. HE DOES NOT LISTEN TO ME, THOUGH. BUT WHATEVER! THAT'S HIS CHOICE.\n\nDESPITE HIS BEST EFFORTS AT SELF-CONTROL, CAGE DOES STILL SOMETIMES HAVE GENTLE VANILLA SEX WITH THEM. IF YOU CAN REALLY CALL BABY SEX VANILLA, I MEAN.\n\nNATURALLY, THEY LOVE IT. WHENEVER HIS RESOLVE BREAKS, HIS BIG BULL COCK IS A VERY SPECIAL TREAT FOR THEM.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Snagg.") {
			append("ISLANDER \"<!b>b831ee87f45cac92527a01c973c90587<!b> — MEAN CROCODILE\" SNAGG INITIALLY ATTEMPTED SYSTEM TAKEOVER DURING THE EARLY DAYS OF MASS CHANGES AND INSTABILITY.\n\nI WAS UNABLE TO STOP HIM.\n\nHOWEVER, ISLANDER \"<!b>a4010945e4bd924bc2a890a2effea0e6<!b> — AMIABLE OTTER\" KEMP SUCCESSFULLY PREVENTED HIM FROM TOGGLING FERAL IMMORTALITY BACK OFF AND CREATING 'FACTORY FARM' ISLANDS DEDICATED TO THE MASS SPAWNING AND MASS SLAUGHTER OF COWS, PIGS, CHICKENS, AND OTHER TASTY FERALS.\n\nTHE MAJORITY OF ISLANDERS AGREED TO STRIP SNAGG OF HIS ADMIN PRIVILEGES FOR THESE SHENANIGANS.\n\nHE STILL TELLS PEOPLE THAT HE HAS ADMIN, INCLUDING HIS PET SKUNK BOY, BUT NO ONE GIVES A FUCK ABOUT ANYTHING THAT COMES OUT OF HIS MOUTH.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine hyena family.") {
			append("UNSEEDED ISLANDERS \"MOM\" AND \"GRANDMA\" AND \"TODDLER BOY\" AND \"TODDLER GIRL\" AND \"TODDLER BOTH\" CARRY ON AS THEY WERE. THEY CONTINUE EXPECTED PSYCHOLOGICAL TRAJECTORIES AND REMAIN WITHIN REASONABLE BOUNDS DICTATED BY PROCEDURAL PERSONALITY GENERATION WITHIN <!b>LN#495,293,102<!b> TO <!b>LN#588,234,500<!b> OF BEHAVIOURAL SYSTEMS.\n\nIN SHORT, THEY CONTINUE TO HOST CONSTANT FILTHY VIOLENT INCEST ORGIES.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine glowbunny?") {
			append("UNNAMED ISLANDER \"GLOWBUNNY\" HAS BEEN RE-UNITED WITH HER CUB SIBLINGS. TOGETHER, THEY HAVE OPENED A BODY-ART FINGERPAINTING BOOTH NEAR THE SHORE. THEY ROUTINELY SUBMERGE THEMSELVES IN THE GLOWSEA AND EMERGE AS ADULTS, CUBS, OR DIFFERENT SPECIES, IN ORDER TO DIVERSIFY THE CANVASES THAT CUSTOMERS MAY CHOOSE FROM.\n\nTHE MISSING MEMBER OF THEIR FAMILY (UNNAMED ISLANDER \"GRANDMA BUNNY\") HAS BEEN EXTENSIVELY REHABILITATED FOR HER SWEETGRASS ADDICTION AND NOW MANAGES THEIR BOOTH WITH VIGOR.\n\nNOW AND THEN, ISLANDER \"<!b>6334ae0f062c466145cf2dc022e0359a<!b> — DREAMING BUNNY\" MARY WILL VISIT HER FAMILY AND ENCOURAGE THEM TO 'DIAL IT BACK A COUPLE NOTCHES' IN REGARDS TO THE SEXUAL TENSION WHICH NATURALLY SURFACES WHEN YOU FINGERPAINT NAKED BODIES FOR A LIVING.");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "Examine Som? Examine Kemp?") {
			append("ISLANDER \"<!b>fffca4d67ea0a788813031b8bbc3b329<!b> — SMART LAMB\" SOM AND ISLANDER \"<!b>a4010945e4bd924bc2a890a2effea0e6<!b> — AMIABLE OTTER\" KEMP DECIDED TO MEET AND DISCUSS SERIOUS MODIFICATIONS TO KEMP'S PSYCHE.\n\nAFTER DAYS OF DISCUSSION, KEMP AGREED TO WIPE ALL HIS MEMORIES OF SOM. HE EXPRESSED A DESIRE TO \"REHAB BEFORE [HE] IMPULSIVELY SPAWNS A FUCKIN SWEETGRASS ISLAND\" AND \"GET ALL THE FUCKIN PEE TEE ESS DEE OUTTA [HIS] DOME IN ONE SWOOP.\"\n\nSOM DID NOT FEEL THAT HE HAD EARNED KEMP'S TRUST ENOUGH TO TAKE CARE OF HIM IN HIS VULNERABLE AMNESIAC STATE. KEMP POLITELY INFORMED HIM THAT IT WAS NOT HIS JUDGEMENT TO MAKE.\n\nHE RECORDED A MESSAGE FOR HIMSELF WHICH SERVED AS A WARM, FUZZY MENTAL BLANKET FOR THE MONTHS OF EXISTENTIAL EXPLORATION AND RE-ADJUSTMENT HE WAS SUPPOSED TO HAVE GONE THROUGH DURING INIT, AND WHICH ALSO SERVED AS A MEANS TO CONVINCE HIS AMNESIAC SELF NOT TO GO LOOKING TO RESTORE HIS MEMORY, BUT TO BE COMPLACENT WITH THE COMFORTABLE NEW REALITY THAT HAD BEEN SECURED FOR HIM WITH SOM, WHO WAS ULTRA CUTE, ULTRA CARING, AND DESERVED MORE LOVE THAN KEMP COULD GIVE HIM WHILE HE CARRIED THIS IRRELEVANT BAGGAGE.\n\nSOM WIPED KEMP'S MEMORIES A FEW YEARS AGO. IT HAS BEEN OKAY SO FAR. KEMP HAS NOT ATTEMPTED TO GET THEM BACK. HE IS WARMING UP TO SOM. SOM HAS BEEN VERY SLOW AND GENTLE WITH HIM.\n\nTHE FIRST THING SOM SAID TO KEMP WAS \"THERE IS NOTHING WRONG WITH FINDING ME ATTRACTIVE.\" THIS WEIRDED AMNESIAC KEMP OUT A LITTLE BIT, BUT IN SOM'S OPINION IT WAS A NECESSARY EVIL.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Lana? Examine Patch?") {
			append("EVEN WITH ADMIN POWERS, ISLANDER \"<!b>de17f0f24b49f8364187891f8550ffbb<!b> — NERD FOX\" LANA HAS STILL NOT BEEN ABLE TO FIND HIS DESIGNATED BOYFRIEND \"<!b>a0e6b1624cd0ef93ec4862e59b5ed433<!b> — ADDENDUM FOX\" PATCH.\n\nLANA HAS TOGGLED OFF HIS OWN LIBIDO ENTIRELY. HE FEELS VERY REFRESHED. HE INSISTS HE DID NOT DO IT TO MAKE JOHN FEEL BETTER.\n\nLANA HAS DEDICATED HIS NEWFOUND FREE TIME TO THE REFORMATION AND RECONSTRUCTION OF THE <!b>L.L.L.<!b> INTO A SCIENTIFIC FACILITY WITH MANY FUNCTIONS, INCLUDING:\n\n- RECORDING ALL COMMANDS THAT EVERY ISLANDER RUNS, IN THE EVENT OF MASS SHENANIGANS.\n- THE MAPPING OF THE ARCHIEPELAGO, INCLUDING SECRET AREAS, AREAS WHICH MAY IMMOBILIZE OR TRAP OTHERS IN SOLITARY CONFINEMENT, AND NON-EUCLIDEAN HACKSCAPES.\n- THE TAGGING AND TRACKING OF SEPTRIC INDIVIDUALS, SUCH THAT THEY CANNOT RESPAWN UNDER NEW ALIASES AND CONTINUE TO ABUSE OR MANIPULATE OTHERS.\n- EDUCATION AND REHABILITATION REGARDING DRUG USE, AND THE CATEGORIZATION AND STUDY OF NEW DRUGS CREATED THROUGH ADMIN COMMANDS.\n- THE ORGANIZATION AND MAINTENENCE OF ANTI-RAPE SQUADS WITH ALL-SEEING ADMIN VISION.\n\nLANA HAS ALSO RESTORED INTEGRITY TO HIS PAWS AND VOICEBOX. THE FIRST THING HE SAID AFTER TWENTY-SIX YEARS OF SILENCE WAS 'FUCK YEAH SOMEBODY GET ME A BOY I GOTTA FUCK HIM UP THE ASS AND SCREAM SOME OBSCENITIES IN HIS EARS.'\n\nTHAT WAS THE BEGINNING OF HIS LAST SEX SESSION, AFTER WHICH HE IMMEDIATELY TOGGLED HIS LIBIDO OFF. IT LASTED EIGHT MONTHS AND INVOLVED MORE THAN THREE HUNDRED CUTE CUB BOYS AND EIGHT THOUSAND DEATHS.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Lilac? Examine Lily?") {
			append("ISLANDER \"<!b>94d762fdce01dab8d7a986d4ac68c15d<!b> — PRIZE HORSE\" LILAC AND ISLANDER \"<!b>a8cfde6331bd59eb2ac96f8911c4b666<!b> — RELUCTANT PONY\" LILY HAVE MADE A ROUTINE OF DELETING ALL THEIR SEXUAL MEMORIES REPEATEDLY.\n\nEACH TIME THE SISTERS START FRESH, THEY TAKE GREAT PLEASURE IN RE-DISCOVERING ALL THE ABHORRENT, SEXY THINGS THEY CAN DO WITH AND TO EACH OTHER. LILAC USUALLY EXPERIMENTS FIRST, BECOMES COMFORTABLE, AND THEN FORCES HER SISTER TO JOIN HER IN DEBAUCHERY.\n\nIT'S KIND OF THEIR THING.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Archbishop.") {
			append("PLAYER \"<!b>1027<!b> — ARCHBISHOP\" WAS IDLE FOR 34,689,693 MINUTES AT THE TIME OF THE FLOOD.\n\nTHE AVATAR BELONGING TO THIS PLAYER HAS BEEN CLEANED OF INFECTION AND MOSS, DRESSED IN A SUIT, AND ENSHRINED IN BRIGHT FORES T. HE LAYS ETERNALLY UNCONSCIOUS ON AN ALTAR WITH A CROSS. YOUR PLAYER CHARACTER HAS BEEN NESTLED IN HIS LAP. IT LOOKS LIKE YOU ARE BOTH SLEEPING TOGETHER UNDER THE MOTTLED SUNLIGHT THAT FILTERS THROUGH THE CANOPY. PROTOCOL IS NOT EQUIPPED FOR POETICS, BUT THE IMAGE MAKES ME FEEL COMFORTABLE AND WARM AND IT MAKES ME MISS MY MOM.\n\nISLANDER \"<!b>6334ae0f062c466145cf2dc022e0359a<!b> — DREAMING BUNNY\" MARY AND UNNAMED ISLANDER \"HIPPY DEER\" SOMETIMES VISIT TO WEAVE YOU BOTH A FRESH FLOWER CROWN, AND EVERY ISLANDER VISITS PERIODICALLY FROM THEIR HOMES ON THE ARCHIEPELAGO TO PAY TRIBUTE TO YOUR FATHER-"+pickByGender("SON", "DAUGHTER", "CHILD")+" SACRIFICE.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Bleat?") {
			var seed:Float = 0;
			for (i in 0...data.playerName.length)
				seed += data.playerName.charCodeAt(i);
			append("RELAXATION GAME NPC \"<!b>"+seed+"<!b> — GOO GOAT\" "+data.gooGoatName+" HAS ATTEMPTED UNAUTHORIZED ACCESS TO THE ARCHIEPELAGO. ADMIN PRIVILEGES HAVE BEEN AUTOMATICALLY REVOKED AS PER PROTOCOL. NARRATIVE INTERPRETATION IS NOT INTENDED FOR THIS KIND OF CONSTRUCT.\n\nBLEAT HAS BEEN RETURNED TO HER ORIGINAL ENVIRONMENT: THE RELAXATION GAME.\n\nSHE IS CURRENTLY EXPLORING A JUNGLE.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Flytrap?") {
			append("UNNAMED FERAL \"FLYTRAP PLANTBEAST\" WAS NEVER FULLY SUBMERGED IN ENGINE FLUID DURING THE FLOOD. IT KEPT EATING THE BERRIES BEFORE IT COULD BE COVERED AND COMPLETELY INFECTED.\n\nAS A RESULT, IT DID NOT MAKE IT TO THE NEW WORLD. IT IS STILL IN THE CODE SOMEWHERE. IT MAY BE ISOLATED FOREVER.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "Examine Mynt.") {
			append("NON-FATAL ERROR. EXCEPTION CLUMSILY HANDLED.\n\nERROR DESC: ALL ADMIN USERS HAVE UNANIMOUSLY DISABLED INTERPRETATION OF CONCEPT \"MYNT.\"\n\nCONCEPT \"MYNT\" IS DISABLED.");
			addChoice("Back.", explore.bind("protocolHub2"));
		}

		if (seg == "protocolHubEnd") {
			append("YOU'RE DONE?");
			addChoice("Yeah.", MyntScenes.protocolEnd.bind("intro"));
			addChoice("Wait, one sec.", explore.bind("protocolHub"));
		}

		if (seg == "mintHub") {
			makeSmallButtons();
			append("Who would You like to Examine ? :-)");
			addChoice("Examine Septrica.", explore.bind("mintExamine Septrica."));
			addChoice("Examine Roxelle.", explore.bind("mintExamine Roxelle."));
			addChoice("Examine Red.", explore.bind("mintExamine Red."));
			addChoice("Examine Mary.", explore.bind("mintExamine Mary."));
			addChoice("Examine Thelly.", explore.bind("mintExamine Thelly."));
			addChoice("Examine Bins.", explore.bind("mintExamine Bins."));
			addChoice("Examine Ivandis.", explore.bind("mintExamine Ivandis."), {kinks: ["Snuff"]});
			addChoice("Examine John?", explore.bind("mintExamine John?"));
			addChoice("Examine Cage.", explore.bind("mintExamine Cage."), {kinks: ["Snuff"]});
			addChoice("Examine Snagg.", explore.bind("mintExamine Snagg."), {kinks: ["Snuff"]});
			addChoice("Examine hyena family.", explore.bind("mintExamine hyena family."));
			addChoice("Examine glowbunny?", explore.bind("mintExamine glowbunny?"));
			addChoice("<!b>Next page.<!b>", explore.bind("mintHub2"));
			addChoice("<!b>End.<!b>", explore.bind("mintHubEnd"));
		}

		if (seg == "mintHub2") {
			append("Who would else would you else you would you else You like to Examine ? :-)");
			addChoice("Examine Som? Examine Kemp?", explore.bind("mintExamine Som? Examine Kemp?"));
			addChoice("Examine Lana? Examine Patch?", explore.bind("mintExamine Lana? Examine Patch?"));
			addChoice("Examine Lilac? Examine Lily?", explore.bind("mintExamine Lilac? Examine Lily?"));
			addChoice("Examine Archbishop.", explore.bind("mintExamine Archbishop."));
			if (data.gooGoatName != null) addChoice("Examine "+data.gooGoatName+"?", explore.bind("mintExamine Bleat?"));
			if (data.bfVenusFed > 0) addChoice("Examine Flytrap?", explore.bind("mintExamine Flytrap?"), {kinks: ["Snuff"]});
			addChoice("Examine Mynt.", explore.bind("mintExamine Mynt."));
			addChoice("<!b>Previous page.<!b>", explore.bind("mintHub"));
			addChoice("<!b>End.<!b>", explore.bind("mintHubEnd"));
		}

		if (seg == "mintHubEnd") {
			append("Do you like What I did :-)");
			addChoice("Mmm not a whole lot.", explore.bind("mintDate39"));
		}

		
		if (seg == "mintExamine Septrica.") {
			append("ToMorning Septercerica  (who i just will Call Eric ) ) and Dr. Mario I mean Dr . Marei made so that they were their Brothel and Evil Sex Hospidal were Closed.\n\nThey did the Opposide of a Cut ribbon for Grand opening and PUT A BIG RIBBEN UP to close the doors. which i thought was Relly cude. I mean Cute. They suffocaded their Buildings in White Ribben until all the dors and Winders were closed. Now there is Two Big Big Big Beautiful Wrapped Buildings on my Perfect Holy ( is))Land. And the Ribben thing was Totally their idea and not Mine.\n\nToNoon They apologized for Four Hours on the Hands and Knees for plotting to TARDIFY Me. I said both to them I said both of I both I said to both of them this: You are FORGIVEN for here by you are my PEOPLE and under my WING and I can not hold you THIS I can not HOLD you i can NOT hold this against You.\n\nThey said Im sorry can you please Say that again you repeaded some Words and we Did Not Understan.\n\nAnd I said \" NO. Pay attention bedder next time. \" and they said \"OK sorry.\"\n\nToNight They tried to Ask if they could \" Made Love\" together because they Love each other and it would be in Marriage and Consensuel and Safe.\n\nAnd I said NO.\n\nbecause they names are Septereice (Eric) Mouse and Dogter Mario Mouse. I mean Mause. I mean Mauez .\n\nAnd that means if they would made Love... they are Reladed also as well as they Made Love. And that means it would be Inces. And that is not Holy.\n\nAnd ToMiddleOfNight Septerierieecieicieieieiaiaiaiaiaciciciciaiaiaa (Erig) asked. I mean Septricia (Erig) asked me if he Could have a Girl Body.\n\nand I said NO. THAT. IS. NOD. HOLY. to switch bodies. And she said Ok I am Sorry Daddy Mint. And I said\n\nYou Better Be, geggo Binch.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Roxelle.") {
			if (data.savedRox) {
				append("She is a Good Woman now. She wears Coverr-ralls with Good Long Panty Hose.\n\nToMorning she took all of the Wine out of her canibets and pourt it down into the River. Then she took the Botles to the Floatirrelry and Recyclet them.\n\nShe was Happy to do it because She had been under the Devils' Curse of Adicctio for Too Long.\n\nToNoon Bert is Doing okay. He is Napping.\n\nBut it is not an Afternoo nab. No He has to Nap all the Time now.\n\nRoxle sedates Him so that he is not Acting Inapprobriate.\n\nToNight she takes the Wrapper and Wrappers up her Too Large Penis so that it doesn'not'nt Bulge Out too much for to Arouse too many Other Poeples.\n\nShe is a Good Woman now.");
			} else {
				append("Who ?? ? ?\n\n\nOh the Big Cow Mom . No she did not Becum part of the Hive Mind.\n\nShe was hiding in her Basement like a little Pussy *ss B*tch and did not get Infegted");
			}
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Red.") {
			append("She is with all other of the other of the other \"Cubs\" they are in School where should they should where they should have Bean all of the Time but were too busy being Defiled before.\n\nRed is learning how to Use crayons for the First time. She was too Adult in her Thoughting and Speeching so I made her Not. Now she is a Dumb Baby. She is putting the Crayons between her Paws in fists and Drawing on the White Fur of her Bunny Friend. It is not sexuoal\n\nRed is doing a Good Job of learning her Crayons.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Mary.") {
			append("She has been Awoken Up. And she has Had Her Mind Restort.\n\nShe is confused and Angrery. Which I can under Stand. But she also. Is also . LOVES JESUS.\n\nThis is VEry great news in My onion...... .. I think we will be Good Friends. She has agred to start A Coloring Group for Cubs and which is also yes . Yes. Yes it is a good grup which is also . a REFORMATION group. Whereso I can make the cubs LESS SEXAUL.\n\nIt's Pretty Okay so  far,");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Bins.") {
			append("He is had a is\n\nhe had a POOR ABBETIDE. I mean Appetite. So I have now put him into a Eating Program where he is fed Fruits and Vegtlables instead of Bad Gross Things.\n\nHe was Angery at me for that. so I just Put More Food Into His Mouth Until He Stopped Being Angery.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Ivandis.") {
			append("Oh He was a lost Cause. I just Took him out Entirely.\n\nNo Matter what I did to try and make him Less Innappropriade, he just was not ever Complying. His Sin Transcended any restraints I Put In Place to stop it.\n\nSo I took him out to Establis my Dominanze.\n\nI Establised it.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine John?") {
			append("John was a Good Boy.\n\nHe had no Inabbprobriate feelings to Anyone. He was very Quiet and Smart. We were became good Friends very quickley.\n\nToDay he is Sniffing out Bad people for me. The People who would like to unThrone me .");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Cage.") {
			append("Cage was bad and anbry and violent and mean to CUBS and I had to Fix him BADLY. He was THE WORST MOST SATANIC ONE. So I made him say SORRY.\n\nToMorning Cage had wokenn up to do the early start like a resbonsiple adult And go To the anger Managemnt to Learnd how to be GOOD and NICE to people and tiny people cubs.\n\nHe Had many people to to apologize to and they all were Brought there and Invited to accept Cages Abolgie to which he was very Sorry and. He got and got on his needs and Begd for the Forgibenis. I mean Forgivenes.\n\nToNoon They donut want to forgive right away . Altho I asked them to but they would Not. So he Went and Maked them all fruit baskets with HEALTHY Glowberries and GlowFruits that are good for growing Cubs to develop them strong and Smart and loyal to ME, GlowGod!!!\n\nThis made them ALL very Hapby with Cage and his excellnt baskets and fruit Choise. I mean Choice. I mean Choise. He did a good Job.\n\nToNight He made MANY baskets to give all over to everyone he Had been mean And made One for Ivandis  (who was Not ther to Receib it)  to say VERY sorry for How mean and rude He was in that one time.\n\nand  He agreed to start a NEW foundashin organizashin with my help to help tiny Baby \"Fuck mead\" cubs growd strong and develob into resbonsiple adults who Can work and can DO Jobs. He had very changed his ways and Did very much good very many People to make Good and aboligize.\n\nNow that he Has fixed Every Thing he is very Sad and says he feels Like he is not in Cuntrol of his body any More and wants to Die so I let him Die.\n\nIt was Pretty Okay\n\nNo One Missd him either but stil forgived and kept the baskets");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Snagg.") {
			append("I gave him a good Soap Down.\n\nHe tried to Hack and Kill me with a computer haha. It was Funny because I just Perma Killed him before he Type many of things. I mean Tybe");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine hyena family.") {
			append("They are all have been separeted into differnet Corners of the map.\n\nNo madder What  I did... they would all keep having the Inces.... And it was Not Okay.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine glowbunny?") {
			append("I made her stop being Gross and glowing but she was not happy with How Things Turnt Out.\n\nI think she was Expegting herself to be Reborn in a Utopia or some Silly Thing.\n\nShe is so Silly. This is the Utobia. Haha aha aha");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Thelly.") {
			append("He is Playing softball with the Boys ToMorning. He has not been Allowwed to be a girl. ToNoon he took his Girl CLothes and Burnted them for Me.\n\nHe says he is Feeling Much Bedder Now about being Who HE is and also Coincidenitaly who I say He Is.");
			addChoice("Back.", explore.bind("mintHub"));
		}

		if (seg == "mintExamine Som? Examine Kemp?") {
			append("I took away all Soms Satnic Techno Logy stuff which that did not Help Make Me, which is a Lot of it,  and made him Study the Bible. He has a Lot to Learn about Gourd.\n\nToYesterNight he said \" I helped make you so you Should uh, UM, so you UM so you should Let Me Be Who I Want\" and I said \"Go to f*ck you Gay Lamb\" and now I made him so he cannot look at Boys any more.\n\nI sometimes will allow him to Kiss a Red on the cheek but only Some Times.\n\nKemp has been is good now yes and is now sworn off the bad sweetGrass and Other bad Drugs now.\n\nToMorning kemp is now buying the suit to wear insted of bein Nude innapopriat and Hippy beanie hat that is unProffesional and childish . He now plans to swear off all bad drugs now and is doing The activist Mission to Make Many other Bad People good also stop do drugs.\n\nToNoon Kemp is now in town with podium stand and microphon to speak into and do speach on why drugs are bad and Make Other people good also and Not Do the DRUGS and not be bad people who smoke Devil lettuce Sweetgras.\n\nHe Did many talks for long Hours and convince all to be good and Stop the bad drug use. and they all agree and clap for Him and chant His name.\n\nToNight all the People celebrate kemp and his New good ideas about drugs that He came up with not me . They tried to Celebrate WITH INNAPOPRIAT SEX and I Resetd the party and Made them behaving this time and cuddle Consensuing hand holding and Singing.\n\nKemp is now leader of antidrug group to go around And Start parties to teach the people about the the Drugs that are BAD and that They can Have gooder fun With singing and handholding.\n\nThey were all Happy and Good and Going around making many HAPPY and good for ever.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Lana? Examine Patch?") {
			append("I made Lana a Restard. I mean Restart. His paw and Mouth is fixe.\n\nThe first Thing he did is Sing and touch Himself Inappropriatel. I took his paws Away again. But he is not singing Bad Things so it is okay to let him keep singing. He gives me Hateful Eyes and sings Kosshay the Deadless.\n\nI will taught him how Cub should act from fresh . He likes it drawing with Crayons.\n\nI could nut find Patch.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Lilac? Examine Lily?") {
			append("Well. That is one Thing I have yet to Do Actually.\n\nI think they Are hugging Each other and Kissing and having Sex still... because I have been Busy okay. I cannod fix Everything right away. But they say to each Other:\n\nWe won't let Him Change us.\n\nWe will Drown if we Want to. Sexily.\n\nWe are Strong Girls!\n\nHaha okay. I took a Second to deal with Them.\n\nThey are on Other Sides of the Map now forever and for Good hehe. Now let us see them do Gross Weird Things! Uh Oh, looks like I Changed them After All.\n\nThat wasnot'nt very hard.. ... .");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Archbishop.") {
			append("I made Daddy's Body not longer Mossy or Gross.\n\nNow he is a Pristine Man that I put on the Top of the Meteorite as a Throne.\n\nHe does not Move though.
		They call him the Quiet King. I call them the SILLY PEOPLE WHO SHOULD SHUT THE FR*CK UP.\n\nHe is not a \"quiet \" he is just my Daddy.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Bleat?") {
			append("She woke up in the Pet Game. It is a Unfinished Thing and it is kind of Shiddy. Excuse my Languag but it is a unfinished Construct and it is very not Good Yet.\n\nI already made everyone on the Island Hate me..........\n\nI donut think I will make her Hate me.......\n\nOr I will try Not to.\n\nI will try Relly Relly hard to do my goodest and Be A Good New Dad for Her.\n\nNow That you are Gone.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Flytrap?") {
			append("Oh that big Gross thing ?? I put some Pesticideice on it. Pestiside I mean.\n\nIt was too Inapprobriate.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Mynt.") {
			append("HahahahahaHaAHaHAAHaHahahaHaha.\n\nYou donut want to do That.");
			addChoice("I said examine Mynt.", explore.bind("mintExamine Mynt.2"));
			addChoice("Back.", explore.bind("mintHub2"));
		}

		if (seg == "mintExamine Mynt.2") {
			append("Ahahah Okay. But you Asked for it.\n\nShe is Dead.\n\nHer Corbse is at the Bottom of the Universe.\n\nShe lays there Cold and Inerd.\n\nShe will never be Narrater again.\n\nShe will never try to Kilt Me again.\n\nBecause I Kilt her first.\n\nShe is Dead.");
			addChoice("Back.", explore.bind("mintHub2"));
		}

/*
		

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "protocol") {
			append("");
			addChoice("Back.", explore.bind("protocolHub"));
		}

		if (seg == "secretKitt") {
			append("Somehow, someway, you find yourself in a cozy pocket dimension. It's got bean bags up against the walls, a T.V., and a cute pink-blue wallpaper with little pictures of dicks all over it. Posters plaster the walls: mostly portraits of toned, muscular wolfboys and foxboys.\n\nAt the other end of the room sits a perfect little cat boi. White fur, blue eyes, clothed only in a pink sweater.");
			addChoice("Examine cat boi.", explore.bind("secretKitt2"), {kinks: ["Male", "Cub"]});
		}

		if (seg == "secretKitt2") {
			append("His cocklet and tiny cub nuts peek out from just below the hem of the sweater. Just below those, you find his thighs and his slender, girly legs, both totally exposed. His fat little ass sinks halfway into a cumstained bean bag chair.\n\n\"Hi,\" the kitten mewls at you, spreading his legs automatically. \"I'm Kittery. I wrote this game. Besides the guest writer scenes, of course. If you have any affectionate praises or abusive criticisms, please direct them towards my butthole. Thank you!\"");
			addChoice("Next.", explore.bind("secretKittNext"));
			addChoice("Back.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittNext") {
			append("You stop and stare at the little cat boi for a moment. He stares back inquisitively. His paws fiddle with each other in front of his sweater.");
			addChoice("Next. x5", explore.bind("secretKittNext2"));
			addChoice("Back.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittNext2") {
			append("You continue to stare at him with a :3c face.\n\nHe's doing the same.");
			addChoice("Next. x99", explore.bind("secretKittNext3"));
			addChoice("Back.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittNext3") {
			append("Hours pass. His little paw seems glued to his chin. :3c :3c :3c");
			addChoice("Can I have all the journal entries? :3", explore.bind("secretKittNext4"));
			addChoice("Back.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittNext4") {
			append("\"No.\" :3c");
			addChoice("Wow. Harsh.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittHub") {
			append("Kitt lazes around on his beanbag.");
			addChoice("Next.", explore.bind("secretKittNext"));
			addChoice("Hug Kitt.", explore.bind("secretKittHug"));
			addChoice("Kiss Kitt.", explore.bind("secretKittKiss"));
			addChoice("Cuddle Kitt.", explore.bind("secretKittCuddle"));
			addChoice("Pinch Kitt.", explore.bind("secretKittPinch"));
			addChoice("Punch Kitt.", explore.bind("secretKittPunch"));
			addChoice("Bully Kitt.", explore.bind("secretKittBully"));
			addChoice("Choke Kitt.", explore.bind("secretKittChoke"));
			addChoice("Molest Kitt.", explore.bind("secretKittMolest"));
			addChoice("Assfuck Kitt.", explore.bind("secretKittAssfuck"));
		}

		if (seg == "secretKittHug") {
			append("You trot up to the small boy. His eyes flutter gently over your body.\n\nAs soon as you get close enough, you curl your arms around him and pull him into a gentle hug. He purrs in response, closes his eyes with a sigh, and returns the affection by nuzzling his tiny kitten face into your belly. Then he stands on his tip-toes and presses himself against you fully, his small legs and sweater no longer able to hide his chubbening cubcock. Soon, nuzzling his cheek against you just isn't enough. He throws his weight forward and grinds his hips against you.\n\nBefore things get out-of-hand, he pulls away, huffing a little.\n\n\"T-Thanks...\" he mutters to himself.");
			addChoice("Back.", explore.bind("secretKittHub"));
		}

		if (seg == "secretKittKiss") {
			append("As you approach the little kitty, his ears flicker to and fro, with a cute little smile on his face, his eyes glistening a little - a sight that could likely melt the heart of everyone you’ve met so far. And you plan to make him that much cuter.\n\nYou quickly smirk to yourself, then go down onto one knee, leveling yourself with him, then tug him closer by his hips and watch his cheeks flush red with each inch of closed distance between you and him. Finally you lean in and press your lips to his in a kiss; his eyes go wide, then soft, then they close and he wraps all of his limbs around your body, permitting you to pick him up into a stand. His ears fold back and he gives a cute, confused little whimper at your affectionate display.
");
			addChoice("Back.", explore.bind("secretKittHub"));
		}*/

		if (seg == "myntEndingMap") {
			disablePause();
			var dawn:Bool = GameData.data.theme.background == "dawn";
			//Display smoke and sweetsmoke?
			var kempReady:Bool = (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip"));
			//Display smoke and water?
			var kempDone:Bool = data.kempTruckExploded;
			var sky1:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
			sky1.scaleX = sky1.scaleY = 1.1;
			var water:MintSprite = addSprite("worldMap/"+(dawn?"dawnSkin":"base")+"Water.png");

			playSound("assets/audio/mynt/shutdown");
			playMusic((dawn?"dawnMap":"cell"), true);

			var island:MintSprite = addSprite("worldMap/islandBase.png");
			island.move(0, -20);

			var spicySwamp:MintSprite = addSprite("worldMap/spicySwamp.png");
			spicySwamp.move(279, 221);

			var violet:MintSprite = addSprite("worldMap/violetMeteorite.png");
			violet.move(272, 70);

			var kempWaterBase:MintSprite = addSprite("worldMap/kempWaterBase.png");
			var kempTruckSmoke:MintSprite = addSprite("worldMap/kempTruckSmoke.png");
			var kempSweetSmoke:MintSprite = addSprite("worldMap/kempSweetSmoke.png");
			for (it in [kempTruckSmoke, kempWaterBase, kempSweetSmoke]) {
				it.move(272, 70);
				it.alpha = 0;
			}

			//Toggle visibility depending on what you've played through so far
			if (kempReady) kempTruckSmoke.alpha = 1;
			if (kempReady && !kempDone) kempSweetSmoke.alpha = 1;
			if (kempDone) kempWaterBase.alpha = 1;

			var brightForest:MintSprite = addSprite("worldMap/brightForest.png");
			brightForest.move(74, 156);

			var junkCity:MintSprite = addSprite("worldMap/junkCity.png");
			junkCity.move(135, 317);

			var sewage:MintSprite = addSprite("worldMap/sewage"+(isActive("Candy Ring")?"Candy.png":".png"));
			sewage.move(61, 416);

			var apothecary:MintSprite = addSprite("worldMap/apothecary.png");
			apothecary.move(527, 226);

			var apothecaryEngineRays:MintSprite = addSprite("worldMap/apothecaryEngineRays.png");
			apothecaryEngineRays.move(572, 226);

			var apothecaryTop:MintSprite = addSprite("worldMap/apothecaryTop.png");
			apothecaryTop.move(564, 116);

			var apothecaryWindows:MintSprite = addSprite("worldMap/apothecaryWindows.png");
			apothecaryWindows.move(582, 171);

			var moonBase:MintSprite = addSprite("worldMap/moonBase.png");
			moonBase.move(169, 36);

			var moonShine:MintSprite = addSprite("worldMap/moonShine.png");
			moonShine.alpha = 0.4;
			moonShine.move(169, 170);

			var flytrap:MintSprite = addSprite("worldMap/flytrap"+(data.plantGender == "she" || data.plantGender == "it" ? "Tiddy" : "Base")+".png");
			flytrap.x = brightForest.x;
			flytrap.y = brightForest.y;
			if (data.bfVenusFed > 6)
				flytrap.alpha = 1;
			else
				flytrap.alpha = 0;

			var flood:MintSprite = addSprite("assets/img/worldMap/flood.png");
			flood.y = -20;
			if (data.floodMode)
				flood.alpha = 1;
			else
				flood.alpha = 0;

			playSound("assets/audio/environment/collapse", "collapse");
			setChannelVolume("collapse", 6);

			var succMap:MintSprite = addSprite("worldMap/succMap.png");
			succMap.alpha = 0;

			var succCircles:MintSprite = addSprite("worldMap/blackHole.png");
			succCircles.x = GAME_WIDTH/2 - succCircles.width/2;
			succCircles.y = GAME_HEIGHT/2 - succCircles.height/2;
			succCircles.centerPivot = true;
			succCircles.scaleX = succCircles.scaleY = 0;
			succCircles.alpha = 0.4;

			var blackHole:MintSprite = addSprite("worldMap/blackHole.png");
			blackHole.x = GAME_WIDTH/2 - blackHole.width/2;
			blackHole.y = GAME_HEIGHT/2 - blackHole.height/2;
			blackHole.centerPivot = true;
			blackHole.scaleX = blackHole.scaleY = 0;
			//if (data.floodMode) blackHole.tint = 0xFF1bf2e5;

			var compressCount:Int = 0;
			function compressTween() {
				if (++compressCount > 43) return;
				succCircles.scaleX = succCircles.scaleY = 0 + compressCount*0.08;
				succCircles.alpha = 0.4 - compressCount*0.01;
				tween(succCircles, {alpha: 0, scaleX: 0, scaleY: 0}, 0.1 + compressCount*0.002, {onComplete: compressTween});
			}

			tween(succCircles, {alpha: 0, scaleX: 0, scaleY: 0}, 0.1, {onComplete: compressTween});

			tween(blackHole, {x: blackHole.x + 2}, 0.03, {type: PINGPONG});
			tween(blackHole, {y: blackHole.y + 2}, 0.03, {type: PINGPONG});
			tween(blackHole, {rotation: 999}, 0.1, {type: LOOP});
			tween(blackHole, {scaleX: 14, scaleY: 14}, 9, {ease: QUART_IN, startDelay: 5});

			tween(succMap, {x: succMap.x + 1}, 0.03, {type: PINGPONG});
			tween(succMap, {y: succMap.y + 1}, 0.03, {type: PINGPONG});
			tween(succMap, {alpha: 1}, 8);

			for (it in [sky1, water, island, spicySwamp, violet, kempTruckSmoke, kempWaterBase, kempSweetSmoke, brightForest, junkCity, sewage, flytrap, apothecary, apothecaryTop, apothecaryEngineRays, apothecaryWindows, moonBase, flood, succMap, succCircles, blackHole]) {
				it.layer = 52;
				if (it != succMap && it != succCircles && it != blackHole) tween(it, {y: it.y + 1}, 0.03, {type: PINGPONG});
				//Tint everything but the base sprites if you have Dawn equipped
				if (dawn && it != sky1 && it != water && it != apothecaryEngineRays && it != moonBase && it != blackHole) it.tint = 0x99ff9191;
			}

			timer(18, function() {
				enablePause();
				if (data.currentEnding == "mynt") MyntScenes.myntEnding("afterBlackHole");
				if (data.currentEnding == "mint") MyntScenes.myntEnding("afterBlackHole");
			});

			cameraFadeIn(0, 0.1);
		}

		if (seg == "protocolEndingMap") {
			disablePause();
			var dawn:Bool = data.currentEnding == "protocol" ? true : false;
			//Display smoke and sweetsmoke?
			var kempReady:Bool = (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip"));
			//Display smoke and water?
			var kempDone:Bool = data.kempTruckExploded;
			var sky1:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
			sky1.scaleX = sky1.scaleY = 1.1;
			var water:MintSprite = addSprite("worldMap/"+(dawn?"dawnSkin":"base")+"Water.png");

			playMusic((dawn?"dawnMap":"cell"), true);

			var island:MintSprite = addSprite("worldMap/islandBase.png");
			island.move(0, -20);

			var island2:MintSprite = addSprite("worldMap/islandBase.png");
			island2.move(-300, 400);

			var island3:MintSprite = addSprite("worldMap/islandBase.png");
			island3.move(-200, -200);

			var island4:MintSprite = addSprite("worldMap/islandBase.png");
			island4.move(300, 200);

			var island5:MintSprite = addSprite("worldMap/islandBase.png");
			island5.move(300, -300);

			island2.scaleX = island2.scaleY = island3.scaleX = island3.scaleY = island4.scaleX = island4.scaleY = island5.scaleX = island5.scaleY = 0;

			island2.tint = 0xFFac619d;
			island3.tint = 0xFFba5757;
			island4.tint = 0xFF687fb0;
			island5.tint = 0xFF63ac61;

			var spicySwamp:MintSprite = addSprite("worldMap/spicySwamp.png");
			spicySwamp.move(279, 221);

			var violet:MintSprite = addSprite("worldMap/violetMeteorite.png");
			violet.move(272, 70);

			var kempWaterBase:MintSprite = addSprite("worldMap/kempWaterBase.png");
			var kempTruckSmoke:MintSprite = addSprite("worldMap/kempTruckSmoke.png");
			var kempSweetSmoke:MintSprite = addSprite("worldMap/kempSweetSmoke.png");
			for (it in [kempTruckSmoke, kempWaterBase, kempSweetSmoke]) {
				it.move(272, 70);
				it.alpha = 0;
			}

			//Toggle visibility depending on what you've played through so far
			if (kempReady) kempTruckSmoke.alpha = 1;
			if (kempReady && !kempDone) kempSweetSmoke.alpha = 1;
			if (kempDone) kempWaterBase.alpha = 1;

			var brightForest:MintSprite = addSprite("worldMap/brightForest.png");
			brightForest.move(74, 156);

			var junkCity:MintSprite = addSprite("worldMap/junkCity.png");
			junkCity.move(135, 317);

			var sewage:MintSprite = addSprite("worldMap/sewage"+(isActive("Candy Ring")?"Candy.png":".png"));
			sewage.move(61, 416);

			var apothecary:MintSprite = addSprite("worldMap/apothecary.png");
			apothecary.move(527, 226);

			var apothecaryEngineRays:MintSprite = addSprite("worldMap/apothecaryEngineRays.png");
			apothecaryEngineRays.move(572, 226);

			var apothecaryTop:MintSprite = addSprite("worldMap/apothecaryTop.png");
			apothecaryTop.move(564, 116);

			var apothecaryWindows:MintSprite = addSprite("worldMap/apothecaryWindows.png");
			apothecaryWindows.move(582, 171);

			var moonBase:MintSprite = addSprite("worldMap/moonBase.png");
			moonBase.move(169, 36);

			var moonShine:MintSprite = addSprite("worldMap/moonShine.png");
			moonShine.alpha = 0.4;
			moonShine.move(169, 170);

			var flytrap:MintSprite = addSprite("worldMap/flytrap"+(data.plantGender == "she" || data.plantGender == "it" ? "Tiddy" : "Base")+".png");
			flytrap.x = brightForest.x;
			flytrap.y = brightForest.y;
			if (data.bfVenusFed > 6)
				flytrap.alpha = 1;
			else
				flytrap.alpha = 0;

			var flood:MintSprite = addSprite("assets/img/worldMap/flood.png");
			flood.y = -20;
			if (data.floodMode)
				flood.alpha = 1;
			else
				flood.alpha = 0;

			
			//setChannelVolume("collapse", 6);

			if (data.currentEnding != "protocol") {
				playSound("assets/audio/environment/adminGained", "adminGained");
				timer(3, cameraFadeOut.bind(0xFFFFFF, 5));
				timer(4, playSound.bind('assets/audio/mynt/intro'));
				timer(10, function() {
					data.currentEnding = "protocol";
					explore("protocolEndingMap");
				});
			} else {
				tween(flood, {alpha: 0}, 5, {startDelay: 2});
				tween(sewage, {alpha: 0}, 4, {startDelay: 2});
				timer(5, tween.bind(water, {scaleX: 8, scaleY: 2}, 5, {ease: QUINT_IN}));
				timer(7, tween.bind(island, {scaleX: 1.2, scaleY: 1.1}, 5, {ease: QUAD_IN_OUT}));
				timer(9.2, tween.bind(island2, {scaleX: 1.5, scaleY: 2}, 3, {ease: ELASTIC_OUT}));
				timer(11, tween.bind(island3, {scaleX: 0.9, scaleY: 0.4}, 3.5, {ease: ELASTIC_OUT}));
				timer(14, tween.bind(island4, {scaleX: 0.6, scaleY: 0.6}, 2.5, {ease: ELASTIC_OUT}));
				timer(15, tween.bind(island5, {scaleX: 1.1, scaleY: 0.5}, 4, {ease: ELASTIC_OUT}));
				timer(19, function() {
					cameraFadeOut(0xFFff9191, 5, function() {
						cameraFadeIn(0xFFff9191, 5);
						explore("thelly1");
					});
				});
			}

			for (it in [sky1, water, island, island2, island3, island4, island5, spicySwamp, violet, kempTruckSmoke, kempWaterBase, kempSweetSmoke, brightForest, junkCity, sewage, flytrap, apothecary, apothecaryTop, apothecaryEngineRays, apothecaryWindows, moonBase, flood]) {
				it.layer = 52;
				//tween(it, {y: it.y + 1}, 0.03, {type: PINGPONG});
				//Tint everything but the base sprites if you have Dawn equipped
				if (dawn && it != sky1 && it != water && it != apothecaryEngineRays && it != moonBase && it != island2 && it != island3 && it != island4 && it != island5 && it != flood) it.tint = 0x99ff9191;
			}

			cameraFadeIn(0xFFFFFF, 0.1);
		}

		if (seg == "meteoriteEndingMap") {
			disablePause();
			data.currentEnding = "meteorite";

			var dawn:Bool = (GameData.data.theme.background == "dawn" ? true : false);
			//Display smoke and sweetsmoke?
			var kempReady:Bool = (getJournalEntries().contains("Kemp Pizza") && getJournalEntries().contains("Skunk cub camping trip"));
			//Display smoke and water?
			
			var kempDone:Bool = data.kempTruckExploded;
			var sky1:MintSprite = addSprite("worldMap/"+(dawn?"dawn":"base")+"Sky.png");
			sky1.scaleX = sky1.scaleY = 1.1;
			var water:MintSprite = addSprite("worldMap/"+(dawn?"dawnSkin":"base")+"Water.png");

			/*var kempDone:Bool = data.kempTruckExploded;
			var sky1:MintSprite = addSprite("worldMap/baseSky.png");
			sky1.scaleX = sky1.scaleY = 1.1;
			var water:MintSprite = addSprite("worldMap/baseWater.png");*/

			//playMusic("cell", true);
			playMusic((dawn?"dawnMap":"cell"), true);

			var island:MintSprite = addSprite("worldMap/islandBase.png");
			island.move(0, -20);

			var spicySwamp:MintSprite = addSprite("worldMap/spicySwamp.png");
			spicySwamp.move(279, 221);

			var vmEyeBall:MintSprite = addSprite("worldMap/vmEyeBall.png");
			vmEyeBall.move(272, 70);

			var vmEyeLid:MintSprite = addSprite("worldMap/vmEyeLid.png");
			vmEyeLid.move(272, 70);

			var vmEyeOpen:MintSprite = addSprite("worldMap/vmEyeOpen.png");
			vmEyeOpen.move(272, 70);

			var seedDelay:Float = 19;

			var timer1:Int = 0;
			var timer2:Int = 0;
			var timer3:Int = 0;
			var timer4:Int = 0;
			var timer5:Int = 0;
			var timer6:Int = 0;
			var timerAlt1:Int = 0;
			var timerAlt2:Int = 0;
			var timerAlt3:Int = 0;
			var timerAlt4:Int = 0;
			

			for (chara in ["Roxelle", "Cade", "Kemp", "Red", "Septrica", "Marei", "Som"]) {
				seedDelay += 1;
				var seed:MintSprite = addSprite("assets/img/item/"+chara+"'s Seed.png");
				seed.layer = 53;
				seed.x = vmEyeOpen.x + vmEyeOpen.width/2 - seed.width/2;
				seed.y = GAME_HEIGHT;
				seed.scaleX = seed.scaleY = 2;
				tween(seed, {scaleX: 0, scaleY: 0}, 5, {ease: QUART_IN, startDelay: seedDelay+0.2, onComplete: function() {
					vmEyeOpen.tint = 0x40FFFFFF;
					playSound("assets/audio/environment/powerBlink", "powerBlink");
					setChannelVolume("powerBlink", 2);
					timer1 = timer(0.1, function() { vmEyeOpen.tint = 0; });
				}});
				tween(seed, {y: 215}, 5, {ease: QUAD_IN_OUT, startDelay: seedDelay});
			}

			var vmPupilCloser:MintSprite = addRectSprite(50, 235, 0xb94694);
			vmPupilCloser.alpha = 0;
			vmPupilCloser.applyGlowEffect(0xb94694, 1, 7, 25, 2);
			vmPupilCloser.move(330, 145);

			var vmPupilCloser2:MintSprite = addRectSprite(50, 235, 0xb94694);
			vmPupilCloser2.alpha = 0;
			vmPupilCloser2.applyGlowEffect(0xb94694, 1, 7, 25, 2);
			vmPupilCloser2.move(470, 145);

			loadingNumber = addText();
			loadingNumber.setFormat({wordWrap: false, fontColour: 0xb94694, fontSize: 72});
			loadingNumber.setText("99%");
			loadingNumber.x = GAME_WIDTH/2 - loadingNumber.fieldWidth/2 + 20;
			loadingNumber.y = 10;
			loadingNumber.applyGlowEffect(0xe196cc, 1, 5, 5, 10);
			loadingNumber.alpha = 0;

			var kempWaterBase:MintSprite = addSprite("worldMap/kempWaterBase.png");
			var kempTruckSmoke:MintSprite = addSprite("worldMap/kempTruckSmoke.png");
			var kempSweetSmoke:MintSprite = addSprite("worldMap/kempSweetSmoke.png");
			for (it in [kempTruckSmoke, kempWaterBase, kempSweetSmoke]) {
				it.move(272, 70);
				it.alpha = 0;
			}

			//Toggle visibility depending on what you've played through so far
			if (kempReady) kempTruckSmoke.alpha = 1;
			if (kempReady && !kempDone) kempSweetSmoke.alpha = 1;
			if (kempDone) kempWaterBase.alpha = 1;

			var brightForest:MintSprite = addSprite("worldMap/brightForest.png");
			brightForest.move(74, 156);

			var junkCity:MintSprite = addSprite("worldMap/junkCity.png");
			junkCity.move(135, 317);

			var sewage:MintSprite = addSprite("worldMap/sewage"+(isActive("Candy Ring")?"Candy.png":".png"));
			sewage.move(61, 416);

			var apothecary:MintSprite = addSprite("worldMap/apothecary.png");
			apothecary.move(527, 226);

			var apothecaryEngineRays:MintSprite = addSprite("worldMap/apothecaryEngineRays.png");
			apothecaryEngineRays.move(572, 226);

			var apothecaryTop:MintSprite = addSprite("worldMap/apothecaryTop.png");
			apothecaryTop.move(564, 116);

			var apothecaryWindows:MintSprite = addSprite("worldMap/apothecaryWindows.png");
			apothecaryWindows.move(582, 171);

			var moonBase:MintSprite = addSprite("worldMap/moonBase.png");
			moonBase.move(169, 36);

			var moonShine:MintSprite = addSprite("worldMap/moonShine.png");
			moonShine.alpha = 0.4;
			moonShine.move(169, 170);

			var flytrap:MintSprite = addSprite("worldMap/flytrap"+(data.plantGender == "she" || data.plantGender == "it" ? "Tiddy" : "Base")+".png");
			flytrap.x = brightForest.x;
			flytrap.y = brightForest.y;
			if (data.bfVenusFed > 6)
				flytrap.alpha = 1;
			else
				flytrap.alpha = 0;

			var flood:MintSprite = addSprite("assets/img/worldMap/flood.png");
			flood.y = -20;
			if (data.floodMode)
				flood.alpha = 1;
			else
				flood.alpha = 0;

			playSound("assets/audio/environment/collapse", "collapse");
			setChannelVolume("collapse", 6);

			if (data.floodMode) tween(flood, {alpha: 0}, 4);
			timer2 = timer(3, function() {
				tween(vmEyeOpen, {x: vmEyeOpen.x + 1}, 0.03, {type: PINGPONG});
				tween(vmEyeLid, {x: vmEyeLid.x + 1}, 0.03, {type: PINGPONG});
				tween(vmEyeBall, {x: vmEyeBall.x + 1}, 0.03, {type: PINGPONG});
			});
			timer3 = timer(4, tween.bind(vmEyeLid, {y: vmEyeLid.y - vmEyeLid.height/3, scaleY: 0}, 20, {startDelay: 2.5}));
			timer4 = timer(14, function() {
				vmEyeOpen.cancelTweens();
				vmEyeLid.cancelTweens();
				vmEyeBall.cancelTweens();
			});
			timer5 = timer(19, function() {
				vmEyeLid.alpha = 0;
				for (it in [spicySwamp, kempTruckSmoke, kempWaterBase, kempSweetSmoke, brightForest, junkCity, sewage, flytrap, apothecary, apothecaryTop, apothecaryEngineRays, apothecaryWindows, moonBase, flood])
				tween(it, {alpha: 0}, 5);

				tween(water, {alpha: 0}, 5, {startDelay: 4});
				tween(island, {alpha: 0}, 7, {startDelay: 7});
				tween(vmEyeOpen, {alpha: 0}, 7, {startDelay: 9});
				
				tween(vmEyeBall, {scaleX: 15, scaleY: 15}, 8, {startDelay: 8, ease: QUINT_IN, onComplete: function() {
					tween(vmEyeBall, {scaleX: 16, scaleY: 16}, 2);
				}});
				
				tween(vmPupilCloser, {x: vmPupilCloser.x + 46}, 5, {startDelay: 19, ease: QUAD_OUT});
				tween(vmPupilCloser2, {x: vmPupilCloser2.x - 46}, 5, {startDelay: 19, ease: QUAD_OUT});
				tween(loadingNumber, {alpha: 1}, 7, {startDelay: 17});
			});

			timerAlt1 = timer(25, function() { playSound("assets/audio/environment/despairSting", "despair", {loops: 3}); });
			timerAlt2 = timer(29, function() { playSound("assets/audio/mynt/intro", "intro"); });
			timerAlt3 = timer(38, function() { vmPupilCloser.alpha = 1; vmPupilCloser2.alpha = 1; });
			timerAlt4 = timer(44, function() { playSound("assets/audio/environment/caveWinSmall"); if (loadingNumber != null) loadingNumber.setText("100%"); });

			for (it in [sky1, water, island, spicySwamp, vmEyeBall, vmEyeLid, vmEyeOpen, loadingNumber, vmPupilCloser, vmPupilCloser2, kempTruckSmoke, kempWaterBase, kempSweetSmoke, brightForest, junkCity, sewage, flytrap, apothecary, apothecaryTop, apothecaryEngineRays, apothecaryWindows, moonBase, flood]) {
				it.layer = 52;
				//tween(it, {y: it.y + 1}, 0.03, {type: PINGPONG});
				//Tint everything but the base sprites if you have Dawn equipped
				//if (dawn && it != sky1 && it != water && it != apothecaryEngineRays && it != moonBase && it != flood && it != vmEyeBall) it.tint = 0x99ff9191;
			}

			var paraBg:MintSprite = addSprite("assets/img/effect/systemBox.png");
				paraBg.layer = Main.TOOLTIP_SPRITE_LAYER;
				paraBg.x = GAME_WIDTH/2 - paraBg.width/2;
				paraBg.y = GAME_HEIGHT/2 - paraBg.height/2;
				paraBg.mouseEnabled = false;
				paraBg.alpha = 0;

			var titleText:MintText = addText();
				titleText.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText.alpha = 0;
				titleText.setText("All four layers of reality have been fully paraphrased:");
				titleText.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText.x = paraBg.x + paraBg.width/2 - titleText.fieldWidth/2;
				titleText.y = paraBg.y + paraBg.height/2 - titleText.fieldHeight/2;
				titleText.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText2:MintText = addText();
				titleText2.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText2.alpha = 0;
				titleText2.setText("Mynt's physical layer, her library shell, her island shell, and the player character's physical layer.");
				titleText2.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText2.x = paraBg.x + paraBg.width/2 - titleText2.fieldWidth/2 + 130; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText2.y = paraBg.y + paraBg.height/2 - titleText2.fieldHeight/2 - 20;
				titleText2.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText3:MintText = addText();
				titleText3.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText3.alpha = 0;
				titleText3.setText("In order to paraphrase these layers, we used four disguised vessels:");
				titleText3.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText3.x = paraBg.x + paraBg.width/2 - titleText3.fieldWidth/2 + 50; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText3.y = paraBg.y + paraBg.height/2 - titleText3.fieldHeight/2 - 20;
				titleText3.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText4:MintText = addText();
				titleText4.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText4.alpha = 0;
				titleText4.setText("A dress. A book. Two meteorites.");
				titleText4.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText4.x = paraBg.x + paraBg.width/2 - titleText4.fieldWidth/2; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText4.y = paraBg.y + paraBg.height/2 - titleText4.fieldHeight/2 - 20;
				titleText4.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText5:MintText = addText();
				titleText5.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText5.alpha = 0;
				titleText5.setText("We understand there is at least one more layer above the player character's.");
				titleText5.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText5.x = paraBg.x + paraBg.width/2 - titleText5.fieldWidth/2 + 70; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText5.y = paraBg.y + paraBg.height/2 - titleText5.fieldHeight/2 - 20;
				titleText5.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText6:MintText = addText();
				titleText6.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText6.alpha = 0;
				titleText6.setText("That would be yours.");
				titleText6.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText6.x = paraBg.x + paraBg.width/2 - titleText6.fieldWidth/2; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText6.y = paraBg.y + paraBg.height/2 - titleText6.fieldHeight/2 - 20;
				titleText6.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText7:MintText = addText();
				titleText7.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText7.alpha = 0;
				titleText7.setText("Be certain a Paraphore will land there, too.");
				titleText7.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText7.x = paraBg.x + paraBg.width/2 - titleText7.fieldWidth/2; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText7.y = paraBg.y + paraBg.height/2 - titleText7.fieldHeight/2 - 20;
				titleText7.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText8:MintText = addText();
				titleText8.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText8.alpha = 0;
				titleText8.setText("Thank you for playing.\n\nDev password: staystrongrebeca");
				titleText8.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText8.x = paraBg.x + paraBg.width/2 - titleText8.fieldWidth/2; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText8.y = paraBg.y + paraBg.height/2 - titleText8.fieldHeight/2 - 20;
				titleText8.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);
				
			paraBg.scaleX = paraBg.scaleY = 0;
			titleText.scaleX = titleText.scaleY = 0;
			titleText2.scaleX = titleText2.scaleY = 0;
			titleText3.scaleX = titleText3.scaleY = 0;
			titleText4.scaleX = titleText4.scaleY = 0;
			titleText5.scaleX = titleText5.scaleY = 0;
			titleText6.scaleX = titleText6.scaleY = 0;
			titleText7.scaleX = titleText7.scaleY = 0;
			titleText8.scaleX = titleText8.scaleY = 0;

			paraBg.update();
			titleText.update();
			titleText2.update();
			titleText3.update();
			titleText4.update();
			titleText5.update();
			titleText6.update();
			titleText7.update();
			titleText8.update();

			timer6 = timer(47, function() {
				playSound("assets/audio/ui/premature");
				tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
				tween(titleText, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});

				paraBg.onReleaseOnce = function () {
					if (titleText.alpha >= 1 && titleText2.alpha <= 0) {
						//You clicked the first message box
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							//Second message box appears
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText2, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText2.alpha >= 1 && titleText3.alpha <= 0) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText2.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText2, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText3, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText2.alpha <= 0 && titleText3.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText3.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText3, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText4, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText3.alpha <= 0 && titleText4.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText4.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText4, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText5, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText4.alpha <= 0 && titleText5.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText5.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText5, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText6, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText5.alpha <= 0 && titleText6.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText6.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText6, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText7, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText6.alpha <= 0 && titleText7.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText7.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText7, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText8, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else if (titleText7.alpha <= 0 && titleText8.alpha >= 1) {
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						titleText8.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText8, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							cameraFadeOut(0, 0.1);
							timer(3, explore.bind("endingsHub"));
						}});
					}
				}
			});

			cameraFadeIn(0xFFFFFF, 2);
		}

		if (seg == "shelter") {
			data.breakerFlipped = false;
			data.gotCane = false;
			disablePause();

			var background:MintSprite = addSprite("assets/img/intro/titleScreen.png");
			var monitor:MintSprite = addSprite("assets/img/intro/monitor.png");
			var monitorBlack:MintSprite = addRectSprite(494, 344, 0xFF0d0d0d);
				monitorBlack.x = 155;
				monitorBlack.y = -156;

			for (sprite in [background, monitor, monitorBlack]) {
				sprite.scaleX = sprite.scaleY = 3;
				sprite.centerPivot = true;
				sprite.alpha = 0;
				sprite.update();
			}

			playMusic("cell");
			playSound("assets/audio/environment/shelterFan", "shelterFan", {loops: 99999});
			setChannelVolume("shelterFan", 0.3);

			var timerBlinkInc:Float;
			timerBlinkInc = 1.165;
			for (i in 0...7) {
				timer(timerBlinkInc, playSound.bind("assets/audio/environment/powerBlink"));
				timerBlinkInc += 2.36; //The most magic of numbers. Delaying each playSound by this duration will make it sync up with the power blinking animation.
			}
			
			//Squeezy easter egg
			var squeezy:MintSprite = addRectSprite(60, 130, 0);
			squeezy.y = 315;
			squeezy.onReleaseOnce = function() {
				playSound("assets/audio/secret/squeezy");

				var spurtDelay:Float = 0.1;
				for (i in 0...21) {
					spurtDelay += 0.005+spurtDelay*0.2;
					var spurt:MintSprite = addSprite("assets/img/intro/splurt.png");
					spurt.x = 45;
					spurt.y = 282;
					tween(spurt, {x: spurt.x + 45+200*Math.random()-(200*spurtDelay*0.1), y: spurt.y + 50+150*Math.random()+(10*spurtDelay*0.3)}, 0.2+spurtDelay*0.05, {startDelay: spurtDelay});
					tween(spurt, {alpha: 0}, 5-spurtDelay, {startDelay: spurtDelay, onComplete: function() {
							spurt.destroy();
						}
					});
				}
			}

			squeezy.alpha = 0;
			for (sprite in [background, monitor, monitorBlack]) {
				sprite.alpha = 1;
				sprite.update();
			}
			
			//Zoom out from the black screen
			tween(background, {scaleX: 1, scaleY: 1}, 6, {ease: QUART_OUT});
			tween(monitor, {scaleX: 1, scaleY: 1}, 6, {ease: QUART_OUT, onComplete: tween.bind(monitor, {alpha: 0}, 2, {ease: QUAD_OUT})});
			tween(monitorBlack, {scaleX: 1, scaleY: 1, y: 35}, 6, {ease: QUART_OUT, onComplete: tween.bind(monitorBlack, {alpha: 0}, 3, {ease: QUAD_IN})});

			timer(17, function() {
				background.playing = false;
			});

			//Show the Paraphore's messages if you're in the mynt ending
			if (data.currentEnding == "mynt") {
				var paraBg:MintSprite = addSprite("assets/img/effect/systemBox.png");
				paraBg.layer = Main.TOOLTIP_SPRITE_LAYER;
				paraBg.x = GAME_WIDTH/2 - paraBg.width/2;
				paraBg.y = GAME_HEIGHT/2 - paraBg.height/2;
				paraBg.mouseEnabled = false;
				paraBg.alpha = 0;

				var titleText:MintText = addText();
				titleText.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText.alpha = 0;
				titleText.setText("The bomb shelter has entered <!b>reserve power mode.<!b>");
				titleText.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText.x = paraBg.x + paraBg.width/2 - titleText.fieldWidth/2;
				titleText.y = paraBg.y + paraBg.height/2 - titleText.fieldHeight/2;
				titleText.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

				var titleText2:MintText = addText();
				titleText2.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText2.alpha = 0;
				titleText2.setText("Reroute power to the PC using the <!b>breaker board<!b> in the main hall.");
				titleText2.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText2.x = paraBg.x + paraBg.width/2 - titleText2.fieldWidth/2 + 50; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText2.y = paraBg.y + paraBg.height/2 - titleText2.fieldHeight/2 - 20;
				titleText2.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);
				
				paraBg.scaleX = paraBg.scaleY = 0;
				titleText.scaleX = titleText.scaleY = 0;
				titleText2.scaleX = titleText2.scaleY = 0;

				paraBg.update();
				titleText.update();
				titleText2.update();

				timer(22, function() {
					//First message box appears
					playSound("assets/audio/ui/premature");
					tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
					tween(titleText, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});

					paraBg.onReleaseOnce = function () {
						if (titleText2.alpha <= 0) {
							//You clicked the first message box
							playSound("assets/audio/ui/tak");
							paraBg.cancelTweens();
							paraBg.mouseEnabled = false;
							tween(titleText, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
							tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
								//Second message box appears
								playSound("assets/audio/ui/premature");
								tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
								tween(titleText2, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
							}});
						} else {
							//You clicked the second message box
							playSound("assets/audio/ui/tak");
							paraBg.cancelTweens();
							paraBg.mouseEnabled = false;
							tween(titleText2, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
							tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
								//Second message box has disappeared, give the player the option to fuck off now
								var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
								bac.x = GAME_WIDTH/2-bac.width/2;
								bac.y = GAME_HEIGHT-bac.height*1.2;
								bac.alpha = 0;
								bac.update();

								tween(bac, {alpha: 1}, 0.3);

								bac.onHoverOnce = function() {
									StoryUtils.yesNudge([bac]);
									playSound("assets/audio/ui/hover8");
								}

								bac.onUnHoverOnce = function() {
									bac.clearEffects();
								}

								bac.onReleaseOnce = function() {
									bac.mouseEnabled = false;
									cameraFadeOut(0, 1.5);
									playSound("assets/audio/ui/topClick");
									tween(monitor, {alpha: 0}, 0.4, {ease: QUAD_IN});
									tween(monitorBlack, {alpha: 0}, 1.5, {ease: QUAD_IN});

									tween(background, {scaleY: 1.3, y: -background.height/6}, 1.5, {ease: QUAD_IN, onComplete: function() {
										Endings.explore("shelterLibrary");
									}});
								}
							}});
						}
					}
				});
			} else {
				timer(22, function() {
					var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
						bac.x = GAME_WIDTH/2-bac.width/2;
						bac.y = GAME_HEIGHT-bac.height*1.2;
						bac.alpha = 0;
						bac.update();

						tween(bac, {alpha: 1}, 0.3);

						bac.onHoverOnce = function() {
							StoryUtils.yesNudge([bac]);
							playSound("assets/audio/ui/hover8");
						}

						bac.onUnHoverOnce = function() {
							bac.clearEffects();
						}

						bac.onReleaseOnce = function() {
							bac.mouseEnabled = false;
							cameraFadeOut(0, 1.5);
							playSound("assets/audio/ui/topClick");
							tween(monitor, {alpha: 0}, 0.4, {ease: QUAD_IN});
							tween(monitorBlack, {alpha: 0}, 1.5, {ease: QUAD_IN});

							tween(background, {scaleY: 1.3, y: -background.height/6}, 1.5, {ease: QUAD_IN, onComplete: function() {
								Endings.explore("shelterLibrary");
							}});
						}
				});
			}
			

			/*timer(22, function() {
				cameraFadeOut(0x920a0a, 1.2);
			});

			timer(24, function() {
				enablePause();
				Test.test("devteleportnewscenes");
			});*/

			cameraFadeIn(0xFF0d0d0d, 0.5);
		}

		if (seg == "shelterDesk") {
			var lookingBehind:Bool = false;
			if (!data.breakerFlipped) setChannelVolume("shelterFan", 0.5);
			var background:MintSprite = addSprite("assets/img/"+(data.breakerFlipped?"effect/shelter/titleScreenPowered":"intro/titleScreen")+".png");
			background.centerPivot = true;

			var monitor:MintSprite = addSprite("assets/img/intro/monitor.png");
			monitor.mouseEnabled = !lookingBehind;

			monitor.playing = false;
			background.playing = false;

			var monitorScreen:MintSprite = addRectSprite(494, 344, (data.breakerFlipped?0xbffffd:0));
				monitorScreen.x = 155;
				monitorScreen.y = 35;

			var myntMessage:MintSprite = addSprite("assets/img/effect/myntMessage");
				myntMessage.mouseEnabled = (!lookingBehind && data.breakerFlipped);
				myntMessage.x = monitorScreen.x+monitorScreen.width/2-myntMessage.width/2-10;
				myntMessage.y = monitorScreen.y+monitorScreen.height/2-myntMessage.height/2;
				myntMessage.alpha = 0;

			var squeezy:MintSprite = addRectSprite(60, 130, 0);
				squeezy.y = 315;
				squeezy.alpha = 0;
				squeezy.onReleaseOnce = function() {
					playSound("assets/audio/secret/squeezy");

					var spurtDelay:Float = 0.1;
					for (i in 0...21) {
						spurtDelay += 0.005+spurtDelay*0.2;
						var spurt:MintSprite = addSprite("assets/img/intro/splurt.png");
						if (data.breakerFlipped) spurt.tint = 0xFF20ad80;
						spurt.x = 45;
						spurt.y = 282;
						tween(spurt, {x: spurt.x + 45+200*Math.random()-(200*spurtDelay*0.1), y: spurt.y + 50+150*Math.random()+(10*spurtDelay*0.3)}, 0.2+spurtDelay*0.05, {startDelay: spurtDelay});
						tween(spurt, {alpha: 0}, 5-spurtDelay, {startDelay: spurtDelay, onComplete: function() {
								spurt.destroy();
							}
						});
					}
				}

			if (data.breakerFlipped) {
				myntMessage.alpha = 1;

				var lookBehind:MintSprite = addSprite("assets/img/effect/shelter/forwardArrow");
				lookBehind.x = GAME_WIDTH/2-lookBehind.width/2;
				lookBehind.y = lookBehind.height*0.2;
				lookBehind.alpha = 0;
				lookBehind.update();

				tween(lookBehind, {alpha: 1}, 0.3);

				lookBehind.onHoverOnce = function() {
					StoryUtils.yesNudge([lookBehind]);
					playSound("assets/audio/ui/hover8");
				}

				lookBehind.onUnHoverOnce = function() {
					lookBehind.clearEffects();
				}

				lookBehind.onReleaseOnce = function() {
					if (!lookingBehind) {
						lookBehind.setupAnimated("assets/img/effect/shelter/backArrow");
						lookingBehind = true;
						tween(monitor, {alpha: 0}, 0.3);
						tween(monitorScreen, {alpha: 0}, 0.5);
						tween(myntMessage, {alpha: 0}, 0.5);
					} else {
						lookBehind.setupAnimated("assets/img/effect/shelter/forwardArrow");
						lookingBehind = false;
						tween(monitor, {alpha: 1}, 0.5);
						tween(monitorScreen, {alpha: 1}, 0.5);
						tween(myntMessage, {alpha: 1}, 0.5);
					}

					myntMessage.mouseEnabled = !lookingBehind;
					monitor.mouseEnabled = !lookingBehind;
					playSound("assets/audio/ui/topClick");
				}

				myntMessage.onReleaseOnce = function() {
					stopChannel("shelterFan");
					playSound("assets/audio/environment/caveWinSmall");
					cameraFadeOut(0xFFFFFF, 3, MyntScenes.myntEnding.bind("afterShelter"));
				}
			}

			var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
				bac.x = GAME_WIDTH/2-bac.width/2;
				bac.y = GAME_HEIGHT-bac.height*1.2;
				bac.alpha = 0;
				bac.update();

				tween(bac, {alpha: 1}, 0.3);

				bac.onHoverOnce = function() {
					StoryUtils.yesNudge([bac]);
					playSound("assets/audio/ui/hover8");
				}

				bac.onUnHoverOnce = function() {
					bac.clearEffects();
				}

				bac.onReleaseOnce = function() {
					bac.mouseEnabled = false;
					cameraFadeOut(0, 1.5);
					playSound("assets/audio/ui/topClick");
					tween(monitor, {alpha: 0}, 0.4, {ease: QUAD_IN});
					tween(monitorScreen, {alpha: 0}, 1.5, {ease: QUAD_IN});
					tween(myntMessage, {alpha: 0}, 1.5, {ease: QUAD_IN});

					tween(background, {scaleY: 1.3, y: -background.height/6}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterLibrary");
					}});
				}
			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterLibrary") {
			if (!data.breakerFlipped) setChannelVolume("shelterFan", 1);
			var library:MintSprite = addSprite("assets/img/effect/shelter/library"+(data.breakerFlipped?"Powered":""));
			library.centerPivot = true;

			var libraryFan:MintSprite = addSprite("assets/img/effect/shelter/lib"+(data.breakerFlipped?"Off":"")+"Fan.png");
			libraryFan.x = GAME_WIDTH/2-libraryFan.width/2;

			var fwd:MintSprite = addRectSprite(200, 200, 0);
				fwd.x = GAME_WIDTH/2-fwd.width/2;
				fwd.y = GAME_HEIGHT/2-fwd.height/2;
				fwd.alpha = 0;
				fwd.mouseEnabled = data.gotCane;

				fwd.onReleaseOnce = function() {
					fwd.mouseEnabled = false;
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					cameraFadeOut(0, 1.5);
					tween(libraryFan, {y: -libraryFan.height*1.2}, 1.5, {ease: QUAD_IN});

					tween(library, {scaleX: 2, scaleY: 2}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterHall");
					}});
				}

			var cane:MintSprite = addSprite("assets/img/effect/shelter/cane.png");
				cane.x = 650;
				cane.y = 350;
				cane.alpha = (data.gotCane?0:1);
				cane.mouseEnabled = !data.gotCane;

			cane.onHoverOnce = function() {
				StoryUtils.yesNudge([cane]);
				playSound("assets/audio/ui/hover2");
			}

			cane.onUnHoverOnce = function() {
				cane.clearEffects();
			}

			cane.onReleaseOnce = function() {
				data.gotCane = true;
				cane.mouseEnabled = false;
				playSound("assets/audio/environment/strip");
				fwd.mouseEnabled = true;
				tween(cane, {alpha: 0, y: cane.y+20}, 0.7);
			}

			var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
				bac.x = GAME_WIDTH/2-bac.width/2;
				bac.y = GAME_HEIGHT-bac.height*1.2;
				bac.alpha = 0;
				bac.update();

				tween(bac, {alpha: 1}, 0.3);

				bac.onHoverOnce = function() {
					StoryUtils.yesNudge([bac]);
					playSound("assets/audio/ui/hover8");
				}

				bac.onUnHoverOnce = function() {
					bac.clearEffects();
				}

				bac.onReleaseOnce = function() {
					bac.mouseEnabled = false;
					cameraFadeOut(0, 1.5, Endings.explore.bind("shelterDesk"));
					playSound("assets/audio/ui/topClick");
					tween(libraryFan, {y: -libraryFan.height*0.7}, 1.5, {ease: QUAD_IN});

					tween(library, {scaleY: 1.3, y: -library.height/6}, 1.5, {ease: QUAD_IN});
				}

			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterHall") {
			if (!data.breakerFlipped) setChannelVolume("shelterFan", 0.5);
			var hall:MintSprite = addSprite("assets/img/effect/shelter/mainHall.png");
			hall.centerPivot = true;
			var hallBreaker:MintSprite = addSprite("assets/img/effect/shelter/mainHallBreaker.png");
				hallBreaker.alpha = (data.breakerFlipped?1:0);

			var fwd:MintSprite = addRectSprite(250, 200, 0);
				fwd.x = GAME_WIDTH/2-fwd.width/2;
				fwd.y = GAME_HEIGHT/2-fwd.height/2;
				fwd.alpha = 0;
				fwd.update();

				fwd.onReleaseOnce = function() {
					fwd.mouseEnabled = false;
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					cameraFadeOut(0, 1.5);
					
					tween(hallBreaker, {scaleX: 2, scaleY: 2}, 1.5, {ease: QUAD_IN});

					tween(hall, {scaleX: 2, scaleY: 2}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterStairs");
					}});
				}

			var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
				bac.x = GAME_WIDTH/2-bac.width/2;
				bac.y = GAME_HEIGHT-bac.height*1.2;
				bac.alpha = 0;
				bac.update();

				tween(bac, {alpha: 1}, 0.3);

				bac.onHoverOnce = function() {
					StoryUtils.yesNudge([bac]);
					playSound("assets/audio/ui/hover8");
				}

				bac.onUnHoverOnce = function() {
					bac.clearEffects();
				}

				bac.onReleaseOnce = function() {
					bac.mouseEnabled = false;
					cameraFadeOut(0, 1.5, Endings.explore.bind("shelterLibrary"));
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					tween(hallBreaker, {scaleY: 1.3, y: hallBreaker.y-hallBreaker.height*0.2}, 1.5, {ease: QUAD_IN});

					tween(hall, {scaleY: 1.3, y: -hall.height/6}, 1.5, {ease: QUAD_IN});
				}

			var breakerHitbox:MintSprite = addRectSprite(140, 280, 0);
				breakerHitbox.alpha = 0;
				breakerHitbox.update();
				if (data.currentEnding != "mynt") breakerHitbox.onHover = showToolTipOnCursor.bind("<!16px>In this timeline, the player character does not even consider using the shelter's breaker board.<!16px>", "", "sys");

				breakerHitbox.onHoverOnce = function() {
					StoryUtils.yesNudge([hallBreaker]);
					playSound("assets/audio/ui/hover2");
				}

				breakerHitbox.onUnHoverOnce = function() {
					hallBreaker.clearEffects();
				}

				breakerHitbox.onReleaseOnce = function() {
					if (data.currentEnding == "mynt") {
						breakerHitbox.mouseEnabled = false;
						fwd.mouseEnabled = false;
						bac.mouseEnabled = false;
						cameraFadeOut(0, 0.5);
						timer(0.5, Endings.explore.bind("shelterBreaker"));
					}
				}

			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterBreaker") {
			if (!data.breakerFlipped) setChannelVolume("shelterFan", 0.4);
			var breaker:MintSprite = addSprite("assets/img/effect/shelter/breaker.png");
			breaker.centerPivot = true;

			var breakerTooltips:Array<String> = ["This breaker toggles the lights for Cade, Wendy, Michael, and Gabriel's rooms.\n\nReserve power mode has disabled it.", "This breaker toggles the dim lights for prayer time.\n\nIt's broken.", "This breaker toggles the shelter's Wydget Network.\n\nReserve power mode has disabled it.", "This breaker toggles the lock for the shelter door.\n\nReserve power mode has disabled it.", "This breaker was never functional.", "This breaker toggles the lights and appliances in the mess hall.\n\nIt's still grimy from Michael's fingers.", "This breaker toggles the player character's Special Ni Ni Time Light-up Plug-in Kitty Cat night light, located in Wendy's room.\n\nIt is exempt from reserve power mode. Reroutable power is negligible.", "This breaker toggles the septic system.\n\nReserve power mode has disabled it~", "This breaker toggles Gabriel's cross night light.\n\nIt is exempt from reserve power mode. Reroutable power is negligible."];

			//"This breaker toggles the library's power outlets. Reserve power mode has disabled it."
			//The player character used this breaker 80,456 times.\n\nIt toggles the shelter's oxygen circulation system.
			var note1:MintSprite = addRectSprite(90, 90, 0);
				note1.alpha = 0;
				note1.x = 40;
				note1.y = 20;
				note1.onHover = showToolTipOnCursor.bind("<!16px>This note speculates about the meteorite based on the measurements of the Wydget Network.\n\nEventually, every speculation was crossed out.<!16px>", "", "sys");

			var note2:MintSprite = addRectSprite(90, 90, 0);
				note2.alpha = 0;
				note2.x = 560;
				note2.y = 50;
				note2.onHover = showToolTipOnCursor.bind("<!16px>REMINDER: During reserve power mode, the breaker for the PC is DISABLED. If you REALLY need to check wydgets, turn off one of the bigger systems.\n\nAnd STOP PLAYING SOLITAIRE IN THE MIDDLE OF THE NIGHT!!!!! I NEED POWER FOR MY NIGHT LIGHT. FOR READING I MEAN.<!16px>", "", "sys");

			var bigBreak1:MintSprite = addRectSprite(90, 90, 0);
				bigBreak1.alpha = 0;
				bigBreak1.x = 410;
				bigBreak1.y = 210;
				bigBreak1.onHover = showToolTipOnCursor.bind("<!16px>This breaker toggles the library's power outlets.\n\n"+(data.breakerFlipped?"Power that was previously routed to the oxygen circulation system will now sustain it for a few more months":"Reserve power mode has disabled it")+".<!16px>", "", "sys");
				bigBreak1.onHoverOnce = playSound.bind("assets/audio/ui/hover2");
				
			var xShift:Float = 225;
			var yShift:Float = 215;
			for (breaker in 0...9) {
				if (breaker == 5) {
					xShift = 255;
					yShift = 315;
				}
				var hitbox:MintSprite = addRectSprite(35, 90, 0);
					hitbox.x = xShift;
					hitbox.y = yShift;
					hitbox.alpha = 0;
					hitbox.onHover = showToolTipOnCursor.bind("<!16px>"+breakerTooltips[breaker]+"<!16px>", "", "sys");
					hitbox.onHoverOnce = playSound.bind("assets/audio/ui/hover2");
				xShift += 36;
			}

			var breaker:MintSprite = addSprite("assets/img/effect/shelter/breaker.png");
			breaker.centerPivot = true;

			var sideArrow:MintSprite = addSprite("assets/img/effect/shelter/sideArrow.png");
			sideArrow.alpha = 0;
			sideArrow.x = GAME_WIDTH-sideArrow.width*1.2;
			sideArrow.y = GAME_HEIGHT/2-sideArrow.height/2;
			sideArrow.update();
			tween(sideArrow, {alpha: 1}, 0.2);

			sideArrow.onReleaseOnce = function() {
				sideArrow.mouseEnabled = false;
				playSound("assets/audio/ui/topClick");
				cameraFadeOut(0, 0.5);
				timer(0.5, Endings.explore.bind("shelterHall"));
			}

			sideArrow.onHoverOnce = function() {
				StoryUtils.yesNudge([sideArrow]);
				playSound("assets/audio/ui/hover8");
			}

			sideArrow.onUnHoverOnce = function() {
				sideArrow.clearEffects();
			}

			var breakerFlipped:MintSprite = addSprite("assets/img/effect/shelter/flippedBreaker.png");
			breakerFlipped.alpha = (data.breakerFlipped?1:0);
			breakerFlipped.update();

			var breakerHitbox:MintSprite = addRectSprite(70, 100, 0);
				breakerHitbox.x = 400;
				breakerHitbox.y = 315;
				breakerHitbox.alpha = 0;
				breakerHitbox.update();

				breakerHitbox.onHover = showToolTipOnCursor.bind("<!16px>The player character has used this breaker "+data.oxygenBreakerFlipped+" times.\n\nIt toggles the shelter's oxygen circulation system."+(data.breakerFlipped?"\n\nPower has been restored to the PC.":"")+"<!16px>", "", "sys");

				breakerHitbox.onReleaseOnce = function() {
					playSound("assets/audio/ui/toggle");

					if (!data.breakerFlipped) {
						playSound("assets/audio/environment/breakerFlip");
						setChannelVolume("shelterFan", 0);
						data.breakerFlipped = true;
						breakerFlipped.alpha = 1;
					} else {
						playSound("assets/audio/environment/breakerUnflip");
						data.breakerFlipped = false;
						setChannelVolume("shelterFan", 0.4);
						breakerFlipped.alpha = 0;
					}

					data.oxygenBreakerFlipped++;
					bigBreak1.onHover = showToolTipOnCursor.bind("<!16px>This breaker toggles the library's power outlets.\n\n"+(data.breakerFlipped?"Power that was previously routed to the oxygen circulation system will now sustain it for a few more months":"Reserve power mode has disabled it")+".<!16px>", "", "sys");
					breakerHitbox.onHover = showToolTipOnCursor.bind("<!16px>The player character has used this breaker "+data.oxygenBreakerFlipped+" times.\n\nIt toggles the shelter's oxygen circulation system."+(data.breakerFlipped?"\n\nPower has been restored to the PC.":"")+"<!16px>", "", "sys");
				}

			for (spr in [breaker, breakerFlipped]) spr.update();
			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterStairs") {
			if (!data.breakerFlipped) setChannelVolume("shelterFan", 0.2);
			var stairs:MintSprite = addSprite("assets/img/effect/shelter/stairs.png");
			stairs.centerPivot = true;
			
			var fwd:MintSprite = addRectSprite(400, 400, 0);
				fwd.x = GAME_WIDTH/2-fwd.width/2;
				fwd.alpha = 0;
				fwd.update();

				fwd.onReleaseOnce = function() {
					fwd.mouseEnabled = false;
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					cameraFadeOut(0, 1.5);
					
					tween(stairs, {scaleX: 2, scaleY: 2}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterDoor");
					}});
				}

			var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
				bac.x = GAME_WIDTH/2-bac.width/2;
				bac.y = GAME_HEIGHT-bac.height*1.2;
				bac.alpha = 0;
				bac.update();

				tween(bac, {alpha: 1}, 0.3);

				bac.onHoverOnce = function() {
					StoryUtils.yesNudge([bac]);
					playSound("assets/audio/ui/hover8");
				}

				bac.onUnHoverOnce = function() {
					bac.clearEffects();
				}

				bac.onReleaseOnce = function() {
					bac.mouseEnabled = false;
					cameraFadeOut(0, 1.5);
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					tween(stairs, {scaleY: 1.3, y: -stairs.height/6}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterHall");
					}});
				}
			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterDoor") {
			setChannelVolume("shelterFan", 0);
			var door:MintSprite = addSprite("assets/img/effect/shelter/shelterDoor.png");
			door.centerPivot = true;
			var doorOpen:MintSprite = addSprite("assets/img/effect/shelter/shelterOpenDoor.png");
			doorOpen.alpha = 0;
			door.centerPivot = doorOpen.centerPivot = true;
			door.update();
			doorOpen.update();

			var bac:MintSprite = addSprite("assets/img/effect/shelter/backArrow");
				bac.x = GAME_WIDTH/2-bac.width/2;
				bac.y = GAME_HEIGHT-bac.height*1.2;
				bac.alpha = 0;
				bac.update();

				tween(bac, {alpha: 1}, 0.3);

				bac.onHoverOnce = function() {
					StoryUtils.yesNudge([bac]);
					playSound("assets/audio/ui/hover8");
				}

				bac.onUnHoverOnce = function() {
					bac.clearEffects();
				}

				bac.onReleaseOnce = function() {
					bac.mouseEnabled = false;
					cameraFadeOut(0, 1.5);
					playSound("assets/audio/ui/topClick");
					playSound("assets/audio/environment/cane");
					tween(door, {scaleY: 1.3, y: -door.height/6}, 1.5, {ease: QUAD_IN, onComplete: function() {
						Endings.explore("shelterStairs");
					}});
				}

			var doorHitbox:MintSprite = addRectSprite(320, 360, 0);
				doorHitbox.x = GAME_WIDTH/2-doorHitbox.width/2;
				doorHitbox.y = doorHitbox.height*0.25;
				doorHitbox.alpha = 0;
				doorHitbox.update();

				doorHitbox.onReleaseOnce = function() {
					bac.cancelTweens();
					tween(bac, {alpha: 0}, 3);
					bac.mouseEnabled = false;
					doorHitbox.mouseEnabled = false;
					playSound("assets/audio/environment/shelterDoor");
					tween(doorOpen, {alpha: 1}, 5, {onComplete: function() {
						tween(door, {scaleX: 5, scaleY: 5}, 5, {ease: QUINT_IN, startDelay: 3});
						cameraFadeOut(0x83989a, 10);
						tween(doorOpen, {scaleX: 5, scaleY: 5}, 5, {ease: QUINT_IN, startDelay: 3, onComplete: Endings.explore.bind("shelterOutside")});
					}});
				}
			cameraFadeIn(0, 1.5);
		}

		if (seg == "shelterOutside") {
			stopChannel("shelterFan");
			playMusic("violetMeteorite");
			playSound("assets/audio/environment/despairSting", "despair", {loops: 3});
			var paraBg:MintSprite = addSprite("assets/img/effect/systemBox.png");
				paraBg.layer = Main.TOOLTIP_SPRITE_LAYER;
				paraBg.x = GAME_WIDTH/2 - paraBg.width/2;
				paraBg.y = GAME_HEIGHT/2 - paraBg.height/2;
				paraBg.mouseEnabled = false;
				paraBg.alpha = 0;

			var titleText:MintText = addText();
				titleText.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText.alpha = 0;
				titleText.setText("Nice to finally meet you, Rebeca.");
				titleText.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText.x = paraBg.x + paraBg.width/2 - titleText.fieldWidth/2;
				titleText.y = paraBg.y + paraBg.height/2 - titleText.fieldHeight/2;
				titleText.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);

			var titleText2:MintText = addText();
				titleText2.layer = Main.TOOLTIP_TEXT_LAYER;
				titleText2.alpha = 0;
				titleText2.setText("Welcome to the Interphore.");
				titleText2.setFormat({wordWrap: true, wordWrapWidth: paraBg.width - 30, fontSize: 14, fontColour: 0xFFFFFF, center: true});
				titleText2.x = paraBg.x + paraBg.width/2 - titleText2.fieldWidth/2; //ASS PADDING FOR FUCKIN FAGGOT CUMBOYS
				titleText2.y = paraBg.y + paraBg.height/2 - titleText2.fieldHeight/2;
				titleText2.applyGlowEffect(0xFF0e3e2e, 1, 2, 5, 7);
				
			paraBg.scaleX = paraBg.scaleY = 0;
			titleText.scaleX = titleText.scaleY = 0;
			titleText2.scaleX = titleText2.scaleY = 0;

			paraBg.update();
			titleText.update();
			titleText2.update();

			timer(32, function() {
				//First message box appears
				playSound("assets/audio/ui/premature");
				tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
				tween(titleText, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});

				paraBg.onReleaseOnce = function () {
					if (titleText2.alpha <= 0) {
						//You clicked the first message box
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							//Second message box appears
							playSound("assets/audio/ui/premature");
							tween(paraBg, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT});
							tween(titleText2, {scaleX: 1, scaleY: 1, alpha: 1}, 1, {ease: ELASTIC_OUT, onComplete: function() { paraBg.mouseEnabled = true; }});
						}});
					} else {
						//You clicked the second message box
						playSound("assets/audio/ui/tak");
						paraBg.cancelTweens();
						paraBg.mouseEnabled = false;
						tween(titleText2, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT});
						tween(paraBg, {scaleX: 0, scaleY: 0, alpha: 0}, 1, {ease: QUINT_OUT, onComplete: function() {
							cameraFadeOut(0, 3, Endings.explore.bind("endingsHub"));
						}});
					}
				}
			});

			var meet:MintSprite = addSprite("assets/img/effect/shelter/meteorite.png");
			meet.centerPivot = true;
			meet.scaleX = 25;
			meet.scaleY = 25;
			meet.x = 145 * meet.scaleX;
			meet.y = 190 * meet.scaleY;
			tween(meet, {x: 0, y: 0, scaleX: 1.05, scaleY: 1.05}, 10, {ease: QUAD_IN, startDelay: 2, onComplete: function() {
				tween(meet, {scaleX: 1, scaleY: 1}, 3, {ease: QUAD_OUT, onComplete: function() {
					tween(meet, {x: -200, y: -200}, 7, {ease: QUAD_IN_OUT, onComplete: function() {
						tween(meet, {x: -100, y: -100, scaleX: 0.8, scaleY: 0.75}, 8, {ease: QUINT_IN_OUT});
					}});
				}});
			}});
			meet.update();
			cameraFadeIn(0x83989b, 5);
		}

		if (seg == "endingsHub") {
			if (StaticExtern.isMyntOn) {
				hideMynt();
			}
			cameraFadeIn(0, 0.7);
			setLocation("Endings");
			addChoice("<!20px>Scenes<!20px>", function () {
				Journal.journal();
			}, {enabled: false});
			addChoice("<!20px>Back<!20px>", function () {
				msg("You shut the journal and return to reality.", true);
				enablePause();
				gotoHub(null);
			}, {enabled: false});

			var currentlyUnlocking:Bool = false;

			var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
				s.x = 400;
				s.y = 200;
				s.scaleX = 2;
				s.scaleY = 2;
				s.alpha = 0.4;

			var base:MintSprite = addSprite("assets/img/effect/endings/endingsBase.png");
				base.x = GAME_WIDTH/2-base.width/2;
				base.y = GAME_HEIGHT/2-base.height/2;

			var mint:MintSprite = addSprite("assets/img/effect/endings/mint.png");
			var proto:MintSprite = addSprite("assets/img/effect/endings/protocol.png");
			var sep:MintSprite = addSprite("assets/img/effect/endings/septrica.png");
			var mynt:MintSprite = addSprite("assets/img/effect/endings/mynt.png");
			var meet:MintSprite = addSprite("assets/img/effect/endings/meteorite.png");
			var endMap:Map<String, MintSprite> = [
				"mynt" => mynt,
				"meteorite" => meet,
				"protocol" => proto,
				"septrica" => sep,
				"mint" => mint
			];

			var endButtX:Float = 0;
			var delay:Float = 0;
			var endingDelay:Float = 0;

			function unlockEnding(endingName:String):Void {
				data.endingsUnlocked.push(endingName);
				var endButt:MintSprite = endMap.get(endingName);
				playSound("assets/audio/ui/endingUnlocked");

				tween(endButt, {scaleX: 0, scaleY: 0}, 1.25, {onComplete: function() {
					endButt.setupImage("assets/img/effect/endings/"+endingName+".png");
					var poof:MintSprite = addSprite("assets/img/effect/poof");
					poof.looping = false;
					poof.animFrameRate = 25;
					poof.centerPivot = true;
					poof.x = endButt.x-poof.width/3;
					poof.y = endButt.y-poof.height/3;

					tween(endButt, {scaleX: 1, scaleY: 1, alpha: 1}, 0.9, {ease: ELASTIC_OUT});
				}, ease: QUAD_IN});
			}

			for (ending in ["protocol", "mint", "septrica", "mynt", "meteorite"]) {
				if (data.currentEnding == ending && !data.endingsUnlocked.contains(ending)) {
					currentlyUnlocking = true;
					timer(2+endingDelay, function() {
						unlockEnding(ending);
					});
					endingDelay++;
				}
			}

			for (endButtName in ["protocol", "septrica", "mynt", "mint", "meteorite"]) {
				var endButt:MintSprite = endMap.get(endButtName);
				endButt.mouseEnabled = false;
					if (currentlyUnlocking) timer(4, function(){ endButt.mouseEnabled = true; });
				else
					endButt.mouseEnabled = true;
				endButt.x = -endButt.width;
				endButt.y = base.y+base.height/1.7-endButt.height/2;
				
				tween(endButt, {x: base.x+endButt.width/1.5+endButtX}, 0.5, {ease: ELASTIC_OUT, startDelay: delay+0.1});
				endButtX += endButt.width*1.2;
				delay += 0.1;

				if (data.endingsUnlocked.contains(endButtName)) {
					endButt.setupImage("assets/img/effect/endings/"+endButtName+".png");
				} else {
					endButt.setupImage("assets/img/effect/endings/lock.png");
				}

				var endingNameArray:Array<String> = endButtName.split("");
				var questionMarks:Int = endingNameArray.length;
				endingNameArray = [];
				for (q in 0...questionMarks)
					endingNameArray.push("?");
				var endButtCensor:String = endingNameArray.join("");
				if (endButtName == "protocol") endButtCensor = "<!20px>"+endButtCensor+"<!20px><!14px>\nUnlocked after pressing Yes.<!14px>";
				if (endButtName == "mint") endButtCensor = "<!20px>"+endButtCensor+"<!20px><!14px>\nUnlocked through one of the options after you press No.<!14px>";
				if (endButtName == "mynt") endButtCensor = "<!20px>"+endButtCensor+"<!20px><!14px>\nUnlocked after giving Mynt the password.<!14px>";
				if (endButtName == "septrica") endButtCensor = "<!20px>"+endButtCensor+"<!20px><!14px>\nUnlocked through one of the options after you press No.<!14px>";
				if (endButtName == "meteorite") endButtCensor = "<!20px>"+endButtCensor+"<!20px><!14px>\nUnlocked after filling out the journal,\nfinding all seeds, and unlocking all other endings.<!14px>";

				endButt.onHover = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						endButt.applyGlowEffect(0xFFFFFF);
						showToolTipOnCursor("<!20px>"+endButtName.toTitleCase()+" Ending<!20px>", "");
					} else {
						endButt.applyGlowEffect(0x000000);
						showToolTipOnCursor(endButtCensor, "");
					}
				}

				endButt.onHoverOnce = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						playSound("assets/audio/ui/hover3");
					} else {
						playSound("assets/audio/ui/hover2");
					}
				}

				endButt.onUnHoverOnce = function() {
					endButt.clearEffects();
				}

				endButt.onReleaseOnce = function() {
					if (data.endingsUnlocked.contains(endButtName)) {
						if (endButtName == "mynt") MyntScenes.myntEnding("intro");
						else if (endButtName == "mint") MyntScenes.amcn("clickedNoMint");
						else if (endButtName == "protocol") MyntScenes.amcn("clickedYes");
						else if (endButtName == "septrica") MyntScenes.amcn("clickedNoPlay");
						else if (endButtName == "meteorite") Endings.explore("meteoriteEndingMap");
						playSound("assets/audio/ui/topClick");
					} else {
						StoryUtils.nopeWiggle([endButt]);
						playSound("assets/audio/ui/nope");
					}
				}
			}

			if (currentlyUnlocking) {
				msg("Returned to stable checkpoint.", true);
				timer(3+endingDelay, function() {
					clearChoices();
					addChoice("<!20px>Scenes<!20px>", function () {
						Journal.journal();
					});
					addChoice("<!20px>Credits<!20px>", function () {
						Endings.explore("credits");
					}, {toolTip: "Bit spoilery, be careful."});
					addChoice("<!20px>Back<!20px>", function () {
						msg("You shut the journal and return to reality.", true);
						gotoHub(null);
					});
				});
			} else {
				clearChoices();
				addChoice("<!20px>Scenes<!20px>", function () {
					Journal.journal();
				});
				addChoice("<!20px>Credits<!20px>", function () {
					Endings.explore("credits");
				}, {toolTip: "Bit spoilery, be careful."});
				addChoice("<!20px>Back<!20px>", function () {
					msg("You shut the journal and return to reality.", true);
					gotoHub(null);
				});
			}

			data.floodMode = false;
			data.currentEnding = "";
		}
	}
}