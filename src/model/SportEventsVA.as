package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	public class SportEventsVA 
	{
				
		public var events:Vector.<SportEvent> = new Vector.<SportEvent>;
		
		public function SportEventsVA() 
		{
			
		}
				
		public function resetAllInfo()
		{
			events.splice(0, SelectSportListItems.length);
		}
		
	}

}