package genID;
import java.security.MessageDigest;
import java.util.Random;
public class checksumGenerator
{
	
	public String genCheckSum() throws Exception
	{
		String uid="";
		int digit,i;
		Random generator=new Random();
		digit=generator.nextInt(9)+1;
		uid+=digit;
		for(i=1;i<13;i++)
		{
			digit=generator.nextInt(10);
			uid+=digit;
		}
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(uid.getBytes());

		byte byteData[] = md.digest();

		StringBuffer sb = new StringBuffer();
		for (i = 0; i < byteData.length; i++) 
		{
 			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		String checksum=sb.toString();
		return checksum;
	}
	
}