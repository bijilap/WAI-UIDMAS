<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="java.sql.*,database.*" %> 
<%@ page import="genID.*" %>
<%@ page import="java.security.MessageDigest" %> 
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>New Employee action</title>
	</head>
	<body>
				<%

				   connectToDb Con=new connectToDb();
                   Connection con=connectToDb.dbconnect();
                 %>  
            <%
            String query="";
            
            String fname =request.getParameter("fname");
            String lname =request.getParameter("lname");
            eidGenerator eg=new eidGenerator();
            String eid =eg.start();
            String desgn =request.getParameter("designation");
            String pass =request.getParameter("password");
            String user =request.getParameter("username");
            String branch =request.getParameter("city");
            String acc="B";
            String type="N";
            String dob=request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("day");
            String address=request.getParameter("address");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            checksumGenerator cg=new checksumGenerator();
            String checksum=cg.genCheckSum();
            String hashin=pass+checksum;
            String hashpass=hashin;
            
            try
            {
            	
            	MessageDigest md = MessageDigest.getInstance("SHA-256");
        		md.update(hashin.getBytes());

        		byte byteData[] = md.digest();

        		StringBuffer sb = new StringBuffer();
        		for (int i = 0; i < byteData.length; i++) 
        		{
         			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        		}

        		hashpass=sb.toString();
            	
            }
            catch(Exception e)
            {
            	e.printStackTrace();
            }
            

            try{
            	PreparedStatement st;
                query="INSERT INTO db2admin.EMPLOYEE(E_ID,DESIGNATION,BRANCH,ACC_STATUS,TYPE,FNAME,LNAME,DOB,EMAIL,PHONE,ADDRESS) VALUES(?,?,?,?,?,?,?,?,?,?,?)"; 
                System.out.println(query);
                st=con.prepareStatement(query);
                st.setString(1, eid);
                st.setString(2, desgn);
                st.setString(3, branch);
                st.setString(4, acc);
                st.setString(5, type);
                st.setString(6, fname);
                st.setString(7, lname);
                st.setString(8, dob);
                st.setString(9, email);
                st.setString(10, phone);
                st.setString(11, address);
                int val = st.executeUpdate();
                System.out.println(query);
                query="INSERT INTO db2admin.OFFICIALS(USERID,E_ID,PASSWORD,TYPE,CHECKSUM) VALUES(?,?,?,?,?)";
                System.out.println(query);
                st=con.prepareStatement(query);
                st.setString(1, user);
                st.setString(2, eid);
                st.setString(3, hashpass);
                st.setString(4, type);
                st.setString(5, checksum);
                val = st.executeUpdate();
                System.out.println(query);
                %>
                
                <span class="notification n-success">Your response has been recorded.</span>
               
              <%
              }
              catch (SQLException s){%>
              <span class="notification n-attention">A connection to the database failed.</span>
              <%
                System.out.println("Database Connection Failed!");
              	s.printStackTrace();
              }

         %>
	</body>
</html>