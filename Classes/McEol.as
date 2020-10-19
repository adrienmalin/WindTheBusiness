package Classes {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class McEol extends MovieClip {
		
		
		public function McEol(origine:Point=null) {
			stop();
			if (origine) {
				this.x = origine.x;
				this.y = origine.y;
			}
		}
	}
	
}
