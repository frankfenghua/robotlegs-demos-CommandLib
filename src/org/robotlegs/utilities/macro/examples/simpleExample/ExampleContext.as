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

package org.robotlegs.utilities.macro.examples.simpleExample
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.CommandA;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.CommandB;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.CommandC;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.CompositeCommand;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.ProgramaticCommand;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.SimpleParallelCommand;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.SimpleSequenceCommand;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.MyMacroCommandEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.commands.events.SimpleCommandEvent;
	import org.robotlegs.utilities.macro.examples.simpleExample.view.ExampleMediator;
	import org.robotlegs.utilities.macro.examples.simpleExample.view.ExampleView;
	
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
			commandMap.mapEvent(MyMacroCommandEvent.MY_PROGRAMATIC, ProgramaticCommand, MyMacroCommandEvent);
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