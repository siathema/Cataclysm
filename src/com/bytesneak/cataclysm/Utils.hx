package com.bytesneak.cataclysm;
import openfl.geom.Point;

/**
 * ...
 * @author Matthias Linfrod
 */
class Utils 
{

	public function new() 
	{
		
	}
	
	public static function worldToCanvas(x:Float, y:Float) : Point
	{
		var point = new Point(x, y);
		point.y = -point.y;
		var pixelsPerMeter = 64;
		point.y = point.y * pixelsPerMeter;
		point.x = point.x * pixelsPerMeter;
		return point;
	}
	
	public static function canvasToWorld(x:Float, y:Float) : Point
	{
		var point = new Point(x, y);
		point.y = -point.y;
		var pixelsPerMeter = 64;
		point.y = point.y / pixelsPerMeter;
		point.x = point.x / pixelsPerMeter;
		return point;
	}
	
	public static function toDegrees(theta:Float) : Float
	{
		return (theta * 180) / Math.PI;
	}
	
	public static function toRadians(theta:Float) : Float
	{
		return (theta / 180) * Math.PI;
	}
	
}