package com.bytesneak.cataclysm;
import openfl.geom.Point;
import openfl.geom.Rectangle;

/**
 * ...
 * @author Matthias Linfrod
 */
class Camera 
{
	public var view:Rectangle;
	public function new(x:Float, y:Float, width:Float, height:Float) 
	{
		view = new Rectangle(x, y, width, height);
	}
	
	public function moveTo(x:Float, y:Float)
	{
		view.x = x;
		view.y = y;
	}
	
	public function move(x:Float, y:Float)
	{
		view.x += x;
		view.y += y;
	}
	
}