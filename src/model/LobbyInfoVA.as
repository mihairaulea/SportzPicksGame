package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	public class LobbyInfoVA 
	{
		
		public var CoinsTotal:int;
		public var DaysLeft:int;
		public var HoursLeft:int;
		public var MinutesLeft:int;
		public var PointsTotal:int;
		
		public var LobbyPageItems:Vector.<Challenge> = new Vector.<Challenge>();
		
		public function LobbyInfoVA() 
		{
			
		}
		
		public function resetAllInfo()
		{
			CoinsTotal = 0;
			DaysLeft = 0;
			HoursLeft = 0;
			MinutesLeft = 0;
			PointsTotal = 0;
			
			LobbyPageItems.splice(0, LobbyPageItems.length);
		}
		
		public function outputObjectForDebug()
		{
			trace("=================== debug LobbyInfoVA ===================");
			
			trace(CoinsTotal +" CoinsTotal");
			trace(DaysLeft +" DaysLeft");
			trace(HoursLeft +" HoursLeft");
			trace(MinutesLeft +" MinutesLeft");
			trace(PointsTotal +" PointsTotal");
			
			for (var i:int = 0; i < LobbyPageItems.length; i++)
			{
				LobbyPageItems[i].outputChallengeForDebug();
			}
			
			trace("===================                   ===================");
			trace("");
		}
		
	}

}