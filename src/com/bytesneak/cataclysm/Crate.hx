package com.bytesneak.cataclysm;

import openfl.display.Bitmap;
import openfl.geom.Point;


/**
 * ...
 * @author Matthias Linfrod
 */
class Crate extends Entity 
{
	public var pickUpRadius:Float;
	
	public function new(x:Float, y:Float, newImage:Bitmap, cam:Camera) 
	{
		super(x, y, newImage, cam);
		
		pickUpRadius = 1.2 * image.width;
		
		
	}
	
	public override function update()
	{
		
	}
	
	public function isInPickUpRadius(point:Point) : Bool
	{
		var xDelta = point.x - position.x;
		var yDelta = point.y - position.y;
		var distance:Float = Math.sqrt((xDelta * xDelta) + (yDelta * yDelta));
		if (distance < pickUpRadius)
		{
			return true;
		}
		return false;
	}
	
}