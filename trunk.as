﻿package  {		import flash.display.MovieClip;	import flash.events.*;	import flash.net.*;	import flash.geom.ColorTransform;			public class trunk extends MovieClip {				public var DC;		public var treeIndex:Number;		var leafArray:Array = new Array();		//public var mainClass:main;		public var jcode:jsoncode;		public var tweetTag:String;				public function trunk(DC, zPos, treeX, treeIndex, tweetTag) {			this.tweetTag = tweetTag;			this.DC = DC;			this.x = treeX;			this.y = 384;			this.z = zPos;			this.treeIndex = treeIndex;			this.alpha = 1;			this.scaleX = 1.5; 			this.scaleY = 1.5;			//this.mainClass = new main();			this.jcode = new jsoncode();									loadTreeExtras(this.treeIndex);			//jcode.getArrayData();			//trace("tweets: "+jcode.tweets);			loadTweetArray(new Array());					}				public function loadTreeExtras(index) {			if (index == 0 ) {				var testGrass = new largeGrass2();				addChild(testGrass);			}			else if (index == 1 ) {				testGrass = new largeGrass2();				addChild(testGrass);			}			else if (index == 2 ) {				testGrass = new largeGrass3();				addChild(testGrass);				var testFruit = new RedPear();				addChild(testFruit);			}			else if (index == 3 ) {				testGrass = new mediumGrass();				addChild(testGrass);				var testGrass2 = new mediumGrass();				addChild(testGrass2);			}			else if (index == 4 ) {				testFruit = new RedPear();				addChild(testFruit);				var testFruit2 = new RedPear();				addChild(testFruit2);				var testFruit3 = new RedPear();				addChild(testFruit3);			}			else if (index == 5 ) {				testGrass = new longGrass();				addChild(testGrass);				testFruit = new yellowPear();				addChild(testFruit);				testFruit2 = new yellowPear();				addChild(testFruit2);			}			else if (index == 6 ) {				testGrass = new smallGrass();				addChild(testGrass);				testGrass2 = new smallGrass();				addChild(testGrass2);				var testGrass3 = new smallGrass();				addChild(testGrass3);				var testGrass4 = new smallGrass();				addChild(testGrass4);			}			else if (index == 7 ) {				testGrass = new largeGrass2();				addChild(testGrass);				testFruit = new redApple();				addChild(testFruit);				testFruit2 = new redApple();				addChild(testFruit2);			}			else if (index == 8 ) {				testGrass = new smallGrass2();				addChild(testGrass);				var testGrass1 = new smallGrass2();				addChild(testGrass1);				testGrass2 = new smallGrass2();				addChild(testGrass2);				testGrass3 = new smallGrass2();				addChild(testGrass3);				testGrass4 = new smallGrass2();				addChild(testGrass4);				var testGrass5 = new smallGrass2();				addChild(testGrass5);			}			else if (index == 9 ) {				testGrass = new smallGrass2();				addChild(testGrass);			}								}		/*public function loadTweets () {			var tweetLoader:URLLoader = new URLLoader();			tweetLoader.load(new URLRequest("https://api.twitter.com/1/statuses/user_timeline.xml?screen_name=alexshak"));			tweetLoader.addEventListener(Event.COMPLETE, loadTweetArray); 								}*/				/*public function getFakeTweets() {			var fakeTweets:Array = new Array();			for (var i:Number=0; i<20;i++){				var tweetText = "hello world "+i;				fakeTweets.push(tweetText);			}			return fakeTweets;		}*/				public function loadTweetArray(tweets:Array):void { 		trace("LOAD TWEET ARRAY");			for (var q2:Number=leafArray.length-1; q2>-1;q2--){				if(this.contains(leafArray[q2])) {					this.removeChild(leafArray[q2]); 				}				leafArray.splice(leafArray.indexOf(leafArray[q2]),1);			};			//var myXML:XML = new XML(e.target.data);			for (var i:Number=0; i<tweets.length;i++){ 				//var xmlTweet = myXML.status[i].text;				//this.DC.tweetArray.push(xmlTweet); 				var xPos = this.DC.randomRange(-300, 400);				var yPos = this.DC.randomRange(-400, 0);				var zRot = this.DC.randomRange(0, 40);				createLeaf(tweets[i],xPos,yPos,zRot);			};			//Adds Leaves to the stage			for (var q:Number=0; q<leafArray.length;q++){				this.addChild(leafArray[q]); 			};		} 		//insert tweets to leaves here		public function createLeaf(tweetText,xPos,yPos,zRot) {			trace("tweets: "+jcode.tweets);			var leaves:leaf = new leaf(tweetText, xPos, yPos, zRot);			var my_color:ColorTransform = new ColorTransform();			my_color.alphaMultiplier = 0.8;			//my_color.blueOffset = randomRange(-255, 255);			my_color.greenOffset = this.DC.randomRange(-100, 150);			my_color.redOffset = this.DC.randomRange(-50, 150);			leaves.transform.colorTransform = my_color;			leafArray.push(leaves);		}							}	}