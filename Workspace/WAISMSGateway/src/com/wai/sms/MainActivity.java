package com.wai.sms;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import net.learn2develop.SMS.R;
import android.app.Activity;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;

import android.os.Bundle;
import android.telephony.SmsManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;
/*
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Flags;
*/
import javax.mail.*;
import javax.mail.search.FlagTerm;


public class MainActivity extends Activity {
	
	private static final String TAG = "MyActivity";
	
	IntentFilter intentFilter;	
	
	Thread mythread;
	
	boolean loopFlag=false;
	
	private BroadcastReceiver intentReceiver = new BroadcastReceiver() {
	    @Override
	    public void onReceive(Context context, Intent intent) {
	        //---display the SMS received in the TextView---
	    	TextView SMSes = (TextView) findViewById(R.id.textView1); 
	    	SMSes.setText(intent.getExtras().getString("sms"));
	    }
	};
		
    /** Called when the activity is first created. */
    @SuppressWarnings("deprecation")
	@Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);  
        
        Runnable runnable=new Runnable(){
        public void run()
        {
        	Properties props = System.getProperties();
        	props.setProperty("mail.store.protocol", "imaps");
        	try {
                Session session = Session.getDefaultInstance(props, null);
                Store store = session.getStore("imaps");
                store.connect("imap.gmail.com", "waismsgateway@gmail.com", "uvce2013");
                System.out.println(store);
                while(loopFlag)
                {
                Folder inbox = store.getFolder("Inbox");
                inbox.open(Folder.READ_WRITE);
                //Message messages[] = inbox.getMessages();
                FlagTerm ft = new FlagTerm(new Flags(Flags.Flag.SEEN), false);
                Message messages[] = inbox.search(ft);

                for(Message message:messages) 
                {
                	String subject=message.getSubject();
                	if(subject.contains("WAISMS#GBS#@!Gateway@"))
                	{
                		String tokens[]=subject.split("#gbs2013!@");
               		String mobile=tokens[1];
               		String sms=tokens[2];
                		sendSMS(mobile,sms);
                		message.setFlag(Flags.Flag.DELETED, true);
                	}
                }
                inbox.close(true);
                }

                    } catch (NoSuchProviderException e) {
                        e.printStackTrace();
                        System.exit(1);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        System.exit(2);
                    } 
        	}
        };
        
       loopFlag=true; 
       final Thread mythread=new Thread(runnable);
       mythread.start();
       
        
        //---intent to filter for SMS messages received---
        Log.v(TAG,"Program Started");
        intentFilter = new IntentFilter();
        intentFilter.addAction("SMS_RECEIVED_ACTION");

        //---register the receiver---
        registerReceiver(intentReceiver, intentFilter);

    }
        
    @Override
    protected void onResume() {
    	//---register the receiver---
        //registerReceiver(intentReceiver, intentFilter);
        super.onResume();
    }
    
    @Override
    protected void onPause() {
    	//---unregister the receiver---
        //unregisterReceiver(intentReceiver);
        super.onPause();
    }
        
    @Override
    protected void onDestroy() {
    	//---unregister the receiver---
        unregisterReceiver(intentReceiver);
        super.onPause();
        loopFlag=false;
    }
    
    /*
    //---sends an SMS message to another device---
    private void sendSMS(String phoneNumber, String message)
    {     
        SmsManager sms = SmsManager.getDefault();
        sms.sendTextMessage(phoneNumber, null, message, null, null);
    }
      */    
    
    //---sends an SMS message to another device---
    private void sendSMS(String phoneNumber, String message)
    {        
        String SENT = "SMS_SENT";
        String DELIVERED = "SMS_DELIVERED";
 
        PendingIntent sentPI = PendingIntent.getBroadcast(this, 0,
            new Intent(SENT), 0);
 
        PendingIntent deliveredPI = PendingIntent.getBroadcast(this, 0,
            new Intent(DELIVERED), 0);
 
        //---when the SMS has been sent---
        registerReceiver(new BroadcastReceiver(){
            @Override
            public void onReceive(Context arg0, Intent arg1) {
                switch (getResultCode())
                {
                    case Activity.RESULT_OK:
                        Toast.makeText(getBaseContext(), "SMS sent", 
                                Toast.LENGTH_SHORT).show();
                        break;
                    case SmsManager.RESULT_ERROR_GENERIC_FAILURE:
                        Toast.makeText(getBaseContext(), "Generic failure", 
                                Toast.LENGTH_SHORT).show();
                        break;
                    case SmsManager.RESULT_ERROR_NO_SERVICE:
                        Toast.makeText(getBaseContext(), "No service", 
                                Toast.LENGTH_SHORT).show();
                        break;
                    case SmsManager.RESULT_ERROR_NULL_PDU:
                        Toast.makeText(getBaseContext(), "Null PDU", 
                                Toast.LENGTH_SHORT).show();
                        break;
                    case SmsManager.RESULT_ERROR_RADIO_OFF:
                        Toast.makeText(getBaseContext(), "Radio off", 
                                Toast.LENGTH_SHORT).show();
                        break;
                }
            }
        }, new IntentFilter(SENT));
 
        //---when the SMS has been delivered---
        registerReceiver(new BroadcastReceiver(){
            @Override
            public void onReceive(Context arg0, Intent arg1) {
                switch (getResultCode())
                {
                    case Activity.RESULT_OK:
                        Toast.makeText(getBaseContext(), "SMS delivered", 
                                Toast.LENGTH_SHORT).show();
                        break;
                    case Activity.RESULT_CANCELED:
                        Toast.makeText(getBaseContext(), "SMS not delivered", 
                                Toast.LENGTH_SHORT).show();
                        break;                        
                }
            }
        }, new IntentFilter(DELIVERED));        
 
        SmsManager sms = SmsManager.getDefault();
        sms.sendTextMessage(phoneNumber, null, message, sentPI, deliveredPI);        
    }   
     
}