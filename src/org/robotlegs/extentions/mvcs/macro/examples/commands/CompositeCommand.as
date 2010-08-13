package org.robotlegs.extentions.mvcs.macro.examples.commands
{
	import org.robotlegs.extentions.mvcs.macro.ParallelCommand;
	import org.robotlegs.extentions.mvcs.macro.SequenceCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.MyMacroCommandEvent;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
	
	public class CompositeCommand extends ParallelCommand
	{
		public function CompositeCommand()
		{
			super();
			
			// This is where we add in all of the commands that we want execute
			
			addCommand(SimpleParallelCommand);
			
			addCommand(SimpleSequenceCommand);
			
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
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_COMPOSITE_COMPLETE));
			
			// Always make sure you call the sumer so things can wrap up
			super.commandComplete();
		}
		
	}
}