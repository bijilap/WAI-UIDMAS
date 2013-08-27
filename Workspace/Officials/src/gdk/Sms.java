package gdk;

import gdk.Mail;


public class Sms
{
	public void sendSms(String mobno, String msg)
	{
		String subject="WAISMS#GBS#@!Gateway@#gbs2013!@"+mobno+"#gbs2013!@"+msg+"#gbs2013!@";
		String to="waismsgateway@gmail.com";
		String emailText="";
		Mail m=new Mail();
		boolean flag=m.GmailSend(to,subject, emailText);
		if(flag==false)
			System.out.println("Connection to the email service failed. So SMS won't be sent.");
	}
	
}