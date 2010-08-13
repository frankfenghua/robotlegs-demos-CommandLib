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
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.MyMacroCommandEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.SimpleCommandEvent;
	import org.robotlegs.utilities.macro.ParallelCommand;
	
	public class SimpleParallelCommand extends ParallelCommand
	{
		public function SimpleParallelCommand()
		{
			super();
			
			// This is where we add in all of the commands that we want execute
			
			// this is an example of a command that doesn't take a payload object
			// and is also just a simple command (doens't extend AsyncCommand)
			// that will always be executed and as soon as it is executed will 
			// be marked as completed
			addCommand(CommandA);
			
			// This command extends Async Command, but doenst take a payload object
			// This is marked as completed only after it has actually been completed
			addCommand(CommandB);
			
			// This command take a payload object 
			addCommand(CommandC, new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C));
		}
		
		override public function execute():void
		{
			// Make sure to call the super here, because that is what kicks off the process
			super.execute();
			
		}
		
		/**
		 * This is the function we can override that gets called when we are finished 
		 * with all our commands
		 * 
		 */		
		override protected function commandComplete():void {
			//Finish up
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_PARALLEL_COMPLETE));
			
			// Always make sure you call the sumer so things can wrap up
			super.commandComplete();
		}
		
	}
}