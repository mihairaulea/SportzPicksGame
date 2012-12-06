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
		
		// VALUE OBJECTS
		var lobbyInfo:LobbyInfoVA = new LobbyInfoVA();
		
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
			lobbyInfo.resetAllInfo();
			
			var jsonEncodedLobbyData:String = (e.target.data);
						
			var parsedObject:Object = JSON.parse(jsonEncodedLobbyData);
					
			lobbyInfo.CoinsTotal = parsedObject.d.CoinsTotal;
			lobbyInfo.DaysLeft   = parsedObject.d.DaysLeft;
			lobbyInfo.HoursLeft = parsedObject.d.HoursLeft;
			lobbyInfo.MinutesLeft = parsedObject.d.MinutesLeft;
			lobbyInfo.PointsTotal= parsedObject.d.PointsTotal;
			
			for (var i:int = 0; i < parsedObject.d.LobbyPageItems.length; i++)
			{
				var challenge:Challenge = new Challenge();
				challenge.CountOfNew = parsedObject.d.LobbyPageItems[i].CountOfNew;
				challenge.CountOfPending = parsedObject.d.LobbyPageItems[i].CountOfPending;
				challenge.CountOfResults = parsedObject.d.LobbyPageItems[i].CountOfResults;
				challenge.CountOfWaiting = parsedObject.d.LobbyPageItems[i].CountOfWaiting;
				challenge.OpponentId = parsedObject.d.LobbyPageItems[i].OpponentId;
				challenge.OpponentName = parsedObject.d.LobbyPageItems[i].OpponentName;
				challenge.OpponentScore = parsedObject.d.LobbyPageItems[i].OpponentScore;
				challenge.PlayerScore = parsedObject.d.LobbyPageItems[i].PlayerScore;
				
				lobbyInfo.LobbyPageItems.push(challenge);
			}
			
			//test
			lobbyInfo.outputObjectForDebug();
		}
		
		private function securityErrorHandler(e:Event):void
		{
			errorMessage = "Security error!";
			dispatchEvent(new Event(Model.ERROR));
		}
		
		private function ioErrorHandler(e:Event):void
		{
			errorMessage = "I/O error!";
			dispatchEvent(new Event(Model.ERROR));			
		}
		
		
	}


}
