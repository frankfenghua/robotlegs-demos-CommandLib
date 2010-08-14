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
	import org.robotlegs.utilities.macro.ParallelCommand;
	import org.robotlegs.utilities.macro.SequenceCommand;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.MyMacroCommandEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.SimpleCommandEvent;
	
	/**
	 * Shows how to create and add a programitcally created command
	 *  
	 * @author chbrammer
	 * 
	 */	
	public class ProgramaticCommand extends ParallelCommand
	{
		public function ProgramaticCommand()
		{
			super();
		}
		
		override public function execute():void
		{
			// we we want to add a programatic command, then we need to have access to the "injector"
			// which will be available by this method's execution, just make sure to add the new 
			// command BEFORE you all the super
			
			// Create a new command instance programatically, but to do this we want to do it through
			// the robot legs framework so that it gets added to the command map right, and so that
			// all of its events can be dispatched, etc..
			
			// If we needed to inject a value
			//injector.mapValue(cmd.payloadClass, cmd.payload, cmd.named);
			
			// Create an instance of the command
			var mySeq:SequenceCommand = injector.instantiate(SequenceCommand);
			
			// if we mapped a payload, unmap it
			// injector.unmap(cmd.payloadClass);
			
			// Add commands to our new seq command
			mySeq.addCommand(CommandA);
			mySeq.addCommand(CommandB);
			mySeq.addCommand(CommandC, new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C));
			
			// Add the new command instance
			addProgramaticCommand(mySeq);
			
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
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_PROGRAMATIC_COMPLETE));
			
			// Always make sure you call the sumer so things can wrap up
			super.commandComplete();
		}
		
	}
}