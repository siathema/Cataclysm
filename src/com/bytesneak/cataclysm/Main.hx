package com.bytesneak.cataclysm;

import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.Assets;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.ui.Keyboard;

/**
 * ...
 * @author Matthias Linfrod
 */
class Main extends Sprite 
{
	private var camera:Camera;
	private var droneTest:Player;
	private var crates:Array<Crate>;
	//private var crateTest:Crate;
	private var keys:Array<Bool>;
	private var time:Int = 0;
	private var spaceTimer:Int = 0;

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		init();
	}
	
	public function init()
	{
		
		
		camera = new Camera(0.0, 0.0, stage.width, stage.height);
		var bitmapData = Assets.getBitmapData("img/Drone.png");
		var drone = new Bitmap(bitmapData);
		
		bitmapData = Assets.getBitmapData("img/BaseComponent.png");
		crates = [];
		
		for (i in 0...10)
		{
			//var crate = new Bitmap(bitmapData);
			var crate = new Crate(i * 128 + 50, 50, new Bitmap(bitmapData), camera);
			crates[i] = crate;
			addChild(crates[i]);
			crates[i].draw();
			
		}
		
		
		droneTest = new Player(600, 600, drone, camera);
		addChild(droneTest);
		
		keys = [];
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		
		stage.addEventListener(Event.ENTER_FRAME, proc);
		
		
		
	}
	
	private function onKeyDown(evt:KeyboardEvent)
	{
		keys[evt.keyCode] = true;
	}
	
	private function onKeyUp(evt:KeyboardEvent)
	{
		keys[evt.keyCode] = false;
	}
	
	private function proc(e:Event)
	{
		
		droneTest.up = keys[Keyboard.W];
		droneTest.down = keys[Keyboard.S];
		droneTest.left = keys[Keyboard.A];
		droneTest.right = keys[Keyboard.D];
		droneTest.pickUp = keys[Keyboard.SPACE];
		
		//camera.move(0.5, 0);
		
		//world.clearForces();
		droneTest.pickUpEntity(crates);
		//droneTest.drop();
		droneTest.update();
		droneTest.draw();
		
		for (c in crates)
		{
			c.update();
			c.draw();
		}
		
		//crateTest.draw();
		
		time++;
		if (spaceTimer > 0)
		{
			spaceTimer--;
		}
		if (time >= 60)
		{
			time = 0;
		}
	}

}
