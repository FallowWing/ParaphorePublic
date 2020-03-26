package story;

class Lilac
{
	public static inline var TILE_SIZE:Int = 50;

	public static var tilesWide:Int;
	public static var tilesHigh:Int;

	public static var onWin:Void->Void;
	public static var onLose:Void->Void;

	public static var grid:MintSprite;
	public static var water:MintSprite;
	public static var net:MintSprite;

	public static var netMoving:Bool = false;
	public static var netPos:Point = new Point();

	public static function startGame(onWin:Void->Void, onLose:Void->Void) {
		Lilac.onWin = onWin;
		Lilac.onLose = onLose;

		clear();

		water = new MintSprite(); //This has to go up here so I'll layer below the grid

		grid = new MintSprite();
		prepareSprite(grid);
		grid.setupCanvas("minigame/lilac", 400, 400);
		grid.x = Engine.width/2 - grid.width/2;
		grid.y = Engine.height/2 - grid.height/2;

		tilesWide = Std.int(grid.width/TILE_SIZE);
		tilesHigh = Std.int(grid.height/TILE_SIZE);

		for (y in 0...tilesHigh)
			for (x in 0...tilesWide)
				grid.copyTile("grid", x*TILE_SIZE, y*TILE_SIZE);

		prepareSprite(water);
		water.setupCanvas("minigame/lilac", grid.width, grid.height);
		water.x = grid.x;
		water.y = grid.y;

		for (y in 0...Std.int(water.width/TILE_SIZE))
			for (x in 0...Std.int(water.height/TILE_SIZE))
				water.copyTile("water", x*TILE_SIZE, y*TILE_SIZE);

		net = new MintSprite();
		prepareSprite(net);
		net.setupCanvas("minigame/lilac");
		net.setTile("net");
		moveNet(Std.int(tilesWide/2), Std.int(tilesHigh/2), true);

		addChoice("Left.", pushNet.bind("left"));
		addChoice("Up.", pushNet.bind("up"));
		addChoice("Down.", pushNet.bind("down"));
		addChoice("Right.", pushNet.bind("right"));
		addChoice("Give up.", endGame.bind(false));

		disableCursorKeys();
		Engine.bindKey(LEFT, pushNet.bind("left"), PRESSED, 0.1);
		Engine.bindKey(UP, pushNet.bind("up"), PRESSED, 0.1);
		Engine.bindKey(DOWN, pushNet.bind("down"), PRESSED, 0.1);
		Engine.bindKey(RIGHT, pushNet.bind("right"), PRESSED, 0.1);

		Engine.bindKey(A, pushNet.bind("left"), PRESSED, 0.1);
		Engine.bindKey(W, pushNet.bind("up"), PRESSED, 0.1);
		Engine.bindKey(S, pushNet.bind("down"), PRESSED, 0.1);
		Engine.bindKey(D, pushNet.bind("right"), PRESSED, 0.1);
	}

	public static function pushNet(dir:String):Void {
		if (netMoving) return;

		var newNetPos:Point = new Point();
		newNetPos.setTo(netPos.x, netPos.y);

		if (dir == "left") newNetPos.x -= 1;
		if (dir == "right") newNetPos.x += 1;
		if (dir == "up") newNetPos.y -= 1;
		if (dir == "down") newNetPos.y += 1;

		if (newNetPos.x < 0 || newNetPos.x > tilesWide-1 || newNetPos.y < 0 || newNetPos.y > tilesHigh-1) return;

		moveNet(Std.int(newNetPos.x), Std.int(newNetPos.y));
	}

	public static function moveNet(x:Int, y:Int, instant:Bool=false):Void {
		netPos.setTo(x, y);

		var newX:Float = grid.x + x*TILE_SIZE;
		var newY:Float = grid.y + y*TILE_SIZE;

		if (instant) {
			net.x = newX;
			net.y = newY;
		} else {
			netMoving = true;
			tween(net, {x: newX, y: newY}, 0.5, {onComplete: function() {
				netMoving = false;
			}});
		}
	}

	public static function endGame(win:Bool):Void {
		Engine.unBindKey(LEFT);
		Engine.unBindKey(UP);
		Engine.unBindKey(DOWN);
		Engine.unBindKey(RIGHT);

		Engine.unBindKey(A);
		Engine.unBindKey(W);
		Engine.unBindKey(S);
		Engine.unBindKey(D);
		enableCursorKeys();

		if (win) onWin() else onLose();
	}
}
