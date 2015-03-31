package  allObj.perObj{
	import allObj.Obj;
	
	public class aSwitch extends Obj {
		var isON:Boolean = new Boolean;
		public function aSwitch() {
			isON = false;
		}
		public function turnOFF(){
			isON = false;
			gotoAndStop(2);
		}
		public function turnON(){
			isON = true;
		}
		public function isToggle(){
			if (isON = false){
				turnON();
			}
			else{
				turnOFF();
			}
			
		}

	}
	
}
