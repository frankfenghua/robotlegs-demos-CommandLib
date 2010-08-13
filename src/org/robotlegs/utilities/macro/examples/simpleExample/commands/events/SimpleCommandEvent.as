/**
 *  Macro commands example usage in the Robot Legs Framework
 * 
 * Any portion of this may be reused for any purpose where not 
 * licensed by another party restricting such use. 
 * 
 * Please leave the credits intact.
 * 
 * Chase Brammer
 * http://chasebrammer.com
 * cbrammer@gmail.com
 */

package org.robotlegs.utilities.macro.examples.simpleExample.commands.events
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