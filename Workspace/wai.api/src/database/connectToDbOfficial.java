package database; 
import java.sql.Connection;
import java.sql.DriverManager;


public class connectToDbOfficial
{
	public static Connection dbconnect()
	{
		  Connection con;
		  String url = "jdbc:db2://localhost:50000/";
		  String db = "OFFICIAL";
		  String driver = "com.ibm.db2.jcc.DB2Driver";
		  String user = "db2admin";
		  String pass = "uvce13";
		  try{
			  Class.forName(driver).newInstance();
			  con = DriverManager.getConnection(url+db, user, pass);
			  return con;
		  }
		  catch (Exception e) {
              System.out.println(e.toString());
		  }
		  return null;
	}
	
	public static void close() throws Exception
	{
		con.close();
	}
	public static Connection con =  dbconnect();
}