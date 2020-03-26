package story;

enum Opponent {
	KEMP; RED; ROXELLE; SOM; SEPTRICA;
}

class Blackjack
{
	private static var KEMP_TRUNKS_COLOURS:Array<Int> = [
		0x73ff4949, // red
		0x7349ff4d, // green
		0x7349fdff, // blue
		0x73495eff, // purple
		0x73df49ff // pink
	];

	private static var deck:Array<Dynamic>;
	private static var grave:Array<Dynamic>;
	private static var hands:Array<Array<Dynamic>>;
	private static var cardSprites:Array<MintSprite>;
	private static var playerControlled:Int;
	private static var playerNum:Int;

	private static var onWin:Void->Void;
	private static var onLose:Void->Void;

	private static var playerTotal:MintText;
	private static var opponentTotal:MintText;

	private static var opponent:Opponent;
	private static var opponentSprites:Array<MintSprite>;

	private static var somClothes:Array<Int>;

	private static var dialogLost:Array<String>;
	private static var dialogBusted:Array<String>;
	private static var dialogWon:Array<String>;
	private static var dialogTied:Array<String>;
	private static var dialogEvent:Array<String>;
	private static var dialogGaveUp:Array<String>;

	private static var wins:Int;
	private static var losses:Int;
	private static var gaveUp:Bool = false;
	private static var cheatWin:Bool = false;
	private static var rigged:Bool = false;

	public static function startGame(opponent:Opponent, onWin:Void->Void, onLose:Void->Void, rigged:Bool=false):Void {
		Blackjack.rigged = rigged;
		Blackjack.onWin = onWin;
		Blackjack.onLose = onLose;
		Blackjack.opponent = opponent;
		disablePause();

		setChannelVolume("win", 0.3);

		playerTotal = addText(true);
		playerTotal.setText("");
		playerTotal.setFormat({wordWrap: false, fontColour: Theme.getColour("mainText"), fontSize: 24});
		playerTotal.x = 80;
		playerTotal.y = 150;

		opponentTotal = addText(true);
		opponentTotal.setText("");
		opponentTotal.setFormat({wordWrap: false, fontColour: Theme.getColour("mainText"), fontSize: 24});
		opponentTotal.x = 385;
		opponentTotal.y = 150;

		playerNum = 2;
		playerControlled = 0;
		wins = 0;
		losses = 0;

		opponentSprites = [];

		if (opponent == KEMP) {

			dialogLost = ["Wrecked ya.", "Nice try, bud.", "Shoulda hit on that one.", "You got slapped around a little there.", "Oh shit, I won? I won!", "Yeesh. You look pissed.", "Fuck yeah I did it!"];
			dialogBusted = ["Don'tcha just hate big jiggly busts?", "Pow.", "Ouch.", "Blew your load there bud.", "Over the top and then a smidge higher yet!", "How does Rox say it again? 'Boosted'?", "Bam.", "Blam.", "PchooOOOoo! (That's the sound of your card stack bustin up.)", "Sometimes the stack's just too fat."];
			dialogWon = ["Good on ya!", "Welp...", "Nice.", "Ya slaughtered me.", "Ah fuck, you got a higher number than me but not higher than 21. Shit.", "Yarrrrgh!!", "Never lucky..."];
			dialogTied = ["Waddaya know bout that shit.", "Tied like a knot.", "What's the... whose... oh, it's a tie?", "Hey, we got the same number of black jacks.", "Tied right the fuck up!", "Tie...?"];
			dialogEvent = ["King me. I mean— checkmate. Wait. Nevermind.", "No beating a stack like that.", "Fuck ya twennnyyy wunnnnnnn~!"];
			dialogGaveUp = ["Why'dja stay?", "Better to take a risk and bust than to stay and accept defeat.\nLil otter philosophy for ya there.", "Have the trunks broken yer spirit already?", "I wouldn't sit tight with a stack that weak."];

			for (i in 0...6) {
				var s:MintSprite = new MintSprite();
				s.setupCanvas("minigame/bj/kemp");
				s.x = GAME_WIDTH-s.width*1.1;
				s.y = 5;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Kemp Lamblea\n<!b>SPECIES:<!b> Otter\n<!b>DIFFICULTY:<!b> Hard\n<!b>PERSONAL MOTTO:<!b> \"Keep movin.\"");
				prepareSprite(s, true);
				opponentSprites.push(s);
			}
			opponentSprites[0].setTile("body");
			opponentSprites[1].setTile("hat");
			opponentSprites[2].setTile("trunks", KEMP_TRUNKS_COLOURS[1]);
			opponentSprites[3].setTile("trunks", KEMP_TRUNKS_COLOURS[0]);
			opponentSprites[4].setTile("soft");
			opponentSprites[4].alpha = 0;
			opponentSprites[5].setTile("hard");
			opponentSprites[5].alpha = 0;
			
		} else if (opponent == RED) {

			dialogLost = ["Trounced.", "You just got fucked up.", "Try harder.", "Easy game.", "Devastation on the tabletop!", "Awww, thought you were gonna see a bit more bare fur, huh?", "Dang I destroyed you on that one.", "I can't be<!i>lieve<!i> how badly you just got beat.", "Come on, you can do it. I'm only wearing four things.", "Beatcha.", "Beatcha!", "I win!", "Not even a little bit close.", "You've been blackjack'd upon."];
			dialogBusted = ["Greedy.", "I used to say 'hit me' as much as you do, believe it or not.", "You know a higher number isn't always better, right?", "Way overboard.", "Sometimes you just gotta hold back."];
			dialogWon = ["Wow.", "Dang fuck. I thought I had that.", "Ahhh, fresh airflow...", "Grrr. Alright, I'll give you that one.", "Lucky...", "Niiice."];
			dialogTied = ["I win if it's a tie, by the way.", "Oooo, almost beat the master.", "Close one."];
			dialogEvent = ["Yeah whatever. Bound to happen sometime.", "You just happened to pull that combo, huh.", "Woah, you won that round especially hard."];
			dialogGaveUp = ["You're not even gonna try?", "Sweet, auto-win for me.", "Why not hit?", "Hmm."];

			for (i in 0...6) {
				var s:MintSprite = new MintSprite();
				s.setupCanvas("minigame/bj/red");
				s.x = GAME_WIDTH-s.width*1.1;
				s.y = GAME_HEIGHT*0.5-s.height*0.5;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Cubber", "<!b>NAME:<!b> Theresa Fayfeather (Red)\n<!b>SPECIES:<!b> Wolf\n<!b>DIFFICULTY:<!b> Soft\n<!b>PERSONAL MOTTO:<!b> \"Fuck living by a motto. Change the way you act to fit new situations.\n\n... That doesn't count as a motto.\"");
				prepareSprite(s, true);
				opponentSprites.push(s);
			}

			opponentSprites[0].setTile("body");
			opponentSprites[1].setTile("expression");
			opponentSprites[2].setTile("panties");
			opponentSprites[3].setTile("shorts");
			opponentSprites[4].setTile("undershirt");
			opponentSprites[5].setTile("cloak");
		} else if (opponent == ROXELLE) {

			dialogLost = ["Oops!", "Ahhh, good effort...", "Shit!... I was rooting for you.", "Oh no.", "Sorry bout that."];
			dialogBusted = ["Ah, I feel for you. The RNG in this game is dumb.", "Little overboard there.", "Bit more than 21 there...", "Too many!", "Boosted."];
			dialogWon = ["You did it!", "Aw man, I got my ass beat.", "Off it comes~", "I'll just be removing this, then~", "... I let you win that one. I just wanna get naked.", "Nice!"];
			dialogTied = ["Oh. Huh.", "Well then.", "What are the odds?"];
			dialogEvent = ["You twenty-<!i>won<!i> that round for sure, keheheh~", "That's a fat BJ if I ever did see one!", "Ahhhhh way to go! You did it! Blackjaaaack!"];
			dialogGaveUp = ["Didn't you mean to hit there?", "Oh, thank you. You didn't have to do that.", "Complete submission. I like it."];

			for (i in 0...8) {
				var s:MintSprite = new MintSprite();
				s.setupCanvas("minigame/bj/roxelle");
				s.x = GAME_WIDTH-s.width*1.4;
				s.y = GAME_HEIGHT*0.5-s.height*0.5;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Roxelle Devaunt\n<!b>SPECIES:<!b> Cow\n<!b>DIFFICULTY:<!b> Half-chub\n<!b>PERSONAL MOTTO:<!b> \"Open wide~!\"");
				prepareSprite(s, true);
				opponentSprites.push(s);
			}

			opponentSprites[0].setTile("body");
			opponentSprites[1].setTile("cock");
			opponentSprites[1].alpha = 0;
			opponentSprites[2].setTile("panties");
			opponentSprites[5].setTile("necklace");
			opponentSprites[4].setTile("barette");
			opponentSprites[3].setTile("tiddies");
			opponentSprites[3].alpha = 0;
			opponentSprites[6].setTile("dress");
			opponentSprites[7].setTile("belt");
		} else if (opponent == SOM) {
			somClothes = [7, 6, 2];

			dialogLost = ["Orchestrated that.", "Pure skill.", "Ekekekekeke~ (That's a lamb giggle.)", "No penalty for counting cards here, y'know.", "Mmm, there we go!", "Yessss~!", "Awww yeah I did it!"];
			dialogBusted = ["Overextended.", "Punished for the greed.", "Boosted!", "Tried your best.", "Ahh, don't feel bad. You gave it your all. Maybe even a little too much of your all...", "Yowza.", "Ah! You broke it!", "One hit too many."];
			dialogWon = ["Ahh, I couldn't make it happen...", "Nice strat.", "Better... ngh... get this off...", "You have no idea how long it took me to pick this outfit.", "D-Don't you find it a little chilly in here? Maybe I'm too used to the warm sea air...", "Wow gosh.", "Ah!"];
			dialogTied = ["I win by default!", "Such a convenient rule.", "Calculated.", "Easiest game of my life.", "Tie~"];
			dialogEvent = ["Obliterated!", "WooooooOOOOOoooowww buddy.", "What a combo.", "Twenny wun~!"];
			dialogGaveUp = ["Give up?", "Easy.", "Don't you wanna strip me anymore~?", "Not much of a challenge if you're gonna play like that..."];

			for (i in 0...9) {
				var s:MintSprite = new MintSprite();
				s.setupCanvas("minigame/bj/som");
				s.x = GAME_WIDTH-s.width*1.3;
				s.y = GAME_HEIGHT-80-s.height;
				s.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Somner Lamblea\n<!b>SPECIES:<!b> Lamb\n<!b>DIFFICULTY:<!b> Rock hard\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
				prepareSprite(s, true);
				opponentSprites.push(s);
			}

			opponentSprites[0].setTile("body");
			opponentSprites[1].setTile("blush");
			opponentSprites[1].alpha = 0;
			opponentSprites[2].setTile("glasses");
			opponentSprites[3].setTile("bra");
			opponentSprites[4].setTile("soft");
			opponentSprites[5].setTile("undies");
			opponentSprites[6].setTile("jeans");
			opponentSprites[7].setTile("sweater");
			opponentSprites[8].setTile("hard");
			opponentSprites[8].alpha = 0;

		} else if (opponent == SEPTRICA) {

			dialogLost = ["Learning when to go with the flow is important."];
			dialogBusted = ["Best not to get greedy when you're negotiating a hostage situation."];
			dialogWon = ["I'm not here to win."];
			dialogTied = ["The house always wins."];
			dialogEvent = ["If you've been paying attention, you'll know that's not necessarily a bad thing.", "You will get infected.", "Cooperate, and everything will be okay.", "I started this flood."];
			dialogGaveUp = ["Stop wasting time.", "Sometimes you just have to risk a little and trust in the dealer.", "Don't be so nervous."];

			opponentSprites[0] = new MintSprite("img/effect/sepBj/base");
			opponentSprites[0].alpha = 0;

			opponentSprites[1] = new MintSprite("img/effect/sepBj/glove");
			opponentSprites[1].alpha = 0;

			opponentSprites[2] = new MintSprite("img/effect/sepBj/hat");
			opponentSprites[2].alpha = 0;

			opponentSprites[3] = new MintSprite("img/effect/sepBj/underhat");
			opponentSprites[3].alpha = 0;

			opponentSprites[4] = new MintSprite("img/effect/sepBj/shades");
			opponentSprites[4].alpha = 0;

			opponentSprites[5] = new MintSprite("img/effect/sepBj/silhouette");

			opponentSprites[6] = new MintSprite("img/effect/sepBj/end");
			opponentSprites[6].alpha = 0;

			for (spr in opponentSprites) {
				spr.x = GAME_WIDTH-spr.width*1.1;
				spr.y = GAME_HEIGHT*0.5-spr.height*0.5;
				spr.onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> ???\n<!b>SPECIES:<!b> ???\n<!b>DIFFICULTY:<!b> ???\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
				prepareSprite(spr, true);
			}
		}

		deck = [];
		grave = [];
		var suits:Array<String> = ["clubs", "diamonds", "hearts", "spades"];
		var cards:Array<Dynamic> = [];
		// 1 2 3 4 5 6 7 8 9 10 J Q K A
		for (suit in suits)
			for (i in 2...15)
				deck.push({suit: suit, number: i});

		//startRound();
	}

	public static function startRound():Void {
		cardSprites = [];
		hands = [];
		cheatWin = false;

		for (i in 0...playerNum)
			for (j in 0...2) // 2 cards
				hit(i);

		takeTurn(0);
	}

	private static function totalHand(handIndex:Int):Int {
		var hasAce:Bool = false;
		var value:Int = 0;

		for (card in hands[handIndex]) {
			if (card.number == 14) hasAce = true;

			if (card.number == 14) value += 10;
			else if (card.number >= 10) value += 10;
			else if (card.number < 10) value += card.number;
		}

		if (value > 21 && hasAce) {
			value = 0;
			for (card in hands[handIndex]) {
				if (card.number == 14) value += 1;
				else if (card.number >= 10) value += 10;
				else if (card.number < 10) value += card.number;
			}
		}

		return value;
	}

	private static function pass(handIndex:Int):Void {
		if (totalHand(0) < totalHand(1)) gaveUp = true else gaveUp = false;
		if (handIndex < hands.length-1) takeTurn(handIndex+1);
		else endRound();
	}

	private static function takeTurn(handIndex:Int):Void {
		clearTemp();
		clearChoices();
		clearText();

		var totalField:MintText = null;
		if (handIndex == playerControlled) {
			totalField = playerTotal;
		} else {
			totalField = opponentTotal;
		}

		tween(totalField, {y: totalField.y-2}, 0.1, {onComplete: function() {
				tween(totalField, {y: totalField.y+2}, 0.1);
			}
		});
		

		if (handIndex == playerControlled) {
			var hand:Array<Dynamic> = hands[handIndex];
			if (debugMode) addChoice("<!20px>Win.<!20px>", function() {
				cheatWin = true;
				pass(handIndex);
			});

			addChoice("<!20px>    Hit.    <!20px>", function() {
				var card:Dynamic = hit(handIndex);

				tween(playerTotal, {y: playerTotal.y-2}, 0.1, {onComplete: function() {
						tween(playerTotal, {y: playerTotal.y+2}, 0.1);
					}
				});

				if (totalHand(handIndex) > 21) {
					playSound("assets/audio/environment/bustBJ", "win");
					pass(handIndex);
				}
				return;
			});

			addChoice("<!20px>    Stay.    <!20px>", pass.bind(handIndex));
		} else {
			var allOtherLost:Bool = true;
			var highestPoints:Int = 0;
			for (i in 0...hands.length) {
				var total:Int = totalHand(i);
				if (i == handIndex) continue;
				if (total <= 21) allOtherLost = false;
				if (total >= highestPoints && total <= 21) highestPoints = total;
			}

			while ((totalHand(handIndex) < highestPoints && !allOtherLost) || cheatWin) {
				var card:Dynamic = hit(handIndex);

				if (totalHand(handIndex) > 21) {
					clearChoices();
					if (cheatWin) {
						append("\""+pickOne(["Hey! You cheated!", "Cheater.", "Hey, you just threw a bunch of cards into my pile...", "That's totally fair."])+"\"");
					} else if (totalHand(0) == 21) {
						playSound("assets/audio/environment/caveWinSmall", "win");
						if (rigged) {
							append("\""+dialogEvent.pop()+"\"");
						} else {
							append("\""+pickOne(dialogEvent)+"\"");
						}
					} else if (Math.random() > 0.2) {
						append("\""+pickOne(dialogWon)+"\"");
					}

					var s:MintSprite = addSprite("assets/img/effect/winBJ");
						s.x = playerTotal.x-s.width*0.15;
						s.y = playerTotal.y;
						s.alpha = 0;
						tween(s, {alpha: 1, y: playerTotal.y-s.height*1.1}, 0.7, {ease: BOUNCE_OUT});

					var s:MintSprite = addSprite("assets/img/effect/bustBJ");
						s.x = opponentTotal.x-s.width*0.15;
						s.y = opponentTotal.y;
						s.alpha = 0;
						tween(s, {alpha: 1, y: opponentTotal.y-s.height*1.1}, 0.7, {ease: BOUNCE_OUT});
					pass(handIndex);
					return;
				}
			}

			if (totalHand(0) > 21) {
				var bust:MintSprite = addSprite("assets/img/effect/bustBJ");
					bust.x = playerTotal.x-bust.width*0.15;
					bust.y = playerTotal.y;
					bust.alpha = 0;
					tween(bust, {alpha: 1, y: playerTotal.y-bust.height*1.1}, 0.7, {ease: BOUNCE_OUT});

				if (Math.random() > 0.5) append("\""+pickOne(dialogBusted)+"\"");
			} else if (totalHand(0) == totalHand(1)) {
				append("\""+pickOne(dialogTied)+"\"");
			} else if (gaveUp) {
				append("\""+pickOne(dialogGaveUp)+"\"");
			} else if (Math.random() > 0.5) {
				append("\""+pickOne(dialogLost)+"\"");
			}

			var won:MintSprite = addSprite("assets/img/effect/winBJ");
				won.x = opponentTotal.x-won.width*0.15;
				won.y = opponentTotal.y;
				won.alpha = 0;
				tween(won, {alpha: 1, y: opponentTotal.y-won.height*1.1}, 0.7, {ease: BOUNCE_OUT});
			pass(handIndex);
		}
	}

	private static function hit(handIndex:Int):Dynamic {
		if (deck.length == 0)
			while (grave.length > 0)
				deck.push(grave.pop());

		if (hands[handIndex] == null) hands[handIndex] = [];
		var hand:Array<Dynamic> = hands[handIndex];
		var card:Dynamic = pickOne(deck);
		hand.push(card);
		deck.remove(card);

		if (handIndex == 0 && rigged) {
			card.number = 7;
		}

		var totalField:MintText = null;
		if (handIndex == playerControlled) totalField = playerTotal;
		else totalField = opponentTotal;

		totalField.setText(Std.string(totalHand(handIndex)));

		/// Card visual
		var s:MintSprite = new MintSprite();
		var pad:Int = 6;
		s.setupCanvas("minigame/card");
		s.copyTile("front", 0, 0);
		var cornerTileName:String = "";
		var suitTileName:String = 
			card.suit == "clubs" ? "crosses" :
			card.suit == "diamonds" ? "leaves" :
			card.suit == "hearts" ? "paws" :
			card.suit == "spades" ? "cocks" : "nil";
		var suitColour:Int = card.suit == "hearts" || card.suit == "diamonds" ? 0x33FF0000 : 0x330030ff;

		if (card.number <= 10) {
			cornerTileName = Std.string(card.number);
		} else {
			var face:String = ["jack", "queen", "king", "ace"][Std.int(card.number-11)];
			cornerTileName = ["J", "Q", "K", "A"][Std.int(card.number-11)];
			s.copyTile(face, Std.int((s.width-s.getTileWidth(face))/2), Std.int((s.height-s.getTileHeight(face))/2), suitColour);
		}
		s.copyTile(suitTileName, pad, s.getTileHeight(cornerTileName) + pad, suitColour);
		s.copyTile(
			suitTileName,
			s.width - s.getTileWidth(suitTileName) - pad,
			s.height - s.getTileHeight(suitTileName) - pad - s.getTileWidth(cornerTileName) - pad,
			suitColour
		);

		s.copyTile(cornerTileName, pad, pad, suitColour);
		s.copyTile(cornerTileName, Std.int(s.width-s.getTileWidth(cornerTileName)-pad), Std.int(s.height-s.getTileHeight(cornerTileName)-pad), suitColour);
		s.x = 50 + 300*(handIndex);
		s.y = 160 + 40*hand.length;
		s.rotation = rndFloat(-5, 5);
		cardSprites.push(s);

		s.alpha = 0;
		s.x -= 200;
		timer(hand.length/10, playSound.bind("assets/audio/ui/menuOpen", "card"));
		tween(s, {alpha: 1, x: s.x+200+rndFloat(-5, 5), rotation: 0}, 0.3, {startDelay: hand.length/30, ease: CUBIC_OUT});

		return card;
	}

	private static function endRound() {
		clearChoices();
		var nextRoundCost:Int = 0;

		for (s in cardSprites)
			tween(s, {alpha: 0, y: s.y+400, rotation: rndFloat(-5, 5)}, 2, {startDelay: rndFloat(0, 1), ease: CUBIC_OUT, onComplete: s.destroy});

		var bestHandIndex:Int = 0;
		var bestHandTotal:Int = 0;
		var isTie:Bool = false;
		for (i in 0...hands.length) {
			var total:Int = totalHand(i);
			if (total >= bestHandTotal && total <= 21) {
				isTie = total == bestHandTotal;
				bestHandIndex = i;
				bestHandTotal = total;
			}
		}

		for (hand in hands)
			while (hand.length > 0)
				grave.push(hand.pop());

		var won:Bool = bestHandIndex == playerControlled;

		if (isTie) {
			//append("Push!");
		}

		if (won) {
			wins++;
			playSound("assets/audio/environment/strip/", "strip");
			//setChannelVolume("strip", 0.8);

			if (opponent == KEMP) {
				function removeTrunks() {
					var trunk1:Int = 2;
					var trunk2:Int = 3;
					if (wins % 2 == 0) {
						trunk1 = 3;
						trunk2 = 2;
					}
					opponentSprites[trunk1].setTile("trunks", KEMP_TRUNKS_COLOURS[wins]);

					var curTrunks:MintSprite = opponentSprites[trunk2];
					tween(curTrunks, {y: curTrunks.y - 50, angle: 20, alpha: 0}, 0.7, {onComplete: function() {
						curTrunks.copyTransform(opponentSprites[trunk1]);
						curTrunks.setTile("trunks", KEMP_TRUNKS_COLOURS[wins]);
					}});
				}

				if (wins == 1) {
					removeTrunks();
				} else if (wins == 2) {
					removeTrunks();
				} else if (wins == 3) {
					removeTrunks();
				} else if (wins == 4) {
					removeTrunks();
				} else if (wins == 5) {
					opponentSprites[3].setTile("speedo");
					tween(opponentSprites[2], {y: opponentSprites[2].y - 50, angle: 20, alpha: 0}, 0.7);
				} else if (wins == 6) {
					var hat:MintSprite = opponentSprites[1];
					tween(hat, {y: hat.y - 50, angle: 20, alpha: 0}, 0.7);
				} else if (wins == 7) {
					tween(opponentSprites[4], {alpha: 1}, 0.7);
					tween(opponentSprites[4], {scaleY: 0.5}, 1, {type: REVERSE, ease: BOUNCE_IN});
					tween(opponentSprites[3], {y: opponentSprites[3].y - 50, angle: 20, alpha: 0}, 0.7);
				} else if (wins == 8) {
					playerTotal.alpha = 0;
					opponentTotal.alpha = 0;
					tween(opponentSprites[4], {alpha: 0}, 0.7);
					tween(opponentSprites[5], {alpha: 1}, 0.7);
					onWin();
					return;
				}
			} else if (opponent == RED) {
				if (wins == 1) {
					tween(opponentSprites[5], {alpha: 0}, 0.7); // Cloak
				} else if (wins == 2) {
					tween(opponentSprites[4], {y: opponentSprites[4].y - 40, angle: 60, alpha: 0}, 0.7); // Undershirt
				} else if (wins == 3) {
					tween(opponentSprites[3], {y: opponentSprites[3].y - 40, angle: 60, alpha: 0}, 0.7); // Shorts
				} else if (wins == 4) {
					playerTotal.alpha = 0;
					opponentTotal.alpha = 0;
					tween(opponentSprites[2], {y: opponentSprites[2].y + 60, angle: 60, alpha: 0}, 0.7); //Panties
					onWin();
					return;
				}
			} else if (opponent == ROXELLE) {
				if (wins == 1) {
					tween(opponentSprites[7], {y: opponentSprites[7].y - 40, angle: 60, alpha: 0}, 0.7); //Belt
				} else if (wins == 2) {
					tween(opponentSprites[6], {y: opponentSprites[6].y - 40, angle: 60, alpha: 0}, 0.7); //Dress
					tween(opponentSprites[3], {alpha: 1}, 0.7); //Tiddy
					tween(opponentSprites[3], {scaleX: 0.7, scaleY: 0.8}, 1.2, {type: REVERSE, ease: BOUNCE_IN});
				} else if (wins == 3) {
					tween(opponentSprites[4], {y: opponentSprites[4].y - 40, angle: 60, alpha: 0}, 0.7); //Barette
				} else if (wins == 4) {
					tween(opponentSprites[5], {y: opponentSprites[3].y + 40, alpha: 0}, 0.7); //Necklace
				} else if (wins == 5) {
					playerTotal.alpha = 0;
					opponentTotal.alpha = 0;
					tween(opponentSprites[2], {y: opponentSprites[2].y + 60, alpha: 0}, 0.7); //Panties
					tween(opponentSprites[1], {alpha: 1}, 0.7); //Cock
					tween(opponentSprites[1], {scaleY: 0.5, scaleX: 0.8}, 1.2, {type: REVERSE, ease: BOUNCE_IN});
					onWin();
					return;
				}
			} else if (opponent == SOM) {
					var removed:Int = pickOne(somClothes);
					while (removed != 7 && removed != 6 && removed != 2 && somClothes.length != 0)
						removed = pickOne(somClothes);
					somClothes.remove(removed);

				if (wins == 1) {
					tween(opponentSprites[removed], {y: opponentSprites[removed].y - 40, angle: 60, alpha: 0}, 0.7); //Sweater, jeans, or glasses
					tween(opponentSprites[1], {alpha: 0.05}, 0.7); //Blush
				} else if (wins == 2) {
					tween(opponentSprites[removed], {y: opponentSprites[removed].y - 40, angle: 60, alpha: 0}, 0.7); //Sweater, jeans, or glasses
					tween(opponentSprites[1], {alpha: 0.1}, 0.7); //Blush
				} else if (wins == 3) {
					tween(opponentSprites[removed], {y: opponentSprites[removed].y - 40, angle: 60, alpha: 0}, 0.7); //Sweater, jeans, or glasses
					tween(opponentSprites[1], {alpha: 0.15}, 0.7); //Blush
				} else if (wins == 4) {
					tween(opponentSprites[3], {y: opponentSprites[3].y + 40, alpha: 0}, 0.7); //Bra
					tween(opponentSprites[1], {alpha: 0.2}, 0.7); //Blush
				} else if (wins == 5) {
					playerTotal.alpha = 0;
					opponentTotal.alpha = 0;
					tween(opponentSprites[4], {alpha: 1}, 0.7); //Soft
					tween(opponentSprites[5], {y: opponentSprites[5].y + 40, alpha: 0}, 0.7); //Undies
					tween(opponentSprites[4], {scaleY: 0.6, scaleX: 0.8}, 1.2, {type: REVERSE, ease: BOUNCE_IN, onComplete: function() {
							tween(opponentSprites[4], {alpha: 0}, 0.7, {startDelay: 2}); //Soft
							tween(opponentSprites[8], {alpha: 1}, 0.7, {startDelay: 2}); //Hard
							tween(opponentSprites[8], {scaleY: 0.3, scaleX: 0.5}, 2, {type: REVERSE, ease: ELASTIC_IN, startDelay: 2});
						}
					});
					tween(opponentSprites[1], {alpha: 0.35}, 0.7); //Blush
					onWin();
					return;
				}
			} else if (opponent == SEPTRICA) {
				if (wins == 1) {
					tween(opponentSprites[5], {alpha: 0}, 2); //Silhouette
					opponentSprites[0].alpha = 1;
					opponentSprites[1].alpha = 1;
					opponentSprites[2].alpha = 1;
					opponentSprites[4].alpha = 1;
				} else if (wins == 2) {
					tween(opponentSprites[1], {y: opponentSprites[6].y - 40, angle: 60, alpha: 0}, 0.7); //Glove
				} else if (wins == 3) {
					tween(opponentSprites[2], {y: opponentSprites[4].y - 40, angle: 60, alpha: 0}, 0.7); //Hat
					tween(opponentSprites[3], {alpha: 1}, 0.1);
				} else if (wins == 4) {
					tween(opponentSprites[4], {y: opponentSprites[3].y + 40, alpha: 0}, 0.7); //Shades
				} else if (wins == 5) {
					playerTotal.alpha = 0;
					opponentTotal.alpha = 0;
					opponentSprites[6].scaleX = 0;
					tween(opponentSprites[0], {alpha: 0, scaleX: 0}, 0.8, {ease: QUART_IN});
					tween(opponentSprites[3], {alpha: 0, scaleX: 0}, 0.8, {ease: QUART_IN, onComplete: playSound.bind("audio/environment/mintAppears")});

					tween(opponentSprites[6], {alpha: 1, scaleX: 1}, 1, {ease: ELASTIC_OUT, startDelay: 0.8});

					for (sprite in opponentSprites) {
						sprite.onHover = null;
					}
					opponentSprites[6].onHover = showToolTipOnCursor.bind("<!img:kink/Art.png>  Artist: Snofu", "<!b>NAME:<!b> Septrica Mauze\n<!b>SPECIES:<!b> Gecko\n<!b>DIFFICULTY:<!b> Intentionally soft\n<!b>PERSONAL MOTTO:<!b> \"Pray for a cuter future.\"");
					onWin();
					return;
				}
			}

		} else {
			losses++;
			nextRoundCost = 1;
		}

		if (nextRoundCost != 0) {
			if (opponent == SEPTRICA) {
				addChoice("<!20px>    Next round?    <!20px>", startRound.bind());
			} else {
				addChoice("<!20px>    Next round.    <!20px>", startRound.bind(), {cost: [(
					opponent == KEMP ? "Sweetgrass Leaf" : 
					opponent == ROXELLE ? "Glowberry" :
					opponent == RED ? "Glowberry" : "Broken Cell"), nextRoundCost]});
			}
		} else {
			addChoice("<!20px>    Next round.    <!20px>", startRound.bind());
		}
		if (opponent != SEPTRICA) {
			addChoice("<!20px>    Quit.   <!20px>", function() {
				endGame();
				HyperLand.explore("cardhub");
			});
		}
	}

	public static function endGame() {
		enablePause();
		for (s in opponentSprites) s.destroy();
		playerTotal.destroy();
		opponentTotal.destroy();
	}
}
