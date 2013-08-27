<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd" > 
<%@ page import="java.sql.*,java.io.*,database.*" %> 

<%
   connectToDb Con=new connectToDb();
   System.out.println("Registering new citizen!");
   Connection con=connectToDb.dbconnect();
   PreparedStatement psmt = null;
   FileInputStream fis[]=new FileInputStream[13];
   String saveFile=request.getParameter("file");
   
     try{
       Statement st = con.createStatement();
       String REGNO ="'"+request.getParameter("registrationNumber")+"',";
       System.out.println(REGNO);
       String DOR ="'"+request.getParameter("date")+"',";
       String FNAME ="'"+request.getParameter("firstName")+"',";
       String MNAME="'"+request.getParameter("middleName")+"',";
       if(MNAME.equals(null)) 
           MNAME="NULL,";
       String LNAME="'"+request.getParameter("lastName")+"',";
       if(LNAME.equals(null)) 
           LNAME="NULL,";
       String Guardian ="'"+request.getParameter("fatherName")+"',";
       String Age ="'"+request.getParameter("ifNotKnownAge")+"',";
       if(Age.equals(null)) 
           Age="NULL,";
       String DOB ="'"+request.getParameter("dateOfBirth")+"',";
       if(DOB.equals(null)) 
           DOB="NULL";
       String rAddress ="'"+request.getParameter("houseNoAndName")+", "+request.getParameter("streetNoAndName")+", "+request.getParameter("landmark")+request.getParameter("village")+", "+request.getParameter("district")+", "+request.getParameter("state")+"-"+request.getParameter("pincode")+"',";
       String pAddress ="'"+request.getParameter("phouseNoAndName")+", "+request.getParameter("pstreetNoAndName")+", "+request.getParameter("plandmark")+request.getParameter("pvillage")+", "+request.getParameter("pdistrict")+", "+request.getParameter("pstate")+"-"+request.getParameter("ppincode")+"',";
       String email ="'"+request.getParameter("emailId")+"',";
       String phno ="'"+request.getParameter("phoneNo")+"',";
       String Gender ="'"+request.getParameter("gender")+"',";
       String str=request.getParameter("contact");
       String contact="'',";
       System.out.println(str);
       if(str.equals("cemail"))
          contact ="'E',";
       else if(str.equals("mail"))
           contact ="'M',";
       else if(str.equals("both"))
           contact ="'B',";
       String proof ="'"+request.getParameter("addressProof")+"',";
       String birth ="'"+request.getParameter("birthProof")+"',";
       String mID ="'"+"1001"+"'";
       int i,len;
       String query="INSERT INTO db2admin.REG_FORM(REG_NO,DOR,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,MOB_NO,P_ADDR,R_ADDR,EMAIL,MODERATOR_ID) VALUES("+REGNO+DOR+FNAME+MNAME+LNAME+DOB+Age+Gender+Guardian+contact+phno+pAddress+rAddress+email+mID+")";
       System.out.println(query);
       int val = st.executeUpdate(query);
       out.println("Account created!");
       
       query="UPDATE db2admin.REG_FORM SET FP0=?,FP1=?,FP2=?,FP3=?,FP4=?,FP5=?,FP6=?,FP7=?,FP8=?,FP9=?,PHOTO=?,PROOF1=?,PROOF2=? WHERE REG_NO=? AND DOR=? AND MODERATOR_ID=?";
       char c;
       StringBuffer buf;
       File f[]=new File[13]; //new File(saveFile);
	   saveFile=request.getParameter("fingerprint");
	   psmt=con.prepareStatement(query);
	   for(i=0, c='0';i<10;i++,c++)
		  {
			buf=new StringBuffer(saveFile);
			len=saveFile.length();
	    	buf.setCharAt((len-5),c);
	    	f[i]=new File("F:\\TGMC\\WorkSpace\\Avatar\\WebContent\\Forms\\resource\\"+new String(buf.toString()));
		  	fis[i] = new FileInputStream(f[i]);
		  	psmt.setBinaryStream(i+1, (InputStream)fis[i], (int)(f[i].length()));
		  	System.out.println(buf.toString()+" Parameter ok"+(1+i));
		  }
	   
	   f[i]=new File("F:\\TGMC\\WorkSpace\\Avatar\\WebContent\\Forms\\resource\\"+new String(request.getParameter("photo")));
	   fis[i] = new FileInputStream(f[i]);
	   psmt.setBinaryStream(i+1, (InputStream)fis[i], (int)(f[i].length()));
	   i++;
	   f[i]=new File("F:\\TGMC\\WorkSpace\\Avatar\\WebContent\\Forms\\resource\\"+new String(request.getParameter("birthProof")));
	   fis[i] = new FileInputStream(f[i]);
	   psmt.setBinaryStream(i+1, (InputStream)fis[i], (int)(f[i].length()));
	   i++;
	   f[i]=new File("F:\\TGMC\\WorkSpace\\Avatar\\WebContent\\Forms\\resource\\"+new String(request.getParameter("addressProof")));
	   fis[i] = new FileInputStream(f[i]);
	   psmt.setBinaryStream(i+1, (InputStream)fis[i], (int)(f[i].length()));
	   i++;
	   psmt.setString(14,request.getParameter("registrationNumber"));
	   String dd=request.getParameter("date");
       java.sql.Date dtValue = java.sql.Date.valueOf(dd); 
       psmt.setDate(15,dtValue);
       psmt.setString(16,"1001");
       
       int s = psmt.executeUpdate();
       if(s>0){
			System.out.println("Uploaded successfully !");
		   }
	   else{
			System.out.println("Error!");
		}
     }
     catch (SQLException s){
       System.out.println("Error in adding new citizen!");
       System.out.println(s.toString());
     }
     finally{}
%>
 
