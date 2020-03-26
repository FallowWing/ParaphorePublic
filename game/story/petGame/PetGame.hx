package story.petGame;

class PetGame
{
	public static inline var MAX_STAMINA = 100;

	public static var DEFAULT_STATS:Array<Float> = [100, 0, 0, 0, 0, 0];
	public static inline var STAT_STAMINA:Int = 0;
	public static inline var STAT_CHARISMA:Int = 1;
	public static inline var STAT_PSYCHE:Int = 2;
	public static inline var STAT_SENSITIVITY:Int = 3;
	public static inline var STAT_LUCK:Int = 4;
	public static inline var STAT_TRUST:Int = 5;

	public static var petGameData:PetGameData;
	public static var petGameInited:Bool = false;
	public static var timerId:Int;

	//{{{Startup
	public static function petGameStartup():Void {
		if (data.petGameData == null) {
			for (place in data.places)
				if (place.label == data.gooGoatHome)
					removePlace(place);
			return;
		}
		petGameInited = true;
		timerId = timer(1, petGameTimerEvent, 999999999);
		petGameData = data.petGameData;
		addPlace(data.gooGoatHome, "Your home.", "Bright Forest");
	}

	public static function newPetGameData():PetGameData {
		return {
			totalSec: 0,
			pets: [],
			flags: new Map(),
			items: []
		};
	}

	public static function petGameResolve():Void {
		if (data.petGameData == null) data.petGameData = newPetGameData();
		if (!petGameInited) petGameStartup();

		//pauseGoPrev();

		dispatch(newPetEvent(GAME_INIT));
		drawHome();
	}
	//}}}
	//{{{Menus
	public static function drawHome():Void {
		clear();
		playMusic("brightForest");
		temp.inSelectMenu = false; // Button size hack
		dispatch(newPetEvent(VISITED_HOME));
		addChoice("Pets.", drawPets);
		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function drawPets():Void {
		clear();
		setLocation(data.gooGoatHome);

		for (pet in petGameData.pets) {
			addChoice(pet.name, drawPet.bind(pet), {onHoverOnce: dispatch.bind(newPetEvent(PET_BUTTON_HOVERED, pet))});
		}

		addChoice("Back.", drawHome);
		addChoice("Move along.", gotoHub.bind("Bright Forest"));
	}

	public static function drawPet(pet:Pet):Void {
		clear();
		setLocation(data.gooGoatHome);
		gainStat(pet, 0, 0); // Hack to resolve +0.25

		if (pet.stats[0] < 10) {
			append(pickOne(["(She's taking a nap.)", "(She fell asleep!)", "(Someone's snoozing~)", "(She's sprawled out on the cabin floor, slumbering~)", "(Big soggy snores come from her goo mouth.)", "(She's tuckered as fuck.)"]));
			var s:MintSprite = addSprite("assets/img/effect/krazyElfSleeping");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: KrazyELF", "");
			s.x = 320;
			s.y = 275;
		} else if (pet.stats[0] >= 100) {
			append(pickOne(["She's rarin to go.", "She's teasing you.", ""+pet.name+" welcomes you home with her ass.", "She's restless~", "Lookit that little goat go!", "She's swinging her gooey nuts around for you."]));
			var s:MintSprite = addSprite("assets/img/effect/krazyElfTwerk");
			s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: KrazyELF", "");
			s.x = GAME_WIDTH-s.width*1.05;
			s.y = GAME_HEIGHT-100-s.height;
		}

		// Collar hack
		if (hasPetItem("Collar")) {
			addChoice("Walk.", dispatch.bind(newPetEvent(WALK_WITH_PET, pet)), requireStat(pet, STAT_STAMINA, 25));
		} else {
			addChoice("Walk.", dispatch.bind(newPetEvent(WALK_WITH_PET, pet)), {enabled: false, toolTip: "Requires Collar."});
		}

		if (hasPetItem("Bathtub")) {
			addChoice("Bathe.", dispatch.bind(newPetEvent(BATHE_PET, pet)), requireStat(pet, STAT_STAMINA, 25));
		} else {
			addChoice("Bathe.", dispatch.bind(newPetEvent(BATHE_PET, pet)), {enabled: false, toolTip: "Requires Bathtub."});
		}

		addChoice("Pet her.", dispatch.bind(newPetEvent(PET_PET, pet)), requireStat(pet, STAT_STAMINA, 10));
		
		//Auto-shop hack
		if (data.foundShop) {
			addChoice("Take to AUTO-SHOP.", dispatch.bind(newPetEvent(WENT_TO_SHOP, pet)), requireStat(pet, STAT_STAMINA, 10));
		} else {
			addChoice("Take to AUTO-SHOP.", dispatch.bind(newPetEvent(WENT_TO_SHOP, pet)), {enabled: false});
		}

		if (pet.stats[5] > 30 && pet.stats[0] > 10 && !data.gooGoatLoved && (data.hasCock || data.hasBoth)) {
			clear();
			data.gooGoatLoved = true;
			unlockJournal("Taste Test");
			append(data.gooGoatName+" calls from her bedroom: \""+data.gooGoatPlayerTitle+", "+data.gooGoatPlayerTitle+", "+data.gooGoatPlayerTitle+"! Get over here!!\"");
			addChoice("What? What's wrong?", dispatch.bind(newPetEvent(LOVE_PET, pet)), requireStat(pet, STAT_STAMINA, 10));
		}

		addChoice("Back.", drawHome);
	}
	//}}}
	//{{{Time
	public static function petGameTimerEvent():Void {
		if (data.petGameData == null) {
			timerCancel(timerId);
			return;
		}

		advanceTime();
	}

	public static function advanceTime():Void {
		dispatch(newPetEvent(SECOND_ADVANCE));

		for (pet in petGameData.pets) {
			gainStat(pet, STAT_STAMINA, 0.40, false);
		}

		petGameData.totalSec++;
	}
	//}}}
	//{{{Pet
	public static function newPet(name:String="Bleat"):Pet {
		var pet:Pet = {
			name: name,
			stats: DEFAULT_STATS.copy()
		};

		petGameData.pets.push(pet);
		dispatch(newPetEvent(NEW_PET, pet));

		return pet;
	}

	public static function gainStat(pet:Pet, stat:Int, amount:Float, alert:Bool=true):Void {
		//TODO(jeru): alert
		var evt:PetEvent = newPetEvent(STAT_MODIFY, pet);
		evt.stat = stat;
		evt.amount = amount;
		dispatch(evt);

		if (evt.halt) return;
		evt.pet.stats[evt.stat] += evt.amount;
	}
	//}}}
	//{{{Shop
	public static function drawShop(pet:Pet):Void {
		clear();

		var items:Array<ShopItem> = [];
		items.push({name: "Glow Collar", cost: ["Glowberry" => 30]});
		items.push({name: "Pink Collar", cost: ["Capsule" => 10]});
		items.push({name: "Doggy Bowl", cost: ["Capsule" => 5]});
		items.push({name: "Bathtub", cost: ["Capsule" => 10]});
		items.push({name: "The Route to Cute Glutes! Workout VHS", cost: ["Capsule" => 10]});
		items.push({name: "Toriel Poster", cost: ["Capsule" => 20]});
		items.push({name: "Goo Softener", cost: ["Cum Balloon" => 10]});
		//items.push({name: "Doggy Bowl", cost: ["Capsule" => 15]});

		addChoice("Back.", drawHome);
		for (i in 0...items.length) {
			var item:ShopItem = items[i];

			addChoice(
				item.name,
				buyItem.bind(item, pet),
				{enabled: canAfford(item), toolTip: "Cost:\n"+getCostString(item)}
			);
		}

		buttonsInGrid(28, 2, 300, 10, 20, 50, 70);
	}

	public static function getCostString(item:ShopItem):String {
		var s:String = "";

		for (key in item.cost.keys()) {
			var have:Float = getItem(key) != null ? getItem(key).amount : 0;
			var need:Float = item.cost.get(key);
			s += '$key: $need (Have: $have)\n';
		}

		return s;
	}

	public static function canAfford(item:ShopItem):Bool {
		for (key in item.cost.keys())
			if (getItem(key) == null || getItem(key).amount < item.cost.get(key))
				return false;

		return true;
	}

	public static function buyItem(item:ShopItem, pet:Pet):Void {
		var evt:PetEvent = newPetEvent(ITEM_BOUGHT, pet);
		evt.item = item.name;
		dispatch(evt);

		if (evt.halt) return;

		if (petGameData.items.indexOf(item.name) == -1)
			petGameData.items.push(item.name);

		for (key in item.cost.keys())
			getItem(key).amount -= item.cost.get(key);

		drawShop(evt.pet);
	}

	public static function hasPetItem(name:String):Bool {
		return petGameData.items.indexOf(name) != -1;
	}
	//}}}
	//{{{Util
	public static function setFlag(flagName:String, value:Int):Void {
		petGameData.flags.set(flagName, value);
	}

	public static function getFlag(flagName:String):Int {
		if (petGameData.flags.exists(flagName))
			return petGameData.flags.get(flagName);

		return 0;
	}
	//}}}
}

typedef PetGameData = {
	totalSec:Int,
	flags:Map<String, Int>,
	pets:Array<Pet>,
	items:Array<String>
}

typedef ShopItem = {
	name:String,
	cost:Map<String, Int>
}

typedef Pet = {
	name:String,
	stats:Array<Float>
}
