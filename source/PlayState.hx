package;

import hx_arabic_shaper.ArabicReshaper;
import hx_arabic_shaper.bidi.UBA;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
import openfl.Lib;

class PlayState extends FlxState
{
    override public function create()
    {
        super.create();

        try 
        {
            var text:FlxText = new FlxText(0, 0, 0, '${print}', 64);
            text.screenCenter();
            add(text);
        } 
        catch (e) 
        {
            var errText:FlxText = new FlxText(0, 0, 0, "Oops! An error happened!" + "\n" + '${e.message}', 64);
            errText.screenCenter();
            add(errText);
        }

        var littleText:FlxText = new FlxText(5, FlxG.height - 24, 0, "Hello World");
	littleText.scrollFactor.set();
	littleText.setFormat(Paths.font("vcr.ttf"), 26, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	add(littleText);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    function print(text:String = 'مرحبا بالعالم') {
        var shaped = ArabicReshaper.reshape(text);
        var bidi = UBA.display(shaped);
    }
}
