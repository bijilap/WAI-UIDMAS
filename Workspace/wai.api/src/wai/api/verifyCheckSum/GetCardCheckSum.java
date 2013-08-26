package wai.api.verifyCheckSum;

import database.*;

import java.security.MessageDigest;
import java.sql.*;

public class GetCardCheckSum
{
	public String calCheckSum(String uid)
	{
		String CardCheckSum="";
		String CheckSumString="";
		Connection con=connectToDb.dbconnect();
		String query="SELECT FNAME,MNAME,LNAME,UID,DOB,CHECKSUM FROM db2admin.NOMINAL_ROLL WHERE UID=?";
		try {
			ResultSet rs;
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				String fname=rs.getString("FNAME");
				String mname=rs.getString("MNAME");
				String lname=rs.getString("LNAME");
				String dob=rs.getString("DOB");
				String checksum=rs.getString("CHECKSUM");
				CheckSumString="I am "+fname+mname+lname+". I was born on "+dob+". To confirm my identity, this is my checksum "+checksum;
				
	      		MessageDigest md = MessageDigest.getInstance("MD5");
	  			md.update(CheckSumString.getBytes());

	  			byte byteData[] = md.digest();

	  			StringBuffer sb = new StringBuffer();
	  			for (int i = 0; i < byteData.length; i++) 
	  			{
	   				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	  			}
	  			CardCheckSum=sb.toString();
	  			System.out.println(CardCheckSum);
	  			pst.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return CardCheckSum;
	}	
	public String calCheckSumfromInfo(String uid,String fname,String mname, String lname, String dob)
	{
		String CardCheckSum="";
		String CheckSumString="";
		Connection con=connectToDb.dbconnect();
		String query="SELECT CHECKSUM FROM db2admin.NOMINAL_ROLL WHERE UID=?";
		try {
			ResultSet rs;
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, uid);
			rs=pst.executeQuery();
			if(rs.next())
			{
				String checksum=rs.getString("CHECKSUM");
				CheckSumString="I am "+fname+mname+lname+". I was born on "+dob+". To confirm my identity, this is my checksum "+checksum;
				
	      		MessageDigest md = MessageDigest.getInstance("MD5");
	  			md.update(CheckSumString.getBytes());

	  			byte byteData[] = md.digest();

	  			StringBuffer sb = new StringBuffer();
	  			for (int i = 0; i < byteData.length; i++) 
	  			{
	   				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	  			}
	  			CardCheckSum=sb.toString();
	  			System.out.println(CardCheckSum);
	  			pst.close();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return CardCheckSum;
	}	
}