package org.robotlegs.extentions.mvcs.macro.examples.commands.events
{
	import flash.events.Event;
	
	public class MyMacroCommandEvent extends Event
	{
		public static const MY_SEQUENCE:String = "mySequence";
		public static const MY_SEQUENCE_COMPLETE:String = "mySequenceComplete";
		public static const MY_PARALLEL:String = "myParallel";
		public static const MY_PARALLEL_COMPLETE:String = "myParallelComplete";
		public static const MY_COMPOSITE:String = "myComposite";
		public static const MY_COMPOSITE_COMPLETE:String = "myCompositeComplete";

		public function MyMacroCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}