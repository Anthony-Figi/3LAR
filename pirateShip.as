﻿package  {		import flash.display.MovieClip;		import flash.events.*;	import flash.events.Event;	import flash.utils.getTimer;	import flash.utils.Timer;	import flash.events.TimerEvent;			public class pirateShip extends MovieClip {				public var DC; 		public var touchDelay:Boolean = false;		public var touchTimer = new Timer(3000, 1);				public function pirateShip(DC) {								this.DC = DC;				this.x = -1050; 				this.y = -180;				this.scaleX = 0.85;				this.scaleY = 0.85;				this.alpha = 1; 				this.rotationZ = 0;								this.stop();				this.addEventListener(Event.ENTER_FRAME, touched);				touchTimer.addEventListener(TimerEvent.TIMER, function() {trace("delay on"), touchDelay = false;});										}					public function touched (event: Event){			if(this.DC.userOne != null && this.DC.gameOn != true){				var userOneLeftHand = this.DC.leftSprites[this.DC.userOne.userID]				var userOneRightHand = this.DC.rightSprites[this.DC.userOne.userID]				if(this.hitTestObject(userOneLeftHand) || this.hitTestObject(userOneRightHand) ){					trace("Touched");					if (touchDelay != true){						touchDelay = true;						touchTimer.start();						this.play();						this.addEventListener(Event.ENTER_FRAME, stopper);					}				}			}		}				public function stopper (event: Event) {			if(this.currentFrame == 1) {				this.stop();				this.removeEventListener(Event.ENTER_FRAME, stopper);			}		}	}	}