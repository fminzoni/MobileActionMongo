package com.kdata.mobile.domain
{
	import com.kdata.mobile.application.MongoQueryEvent;

	public class AppInit
	{
		
		[MessageDispatcher] public var dispatchMessage : Function;
		
		/**
		 * @brief Init the entire app environment
		 */
		public function initEnvironment() : void {
			// connect to MongoDB
			dispatchMessage( MongoQueryEvent.getMongoDB() );
		}
	}
}