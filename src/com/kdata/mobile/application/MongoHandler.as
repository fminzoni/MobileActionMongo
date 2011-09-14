package com.kdata.mobile.application
{
	import com.kdata.mobile.infrastructure.MongoQuery;

	public class MongoHandler
	{
				
		[Inject] public var mongoQuery : MongoQuery;
		
		/**
		 * @brief Handler for MongoEvents
		 * @param event The MongoEvent to be analyzed
		 */
		[MessageHandler] public function mongoHandler( event : MongoQueryEvent ) : void {
			
			switch( event.type ) {
				
				case MongoQueryEvent.MONGO_LOGIN:
					// login to the database
					mongoQuery.Login();
					break;
				
				case MongoQueryEvent.MONGO_SEND_QUERY:
					// query the database
					mongoQuery.queryDB();
					break;
				
				case MongoQueryEvent.MONGO_REPLY_RECEIVED:
					// set the results
					trace(event.result);
					break;
				
				default:
					// should never get here
					trace( "MongoHandler:mongoHandler: unknown event type" );
			}
		}
		
	}
}