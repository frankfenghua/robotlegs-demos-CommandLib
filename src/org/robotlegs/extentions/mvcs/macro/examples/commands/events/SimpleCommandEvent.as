package org.robotlegs.extentions.mvcs.macro.examples.commands.events
{
	import flash.events.Event;
	
	public class SimpleCommandEvent extends Event
	{
		public static const COMMAND_A:String = "commandA";
		public static const COMMAND_A_COMPLETE:String = "commandAComplete";

		public static const COMMAND_B:String = "commandB";
		public static const COMMAND_B_COMPLETE:String = "commandBComplete";
		
		public static const COMMAND_C:String = "commandC";
		public static const COMMAND_C_COMPLETE:String = "commandCComplete";
		public static const COMMAND_C_FAILED:String = "commandCFailed";

		public var doFail:Boolean = false;
		
		public function SimpleCommandEvent(type:String, doFail:Boolean = false, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.doFail = doFail;
			super(type, bubbles, cancelable);
		}
	}
}