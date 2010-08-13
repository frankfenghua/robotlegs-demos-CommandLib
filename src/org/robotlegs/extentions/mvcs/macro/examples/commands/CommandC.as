package org.robotlegs.extentions.mvcs.macro.examples.commands
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.robotlegs.extentions.mvcs.macro.AsyncCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
	
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