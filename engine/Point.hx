package engine;

class Point
{
	public var x:Float;
	public var y:Float;

	public function new(xPos:Float = 0, yPos:Float = 0) {
		setTo(xPos, yPos);
	}

	public function setTo(xPos:Float = 0, yPos:Float = 0):Void {
		x = xPos;
		y = yPos;
	}

	public static function distance(p1:Point, p2:Point):Float {
		return rawDistance(p1.x, p1.y, p2.x, p2.y);
	}

	public static function rawDistance(x1:Float, y1:Float, x2:Float, y2:Float):Float {
		return Math.sqrt(Math.pow(x2-x1, 2)+Math.pow(y2-y1, 2));
	}

	public function equals(otherPoint:Point):Bool {
		return this.x == otherPoint.x && this.y == otherPoint.y;
	}

	public function toString():String {
		return 'Point: {$x, $y}';
	}
}
