package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	public class Challenge 
	{
		
		public var CountOfResults:int;
		public var CountOfNew:int;
		public var CountOfPending:int;
		public var CountOfWaiting:int;
		public var OpponentId:int;
		public var OpponentName:int;
		public var OpponentScore:int;
		public var PlayerScore:int;
		
		public function Challenge() 
		{
			
		}
		
		public function outputChallengeForDebug()
		{
			trace("=Challenge=");
			
			trace("CountOfResults " + CountOfResults);
			trace("CountOfNew " + CountOfNew);
			trace("CountOfPending " + CountOfPending);
			trace("CountOfWaiting " + CountOfWaiting);
			trace("OpponentId " + OpponentId);
			trace("OpponentName " + OpponentName);
			trace("OpponentScore " + OpponentScore);
			trace("PlayerScore " + PlayerScore);
			
			trace("=         =");
		}
		
	}

}