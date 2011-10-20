package com.kdata.mobile.application
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.http.HTTPService;

	public class MongoQueryEvent extends Event
	{	
		public static const MONGO_LOGIN : String = "mongoLogin";
		public static const MONGO_SEND_QUERY : String = "mongoSendQuery";
		public static const MONGO_REPLY_RECEIVED : String = "mongoReplyReceived";
		public static const MONGO_LOGIN_RESULT : String = "mongoLoginResult";
		public static const MONGO_LOGIN_FAULT : String = "mongoLoginFault";
		public static const MONGO_DISCONNECT : String = "mongoDisconnect";
		public static const MONGO_INSERT : String = "mongoInsert";
		public static const MONGO_DELETE : String = "mongoDelete";
		public static const MONGO_UDATE : String = "mongoUpdate";
		
		public var result : ArrayCollection;
		public var documents : Array;
		
		/**
		 * @brief Create a new MongoQueryEvent
		 * @param type MONGO_SEND_QUERY or MONGO_REPLY_RECEIVED
		 */
		public function MongoQueryEvent( type : String, result : ArrayCollection,documents:Array = null )
		{
			super( type );
			this.result = result;
			this.documents = documents;
			
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
			return new MongoQueryEvent(MONGO_SEND_QUERY, null );
		}
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoReplyReceived( result : ArrayCollection ) : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_REPLY_RECEIVED, result );
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoLoginResult() : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_LOGIN_RESULT, null );
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoLoginFault() : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_LOGIN_FAULT, null );
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoDisconnect() : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_DISCONNECT, null );
		}
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoInsert(document:Array) : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_INSERT, null,document );
		}
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoDelete(document:Array) : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_DELETE, null,document );
		}
		
		
		/**
		 * @brief Produce a MongoQueryEvent
		 * @return A MongoQueryEvent
		 */
		public static function getMongoUpdate(document:Array) : MongoQueryEvent {
			return new MongoQueryEvent( MONGO_UDATE, null,document );
		}
	}
}