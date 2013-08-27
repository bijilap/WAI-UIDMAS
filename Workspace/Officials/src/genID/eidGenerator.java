package genID;
import database.*;
import java.util.Random;
import java.sql.*;
public class eidGenerator
{
	Connection con = connectToDb.con;
	
	public eidGenerator()
	{
		con=connectToDb.con;
	}
	String genID()
	{
		String uid="";
		int digit,i,prevdig,count=0;
		Random generator=new Random();
		digit=generator.nextInt(35);
		uid+=character(digit);
		prevdig=digit;
		count++;
		for(i=1;i<6;i++)
		{
			digit=generator.nextInt(35);
			if(prevdig==digit)
				count++;
			else
				count=0;
			if(count>1)
			{
				i--;
				continue;
			}
			uid+=character(digit);
			prevdig=digit;
		}
		return uid;
	}
	
	
	char character(int n)
	{
		char ch='0';
		if(n<=9)
		{
			ch='0';
			for(int i=0;i<n;i++)
				ch++;
		}
		else
		{
			ch='A';
			for(int i=0;i<n-10;i++)
				ch++;
		}
		return ch;
	}
	
	boolean checkDuplicate(String uid)
	{
		int count;
		String str;
		 try{
		  Statement st = con.createStatement();
		  ResultSet res = st.executeQuery("SELECT COUNT(E_ID) FROM DB2ADMIN.EMPLOYEE WHERE E_ID='"+uid+"'");
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