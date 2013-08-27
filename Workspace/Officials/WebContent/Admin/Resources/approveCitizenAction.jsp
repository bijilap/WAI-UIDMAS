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
		QueryString = "INSERT INTO DB2ADMIN.NOMINAL_ROLL (UID,PASSWORD,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,ADDRESS) SELECT '"+uid+"','"+pass+"',FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,P_ADDR FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		st.executeUpdate(QueryString);
		QueryString = "INSERT INTO DB2ADMIN.IDENTIFICATION(UID,PHOTO,FP1,FP2,FP3,FP4,FP5,FP6,FP7,FP8,FP9,FP0,PROOF1,PROOF2) SELECT '"+uid+"',PHOTO,FP1,FP2,FP3,FP4,FP5,FP6,FP7,FP8,FP9,FP0,PROOF1,PROOF2 FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		st.executeUpdate(QueryString);
		QueryString = "INSERT INTO DB2ADMIN.CONTACT(UID,ADDRESS,PHONE,EMAIL) SELECT '"+uid+"',R_ADDR,MOB_NO,EMAIL FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		st.executeUpdate(QueryString);
		
		
	     QueryString = "DELETE  FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
		    System.out.println(QueryString);
		  st.executeUpdate(QueryString);
		
		
		QueryString = "SELECT EMAIL,FNAME FROM db2admin.NOMINAL_ROLL,db2admin.CONTACT WHERE NOMINAL_ROLL.UID='"+uid+"' AND NOMINAL_ROLL.UID=CONTACT.UID";
	    System.out.println(QueryString);
	    
	    Statement st2 = con.createStatement();
	    rs = st2.executeQuery(QueryString);
        if(rs.next())
        {	
			sub="WAI ID (Personalised UID)";
			body="Dear "+rs.getString("FNAME")+",\n\tYour WAI ID has been generated. Your WAI ID and Password as are as follows   WAI ID:"+uid+"   Password:"+pass+"         \nRegards,\nGeniobrainiacs";
			to=	rs.getString("EMAIL");
			Mail m1=new Mail();
			m1.GmailSend(to,sub,body);
			System.out.print("Yourmail has been sent.");
        }
	}
	else
	{
		QueryString = "SELECT DOR,REG_NO,MODERATOR_ID,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,R_ADDR,P_ADDR,MOB_NO,EMAIL,PHOTO FROM db2admin.REG_FORM WHERE DOR="+dor+" AND REG_NO="+reg+" AND MODERATOR_ID="+mID;
	    System.out.println(QueryString);
	    rs = st.executeQuery(QueryString);
	    if(rs.next())
	    {
			sub="Rejection of Application For UID";
			body="Dear "+rs.getString("FNAME")+",\n\tYour application for an WAI ID has been rejected due to lack of information. Kindly re-apply with required documents.\nRegards,\nGeniobrainiacs";
			to=	rs.getString("EMAIL");
			Mail m1=new Mail();
			m1.GmailSend(to,sub,body);
			System.out.print("Yourmail has been sent.");
	    }
	}
}
catch (SQLException s){
    System.out.println("Database Connection Failed!");
  }
%>
