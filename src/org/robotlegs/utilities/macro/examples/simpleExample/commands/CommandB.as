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

package org.robotlegs.utilities.macro.examples.simpleExample.commands
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.SimpleCommandEvent;
	import org.robotlegs.utilities.macro.AsyncCommand;
	
	public class CommandB extends org.robotlegs.utilities.macro.AsyncCommand
	{
		public function CommandB()
		{
			super();
		}
		
		override public function execute():void {
			var t:Timer = new Timer(2000, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			t.start();
		}

		protected function onTimerComplete(event:TimerEvent):void {
			dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_B_COMPLETE));
			commandComplete();
		}
	}
}