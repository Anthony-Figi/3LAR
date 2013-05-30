﻿	package  {		import flash.display.MovieClip;	import flash.display.Bitmap;	import flash.geom.ColorTransform;	import com.caurina.transitions.Tweener;	import com.caurina.transitions.properties.SoundShortcuts;	import flash.events.*;	import flash.net.*;	import flash.display.Sprite;	import flash.utils.getTimer;	import flash.utils.Timer;	import flash.events.TimerEvent;	import flash.display.Loader;	import flash.media.Sound;	import flash.media.SoundChannel;	import flash.media.SoundTransform;		import com.as3nui.nativeExtensions.air.kinect.Kinect;	import com.as3nui.nativeExtensions.air.kinect.KinectSettings;	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;	import com.as3nui.nativeExtensions.air.kinect.constants.CameraResolution;	import com.as3nui.nativeExtensions.air.kinect.data.DeviceCapabilities;	import com.as3nui.nativeExtensions.air.kinect.data.SkeletonJoint;	import com.as3nui.nativeExtensions.air.kinect.data.User;	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;	import com.as3nui.nativeExtensions.air.kinect.events.DeviceErrorEvent;	import com.as3nui.nativeExtensions.air.kinect.events.DeviceEvent;	import com.as3nui.nativeExtensions.air.kinect.events.DeviceInfoEvent;	import com.as3nui.nativeExtensions.air.kinect.events.UserEvent;		import com.tonybeltramelli.airkinect.ActionManager;	import com.tonybeltramelli.airkinect.debug.KinectDebugger;	import com.tonybeltramelli.airkinect.userAction.dispatcher.ActionSignalDispatcher;	import com.tonybeltramelli.airkinect.userAction.event.KinectGestureEvent;	import com.tonybeltramelli.airkinect.userAction.event.KinectMovementEvent;	import com.tonybeltramelli.airkinect.userAction.gesture.HorizontalSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.LeftSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.RightSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.UpSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.DownSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.DepthSwipe;	import com.tonybeltramelli.airkinect.userAction.gesture.settings.part.GesturePart;	import com.tonybeltramelli.airkinect.userAction.movement.JumpMovement;			public class main extends MovieClip {						public var depthBitmap;				public function main() {						this.tweetArray = tweetArray;			this.treeArray = treeArray;			this.loadingKinect = new loadingSign;			this.userOne = userOne;			this.userTwo = userTwo;			this.backNight = new night(this, true);			this.backgrnd = new backgroundArt(this);			this.sunny = new sun (this);			this.frontNight = new night (this, false);			this.cloudCover = new clouds();			this.rainy = new rain();			this.userOneLeftHand = null;			this.userOneRightHand = null;			this.leftSprites = leftSprites;			this.rightSprites = rightSprites;			this.gameOn = gameOn;			this.scoreDisplay = scoreDisplay;						this.jcode = new jsoncode();						this.swapSight = swapSight;			this.via = via;			this.airmen = airmen;			this.cp2 = cp2;			this.threelar = threelar;			this.augo = augo;			this.mctv = mctv;			this.dragon = dragon;			this.edge = edge;			this.found = found;			this.other = other;			this.loadedTweets = false;						this.addChild(this.backNight);			this.addChild(this.sunny);			this.addChild(this.cloudCover);			this.addChild(this.backgrnd);									initForest();			initKinect();			initGestures();			this.addChild(this.frontNight);									stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);		}				public function depthImageUpdateHandler(event:CameraImageEvent):void {    	depthBitmap.bitmapData = event.imageData;		}		//////////////////////////FOREST AND TWEET FUNCTIONS///////////////////////////////////////////////////		public var backgrnd:backgroundArt;		public var sunny:sun;		public var rainy:rain;		public var cloudCover:clouds;		public var frontNight:night;		public var backNight:night;		public var frames:int=0;		public var prevTimer:Number=0;		public var curTimer:Number=0;		public  var jcode:jsoncode;		//tweet hashtag holding arrays		public var swapSight:Array = new Array();		public var via:Array = new Array();		public var airmen:Array = new Array();		public var cp2:Array = new Array();		public var threelar:Array = new Array();		public var augo:Array = new Array();		public var mctv:Array = new Array();		public var dragon:Array = new Array();		public var edge:Array = new Array();		public var other:Array = new Array();		public var found:Boolean;		public var loadedTweets:Boolean = false;				public var redApple:Array = new Array();		public var apricot:Array = new Array();		public var greenApple:Array = new Array();		public var mango:Array = new Array();		public var redPear:Array = new Array();		public var banana:Array = new Array();		public var yellowPear:Array = new Array();		public var lemon:Array = new Array();		public var grapefruit:Array = new Array();		public var orange:Array = new Array();				public var tree;		public var leaves;		public var foreground;		public var tweetArray:Array = new Array();		public var treeArray:Array = new Array();						public function initForest() {			//Array that holds tree tags			var tags:Array = new Array("swapSight", "via","airmen","cp2","threelar","augo","mctv","dragon","edge","other");			var fruitTags:Array = new Array("mango", "apricot", "yellowPear", "mango", "lemon", "banana", "greenApple", "redPear", "orange", "grapefruit");			//Add Trees to array			for (var i:Number=0; i<tags.length; i++) {				var tree = new treeContainer(this, i, tags[i], fruitTags[i]);				//tree.cacheAsBitmap = true;				//trace("created TREES");				treeArray.push(tree);				};						//treeArray.sortOn( "z", Array.NUMERIC | Array.DESCENDING );			addChild(treeArray[0]);			focusTree = 0			addChild(this.loadingKinect);											}				public function sortTweets(){			var count:int = 1;			//jcode.changed checks if jsoncode changed it's state, if yes then sort new tweets			if(jcode.changed) {				trace("CHECKING TWEETS");				jcode.changed = false;				//trace(""+jcode.tweetUsers);			for (var i:Number=0; i<jcode.tweets.length; i++){				//trace ("tweet numer"+ (i+1) + jcode.tweets[i]);				found = false;				var repeated:Array = new Array();				var user:String = jcode.tweets[i].user+"";				//trace(user+"USER OF THE TWITTER");				var myString = jcode.tweets[i]+"";								if(myString.indexOf("#threelar") > -1) {					if(threelar.indexOf(myString) == -1){					threelar.push(myString);					   }					found = true;							}				if(myString.indexOf("#via") > -1) {					if(via.indexOf(myString) == -1){					via.push(myString);					}					found = true;				}				if(myString.indexOf("#airmen") > -1) {					if(airmen.indexOf(myString) == -1){					airmen.push(myString);					}					found = true;				}				if(myString.indexOf("#cp2") > -1) {					if(cp2.indexOf(myString) == -1){					cp2.push(myString);					}					found = true;				}				if(myString.indexOf("#swapsight") > -1) {					if(swapSight.indexOf(myString) == -1){					swapSight.push(myString);				}				//if(myString.indexOf("@flee1906") > -1) {					//treeArray[4].createFruit("RedApple", tweet, x, y, index);				//}					found = true;				}				if(myString.indexOf("#augo") > -1) {					if(augo.indexOf(myString) == -1){					augo.push(myString);					}					found = true;				}				if(myString.indexOf("#mctv") > -1) {					if(mctv.indexOf(myString) == -1){					mctv.push(myString);					}					found = true;				}				if(myString.indexOf("#dragon") > -1) {					if(dragon.indexOf(myString) == -1){					dragon.push(myString);					}					found = true;				}				if(myString.indexOf("#edge") > -1) {					if(edge.indexOf(myString) == -1){					edge.push(myString);					}					found = true;				}				if(found==false){					if(other.indexOf(myString) == -1){					other.push(myString);					}				}								//}			}						/*trace("length is : "+jcode.tweets.length);			trace("swapsight: "+swapSight);			trace("via :"+ via);			trace("airmen: "+ airmen);			trace("cp2: " + cp2);			trace("threelar: "+ threelar);			trace("repeated :"+ repeated);			trace("augo: "+ augo);			trace("mctv: "+ mctv);			trace("dragon: "+dragon);			trace("edge: "+ edge);			trace("other tweets: "+other);*/			//if tweets aren't up on trees yet, then load them						for(var i2:Number = 0; i2<treeArray.length; i2++) {					//trace("WORKING?");					if(this.loadedTweets == false) {						this.treeArray[i2].oldTweetArrayLength = (this[treeArray[i2].tweetTag] as Array).length;						this.treeArray[i2].oldFruitArrayLength = (this[treeArray[i2].fruitTag] as Array).length;						this.loadedTweets = true;					};					treeArray[i2].loadTweetArray(this[treeArray[i2].tweetTag], this[treeArray[i2].fruitTag]);			}		}		}				//////////////////////////GESTURE FUNCTIONS///////////////////////////////////////////////////		public var focusTree:Number;		public var animating:Boolean = false;		public var gameOn:Boolean = false;						public function keyDownHandler(event:KeyboardEvent):void {			trace("KEYBOARD!");			if(event.keyCode == 39) {				trace("left");				panTreesRight(null);			}			else if(event.keyCode == 37) {				trace("right");				panTreesLeft(null);			}			else if(event.keyCode == 82) {				trace("rain");				rainTime(null);			}			else if(event.keyCode == 87) {				trace("seasons");				changeSeason();			}			else if(event.keyCode == 66) {				trace("bugs");				waveOfBugs(null);			}			else if(event.keyCode == 73) {				trace("timeForward");				timeForward(null);			}			else if(event.keyCode == 85) {				trace("timeBack");				timeBack(null);			}		}						public function initGestures() {						var leftHandLeftSwipe : LeftSwipe = new LeftSwipe(GesturePart.LEFT_HAND);			leftHandLeftSwipe.dispatcher.addEventListener(KinectGestureEvent.LEFT_SWIPE, panTreesLeft);			_actionManager.add(leftHandLeftSwipe);						var rightHandRightSwipe : RightSwipe = new RightSwipe(GesturePart.RIGHT_HAND);			rightHandRightSwipe.dispatcher.addEventListener(KinectGestureEvent.RIGHT_SWIPE, panTreesRight);			_actionManager.add(rightHandRightSwipe);						var jumpMovement : JumpMovement = new JumpMovement(new ActionSignalDispatcher());			jumpMovement.dispatcher.addSignalListener(changeSeason);			_actionManager.add(jumpMovement);											/*	var rightHandUpSwipe : UpSwipe = new UpSwipe(GesturePart.RIGHT_HAND);			rightHandUpSwipe.dispatcher.addEventListener(KinectGestureEvent.UP_SWIPE, timeForward);			_actionManager.add(rightHandUpSwipe);						var rightHandDownSwipe : DownSwipe = new DownSwipe(GesturePart.RIGHT_HAND);			rightHandDownSwipe.dispatcher.addEventListener(KinectGestureEvent.DOWN_SWIPE, timeBack);			_actionManager.add(rightHandDownSwipe);*/						var leftHandDepthSwipe : DepthSwipe = new DepthSwipe(GesturePart.LEFT_HAND); 			leftHandDepthSwipe.dispatcher.addEventListener(KinectGestureEvent.FORWARD_SWIPE, testTap);			_actionManager.add(leftHandDepthSwipe);					}				public function timeForward(event: Event) {			trace(this.sunny.timeHappen);			if(this.sunny.timeHappen == false) {				this.sunny.changeTime(1.2);			}		}				public function timeBack(event: Event) {			trace(this.sunny.timeHappen);			if(this.sunny.timeHappen == false) {				this.sunny.changeTime(-1.2);			}		}				//Tracks Between Trees using keyboard/gestures		public function panTreesLeft(event : Event) {			if(focusTree != 9 && animating == false && this.gameOn != true) {				trace("panLEFT", focusTree);				animating = true;				Tweener.addTween(treeArray[focusTree], {							 x:-100,							 scaleX:0.2,							 scaleY:0.2,							 alpha:0.2,							 time:1.2, 							 onComplete:function() { removeChild(treeArray[focusTree]); focusTree += 1; }							 });				addChild(treeArray[focusTree+1]);				var topPosition:uint = this.numChildren-1;				this.setChildIndex(this.frontNight, topPosition);				Tweener.addTween(treeArray[focusTree+1], {							 x:treeArray[focusTree+1].startingX,							 scaleX:1,							 scaleY:1,							 alpha:1,							 time:1.2, 							 onComplete:function() {animating = false;}							 });				animating = false;			}		}					public function panTreesRight(event : Event) {			if(focusTree != 0 && animating == false && this.gameOn != true) {				trace("panRIGHT", focusTree);				animating = true;				Tweener.addTween(treeArray[focusTree], {							 x:2100,							 scaleX:0.2,							 scaleY:0.2,							 alpha:0.2,							 time:1.2, 							 onComplete:function() { removeChild(treeArray[focusTree]); focusTree -= 1;}							 });				addChild(treeArray[focusTree-1]);				var topPosition:uint = this.numChildren-1;				this.setChildIndex(this.frontNight, topPosition);				Tweener.addTween(treeArray[focusTree-1], {							 x:treeArray[focusTree-1].startingX,							 scaleX:1,							 scaleY:1,							 alpha:1,							 time:1.2,							 onComplete:function() {animating = false;}							 });							}		}				public var stormCloud1:stormCloud;		public var stormCloud2:stormCloud;				public function rainTime(event : Event) {			stormCloud1 = new stormCloud(this, -400, -200, 0.6);			stormCloud2 = new stormCloud(this, 1400, -200, 0.8);			this.addChild(stormCloud1); 			this.addChild(stormCloud2);			this.setChildIndex(this.stormCloud1, 4);			this.setChildIndex(this.stormCloud2, 5);			Tweener.addTween(stormCloud1, {							 x:-150,							 y:-200,							 alpha:0.9,							 time:1.2, 							 onComplete:function() {this.DC.addChild(this.DC.rainy); this.DC.rainy.live();}							 });			Tweener.addTween(stormCloud2, {							 x:500,							 y:-300,							 alpha:0.9,							 time:0.9							 });				 			var changeTimer = new Timer(8000, 1);			changeTimer.addEventListener(TimerEvent.TIMER, removeClouds); 			changeTimer.start();		}				public function removeClouds (event: Event) {			Tweener.addTween(stormCloud1, {				 x:-300,				 y:-200,				 alpha:0,				 time:3.2,				 onComplete:removeStorm()				 });			Tweener.addTween(stormCloud2, {				 x:1400,				 y:-300,				 alpha:0,				 time:3.9				 });		}				public function removeStorm () {			this.removeChild(stormCloud1); 			this.removeChild(stormCloud2);			this.rainy.kill();			this.removeChild(this.rainy);		}				public var season:String = "summer" 				public function changeSeason () {			////CHANGE TO AUTUMN////////			if (season == "summer") {				season = "autumn";				trace(season);				this.backgrnd.gotoAndStop(3);			}			////CHANGE TO WINTER////////			else if(season == "autumn") {				season = "winter";				trace(season);				for (var i:Number=0; i<treeArray.length-1; i++) {							treeArray[i].gotoAndStop(60);					};				this.backgrnd.gotoAndStop(2);			}			////CHANGE TO SPRING////////			else if(season == "winter") {				season = "spring";				trace(season);				for (var Si:Number=0; Si<treeArray.length-1; Si++) {							treeArray[Si].gotoAndStop(1);					};				this.backgrnd.gotoAndStop(1);			}			////CHANGE TO SUMMER////////			else if(season == "spring") {				season = "summer";				trace(season);							}								}				public function testTap (event: Event) {			trace("TAPPED OK!");			var focusTreeLeafArray = treeArray[focusTree].leafArray;			this.userOneLeftHand = leftSprites[this.userOne.userID]			if(this.userOneLeftHand.hitTestObject(treeArray[focusTree])){  					 trace("You touch the tree, it feels like it's made of wood.");					 trace(focusTreeLeafArray.length);				for (var Li:Number=0; Li<focusTreeLeafArray.length;Li++) {					if(this.userOneLeftHand.hitTestObject(focusTreeLeafArray[Li])){  						 trace("You take the leaf");						 if(focusTreeLeafArray[Li].focusLeaf == false) {							 focusTreeLeafArray[Li].growLeaf();						 }						 else {							 focusTreeLeafArray[Li].shrinkLeaf();						 }						}					}			}		}					public var bugArray:Array;		public var bugScore:Number = 20;		public var scoreDisplay = new score(bugScore);						public function waveOfBugs (event: Event) {			bugScore = 20;			this.addChild(this.scoreDisplay);			var bugArray = new Array;			trace("Object?", leftSprites);						for (var Bi:Number=0; Bi<20; Bi++) {				var BUG = new bug (this, Bi);				bugArray.push(BUG);				};						for (var aBi:Number=0; aBi<20; aBi++) {				this.addChild(bugArray[aBi]);				};		}				public function bugGameManager (event: Event) { 			var scoreText = "BUGS REMAINING =" + this.bugScore;			this.scoreDisplay.text = scoreText;			if(this.bugScore == 0) {				this.gameOn == false;				this.bugScore = 20; 				this.removeEventListener(Event.ENTER_FRAME, this.bugGameManager);			}		}		public var beeSound:Sound = new bees;		public var gameAmbientChannel:SoundChannel = new SoundChannel		public var transformMute:SoundTransform = new SoundTransform;		public function soundManager () {			transformMute.volume = 0;			gameAmbientChannel.soundTransform = transformMute;			gameAmbientChannel = beeSound.play();			Tweener.addTween(transformMute, {							 _sound_volume: 0.7,							 time:1							 });				gameAmbientChannel.addEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);		}				function onSoundChannelSoundComplete(e:Event):void{			e.currentTarget.removeEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);			gameAmbientChannel = beeSound.play();		}						//////////////////////////KINECT AND USER FUNCTIONS///////////////////////////////////////////////////		public var kin:Kinect;		public var userOne = null;		public var userTwo = null;		public var loadingKinect:loadingSign;		public var trackingSkel:trackingOn;		public var userIn:Boolean;		private var device:Kinect;		private var _actionManager : ActionManager;		private var _debugger : KinectDebugger;		public var userOneLeftHand:Object;		public var userOneRightHand:Object;		public var leftSprites:Object = new Object();		public var rightSprites:Object = new Object();		public var oldHeadX:Number;		public var oldTreeZ:Number;						public function initKinect() {			if (Kinect.isSupported()) {				device = Kinect.getDevice();				var settings:KinectSettings = new KinectSettings();				settings.skeletonEnabled = true;            	settings.skeletonMirrored = true;				settings.depthEnabled = true;				depthBitmap = new Bitmap();        		addChild(depthBitmap);				device.addEventListener(CameraImageEvent.DEPTH_IMAGE_UPDATE, depthImageUpdateHandler)				device.start(settings);				device.addEventListener(DeviceEvent.STARTED, _started);				_debugger = new KinectDebugger(device, true, true, false, false);				addChild(_debugger);				_actionManager = new ActionManager(stage.frameRate);				trace("actionManager ON");			}			else { 			trace ("NO DEVICE"); 			}		}				private function _started(event : DeviceEvent) : void {			device.removeEventListener(DeviceEvent.STARTED, _started);			addEventListener(Event.ENTER_FRAME, _enterFrame);		}		private function _enterFrame(event : Event) : void {			sortTweets();			userDetect();			if(this.userOne != null){				_debugger.draw(this.userOne);				//ask your ActionManager to compute and analyze user's actions				_actionManager.compute(this.userOne);				}		}				private var hasUser1:Boolean = false;		private var hasUser2:Boolean = false;				private var usersDictionary:Object = new Object();		public var totalCount = 0;		var headSprites:Object = new Object();		public function userDetect() {						//trace("UPDATING");						var usersFound:Array = new Array();						for each (var user:User in this.device.usersWithSkeleton) {				usersFound.push(user.userID);				var headPos = user.head.position.depth;				var theX = headPos.x * 6;				var theY = headPos.y * 6;								var leftPos = user.leftHand.position.depth;				var leftX = leftPos.x * 6;				var leftY = leftPos.y * 6;								var rightPos = user.rightHand.position.depth;				var rightX = rightPos.x * 6;				var rightY = rightPos.y * 6;								if(!usersDictionary[user.userID]) {					if(totalCount == 0){ 						this.userOne = user;						trace("USER ONE ON")						if(this.loadingKinect.stage != null)  {          						removeChild(this.loadingKinect);   						};					}					else if (totalCount == 1) {						this.userTwo = user; 						trace("USER TWO ON")					}										usersDictionary[user.userID] = user;					totalCount += 1;					var headSprite:Sprite = new Sprite();					var leftSprite:Sprite = new handCursor(totalCount);					var rightSprite:Sprite = new handCursor(totalCount);					headSprite.graphics.beginFill(0x00BDD6,0.6);					headSprite.graphics.drawCircle(0,0,50);					this.addChild(headSprite);					headSprites[user.userID] = headSprite;					//leftSprite.graphics.beginFill(0x0000FF,1);					//leftSprite.graphics.drawCircle(0,0,25);					this.addChild(leftSprite);					leftSprites[user.userID] = leftSprite;					//rightSprite.graphics.beginFill(0x00FF00,1);					//rightSprite.graphics.drawCircle(0,0,25);					this.addChild(rightSprite);					rightSprites[user.userID] = rightSprite;				} 				var displayIndex = this.numChildren - 1;				(headSprites[user.userID] as Sprite).x = theX;				(headSprites[user.userID] as Sprite).y = theY;				this.setChildIndex((headSprites[user.userID] as Sprite), displayIndex);				(leftSprites[user.userID] as Sprite).x = leftX;				(leftSprites[user.userID] as Sprite).y = leftY;				this.setChildIndex((leftSprites[user.userID] as Sprite), displayIndex);				(rightSprites[user.userID] as Sprite).x = rightX;				(rightSprites[user.userID] as Sprite).y = rightY;				this.setChildIndex((rightSprites[user.userID] as Sprite), displayIndex);				//trace("===Found a user "+user.userID+"=== ("+totalCount+")");								}						//trace("STARTING TO CHECK FOR REMOVED USERS");			for(var userID:String in usersDictionary) {				var found = false;				for(var n:int=0; n<usersFound.length; n++) {				if(usersFound[n] == userID) {						//trace("FOUND USER");						found = true;					}				}				if(!found) {					//trace("WE SHOULD REMOVE THIS USER");					totalCount -= 1;					if (usersDictionary[userID] == userOne) {						if (this.userTwo != null){							this.userOne = this.userTwo;							this.userTwo = null;						}						else {							this.userOne = null						}						trace("USER ONE OFF!");					}					else if (usersDictionary[userID] == userTwo) {						trace("USER TWO OFF!");						this.userTwo = null;					}					delete usersDictionary[userID];										var headToRemove:Sprite = headSprites[userID];					delete headSprites[userID];					if(headToRemove.parent) {						headToRemove.parent.removeChild(headToRemove);					}										var leftToRemove:Sprite = leftSprites[userID];					delete leftSprites[userID];					if(leftToRemove.parent) {						leftToRemove.parent.removeChild(leftToRemove);					}										var rightToRemove:Sprite = rightSprites[userID];					delete rightSprites[userID];					if(rightToRemove.parent) {						rightToRemove.parent.removeChild(rightToRemove);					}					}				//trace("XXX"+userID);				//trace("ENDING CHECK FOR REMOVED USERS");					}		}				public function randomRange(minNum:Number, maxNum:Number):Number {			return (Math.floor(Math.random()*(maxNum - minNum +1)) + minNum);		}				/*public function skelIn(event:UserEvent):void {						trace("SKELETON ON!");			this.userOne = event.users[0];			_actionManager.compute(this.userOne);			_debugger.draw(this.userOne);			/*if (event.users.length == 0){				this.userOne = event.users[0];				userIn = true;			}			else if (event.users.length == 1){				this.userTwo = event.users[1];			}						var headPosX = this.userOne.skeletonJoints[0].position.depth.x*4;			var headPosZ = this.userOne.skeletonJoints[0].position.world.z;						var leftHandX = this.userOne.skeletonJoints[5].position.depth.x*4;			var leftHandY = this.userOne.skeletonJoints[5].position.depth.y*4;			var leftHandZ = this.userOne.skeletonJoints[5].position.world.z;			leftHand = new leftMarker(leftHandX, leftHandY);			addChild(leftHand);						var rightHandX = this.userOne.skeletonJoints[8].position.depth.x*4;			var rightHandY = this.userOne.skeletonJoints[8].position.depth.y*4;			var rightHandZ = this.userOne.skeletonJoints[8].position.world.z;			rightHand = new rightMarker(rightHandX, rightHandY);			addChild(rightHand);			//head = new headMarker(headPosX);			//sets up starting value so the movement difference can be measured. 						oldHeadX = headPosX;			oldTreeZ = rightHandZ;			if(this.loadingKinect.stage != null)  {          			removeChild(this.loadingKinect);   			};			//addChild(head);			device.addEventListener(UserEvent.USERS_UPDATED, updateSkel);					}				public function skelOut(event:UserEvent):void {			userIn = false;			trace("SKELETON OFF!");			//removeChild(leftHand);			//removeChild(rightHand);			event.users.pop();			device.removeEventListener(UserEvent.USERS_UPDATED, updateSkel);		}				//Takes new head position data and sends it the relevant environment update functions. 		public function updateSkel(event:UserEvent):void {			var headX = this.userOne.skeletonJoints[0].position.depth.x*4; 	  		var headZ = this.userOne.skeletonJoints[0].position.world.z; 			var treeXDiff = headX - oldHeadX;			oldHeadX = headX;						leftHand.x = this.userOne.skeletonJoints[5].position.depth.x*4;			leftHand.y = this.userOne.skeletonJoints[5].position.depth.y*4;			var updateLeftZ = this.userOne.skeletonJoints[5].position.depth.x*4;			var treeZDiff = headZ - oldTreeZ;			oldTreeZ = headZ;									rightHand.x = this.userOne.skeletonJoints[8].position.depth.x*4;			rightHand.y = this.userOne.skeletonJoints[8].position.depth.y*4;			//trace(treeZDiff);			/*if(treeZDiff > 20 || treeZDiff < -20) {				trace("UPDATEZ", treeZDiff);				updateTreesZ(treeZDiff);			};			//trace(treeXDiff);			if(treeXDiff > 40 || treeXDiff < -40) {				trace("UPDATEX", treeXDiff);				updateTreesX(treeXDiff); 			};					}								//Iterates over each tree and updates their X Position		public function updateTreesX(treeXDiff) {			for (var q:Number=0; q<this.treeArray.length;q++){				var currentTree = this.treeArray[q];				currentTree.cacheAsBitmap = true;				if (currentTree.z < 0) {					var positiveZ = -1*currentTree.z;				}				else {						positiveZ = currentTree.z;				};				var tweenerX = currentTree.x-(treeXDiff/((positiveZ+1000)/3000));				//trace(tweenerX);				currentTree.x = tweenerX;				/*Tweener.removeTweens(currentTree)				Tweener.addTween(currentTree, {							 x:tweenerX, 							 time:0.05							 });				};			//trace("Updated");		}				//Iterates over each tree and updates their z position and alpha		public function updateTreesZ(treeZDiff) {			//trace ("Update", treeZDiff);			for (var q:Number=0; q<treeArray.length;q++){				var currentTree = this.treeArray[q];				if(q == 9) {					var treeBehind = 1; 				}				else {					treeBehind = this.treeArray[q+1].z;				};				//trace(treeBehind);					currentTree.cacheAsBitmap = true;					//Tweener.removeTweens(currentTree)										//Adjusts scale depending on keyboard press/mouse scroll/gesture					if (currentTree.z > -600 && currentTree.z < 6000) {						var newZ = currentTree.z + treeZDiff;						currentTree.z += treeZDiff;						/*Tweener.addTween(currentTree, {							 z:newZ, 							 time:0.6							 });					}					else if (currentTree.z > 6000) {						if (treeZDiff < 0) {							currentTree.z += treeZDiff;							/*newZ = currentTree.z + treeZDiff;							Tweener.addTween(currentTree, {							 z:newZ, 							 time:0.6							 });						}					}					else if (currentTree.z < -600) {						if (treeZDiff > 0 && treeBehind > 0) {							trace("CURRENT", currentTree.z); 							trace("BEHIND", treeBehind);							currentTree.z += treeZDiff;							/*newZ = currentTree.z + treeZDiff;							Tweener.addTween(currentTree, {							 z:newZ, 							 time:0.6							 });						}					};										//Adjust opacity depending on zPos					if (currentTree.z < -100 && currentTree.z > -300) {						currentTree.alpha = 1-((currentTree.z+100)/-200);					}					else if (currentTree.z < -300) {						currentTree.alpha = 0;					}					else if (currentTree.z > 6000) {						currentTree.alpha = 0;					}					else if (currentTree.z > -100 && currentTree.z < 2000) {						currentTree.alpha = 1;					}					else if (currentTree.z < 6000 && currentTree.z > 2000) {						currentTree.alpha = 1-((currentTree.z-2000)/4000);					};													}					}*/			}}