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
	
	/**
	 * This command extends AsyncCommand, which allows for asynchronous comamnds to be executed,
	 *  so things like webservices, timers, or almost anythign that waits on an event to execute
	 * 
	 * While this class is an Async Command and can run in a Parallel or Sequence coammand, it 
	 * can also be called directly like any other class without any other problem and will 
	 * still retain its memory reference until exeuction is complete
	 * 
	 * @author chbrammer
	 * 
	 */	
	public class CommandC extends AsyncCommand
	{
		// Injection data
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
				
				// Framework event about the status of our command
				dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C_FAILED));
				
				// Tell the command that it failed
				commandIncomplete();
			} else {
				
				// Framework event about the status of our command
				dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C_COMPLETE));
				
				// The class itself must manage if it completed succesully or if it failed
				// this is how to tell the command that it finished successfully
				// this should only be called at the very very end of execution in this class
				// because after this is called, you have no garuntee that the class will 
				// stay in memory reference
				commandComplete();
			}
		}
	}
}