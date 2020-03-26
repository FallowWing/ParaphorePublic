package engine;

class Matrix
{
	public var data:Array<Float> = [];

	// a,b,c
	// d,e,f
	// g,h,i

	public function new(a:Float=1, b:Float=0, c:Float=0, d:Float=0, e:Float=1, f:Float=0, g:Float=0, h:Float=0, i:Float=1) {
		data[0] = a;
		data[1] = b;
		data[2] = c;
		data[3] = d;
		data[4] = e;
		data[5] = f;
		data[6] = g;
		data[7] = h;
		data[8] = i;
	}

	public function identity():Void {
		data = [
			1,0,0,
			0,1,0,
			0,0,1
		];
	}

	public function translate(x:Float, y:Float):Void {
		var other:Matrix = new Matrix(
			1, 0, 0,
			0, 1, 0,
			x, y, 1
		);

		multiply(other);
	}

	public function rotate(degrees:Float):Void {
		var s:Float = Math.sin(degrees*Math.PI/180);
		var c:Float = Math.cos(degrees*Math.PI/180);
		var other:Matrix = new Matrix(
			c, -s, 0,
			s,  c, 0,
			0,  0, 1
		);

		multiply(other);
	}

	public function scale(x:Float, y:Float):Void {
		var other:Matrix = new Matrix(
			x, 0, 0,
			0, y, 0,
			0, 0, 1
		);

		multiply(other);
	}

	public function project(w:Float, h:Float):Void {
		var other:Matrix = new Matrix(
			2/w, 0, 0,
			0, -2/h, 0,
			-1, 1, 1
		);

		multiply(other);
	}

	public function multiply(other:Matrix):Void {
		var m:Array<Float> = [0, 0, 0, 0, 0, 0, 0, 0, 0];

		for (r in 0...3)
			for (c in 0...3)
				for (i in 0...3)
					m[r+c*3] += data[r+i*3] * other.data[i+c*3];

		data = m;
	}

	public function zero():Void {
		data = [
			0,0,0,
			0,0,0,
			0,0,0
		];
	}

	public function transformPoint(point:Point, newPoint:Point):Void {
		var x:Float = point.x;
		var y:Float = point.y;

		// newPoint.x = data[0]*x + data[1]*y + data[2]*1;
		// newPoint.y = data[3]*x + data[4]*y + data[5]*1;
		// a.m02 * x + a.m12 * y + a.m22 * 1);

		newPoint.x = data[0]*x + data[3]*y + data[6]*1;
		newPoint.y = data[1]*x + data[4]*y + data[7]*1;
	}

	public function invert():Void {
		// computes the inverse of a matrix m
		var det:Float = data[0] * (data[4] * data[8] - data[5] * data[7]) -
			data[3] * (data[1] * data[8] - data[7] * data[2]) +
			data[6] * (data[1] * data[5] - data[4] * data[2]);

		var invdet:Float = 1 / det;

		var newData:Array<Float> = []; // inverse of matrix m
		newData[0] = (data[4] * data[8] - data[5] * data[7]) * invdet;
		newData[3] = (data[6] * data[5] - data[3] * data[8]) * invdet;
		newData[6] = (data[3] * data[7] - data[6] * data[4]) * invdet;
		newData[1] = (data[7] * data[2] - data[1] * data[8]) * invdet;
		newData[4] = (data[0] * data[8] - data[6] * data[2]) * invdet;
		newData[7] = (data[1] * data[6] - data[0] * data[7]) * invdet;
		newData[2] = (data[1] * data[5] - data[2] * data[4]) * invdet;
		newData[5] = (data[2] * data[3] - data[0] * data[5]) * invdet;
		newData[8] = (data[0] * data[4] - data[1] * data[3]) * invdet;
		data = newData;
	}

	public function clone():Matrix {
		var m:Matrix = new Matrix();
		m.data = data.copy();
		return m;
	}

	public function getArray():Array<Float> {
		return data;
	}

	public function toString():String {
		return data.toString();
	}
}
