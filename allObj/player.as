package allObj
{
	import flash.display.MovieClip;
	import allObj.weapon;
	public class player extends MovieClip{
		var hasWeapon:Boolean;
		var w_pon:weapon = new weapon;
		public function Player(){
			hasWeapon = false;
		}
		public function equip(w:weapon){
			hasWeapon = true;
			w_pon = w;
			addChild(w);
		}
		
		public function move(dir:Number ){
			if (dir == 0){this.gotoAndStop("Up");}
			if (dir == 1){this.gotoAndStop("Right");}
			if (dir == 2){this.gotoAndStop("Down");}
			if (dir == 3){this.gotoAndStop("Left");}
		}
		public function attack(){
			if(hasWeapon == true){
				w_pon.fire();
			}
		}

	}
	
}
