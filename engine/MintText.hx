package engine;

class MintText extends MintSprite
{
	public var emojis:Array<MintSprite> = [];
	public var emojiInds:Array<Int> = [];

	public var maxVScroll:Int = 1; //@cleanup: Lowercase this S?
	public var visibleLines:Int = 1;

	public var fieldWidth(default, null):Float;
	public var fieldHeight(default, null):Float;
	public var text(default, null):String = "";
	public var input:Bool = false;
	public var vscroll:Int = 0;
	public var dirty:Bool = true;

	public var rawText:String = "";

	public function new(defualtFormat:TextFieldFormat=null) {
		super();
		if (defualtFormat == null) defualtFormat = {};
		Engine.createText(id);
		setFormat(defualtFormat);

		pixelPerfectOverlapping = false;
		onReleaseOnce = getTextFocus;
		/* onReleaseOnceAnywhereElse = loseTextFocus; */
	}

	override public function update(elapsed:Float=0):Void {
		if (dirty) redraw();

		for (i in 0...emojis.length) {
			if (layer != emojis[i].layer) emojis[i].layer = layer;

			var charRect = Engine.getTextCharRect(id, emojiInds[i]); //@cleanup Make a proper Rect class
			var line:Int = Engine.getTextLineIndexOfChar(id, emojiInds[i]);
			var offScreen:Bool = false;
			if (Engine.getTextProp(id, WORD_WRAP) == true) offScreen = line < vscroll-1 || line > vscroll+visibleLines;
			if (charRect != null && !offScreen && visible) {
				var xpos:Float = x + (charRect.x + charRect.width/2);
				var ypos:Float = y + (charRect.y + charRect.height/2);
				emojis[i].x = xpos-emojis[i].width/2;
				emojis[i].y = ypos-emojis[i].height/2;
				emojis[i].alpha = alpha;
				if (!emojis[i].active) emojis[i].activate();
				if (elapsed == 0) emojis[i].update(); //@hack Prevent emojis from being at 0,0 for one frame
			} else {
				if (emojis[i].active) emojis[i].deactivate();
			}
		}

		super.update(elapsed);
	}

	public function setFormat(format:TextFieldFormat):Void {
		Engine.setTextFieldFormat(id, format);
		dirty = true;
	}

	public function setMaxHeight(height:Float):Void {
		Engine.setTextFieldMaxHeight(id, height);
		dirty = true;
	}

	public function setMaxWidth(width:Float):Void {
		Engine.setTextFieldMaxWidth(id, width);
		dirty = true;
	}

	public function setText(newText:String, defer:Bool=false):Void {
		update();
		rawText = newText;
		if (newText == null) newText = "nil";
		while (newText.contains("\n\n")) newText = newText.replace("\n\n", "\n \n");
		while (newText.charAt(newText.length-1) == "\n") newText = newText.substr(0, newText.length-1);
		text = newText;

		/// Parse out emojis
		var numSpaces:Int = Math.round(8*0.5);
		var spaces:String = " ";
		for (i in 0...numSpaces) spaces += " ";
		while (emojis.length > 0) emojis.pop().destroy();
		emojiInds = [];
		while (true) {
			var emojiStart:Int = text.indexOf("<!img:");
			if (emojiStart == -1) break;

			var emojiEnd:Int = text.indexOf(">", emojiStart);
			if (emojiEnd == -1) trace("Unclosed emoji tag at index "+emojiStart);

			var emojiString:String = text.substring(emojiStart, emojiEnd+1);
			emojiInds.push(emojiStart+Std.int(spaces.length/2));
			text = text.substring(0, emojiStart)+spaces+text.substring(emojiEnd+1, text.length);

			emojiString = emojiString.substring(2, emojiString.length-1);
			emojiString = emojiString.split(":")[1];

			var emoji:MintSprite = new MintSprite();
			// if (Main.inMod) emojiString = "external_"+emojiString;
			emoji.setupAnimated(emojiString);
			emojis.push(emoji);
		}

		/// Parsing text regions
		var regions:Array<FormatRegion> = [];
		/// Parse the tags out
		var tags:Array<Dynamic> = []; // {index:Int, tag:String}

		var nearestTagIndex:Int = 0;
		var nearestTag:String = "";
		var nearestTagLen:Int = 0;

		while (true) {
			nearestTagIndex = text.indexOf("<!");
			if (nearestTagIndex == -1) break;

			var tagEndIndex:Int = text.indexOf(">", nearestTagIndex);
			nearestTag = text.substring(nearestTagIndex, tagEndIndex+1);
			nearestTagLen = nearestTag.length;
			text = text.substr(0, nearestTagIndex) + text.substr(nearestTagIndex + nearestTagLen, text.length);
			for (i in 0...emojiInds.length)
				if (emojiInds[i] > nearestTagIndex)
					emojiInds[i] -= nearestTagLen; // Moves back emojis if other tags where behind them
			tags.push({ index: nearestTagIndex, tag: nearestTag });
		}

		/// Parse tags into format regions
		while (tags.length != 0) {
			var firstTag:Dynamic = tags.shift();

			/// Find the second tag
			var secondTag:Dynamic = null;
			for (tag in tags) {
				if (tag.tag == firstTag.tag) {
					secondTag = tag;
					tags.remove(secondTag);
					break;
				}
			}

			if (secondTag == null) {
				trace("Missing closing tag for: "+firstTag);
				return;
			}

			/// Create the region
			var region:FormatRegion = {
				start: firstTag.index,
				end: secondTag.index,
				bold: firstTag.tag == "<!b>",
				italic: firstTag.tag == "<!i>",
				underline: firstTag.tag == "<!u>"
			}
			if (firstTag.tag.indexOf("px>") != -1)
				region.fontSize = Std.parseInt(firstTag.tag.substr(2, firstTag.tag.indexOf("px>")));

			regions.push(region);
		}

		Engine.setTextProp(id, REGIONS, regions);
		if (defer) dirty = true;
		else redraw();
	}

	public function getText():String {
		text = Engine.getTextProp(id, TEXT);
		return text;
	}

	public function append(str:String):Void {
		text += str;
		dirty = true;
	}

	override public function destroy():Void {
		super.destroy();
		for (emoji in emojis) emoji.destroy();
	}

	public function scroll(amount:Int):Void {
		scrollTo(vscroll+amount);
	}

	public function scrollTo(value:Int):Void {
		vscroll = value;
		Engine.setTextProp(id, V_SCROLL, vscroll);
		vscroll = Engine.getTextProp(id, V_SCROLL);
	}

	private function redraw():Void {
		dirty = false;
		Engine.setTextProp(id, TEXT, text);
		width = Engine.getTextProp(id, WIDTH);
		height = Engine.getTextProp(id, HEIGHT);
		fieldWidth = Engine.getTextProp(id, FIELD_WIDTH);
		fieldHeight = Engine.getTextProp(id, FIELD_HEIGHT);
		maxVScroll = Engine.getTextProp(id, MAX_V_SCROLL);
		visibleLines = Engine.getTextProp(id, VISIBLE_LINES);
	}

	public function getTextFocus():Void {
		if (!input) return;
		Engine.getTextFocus(id);
	}

	public function loseTextFocus():Void {
		Engine.loseTextFocus(id);
	}

	override public function toString():String {
		return '$x,$y fieldSize: ${fieldWidth}x${fieldHeight} realSize: ${width}x${height} - $text';
	}
}
