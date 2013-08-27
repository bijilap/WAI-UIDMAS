package genID;
import database.*;
import java.util.Random;
import java.sql.*;
public class uidGenerator
{
	Connection con = connectToDb.con;
	
	public uidGenerator()
	{
		con=connectToDb.con;
	}
	String genID()
	{
		String uid="";
		int digit,i,prevdig,count=0;
		Random generator=new Random();
		digit=generator.nextInt(9)+1;
		uid+=digit;
		prevdig=digit;
		count++;
		for(i=1;i<13;i++)
		{
			digit=generator.nextInt(10);
			if(prevdig==digit)
				count++;
			else
				count=0;
			if(count>1)
			{
				i--;
				continue;
			}
			uid+=digit;
			prevdig=digit;
		}
		return uid;
	}
	
	
	boolean checkDuplicate(String uid)
	{
		int count;
		String str;
		 try{
		  Statement st = con.createStatement();
		  ResultSet res = st.executeQuery("SELECT COUNT(UID) FROM DB2ADMIN.NOMINAL_ROLL WHERE UID='"+uid+"'");
		  while(res.next())
		  {
			  str=res.getString("1");
			  count=Integer.parseInt(str);
			  if(count==0)
				  return true;
			  else
				  return false;
		  }
		 }
		 catch (SQLException s){
			  System.out.println("SQL code does not execute.");
			  return false;
			  } 
		 return false;
	}
	
	public String start()
	{
		boolean flag=false;
		String uid="";
		while(flag==false)
		{
			uid=genID();
			flag=checkDuplicate(uid);
		}
		return uid;
	}
	
}