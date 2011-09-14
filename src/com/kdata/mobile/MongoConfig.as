package com.kdata.mobile
{
	[Bindable]
	public class MongoConfig
	{
		public var dbHost : String = "127.0.0.1";
		public var dbPort : uint = 27017;
		public var dbName : String = "dbname";
		public var dbUser : String = "username";
		public var dbPassword : String = "password";
		public var dbCollection : String = "default_collection";
	}
}