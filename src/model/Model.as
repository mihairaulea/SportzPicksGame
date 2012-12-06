package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	
	 import flash.net.*;
	 import flash.events.*;
	 
	 public class Model extends EventDispatcher 
	{
		
		public static var instance:Model = null;
		
		public static var MODEL_SETUP_OK:String = "modelSetupOk";
		
		public static var LOBBY_DATA_RECEIVED:String = "lobbyDataReceived";
		public static var OPPONENT_LIST_RECEIVED:String = "opponentListReceived";
		public static var EVENTS_LIST_RECEIVED:String = "eventsListReceived";
		
		public static var ERROR:String = "error";
		public var errorMessage:String = "Error : Cannot connect!";
		
		public var internetConnectionChecker:InternetConnectionChecker = new InternetConnectionChecker();
		
		public function Model() 
		{
			
		}
		
		private function setUpChecker()
		{			
			internetConnectionChecker.addEventListener(InternetConnectionChecker.CONNECTION_ERROR, connectionErrorHandler);
			internetConnectionChecker.addEventListener(InternetConnectionChecker.CONNECTION_OK, connectionOkHandler);
		}
		
		public function checkModel()
		{
			setUpChecker();
			internetConnectionChecker.checkInternetConnection();
		}
		
		private function connectionErrorHandler(e:Event)
		{
			errorMessage = "No Internet Connection available!";
			dispatchEvent(new Event(Model.ERROR));
		}
		
		private function connectionOkHandler(e:Event)
		{
			dispatchEvent(new Event(Model.MODEL_SETUP_OK));
		}
		
		public static function getInstance():Model
		{
			if (instance == null) instance = new Model(  );
			return instance;
		}
						
		public function requestLobbyData(playerId:String)
		{
			var requestVariables:URLVariables = new URLVariables();
			requestVariables.PlayerId = playerId;
			
			var request:URLRequest = new URLRequest();
			request.url = "http://test.sportzrush.com/appconnector/data.svc/GetLobby";
			request.method = URLRequestMethod.GET;
			request.data = requestVariables;
			
			var loader:URLLoader = new URLLoader();
			loader.dataFormat = URLLoaderDataFormat.TEXT;
			
			loader.addEventListener(Event.COMPLETE, lobbyDataLoaded); 
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			
			loader.load(request);
		}
		
		private function lobbyDataLoaded(e:Event):void
		{
			trace(e.target.data);
		}
		
		private function securityErrorHandler(e:Event):void
		{
			
		}
		
		private function ioErrorHandler(e:Event):void
		{
			
		}
		
		
	}


}
