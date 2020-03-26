package ;

class Tilemaps
{
	public static var tilemaps:Array<Tilemap> = [];

	public static function create(assetId:String, tileWidth:Int, tileHeight:Int, tilesWide:Int, tilesHigh:Int):Tilemap {
		var sprite:MintSprite = new MintSprite();

		sprite = new MintSprite();
		sprite.setupCanvas(assetId, tileWidth*tilesWide, tileHeight*tilesHigh);

		var data:Array<Array<Int>> = [];
		for (y in 0...tilesWide) {
			var dataRow:Array<Int> = [];
			for (x in 0...tilesHigh) dataRow.push(0);
			data.push(dataRow);
		}

		var tilemap:Tilemap = {
			sprite: sprite,
			data: data,
			tileWidth: tileWidth,
			tileHeight: tileHeight,
			tilesWide: tilesWide,
			tilesHigh: tilesHigh,
			autotileStart: -1,
			autotileEnd: -1,
		};

		tilemap.destroy = destroy.bind(tilemap);
		tilemap.setTile = setTile.bind(tilemap, _, _, _, _);
		tilemap.getTile = getTile.bind(tilemap);
		tilemap.autotile = autotile.bind(tilemap);
		tilemap.clear = clear.bind(tilemap, _);

		tilemaps.push(tilemap);
		return tilemap;
	}

	public static function clear(tilemap:Tilemap, ?colour:Int):Void {
		if (colour == null) colour = 0x00000000;
		tilemap.sprite.fillPixels(0, 0, Std.int(tilemap.sprite.width), Std.int(tilemap.sprite.height), colour);
	}

	public static function update(elapsed:Float=0):Void {
	}

	public static function autotile(tilemap:Tilemap):Void {
		autotileRaw(tilemap.data, tilemap.autotileStart, tilemap.autotileEnd);
		setAll(tilemap);
	}

	public static function autotileRaw(array:Array<Array<Int>>, autotileStart:Int, autotileEnd:Int):Void {
		function isWall(tile:Int):Bool {
			return tile >= autotileStart && tile <= autotileEnd;
		}

		function gTile(x:Int, y:Int):Int {
			if (x < 0 || y < 0 || x >= array[0].length || y >= array.length) return 0;
			return array[y][x];
		}

		for (y in 0...array.length) {
			for (x in 0...array[0].length) {
				var tile:Int = array[y][x];

				if (isWall(tile)) {
					var top:Bool = isWall(gTile(x, y-1));
					var bottom:Bool = isWall(gTile(x, y+1));
					var left:Bool = isWall(gTile(x-1, y));
					var right:Bool = isWall(gTile(x+1, y));

					tile = autotileStart;
					if (top) tile += 1;
					if (left) tile += 2;
					if (right) tile += 4;
					if (bottom) tile += 8;
				}

				array[y][x] = tile;
			}
		}
	}

	public static function setAll(tilemap:Tilemap):Void {
		for (y in 0...tilemap.tilesHigh)
			for (x in 0...tilemap.tilesWide)
				tilemap.sprite.copyTile(tilemap.data[y][x] < 10 ? "tile_0"+tilemap.data[y][x] : "tile_"+tilemap.data[y][x], x*tilemap.tileWidth, y*tilemap.tileHeight);
	}

	public static function setTile(tilemap:Tilemap, x:Int, y:Int, tile:Int, ?tint:Int):Void {
		if (x < 0 || y < 0 || x >= tilemap.tilesWide || y >= tilemap.tilesHigh) return;
		tilemap.data[y][x] = tile;
		tilemap.sprite.copyTile(tile < 10 ? "tile_0"+tile : "tile_"+tile, x*tilemap.tileWidth, y*tilemap.tileHeight, tint);
	}

	public static function getTile(tilemap:Tilemap, x:Int, y:Int):Int {
		if (x < 0 || y < 0 || x >= tilemap.tilesWide || y >= tilemap.tilesHigh) return 0;
		return tilemap.data[y][x];
	}

	public static function destroy(tilemap:Tilemap):Void {
		tilemaps.remove(tilemap);
		tilemap.sprite.destroy();
	}
}

typedef Tilemap = {
	sprite:MintSprite,
	data:Array<Array<Int>>,
	tileWidth:Int,
	tileHeight:Int,
	tilesWide:Int,
	tilesHigh:Int,
	autotileStart:Int,
	autotileEnd:Int,

	?destroy:Void->Void,
	?setTile:Int->Int->Int->?Int->Void,
	?getTile:Int->Int->Int,
	?autotile:Void->Void,
	?clear:Int->Void
}
