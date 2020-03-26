package story.petGame;

class PetEvents
{
	public static inline var NONE:Int = 0;
	public static inline var GAME_INIT:Int = 1;
	public static inline var NEW_PET:Int = 2;
	public static inline var PET_BUTTON_HOVERED:Int = 3;
	public static inline var MASS_TIME_ADVANCE:Int = 4; // unused
	public static inline var SECOND_ADVANCE:Int = 5;
	public static inline var STAT_MODIFY:Int = 6; // haltable
	public static inline var TALK_TO_PET:Int = 7;
	public static inline var WENT_TO_SHOP:Int = 8;
	public static inline var ITEM_BOUGHT:Int = 9; // haltable
	public static inline var PET_PET:Int = 10;
	public static inline var WALK_WITH_PET:Int = 11;
	public static inline var VISITED_HOME:Int = 12;
	public static inline var BATHE_PET:Int = 13;
	public static inline var LOVE_PET:Int = 14;

	public static function dispatch(event:PetEvent):Void {
		if (event.type == GAME_INIT) {
			if (petGameData.pets.length == 0) {
				// First time
				newPet(data.gooGoatName);
			}
		}

		if (event.type == VISITED_HOME) {
		setLocation(data.gooGoatHome);
			append(pickOne([
					"You're at home.",
					"You lounge around at "+data.gooGoatHome+".",
					"You're at the cabin."
			]));
		}
		
		if (event.type == PET_BUTTON_HOVERED) {
			clearText();
			append("Name: "+event.pet.name+"\n");
			append("\n\nStats:");
			append("\n<!b>STAMINA<!b>: "+Math.round(event.pet.stats[STAT_STAMINA]));
			append("\n<!b>TRUST:<!b> "+Math.round(event.pet.stats[STAT_TRUST]));
			append("\n<!b>SENSITIVITY:<!b> "+Math.round(event.pet.stats[STAT_SENSITIVITY]));
			append("\n<!b>CHARISMA:<!b> "+Math.round(event.pet.stats[STAT_CHARISMA]));
			append("\n<!b>PSYCHE:<!b> "+Math.round(event.pet.stats[STAT_PSYCHE]));
			append("\n<!b>LUCK:<!b> "+Math.round(event.pet.stats[STAT_LUCK]));
		}

		if (event.type == STAT_MODIFY) {
			event.pet.stats[STAT_STAMINA] = Math.min(event.pet.stats[STAT_STAMINA], MAX_STAMINA);
		}

		if (event.type == TALK_TO_PET) {
			//event.pet.stats[STAT_STAMINA] -= STAMINA_NEEDED_TO_TALK;
			// testConvo(event.pet);
		}

		if (event.type == WENT_TO_SHOP) {
			//event.pet.stats[STAT_STAMINA] -= STAMINA_NEEDED_TO_SHOP;
			if (getFlag("shopIntro") == 0) {
				shopIntro(event.pet);
			} else {
				event.pet.stats[STAT_STAMINA] -= 10;
				drawShop(event.pet);
			}
		}

		if (event.type == NEW_PET) {
			if (petGameData.pets.length == 1) {
				event.pet.stats[STAT_PSYCHE] = data.gooGoatPsyche;
				event.pet.stats[STAT_STAMINA] = data.gooGoatStamina;
				event.pet.stats[STAT_SENSITIVITY] = data.gooGoatSensitivity;
				event.pet.stats[STAT_CHARISMA] = data.gooGoatCharisma;
				event.pet.stats[STAT_TRUST] = data.gooGoatTrust;
				event.pet.stats[STAT_LUCK] = data.gooGoatLuck;
			}
		}

		if (event.type == PET_PET) {
			petPet(event.pet);
		}

		if (event.type == BATHE_PET) {
			bathDrown(event.pet);
		}

		if (event.type == LOVE_PET) {
			love(event.pet);
		}

		if (event.type == WALK_WITH_PET) {
			walkPet(event.pet);
		}

		if (event.type == ITEM_BOUGHT) {
			var gains:String = "";
			if (event.item == "Doggy Bowl") {
				gains = "-10 Charisma.";
				gainStat(event.pet, STAT_CHARISMA, -10);
			} else if (event.item == "Bathtub") {
				gains = "+10 Trust & Sensitivity.";
				gainStat(event.pet, STAT_TRUST, 10);
				gainStat(event.pet, STAT_SENSITIVITY, 10);
			} else if (event.item == "The Route to Cute Glutes! Workout VHS") {
				gains = "+10 Trust & Charisma, -5 Sensitivity.";
				gainStat(event.pet, STAT_TRUST, 10);
				gainStat(event.pet, STAT_SENSITIVITY, 10);
			} else if (event.item == "Toriel Poster") {
				gains = "+20 Charisma.";
				gainStat(event.pet, STAT_CHARISMA, 20);
			} else if (event.item == "Goo Softener") {
				gains = "+20 Sensitivity.";
				gainStat(event.pet, STAT_SENSITIVITY, 20);
			} else {
				gains = "";
			}

			msg("Bought "+event.item+" x1\n"+gains);
		}
	}

	public static function newPetEvent(type:Int, pet:Pet=null):PetEvent {
		return {
			type: type,
			pet: pet,
			stat: -1,
			amount: -1,
			time: -1,
			item: "",
			halt: false
		}
	}
}

typedef PetEvent = {
	type:Int,
	pet:Pet,
	stat:Int,
	amount:Float,
	time:Int,
	item:String,
	halt:Bool
}
