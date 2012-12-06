package 
{
	import flash.desktop.NativeApplication;
	import flash.events.*;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import model.Model;
	
	/**
	 * ...
	 * @author Mihai Raulea
	 */
	public class Main extends Sprite 
	{
		
		public var modelInstance:Model;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			//stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			modelInstance = Model.getInstance();
			modelInstance.addEventListener(Model.ERROR, modelErrorHandler);
			modelInstance.addEventListener(Model.MODEL_SETUP_OK, modelSetupOkHandler);
			modelInstance.checkModel();
		}
		
		private function modelErrorHandler(e:Event)
		{
			trace(modelInstance.errorMessage);
		}
		
		private function modelSetupOkHandler(e:Event)
		{
			trace("model setup ok");
			modelInstance.requestLobbyData("15b1e324-2e0f-4816-838c-2572d19c5f3d");
		}
		
		private function deactivate(e:Event):void 
		{
			// auto-close
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}