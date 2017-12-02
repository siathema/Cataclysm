package com.bytesneak.cataclysm;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import lime.math.Vector2;

/**
 * ...
 * @author Matthias Linfrod
 */
class Entity extends Sprite 
{
	public var position:Vector2;
	public var velocity:Vector2;
	private var image:Bitmap;
	private var camera:Camera;

	public function new(x:Float, y:Float, newImage:Bitmap, cam:Camera) 
	{
		super();
		position = new Vector2(x, y);
		velocity = new Vector2(0, 0);
		rotation = 0.0;
		camera = cam;
		image = newImage;
		image.scaleX = 1;
		image.scaleY = 1;
		image.x = -(image.width/2);
		image.y = -(image.height / 2);
		addChild(image);
	}
	
	public function moveTo(x:Float, y:Float)
	{
		position.x = x;
		position.y = y;
	}
	
	public function update()
	{
		
	}
	
	public function draw()
	{	
		x = position.x - camera.view.x;
		y = position.y - camera.view.y;
		
	}
}