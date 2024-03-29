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

package org.robotlegs.utilities.macro.examples.simpleExample.commands.events
{
	import flash.events.Event;
	
	public class MyMacroCommandEvent extends Event
	{
		public static const MY_SEQUENCE:String = "mySequence";
		public static const MY_SEQUENCE_COMPLETE:String = "mySequenceComplete";
		public static const MY_SEQUENCE_FAILED:String = "mySequenceFailed";
		
		public static const MY_PARALLEL:String = "myParallel";
		public static const MY_PARALLEL_COMPLETE:String = "myParallelComplete";
		public static const MY_PARALLEL_FAILED:String = "myParallelFailed";
		
		public static const MY_COMPOSITE:String = "myComposite";
		public static const MY_COMPOSITE_COMPLETE:String = "myCompositeComplete";
		public static const MY_COMPOSITE_FAILED:String = "myCompositeFailed";
		
		public static const MY_PROGRAMATIC:String = "myProgramatic";
		public static const MY_PROGRAMATIC_COMPLETE:String = "myProgramaticComplete";
		public static const MY_PROGRAMATIC_FAILED:String = "myProgramaticFailed";

		public function MyMacroCommandEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}