<%@ page import="java.sql.*" %> 
<%@ page import="database.*" %> 
<%@ page import="gdk.*" %> 
<%@ page import="genID.*" %> 
<%
Connection con = null;
connectToDb Con=new connectToDb();   
con = connectToDb.dbconnect();
String to,sub,body;
String dor ="'"+request.getParameter("dor")+"'";
String reg ="'"+request.getParameter("reg")+"'";
String mID ="'"+request.getParameter("mID")+"'";
String approve=request.getParameter("approve");
String QueryString;
ResultSet rs;
Statement st = con.createStatement();
try
{
	if(approve.equals("yes"))
	{
		uidGenerator gen=new uidGenerator();
		String uid=gen.start();
		passwordGenerator pg=new passwordGenerator();
		String pass=pg.uidPassword();
		String psdSuf=pg.uidPasswordSuffix();
		QueryString = "INSERT INTO DB2ADMIN.NOMINAL_ROLL (UID,PASSWORD,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,ADDRESS) SELECT '"+uid+"','"+pass+psdSuf+"',FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,P_ADDR FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		int s=st.executeUpdate(QueryString);
		System.out.println(s);
		QueryString = "INSERT INTO DB2ADMIN.IDENTIFICATION(UID,PHOTO,FP1,FP2,FP3,FP4,FP5,FP6,FP7,FP8,FP9,FP0,PROOF1,PROOF2) SELECT '"+uid+"',PHOTO,FP1,FP2,FP3,FP4,FP5,FP6,FP7,FP8,FP9,FP0,PROOF1,PROOF2 FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		s=st.executeUpdate(QueryString);
		System.out.println(s);
		QueryString = "INSERT INTO DB2ADMIN.CONTACT(UID,ADDRESS,PHONE,EMAIL) SELECT '"+uid+"',R_ADDR,MOB_NO,EMAIL FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		st.executeUpdate(QueryString);
		System.out.println(s);
		
	     QueryString = "DELETE  FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		 System.out.println(QueryString);
		 s=st.executeUpdate(QueryString);
		 System.out.println(s);
		
		
		QueryString = "SELECT EMAIL,FNAME,PHONE FROM db2admin.NOMINAL_ROLL,db2admin.CONTACT WHERE NOMINAL_ROLL.UID='"+uid+"' AND NOMINAL_ROLL.UID=CONTACT.UID";
	    System.out.println(QueryString);
	    
	    Statement st2 = con.createStatement();
	    rs = st2.executeQuery(QueryString);
        if(rs.next())
        {	
			sub="WAI ID (Personalised UID)";
			String fname=rs.getString("FNAME");
			body="<html><body><h1>WAI</h1>Dear <b>"+fname+"</b>,<br>\tYour WAI ID has been generated. Your WAI ID and Password as are as follows<br><br>   WAI ID:<b>"+uid+"</b><br>   Password:<b>"+pass+"</b> <br><br>Use the given UID and Password and Password suffix to log into your WAI Account. Your Password suffix has been sent to your phone. ENter the UID in the UID field and the password appended with the password suffix to the Password field.         <br><br><br>Regards,<br>Geniobrainiacs</body></html>";
			to=	rs.getString("EMAIL");
			String mobno=rs.getString("PHONE");
			Mail m1=new Mail();
			m1.GmailSend(to,sub,body);
			System.out.print("Your mail has been sent.");
			
			Sms s1=new Sms();
			String sbody="#WAI UIDMS#......Dear "+fname+":-Your password suffix is "+psdSuf+". Append it to the password.";
			s1.sendSms(mobno, sbody);
        }
        %>
        <br/><font color="#0033FF" size="+2">User has been approved.</font><br/><br />
        <%
	}
	else
	{
		QueryString = "SELECT DOR,REG_NO,MODERATOR_ID,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,R_ADDR,P_ADDR,MOB_NO,EMAIL,PHOTO FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
	    System.out.println(QueryString);
	    rs = st.executeQuery(QueryString);
	    if(rs.next())
	    {
			sub="Rejection of Application For UID";
			body="<html><body><h1>WAI</h1>Dear <b>"+rs.getString("FNAME")+"</b>,\n\tYour application for an WAI ID has been rejected due to lack of information.<br> Kindly re-apply with required documents.<br>Regards,<br>Geniobrainiacs</body></html>";
			to=	rs.getString("EMAIL");
			Mail m1=new Mail();
			m1.GmailSend(to,sub,body);
			System.out.print("Your mail has been sent.");
	    }
	    QueryString = "DELETE  FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		System.out.println(QueryString);
		int s=st.executeUpdate(QueryString);
		System.out.println(s);
	    %>
	    <br/><font color="#B40431" size="+2">User application has been rejected.</font><br/><br />
	    <%
	}
}
catch (SQLException s){
    System.out.println("Database Connection Failed!");
  }
%>
