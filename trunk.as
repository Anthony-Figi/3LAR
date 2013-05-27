﻿package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.net.*;
	import flash.geom.ColorTransform;
	import flash.utils.getDefinitionByName;
	import flashx.textLayout.elements.GlobalSettings;
	
	
	public class trunk extends MovieClip {
		
		public var DC;
		public var treeIndex:Number;
		var leafArray:Array = new Array();
		var fruitArray:Array = new Array();
		public var newTweetNumber:Number = 0;
		public var oldTweetArrayLength;
		//public var mainClass:main;
		public var jcode:jsoncode;
		public var tweetTag:String;
		public var falseTweets:Number = 1;
		public var startingX:Number;
		
		public function trunk(DC, treeIndex, tweetTag) {
			this.tweetTag = tweetTag;
			this.DC = DC;
			this.y = 500;
			this.x = 0;
			this.startingX = 1000;
			this.alpha = 1;
			this.scaleX = 1; 
			this.scaleY = 1;
			this.treeIndex = treeIndex
			this.jcode = new jsoncode();
			this.oldTweetArrayLength = oldTweetArrayLength;
			
			this.stop();			
			loadTreeExtras(this.treeIndex);
			loadTweetArray(new Array());
			
		}
		("swapSight", "via","airmen","cp2","threelar","augo","mctv","dragon","edge","other");
		
		public function loadTreeExtras(index) {
			/////////SWAP SWIGHT////////////
			if (index == 0 ) {
				this.x = 700;
				this.startingX = 700;
				this.alpha = 1;
				this.scaleX = 1; 
				this.scaleY = 1;
				var testGrass = new largeGrass2();
				addChild(testGrass);
				var jenga = new jengaGame;
				addChild(jenga);
				var fantasic = new signpostFantastic;
				addChild(fantastic);
			}
			/////////////////VIA//////////////////
			else if (index == 1 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
				testGrass = new largeGrass2();
				addChild(testGrass);
				var flag = new pirateFlag;
				addChild(flag);
				var ship = new pirateShip;
				addChild(ship);
				var river = new river;
				addChild(river);
				var riverFront = new riverFront;
				addChild(riverFront);
				var via = new signpostVIA;
				addChild(via);
			}
			///////////AIRMEN///////////////////
			else if (index == 2 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
				testGrass = new largeGrass3();
				addChild(testGrass);
				var testFruit = new RedPear();
				addChild(testFruit);
				var billboard = new billboard;
				addChild(billboard);
				var table = new foldingTable;
				addChild(table);
				var globe = new globe;
				addChild(globe);
				var plane = new airplane;
				addChild(plane);
				var paper = new paperSheet;
				addChild(paper);
				var airmen = new signpostAirmen;
				addChild(airmen);
				var poppy = new poppy;
				addChild(poppy);
			}
			//////////////CP2//////////////////////
			else if (index == 3 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
				testGrass = new mediumGrass();
				addChild(testGrass);
				var testGrass2 = new mediumGrass();
				addChild(testGrass2);
				var ladder = new ladder;
				addChild(ladder);
				var rabbit = new rabbit;
				addChild(rabbit);
				var bTree = new bushyTree;
				addChild(bTree);
				var cp2 = new signpostCP2;
				addChild(cp2);
			}
			/////////////3LAR/////////////////////
			else if (index == 4 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2; 
				var seeSaw = new seesaw;
				addChild(seeSaw);
				var swing = new swing;
				addChild(swing);
				var bird = new bird;
				addChild(bird);
				var threelar = new signpost_threelar;
				addChild(threelar);
				var dandelion = new dandelion;
				addChild(dandelion);
				var snowbells1 = new snowbells;
				addChild(snowbells1);
				
			}
			/////////////AUGO//////////////////////////
			else if (index == 5 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
				testGrass = new longGrass();
				addChild(testGrass);
				var track = new racingTrack;
				addChild(track);
				var hillTrack = new hillTrack;
				addChild(hillTrack);
				new toadCharacter = new toadCharacter;
				addChild(toad);
				var mario = new mario;
				addChild(mario);
				var augo = new signpostAugo;
				addChild(augo);
			}
			////////////////MCTV///////////////////////
			else if (index == 6 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2; 
				testGrass = new smallGrass();
				addChild(testGrass);
				testGrass2 = new smallGrass();
				addChild(testGrass2);
				var testGrass3 = new smallGrass();
				addChild(testGrass3);
				var testGrass4 = new smallGrass();
				addChild(testGrass4);
				var bench = new parkBench;
				addChild(bench);
				var path = new parkPath;
				addChild(path);
				var pond = new parkPond;
				addChild(pond);
				var mctv = new signpostMCTV;
				addChild(mctv);
			}
			/////////////////DRAGON/////////////////
			else if (index == 7 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2; 
				testGrass = new largeGrass2();
				addChild(testGrass);
				var road = new road;
				addChild(road);
				var busStop = new busStop;
				addChild(busStop);
				var dragon = new signpostDragon;
				addChild(dragon);
			}
			///////////////////EDGE////////////////////
			else if (index == 8 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
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
			/////////////////////OTHER///////////////////
			else if (index == 9 ) {
				this.x = 1400; 
				this.startingX = 1000;
				this.scaleX = 0.2;
				this.scaleY = 0.2;
				this.alpha = 0.2;
				testGrass = new smallGrass2();
				addChild(testGrass);
			}
			
			
		}

		/*public function loadTweets () {
			var tweetLoader:URLLoader = new URLLoader();
			tweetLoader.load(new URLRequest("https://api.twitter.com/1/statuses/user_timeline.xml?screen_name=alexshak"));
			tweetLoader.addEventListener(Event.COMPLETE, loadTweetArray); 
						
		}*/
		
		/*public function getFakeTweets() {
			var fakeTweets:Array = new Array();
			for (var i:Number=0; i<20;i++){
				var tweetText = "hello world "+i;
				fakeTweets.push(tweetText);
			}
			return fakeTweets;
		}*/
		

		public function loadTweetArray(tweets:Array):void { 
		//trace("LOAD TWEET ARRAY");
			newTweetNumber = tweets.length - this.oldTweetArrayLength; 
			//trace ("NEWTWEETNUMBER", newTweetNumber);
			//trace ("TWEETLENGTH", tweets.length);
			if(falseTweets < 3){
				var tweetStart = 0;
				falseTweets += 1;
				//trace("this is when false", tweetStart);
			}
			else {
				tweetStart = tweets.length-newTweetNumber;
				//trace("this is when true", tweetStart);
			};
			//var myXML:XML = new XML(e.target.data);
			for (var i:Number=tweetStart; i<tweets.length;i++){ 
				//var xmlTweet = myXML.status[i].text;
				//this.DC.tweetArray.push(xmlTweet); 
				var xPos = this.DC.randomRange(-300, 400);
				var yPos = this.DC.randomRange(-400, 0);
				var zRot = this.DC.randomRange(0, 40);
				createLeaf(tweets[i],xPos,yPos,zRot);
				createFruit("redApple", tweets[i]+"FRUITTWEET",xPos,yPos,zRot);
			};
			this.oldTweetArrayLength = tweets.length;
			//trace("UPDATE TWEET LENGTH", this.oldTweetArrayLength);
			//Adds Leaves to the stage
			for (var q:Number=0; q<leafArray.length;q++){
				this.addChild(leafArray[q]); 
			};

		} 
		//insert tweets to leaves here
		public function createLeaf(tweetText,xPos,yPos,zRot) {
			//trace("tweets: "+jcode.tweets);
			var leaves:leaf = new leaf(tweetText, xPos, yPos, zRot);
			var my_color:ColorTransform = new ColorTransform();
			my_color.alphaMultiplier = 1;
			//my_color.blueOffset = randomRange(-255, 255);
			my_color.greenOffset = this.DC.randomRange(-100, 150);
			my_color.redOffset = this.DC.randomRange(-50, 150);
			leaves.transform.colorTransform = my_color;
			leafArray.push(leaves);
		}
		
		public function createFruit(fruitName:String, tweetText, xPos, yPos, zRot){
			var myClass:Class = getDefinitionByName(fruitName) as Class;
			var fruits:Fruit = new myClass(tweetText, xPos, yPos, zRot);
			fruitArray.push(fruits);
			//trace("Fruits");
		} 
		
		
	}
	
}
