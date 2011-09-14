package com.kdata.mobile.infrastructure
{
	import com.kdata.mobile.MongoConfig;
	import com.kdata.mobile.application.MongoQueryEvent;
	
	import mx.collections.ArrayCollection;
	
	import org.db.mongo.Cursor;
	import org.db.mongo.DB;
	import org.db.mongo.Document;
	import org.db.mongo.Mongo;
	import org.db.mongo.auth.Authentication;
	import org.db.mongo.auth.Credentials;
	import org.db.mongo.mwp.OpReply;
	
	public class MongoQuery
	{
		
		[MessageDispatcher] public var dispatchMessage : Function;
		
		[Inject] public var mongoConfig : MongoConfig;
		
		public var db : DB;
		public var cursor : Cursor;
		
		/**
		 * @brief connect to the database
		 */
		public function Login() : void {
			var mongo : Mongo = new Mongo( mongoConfig.dbHost, mongoConfig.dbPort );
			db = mongo.getDB( mongoConfig.dbName );
			db.connect();
			var credentials:Credentials = new Credentials(mongoConfig.dbUser,mongoConfig.dbPassword);			
			var auth:Authentication = new Authentication(db,credentials);
		}
		
		/**
		 * @brief Set up a database query
		 */
		public function queryDB() : void {
			cursor = db.getCollection( mongoConfig.dbCollection ).find( new Document(), null, readAll );
		}
		
		// called when all results from the database are loaded
		public function readAll() : void {
			var documents : ArrayCollection = new ArrayCollection();
			for each( var reply : OpReply in cursor.replies ) {
				documents.addAll( new ArrayCollection( reply.documents ) );
			}
			dispatchMessage( MongoQueryEvent.getMongoReplyReceived( documents ) );
		}
	}
}