package story;

class Caves
{
	public static inline var GROUND:Int = 0;
	public static inline var WALL_0:Int = 1; // Must be contiguous. https://cms-assets.tutsplus.com/uploads/users/90/posts/25673/image/BLUE-SNAKE-FIXED.png
	public static inline var WALL_1:Int = 2;
	public static inline var WALL_2:Int = 3;
	public static inline var WALL_3:Int = 4;
	public static inline var WALL_4:Int = 5;
	public static inline var WALL_5:Int = 6;
	public static inline var WALL_6:Int = 7;
	public static inline var WALL_7:Int = 8;
	public static inline var WALL_8:Int = 9;
	public static inline var WALL_9:Int = 10;
	public static inline var WALL_10:Int = 11;
	public static inline var WALL_11:Int = 12;
	public static inline var WALL_12:Int = 13;
	public static inline var WALL_13:Int = 14;
	public static inline var WALL_14:Int = 15;
	public static inline var WALL_15:Int = 16;
	public static inline var ITEM_1:Int = 17;
	public static inline var ITEM_2:Int = 18;
	public static inline var ITEM_3:Int = 19;
	public static inline var ITEM_4:Int = 20;
	public static inline var SPAWN:Int = 21;
	public static inline var EXIT:Int = 22;
	public static inline var GRYPHON_1:Int = 23;
	public static inline var GRYPHON_2:Int = 24;
	public static inline var GRYPHON_3:Int = 25;
	public static inline var GRYPHON_4:Int = 26;
	public static inline var GRYPHON_5:Int = 27;
	public static inline var GRYPHON_6:Int = 28;
	public static inline var GRYPHON_7:Int = 29;
	public static inline var GRYPHON_8:Int = 30;
	public static inline var GRYPHON_9:Int = 31;
	public static inline var GRYPHON_10:Int = 32;
	public static inline var GRYPHON_11:Int = 33;
	public static inline var GRYPHON_12:Int = 34;
	public static inline var GRYPHON_13:Int = 35;
	public static inline var GRYPHON_14:Int = 36;
	public static inline var GRYPHON_15:Int = 37;
	public static inline var GRYPHON_16:Int = 38;
	public static inline var GRYPHON_17:Int = 39;
	public static inline var GRYPHON_18:Int = 40;
	public static inline var GRYPHON_19:Int = 41;
	public static inline var GRYPHON_20:Int = 42;
	public static inline var GRYPHON_21:Int = 43;
	public static inline var GRYPHON_22:Int = 44;
	public static inline var GRYPHON_23:Int = 45;
	public static inline var GRYPHON_24:Int = 46;
	public static inline var GRYPHON_25:Int = 47;
	public static inline var TRIGGER:Int = 48;
	public static inline var KEMP_1:Int = 49;
	public static inline var KEMP_2:Int = 50;
	public static var TILES:Array<Int> = [
		GROUND, WALL_0, WALL_1, WALL_2, WALL_3, WALL_4, WALL_5, WALL_6, WALL_7, WALL_8, WALL_9, WALL_10,
		WALL_11, WALL_12, WALL_13, WALL_14, WALL_15, ITEM_1, ITEM_2, ITEM_3, ITEM_4, SPAWN, EXIT, GRYPHON_1,
		GRYPHON_2, GRYPHON_3, GRYPHON_4, GRYPHON_5, GRYPHON_6, GRYPHON_7, GRYPHON_8, GRYPHON_9, GRYPHON_10,
		GRYPHON_11, GRYPHON_12, GRYPHON_13, GRYPHON_14, GRYPHON_15, GRYPHON_16, GRYPHON_17, GRYPHON_18,
		GRYPHON_19, GRYPHON_20, GRYPHON_21, GRYPHON_22, GRYPHON_23, GRYPHON_24, GRYPHON_25, TRIGGER,
		KEMP_1, KEMP_2
	];
	public static var WALLS:Array<Int> = [
		WALL_0, WALL_1, WALL_2, WALL_3, WALL_4, WALL_5, WALL_6, WALL_7, WALL_8, WALL_9, WALL_10, 
		WALL_10, WALL_11, WALL_12, WALL_13, WALL_14, WALL_15
	];
	public static var COLLECTABLES:Array<Int> = [ITEM_1, ITEM_2, ITEM_3, ITEM_4, SPAWN, EXIT, TRIGGER, GRYPHON_21, GRYPHON_22, GRYPHON_23, GRYPHON_24, GRYPHON_25, KEMP_1, KEMP_2];

	public static inline var MAX_POWER:Int = 200;
	public static var POWER_VISION_MAP:Map<Int, Int> = [
		100 => 9,
		90 => 9,
		80 => 8,
		70 => 7,
		60 => 6,
		50 => 5,
		40 => 4,
		30 => 3,
		20 => 2,
		10 => 0,
		0 => 0
	];

	public static inline var BG_COLOUR:Int = 0x101010;

	public static var curX:Int;
	public static var curY:Int;
	public static var possibleSpawns:Array<Point>;
	public static var spawnPoint:Point;
	public static var power:Int;
	public static var tilemap:Tilemap;

	private static var collectCallback:Int->Bool;
	private static var deathCallback:Void->Void;

	private static var player:MintSprite;
	private static var bg:MintSprite;
	private static var floor:Array<Array<Int>> = [];

	public static function caveGame(tmxPath:String, collectCallback:Int->Bool, deathCallback:Void->Void):Void {
		Caves.collectCallback = collectCallback;
		Caves.deathCallback = deathCallback;

		clear();
		power = MAX_POWER;
		floor = [];

		var fileData:String = pathToText(tmxPath);
		fileData = fileData.split("<data encoding=\"csv\">")[1];
		fileData = fileData.split("</data>")[0];
		fileData = fileData.replace("\r", "");

		var rows:Array<String> = fileData.split("\n");
		for (i in 0...rows.length) rows[i] = rows[i].replace("\n", "");
		while (rows.remove("")) {}

		for (row in rows) {
			if (row == "") continue;
			var chars:Array<String> = row.split(",");
			var intRow:Array<Int> = [];
			for (ch in chars) {
				var c:Int = Std.parseInt(ch);
				c--;
				if (c < 0) c = 0;
				intRow.push(c);
			}
			intRow.pop(); // Trailing comma
			floor.push(intRow);
		}

		bg = addRectSprite(GAME_WIDTH, Main.choiceBox.y-Main.topBar.height, BG_COLOUR);
		bg.y = Main.topBar.height;

		tilemap = tilemapCreate("spritesheet/caveTilemap.png", 16, 16, floor[0].length, floor.length);
		prepareSprite(tilemap.sprite);
		tilemap.autotileStart = Caves.WALL_0;
		tilemap.autotileEnd = Caves.WALL_15;
		tilemap.sprite.x = bg.x + bg.width/2 - tilemap.sprite.width/2;
		tilemap.sprite.y = bg.y + bg.height/2 - tilemap.sprite.height/2;
		autotile();

		player = addSprite("spritesheet/cavePlayer.png");
		player.animFrameRate = 16;
		player.onAnimationFinished = function() {player.playing = false;}
		player.playAnim("downWalk");

		possibleSpawns = [];
		for (y in 0...tilemap.tilesHigh) {
			for (x in 0...tilemap.tilesWide) {
				if (getTile(x, y) == SPAWN) possibleSpawns.push(new Point(x, y));
			}
		}
		spawnPoint = pickOne(possibleSpawns);
		curX = Std.int(spawnPoint.x);
		curY = Std.int(spawnPoint.y);

		addChoice("Left.", moveAndRefresh.bind("left"));
		addChoice("Up.", moveAndRefresh.bind("up"));
		addChoice("Down.", moveAndRefresh.bind("down"));
		addChoice("Right.", moveAndRefresh.bind("right"));
		if (tmxPath != "Kemp Cavern.tmx" && tmxPath != "Gryphon Cavern.tmx") addChoice("Give up.", function() { deathCallback(); });
		if (Main.debug) addChoice("Max light", function() {power = MAX_POWER;});
		if (Main.debug) addChoice("Get flower", function() {collectCallback(ITEM_4);});

		disableCursorKeys();
		Engine.bindKey(LEFT, moveAndRefresh.bind("left"), PRESSED, 0.1);
		Engine.bindKey(UP, moveAndRefresh.bind("up"), PRESSED, 0.1);
		Engine.bindKey(DOWN, moveAndRefresh.bind("down"), PRESSED, 0.1);
		Engine.bindKey(RIGHT, moveAndRefresh.bind("right"), PRESSED, 0.1);

		Engine.bindKey(A, moveAndRefresh.bind("left"), PRESSED, 0.1);
		Engine.bindKey(W, moveAndRefresh.bind("up"), PRESSED, 0.1);
		Engine.bindKey(S, moveAndRefresh.bind("down"), PRESSED, 0.1);
		Engine.bindKey(D, moveAndRefresh.bind("right"), PRESSED, 0.1);

		moveAndRefresh("down");

		if (GameData.data.cavesFirstTime) {
			GameData.data.cavesFirstTime = false;

			var hint:MintSprite = new MintSprite("img/effect/wasdHint");
			hint.layer = Main.TOOLTIP_TEXT_LAYER;
			hint.x = Engine.width/2 - hint.width/2;
			hint.y = Engine.height * 0.15;

			tween(hint, {alpha: 0}, 3, {startDelay: 3, onComplete: hint.destroy});
		}
	}

	public static function autotile():Void {
		autotileRaw(floor, tilemap.autotileStart, tilemap.autotileEnd);
	}

	public static function redraw():Void {
		var visionRadius:Int = POWER_VISION_MAP.get(100);
		for (key in POWER_VISION_MAP.keys())
			if (power/MAX_POWER*100 <= key)
				if (visionRadius > POWER_VISION_MAP.get(key))
					visionRadius = POWER_VISION_MAP.get(key);

		tilemap.clear(0);
		var tilePoint:Point = new Point();
		for (y in 0...tilemap.tilesHigh) {
			for (x in 0...tilemap.tilesWide) {
				tilePoint.setTo(x, y);
				var tileDist:Float = Point.rawDistance(tilePoint.x, tilePoint.y, curX, curY);
				var tile:Int = getTile(x, y);

				if (tileDist < visionRadius) {
					var fadeStartsAtPerc:Float = 0.75;
					var tint:Float = -1;
					if (tileDist/visionRadius > fadeStartsAtPerc) {
						var percToEdge:Float = (tileDist - visionRadius*fadeStartsAtPerc)/(visionRadius - visionRadius*fadeStartsAtPerc);
						tint = (Math.round(255*percToEdge) << 24) | BG_COLOUR;
					}

					tilemap.setTile(x, y, tile, Std.int(tint));
				}
			}
		}
	}

	public static function moveAndRefresh(dir:String):Void {
		var dirNum:Int = 
			dir == "left" ? 0 :
			dir == "right" ? 1 :
			dir == "up" ? 2 :
			dir == "down" ? 3 : -1;

		var allowedDirs:Array<Bool> = [];
		allowedDirs.push(!isWall(getTile(curX-1, curY)));
		allowedDirs.push(!isWall(getTile(curX+1, curY)));
		allowedDirs.push(!isWall(getTile(curX, curY-1)));
		allowedDirs.push(!isWall(getTile(curX, curY+1)));

		if (!allowedDirs[dirNum]) return;

		/// Player motion
		playSound("assets/audio/environment/footstep");

		if (dir == "left") {
			player.scaleX = 1;
			curX--;
			player.playAnim("leftWalk");
		} else if (dir == "right") {
			player.scaleX = -1;
			curX++;
			player.playAnim("leftWalk");
		} else if (dir == "up") {
			curY--;
			player.playAnim("upWalk");
		} else if (dir == "down") {
			curY++;
			player.playAnim("downWalk");
		}

		var newX:Float = curX*tilemap.tileWidth + tilemap.sprite.x - (player.width - tilemap.tileWidth)/2;
		var newY:Float = curY*tilemap.tileHeight + tilemap.sprite.y - (player.height - tilemap.tileHeight)/2;
		if (Math.sqrt(Math.pow(newX-player.x, 2)+Math.pow(newY-player.y, 2)) > 100) {
			player.x = newX;
			player.y = newY;
		} else {
			tween(player, {x: newX, y: newY}, 0.10);
		}

		power--;
		if (power == Math.round(MAX_POWER*0.77)) msg("<!b>75% Power<!b>", true);
		if (power == Math.round(MAX_POWER*0.54)) msg("<!b>50% Power<!b>", true);
		if (power == Math.round(MAX_POWER*0.32)) msg("<!b>25% Power<!b>", true);
		if (power == Math.round(MAX_POWER*0.10)) msg("<!b>Your torch has been  <!b><!img:kink/Snuff.png><!b> 'd.<!b>", true);
		if (power == 0) {
			deathCallback();
			if (!tilemap.sprite.exists) return;
		}

		/// Tile checks
		var t:Int = getTile(curX, curY);
		if (COLLECTABLES.contains(t)) {
			var destroy:Bool = collectCallback(t);
			if (!tilemap.sprite.exists) return;
			if (destroy) setTile(curX, curY, GROUND);
		}

		/// Update map
		redraw();
	}

	public static function setTile(x:Int, y:Int, tileIndex:Int):Void {
		floor[y][x] = tileIndex;
	}

	public static function getTile(x:Int, y:Int):Int {
		if (x < 0 || y < 0 || y >= floor.length || x >= floor[y].length) return 0;
		return floor[y][x];
	}

	public static function isWall(tileIndex:Int):Bool {
		return tileIndex >= WALL_0 && tileIndex <= WALL_15;
	}

	public static function replace(before:Int, after:Int):Void {
		for (y in 0...tilemap.tilesHigh)
			for (x in 0...tilemap.tilesWide)
				if (getTile(x, y) == before)
					setTile(x, y, after);

		redraw();
	}

	public static function movePlayer(x:Int, y:Int):Void {
		player.cancelTweens();
		curX = x;
		curY = y-1;
		moveAndRefresh("down");
	}

	public static function destroyCaves():Void {
		tilemap.destroy();
		player.destroy();

		Engine.unBindKey(LEFT);
		Engine.unBindKey(UP);
		Engine.unBindKey(DOWN);
		Engine.unBindKey(RIGHT);

		Engine.unBindKey(A);
		Engine.unBindKey(W);
		Engine.unBindKey(S);
		Engine.unBindKey(D);
		enableCursorKeys();
	}
}
