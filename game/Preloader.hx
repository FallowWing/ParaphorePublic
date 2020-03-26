package;

import openfl.display.*;
import openfl.events.*;
import openfl.text.*;

@:bitmap("../assets/img/intro/preloader.png") class PreloaderImage extends BitmapData { }
@:bitmap("../assets/img/intro/preloader2.png") class PreloaderImage2 extends BitmapData { }

@:bitmap("../assets/img/kink/Abuse.png") class KinkAbuse extends BitmapData { }
@:bitmap("../assets/img/kink/Art.png") class KinkArt extends BitmapData { }
@:bitmap("../assets/img/kink/Baby.png") class KinkBaby extends BitmapData { }
@:bitmap("../assets/img/kink/Blood.png") class KinkBlood extends BitmapData { }
@:bitmap("../assets/img/kink/Cub.png") class KinkCub extends BitmapData { }
@:bitmap("../assets/img/kink/Female.png") class KinkFemale extends BitmapData { }
@:bitmap("../assets/img/kink/Feral.png") class KinkFeral extends BitmapData { }
@:bitmap("../assets/img/kink/Foodplay.png") class KinkFoodplay extends BitmapData { }
@:bitmap("../assets/img/kink/Gore.png") class KinkGore extends BitmapData { }
@:bitmap("../assets/img/kink/Guest Writer.png") class KinkGuestWriter extends BitmapData { }
@:bitmap("../assets/img/kink/Hyper.png") class KinkHyper extends BitmapData { }
@:bitmap("../assets/img/kink/Male.png") class KinkMale extends BitmapData { }
@:bitmap("../assets/img/kink/Patreon Commission.png") class KinkPatreonCommission extends BitmapData { }
@:bitmap("../assets/img/kink/Plot.png") class KinkPlot extends BitmapData { }
@:bitmap("../assets/img/kink/Pregnancy.png") class KinkPregnancy extends BitmapData { }
@:bitmap("../assets/img/kink/Raunch.png") class KinkRaunch extends BitmapData { }
@:bitmap("../assets/img/kink/Scat.png") class KinkScat extends BitmapData { }
@:bitmap("../assets/img/kink/Snuff.png") class KinkSnuff extends BitmapData { }
@:bitmap("../assets/img/kink/Intersex.png") class KinkIntersex extends BitmapData { }
@:bitmap("../assets/img/kink/Trash.png") class KinkTrash extends BitmapData { }
@:bitmap("../assets/img/kink/Vomit.png") class KinkVomit extends BitmapData { }
@:bitmap("../assets/img/kink/Piss.png") class KinkPiss extends BitmapData { }

@:bitmap("../assets/img/intro/preloader3/base.png") class PreloaderImage3 extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/earthMeteorite.png") class EarthMeteorite extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/islandMeteorite.png") class IslandMeteorite extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/daydreamJournal.png") class BookMeteorite extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/eye.png") class Eye extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/eyeJournal.png") class EyeJournal extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/loadingMessage.png") class LoadingMessage extends BitmapData { }
@:bitmap("../assets/img/intro/preloader3/sectionComplete.png") class SectionComplete extends BitmapData { }

@:font("../assets/font/MinUniversLT.ttf") class MinUnivers extends Font { }

class Preloader extends Sprite
{
	public static var preloaderType:Int = 0;
	public static var symbols:Array<Sprite> = [];
	public static var names:Array<String> = [];
	public static var tf:TextField;

	public static var bar:Sprite;
	public static var barOutline:Sprite;
	public static var barLoadingTop:TextField;
	public static var barLoadingMask:Sprite;
	public static var barLoadingBot:TextField;
	public static var barLoadingPercent:TextField;

	public static var base3:Bitmap;
	public static var meteorite1:Bitmap;
	public static var meteorite2:Bitmap;
	public static var meteorite3:Bitmap;
	public static var eye1:Bitmap;
	public static var eye2:Bitmap;
	public static var eye3:Bitmap;
	public static var section1:Bitmap;
	public static var section2:Bitmap;
	public static var section3:Bitmap;
	public static var loadingMessage:Bitmap;

	public function new() {
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
	}

	function init(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		stage.frameRate = 60;

		if (Math.random() < 0.50) preloaderType = 2;
		if (Math.random() < 0.05) preloaderType = 1;

		if (preloaderType == 0) {
			addChild(new Bitmap(new PreloaderImage(0, 0)));

			function addSymbol(data:BitmapData, name:String):Void {
				var symbol:Sprite = new Sprite();
				symbol.addChild(new Bitmap(data));

				symbol.alpha = 0;
				symbol.y = 79;

				addChild(symbol);
				symbols.push(symbol);
				names.push(name);
			}

			addSymbol(new KinkSnuff(0, 0), "Snuff");
			addSymbol(new KinkGore(0, 0), "Gore");
			addSymbol(new KinkAbuse(0, 0), "Abuse");
			addSymbol(new KinkCub(0, 0), "Cub");
			addSymbol(new KinkBaby(0, 0), "Baby");
			addSymbol(new KinkBlood(0, 0), "Blood");
			addSymbol(new KinkPatreonCommission(0, 0), "Patreon Commission");
			addSymbol(new KinkHyper(0, 0), "Hyper");
			addSymbol(new KinkPiss(0, 0), "Piss");
			addSymbol(new KinkRaunch(0, 0), "Raunch");
			addSymbol(new KinkScat(0, 0), "Scat");
			addSymbol(new KinkVomit(0, 0), "Vomit");
			addSymbol(new KinkFeral(0, 0), "Feral");
			addSymbol(new KinkPregnancy(0, 0), "Pregnancy");
			addSymbol(new KinkPlot(0, 0), "Plot");
			addSymbol(new KinkFemale(0, 0), "Female");
			addSymbol(new KinkMale(0, 0), "Male");
			addSymbol(new KinkIntersex(0, 0), "Intersex");
			addSymbol(new KinkFoodplay(0, 0), "Foodplay");
			addSymbol(new KinkTrash(0, 0), "Trash");
			addSymbol(new KinkGuestWriter(0, 0), "Guest Writer");
			addSymbol(new KinkArt(0, 0), "Art");

			var eachMove:Float = 543/(symbols.length-1);
			for (i in 0...symbols.length) symbols[i].x = eachMove*i;

			tf = new TextField();
			tf.defaultTextFormat = new TextFormat("Arial", 20);
			tf.autoSize = TextFieldAutoSize.CENTER;
			tf.selectable = false;
			tf.text = "";
			addChild(tf);
		} else if (preloaderType == 1) {
			addChild(new Bitmap(new PreloaderImage2(0, 0)));
			bar = new Sprite();
			bar.graphics.beginFill(0x8D31B0);
			bar.graphics.drawRect(0, 0, stage.stageWidth*0.66, 30);
			bar.x = stage.stageWidth/2-bar.width/2;
			bar.y = stage.stageHeight*0.75;
			addChild(bar);

			var pad:Int = 2;
			barOutline = new Sprite();
			barOutline.graphics.beginFill(0x333E52);
			barOutline.graphics.drawRect(0, 0, bar.width+pad, bar.height+pad);
			barOutline.x = bar.x - pad/2;
			barOutline.y = bar.y - pad/2;
			addChild(barOutline);

			setChildIndex(bar, numChildren-1);

			var font:Font = new MinUnivers();
			for (f in openfl.text.Font.enumerateFonts())
				if (f.fontName.contains("Univers"))
					font = f;

			barLoadingBot = new TextField();
			barLoadingBot.autoSize = TextFieldAutoSize.CENTER;
			barLoadingBot.textColor = 0x3D5174;
			barLoadingBot.embedFonts = true;
			barLoadingBot.defaultTextFormat = new TextFormat(font.fontName, 41);
			barLoadingBot.text = "LOADING...";
			barLoadingBot.x = bar.x;
			barLoadingBot.y = bar.y-10;
#if js
			barLoadingBot.x += 15;
#end
			addChild(barLoadingBot);

			barLoadingMask = new Sprite();
			barLoadingMask.graphics.beginFill(0x000000);
			barLoadingMask.graphics.drawRect(0, 0, bar.width, bar.height);
			barLoadingMask.x = bar.x;
			barLoadingMask.y = bar.y;
			addChild(barLoadingMask);

			barLoadingTop = new TextField();
			barLoadingTop.textColor = 0x343F53;
			barLoadingTop.autoSize = TextFieldAutoSize.CENTER;
			barLoadingTop.embedFonts = true;
			barLoadingTop.defaultTextFormat = new TextFormat(font.fontName, 41);
			barLoadingTop.text = "LOADING...";
			barLoadingTop.x = bar.x;
			barLoadingTop.y = bar.y-10;
#if js
			barLoadingTop.x += 15;
#end
			addChild(barLoadingTop);
			barLoadingTop.mask = barLoadingMask;

			barLoadingPercent = new TextField();
			barLoadingPercent.textColor = 0xFFFFFF;
			barLoadingPercent.embedFonts = true;
			barLoadingPercent.defaultTextFormat = new TextFormat(font.fontName, 41, null, null, null, null, null, null, TextFormatAlign.RIGHT);
			barLoadingPercent.text = "0";
			barLoadingPercent.x = bar.x + (bar.width * 1/bar.scaleX) - barLoadingPercent.width;
			barLoadingPercent.y = bar.y - 10;
			addChild(barLoadingPercent);
		} else if (preloaderType == 2) {
			base3 = new Bitmap(new PreloaderImage3(0, 0));
			addChild(base3);

			meteorite1 = new Bitmap(new EarthMeteorite(0, 0));
			meteorite1.x = 63;
			meteorite1.y = -meteorite1.height;
			addChild(meteorite1);

			meteorite2 = new Bitmap(new BookMeteorite(0, 0));
			meteorite2.x = 317;
			meteorite2.y = -meteorite2.height;
			addChild(meteorite2);

			meteorite3 = new Bitmap(new IslandMeteorite(0, 0));
			meteorite3.x = 600;
			meteorite3.y = -meteorite3.height;
			addChild(meteorite3);

			section1 = new Bitmap(new SectionComplete(0, 0));
			section1.x = 0;
			addChild(section1);

			section2 = new Bitmap(new SectionComplete(0, 0));
			section2.x = 269;
			addChild(section2);

			section3 = new Bitmap(new SectionComplete(0, 0));
			section3.x = 539;
			addChild(section3);

			eye1 = new Bitmap(new Eye(0, 0));
			addChild(eye1);

			eye2 = new Bitmap(new EyeJournal(0, 0));
			eye2.x = 350;
			eye2.y = 500;
			addChild(eye2);

			eye3 = new Bitmap(new Eye(0, 0));
			eye3.x = 600;
			eye3.y = 500;
			addChild(eye3);

			loadingMessage = new Bitmap(new LoadingMessage(0, 0));
			loadingMessage.x = 17;
			loadingMessage.y = 20;
			addChild(loadingMessage);

			section1.visible = false;
			section2.visible = false;
			section3.visible = false;

			eye1.visible = false;
			eye2.visible = false;
			eye3.visible = false;
		}

		addEventListener(Event.COMPLETE, close);
		addEventListener(ProgressEvent.PROGRESS, progress);
	}

	function close(e:Event):Void {
		removeEventListener(Event.COMPLETE, close);
	}

	public function progress(e:ProgressEvent):Void {
		var perc:Float = e.bytesLoaded/e.bytesTotal;

		if (preloaderType == 0) {
			tf.x = stage.mouseX - tf.width/2;
			tf.y = stage.mouseY - (tf.height + 15);
			tf.alpha = 0;

			var alphaToGive:Float = perc*symbols.length;

			while (alphaToGive > 0) {
				for (symbol in symbols) {
					if (alphaToGive > 1) {
						symbol.alpha = 1;
						alphaToGive--;
					} else {
						symbol.alpha = alphaToGive;
						alphaToGive = 0;
					}

					if (symbol.alpha > 0.2 && pointInCircle(stage.mouseX, stage.mouseY, symbol.x + symbol.width/2, symbol.y + symbol.height/2, symbol.width/2)) {
						tf.alpha = 1;
						tf.text = names[symbols.indexOf(symbol)];
					}
				}
			}
		} else if (preloaderType == 1) {
			bar.scaleX = perc;
			barLoadingMask.scaleX = perc;
			barLoadingPercent.text = Std.string(Math.round(perc*100));
#if js
			// Gotta change the text field so the font will be applied when it's loaded, but not on flash because autosize actually works.
			if (Math.random() > 0.5) barLoadingTop.text = "LOADING...";
			else barLoadingTop.text = "LOADING... ";
			if (Math.random() > 0.5) barLoadingBot.text = "LOADING...";
			else barLoadingBot.text = "LOADING... ";
#end
		} else if (preloaderType == 2) {
			var thirdPerc:Float;
			perc *= 1.1;
			var startY:Float = -meteorite1.y;
			var endY:Float;

			if (perc < 0.33) {
				thirdPerc = perc/0.33;
				endY = 320;
				meteorite1.y = startY + thirdPerc * (endY - startY);
			}

			if (perc > 0.33 && perc < 0.66) {
				meteorite1.visible = false;
				eye1.visible = true;
				section1.visible = true;
				eye1.x = meteorite1.x+29;
				eye1.y = meteorite1.y+22;

				thirdPerc = (perc-0.33)/0.33;
				endY = 471;
				meteorite2.y = startY + thirdPerc * (endY - startY);
			}

			if (perc > 0.66 && perc < 1.0) {
				meteorite2.visible = false;
				eye2.visible = true;
				section2.visible = true;
				eye2.x = meteorite2.x+57;
				eye2.y = meteorite2.y+22;

				thirdPerc = (perc-0.66)/0.33;
				endY = 356;
				meteorite3.y = startY + thirdPerc * (endY - startY);
			}
			
			if (perc > 1.0) {
				meteorite3.visible = false;
				eye3.visible = true;
				section3.visible = true;
				eye3.x = meteorite3.x+29;
				eye3.y = meteorite3.y+22;
			}
		}
	}

	public function pointInCircle(pointX:Float, pointY:Float, circleX:Float, circleY:Float, radius:Float):Bool {
		return Math.sqrt((pointX-circleX)*(pointX-circleX) + (pointY-circleY)*(pointY-circleY)) < radius;
	}
}
