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
	
	public class CommandA extends Command
	{
		public function CommandA()
		{
			super();
		}
		
		override public function execute():void {
			dispatch(new SimpleCommandEvent(SimpleCommandEvent.COMMAND_A_COMPLETE));
		}
	}
}