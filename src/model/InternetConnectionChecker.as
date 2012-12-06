package model 
{
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	
	import air.net.URLMonitor;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.events.StatusEvent;
	import flash.events.EventDispatcher;
	 
	public class InternetConnectionChecker extends EventDispatcher  
	{
		
		public static var CONNECTION_OK:String = "connectionOK";
		public static var CONNECTION_ERROR:String = "connectionError";
		
		var monitor:URLMonitor = new URLMonitor(new URLRequest("https://www.google.com/"));
		
		public function InternetConnectionChecker() 
		{
			monitor.addEventListener(StatusEvent.STATUS, statusHandler);
		}
		
		public function checkInternetConnection()
		{
			monitor.start();
		}
		
		private function statusHandler(e:Event)
		{
			if (monitor.available) 
				dispatchEvent(new Event(InternetConnectionChecker.CONNECTION_OK));
			else
				dispatchEvent(new Event(InternetConnectionChecker.CONNECTION_ERROR));
		}
		
	}

}