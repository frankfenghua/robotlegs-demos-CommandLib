package org.robotlegs.extentions.mvcs.macro.examples
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.CommandA;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.CommandB;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.CommandC;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.CompositeCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.SimpleParallelCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.SimpleSequenceCommand;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.MyMacroCommandEvent;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
	import org.robotlegs.extentions.mvcs.macro.examples.view.ExampleMediator;
	import org.robotlegs.extentions.mvcs.macro.examples.view.ExampleView;
	import org.robotlegs.mvcs.Context;
	
	public class ExampleContext extends Context
	{
		public function ExampleContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//map controller
			commandMap.mapEvent(MyMacroCommandEvent.MY_SEQUENCE, SimpleSequenceCommand, MyMacroCommandEvent);
			commandMap.mapEvent(MyMacroCommandEvent.MY_PARALLEL, SimpleParallelCommand, MyMacroCommandEvent);
			commandMap.mapEvent(MyMacroCommandEvent.MY_COMPOSITE, CompositeCommand, MyMacroCommandEvent);
			commandMap.mapEvent(SimpleCommandEvent.COMMAND_A, CommandA, SimpleCommandEvent);
			commandMap.mapEvent(SimpleCommandEvent.COMMAND_B, CommandB, SimpleCommandEvent);
			commandMap.mapEvent(SimpleCommandEvent.COMMAND_C, CommandC, SimpleCommandEvent);
			
			//map view
			mediatorMap.mapView(ExampleView, ExampleMediator);
			
			// And away we go!
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}