package org.robotlegs.extentions.mvcs.macro.examples.view
{
	import flash.events.MouseEvent;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.MyMacroCommandEvent;
	import org.robotlegs.extentions.mvcs.macro.examples.commands.events.SimpleCommandEvent;
	import org.robotlegs.mvcs.Mediator;
	
	public class ExampleMediator extends Mediator implements IMediator
	{
		
		[Inject]	public var view:ExampleView;
		
		override public function onRegister():void
		{
			eventMap.mapListener( eventDispatcher, MyMacroCommandEvent.MY_PARALLEL_COMPLETE, onMyParallelComplete );
			eventMap.mapListener( eventDispatcher, MyMacroCommandEvent.MY_SEQUENCE_COMPLETE, onMySequenceComplete );
			eventMap.mapListener( eventDispatcher, MyMacroCommandEvent.MY_COMPOSITE_COMPLETE, onMyCompositeComplete );
			eventMap.mapListener( eventDispatcher, SimpleCommandEvent.COMMAND_A_COMPLETE, onCommandAComplete );
			eventMap.mapListener( eventDispatcher, SimpleCommandEvent.COMMAND_B_COMPLETE, onCommandBComplete );
			eventMap.mapListener( eventDispatcher, SimpleCommandEvent.COMMAND_C_COMPLETE, onCommandCComplete );
			eventMap.mapListener( eventDispatcher, SimpleCommandEvent.COMMAND_C_FAILED, onCommandCFailed );
			
			view.parallelBtn.addEventListener(MouseEvent.CLICK, doParallel);
			view.sequenceBtn.addEventListener(MouseEvent.CLICK, doSequence);
			view.compositeBtn.addEventListener(MouseEvent.CLICK, doComposite);
		}
		
		protected function doParallel(e:MouseEvent):void 
		{
			addOutput(" ---- Start Parallel Command ----");
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_PARALLEL));
		}
		
		protected function doSequence(e:MouseEvent):void 
		{
			addOutput(" ---- Start Sequence Command ----");
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_SEQUENCE));
		}
		
		protected function doComposite(e:MouseEvent):void 
		{
			addOutput(" ---- Start Composite Command ----");
			dispatch(new MyMacroCommandEvent(MyMacroCommandEvent.MY_COMPOSITE));
		}
		
		protected function addOutput(text:String):void 
		{
			view.output.text += text + "\n\n";
		}
		
		protected function onMyParallelComplete(e:MyMacroCommandEvent):void 
		{
			addOutput(" ---- Parallel Command Complete ----");
		}
		
		protected function onMySequenceComplete(e:MyMacroCommandEvent):void 
		{
			addOutput(" ---- Sequence Command Complete ----");
		}

		protected function onMyCompositeComplete(e:MyMacroCommandEvent):void 
		{
			addOutput(" ---- Composite Command Complete ----");
		}
		
		protected function onCommandAComplete(e:SimpleCommandEvent):void 
		{
			addOutput("Command A Complete");
		}
		
		protected function onCommandBComplete(e:SimpleCommandEvent):void 
		{
			addOutput("Command B Complete");
		}
		
		protected function onCommandCComplete(e:SimpleCommandEvent):void 
		{
			addOutput("Command C Complete");
		}
		
		protected function onCommandCFailed(e:SimpleCommandEvent):void 
		{
			addOutput("Command C Failed");
		}
	}
}