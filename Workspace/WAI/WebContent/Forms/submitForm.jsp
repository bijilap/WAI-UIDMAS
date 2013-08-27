<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setDateHeader("Expires", 0);
response.setHeader("Pragma","no-cache");
if(session.getAttribute("userid")==null){
	session.setAttribute("messageToShowInLoginPage", "Please sign in to continue");
	response.sendRedirect("logIn.jsp");
}
%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd" > 
<%@ page import="java.sql.*,java.io.*,database.*" %> 
<%@page session="true"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<body >
<div id="logo">
  <h1><a href="#">WAI</a></h1>
		<h2><a href="#">by geniobrainiacs</a></h2>
	</div>
	<div align="middle">
    <h1><strong><font size="+3" face="Times New Roman, Times, serif" color="#4682B4">WAI Registration Form</font></strong></h1>
</div>
<br>
<br>
<div align="middle">
<%
InputStream documents[]=new InputStream[13];
InputStream fingerprint[]=new InputStream[10];
InputStream photo=null;
InputStream proof[]=new InputStream[2];

String registrationNumber=null,date=null,firstName=null,lastName=null,middleName=null,fatherName=null,dateOfBirth=null,ifNotKnownAge=null,gender=null;
String careOf=null,houseNoAndName=null,streetNoAndName=null,landmark=null,state=null,district=null,pincode=null,same=null;
String permanentCareOf=null,phouseNoAndName=null,pstreetNoAndName=null,plandmark=null,pstate=null,pdistrict=null,ppincode=null;
String emailId=null,phoneNo=null,contact1=null;
int i1=0;

boolean isMultipart=ServletFileUpload.isMultipartContent(request);
if(isMultipart){
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = upload.parseRequest(request);
	Iterator iter = items.iterator();
	InputStream stream=null;
	while(iter.hasNext()){		
		FileItem item = (FileItem) iter.next();
		System.out.print(item.getFieldName().toLowerCase());
		if(!item.isFormField()){
			String fieldName=item.getFieldName().toLowerCase();
			if(fieldName.startsWith("fingerprint")){
				System.out.print("Came to fp");
				int pos=Character.getNumericValue(fieldName.charAt(fieldName.length()-1));
				fingerprint[pos]=item.getInputStream();
				
			}else if(fieldName.equalsIgnoreCase("photo")){
				photo=item.getInputStream();
			}else if(fieldName.contains("proof")){
				proof[i1]=item.getInputStream();
				i1++;
			}			
		}else{
			String itemName=item.getFieldName();
			String itemValue=item.getString();
			if(itemName.equalsIgnoreCase("registrationNumber")){
				registrationNumber=itemValue;
			}else if(itemName.equalsIgnoreCase("date")){
				date=itemValue;
			}else if(itemName.equalsIgnoreCase("firstName")){
				firstName=itemValue;
			}else if(itemName.equalsIgnoreCase("lastName")){
				lastName=itemValue;
			}else if(itemName.equalsIgnoreCase("middleName")){
				middleName=itemValue;
			}else if(itemName.equalsIgnoreCase("fatherName")){
				fatherName=itemValue;
			}else if(itemName.equalsIgnoreCase("dateOfBirth")){
				dateOfBirth=itemValue;
			}else if(itemName.equalsIgnoreCase("ifNotKnownAge")){
				ifNotKnownAge=itemValue;
			}else if(itemName.equalsIgnoreCase("gender")){
				gender=itemValue;
			}else if(itemName.equalsIgnoreCase("c/o")){
				careOf=itemValue;
			}else if(itemName.equalsIgnoreCase("houseNoAndName")){
				houseNoAndName=itemValue;			
			}else if(itemName.equalsIgnoreCase("streetNoAndName")){
				streetNoAndName=itemValue;
			}else if(itemName.equalsIgnoreCase("landmark")){
				landmark=itemValue;
			}else if(itemName.equalsIgnoreCase("state")){
				state=itemValue;
			}else if(itemName.equalsIgnoreCase("district")){
				district=itemValue;
			}else if(itemName.equalsIgnoreCase("pincode")){
				pincode=itemValue;
			}else if(itemName.equalsIgnoreCase("same")){
				same=itemValue;
			}else if(itemName.equalsIgnoreCase("pc/o")){
				permanentCareOf=itemValue;
			}else if(itemName.equalsIgnoreCase("phouseNoAndName")){
				phouseNoAndName=itemValue;
			}else if(itemName.equalsIgnoreCase("pstreetNoAndName")){
				pstreetNoAndName=itemValue;
			}else if(itemName.equalsIgnoreCase("plandmark")){
				plandmark=itemValue;
			}else if(itemName.equalsIgnoreCase("pstate")){
				pstate=itemValue;
			}else if(itemName.equalsIgnoreCase("pdistrict")){
				pdistrict=itemValue;
			}else if(itemName.equalsIgnoreCase("ppincode")){
				ppincode=itemValue;
			}else if(itemName.equalsIgnoreCase("emailId")){
				emailId=itemValue;
			}else if(itemName.equalsIgnoreCase("phoneNo")){
				phoneNo=itemValue;
			}else if(itemName.equalsIgnoreCase("contact")){
				contact1=itemValue;
			}
		}
	}
}
	
	
   connectToDb Con=new connectToDb();
   System.out.println("Registering new citizen!");
   Connection con=connectToDb.dbconnect();
   PreparedStatement psmt = null;
//    FileInputStream fis[]=new FileInputStream[13];
//    String saveFile=request.getParameter("file");
   
     try{
       Statement st = con.createStatement();
       String REGNO ="'"+registrationNumber.trim()+"',";
       System.out.println(REGNO);
       String DOR ="'"+date.trim()+"',";
       String FNAME ="'"+firstName.trim()+"',";
       String MNAME="'"+middleName.trim()+"',";
       if(MNAME.equals(null)) 
           MNAME="NULL,";
       String LNAME="'"+lastName.trim()+"',";
       if(LNAME.equals(null)) 
           LNAME="NULL,";
       String Guardian ="'"+fatherName.trim()+"',";
       //String Age ="'"+request.getParameter("ifNotKnownAge").trim()+"',";
       String Age =ifNotKnownAge.trim()+",";
       if(Age.equals(",")) 
           Age="NULL,";
       String DOB ="'"+dateOfBirth.trim()+"',";
       if(DOB.equals(null)) 
           DOB="NULL";
       String rAddress ="'"+houseNoAndName+", "+streetNoAndName+", "+landmark+", "+district+", "+state+"-"+pincode+"',";
       String pAddress ="'"+phouseNoAndName+", "+pstreetNoAndName+", "+plandmark+", "+pdistrict+", "+pstate+"-"+ppincode+"',";
       String email ="'"+emailId.trim()+"',";
       String phno ="'"+phoneNo.trim()+"',";
       String Gender ="'"+gender.trim()+"',";
       String str=contact1.trim();
       String contact="'',";
       System.out.println(str);
       if(str.equals("cemail"))
          contact ="'E',";
       else if(str.equals("mail"))
           contact ="'M',";
       else if(str.equals("both"))
           contact ="'B',";
//        String proof ="'"+request.getParameter("addressProof").trim()+"',";
//        String birth ="'"+request.getParameter("birthProof").trim()+"',";
       String mID ="'"+"1001"+"'";
       int i,len;
       String query="INSERT INTO db2admin.REG_FORM(REG_NO,DOR,FNAME,MNAME,LNAME,DOB,AGE,GENDER,GUARDIAN,C_MODE,MOB_NO,P_ADDR,R_ADDR,EMAIL,MODERATOR_ID) VALUES("+REGNO+DOR+FNAME+MNAME+LNAME+DOB+Age+Gender+Guardian+contact+phno+pAddress+rAddress+email+mID+")";
       System.out.println(query);
       int val = st.executeUpdate(query);
       //out.println("Account created!");
       
       query="UPDATE db2admin.REG_FORM SET FP0=?,FP1=?,FP2=?,FP3=?,FP4=?,FP5=?,FP6=?,FP7=?,FP8=?,FP9=?,PHOTO=?,PROOF1=?,PROOF2=? WHERE REG_NO=? AND DOR=? AND MODERATOR_ID=?";
       char c;
//        StringBuffer buf;
//     File f[]=new File[13]; new File(saveFile);
// 	   saveFile=request.getParameter("fingerprint");
	   psmt=con.prepareStatement(query);
// 	   for(i=0, c='0';i<10;i++,c++)
// 		  {
// 			buf=new StringBuffer(saveFile);
// 			len=saveFile.length();
// 	    	buf.setCharAt((len-5),c);
// 	    	f[i]=new File(request.getRealPath("/")+"Forms\\resource\\"+new String(buf.toString()));
// 		  	fis[i] = new FileInputStream(f[i]);
// 		  	psmt.setBinaryStream(i+1, (InputStream)fis1[i], (int)(f1[i].length()));
// 		  	System.out.println(buf.toString()+" Parameter ok"+(1+i));
// 		  	System.out.println(" Parameter ok"+(1+i));
// 		  }
	   
// 	   System.out.println(request.getRealPath("/")+"Forms\\resource\\"+new String(request.getParameter("photo")));
	   
// 	   f[i]=new File(request.getRealPath("/")+"Forms\\resource\\"+new String(request.getParameter("photo")));
// 	   fis[i] = new FileInputStream(f[i]);
// 	   psmt.setBinaryStream(i+1, (InputStream)fis1[i], (int)(f1[i].length()));
// 	   System.out.println(" Parameter ok"+(1+i));
// 	   i++;
// 	   f[i]=new File(request.getRealPath("/")+"Forms\\resource\\"+new String(request.getParameter("birthProof")));
// 	   fis[i] = new FileInputStream(f[i]);
// 	   psmt.setBinaryStream(i+1, (InputStream)fis1[i], (int)(f1[i].length()));
// 	   System.out.println(" Parameter ok"+(1+i));	   
// 	   i++;
// 	   f[i]=new File(request.getRealPath("/")+"Forms\\resource\\"+new String(request.getParameter("addressProof")));
// 	   fis[i] = new FileInputStream(f[i]);
// 	   psmt.setBinaryStream(i+1, (InputStream)fis1[i], (int)(f1[i].length()));
// 	   System.out.println(" Parameter ok"+(1+i));
// 	   i++;
	for(i=0;i<10;i++){
		psmt.setBinaryStream(i+1, fingerprint[i], fingerprint[i].available());
	}
	psmt.setBinaryStream(i+1, photo,photo.available());
	i++;
	psmt.setBinaryStream(i+1, proof[0],proof[0].available());
	i++;
	psmt.setBinaryStream(i+1, proof[1],proof[1].available());
	i++;
	   psmt.setString(14,registrationNumber);
	   String dd=date.trim();
       java.sql.Date dtValue = java.sql.Date.valueOf(dd); 
       psmt.setDate(15,dtValue);
       psmt.setString(16,"1001");
       System.out.println(query+"\n"+psmt);
       int s = psmt.executeUpdate();
       if(s>0){
			System.out.println("Uploaded successfully !");
			String args=registrationNumber.trim();
			%>
<!-- 			<font size="+1" face="Times New Roman, Times, serif" color="#A3E6BD">Registration Completed Successfully!</font> -->
<!-- 			<p>Your request for an WAI ID is being processed. Your request and details are being scrutinised.</p> -->
			<span class="notification n-success">
				<font size="+1" face="Times New Roman, Times, serif" color="#A3E6BD">Registration Completed Successfully!</font>
				Your request for an WAI ID is being processed. Your request and details are being scrutinised.
				<br>
				<p>Your Registration ID is <%=REGNO%></p>
			</span>
<%-- 			<a href="acknwldg.jsp?reg_no=<%=args%>" target="_blank">Download Acknowledgement</a>  --%>
			<%
		   }
	   else{
			System.out.println("Error!");
			%>
			<font size="+1" face="Times New Roman, Times, serif" color="#F9E497">Registration Unsuccessful!</font>
<!-- 			<p>There was an error in uploading your photo/ proof document/ biometric scan.</p> -->
			<span class="notification n-attention">
				There was an error in uploading your photo/ proof document/ biometric scan.
			</span>
			<%
		}
     }
     catch (SQLException s){
       System.out.println("Error in adding new citizen!");
       System.out.println(s.toString());
       s.printStackTrace();
       %>
<!-- 		<font size="+1" face="Times New Roman, Times, serif" color="#FFC6CA">Registration Unsuccessful!</font> -->
<!-- 		<p>Uploading of details failed. This was caused due to an invalid data entry.</p> -->
		<span class="notification n-attention">
			Uploading of details failed. This was caused due to an invalid data entry.
		</span>
		<%
     }
     finally{}
%>
<br>
<br>
<br>
<br>
</div>
</body>
</html>