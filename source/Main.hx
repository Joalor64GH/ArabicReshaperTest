package;

import flixel.FlxGame;
import openfl.display.Sprite;
import hx_arabic_shaper.ArabicReshaper;
import hx_arabic_shaper.bidi.UBA;

class Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, InitialState));

		var config = ArabicReshaper.getDefaultConfig();
  		config.delete_harakat = true;
  		ArabicReshaper.init(config);
	}

	public static function dispose() {
  		ArabicReshaper.dispose();
	}
}
