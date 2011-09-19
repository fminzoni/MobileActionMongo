package com.kdata.mobile.presentation
{
	import com.kdata.mobile.MongoConfig;
	
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;

	public class MAMDAO
	{
		private var _sqlConnection:SQLConnection;
			
		
		public function get sqlConnection():SQLConnection
		{
			if(_sqlConnection)
				return _sqlConnection;
			connectDB(File.applicationStorageDirectory.resolvePath("MAM.db"));
			return _sqlConnection;
		}
		
		public function findAll():ArrayCollection
		{
			var sql:String = "SELECT * FROM server ORDER BY name";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
			var result:Array = stmt.getResult().data;
			var list:ArrayCollection = null;
			
			if(result)
			{
				list = new ArrayCollection();
				for each(var row:Object in result)
				{
					list.addItem(processRow(row));
				}
			}
			
			return list;
		}
		
		public function insertServer(server:MongoConfig):Boolean
		{
			var sql:String = "SELECT * FROM server where name='"+server.name+"'";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
			if(stmt.getResult().data)
				sql = "UPDATE server SET host = ? , port = ? , dbname = ? , username = ? , password = ? WHERE name = ? ";
			else			
				sql = "INSERT INTO server (host,port,dbname,username,password,name) VALUES (?,?,?,?,?,?)";
			
			stmt = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			
			
			stmt.parameters[0] = server.dbHost; 
			stmt.parameters[1] = server.dbPort; 
			stmt.parameters[2] = server.dbName;
			stmt.parameters[3] = server.dbUser;
			stmt.parameters[4] = server.dbPassword;
			stmt.parameters[5] = server.name;
			
			stmt.execute();
			
			return true;
		}
		
		
		
		
		
		
		
		
		
		private function connectDB(file:File):void
		{
			var newDB:Boolean = true;
			if(file.exists)
				newDB = false;
			
			_sqlConnection = new SQLConnection();
			_sqlConnection.open(file);
			if(newDB)
			{
				createDB();
			}
		}
		
		
		private function createDB():void
		{
			var sql:String = "CREATE TABLE IF NOT EXISTS server ( " +
				"name VARCHAR(15)  UNIQUE NOT NULL PRIMARY KEY, " +
				"host VARCHAR(30)  NOT NULL, " +
				"port NUMBER  NOT NULL, " +
				"dbname VARCHAR(15)  NOT NULL, " +
				"username VARCHAR(15)  NOT NULL, " +
				"password VARCHAR(15)  NOT NULL" +
				")";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
		}
		
		
		private function processRow(row:Object):MongoConfig
		{
			var server : MongoConfig = new MongoConfig();
			server.name		= row.name == null ? "" : row.name;
			server.dbHost		= row.host == null ? "" : row.host;
			server.dbPort 		= row.port == null ? 0 : row.port;
			server.dbName 	= row.dbname == null ? "" : row.dbname;
			server.dbPassword 	= row.password == null ? "" : row.password;
			server.dbUser	= row.username == null ? "" : row.username;
			
			return server;
		}
		
	}
}