package  bbone{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import bbone.objFr;
	import allObj.player;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import fl.controls.*;
	import allObj.weapon;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import bbone.CollisionList;
	import bbone.CollisionGroup;
	import allObj.Obj;
	import allObj.enemy;
	
	public class Driver extends MovieClip
	{
		private var _movingUp:Boolean = false;
		private var _movingDown:Boolean = false;
		private var _movingLeft:Boolean = false;
		private var _movingRight:Boolean = false;
		var world:objFr = new objFr;
		var dude:player = new player;
		var dude2:player = new player;
		var turnBaseWorld:mapFr = new mapFr(10,10);
		var speed:Timer;
		var canMove:Boolean = true;
		var default_weapon:weapon = new weapon;
		var moveSpeed: int = 10;
		var colWall:CollisionList;
		var colEnemy:CollisionList;
		public function Driver() 
		{
			/*stage.addEventListener(Event.ENTER_FRAME, enterFrameHandler);			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, myOnPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, myOnRelease);
			stage.addChild(world);
			stage.addChild(dude);
			dude.equip(default_weapon);
			
			// starting position (320, 480)
			dude.x = 320;
			dude.y = 480;
			world.x = 0;
			world.y = 0;

			world.LOAD(1,1);
			colEnemy = new CollisionList(default_weapon);
			colWall = new CollisionList(dude);
			for(var i:int = 0; i< world.objList().length; i++){
				if(world.objList()[i] is Obj)
					colWall.addItem(world.objList()[i]);
				if(world.objList()[i] is enemy)
				   colEnemy.addItem(world.objList()[i]);
			}
			trace(world.objList()[1]);*/
			addChild(turnBaseWorld);
		}
		public function enterFrameHandler(event:Event):void
		{
			if ( _movingLeft && !_movingRight ){
				world.x += moveSpeed;
				dude.rotation = 270;
			}
			if ( _movingRight && !_movingLeft ){
				world.x -= moveSpeed;
				dude.rotation = 90;
			}
			if ( _movingUp && !_movingDown ){
				world.y += moveSpeed;
				dude.rotation = 0;
			}
			if ( _movingDown && !_movingUp ){
				world.y -= moveSpeed;
				dude.rotation = 180;
			}
			if ( _movingLeft && _movingUp && !_movingRight && !_movingDown ){
				dude.rotation = 315;
			}
			if ( _movingRight && _movingUp && !_movingLeft && !_movingDown ){
				dude.rotation = 45;
			}
			if ( _movingLeft && _movingDown && !_movingRight && !_movingUp ){
				dude.rotation = 225;
			}
			if ( _movingRight && _movingDown && !_movingLeft && !_movingUp ){
				dude.rotation = 135;
			}
			if(colWall.checkCollisions()[0] != null){
				trace(dude.rotation);
				switch(dude.rotation){
					case 0 :
						world.y -= moveSpeed;
					break;
					case 90 :
						world.x += moveSpeed;
					break;
					case 180 :
						world.y += moveSpeed;
					break;
					case -90 :
						world.x -= moveSpeed;
					break;
					case 45 :
						world.y -= moveSpeed;
						if(colWall.checkCollisions()[0] != null){
							world.y += moveSpeed;
							world.x += moveSpeed;
							if(colWall.checkCollisions()[0] != null)
								world.y -= moveSpeed;
						}
					break;
					case 135 :
						world.y += moveSpeed;
						if(colWall.checkCollisions()[0] != null){
							world.y -= moveSpeed;
							world.x += moveSpeed;
							if(colWall.checkCollisions()[0] != null)
								world.y += moveSpeed;
						}
					break;
					case -135 :
						world.y += moveSpeed;
						if(colWall.checkCollisions()[0] != null){
							world.y -= moveSpeed;
							world.x -= moveSpeed;
							if(colWall.checkCollisions()[0] != null)
								world.y += moveSpeed;
						}
					break;
					case -45 :
						world.y -= moveSpeed;
						if(colWall.checkCollisions()[0] != null){
							world.y += moveSpeed;
							world.x -= moveSpeed;
							if(colWall.checkCollisions()[0] != null)
								world.y -= moveSpeed;
						}
					break;
				}
			}
		}
		public function myOnPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					_movingUp = true;
					break;
					
				case Keyboard.DOWN:
					_movingDown = true;
					break;
					
				case Keyboard.LEFT:
					_movingLeft = true;
					break;
					
				case Keyboard.RIGHT:
					_movingRight = true;
					break;
			}
		}
		public function myOnRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.UP:
					_movingUp = false;
					break;
					
				case Keyboard.DOWN:
					_movingDown = false;
					break;
					
				case Keyboard.LEFT:
					_movingLeft = false;
					break;
					
				case Keyboard.RIGHT:
					_movingRight = false;
					break;
					
				case Keyboard.SPACE:
					dude.attack();
					world.objList()[1].turnOFF();
					/*if(colEnemy.checkCollisions()[0] != null)
						root.world.removeChild(colEnemy.checkCollisions()[0]);*/
					break;
			}
		}

	}
}
