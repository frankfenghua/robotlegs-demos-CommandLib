package org.robotlegs.extentions.mvcs.macro.examples.commands
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.extentions.mvcs.macro.AsyncCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
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