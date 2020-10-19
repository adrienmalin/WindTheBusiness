package Classes {
	
	import flash.events.*;
	import flash.net.*;
	
	public class FichierXML extends URLLoader {

		public var content:XML;
		public var url:String;
		
		public function FichierXML(url:String) {
			//Chargement du fichier XML
			this.url = url;
			var ur:URLRequest = new URLRequest(url)
			super(new URLRequest(url));
			this.addEventListener(Event.COMPLETE, xmlLoaded);
		}
		
		public function xmlLoaded(event:Event):void
		{
			this.content = XML(this.data);
		}
		
		public function valueOf():XML{
			return content;
		}
	}
	
}
