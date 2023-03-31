package options;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.addons.display.FlxBackdrop;

using StringTools;

class AboutState extends MusicBeatState
{
	var logoBl:FlxSprite;

	var text:FlxText;

	override function create()
	{
		// LOAD MUSIC

		// LOAD CHARACTERS

		var yeah = new FlxBackdrop(Paths.image('options/background', 'hexMenu')); // backgrounds are the only hardcoded thing sorry :(
		yeah.setPosition(0, 0);
		yeah.antialiasing = true;
		yeah.scrollFactor.set();
		add(yeah);
		yeah.velocity.set(20, 0);

		logoBl = new FlxSprite(-150, -100);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();
		logoBl.screenCenter();
		logoBl.y = logoBl.y - 100;

		text = new FlxText(0, 0, 0, "ported by sirox and goldie-5" + "\n" + "", 64);
		text.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		text.screenCenter();
		text.y = text.y + 150;

		add(logoBl);
		add(text);

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		#if android
		if (FlxG.android.justReleased.BACK)
		{
			FlxG.switchState(new HexOptionsDirect(HexMenuState.loadHexMenu("options-menu")));
		}
		#end
	}
}
