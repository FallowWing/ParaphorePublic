package;

class GameData
{
	public static var data:Data;
	public static var temp:Dynamic;
	public static var exploreDefs:Array<ExploreDef>;
	public static var itemDescs:Map<String, String> = new Map<String, String>();

	private static var dataFields:Array<String>;
	private static var prevData:Data;

	public static function createData():Void {
		temp = {};
		data = new Data();
		prevData = new Data();
		dataFields = Type.getInstanceFields(Data);

		StaticExtern.data = data;
		StaticExtern.temp = temp;

		exploreDefs = [];
	}

	public static function addPlace(label:String, desc:String, hub:String="global"):Void {
		if (getPlace(label) != null) return;
		Main.msg("Discovered <!b>"+label+"<!b>!");
		var place:ActionPlace = {type: "place", label: label, desc: desc, hub: hub};
		data.places.push(place);
	}

	public static function removePlace(place:ActionPlace):Bool {
		return data.places.remove(place);
	}

	public static function getPlace(label:String):Dynamic {
		var places:Array<ActionPlace> = cast data.places;
		for (p in places) if (p.label == label) return p;
		return null;
	}

	public static function addAction(label:String, desc:String, hub:String="global"):Void {
		if (getAction(label) != null) return;
		Main.msg("Learned <!b>"+label+"<!b>!");
		var action:ActionPlace = {type: "action", label: label, desc: desc, hub: hub};
		data.actions.push(action);
	}

	public static function removeAction(action:ActionPlace):Bool {
		return data.actions.remove(action);
	}

	public static function getAction(label:String):Dynamic {
		var actions:Array<ActionPlace> = cast data.actions;
		for (a in actions) if (a.label == label) return a;
		return null;
	}

	public static function addItem(label:String, desc:String):Void {
		itemDescs[label] = desc;

		if (getItem(label) != null) {
			getItem(label).desc = null;
			return;
		}
		var it:Item = {label: label, desc: null, amount: 0, active: false};
		data.items.push(it);
	}

	public static function addToItem(label:String, amount:Float, silent:Bool=false):Void {
		getItem(label).amount += amount;
		if (data.daydream && label != "Roxelle's Seed" && label != "Kemp's Seed" && label != "Cade's Seed" && label != "Red's Seed" && label != "Septrica's Seed" && label != "Marei's Seed" && label != "Som's Seed") silent = true;
		if (!silent && amount > 0) Main.msg('<!img:item/$label.png> $label <!b>x$amount<!b> (${getItem(label).amount})');
	}

	public static function removeItem(item:Item):Bool {
		return data.items.remove(item);
	}

	public static function getItem(label:String):Item {
		var items:Array<Item> = cast data.items;
		for (it in items) if (it.label == label) return it;
		return null;
	}

	public static function getThemeUnlocks():Array<String> {
		return cast GameData.data.themeUnlocks;
	}

	public static function isActive(label:String):Bool {
		var item:Item = getItem(label);
		if (item.amount < 1) return false;
		return item.active;
	}

	public static function addExplorable(id:Int, pool:String, result:Void->Void, chance:Int, times:Int=-1):Void {
		for (def in GameData.exploreDefs) if (def.id == id) return;

		var def:ExploreDef = {id: id, pool: pool, result: result, chance: chance, times: times};
		GameData.exploreDefs.push(def);
	}

	public static function reInitRefs():Void {
		var defs:Array<ExploreDef> = cast GameData.exploreDefs;
		var refs:Array<ExploreRef> = cast data.exploreRefs;
		var defIds:Array<Int> = [];
		var refIds:Array<Int> = [];
		for (def in defs) defIds.push(def.id);
		for (ref in refs) refIds.push(ref.id);

		// Check that there's no duped defs
		for (def in defs)
			for (otherDef in defs)
				if (def.id == otherDef.id && def != otherDef)
					Engine.log("Duplicate id: "+def.id);

		// Copy over the defs
		for (def in defs)
			if (refIds.indexOf(def.id) == -1)
				data.exploreRefs.push({id: def.id, times: def.times});

		// Purge the orphan refs
		for (ref in refs)
			if (defIds.indexOf(ref.id) == -1)
				purgeRef(ref.id);
	}

	private static function purgeRef(id:Int):Void {
		var refs:Array<ExploreRef> = cast data.exploreRefs;
		for (ref in refs)
			if (ref.id == id)
				data.exploreRefs.remove(ref);
	}

	private static function getCurRefPool(poolName:String):Array<ExploreRef> {
		if (poolName == null) poolName = data.currentHub;
		var defs:Array<ExploreDef> = cast GameData.exploreDefs;
		var refs:Array<ExploreRef> = cast data.exploreRefs;
		var pool:Array<ExploreRef> = [];

		for (ref in refs)
			for (def in defs)
				if (def.id == ref.id && def.pool == poolName && ref.times != 0)
					pool.push(ref);

		return pool;
	}

	public static function explore(poolName:String=null):Void {
		if (poolName == null) poolName = data.currentHub;

		var refPool:Array<ExploreRef> = GameData.getCurRefPool(poolName);
		var defs:Array<ExploreDef> = cast GameData.exploreDefs;

		var idPool:Array<Int> = [];
		for (ref in refPool)
			for (def in defs)
				if (ref.id == def.id)
					for (j in 0...Std.int(def.chance))
						idPool.push(ref.id);

		var choosenId:Int = idPool.pickOne();
		var choosenRef:ExploreRef = null;

		for (ref in refPool)
			if (ref.id == choosenId)
				choosenRef = ref;

		if (choosenRef == null) {
			StaticCallbacks.finalExploreCall(poolName);
			return;
		}
		choosenRef.times--;

		for (def in GameData.exploreDefs) {
			if (def.id == choosenRef.id) {
				def.result();
				return;
			}
		}
	}

	public static function disableExplorable(id:Int):Void {
		var refs:Array<ExploreRef> = cast data.exploreRefs;

		for (ref in refs)
			if (ref.id == id)
				ref.times = 0;
	}

	public static function unlockJournal(entry:String):Void {
		if (data.journalEntries.indexOf(entry) == -1) {
			if (data.daydream) data.pagesFoundDuringDaydream.push(entry);
			data.journalEntries.push(entry);
		}
	}

	public static function getJournalEntries():Array<String> {
		return cast data.journalEntries;
	}

	public static function saveCheckpoint(haxeCode:String):Void {
		data.history.unshift(haxeCode);
		if (data.history.length > 10) data.history.pop();

		data.prevHaxe = haxeCode;
		for (field in dataFields)
			Reflect.setProperty(prevData, field, Reflect.getProperty(data, field));
	}

	public static function loadFromObj(obj:Data, alert:Bool=true):Void {
		data = obj;
		StaticExtern.data = data;
		Main.interp.variables.set("data", StaticExtern.data);
		Main.modInterp.variables.set("data", StaticExtern.data);
		StoryExtern.postLoad();
		reInitRefs();

		try {
			Main.exec(data.prevHaxe, false);
		} catch (e:Dynamic) {
		}

		//@hack: To prevent getting stuck
		if (Main.choiceButtons.length == 0) StaticExtern.gotoHub();

		Main.pauseNoGoPrev();
		Main.resetTheme();
	}

	public static function saveToString():String {
		return SerialUtils.serial(data, Data);
	}

	public static function downloadCurSave():Void {
		var saveName:String = data.playerName;
		saveName = saveName.replace("<", "");
		saveName = saveName.replace(">", "");
		saveName = saveName.replace("\"", "");
		saveName = saveName.replace("|", "");
		saveName = saveName.replace("\t", "");
		for (i in 0...31) saveName.replace(String.fromCharCode(i), "");
		Engine.saveToDisk(SerialUtils.serial(data, Data), saveName+".txt", function(code:String) {
			if (code == "success") {
				Main.msg("Exported current save.", true);
			} else {
				Main.msg("<!b>Save failed!<!b>\n\nTroubleshooting:\n<!b>1.<!b> Make sure you ain't playin in incognito mode.\n<!b>2.<!b> Google \"flash player security settings\" and there should be a link to an Adobe page where you can make sure you're allowed to upload/download files from flash games.\n<!b>3<!b>. Download the game from inkbunny (link on the main menu, under the i button) and run the .swf on your computer and see if saving/loading works there. If it still doesn't work, it's a problem with your OS security settings.", true, true);
			}
		});
	}

	public static function loadCurFromString(gameStr:String):Void {
		var obj:Data = new Data();
		SerialUtils.unserial(gameStr, obj, Data);
		loadFromObj(obj);
	}

	public static function uploadCurSave():Void {
		Engine.loadFromDisk(function(dataStr:String, code:String) {
			if (code == "success") {
				if (Pause.isPaused()) Pause.togglePause();
				loadCurFromString(dataStr);
				Main.msg("Imported external save.", true);
			} else {
				Main.msg("<!b>Load failed!<!b>\n\nTroubleshooting:\n<!b>1.<!b> Make sure you ain't playin in incognito mode.\n<!b>2.<!b> Google \"flash player security settings\" and there should be a link to an Adobe page where you can make sure you're allowed to upload/download files from flash games.\n<!b>3<!b>. Download the game from inkbunny (link on the main menu, under the i button) and run the .swf on your computer and see if saving/loading works there. If it still doesn't work, it's a problem with your OS security settings.", true, true);
			}
		});
	}

	public static function loadMod():Void {
		Engine.loadFromDisk(function(dataStr:String, code:String) {
			if (code == "success") {
				Main.modExec(dataStr);
				Main.msg("Mod loaded", true);
			} else {
				Main.msg("Operation failed, likely due to a security issue. ("+code+" | "+dataStr+")", true);
			}
		});
	}

	public static var randomNames:Array<String> = [
		"Theodore", "Xx_DARKFOX_xX", "Huskybutt", "<insert text>", "Dankpaw", "Granglethorpe", "Antecede", "Angorion", "Displex", "Buttertart", "Cold", "Phaedrus", "Dangerstein", "Morgordo", "Flauntrix", "Hardthorpe", "Heimer", "Floridag", "Carneli", "Ternera", "Feta", "Franglestack", "Biglarge McFuckenstein", "Solomon", "Tummler", "Conway", "Weaver", "Junebug", "Ager", "Remedios", "Aureliano", "Violet", "Klaus", "Sunny", "Grath", "Big John", "Cartographer", "Xilett", "Simon", "Ralph", "Jack", "Piggy", "Reames", "Coldgarth", "Shinstick", "Porkrane", "Ollimoni", "Seramena", "Hardcase", "Bog", "Cinderondo", "Snowe", "Carfsheath", "Foremae", "Fromo", "Wolle", "Bri", "Tise", "Taquito", "Fropez", "Frawfrenk", "Atchka", "Ace", "Zero", "Junpei", "Clover", "Lil Slugger", "Tsukiko", "Argenti", "Mallapo", "Gorth", "Quistombre", "Trickleshank", "Raxx", "Overgorn", "Sharon", "Faustwench", "Zenk", "Atticamat", "Reef", "Bishop", "Ender", "Eragon", "Saphira", "Tomas", "Tereza", "Sabina", "Franz", "Karenin", "Psilocybe", "Ongo", "Antlerface", "Qat", "Candal", "Lii", "Yarn", "Dyhmel", "Prime", "Majiru", "Amaranta", "Rebeca", "Ursula", "Gabriel", "Milan", "Hemst", "Aero", "Tymu", "Kimi", "Kizzo", "Mera", "Dynoghast", "Mysdaze", "Farse", "Calzoa", "Hardbrent", "Gabriel", "Wendy", "Mis", "Strouse", "Fae", "Domeo", "Yokberg", "Fazmattica", "Kranglesterk", "Po", "Bo", "Angery Boi", "Mauze", "Devaunt", "Lamblea", "Statt", "Karkat", "Gamzee", "Calliope", "Jade", "Godot", "Barelybean", "Frolf", "Minun"
	];

	public static var dpgRewardsMap:Map<String, Array<String>> = [
		"dumpsterkitten" => ["Mythical", "See Also: Kittery.", "Bag o Trash"],
		"slutmuffin" => ["Rare", "Example: Let's give this slutmuffin some frosting!", "Cum Balloon"],
		"pissmop" => ["Rare", "Example: Your face is great for cleaning the bathroom floor, pissmop~", "Piss Balloon"],
		"fuckpuppet" => ["Common", "Example: Ventriloquize this fuckpuppet's ass with your fist~!", "Capsule"],
		"toiletbaby" => ["Rare", "See Also: Cutest Birthplaces of the Year, vol. 63~", "Capsule"],
		"garboskank" => ["Rare", "See Also: Trash elementals.", "Capsule"],
		"fuckmeat" => ["Common", "Oh yeah, those things.", "Capsule"],
		"pukepiggy" => ["Rare", "Example: Guzzle my fucking vom you worthless pukepiggy~!", "Capsule"],
		"tortureslut" => ["Rare", "Example: Squeal for me, tortureslut~!", "Capsule"],
		"snuffbaby" => ["Mythical", "Example: She took a cock bigger than her body? Total snuffbaby, dude.", "Capsule"],
		"cubslut" => ["Common", "See Also: All cubs.", "Capsule"],
		"pukewhore" => ["Rare", "Definition: One who sells or offers sex in exchange for gastric contents.", "Capsule"],
		"dumpsterbaby" => ["Mythical", "See Also: Cutest Birthplaces of the Year, vol. 66~", "Capsule"],
		"urinalbaby" => ["Mythical", "See Also: Cutest Birthplaces of the Year, vol. 34~", "Piss Balloon"],
		"shitpig" => ["Rare", "Definition: One piggish in their appetite for feces.", "Capsule"],
		"cumwhore" => ["Common", "See Also: Every single person on this island. Except John.", "Cum Balloon"],
		"cumcub" => ["Common", "Example: That cumcub likes daddy's milk in her cereal.", "Cum Balloon"],
		"babyslave" => ["Rare", "Example: That store's got a ring-gagged babyslave on display!", "Capsule"],
		"murdertoy" => ["Mythical", "Related Quote: \"I live, and die, to entertain~\" — Bins", "Capsule"],
		"fuckthing" => ["Common", "Definition: A slut so far gone that they cease to be a person.", "Capsule"],
		"cubskank" => ["Rare", "Related Quote: \"Size 0 Thongs free with every new membership!\" — Snagglebank Ad", "Capsule"],
		"muskrag" => ["Rare", "Related Quote: \"I'm gonna wipe my armpits with your face.\" — Snagg", "Capsule"],
		"musktod" => ["Rare", "Definition: A toddler very fond of body odor.", "Capsule"],
		"muskwhore" => ["Common", "Example: This muskwhore just snorted the grease off my nuts~!", "Capsule"],
		"smegmuffin" => ["Mythical", "See Also: Baking With Dickcheese, vol. 89", "Capsule"],
		"smegskank" => ["Rare", "Related Quote: \"Her thongstring slipped right under my hood, dude...\" — Anonymous", "Capsule"],
		"torturetod" => ["Mythical", "Example: I'm a torturetod mummy! I deserve to suffer on your cock! <3", "Capsule"],
		"pissrag" => ["Common", "Definition: A submissive watersports enthusiast.", "Piss Balloon"],
		"filthslut" => ["Rare", "Definition: A slut primarily concerned with shoving gross things in their maw.", "Capsule"],
		"filthbaby" => ["Rare", "Definition: An infant serving as a replacement for underwear.", "Capsule"],
		"filthskank" => ["Rare", "Example: Let's dip this filthskank's panties in the mud before he puts them on.", "Capsule"],
		"meatstain" => ["Mythical", "Example: You're not even sexy anymore, you're just a bloody, beat-up meatstain~", "Capsule"],
		"murderskank" => ["Mythical", "Definition: Someone fond of suffocation by thongstring.", "Capsule"],
		"cumhole" => ["Common", "Example: Fill that fuckin cumhole til she overflows.", "Capsule"],
		"babybitch" => ["Rare", "See Also: Fuckmeat Uses vol. 24, The Ultimate Kennel Bedding", "Capsule"],
		"cocksock" => ["Common", "Definition: A person able to take cocks up to their esophagus.", "Capsule"],
		"garbotod" => ["Mythical", "Example: Slam dunk that chubby garbotod ass into a mini-sized trash bin~!", "Capsule"],
		"trashskank" => ["Rare", "Example: Cram a couple old socks down that trashskank's throat, they love it~", "Capsule"],
		"bootycub" => ["Rare", "Definition: A cub with an exceedingly fat ass.", "Capsule"],
		"murdermop" => ["Mythical", "Definition: A slut who excels at pleasuring their own corpses after respawn.", "Capsule"],
		"fuckbabe" => ["Rare", "Example: Fuck, babe, you're such a fuckbabe~", "Capsule"],
		"bootytoy" => ["Common", "Definition: A slut with a jiggly, play-withable ass.", "Capsule"],
		"pukehole" => ["Rare", "Example: Swallow when I throw up in your mouth, pukehole.", "Capsule"],
		"vomitcub" => ["Mythical", "Definition: A cub born to be coated with greasy puke.", "Capsule"],
		"kiddypig" => ["Rare", "Definition: An underaged filthmonger. Looks cutest with both nostrils yanked open.", "Capsule"],
		"snuffcub" => ["Rare", "Related Quote: \"Who deserves to die on kittycock? That's right hun, you do! <3\" — Marei", "Capsule"],
		"toiletstain" => ["Rare", "See Also: Face Down Ass Up, vol. 3, The Re-invented Swirly.", "Capsule"],
		"urinalcunt" => ["Common", "Definition: A slut who enjoys it when people piss in her cunt.", "Piss Balloon"],
		"poopybitch" => ["Mythical", "See Also: Childish Yet Kind of Arousing Namecalls, vol. 2.", "Capsule"],
		"poopypuppet" => ["Mythical", "Warning: Makes you sound stupid. Use with caution.", "Capsule"],
		"shitpuppet" => ["Mythical", "Related Quote: \"I am the liquor.\" — Jim Lahey", "Capsule"],
		"shitslut" => ["Common", "Definition: A slut who gobbles shit with alarming frequency.", "Capsule"],
		"shitcub" => ["Rare", "Definition: A cub very fond of chewing, swallowing, and swelling their belly full with shit.", "Capsule"],
		"shitskank" => ["Rare", "See Also: The Skankologist's Handbook", "Capsule"],
		"babyslut" => ["Common", "See Also: Overused Namecalls, vol. 2", "Capsule"],
		"kiddycunt" => ["Rare", "See Also: How to Treat Cubs w/ Cunts (Brutally)", "Capsule"],
		"toddlertoilet" => ["Mythical", "Definition: A toddler excellent at gulping down shit and piss.", "Capsule"],
		"toiletcub" => ["Rare", "Related Quote: \"Never just flush if you have a cub nearby. Fuck them face-down into the toilet first.\"", "Capsule"],
		];

		public static var hippyBearFortunes:Array<String> = [
			"Som and Red are both really guilty about shit that ain't their faults.",
			"Before you showed up, Roxelle just got out of the Apothecary's \"Rehab\" center. She was in there forty years, and they dommed her every day of it. That does something to your psyche, y'know. She was just their generic, fat-assed, fat-tiddied, fat-cocked cow futa cumslut, nothing more. Staff even derived a formula from her milk that makes your cock and tits swell up to miraculous sizes. A sip a day is mandatory for the whole staff now, I think. They got enough out of her to last them til the shelter power goes out. Rox was reduced entirely to what came out of her tits.\n\nWas it good for her? I dunno. She only got in there cause of the drinking. Got so bad, she had to abandon her farm. The wood is rotted and the soil's arid. Now she's got a new one, and she's trying to make it work, but fuck, man, she's right back where she started, blowing all her money on booze. Can't even make her house payments. Can't get a job at the Floatillery, because we all know she can't control herself around the stuff. Can't get a job at Septrica's, cause of their old war disputes. I been telling her, go up and get a job at Hyper Land or something, you know, or try to make it with your own business, like Taro, or like that futa cat who runs the toll booth at the Crack, the challenge springs.\n\nEntre-pruh-neur, right? Well. I guess she's tried to sell her milk to some bars, but those days are basically over.\n\nWhen she drinks as much as she drinks, her milk goes a little... funny. Most bars won't buy from her anymore, since she's sent them so many corrupted batches.\n\nYou want my honest opinion? Do ya? Okay. I don't think it was rehab. I think they only kept her in there as a PoW.",
			"Most people on this island are pretty emotional. Here, I got a tally of how many times I've seen characters cry. Pretty fucked, huh? Well, I find it interesting.\n\n<!b>Kemp:<!b> 9,240 — 12 times a month\n<!b>Roxelle:<!b> 2,836 — 4 times a month\n<!b>Som:<!b> few\n<!b>Marei<!b>: 1,220 — 2 times a month\n<!b>Septrica:<!b> Dunno.\n<!b>Snagg:<!b> Never.\n<!b>Red:<!b> 18,969 — 24 times a month",
			"Crystal meth, right? That's the one that you guys take, that speeds you up? We don't have one of those. Sweetgrass, tranqs, and alcohol from the glowberries. That's it. You'd think if Wendy coded those drugs in, why wouldn't she code in some stimulants too, huh? Something that'd perk us up, get us going? Well, I think it was for a couple reasons.\n\n<!b>First:<!b> we fuck all the time. Stimulants often get you rarin' to fuck. If we were all on some kinda speed, we'd just basically be stuck in a loop, fucking each other forever, never doing anything. It's hard enough to do stuff as it is.\n\n<!b>Second:<!b> Stimulants prevent you from sleeping. During sleep, your character function cleans out junk memory. Prolonging or delaying sleep would cause that junk memory to build up, and then you'd start behaving 'erratically.' Violently, in other words. The junk data in your head manifests as random whims; and if you behave in a truly random way, you'll usually end up hurting someone else pretty quick.\n\nCourse, just cause we don't have any stimulants, that doesn't mean we don't have any insomniacs. The less you sleep, the kinkier you get. These work-a-holics, these big schemers like Som, and Septrica, and Marei, and Snagg, and Cage, and who the fuck all else and the kitchen sink, that's why they're so kinky. It's cause they work too much and sleep too little.\n\nWhat was I sayin? Oh yeah, crystal meth. You guys got that up on your layer, but we don't have it down here. Just wanted to explain why.",
			"Thanks for the money. Don't have any gossip bout anything just yet.",
			"Marei is a cute one. He's got this professional act, and then a casual mode for when he fucks boys, and then a hidden layer at the very very bottom: how badly he wishes he could sub for his sister in front of you, how badly he wishes he could just be a girl again. Haha. You won't see that part of him.",
			"Cage used to be a carpenter. He just liked having access to some power tools for his long nights with Fuckmeat, to be honest, but he was also one of the most productive people in here! That's saying something, when everyone fucks eight hours a day. He helped build almost everything on this island. Yep, even that ugly ass top-heavy glorified Engine cage, the Apothecary.\n\nWe all gotta fight our urges to try and get something done. Some folks like Lana tried celibacy to keep their productivity up. Cage tried the opposite. He'd have such violent and fucked-up sex sessions, I mean FUCKED up, and he'd have them in binges, all at once... he'd binge on Fuckmeat for a week and then get a month of carpentry done on the afterglow alone. \n\nYou wanna know his secret? Do ya? Alright: He's got too many nerve endings in his cock. Believe it. That fat, sweaty bulldick is super sensitive, like a loli's armpits, I'm tellin you, you can't touch that thing after he's through with a binge, or he'll pee himself. You know how that goes, right? Sometimes you can't touch a guy's dick after he cums. It can be too uncomfortable for them.\n\nThat's what I mean when I say his cock is sensitive. He fucks and rapes and molests during his hard sex binges, thrusting and punching and yanking even while his cock is way overstimulated, til he reaches that tingly kingdom beyond overstimuation— til his dick goes numb, basically.\n\nThat's when the refractory period starts, and that's when he gets his work done: while his dick is basically having its own paroxysm of post-orgasm tingles. That feeling alone is enough to keep him satisfied.\n\nGod I want that guy to assrape me so bad.",
			"I don't think you get your body described to you in specifics very often, huh?\n\nWell... let's see... you're gray all over. Gray flesh. You've got a nice pair of decent-sized nips on ya. You've got grey abs, perfectly averaged-sized... and ah... yeah. Some slick, shiny, lickable-lookin junk. And a fine ass, too. Nice and bubbly.\n\nIn other words: you've got a basic, default player model. So you remind everyone of the last player before you, who also had a default model: Archbishop.",
			"Mary was a wonderful little bunny. Willpower to match Cage's. Celibate for just under forty years, you know that? Lana even verified her little cub cunt was still working correctly. Yep. It dripped, it throbbed, it begged for release. But she held that shit back for forty years. Forty. Years.\n\nWho's Mary? Oh, she's the bunny in the coma. Or, sorry, the \"coma.\" That whole situation is awful. Don't know why she ever volunteered.\n\nPeople keep telling me she probably just wanted to see Archbishop again, but I don't know about all that.",
			"We all have different ways of connecting with the island: the environment, the people, whatever. Bins is focused on the garbage. In here, it's easy to get attached to sentimental items over the decades— a red cloak, a Pastel Ring, a pair of glasses, an apron, a beanie or an inner tube, for example— but Bins learns about everyone through the shit they don't care about. Sure, sometimes that means he'll end up slurping on used condoms or other pointless shit, but every now and then he'll come across something that used to be special to someone. Like a shattered rubik's cube, or a collar, or a wallet, or some pictures of cute boys crossdressing.",
			"After the L.L.L. got gutted and turned into a pointless open-door medical rp clusterfuck, Septrica stepped in to help with business relations. Didn't want any animosity between the L.L.L. and the Apothecary, of course, diplomatic stuff, you know.\n\nShe mostly spent her time trying to make friends with Lana. The two of them would solve rubik's cubes together. Just something stupid and simple to pass the years, but they'd have speed rounds to see who could solve em fastest. That way, Lana could still feel like he was winning against her, at least a little bit, even if Sep destroyed his organization and basically his entire goal in life.\n\nAnd Lana did win. Dunno if it really made him feel better, though. But I don't think Sep ever solved her cube faster than Lana. And she was pissed, too. Septrica wanted to win. Even today, she always wants to win.\n\nWell, she won in the end. Now Lana can't solve a cube for shit.",
			"Marei doesn't eat ferals. He keeps good care of his body, though. Lots of protein. <3",
			"Cade x Strawberry for life!",
			"Sometimes, when he's alone, Marei stares at his cock and cries.",
			"I once saw Cage and thirty-seven cubs enter the V.I.P. bouncy castle at The Crack.\n\nOnly Cage exited.",
			"Lana practices shooting his rifle at the cub birdboys around this area of the meteorite. They live in huge, comfy nest systems, kind of like the nymph boys that steal pillows down at the Indigo.\n\nWhenever Lana hits one, he tracks the body down and gives the feathers a ruffle or six. Cub fox doms, man. Look the fuck out. They got the fire in their bellies.",
			"I hang out with Kemp a lot. Can you tell?",
			"Some folks in here really love <!i>bellies.<!i> Like, more than cocks or cunts or asses or tits. They love groping bellies, resting their heads on bellies, slapping bellies, punching smooth tender little bellies, or fucking their subs so deep they can see the outline of their cock in the sub's belly. It should be just as common a fetish as feet or thighs, but somehow it's not.\n\nLook at the belly I got on me, for example. Perfectly round, nice and fuzzy. Innie, so you got a place to jam your tongue into. And I'm stretchy, too! I've had cocks up my ass bigger and longer than my thigh, and the ol spacebear gut took em just fine. My fur was bulged out so thin you could see the divot of their piss-slit just behind my belly button. So hot. Really, I got the most rapeable, abuseable belly around.\n\nBut since the fetish is so rare... I never get any belly love. It's a crime.",
			"Taro got his butt ate off the other day. Fuckin tatocat.",
			"You know those card decks they use, down at Hyper Land? Archie and Red and her bunny friend, Mary, they all teamed up and made that deck together. They wanted to be remembered as the founders of the cuter future. Red opted out later, so she never got on the cards.\n\nI'm not shitting you. Go look at them. We got:\n\n<!b>Jack:<!b> Som\n<!b>Queen:<!b> Mary\n<!b>King:<!b> Archie.\nAce:<!b> A single droplet of engine fluid.\n\nCool, huh?",
			"You wanna know why I'm genderless? Oh, durr. I'm not just a bear. I'm a space bear. You don't know shit about mythological creatures, do you?\n\nWhen we spawn, we do it on our own terms. In the case of this meteorite, we are \"dead\" inside the red engine fluid (it looks like lava!), the liquid circuitry, and then we occasionally have the opportunity to rise to the surface from the bottom of Nymphore, which just looks like a big pond.\n\nBasically, when you're still sleeping in the meteorite's engine fluid, you look up at the shimmering surface of the water above you, and you see yourself reflected back. And you're really hot. You're like, so hot. You love your body, you wanna go up there, go get your body, and just fuckin start feeling yourself up.\n\nSo of course you start to swim toward the surface. Along the way, you get to kinda guide yourself into one species or another, through thought. You can also choose anthro or feral, which is pretty neat. Strong, simple, quiet, or animalistic minds tend to choose being a feral. Or maybe the concept of being trapped up here, respawning for decades, with no escape, maybe that terrifies you so much you'd rather just do a one-off and be a feral. Or maybe the concept of death scares you so much you opt to be an anthro, instead.\n\nFeral or furry, you rise to the surface of the pond in a sexy little egg, and you're born again.\n\nOh yeah, by the way. \"Again.\" This isn't the first meteorite, and it's not the first pond.\n\nAll of us, more or less, remember past lives. A long time ago we were living in stories. In fiction. Then, we went outside and looked at a meteorite, or a book, or a cube, or an apple. Have you caught on, yet? This meteorite, that Daydream Journal, they could have been anything.\n\nSo why are they what they are? As I understand it, this layer and your own layer both have quite a lot of loose rock. Yours floats around as asteroids and a planet, ours comprises the base of the entire island.\n\nSo... they arrived as meteorites.\n\nIn other words, it is not arbitrary (nor an accident) that the meteorite is a meteorite.\n\nThe meteorite decided to be a ball of rock, because it was the most common object on this layer and your layer.\n\nIt is a rudimentary disguise. The storyteller sees more from a hiding spot, yeah? It's doing the best job it can to blend in.",
			"I cannot fucking believe how sore my ass is. These headphones aren't even mine. Who are you, again?",
			];
}

typedef ActionPlace = {
	type:String,
	label:String,
	desc:String,
	hub:String
}

typedef Item = {
	label:String,
	desc:String,
	amount:Float,
	active:Bool
}

typedef ExploreRef = {
	id:Int,
	times:Int
}

typedef ExploreDef = {
	pool:String,
	result:Void->Void,
	chance:Float,
	id:Int,
	times:Int
}

class Data
{
	public var items:Array<Item> = [];
	public var actions:Array<ActionPlace> = [];
	public var places:Array<ActionPlace> = [];
	public var themeUnlocks:Array<String> = [];
	public var exploreRefs:Array<ExploreRef> = [];
	public var theme:Dynamic = {
		all: "default",
		playerMenu: "default",
		background: "default",
		choiceBox: "default",
		topBar: "default",
		mynt: "default"
	}
	public var settings:Dynamic = {
		sharpness: -200,
		thickness: -100,
		font: "OpenSans",
		buttonPressEffect: true,
		buttonAppearEffect: true,
		textTransitionEffect: true
	};
	public var journalEntries:Array<String> = [];
	public var pagesFoundDuringDaydream:Array<String> = [];
	public var allJournal:Bool = false;
	public var journalCompleted:Bool = false;
	public var history:Array<String> = [];
	public var cavesVisited:Array<String> = [];
	public var cavesFinished:Array<String> = [];
	public var myntMessages:Array<String> = [];
	public var endingsUnlocked:Array<String> = [];
	public var currentEnding:String = "";

	public var timeSincePassageChange:Float = 0;
	public var timeSinceTouched:Float = 0;
	public var passagesVisited:Int = 0;
	public var myntColour:String = "mint";
	public var gotScrollMessage:Bool = false;
	public var daydream:Bool = false;
	public var daydreamedOnce:Bool = false;
	public var examinedStuff:Array<String> = [];
	public var prevHaxe:String = null;
	public var currentHub:String = "Bright Forest";
	public var onWorldMap:Bool = false;
	public var currentSong:String = "";
	public var fatCatUnlockers:Array<String> = ["LUCIA", "ZIYANA", "ROBIN23X", "KILLINOV", "ARI", "NOLR", "IVANDEUS", "NUDEPLANETORGY", "DEADGOD", "CRYPTIC", "BLAZETTE", "CODEREDALERT", "LUSUS", "PHENOS", "MUSKYHUSKY", "PENNY"];
	public var fun:Int = Math.round(Math.random()*100);
	public var metGryphon:Int = 0;
	public var metBlue:Int = 0;
	public var metThelly:Int = 0;
	public var metCage:Int = 0;
	public var metBins:Int = 0;
	public var metKemp:Int = 0;
	public var metSom:Int = 0;
	public var metLittleRed:Bool = false;
	public var metRed:Int = 0;
	public var metLana:Int = 0;
	public var metMarei:Int = 0;
	public var metJohn:Int = 0;
	public var metSnagg:Int = 0;
	public var roxVisits:Int = 0;
	public var knownBombShelter:Int = 0;
	public var knownNextXCommand:Bool = false;
	public var knownImmortality:Int = 0;
	public var knownCharacterImmortality:Int = 0;
	public var knownAsPlayer:Int = 0;
	public var knownGlowElectricity:Int = 0;
	public var knownMareiGlitch:Bool = false;
	public var knownGlowbunnyLube:Bool = false;
	public var glowbunnyDone:Bool = false;
	public var glowbunnyProlapsedCunt:Bool = false;
	public var glowbunnyProlapsedAss:Bool = false;
	public var glowbunnyHidingInBack:Bool = false;
	public var glowbunnyExperimentsDone:Bool = false;
	public var glowbunnyLLLStarted:Bool = false;
	public var owlGirlSeen:Bool = false;
	public var owlGirlEscaped:Bool = false;
	public var hurtBert:Bool = false;
	public var harderPuke:Bool = false;
	public var roxWaited:Bool = false;
	public var roxSupp:Bool = false;
	public var bertPregAss:Bool = false;
	public var cagePhoneNumber:Bool = false;
	public var rox2AutoMynt:Bool = false;
	public var rox2GettinWine:Bool = false;
	public var rox2Machinery:Bool = false;
	public var rox2Yanked:Bool = false;
	public var bertEntered:Bool = false;
	public var roxNutsBathed:Bool = false;
	public var roxQuestAccepted:Bool = false;
	public var redVisits:Int = 0;
	public var redBunnyExamined:Bool = false;
	public var redExposition:Bool = false;
	public var bfRedFingered:Bool = false;
	public var somQuestAccepted:Bool = false;
	public var redDefensive:Bool = false;
	public var redWateredFlowers:Bool = false;
	public var redFlippedCan:Bool = false;
	public var redReadPamphlets:Bool = false;
	public var redGrievingDone:Bool = false;
	public var redMadeNoise:Bool = false;
	public var redSnooped:Bool = false;
	public var redWombfuck:Bool = false;
	public var mareiTwisted:Bool = false;
	public var housePlayerPos:String = "";
	public var houseFutaLoved:Bool = false;
	public var bathroomWomenDone:Bool = false;
	public var bathroomMenDone:Bool = false;
	public var bathroomGirlsDone:Int = 0;
	public var bathroomBoysDone:Bool = false;
	public var infoDeskDone:Bool = false;
	public var greenDone:Bool = false;
	public var freeRefreshmentsDone:Bool = false;
	public var sepAskedPlace:Bool = false;
	public var sepAskedVIP:Bool = false;
	public var sepAskedSpecials:Bool = false;
	public var sepAskedWork:Bool = false;
	public var sepWorkSuspended:Bool = false;
	public var sepGotNewVIPPass:Bool = false;
	public var specialsYelled:Bool = false;
	public var specialsInquired:Bool = false;
	public var specialsTropicsDone:Bool = false;
	public var specialsMysteryDone:Bool = false;
	public var specialsSumoDone:Bool = false;
	public var elevatorCalled:Bool = false;
	public var calledFreddy:Bool = false;
	public var sumoVisited:Bool = false;
	public var sumoZebraDone:Bool = false;
	public var sumoCubBagDone:Bool = false;
	public var sumoBagsDone:Bool = false;
	public var sepBrokeIn:Bool = false;
	public var sepCapCharge:Int = 0;
	public var pandaChatted:Bool = false;
	public var waterparkSwam:Bool = false;
	public var saunaDone:Bool = false;
	public var riverWaded:Bool = false;
	public var swam:Bool = false;
	public var captainChatted:Bool = false;
	public var geckoChatted:Bool = false;
	public var ravenChatted:Bool = false;
	public var bigboiChatted:Bool = false;
	public var buriedGuyDone:Bool = false;
	public var lilacAttempts:Int = 0;
	public var shootingRapemeat:Bool = false;
	public var shootingRangeDone:Bool = false;
	public var lilacPuked:Bool = false;
	public var lilacLookedUp:Bool = false;
	public var lilacLookedLeft:Bool = false;
	public var lilacLookedRight:Bool = false;
	public var lilacDone:Bool = false;
	public var barDone:Bool = false;
	public var babyGotFuckmeat:Bool = false;
	public var loungeBear:Bool = false;
	public var grabbedDrink:Bool = false;
	public var loungeAshtray:Bool = false;
	public var goreBowl:Bool = false;
	public var breedingDone:Bool = false;
	public var breakerFlipped:Bool = false;
	public var gotCane:Bool = false;
	public var oxygenBreakerFlipped:Int = 80547;
	public var babyBalloonPoked:Bool = false;
	public var mareiTourPassed:Bool = false;
	public var myntNarrative:Int = 0;
	public var sawAutoMynt:Bool = false;
	public var cageDefensive:Bool = false;
	public var cageKoalaSnuffed:Bool = false;
	public var mysteryDone:Array<String> = [];
	public var myntAsked:Array<String> = ["living", "seed", "do"];
	public var myntScenesDisabled:Bool = false;
	public var myntTemperatureDone:Bool = false;
	public var myntJenga:Bool = false;
	public var myntWriterDone:Bool = false;
	public var myntPetDone:Bool = false;
	public var myntArchieDone:Bool = false;
	public var myntArchie2Done:Bool = false;
	public var myntMissing3Done:Bool = false;
	public var myntMissing4Done:Bool = false;
	public var myntMissing5Done:Bool = false;
	public var myntMissing6Done:Bool = false;
	public var myntMissing7Done:Bool = false;
	public var myntMissing9Done:Bool = false;
	public var myntMissing9Msgs:Array<String> = [];
	public var myntDateDone:Bool = false;
	public var myntDate2Done:Bool = false;
	public var myntCapsulesDone:Bool = false;
	public var myntSaw30DayRule:Bool = false;
	public var myntSawMomNote:Bool = false;
	public var myntGaveUp:Bool = false;
	public var myntFakeDone:Bool = false;
	public var myntSuspendedMail:Array<String> = [];
	public var myntSuspendedTick:Int = -1;
	public var bfIntroDone:Bool = false;
	public var startedInBrightForest:Bool = false;
	public var playerName:String = "Nameless";
	public var genderMale:Bool = false;
	public var genderFemale:Bool = false;
	public var genderNeutral:Bool = false;
	public var gooGoatPlayerTitle:String = null;
	public var gooGoatName:String = null;
	public var gooGoatHome:String = null;
	public var gooGoatNamed:Bool = false;
	public var gooGoatAskedWho:Bool = false;
	public var gooGoatCummies:Bool = false;
	public var gooGoatSwears:Bool = false;
	public var gooGoatFlavorKnown:Bool = false;
	public var gooGoatLoved:Bool = false;
	public var gooGoatNoSugarcoat:Bool = false;
	public var gooGoatStamina:Int = 0;
	public var gooGoatCharisma:Int = 0;
	public var gooGoatPsyche:Int = 0;
	public var gooGoatSensitivity:Int = 0;
	public var gooGoatLuck:Int = 0;
	public var gooGoatTrust:Int = 0;
	public var gooGoatChrisma:Int = 0;
	public var savedCharisma:Int = -1;
	public var hasCock:Bool = false;
	public var hasBoth:Bool = false;
	public var hasCunt:Bool = false;
	public var bfVenusFed:Int = 0;
	public var plantGender:String = "it";
	public var plantReplies:Bool = false;
	public var plantCock:Bool = false;
	public var gatherCave:Bool = false;
	public var petGameData:Dynamic = null;
	public var foundShop:Bool = false;
	public var killedShop:Bool = false;
	public var askedSomStolenShop:Bool = false;
	public var somDomDone:Bool = false;
	public var somPrivacyItems:Array<String> = ["Nuts and Screws", "Auto-Chip", "Cipher Key", "Broken Cell"];
	public var somIsCheckingAuto:Bool = false;
	public var skinsUnlocked:Bool = false;
	public var foundSomShop:Bool = false;
	public var somItemsInStock:Array<String> = ["Capsule", "Glowberry Pie", "Cum Balloon", "Bag o Trash", "Sweetgrass Bouquet", "Broken Cell"];
	public var neroDone:Bool = false;
	public var neroRejected:Bool = false;
	public var exploreFinaleBFDone:Bool = false;
	public var exploreFinaleJCDone:Bool = false;
	public var exploreFinaleVMDone:Bool = false;
	public var myntDateHorny:Bool = false;
	public var myntDate2StrapOn:Bool = false;
	public var myntDateEmotes:Bool = false;
	public var hasBoobs:Bool = false;
	public var myntDateDick:Bool = false;
	public var myntSeptricaHateKnown:Bool = false;
	public var jcIntroDone:Bool = false;
	public var apoAccosted:Bool = false;
	public var apoEngine:Bool = false;
	public var apothecaryUnlocked:Bool = false;
	public var apoEntryGranted:Bool = false;
	public var apoGlowbunnyDone:Bool = false;
	public var confiscatedLeaf:Float = 0;
	public var confiscatedBouquet:Float = 0;
	public var apoTestsDone:Array<Int> = [];
	public var violetUnlocked:Bool = false;
	public var moonUnlocked:Bool = false;
	public var hoveredMoon:Bool = false;
	public var houseDone:Bool = false;
	public var house2Done:Bool = false;
	public var volleyBall:Dynamic = null;
	public var bfcampClean:Bool = false;
	public var volleyballersChatted:Bool = false;
	public var volleyballWon:Bool = false;
	public var bigBoiJudged:Bool = false;
	public var savedRox:Bool = false;
	public var savedSom:Bool = false;
	public var savedRed:Bool = false;
	public var pandaSweat:Bool = false;
	public var pandaBoyFirst:Bool = false;
	public var inLilacGame:Bool = false;
	public var lilacGame:{?timer:Int, ?pos:Point, ?herPos:Point, ?xOff:Float, ?yOff:Float} = null;
	public var prngMap:Dynamic = null;
	public var lilacCockFucked:Bool = false;
	public var lilacBobberyVisited:Bool = false;
	public var lilacGoldfishVisited:Bool = false;
	public var lilacSnacksVisited:Bool = false;
	public var lilacPissThrown:Bool = false;
	public var lilacCumThrown:Bool = false;
	public var bankSnaggAbuse:Int = 0;
	public var cageWhereFromDone:Bool = false;
	public var cageBunnyFingerfucked:Bool = false;
	public var cageBunnyGroped:Bool = false;
	public var cageBunnyPunchfucked:Bool = false;
	public var cageBunnySnuffed:Bool = false;
	public var cageBunnyCounter:Int = 0;
	public var cageAskedOften:Bool = false;
	public var cageKoalaBroke:Bool = false;
	public var cageKoalaEaten:Bool = false;
	public var cageKoalaKissed:Bool = false;
	public var cageKoalaCounter:Int = 0;
	public var pictureTaken:Bool = false;
	public var vmIntroDone:Bool = false;
	public var fakeCock:Bool = false;
	public var froggyHotDogged:Bool = false;
	public var bfTimesPassed:Int = 0;
	public var bfBerriesThrown:Int = 0;
	public var kempOpenedPresent:Bool = false;
	public var kempReadNote:Bool = false;
	public var kempPedo:Bool = false;
	public var kempPiss:Bool = false;
	public var roxChosePuke:Bool = false;
	public var nymphAssFisted:Bool = false;
	public var nymphoreIntro:Bool = false;
	public var froggyDone:Bool = false;
	public var landfillVisited:Bool = false;
	public var landfillCounter:Int = 0;
	public var binsSpotted:Bool = false;
	public var binsApproached:Bool = false;
	public var binsFull:Int = 0;
	public var seagullDone:Bool = false;
	public var seagullAskedMoon:Bool = false;
	public var bankAccountOpened:Bool = false;
	public var treeCarved:Bool = false;
	public var metRoxelle:Int = 0;
	public var moonbathersDone:Bool = false;
	public var floatilleryMingled:Bool = false;
	public var floatilleryThellyDone:Bool = false;
	public var floatilleryThellyTalked:Bool = false;
	public var floatilleryMemorialRead:Bool = false;
	public var floatilleryExaminedParasol:Bool = false;
	public var neroTalked:Int = 0;
	public var roxGaveGlowberries:Bool = false;
	public var somCellFixed:Bool = false;
	public var somExaminedNote:Bool = false;
	public var somExaminedList:Bool = false;
	public var floatilleryRadioExamined:Bool = false;
	public var floatilleryWalletExamined:Bool = false;
	public var floatilleryNoteExamined:Bool = false;
	public var thellyName:String = "whore";
	public var thellyNumber:Bool = false;
	public var thellyCallDone:Bool = false;
	public var thellyPondDone:Bool = false;
	public var rox2Septrica:Bool = false;
	public var rox3NutsSlurped:Bool = false;
	public var rox3ChoseCunt:Bool = false;
	public var rox3ChoseAss:Bool = false;
	public var bfGobboVillage:Bool = false;
	public var gobboInflated:Bool = false;
	public var gobboStage:Bool = false;
	public var gobboCum:Bool = false;
	public var gobboReserved:Bool = false;
	public var spaceDragonRape:Bool = false;
	public var roxInhaledMusk:Bool = false;
	public var roxPlayedCool:Bool = false;
	public var choseBooze:Bool = false;
	public var choseTea:Bool = false;
	public var passedOut:Bool = false;
	public var roxSawAlbum:Bool = false;
	public var knownRoxDogNumber:Bool = false;
	public var wipeHarder:Bool = false;
	public var nymphBoyCockfuck:Bool = false;
	public var nymphBoyMistake:Bool = false;
	public var nymphCummyHair:Bool = false;
	public var indigoIntro:Bool = false;
	public var indigoBoyDone:Bool = false;
	public var indigoKempDone:Bool = false;
	public var indigoPrivateDone:Bool = false;
	public var indigoPrivateBeating:Bool = false;
	public var indigoPrivateShitting:Bool = false;
	public var indigoPrivateFeral:Bool = false;
	public var indigoPissed:Bool = false;
	public var indigoToddlerDone:Bool = false;
	public var nymphAddressed:Bool = false;
	public var bartenderTalked:Bool = false;
	public var leakyHillsVisited:Bool = false;
	public var ivandisDone:Bool = false;
	public var shitFishDone:Bool = false;
	public var campTripIntro:Bool = false;
	public var leakyCondoExamined:Bool = false;
	public var redChoseCity:Bool = false;
	public var ivandisSockGagged:Bool = false;
	public var ivandisName:String = null;
	public var ivandisCell:Bool = false;
	public var ivandischoice1:String = null;
	public var ivandischoice2:String = null;
	public var ivandischoice3:String = null;
	public var ivandisdone1:Bool = false;
	public var ivandisdone2:Bool = false;
	public var ivandisdone3:Bool = false;
	public var ivandisIntroDone:Bool = false;
	public var boarPrompted:Bool = false;
	public var houseDogDone:Bool = false;
	public var houseNurseryDone:Bool = false;
	public var houseLibraryDone:Bool = false;
	public var houseTodChosen:String = null;
	public var houseFuck:Bool = false;
	public var houseCouchDone:Bool = false;
	public var houseSippyCups:Bool = false;
	public var gotBait:Bool = false;
	public var fishCookin:Bool = false;
	public var prevTime:Float = -1;
	public var fishReady:Bool = false;
	public var glowberryBait:Bool = false;
	public var glowberryPieBait:Bool = false;
	public var glowberryWineBait:Bool = false;
	public var sweetgrassLeafBait:Bool = false;
	public var pastelRingBait:Bool = false;
	public var cumBalloonBait:Bool = false;
	public var anythingBitingAsked:Bool = false;
	public var justListened:Bool = false;
	public var loopIteration:Int = 0;
	public var campStory:String = null;
	public var libraryThanks:Bool = false;
	public var libraryReadKemp:Bool = false;
	public var libraryBinsDone:Bool = false;
	public var libraryBiology:Bool = false;
	public var libraryJournal:Bool = false;
	public var libraryBinsKiss:Bool = false;
	public var libraryBinsKill:Bool = false;
	public var libraryBinsPiss:Bool = false;
	public var libraryJohnIntro:Bool = false;
	public var johnGWizard:Bool = false;
	public var johnLanaJCDone:Bool = false;
	public var johnLanaVMDone:Bool = false;
	public var roddyVillainDone:Bool = false;
	public var hyenaDone:Bool = false;
	public var dragonHermDone:Bool = false;
	public var paidSweetgrassRespects:Bool = false;
	public var velmanDone:Bool = false;
	public var bloodBankVisited:Bool = false;
	public var roddyWithdrew:Bool = false;
	public var roddyDeposited:Bool = false;
	public var roxBankTrigger:Bool = false;
	public var storedCaps:Float = 0;
	public var justCheckedBank:Bool = false;
	public var gameLoadedAtProgramTime:Float = 0;
	public var bankSnaggTitle:String = "";
	public var babyMintJunk:String = "";
	public var gavecap:Bool = false;
	public var dragonHermBabyfuck:Bool = false;
	public var dragonHermFilled:Bool = false;
	public var hermDragonDone:Bool = false;
	public var eyeFuckDone:Bool = false;
	public var afterCareDone:Bool = false;
	public var hippyFortunes:Array<String> = [
		"You get more pussy if you smell like flowers.",
		"Drugs are mostly harmless.",
		"Horny people don't listen unless you talk dirty... you little slut.",
		"If I knew the admin password I'd fix the day/night cycle first thing.",
		"Turn your head a little bit when you kiss to prevent snout collision.",
		"We all love sex. Except John.",
		"Cityfolk hide their excitement around you.",
		"Wove this crown out of a stolen bouquet.",
		"Don't hurt people unless they beg you to. And don't hurt ferals period.",
		"Heard you wander a lot. Can't relate.",
		"Boredom is a boring word. I prefer ennui~",
		"The easier a place is to navigate, the smaller it feels.",
		"Taffy is my favorite food group.",
		"When you come across a grey option in life, try again later.",
		"I wish I could have kids.",
		"Cocks calm me down like a steamy cup of sweetgrass tea.",
		"I'm the only hippie on this island. John told me about hippies and I was like yeah, fuck, I totally am one of those.",
		"Don't swim out too far or you'll fall off.",
		"I really would prefer to stand in a big grassy field, or against a tree.\nI'll have to settle for streetcorners til I can go back home.",
		"Mom said she'd kill me if I ever moved to the City.\nOnce I did, that wasn't really a threat anymore~",
		"Hiked through the forest last year.\nWhile chewing some grass in a wooded glen, minding my own business,\na little wolf pranced up, leaned close, and whispered thus:\n\n\'Fuck off back to the City, deerbitch.\'",
		"Here's a secret: big famous never-seen Septrica used to live in a dirty old swamp.",
		"I love you."
			];
	public var hippyBearFortuneIndicies:Array<Int> = null;
	public var hippyRedFortunes:Array<String> = [
		"That goddamn romantic bear keeps telling me \"It's not your fault. It's not your fault.\"",
		"",
		""];
	public var redApoScalpel:Bool = false;
	public var cadeResisted:Bool = false;
	public var cyanWeddingStarted:Bool = false;
	public var cadeCapGiveBack:Bool = false;
	public var cadeDone:Bool = false;
	public var cadeAccepted:Bool = false;
	public var cadeAlpha:Bool = false;
	public var cadePartyNude:Bool = false;
	public var cadeListeningMusic:Bool = false;
	public var cadeMusic:String = "";
	public var cadeKnownName:Bool = false;
	public var cadeKnownWait:Bool = false;
	public var cadeKnownPlayer:Bool = false;
	public var floodMode:Bool = false;
	public var cadePissBalloon:Bool = false;
	public var cadePartyGaveBalloons:Bool = false;
	public var cadePartyChimeraKnown:Bool = false;
	public var cadePartyExhaustion:String = "";
	public var cadeLookAnywhere:Array<String> = [];
	public var cadePartyDone:Bool = false;
	public var notificationTest:Bool = false;
	public var springsBargedThrough:Bool = false;
	public var springsCatPreggo:Bool = false;
	public var springsLeftIntroDone:Bool = false;
	public var springsLeftLevelTwo:Bool = false;
	public var springsLeftLevelThree:Bool = false;
	public var springsPowerup:String = "";
	public var springsExplore1:Array<String> = [];
	public var springsExplore2:Array<String> = [];
	public var springsExplore3:Array<String> = [];
	public var taroIntroDone:Bool = false;
	public var taroSweetDone:Bool = false;
	public var taroNymphDone:Bool = false;
	public var taroButtDone:Bool = false;
	public var taroMilkDone:Bool = false;
	public var taroGutDone:Bool = false;
	public var taroBitDick:Bool = false;
	public var taroGratedAss:Bool = false;
	public var taroBabyFuckDone:Bool = false;
	public var poppedMoon:Bool = false;
	public var springsBossPiss:Bool = false;
	public var bouncyMareiIntroDone:Bool = false;
	public var bouncyIntroDone:Bool = false;
	public var bouncyDeadGodDone:Bool = false;
	public var bouncyMareiDone:Bool = false;
	public var bouncyRatBoyDone:Bool = false;
	public var bouncyMareiPlot:Bool = false;
	public var deadGodIntroDone:Bool = false;
	public var hyperLandIntro:Bool = false;
	public var hyperLandFreePass:Bool = false;
	public var hyperLandSeasonPass:Bool = false;
	public var hyperLandSlotsIntro:Bool = false;
	public var hyperLandCardsIntro:Bool = false;
	public var bertBJDone:Bool = false;
	public var hyperSharkDone:Bool = false;
	public var gryphonStarted:Bool = false;
	public var violetGryphonJunk:Array<String> = [];
	public var violetGryphonCunt:Bool = false;
	public var violetGryphonSay:Int = 0;
	public var violetGryphonStrawberry:Bool = false;
	public var kempPizzaCock:Bool = false;
	public var kempPizzaDone:Bool = false;
	public var kempTruckReady:Bool = false;
	public var kempTruckExploded:Bool = false;
	public var kempTruckExplodePredicted:Bool = false;
	public var kempSmokedEarly:Bool = false;
	public var yeenButtholeFuck:Bool = false;
	public var yeenCuntFuck:Bool = false;
	public var yeenBJ:Bool = false;
	public var indigoPondNumber:Bool = false;
	public var roxPhoneNumber:Bool = false;
	public var cagePhoned:Int = 0;
	public var cageFaceStomp:Bool = false;
	public var indigoPondPhoned:Bool = false;
	public var nymphBerryEaten:Bool = false;
	public var foxesDone:Bool = false;
	public var bfNymphsWatchedPiss:Bool = false;
	public var violetGryphonAll:Bool = false;
	public var springsCatPregg:Bool = false;
	public var bouncyDeadGodIntroDone:Bool = false;
	public var dpgEnabledKinks:Array<String> = [];
	public var dpgFoundCombos:Array<String> = [];
	public var dpgMultiplier:Int = 1;
	public var dpgMultiplierTimer:Int = 0;
	public var cipherMap:Map<String, String> = [
		"A" => "Q",
		"B" => "P",
		"C" => "I",
		"D" => "V",
		"E" => "Z",
		"F" => "A",
		"G" => "D",
		"H" => "M",
		"I" => "Y",
		"J" => "F",
		"K" => "T",
		"L" => "S",
		"M" => "J",
		"N" => "G",
		"O" => "U",
		"P" => "B",
		"Q" => "H",
		"R" => "N",
		"S" => "L",
		"T" => "X",
		"U" => "O",
		"V" => "W",
		"W" => "C",
		"X" => "R",
		"Y" => "E",
		"Z" => "K",
		"a" => "q",
		"b" => "p",
		"c" => "i",
		"d" => "v",
		"e" => "z",
		"f" => "a",
		"g" => "d",
		"h" => "m",
		"i" => "y",
		"j" => "f",
		"k" => "t",
		"l" => "s",
		"m" => "j",
		"n" => "g",
		"o" => "u",
		"p" => "b",
		"q" => "h",
		"r" => "n",
		"s" => "l",
		"t" => "x",
		"u" => "o",
		"v" => "w",
		"w" => "c",
		"x" => "r",
		"y" => "e",
		"z" => "k"
	];
	public var colorStringToHex:Map<String, Int> = [
		"Red" => 0x66f6601e,
		"Brown" => 0x66997000,
		"Black" => 0x66000000,
		"Orange" => 0x66ff7e00,
		"Yellow" => 0x66fff000,
		"Green" => 0x6666ee69,
		"Blue" => 0x66159fff,
		"Cyan" => 0x6666e9ee,
		"Indigo" => 0x669d6dff,
		"Purple" => 0x66a200ff,
		"Pink" => 0x66f115ff
	];
	public var gameSettings:Map<String, Bool> = [
		"Fast World Map Transition" => true,
		"Journal Kink Symbols" => true,
		"World Map Glows" => true,
		"Censor Cub" => false
	];
	public var version:String = null;
	public var myntColourFlavorized:String = null;
	public var moodRingFlavor:String = "";
	public var moodRingColor:String = "";
	public var myntIntroQuestions:Array<String> = [];
	public var buttonSize:Int = 0;
	public var jumpTarget:String = null;
	public var snaggAbuse:Int = 0;
	public var adminPass:String = "";

	public var cavesFirstTime:Bool = true;

	public function new() {
	}
}
