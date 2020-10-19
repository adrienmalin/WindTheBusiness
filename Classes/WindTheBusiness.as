package Classes {
	
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.text.TextField;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import Classes.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class WindTheBusiness extends MovieClip {
		
		//Déclaration des constantes
		const ADD = "ADD";
		const REMOVE = "REMOVE";
		const COULEUR_BONNE_REPONSE 	= 0x00FF00;
		const COULEUR_MAUVAISE_REPONSE	= 0xFF0000;
		const COULEUR_TEXTE_NORMAL		= 0x000000;
		const COULEUR_TEXTE_GRISE		= 0x666666;
		const COULEUR_TEXT_FOND			= 0x000000;
		const MARGE_BULLE = 10;
		const MARGE_TF = 5;
		const TF_ACTEUR_WIDTH_MAX = 600;
		const TF_REP_WIDTH_MAX = 300;
		const NP = "\n\t";
		const BO = '<font color="#0000FF"><b>';
		const BF = '</b></font>';
		const TOUCHE_GAUCHE	= 37;
		const TOUCHE_HAUT	= 38;
		const TOUCHE_DROITE	= 39;
		const TOUCHE_BAS	= 40;
		const PAS = 5;
		
		//Déclaration des varibles globales
		var i:uint;
		var nbEol:uint;
		var nbCartes:uint;
		var niveau:uint;
		var nbQuestionsProc:uint;
		var nbQuestionsEnR:uint;
		var nbQuestionsADEME:uint;
		var scoreMin:Number;
		var probaAvisFav:Number;
		var nbAvisFavMin:uint;
		var puissanceCreteMoyenne:Number;
		var energieMoyenneAnnuelle:Number;
		var prixRachatKWh:Number;
		var CO2Economise:Number;
		var distanceMin:Number;
		var acteur:String;
		var derniereMaisonVisitee:String = "Atelier";
		var oActeurs:Object = {};
		var oBAvisFav:Object = {};
		var fxPerso:FichierXML;
		var fxVariables:FichierXML;
		var oFxEnR:Object = {};
		var oBCartesObtenues:Object = {};
		var oFxActeur:Object = {};
		var oQxActeur:Object = {};
		var oServicesOuverts:Object = {};
		var lCartes:Loader;
		var tbEol:Array = new Array();
		var musique:Sound;
		var soundChannel:SoundChannel;
		
		public function WindTheBusiness() {
			
		}
		
		public function copierPosition(doPastiche:Object, doOriginal:Object, marge:int = 0):void
		{
			doPastiche.x		= doOriginal.x - marge;
			doPastiche.y		= doOriginal.y - marge;
		}
		
		public function copierTaille(doPastiche:Object, doOriginal:Object, marge:int = 0):void
		{
			doPastiche.width	= doOriginal.width	+ 2*marge;
			doPastiche.height	= doOriginal.height	+ 2*marge;
		}
		
		public function copierTailleEtPosition(doPastiche:Object, doOriginal:Object, marge:int = 0):void
		{
			copierPosition	(doPastiche, doOriginal, marge);
			copierTaille	(doPastiche, doOriginal, marge);
		}

		public function redimBulleActeur(){
			tfActeur.width	= TF_ACTEUR_WIDTH_MAX;
			tfActeur.width	= tfActeur.textWidth	+ MARGE_TF;
			tfActeur.height	= tfActeur.textHeight	+ MARGE_TF;
			copierTailleEtPosition(mcBulleActeur, tfActeur, MARGE_BULLE);
			mcQueueActeur.x = mcBulleActeur.x  + mcBulleActeur.width * 0.4;
			mcQueueActeur.y = mcBulleActeur.y + mcBulleActeur.height;
		}
		
		public function redimBullePerso(index:uint){
			var widthRepMax = 0;
			for (i=0; i<=index; i++){
				tbTfRep[i].width	= TF_REP_WIDTH_MAX;
				tbTfRep[i].width	= tbTfRep[i].textWidth	+ MARGE_TF;
				tbTfRep[i].height	= tbTfRep[i].textHeight	+ MARGE_TF;
				if (widthRepMax < tbTfRep[i].width) widthRepMax = tbTfRep[i].width;
			}
			for (i=1; i<=index; i++){
				tbTfRep[i].x = tbTfRep[0].x;
				tbTfRep[i].y = tbTfRep[i-1].y + tbTfRep[i-1].height + MARGE_TF;
			}
			for (i=0; i<=index; i++){
				copierTailleEtPosition(tbSbRep[i], tbTfRep[i]);
			}
			copierTailleEtPosition(mcBullePerso, new Rectangle(tbTfRep[0].x, tbTfRep[0].y, widthRepMax,tbTfRep[index].y - tbTfRep[0].y + tbTfRep[index].height), MARGE_BULLE);
			mcQueuePerso.x = mcBullePerso.x + mcBullePerso.width * 0.3;
			mcQueuePerso.y = mcBullePerso.y + mcBullePerso.height ;
		}
	
		public function gotoPhase(e:Event){
			gotoAndStop(e.target.name.slice("sb".length));
		}
		
		public function alea(min:Number, max:Number):Number{
			return Math.random()*(max-min)+min;
		}
		
		public function boucle(e:Event){
			musique.play();
		}
	}
}
