package gdk;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
public class Mail   
{
	public boolean GmailSend (String to,String subject,String messageText)
	{
		  final String username = "geniobrainiacs";
		  final String password = "uvce2013";
		  Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.mail.yahoo.com");
		  props.put("mail.stmp.user", username);
		  //To use TLS
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.starttls.enable", "true");
		  props.put("mail.smtp.password", password);
		  Session session = Session.getDefaultInstance(props, new Authenticator() {
			  @Override
			  protected PasswordAuthentication getPasswordAuthentication() {
				  return new PasswordAuthentication(username, password);
			  }
		  	});
		  String from = "geniobrainiacs@yahoo.com";

		  MimeMessage msg = new MimeMessage(session);
		  try {
			  msg.setContent(messageText,"text/html");
			  msg.setFrom(new InternetAddress(from));
			  msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
			  msg.setSubject(subject);
			  //msg.setText(messageText);
			  Transport transport = session.getTransport("smtp");
			  transport.send(msg);
			  System.out.println("fine!!");
			  return true;
		  }  
		  catch(Exception exc) {
			  System.out.println(exc);
			  return false;
		  }
 }
}