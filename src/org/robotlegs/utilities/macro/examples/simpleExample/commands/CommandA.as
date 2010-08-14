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
	import org.robotlegs.mvcs.Command;
	
	/**
	 * This is a simple synchonous command that is the most common command in robot legs that executes
	 * all of its logic in sequence, with no "waiting" for responses (web servies, timers, etc..)
	 * When this class is executed it is automatically marked as completed successfully immeditely 
	 * afterwards.  Because it does not extends AsyncCommand, we have no way of telling if it failed or
	 * not, so any class that extends only Command will never be marked as incomplete in a batch command 
	 * @author chbrammer
	 * 
	 */	
	public class CommandA extends Command
	{
		public function CommandA()
		{
			super();
		}
		
		override public function execute():void {
			// Executes immediately and marks itself as complete
			
			// Framework event about the status of our command
			dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_A_COMPLETE));
		}
	}
}