﻿ package  {		import flash.display.*;	import flash.text.*;	import flash.utils.getTimer;	import flash.utils.Timer;	import flash.events.TimerEvent;	import flash.net.dns.AAAARecord;	import com.caurina.transitions.Tweener;		public class leaf extends MovieClip {				public var focusLeaf:Boolean;		public var startingX:Number;		public var startingY:Number;		public var startingZ:Number;				public function leaf(tweet, xPos, yPos, zRot) {			 this.x = xPos;			 this.startingX = xPos;			 this.y = yPos;			 this.startingY = yPos;			 this.rotationZ = zRot;			 this.startingZ = zRot;			 this.focusLeaf = false;			 			 			 var calibri = new Calibri();			 			 var myFormat:TextFormat = new TextFormat();			 myFormat.size = 8;			 myFormat.align = TextFormatAlign.CENTER;			 myFormat.color = 0x000000;			 //myFormat.font = calibri.fontName;			 			 var myText:TextField = new TextField();			 myText.defaultTextFormat = myFormat;			 //myText.embedFonts = true;			 myText.antiAliasType = AntiAliasType.ADVANCED;			 myText.text = tweet;			 myText.wordWrap = true;			 myText.width = 90;			 myText.height = 65;			 myText.y = 0;			 myText.x = 0;			 			 this.addChild(myText);		}			public function growLeaf () { 		this.focusLeaf = true; 		Tweener.addTween(this, {					x: -300,					y: - 300,					rotationZ: 0,					scaleX: 4,					scaleY: 4,					time:1 					});	}		public function shrinkLeaf () { 		this.focusLeaf = false; 		Tweener.addTween(this, {					x: startingY,					y: startingX,					rotationZ: startingZ,					scaleX: 1,					scaleY: 1,					time:1 					});	}		}}