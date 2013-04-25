package {
	
	import flash.display.MovieClip;
	import flash.net.*;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	
	public class jsoncode extends MovieClip {
		
		public var loader:URLLoader = new URLLoader();
		public var myTimer:Timer = new Timer(2000);
		//trace("outside");
		public var tweets:Array = [];
		
		public function jsoncode() {
			myTimer.addEventListener(TimerEvent.TIMER, doTime);
			myTimer.start();
			//doTime();
			//trace("timer");
		}
		
		public function doTime(e:TimerEvent) {
			trace("doTime");
			//var urlText:URLLoader = new URLLoader("gobi.net63.net/mentions.php");
			var _jsonPath = "http://gobi.net63.net/mentions.php";
			var request:URLRequest = new URLRequest();
			request.url = _jsonPath;
			loader.addEventListener(Event.COMPLETE,parseData);
			trace("call parse data");
			loader.load(request);
		}
		
		public function parseData(e:Event) {
			//var text ='[{"user":"nurmerey","tweet":"@nicholaspowerr hey could you write some tweets to @TreeITEE ?"},{"user":"nicholaspowerr","tweet":"@TreeITEE blah blah blah #edge #threeleftsandaright"}]';
			
			var parse = JSON.parse(loader.data);
			//var parse = JSON.parse(text);
			for (var i:Number=0; i<parse.length; i++){
			//trace(parse[i].user +" "+parse[i].tweet);
			tweets[i] = [parse[i].user, parse[i].tweet];
			}
			trace(tweets);
		}
	
		}
	
}
