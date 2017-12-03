package com.bytesneak.cataclysm;

import openfl.display.Bitmap;
import lime.math.Vector2;
import Math;
import openfl.geom.Point;
/**
 * ...
 * @author Matthias Linfrod
 */
 
class Player extends Entity
{

	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;
	public var pickUp:Bool;
	public var canPickUp:Bool = true;
	public var pickUpTimer = 0;
	
	private var speed:Float = 0;
	private var maxSpeed:Float = 5;
	private var rotationSpeed:Float = 2;
	private var drag:Float = 0.03;
	private var stopThreshold = 0.1;
	private var direction:Vector2;
	
	public function new(x:Float, y:Float, image:Bitmap, cam:Camera) 
	{
		super(x, y, image, cam);
		
		rotation = 0.0;
		direction = new Vector2(0.0, 1.0);
		
	}
	
	public function pickUpEntity(crates:Array<Crate>)
	{
		if (pickUp && canPickUp && pickUpTimer <= 0)
		{
			for (crate in crates)
			{
				if (crate.isInPickUpRadius(new Point(position.x, position.y)))
				{
					childEntity = crate;
					canPickUp = false;
					pickUpTimer = 15;
					break;
				}
			}
		}
	}
	
	public function drop()
	{
		if (childEntity != null)
		{
			trace(pickUpTimer);
			if (pickUp && (!canPickUp) && pickUpTimer <= 0)
			{
				childEntity = null;
				canPickUp = true;
				pickUpTimer = 15;
			}
		}
	}
	
	public override function update()
	{
		super.update();
		drop();
		
		if (up)
		{
			speed -= 0.2;
			if (speed < -maxSpeed)
			{
				speed = -maxSpeed;
			}
		}
		if (down)
		{
			speed += 0.2;
			if (speed > maxSpeed)
			{
				speed = maxSpeed;
			}
		}
		if (left)
		{
			
			rotation -= rotationSpeed;
			
			var transRot:Float = rotation + 90.0;
			direction = new Vector2(Math.cos((transRot / 180.0) * Math.PI) , Math.sin((transRot / 180.0) * Math.PI));
			//direction.normalize(1);
		}
		if (right)
		{
			
			rotation += rotationSpeed;
			
			var transRot:Float = rotation + 90.0;
			direction = new Vector2(Math.cos((transRot / 180.0) * Math.PI) , Math.sin((transRot / 180.0) * Math.PI));
			//direction.normalize(1);
		}
		if (!(up || down))
		{
			if (speed < -stopThreshold)
			{
				speed += drag;
			}
			else if (speed > stopThreshold)
			{
				speed -= drag;
			}
			else
			{
				speed = 0;
			}
		}
		
		velocity.x = direction.x * speed;
		velocity.y = direction.y * speed;
		
		
		//image.rotation += 0.5;
		position = position.add(velocity);
		
		if (pickUpTimer > 0)
		{
			pickUpTimer--;
		}
		
	}
	
}