package com.kdata.mobile.application
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;

	public class MongoQueryEvent extends Event
	{	
		public static const MONGO_LOGIN : String = "mongoLogin";
		public static const MONGO_SEND_QUERY : String = "mongoSendQuery";
		public static const MONGO_REPLY_RECEIVED : String = "mongoReplyReceived";
		
		public var result : ArrayCollection;
		
		/**
		 * @brief Create a new MongoQueryEvent
		 * @param type MONGO_SEND_QUERY or MONGO_REPLY_RECEIVED
		 */
		public function MongoQueryEvent( type : String, result : ArrayCollection )
		{
			super( type );
			this.result = result;
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoDB() : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_LOGIN, null );
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoSendQuery() : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_SEND_QUERY, null );
		}
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoReplyReceived( result : ArrayCollection ) : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_REPLY_RECEIVED, result );
		}
	}
}