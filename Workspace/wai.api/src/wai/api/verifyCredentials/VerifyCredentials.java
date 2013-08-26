package wai.api.verifyCredentials;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.db2.jcc.am.mn;

import database.connectToDb;

/**
 * Servlet implementation class VerifyCredentials
 */
public class VerifyCredentials extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con;
	private static connectToDb cToDb;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VerifyCredentials() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config) throws ServletException {
		try {
			cToDb = new connectToDb();
			con = cToDb.dbconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    /**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		if (con != null) {
			try {
				con.close();
			} catch (SQLException s) {
				// do nothing
				s.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter output = response.getWriter();
		try {
			String fname = request.getParameter("fname");
			String mname = request.getParameter("mname");
			String lname = request.getParameter("lname");
			String gender = request.getParameter("gender");
			String dob = request.getParameter("dob");
			String email = request.getParameter("email");
			
			int numberOfNotNullParams=0,fnameNotNull=0,mnameNotNull=0,lnameNotNull=0,genderNotNull=0,dobNotNull=0,emailNotNull=0;					
			
			String query="SELECT NR.FNAME FROM DB2ADMIN.NOMINAL_ROLL AS NR , DB2ADMIN.CONTACT AS CT WHERE NR.UID=CT.UID AND ";
			if(fname!=null){
				query=query+"LOWER(NR.FNAME)=LOWER(?) ";
				numberOfNotNullParams++;
				fnameNotNull=numberOfNotNullParams;
			}
			if(mname!=null){
				if(numberOfNotNullParams==0)
					query=query+"LOWER(NR.MNAME)=LOWER(?) ";
				else
					query=query+"AND LOWER(NR.MNAME)=LOWER(?) ";
				numberOfNotNullParams++;
				mnameNotNull=numberOfNotNullParams;
			}
			if(lname!=null){
				if(numberOfNotNullParams==0)
					query=query+"LOWER(NR.LNAME)=LOWER(?) ";
				else
					query=query+"AND LOWER(NR.LNAME)=LOWER(?) ";
				numberOfNotNullParams++;
				lnameNotNull=numberOfNotNullParams;
			}
			if(gender!=null){
				if(numberOfNotNullParams==0)
					query=query+"LOWER(NR.GENDER)=LOWER(?) ";
				else
					query=query+"AND LOWER(NR.GENDER)=LOWER(?) ";
				numberOfNotNullParams++;
				genderNotNull=numberOfNotNullParams;
			}
			if(dob!=null){
				if(numberOfNotNullParams==0)
					query=query+"LOWER(NR.DOB)=LOWER(?) ";
				else
					query=query+"AND LOWER(NR.DOB)=LOWER(?) ";
				numberOfNotNullParams++;
				dobNotNull=numberOfNotNullParams;
			}
			if(email!=null){
				if(numberOfNotNullParams==0)
					query=query+"LOWER(CT.EMAIL)=LOWER(?) ";
				else
					query=query+"AND LOWER(CT.EMAIL)=LOWER(?) ";
				numberOfNotNullParams++;
				emailNotNull=numberOfNotNullParams;
			}
			if(numberOfNotNullParams!=0){
				
				PreparedStatement ps = con.prepareStatement(query);
				if(fname!=null)
					ps.setString(fnameNotNull, fname);
				if(mname!=null)
					ps.setString(mnameNotNull, mname);
				if(lname!=null)
					ps.setString(lnameNotNull, lname);
				if(gender!=null)
					ps.setString(genderNotNull, gender);
				if(dob!=null)
					ps.setString(dobNotNull, dob);
				if(email!=null)
					ps.setString(emailNotNull, email);
				//System.out.println(query);
				//System.out.println(ps.toString());
				ResultSet rs = ps.executeQuery();
				if(rs.next()){
					output.write("YES");
				}else{
					output.write("NO");
				}
			}else{
				output.write("Please pass a parameter to verify");
			}
		} catch (SQLException e) {
			output.write("Server Error");
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		// TODO Auto-generated method stub
	}

}
