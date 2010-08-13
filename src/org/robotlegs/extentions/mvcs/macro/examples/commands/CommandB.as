package org.robotlegs.extentions.mvcs.macro.examples.commands
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.extentions.mvcs.macro.AsyncCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
	
	public class CommandB extends AsyncCommand
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