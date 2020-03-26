package;

class Sliders
{
	public static var sliders:Array<Slider> = [];

	public static function create(width:Float, startPercent:Float=0, onUpdate:Void->Void=null):Slider {
		var bar:MintSprite = new MintSprite();
		var handle:MintSprite = new MintSprite();
		var label:MintText = new MintText();

		bar.layer = Main.ADD_SPRITE_LAYER;
		handle.layer = Main.ADD_SPRITE_LAYER;
		label.layer = Main.ADD_SPRITE_LAYER;

		var slider:Slider = {
			bar: bar,
			handle: handle,
			label: label,
			width: width,
			onUpdate: onUpdate,
			percent: startPercent
		};

		redraw(slider);
		slider.handle.setupRect(10, 20, Theme.getColour("sliderFg"));
		slider.label.setFormat({fontColour: Theme.getColour("sliderBg")});
		slider.label.setText("<label>");

		sliders.push(slider);
		return slider;
	}

	public static function redraw(slider:Slider):Void {
		slider.bar.setupRect(slider.width, 5, Theme.getColour("sliderBg"));
	}

	public static function align(slider:Slider):Void {
		/// Move handle to bar
		slider.handle.y = slider.bar.y + slider.bar.height/2 - slider.handle.height/2;
		setSliderToPercent(slider, slider.percent);
	}

	public static function update(elapsed:Float=0):Void {
		for (slider in sliders)
			if (slider.handle.holding)
				setSlider(slider, Engine.mouse.x - slider.handle.holdPivot.x);
	}

	public static function setSliderToPercent(slider:Slider, percent:Float):Void {
		var barMin:Float = slider.bar.x;
		var barMax:Float = slider.bar.x+slider.bar.width;
		setSlider(slider, percent*(barMax-barMin)+barMin);
	}

	public static function destroy(slider:Slider):Void {
		slider.bar.destroy();
		slider.handle.destroy();
		slider.label.destroy();
		sliders.remove(slider);
	}

	private static function setSlider(slider:Slider, val:Float):Void {
		var barMin:Float = slider.bar.x;
		var barMax:Float = slider.bar.x+slider.bar.width;
		val = Math.min(Math.max(val, barMin), barMax);
		slider.handle.x = val;
		slider.percent = (val-barMin)/(barMax-barMin);
		if (slider.onUpdate != null) slider.onUpdate();

		slider.label.x = slider.bar.x + slider.bar.width/2 - slider.label.fieldWidth/2;
		slider.label.y = slider.bar.y - slider.bar.height - slider.label.fieldHeight - 3;
	}
}

typedef Slider = {
	bar:MintSprite,
	handle:MintSprite,
	label:MintText,
	width:Float,
	onUpdate:Void->Void,
	percent:Float
}
