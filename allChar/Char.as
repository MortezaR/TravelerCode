package  allChar{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Char extends MovieClip{
		var isSelected:Boolean = new Boolean;
		public function Char() {
			isSelected = false;
		}
		private function select() :void{
			isSelected = true;
		}

	}
	
}
