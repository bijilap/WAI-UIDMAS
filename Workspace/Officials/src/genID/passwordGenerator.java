package genID;
import database.*;
import java.util.Random;
import java.sql.*;
public class passwordGenerator
{
	public String uidPassword()
	{
		String password="";
		int digit,i,prevdig=-1,count=0;
		Random generator=new Random();
		for(i=0;i<5;i++)
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
			password+=digit;
			prevdig=digit;
		}
		return password;
	}
	public String uidPasswordSuffix()
	{
		String psdSuffix="";
		char chars[]={'!','@','#','+','-','*','&'};
		char digit;
		int i;
		Random generator=new Random();
		for(i=0;i<4;i++)
		{
			digit=(char) ('a'+(char)(generator.nextInt(26)));
			psdSuffix+=digit;
		}
		i=generator.nextInt(7);
		psdSuffix+=chars[i];
		return psdSuffix;
	}
	
	
	public String eidPassword()
	{
		char code[]=new char[70],ch;
		int i;
		for(i=0,ch='0';i<10;ch++,i++)
			code[i]=ch;
		for(ch='A';ch<='Z';ch++,i++)
			code[i]=ch;
		code[i++]='!';code[i++]='@';code[i++]='#';code[i++]='$';code[i++]='%';code[i++]='^';code[i++]='&';code[i++]='*';
		for(ch='a';ch<='z';ch++,i++)
			code[i]=ch;
		String password="";
		int digit;
		Random generator=new Random();
		for(i=0;i<5;i++)
		{
			digit=generator.nextInt(69);
			password+=code[digit];
		}
		return password;
	}
	
}