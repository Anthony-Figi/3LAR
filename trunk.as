﻿package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.geom.ColorTransform;
	
	
	public class trunk extends MovieClip {
		
		public var DC;
		public var treeIndex:Number;
		var leafArray:Array = new Array();
		
		public function trunk(DC, zPos, treeX, treeIndex) {
			
			this.DC = DC;
			this.x = treeX;
			this.y = 384;
			this.z = zPos
			this.treeIndex = treeIndex
			this.alpha = 1;
			this.scaleX = 1.5; 
			this.scaleY = 1.5;
						
			loadTreeExtras(this.treeIndex);
			loadTweetArray();
			
		}
		
		public function loadTreeExtras(index) {
			if (index == 0 ) {
				var testGrass = new largeGrass2();
				addChild(testGrass);
			}
			else if (index == 1 ) {
				testGrass = new largeGrass2();
				addChild(testGrass);
			}
			else if (index == 2 ) {
				testGrass = new largeGrass3();
				addChild(testGrass);
				var testFruit = new RedPear();
				addChild(testFruit);
			}
			else if (index == 3 ) {
				testGrass = new mediumGrass();
				addChild(testGrass);
				var testGrass2 = new mediumGrass();
				addChild(testGrass2);
			}
			else if (index == 4 ) {
				testFruit = new RedPear();
				addChild(testFruit);
				var testFruit2 = new RedPear();
				addChild(testFruit2);
				var testFruit3 = new RedPear();
				addChild(testFruit3);
			}
			else if (index == 5 ) {
				testGrass = new longGrass();
				addChild(testGrass);
				testFruit = new yellowPear();
				addChild(testFruit);
				testFruit2 = new yellowPear();
				addChild(testFruit2);
			}
			else if (index == 6 ) {
				testGrass = new smallGrass();
				addChild(testGrass);
				testGrass2 = new smallGrass();
				addChild(testGrass2);
				var testGrass3 = new smallGrass();
				addChild(testGrass3);
				var testGrass4 = new smallGrass();
				addChild(testGrass4);
			}
			else if (index == 7 ) {
				testGrass = new largeGrass2();
				addChild(testGrass);
				testFruit = new redApple();
				addChild(testFruit);
				testFruit2 = new redApple();
				addChild(testFruit2);
			}
			else if (index == 8 ) {
				testGrass = new smallGrass2();
				addChild(testGrass);
				var testGrass1 = new smallGrass2();
				addChild(testGrass1);
				testGrass2 = new smallGrass2();
				addChild(testGrass2);
				testGrass3 = new smallGrass2();
				addChild(testGrass3);
				testGrass4 = new smallGrass2();
				addChild(testGrass4);
				var testGrass5 = new smallGrass2();
				addChild(testGrass5);
			}
			else if (index == 9 ) {
				testGrass = new smallGrass2();
				addChild(testGrass);
			}
			
			
		}

		public function loadTweets () {
			var tweetLoader:URLLoader = new URLLoader();
			tweetLoader.load(new URLRequest("https://api.twitter.com/1/statuses/user_timeline.xml?screen_name=alexshak"));
			tweetLoader.addEventListener(Event.COMPLETE, loadTweetArray); 
						
		}
		
		//NURKA - TAKE HASHTAGE ARRAY AND GENERATE ONE LEAF PER ENTRY BY CHANGING loadTweetArray

		public function loadTweetArray():void { 
			//var myXML:XML = new XML(e.target.data);
			for (var i:Number=0; i<20;i++){ //NOT 20 LEAVES BUT THE NUMBER OF TWITTER ENTRIES
				//var xmlTweet = myXML.status[i].text;
				//this.DC.tweetArray.push(xmlTweet); 
				var xPos = this.DC.randomRange(-300, 400);
				var yPos = this.DC.randomRange(-400, 0);
				var zRot = this.DC.randomRange(0, 40);
				var leaves:leaf = new leaf("This is a test tweet. It is 140 characters long. Really. We have tested it. We will continue to test it until it is exactly 140 characters.", xPos, yPos, zRot);
				var my_color:ColorTransform = new ColorTransform();
				my_color.alphaMultiplier = 0.8;
				//my_color.blueOffset = randomRange(-255, 255);
				my_color.greenOffset = this.DC.randomRange(-100, 150);
				my_color.redOffset = this.DC.randomRange(-50, 150);
				leaves.transform.colorTransform = my_color;
				leafArray.push(leaves);
			};
			//Adds Leaves to the stage
			for (var q:Number=0; q<leafArray.length;q++){
				this.addChild(leafArray[q]); 
			};

		} 
		
		
		
	}
	
}
