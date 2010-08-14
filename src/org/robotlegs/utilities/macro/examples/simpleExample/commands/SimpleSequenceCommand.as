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
	import org.robotlegs.utilities.macro.SequenceCommand;
	import org.robotlegs.utilities.macro.SubcommandDescriptor;
	import org.robotlegs.utilities.macro.SubcommandExecutionStatusEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.MyMacroCommandEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.SimpleCommandEvent;
	
	public class SimpleSequenceCommand extends SequenceCommand
	{
		/**
		 * Example of a simple sequence command 
		 */		
		public function SimpleSequenceCommand()
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
			
			// This command take a payload object, but also consumes the return values
			// of addCommand which is a SubcommandDescritor.  This can be used to listen
			// to the execution status events of this specific command
			var mySubcommandDescriptor:SubcommandDescriptor = addCommand(CommandC, new SimpleCommandEvent(SimpleCommandEvent.COMMAND_C));
			
			// When the subcommand has started execution
			mySubcommandDescriptor.addEventListener(SubcommandExecutionStatusEvent.SUBCOMMAND_STARTED, onExecutionStatusEvent);
			
			// When the subcommand has completed successfully
			mySubcommandDescriptor.addEventListener(SubcommandExecutionStatusEvent.SUBCOMMAND_COMPLETED, onExecutionStatusEvent);
			
			// When the subcommand has failed
			mySubcommandDescriptor.addEventListener(SubcommandExecutionStatusEvent.SUBCOMMAND_FAILED, onExecutionStatusEvent);
		}
		
		override public function execute():void {
			// Make sure to call the super here, because that is what kicks off the process
			super.execute();
			
		}
		
		/**
		 * Listens for any Subcommand Execution Status Events and traces out the Class Name and Status 
		 * @param e
		 */		
		private function onExecutionStatusEvent(e:SubcommandExecutionStatusEvent):void {
			trace(e.subcommandDescriptor.commandClass, e.subcommandDescriptor.executionStatus);
		}
		
		/**
		 * This is the function we can override that gets called when we are finished 
		 * with all our commands
		 * 
		 */		
		override protected function commandComplete():void {
			
			//Finish up
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_SEQUENCE_COMPLETE));
			
			// Always make sure you call the sumer so things can wrap up
			super.commandComplete();
			
		}
	}
}