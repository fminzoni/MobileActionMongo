package com.kdata.mobile.application
{
	import flash.events.Event;

	public class InitEvent extends Event
	{
		public static const APP_READY : String = "appReady";
		
		/**
		 * @brief Create a new InitEvent
		 * @param type APP_READY
		 */
		public function InitEvent( type : String ) {
			super( type );
		}
		
		/**
		 * @brief Produce an InitEvent confirming that the app can be inited 
		 * @return An InitEvent confirming that the app can be inited 
		 */
		public static function getAppReady( ) : InitEvent {
			return new InitEvent( APP_READY );
		}
	}
}