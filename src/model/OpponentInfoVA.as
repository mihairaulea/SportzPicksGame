package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	public class OpponentInfoVA 
	{
		public var SelectOpponentListItems:Vector.<Opponent> = new Vector.<Opponent>();		
		
		public function OpponentInfoVA() 
		{
			
		}
		
		public function resetAllInfo()
		{
			SelectOpponentListItems.splice(0, SelectOpponentListItems.length);
		}
		
	}

}