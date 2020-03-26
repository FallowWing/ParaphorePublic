package;

class Emitters
{
	private static var emitters:Array<Emitter> = [];

	public static function create(assetId:String):Emitter {
		var s:MintSprite = new MintSprite();
		s.setupCanvas(assetId, Engine.width, Engine.height);

		var e:Emitter = {
			rngPool: Random.getPool(),
			particles: [],
			sprite: s,
			position: {minX: 0, minY: 0, maxX: 0, maxY: 0},
			angle: {min: 0, max: 0},
			speed: {min: 1, max: 5},
			lifeSpan: {min: 3, max: 3}
		};

		Random.seed(Std.int(Main.getTimer()), e.rngPool);
		emitters.push(e);

		return e;
	}

	public static function emit(e:Emitter, particleName:String):Void {
		var angle:Float = Random.float(e.angle.min, e.angle.max);
		var speed:Float = Random.float(e.speed.min, e.speed.max);

		var p:Particle = {
			tileName: particleName,
			x: Random.float(e.position.minX, e.position.maxX, e.rngPool),
			y: Random.float(e.position.minY, e.position.maxY, e.rngPool),
			age: 0,
			lifeSpan: Random.float(e.lifeSpan.min, e.lifeSpan.max, e.rngPool),
			veloX: Math.cos(angle*Math.PI/180)*speed,
			veloY: Math.sin(-angle*Math.PI/180)*speed
		}

		e.particles.push(p);
	}

	public static function destroy(e:Emitter):Void {
		e.sprite.destroy();
		emitters.remove(e);
	}

	private inline static function lerp(perc:Float, min:Float, max:Float):Float {
		return min + perc * (max - min);
	}

	public static function update(elapsed:Float=0):Void {
		var velo:Point = new Point();
		var toRemove:Array<Particle> = [];

		for (e in emitters) {
			// e.sprite.lock();
			e.sprite.fillPixels(0, 0, Engine.width, Engine.height, 0x00000000);
			while (toRemove.length != 0) toRemove.pop();

			for (p in e.particles) {
				p.age += elapsed;

				if (p.age > p.lifeSpan) {
					toRemove.push(p);
					continue;
				}

				p.x += p.veloX;
				p.y += p.veloY;
				e.sprite.copyTile(p.tileName, Std.int(p.x), Std.int(p.y));
			}

			for (p in toRemove) e.particles.remove(p);
			// e.sprite.unlock();
		}
	}
}

typedef Emitter = {
	rngPool:Int,
	sprite:MintSprite,
	position:PointBound,
	angle:Bound,
	speed:Bound,
	lifeSpan:Bound,
	particles:Array<Particle>
}

typedef Particle = {
	tileName:String,
	x:Float,
	y:Float,
	age:Float,
	lifeSpan:Float,
	veloX: Float,
	veloY: Float
}

typedef PointBound = {
	minX:Float,
	minY:Float,
	maxX:Float,
	maxY:Float,
}

typedef RangeBound = {
	startMin:Float,
	endMin:Float,
	startMax:Float,
	endMax:Float
}

typedef Bound = {
	min:Float,
	max:Float
}

typedef Range = {
	start:Float,
	end:Float
}
