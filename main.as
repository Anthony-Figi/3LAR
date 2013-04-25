﻿	package  {
	
	import flash.display.MovieClip;
	import flash.display.Bitmap;
	import flash.geom.ColorTransform;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.getTimer;
	import com.as3nui.nativeExtensions.air.kinect.Kinect;
	import com.as3nui.nativeExtensions.air.kinect.KinectSettings;
	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;
	import com.as3nui.nativeExtensions.air.kinect.constants.CameraResolution;
	import com.as3nui.nativeExtensions.air.kinect.data.DeviceCapabilities;
	import com.as3nui.nativeExtensions.air.kinect.data.SkeletonJoint;
	import com.as3nui.nativeExtensions.air.kinect.data.User;
	import com.as3nui.nativeExtensions.air.kinect.events.CameraImageEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.DeviceErrorEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.DeviceEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.DeviceInfoEvent;
	import com.as3nui.nativeExtensions.air.kinect.events.UserEvent;
	import flash.display.Loader;
	
	
	public class main extends MovieClip {
		
		public var tree;
		public var leaves;
		public var foreground;
		public var tweetArray:Array = new Array();
		public var treeArray:Array = new Array();
		public var zScroll:Number = 1; 
		public var yDiff = 0;
		public var kin:Kinect;
		public var head:headMarker;
		public var theUser;
		public var userIn:Boolean;
		public var oldHeadX:Number;
		public var oldHeadZ:Number;
		public var loadingKinect:loadingSign;
		public var trackingSkel:trackingOn;
		public var frames:int=0;
		public var prevTimer:Number=0;
		public var curTimer:Number=0;
		public var backgrnd:backgroundArt;
		private var depthBitmap:Bitmap;
		private var device:Kinect;
		
		
		public function main() {
			
			//http://blog.pixelbreaker.com/mac/as30-mousewheel-on-mac-os-x
			this.zScroll = zScroll;
			this.tweetArray = tweetArray;
			this.treeArray = treeArray;
			this.loadingKinect = new loadingSign;
			this.trackingSkel = new trackingOn;
			this.theUser = theUser;
			this.backgrnd = new backgroundArt(this);
			
			this.addChild(this.backgrnd);
			this.addEventListener(Event.ENTER_FRAME,performFrameTest);
			
			initKinect();
			
			
			//NURKA - PULL DOWN TWEETS SORT THEM INTO 10 ARRAYS FOR EACH HASHTAG THEN SEND EACH ARRAY TO THE TRUNK WHEN MAKING A TREE
			//Add Trees to array
			var zIndexer = 0;
			var xIndexer = -200;
			for (var i:Number=0; i<10; i++) {
				zIndexer += 600;
				xIndexer += 350;
				var zPos = zIndexer;
				var treeX = randomRange(-400, 1400);
				var tree = new trunk(this, zPos, treeX, i); //ADD ARRAY FOR HASTAG HERE
				treeArray.push(tree);
				};
			
			//sort Tree Array so the right trees appears in front
			treeArray.sortOn( "z", Array.NUMERIC | Array.DESCENDING );
			
			//add stuff to stage
			for (var t:Number=0; t<treeArray.length;t++){
				this.addChild(treeArray[t]); 
				};
			addChild(this.loadingKinect);
			
			//stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
	
		}
		public function sortTweets(){
			
		}
		
		public function initKinect() {
			if (Kinect.isSupported()) {
				device = Kinect.getDevice();
				depthBitmap = new Bitmap();
				depthBitmap.scaleX = 0.5;
				depthBitmap.scaleY = 0.5;
				depthBitmap.alpha = 0.4;
				addChild(depthBitmap);
				device.addEventListener(CameraImageEvent.DEPTH_IMAGE_UPDATE, depthImageUpdateHandler);
				var settings:KinectSettings = new KinectSettings();
				settings.skeletonEnabled = true;
            	settings.skeletonMirrored = true;
				settings.depthEnabled = true;
				device.addEventListener(UserEvent.USERS_WITH_SKELETON_ADDED, skelIn);
            	device.addEventListener(UserEvent.USERS_WITH_SKELETON_REMOVED, skelOut);
				
				device.start(settings);
			}
			else { 
			trace ("NO DEVICE"); 
			}
		}
		
		public function skelIn(event:UserEvent):void {
			userIn = true;
			trace("SKELETON ON!");
			this.theUser = event.users[0];
			var headPosX = this.theUser.skeletonJoints[0].position.depth.x*4;
			var headPosZ = this.theUser.skeletonJoints[0].position.world.z;
			//head = new headMarker(headPosX);
			//sets up starting value so the movement difference can be measured. 
			oldHeadX = headPosX;
			oldHeadZ = headPosZ;
			addChild(this.trackingSkel);
			if(this.loadingKinect.stage != null)  {    
      			removeChild(this.loadingKinect);  
 			};
			//addChild(head);
			device.addEventListener(UserEvent.USERS_UPDATED, updateHead);			
		}
		
		public function skelOut(event:UserEvent):void {
			userIn = false;
			trace("SKELETON OFF!");
			//removeChild(head);
			removeChild(this.trackingSkel);
			event.users.pop();
			device.removeEventListener(UserEvent.USERS_UPDATED, updateHead);
		}
		
		//Takes new head position data and sends it the relevant environment update functions. 
		public function updateHead(event:UserEvent):void {
			var headX = this.theUser.skeletonJoints[0].position.depth.x*4; 
	  		var headZ = this.theUser.skeletonJoints[0].position.world.z; 
			updateTreesX(headX); 
			updateTreesZ(headZ);
		}
		
		protected function depthImageUpdateHandler(event:CameraImageEvent):void {
			depthBitmap.bitmapData = event.imageData;
		}
		
		public function randomRange(minNum:Number, maxNum:Number):Number {
			return (Math.floor(Math.random()*(maxNum - minNum +1)) + minNum);
		}
		
		//Back Up Keyboard function for debugging Tree Z movement. 
		/*public function handleKeyDown(event:KeyboardEvent):void {
			if(event.keyCode == 38) {
				updateTreesZ(100);
			}
			else if(event.keyCode == 40) {
				updateTreesZ(-100);
			}
		}*/
		
		
		//Iterates over each tree and updates their X Position
		public function updateTreesX(currentHeadX) {
			var headXDiff = currentHeadX - oldHeadX;
			for (var q:Number=0; q<this.treeArray.length;q++){
				var currentTree = this.treeArray[q];
				if (currentTree.z < 0) {
					var positiveZ = -1*currentTree.z;
				}
				else {
						positiveZ = currentTree.z;
				};
				currentTree.x = currentTree.x-(headXDiff/((positiveZ+1000)/3000));
			};
			oldHeadX = currentHeadX;
		}
		
		//Iterates over each tree and updates their z position and alpha
		public function updateTreesZ(currentHeadZ) {
			var headZDiff = (currentHeadZ - oldHeadZ)*5;
			for (var q:Number=0; q<treeArray.length;q++){
				var currentTree = this.treeArray[q];
					
					//Adjusts scale depending on keyboard press/mouse scroll/gesture
					if (currentTree.z > -600 && currentTree.z < 6000) {
						currentTree.z += headZDiff;
					}
					else if (currentTree.z > 6000) {
						if (headZDiff < 0) {
							currentTree.z += headZDiff;
						}
					}
					else if (currentTree.z < -600) {
						if (headZDiff > 0) {
							currentTree.z += headZDiff;
						}
					};
					
					//Adjust opacity depending on zPos
					if (currentTree.z < -100 && currentTree.z > -300) {
						currentTree.alpha = 1-((currentTree.z+100)/-200);
					}
					else if (currentTree.z < -300) {
						currentTree.alpha = 0;
					}
					else if (currentTree.z > 6000) {
						currentTree.alpha = 0;
					}
					else if (currentTree.z > -100 && currentTree.z < 2000) {
						currentTree.alpha = 1;
					}
					else if (currentTree.z < 6000 && currentTree.z > 2000) {
						currentTree.alpha = 1-((currentTree.z-2000)/4000);
					};
					oldHeadZ = currentHeadZ;
					
					
					
			}
			
		}
		
		function performFrameTest(e:Event):void {
			frames+=1;
			curTimer=getTimer();
			if(curTimer-prevTimer>=1000){
			trace("FPS: "); trace(Math.round(frames*1000/(curTimer-prevTimer)));
			prevTimer=curTimer;
			frames=0;
			}
		}
		
		public function tester() {
			trace("TESTED OK!");
		}
		
		
	}
}