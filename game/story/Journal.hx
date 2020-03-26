package story;

class Journal
{
	private static var oldSaveStr:String = "";

	public static function journal():Void {
		saveCheckpoint("Journal.journal();");
		setLocation("Scenes");
		clear();
		disablePause();

		var emojiEnabled:Bool = data.gameSettings.get("Journal Kink Symbols");

		var s:MintSprite = addSprite("assets/img/effect/daydreamJournal.png");
		s.x = 400;
		s.y = 200;
		s.scaleX = 2;
		s.scaleY = 2;
		s.alpha = 0.4;
		
		/*
		var soundDelay:Float = 0;

		for (i in 0...4) {
			soundDelay += 0.1;
			var sound:String = "Open";
			if (Math.random() > 0.5) sound = "Close";
			timer(soundDelay, function () {playSound("assets/audio/ui/menu"+sound);});
		}
		*/

		append(pickOne(["You pull the Daydream Journal from your inventory.", "Your brain takes a nice warm nostalgia bubblebath.", "You get the Daydream Journal.", "You run your fingers over the weird markings.", "You suck on your pencil eraser and ponder alternative histories.", "You start dreaming.", "You whip out the journal.", "You run through your memories with the variables replaced.", "You imagine stuff.", "You slap the Daydream Journal onto your lap. That stung a little.", "You dig around until your fingers hit hardcover.", "You start scribbling."]));

		//@incomplete Sound and art
		var allEntries:Array<Dynamic> = [
			//Mynt/Mint
		{id: "Automated Health Warning", title: "[Automated Health Warning]", desc: "Mynt tells you to go outside.", loc: "Mynt"},
		{id: "Writing", title: "Writing", desc: "Mynt asks how her writing is.", loc: "Mynt"},
		{id: "Accident", title: "Accident", desc: "Mynt fucks up big time and poops out a goo kid.", loc: "Mynt"},
		{id: "<3", title: "<3", desc: "Mynt confesses her feelings.", loc: "Mynt"},
		{id: "Automated Health Warning 2", title: "[Automated Health Warning] (2)", desc: "Mynt derails the automated health warning.", loc: "Mynt"},
		{id: "Missing Page 1", title:"Missing Page #1", desc: "This is a log from Mynt's current iteration. Found in the cellar of Red's Cottage.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 2", title:"Missing Page #2", desc: "This is a log created while Mynt was offline. Found on the Violet Meteorite.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 3", title:"Missing Page #3", desc: "This is a log from Mynt's second iteration. Found in Junk City.", kinks: ["Plot"], loc: "Year -5"},
		{id: "Missing Page 4", title:"Missing Page #4", desc: "This is a log from Mynt's first iteration. Found in Bright Forest.", kinks: ["Plot"], loc: "Year -6"},
		{id: "Missing Page 5", title:"Missing Page #5", desc: "This is a log from Mint's forty-fifth iteration. Found on the Violet Meteorite.", kinks: ["Plot"], loc: "Year 0.7"},
		{id: "Missing Page 6", title:"Missing Page #6", desc: "This is a log from two early prototype AUTO-MYNTs. Found in the Som Shop.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 7", title:"Missing Page #7", desc: "This is half a log from Cade's first play session. Found in the streets.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 8", title:"Missing Page #8", desc: "This is half a log from Cade's first play session. Found in a closet.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 9", title:"Missing Page #9", desc: "This is a log partially from Mynt's current iteration and partially from something completely different. Found in the L.L.L. after it moved.", kinks: ["Plot"], loc: "Year 0.5"},
		{id: "Missing Page 10", title:"Missing Page #10", desc: "This is a log from the beginning of Mynt's third iteration. Found in the Apothecary.", kinks: ["Plot"], loc: "Year -0.1"},
		{id: "Missing Page 11", title:"Missing Page #11", desc: "This is a log from the end of Mynt's third iteration. Found in the Som Shop.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 12", title:"Missing Page #12", desc: "This is a log from two AUTO-MYNTs. Found in Septrica's bathrooms.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 13", title:"Missing Page #13", desc: "This is a log from two AUTO-MYNTs. Found at Indigo Pond.", kinks: ["Plot"], loc: "Year 0"},
		{id: "Missing Page 14", title:"Missing Page #14", desc: "This is a log from the end of Mynt's third iteration. Found at Hyper Land.", kinks: ["Plot"], loc: "Year -0.5"},
		{id: "Missing Page 15", title:"Missing Page #15", desc: "This is a log from a ward in the Apothecary. Found in the Apothecary, naturally.", kinks: ["Plot"], loc: "Year 28"},
		{id: "Missing Page 16", title:"Missing Page #16", desc: "This is a log from two AUTO-MYNTs. Found in the Som Shop.", kinks: ["Plot"], loc: "Year 0.8"},

		{id: "UNDEFINED", title:"UNDEFINED", desc: "", kinks: ["Plot"], loc: "Mint"},

		//Bright Forest
		{id: "Frog boy", title: "Lilypad", desc: "Cuddling with a cute lil frog boy.", kinks: ["Cub", "Male"], loc: "Bright Forest"},
		{id: "Goblin village", title: "Goblin Village", desc: "A goblin village built on the crater's rim.", kinks: ["Patreon Commission", "Female"], loc: "Bright Forest"},
		{id: "Feral dragon", title: "Herbivore Dragon", desc: "Intercepting a feral dragon as he brings some glowberries home.", kinks: ["Patreon Commission", "Feral", "Male", "Pregnancy"], loc: "Bright Forest"},
		{id: "Hovel", title: "Hovel", desc: "Two boars get nasty in their hovel.", kinks: ["Scat", "Male", "Male"], loc: "Bright Forest"},
		{id: "Lunar glade", title: "Lunar Glade", desc: "A little glade with berries and nymphs.", kinks: ["Female", "Female"], loc: "Bright Forest"},
		{id: "Camping foxes", title: "Whoring by the Fireside", desc: "Two foxes offer you some glowberries for sex.", kinks: ["Male", "Male"], loc: "Bright Forest"},
		{id: "Deerdog femboy", title: "Desperate Deerdog", desc: "A shy deerdog femboy has to pee really bad.", kinks: ["Patreon Commission", "Male", "Piss"], loc: "Bright Forest"},
		{id: "Rox first visit", title: "Roxelle — First Visit", desc: "Having a drink with a cow futa and her sheepdog.", kinks: ["Intersex"], loc: "Bright Forest"},
		{id: "Rox second visit", title: "Roxelle — Second Visit", desc: "Avoiding Archbishop and getting Rox some ingredients for her pie.", kinks: ["Intersex"], loc: "Bright Forest"},
		{id: "Rox couch", title: "Roxelle — Third Visit", desc: "Rox shelters you from a windstorm, and you decide to drink together and get a little frisky.", kinks: ["Plot", "Intersex"], loc: "Bright Forest"},
		{id: "Red previsit", title: "Red — Snooping"+(Math.random()>0.98?"as Usual I See":""), desc: "Snooping around Red's cottage.", kinks: ["Cub", "Female"], loc: "Bright Forest"},
		{id: "Red visit", title: "Red — First Visit", desc: "Thanking a red-cloaked wolfgirl.", kinks: ["Cub", "Female", "Female"], loc: "Bright Forest"},
		{id: "Red Visit 2", title: "Red — Second Visit", desc: "Interrupting a red-cloaked wolfgirl.", kinks: ["Cub", "Female"], loc: "Bright Forest"},
		{id: "Mourning", title: "Red — Mourning", desc: "Running into Red at the Floatillery.", kinks: ["Cub", "Female"], loc: "Bright Forest"},
		{id: "Nero & River", title: "Nero & River", desc: "Helping a rottweiler stealth-preg his gf.", kinks: ["Patreon Commission", "Male", "Female", "Pregnancy"], loc: "Bright Forest"},
		{id: "The mingling", title: "Mingling", desc: "Hanging out with some fans at the Floatillery.", kinks: ["Female"], loc: "Bright Forest"},
		{id: "Thelly beach", title: "Thelly — Whore Training", desc: "After reading the Floatillery memorial and exploring Junk City, you run into two familiar faces on the beach.", kinks: ["Cub", "Male", "Drugs", "Piss", "Plot"], loc: "Bright Forest"},
		{id: "Som Dom", title: "Som — Losing Control", desc: "Som takes a break from investigating the AUTO-MYNT to dom you.", kinks: ["Cub", "Male", "Abuse", "Abuse", "Abuse"], loc: "Bright Forest"},
		{id: "Bins the raccoon", title: "Bins — Landfill", desc: "Hunting down Bins the raccoon boy at the landfill.", kinks: ["Cub", "Male"], loc: "Bright Forest"},
		{id: "Seagull girl", title: "Mustard Stains", desc: "Throatfucking a seagull at the landfill.", kinks: ["Patreon Commission", "Female"], loc: "Bright Forest"},
		{id: "Nymph boy", title: "Flight of the Cute Boy", desc: "Relaxing in a nymph boy's nest at Indigo Pond.", kinks: ["Cub", "Male"], loc: "Bright Forest"},
		{id: "Kemp", title: "Kemp — Underwater", desc: "Goin fer a dip with Kemp at Indigo Pond.", kinks: ["Male"], loc: "Bright Forest"},
		{id: "Bar", title: "Wet Bar", desc: "Dealing with drunken nymph girls at Indigo Pond.", kinks: ["Female"], loc: "Bright Forest"},
		{id: "Private area", title: "Private Area", desc: "Peeping into the private area at Indigo Pond.", kinks: ["Cub", "Abuse", "Scat", "Feral"], loc: "Bright Forest"},
		{id: "Thelly Pond", title: "Thelly — Feminization", desc: "After finding Indigo Pond and telling Thelly about it, you meet up with him and Marei for a special little evening of girlitude.", kinks: ["Cub", "Male", "Male", "Abuse"], loc: "Bright Forest"},
		{id: "Flytrap", title: "Flytrap", desc: "Feeding your flytrap.", kinks: ["Feral"], loc: "Bright Forest"},
		{id: "Fingerpainting", title: "Fingerpainting", desc: "Gettin artsy with some cubs.", kinks: ["Guest Writer", "Cub", "Female", "Male", "Male", "Foodplay"], loc: "Bright Forest"},
		{id: "Glowbunny1", title: "Glowbunny — First Encounter", desc: "Running into a bunny infected with glowvirus.", kinks: ["Female"], loc: "Bright Forest"},
		{id: "Taste Test", title: "Taste Test", desc: "Slurping on your daughter's cunt.", kinks: ["Cub", "Female"], loc: "Bright Forest"},
		{id: "Red After Apo", title: "Red — Second Thoughts", desc: "Red's not sure she made the right choice.", kinks: ["Guest Writer", "Cub", "Female"], loc: "Bright Forest"},
		{id: "Abandoned Cavern", desc: "A cave that used to be the Lamblea Commune.", loc: "Bright Forest"},
		{id: "Scattered Cavern", desc: "A cave torn by some old conflict.", loc: "Bright Forest"},
		{id: "Twisting Cavern", desc: "Someone carved out a massive maze to pass the years.", loc: "Bright Forest"},
		{id: "Reflective Cavern", desc: "A cave filled with flowers that laterally invert your world whenever you sniff them.", loc: "Bright Forest"},

		//Junk City
		{id: "Teen stripper", title: "2 CAPS 2 FUKK", desc: "Watching a femboy stripper getting nastified outside his club.", kinks: ["Cub", "Male", "Intersex", "Scat", "Vomit"], loc: "Junk City"},
		{id: "Dumpster", title: "Dumpster Diving", desc: "A guy and a gal having some good wholesome cute brutal fun in a dumpster~!", kinks: ["Guest Writer", "Male", "Female", "Trash", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "Breed Me", title: "Breed Me", desc: "A slutty pup gets used in public.", kinks: ["Patreon Commission", "Male", "Piss"], loc: "Junk City"},
		{id: "Trash can goobeast", title: "It Came From The Garbo", desc: "Getting sucked into a garbage bin and worked over by a trash elemental lurking inside.", loc: "Junk City"},
		{id: "Cade", title: "Cade — Invitation", desc: "A cute tiger invites you to a party, but you get lost.", kinks: ["Patreon Commission"], loc: "Junk City"},
		{id: "Cade2", title: "Cade — Party", desc: "You finally find Cade's party after a detour up to the meteorite.", kinks: ["Patreon Commission"], loc: "Junk City"},
		{id: "Free refreshments", title: "Free Refreshments", desc: "A cute refreshments table in the Septrica's lobby.", kinks: ["Baby", "Female", "Piss", "Snuff"], loc: "Junk City"},
		{id: "Hyena family septricas", title: "Family Cums Second", desc: "Hanging out with a hyena family in a public bathroom.", kinks: ["Baby", "Cub", "Female", "Male", "Intersex", "Scat", "Piss", "Vomit", "Abuse"], loc: "Junk City"},
		{id: "Boys bathroom", title: "Thelly — Boys Bathroom", desc: "The boys are the bathroom.", kinks: ["Cub", "Male"], loc: "Junk City"},
		{id: "Breeding Floor", title: "B-77 Breeding Floor", desc: "The lowest, darkest, dankest floor of Septrica's.", kinks: ["Baby", "Pregnancy", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "Bar & Lounge", title: "B-75 Bar & Lounge", desc: "A cozy floor with lots of people goofing around drunk and on drugs.", kinks: ["Baby", "Drugs", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "Lilac", title: "Lilac", desc: "Meeting a horse girl and teaching her how to enjoy breathing water.", kinks: ["Patreon Commission", "Snuff", "Female"], loc: "Junk City"},
		{id: "Shooting range", title: "Shooting Range", desc: "Aim for the big bad goo monster!", kinks: ["Patreon Commission", "Baby", "Female", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "That dude buried in the sand on the Tropics floor", title: "That Dude Buried in the Sand on the Tropics Floor", desc: "Remember him? He deepthroated a foot, it was weird.", kinks: ["Cub", "Male"], loc: "Junk City"},
		{id: "Training zone", title: "Training Zone", desc: "A training zone on the Sumo floor of Septrica's.", kinks: ["Female", "Abuse"], loc: "Junk City"},
		{id: "Mystery Floor", title: "B-34 Mystery Zone", desc: "???", loc: "Junk City"},
		{id: "Unbirth", title: "The Power of Teamwork!", desc: "Claiming your prize with Panda after winning a game of volleyball on the Tropics floor.", kinks: ["Patreon Commission", "Baby", "Female", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "Roddy & Oni", title: "Roddy & Oni", desc: "A cute dog and rat couple gettin nasty in their apartment at the Sewer Suburbs.", kinks: ["Patreon Commission", "Male", "Male", "Piss"], loc: "Junk City"},
		{id: "Skunk cub", title: "Ivandis — Party", desc: "Partying with a bunch of bros and a little skunk boy at the Sewer Suburbs.", kinks: ["Patreon Commission", "Cub", "Male", "Raunch", "Scat", "Vomit", "Piss", "Blood", "Abuse", "Snuff"], loc: "Junk City"},
		{id: "Skunk cub camping trip", title: "Ivandis — Camping", desc: "Camping with Kemp, Cage, Snagg, Marei, and a little skunk boy at the Sewer Suburbs.", kinks: ["Patreon Commission", "Cub", "Male", "Feral", "Raunch", "Scat", "Vomit", "Piss", "Blood", "Drugs", "Abuse"], loc: "Junk City"},
		{id: "Hyena family sewer", title: "Family Cums First", desc: "Staying for dinner at a hyena family's house in the Sewer Suburbs.", kinks: ["Patreon Commission", "Intersex", "Female", "Piss", "Scat"], loc: "Junk City"},
		{id: "Sperm bank", title: "Sperm Bank", desc: "Depositing/Withdrawing at the Snagglebank's sperm bank section.", kinks: ["Patreon Commission", "Male", "Male", "Scat"], loc: "Junk City"},
		{id: "Sperm bank 2", title: "Roxelle — Bert's Treat", desc: "Bert the sheepdog wants to use the sperm bank too!", kinks: ["Male", "Scat", "Feral"], loc: "Junk City"},
		{id: "Blood bank", title: "Blood Bank", desc: "Checking out the bloodlovers at the Snagglebank.", kinks: ["Gore", "Blood", "Snuff", "Gore", "Blood", "Snuff", "Gore", "Blood", "Snuff"], loc: "Junk City"},
		{id: "Velman Bank", title: "Two in One", desc: "Two hobros outside the Snagglebank refresh their sex lives with the help of a little beargirl's throat.", kinks: ["Baby", "Male", "Male", "Female", "Blood", "Gore", "Snuff"], loc: "Junk City"},
		{id: "Bins getting punished", title: "Bins — GTFO", desc: "Lana gets physical with Bins after he spoils the peace of the library.", kinks: ["Patreon Commission", "Cub", "Male", "Raunch"], loc: "Junk City"},
		{id: "Snagg Abuse", title: "Snagg — Fuckpiggery", desc: "Paying Snagg to heavily abuse you at his bank.", kinks: ["Patreon Commission", "Male", "Raunch", "Trash", "Abuse"], loc: "Junk City"},
		{id: "Public Snuff", title: "Marei — The Show", desc: "Marei puts on a public show involving you! And a stage! And death!", kinks: ["Patreon Commission", "Male", "Male", "Male", "Abuse", "Blood", "Gore", "Snuff"], loc: "Junk City"},
		{id: "Red Moved", title: "Red — Settling In", desc: "Red settles into her new City life.", kinks: ["Guest Writer", "Cub", "Female", "Trash", "Vomit", "Foodplay", "Gore", "Raunch", "Raunch", "Raunch"], loc: "Junk City"},
		{id: "sepBreakIn", title: "The Green Door", desc: "Breaking into Septrica's.", kinks: ["Baby", "Plot"], loc: "Junk City"},

		//Violet Meteorite
		{id: "Left", title: "Challenge Springs", desc: "Levels one, two, three of The Crack's hot springs challenge.", kinks: ["Female", "Male", "Intersex", "Feral"], loc: "Violet Meteorite"},
		{id: "Stall 1", title: "Stall 1", desc: "A young ratling boy working in the bouncy fortress bathrooms.", kinks: ["Cub", "Male", "Male", "Raunch", "Scat"], loc: "Violet Meteorite"},
		{id: "Stall 2", title: "Stall 2", desc: "Helping Marei relieve some stress in the bouncy fortress bathrooms.", kinks: ["Toddler", "Scat", "Abuse", "Gore", "Snuff"], loc: "Violet Meteorite"},
		{id: "Stall 3", title: "Stall 3", desc: "Using a kittyboy toilet in the bouncy fortress bathrooms.", kinks: ["Toddler", "Raunch", "Abuse"], loc: "Violet Meteorite"},
		{id: "Taro Body Brews", title: "Taro's Body Brews", desc: "Purchasing a few select snacks and drinks from Taro, the regenerating potatocat.", loc: "Violet Meteorite"},
		{id: "Hyper Shark Girl", title: "Piss-Guzzling Contest", desc: "Sucking the piss from a shark futa at Hyper Land.", loc: "Violet Meteorite", kinks: ["Guest Writer", "Intersex", "Piss"]},
		{id: "Kemp Pizza", title: "Kemp — Pizza Party", desc: "Kemp ruins a poor crocodile's pizza because he's drunk and high and vegetarian.", loc: "Violet Meteorite", kinks: ["Guest Writer", "Male", "Male", "Male", "Raunch", "Foodplay"]},
		{id: "Kemp Truck", title: "Kemp — Crash and Burn", desc: "Kemp swerves away from his issues and crashes his truck.", loc: "Violet Meteorite", kinks: ["Male", "Raunch"]},
		{id: "Bins Spring", title: "Bins — "+(isActive("Candy Ring")?"Sweet":"Rotten")+" King", desc: "Bins the raccoon cub and his pet monkey gracefully honor your presence in their court.", loc: "Violet Meteorite", kinks: ["Cub", "Male", "Raunch", "Trash", "Scat", "Feral"]},
		{id: "Deerdog femboy 2", title: "Desperate Deerdog 2", desc: "A wisened deerdog femboy has to pee really bad again.", loc: "Violet Meteorite", kinks: ["Cub", "Male", "Watersports"]},
		{id: "Cyan Wedding", title: "Cade — The Cyan Wedding", desc: "The great, biblical conjoinment of bodies into one wet monster. You were invited by Septrica.", loc: "Violet Meteorite"},
		{id: "Ringed Cavern", desc: "A looted capsule stash surrounded by rings of rock.", loc: "Violet Meteorite"},
		{id: "Layered Cavern", desc: "This whole cave smells like bird pussy.", loc: "Violet Meteorite"},
		{id: "Chimerical Cavern", desc: "This whole cave smells like tiger musk.", loc: "Violet Meteorite"},
		{id: "Gryphon Cavern", title: "Gryphon's Cavern", desc: "Taking shelter from a rainstorm.", kinks: ["Patreon Commission", "Feral"], loc: "Violet Meteorite"},

		//Apothecary
		{id: "GlowbunnyApothecary", title: "Glowbunny — Diagnosis", desc: "Figuring out exactly how the glowbunny started glowing.", kinks: ["Female"], loc: "Tranquil Apothecary"},
		{id: "RedApo", title: "Red — Therapy", desc: "Dr. Mauez administers some therapy to Red.", kinks: ["Guest Writer", "Cub", "Female", "Male"], loc: "Tranquil Apothecary"},
		{id: "mareiTour", title: "Marei — Tour", desc: "Dr. Mauez takes you on a tour of the Apothecary and gives you a Septricard.", kinks: ["Male", "Plot"], loc: "Tranquil Apothecary"}
		];
		

		for (entry in allEntries)
			if (entry.title == null)
				entry.title = entry.id;

		var points:Array<Point> = [];
		{ /// Generate the spiral
			for (x in 0...999) {
				for (y in 0...8) {
					points.push(new Point(x, y));
					if (points.length > allEntries.length) break;
				}
			}
		}

		var entries:Array<{sprite: MintSprite, point: Point, data:Dynamic}> = [];
		for (i in 0...allEntries.length) {
			var s:MintSprite = addRectSprite(50, 50, 0xCCCCCC);
			s.x += points[i].x*s.width;
			s.y += points[i].y*s.height;
			entries.push({sprite: s, point: points[i], data: allEntries[i]});
		}

		function getUnlockStatusAtPos(xpos:Float, ypos:Float):Bool {
			for (entry in entries)
				if (entry.point.x == xpos && entry.point.y == ypos)
					if (getJournalEntries().contains(entry.data.id))
						return true;
			return false;
		}

		var sizePoint:Point = new Point();
		for (entry in entries) {
			sizePoint.x = Math.max(entry.sprite.x, sizePoint.x);
			sizePoint.y = Math.max(entry.sprite.y, sizePoint.y);
		}

		var incrementer:Float = 0;

		for (i in 0...entries.length) {
			var entry = entries[i];
			incrementer += 0.015;
			//entry.sprite.x = entry.sprite.x + GAME_WIDTH/2 - sizePoint.x/2;
			entry.sprite.y += GAME_HEIGHT/2 - sizePoint.y/2 - 40;
			entry.sprite.alpha = 0;
			tween(entry.sprite, {x: entry.sprite.x + GAME_WIDTH/2 - sizePoint.x/2, alpha: 1}, 0.4, {ease: ELASTIC_OUT, startDelay: incrementer});

			var isUnlocked:Bool = getJournalEntries().contains(entry.data.id);
			var hoverTitle:String = "";
			var hoverBody:String = "";
			entry.sprite.clear();
			if (data.allJournal == true) isUnlocked = true;
			if (isUnlocked) {
				entry.sprite.setupImage("img/hud/daydreamUnlocked.png");
				hoverTitle = "<!20px>"+entry.data.title+"<!20px>";
				hoverBody = entry.data.desc+"\n\n<!i>"+entry.data.loc+"<!i>\n";
				entry.sprite.onReleaseOnce = function () {
					if (!data.daydreamedOnce) msg("<!b>You've entered a daydream.<!b>\nItems and choices won't affect the rest of the game.");
					journalEntryCallback(entry.data.id);
					playSound("assets/audio/environment/journalPage", "journalPage");
				}

				entry.sprite.onHoverOnce = function () {
					playSound("assets/audio/ui/hover8");
					StoryUtils.yesNudge([entry.sprite]);
				}
			} else {
				var isVisible:Bool = 
					getUnlockStatusAtPos(entry.point.x-1, entry.point.y) || 
					getUnlockStatusAtPos(entry.point.x, entry.point.y-1) || 
					getUnlockStatusAtPos(entry.point.x+1, entry.point.y) || 
					getUnlockStatusAtPos(entry.point.x, entry.point.y+1);
				if (data.allJournal == true) isVisible = true;
				if (isVisible) {
					entry.sprite.setupImage("img/hud/daydreamHint.png");
					hoverTitle ="<!24px>???<!24px>";
					hoverBody = entry.data.desc+"\n\n<!i>"+entry.data.loc+"<!i>\n";
					entry.sprite.onReleaseOnce = function () {
						playSound("assets/audio/ui/nope", "nope");
						StoryUtils.nopeWiggle([entry.sprite]);
					};

					entry.sprite.onHoverOnce = function () {
						playSound("assets/audio/ui/hover2");
						StoryUtils.yesNudge([entry.sprite]);
					}
				} else {
					entry.sprite.setupImage("img/hud/daydreamUnknown.png");
					hoverTitle = "<!24px>???<!24px>";
					entry.sprite.onReleaseOnce = function () {
						playSound("assets/audio/ui/nope", "nope");
						StoryUtils.nopeWiggle([entry.sprite]);
					};

					entry.sprite.onHoverOnce = function () {
						playSound("assets/audio/ui/hoverNope");
						StoryUtils.yesNudge([entry.sprite]);
					}
				}
			}

			if (entry.data.kinks != null) {
				//hoverBody += "\n";
				for (i in 0...entry.data.kinks.length) {
					hoverBody += (emojiEnabled?'<!img:kink/${entry.data.kinks[i]}.png>  ':'')+'${entry.data.kinks[i]}\n';
				}
			}
			if (hoverTitle != "") entry.sprite.onHover = showToolTipOnCursor.bind(hoverTitle, hoverBody);

			if (entry.data.loc == "Bright Forest") entry.sprite.tint = 0x6600C6FF;
			if (entry.data.loc == "Junk City") entry.sprite.tint = 0x6646B135;
			if (entry.data.loc == "Violet Meteorite") entry.sprite.tint = 0x669600FF;
			if (entry.data.loc == "Tranquil Apothecary") entry.sprite.tint = 0x6676adff;
		}

		addChoice("<!20px>Endings<!20px>", function () {
			Endings.explore("endingsHub");
		});

		addChoice("<!20px>Back<!20px>", function () {
			msg("You shut the journal and return to reality.", true);
			gotoHub(null);
		});

		if ((getJournalEntries().length >= entries.length || data.allJournal) && !data.journalCompleted) {
			data.journalCompleted = true;
			Theme.addUiChoice("eon");
			Engine.timer(1, playSound.bind("assets/audio/environment/caveWinBig"));
			saveCheckpoint("Journal.journal();");
		} else {
			for (entry in entries) entry.sprite.mouseEnabled = true;
		}
	}

	public static function journalEntryCallback(seg:String):Void {
		oldSaveStr = saveToString();
		data.daydream = true;
		data.examinedStuff = [];

		if (seg == "Automated Health Warning") {
			MyntScenes.myntTemp("intro");
		} else if (seg == "Writing") {
			MyntScenes.myntWriter("intro");
		} else if (seg == "Accident") {
			MyntScenes.petIntro("main");
		} else if (seg == "<3") {
			MyntScenes.myntDate("intro");
		} else if (seg == "Automated Health Warning 2") {
			MyntScenes.myntDate2("intro");
		} else if (seg == "UNDEFINED") {
			MyntScenes.myntFake("myntfake1");
		} else if (seg == "Missing Page 1") {
			MyntScenes.myntArchie("intro");
		} else if (seg == "Missing Page 2") {
			MyntScenes.myntArchie2("intro");
		} else if (seg == "Missing Page 3") {
			MyntScenes.myntMissing3("intro");
		} else if (seg == "Missing Page 4") {
			MyntScenes.myntMissing4("intro");
		} else if (seg == "Missing Page 5") {
			MyntScenes.myntMissing5("intro");
		} else if (seg == "Missing Page 6") {
			MyntScenes.myntMissing6("intro");
		} else if (seg == "Missing Page 7") {
			MyntScenes.myntMissing7("intro");
		} else if (seg == "Missing Page 8") {
			MyntScenes.myntMissing8("intro");
		} else if (seg == "Missing Page 9") {
			MyntScenes.myntMissing9("intro");
		} else if (seg == "Missing Page 10") {
			MyntScenes.myntMissing10("intro");
		} else if (seg == "Missing Page 11") {
			MyntScenes.myntMissing11("intro");
		} else if (seg == "Missing Page 12") {
			MyntScenes.myntMissing12("intro");
		} else if (seg == "Missing Page 13") {
			MyntScenes.myntMissing13("intro");
		} else if (seg == "Missing Page 14") {
			MyntScenes.myntMissing14("intro");
		} else if (seg == "Missing Page 15") {
			MyntScenes.myntMissing15("intro");
		} else if (seg == "Missing Page 16") {
			MyntScenes.myntMissing16("intro");
		} else if (seg == "Frog boy") {
			data.froggyHotDogged = false;
			BrightForest.brightForestExplore("ExploreDarts");
		} else if (seg == "Goblin village") {
			BrightForest.brightForestExplore("ExploreGobbo");
		} else if (seg == "Feral dragon") {
			BrightForest.brightForestExplore("ExploreSpaceDragon");
		} else if (seg == "Hovel") {
			BrightForest.brightForestExplore("ExploreHovel");
		} else if (seg == "Lunar glade") {
			BrightForest.brightForestExplore("ExploreLunarGlade");
		} else if (seg == "Glowbunny1") {
			BrightForest.brightForestExplore("ExploreGlowbunny");
		} else if (seg == "Camping foxes") {
			data.foxesDone = false;
			BrightForest.gatherGlowberries("GatherFoxes");
		} else if (seg == "Deerdog femboy") {
			BrightForest.gatherGlowberries("GatherDeerDog");
		} else if (seg == "Cyan Wedding") {
			VioletMeteorite.violetMeteoriteExplore("ExploreCyanWedding");
		} else if (seg == "Rox first visit") {
			data.roxVisits = 0;
			data.roxInhaledMusk = data.roxPlayedCool = data.roxChosePuke = data.choseBooze = data.choseTea = data.passedOut = data.bertEntered = data.hurtBert = data.roxSawAlbum = data.knownRoxDogNumber = data.wipeHarder = data.harderPuke = false;
			Roxelle.roxExplore();
		} else if (seg == "Rox second visit") {
			data.roxVisits = 2;
			data.roxWaited = data.rox2Septrica = data.rox2AutoMynt = data.rox2GettinWine = data.roxQuestAccepted = data.rox2Yanked = data.rox2Machinery = data.somCellFixed = data.rox3NutsSlurped = false;
			if (data.allJournal) addPlace("The Floatillery", "A messy colony of rafts and log buildings which form a floating distillery. It's owned by the Apothecary.", "Bright Forest");
			Roxelle.roxExplore();
		} else if (seg == "Rox couch") {
			Roxelle.roxCouch("intro");
		}  else if (seg == "Red previsit") {
			data.redWateredFlowers = data.redFlippedCan = data.redMadeNoise = false;
			data.redVisits = (Math.random()>0.5?1:0);
			Red.explore("loot");
		} else if (seg == "Red visit") {
			data.redBunnyExamined = data.bfRedFingered = data.redExposition = data.redWombfuck = false;
			data.metRed = 1;
			data.redVisits = 0;
			Red.explore("intro");
		} else if (seg == "Red Visit 2") {
			Red.explore("redvisit2knock");
		} else if (seg == "Mourning") {
			data.redVisits == 2;
			TheFloatillery.theFloatillery("leave a bouquet");
		} else if (seg == "Nero & River") {
			TheFloatillery.theFloatillery("neroaccept");
		} else if (seg == "The mingling") {
			TheFloatillery.theFloatillery("mingle");
		} else if (seg == "Thelly beach") {
			data.thellyName = "whore";
			TheFloatillery.theFloatillery("thelly");
		} else if (seg == "Som Dom") {
			TheFloatillery.somDom("1");
		} else if (seg == "Bins the raccoon") {
			BrightForest.brightForestExplore("follow raccoon");
		} else if (seg == "Seagull girl") {
			BrightForest.brightForestExplore("follow scent");
		} else if (seg == "Nymph boy") {
			data.nymphBoyCockfuck = data.nymphBoyMistake = data.nymphCummyHair = false;
			IndigoPond.indigoPond("swim over");
		} else if (seg == "Kemp") {
			IndigoPond.indigoPond("approach otter");
		} else if (seg == "Bar") {
			data.indigoPissed = data.nymphAddressed = data.indigoToddlerDone = data.bartenderTalked = false;
			IndigoPond.indigoPond("check out bar");
		} else if (seg == "Private area") {
			data.indigoPrivateBeating = data.indigoPrivateShitting = data.indigoPrivateFeral = false;
			IndigoPond.indigoPond("peek into");
		} else if (seg == "Thelly Pond") {
			IndigoPond.indigoPond("thelly1");
		} else if (seg == "Flytrap") {
			BrightForest.brightForestExplore("flytrapsex");
		} else if (seg == "Fingerpainting") {
			BrightForest.brightForestExplore("ExploreVelmanKids");
		} else if (seg == "Taste Test") {
			PetConvos.love(PetGame.petGameData.pets[0]);
		} else if (seg == "Red After Apo") {
			Red.explore("afterApo1");
		} else if (seg == "Teen stripper") {
			JunkCity.junkCityExplore("ExploreTeenStripper");
		} else if (seg == "Dumpster") {
			JunkCity.junkCityExplore("ExploreDumpsterDrown");
		} else if (seg == "Breed Me") {
			JunkCity.junkCityExplore("ExploreBreedMe");
		} else if (seg == "Trash can goobeast") {
			JunkCity.junkCityExplore("ExploreTrashCan");
		} else if (seg == "Cade") {
			JunkCity.junkCityExplore("ExploreCade");
		} else if (seg == "Cade2") {
			data.cadeListeningMusic = data.cadeKnownName = data.cadeKnownWait = data.cadeKnownPlayer = data.cadePissBalloon = data.cadePartyGaveBalloons = data.cadePartyChimeraKnown = false;
			data.cadeLookAnywhere = [];
			data.cadeMusic = "";
			JunkCity.junkCityExplore("ExploreCadeParty");
		} else if (seg == "Free refreshments") {
			Septricas.enterSept("refreshments");
		} else if (seg == "Hyena family septricas") {
			data.housePlayerPos = "";
			data.houseDone = true;
			data.house2Done = data.houseFutaLoved = false;
			Septricas.enterSept("bathfamily");
		} else if (seg == "Boys bathroom") {
			data.bathroomBoysDone = false;
			Septricas.enterSept("bathboys");
		} else if (seg == "Breeding Floor") {
			data.babyBalloonPoked = data.cageDefensive = data.cageKoalaSnuffed = data.cageWhereFromDone = data.cageBunnyFingerfucked = data.cageBunnyGroped = data.cageBunnyPunchfucked = data.cageBunnySnuffed = data.cageAskedOften = data.cageKoalaBroke = data.cageKoalaEaten = data.cageKoalaKissed = data.cageKoalaSnuffed = false;
			data.cageKoalaCounter = 0;
			Septricas.elevator("breed");
		} else if (seg == "Bar & Lounge") {
			data.babyGotFuckmeat = data.grabbedDrink = data.loungeBear = data.loungeAshtray = data.goreBowl = false;
			Septricas.elevator("lounge");
		} else if (seg == "Lilac") {
			data.lilacPuked = data.lilacLookedUp = data.lilacLookedLeft = data.lilacLookedRight = false;
			Septricas.lilac("main");
		} else if (seg == "Shooting range") {
			data.shootingRapemeat = false;
			Septricas.elevator("shooting range");
		} else if (seg == "That dude buried in the sand on the Tropics floor") {
			Septricas.elevator("check buried");
		} else if (seg == "Training zone") {
			data.sumoCubBagDone = data.sumoZebraDone = false;
			Septricas.elevator("sumo bags");
		} else if (seg == "Unbirth") {
			Septricas.elevator("volleyball won");
		} else if (seg == "Mystery Floor") {
			Septricas.elevator("mystery");
		} else if (seg == "Roddy & Oni") {
			data.leakyCondoExamined = false;
			SewerSuburbs.sewerExplore("leakyhillsnext");
		} else if (seg == "Skunk cub") {
			data.ivandisSockGagged = data.ivandisCell = false;
			SewerSuburbs.sewerExplore("ivandis1");
		} else if (seg == "Skunk cub camping trip") {
			data.loopIteration = 0;
			data.cageDefensive = false;
			SewerSuburbs.sewerExplore("camptrip1");
		} else if (seg == "Hyena family sewer") {
			SewerSuburbs.sewerExplore("houseintro");
		} else if (seg == "Sperm bank") {
			data.roddyWithdrew = data.roddyDeposited = false;
			JunkCity.junkCityExplore("roddybank1");
		} else if (seg == "Sperm bank 2") {
			JunkCity.junkCityExplore("roddyferalfuck");
		} else if (seg == "Blood bank") {
			data.eyeFuckDone = data.afterCareDone = false;
			JunkCity.junkCityExplore("bloodbankhub");
		} else if (seg == "Velman Bank") {
			JunkCity.junkCityExplore("velman");
		}  else if (seg == "Bins getting punished") {
			LLL.libraryExplore("bins1");
		} else if (seg == "Snagg Abuse") {
			JunkCity.junkCityExplore("snaggabuse2failswipe");
		} else if (seg == "Public Snuff") {
			JunkCity.junkCityExplore("ExplorePublicSnuff");
		} else if (seg == "Red Moved") {
			JunkCity.junkCityExplore("redMove1");
		} else if (seg == "sepBreakIn") {
			Septricas.enterSept("breakIn1");
		} else if (seg == "Left") {
			data.springsBargedThrough = data.springsCatPreggo = data.springsLeftIntroDone = data.springsLeftLevelTwo = data.springsLeftLevelThree = false;
			data.springsPowerup = "";
			data.springsExplore1 = data.springsExplore2 = data.springsExplore3 = [];
			TheCrack.explore("leftintro");
		} else if (seg == "Stall 3") {
			data.deadGodIntroDone = false;
			TheCrack.explore("deadgod");
		} else if (seg == "Stall 2") {
			TheCrack.explore("bouncymarei");
		} else if (seg == "Stall 1") {
			TheCrack.explore("ratboy");
		} else if (seg == "Taro Body Brews") {
			data.taroIntroDone = data.taroSweetDone = data.taroNymphDone = data.taroButtDone = data.taroMilkDone = data.taroGutDone = data.taroBitDick = data.taroBabyFuckDone = false;
			TheCrack.explore("tarointro");
		} else if (seg == "Hyper Shark Girl") {
			HyperLand.explore("shark1");
		} else if (seg == "Kemp Pizza") {
			VioletMeteorite.violetMeteoriteExplore("ExplorePizza");
		} else if (seg == "Kemp Truck") {
			data.kempTruckExplodePredicted = data.kempSmokedEarly = data.kempPedo = data.kempPiss = data.kempTruckExploded = false;
			VioletMeteorite.violetMeteoriteExplore("ExploreKemp");
		} else if (seg == "Bins Spring") {
			VioletMeteorite.violetMeteoriteExplore("ExploreTrashSprings");
		} else if (seg == "Deerdog femboy 2") {
			VioletMeteorite.violetMeteoriteExplore("ExploreDeerDog");
		} else if (seg == "Scattered Cavern" || seg == "Abandoned Cavern" || seg == "Reflective Cavern" || seg == "Ringed Cavern" || seg == "Layered Cavern" || seg == "Twisting Cavern" || seg == "Chimerical Cavern") {
			StaticCallbacks.goCaves(seg+".tmx", gotoHub.bind(null));
		} else if (seg == "Gryphon Cavern") {
			VioletMeteorite.violetMeteoriteExplore("ExploreGryphon");
		} else if (seg == "GlowbunnyApothecary") {
			Apothecary.explore("glowbunny1");
		} else if (seg == "RedApo") {
			Apothecary.explore("redSceneStart");
		} else if (seg == "mareiTour") {
			Apothecary.explore("mareiTour");
		} else {
			// error('Journal entry response to "$seg" is missing.');
		}
	}

	public static function wakeUp():Void {
		cameraFadeOut(0xFFFFFF, 0.5, function() { // It's important that this doesn't happen instantly
			var time:Float = data.timeSinceTouched;
			var pagesFound:Array<String> = data.pagesFoundDuringDaydream;
			var seedMap:Map<String, Int> = [
				"Roxelle" => 0,
				"Cade" => 0,
				"Kemp" => 0,
				"Red" => 0,
				"Septrica" => 0,
				"Marei" => 0,
				"Som" => 0
			];
			for (key in seedMap.keys()) {
				if (getItem(key+"'s Seed").amount > 0) seedMap.set(key, 1) else seedMap.set(key, 0);
			}
			msg("You wake from your daydream.", true);
			loadCurFromString(oldSaveStr);
			oldSaveStr = "";
			data.timeSinceTouched = time;
			for (page in pagesFound)
				unlockJournal(page);
			for (key in seedMap.keys()) {
				if (getItem(key+"'s Seed").amount < 1 && seedMap.get(key) > 0) getItem(key+"'s Seed").amount = 1;
			}
			enablePause();

			cameraFadeIn(0xFFFFFF, 0.5);
		}, true);
	}
}
