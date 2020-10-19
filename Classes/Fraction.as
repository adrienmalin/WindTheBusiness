package Classes {
	
	public class Fraction {
		
		public var numerateur:int;
		public var denominateur:int

		public function Fraction(numerateur:uint, denominateur:uint) {
			// constructor code
			this.numerateur = numerateur;
			this.denominateur = denominateur;
		}
		
		public function toString():String {
			return String(numerateur+"/"+denominateur);
		}
		
		public function valueOf():Number {
			return Number(numerateur)/Number(denominateur);
		}

	}
	
}
