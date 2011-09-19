package com.kdata.mobile.application
{
	import com.kdata.mobile.infrastructure.MongoQuery;
	import com.kdata.mobile.presentation.Documents;
	import com.kdata.mobile.presentation.MobileActionMongoHome;
	import com.kdata.mobile.presentation.PopUp;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	
	public class MongoHandler
	{
		[Inject] [Bindable] public var model : Documents;		
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
					model.documents=event.result;
					break;
				
				case MongoQueryEvent.MONGO_LOGIN_RESULT:
					FlexGlobals.topLevelApplication.tabbedNavigator.selectedNavigator.pushView(MobileActionMongoHome);
					break;
				
				case MongoQueryEvent.MONGO_LOGIN_FAULT:
					var popup:PopUp = new PopUp();
					popup.show("Error","Login Failed");
					break;
				case MongoQueryEvent.MONGO_DISCONNECT:
					mongoQuery.disconnect();
					break;
				case MongoQueryEvent.MONGO_INSERT:
					mongoQuery.Insert(event.documents)
					break;				
				
				default:
					// should never get here
					trace( "MongoHandler:mongoHandler: unknown event type" );
			}
		}
		
	}
}