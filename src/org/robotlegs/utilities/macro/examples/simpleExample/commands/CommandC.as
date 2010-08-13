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
	
	public class CommandC extends AsyncCommand
	{
		[Inject]	public var simpleCommandEvent:SimpleCommandEvent;
		
		public function CommandC() {
			super();
		}
		
		override public function execute():void {
			var t:Timer = new Timer(2000, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			t.start();
		}

		private function onTimerComplete(e:TimerEvent):void {
			if(simpleCommandEvent.doFail) {
				dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C_FAILED));
				commandComplete();
			} else {
				dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C_COMPLETE));
				commandIncomplete();
			}
		}
	}
}