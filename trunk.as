﻿package  {		import flash.display.MovieClip;	import flash.events.*;	import flash.net.*;	import flash.geom.ColorTransform;			public class trunk extends MovieClip {				public var DC;		public var xD;		var leafArray:Array = new Array();				public function trunk(DC, scale, treeX, xDisp) {						this.DC = DC;			this.x = treeX;			this.y = 384;			this.scaleX = scale;			this.scaleY = scale;			this.xD = xDisp;						this.loadTweetArray();					}		public function loadTweets () {			var tweetLoader:URLLoader = new URLLoader();			tweetLoader.load(new URLRequest("https://api.twitter.com/1/statuses/user_timeline.xml?screen_name=alexshak"));			tweetLoader.addEventListener(Event.COMPLETE, loadTweetArray); 								}		public function loadTweetArray():void { 			//var myXML:XML = new XML(e.target.data);			for (var i:Number=0; i<100;i++){				//var xmlTweet = myXML.status[i].text;				//this.DC.tweetArray.push(xmlTweet); 				var xPos = this.DC.randomRange(-300, 400);				var yPos = this.DC.randomRange(-400, 0);				var zRot = this.DC.randomRange(10, 170);				var leaves:leaf = new leaf("test test test test test test test test test test test test test test test test test test test test test test test test test test ", xPos, yPos, zRot);				var my_color:ColorTransform = new ColorTransform();				my_color.alphaMultiplier = 0.8;				//my_color.blueOffset = randomRange(-255, 255);				my_color.greenOffset = this.DC.randomRange(-100, 150);				my_color.redOffset = this.DC.randomRange(-50, 150);				leaves.transform.colorTransform = my_color;				leafArray.push(leaves);			};			//Adds Leaves to the stage			for (var q:Number=0; q<leafArray.length;q++){				this.addChild(leafArray[q]); 			};		} 			}	}