﻿package  {		import flash.display.MovieClip;	import flash.events.*;	import flash.net.*;	import flash.geom.ColorTransform;	import flash.utils.getDefinitionByName;	import flashx.textLayout.elements.GlobalSettings;			public class treeContainer extends MovieClip {				public var DC;		public var treeIndex:Number;		var leafArray:Array = new Array();		var fruitArray:Array = new Array();		public var newTweetNumber:Number = 0;		public var newFruitsNumber:Number = 0;		public var oldTweetArrayLength;		public var oldFruitArrayLength;		//public var mainClass:main;		public var jcode:jsoncode;		public var tweetTag:String;		public var fruitTag:String;		public var falseTweets:Number = 1;		public var falseFruitTweets:Number = 1;		public var startingX:Number;				public function treeContainer(DC, treeIndex, tweetTag) {			this.tweetTag = tweetTag;			this.fruitTag = fruitTag;			this.DC = DC;			this.y = 500;			this.x = 0;			this.startingX = 1000;			this.alpha = 1;			this.scaleX = 1; 			this.scaleY = 1;			this.treeIndex = treeIndex			this.jcode = new jsoncode();			this.oldTweetArrayLength = oldTweetArrayLength;			this.oldFruitArrayLength = oldFruitArrayLength;						this.stop();						loadTreeExtras(this.treeIndex);			loadTweetArray(new Array());					}		("swapSight", "via","airmen","cp2","threelar","augo","mctv","dragon","edge","other");				public function loadTreeExtras(index) {			/////////SWAP SWIGHT////////////			if (index == 0 ) {				this.x = 1300				this.startingX = 1300				var grassFantastic3 = new smallGrass1(-1100, 150, 0.5);				addChild(grassFantastic3);				var grassFantastic2 = new smallGrass2(-650, 100, 0.2);				addChild(grassFantastic2);				var tulipFantastic1 = new tulipOrange(-70, 250, 0.1);				addChild(tulipFantastic1);				var grassFantastic4 = new largeGrass3(-100, 250, 0.2);				addChild(grassFantastic4);				var tulipFantastic3 = new tulipRed(-40, 250, 0.1);				addChild(tulipFantastic3);				var tulipFantastic2 = new tulipOrange(-50, 250, 0.12);				addChild(tulipFantastic2);				var tree0 = new trunk(this.DC, 0, 50, 1);				addChild(tree0);				var jenga = new jengaGame(this.DC);				addChild(jenga);				var grassFantastic1 = new smallGrass1(-770, 300, 0.7);				addChild(grassFantastic1);				var fantastic = new signpostFantastic(this.DC);				addChild(fantastic);				var bushFantastic = new largeBushOne(360, 475, 0.3);				addChild(bushFantastic);			}			/////////////////VIA//////////////////			else if (index == 1 ) {				this.x = 1400; 				this.startingX = 1100;				var river = new river2;				addChild(river);				var tree1 = new trunk(this.DC, 0, 100, 1);				addChild(tree1);				var riverFront = new riverFront2;				addChild(riverFront);				var flag = new pirateFlag(this.DC);				addChild(flag);				var ship = new pirateShip(this.DC);				addChild(ship);				var via = new signpostVia(this.DC);				addChild(via);				var grassVia = new largeGrass3(525, 450, 0.45);				addChild(grassVia);			}			///////////AIRMEN///////////////////			else if (index == 2 ) {				this.x = 1400; 				this.startingX = 600;				var plane = new airplane(this.DC);				addChild(plane);				var tree2 = new trunk(this.DC, 0, 150, 1);				addChild(tree2);				var billboard = new billboard2(this.DC);				addChild(billboard);				var table = new foldingTable2;				addChild(table);				var globe = new globe2(this.DC);				addChild(globe);				var paper = new paperSheet;				addChild(paper);				var airmen = new signpostAirmen(this.DC);				addChild(airmen);				var poppy = new poppy2(this.DC, 1070, 365, 0.2);				addChild(poppy);				var grassAirmen = new largeGrass2(-600, 480, 0.7);				addChild(grassAirmen);			}			//////////////CP2//////////////////////			else if (index == 3 ) {				this.x = 1400; 				this.startingX = 900;				var bTree5 = new bushyTree(this.DC, 0, 110, 1);				addChild(bTree5);				var bTree7 = new bushyTree(this.DC, 400, 120, 1);				addChild(bTree7);				var bTree3 = new bushyTree(this.DC, -400, 130, 1);				addChild(bTree3);				var bTree6 = new bushyTree(this.DC, 200, 130, 1);				addChild(bTree6);				var bTree9 = new bushyTree(this.DC, 800, 130, 1);				addChild(bTree9);				var bTree2 = new bushyTree(this.DC, -600, 140, 0.9);				addChild(bTree2);				var bTree4 = new bushyTree(this.DC, -200, 140, 1);				addChild(bTree4);				var bTree10 = new bushyTree(this.DC, 1000, 140, 1);				addChild(bTree10);				var bTree0 = new bushyTree(this.DC, -1000, 150, 1);				addChild(bTree0);				var bTree1 = new bushyTree(this.DC, -800, 150, 1);				addChild(bTree1);				var bTree8 = new bushyTree(this.DC, 600, 150, 1);				addChild(bTree8);				var Ladder = new ladder2;				addChild(Ladder);				var tree3 = new trunk(this.DC, -200, 100, 1);				addChild(tree3);				var smallBushCP2 = new smallBush(-600, 290, 1);				addChild(smallBushCP2);				var rabbit = new rabbit2(this.DC, -650, 300, 0.7);				addChild(rabbit);				var smallRabbit = new rabbit2(this.DC, -300, 150, 0.1);				addChild(smallRabbit);				var largeBushCP2 = new largeBushOne(-800, 330, 0.5);				addChild(largeBushCP2);				var cp2 = new signpostCP2(this.DC);				addChild(cp2);				var grassCP1 = new largeGrass2(-900, 480, 0.7);				addChild(grassCP1);				var grassCP2 = new longGrass(750, 430, 1);				addChild(grassCP2);											}			/////////////3LAR/////////////////////			else if (index == 4 ) {				this.x = 1400; 				this.startingX = 1200;				var seeSaw = new seesaw(this.DC);				addChild(seeSaw);				var swing = new swing2(this.DC);				addChild(swing);				var tree4 = new trunk(this.DC, 100, 0, 1);				addChild(tree4);				var threelar = new signpost_threelar(this.DC);				addChild(threelar);				var bird = new bird2(this.DC);				addChild(bird);				var dandelion = new dandelion2(-1020, 280, 0.1);				addChild(dandelion);				var snowbells1 = new snowbells2(470, 450, 0.1);				addChild(snowbells1);				var grassThreelar3 = new smallGrass1(-700, 300, 0.5);				addChild(grassThreelar3);				var grassThreelar2 = new smallGrass(-100, 500, 1);				addChild(grassThreelar2);				var grassThreelar1 = new mediumGrass(-1300, 500, 1)				addChild(grassThreelar1);							}			/////////////AUGO//////////////////////////			else if (index == 5 ) {				this.x = 1400; 				this.startingX = 1100;				var mario = new mario2(this.DC);				addChild(mario);				var tree5 = new trunk(this.DC, 0, 0, 1);				addChild(tree5);				var track = new racingTrack();				addChild(track);				var hillTrack = new hillTrack2;				addChild(hillTrack);				var toad = new toadCharacter(this.DC);				addChild(toad);				var augo = new signpostAugo(this.DC);				addChild(augo);				var bushAugo1 = new largeBushTwo(-1000, 300, 0.9);				addChild(bushAugo1);				var bushAugo2 = new smallBush(-1100, 350, 0.8);				addChild(bushAugo2);				var grassAugo1 = new smallGrass1(-600, 300, 0.5);				addChild(grassAugo1);				var grassAugo3 = new smallGrass1(-450, 150, 0.2);				addChild(grassAugo3);				var grassAugo2 = new smallGrass2(600, 445, 0.6);				addChild(grassAugo2);				var grassAugo4 = new largeGrass2(50, 460, 1);				addChild(grassAugo4);				var flowerAugo = new blueFlower(50, 530, 0.2);				addChild(flowerAugo);							}			////////////////MCTV///////////////////////			else if (index == 6 ) {				this.x = 1400; 				this.startingX = 600; 				var tree6 = new trunk(this.DC, 0, 0, 1);				addChild(tree6);				var bench = new parkBench;				addChild(bench);				var path = new parkPath;				addChild(path);				var pond = new parkPond;				addChild(pond);				var mctv = new signpostMCTV(this.DC);				addChild(mctv);			}			/////////////////DRAGON/////////////////			else if (index == 7 ) {				this.x = 1400; 				this.startingX = 1200;				var tree7 = new trunk(this.DC, 0, 0, 1);				addChild(tree7);				var roady = new road2;				addChild(roady);				var busStop = new busStop2;				addChild(busStop);				var dragon = new signpostDragon(this.DC);				addChild(dragon);			}			///////////////////DECO////////////////////			else if (index == 8 ) {				this.x = 1400; 				this.startingX = 1000;				var tree8 = new trunk(this.DC, 0, 0, 1);				addChild(tree8);				var BUGNEST = new bugNest(this.DC);				addChild(BUGNEST);			}			/////////////////////OTHER///////////////////			else if (index == 9 ) {				var tree9 = new trunk(this.DC, 0, 0, 1);				addChild(tree9);				this.x = 1400; 				this.startingX = 1000;			}								}		/*public function loadTweets () {			var tweetLoader:URLLoader = new URLLoader();			tweetLoader.load(new URLRequest("https://api.twitter.com/1/statuses/user_timeline.xml?screen_name=alexshak"));			tweetLoader.addEventListener(Event.COMPLETE, loadTweetArray); 								}*/				/*public function getFakeTweets() {			var fakeTweets:Array = new Array();			for (var i:Number=0; i<20;i++){				var tweetText = "hello world "+i;				fakeTweets.push(tweetText);			}			return fakeTweets;		}*/				public function loadTweetArray(tweets:Array):void { 		//trace("LOAD TWEET ARRAY");			newTweetNumber = tweets.length - this.oldTweetArrayLength; 			newFruitsNumber = fruitTweets.length - this.oldFruitArrayLength;				//trace ("NEWTWEETNUMBER", newTweetNumber);			//trace ("TWEETLENGTH", tweets.length);			if(falseTweets < 3){				var tweetStart = 0;				falseTweets += 1;				//trace("this is when false", tweetStart);			}			else {				tweetStart = tweets.length-newTweetNumber;				//trace("this is when true", tweetStart);			};			//var myXML:XML = new XML(e.target.data);			for (var i:Number=tweetStart; i<tweets.length;i++){ 				//var xmlTweet = myXML.status[i].text;				//this.DC.tweetArray.push(xmlTweet); 				var xPos = this.DC.randomRange(-300, 400);				var yPos = this.DC.randomRange(-400, 0);				var zRot = this.DC.randomRange(0, 40);				createLeaf(tweets[i],xPos,yPos,zRot);			};			this.oldTweetArrayLength = tweets.length;			// ---------FRUITS------------------------------------						if(falseFruitTweets < 3){				var tweetFruitStart = 0;				falseFruitTweets += 1;			}			else {				tweetFruitStart = fruitTweets.length-newFruitsNumber;			};			for (var o:Number=tweetFruitStart; o<fruitTweets.length;o++){  				var xFruitPos = this.DC.randomRange(-300, 400);				var yFruitPos = this.DC.randomRange(-400, 0);				var zFruitRot = this.DC.randomRange(0, 40);				createFruit(fruitTweets[o],xFruitPos,yFruitPos,zFruitRot);			};			this.oldFruitArrayLength = fruitTweets.length;			for (var q:Number=0; q<leafArray.length;q++){				this.addChild(leafArray[q]); 			};			for (var w:Number=0; w<fruitArray.length;w++){				this.addChild(fruitArray[w]);			};		} 				//insert tweets to leaves here		public function createLeaf(tweetText,xPos,yPos,zRot) {			//trace("tweets: "+jcode.tweets);			var leaves:leafContainer = new leaf(tweetText, xPos, yPos, zRot);			for(var Li:Number=0; Li<leafArray.length-1;Li++){				if(leafContainer.hitTestObject(leafArray[Li])){				   leafContainer.x = this.DC.randomRange(-300, 400);				   leafContainer.y = this.DC.randomRange(-400, 0);				   }			}			for(var Fi:Number=0; Fi<leafArray.length-1;Fi++){				if(leafContainer.hitTestObject(fruitArray[Fi])){				   leafContainer.x = this.DC.randomRange(-300, 400);				   leafContainer.y = this.DC.randomRange(-400, 0);				   }			}						leafArray.push(leaves);		}				public function createFruit(tweetText, xPos, yPos, zRot){			//var myClass:Class = getDefinitionByName(fruitName) as Class;			trace(this.fruitTag);			var fruits = new masterFruit(tweetText, xPos, yPos, zRot, this.fruitTag);			//IMPLEMENT OTHER FRUITS			fruitArray.push(fruits);			//trace("Fruits");fruitName:String, 		} 					}	}