package engine;

class Rect
{
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;

	public function new(x:Float=0, y:Float=0, width:Float=0, height:Float=0) {
		setTo(x, y, width, height);
	}

//@cleanup Change this to set()
	public function setTo(x:Float=0, y:Float=0, width:Float=0, height:Float=0):Void {
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}

	public function containsPoint(point:Point):Bool {
		return x <= point.x && point.x <= x + width && y <= point.y && point.y <= y + height;
	}

	public function copyFrom(r:Rect):Void {
		setTo(r.x, r.y, r.width, r.height);
	}

	public function toString():String {
		return '{$x, $y $width x $height}';
	}
}
