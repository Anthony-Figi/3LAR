﻿ package  {		import flash.display.*;	import flash.text.*;	import flash.geom.ColorTransform;	import com.caurina.transitions.Tweener;	import flash.events.*;			public class leafContainer extends MovieClip {				public var myText:TextField = new TextField;		public var focusLeaf:Boolean;		public var startingX;		public var startingY;		public var startingZ;				public function leafContainer(tweet, xPos, yPos, zRot) {			 this.focusLeaf = focusLeaf;			 this.x = xPos;			 startingX = xPos;			 this.y = yPos;			 startingY = yPos;			 this.rotationZ = zRot;			 startingZ = zRot;			 var leafer = new leaf();			 addChild(leafer);			 			 var leafFont = new Krungthep();			 			 var myFormat:TextFormat = new TextFormat();			 myFormat.size = 15;			 myFormat.align = TextFormatAlign.CENTER;			 myFormat.color = 0xFFFFFF;			 myFormat.font = leafFont.fontName;			 			 myText.defaultTextFormat = myFormat;			 myText.embedFonts = true;			 myText.antiAliasType = AntiAliasType.ADVANCED;			 myText.text = tweet;			 myText.wordWrap = true;			 myText.width = 180;			 myText.height =160;			 myText.y = -80;			 myText.x = -35;			 verticalAlignTextField(myText);			 			 this.addChild(myText);			 			 this.addEventListener(MouseEvent.CLICK, destroyLeaf);		}				public function randomRange(minNum:Number, maxNum:Number):Number {			return (Math.floor(Math.random()*(maxNum - minNum +1)) + minNum);		}				public static function verticalAlignTextField(Texter: TextField): void {    		Texter.y += Math.round((Texter.height - Texter.textHeight) / 2);		}				public function growLeaf () { 			this.focusLeaf = true; 			Tweener.addTween(this, {						x: -300,						y: - 300,						rotationZ: 0,						scaleX: 4,						scaleY: 4,						time:1 						});					}				public function shrinkLeaf () { 			this.focusLeaf = false; 			Tweener.addTween(this, {						x: startingY,						y: startingX,						rotationZ: startingZ,						scaleX: 1,						scaleY: 1,						time:1 						});		}				public function destroyLeaf (event: Event) {			this.parent.removeChild(this);		}			}}