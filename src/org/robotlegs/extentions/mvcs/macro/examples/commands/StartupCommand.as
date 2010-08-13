package org.robotlegs.extentions.mvcs.macro
{
	import org.robotlegs.mvcs.Command;
	
	public class StartupCommand extends Command
	{
		override public function execute():void
		{
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}