﻿package  {		import flash.display.MovieClip;			public class yellowPear extends MovieClip {						public function yellowPear() {			this.x = randomRange(-400, 400);			this.y = randomRange(-400, 0);  			this.scaleX = 0.3; 			this.scaleY = 0.3;		}				public function randomRange(minNum:Number, maxNum:Number):Number {			return (Math.floor(Math.random()*(maxNum - minNum +1)) + minNum);		}			}	}